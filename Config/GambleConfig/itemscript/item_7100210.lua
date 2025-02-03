local dwItemId = 7100210
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});


--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
	local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	-- objItem.dwLastUseTime = objItem.dwLastUseTime or 0
	-- if dwNowTime - objItem.dwLastUseTime < 3000 then
			-- sysTask:Error(999914)
			-- return nil
	-- end
	-- objItem.dwLastUseTime = dwNowTime
	
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,fPosX,fPosY = sysScript:GetMapPos()
	if dwMapId ~= 5093 then sysTask:Error(999911) return nil end;
	if math.sqrt((fPosX-4)^2+(fPosY+7)^2) > 5 then sysTask:Error(999911) return nil end; 
	
	return 3000
	
end	 


--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	
	sysTask:OnUseItem(dwItemId)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,-7,-2)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,-2,-2)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,3,-2)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,3,3)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,-2,3)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,-7,3)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,-7,8)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,-2,8)
		-- sysScript:AddMonSP(81,1068,81,-1,10100,3,8)	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 