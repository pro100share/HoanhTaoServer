local dwItemId = 5809365
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	if not objPlayer then return end
	
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Imp = sysScript:HasAuthority("Mount")			
	
	if not Imp then 
		return 9000210008		
	end
	
	local Lv = objPlayer:GetSystem("CMountSystem"):GetMountGrade()
	if Lv < 4 then
		return 13002000001
	end
	
	local zh = {4;9;14;19;24;29;34;39}
		local gl = {15;25;25;10;5;10;5;5}
	local maxgl = 0
	local soulrnd = 0

	for i = 1, 8 do
		maxgl = maxgl + gl[i]
	end
	local zhrand = math.random(maxgl)
	local zhsj = 0
	local zha = 0
	for n = 1 , 8 do
		zhsj = zhsj + gl[n]
		if zhrand <= zhsj then
			zha = zh[n]
			break;
		end
	end
	local soulSystem = objPlayer:GetSystem("CSoulSystem");
	if not soulSystem then return end
	if not soulSystem:AddSoul(zha) then
		return 700010210001;
	end
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )