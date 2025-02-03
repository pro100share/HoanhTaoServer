local dwMonsterId = 50740007	--BOSS
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 507400001,1,0
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

end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(50700021,1,Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
	local Map = sysMap:GetCurMap()				----获取玩家所在地图
	if not Map then
		return ;
	end

	local Players = Map:GetAllPlayer()			--获得地图中的所有玩家
	for _,objPlayer in pairs(Players) do
		local sysDupl = objPlayer:GetSystem("CDuplSystem")
		if sysDupl:IsInFb() then
			-- print( "-------------2222222222-------------" )
			sysDupl:SetKillNum(Monster:GetMonsterType(), 1,Monster:GetID())
		end
		break;
	end		
	
	
	local Players = Map:GetAllPlayer()			--获得地图中的所有玩家
	local dwAllLevel = 0						
	local dwPlayerNum = 0
	for _,objPlayer in pairs(Players) do
		dwAllLevel = dwAllLevel + objPlayer:GetLevel()
		dwPlayerNum = dwPlayerNum + 1
	end
	local EquallyLevel = math.floor(dwAllLevel/dwPlayerNum)
	local tempPlayer = nil;
	DuplAddition[1017]:AddExp(EquallyLevel,Players,3)
	for _,objPlayer in pairs(Players) do
		tempPlayer = objPlayer;
		break;
	end	
	if not tempPlayer then 
		return ;
	end
	local objScriptSys = tempPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return ;
	end
	if DuplAddition[1017].Mark >= 10 then		--如果标记为5	
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
end
-----每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
	

	
	
	if ((Pos.x-9.90)^2+(Pos.y+16.31)^2 < 9) or ((Pos.x+7.17)^2+(Pos.y-6.47)^2 < 9) then
		-- print( "---------------**************sysMonsterBuff:AddBuff50700023-******************-------------" )
		local tempPlayer = nil;
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(50700023,1,Monster)
		
		local tmNow = GetCurTime()
		-- print( "tmNow===================================",tmNow )
		Monster.cout = Monster.cout or tmNow
		-- print( "Monster.cout===================================",Monster.cout )
		

		
		-- Map.cout = (Map.cout or 0)+1

		
		-- print( "tmNow - Monster.cout===================================",tmNow - Monster.cout )

		if tmNow - Monster.cout >= 5000 then
		-- print( "111111111111==============11111111111111=======0707" )
			-- print( "89989898989===================================89989898989" )
			-- if(Map.cout % 5 == 0  ) then
			Monster:Remove()
			
			local Players = Map:GetAllPlayer()			--获得地图中的所有玩家
			for _,objPlayer in pairs(Players) do
				local sysDupl = objPlayer:GetSystem("CDuplSystem")
				if sysDupl:IsInFb() then
					-- print( "-------------2222222222-------------" )
					sysDupl:SetKillNum(Monster:GetMonsterType(), 1,Monster:GetID())
				end
				break;
			end				
			-- print( "22222222222==============2222222222222=======0707" )
			 local Players = Map:GetAllPlayer()			--获得地图中的所有玩家
			 local dwAllLevel = 0						
			 local dwPlayerNum = 0
			 for _,objPlayer in pairs(Players) do
				dwAllLevel = dwAllLevel + objPlayer:GetLevel()
				dwPlayerNum = dwPlayerNum + 1
			 end
			local EquallyLevel = math.floor(dwAllLevel/dwPlayerNum)
			DuplAddition[1017]:AddExp(EquallyLevel,Players,3)
			-- print( "333333333333==============3333333333333333=======0707" )
			-- print( "DuplAddition[1017].Mark=============================",DuplAddition[1017].Mark )
			for _,objPlayer in pairs(Players) do
				tempPlayer = objPlayer;
				break;
			end	
			if not tempPlayer then 
				return ;
			end
			local objScriptSys = tempPlayer:GetSystem("CScriptSystem");
			if not objScriptSys then
				return ;
			end
			if DuplAddition[1017].Mark >= 10 then		--如果标记为5	
			-- print( "44444444444444==============44444444444444444=======0707" )
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
				
				-- print( "5555555555==============55555555555=======0707" )
		end
		
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------

















-- --死亡时执行
-- function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)

	-- local TeamSystem = objPlayer:GetSystem("CTeamSystem")
	-- local memberTbl = TeamSystem:GetTeamLeaguer()
	
	-- if not memberTbl then
		-- return;
	-- end
	
	-- Monster:MapNotice(9000660826,7)	
	
	-- if (#memberTbl)==0 then
		-- local objBuffSys = objPlayer:GetSystem("CBuffSystem");
		-- objBuffSys:AddBuff(50600003,1);
	-- else
		-- for i,memberId in ipairs(memberTbl) do
			-- local objPlayer = CMapManager:GetPlayer(memberId)			
			-- local objBuffSys = objPlayer:GetSystem("CBuffSystem");
			-- if objBuffSys then
				-- objBuffSys:AddBuff(50600003,1);
			-- end
		-- end;
	-- end	
	
-- end


-- --设置怪物经验
-- function CMonster:SetExp(dwExp)
	-- self.DataInfo.exp = dwExp
-- end
-- --获取怪物基础经验
-- function CMonster:GetBaseExp()
	-- return self.Data.dwBaseExp
-- end

-- --获取怪物等级
-- function CMonster:GetLevel()
	-- return self.DataInfo.dwLevel
-- end