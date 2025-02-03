local dwItemId = 7100327
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

	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	
	if dwMapId~=1013 then sysTask:Error(999911);return nil; end;
	
	local tPos = {
		[1] = {x=72;y=37;id=88888804;};
		[2] = {x=67;y=36;id=88888805;};
		[3] = {x=64;y=42;id=88888806;};
	};
	local Task = sysTask:GetTask(12008)
	for k,v in pairs(tPos) do
			if math.sqrt((v.x-Pos.x)^2+(v.y-Pos.y)^2) <3 then
				local dwNow,dwMax = Task:GetMonInfo(k)
				if dwNow<dwMax then
					return 3000;
				else
					sysTask:Error(999920)
					return nil;
				end
			end
	end
	sysTask:Error(999911)
 return nil
end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	local tPos = {
			[1] = {x=72;y=37;id=88888804;};
			[2] = {x=67;y=36;id=88888805;};
			[3] = {x=64;y=42;id=88888806;};
		};
	local Task = sysTask:GetTask(12008)
	for k,v in pairs(tPos) do
			if math.sqrt((v.x-Pos.x)^2+(v.y-Pos.y)^2) <3 then
				local dwNow,dwMax = Task:GetMonInfo(k)
				if dwNow<dwMax then
					sysTask:RcvKillMonster(v.id)
					sysTask:OnUseItem(dwItemId)
					if Task:GetTaskState()~=TaskStateConfig.Done then
						local i = math.mod(k,#tPos)+1
						sysScript:MovePlayer(tPos[i].x,tPos[i].y,dwMapId)
					end					
				else
					sysTask:Error(999920)
				end
			end
	end
	-- if Task:GetTaskState()==TaskStateConfig.Done then
		-- return false;
	-- end
	-- return 0;
		local Map =  sysMap:GetCurMap()
		local mgrNpc = Map:GetNpcMgr()
		sysScript.Task12008 = sysScript.Task12008 or 1
 if sysScript.Task12008==1	then 
		sysScript:NpcStory(1200801)
		sysScript.Task12008 = sysScript.Task12008+1	
		return 0
 elseif sysScript.Task12008==2	then
			sysScript:NpcStory(1200802)
			sysScript.Task12008 = sysScript.Task12008+1	
			return 0
 elseif sysScript.Task12008==3	then
			sysScript:NpcStory(1200803)
			sysScript.Task12008 = sysScript.Task12008+1	
			return 0			
	end	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 