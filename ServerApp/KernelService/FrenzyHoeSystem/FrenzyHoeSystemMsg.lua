--[[
功能：疯狂的锄头消息类
作者：魏云
时间：2013-8-23
--]]


---更新 挖宝事件信息
define.FrenzyHoe_GSUpdateFrenzyHoeItemInfoMsg
{
	ParamInfo = {},
}
when{}
function FrenzyHoe_GSUpdateFrenzyHoeItemInfoMsg(ParamInfo)
	CFrenzyHoeManagerSystem:UpdateAwardItemInfo(ParamInfo)
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.FrenzyHoe_KSUpdateFrenzyHoeItemInfoMsg{ParamInfo = ParamInfo};
	end
end;

----检查表T_Item_FrenzyHoe 里是否有该物品
define.FrenzyHoe_GSCheckAwardItemIdIsInSqlMsg
{
	RoleID = 0,
	Param = 0,
}
 when{}
 function FrenzyHoe_GSCheckAwardItemIdIsInSqlMsg(RoleID,Param)
	local objPlayer =  CGameLineManager:GetPlayer(RoleID)
	if(not objPlayer) then
		return;
	end
	local dwHas = CFrenzyHoeManagerSystem:CheckAwardItemIdIsInSql(Param)
	objPlayer.FrenzyHoe_KSCheckAwardItemIdIsInSqlMsg{RoleID = RoleID,Param = dwHas}
 end

 define.FrenzyHoe_GSGetFrenzyHoeItemInfoMsg
{
	RoleID = 0,
}
 when{}
 function FrenzyHoe_GSGetFrenzyHoeItemInfoMsg(RoleID)
	local objPlayer =  CGameLineManager:GetPlayer(RoleID)
	if(not objPlayer) then
		return;
	end
	objPlayer.FrenzyHoe_KSGetFrenzyHoeItemInfoMsg{RoleID = RoleID,DigEventInfo = CFrenzyHoeManagerSystem.dataList[1],BroadCastInfo = CFrenzyHoeManagerSystem.dataList[2]}
 end
 