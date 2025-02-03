--保存函数表
local npc_fun = {}
--npcid		夫妻副本
local npc_id = 50201001
----------------------------------------------

------------------告示牌-----------------
--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		local dwLevelt = sysScript:GetDuplLevel() ---获得创建副本的等级
		local Map = sysMap:GetCurMap()				----获取玩家所在地图
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		
		Map.gamestar = Map.gamestar or 0
		Map.gameload = Map.gameload or 0
			
		if Map.gamestar == 0 then
			Map.gamestar = (Map.gamestar or 0) + 1
			
			local fnFunction = function(sysScript)
			sysScript:Story(5020001)
			end
			CScriptManager:DoFunction(objNpc,fnFunction)
		
			mgrMonster:Add(50202003,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,22,-4,dwDelay)
			mgrMonster:Add(50202006,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,18,-9,dwDelay)
			mgrMonster:Add(50202007,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,7,-16,dwDelay)
			
			mgrMonster:Add(50202001,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,15,-17,dwDelay)
			mgrMonster:Add(50202004,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,24,-14,dwDelay)
			mgrMonster:Add(50202008,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,2,-21,dwDelay)
			
			mgrMonster:Add(50202005,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,23,5,dwDelay)
			mgrMonster:Add(50202009,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,25,14,dwDelay)
			mgrMonster:Add(50202002,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,9,-24,dwDelay)
			
			--------
			
			mgrMonster:Add(50202017,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,-19,12,dwDelay)
			mgrMonster:Add(50202012,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,-17,28,dwDelay)
			mgrMonster:Add(50202015,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,-26,-3,dwDelay)
			
			mgrMonster:Add(50202019,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,-18,21,dwDelay)
			mgrMonster:Add(50202018,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,0,23,dwDelay)
			mgrMonster:Add(50202013,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,8,27,dwDelay)
			
			mgrMonster:Add(50202014,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,-22,3,dwDelay)
			mgrMonster:Add(50202016,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,-28,7,dwDelay)
			mgrMonster:Add(50202011,50202001,50202001,(50502001+(math.floor(dwLevelt/5)*5)),11210,-8,22,dwDelay)

			--------
			
			Map.gameload = 1
		
		else
			sysScript:Notice(9000660799)
		end
		
		objNpc.ZKNTemp = objNpc.ZKNTemp or true
	else
	sysScript:Notice(9000660799)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------