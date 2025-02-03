local dwItemId = 7100326
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});


--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
local dwNowTime = _now()
	
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,fPosX,fPosY = sysScript:GetMapPos()
	if dwMapId ~= 5117 then sysTask:Error(999911) return nil end;
	if math.sqrt((fPosX+11)^2+(fPosY+12)^2) > 5 then sysTask:Error(999911) return nil end; 
	
return 3000
	
end


--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysTask = objPlayer:GetSystem("CTaskSystem")
 
	 sysScript:PlayPfx(96,-11.59,-9.53,0,bAll)
	 sysScript:PlayPfx(96,-11.13,-8.15,0,bAll)
	 sysScript:PlayPfx(96,-12.36,-8.11,0,bAll)
	 sysScript:PlayPfx(96,-12.62,-9.14,0,bAll)  	 
	sysTask:OnUseItem(dwItemId)
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
