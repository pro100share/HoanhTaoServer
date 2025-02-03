define.OnKSExpInteMaxLevelMsg
{
	MaxLevel = 0,
}
when{}
function OnKSExpInteMaxLevelMsg(MaxLevel)
	CExpIntegrateManager:UpdateMaxLevel(MaxLevel)
end;



