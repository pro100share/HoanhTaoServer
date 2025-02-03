local dwItemId = 7100246
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});


--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
 local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")

	
	
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local objItemSys = objPlayer:GetSystem("CItemSystem")
	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	if dwMapId ~= 1009 then sysTask:Error(999911) return nil end;
	if math.sqrt((Pos.x+12)^2+(Pos.y-31)^2) > 5 then sysTask:Error(999911) return nil end; 
	
	return 3000

end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	
	local tabAddList={{dwItemEnum=7100240,dwItemNumber=1,dwBindType=enItemBindType.eYes,}} 
	objItemSys:AddEnumItemListToTaskRoom(tabAddList, _G.ItemSysOperType.Used)
	
	sysTask:OnUseItem(dwItemId)

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
