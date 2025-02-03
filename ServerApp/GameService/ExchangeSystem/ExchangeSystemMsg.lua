--[[
	兑换系统
	曲莹
	2013-04-16
]]

define.ExchangeItemMsg
{
	user = NONE,
	UseBind = false,	
	Type = 0,
	Pos = 1,
	Index = 1,
}
when{ user = NONE }
ExchangeItemMsg = checkUser
when{ }
function ExchangeItemMsg(user,UseBind, Type, Pos, Index)
	local exchgSystem = user:GetSystem("CExchangeSystem");
	if not exchgSystem then
		return;
	end;
	exchgSystem:ExChangeItem(UseBind, Type, Pos, Index);
end;