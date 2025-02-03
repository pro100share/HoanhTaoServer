--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50740001
----------------------------------------------
-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	print("zcs11111111111111")
	if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		print("zcs2222222222")

		local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
		local dwLevelt = sysScript:GetDuplLevel() ---获得创建副本的等级
		local Map = sysMap:GetCurMap()				----获取玩家所在地图
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		--sysScript:TeamNotice(183)	----下一波金军将在15秒之后出现，请做好万全准备！
	
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		if duplSystem:IsInDupl() then
			-- objPlayer:TeamNotice(50740001,7)
			objPlayer:GetSystem("CScriptSystem"):TeamNotice(50740001,7)
		end
				--objPlayer:GetSystem("CScriptSystem"):Notice(SysStringConfigInfo[50740002],7)
		
		local TeamSystem = objPlayer:GetSystem("CTeamSystem")
		local memberTbl = TeamSystem:GetTeamLeaguer()
		if memberTbl then
			for i,memberId in ipairs(memberTbl) do
				local objPlayer1 = CMapManager:GetPlayer(memberId)			
				local sysKill = objPlayer1:GetSystem("CSkillSystem");
				if sysKill then
					--添加小猪技能
					sysKill:DoAddTempSkill(52000);
					sysKill:DoAddTempSkill(52001);
				end
			end;
		end
		
		--------------------------------------第一波猪
		local A1 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local A2 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local A3 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local A4 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		
		-------------------------------第二波猪
		local B1 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local B2 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local B3 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local B4 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local B5 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local B6 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local B7 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local B8 = function()
			local dwRand = math.random(1,10000);
				if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		---------------------------第三波猪
		local C1 = function()
			mgrMonster:Add(50740003,50502010,50740003,10092003,50740003,-15.93,-24.16,dwDelay)
			mgrMonster:Add(50740003,50502010,50740003,10092003,50740003,-26.49,-14.47,dwDelay)
		end
		local C2 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local C3 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local C4 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local C5 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local C6 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local C7 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		-------------------------第四波猪
		local D1 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D2 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D3 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D4 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D5 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D6 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D7 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D8 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D9 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		local D10 = function()
			mgrMonster:Add(50740003,50502010,50740003,10092003,50740003,-16.63,-24.1,dwDelay)
			mgrMonster:Add(50740003,50502010,50740003,10092003,50740003,-29.1,-5.90,dwDelay)
		end
		local D11 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740001,50502010,50740001,10092003,50740001,-14.24,-11.23,dwDelay)
			end
		end
		-------------------------------第五波猪
		local E1 = function()
		    mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-16.63,-24.1,dwDelay)
			mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-29.1,-5.90,dwDelay)
		end
		local E2 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E3 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740008,50502010,50740008,10092003,50740008,-14.24,-11.23,dwDelay)
			end
		end
		local E4 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E5 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E6 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E7 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E8 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E9 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E10 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E11 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local E12 = function()
			local dwRand = math.random(1,10000);
			if (dwRand < 1250) then
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-3.35,-20.78,dwDelay)
				elseif (dwRand <2500 and dwRand >=1250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-2.3,-14.45,dwDelay)
				elseif (dwRand <3750 and dwRand >= 2500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-4.12,-10.45,dwDelay)
				elseif (dwRand <5000 and dwRand >= 3750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-8.35,-6.10,dwDelay)
				elseif (dwRand <=6250 and dwRand >= 5000) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-13.22,-3.95,dwDelay)
				elseif (dwRand <=7500 and dwRand >= 6250) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-18.51,-3.1,dwDelay)
				elseif (dwRand <=8750 and dwRand >= 7500) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-10.5,-15.45,dwDelay)
				elseif (dwRand <=10000 and dwRand >= 8750) then 
					mgrMonster:Add(50740006,50502010,50740006,10092003,50740006,-14.24,-11.23,dwDelay)
			end
		end
		local T1 = function()
				local duplSystem = objPlayer:GetSystem("CDuplSystem");
					if duplSystem:IsInDupl() then
						-- objPlayer:TeamNotice(50740001,7)
						objPlayer:GetSystem("CScriptSystem"):TeamNotice(50740002,7)
					end
				--objPlayer:GetSystem("CScriptSystem"):Notice(SysStringConfigInfo[50740002],7)
				end
		local T2 = function()
				local duplSystem = objPlayer:GetSystem("CDuplSystem");
					if duplSystem:IsInDupl() then
						-- objPlayer:TeamNotice(50740001,7)
						objPlayer:GetSystem("CScriptSystem"):TeamNotice(50740003,7)
					end
				--objPlayer:GetSystem("CScriptSystem"):Notice(SysStringConfigInfo[50740002],7)
				end
		local T3 = function()
				local duplSystem = objPlayer:GetSystem("CDuplSystem");
					if duplSystem:IsInDupl() then
						-- objPlayer:TeamNotice(50740001,7)
						objPlayer:GetSystem("CScriptSystem"):TeamNotice(50740004,7)
					end
				--objPlayer:GetSystem("CScriptSystem"):Notice(SysStringConfigInfo[50740002],7)
				end
		local T4 = function()
				local duplSystem = objPlayer:GetSystem("CDuplSystem");
					if duplSystem:IsInDupl() then
						-- objPlayer:TeamNotice(50740001,7)
						objPlayer:GetSystem("CScriptSystem"):TeamNotice(50740005,7)
					end
				--objPlayer:GetSystem("CScriptSystem"):Notice(SysStringConfigInfo[50740002],7)
				end
		-- local T5 = function()
				--objPlayer:GetSystem("CScriptSystem"):Notice(SysStringConfigInfo[50740006],7)	
				-- objPlayer:GetSystem("CScriptSystem"):TeamNotice(50740006,7)
				-- end
		local T6 = function()
				local TeamSystem = objPlayer:GetSystem("CTeamSystem")
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
				end
		-- local T7 = function()
				-- local duplSystem = objPlayer:GetSystem("CDuplSystem");
				-- duplSystem.objCurDupl:ShowCountDown();	
				-- end
				
			
		--------------------------延迟脚本
		Map:AddTimeEvent(5000,A1)
		Map:AddTimeEvent(32000,A2)
		Map:AddTimeEvent(70000,A3)
		Map:AddTimeEvent(105000,A4)
		Map:AddTimeEvent(120000,T1)------------------2min--120000
		Map:AddTimeEvent(130000,B1)
		Map:AddTimeEvent(150000,B2)
		Map:AddTimeEvent(165000,B3)
		Map:AddTimeEvent(180000,B4)
		Map:AddTimeEvent(195000,B5)
		Map:AddTimeEvent(210000,B6)
		Map:AddTimeEvent(220000,B7)
		Map:AddTimeEvent(230000,B8)
		Map:AddTimeEvent(240000,T2)--------------------2min--240000
		Map:AddTimeEvent(245000,C1)
		Map:AddTimeEvent(255000,C2)
		Map:AddTimeEvent(270000,C3)
		Map:AddTimeEvent(290000,C4)
		Map:AddTimeEvent(310000,C5)
		Map:AddTimeEvent(330000,C6)
		Map:AddTimeEvent(355000,C7)
		Map:AddTimeEvent(360000,T3)---------------2min--360000
		Map:AddTimeEvent(365000,D1)
		Map:AddTimeEvent(380000,D2)
		Map:AddTimeEvent(400000,D3)
		Map:AddTimeEvent(410000,D4)
		Map:AddTimeEvent(420000,D5)
		Map:AddTimeEvent(428000,D6)
		Map:AddTimeEvent(435000,D7)
		Map:AddTimeEvent(440000,D8)
		Map:AddTimeEvent(445000,D9)
		Map:AddTimeEvent(450000,D10)
		Map:AddTimeEvent(475000,D11)
		Map:AddTimeEvent(480000,T4)-----------------------2min---480000
		Map:AddTimeEvent(485000,E1)
		Map:AddTimeEvent(490000,E2)
		Map:AddTimeEvent(515000,E3)
		Map:AddTimeEvent(520000,E4)
		Map:AddTimeEvent(527000,E5)
		Map:AddTimeEvent(534000,E6)
		Map:AddTimeEvent(545000,E7)
		Map:AddTimeEvent(555000,E8)
		Map:AddTimeEvent(564000,E9)
		Map:AddTimeEvent(575000,E10)
		Map:AddTimeEvent(585000,E11)
		Map:AddTimeEvent(595000,E12)------------------------600000
		--Map:AddTimeEvent(660000,T5)
		Map:AddTimeEvent(59*60*1000,T6)
		-- Map:AddTimeEvent(661000,T7)
		
		objNpc.ZKNTemp = objNpc.ZKNTemp or true

	else
		sysScript:Notice(9000660552)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
