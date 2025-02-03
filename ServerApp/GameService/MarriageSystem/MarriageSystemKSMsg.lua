--[[
功能：GS婚姻系统消息
	KS与GS婚姻系统通信
版本：
	v1.0	19:57 2012-7-6 create by lkj
]]


--结婚信物更改
define.MarMgr_KeepsakeChangeMsg
{
    user        = NONE,
    ItemEnumID  = 0
}
when{user = NONE}
MarMgr_KeepsakeChangeMsg = checkKSUser;
when{}
function MarMgr_KeepsakeChangeMsg(user, ItemEnumID)
    local marSystem = user:GetSystem("CMarriageSystem");
	if not marSystem then
        _err("cannot get marSystem!!!");
        return
    end;
	marSystem:KeepsakeBeChangedOnline(ItemEnumID);
end;

define.MarMgr_DivorceMsg
{
    user        = NONE,
    Compel      = false
}
when{user = NONE}
MarMgr_DivorceMsg = checkKSUser;
when{}
function MarMgr_DivorceMsg(user, Compel)
    local marSystem = user:GetSystem("CMarriageSystem");
	if not marSystem then
        _err("cannot get marSystem!!!");
        return
    end;
    if Compel then
        marSystem:BeCompelDivorceToOnline();
    else
        marSystem:DivorceAccepted();
    end;
end;


define.MarBanMgr_PrepareBanquetMsg
{
    List = {};
}
when{}
function MarBanMgr_PrepareBanquetMsg(List)
    CMarriageBanquetMgr:PrepareBanque(List);
end;

--预定婚宴
define.MarBanMgr_OrderRespondMsg
{
	user = NONE,
	IsOK = false,		--预定是否成功
	OrderID = 0			--预约的婚宴ID
}
when{user = NONE}
MarBanMgr_OrderRespondMsg = checkKSUser
when{}
function MarBanMgr_OrderRespondMsg(user, IsOK, OrderID)
	local marSystem = user:GetSystem("CMarriageSystem");
	if not marSystem then return end;
	marSystem:RespondOrderBanquet(IsOK, OrderID);
end;
--查询婚宴列表
define.MarBanMgr_BanquetListRespondMsg
{
	user = NONE,
	AllBanquetList = {};
}
when{user = NONE}
MarBanMgr_BanquetListRespondMsg = checkKSUser
when{}
function MarBanMgr_BanquetListRespondMsg(user, AllBanquetList)
	user.MarSys_AnswerBanquetListMsg{InfoTable = AllBanquetList};
end;
--想给某玩家赠送礼金
define.MarBanMgr_RespondGiveMarryMoneyToMsg
{
	user = NONE,
	Error = false;
	BanquetInfo = {};
}
when{user = NONE}
MarBanMgr_RespondGiveMarryMoneyToMsg = checkKSUser
when{}
function MarBanMgr_RespondGiveMarryMoneyToMsg(user, Error, BanquetInfo)
	user.MarSys_ShowGiveMarryMoneyPanelMsg{Error = Error, BanquetInfo = BanquetInfo};
end;
--给婚宴赠送礼金
define.MarBanMgr_RespondGiveMarryMoneyMsg
{
	user = NONE,
	Banquet = {};
	Money = 0;
}
when{user = NONE}
MarBanMgr_RespondGiveMarryMoneyMsg = checkKSUser
when{}
function MarBanMgr_RespondGiveMarryMoneyMsg(user, Banquet, Money)
	local marSystem = user:GetSystem("CMarriageSystem");
	if marSystem then
		marSystem:RespondGiveMarryMoney(Banquet, Money);
	end;
end;
--取消婚宴
define.MarBanMgr_CancelBanquetMsg
{
	BanquetID = 0;
}
when{}
function MarBanMgr_CancelBanquetMsg(BanquetID)
	_G.CMarriageBanquetMgr:CancelBanquet(BanquetID);
end;
--------
define.MarSys_BroadCastCongratulationMsg
{
	HusbandName = "",
	WifeName	= "",
	HusbandRoleID = 0,
	WifeRoleID	= 0,
	MsgTime		= 0
}
when{}
function MarSys_BroadCastCongratulationMsg(HusbandName, WifeName, HusbandRoleID, WifeRoleID, MsgTime)
	local n_BroadCastLevel = _G.BroadCastConfig.Marry;
    local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= n_BroadCastLevel then
			table.insert(setNet, objPlayer.objNet);
		end;
	end;
    _groupcallout(setNet, "MarSys_BroadCastCongratulationMsg", {HusbandName = HusbandName, WifeName = WifeName, HusbandRoleID = HusbandRoleID, WifeRoleID = WifeRoleID, MsgTime = MsgTime});
end;

define.MarSys_GetMarryMoneyAnswerGuestListMsg
{
    user = NONE,
    GuestList = {}
}
when{user = NONE}
MarSys_GetMarryMoneyAnswerGuestListMsg = checkKSUser
when{}
function MarSys_GetMarryMoneyAnswerGuestListMsg(user, GuestList)
    local marSystem = user:GetSystem("CMarriageSystem");
    if marSystem then
        marSystem:RespondGetMarryMoneyGuestList(GuestList);
    end;
end;

define.MarSys_GetMarryMoneyAnswerBanquetListMsg
{
    user = NONE,
    BanquetList = {}
}
when{user = NONE}
MarSys_GetMarryMoneyAnswerBanquetListMsg = checkKSUser
when{}
function MarSys_GetMarryMoneyAnswerBanquetListMsg(user, BanquetList)
    local marSystem = user:GetSystem("CMarriageSystem");
    if marSystem then
        marSystem:RespondGetMarryMoneyBanquetList(BanquetList);
    end;
end;

define.MarSys_GetMarryMoneyAnswerEndMsg
{
    user = NONE,
    MateRecv = false
}
when{user = NONE}
MarSys_GetMarryMoneyAnswerEndMsg = checkKSUser
when{}
function MarSys_GetMarryMoneyAnswerEndMsg(user, MateRecv)
    local marSystem = user:GetSystem("CMarriageSystem");
    if marSystem then
        marSystem:RespondGetMarryMoneyEnd(MateRecv);
    end;
end;



