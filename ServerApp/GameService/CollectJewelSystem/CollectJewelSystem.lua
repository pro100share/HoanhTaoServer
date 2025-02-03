--[[
	--功能：聚灵珠系统类
	--作者：魏云
	--时间：2013-11-22
--]]

_G.CCollectJewelSystem = {}

function CCollectJewelSystem:new()
	local obj = CSystem:new("CCollectJewelSystem");
	obj.objDBQuery = nil;--数据库查询对象
	obj.RoleID = 0;
	obj.InjectJewelUseNum = {}; ----已使用注灵次数
	obj.InjectJewelState = {};  ----注灵状态
	obj.InjectJewelProcess = {}; ---注灵进度
	obj.InjectJewelCanUseNum = {};---可使用注灵次数
	obj.InjectJewelCanUseTotalNum = 0;---可使用注灵总次数
	obj.InjectJewelAddCanUseNum = {};---增加可使用注灵次数
	obj.InjectJewelAddCanUseTotalNum = 0;---增加可使用注灵总次数
	obj.InjectJewelUseTotalNum = 0; ----玩家每日注灵总次数
	for i,v in pairs(CCollectJewelSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CCollectJewelSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if(not objDB ) then
		_info("objDB is null by CCollectJewelSystem:Create")
		return false;
	end
	-- 创建数据库对象
	self.objDBQuery = CCollectJewelSystemDB:new(objDB,self);
	self:InitData();
	---从数据库中读取数据
	local Data = objPlayer:GetLineData("CCollectJewelSystem") or {};
	if(#Data <= 0) then
		return;
	end
	if(#Data[1] > 0) then
		self.RoleID = Data[1][1].dwRoleID;
		self.InjectJewelUseNum = self:LoadStr(Data[1][1].dwInjectJewelUseNum);
		self.InjectJewelState = self:LoadStr(Data[1][1].dwInjectJewelState);
		self.InjectJewelProcess = self:LoadStr(Data[1][1].dwInjectJewelProcess);
		self.InjectJewelUseTotalNum = Data[1][1].dwInjectJewelUseTotalNum;
		self.InjectJewelAddCanUseNum = self:LoadStr(Data[1][1].dwInjectJewelAddCanUseNum);
		self.InjectJewelCanUseNum[1] = self.InjectJewelCanUseNum[1] + self.InjectJewelAddCanUseNum[1] ;
		self.InjectJewelCanUseNum[2] = self.InjectJewelCanUseNum[2] + self.InjectJewelAddCanUseNum[2] ;
		self.InjectJewelCanUseNum[3] = self.InjectJewelCanUseNum[3] + self.InjectJewelAddCanUseNum[3] ;
		self.InjectJewelAddCanUseTotalNum = Data[1][1].dwInjectJewelAddCanUseTotalNum;
		self.InjectJewelCanUseTotalNum = self.InjectJewelCanUseTotalNum + self.InjectJewelAddCanUseTotalNum;
	end
	if bIsChangeLine == 0 then
		if not CTimeFormat:isTodayEx(objPlayer:GetInfo().tmDownlineTime/1000) then
			self:StartAllCollectJewel();
            self:ClearCollectJewelInfo(false);
		end
	end
	return true
end
---初始化聚灵数据
function CCollectJewelSystem:InitData()
	self.RoleID = 0;
	self.InjectJewelUseNum = {0,0,0};
	self.InjectJewelState = {0,0,0};
	self.InjectJewelProcess = {0,0,0};
	self.InjectJewelCanUseNum = {CollectJewelConfig.GetPearlInfo(1).maxFillCount,CollectJewelConfig.GetPearlInfo(2).maxFillCount,CollectJewelConfig.GetPearlInfo(3).maxFillCount};---可使用注灵次数
	self.InjectJewelCanUseTotalNum = CollectJewelConfig.maxFillCount;---可使用注灵总次数
	self.InjectJewelUseTotalNum = 0;
	self.InjectJewelAddCanUseNum = {0,0,0};
	self.InjectJewelAddCanUseTotalNum = 0;
end
function CCollectJewelSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local Data = {}
	Data[1] = {};
	Data[1].dwRoleID = self.RoleID;
	Data[1].dwInjectJewelUseNum = self:UpdateStr(self.InjectJewelUseNum);
	Data[1].dwInjectJewelState = self:UpdateStr(self.InjectJewelState);
	Data[1].dwInjectJewelProcess = self:UpdateStr(self.InjectJewelProcess);
	Data[1].dwInjectJewelUseTotalNum = self.InjectJewelUseTotalNum;
	Data[1].dwInjectJewelAddCanUseNum = self:UpdateStr(self.InjectJewelAddCanUseNum);
	Data[1].dwInjectJewelAddCanUseTotalNum = self.InjectJewelAddCanUseTotalNum;
	--将数据提交到换线中心
	objPlayer:SetLineData("CCollectJewelSystem",Data);
end

function CCollectJewelSystem:Update(dwInterval)
	return true;
end
function CCollectJewelSystem:OnEnterScene()
	self:SynchronizeToClient();
end
function CCollectJewelSystem:SynchronizeToClient()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	---同步客户端
	objPlayer.CollectJewelSynchronizeToClientMsg{InjectJewelUseNum = self.InjectJewelUseNum,InjectJewelState = self.InjectJewelState,InjectJewelProcess = self.InjectJewelProcess,InjectJewelUseTotalNum = self.InjectJewelUseTotalNum ,InjectJewelCanUseNum = self.InjectJewelCanUseNum,InjectJewelCanUseTotalNum = self.InjectJewelCanUseTotalNum};---可使用注灵次数
	
end
---玩家开启聚灵
function CCollectJewelSystem:OpenCollectJewel(CollJewType)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	if(self.InjectJewelState[CollJewType] == 1) then
		return;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CCollectJewelSystem:OpenCollectJewel sysScript is error",sysScript)
		return ;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return ;
	end
	local CostGoldNum = CollectJewelConfig.GetBeginGainsCost(CollJewType,0);
	if(CostGoldNum <= 0) then
		return;
	end
	if(not objItemSystem:IsGoldEnough(CostGoldNum)) then
		return;
	end
	objItemSystem:CostGold(CostGoldNum, _G.ItemSysOperType.CollectJewel);
	---设置状态
	self.InjectJewelState[CollJewType] = 1;
	---存入数据库
	self:SaveDB();
	----返回给客户端消息
	objPlayer.OpenCollectJewelSuccessMsg{CollJewType = CollJewType};
end
-----玩家注灵
function CCollectJewelSystem:StartCollectJewel(CollJewType,IsSys)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	if(self.InjectJewelState[CollJewType] == 0) then
		return;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		_info("error : CCollectJewelSystem:OpenCollectJewel sysScript is error",sysScript)
		return ;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return ;
	end
	if (not IsSys) and (self.InjectJewelUseNum[CollJewType] >= self.InjectJewelCanUseNum[CollJewType]) then
		return;
	end
	if(self.InjectJewelUseTotalNum >= self.InjectJewelCanUseTotalNum) then
		return;
	end
	if(not IsSys) then
		local CostGoldNum = CollectJewelConfig.GetFillCost(CollJewType,0) ----次数待定
		
		if(CostGoldNum <= 0) then
			return;
		end
		if(not objItemSystem:IsGoldEnough(CostGoldNum)) then
			return;
		end
		objItemSystem:CostGold(CostGoldNum, _G.ItemSysOperType.CollectJewel);
	end
	---设置状态
	self.InjectJewelUseNum[CollJewType] = self.InjectJewelUseNum[CollJewType] + 1;
	self.InjectJewelUseTotalNum = self.InjectJewelUseTotalNum + 1;
	local processValue = 0;
	if(not IsSys) then
		processValue = CollectJewelConfig.GetAddProcess(CollJewType,0)
		
	else
		processValue = CollectJewelConfig.SysAddProcess
	end
	self.InjectJewelProcess[CollJewType] = self.InjectJewelProcess[CollJewType] + processValue;
	if(self.InjectJewelProcess[CollJewType] > CollectJewelConfig.GetPearlInfo(CollJewType).maxFillValue) then
		self.InjectJewelProcess[CollJewType] = CollectJewelConfig.GetPearlInfo(CollJewType).maxFillValue;
	end
	---获取注灵奖励
	local awardInfo = CollectJewelConfig.GetAwardItemInfo(1,CollJewType,objPlayer:GetLevel());
	if(not IsSys) then
		self:GivePlayerAwardInfo(awardInfo,1);
	end
	---存入数据库
	self:SaveDB();
	----返回给客户端消息
	objPlayer.StartCollectJewelSuccessMsg{CollJewType = CollJewType,CurCollJewNum = self.InjectJewelUseNum[CollJewType],CurCollJewTotalNum = self.InjectJewelUseTotalNum,CurInjectJewelProcess = self.InjectJewelProcess[CollJewType],IsSys = IsSys}
end
---玩家获取奖励
function CCollectJewelSystem:GetCollectJewelAward(CollJewType)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	if(self.InjectJewelProcess[CollJewType] < CollectJewelConfig.pearl[CollJewType].maxFillValue) then
		return;
	end
	---设置状态
	self.InjectJewelProcess[CollJewType] = 0;
	self.InjectJewelState[CollJewType] = 0;
	self.InjectJewelUseNum[CollJewType] = 0;
	---获取收获奖励
	local awardInfo = CollectJewelConfig.GetAwardItemInfo(2,CollJewType,objPlayer:GetLevel());
	self:GivePlayerAwardInfo(awardInfo,2);
	---存入数据库
	self:SaveDB();
	----返回给客户端消息
	objPlayer.GetCollectJewelAwardSuccessMsg{CollJewType = CollJewType,CurInjectJewelState = self.InjectJewelState[CollJewType],CurInjectJewelProcess = self.InjectJewelProcess[CollJewType],CurInjectJewelUseNum = self.InjectJewelUseNum[CollJewType]};
	---广播
	-- RoleID	= 0,
	-- RoleName= "",
	-- CollJewType = 0,
	-- AwardInfo = {};
	if(CollectJewelConfig.GetIsBroadcast(CollJewType,0)) then
		CGameApp.BroadCastGetCollectJewelAwardMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),CollJewType = CollJewType,AwardInfo = awardInfo};
	end
end
---reset 注灵次数
function CCollectJewelSystem:ClearCollectJewelInfo(bSend)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	for k,v in pairs(_G.PearlType) do
		self.InjectJewelUseNum[v] = 0;
	end
	self.InjectJewelUseTotalNum = 0;
	self.InjectJewelCanUseNum = {CollectJewelConfig.GetPearlInfo(1).maxFillCount,CollectJewelConfig.GetPearlInfo(2).maxFillCount,CollectJewelConfig.GetPearlInfo(3).maxFillCount};---可使用注灵次数
	self.InjectJewelCanUseTotalNum = CollectJewelConfig.maxFillCount;---可使用注灵总次数
	self.InjectJewelAddCanUseTotalNum = 0;
	self.InjectJewelAddCanUseNum = {0,0,0};
	if bSend then
		self:SynchronizeToClient();
	end
	
end
----系统自动聚灵
function CCollectJewelSystem:StartAllCollectJewel()
	for k,v in pairs(_G.PearlType) do
		self:StartCollectJewel(v,true);
	end
end
----保存数据库
function CCollectJewelSystem:SaveDB()
	if(self.RoleID <= 0) then
		self.objDBQuery:InsertCollectJewelInfo();
		self.RoleID = self:GetPlayer():GetRoleID();
	else
		self.objDBQuery:UpdateCollectJewelInfo();
	end
end

----使用道具增加总的可使用注灵次数
function CCollectJewelSystem:UseItemAddCanUseTotalNum(ItemId,Value)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 2;
	end
	local addnum = Value;
	self.InjectJewelCanUseTotalNum = self.InjectJewelCanUseTotalNum + addnum;
	self.InjectJewelAddCanUseTotalNum = self.InjectJewelAddCanUseTotalNum + addnum;
	self:SaveDB();
	objPlayer.UseItemAddCanUseTotalNumMsg{InjectJewelCanUseTotalNum = self.InjectJewelCanUseTotalNum};
end
---使用道具增加单个可使用注灵次数
function CCollectJewelSystem:UseItemAddCanUseNum(ItemId,CollJewType,Value)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return 2;
	end
	local addnum = Value;
	self.InjectJewelCanUseNum[CollJewType] = self.InjectJewelCanUseNum[CollJewType] + addnum;
	self.InjectJewelAddCanUseNum[CollJewType] = self.InjectJewelAddCanUseNum[CollJewType] + addnum;
	self:SaveDB();
	objPlayer.UseItemAddCanUseNumMsg{CollJewType = CollJewType,InjectJewelCanUseNum = self.InjectJewelCanUseNum[CollJewType]}
end
----给玩家奖励
function CCollectJewelSystem:GivePlayerAwardInfo(awardInfo,nType)
	-- Exp = 1, -->经验
	-- Money = 2, -->银两
	-- Pneuma = 3, -->真气
	-- Item = 4, -->物品
	-- Cash = 5, -->礼金
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return ;
	end
	local tempAwardInfo = {};
	local setAddItemList = {};
	local b_sendMail = false;
	for k,v in pairs(awardInfo) do
		if(v[1] == _G.CollectAwardType.Exp) then
			objPlayer:AddExp(v[2]);
		elseif(v[1] == _G.CollectAwardType.Money ) then
			if objItemSystem:IsCanAddPacketMoney(v[2]) then
				objItemSystem:AddPacketMoney(v[2], _G.ItemSysOperType.CollectJewel);
			end
		elseif(v[1] == _G.CollectAwardType.Pneuma) then
			local FiveElemSys = objPlayer:GetSystem('CFiveElemSystem');
			if(not FiveElemSys) then
				return;
			end
			-----增加真气值
			FiveElemSys:ChangeAttr( 'dwMetalValue', v[2] )
			FiveElemSys:ChangeAttr( 'dwWoodValue', v[2] )
			FiveElemSys:ChangeAttr( 'dwWaterValue', v[2] )
			FiveElemSys:ChangeAttr( 'dwFireValue', v[2] )
			FiveElemSys:ChangeAttr( 'dwEarthValue', v[2] )
			FiveElemSys:UpdateInfoToClient(objPlayer,2)
		elseif(v[1] == _G.CollectAwardType.Cash) then
			objItemSystem:AddBindGold(v[2], _G.ItemSysOperType.CollectJewel);
		elseif(v[1] == _G.CollectAwardType.FenyYunValue) then
			local sys = objPlayer:GetSystem("CErrantHonorSystem");
			if(sys) then
				sys:AddErrantHonorValue(v[2]);
			end
		elseif(v[1] == _G.CollectAwardType.Item) then
            table.insert(setAddItemList, {
                dwItemEnum = v[2];
                dwItemNumber =v[3];
                dwBindType = v[4];
                dwLifeTime = -1;
            });
			if( not objItemSystem:IsEnumItemListCanAddToPacket(setAddItemList) ) then
				local index = #tempAwardInfo + 1;
				tempAwardInfo[index] = {}; 
				tempAwardInfo[index] = {AwardItemID = v[2],AwardItemNum = v[3],AwardItemBindType = v[4]}
				b_sendMail = true;
			else
				local tabAddPackList = {};
				table.insert(tabAddPackList,{dwItemEnum=v[2],dwItemNumber=v[3],dwBindType = v[4]})
				objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.CollectJewel);
			end
		end
	end
	if(b_sendMail) then
		---发邮箱
		---邮件发送给玩家奖励物品
		local mailSys = objPlayer:GetSystem("CMailSystem");
		if(not mailSys) then
			return;
		end
		local mailMsg = CollectJewelConfig.SetMaiInfo(tempAwardInfo,nType)
		if(not mailMsg) then
			return;
		end
		mailSys:SendSetMail( mailMsg, objPlayer:GetRoleID(), objPlayer:GetName() ) ---发送一个设置的邮件
	end
end

---加载字符串 转换为 table
function CCollectJewelSystem:LoadStr(str)
	if(str == nil) then
		return false;
	end
	local b = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		b[index] = value;
		index = index + 1;
	end;
	return b;
end

---更新字符串
function CCollectJewelSystem:UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end;







