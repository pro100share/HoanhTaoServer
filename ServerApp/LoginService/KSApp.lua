


_G.CKSApp = {};

function CKSApp:Create()
    local strAddr 	= CConfig.Network.strKernelService;
    local maxMsgLen	= math.floor(CConfig.KernelServiceNetwork.dwMaxMessageLengthFromGameService % 100000);
    -- print("CKSApp:Create()", strAddr, maxMsgLen);
    _lsvr:KSConnect(strAddr, maxMsgLen);
end;

function CKSApp:SetLineData(dwAccountID, szSystemName, Data)
	-- self.LIS_UpdateLineDataMsg{
        -- AccountID   = dwAccountID;
        -- SystemName  = szSystemName;
        -- Data        = Data;
    -- };
	if self.objNet then
		_callouttoline(self.objNet, "GSOnRecvTransitDataMsg", {AccountId=dwAccountID,SystemName=szSystemName,Data= Data}, self.TargetLine);
	end;
end;

function CKSApp:DeleteRole(dwRoleID)
    self.KSGuildDeletePlayerMsg{ RoleID = dwRoleID }
    self.GSCancelWantMarryMsg{ Param = { dwRoleID }; };
end;

function CKSApp:OnKSConnect(net)
    -- print("CKSApp OnKSConnect!!!");
    self.objNet = net;
    _mycallout(self);
end;

function CKSApp:OnKSDisconnect()
    -- print("CKSApp OnKSDisconnect!!!");
    self.objNet = nil;
end;

function CKSApp:OnKSReConnect(net)
	-- print("CKSApp OnKSReConnect!!!");
	self.objNet = net;
	_mycallout(self);
end;

_G.OnKSConnect = function(svrNet)
    CKSApp:OnKSConnect(svrNet);
end;

_G.OnKSDisconnect = function()
    CKSApp:OnKSDisconnect()
end;

_G.OnKSReConnect = function(svrNet)
	CKSApp:OnKSReConnect(svrNet)
end;

_lsvr:onKSConnect(_G.OnKSConnect);
_lsvr:onKSDisconnect(_G.OnKSDisconnect);
_lsvr:onKSReConnect(_G.OnKSReConnect);
