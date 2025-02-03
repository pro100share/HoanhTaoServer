--保存函数表
local npc_fun = {}
--npcid
local npc_id = 60011001
----------------------------------------------

--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	if not objNpc.smmf then						-----判断NPC身上是否有状态	
		objNpc.smmf = objNpc.smmf or true
		local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		local Map = sysMap:GetCurMap()				----获取玩家所在地图
		local dwLevelt = sysScript:GetDuplLevel() 	---获得创建副本的等级
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		local dwLevelp = objPlayer:GetLevel() 	---获得玩家等级
		
		--DuplAddition[6001]:AddPlayerBuff( objPlayer );
		
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		local dupID = duplSystem:GetDuplId()
		if not dupID then return end
		-- print( "dupID=========================",dupID )
		
		
		local scriptSystem = objPlayer:GetSystem("CScriptSystem");
		if not scriptSystem then return end;
		local MapID,x,y = scriptSystem:GetMapPos();	
		-- print( "MapID=========================",MapID )
		-- print( "x=========================",x )
		-- print( "y=========================",y )
		

		-- print( "===============2=============2=================" )
		
		local D1 = function()	
			DuplAddition[6001]:GrowMonster( mgrMonster,dwLevelt,dupID,MapID )	
			-- print( "===============4=============4=================" )
		end
			
		-- print( "===============3=============3=================" )	
		Map:AddTimeEvent(DuplAddition[6001].DateInfo.AddMonTime,D1)
		
	else
		sysScript:Notice(13009100101)
	end
end




-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------



