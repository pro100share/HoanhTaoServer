local dwItemId = 7100002
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------


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
	
		if sysScript:GetItemNum(7100004) > 0 then
				sysScript:Notice(9000110020)			
				return nil;
			end


	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,fPosX,fPosY = sysScript:GetMapPos()
	if dwMapId ~= 5086 then sysTask:Error(999911) return nil end;
	if math.sqrt((fPosX+9)^2+(fPosY+12)^2) > 5 then sysTask:Error(999911) return nil end; 
	
	 return 3000
	 
end
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	-- local objPlayer = objItemSys:GetPlayer()
	-- local sysTask = objPlayer:GetSystem("CTaskSystem")
	if sysScript:AddTaskItem(7100004,1,enItemBindType.eYes) then
 else
	sysScript:Notice(999917)
	return true
 end
 sysScript:PlayPfx(96,-8,-13,0,bAll) 
 sysScript:PlayPfx(96,-8,-13,0,bAll) 
 sysScript:UseItem(dwItemId)
 -- sysTask:OnUseItem(dwItemId)
	
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 