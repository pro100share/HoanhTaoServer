--2012.3.12
--作者：段磊磊
--VIP系统
_G.CVipSystem = {}
function CVipSystem:new()
	local obj = CSystem:new("CVipSystem");
	--VIP剩余时间
	obj.dwTimeLast = 0;
	--VIP剩余传送次数
	obj.dwTransportNum = 0;
	--VIP系统关联
	obj.setSystem = {}
	--是否领取物品
	obj.dwGetItem = 0;
	--时间戳
	obj.dwTimeStamp = 0;
	for i,v in pairs(CVipSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CVipSystem:AddSys(objSystem)
	self.setSystem[objSystem.szName] = objSystem
end
function CVipSystem:ChangeState(bState)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	for k,System in pairs (self.setSystem) do
		System:OnVipChange(bState)
	end

	local mapSystem = objPlayer:GetSystem("CMapSystem")
	local state = -1
	if bState == false then
		state = 0
		local buffSys = objPlayer:GetSystem('CBuffSystem')
		buffSys:DeleteBuffByID(VipConfig.VipBuffId)
	elseif bState == true then
		state = 1
	end
	self:CountAttribute()
	local dwRoleID = objPlayer:GetRoleID()
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	local szRoleName = mapSystem:GetRoleByID(dwRoleID):GetInfo().szRoleName
	local info = {dwRoleID}
	objPlayer.CltDecodeVipMsg{Type = state,RoleID = info};
end
function CVipSystem:UniCast(dwType,dwRoleID,szRoleName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local info = {dwRoleID,szRoleName};
	objPlayer.CltDecodeVipMsg{Type = dwType,Info = info};
end
function CVipSystem:Create(bIsChangeLine)
    -- 创建数据库对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CVipDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	-- 从数据库获取vip相关信息
	local tabDataList = {}
	tabDataList = objPlayer:GetLineData("CVipSystem")
	if tabDataList[1][1] then
		if bIsChangeLine == 1 then
		--if bIsChangeLine then
			self.dwTimeLast = tabDataList[1][1]
		elseif bIsChangeLine == 0 then
			self.dwTimeLast = tabDataList[1][1] - (GetCurTime()-objPlayer:GetInfo().tmDownlineTime) or 0
			_info("CVipSystem::self.dwTimeLast",self.dwTimeLast,objPlayer:GetInfo().tmDownlineTime,tabDataList[1][1],GetCurTime())
		end
		if self.dwTimeLast < 0 then self.dwTimeLast = 0 end
		self.dwTransportNum = tabDataList[1][2] or 0
		self.dwGetItem = tabDataList[1][3] or 0
	end

	if self.dwTimeLast >0 then
		local buffSys = objPlayer:GetSystem('CBuffSystem')
		buffSys:AddBuff(VipConfig.VipBuffId,1,nil)
	end
	self:CountAttribute()
	
	if bIsChangeLine == 0 then
		if not CTimeFormat:isTodayEx(objPlayer:GetInfo().tmDownlineTime/1000) then
			self.dwGetItem = 0
            _info("[VipSystem] Reset(" .. objPlayer:GetAccountID() .. ")");
		end
	end
	return true;
end

function CVipSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	t[1] = self.dwTimeLast;
	t[2] = self.dwTransportNum;
	t[3] = self.dwGetItem;
	objPlayer:SetLineData("CVipSystem",t);
end
function CVipSystem:Update(dwInterval)
	if not self:isVip() then
		return
	end
	local tempTime  = self.dwTimeLast
	tempTime = tempTime - dwInterval;
	if tempTime <= 0 then
		_info("CVipSystem::dwTimeLastdwTimeLast==0 dwRoleID",self:GetPlayer():GetRoleID())
		self.dwTimeLast = 0
		self:ChangeState(false)
		self:DrawPic()
	else
		self.dwTimeLast = tempTime
	end
	
	
	return true
end
function CVipSystem:ResetInfo()
	self.dwGetItem = 0
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self:UpdateInfoToClient(objPlayer,1)
    _info("[VipSystem] Reset(" .. objPlayer:GetAccountID() .. ")");
end
function CVipSystem:Destroy()
	if self.objDBQuery then
		self.objDBQuery:SaveInfo()
	end;
end;

function CVipSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self:UpdateInfoToClient(objPlayer,1)
	self:DrawPic()
end;

--更新信息到客户端
function CVipSystem:UpdateInfoToClient(objPlayer,nFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sInfo = {};
	sInfo[1] = self.dwTimeLast;
	sInfo[2] = self.dwTransportNum;
	sInfo[3] = self.dwGetItem;

	objPlayer.CltFlushVipInfoMsg{ SInfo = sInfo ,Flag = nFlag}
	self.objDBQuery:SaveInfo()
end;
--判断是否是Vip
function CVipSystem:isVip()
	if self.dwTimeLast > 0 then
		return true
	else
		return false
	end
end
function CVipSystem:IsVip()
	if self.dwTimeLast > 0 then
		return true
	else
		return false
	end
end
function CVipSystem:DecodeMsg(Type)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if self:IsVip() == false then
		return
	end
	if self.dwGetItem == 1 then
		return
	end
	local objItemSys = objPlayer:GetSystem('CItemSystem')
	local GiftInfo = VipConfig.VipItemList
	local addItemList = {};
	for k,v in ipairs (GiftInfo) do
		local tempTable = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwItemNumber;
			dwBindType	= v.dwBindType;
		};
		table.insert(addItemList, tempTable);
	end
	local info = {}
	if objItemSys:IsEnumItemListCanAddToPacket(addItemList) then
		objItemSys:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.VipReward)
		
		self.dwGetItem = 1
		objPlayer.CltDecodeVipMsg{Type = VipMsgConfig.GetItemSure,Info = info}
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventGetVipGift)
		self.objDBQuery:SaveInfo();
	else
		objPlayer.CltDecodeVipMsg{Type = VipMsgConfig.GetItemNoPack,Info = info}
		--no pack
	end
