local dwMonsterId = 50702001  -------本波6辆车
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
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local yidong =
	{
		{x=-38.97,y=-29.85,dwSpeed=1};
		{x=-30.55,y=-37.86,dwSpeed=1};
		{x=-11.51,y=-39.13,dwSpeed=1};
		{x=-12.35,y=28.47,dwSpeed=1};
		{x=0.49,y=40.23,dwSpeed=1};
		{x=18.80,y=30.19,dwSpeed=1};
		{x=32.62,y=-29.02,dwSpeed=1};
	}
	Monster:MoveTo(yidong)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	--------------------到达蒙古军营，检测是否会刷下一波
		local Pos = Monster:GetVectorPos()		---获得怪物坐标
		if (Pos.x-32.62)^2+(Pos.y+29.02)^2 < 2^2 then	---是否某个距离之内
			Monster:Remove()	---删除怪物
			Map.lrxxx = (Map.lrxxx or 0) + 1	---计数器+1
			
			Map.sbpd = (Map.sbpd or 0) + 1  ----失败判定计数+1
			
			if Map.sbpd == 1 then
				Monster:MapNotice(9000660296,7)
			elseif Map.sbpd == 2 then
				Monster:MapNotice(9000660297,7)
			elseif Map.sbpd == 3 then
				Monster:MapNotice(9000660298,7)
			elseif Map.sbpd == 4 then
				Monster:MapNotice(9000660299,7)
			elseif Map.sbpd == 5 then
				Monster:MapNotice(9000660300,7)
			elseif Map.sbpd == 6 then
				Monster:MapNotice(9000660301,7)
			elseif Map.sbpd == 7 then
				Monster:MapNotice(9000660302,7)
			elseif Map.sbpd == 8 then
				Monster:MapNotice(9000660303,7)
			elseif Map.sbpd == 9 then
				Monster:MapNotice(9000660304,7)
			elseif Map.sbpd == 10 then
				Monster:MapNotice(9000660305,7)
				 Monster:SetDuplState()
			end
			
			if Map.lrxxx>5 then	---地图计数器是否>5
				local Monster01 = mgrMonster:GetMonsterById(50702001)	---定义ID怪物为Monster01
				if #Monster01<1 then	---这个怪是否<1
					Map.lrxxx = 0	---地图计数器清0
					Map.shijian = 0		---特殊事件计数器清0
					Map.shijian02 = 0	---特殊事件02计数器清0 ----用来防止第1个触发点多次触发
					Map.shijian03 = 0	---特殊事件03计数器清0 ----用来防止第2个触发点多次触发
					Monster:SetDuplData(2)
					Monster:MapNotice(9000660284,7)
					local C1 = function()
					mgrMonster:Add(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73)
					mgrMonster:Add(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,4500)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73,dwObjId,10500)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,10500)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,15000)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73,dwObjId,21000)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,21000)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,25500)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73,dwObjId,31500)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,31500)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,36000)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702003,80020,-40.75,49.73,dwObjId,42000)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,42000)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,46500)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702003,80020,-40.75,49.73,dwObjId,52500)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,52500)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,57000)
					end
					
					local C2 = function()
					Monster:MapNotice(9000660293,7)
					end
					
					Map:AddTimeEvent( 30000,C1)
					Map:AddTimeEvent( 15000,C2)
					
				end
			end
		end
	--------------------到达第1个事件触发点，进行逻辑
		if (Pos.x+40.75)^2+(Pos.y-49.73)^2 < 2^2 then ---是否某个距离内
			Map.shijian = Map.shijian or 0	---定义事件计数器=本身或0
			Map.shijian02 = (Map.shijian02 or 0)+1 ---第1个触发点计数器 用来控制是否多次踩点

			if Map.shijian < 1 and Map.shijian02 < 2 then	---检测第1个地点是否需要触发事件，以及控制是否多次踩点触发这个事件
				-----25%概率 刷村民
				local dwRand = math.random(10000);
				if (dwRand < 1500) then
					Map.shijian = (Map.shijian or 0) + 1	---事件计数器+1
					mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-38.68,49.11,dwObjId,1200)
					--mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-43.15,49.93,dwObjId,1200)
					--mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-38.68,49.11,dwObjId,7200)
					mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-43.15,49.93,dwObjId,7200)
					mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-38.68,49.11,dwObjId,13200)
					--mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-43.15,49.93,dwObjId,13200)
					--mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-38.68,49.11,dwObjId,19200)
					mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-43.15,49.93,dwObjId,19200)
					--mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-38.68,49.11,dwObjId,25200)
					mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-43.15,49.93,dwObjId,25200)
					mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-38.68,49.11,dwObjId,31200)
					--mgrMonster:DelayAdd(50702022,50702022,50702022,50702002,507020220,-43.15,49.93,dwObjId,31200)
				-----25%概率 刷小猪
				elseif (dwRand > 1500 and dwRand < 3000) then
					Map.shijian = (Map.shijian or 0) + 1	---事件计数器+1
					
					mgrMonster:DelayAdd(50702023,50702023,50702023,50702002,10050,-43.15,49.93,dwObjId,1200)
					mgrMonster:DelayAdd(50702023,50702023,50702023,50702002,10050,-38.68,49.11,dwObjId,7200)
					mgrMonster:DelayAdd(50702023,50702023,50702023,50702002,10050,-43.15,49.93,dwObjId,13200)
					mgrMonster:DelayAdd(50702023,50702023,50702023,50702002,10050,-38.68,49.11,dwObjId,19200)
					mgrMonster:DelayAdd(50702023,50702023,50702023,50702002,10050,-43.15,49.93,dwObjId,25200)
					mgrMonster:DelayAdd(50702023,50702023,50702023,50702002,10050,-38.68,49.11,dwObjId,31200)

				end

			end

		end
	--------------------到达第2个事件触发点，进行逻辑
		if (Pos.x+22.01)^2+(Pos.y+39.08)^2 < 2^2 then ---是否某个距离内
			Map.shijian = Map.shijian or 0	---定义事件计数器=本身或0
			Map.shijian03 = (Map.shijian03 or 0)+1	---第2个触发点计数器 用来控制是否多次踩点

			if Map.shijian < 1 and Map.shijian03 < 2 then	---检测第2个地点是否需要触发事件，以及控制是否多次踩点触发这个事件
				-----33%概率 刷山贼
				local dwRand = math.random(10000);
				if (dwRand < 3300) then
					Map.shijian = (Map.shijian or 0) + 1	---事件计数器+1
					
					local fnFunction = function(sysScript)
						sysScript:Story(5070002)
					end
					CScriptManager:DoFunction(Monster,fnFunction)

					mgrMonster:Add(50702013,(1000+dwLevelm+1),50702013,(21000+(math.floor((dwLevelm+1)/5)*5)),100120030,-28.21,12.31)
					mgrMonster:Add(50702013,(1000+dwLevelm+1),50702013,(21000+(math.floor((dwLevelm+1)/5)*5)),100120030,-27.85,9.62)
					mgrMonster:Add(50702013,(1000+dwLevelm+1),50702013,(21000+(math.floor((dwLevelm+1)/5)*5)),100120030,-28.39,14.92)
					mgrMonster:Add(50702013,(1000+dwLevelm+1),50702013,(21000+(math.floor((dwLevelm+1)/5)*5)),100120030,-30.21,12.76)
					mgrMonster:Add(50702013,(1000+dwLevelm+1),50702013,(21000+(math.floor((dwLevelm+1)/5)*5)),100120030,-29.94,9.37)
					mgrMonster:Add(50702013,(1000+dwLevelm+1),50702013,(21000+(math.floor((dwLevelm+1)/5)*5)),100120030,-30.51,14.69)
					mgrMonster:Add(50702014,(1000+dwLevelm+1),50702014,(21000+(math.floor((dwLevelm+1)/5)*5)),100120060,0.88,0.01)
					mgrMonster:Add(50702014,(1000+dwLevelm+1),50702014,(21000+(math.floor((dwLevelm+1)/5)*5)),100120060,0.99,-2.10)
					mgrMonster:Add(50702014,(1000+dwLevelm+1),50702014,(21000+(math.floor((dwLevelm+1)/5)*5)),100120060,1.20,2.47)
					mgrMonster:Add(50702014,(1000+dwLevelm+1),50702014,(21000+(math.floor((dwLevelm+1)/5)*5)),100120060,2.81,0.73)
					mgrMonster:Add(50702014,(1000+dwLevelm+1),50702014,(21000+(math.floor((dwLevelm+1)/5)*5)),100120060,2.99,-1.79)
					mgrMonster:Add(50702014,(1000+dwLevelm+1),50702014,(21000+(math.floor((dwLevelm+1)/5)*5)),100120060,3.61,2.39)

					local T1 = function()
					Monster:MapNotice(9000660287,7)	----警戒！！发现山贼！！！！！
					end
					local T2 = function()
					Monster:MapNotice(9000660287,7)	----警戒！！发现山贼！！！！！
					end
					local T3 = function()
					Monster:MapNotice(9000660287,7)	----警戒！！发现山贼！！！！！
					end
					local T4 = function()
					Monster:MapNotice(9000660287,7)	----警戒！！发现山贼！！！！！
					end

					Map:AddTimeEvent( 1000,T1)
					Map:AddTimeEvent( 2000,T2)
					Map:AddTimeEvent( 3000,T3)
					Map:AddTimeEvent( 4000,T4)
				-----33%概率 刷金国残军
				elseif (dwRand > 3300 and dwRand < 6600) then
					Map.shijian = (Map.shijian or 0) + 1	---事件计数器+1
					
					local fnFunction = function(sysScript)
						sysScript:Story(5070003)
					end
					CScriptManager:DoFunction(Monster,fnFunction)
					
					mgrMonster:Add(50702015,(1000+dwLevelm+1),50702015,(21000+(math.floor((dwLevelm+1)/5)*5)),100320020,-10.87,29.93)
					mgrMonster:Add(50702015,(1000+dwLevelm+1),50702015,(21000+(math.floor((dwLevelm+1)/5)*5)),100320020,-10.58,33.29)
					mgrMonster:Add(50702015,(1000+dwLevelm+1),50702015,(21000+(math.floor((dwLevelm+1)/5)*5)),100320020,-10.66,36.55)
					mgrMonster:Add(50702015,(1000+dwLevelm+1),50702015,(21000+(math.floor((dwLevelm+1)/5)*5)),100320020,-10.34,39.90)
					mgrMonster:Add(50702015,(1000+dwLevelm+1),50702015,(21000+(math.floor((dwLevelm+1)/5)*5)),100320020,-9.96,43.73)
					mgrMonster:Add(50702016,(1000+dwLevelm+1),50702016,(21000+(math.floor((dwLevelm+1)/5)*5)),100320030,-15.82,32.23)
					mgrMonster:Add(50702016,(1000+dwLevelm+1),50702016,(21000+(math.floor((dwLevelm+1)/5)*5)),100320030,-16.42,35.52)
					mgrMonster:Add(50702016,(1000+dwLevelm+1),50702016,(21000+(math.floor((dwLevelm+1)/5)*5)),100320030,-16.43,39.02)
					mgrMonster:Add(50702016,(1000+dwLevelm+1),50702016,(21000+(math.floor((dwLevelm+1)/5)*5)),100320030,-15.92,42.58)
					mgrMonster:Add(50702016,(1000+dwLevelm+1),50702016,(21000+(math.floor((dwLevelm+1)/5)*5)),100320030,-15.86,46.20)

					local T1 = function()
					Monster:MapNotice(9000660289,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end
					local T2 = function()
					Monster:MapNotice(9000660289,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end
					local T3 = function()
					Monster:MapNotice(9000660289,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end
					local T4 = function()
					Monster:MapNotice(9000660289,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end

					Map:AddTimeEvent( 1000,T1)
					Map:AddTimeEvent( 2000,T2)
					Map:AddTimeEvent( 3000,T3)
					Map:AddTimeEvent( 4000,T4)
				-----其余概率 刷蒙古接应兵
				else
					Map.shijian = (Map.shijian or 0) + 1	---事件计数器+1
					
					local fnFunction = function(sysScript)
						sysScript:Story(5070004)
					end
					CScriptManager:DoFunction(Monster,fnFunction)
					
					mgrMonster:Add(50702017,(1000+dwLevelm+1),50702017,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,34.55,-26.45)
					mgrMonster:Add(50702017,(1000+dwLevelm+1),50702017,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,34.19,-21.67)
					mgrMonster:Add(50702017,(1000+dwLevelm+1),50702017,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,33.24,-18.11)
					mgrMonster:Add(50702017,(1000+dwLevelm+1),50702017,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,32.56,-14.36)
					mgrMonster:Add(50702017,(1000+dwLevelm+1),50702017,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,32.20,-10.40)
					mgrMonster:Add(50702018,(1000+dwLevelm+1),50702018,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,29.99,-27.97)
					mgrMonster:Add(50702018,(1000+dwLevelm+1),50702018,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,28.42,-22.14)
					mgrMonster:Add(50702018,(1000+dwLevelm+1),50702018,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,27.62,-19.60)
					mgrMonster:Add(50702018,(1000+dwLevelm+1),50702018,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,26.94,-15.79)
					mgrMonster:Add(50702018,(1000+dwLevelm+1),50702018,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,26.20,-12.40)
					mgrMonster:Add(50702019,(1000+dwLevelm+1),50702019,(21000+(math.floor((dwLevelm+1)/5)*5)),100920060,32.62,-29.02)

					local T1 = function()
					Monster:MapNotice(9000660291,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end
					local T2 = function()
					Monster:MapNotice(9000660291,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end
					local T3 = function()
					Monster:MapNotice(9000660291,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end
					local T4 = function()
					Monster:MapNotice(9000660291,7)	----警戒！！发现被灭金国的残留遗兵！！！！！
					end

					Map:AddTimeEvent( 1000,T1)
					Map:AddTimeEvent( 2000,T2)
					Map:AddTimeEvent( 3000,T3)
					Map:AddTimeEvent( 4000,T4)

				end

			end

		end

end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级

	Map.lrxxx = (Map.lrxxx or 0) + 1	---地图计数器+1
		local Monster01 = mgrMonster:GetMonsterById(50702001)	---定义ID怪物为Monster01
		if #Monster01<1 and  Map.lrxxx>5 then	---怪物是否 < 1，地图计数器是否 > 5
					Map.lrxxx = 0	---地图计数器清0
					Map.shijian = 0		---特殊事件计数器清0
					Map.shijian02 = 0	---特殊事件02计数器清0 ----用来防止第1个触发点多次触发
					Map.shijian03 = 0	---特殊事件03计数器清0 ----用来防止第2个触发点多次触发
					Monster:SetDuplData(2)
					sysScript:TeamNotice(9000660285,7)
					local C1 = function()
					mgrMonster:Add(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73)
					mgrMonster:Add(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,4500)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73,dwObjId,10500)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,10500)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,15000)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73,dwObjId,21000)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,21000)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,25500)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702001,80010,-40.75,49.73,dwObjId,31500)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,31500)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,36000)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702003,80020,-40.75,49.73,dwObjId,42000)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,42000)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,46500)

					mgrMonster:DelayAdd(50702002,(1000+dwLevelm+1),50702002,50702003,80020,-40.75,49.73,dwObjId,52500)
					mgrMonster:DelayAdd(50702012,(2000+dwLevelm+1),50702012,(21000+(math.floor((dwLevelm+1)/5)*5)),100920020,-43.15,49.93,dwObjId,52500)
					mgrMonster:DelayAdd(50702011,(2000+dwLevelm+1),50702011,(21000+(math.floor((dwLevelm+1)/5)*5)),100320050,-38.68,49.11,dwObjId,57000)
					end
					
					local C2 = function()
					sysScript:TeamNotice(9000660293,7)
					end
					Map:AddTimeEvent( 30000,C1)
					Map:AddTimeEvent( 15000,C2)
		end

end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------