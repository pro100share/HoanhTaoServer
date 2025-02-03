local dwMonsterId = 50730002	--BOSS
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
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	self.Jiance = self.Jiance or false
	local dwRand = math.random(10000);
	local Buff = 50500006;
	if (dwRand < 2500  ) then
		Buff = 50500006;
	    self.Jiance = 1;
	elseif (dwRand > 2500 and dwRand < 7000 ) then
		Buff = 50500007;
		self.Jiance = 3;
	elseif (dwRand > 7000 and dwRand < 10000 ) then
		Buff = 50500008;
		self.Jiance = 5;
	else 
	    Buff = 50500008;
		self.Jiance = 5;
    end 
	sysMonsterBuff:AddBuff(Buff,1,Monster)
    	
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
		local JiFen = Map:GetIntegral(objPlayer)
		if sysScript:CheckBUff(50500010) then
		    Map:SetIntegral(objPlayer,0, 1011)
		elseif sysScript:CheckBUff(50500012) then
		    Map:SetIntegral(objPlayer,0, 1011)
		elseif sysScript:CheckBUff(50500013) then
		    Map:SetIntegral(objPlayer,0, 1011)
		elseif sysScript:CheckBUff(50500011) then
		    if (self.Jiance > 2 and self.Jiance < 4) then
		        Map:SetIntegral(objPlayer,1, 1011)
			else
			    Map:SetIntegral(objPlayer,0, 1011)
			end
		else		
		    if (self.Jiance < 2) then
		        local dwRand = math.random(10000);
		    		if (dwRand < 2500) then
			        local He = JiFen;
		            Map:SetIntegral(objPlayer,He, 1011)
	
	            elseif (dwRand > 2500 and dwRand < 5500) then
		            local He = math.floor(JiFen/2);
				    Map:SetIntegral(objPlayer,-He, 1011)
			
			    elseif (dwRand > 55000 and dwRand < 10000) then
			        local dwRand1 = math.random(10000);
				    local He = math.random(3);
				    if (dwRand1 < 5000) then
				        Map:SetIntegral(objPlayer,-He, 1011)
		            elseif  (dwRand1 > 5000 and dwRand < 10000) then
				        Map:SetIntegral(objPlayer,He, 1011)
				    end
				end
			
		    elseif (self.Jiance > 2 and self.Jiance < 4) then
		        Map:SetIntegral(objPlayer,1, 1011)		      
			
	        elseif (self.Jiance > 4) then
		      
			
			    if (JiFen < 1) then
			        local JiFen = 0;
				
		        else 
			        Map:SetIntegral(objPlayer,-1, 1011)
		    
			    end
			
		    end
		
		
		
		end
	
		
		
        
	
	
	    CScriptManager:DoFunction(Monster,fnFunction)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------