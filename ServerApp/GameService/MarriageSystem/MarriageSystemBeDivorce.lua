--------------------------------------------------------------
--接到协议离婚请求
function CMarriageSystem:BeConferDivorceTo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BeConferDivorceTo");
		return;
	end;
	if not self:IsMarried() then return end;
	--通知客户端被协议离婚
	objPlayer.MarSys_BeConferDivorceToMsg{};
end;

--接到在线强制离婚通知
function CMarriageSystem:BeCompelDivorceToOnline()
    local sFormerName = self.MateName;
    self:Divorce();
    self:NoticeBeCompelDivorce(sFormerName);
end;

--接到离线强制离婚通知
function CMarriageSystem:BeCompelDivorceToOffline()
    self:Divorce(true);
end;

function CMarriageSystem:NoticeBeCompelDivorce(sFormerName)
    local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BeCompelDivorceTo");
		return;
	end;
    objPlayer.MarSys_BeCompelDivorceToMsg{FormerName = sFormerName};
end;

--同意离婚
function CMarriageSystem:AcceptDivorce()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BeConferDivorceTo");
		return;
	end;
    --离婚登记
    CKernelApp.MarMgr_DivorceRegisterMsg{RoleID = objPlayer:GetRoleID(), Compel = false};
    
    self:Divorce();
    
	--通知自己离婚完成
	objPlayer.MarSys_AcceptDivorceResultMsg{Reason = _G.MarriageError.eDivorceComplete};
end;

--拒绝离婚
function CMarriageSystem:RefuseDivorce()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BeConferDivorceTo");
		return;
	end;
    
	_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "DivorceRefused", nil, nil);
end;



