_G.CPSApp = {};function CPSApp:Create()    --��������    local strAddr = CConfig.Network.strProxyService;	local dwLength = math.floor(CConfig.ProxyServiceNetwork.dwMaxMessageLengthFromServer % 100000);    -- print("CPSApp:Create()", strAddr, dwLength);    _lsvr:PSConnect(strAddr, dwLength, 0);end;_G.OnPSConnect = function()    -- print("==OnPSConnect==");	_lsvr:UpdateLineNum(CGameLineManager.LineNum + 1);end;_G.OnPSDisconnect = function()    -- print("==OnPSDisconnect==");end;_lsvr:onPSConnect(_G.OnPSConnect);_lsvr:onPSDisconnect(_G.OnPSDisconnect);