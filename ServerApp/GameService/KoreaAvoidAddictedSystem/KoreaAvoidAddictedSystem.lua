--[[
功能：韩版防沉迷系统
作者：魏云
时间：2014-1-22
]]
_G.CKoreaAvoidAddictedSystem = {};
function CKoreaAvoidAddictedSystem:new()
	local obj = CSystem:new("CKoreaAvoidAddictedSystem");
	obj.dwCheckTimer = 0;
	obj.objTimer = {};
	for i,v in pairs(CKoreaAvoidAddictedSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CKoreaAvoidAddictedSystem:Create()
	if(not _G.KoreaAvoidAddicted) then
		return true;
	end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return true; 
	end
	if objPlayer:IsInAddicted() then
		self:AddAddictedTimer();
	end
	return true;
end

function CKoreaAvoidAddictedSystem:OnChangeLineEnd()
	if(not _G.KoreaAvoidAddicted) then
		return true;
	end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return true; 
	end
	if objPlayer:IsInAddicted() then
		self:SynchronizeNotify(0);
	end
end
-----------------------------------------------------------------------------------------------------------------------------
--系统对外接口
--发送提示信息到客户端，0是关闭，1~24是其它防沉迷信息
function CKoreaAvoidAddictedSystem:SynchronizeNotify(dwTips)
	self:GetPlayer().OnReceiveKAddictedNoticeMsg{Tips = dwTips};
end



















