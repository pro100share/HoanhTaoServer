local dwMonsterId = 30000002	--BOSS
local MonsterScript = {}
-------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end

--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	--获取热更新配置
	local data = ActivityConfig.Revive[dwMonsterId]
	
	local Name = data.id.Name
	
	if (data) then
		data.Loop = data.Loop or 0;
		if (data.Loop > 0) then
			if data.Data and data.Data[data.Loop]then
				Name = data.Data[data.Loop].Name
			end
		end
	end
	-- data.Loop = data.Loop or 0;
	-- local Name = "";
	-- if (data.Loop == 0) then
		-- Name = data.id.Name
	-- else
		-- Name = data.Data[data.Loop].Name
	-- end
	Monster:SetSendData(1,Name)
end

--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local data = ActivityConfig.Revive[dwMonsterId]
	if (data) then
		data.Loop = data.Loop + 1;
		--获取怪物复活状态
		local Condition = ActivityConfig.Monster[dwMonsterId].value
		if (data.Loop <= data.Amount and Condition) then
			local Map = Monster:GetMap()
			local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
			local Mon_id = Monster:GetID()
			--没有数据时执行原有数据
			if data.Data and data.Data[data.Loop] then
				--有数据时采用获取到的数据
				local t = data.Data[data.Loop]
				if (t) then
					mgrMonster:Add(Mon_id,t.fight_id,t.ai_id,t.drop_id,t.Look_id,data.pos.x,data.pos.y,nil);
				end
			else
				local m = ActivityConfig.Revive[dwMonsterId].id
				mgrMonster:Add(Mon_id,m.fight_id,m.ai_id,m.drop_id,m.Look_id,data.pos.x,data.pos.y,nil);
			end
		end
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------