local dwMapID = 8030;
local MapLogic = {};
----------------------------------------------------------------------------
--战场每分钟回调
function MapLogic:UpdateForPlayer(objWar,objPlayer)
	if objWar.isDeling then
		return;
	end

	--WarAddition[10040]:Award(objWar,objPlayer)
	
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return;
	end
	local dwRoleID = objPlayer:GetRoleID()
	if not dwRoleID then
		return
	end
	local JiFen = 0;
	--检测令牌归属
	for loop = 80302001,80302004 do
		local Monster = CScriptManager:GetMon(8030,loop)
		if (Monster[1]) then
			local dwTpye = Monster[1]:GetOwnerType()
			local dwID = Monster[1]:GetOwnerID()
			local JiFen = WarAddition[10040].Base.Mark[Monster[1]:GetID()] or 0;
			--判定归属
			if (dwID == dwRoleID) then
				objWar:SetWarTeamScore(objPlayer,JiFen)
			end
		end
	end
end;

--进入
function MapLogic:EventPlayerEnter(map,objPlayer)
	local objCurMap = nil;
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return;
	end
	
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Zhi = objWar:GetWarTeamScore(objPlayer)
	if (Zhi == 0) then
		--强制增加一分
		objWar:SetWarTeamScore(objPlayer,1)
	end
	objScriptSys:Notice(13009000006,7);
end



----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------