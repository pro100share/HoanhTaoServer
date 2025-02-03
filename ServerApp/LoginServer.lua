dofile '../Config/ProjectS.lua' 
dofile 'BaseService/Predefine.lua'
dofile '../Config/StringConfigInfo.lua'
-- dofile 'BaseService/Project.lua'	
-- dofile 'LoginService/Project.lua'

-- _G.initMsgList();


-- _G.Destroy = function()
    -- CLoginService:Destroy();
-- end;
-- _lsvr:onDestroy(_G.Destroy);



-- _info('Start LoginService Begin');
-- if not CLoginService:Create() then
    -- _info('Start LoginService Fail');
    -- return;
-- end;
-- _info('Start LoginService Success')
local strFormat = _G.SysStringConfigInfo[102];
local LoginConfig ={
	--roledb
	tbRoleDB = CConfig.RoleDB;
	--accountdb
	tbAccountDB = CConfig.AccountDB;
	--ps
	szProxyServiceIP = CConfig.Network.strLsProxyService;
	nProxyMaxMsgSize = math.floor(CConfig.ProxyServiceNetwork.dwMaxMessageLengthFromServer/100000);
	--Ks
	szKernelServiceIP = CConfig.Network.strKernelService;
	nKernelMaxMsgSize = math.floor(CConfig.KernelServiceNetwork.dwMaxMessageLengthFromGameService/100000);
	--Ts
	szTransServiceIP = CConfig.Network.strTransService;
	nTransMaxMsgSize= math.floor(CConfig.KernelServiceNetwork.dwMaxMessageLengthFromGameService/100000); 
	--hid
	dwServerHostID = CConfig.Network.dwServerHostID;
	nLongUserCount = CConfig.ProxyServiceNetwork.nPlayerInLoginNum;
	LoginMode = {};
}
 LoginConfig.szNameFormat = strFormat;
_G.ParamType =
{
	dwRoleID = 1,
	dwAccountID = 2,
	szRoleName = 3,
}

_G.CLoginMode = {};

--CLoginMode.tbMode = {}; 
--参数：
--dwSystemID:系统ID，在SystemNameToID中定义
--szSql:sql语句
--tbParam:语句的参数列表，这里专门指参数类型，ParamType
--dwExec:当一个System有多个Sql需要执行时，用于区分语句用，默认是1
function CLoginMode:AddMode(dwSystemID,szSql,tbParam,dwExec,dwAccountFlag)
	local ExecType = 1;
	if tbParam and tbParam[1] and tbParam[1].Param then
		ExecType = tbParam[1].Param;
	end;
	local tb = 
	{
		System = dwSystemID;
		Sql = szSql;
		ExecFlag = dwAccountFlag or 0;
		ExecID = dwExec or 1;
		AccFlag = ExecType;--dwAccountFlag or 0;
	}
	table.insert(LoginConfig.LoginMode,tb);
end; 

dofile 'LoginService/LoginMode/Project.lua';
local RoleUpLevelInfo = {};
for i,v in pairs(_G.RoleUpLevelConfig) do
	if type(v) == 'table' then
		RoleUpLevelInfo[i] = v;
	end;
end;
local function MakeConfig()
	LoginConfig.ProfConfig = CreateRoleConfig.ProfConfig;
	LoginConfig.ReplaceWord = {_G.SensitiveCharacters,""};
	LoginConfig.ExpConfig = {RoleUpLevelInfo,_G.RoleUpLevelConfig.dwMaxLevel}; 
	return LoginConfig;
end; 
return MakeConfig();




