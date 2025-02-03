local dwItemId = 7100329
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
	-- if dwNowTime - objItem.dwLastUseTime < 1000 then
			-- sysTask:Error(999914)
			-- return nil
	-- end
	-- objItem.dwLastUseTime = dwNowTime
	
	
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	if dwMapId ~= 1013 then sysTask:Error(999911) return nil end;
	if math.sqrt((Pos.x-5)^2+(Pos.y-11)^2) > 5 then sysTask:Error(999911) return nil end; 
	
	return 1000
	
	end


--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")


 sysTask:OnUseItem(dwItemId)

		local Map =  sysMap:GetCurMap()
		local mgrNpc = Map:GetNpcMgr()
		sysScript.Task12022 = sysScript.Task12022 or 1
 if sysScript.Task12022==1	then 
		sysScript:NpcStory(1202201)
		sysScript.Task12022 = sysScript.Task12022+1	
		return 0
 elseif sysScript.Task12022==2	then
			sysScript:NpcStory(1202202)
			sysScript.Task12022 = sysScript.Task12022+1	
			return 0
 elseif sysScript.Task12022==3	then
			sysScript:NpcStory(1202203)
			sysScript.Task12022 = sysScript.Task12022+1	
			return 0
 elseif sysScript.Task12022==4	then
			sysScript:NpcStory(1202204)
			sysScript.Task12022 = sysScript.Task12022+1				
			return 0 
	end

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
