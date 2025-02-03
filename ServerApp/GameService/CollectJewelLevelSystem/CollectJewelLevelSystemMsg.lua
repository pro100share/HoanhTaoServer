--[[
	--功能：聚灵珠等级系统消息
	--作者：魏云
	--时间：2013-12-13
--]]

--玩家请求开启聚灵
define.RequestOpenCollectJewelLevelMsg
{
	user = NONE,
	CollJewType = 0;
};
when {user = NONE}
RequestOpenCollectJewelLevelMsg = checkUser;
when{}
function RequestOpenCollectJewelLevelMsg(user,CollJewType)
	local collJewSys = user:GetSystem("CCollectJewelLevelSystem");
	if not collJewSys then
		return;
	end;
	collJewSys:OpenCollectJewel(CollJewType);
end


----玩家收获
define.GetCollectJewelLevelAwardMsg
{
	user = NONE,
	CollJewType = 0;
	Level = 0;
};
when {user = NONE}
GetCollectJewelLevelAwardMsg = checkUser;
when{}
function GetCollectJewelLevelAwardMsg(user,CollJewType,Level)
	local collJewSys = user:GetSystem("CCollectJewelLevelSystem");
	if not collJewSys then
		return;
	end;
	collJewSys:GetCollectJewelAward(CollJewType,Level);
end
