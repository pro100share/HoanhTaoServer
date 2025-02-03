local dwMonsterId = 212	--BOSS
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
		local S1 = function()
			Monster:Say("90030")
		end
		local S2 = function()
			Monster:Say("90029")
		end
		local S3 = function()
			Monster:Say("90028")
		end
		local S4 = function()
			Monster:Say("90027")
		end
		local S5 = function()
			Monster:Say("90026")
		end
		local S6 = function()
			Monster:Say("90025")
		end
		local S7 = function()
			Monster:Say("90024")
		end
		local S8 = function()
			Monster:Say("90023")
		end
		local S9 = function()
			Monster:Say("90022")
		end
		local S10 = function()
			Monster:Say("90021")
		end
		local S11 = function()
			Monster:Say("90020")
		end
		local S12 = function()
			Monster:Say("90019")
		end
		local S13 = function()
			Monster:Say("90018")
		end
		local S14 = function()
			Monster:Say("90017")
		end
		local S15 = function()
			Monster:Say("90016")
		end
		local S16 = function()
			Monster:Say("90015")
		end
		local S17 = function()
			Monster:Say("90014")
		end
		local S18 = function()
			Monster:Say("90013")
		end
		local S19 = function()
			Monster:Say("90012")
		end
		local S20 = function()
			Monster:Say("90011")
		end
		local S21 = function()
			Monster:Say("90010")
		end
		local S22 = function()
			Monster:Say("90009")
		end
		local S23 = function()
			Monster:Say("90008")
		end
		local S24 = function()
			Monster:Say("90007")
		end
		local S25 = function()
			Monster:Say("90006")
		end
		local S26 = function()
			Monster:Say("90005")
		end
		local S27 = function()
			Monster:Say("90004")
		end
		local S28 = function()
			Monster:Say("90003")
		end
		local S29 = function()
			Monster:Say("90002")
		end
		local S30 = function()
			Monster:Say("90001")
		end
		
		local D1 = function()
			Monster:Remove()
		end
		Map:AddTimeEvent( 151000,S1)
		Map:AddTimeEvent( 152000,S2)
		Map:AddTimeEvent( 153000,S3)
		Map:AddTimeEvent( 154000,S4)
		Map:AddTimeEvent( 155000,S5)
		Map:AddTimeEvent( 156000,S6)
		Map:AddTimeEvent( 157000,S7)
		Map:AddTimeEvent( 158000,S8)
		Map:AddTimeEvent( 159000,S9)
		Map:AddTimeEvent( 160000,S10)
		Map:AddTimeEvent( 161000,S11)
		Map:AddTimeEvent( 162000,S12)
		Map:AddTimeEvent( 163000,S13)
		Map:AddTimeEvent( 164000,S14)
		Map:AddTimeEvent( 165000,S15)
		Map:AddTimeEvent( 166000,S16)
		Map:AddTimeEvent( 167000,S17)
		Map:AddTimeEvent( 168000,S18)
		Map:AddTimeEvent( 169000,S19)
		Map:AddTimeEvent( 170000,S20)
		Map:AddTimeEvent( 171000,S21)
		Map:AddTimeEvent( 172000,S22)
		Map:AddTimeEvent( 173000,S23)
		Map:AddTimeEvent( 174000,S24)
		Map:AddTimeEvent( 175000,S25)
		Map:AddTimeEvent( 176000,S26)
		Map:AddTimeEvent( 177000,S27)
		Map:AddTimeEvent( 178000,S28)
		Map:AddTimeEvent( 179000,S29)
		Map:AddTimeEvent( 180000,S30)
		
		Map:AddTimeEvent( 181000,D1)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local t = WarAddition.XiangYang
	
	local objWar = nil;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if objWarSys then
		objWar = CWarHost:FindWar(objWarSys.dwCurWarID);
	end
	
	if objWar then
		objWar:ChangeRoleScore(objPlayer,t.Gold)
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------