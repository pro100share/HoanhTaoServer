--[[
	����� ks
	���������
	�ܳ�ɳ
	2013-5-23
--]]



----------------------------------------------------------------------
------------------------------------------------------------------����
--�յ��������н�����Ϣ
function CFestivalManager:RecvGetAllInfo(objLine)
	self:SendAllInfo(objLine)
end
----------------------------------------------------------------------
------------------------------------------------------------------����
--�������н�����Ϣ
function CFestivalManager:SendAllInfo(objLine)
	local f = function()
		local Info = self:GetSendInfo()
		if objLine then
			objLine.KSAllFestivalInfoMsg{Info = Info}
		else
			for _,objLine in pairs(CGameLineManager:GetAllLine()) do
				objLine.KSAllFestivalInfoMsg{Info = Info}
			end
		end
	end
	self:AddMsg(f)
end
--���ͽ��տ�ʼ��Ϣ
function CFestivalManager:SendFestivalStart(dwFestival)
	local f = function()
		local Info = self:GetFestivalSendInfo(dwFestival)
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalStartMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--���ͽ��ս�����Ϣ
function CFestivalManager:SendFestivalEnd(dwFestival)
	local f = function()
		local Info = {dwFestival}
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalEndMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--���ͻ��ʼ��Ϣ
function CFestivalManager:SendLineStart(dwFestival,dwLine)
	local f = function()
		local Info = self:GetLineSendInfo(dwFestival,dwLine)
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalLineStartMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--���ͻ������Ϣ
function CFestivalManager:SendLineEnd(dwFestival,dwLine)
	local f = function()
		local Info = {dwFestival,dwLine}
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalLineEndMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--���ͻ���콱��Ϣ
function CFestivalManager:SendLineReward(dwFestival,dwLine)
	local f = function()
		local Info = self:GetLineSendInfo(dwFestival,dwLine)
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalLineRewardMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
-------------------------------------------------------------------------

















































