--[[
--宝箱系统消息
--曲莹
--2013-08-19
]]--
define.ReqSendChestAwardMsg
{
	user = NONE, 
	InstId = 0,
}
when{ user = NONE }
ReqSendChestAwardMsg = checkUser
when{ }
function ReqSendChestAwardMsg(user, InstId)
	local chestSystem = user:GetSystem("CChestSystem");
	if not chestSystem then
		return;
	end;
	chestSystem:SendChestAward(InstId);
end;