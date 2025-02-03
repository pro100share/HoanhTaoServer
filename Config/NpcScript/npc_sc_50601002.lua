--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50601002
----------------------------------------------

--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	if not objNpc.smmf then						-----判断NPC身上是否有状态	
		local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		local Map = sysMap:GetCurMap()				----获取玩家所在地图
		local dwLevelt = sysScript:GetDuplLevel() 	---获得创建副本的等级
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		local dwLevelp = objPlayer:GetLevel() 	---获得玩家等级

		local t = DuplAddition[1007].Monster.Rests(dwLevelt,1)
		local KongZhi = 1;
		
		objPlayer:GetSystem("CScriptSystem"):Notice(SysStringConfigInfo[9000660801],7)		
		
		local D1 = function()
			for loop = 1,t[KongZhi][1] do
				DuplAddition[1007]:Grow(mgrMonster,loop,dwLevelt,1);
			end
			
			KongZhi = KongZhi + 1;
		end
		--循环延迟
		for loop = 1,#t do
			Map:AddTimeEvent(t[loop][2],D1)
		end
		objNpc.smmf = objNpc.smmf or true
	else
		sysScript:Notice(9000660182)
	end
end




-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------



