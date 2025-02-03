local dwItemId = 7100060
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
	if dwMapId ~= 1007 then sysTask:Error(999911) return nil end;
	if math.sqrt((Pos.x-7)^2+(Pos.y-79)^2) > 5 then sysTask:Error(999911) return nil end; 
	
	return 3000
	
	end


--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")


 sysTask:OnUseItem(dwItemId)

		local Map =  sysMap:GetCurMap()
		local mgrNpc = Map:GetNpcMgr()
		sysScript.Task6053 = sysScript.Task6053 or 1
 if sysScript.Task6053==1	then 
		sysScript:NpcStory(605301)
		sysScript.Task6053 = sysScript.Task6053+1	
		return 0
 elseif sysScript.Task6053==2	then
			sysScript:NpcStory(605302)
			sysScript.Task6053 = sysScript.Task6053+1	
			return 0
 elseif sysScript.Task6053==3	then
			sysScript:NpcStory(605303)
			sysScript.Task6053 = sysScript.Task6053+1	
			return 0
 elseif sysScript.Task6053==4	then
			sysScript:NpcStory(605304)
			sysScript.Task6053 = sysScript.Task6053+1				
			return 0 
 elseif sysScript.Task6053==5	then
			sysScript:NpcStory(605305)
			sysScript.Task6053 = sysScript.Task6053+1				
			return 0 
 elseif sysScript.Task6053==6	then
			sysScript:NpcStory(605306)
			return 0 			
	end

end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
