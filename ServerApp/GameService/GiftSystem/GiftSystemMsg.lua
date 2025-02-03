
--鳳獰婦
define.ServGetGiftMsg
{
	user = NONE, 
	Type = -1,
	Serial = -1,
}
when{ user = NONE }
ServGetGiftMsg = checkUser
when{ }
function ServGetGiftMsg(user,Type,Serial)
    local giftSystem = user:GetSystem("CGiftSystem");
	if not giftSystem then
		return;
	end;
	giftSystem:GetGift(Type,Serial);
end

-------嫘畦
define.ServGiftUniCastMsg
{
	user = NONE, 
	Type = -1,
	GiftID = -1,
	RoleName = '',
	RoleID = -1,
}
when{ user = NONE }
ServGiftUniCastMsg = checkUser
when{ }
function ServGiftUniCastMsg(user,Type,GiftID,RoleName,RoleID)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetLevel() >=  BroadCastConfig.Gift then
			table.insert(setNet, objPlayer.objNet);
		end
	end;
	_groupcallout(setNet, "CltDecodeMsg", {Param = {GiftConfig.enumGiftType.UniCast,GiftID,RoleName,RoleID}});
end