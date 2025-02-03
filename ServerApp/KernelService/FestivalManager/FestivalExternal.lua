--[[
	开服活动 ks
	发送与接收
	周长沙
	2013-5-23
--]]



----------------------------------------------------------------------
------------------------------------------------------------------接收
--收到请求所有节日信息
function CFestivalManager:RecvGetAllInfo(objLine)
	self:SendAllInfo(objLine)
end
----------------------------------------------------------------------
------------------------------------------------------------------发送
--发送所有节日信息
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
--发送节日开始信息
function CFestivalManager:SendFestivalStart(dwFestival)
	local f = function()
		local Info = self:GetFestivalSendInfo(dwFestival)
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalStartMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--发送节日结束信息
function CFestivalManager:SendFestivalEnd(dwFestival)
	local f = function()
		local Info = {dwFestival}
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalEndMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--发送活动开始信息
function CFestivalManager:SendLineStart(dwFestival,dwLine)
	local f = function()
		local Info = self:GetLineSendInfo(dwFestival,dwLine)
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalLineStartMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--发送活动结束信息
function CFestivalManager:SendLineEnd(dwFestival,dwLine)
	local f = function()
		local Info = {dwFestival,dwLine}
		for _,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.KSFestivalLineEndMsg{Info = Info}
		end
	end
	self:AddMsg(f)
end
--发送活动可领奖信息
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

















































