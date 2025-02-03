﻿--风流倜傥帅小伙称号卡
local dwItemId = 5809508
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	
	local objPlayer = objItemSys:GetPlayer();
	--判断是否符合当前职业  萝莉：1 刀：2  剑：3 枪：4 
	local ZhiYe =  objPlayer:GetInfo().dwProf
	if ZhiYe~=3 then
		return 4000110059
	end
	--判断技能系统是否开放
	local sysScript = objPlayer:GetSystem("CScriptSystem")		
	local Imp = sysScript:HasAuthority("Skill")	
	if not Imp then
		return 5000240029
	end 
	
	--帅小伙的技能判断
	local objSklSys = objPlayer:GetSystem("CSkillSystem");
	local SkillLevel = objSklSys:GetSkillLevel(21005)	
	if SkillLevel <=0 then
		return 5000250002
	end
	--家称号
	if objPlayer then
		local CTitleSystem = objPlayer:GetSystem("CTitleSystem")
		if not CTitleSystem then
			return
		end
		CTitleSystem:AddTitle(10103)		
		objPlayer:GetSystem('CBuffSystem'):AddBuff(10037);
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 