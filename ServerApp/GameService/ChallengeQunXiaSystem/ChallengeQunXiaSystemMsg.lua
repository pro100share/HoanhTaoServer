--挑战群侠的相关消息
------
--开始挑战
define.ChallengeQunXiaMsg
{
	user 			= NONE,
	PrestigeLevel	= 0;
	QunXiaID		= 0;
	
}
when {user = NONE}
ChallengeQunXiaMsg = checkUser;
when{}
function ChallengeQunXiaMsg(user,PrestigeLevel, QunXiaID)
	local challengeSystem = user:GetSystem("CChallengeQunXiaSystem");
	if challengeSystem then
		challengeSystem:ChallengeQunXia(PrestigeLevel, QunXiaID);
	end
end;


--退出挑战
define.QunXiaDuplExitMsg
{
	user 			= NONE,
}
when {user = NONE}
QunXiaDuplExitMsg = checkUser;
when{}
function QunXiaDuplExitMsg(user)
	local challengeSystem = user:GetSystem("CChallengeQunXiaSystem");
	if challengeSystem then
		challengeSystem:ExitDupl();
	end
end;

--死亡 请求退出
define.QunXiaDeadExitMsg
{
	user 			= NONE,
	DuplID			= 0,
}
when {user = NONE}
QunXiaDeadExitMsg = checkUser;
when{}
function QunXiaDeadExitMsg(user, DuplID)
	local challengeSystem = user:GetSystem("CChallengeQunXiaSystem");
	if challengeSystem then
		--如果是群侠副本 角色死亡直接判定挑战失败
		if _G.ChallengeQunXiaConfig.IsQunXiaFB(DuplID) then
			local duplSystem = user:GetSystem("CDuplSystem");
			duplSystem:LeaveDuplByDel()
			user.QunXiaExitDuplSuccMsg{}
			--duplSystem.mapInfo = nil;
			
			local battleSystem = user:GetSystem("CBattleSystem");
			if not battleSystem then 
				_err("QunXiaDeadExitMsg relive cant find battleSystem")
			end
			
			battleSystem:DealQunXiaRelive()
		end
	end
end;