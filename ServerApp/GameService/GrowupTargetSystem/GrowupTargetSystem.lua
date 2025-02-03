--2012.3.19
--作者：段磊磊
--成长目标系统,从玩家事件中心读取数据，
_G.CGrowupTargetSystem = {}
function CGrowupTargetSystem:new()
	local obj = CSystem:new("CGrowupTargetSystem");
	
	obj.setCanGet = {}
	obj.setHasGet = {}

	for i,v in pairs(CGrowupTargetSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	obj.setEvent = 
	{
		[enumPlayerEventType.EventLevelUp]		 = 'dwLevel',		--等级
		[enumPlayerEventType.EventElementUp]	= 'dwElemLv',		 --五行升级
		[enumPlayerEventType.EventDantianUp]	= 'dwDantianLv',	 --丹田升级
		[enumPlayerEventType.EventSkillUp]		= 'dwSkillLv',		 --技能升级
		[enumPlayerEventType.EventPulseUp]		= 'dwPulseLv',		 --经脉升级
		[enumPlayerEventType.EventElemCombo]    = 'dwElemComboLv',	 --五行套装
		[enumPlayerEventType.EventBournUp] 		= 'dwBournLv',		 --境界升级
		[enumPlayerEventType.EventUpgradeAmulet] 		= 'dwAmuletLv',		 --护身宝甲
		[enumPlayerEventType.EventMountUpGrade] 		= 'dwMountLv',		 --坐骑等级
		[enumPlayerEventType.EventUpSword] 		= 'dwSwordLv',		 --宝剑
		[enumPlayerEventType.EventTotalStrong] 		= 'dwStrongLv',		 --强化
	}
	return obj;
end;


function CGrowupTargetSystem:Create()
    -- 创建数据库对象
	--LoadGrowupTargetConfig()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CGrowupTargetDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	local tabDataList = objPlayer:GetLineData("CGrowupTargetSystem")
	if tabDataList and tabDataList[1][1][1] then
		self.setCanGet = tabDataList[1][1]
		self.setHasGet = tabDataList[1][2]
		self.SDataInfo = tabDataList[1][3]
	end
	--初始化剩余目标列表
	self.StepTargetList = {}
	for k,v in pairs (GrowupTargetConfig) do
		if not self.setCanGet[k] then self.setCanGet[k] = {} end
		if not self.setHasGet[k] then self.setHasGet[k] = {} end
		self.StepTargetList[k] = {}
		for k1,v1 in pairs(v.TargetList) do
			self.StepTargetList[k][k1] = 1
		end
		if self.setCanGet[k][k1] or self.setHasGet[k][k1] then
			self.StepTargetList[k][k1] = nil
		end
	end
	self:InitKeyEvent();
	return true;
end
function CGrowupTargetSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local t = {}
	t[1] = self.setCanGet;
	t[2] = self.setHasGet;
	t[3] = self.SDataInfo;
	objPlayer:SetLineData("CGrowupTargetSystem",t);
end
function CGrowupTargetSystem:Update(dwInterval)	
	return true
end

function CGrowupTargetSystem:Destroy()
	-- if self.objDBQuery then
		-- for i = 1,10 do
			-- self.objDBQuery:SaveInfo(i,i)
		-- end
	-- end;
end;

function CGrowupTargetSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self:UpdateInfoToClient(objPlayer)
end;
--
function CGrowupTargetSystem:DecodeMsg(StepID,TargetID)
	if self.setCanGet[StepID][TargetID] then
		self:Transfer(StepID,TargetID)
		return true
	end
--	_info('can`t get')
	return false
end
--更新信息到客户端
function CGrowupTargetSystem:UpdateInfoToClient(objPlayer)
	local sInfo = {};
	sInfo.setCanGet = self.setCanGet;
	sInfo.setHasGet = self.setHasGet;

	objPlayer.CltFlushGrowupTargetInfoMsg{ SInfo = sInfo }
end;
-------插入一个成长目标
function CGrowupTargetSystem:Insert(step,target)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self.setCanGet[step][target] = target
	local tempInfo = {Step = step,Target = target}
	objPlayer.CltGrowupTargetMsg{Type = GrowupTargetMsgConfig.Insert,Info = tempInfo}
	local tempNum = 0
	for k,v in pairs (self.setCanGet[step]) do
		tempNum = tempNum + 1
	end
	for k,v in pairs (self.setHasGet[step]) do
		tempNum = tempNum + 1
	end
	if tempNum == #GrowupTargetConfig[step].TargetList then
		local tempInfo = {Step = step,Target = objPlayer:GetInfo().szRoleName,RoleID = objPlayer:GetRoleID()}
		CGameApp.ServTargetUniCastMsg{Info = tempInfo};
	end
	if tempNum == 1 then
		self.objDBQuery:InsertInfo(step)
	end
	self.objDBQuery:SaveInfo(step,nil)
	return true
end
function CGrowupTargetSystem:UniCast(tempInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	objPlayer.CltGrowupTargetMsg{Type = GrowupTargetMsgConfig.PlayerCompleteOneStep,Info = tempInfo}
end
------玩家事件中心分发出来的事件
function CGrowupTargetSystem:OnEventCenter(dwEventID,dwValue,...)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if not self.setEvent[dwEventID] then
		return ;
	end;
	local args={...};
	local ArrayConfig = self.KeyEvent[dwEventID]
	if ArrayConfig then
		for k,v in pairs (ArrayConfig) do
			self:OnEvent(dwEventID,v,unpack(args));
		end;
	end
end
------生成事件ID为KEY的事件的列表
function CGrowupTargetSystem:InitKeyEvent()
	self.KeyEvent = {}
	for k,v in pairs (self.StepTargetList) do
		for k1,v1 in pairs (v) do
			local key = GrowupTargetConfig[k].TargetList[k1].EventType
			if not self.KeyEvent[key] then
				self.KeyEvent[key] = {}
			end
			table.insert(self.KeyEvent[key],GrowupTargetConfig[k].TargetList[k1]);
		end
	end
end
-----事件回调处理
function CGrowupTargetSystem:OnEvent(dwEventID,info,hParam,lParam)
	--print(dwEventID,hParam,lParam)
	if hParam then
		if hParam < info.LimitValue then
			return
		else
			if self.setCanGet[info.StepID][info.TargetID] or self.setHasGet[info.StepID][info.TargetID] then return end
			self:Insert(info.StepID,info.TargetID)
		end
	end
end
function CGrowupTargetSystem:Transfer(StepIndex,TargetIndex)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if self.setCanGet[StepIndex][TargetIndex] then	
		if self.setHasGet[StepIndex][TargetIndex] then return end
		local objItemSys = objPlayer:GetSystem('CItemSystem');
		local targetInfo = GrowupTargetConfig[StepIndex].TargetList[TargetIndex];
		local setAddList = {};
		for k,v in pairs (targetInfo.GiftList) do
			local tempTabel = {
				dwItemEnum	= v.ItemID;
				dwItemNumber= v.ItemNum;
				dwBindType	= v.dwBindType;
			};
			table.insert(setAddList, tempTabel);
		end
		if objItemSys:IsEnumItemListCanAddToPacket(setAddList) then
			
			objItemSys:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.GrowUpReward)
			
			if targetInfo.Money ~= 0 then
				objItemSys:AddPacketMoney( targetInfo.Money, _G.ItemSysOperType.GrowUpReward);
			end
			if targetInfo.Gold ~= 0  then
				objItemSys:AddBindGold( targetInfo.Gold, _G.ItemSysOperType.GrowUpReward)
			end
			if targetInfo.Exp ~= 0  then
				objPlayer:AddExp(targetInfo.Exp)
			end
			if targetInfo.Zhenqi ~= 0  then
				local objElemSys = objPlayer:GetSystem('CFiveElemSystem')
				objElemSys:ChangeAttrAll(targetInfo.Zhenqi, _G.FiveElemSysOperType.GrowUp)
			end
			self.setCanGet[StepIndex][TargetIndex] = nil
			self.setHasGet[StepIndex][TargetIndex] = TargetIndex
			local tempInfo = {Step = StepIndex,Target = TargetIndex}
			objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventGetTargetGift)
			objPlayer.CltGrowupTargetMsg{Type = GrowupTargetMsgConfig.Transfer,Info = tempInfo}
			self.objDBQuery:SaveInfo(StepIndex,StepIndex)
			return
		else
			local tempInfo = {Step = StepIndex,Target = TargetIndex}
			objPlayer.CltGrowupTargetMsg{Type = GrowupTargetMsgConfig.NoPack,Info = tempInfo}
			return
		end
	end
