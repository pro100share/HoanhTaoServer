--[[
KS端婚宴管理器消息定义
21:16 2012-7-5	create by lkj
]]

_define()

define.MarBanMgr_QueryBanquetListMsg
{
    LineID = 0
}
when{}
function MarBanMgr_QueryBanquetListMsg(LineID)
    CMarriageBanquetMgr:GSQueryBanquetList(LineID);
end;
--------
--GS婚宴管理器添加婚宴同步通知KS婚宴列表
define.MarBanMgr_AddBanquetMsg
{
	BanquetInfo = {};
    BNew = false;
}
when{}
function MarBanMgr_AddBanquetMsg(BanquetInfo, BNew)
	CMarriageBanquetMgr:AddNewBanquet(BanquetInfo, BNew);
end;
--------
--GS举办婚宴
define.MarBanMgr_BanquetStartMsg
{
	BanquetID = 0;
    Cancel = false;
}
when{}
function MarBanMgr_BanquetStartMsg(BanquetID, Cancel)
	CMarriageBanquetMgr:BanquetStart(BanquetID, Cancel);
end;
--GS结束婚宴
define.MarBanMgr_BanquetFinishMsg
{
	BanquetID = 0;
}
when{}
function MarBanMgr_BanquetFinishMsg(BanquetID)
	CMarriageBanquetMgr:BanquetFinish(BanquetID);
end;
--------
--GS预约婚宴
define.MarBanMgr_OrderBanquetMsg
{
	user	= NONE;
	HusbandRoleID = 0;
}
when{user = NONE}
MarBanMgr_OrderBanquetMsg = checkGSUser
when{}
function MarBanMgr_OrderBanquetMsg(user, HusbandRoleID)
	CMarriageBanquetMgr:OrderBanquet(user, HusbandRoleID);
end;
--GS取消预约婚宴
define.MarBanMgr_CancelOrderBanquetMsg
{
	user	= NONE;
	HusbandRoleID = 0;
}
when{user = NONE}
MarBanMgr_CancelOrderBanquetMsg = checkGSUser
when{}
function MarBanMgr_CancelOrderBanquetMsg(user, HusbandRoleID)
	CMarriageBanquetMgr:CancelOrderBanquet(user, HusbandRoleID);
end;
--------
--客户端查询婚宴列表
define.MarBanMgr_RequestBanquetListMsg
{
	user	= NONE;
}
when{user = NONE}
MarBanMgr_RequestBanquetListMsg = checkGSUser
when{}
function MarBanMgr_RequestBanquetListMsg(user)
	CMarriageBanquetMgr:RequestBanquetList(user);
end;
--------
--玩家想给某个人礼金
define.MarBanMgr_RequestGiveMarryMoneyToMsg
{
	user	= NONE;
	RoleID	= 0;
}
when{user = NONE}
MarBanMgr_RequestGiveMarryMoneyToMsg = checkGSUser
when{}
function MarBanMgr_RequestGiveMarryMoneyToMsg(user, RoleID)
	CMarriageBanquetMgr:RequestGiveMarryMoneyTo(user, RoleID);
end;
--想要给某个婚宴礼金
define.MarBanMgr_RequestGiveMarryMoneyMsg
{
	user	= NONE;
	ToBanquetID	= 0;
	Money	= 0;
}
when{user = NONE}
MarBanMgr_RequestGiveMarryMoneyMsg = checkGSUser
when{}
function MarBanMgr_RequestGiveMarryMoneyMsg(user, ToBanquetID, Money)
	CMarriageBanquetMgr:RequestGiveMarryMoney(user, ToBanquetID, Money);
end;
--记录给某个婚宴礼金
define.MarBanMgr_RecordGiveMarryMoneyMsg{
	BanquetID	= 0;
	GuestRoleID	= 0;
	GuestName	= "";
	GiftMoney	= 0;
	GuestLevel	= 0;
	BInsert		= false;
}
when{}
function MarBanMgr_RecordGiveMarryMoneyMsg(BanquetID, GuestRoleID, GuestName, GiftMoney, GuestLevel, BInsert)
	CMarriageBanquetMgr:RecordGiveMarryMoney(BanquetID, GuestRoleID, GuestName, GiftMoney, GuestLevel, BInsert);
end;

--
define.MarBanMgr_GetMarryMoneyRequestMsg
{
    user    = NONE;
	RoleID	= 0;
	IsMale	= false;
}
when{user = NONE}
MarBanMgr_GetMarryMoneyRequestMsg = checkGSUser
when{}
function MarBanMgr_GetMarryMoneyRequestMsg(user, RoleID, IsMale)
	CMarriageBanquetMgr:GetMarryMoneyRequest(user, RoleID, IsMale);
end;


define.MarBanMgr_SureGetMarryMoneyMsg
{
    RoleID = 0;
    BanquetList = {};
    IsMale = false;
}
when{}
function MarBanMgr_SureGetMarryMoneyMsg(RoleID, BanquetList, IsMale)
    CMarriageBanquetMgr:SureGetMarryMoney(RoleID, BanquetList, IsMale)
end;



