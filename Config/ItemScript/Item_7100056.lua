local dwItemId = 7100056
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
 local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	
	-- objItem.dwLastUseTime = objItem.dwLastUseTime or 0
	-- print(dwNowTime - objItem.dwLastUseTime)
	-- if dwNowTime - objItem.dwLastUseTime < 3000 then
			-- sysTask:Error(999914)
			-- return true
	-- end	
	-- objItem.dwLastUseTime = dwNowTime	
	-- local Map = sysMap:GetCurMap()
	-- local mgrMonster = Map:GetMonsterMgr()
	-- if objItem.dwMonObjId then
	 -- local objMon = mgrMonster:GetMonsterInfo(objItem.dwMonObjId)
	 -- if objMon and (not objMon.Data.blShow) then
	 -- else
		-- sysTask:Error(999916)
		-- return nil
	 -- end
	--end
	
	
	
 local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,fPosX,fPosY = sysScript:GetMapPos()
	if dwMapId ~= 5079 then sysTask:Error(999911) return nil end;
	if math.sqrt((fPosX+28)^2+(fPosY-11)^2) > 5 then sysTask:Error(999911) return nil end; 
		-- local Task = sysTask:GetTask(2048) 
		-- local Task2 = sysTask:GetTask(2025) 
		-- if (Task and Task:GetTaskState()==2) or (Task2 and Task2:GetTaskState()==2) then
			return 3000
		 -- else
			-- return nil
		 -- end
end 

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	
 sysTask:OnUseItem(dwItemId)
 --return 0
end



-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
