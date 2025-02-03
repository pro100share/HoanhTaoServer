

--客户端摇奖
define.OLGSys_RandAwardMsg
{
	user = NONE
}
when{user = NONE}
OLGSys_RandAwardMsg = checkUser;
when{}
function OLGSys_RandAwardMsg(user)
	if user then
		local objOnlineGiftSystem = user:GetSystem("COnlineGiftSystem");
		if not objOnlineGiftSystem then 
			_err("can not find user's COnlineGiftSystem by OLGSys_RandAwardMsg");
			return; 
		end;
		objOnlineGiftSystem:RandAward();
	end;
end;

--客户端领奖
define.OLGSys_GetAwardMsg
{
	user = NONE
}
when{user = NONE}
OLGSys_GetAwardMsg = checkUser;
when{}
function OLGSys_GetAwardMsg(user)
	if user then
		local objOnlineGiftSystem = user:GetSystem("COnlineGiftSystem");
		if not objOnlineGiftSystem then 
			_err("can not find user's COnlineGiftSystem by OLGSys_GetAwardMsg");
			return; 
		end;
		objOnlineGiftSystem:GetAward(QuestTable);
	end;
end;



