local task_id = 1001
local tbFun = {}
--接受任务时执行
function tbFun:cb_task_on_accept(objPlayer,objTask,sysScript)
		--[[	
	objPlayer:AddExp(99999999)
	local sysSkill = objPlayer:GetSystem("CSkillSystem")

	--if objPlayer:GetInfo().szRoleName == "" then
		sysSkill:NotifyGMCommand("zcs",{dwAttack=99999999,dwDefense=99999999,dwMoveSpeed=800})	
	--end

	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem") 
	local Map = sysMap:GetCurMap()
	local mgrMonster = Map:GetMonsterMgr()
		
	sysMap:ExecTransforMapXY(1003,0,0,0) 

		mgrMonster:Add(10012006,58,-70,Map)
		mgrMonster:Add(10012006,60,-73,Map)
		mgrMonster:Add(10012006,56,-73,Map)
		mgrMonster:Add(10012006,53,-69,Map)
		local sysItem = objPlayer:GetSystem("CItemSystem")
		
		--]]
	--sysScript:Story(24)
	--local sysStory = objPlayer:GetSystem("CStorySystem")
	--sysStory:Start(24)	
	if nil then
		local t = {
			[1] = 100101;
			[2] = 100101;
			[3] = 100101;
			[4] = 100101;
		}
		local dwProf = sysScript:GetProf()
		local f =function()
			sysScript:Story(t[dwProf])
			--CTimer:AddTimer( 1000, false, function() sysScript:ScnStory(9527,f) end )
		end
		CTimer:AddTimer( 1000, false, function() sysScript:ScnStory(1001,f) end )
	end
		-- if dwProf == 1 then
			-- sysScript:Story(24)
		-- elseif dwProf == 2 then
			-- sysScript:Story(25)
		-- elseif dwProf == 3 then
		-- elseif dwProf == 4 then
		-- end
end
--任务更新时执行
function tbFun:cb_task_on_update(objPlayer,objTask)

end
--完成任务时执行
function tbFun:cb_task_on_complete(objPlayer,objTask,sysScript)
	
--[[
		local sysMap = objPlayer:GetSystem("CMapSystem")
		local Map = sysMap:GetCurMap()
		local mgrNpc = Map:GetNpcMgr()
		--sysMap:ExecTransforMapXY(1001,-7,-25,0)
		if objPlayer.LXY1001 then
			mgrNpc:Remove(objPlayer.LXY1001)
			objPlayer.LXY1001 = nil
		end
]]--
end
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Task,task_id,tbFun)
--------------------------------------------------------------