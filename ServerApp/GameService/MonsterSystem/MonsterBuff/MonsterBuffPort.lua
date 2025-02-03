--添加属性
--tbAttr：属性table
--dwBuffID
function CMonsterBuffSystem:ExecAddBuffEffect(tbAttr, dwBuffID)	
	local objMon = self:GetMon()
	local sysMonSkill = objMon:GetSystem("CMonsterSkillSystem")
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(tbAttr);
	
	sysMonSkill:NotifyBuffUpdate(dwBuffID,usedInfo)
end;

--添加百分比属性
--tbAttr：属性table
--dwBuffID
function CMonsterBuffSystem:ExecAddBuffPercent(tbAttr, dwBuffID)	
	local objMon = self:GetMon()
	local sysMonSkill = objMon:GetSystem("CMonsterSkillSystem")
	
	local usedInfo = SSingleAttrChange:new();
	usedInfo:Copy(tbAttr);
	
	sysMonSkill:NotifyBuffUpdate(dwBuffID,usedInfo,true)
end;

--删除buff的时候调用，删除buff添加的属性
function CMonsterBuffSystem:ExecDelBuffEffect(dwBuffID)
	local objMon = self:GetMon()
	local sysMonSkill = objMon:GetSystem("CMonsterSkillSystem")
	sysMonSkill:NotifyBuffUpdate(dwBuffID,nil,true)
	sysMonSkill:NotifyBuffUpdate(dwBuffID,nil)
end;

--修改HP，返回本次修改的值
--dwType,dwID：修改他HP的对象
function CMonsterBuffSystem:ChangeHp(dwValue,dwType,dwID)
	local objMon = self:GetMon()
	--lw:在buff处也最monster的最大伤害做判断
	if dwValue < 0 then
		if objMon.DataInfo.fixed_value and (objMon.DataInfo.fixed_value ~= 0) then
			dwValue = -objMon.DataInfo.fixed_value;
		end
	end
	
	local sysMonSkill = objMon:GetSystem("CMonsterSkillSystem")
	return sysMonSkill:ChgHP(dwValue,isCrit,dwType,dwID)
end;

--修改MP，返回本次修改的值
--dwType,dwID：修改他MP的对象
function CMonsterBuffSystem:ChangeMp(dwValue,dwType,dwID)
	local objMon = self:GetMon()
	local sysMonSkill = objMon:GetSystem("CMonsterSkillSystem")
	return sysMonSkill:ChgMP(dwValue,isCrit,dwType,dwID)
end;

--获得怪物的属性
function CMonsterBuffSystem:GetBattleInfo()
	local objMon = self:GetMon()
	local sysMonSkill = objMon:GetSystem("CMonsterSkillSystem")
	return sysMonSkill:GetInfo()
end;

--死亡判断
function CMonsterBuffSystem:IsDead()
	local objMon = self:GetMon()
	return objMon:IsDead()
end;

function CMonsterBuffSystem:GetOtherPlayer(dwRoleID)
	local objMon = self:GetMon();
	return objMon:GetMap():GetPlayerByRoleID(dwRoleID);
end;
