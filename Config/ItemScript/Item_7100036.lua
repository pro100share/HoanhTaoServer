local dwItemId = 7100036
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
			-- return nil
	-- end
	-- objItem.dwLastUseTime = dwNowTime
	
	
	
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	if dwMapId ~= 1005 then sysTask:Error(999911) return nil end;
	if math.sqrt((Pos.x-16)^2+(Pos.y+47)^2) > 5 then sysTask:Error(999911) return nil end; 
	local Task = sysTask:GetTask(4021) 
	if Task and Task:GetTaskState()==2 then

 return 3000
 else
 return nil
 end
end 

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	--local sysMap = objPlayer:GetSystem("CMapSystem")	
	local sysTask = objPlayer:GetSystem("CTaskSystem")

	
	
	-- local Map = sysMap:GetCurMap()
	-- local mgrMonster = Map:GetMonsterMgr()
	-- if objItem.dwMonObjId then
	 -- local objMon = mgrMonster:GetMonsterInfo(objItem.dwMonObjId)
	 -- if objMon and (not objMon.Data.blShow) then
			-- objMon:Show()
		-- else
			-- sysTask:Error(999916)
		-- end
	-- else
		-- objItem.dwMonObjId =	sysScript:AddMonSP(10052005,10052005,10052005,10052005,100520050,18.42,-49.14)
		-- --objItem.dwMonObjId = mgrMonster:Add(10052005,16,-47,Map)
	-- end
		

 sysTask:OnUseItem(dwItemId)
 return nil
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
