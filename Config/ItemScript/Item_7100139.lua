local dwItemId = 7100139
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
	if dwMapId ~= 5087 then sysTask:Error(999911) return nil end;
	if math.sqrt((fPosX+1)^2+(fPosY+25)^2) > 5 then sysTask:Error(999911) return nil end; 
	
	 return 3000
	
end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")	
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
		-- objItem.dwMonObjId = 		sysScript:AddMonSP(10092014,10092014,10092014,10092014,100620050,-2.26,-14.49)
 sysTask:OnUseItem(dwItemId)
 -- return 0
 -- end
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 