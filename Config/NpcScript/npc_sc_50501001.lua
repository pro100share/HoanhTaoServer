--保存函数表
local npc_fun = {}
--npcid		五行道场npc
local npc_id = 50501001
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
		sysScript:TeamNotice(9000660222,7)
		
		local fnFunction = function(sysScript)
			sysScript:Story(5050001)
			
			local dwRand = math.random(10000);
			if (dwRand < 2000) then
			    sysScript:AddBuff(50500001)	
			elseif (dwRand > 2000 and dwRand < 4000) then
			    sysScript:AddBuff(50500002)
			elseif (dwRand > 4000 and dwRand < 6000) then
			    sysScript:AddBuff(50500003)
			elseif (dwRand > 6000 and dwRand < 8000) then
			    sysScript:AddBuff(50500004)
			elseif (dwRand > 8000 and dwRand < 10000) then
			    sysScript:AddBuff(50500005)		
			end

			
		end
		CScriptManager:DoFunction(objNpc,fnFunction)
		
		mgrMonster:Add(50502012,(50502000+(math.floor(dwLevelt/10)*10)),50502012,(50502001+(math.floor(dwLevelt/5)*5)),505020120,13.98,10.23,dwDelay)
		mgrMonster:Add(50502013,(50502000+(math.floor(dwLevelt/10)*10)),50502013,(50502001+(math.floor(dwLevelt/5)*5)),505020130,-35.39,18.39,dwDelay)
		mgrMonster:Add(50502014,(50502000+(math.floor(dwLevelt/10)*10)),50502014,(50502001+(math.floor(dwLevelt/5)*5)),505020140,-58.27,-26.13,dwDelay)
		mgrMonster:Add(50502015,(50502000+(math.floor(dwLevelt/10)*10)),50502015,(50502001+(math.floor(dwLevelt/5)*5)),505020150,-23.11,-61.72,dwDelay)
		mgrMonster:Add(50502016,(50502000+(math.floor(dwLevelt/10)*10)),50502016,(50502001+(math.floor(dwLevelt/5)*5)),505020160,21.60,-39.28,dwDelay)
		
		-- mgrNpc:Add(50501002,19.47,15.46,5.5, szName, szTitle,dwObjId,objPlayer)
		-- mgrNpc:Add(50501003,-40.00,-24.96,5.5, szName, szTitle,dwObjId,objPlayer)
		-- mgrNpc:Add(50051004,-66.18,-27.63,5.5, szName, szTitle,dwObjId,objPlayer)
		-- mgrNpc:Add(50051005,-24.80,-70.11,5.5, szName, szTitle,dwObjId,objPlayer)
		-- mgrNpc:Add(50051006,-28.82,-43.00,5.5, szName, szTitle,dwObjId,objPlayer)
		
		objNpc.ZKNTemp = objNpc.ZKNTemp or true
	else
	sysScript:Notice(9000660223)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------