end
function CGrowupTargetSystem:EventLevelUp(dwValue,dwLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local tempInfo = {Step = dwValue,Target = dwLevel}
	objPlayer.CltGrowupTargetMsg{Type = GrowupTargetMsgConfig.LevelUpOne,Info = tempInfo}
	if dwLevel >= GrowupTargetParamConfig.dwLimitLv then
		objPlayer.CltGrowupTargetMsg{Type = GrowupTargetMsgConfig.LevelUp,Info = tempInfo}
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--成长目标数据库类
_G.CGrowupTargetDBOper = {};
function CGrowupTargetDBOper:new(objDB,objUser)
    local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CGrowupTargetDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--将类似“1#23#345#”的字符串转换为value为1,23,345的table
function CGrowupTargetDBOper:GetFormat(szStr)
	local t = {};
	if szStr == 0 or szStr == '0' then
		return t
	end
	if szStr == nil or szStr == '' then
		return t;
	end
	local h,e;
	local tempStr = szStr;
	local paramStr;
	while true do
		h,e = string.find(tempStr,'&');
		if not h then
			break;
		end
		paramStr = string.sub(tempStr,1,h-1);
		local enum = tonumber(paramStr)
		t[enum] = enum
		tempStr = string.sub(tempStr,h+1,-1);
	end

	return t;
end
--将类似value为1,23,345的table转换为“1#23#345#”的字符串
function CGrowupTargetDBOper:SetFormat(T)
	local t = Table:DeepCopy(T)
	if t == 0 or t == nil then
		return ''
	end
	local str = '';
	local tempParam = '';
	for k,v in pairs (t) do
		str = str..v..'&'
	end
	return str;
end

function CGrowupTargetDBOper:InsertInfo(dwStep)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CGrowupTargetDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CGrowupTargetDBOper");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CGrowupTargetDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CGrowupTargetDBOper");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_GrowupTarget');	
	SqlCmd.Fields.dwRoleID	= dwRoleID;	
	SqlCmd.Fields.dwIndex	= dwStep;	
	SqlCmd.Fields['setCanGet'] = CGrowupTargetDBOper:SetFormat(self.objUser.setCanGet[dwStep])
	SqlCmd.Fields['setHasGet'] = CGrowupTargetDBOper:SetFormat(self.objUser.setHasGet[dwStep])
	SqlCmd:execute()
	return true;
end
function CGrowupTargetDBOper:SaveInfo(dwCan,dwGet)

	if not self.objDBQuery then
		_info("self.objDBQuery is null by CGrowupTargetDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CGrowupTargetDBOper");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CGrowupTargetDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CGrowupTargetDBOper");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_GrowupTarget');	
	SqlCmd.Wheres.dwRoleID = dwRoleID
	
	local t = 1
	if dwCan then
		t = 2
		SqlCmd.Wheres.dwIndex = dwCan
		SqlCmd.Fields['setCanGet'] = CGrowupTargetDBOper:SetFormat(self.objUser.setCanGet[dwCan])
	end
	if dwGet then
		t = 2
		SqlCmd.Wheres.dwIndex = dwGet
		SqlCmd.Fields['setHasGet'] = CGrowupTargetDBOper:SetFormat(self.objUser.setHasGet[dwGet])
	end
	if t == 2 then
		SqlCmd:execute()
	end
	return true;
end
----------------------------------------------------------