end
function CVipSystem:GetTransNum()
	return self.dwTransportNum
end
function CVipSystem:ChangeTransNum(dwValue)
	self.dwTransportNum = self.dwTransportNum + dwValue
	self:UpdateInfoToClient(objPlayer,2)
end
function CVipSystem:CountAttribute()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local sklSystem = objPlayer:GetSystem("CSkillSystem")
	local fightInfo = SSingleAttrChange:new()
	if self:isVip() then 
		for k,v in pairs (VipConfig.Attri) do
			fightInfo[k] = v
		end
		sklSystem:NotifyVipUpdate(fightInfo,false)
	end
end
--增加Vip时间
function CVipSystem:UseCard(dwItemEnum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local index = 0
	for k,v in pairs (VipConfig.VipCard) do
		if v.dwItemEnum == dwItemEnum then
			index = k
			break
		end
	end
	local tmpTime = self.dwTimeLast
	self.dwTimeLast = self.dwTimeLast + VipConfig.VipCard[index].dwTime
	self.dwTransportNum = self.dwTransportNum + VipConfig.VipCard[index].dwTransNum
	self:UpdateInfoToClient(objPlayer,2)
	local eventSys = objPlayer:GetSystem('CPlayerEventCenterSystem')
	eventSys:DoEvent(enumPlayerEventType.EventVipLastTime,1,math.floor(self.dwTimeLast/(1000*60*60*24)));
	if tmpTime == 0 then
		local buffSys = objPlayer:GetSystem('CBuffSystem')
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventVip)
		buffSys:AddBuff(VipConfig.VipBuffId,1,nil)
		self:ChangeState(true)
		local info = {}
		objPlayer.CltDecodeVipMsg{Type = VipMsgConfig.BeVip,Info = info}
		
		CGameApp.ServVipUniCastMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName()};
	end
	self.objDBQuery:SaveInfo();
end
--绘制VIP图案
function CVipSystem:DrawPic()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--礼包数据库类
_G.CVipDBOper = {};
function CVipDBOper:new(objDB,objUser)
    local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CVipDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CVipDBOper:SaveInfo()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CVipDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CVipDBOper");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CVipDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CVipDBOper");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Vip');
	
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	_info("CVipSystem::self.objUser.dwTimeLast",self.objUser.dwTimeLast,dwRoleID)
	SqlCmd.Fields.dwTimeLast = self.objUser.dwTimeLast;
	SqlCmd.Fields.dwTransportNum = self.objUser.dwTransportNum;
	SqlCmd.Fields.dwGetItem = self.objUser.dwGetItem;
	
	SqlCmd:execute()
	return true;
end
function CVipDBOper:AddInfo(dwRoleID)
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_Vip');

	SqlCmd.Fields.dwRoleID				= dwRoleID;	
	
	SqlCmd.Fields.dwTimeLast			= 0;		
	SqlCmd.Fields.dwTransportNum		= 0;		
	SqlCmd.Fields.dwGetItem				= 0;		
	
	SqlCmd:execute()
	return true;
end

----------------------------------------------------------
