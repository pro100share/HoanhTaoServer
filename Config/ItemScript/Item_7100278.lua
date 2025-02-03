local dwItemId = 7100278
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});




--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
	local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")

	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	
	if dwMapId~=1011 then sysTask:Error(999911);return nil; end;
	
	local tPos = {
		[1] = {x=-15;y=-15;id=88888861;};
		[2] = {x=-15;y=-19;id=88888862;};
		[3] = {x=-15;y=-22;id=88888863;};
		[4] = {x=-15;y=-25;id=88888864;};		
	};
	local Task = sysTask:GetTask(10045)
	for k,v in pairs(tPos) do
			if math.sqrt((v.x-Pos.x)^2+(v.y-Pos.y)^2) <2 then
				local dwNow,dwMax = Task:GetMonInfo(k)
				if dwNow<dwMax then
					return 3000;
				else
					sysTask:Error(999927)
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
		[1] = {x=-15;y=-15;id=88888861;};
		[2] = {x=-15;y=-19;id=88888862;};
		[3] = {x=-15;y=-22;id=88888863;};
		[4] = {x=-15;y=-25;id=88888864;};	
	};
	local cPos = {
		[1] = {x=-12,y=-16;};
		[2] = {x=-12,y=-19;};
		[3] = {x=-12,y=-22;};
		[4] = {x=-12;y=-25;};			
	};
	
	local Task = sysTask:GetTask(10045)
	for k,v in pairs(tPos) do
			if math.sqrt((v.x-Pos.x)^2+(v.y-Pos.y)^2) <2 then
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
					sysTask:Error(999927)
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



 