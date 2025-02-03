local dwMonsterId = 50732004	--BOSS
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
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
		
		local Map = Monster:GetMap()						-----获取地图管理器
		local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
		local sysScript = objPlayer:GetSystem("CScriptSystem")
	    local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	    local fnFunction = fnFunction or function(sysScript)
		
	
	
            if sysScript:CheckBUff(50500015) then
			    sysScript:DelBuff(50500015)
	            sysScript:Notice(9000660609,7)
			    local D11 = function()
				    
			    mgrMonster:Add(50732005,(3000+dwLevelm+3),50502010,50502010,100920080,-15.80,-4.22,dwDelay)
			    end
			    Map:AddTimeEvent( 60000,D11)
		    
			
		    else
             
			    
			    local D611 = function()
			        sysScript:Notice(9000660610,7)
					local D6111 = function()
				        Monster:SetDuplState()
			        end
				    Map:AddTimeEvent( 60000,D6111)
			    end
			    Map:AddTimeEvent( 10000,D611)
			end	
		end
       
	
	    CScriptManager:DoFunction(Monster,fnFunction)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------