_define()
-----------------------------------------------------------------------------
define.StartBaiduBanditMsg
{
	user  = NONE ,
}
when{ user = NONE }
StartBaiduBanditMsg = checkUser
when{}
function StartBaiduBanditMsg(user)
	user:GetSystem("CBaiduBanditSystem"):Start()
end

define.EndBaiduBanditMsg
{
	user  = NONE ,
}
when{ user = NONE }
EndBaiduBanditMsg = checkUser
when{}
function EndBaiduBanditMsg(user)
	user:GetSystem("CBaiduBanditSystem"):End()
end
-----------------------------------------------------------------------------