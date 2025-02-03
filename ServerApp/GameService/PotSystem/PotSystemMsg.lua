
--罐子消息
define.ServPotMsg
{
	user = NONE, 
	Type = -1,
	Info = {},
}
when{ user = NONE }
ServPotMsg = checkUser
when{ }
function ServPotMsg(user,Type,Info)           --Info[1] = CurPotEnum Info[2] = CurHammerEnum
    local potSystem = user:GetSystem("CPotSystem");
	if not potSystem then
		return;
	end;
	potSystem:DecodeMsg(Type,Info);
end

