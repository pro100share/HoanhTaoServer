--[[
功能：抽奖系统消息类
作者：李中昌
时间：2013-910
--]]


--GS请求整合经验的信息(全服最大等级)
define.OnReqExpIntegrateMsg
{
	LineID = 0;
}
when{}
function OnReqExpIntegrateMsg(LineID)
	CExpIntegrateMgr:SendInfoToGS(LineID);
end;


--GS请求更新全服最大等级
define.OnExpInteMaxlLevelMsg
{
	MaxLevel = 0,
}
when{}
function OnExpInteMaxlLevelMsg(MaxLevel)
	CExpIntegrateMgr:SyncMaxLevel(MaxLevel)
end

