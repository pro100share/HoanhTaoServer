--[[
	盟主系统GS
	周长沙
--]]

_G.CAllianceLeaderManager = CSingle:new();
CSingleManager:AddSingle(CAllianceLeaderManager);

CAllianceLeaderManager.AllianceLeaderInfo = {}
----------------------------------------------------------
----------------------------------------------------------
function CAllianceLeaderManager:Create()
	self:SendAskForAllianceLeader()
	return true;
end;

function CAllianceLeaderManager:Update()
	return true;
end;

function CAllianceLeaderManager:Destroy()

end;
------------------------------------------------------------
--获得盟主信息
function CAllianceLeaderManager:GetAllianceLeaderInfo()
	return self.AllianceLeaderInfo
end
function CAllianceLeaderManager:GetAllianceLeaderName()
	local szName = ""
	local Leader = self.AllianceLeaderInfo[1]
	if Leader then
		szName = Leader.avatarInfoMsg.szRoleName
	end
	return szName
end
------------------------------------------------------------
--收到盟主战结束
function CAllianceLeaderManager:OnRecvWarEnd(dwRoleID,dwWarID)
	if 10010 ~= dwWarID then return end;
	--[[
	local objPlayer = CMapManager:GetPlayer(dwRoleID)
	if not objPlayer then
		self:SendAllianceWarEnd(dwRoleID, MateRoleID)
		return
	end
	local sysMarriage = objPlayer:GetSystem("CMarriageSystem")
	local MateRoleID = sysMarriage.MateRoleID or 0
	--]]
	self:SendAllianceWarEnd(dwRoleID, MateRoleID)
end
--收到职位更新
function CAllianceLeaderManager:OnRecvLeaderUpdate(Info)
	self.AllianceLeaderInfo = Info
	self:SendModelInfo()
end

--收到称号消息
function CAllianceLeaderManager:OnRecvLeaderShowText(Type,Info)
	if not self.AllianceLeaderInfo[Type] then return end
	self.AllianceLeaderInfo[Type].Text = Info
	self:SendModelInfo()
end
--------------------------------------------------------------
------>KS 
--发送请求盟主信息
function CAllianceLeaderManager:SendAskForAllianceLeader()
	CKernelApp.OnGSAskForAllianceLeaderMsg{}
end
--发送盟主战结束信息
function CAllianceLeaderManager:SendAllianceWarEnd(dwRoleID,MateRoleID)
	CKernelApp.OnGSAskForAllianceWarEndMsg{RoleID = dwRoleID or 0, MateRoleID = MateRoleID}
end
---------------------------------------------------------------
------->clt
--发送模型信息
function CAllianceLeaderManager:SendModelInfo(objPlayer)
	if objPlayer then
		objPlayer.NpcSetLeaderMsg{
			Pos = 0;
			Info = self.AllianceLeaderInfo
		}
		return;
	end
	local dwMapID = AllianceLeaderConfig.Model.dwMapID
	local Map = CMapManager:GetMap(dwMapID )
	if Map then
		local Players = Map:GetAllPlayer()
		for _,objPlayer in pairs(Players) do
			objPlayer.NpcSetLeaderMsg{
				Pos = 0;
				Info = self.AllianceLeaderInfo
			}
		end
	end
end



























