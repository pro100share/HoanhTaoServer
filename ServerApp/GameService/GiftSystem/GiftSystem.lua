--2012.3.5
--作者：段磊磊
--礼包系统
_G.CGiftSystem = {}
function CGiftSystem:new()
	local obj = CSystem:new("CGiftSystem");
	--等级礼包序号
	obj.dwLevelGiftSeq = 0;
	--在线时间礼包序号
	obj.dwTimeGiftSeq = 0;
	--在线时间礼包剩余倒计时
	obj.dwTimeRemain = GiftConfig.OnLineGift[1].Time;
	--时间戳
	obj.dwTimeStamp = 0;
	--时间礼包权限
	obj.bAuthority = false
	for i,v in pairs(CGiftSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CGiftSystem:Create()
    -- 创建数据库对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CGiftDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	local tabDataList = objPlayer:GetLineData("CGiftSystem")
	if tabDataList[1][1] then
		self.dwLevelGiftSeq = tabDataList[1][1]
		self.dwTimeGiftSeq = tabDataList[1][2]
		if tabDataList[1][3] then
			self.dwTimeRemain = tabDataList[1][3]
		else
			self.dwTimeRemain = GiftConfig.OnLineGift[1].Time
		end
	end
	return true;
end
function CGiftSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	t[1] = self.dwLevelGiftSeq;
	t[2] = self.dwTimeGiftSeq;
	t[3] = self.dwTimeRemain;
	objPlayer:SetLineData("CGiftSystem",t);
end
function CGiftSystem:UnlockTimeGift()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self.bAuthority = true
	objPlayer.CltDecodeMsg{Param = {GiftConfig.enumGiftType.UnlockTimeGift}}
end
function CGiftSystem:EventLevelUp(dwValue,dwLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if dwLevel >= AuthorityEventConfig['EventLevelUp'][24].dwLevel and self.bAuthority == false then
		self:UnlockTimeGift()
	end
	if not GiftConfig.LevelGift[self.dwLevelGiftSeq+1] then
		return
	end
	if dwLevel >= GiftConfig.LevelGift[self.dwLevelGiftSeq+1].Level then
		local tempSerial = self.dwLevelGiftSeq + 1
		objPlayer.CltDecodeMsg{Param = {GiftConfig.enumGiftType.LevelUp,tempSerial,dwValue}}
	end
end
function CGiftSystem:Update(dwInterval)
	return true
end

function CGiftSystem:Destroy()
	-- if self.objDBQuery then
		-- self.objDBQuery:SaveInfo()
	-- end;
end;

function CGiftSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end; 
	if self:HasAuthority( 'OnLineGift' ) then
		self:UnlockTimeGift()
	end
	self:UpdateInfoToClient(objPlayer)
end;
--领取礼包接口
function CGiftSystem:GetGift(nType,dwSerial)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local myProf = objPlayer:GetInfo().dwProf
	local GiftType = ''
	local PackGiftID = dwSerial
	if nType == GiftConfig.enumGiftType.OnlineTime then
		if self.dwTimeGiftSeq + 1 == dwSerial and self.dwTimeRemain == 0 then
			GiftType = 'OnLineGift'
		else
			return	
		end
	elseif nType == GiftConfig.enumGiftType.Level then
		if self.dwLevelGiftSeq + 1 == dwSerial and objPlayer:GetInfo().dwLevel >= GiftConfig.LevelGift[dwSerial].Level then
			GiftType = 'LevelGift'
		else
			return	
		end
	elseif nType == GiftConfig.enumGiftType.Pack then
		GiftType = 'OtherGift'
		if objItemSys:IsItemLocked(PackGiftID) then
			return;
		end
		if objItemSys:GetItem(dwSerial) then
			dwSerial = objItemSys:GetItem(dwSerial):GetEnumID();
		else
			return
		end
	end
	local setAddList = {};
	for k,v in pairs (GiftConfig[GiftType][dwSerial].ItemList) do
		local tempTable = {
			dwItemEnum		= v.dwItemEnum;
			dwItemNumber	= v.dwItemNum;
			dwBindType		= v.dwBindType;
		};
		table.insert(setAddList, tempTable);
	end
	for k,v in pairs (GiftConfig[GiftType][dwSerial].EquipList) do
		local tempTable = {
			dwItemEnum		= GiftConfig.PropConfig[v.dwPropEnum].ProfEquipEnum[myProf];
			dwItemNumber	= 1;
			dwBindType		= v.dwBindType;
			dwStrongLevel	= GiftConfig.PropConfig[v.dwPropEnum].dwStrongEnum;
			setProperty		= GiftConfig.PropConfig[v.dwPropEnum].PropList;
		};
		table.insert(setAddList, tempTable);
	end
	if objItemSys:IsEnumItemListCanAddToPacket(setAddList) then
		if nType == GiftConfig.enumGiftType.Pack then
			local objItem = objItemSys:GetItem(PackGiftID);
			if objItem and objItem:IsAlive() then
				objItemSys:DelObjItem(PackGiftID, _G.ItemSysOperType.Used)
			else
				return
			end
		end
		objItemSys:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.Present)
		if nType == GiftConfig.enumGiftType.OnlineTime then
			self.dwTimeGiftSeq  = dwSerial
			if GiftConfig[GiftType][self.dwTimeGiftSeq + 1] then
				self.dwTimeRemain  = GiftConfig[GiftType][self.dwTimeGiftSeq + 1].Time
			end
		elseif nType == GiftConfig.enumGiftType.Level then
			self.dwLevelGiftSeq = dwSerial
		end
		local addbindgold = GiftConfig[GiftType][dwSerial].dwBindGold or 0;
		if addbindgold ~= 0 then
			objItemSys:AddBindGold(addbindgold, _G.ItemSysOperType.Present)
		end;
		self:UpdateInfoToClient(objPlayer)
		objPlayer.CltDecodeMsg{Param = {GiftConfig.enumGiftType.Success,dwSerial}}
		if GiftConfig.OtherGift[dwSerial] then
			if GiftConfig.OtherGift[dwSerial].NoticeText then
				CGameApp.ServGiftUniCastMsg{Type = GiftConfig.enumGiftType.UniCast,GiftID = dwSerial,RoleName = objPlayer:GetName(),RoleID = objPlayer:GetRoleID()}
			end
		end
	else
		objPlayer.CltDecodeMsg{Param = {GiftConfig.enumGiftType.NoPack,dwSerial}}
	end
end
--更新信息到客户端
function CGiftSystem:UpdateInfoToClient(objPlayer)
	local sInfo = {};
	sInfo[1] = self.dwLevelGiftSeq;
	sInfo[2] = self.dwTimeGiftSeq;
	sInfo[3] = self.dwTimeRemain;
	objPlayer.CltFlushGiftInfoMsg{ SInfo = sInfo }
	self.objDBQuery:SaveInfo()
end;

--礼包数据库类
_G.CGiftDBOper = {};
function CGiftDBOper:new(objDB,objUser)
    local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CGiftDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CGiftDBOper:SaveInfo()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CGiftDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CGiftDBOper");
		return false;
	end;
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CGiftDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CGiftDBOper");
		return false;
	end;
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Gift');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwLevelGiftSeq = self.objUser.dwLevelGiftSeq;
	SqlCmd.Fields.dwTimeGiftSeq = self.objUser.dwTimeGiftSeq;
	SqlCmd.Fields.dwTimeRemain = self.objUser.dwTimeRemain;
	SqlCmd:execute()
	return true;
end
function CGiftDBOper:AddInfo(dwRoleID)
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_Gift');
	SqlCmd.Fields.dwRoleID				= dwRoleID;	
	SqlCmd.Fields.dwLevelGiftSeq			= 0;		
	SqlCmd.Fields.dwTimeGiftSeq				= 0;		
	SqlCmd.Fields.dwTimeRemain				= 0;		
	SqlCmd:execute()
	return true;
end

----------------------------------------------------------