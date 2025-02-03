﻿local dwMonsterId = 50740006	--BOSS
local MonsterScript = {}
-- local tt = 0
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
	DuplAddition[1017].Mark = DuplAddition[1017].Mark+1;
	print( "DuplAddition[1017].Mark=============================",DuplAddition[1017].Mark )
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	-- print( "********************************************333333333333333333333333333333333333" )
	-- print( "********************************************333333333333333333333333333333333333" )
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(50700020,1,Monster)	
	-- print( "********************************************22222222222222222222222222222222222222" )
	-- print( "********************************************22222222222222222222222222222222222222" )
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	
end
-----每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)

	-- print( "********************************************111111111111111111111111111111111111" )
	-- print( "********************************************111111111111111111111111111111111111" )
	-- print( "********************************************111111111111111111111111111111111111" )
	-- print( "********************************************111111111111111111111111111111111111" )
	-- print( "********************************************111111111111111111111111111111111111" )
	-- print( "********************************************111111111111111111111111111111111111" )

	local tmNow = GetCurTime()

	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	---获得怪物坐标
	Monster.xiaozhu = (Monster.xiaozhu  or tmNow)
	
	if tmNow - Monster.xiaozhu >= 40000 then
			local Pos = Monster:GetVectorPos()	
			mgrMonster:DelayAdd(50740007,50502010,50740007,10092003,50740007,Pos.x,Pos.y,dwObjId,10)
			Monster:Remove()
	end
	local Pos = Monster:GetVectorPos()	
	if ((Pos.x-9.90)^2+(Pos.y+16.31)^2 < 9) or ((Pos.x+7.17)^2+(Pos.y-6.47)^2 < 9) then
		local tempPlayer = nil;
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(50700023,3,Monster)
		
		Monster.zhujuan = Monster.zhujuan or tmNow
		print( "tmNow - Monster.zhujuan==============",tmNow - Monster.zhujuan )
		
		if tmNow - Monster.zhujuan >= 5000 then
			print( "111111111111==============11111111111111=======0606" )
				Monster:Remove()		
				local Players = Map:GetAllPlayer()			--获得地图中的所有玩家
				for _,objPlayer in pairs(Players) do
					local sysDupl = objPlayer:GetSystem("CDuplSystem")
					if sysDupl:IsInFb() then
						sysDupl:SetKillNum(Monster:GetMonsterType(), 1,Monster:GetID())
					end
					break;
				end
				print( "22222222222==============2222222222222=======0606" )
				local dwAllLevel = 0						
				local dwPlayerNum = 0
				for _,objPlayer in pairs(Players) do
					dwAllLevel = dwAllLevel + objPlayer:GetLevel()
					dwPlayerNum = dwPlayerNum + 1
					-- print( "dwPlayerNum===================",dwPlayerNum )
				end
				local EquallyLevel = math.floor(dwAllLevel/dwPlayerNum)
					-- print( "EquallyLevel===================",EquallyLevel )
				DuplAddition[1017]:AddExp(EquallyLevel,Players,1)
				print( "333333333333==============33333333333333=======0606" )
				-- print( "DuplAddition[1017].Mark=============================",DuplAddition[1017].Mark )
				
				for _,objPlayer in pairs(Players) do
							tempPlayer = objPlayer;
						break;
					end		
				local objScriptSys = tempPlayer:GetSystem("CScriptSystem");
				if not objScriptSys then
					return ;
				end
				
				if DuplAddition[1017].Mark >= 10 then		--如果标记为5	
					-- print( "444444444444==============44444444444444=======0606" )
					local Monster = objScriptSys:GetMonsterById(50740001)
					-- print( "Monster=============================",#Monster )
					local Monster1 = objScriptSys:GetMonsterById(50740002)
					-- print( "Monster1=============================",#Monster1 )
					local Monster2 = objScriptSys:GetMonsterById(50740003)
					-- print( "Monster2=============================",#Monster2 )
					local Monster3 = objScriptSys:GetMonsterById(50740004)
					-- print( "Monster3=============================",#Monster3 )
					local Monster4 = objScriptSys:GetMonsterById(50740006)
					-- print( "Monster4=============================",#Monster4 )
					local Monster5 = objScriptSys:GetMonsterById(50740007)
					-- print( "Monster5=============================",#Monster5 )
					local Monster6 = objScriptSys:GetMonsterById(50740008)
					-- print( "Monster6=============================",#Monster6 )
					local Monster7 = objScriptSys:GetMonsterById(50740009)
					-- print( "Monster7=============================",#Monster7 )
					if (#Monster==0) and (#Monster1==0) and (#Monster2==0) and (#Monster3==0) and (#Monster4==0) and (#Monster5==0) and (#Monster6==0) and (#Monster7==0) then
						local TeamSystem = tempPlayer:GetSystem("CTeamSystem")
						local memberTbl = TeamSystem:GetTeamLeaguer()
						if memberTbl then
							for i,memberId in ipairs(memberTbl) do
								local objPlayer1 = CMapManager:GetPlayer(memberId)			
								local sysKill = objPlayer1:GetSystem("CSkillSystem");
								if sysKill then
									--添加小猪技能
									sysKill:DoDelSkill(52000);
									sysKill:DoDelSkill(52001);
								end
							end;
						end
						local duplSystem = tempPlayer:GetSystem("CDuplSystem");
						duplSystem.objCurDupl:ShowCountDown();	
						DuplAddition[1017].Mark = 0
					end 
					
				end
				
				-- print( "555555555555==============555555555555=======0606" )
		
		end

	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------