local dwItemId = 7100325
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
	-- print(dwNowTime - objItem.dwLastUseTime)
	-- if dwNowTime - objItem.dwLastUseTime < 3000 then
			-- sysTask:Error(999914)
			-- return nil
	-- end
	-- objItem.dwLastUseTime = dwNowTime
	
	
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,fPosX,fPosY = sysScript:GetMapPos()
	if dwMapId ~= 5110 then sysTask:Error(999911) return nil end;
	if math.sqrt((fPosX-1)^2+(fPosY-3)^2) > 5 then sysTask:Error(999911) return nil end; 
	
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
		sysScript.Task11056 = sysScript.Task11056 or 1
 if sysScript.Task11056==1	then 
		sysScript:Story(1105601,true)
		sysScript.Task11056 = sysScript.Task11056+1	
		return 0
 elseif sysScript.Task11056==2	then
			sysScript:Story(1105602,true)
			sysScript.Task11056 = sysScript.Task11056+1	
			return 0
 elseif sysScript.Task11056==3	then
			sysScript:Story(1105603,true)
			return 0 
	end

end




-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
