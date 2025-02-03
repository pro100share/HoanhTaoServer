------------------被求婚流程-------------------
--检测被求婚条件
function CMarriageSystem:BeCheckProposeCondition(fromRoleID, fromIsMale)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BeCheckProposeCondition");
		return;
	end;
	local selfInfo = {
		RoleID 		= objPlayer:GetRoleID();
	};
    --检测目标玩家是否有结婚权限
	if not self:HasAuthority("Marry") then
		self:SendCheckProposeConditionResult(fromRoleID, selfInfo, _G.MarriageError.eTargetNotHaveAuthority);
		return;
	end;
	--检测目标玩家是否已婚
	if self:IsMarried() or self.IsMarring then
		self:SendCheckProposeConditionResult(fromRoleID, selfInfo, _G.MarriageError.eTargetMarried);
		return;
	end;
	--检测目标玩家是否设置拒绝求婚
	local SettingSys = objPlayer:GetSystem("CSettingSystem");
	if SettingSys then
		if not SettingSys:CanReceiveProposalInvite() then
			self:SendCheckProposeConditionResult(fromRoleID, selfInfo, _G.MarriageError.eProposeAutoRefused);
			return;
		end;
	end;
	--检测玩家性别
	if self.bIsMale == fromIsMale then
		self:SendCheckProposeConditionResult(fromRoleID, selfInfo, _G.MarriageError.eSameSex);
		return;
	end;
	--得到目标玩家信息，用于客户端显示
	local pInfo = objPlayer:GetInfo();
	selfInfo.RoleName 	= pInfo.szRoleName;
	selfInfo.RoleLevel 	= pInfo.dwLevel;
	selfInfo.RoleIcon 	= objPlayer:GetIncoID();
	selfInfo.RoleProf 	= pInfo.dwProf;
	local guild = objPlayer:GetSystem("CGuildSystem");
	if guild then
		selfInfo.RoleGuildName = guild:GetGuildName();
	end;
	self:SendCheckProposeConditionResult(fromRoleID, selfInfo, 0);
end;

--发送检测结果
function CMarriageSystem:SendCheckProposeConditionResult(fromRoleID, selfInfo, reason)
	_G.GSRemoteCall(fromRoleID, "CMarriageSystem", "CheckProposeConditionResult", {selfInfo, reason}, nil);
end;

