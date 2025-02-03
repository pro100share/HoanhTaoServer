local dwItemId = 7100019
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
	
	if dwMapId~=1003 then sysTask:Error(999911);return nil; end;
	
	local tPos = {
		[1] = {x=22;y=-63;id=88888885;};
		[2] = {x=45;y=-71;id=88888886;};
		--[3] = {x=46;y=-6;id=88888887;};
	};
	local Task = sysTask:GetTask(2031)
	for k,v in pairs(tPos) do
			if math.sqrt((v.x-Pos.x)^2+(v.y-Pos.y)^2) <3 then
				local dwNow,dwMax = Task:GetMonInfo(k)
				if dwNow<dwMax then
					return 3000;
				else
					sysTask:Error(999912)
					return nil;
				end
			end
	end
	sysTask:Error(999911)
 return nil
end



local function get_next_pos(Task,Max)
	for i=1,Max do
		local dwNow,dwMax = Task:GetMonInfo(i)
		if dwNow<dwMax then
			return i;
		end
	end
end


--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
		local tPos = {
		[1] = {x=22;y=-63;id=88888885;};
		[2] = {x=45;y=-71;id=88888886;};
		--[3] = {x=46;y=-6;id=88888887;};
	};
	local cPos = {
		[1] = {x=26.20,y=-63.61;};
		[2] = {x=43.63,y=-73.98;};
		--[3] = {x=46;y=-6;id=88888887;};
	};
	
	local Task = sysTask:GetTask(2031)
	for k,v in pairs(tPos) do
			if math.sqrt((v.x-Pos.x)^2+(v.y-Pos.y)^2) <3 then
				local dwNow,dwMax = Task:GetMonInfo(k)
				if dwNow<dwMax then
					sysTask:RcvKillMonster(v.id)
					sysTask:OnUseItem(dwItemId)
					sysScript:PlayPfx(96,cPos[k].x,cPos[k].y,0,bAll)
					if Task:GetTaskState()~=TaskStateConfig.Done then
						local i = get_next_pos(Task,#tPos)
						sysScript:MovePlayer(tPos[i].x,tPos[i].y,dwMapId)
					end
				else
					sysTask:Error(999912)
				end
			end
	end
	if Task:GetTaskState()==TaskStateConfig.Done then
		return false;
	end
	return 0;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )



 