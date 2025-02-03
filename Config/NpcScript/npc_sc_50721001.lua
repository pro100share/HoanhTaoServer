--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50721001
----------------------------------------------
-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
		local dwLevelt = sysScript:GetDuplLevel() ---获得创建副本的等级
		local Map = sysMap:GetCurMap()				----获取玩家所在地图
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		--sysScript:TeamNotice(183)	----下一波金军将在15秒之后出现，请做好万全准备！

		local dwRand = math.random(1000);
			if (dwRand < 500) then
			
						mgrMonster:Add(50720099,1010,80,-1,100310030,-2.29,-24.89,dwDelay)---刷哨兵 跑过来报信1
						
						local fnFunction = function(sysScript)  ----镜头处理1
							sysScript:Story(5072001)
						end
						CScriptManager:DoFunction(objNpc,fnFunction)  ----镜头处理1
					
						local S1 = function() ----NPC说话1
							mgrNpc:Story(150)
						end
						Map:AddTimeEvent( 4500, S1) ----NPC说话1
						
						for sg = 1,55 do  ----刷第一波怪1 南疆
							mgrMonster:DelayAdd(50720001,(1000+dwLevelt),50720001,50720001,100620020,-68.14,-63.61,dwObjId,(sg*1500))
						end		----刷第一波怪1
						
						mgrMonster:DelayAdd(50720011,(3000+dwLevelt+5),50720011,(102000+(math.floor(dwLevelt/5)*5)),100620010,-68.14,-63.61,dwObjId,82500)--出BOSS

			else
			
						mgrMonster:Add(50720098,1010,80,-1,100310030,-11.87,12.24,dwDelay)---刷哨兵 跑过来报信2
					
						local fnFunction = function(sysScript)  ----镜头处理2
							sysScript:Story(5072002)
						end
						CScriptManager:DoFunction(objNpc,fnFunction)  ----镜头处理2
						
						local S1 = function() ----NPC说话2
							mgrNpc:Story(150)
						end
						Map:AddTimeEvent( 4500, S1) ----NPC说话2
						
						for sg = 1,55 do  ----刷第一波怪2 蒙古
							mgrMonster:DelayAdd(50720001,(1000+dwLevelt),50720001,50720001,100320050,72.66,55.16,dwObjId,(sg*1500))
						end		----刷第一波怪2
						
						mgrMonster:DelayAdd(50720011,(3000+dwLevelt+5),50720011,(102000+(math.floor(dwLevelt/5)*5)),101120020,72.66,55.16,dwObjId,82500)--出BOSS
			
			end

	
		objNpc.ZKNTemp = objNpc.ZKNTemp or true

	else
		sysScript:Notice(9000660552)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
