﻿local dwItemId = 7100223
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
	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	if dwMapId ~= 1003 then sysTask:Error(999911) return nil	end;
	-- if math.sqrt((Pos.x+92)^2+(Pos.y-26)^2) > 5 then sysTask:Error(999911) return nil end; 
	
	 return 3000
	 
end	 
	
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	-- if not self.bChange then
		-- self.bChange = true
		sysScript:ChangeLook(10032001)
	 sysTask:OnUseItem(dwItemId)
	-- else
		-- self.bChange = nil
		-- sysScript:ChangeLook(0) 
	-- end
		local Task = sysTask:GetTask(2015)		
		if Task:GetTaskState()~=TaskStateConfig.Done then
				sysScript:MovePlayer(-68,-21,nil)
   end	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 