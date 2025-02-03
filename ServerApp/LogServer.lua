_info('Start LogService Begin');

dofile '../Config/ProjectS.lua'

local szPlat = CConfig.Network.dwServerHostID;
local szDept = CConfig.Network.szDeptID;
local szPath = CConfig.Network.szLogFilePath;
_lsvr:InitFileManager(szPlat,szDept,szPath);

local szPost = CConfig.Network.szDataCenterSubAddr;
local szPage = CConfig.Network.szDataCenterPage;
local szHost = CConfig.Network.szDataCenterIP;
_lsvr:InitCodeManager(szPost,szPage,szHost);

local szServerIP = CConfig.Network.strLogService;
local dwMaxCount = CConfig.LogServiceNetwork.dwMaxConnectionFromServer;
local dwMaxMsgSize = CConfig.LogServiceNetwork.dwMaxMessageLengthFromServer/100000;
local dwCacheSize = CConfig.LogServiceNetwork.dwMaxBufferSizeFromServer;
_lsvr:InitGameNetwork(szServerIP,dwMaxCount,dwMaxMsgSize,dwCacheSize);

local szServerIP = CConfig.Network.szDataCenterIP;
local dwMaxMsgSize = CConfig.LogServiceNetwork.dwMaxMessageLengthFromDataCenter;
local dwCacheSize = CConfig.LogServiceNetwork.dwMaxBufferSizeFromDataCenter;
local bConnect = CConfig.Network.bConnectDataCenter;
_lsvr:InitDataNetwork(szServerIP,dwMaxMsgSize,dwCacheSize,bConnect);

for szType,dwEnum in pairs(LogMsgType)do
	if LogMsgText[szType].name and LogMsgText[szType].txt then
		_lsvr:Register(dwEnum,LogMsgText[szType].name,LogMsgText[szType].txt,LogMsgText[szType].send or 0);
	end
end

_info('Start LogService Success');
