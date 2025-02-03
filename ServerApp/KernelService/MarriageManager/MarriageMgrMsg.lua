--[[
KS端婚姻管理器消息定义
01-21-2013	create by lkj
]]

--结婚登记
define.MarMgr_MarryRegisterMsg
{
	HusbandRoleID = 0,
    WifeRoleID  = 0,
    MarriedTime = 0,
    HusbandName = "",
    WifeName    ="",
    Love        = 0
}
when{}
function MarMgr_MarryRegisterMsg(HusbandRoleID, WifeRoleID, MarriedTime, HusbandName, WifeName, Love)
	CMarriageMgr:MarryRegister(HusbandRoleID, WifeRoleID, MarriedTime, HusbandName, WifeName, Love);
end;

--离婚等级
define.MarMgr_DivorceRegisterMsg
{
	RoleID = 0,
    Compel = false
}
when{}
function MarMgr_DivorceRegisterMsg(RoleID, Compel)
	CMarriageMgr:DivorceRegister(RoleID, Compel);
end;




--更新亲密度
define.MarMgr_UpdateLoveMsg
{
    RoleID  = 0,
    Love    = 0
}
when{}
function MarMgr_UpdateLoveMsg(RoleID, Love)
	CMarriageMgr:UpdateLove(RoleID, Love);
end;


--发送夫妻悄悄话
define.MarMgr_SendChatMsg
{
    RoleID  = 0,
    Msg     = "",
    Time    = 0
}
when{}
function MarMgr_SendChatMsg(RoleID, Msg, Time)
	CMarriageMgr:SendChat(RoleID, Msg, Time);
end;

--删除夫妻悄悄话
define.MarMgr_DelChatMsg
{
    RoleID  = 0,
    Time    = 0
}
when{}
function MarMgr_DelChatMsg(RoleID, Time)
	CMarriageMgr:DelChat(RoleID, Time);
end;



--更换信物
define.MarMgr_ChangeKeepsakeMsg
{
    RoleID      = 0,
    ItemEnumID  = 0
}
when{}
function MarMgr_ChangeKeepsakeMsg(RoleID, ItemEnumID)
	CMarriageMgr:ChangeKeepsake(RoleID, ItemEnumID);
end;

