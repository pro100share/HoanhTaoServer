--保存函数表
local npc_fun = {}
--npcid		野郊彩蛋01
local npc_id = 10031113
----------------------------------------------
-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.caidan100301(objNpc,objPlayer,sysNpc,tbParam,sysScript)

	local qhs = sysScript:GetItemNum(4100140)

		if qhs >= 1 then
		
			sysScript:DelItem(4100140,1)
			
			local dwRand = math.random(10000);
				if (dwRand < 1000) then
					sysScript:AddPackItem(4100140,3,1)
					sysScript:Notice(9000620002,7)
				else
					sysScript:Notice(9000620001,7)
				end
		
		else
			sysScript:Notice(9000620000)
		end
		
			








	-- if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		-- local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		-- --local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
		-- local dwLevelt = sysScript:GetDuplLevel() ---获得创建副本的等级
		-- local Map = sysMap:GetCurMap()				----获取玩家所在地图
		-- local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		-- local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		

	
		
		-- objNpc.ZKNTemp = objNpc.ZKNTemp or true
		
	-- else
		-- sysScript:Notice(9000660372)
	-- end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------



		
		
