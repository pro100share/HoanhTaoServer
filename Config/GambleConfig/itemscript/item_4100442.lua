--九转熊蛇丸
local dwItemId = 4100442
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return 0
	end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Imp = sysScript:HasAuthority("PractiseSkill")			
	
	if not Imp then 
		return 13009400201
	end
	
	local cpractiseSkillSystem = objPlayer:GetSystem('CPractiseSkillSystem')
	if not cpractiseSkillSystem then 
		return 0
	end	
	 
	local Chack = cpractiseSkillSystem:UseItemAddMendValue(5000)
	if not Chack then
		return false;
	else
		return 13009400204
	end
	
	return 0;
end


-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return false,0
	end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Imp = sysScript:HasAuthority("PractiseSkill")			
	
	if not Imp then 
		return false,13009400201
	end
	
	local cpractiseSkillSystem = objPlayer:GetSystem('CPractiseSkillSystem')
	if not cpractiseSkillSystem then 
		return false,0
	end	
	 
	local CurrLev = cpractiseSkillSystem:GetCurPractiseLevel()
	local MaxLv = #_G.PractiseSkillConfig.LevelConfig
	if CurrLev >= MaxLv then
		return false,13009400203;
	end
	local upMendValue = cpractiseSkillSystem:GetCurMendValue();
	local upLevel = 0;
	local lastnum = num;
	for i = 1,num do
		upMendValue = upMendValue + 5000;
		upLevel,upMendValue = cpractiseSkillSystem:GetUpLevelByMendValue(upMendValue);
		if upLevel >= MaxLv then
			lastnum = i
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return false,0
	end
	local cpractiseSkillSystem = objPlayer:GetSystem('CPractiseSkillSystem')
	if not cpractiseSkillSystem then 
		return false,0
	end	
	cpractiseSkillSystem:UseItemAddMendValue(5000*num)
	return false
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
