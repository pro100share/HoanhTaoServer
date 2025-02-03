local function EncodeStr(t)
	local str = "";
	for k, v in pairs(t) do
		if v > 0 then
			str = str .. k .. "," .. v .. ";";
		end;
	end;
	return str;
end;
-------------------------------------------------------------------------------
-- 升级世家技能上限
function CGuildPlayerMsg:UpgradeGuildSkill(skillID)
	-- check
	local dwRoleID = self.dwSrcID;
	local objMember = CGuildMemberMgr:Get(dwRoleID);
	if not objMember then print("--UpgradeGuildSkill--err--1") return end;
	local dwGuildID = objMember.dwGuildID;
	local objGuild = CGuildInfoMgr:Get(dwGuildID);
	if not objGuild then print("--UpgradeGuildSkill--err--2") return end;
	local objGuildSkill = CGuildSkillMgr:Get(dwGuildID);
	if not objGuildSkill then print("--UpgradeGuildSkill--err--3") return end;
	local objResource = CGuildResourceMgr:Get(dwGuildID);
	if not objResource then print("--UpgradeGuildSkill--err--4") return end;
	local dwRank = objMember.dwRank;
	local bFlag = CGuildManager:GetAuthority(dwRank,'Skill');
	if not bFlag then return print("--UpgradeGuildSkill--err--5") end;
	local skill = _G.GuildSkillConfig[skillID];
	if not skill then return print("--UpgradeGuildSkill--err--6") end;
	local cond = skill.GetUpGradeCond_Guild(objGuildSkill.tSkill[skillID] + 1);
	if cond.needLevel > objGuild.dwLevel then print("--UpgradeGuildSkill--err--7") return end;
	if cond.needMoney > objResource.dwMoney then print("--UpgradeGuildSkill--err--8") return end;
	if cond.needTian > objResource.dwItem1 then print("--UpgradeGuildSkill--err--9") return end;
	if cond.needDi > objResource.dwItem2 then print("--UpgradeGuildSkill--err--10") return end;
	if cond.needXuan > objResource.dwItem3 then print("--UpgradeGuildSkill--err--11") return end;
	if cond.needHuang > objResource.dwItem4 then print("--UpgradeGuildSkill--err--12") return end;
	-- execute
	objResource.dwMoney = objResource.dwMoney - cond.needMoney;
	objResource.dwItem1 = objResource.dwItem1 - cond.needTian;
	objResource.dwItem2 = objResource.dwItem2 - cond.needDi;
	objResource.dwItem3 = objResource.dwItem3 - cond.needXuan;
	objResource.dwItem4 = objResource.dwItem4 - cond.needHuang;
	objResource:Update();
	objGuildSkill.tSkill[skillID] = objGuildSkill.tSkill[skillID] + 1;
	objGuildSkill.szSkill = EncodeStr(objGuildSkill.tSkill);
	objGuildSkill:Update();
	-- notice
	self:NotifyGuild(objGuild.dwGuildID,'OnUpgradeGuildSkill',objGuildSkill.tSkill)

    CLogSystemManager:guild(dwRoleID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            9,
            {1, skillID});
end
------------------------------------------------------------------------------
-- 升级玩家技能
function CGuildPlayerMsg:UpgradePlayerSkill(skillID, level)
	-- check
	local dwRoleID = self.dwSrcID;
	local objMember = CGuildMemberMgr:Get(dwRoleID);
	if not objMember then return print("--UpgradePlayerSkill--err--1") end;
	local skill = _G.GuildSkillConfig[skillID];
	if not skill then return print("--UpgradePlayerSkill--err--2") end;
	local cond = skill.GetUpGradeCond_Player(level);
	if cond.needContr > objMember.dwContribute then
		self:NotifyPlayer(dwRoleID, "OnUpgradePlayerSkill", skillID, false);
		return;
	end;
	objMember.dwContribute = objMember.dwContribute - cond.needContr;
	objMember:Update();
	self:NotifyPlayer(dwRoleID, "OnRefreshPlayer", {dwContribute = objMember.dwContribute});
	self:NotifyPlayer(dwRoleID, "OnUpgradePlayerSkill", skillID, true);

	local objGuild = CGuildInfoMgr:Get(objMember.dwGuildID);
    CLogSystemManager:guild(dwRoleID,
            objGuild.dwGuildID,
            objGuild.szGuildName,
            9,
            {2, skillID});
end
------------------------------------------------------------------------------]]
