local dwMonsterId = 50062004
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
		
		
		local D1 = function()
				if (Pos.x-14.06)^2+(Pos.y-5.24)^2 < 2^2 then
					Map.shang01 = (Map.shang01 or 0) + 1	
					if Map.shang01 == 1 then
					
						local yidong = {
						{x=8.18,y=0.13,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x-11.11)^2+(Pos.y-8.31)^2 < 2^2 then
					Map.shang02 = (Map.shang02 or 0) + 1	
					if Map.shang02 == 1 then
					
						local yidong = {
						{x=5.50,y=2.96,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x-8.58)^2+(Pos.y-10.48)^2 < 2^2 then
					Map.shang03 = (Map.shang03 or 0) + 1	
					if Map.shang03 == 1 then
					
						local yidong = {
						{x=2.62,y=5.39,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
		end
		
		Map:AddTimeEvent( 100,D1)
		
		local D2 = function()
				if (Pos.x+10.15)^2+(Pos.y+15.77)^2 < 2^2 then
					Map.xia01 = (Map.xia01 or 0) + 1	
					if Map.xia01 == 1 then
					
						local yidong = {
						{x=-4.33,y=-9.64,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x+11.81)^2+(Pos.y+13.81)^2 < 2^2 then
					Map.xia02 = (Map.xia02 or 0) + 1	
					if Map.xia02 == 1 then
					
						local yidong = {
						{x=-6.37,y=-7.76,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x+13.76)^2+(Pos.y+11.36)^2 < 2^2 then
					Map.xia03 = (Map.xia03 or 0) + 1	
					if Map.xia03 == 1 then
					
						local yidong = {
						{x=-8.82,y=-5.60,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
		end
		
		Map:AddTimeEvent( 4000,D2)
		
		local D3 = function()
				if (Pos.x-14.01)^2+(Pos.y+10.87)^2 < 2^2 then
					Map.zuo01 = (Map.zuo01 or 0) + 1	
					if Map.zuo01 == 1 then
					
						local yidong = {
						{x=7.15,y=-4.67,dwSpeed=5.7};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x-10.78)^2+(Pos.y+13.76)^2 < 2^2 then
					Map.zuo02 = (Map.zuo02 or 0) + 1	
					if Map.zuo02 == 1 then
					
						local yidong = {
						{x=3.41,y=-8.15,dwSpeed=5.7};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x-6.84)^2+(Pos.y+17.10)^2 < 2^2 then
					Map.zuo03 = (Map.zuo03 or 0) + 1	
					if Map.zuo03 == 1 then
					
						local yidong = {
						{x=0.15,y=-10.95,dwSpeed=5.7};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
		end
		
		Map:AddTimeEvent( 2500,D3)
		
		local D4 = function()
				if (Pos.x+7.62)^2+(Pos.y-9.92)^2 < 2^2 then
					Map.you01 = (Map.you01 or 0) + 1	
					if Map.you01 == 1 then
					
						local yidong = {
						{x=-1.97,y=4.56,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x+10.58)^2+(Pos.y-6.95)^2 < 2^2 then
					Map.you02 = (Map.you02 or 0) + 1	
					if Map.you02 == 1 then
					
						local yidong = {
						{x=-5.24,y=1.53,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
				
				if (Pos.x+13.69)^2+(Pos.y-3.64)^2 < 2^2 then
					Map.you03 = (Map.you03 or 0) + 1	
					if Map.you03 == 1 then
					
						local yidong = {
						{x=-8.13,y=-1.76,dwSpeed=5};
						}
						Monster:MoveTo(yidong,true)
						
					end
				end
		end
		
		Map:AddTimeEvent( 2500,D4)
		
		
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
end
--受到攻击时执行
 function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer,dwSkillId)
 end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
