------------------------------------
------------------------------------
--道具系统
--author lkj

-------------------------------------
-------------------------------------
--道具系统
_G.CItemSystem = {};
function CItemSystem:new(objPlayer)
	local obj = CSystem:new("CItemSystem");
	
	--元宝
	obj.dwGold 		= 0;			--元宝数
	obj.dwLockedGold= 0;			--锁定元宝
	obj.dwBindGold	= 0;			--绑定元宝数
	--
	obj.dwNextItemID = 1;			--下一个道具的实例ID
	
	--所有容器集合
	obj.setHolders	= {};
	--所有物品表
	obj.ItemList = {};
	--元操作集合表
	obj.OperList = {
		[_G.enItemSysOper.eAdd] = {};
		[_G.enItemSysOper.eUpd] = {};
		[_G.enItemSysOper.eDel] = {};
		[_G.enItemSysOper.eSys] = {};
	};
	
	--装备总加成属性
	obj.TotalAttr       = SSingleAttrChange:new();
    --宝石总加成属性
    obj.StoneTotalAttr  = SSingleAttrChange:new();
	--每个装备的加成属性表
	obj.AttrList        = {};
    --每个装备位宝石加成属性表
    obj.StoneAttrList   = {};
	--装备位的临时宝石精魄加成属性
	obj.StoneJPTempAttr = {};
	--宝石精魄属性
	obj.StoneJPAttr = {};
	--宝石铸造属性
	obj.StoneFoundryAttr = {};
    obj.StoneJPAttr = SSingleAttrChange:new();
	obj.StoneFoundryAttr = SSingleAttrChange:new();
	--所有套装信息集合
	obj.SuitsInfo	= {};
	obj.SuitsInfo.setEquipInfo	= {};
	--obj.SuitsInfo.setStoneInfo	= {};
	obj.SuitsInfo.setSuitIDs	= {};
	obj.SuitsInfo.setStoneSuitIDs	= {};
	-- for i=_G.enItemWearPos.eWeapon, _G.enItemWearPos.ePendant do
		-- obj.SuitsInfo.setEquipInfo[i] = {};
		-- obj.SuitsInfo.setEquipInfo[i].dwStrLvl = 0;
		-- obj.SuitsInfo.setEquipInfo[i].dwTianSh = 0;
		-- obj.SuitsInfo.setEquipInfo[i].dwQuality = enQualityType.eNormal;
		
		-- obj.SuitsInfo.setStoneInfo[i] = {};
		-- obj.SuitsInfo.setStoneInfo[i].isFull = false;
		-- obj.SuitsInfo.setStoneInfo[i].dwMinLevel = 0;
	-- end;
	
	--初始化
	for i=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do
		obj.AttrList[i]			= SSingleAttrChange:new();
		obj.StoneAttrList[i]	= SSingleAttrChange:new();
		obj.StoneJPTempAttr[i] = SSingleAttrChange:new();
	end;
	
	--事件监听者列表
	obj.setSystemEvent = {};
	setmetatable(obj.setSystemEvent, {__mode = "k"});
	
	for i, v in pairs(CItemSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;
--create
function CItemSystem:Create(bChangeLine)
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CItemSystem Create Cannot get player");
		return false;
	end;
	--初始化
	self:InitHolder();
	--初始化DB模块
	self.objDB = objPlayer:GetDBQuery();
	if not self.objDB then
		_err("CItemSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CItemSystemDB:new(self.objDB, self);
	
	--读取信息
	local Data	= objPlayer:GetLineData("CItemSystem");
	if not Data then
		_err("CItemSystem Create CanNot GetLineData!!!");
		return false;
	end;
	local data = Data[1];
	self:GetPacket():SetData(data[1], data[2]);
	self:GetStorage():SetData(data[3], data[4]);
	self.dwNextItemID	= data[5];
	self.dwBindGold 	= data[6];
    self.dwGold			= objPlayer:GetGold();
	self.setLockedItem	= data[7] or {};
	self.SuitsInfo.setSuitIDs = data[8] or {};
	
	--如果不是跨服战 加载所有物品 (跨服战不带入物品不需要这些逻辑)
	if bChangeLine ~= 2 then
		local index = 2;
		data = Data[index];
		self.b_Create = true;
		self.tSameSlotItems = {};
		while data do
			local i = 1;
			while data[i] do
				if CGlobalItemManager:IsHaveThisItem(data[i][1]) then
					local objItem = CItem:New(data[i][1]);
					objItem:ParseNetData(data[i]);
					if objItem:GetInstID() > self.dwNextItemID then
						_err("IS ERROR!!! objItem:GetInstID() > self.dwNextItemID", objItem:GetInstID(), self.dwNextItemID);
						self.dwNextItemID = objItem:GetInstID() + 1;
					end;
					self:DoCreateAddItem(objItem);
				else
					--_info("IS ERROR!!! item enumid not exist", data[i][1]);
					local objScript = objPlayer:GetSystem('CScriptSystem');
					objScript:Notice(SysStringConfigInfo[6000610040]);
				end;
				i = i + 1;
			end;
			index = index + 1;
			data = Data[index];
		end;
		self:DoCreateAddItemOver();
	end

	self.tSameSlotItems = nil;
	self.b_Create = false;
	self:CalStoneAttr();
    
	if bChangeLine ~= 2 then--第一次上线，删除回购栏位里所有物品
    --if not bChangeLine then--第一次上线，删除回购栏位里所有物品
		self:CheckSuitForCreate();
		self:CalEquipAttr();
		if bChangeLine == 0 then
	        self:DeleteStoreItem();
	        self:Synchronize(true);
		end
	else
		self:CalEquipAttr();
    end;
	
	return true;
end;
--update
function CItemSystem:Update()
	if self.tSynToClient then
		local player = self:GetPlayer();
		if self.tSynToClient[1] then
			player.OnRequestGroupItemMsg{ItemGroup = self.tSynToClient[1]};
			table.remove(self.tSynToClient, 1);
		else
			self.tSynToClient = nil;
			--同步结束
			
			-- 如果是跨服
			if CConfig.bIsCrossSvr then
				-- print("CItemSystem:Update++++++++OnRequestGroupItemMsg ItemGroup = {isCrossSvr = true}")
				player.OnRequestGroupItemMsg{ItemGroup = {isCrossSvr = true}};
			end
			
			player.OnRequestItemEndMsg{};
		end;
	else
		CDriverManager:DelDriver(self.objNode);
		self.objNode = nil;
	end;
end;
--destory
function CItemSystem:Destroy()
    if self.bChangeLine == 0 then--下线(非换线destroy)，删除回购栏位里所有物品
        self:DeleteStoreItem();
    end;
	self:Synchronize(true);
end;
--OnEnterScene
function CItemSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	self:SynchronizeToClient();
	if not CConfig.bIsCrossSvr then
		local eventCenter = self:GetPlayer():GetSystem("CPlayerEventCenterSystem");
		for k, v in ipairs(self.SuitsInfo.setSuitIDs) do
			eventCenter:DoEvent(enumPlayerEventType.EventEquipSuit,k);
		end
	end;
	--王者归来奖励
	if _G.ComeBackConf and _G.ComeBackConf.bOpen then
		local nIndex = self:GetComeBackState()
		if nIndex > 0 and objPlayer:GetLevel() >= _G.ComeBackConf.nLevel then
			if _G.ComeBackConf.Exp then
				objPlayer:AddExp(_G.ComeBackConf.Exp(afkTime, objPlayer:GetLevel()));
			end;
			local items = _G.ComeBackConf.Items[nIndex];
			if items and (#items > 0) then
				local mailNum = math.floor(#items / 4);
				if (#items % 4) ~= 0 then
					mailNum = mailNum + 1;
				end;
				for i=1, mailNum do
					local mail = CMail:new();
					mail:SetSender(-9999, "系统邮件");
					mail:SetReceiver(objPlayer:GetRoleID(), objPlayer:GetName());
					mail:SetContent("王者归来", "欢迎回来，请您及时领取回馈奖励！");
					mail:SetLifeTime(SMailInfo.life*24*3600*1000);
					local tItem = {};
					for j=(4*i-3), (4*i) do
						if items[j] then
							local itemMessage = SItemMessage:new();
							itemMessage.dwItemEnum	= items[j][1];
							itemMessage.dwItemNumber= items[j][2];
							itemMessage.dwBindType	= items[j][3];
							itemMessage.dwLifeTime	= items[j][4] and (items[j][4] * 3600000 * 24) or nil;
							table.insert(tItem, itemMessage);
						end;
					end;
					mail:SetAccessory(0, 0, 0, tItem);
					CMailManager:SendMail(mail);
				end;
				objPlayer.NoticePlayerComeBackMsg{Items = items};
			end;
		end;
	end;
	
	--华山论剑活动
	if _G.HSLJConf and _G.HSLJConf.bOpen then
		objPlayer.SynBaiduHSLJRewardMsg{Reward = _G.HSLJConf.tReward};
	end;
	--寻找加载前后外形信息不一致的地方，同步
	if self.tbNeedChgEquipList then
		for dwPos,tbInfo in pairs(self.tbNeedChgEquipList)do
			objPlayer:SetEquip(dwPos, tbInfo[2], tbInfo[1], tbInfo[3]);
		end
		self.tbNeedChgEquipList = nil;
	end
end;

function CItemSystem:GetComeBackState()
	local afkTime = GetCurTime() - self:GetPlayer().sRoleInfo.tmDownlineTime;
	local nIndex = 0;
	for k,v in ipairs(_G.ComeBackConf.nTime) do
		if afkTime >= v then
			nIndex = k;
		end
	end
	return nIndex
end
--换线开始
function CItemSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	local data = {};
	data[1], data[2] = self:GetPacket():GetData();
	data[3], data[4] = self:GetStorage():GetData();
	data[5] = self.dwNextItemID;
	data[6] = self:GetBindGold();
	data[7] = self.setLockedItem;
	objPlayer:SetLineData("CItemSystem", data);
	
	local index = 1;
	data = {};
	for _, objItem in pairs(self.ItemList) do
		table.insert(data, objItem:GetNetData());
		if index % 10 == 0 then
			objPlayer:SetLineData("CItemSystem", data);
			data = {};
		end;
		index = index + 1;
	end;
	if #data > 0 then
		objPlayer:SetLineData("CItemSystem", data);
	end;
    
    self.bChangeLine = 1;
end
--换线结束
function CItemSystem:OnChangeLineEnd()
end;


--跨服战换线开始
function CItemSystem:OnEnterCrossBegin()
	--print("-------------CItemSystem:OnEnterCrossBegin-------------");
	local objPlayer = self:GetPlayer();
	local dwSlotNum, dwMoney = self:GetPacket():GetData();
	dwSlotNum = 30;
	local data = {};
	data[1], data[2] = dwSlotNum, dwMoney;
	data[3], data[4] = 0, 0;
	data[5] = 1;
	data[6] = self:GetBindGold();
	data[8] = self.SuitsInfo.setSuitIDs;
	objPlayer:SetCrossSvrData("CItemSystem", data);
    --self.bChangeLine = 2;
end;

function CItemSystem:OnChangeSceneEnd()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objCrossSystem = objPlayer:GetSystem("CCrossSvrSystem");
	if objCrossSystem:GetEnterCrossId() == 0 then
		return;
	end;
	--self:SynchronizeToClient()
end;

--初始化道具容器
function CItemSystem:InitHolder()
	for class = enItemPosition.ePacket, enItemPosition.eDecompose do
		self.setHolders[class] = CItemHolder:New(class, self);
	end;
end;


--获得下一个道具ID
function CItemSystem:GetNextItemID()
	local dwItemID = self.dwNextItemID;
	self.dwNextItemID = self.dwNextItemID + 1;
	self:OperSys(_G.enItemSysUpdOper.eNextItemID, self.dwNextItemID);
	return dwItemID;
end;

--玩家下线删除卖给NPC的物品
function CItemSystem:DeleteStoreItem()
	local setItemIDs = self:GetStore():GetAllItemID()
	for _, dwInstID in ipairs(setItemIDs) do
		local objItem = self:GetItemInst(dwInstID);
		self:DoDelItem(objItem, _G.ItemSysOperType.SellNpc);
        --记录日志
        self:LogDelItem(objItem:GetEnumID(), objItem:GetCount(), _G.ItemSysOperType.SellNpc, objItem:GetBindType());
	end
end


--oper sys
function CItemSystem:OperSys(operType, dwValue)
	--print("==OperSys==", operType, dwValue);
	local t = {
		[1] = operType;
		[2] = dwValue;
	};
	table.insert(self.OperList[_G.enItemSysOper.eSys], t);
end;
--oper add
function CItemSystem:OperAdd(objItem, szType)
	--print("==OperAdd==", objItem:GetInstID(), objItem:GetCount());
	local t = {
		[1] = objItem;
        [2] = objItem:GetNetData();
		[3] = szType;
	};
	table.insert(self.OperList[_G.enItemSysOper.eAdd], t);
end;
--oper upd
function CItemSystem:OperUpd(objItem, UpdType, UpdParam, szType, DBParam)
	--print("==OperUpd==", objItem:GetInstID(), UpdType, UpdParam[1]);
	local t = {
		[1] = objItem;
		[2] = UpdType;
		[3] = UpdParam;
		[4] = szType;
		[5] = DBParam;
	};
	table.insert(self.OperList[_G.enItemSysOper.eUpd], t);
end;
--oper del
function CItemSystem:OperDel(objItem, szType)
	--print("==OperDel==", objItem:GetInstID());
	local t = {
		[1] = objItem;
		[2] = szType;
	};
	table.insert(self.OperList[_G.enItemSysOper.eDel], t);
end;


--与数据库和客户端同步
--bForbidClient 屏蔽客户端
function CItemSystem:Synchronize(bForbidClient)
	--系统属性修改
	if #self.OperList[_G.enItemSysOper.eSys] > 0 then
		--数据压缩
		local tempT = {};
		for _, v in ipairs(self.OperList[_G.enItemSysOper.eSys]) do
			tempT[v[1]] = v[2];
		end;
		--同步数据库
		self.objDBQuery:UpdateItemSysInfo(tempT);
		--同步客户端系统属性更改
		--table.print(tempT);
		if not bForbidClient then
			self:GetPlayer().OnHolderInfoChgMsg{OperateList = tempT};
		end;
		--置空
		self.OperList[_G.enItemSysOper.eSys] = {};
	end;
	
	
	--道具相关修改
	--local numChange = {};
	local bOperItem = false;
	local ItemOperSynT = {};
	--Add
	if #self.OperList[_G.enItemSysOper.eAdd] > 0 then
		bOperItem = true;
		ItemOperSynT[_G.enItemSysOper.eAdd] = {};
		for _, oper in ipairs(self.OperList[_G.enItemSysOper.eAdd]) do--增
			--同步数据库
			self.objDBQuery:InsertNewItem(oper[1]);
			--同步客户端
			table.insert(ItemOperSynT[_G.enItemSysOper.eAdd], oper[2]);
			--记录日志
		end;
	end;
	--Upd
	if #self.OperList[_G.enItemSysOper.eUpd] > 0 then
		bOperItem = true;
		ItemOperSynT[_G.enItemSysOper.eUpd] = {};
		local tempUpdEdre = {};
		local tempUpdDB = {};
		for _, oper in ipairs(self.OperList[_G.enItemSysOper.eUpd]) do--改
			--压缩SQL数据
			tempUpdDB[oper[1]] = tempUpdDB[oper[1]] or {};
			if oper[2] == _G.enItemUpdOper.eAdd or oper[2] == _G.enItemUpdOper.eDel then
				tempUpdDB[oper[1]][99] = oper[1]:GetCount();
			elseif oper[2] == _G.enItemUpdOper.eUpgd then
				tempUpdDB[oper[1]][98] = oper[1]:GetEnumID();
				tempUpdDB[oper[1]][_G.enItemUpdOper.eProp] = oper[1]:GetDBProperty();
			else
				tempUpdDB[oper[1]][oper[2]] = oper[5] or oper[3][1];
			end;
			--同步客户端
			if oper[2] == _G.enItemUpdOper.eEdre then--压缩耐久度信息
				tempUpdEdre[oper[1]:GetInstID()] = tempUpdEdre[oper[1]:GetInstID()] or {};
				tempUpdEdre[oper[1]:GetInstID()][oper[2]] = oper[3];
			else
				table.insert(ItemOperSynT[_G.enItemSysOper.eUpd], {oper[1]:GetInstID(), oper[2], oper[3]});
			end;
			--记录日志
		end;
		--同步数据库
		self.objDBQuery:UpdateItem(tempUpdDB);
		--同步客户端
		for k, v in pairs(tempUpdEdre) do
			table.insert(ItemOperSynT[_G.enItemSysOper.eUpd], {k, _G.enItemUpdOper.eEdre, v[_G.enItemUpdOper.eEdre]});
		end;
	end;
	--Del
	if #self.OperList[_G.enItemSysOper.eDel] > 0 then
		bOperItem = true;
		ItemOperSynT[_G.enItemSysOper.eDel] = {};
		for _, oper in ipairs(self.OperList[_G.enItemSysOper.eDel]) do--删
			--同步数据库
			self.objDBQuery:DeleteItem(oper[1]);
			--同步客户端
			table.insert(ItemOperSynT[_G.enItemSysOper.eDel], {oper[1]:GetInstID()});
			--记录日志
		end;
	end;	
	
	--同步客户端
	if not bForbidClient and bOperItem then
		--table.print(ItemOperSynT);
		self:GetPlayer().OnItemOprateMsg{OperateList  = ItemOperSynT};
	end;
	
	self.OperList[_G.enItemSysOper.eAdd] = {};
	self.OperList[_G.enItemSysOper.eUpd] = {};
	self.OperList[_G.enItemSysOper.eDel] = {};
end;

--上线向客户端同步信息
function CItemSystem:SynchronizeToClient()
	local player = self:GetPlayer();
	--同步系统信息
	local holderInfo = {};
	-- 如果是跨服
	if CConfig.bIsCrossSvr then
		holderInfo.isCrossSvr = true;
	end
	
	holderInfo[_G.enItemSysUpdOper.eBindGold]		= self:GetBindGold();
	holderInfo[_G.enItemSysUpdOper.eGold]			= self:GetAllGold();
	holderInfo[_G.enItemSysUpdOper.ePacketSlotNum], holderInfo[_G.enItemSysUpdOper.ePacketMoney] = self:GetPacket():GetData();
	holderInfo[_G.enItemSysUpdOper.eStorageSlotNum], holderInfo[_G.enItemSysUpdOper.eStorageMoney] = self:GetStorage():GetData();
	player.OnRequestItemBeginMsg{HolderInfo = holderInfo};
	--同步物品信息
	self.objNode = CDriverManager:AddDriver(_G.eInterval._100ms, self, self.Update);
	self.tSynToClient = {};
	local index = 1;
	local Group = {};
	for _, objItem in pairs(self.ItemList) do
		table.insert(Group, objItem:GetNetData());
		if index % 10 == 0 then
			table.insert(self.tSynToClient, Group);
			Group = {};
		end;
		index = index + 1;
	end;
	if #Group > 0 then
		table.insert(self.tSynToClient, Group);
	end;
end;



--执行某一个事件函数
function CItemSystem:DoItemEvent(szFuncName, ...)
	local args = {...};
	for system, _ in pairs(self.setSystemEvent) do
		local funEvent = system[szFuncName];
		if funEvent then
		     funEvent(system, unpack(args));
		end;
	end;
end


--发送操作失败的消息，详见ItemErrorConfig.lua定义
function CItemSystem:OnError(dwError, dwCode1, dwCode2)
	self:GetPlayer().OnErrorMsg{ Error=dwError, Code1=dwCode1 , Code2=dwCode2 };
end










-----------------------------------------------------------------
------------------藏宝图相关接口，写道具系统里了-----------------
-----------------------------------------------------------------


--藏宝图物品使用消息
function CItemSystem:OnOpenTreasrueMap(dwInstID,szDoodle,dwOnDayUseNum)
	self:GetPlayer().OnOpenTreasrueMapMsg{
		dwInstID = dwInstID,szDoodle = szDoodle,dwOnDayUseNum = dwOnDayUseNum
	};
end

--藏宝图物品更新签名字段
function CItemSystem:UpdataItemDooble(dwInstID,szDoodle)
	self:SetItemDoodle(dwInstID, szDoodle);
end

--完成藏宝图
function CItemSystem:CompleteTreasrueMap(dwInstID,tPos)
	local objPlayer = self:GetPlayer();
	local objItem = self:GetItemInst(dwInstID);
	if not objItem then return end;
	if self:IsItemLocked(dwInstID) then return end;
	--藏宝图道具有效性检查
	if not Mine_News:IsRightID(objItem:GetEnumID()) then return end;
	--判断背包空间
	if not self:IsPacketSlotEnoughFor(UIItemTreasureMapConfig.dwEmptySlotNum) then return end;
	--使用次数减少
	local objSysVip = objPlayer:GetSystem('CVipSystem');
	local objSysRefresh = objPlayer:GetSystem('CRefreshSystem');
	if objSysVip and objSysRefresh then
		local dwCurUseNum = objSysRefresh:GetData(1001) - 1;
		objSysRefresh:SetData(1001,dwCurUseNum);
		objPlayer.OnTreasrueMapOnDayUseNumMsg{dwOnDayUseNum = dwCurUseNum};
		local szEvent = enumPlayerEventType.TreasrueMapUse;
		objPlayer:GetSystem("CPlayerEventCenterSystem"):DoEvent(szEvent,1);
	end
	--计算奖励道具
	local dwQuality = objItem:GetQuality();
	local dwDropID,dwRepeat = Mine_News:Reward(objPlayer,dwQuality,tPos);
	--发放奖励道具
	if dwDropID and dwRepeat then
		local tabAddList = {};
		local dwRoleID = objPlayer:GetRoleID();
		for i = 1,dwRepeat do
			local tRewardItem = CDropControl:DoDrop(dwDropID,dwRoleID);
			for _,v in ipairs(tRewardItem) do
				local tItem = {
					dwItemEnum		= v.dwItemEnum;
					dwItemNumber	= v.dwNum;
					dwStrongLevel	= v.dwStrong;
					dwQuality		= v.dwQuality;
				};
				if CGlobalItemManager:IsEquip(v.dwItemEnum) then
					tItem.dwBindType = enItemBindType.eNo;
				else
					tItem.dwBindType = enItemBindType.eYes;
				end
				table.insert(tabAddList,tItem);
			end
		end
		local objMgr = CGlobalItemManager;
		for _,v in pairs(tabAddList) do
			v.setProperty = objMgr:GetPropertyByQuality(v.dwItemEnum,v.dwQuality);
		end
		
		local bFlag = self:IsEnumItemListCanAddToPacket(tabAddList);
		if not bFlag then
			local objScript = objPlayer:GetSystem('CScriptSystem');
			objScript:Notice(SysStringConfigInfo[6000610004]);
			return
		end
		
		--加入玩家背包
		self:DelObjItem(dwInstID,ItemSysOperType.Treasure);
		local eType = ItemSysOperType.Treasure;
		local tInstList = self:AddEnumItemListToPacket(tabAddList,eType);
		for k,v in pairs(tabAddList) do v.dwInstID = tInstList[k] end;
		
		local dwTreasrueLevel = Mine_News:levelBelong(objPlayer:GetLevel());
		local dwExp = Mine_News:ExpAward(dwQuality,dwTreasrueLevel);
		local dwElement = Mine_News:WuXingAward(dwQuality,dwTreasrueLevel);
		
		--显示奖励界面
		objPlayer.OnTreasrueMapRewardMsg {
			dwExp = dwExp, dwElement = dwElement, tItems = tabAddList
		};
		--[[
		--检测公告物品
		local tNoticeItem = {}
		for i,v in pairs(tabAddList) do
			if not _G.Mine_News.Values then break; end;
			for _,dwItemEnum in pairs(_G.Mine_News.Values) do
				if v.dwItemEnum == dwItemEnum then
					local tItem = { dwItemEnum = dwItemEnum,dwInstID = v.dwInstID };
					table.insert(tNoticeItem,tItem);
					break;
				end
			end
		end
		--公告道具
		if #tNoticeItem ~= 0 then
			local tabPlayerList = CMapManager:GetPlayer();
			for dwRoleID, objPlayer in pairs(tabPlayerList) do
				objPlayer.OnTreasrueMapBroadMsg {
					dwRoleID = objPlayer:GetRoleID(),
					szRoleName = objPlayer:GetInfo().szRoleName,
					tNoticeItems = tNoticeItem,
					Time = GetCurTime()
				}
			end
		end
		--]]
	end
end



----------------------------
--发放华山论剑奖励
function CItemSystem:AwardHSLJReward(place)
	if _G.HSLJConf and _G.HSLJConf.bOpen then
		local objPlayer = self:GetPlayer();
		local items = _G.HSLJConf.tReward[place];
		if items then
			local mailNum = math.floor(#items / 4);
			if (#items % 4) ~= 0 then
				mailNum = mailNum + 1;
			end;
			for i=1, mailNum do
				local mail = CMail:new();
				mail:SetSender(-9999, "系统邮件");
				mail:SetReceiver(objPlayer:GetRoleID(), objPlayer:GetName());
				mail:SetContent("华山论剑", "决战华山谁与争锋，恭喜您获得华山论剑第".. place .. "名特别奖励！");
				mail:SetLifeTime(SMailInfo.life*24*3600*1000);
				local tItem = {};
				for j=(4*i-3), (4*i) do
					if items[j] then
						local itemMessage = SItemMessage:new();
						itemMessage.dwItemEnum	= items[j][1];
						itemMessage.dwItemNumber= items[j][2];
						itemMessage.dwBindType	= items[j][3];
						itemMessage.dwLifeTime	= items[j][4] and (items[j][4] * 3600000 * 24) or nil;
						table.insert(tItem, itemMessage);
					end;
				end;
				mail:SetAccessory(0, 0, 0, tItem);
				CMailManager:SendMail(mail);
			end;
		end;
	end;	
end;
