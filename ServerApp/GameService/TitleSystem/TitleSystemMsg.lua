_define()

define.InitTitleMsg
{
	user = NONE,
}
when{user = NONE}
InitTitleMsg = checkUser;
when{}
function InitTitleMsg(user)
	user:GetSystem("CTitleSystem"):InitTitle();
end;

define.SetTitleMsg
{
	user = NONE,
	Title = 0,
	Show = 0,
}
when{user = NONE}
SetTitleMsg = checkUser;
when{}
function SetTitleMsg(user,Title,Show)
	user:GetSystem("CTitleSystem"):SetTitle(Title,Show);
end;