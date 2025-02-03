local dwItemId = 2500065  --铁布衫归元散
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	-- if not objPlayer then
		-- return ;
	-- end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	-- if not sysScript then
		-- return true;
	-- end
	local Imp = sysScript:HasAuthority("LronCloth")									
	if not Imp then
		return 13009400101;
	end
	local buffSys = objPlayer:GetSystem('CBuffSystem')									--获得BUFF权限
	-- if not buffSys then
		-- return ;
	-- end
	buffSys:AddBuff(50770007,1);  --添加BUFF
	return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 