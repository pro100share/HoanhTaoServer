local dwMonsterId = 50042001
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
	local Map = Monster:GetMap()						-----获取地图管理器
	
	Map.lr = (Map.lr or 0) + 1
	if  Map.lr<2 then
		local yidong = {
			{x=18.36,y=-13.72,dwSpeed=5};
			{x=3.66,y=-23.10,dwSpeed=6};
			{x=-5.09,y=-20.25,dwSpeed=6};
			{x=15.73,y=-2.13,dwSpeed=7};
			{x=11.63,y=11.01,dwSpeed=7};
			{x=-5.5,y=10,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end	
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
		if (Pos.x+5.5)^2+(Pos.y-10)^2 < 2^2 then
		
			Map.lrx = (Map.lrx or 0) + 1
			
			if Map.lrx == 1 then
		
				local fnFunction = function(sysScript)
					sysScript:Story(5001001)
				end
				CScriptManager:DoFunction(Monster,fnFunction)
				
				Monster:Say(420)
				
				local D1 = function()
					Monster:Remove()
				end
				Map:AddTimeEvent( 3000, D1)
				
				mgrMonster:DelayAdd(50042005,50042005,50042005,102035,100120050,-9.38,14.85,dwObjId,1000)
			
			end
			
		end
		
		if (Pos.x-18.36)^2+(Pos.y+13.72)^2 < 2^2 then
			Map.lr01 = (Map.lr01 or 0) + 1
			if Map.lr01<2 then
			Monster:Say(401)
			mgrMonster:Add(50042002,50042002,50042002,100035,100320040,18.36,-13.72)
			mgrMonster:DelayAdd(50042003,50042003,50042002,100035,100320030,18.36,-13.72,dwObjId,1000)
			mgrMonster:DelayAdd(50042004,50042004,50042002,100035,100320020,18.36,-13.72,dwObjId,1500)
			mgrMonster:DelayAdd(50042004,50042004,50042002,100035,100320020,18.36,-13.72,dwObjId,2000)
			end
		end
		
		if (Pos.x-3.66)^2+(Pos.y+23.10)^2 < 2^2 then
			Map.lr02 = (Map.lr02 or 0) + 1
			if Map.lr02<2 then
			Monster:Say(401)
			mgrMonster:Add(50042002,50042002,50042002,100035,100320040,3.66,-23.10)
			mgrMonster:DelayAdd(50042003,50042003,50042002,100035,100320030,3.66,-23.10,dwObjId,1000)
			mgrMonster:DelayAdd(50042004,50042004,50042002,100035,100320020,3.66,-23.10,dwObjId,1500)
			mgrMonster:DelayAdd(50042004,50042004,50042002,100035,100320020,3.66,-23.10,dwObjId,2000)
			end
		end
		
		if (Pos.x+5.09)^2+(Pos.y+20.25)^2 < 2^2 then
			Map.lr03 = (Map.lr03 or 0) + 1
			if Map.lr03<2 then
			Monster:Say(401)
			mgrMonster:Add(50042002,50042002,50042002,100035,100320040,-5.09,-20.25)
			mgrMonster:DelayAdd(50042003,50042003,50042002,100035,100320030,-5.09,-20.25,dwObjId,1000)
			mgrMonster:DelayAdd(50042004,50042004,50042002,100035,100320020,-5.09,-20.25,dwObjId,1500)
			mgrMonster:DelayAdd(50042004,50042004,50042002,100035,100320020,-5.09,-20.25,dwObjId,2000)
			end
		end
		
		
		
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------