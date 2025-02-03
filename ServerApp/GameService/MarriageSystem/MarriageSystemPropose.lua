------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------求婚相关-------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------求婚流程-------------------
-------
function CMarriageSystem:Marry(dwMateRoleID, sMateRoleName, dwMarriedTime, dwItemEnum)
    self.Married        = true;
    self.IsMarring      = nil;
    self.MateIsOnline   = true;
    
    self.MateRoleID     = dwMateRoleID;
    self.MateName       = sMateRoleName;
    self.MarriedTime    = dwMarriedTime;
    

    local objPlayer     = self:GetPlayer();
    local selfRoleID    = objPlayer:GetRoleID();
    local selfName      = objPlayer:GetInfo().szRoleName;
    local selfLevel     = objPlayer:GetInfo().dwLevel;
    
	
	--加结婚信物
	local addItemList = {};
	local tempTable = {
		dwItemEnum = dwItemEnum;
		dwItemNumber=1;
		dwBindType = enItemBindType.eYes;
	}
	table.insert(addItemList, tempTable);
	local itemInstID = self.ItemSystem:AddEnumItemListToKeepsake(addItemList, _G.ItemSysOperType.Marriage);
	--直接装备上
	self.ItemSystem:WearKeepsake(itemInstID[1]);
	local ItemInst = self.ItemSystem:GetItem(itemInstID[1]);
	if self.bIsMale then
		self.ItemSystem:SetItemDoodle(itemInstID[1], string.format("%s;%s;%s", selfName, self.MateName, tostring(self.MarriedTime)));
	else
		self.ItemSystem:SetItemDoodle(itemInstID[1], string.format("%s;%s;%s", self.MateName, selfName, tostring(self.MarriedTime)));
	end;

	--加结婚技能
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	if skillSystem then
		--四个被动只学第一个，其他的按等级学
		skillSystem:DoAddSkill(_G.MarriageConfig.Marriage_SkillID1);
		if selfLevel >= _G.MarriageConfig.Marriage_SkillID2_NeedLevel then
			skillSystem:DoAddSkill(_G.MarriageConfig.Marriage_SkillID2);
		end;
		if selfLevel >= _G.MarriageConfig.Marriage_SkillID3_NeedLevel then
			skillSystem:DoAddSkill(_G.MarriageConfig.Marriage_SkillID3);
		end;
		if selfLevel >= _G.MarriageConfig.Marriage_SkillID4_NeedLevel then
			skillSystem:DoAddSkill(_G.MarriageConfig.Marriage_SkillID4);
		end;
		--俩主动
		local level = ItemInst:GetLevel();
		skillSystem:DoAddSkill(_G.MarriageConfig.Goods_SkillID1);
		skillSystem:ChangeSkill(_G.MarriageConfig.Goods_SkillID1, level);
		skillSystem:DoAddSkill(_G.MarriageConfig.Goods_SkillID2);
		skillSystem:ChangeSkill(_G.MarriageConfig.Goods_SkillID2, level);
	end;
	
    --通知事件中心
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventGetMarry, 1);
	
    self:SynMarriageInfo();
	
	--结婚时，拒绝其他所有求婚
	for k, v in pairs(self.BeProposeToList) do
		_G.GSRemoteCall(k, "CMarriageSystem", "ProposeRefused", {objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName}, nil);
	end;
	self.BeProposeToList = {};
	self.ProposeToList = {};
end;


