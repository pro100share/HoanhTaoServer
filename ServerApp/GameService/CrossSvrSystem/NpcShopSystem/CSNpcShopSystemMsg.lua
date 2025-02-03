--
define.CSServNpcShopMsg
{
	user = NONE,
	Type =  CSNpcShopMsgConfig.invalid,
	ItemID = 0,
	Opt = 0,
}
when{ user = NONE }
CSServNpcShopMsg = checkUser
when{ }
function CSServNpcShopMsg(user,Type,ItemID,Opt)
    local npcShopSystem = user:GetSystem("CCSNpcShopSystem");
	if not npcShopSystem then
		return;
	end;

	npcShopSystem:DecodeMsg(Type,ItemID,Opt);
end

