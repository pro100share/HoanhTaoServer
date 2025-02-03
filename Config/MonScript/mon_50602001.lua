local dwMonsterId = 50602001	--BOSS
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 7000,1
	end
	local dwRand = math.random(10000);
	if (dwRand < 8000) then
		return 7000,1
	else
		return 50602001,1
	end
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
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
		-- local Map = Monster:GetMap()						-----获取地图管理器
		-- local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		-- mgrNpc:Story(103)
		-- local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器	
		-- local Monster1 = mgrMonster:GetMonsterById(50302005)	--获得活着的怪物ID
		-- for k,v in pairs(Monster1) do
			 -- local MapId,x,y = v:GetPos()
			-- mgrMonster:Remove(v:GetRoleID())
			-- mgrMonster:Add(50302006,50302006,50302006,50302006,x,y)
		-- end		
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
		local Map = Monster:GetMap()						-----获取地图管理器
		local dwLevelm = Monster:GetLevel()        ----获得怪物等级
		local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
		--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		
		-- if dwLevelm >= dwLevelp+(8*2) then
		   
		-- local duplSystem = objPlayer:GetSystem("CDuplSystem");
		-- duplSystem:WinDupl();
		
		-- self.ZKNTemp = self.ZKNTemp or 1
		-- if self.ZKNTemp > 8  then	
			-- local duplSystem = objPlayer:GetSystem("CDuplSystem");
			-- duplSystem:WinDupl();
		-- else
		
		sysScript:TeamNotice(9000660183,7)	----下一波金军将在15秒之后出现，请做好万全准备！
		local D1 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
		end
		
		local D2 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
		end
		
		local D3 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
		end
		
		local D4 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
		end
		
		local D5 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
		end
		
		local D6 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
		end
		
		local D7 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-11.67,17.50,dwDelay)
		end
		
		local D8 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-11.67,17.50,dwDelay)
		end
		
		local D9 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-14.08,16.26,dwDelay)
		end
		
		local D10 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-14.08,16.26,dwDelay)
		end
		
		local D11 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-14.08,16.26,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
		end
		
		local D12 = function()
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-14.08,16.26,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600002,(1000+dwLevelm-1),50600002,(5060000+(math.floor((dwLevelm-1)/5)*5)),-9.81,16.19,dwDelay)
		end
		
		local D13 = function()
			mgrMonster:Add(50602002,(4000+dwLevelm+1),50602002,(102000+(math.floor((dwLevelm+1)/5)*5)),7.25,8.89,dwDelay)
		end
		-------提示信息
		local T1 = function()
			sysScript:TeamNotice(9000660184,7)	----金军将在10秒之后出现，请做好准备！
		end
		local T2 = function()
			sysScript:TeamNotice(9000660185,7)	----金军将在5秒之后出现，请做好准备！
		end
		local T3 = function()
			sysScript:TeamNotice(9000660186,7)	----金军出现！
		end
		local T4 = function()
			sysScript:TeamNotice(9000660187,7)	----金军BOSS将在20秒之后出现，请及时清理小兵！
		end
		local T5 = function()
			sysScript:TeamNotice(9000660188,7)	----金军BOSS将在10秒之后出现，请及时清理小兵！
		end
		local T6 = function()
			sysScript:TeamNotice(9000660189,7)	----金军BOSS将在5秒之后出现，请及时清理小兵！
		end
		-------延迟脚本
		
		Map:AddTimeEvent( 5000,T1)
		Map:AddTimeEvent( 10000,T2)
		Map:AddTimeEvent( 15000,T3)
		Map:AddTimeEvent( 215000,T4)
		Map:AddTimeEvent( 225000,T5)
		Map:AddTimeEvent( 230000,T6)
		
		Map:AddTimeEvent( 15000,D1)
		Map:AddTimeEvent( 20000,D2)
		Map:AddTimeEvent( 30000,D3)
		Map:AddTimeEvent( 40000,D4)
		Map:AddTimeEvent( 55000,D5)
		Map:AddTimeEvent( 70000,D6)
		Map:AddTimeEvent( 85000,D7)
		Map:AddTimeEvent( 105000,D8)
		Map:AddTimeEvent( 125000,D9)
		Map:AddTimeEvent( 150000,D10)
		Map:AddTimeEvent( 175000,D11)
		Map:AddTimeEvent( 205000,D12)
		Map:AddTimeEvent( 235000,D13)	--BOSS
		
		
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------