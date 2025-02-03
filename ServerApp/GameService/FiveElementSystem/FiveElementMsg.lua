--[[
功能：五行系统消息处理
作者：
时间：2012-02-01
]]


-- 五行升级
define.ServUpElemLvMsg
{
	user = NONE, 
	Type = -1,
	Info = {},
}
when{ user = NONE }
ServUpElemLvMsg = checkUser
when{ }
function ServUpElemLvMsg(user,Type,Info)
    local fiveElemSystem = user:GetSystem("CFiveElemSystem");
	if not fiveElemSystem then
		return;
	end;
	fiveElemSystem:UpElemLv(Type,Info);
end

-- 真气灌输消息
define.ServElemMsg
{
	user = NONE, 
	Type = -1,
	HParam = 0,
	LParam = '',
}
when{ user = NONE }
ServElemMsg = checkUser
when{ }
function ServElemMsg(user,Type,HParam,LParam)
    local fiveElemSystem = user:GetSystem("CFiveElemSystem");
	if not fiveElemSystem then
		return;
	end;
	fiveElemSystem:DecodeMsg(Type,HParam,LParam);
end

-- 真气平仓消息
define.ServElemBalanceMsg
{
	user = NONE, 
	Info = {},
}
when{ user = NONE }
ServElemBalanceMsg = checkUser
when{ }
function ServElemBalanceMsg(user,Info)
    local fiveElemSystem = user:GetSystem("CFiveElemSystem");
	if not fiveElemSystem then
		return;
	end;
	fiveElemSystem:BalanceElem(Info);
end

------------------------五行调和系统

--打开五行调和消息
define.OpenFiveElementConsonanceSystemMsg
{
	user = NONE, 
}
when{ user = NONE }
OpenFiveElementConsonanceSystemMsg = checkUser
when{ }
function OpenFiveElementConsonanceSystemMsg(user)
    local fiveElemSystem = user:GetSystem("CFiveElemSystem");
	if not fiveElemSystem then
		return;
	end;
	fiveElemSystem:OpenFiveElementConsonanceSystem();
end

--操作五行调和消息
define.DoAdjustMsg
{
	user = NONE,
	Param = {}
}
when{ user = NONE }
DoAdjustMsg = checkUser
when{ }
function DoAdjustMsg(user,Param)
    local fiveElemSystem = user:GetSystem("CFiveElemSystem");
	if not fiveElemSystem then
		return;
	end;
	--print('~~~~~~~~~~4~~~~~~~~~~~',tStuff.AutoBuyStuff[2])
	fiveElemSystem:DoAdjust(Param);
end