--被求婚
function CMarriageSystem:BeProposeTo(fromInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BeProposeTo");
		return;
	end;
    --检测是否有结婚权限
	if not self:HasAuthority("Marry") then
		self:SendProposeToResult(fromInfo.RoleID, false, _G.MarriageError.eTargetNotHaveAuthority);
		return;
	end;
	--是否已婚
	if self:IsMarried() or self.IsMarring then
		self:SendProposeToResult(fromInfo.RoleID, false, _G.MarriageError.eTargetMarried);
		return;
	end;
	--检测目标玩家是否设置拒绝求婚
	local SettingSys = objPlayer:GetSystem("CSettingSystem");
	if SettingSys then
		if not SettingSys:CanReceiveProposalInvite() then
			self:SendProposeToResult(fromInfo.RoleID, false, _G.MarriageError.eProposeAutoRefused);
			return;
		end;
	end;
	--检测目标玩家性别
	if self.bIsMale == fromInfo.RoleIsMale then
		self:SendProposeToResult(fromInfo.RoleID, false, _G.MarriageError.eSameSex);
		return;
	end
	--记录被谁用何种信物求婚，用来接受求婚时得到一半结婚信物
	self.BeProposeToList[fromInfo.RoleID] = fromInfo.marriageKeepsakeEnumID;
	objPlayer.MarSys_BeProposeToMsg{FromInfo = fromInfo};
end;

--发送被求婚结果
function CMarriageSystem:SendProposeToResult(fromRoleID, isSuc, reason, selfName)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:SendProposeToResult");
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CMarriageSystem", "ProposeToResult", {objPlayer:GetRoleID(), isSuc, reason, selfName}, nil);
end;

----接受求婚
function CMarriageSystem:AcceptPropose(fromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:AcceptPropose");
		return;
	end;
    
	--如果已婚或订婚中不可以接受求婚
	if self:IsMarried() or self.IsMarring then
		objPlayer.MarSys_AcceptResultMsg{FromRoleID = fromRoleID, Reason = _G.MarriageError.eSelfMarried};
		return;
	end;
    --如果不在被求婚列表中，返回
	if not self.BeProposeToList[fromRoleID] then return end;
	--检测求婚方是否能查找到
	local cbk = function(_, result, _)
		if result == -1 then
			self.IsMarring = nil;
			self.BeProposeToList[fromRoleID] = nil;
			objPlayer.MarSys_AcceptResultMsg{FromRoleID = fromRoleID, Reason = _G.MarriageError.eCannotFindTarget};
		end;
	end;
	local toRoleInfo = {};
	toRoleInfo.RoleID = objPlayer:GetRoleID();
	toRoleInfo.RoleName = objPlayer:GetInfo().szRoleName;
	--订婚
	self.IsMarring = true;
	_G.GSRemoteCall(fromRoleID, "CMarriageSystem", "ProposeAccepted", {toRoleInfo}, cbk);
end;

--接受求婚结果
function CMarriageSystem:AcceptProposeResult(fromInfo, isSuc, reason)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:AcceptProposeResult");
		return;
	end;
	if isSuc then
        --结婚信物ID
		local itemEnumID = 0;
		--------
		--日志用
		local dwBridegroomID, dwBrideID;
		local dwTokenID = self.BeProposeToList[fromInfo.RoleID];
		--------
		if self.bIsMale then
			itemEnumID = _G.MarriageConfig["Goods_" .. self.BeProposeToList[fromInfo.RoleID] .. "_After_ItemID1"];
			--------
			--日志用
			dwBridegroomID = objPlayer:GetRoleID();
			dwBrideID = fromInfo.RoleID;
			--------
		else
			itemEnumID = _G.MarriageConfig["Goods_" .. self.BeProposeToList[fromInfo.RoleID] .. "_After_ItemID2"];
			--------
			--日志用
			dwBridegroomID = fromInfo.RoleID;
			dwBrideID = objPlayer:GetRoleID();
			--------
		end;
        self.BeProposeToList[fromInfo.RoleID] = nil;
        self:Marry(fromInfo.RoleID, fromInfo.RoleName, fromInfo.marriedTime, itemEnumID);
        
        --全服广播
		local msgTime = GetCurTime();
        if self.bIsMale then
			objPlayer.MarSys_AcceptResultMsg{FromRoleID = self.MateRoleID, Reason = _G.MarriageError.eAcceptProposeMale, FromRoleName = self.MateName};
            CGameApp.MarSys_BroadCastCongratulationMsg{
                HusbandName     = objPlayer:GetInfo().szRoleName,
                WifeName        = self.MateName,
                HusbandRoleID   = objPlayer:GetRoleID(),
                WifeRoleID      = self.MateRoleID,
                MsgTime         = msgTime
            };
		else
			objPlayer.MarSys_AcceptResultMsg{FromRoleID = self.MateRoleID, Reason = _G.MarriageError.eAcceptProposeFemale, FromRoleName = self.MateName};
            CGameApp.MarSys_BroadCastCongratulationMsg{
                HusbandName     = self.MateName,
                WifeName        = objPlayer:GetInfo().szRoleName,
                HusbandRoleID   = self.MateRoleID,
                WifeRoleID      = objPlayer:GetRoleID(),
                MsgTime         = msgTime
            };
		end;
        --检测亲密度增加条件
        self:CheckLoveAddCond();
		--日志记录
		CLogSystemManager:marriage(dwBridegroomID, dwBrideID, dwTokenID, 0, 1, 0, 0, 1, 0);
	else
		self.IsMarring = nil;
		self.BeProposeToList[fromInfo.RoleID] = nil;
		objPlayer.MarSys_AcceptResultMsg{FromRoleID = fromInfo.RoleID, Reason = reason};
	end;
end;

----拒绝求婚
function CMarriageSystem:RefusePropose(fromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:RefusePropose");
		return;
	end;
	--清除求婚信物记录
	if self.BeProposeToList[fromRoleID] then
		self.BeProposeToList[fromRoleID] = nil;
		_G.GSRemoteCall(fromRoleID, "CMarriageSystem", "ProposeRefused", {objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName}, nil);
	end;
end;



