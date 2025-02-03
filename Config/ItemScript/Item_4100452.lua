----酒葫芦---水玉嵌珠·大
local dwItemId = 4100452
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return 0
	end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Imp = sysScript:HasAuthority("Gourd")			
	
	if not Imp then 
		return 13009600001
	end
	
	local cgourdSystem = objPlayer:GetSystem('CGourdSystem')
	if not cgourdSystem then 
		return 0
	end	
	 
	local Chack = cgourdSystem:UseItemAddSkillValue(1000)
	if not Chack then
		return false;
	else
		return 13009600003
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
	local Imp = sysScript:HasAuthority("Gourd")			
	if not Imp then 
		return false,13009600001
	end
	local cSys = objPlayer:GetSystem('CGourdSystem')
	if not cSys then 
		return false,0
	end	
	local upSkillValue = cSys:GetCurSkillValue();
	local upLevel = 0;
	upLevel = cSys:GetCurMendLevel();
	if(upLevel  >= #_G.GourdConfig.LevelConfig) then
		return false,13009600003
	end
	local lastnum = num;
	for i = 1,num do
		upSkillValue = upSkillValue + 1000;
		upLevel,upSkillValue = cSys:GetUpLevelBySkillValue(upSkillValue);
		if upLevel >= #_G.GourdConfig.LevelConfig then
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
		return 0;
	end
	local cSys = objPlayer:GetSystem('CGourdSystem')
	if not cSys then 
		return 0;
	end	
	cSys:UseItemAddSkillValue(1000*num);
	return false
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
