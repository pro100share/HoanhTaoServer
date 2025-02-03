--关闭系统列表
--后面的参数写1表示关闭，没有这项，或者写nil，写0都表示开启
_G.CSystemForbidList = 
{
	Baidu = 1,
}

function _G.SystemBasePathServer(szSystemName)
	if CSystemForbidList[szSystemName] == 1 then
		return 'EmptyGame';
	else
		return 'GameService';
	end
end;

function _G.SystemBasePathClient(szSystemName)
	if CSystemForbidList[szSystemName] == 1 then
		return 'src/EmptySystem';
	else
		return 'src/Systems';
	end
end;

function _G.SystemBasePathUI(szSystemName)
	if CSystemForbidList[szSystemName] == 1 then
		return 'src/EmptyUI';
	else
		return 'src/UIModule';
	end
end;
