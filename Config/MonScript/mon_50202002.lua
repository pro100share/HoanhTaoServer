local dwMonsterId = 50202002	--盒子
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
--获取下次刷新时间(线路、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
	
	if Map.wancheng == 5 then
		Monster:Remove()
	end

end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local dwLevelm = sysScript:GetDuplLevel()        ----获得怪物等级sysScript:GetDuplLevel()
	local p = Monster:GetBornPos()
	
	Map.zhi = Map.zhi or 0
	Map.wancheng = Map.wancheng or 0
	
	if  Map.zhi == 12 then
		
		Map.zhi = 0
		Map.wancheng = (Map.wancheng or 0) + 1
		
		if Map.wancheng < 5 then
			mgrMonster:DelayAdd(50202002,50202001,50202001,50202001,11210,p.x,p.y,dwObjId,15000)
		end
		-----------------
		if Map.wancheng == 1 then
			Monster:MapNotice(9000660700,7)
		end
		if Map.wancheng == 2 then
			Monster:MapNotice(9000660701,7)
		end
		if Map.wancheng == 3 then
			Monster:MapNotice(9000660702,7)
		end
		if Map.wancheng == 4 then
			Monster:MapNotice(9000660703,7)
		end
		
		-----------------
		if Map.wancheng == 5 then
		
			if Map.gameload == 1 then
			
				local fnFunction = function(sysScript)
				sysScript:Story(5020002)
				end
				CScriptManager:DoFunction(Monster,fnFunction)
				
				mgrMonster:DelayAdd(50202100,(3000+dwLevelm+5),50202100,(102000+(math.floor(dwLevelm/5)*5)),100520060,0,0,dwObjId,1000)
			else
			
				local fnFunction = function(sysScript)
				sysScript:Story(5020003)
				end
				CScriptManager:DoFunction(Monster,fnFunction)
			
				mgrMonster:DelayAdd(50202101,(3000+dwLevelm+5),50202101,(102000+(math.floor(dwLevelm/5)*5)),100920070,0,0,dwObjId,1000)
			end
			
			----------------
			local a = {50202001,50202002,50202003,50202004,50202005,50202006,50202007,50202008,50202009,50202011,50202012,50202013,50202014,50202015,50202016,50202017,50202018,50202019};

			for loop =1,#a do
				local Monster = mgrMonster:GetMonsterById(a[loop])	--获得活着的怪物ID
					for k,v in pairs(Monster) do
						mgrMonster:Remove(v:GetRoleID())
					end	
			end
			
		end
		------------------
		
	else
		
		Map.zhi = 2
		
		if Map.wancheng < 5 then
			mgrMonster:DelayAdd(50202002,50202001,50202001,50202001,11210,p.x,p.y,dwObjId,15000)
		end
		
	end
	
	
	
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
