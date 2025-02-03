_unpack("ServerApp.dat");
_G.LOGFILELV = 'info'
_G.LOGCONSOLELV = 'DEBUG'
_G.LOGFILE = true
_G.LOGCONSOLE = true

_G.CConfig = {}
_G.CConfig.bPrintMsgList = true;

CConfig.szDBIP = "127.0.0.1:5432";
CConfig.szDBUser = "postgres";
CConfig.szDBPwd = "HoanhTaoThienHa@@";

CConfig.szAdmDBIP =  "127.0.0.1:5432";
CConfig.szAdmDBUser = "postgres";
CConfig.szAdmDBPwd = "HoanhTaoThienHa@@"; 

CConfig.bIsCrossSvr = false;        --是否跨服战服务器
CConfig.bConnectCrossSvr = true;    --是否连接跨服战服务器

--网络端口
CConfig.Network = {}; 
CConfig.Network.dwServerHostID			= dwServerHostID; 							--游戏服务器的主机id 
CConfig.Network.dwAccServiceIP          = dwAccServiceIP;  				--GM服务器IP
CConfig.Network.bConnectDataCenter		= bConnectDataCenter;			--数据中心地址
CConfig.Network.bConnectAs				= bConnectAs;					--是否连接as

CConfig.Network.strKernelService		= tostring((dwServerHostID*10)+1);					--中心服务器
CConfig.Network.strProxyService			= tostring((dwServerHostID*10)+2);					--代理服务器
CConfig.Network.strDataService			= tostring((dwServerHostID*10)+3);					--数据服务器
CConfig.Network.strLogService			= tostring((dwServerHostID*10)+4);					--后台日志服务器
CConfig.Network.strPrintService			= tostring((dwServerHostID*10)+5);					--运行日志服务器
CConfig.Network.strTransService			= tostring((dwServerHostID*10)+6);					--转发服务器
CConfig.Network.strLsProxyService		= tostring((dwServerHostID*10)+7);					--登录服务代理转发
CConfig.Network.strCrossServiceServer   = dwCrossServiceServerIP; --跨服服务器

CConfig.Network.szDeptID				= 1;						--平台ID
CConfig.Network.szDataCenterIP			= "127.0.0.1:8080";				--数据中心ID
CConfig.Network.szDataCenterSubAddr		= "/DataService/postapi";	--数据中心地址
CConfig.Network.szDataCenterPage		= "htm"						--数据中心页面
CConfig.Network.szLogFilePath			= "../Log/data";			--本地日志目录

CConfig.Network.nTimezone				= 7 * 60 * 60;				--时区(秒)

CConfig.Network.dwClientForbidTime		= 1 * 60 * 60 * 1000;			--异常后禁止连接时间

CConfig.ProxyServiceNetwork = {
        nPlayerInLoginNum						= 1000;
        nPlayerInGameNum						= 1000;
        
        dwMaxConnectionFromClient               = 3500;
        dwMaxMessageLengthFromClient            = 2 * 1024;
        dwMaxBufferSizeFromClient               = 10 * 1024;
        
        dwMaxConnectionFromServer               = 20;
        dwMaxMessageLengthFromServer            = 4096 * 100000 + 4096;
        dwMaxBufferSizeFromServer               = 10 * 100000 + 10;
        
        dwGSProxyCount							= 3;
        dwProxyServicePortC						= 8000 + ((toint(dwServerHostID)-1) * 3);
};

CConfig.KernelServiceNetwork =
{
        dwMaxConnectionFromGameService          = 20;
        dwMaxMessageLengthFromGameService       = 4096 * 100000 + 4096;
        dwMaxBufferSizeFromGameService          = 10 * 100000 + 10;
};

CConfig.DataServiceNetwork =
{
        dwMaxConnectionFromGameService          = 20;
        dwMaxMessageLengthFromGameService       = 512 * 100000 + 2048;
        dwMaxBufferSizeFromGameService          = 10 * 100000 + 10;
};

CConfig.LogServiceNetwork = {
        dwMaxConnectionFromServer               = 20;
        dwMaxMessageLengthFromServer            = 1024 * 100000 + 1024;
        dwMaxBufferSizeFromServer               = 10 * 100000 + 10;
        
        dwMaxMessageLengthFromDataCenter        = 1024 * 4;
        dwMaxBufferSizeFromDataCenter           = 1024 * 120;
}

CConfig.CrossServiceNetwork = {
        dwPort                                  = 8081;
        dwMaxConn                               = 1;
        dwMaxMsgLen                             = 1024 * 4 + 1;
        dwMaxBuffSize                           = 1024 * 120;
};

--账号数据库
CConfig.AccountDB =
{
	ConnParam = {
		szConnectStr = CConfig.szDBIP;
		szUser=CConfig.szDBUser;
		szPwd= CConfig.szDBPwd;
		szDBName="acc1";
	};
	bTestServerDB = true;
};
--角色数据库
CConfig.RoleDB =
{
	ConnParam = {
		szConnectStr = CConfig.szDBIP;
		szUser = CConfig.szDBUser;
		szPwd= CConfig.szDBPwd;
		szDBName="game1";
	};
	dwDBRoleMaxCount = 10000000;
	dwSyncInterval = 10000;
};
--共享数据库
CConfig.szCogPath="../terrain/";
