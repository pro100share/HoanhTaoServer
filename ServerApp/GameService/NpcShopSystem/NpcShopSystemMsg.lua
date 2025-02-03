--
define.ServNpcShopMsg
{
	user = NONE,
	Type =  NpcShopMsgConfig.invalid,
	ItemID = 0,
	Opt = 0,
}
when{ user = NONE }
ServNpcShopMsg = checkUser
when{ }
function ServNpcShopMsg(user,Type,ItemID,Opt)
	if CConfig.bIsCrossSvr then
		return
	end
	
    local npcShopSystem = user:GetSystem("CNpcShopSystem");
	if not npcShopSystem then
		return;
	end;

	npcShopSystem:DecodeMsg(Type,ItemID,Opt);
end

