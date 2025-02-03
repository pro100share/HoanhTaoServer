--_info('Start ProxyService Begin');

-- local szAddrS   = CConfig.Network.strProxyService;
-- local dwCountS  = CConfig.ProxyServiceNetwork.dwMaxConnectionFromServer;
-- local dwLengthS = CConfig.ProxyServiceNetwork.dwMaxMessageLengthFromServer/100000;
-- local dwSizeS   = CConfig.ProxyServiceNetwork.dwMaxBufferSizeFromServer;
-- _psvr:SvrListenNet(szAddrS, dwCountS, dwLengthS, dwSizeS);


-- local szAddrC   = "0.0.0.0:" .. CConfig.Network.dwProxyServicePortC;
-- local dwCountC  = CConfig.ProxyServiceNetwork.dwMaxConnectionFromClient;
-- local dwLengthC = CConfig.ProxyServiceNetwork.dwMaxMessageLengthFromClient;
-- local dwSizeC   = CConfig.ProxyServiceNetwork.dwMaxBufferSizeFromClient;
-- local nPlayerInLoginNum = CConfig.Network.nPlayerInLoginNum;
-- _psvr:ListenNet(szAddrC, dwCountC, dwLengthC, dwSizeC, true, nPlayerInLoginNum);

-- local dwForbid = CConfig.Network.dwClientForbidTime;
-- _psvr:SetForbiddenTime(dwForbid);

local PSConfig={
szAddrS   = CConfig.Network.strProxyService;
szLsAddrS = CConfig.Network.strLsProxyService;

dwLengthS = CConfig.ProxyServiceNetwork.dwMaxMessageLengthFromServer/100000;
dwSizeS   = CConfig.ProxyServiceNetwork.dwMaxBufferSizeFromServer;
--_psvr:SvrListenNet(szAddrS, dwCountS, dwLengthS, dwSizeS);

dwUserCount  	= CConfig.ProxyServiceNetwork.dwMaxConnectionFromClient; --max user count
dwHostCount  	= CConfig.ProxyServiceNetwork.dwMaxConnectionFromServer; --host count
dwGSProxyCount  = CConfig.ProxyServiceNetwork.dwGSProxyCount;													--GS Proxy Count
nPlayerInLoginNum = CConfig.ProxyServiceNetwork.nPlayerInLoginNum;					--lis max palyer count

szAddrC   = "0.0.0.0";
szPortC   = CConfig.ProxyServiceNetwork.dwProxyServicePortC;
dwLengthC = CConfig.ProxyServiceNetwork.dwMaxMessageLengthFromClient;
dwSizeC   = CConfig.ProxyServiceNetwork.dwMaxBufferSizeFromClient;

--_psvr:ListenNet(szAddrC, dwCountC, dwLengthC, dwSizeC, true, nPlayerInLoginNum);
dwForbid = CConfig.Network.dwClientForbidTime;
--_psvr:SetForbiddenTime(dwForbid);
bIsCrossServer = CConfig.bIsCrossSvr;
}
return PSConfig;

--_info('Start ProxyService Success')



