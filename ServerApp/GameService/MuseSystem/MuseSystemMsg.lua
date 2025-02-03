--[[
功能：闭关系统的消息
作者：刘炜
时间：2012-2-8
]]

define.GetMuseValueRequestMsg
{
	user = NONE,
	DoubleGet = false, --是否为双倍领取，true-是双倍，flase-不是双倍
};
when{user = NONE}
GetMuseValueRequestMsg = checkUser;
when{}
function GetMuseValueRequestMsg(user,DoubleGet)
	local MuseSystem = user:GetSystem("CMuseSystem");
	if not MuseSystem then
		return;
	end;
	MuseSystem:GetMuseValue(DoubleGet);
end;

--申请某人的闭关数据
define.OnRequestRoleMuseMsg
{
	user = NONE,
	RoleID = 0;
}
when{user = NONE}
OnRequestRoleMuseMsg = checkUser;
when{}
function OnRequestRoleMuseMsg(user,RoleID)
	local objMuseSys = user:GetSystem("CMuseSystem");
	if not objMuseSys then
		return;
	end;
	
	objMuseSys:GetRoleInjectInfo(RoleID);
end;

--给某人灌注
define.OnInjectMuseMsg
{
	user = NONE,
	RoleID = 0;
}
when{user = NONE}
OnInjectMuseMsg = checkUser;
when{}
function OnInjectMuseMsg(user,RoleID)
	local objMuseSys = user:GetSystem("CMuseSystem");
	if not objMuseSys then
		return;
	end;
	
	objMuseSys:InjectMuse(RoleID);
end;

--领取奖励
define.OnGetInjectPrizeMsg
{
	user = NONE,
}
when{user = NONE}
OnGetInjectPrizeMsg = checkUser;
when{}
function OnGetInjectPrizeMsg(user)
	local objMuseSys = user:GetSystem("CMuseSystem");
	if not objMuseSys then
		return;
	end;
	
	objMuseSys:GetMyGift();
end;

