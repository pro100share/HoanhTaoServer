--联运平台礼包相关消息
------
--领取礼包  ItemIndex 礼包的配置索引
define.GetRewardMsg
{
	user = NONE,
	ItemIndex = 0,
}
when {user = NONE}
GetRewardMsg = checkUser;
when{}
function GetRewardMsg(user,ItemIndex)
	local unionPlatGiftSystem = user:GetSystem("CUnionPlatGiftSystem");
	if unionPlatGiftSystem then
		unionPlatGiftSystem:OnDrawGift(ItemIndex);
	end
end;
