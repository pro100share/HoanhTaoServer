local dwItemId = 2500069  --宠物血包
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return 0;
	end
	local Imp = sysScript:HasAuthority("NpcConnectionSystem")	
	if not Imp then
		return 8008000409;
	end
	local petSystem = objPlayer:GetSystem('CPetSystem')
	if not petSystem then
		return 8008000409;
	end
	local outputPet = petSystem:GetOutPetObject();
	if not outputPet then
		return 8008000410;
	end
	local buffSys = objPlayer:GetSystem('CBuffSystem')
	if not buffSys then
		return 0;
	end
	
	if (buffSys:GetBuffCurValue(200000) + 2000) >= InitConfig.dwBuffValue then
		return 3003010006;
	end
	
	buffSys:AddBuff(200000,2);

	return false;
end

--批量使用
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return flase,0;
	end	
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return flase,0;
	end
	local Imp = sysScript:HasAuthority("NpcConnectionSystem")	
	if not Imp then
		return flase,8008000409;
	end
	local petSystem = objPlayer:GetSystem('CPetSystem')
	if not petSystem then
		return flase,8008000409;
	end
	local outputPet = petSystem:GetOutPetObject();
	if not outputPet then
		return flase,8008000410;
	end
	local buffsys = objPlayer:GetSystem('CBuffSystem')
	if not buffsys then
		return flase,0;
	end	
	
	local CurBuffValue = buffsys:GetBuffCurValue(200000)
	if (CurBuffValue+2000) >= _G.InitConfig.dwBuffValue then
		return false,3003010006;
	end

	return true,num;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local objPlayer = objItemSys:GetPlayer();
	objPlayer:GetSystem('CBuffSystem'):MassAddBuff(200000,2,nil,nil,num);
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 