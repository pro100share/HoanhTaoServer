local dwMonsterId = 50720008	--BOSS
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

		if (Pos.x+68.14)^2+(Pos.y+63.61)^2 < 2^2 then

			local yidong = {
				{x=-2.85,y=-40.96,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
				{x=-0.71,y=-2.61,dwSpeed=0.1};
				{x=-2.31,y=-2.49,dwSpeed=0.1};
			}
			Monster:MoveTo(yidong,true)

		elseif (Pos.x-72.66)^2+(Pos.y-55.16)^2 < 2^2 then

			local yidong = {
				{x=5.32,y=35.17,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
				{x=-0.41,y=-2.39,dwSpeed=0.1};
				{x=-2.31,y=-2.49,dwSpeed=0.1};
			}
			Monster:MoveTo(yidong,true)

		elseif (Pos.x+61.85)^2+(Pos.y-67.30)^2 < 2^2 then

			local yidong = {
				{x=2.88,y=36.14,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
				{x=-0.71,y=-2.61,dwSpeed=0.1};
				{x=-2.31,y=-2.49,dwSpeed=0.1};
			}
			Monster:MoveTo(yidong,true)

		else

			local yidong = {
				{x=-3.07,y=-43.44,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
				{x=-0.41,y=-2.39,dwSpeed=0.1};
				{x=-2.31,y=-2.49,dwSpeed=0.1};
			}
			Monster:MoveTo(yidong,true)

		end
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	local Pos = Monster:GetVectorPos()		---获得怪物坐标

	if (Pos.x+2.31)^2+(Pos.y+2.49)^2 < 1^2 then
		Monster:Remove()
		Map.shibai = (Map.shibai or 0) + 1
		Map.xiayibo08 = (Map.xiayibo08 or 0) + 1


		if Map.shibai == 1 then
			Monster:MapNotice(9000660567,7)
		elseif Map.shibai == 5 then
			Monster:MapNotice(9000660568,7)
		elseif Map.shibai == 10 then
			Monster:MapNotice(9000660569,7)
		elseif Map.shibai == 15 then
			Monster:MapNotice(9000660570,7)
		elseif Map.shibai == 20 then
			Monster:MapNotice(9000660571,7)
		elseif Map.shibai == 25 then
			Monster:MapNotice(9000660572,7)
		elseif Map.shibai == 30 then
			Monster:MapNotice(9000660573,7)
		elseif Map.shibai == 35 then
			Monster:MapNotice(9000660574,7)
		elseif Map.shibai == 40 then
			Monster:MapNotice(9000660575,7)
		elseif Map.shibai == 45 then
			Monster:MapNotice(9000660576,7)
		elseif Map.shibai == 50 then
			Monster:MapNotice(9000660577,7)
		elseif Map.shibai == 55 then
			Monster:MapNotice(9000660578,7)
		elseif Map.shibai == 60 then
			Monster:MapNotice(9000660579,7)
		elseif Map.shibai == 65 then
			Monster:MapNotice(9000660580,7)
		elseif Map.shibai == 70 then
			Monster:MapNotice(9000660581,7)
		elseif Map.shibai == 75 then
			Monster:MapNotice(9000660582,7)
		elseif Map.shibai == 80 then
			Monster:MapNotice(9000660583,7)
		elseif Map.shibai == 85 then
			Monster:MapNotice(9000660584,7)
		elseif Map.shibai == 90 then
			Monster:MapNotice(9000660585,7)
		elseif Map.shibai == 91 then
			Monster:MapNotice(9000660586,7)
		elseif Map.shibai == 92 then
			Monster:MapNotice(9000660587,7)
		elseif Map.shibai == 93 then
			Monster:MapNotice(9000660588,7)
		elseif Map.shibai == 94 then
			Monster:MapNotice(9000660589,7)
		elseif Map.shibai == 95 then
			Monster:MapNotice(9000660590,7)
		elseif Map.shibai == 96 then
			Monster:MapNotice(9000660591,7)
		elseif Map.shibai == 97 then
			Monster:MapNotice(9000660592,7)
		elseif Map.shibai == 98 then
			Monster:MapNotice(9000660593,7)
		elseif Map.shibai == 99 then
			Monster:MapNotice(9000660594,7)
		elseif Map.shibai == 100 then		
			Monster:MapNotice(9000660595,7)
			Monster:SetDuplState()
		end	


		-- if  Map.xiayibo08 == 240 then  ----这边没有玩家事件，所以改到 BOSS身上做完成

			-- -- local fnFunction = function(sysScript)
				-- -- local duplSystem = objPlayer:GetSystem("CDuplSystem");
				-- -- duplSystem:WinDupl();
			-- -- end
			-- -- CScriptManager:DoFunction(objNpc,fnFunction)

		-- end

	end

end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	-- local Map = Monster:GetMap()						-----获取地图管理器
	-- local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	-- local dwLevelm = Monster:GetLevel()        ----获得怪物等级

	-- Map.xiayibo08 = (Map.xiayibo08 or 0) + 1

		-- if Map.xiayibo08 == 240 then

			-- local duplSystem = objPlayer:GetSystem("CDuplSystem");
		    -- duplSystem:WinDupl();

		-- end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------