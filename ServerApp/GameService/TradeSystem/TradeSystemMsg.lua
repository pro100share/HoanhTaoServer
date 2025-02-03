--
define.ServTradeMsg
{
	user = NONE,
	Type =  TradeMsgConfig.invalid,
	RoleID = 0,
}
when{ user = NONE }
ServTradeMsg = checkUser
when{ }
function ServTradeMsg(user,Type,RoleID)
 --    local tradeSystem = user:GetSystem("CTradeSystem");
	-- if not tradeSystem then
	-- 	return;
	-- end;
	-- tradeSystem:DecodeMsg(Type,RoleID);
end

define.ServTradingMsg
{
	user = NONE,
	Type =  TradeMsgConfig.invalid,
	ItemID = 0,
	Pos = 0,
}
when{ user = NONE }
ServTradingMsg = checkUser
when{ }
function ServTradingMsg(user,Type,ItemID)
	-- if CConfig.bIsCrossSvr then
	-- 	return;
	-- end
	
 --    local tradeSystem = user:GetSystem("CTradeSystem");
	-- if not tradeSystem then
	-- 	return;
	-- end;

	-- tradeSystem:DecodeTradeMsg(Type,ItemID);
end

--换地图
define.ServTradingChangeMapMsg
{
	user = NONE,
}
when{ user = NONE }
ServTradingChangeMapMsg = checkUser
when{ }
function ServTradingChangeMapMsg(user)
 --    local tradeSystem = user:GetSystem("CTradeSystem");
	-- if not tradeSystem then
	-- 	return;
	-- end;
	-- -- print('server recv trade map')
	-- tradeSystem:TradeChangeMap();
end