--判断求婚条件
function CMarriageSystem:CheckProposeCondition(toRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:CheckProposeCondition");
		return;
	end;
    --检测求婚权限
    if not self:HasAuthority("Marry") then return end;
	--如果已婚不可以求婚
	if self:IsMarried() or self.IsMarring then return end;
	
	local toInfo = {
		RoleID 		= toRoleID
	};
	--检测是否已经向其求婚
	if self.ProposeToList[toRoleID] then
		self:CheckProposeConditionResult(toInfo, _G.MarriageError.eAlreadyProposeTo);
		return;
	end;
	--检测是否处于被其求婚中
	if self.BeProposeToList[toRoleID] then
		self:CheckProposeConditionResult(toInfo, _G.MarriageError.eAlreadyBePropose);
		return;
	end;
	local cbk = function(_, result, _)
		if result == -1 then
			self:CheckProposeConditionResult(toInfo, _G.MarriageError.eCannotFindTarget);
		end;
	end;
	_G.GSRemoteCall(toRoleID, "CMarriageSystem", "BeCheckProposeCondition", {objPlayer:GetRoleID(), self.bIsMale}, cbk);
end;

--检测结果
function CMarriageSystem:CheckProposeConditionResult(toInfo, reason)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:CheckProposeConditionResult");
		return;
	end;
	objPlayer.MarSys_CheckProposeConditionResultMsg{ToInfo = toInfo, Reason = reason};
end;

--------
--求婚
function CMarriageSystem:ProposeTo(toRoleID, MarriageKeepsakeID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:ProposeTo");
		return;
	end;
    --检测权限
	if not self:HasAuthority("Marry") then return end;
	--如果已婚不可以求婚
	if self:IsMarried() or self.IsMarring then
		self:ProposeToResult(toRoleID, false, _G.MarriageError.eSelfMarried);
		return;
	end;
    --检测是否已经向其求婚
	if self.ProposeToList[toRoleID] then
		return;
	end;
	--检测是否处于被其求婚中
	if self.BeProposeToList[toRoleID] then
		self:ProposeToResult(toRoleID, false, _G.MarriageError.eAlreadyBePropose);
		return;
	end;
	--检测道具并存入求婚列表，用来对方接受求婚后删除道具
	local itemInst = self.ItemSystem:GetItem(MarriageKeepsakeID);
	if not itemInst then return end;
	if itemInst:GetParentType() * 1000 + itemInst:GetChildType() ~= 1060 then return end;
	--得到自己信息，用于给对方客户端显示
	local pInfo = objPlayer:GetInfo();
	local fromInfo = {
		RoleID 		= pInfo.dwRoleID,
		RoleName 	= pInfo.szRoleName,
		RoleLevel 	= pInfo.dwLevel,
		RoleIcon 	= objPlayer:GetIncoID(),
		RoleProf 	= pInfo.dwProf,
        RoleIsMale  = self.bIsMale
	};
	local guild = objPlayer:GetSystem("CGuildSystem");
	if guild then
		fromInfo.RoleGuildName = guild:GetGuildName();
	end;
    fromInfo.marriageKeepsakeEnumID = itemInst:GetEnumID();
	--记录用哪个道具求婚
	self.ProposeToList[toRoleID] = MarriageKeepsakeID;
	local cbk = function(_, result, _)
		if result == -1 then
			self:ProposeToResult(toRoleID, false, _G.MarriageError.eCannotFindTarget);
		end;
	end;
	_G.GSRemoteCall(toRoleID, "CMarriageSystem", "BeProposeTo", {fromInfo}, cbk);
end;

--求婚结果
function CMarriageSystem:ProposeToResult(toRoleID, isSuc, reason, toName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:ProposeToResult");
		return;
	end;
	if not isSuc then
		self.ProposeToList[toRoleID] = nil;
	end;
	objPlayer.MarSys_ProposeToResultMsg{ToRoleID = toRoleID, IsSuc = isSuc, Reason = reason, ToRoleName = toName};
end;

----求婚被接受
function CMarriageSystem:ProposeAccepted(toRoleInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error can not get player by CMarriageSystem:ProposeBeAccept");
		return;
	end;
	----检测自己是否已婚
	if self:IsMarried() or self.IsMarring then
		self:SendAcceptProposeResult(toRoleInfo.RoleID, false, _G.MarriageError.eTargetMarried);
		return;
	end;
    
    local marriedTime = GetCurTime();
    self:SendAcceptProposeResult(toRoleInfo.RoleID, true, nil, marriedTime);
    
	----向ks注册结婚
    if self.bIsMale then
        CKernelApp.MarMgr_MarryRegisterMsg{
            HusbandRoleID = objPlayer:GetRoleID(),
            WifeRoleID  = toRoleInfo.RoleID,
            MarriedTime = marriedTime,
            HusbandName = objPlayer:GetInfo().szRoleName,
            WifeName    = toRoleInfo.RoleName
        };
    else
        CKernelApp.MarMgr_MarryRegisterMsg{
            HusbandRoleID = toRoleInfo.RoleID,
            WifeRoleID  = objPlayer:GetRoleID(),
            MarriedTime = marriedTime,
            HusbandName = toRoleInfo.RoleName,
            WifeName    = objPlayer:GetInfo().szRoleName
        };
    end;
    
    --得到信物id
	local itemInst = self.ItemSystem:GetItem(self.ProposeToList[toRoleInfo.RoleID]);
	local itemEnumID = itemInst:GetEnumID();
	if self.bIsMale then
		itemEnumID = _G.MarriageConfig["Goods_" .. itemEnumID .. "_After_ItemID1"];
	else
		itemEnumID = _G.MarriageConfig["Goods_" .. itemEnumID .. "_After_ItemID2"];
	end;
	--删除求婚信物
	self.ItemSystem:DelObjItem(self.ProposeToList[toRoleInfo.RoleID], _G.ItemSysOperType.Marriage);
    
    self:Marry(toRoleInfo.RoleID, toRoleInfo.RoleName, marriedTime, itemEnumID);
    
    if self.bIsMale then
		self:ProposeToResult(self.MateRoleID, true, _G.MarriageError.eProposeAcceptedMale, self.MateName);
	else
		self:ProposeToResult(self.MateRoleID, true, _G.MarriageError.eProposeAcceptedFemale, self.MateName);
	end;
end;

function CMarriageSystem:SendAcceptProposeResult(toRoleID, isSuc, reason, marriedTime)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:SendAcceptProposeResult");
		return;
	end;
	local selfInfo = {};
	selfInfo.RoleID = objPlayer:GetRoleID();
	selfInfo.RoleName = objPlayer:GetInfo().szRoleName;
	if marriedTime then
		selfInfo.marriedTime = marriedTime;
	end;
	_G.GSRemoteCall(toRoleID, "CMarriageSystem", "AcceptProposeResult", {selfInfo, isSuc, reason}, nil);
end;

----求婚被拒绝
function CMarriageSystem:ProposeRefused(toRoleID, s_ToRoleName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:ProposeBeAccept");
		return;
	end;
	self:ProposeToResult(toRoleID, false, _G.MarriageError.eProposeRefused, s_ToRoleName);
end;



