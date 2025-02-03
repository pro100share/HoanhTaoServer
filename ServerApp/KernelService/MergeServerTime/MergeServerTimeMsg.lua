
define.GsAskMergeServerTimeMsg{
	LineID=0
}

when{}
function GsAskMergeServerTimeMsg(LineID)
	local objLine = CGameLineManager:GetLine(dwLineID)
	if objLine then
		objLine.SetMergeServerTimeMsg{time=CMergeServerTime:getMergeServerTime()}
	else
		for k,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.SetMergeServerTimeMsg{time=CMergeServerTime:getMergeServerTime()}
		end
	end
end


