
_G.CTianGuanCiFuMgr = CSingle:new();

CSingleManager:AddSingle(CTianGuanCiFuMgr);

function CTianGuanCiFuMgr:SetFlag(t)
	self.flag = t;
	self:SynchFlag();
end;

function CTianGuanCiFuMgr:OnKSReConnect()
	self:SynchFlag();
end;

function CTianGuanCiFuMgr:SynchFlag()
	if self.flag then
		CKernelApp.TGCFMgr_SynchFlag_Msg{Flag = self.flag};
	end;
end;