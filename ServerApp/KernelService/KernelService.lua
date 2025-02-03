--[[
文件：KernelService/KernelService.lua
类名：CKernelService
功能说明：基础服务器，基础部分的总管理器
备注：
作者：周华杰
版本：v1.0
修改者：
]] 
_G.CKernelService = {}
--[[
功能：创建
备注：
]]

CKernelService.setObjectNames = {
    "CAccountDBQuery",
    "CPlayerDBQuery",
    "CHostService",
    "CPlayerManager",
    "CGameLineManager",
    "CSingleManager",
    "CTransitManager"
};
CKernelService.setCSObjectNames = {
    "CHostService",
    "CPlayerManager",
    "CGameLineManager",
    "CSingleManager",
    "CTransitManager"
};

function CKernelService:GetObjectNames()
    local setNames = self.setObjectNames;
    if CConfig.bIsCrossSvr then
        setNames = self.setCSObjectNames;
    end
    return setNames;
end

function CKernelService:Create()
    for k, v in ipairs(self:GetObjectNames()) do
        if _G[v].Create then
            _G[v]:Create();
        end
    end

	local dwSerID = CConfig.Network.dwServerHostID;
	local dwLogIP = CConfig.Network.dwLogServiceIP;
	local dwAccIP = CConfig.Network.dwAccServiceIP;
	
    local szDBAddress = "";
    local szDBUser = "";
    local szDBPassword = "";
    local szRoleDBName = "";
    local szAccountDBName = "";
    if not CConfig.bIsCrossSvr then
        szDBAddress = CConfig.szAdmDBIP;
        szDBUser = CConfig.szAdmDBUser;
        szDBPassword = CConfig.szAdmDBPwd;
        szRoleDBName = CConfig.RoleDB.ConnParam.szDBName;
        szAccountDBName = CConfig.AccountDB.ConnParam.szDBName;
    end
	
	_ksvr:SetKernelInfo(dwSerID,dwLogIP,dwAccIP,
		szDBAddress,szDBUser,szDBPassword,szRoleDBName,szAccountDBName);
		
	_ksvr:SetConnectAs(CConfig.Network.bConnectAs);
    
	return true;
end; 

function CKernelService:Update(dwInterval)
    for k, v in ipairs(self:GetObjectNames()) do
        if _G[v].Update then
            _G[v]:Update(dwInterval);
        end
    end
    return true;
end;

function CKernelService:Destroy()
    for k, v in ipairs(self:GetObjectNames()) do
        if _G[v].Destroy then
            _G[v]:Destroy();
        end
    end
end;