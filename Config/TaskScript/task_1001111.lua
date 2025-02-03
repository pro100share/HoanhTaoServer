local task_id = 1001111
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask)

end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask)
	local sysStory = objPlayer:GetSystem("CStorySystem")
	sysStory:Start(1)
	--local sysMap = objPlayer:GetSystem("CMapSystem")
	--local Map = sysMap:GetCurMap()
	--local mgrMonster = Map:GetMonsterMgr()
	--local mgrNpc = Map:GetNpcMgr()
	--mgrMonster:Add(10012010,-9,-28,Map)
	--mgrNpc:Add(10021001,-4,-31,0, "罗荣", "囧")
	--local sysItem = objPlayer:GetSystem("CItemSystem")
	--sysItem:AddItem(dwItemEnum, dwPosition, dwItemNumber, dwBindType, bSendMsg, dwLifeTime)
	--sysItem:DeleteItemAuto(dwItemEnum, dwPosition, dwNumber, bUseUnbindFirst)
	--判断是否有足够的空间，传入一组物品，表格：key为序号，value为表（ dwItemEnum , dwItemNumber, dwBindType, dwLifeTime, setProperty ）
	--sysItem:HaveRoomForGroup( dwPosition, tabAddList )
	--sysItem:GetItemNumber(dwItemEnum, dwPosition, dwBindType, bNotCheckLife)
end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask)
--[[传送进某个副本
local mapSystem = objPlayer:GetSystem("CMapSystem");
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not mapSystem then return end; 
	local dwPointID = 1
	local Index = 1
	local teamMode = teamSystem:GetTeamPersonNum() or 0
	mapSystem:ReqEnterDupl(DuplId,MapId,dwPointID, Index, teamMode);
--]]

end
--放弃任务时执行
function tbFun:cb_task_on_doff(objPlayer,objTask)

end
--获取任务使用物品信息
function tbFun:get_item_use_info(objPlayer,objTask)
	local Item = {}
	Item[1234567] = {
		{map_id=1001,x=0,y=0,round=5;};
		{map_id=1001,x=0,y=0,round=5;};
	};
	Item[7654321] = {
		{map_id=1001,x=0,y=0,round=5;};
		{map_id=1001,x=0,y=0,round=5;};
	};
	Item[123456] ={
		{map_id=1001,x=1,y=1,round=5;};
	};
	Item[32131] = {
	
	};
	
	
	
	
	return Item;
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------
