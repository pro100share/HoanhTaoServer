_G.CHostService = {}
function CHostService:Create()
	local strAddr = CConfig.Network.strKernelService;
	local strTsAddr = CConfig.Network.strTransService;
	local maxConn = CConfig.KernelServiceNetwork.dwMaxConnectionFromGameService;
	local maxMsgLen     = CConfig.KernelServiceNetwork.dwMaxMessageLengthFromGameService/100000;
	local maxBuffSize   = CConfig.KernelServiceNetwork.dwMaxBufferSizeFromGameService;
	_ksvr:SvrListenNet(strAddr,strTsAddr, maxConn, maxMsgLen, maxBuffSize);
    
    -- 跨服战网络
    local szCSIPAddr = CConfig.Network.strCrossServiceServer .. ":" .. CConfig.CrossServiceNetwork.dwPort;
    if CConfig.bIsCrossSvr then
        _ksvr:ListenCrossSvr(szCSIPAddr,
            CConfig.CrossServiceNetwork.dwMaxConn,
            CConfig.CrossServiceNetwork.dwMaxMsgLen,
            CConfig.CrossServiceNetwork.dwMaxBuffSize);
    elseif CConfig.bConnectCrossSvr then
        _ksvr:ConnectCrossSvr(szCSIPAddr,
            CConfig.CrossServiceNetwork.dwMaxMsgLen,
            CConfig.CrossServiceNetwork.dwMaxBuffSize);
    end
    
	return true;
end;


function CHostService:Destroy()
end;

function CHostService:OnConnect(netGroup,dwIP,dwPort)
	return true;
end;

function CHostService:OnDisconnect(svrNet)
    local gameLine = CGameLineManager:GetGameLineBySvrNet(svrNet);
    if gameLine then
        CGameLineManager:DelLine(gameLine);
    end;
end; 

_G.OnSvrLeave = function(svrNet)
    CHostService:OnDisconnect(svrNet)
end;
_ksvr:onSvrLeave(_G.OnSvrLeave);

_G.GetLineNet = function(nLineID)
	local objLine = CGameLineManager:GetLine(nLineID);
	if objLine then
		return objLine.objNet;
	end
	
	return 0;
end;
_ksvr:onGetLineNet(_G.GetLineNet);

