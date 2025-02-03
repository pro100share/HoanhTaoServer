local dwItemId = 7100349
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});


--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
	local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")

	local dwMapId,x,y = sysScript:GetMapPos()
	if dwMapId~=5119 then sysTask:Error(999911);return nil; end;
	
	local tPos = {
		[1] = {x=-12;y=-23;id=88888892;};
		[2] = {x=-19;y=-21;id=88888893;};
		[3] = {x=-24;y=-19;id=88888894;};
	};
	local Task = sysTask:GetTask(12063)
	for k,v in pairs(tPos) do
			if math.sqrt((v.x-x)^2+(v.y-y)^2) <3 then
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
	
	local dwMapId,x,y = sysScript:GetMapPos()
	local Pos = {x=x,y=y}
		local tPos = {
		[1] = {x=-12;y=-23;id=88888892;};
		[2] = {x=-19;y=-21;id=88888893;};
		[3] = {x=-24;y=-19;id=88888894;};
	};
	local Task = sysTask:GetTask(12063)
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
	if Task:GetTaskState()==TaskStateConfig.Done then
		return false;
	end
	return 0;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 