define.KSBackStageDataMsg
{
	ParamInfo = {},
}
when{ }
function KSBackStageDataMsg(ParamInfo)
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, json.encode(ParamInfo));
end