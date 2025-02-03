--[[
功能：疯狂的锄头系统类（服务器）
作者：魏云
时间：2013-8-22
--]]

_G.CFrenzyHoeSystem = {}

function CFrenzyHoeSystem:new()
	local obj = CSystem:new("CFrenzyHoeSystem");
	obj.objDBQuery = nil;--数据库查询对象
	obj.dataAwardList = {
		dwRoleId = 0,
		dwFrendNum = 0,
		dwAwardItemId = 0,
		dwAwardItemNum = 0,
		dwHoeItemId = 0,
		dwIsGet = -1,
	};   -----未领取奖励表
	for i,v in pairs(CFrenzyHoeSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CFrenzyHoeSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if(not objDB ) then
		_info("objDB is null by CFrenzyHoeSystem:Create")
		return false;
	end
	-- 创建数据库对象
	self.objDBQuery = CFrenzyHoeSystemDBOper:new(objDB,self);
	---从数据库中读取数据
	local Data = objPlayer:GetLineData("CFrenzyHoeSystem") or {};
	if(#Data == 0) then
		return false;
	end
	CFrenzyHoeSystemManager:UpdateData(Data)  ----更新挖宝事件表
	if(Data[1][2].dwAwardItemId ~= nil) then
		self.dataAwardList = Data[1][2]  ----玩家挖宝奖励表
	end
	return true
end

function CFrenzyHoeSystem:OnChangeLineBegin(dwNewLineID)
	self:DealBreakPro();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--将数据提交到换线中心
	CFrenzyHoeSystemManager.dataList[2] = self.dataAwardList
	objPlayer:SetLineData("CFrenzyHoeSystem", CFrenzyHoeSystemManager.dataList);
end

function CFrenzyHoeSystem:Update(dwInterval)
	return true;
end;
---每天0点清友好度
function CFrenzyHoeSystem:ZeroClearFriendNum()
	if(self.dataAwardList.dwFrendNum > 0) then
		self.dataAwardList.dwFrendNum = 0;
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			return;
		end;
		objPlayer.FrenzyHoe_ZeroClearFriendNumMsg{}---  零点清好友度
	end
end

function CFrenzyHoeSystem:Destroy()
end;


---死亡打断处理
function CFrenzyHoeSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--处理打断
function CFrenzyHoeSystem:DealBreakPro()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.FrenzyHoe_OnDeadBreakComposeMsg{};
end;

function CFrenzyHoeSystem:OnEnterScene()
	self:SynchronizeToClient();
end
---玩家上线同步 挖宝事件及上次未领取获得的物品和挖宝传闻
function CFrenzyHoeSystem:SynchronizeToClient()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	---同步
	if(self.dataAwardList.dwIsGet == 0 and self.dataAwardList.dwAwardItemId > 0 and self.dataAwardList.dwAwardItemNum > 0) then ---未领取奖励
		objPlayer.FrenzyHoe_SynchronizeDigAwardMsg{AwardItemId = self.dataAwardList.dwAwardItemId,AwardItemNum = self.dataAwardList.dwAwardItemNum}  
	end
	---向ks获取挖宝信息
	CKernelApp.FrenzyHoe_GSGetFrenzyHoeItemInfoMsg{RoleID = objPlayer:GetRoleID()}  ----ks
	objPlayer.FrenzyHoe_SynchronizeHoeFrendNumMsg{FrendNum = self.dataAwardList.dwFrendNum }
	objPlayer.OnSynFrenzyHoeDataMsg{Infos = self:GetFinalExChangeItemConfig()};
end
---ks 返回 挖宝信息
function CFrenzyHoeSystem:GetFrenzyHoeItemInfo(digEventInfo,broadCastInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if(#digEventInfo > 0) then
		objPlayer.FrenzyHoe_SynchronizeEventInfoMsg{ParamInfo = digEventInfo}
		CFrenzyHoeSystemManager.dataList[1] = digEventInfo
	end
	if(#broadCastInfo > 0) then
		local digeventInfo = broadCastInfo
		local broadCastList = {}
		for i = 1,#digeventInfo do
			broadCastList[i] = {}
			broadCastList[i].dwRoleID = digeventInfo[i].dwRoleId
			broadCastList[i].dwRoleName =digeventInfo[i].szRoleName
			broadCastList[i].dwAwardItemId = digeventInfo[i].dwAwardItemId
			broadCastList[i].dwHoeItemId = digeventInfo[i].dwHoeItemId 
			broadCastList[i].dwHour = digeventInfo[i].dwHour
			broadCastList[i].dwMinute= digeventInfo[i].dwMinute
			broadCastList[i].dwSec = digeventInfo[i].dwSec
		end
		CFrenzyHoeSystemManager.dataList[3] = broadCastInfo
		objPlayer.FrenzyHoe_SynchronizeBroadCastInfoMsg{ParamInfo = broadCastList,IsOnLine = true}
	end
end
---开始挖宝
function CFrenzyHoeSystem:StartDigTreasure(HoeItemId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if(not self:CheckItemIsHoe(HoeItemId)) then
		return false;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:StartDigTreasure sysScript is error",sysScript)
		return false;
	end
	if(self.dataAwardList.dwIsGet == 0) then ----未领取奖励不能进行下一轮的挖宝
		return false;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false;
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(HoeItemId)
	if(packNum < _G.ItemFrenzyHoeTreasureConfig[HoeItemId].itemnum) then  ----背包中的消耗物品数量不够
		sysScript:Notice(13001210001)
		objPlayer.FrenzyHoe_DigTreasureFailMsg{}
		return false;
	end
	--删除挖宝消耗的锄头
	local isSucc = objItemSystem:DelEnumItemInPacket(HoeItemId,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].itemnum,false, _G.ItemSysOperType.Used) 
	if not isSucc then
		return false;
	end
	
	local randerlist = {}
	if(_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum > #_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList) then
		_info("_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum is error",HoeItemId,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum)
		return false;
	end
	-----保存发送客户端数据
	randerlist.dwHoeItemId = HoeItemId;
	randerlist.AwardList = {}
	randerlist.AwardItemNumList = {}
	local awardindex = 0
	awardindex ,randerlist.AwardList,randerlist.AwardItemNumList = self:RanderCanNotRepeat(HoeItemId)
	randerlist.dwFrendNum = self:AddFrendNum(self:GetHoeFrendNum(HoeItemId));--self.dataAwardList.dwFrendNum + self:GetHoeFrendNum(HoeItemId)
	randerlist.dwAwardindex = awardindex
	randerlist.dwAwardItemNum =  randerlist.AwardItemNumList[awardindex]
	local awardItemId = randerlist.AwardList[awardindex];  -----奖励物品id
	-----更新内存数据变量，用于换线
	self.dataAwardList.dwHoeItemId = HoeItemId;
	self.dataAwardList.dwFrendNum = self:AddFrendNum(self:GetHoeFrendNum(HoeItemId));--self.dataAwardList.dwFrendNum + self:GetHoeFrendNum(HoeItemId)
	self.dataAwardList.dwAwardItemNum = randerlist.AwardItemNumList[awardindex]
	self.dataAwardList.dwAwardItemId = awardItemId
	self.dataAwardList.dwIsGet = 0
	self.dataAwardList.dwRoleId = objPlayer:GetRoleID()
	
	----向客户端发送消息
	objPlayer.FrenzyHoe_DigTreasureAwardListMsg{ParamList = randerlist};
	---玩家奖励列表存入数据库
	self.objDBQuery:UpdateFrenzyHoeRoleInfo();
	---检查数据库里是否有该奖励物品 
	if(self:CheckIsHoeEventItem(awardItemId)) then
		CKernelApp.FrenzyHoe_GSCheckAwardItemIdIsInSqlMsg{RoleID = objPlayer:GetRoleID(),Param = awardItemId}  
	end
end
-----玩家事件存入数据库 及更新内存数据用于换线
function CFrenzyHoeSystem:UpdateFrenzyHoeItemInfo(dwHas)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(dwHas) then 
		self.objDBQuery:UpdateFrenzyHoeItemInfo(self.dataAwardList.dwAwardItemId);
	else
	    self.objDBQuery:InsertFrenzyHoeItemInfo(self.dataAwardList.dwAwardItemId);
	end
end

---获取挖宝奖励
function CFrenzyHoeSystem:GetFrenzyHoeReward()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:GetFrenzyHoeReward sysScript is error",sysScript)
		return false;
	end
	if(self.dataAwardList.dwIsGet == 0) then ----未领取奖励
		local objItemSystem = objPlayer:GetSystem("CItemSystem");
		if( not objItemSystem ) then
			return false;
		end
		local num = 0
		local maxrepeat = objItemSystem:GetMaxRepeat(self.dataAwardList.dwAwardItemId)
		if(self.dataAwardList.dwAwardItemNum > maxrepeat) then
			num = math.floor(self.dataAwardList.dwAwardItemNum/maxrepeat)
		else
		    num = 1
		end
		if( not objItemSystem:IsPacketSlotEnoughFor(num) ) then
			sysScript:Notice(13001210002)
			objPlayer.FrenzyHoe_DigTreasureFailMsg{}
			return false;
		end
		local tabAddPackList = {};
		table.insert(tabAddPackList,{dwItemEnum=self.dataAwardList.dwAwardItemId,dwItemNumber=self.dataAwardList.dwAwardItemNum,dwBindType = 1})
		objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.Used);
		self.dataAwardList.dwIsGet = 1
		---保存玩家获奖信息到数据库
		self.objDBQuery:UpdateFrenzyHoeRoleInfo()
		---获奖成功消息发送给客户端
		objPlayer.FrenzyHoe_GetTreasureAwardSuccMsg{}
		
		
		if(self:CheckIsHoeEventItem(self.dataAwardList.dwAwardItemId)) then
			-------存储挖宝传闻信息
			local tmCur = GetCurTime();
			local year,month,day,n_hour,n_minute,n_sec = CTimeFormat:todate(tmCur/1000, true);
			n_sec = math.floor(n_sec);
			local eventInfo = {}
			eventInfo.dwTime = tmCur
			eventInfo.dwRoleId = objPlayer:GetRoleID();
			eventInfo.dwAwardItemId = self.dataAwardList.dwAwardItemId;
			eventInfo.szRoleName = objPlayer:GetName();
			eventInfo.dwHoeItemId = self.dataAwardList.dwHoeItemId;
			eventInfo.dwHour = n_hour
			eventInfo.dwMinute= n_minute
			eventInfo.dwSec = n_sec
			CKernelApp.FrenzyHoe_GSUpdateFrenzyHoeItemInfoMsg{ParamInfo = eventInfo}  ----ks
		end
	end
end
----最后一个锄头获取的物品 当未领取后点关闭时发邮件
function CFrenzyHoeSystem:SendFrenzyHoeAwardToMail()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:GetFrenzyHoeReward sysScript is error",sysScript)
		return false;
	end
	if(self.dataAwardList.dwIsGet == 0) then ----未领取奖励
		local mailSys = objPlayer:GetSystem("CMailSystem");
		if(not mailSys) then
			return;
		end
		local awardInfo = {AwardItemID=self.dataAwardList.dwAwardItemId,AwardItemNum = self.dataAwardList.dwAwardItemNum,AwardItemBindType = 1}
		local mailMsg = _G.FrenzyHoe_GetSetMaiInfo(awardInfo);
		if(not mailMsg) then
			return;
		end
		mailSys:SendSetMail( mailMsg, objPlayer:GetRoleID(), objPlayer:GetName() ) ---发送一个设置的邮件
		local objScript = objPlayer:GetSystem('CScriptSystem');
		objScript:Notice(13001210007);
		self.dataAwardList.dwIsGet = 1
		---保存玩家获奖信息到数据库
		self.objDBQuery:UpdateFrenzyHoeRoleInfo()
		---获奖成功消息发送给客户端
		objPlayer.FrenzyHoe_GetTreasureAwardSuccMsg{}
		
		
		if(self:CheckIsHoeEventItem(self.dataAwardList.dwAwardItemId)) then
			-------更新挖宝事件内存信息
			CFrenzyHoeSystemManager:UpdateDigEvent(objPlayer,self.dataAwardList.dwAwardItemId)
			-------存储挖宝传闻信息
			local tmCur = GetCurTime();
			local year,month,day,n_hour,n_minute,n_sec = CTimeFormat:todate(tmCur/1000, true);
			n_sec = math.floor(n_sec);
			local eventInfo = {}
			eventInfo.dwTime = tmCur
			eventInfo.dwRoleId = objPlayer:GetRoleID();
			eventInfo.dwAwardItemId = self.dataAwardList.dwAwardItemId;
			eventInfo.szRoleName = objPlayer:GetName();
			eventInfo.dwHoeItemId = self.dataAwardList.dwHoeItemId;
			eventInfo.dwHour = n_hour
			eventInfo.dwMinute= n_minute
			eventInfo.dwSec = n_sec
			CKernelApp.FrenzyHoe_GSUpdateFrenzyHoeItemInfoMsg{ParamInfo = eventInfo}  ----ks
		end
	end
end
----是否是挖宝事件里的物品 true 是，false 否
function CFrenzyHoeSystem:CheckIsHoeEventItem(dwItemID)
	for k,v in pairs (_G.ItemFrenzyHoeDigEventConfig) do
		for i,itemid in pairs(v) do
			if(itemid == dwItemID) then
				return true;
			end
		end
	end
	return false;
end
----同步兑换锄头热更新
function CFrenzyHoeSystem:FrenzyHoeHotUpdate()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(_G.FrenzyHoeConfig and _G.FrenzyHoeConfig.bOpen) then
		objPlayer.OnSynFrenzyHoeDataMsg{Infos = self:GetFinalExChangeItemConfig()};
	end
end
----获取最终兑换物品表
function CFrenzyHoeSystem:GetFinalExChangeItemConfig()	
	if(_G.FrenzyHoeConfig and _G.FrenzyHoeConfig.bOpen) then
		return _G.FrenzyHoeConfig.ItemFrenzyHoeExchangeConfig;
	else
		return _G.ItemFrenzyHoeExchangeConfig;
	end
end

---获取其他锄头根据好友度
function CFrenzyHoeSystem:ExchangeHoeByFriendNum(Index)
	if(self.dataAwardList.dwFrendNum <= 0) then
		return false;
	end
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false;
	end
	local exChangeItemId = 0;
	local ItemNum = 0;
	local bindtype = 0;
	local configInfo = self:GetFinalExChangeItemConfig();
	if(not configInfo[Index]) then
		return;
	end
	local friendNum = configInfo[Index].FriendNum;
	if(self.dataAwardList.dwFrendNum < friendNum) then
		return;
	end
	exChangeItemId = configInfo[Index].ExchangeItemId;
	ItemNum = configInfo[Index].ItemNum;
	bindtype = configInfo[Index].BindType;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CFrenzyHoeSystem:ExchangeHoeByFriendNum sysScript is error",sysScript)
		return false;
	end
	if( not objItemSystem:IsPacketSlotEnoughFor(ItemNum) ) then
		sysScript:Notice(13001210004)
		return false;
	end
	self.dataAwardList.dwFrendNum = self.dataAwardList.dwFrendNum - friendNum
	_info("=====self.dataAwardList.dwFrendNum=====",self.dataAwardList.dwFrendNum)
	self.objDBQuery:UpdateFrenzyHoeRoleInfo()
	local tabAddPackList = {};
	table.insert(tabAddPackList,{dwItemEnum=exChangeItemId,dwItemNumber=ItemNum,dwBindType=bindtype})
	objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.Used);
	objPlayer.FrenzyHoe_ExchangeHoeSuccMsg{FrendNum = self.dataAwardList.dwFrendNum }
	return true;
end


--加载挖宝事件信息
function CFrenzyHoeSystem:LoadFrenzyHoeEventInfo(ParamInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	----发给客户端同步挖宝事件信息
	objPlayer.FrenzyHoe_SynchronizeEventInfoMsg{ParamInfo = CFrenzyHoeSystemManager.dataList[1]}
	local digeventInfo = CFrenzyHoeSystemManager.dataList[3]
	local broadCastList = {}
	for i = 1,#digeventInfo do
		broadCastList[i] = {}
		broadCastList[i].dwRoleID = digeventInfo[i].dwRoleId
		broadCastList[i].dwRoleName =digeventInfo[i].szRoleName
		broadCastList[i].dwAwardItemId = digeventInfo[i].dwAwardItemId
		broadCastList[i].dwHoeItemId = digeventInfo[i].dwHoeItemId 
		broadCastList[i].dwHour = digeventInfo[i].dwHour
		broadCastList[i].dwMinute= digeventInfo[i].dwMinute
		broadCastList[i].dwSec = digeventInfo[i].dwSec

	end
	----发给客户端同步挖宝传闻信息
	objPlayer.FrenzyHoe_SynchronizeBroadCastInfoMsg{ParamInfo = broadCastList,IsOnLine = false}
end
----获得锄头的好友度
function CFrenzyHoeSystem:GetHoeFrendNum(HoeItemId)
	for k,v in pairs(_G.ItemFrenzyHoeGetFrendNumConfig) do
		if(v.HoeItemId == HoeItemId) then
			return v.FrendNum;
		end
	end
	
end
---查看该物品是否是锄头
function CFrenzyHoeSystem:CheckItemIsHoe(HoeItemId)
	for k,v in pairs(_G.ItemFrenzyHoeTreasureConfig) do
		if(k ==HoeItemId ) then
			return true;
		end
	end
	return false;
end
----随机算法可随机到重复的
function CFrenzyHoeSystem:RanderCanRepeat(HoeItemId)
	local awardlist = {};
	local AwardItemNumList = {};
	local AwardList = {};
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		awardlist[i]= _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i];
	end
	local quanZhongRandList = {}
	local getindex = 0
	local index = 0
	local allShaiXuan = 0
	local allQz = 0
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		allShaiXuan = allShaiXuan + _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i].ShaiXuan
	end
	for i = 1,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum do
		getindex = math.random(1,allShaiXuan)
		for j = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
			if(_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[j].ShaiXuan >= getindex) then
				index = j
				break
			else
				getindex = getindex - _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[j].ShaiXuan 
			end
		end
		AwardList[i] = awardlist[index].Itemid;
		quanZhongRandList[i] = awardlist[index].QuanZhong
		AwardItemNumList[i] = awardlist[index].ItemNum
	end
	for k = 1,#quanZhongRandList do
		allQz = allQz + quanZhongRandList[k]
	end
	local qzIndex = 0
	local awardindex = 0
	qzIndex = math.random(1,allQz)
	for m = 1,#quanZhongRandList do
		if(quanZhongRandList[m] >= qzIndex) then
			awardindex = m
			break
		else
			qzIndex = qzIndex - quanZhongRandList[m]
		end
	end
	
	return awardindex,AwardList,AwardItemNumList
end


----随机算法可随机到重复的
function CFrenzyHoeSystem:RanderCanNotRepeat(HoeItemId)
	local awardlist = {};
	local AwardItemNumList = {};
	local AwardList = {};
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		awardlist[i]= _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i];
	end
	local quanZhongRandList = {}
	local getindex = 0
	local index = 0
	local allShaiXuan = 0
	local allQz = 0
	for i = 1,#_G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList do
		allShaiXuan = allShaiXuan + _G.ItemFrenzyHoeTreasureConfig[HoeItemId].TreasureItemList[i].ShaiXuan
	end
	for i = 1,_G.ItemFrenzyHoeTreasureConfig[HoeItemId].randernum do
		getindex = math.random(1,allShaiXuan)
		for j = 1,#awardlist do
			if(awardlist[j].ShaiXuan >= getindex) then
				index = j
				break
			else
				getindex = getindex - awardlist[j].ShaiXuan 
			end
		end
		AwardList[i] = awardlist[index].Itemid;
		quanZhongRandList[i] = awardlist[index].QuanZhong
		AwardItemNumList[i] = awardlist[index].ItemNum
		allShaiXuan = allShaiXuan - awardlist[index].ShaiXuan
		table.remove(awardlist,index)
		
	end
	for k = 1,#quanZhongRandList do
		allQz = allQz + quanZhongRandList[k]
	end
	local qzIndex = 0
	local awardindex = 0
	qzIndex = math.random(1,allQz)
	for m = 1,#quanZhongRandList do
		if(quanZhongRandList[m] >= qzIndex) then
			awardindex = m
			break
		else
			qzIndex = qzIndex - quanZhongRandList[m]
		end
	end
	
	return awardindex,AwardList,AwardItemNumList
end

----增加友好度
function CFrenzyHoeSystem:AddFrendNum(addnum)
	if(self.dataAwardList.dwFrendNum >= _G.ItemFrenzyHoeMaxFrendConfig) then
		return self.dataAwardList.dwFrendNum;
	elseif(self.dataAwardList.dwFrendNum + addnum >= _G.ItemFrenzyHoeMaxFrendConfig) then
		return _G.ItemFrenzyHoeMaxFrendConfig;
	else
		return self.dataAwardList.dwFrendNum + addnum;
	end
	return self.dataAwardList.dwFrendNum;
end		
