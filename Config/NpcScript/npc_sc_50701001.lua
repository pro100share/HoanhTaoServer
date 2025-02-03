--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50701001  -------本波6辆车
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
		
		local fnFunction = function(sysScript)
			sysScript:Story(5070001)
		end
		CScriptManager:DoFunction(objNpc,fnFunction)
		
		local D1 = function()
		-- sysScript:TeamNotice(9000660283)	----下一波金军将在15秒之后出现，请做好万全准备！
		-- sysScript:TeamNotice(9000660295,7)	----蒙古后勤军队出现！
		mgrMonster:Add(50702001,(1000+dwLevelt),50702001,50702001,80010,-40.75,49.73)
		mgrMonster:Add(50702012,(2000+dwLevelt),50702012,(21000+(math.floor((dwLevelt-2)/5)*5)),100920020,-43.15,49.93)
		mgrMonster:DelayAdd(50702011,(2000+dwLevelt),50702011,(21000+(math.floor((dwLevelt-2)/5)*5)),100320050,-38.68,49.11,dwObjId,4500)

		mgrMonster:DelayAdd(50702001,(1000+dwLevelt),50702001,50702001,80010,-40.75,49.73,dwObjId,10500)
		mgrMonster:DelayAdd(50702012,(2000+dwLevelt),50702012,(21000+(math.floor((dwLevelt-2)/5)*5)),100920020,-43.15,49.93,dwObjId,10500)
		mgrMonster:DelayAdd(50702011,(2000+dwLevelt),50702011,(21000+(math.floor((dwLevelt-2)/5)*5)),100320050,-38.68,49.11,dwObjId,15000)

		mgrMonster:DelayAdd(50702001,(1000+dwLevelt),50702001,50702001,80010,-40.75,49.73,dwObjId,21000)
		mgrMonster:DelayAdd(50702012,(2000+dwLevelt),50702012,(21000+(math.floor((dwLevelt-2)/5)*5)),100920020,-43.15,49.93,dwObjId,21000)
		mgrMonster:DelayAdd(50702011,(2000+dwLevelt),50702011,(21000+(math.floor((dwLevelt-2)/5)*5)),100320050,-38.68,49.11,dwObjId,25500)

		mgrMonster:DelayAdd(50702001,(1000+dwLevelt),50702001,50702001,80010,-40.75,49.73,dwObjId,31500)
		mgrMonster:DelayAdd(50702012,(2000+dwLevelt),50702012,(21000+(math.floor((dwLevelt-2)/5)*5)),100920020,-43.15,49.93,dwObjId,31500)
		mgrMonster:DelayAdd(50702011,(2000+dwLevelt),50702011,(21000+(math.floor((dwLevelt-2)/5)*5)),100320050,-38.68,49.11,dwObjId,36000)

		mgrMonster:DelayAdd(50702001,(1000+dwLevelt),50702001,50702001,80010,-40.75,49.73,dwObjId,42000)
		mgrMonster:DelayAdd(50702012,(2000+dwLevelt),50702012,(21000+(math.floor((dwLevelt-2)/5)*5)),100920020,-43.15,49.93,dwObjId,42000)
		mgrMonster:DelayAdd(50702011,(2000+dwLevelt),50702011,(21000+(math.floor((dwLevelt-2)/5)*5)),100320050,-38.68,49.11,dwObjId,46500)

		mgrMonster:DelayAdd(50702001,(1000+dwLevelt),50702001,50702001,80020,-40.75,49.73,dwObjId,52500)
		mgrMonster:DelayAdd(50702012,(2000+dwLevelt),50702012,(21000+(math.floor((dwLevelt-2)/5)*5)),100920020,-43.15,49.93,dwObjId,52500)
		mgrMonster:DelayAdd(50702011,(2000+dwLevelt),50702011,(21000+(math.floor((dwLevelt-2)/5)*5)),100320050,-38.68,49.11,dwObjId,57000)
		end
		
		Map:AddTimeEvent( 14000,D1)

		objNpc.ZKNTemp = objNpc.ZKNTemp or true

	else
		sysScript:Notice(9000660282)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
