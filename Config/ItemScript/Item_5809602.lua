--通脉活络散·中
local dwItemId = 5809602
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return 0;
	end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Imp = sysScript:HasAuthority("PractiseSkill")			
	if not Imp then 
		return 13009400201
	end
	
	local cpractiseSkillSystem = objPlayer:GetSystem('CPractiseSkillSystem')
	if not cpractiseSkillSystem then 
		return 0;
	end	
	 
	local buffSys = objPlayer:GetSystem('CBuffSystem')
	if not buffSys then
		return 0;
	end
	
	local CurrLev = cpractiseSkillSystem:GetCurPractiseLevel()
	local MaxLv = #_G.PractiseSkillConfig.LevelConfig
	if CurrLev >= MaxLv then
		return 13009400203;
	end
	
	local buffSelf = buffSys:GetBuffObj(2500100); 
	if buffSelf then
		return 4000110036;
	end
	
	local buffBig = buffSys:GetBuffObj(2500110); 
	if buffBig then
		return 13009400205;
	end	
	
	local buffSmall = buffSys:GetBuffObj(2500090); 
	if buffSmall then
		sysScript:DelBuff(2500090);
	end
	
	buffSys:AddBuff(2500100,1); 	
	return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
