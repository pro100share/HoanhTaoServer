--请求累积充值奖励
define.ReqAddiAwardMsg
{
	user = NONE, 
}
when{user = NONE}
ReqAddiAwardMsg = checkUser
when{ }
function ReqAddiAwardMsg(user)
	local fullAwardSystem = user:GetSystem("CFullAwardSys");
	if not fullAwardSystem then
		return;
	end;
	fullAwardSystem:ReqAddiAward();
end;

--请求单次充值奖励
define.ReqPerAwardMsg
{
	user = NONE, 
}
when{user = NONE}
ReqPerAwardMsg = checkUser
when{ }
function ReqPerAwardMsg(user)
	local fullAwardSystem = user:GetSystem("CFullAwardSys");
	if not fullAwardSystem then
		return;
	end;
	fullAwardSystem:ReqPerAward();
end;

----广播
define.FullAward_BroadCastMsg
{
	PlayerName	= "",
	PlayerRoleID= 0,
	Str = "";
}
when{}
function FullAward_BroadCastMsg(PlayerName, PlayerRoleID, Str)
	local n_BroadCastLevel = _G.BroadCastConfig.ShouChong;   
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= n_BroadCastLevel then
			table.insert(setNet, objPlayer.objNet);
		end;
	end;
	_groupcallout(setNet, "FullAward_BroadCastMsg", {PlayerName = PlayerName, PlayerRoleID = PlayerRoleID, Str = Str});	
end;

--同步首充领取奖励信息
define.SetFullAwardInfoMsg
{
	AddiAwardPhase = 0, 
	PerAwardPhase = 0,
}
when{}
function SetFullAwardInfoMsg(AddiAwardPhase, PerAwardPhase)
	CFullAwardManager:SetFullAwardInfo(AddiAwardPhase, PerAwardPhase);
end;

--同步首充版本时间
define.SendFullTimeMsg
{
	FullTime = 0, 
}
when{}
function SendFullTimeMsg(FullTime)
	CFullAwardManager:SetFullTime(FullTime);
end;

--请求充值
-- define.SendChargeReqMsg
-- {
	-- user = NONE, 
-- }
-- when{user = NONE}
-- SendChargeReqMsg = checkUser
-- when{ }
-- function SendChargeReqMsg(user)
	-- local fullAwardSystem = user:GetSystem("CFullAwardSys");
	-- if not fullAwardSystem then
		-- return;
	-- end;
	-- fullAwardSystem:ReqCharge();
-- end;


