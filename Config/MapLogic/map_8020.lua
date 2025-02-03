local dwMapID = 8020;
local MapLogic = {};
----------------------------------------------------------------------------
--MapId 地图ID，dwMonsterId 怪物ID，dwFightId 战斗ID，dwAIId AI，dwDropId 掉落
--objScriptSys:AddMonSP(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwDelay)
function MapLogic:UpdateForPlayer(objWar,objPlayer)
	if objWar.isDeling then
		return;
	end
	
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	if not objWarSystem then
		return;
	end
	if not objWar then
		return;
	end
	--每分钟奖励
	War_MapAddition:LeaderReward(objWar,objPlayer,objWarSystem)
end;

--区域回调事件
function MapLogic:EventAreaChange(map,objPlayer,dwOldArea,dwNewArea)
	--取得当前地图对象
	local objCurMap = nil;
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	
	if not objScriptSys then
		return;
	end
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	if objMapSystem then
		objCurMap = objMapSystem:GetCurMap();
	end
	--核心区域
	if (dwNewArea == 1) then
		objScriptSys:Notice(6001047030,7);
	--城内
	elseif (dwNewArea == 2) then
		objScriptSys:Notice(6001047031,7);
		--离开核心区域删除盟主
		_G.Allies_Delete(objPlayer)
	--城外
	elseif (dwNewArea == 0) then
		objScriptSys:Notice(6001047032,7);
	end
end

--删除盟主
function _G.Allies_Delete(objPlayer,objDeader,Indicate)
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	if not objWarSystem then
		return
	end
	
	local dwRoleID = 0;
	if (objDeader) then
		dwRoleID = objDeader:GetRoleID()
	else
		dwRoleID = objPlayer:GetRoleID()
	end

	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	if not objWar then
		return
	end
	
	local number = objWar:IsSplMember(dwRoleID)
	
	if (number) then
		local Iem = objWar:GetSplLength(dwRoleID)		
		if (Iem > WarAddition.MengZhu.Count) then
			if not(Indicate) then
				return
			end
		end
		objWar:RmvSplMember(dwRoleID)
		local objScriptSys = objPlayer:GetSystem("CScriptSystem");
		if not objScriptSys then
			return;
		end
		local Monster = objScriptSys:GetMonsterById(80202099)
		if (#Monster == 0) then
			CScriptManager:Notice(SysStringConfigInfo[6001047018],6,false,8020,15,25,SysStringConfigInfo[71])
			local count = function()
				CScriptManager:AddMonToMap(8020,80202099,80202099,80202099,-1,10110,-0.2765,64.2726)
			end
			CTimer:AddTimer( 1000*5, bPause, count, Param )
		end
	end
	
	
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------