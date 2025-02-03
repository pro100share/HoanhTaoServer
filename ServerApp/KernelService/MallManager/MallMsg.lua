define.OnRequestMallInfoMsg
{
	LineID = 0;
}
when{}
function OnRequestMallInfoMsg(LineID)
	CMallManager:SendInfoToGS(LineID);
end;

define.OnTryBuyItemMsg
{
	RoleID = 0;
	MallID = 0;
}
when{}
function OnTryBuyItemMsg(RoleID,MallID)
	CMallManager:TryBuyItem(RoleID,MallID);
end;

define.OnTryChooseLuckDraMsg
{
	RoleID = 0;
}
when{}
function OnTryChooseLuckDraMsg(RoleID)
	CMallManager:GetLuckDrawList(RoleID);
end;