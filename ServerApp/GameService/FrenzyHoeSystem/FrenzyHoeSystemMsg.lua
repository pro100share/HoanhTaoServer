
--[[
功能：疯狂的锄头消息类（服务器）
作者：魏云
时间：2013-8-22
--]]



--玩家开始挖宝
define.FrenzyHoe_StartDigTreasureMsg
{
	user = NONE, 
	HoeItemId = 0, ----挖宝藏的锄头id
}
when{ user = NONE }
FrenzyHoe_StartDigTreasureMsg = checkUser
when{ }
function FrenzyHoe_StartDigTreasureMsg(user,HoeItemId)
    if user:IsDead() then
		return;
	end
	local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
	if not frenzyHoeSystem then
		return;
	end;
	frenzyHoeSystem:StartDigTreasure(HoeItemId);  ---开始挖宝
end

----玩家领取挖宝奖励
define.FrenzyHoe_GetFrenzyHoeRewardMsg
{
	user = NONE, 
}
when{ user = NONE }
FrenzyHoe_GetFrenzyHoeRewardMsg = checkUser
when{ }
function FrenzyHoe_GetFrenzyHoeRewardMsg(user)
    if user:IsDead() then
		return;
	end
	local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
	if not frenzyHoeSystem then
		return;
	end;
	frenzyHoeSystem:GetFrenzyHoeReward();  ---获取挖宝奖励
end

----用锄头好友度 兑换其他锄头

define.FrenzyHoe_ExchangeHoeByFriendNumMsg
{
	user = NONE,
	Index = 0;
}
when{ user = NONE }
FrenzyHoe_ExchangeHoeByFriendNumMsg = checkUser
when{ }
function FrenzyHoe_ExchangeHoeByFriendNumMsg(user,Index)
    if user:IsDead() then
		return;
	end
	local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
	if not frenzyHoeSystem then
		return;
	end;
	frenzyHoeSystem:ExchangeHoeByFriendNum(Index);  ---获取其他锄头根据好友度
end

---ks返回 更新所有玩家挖宝事件信息
define.FrenzyHoe_KSUpdateFrenzyHoeItemInfoMsg
{
	ParamInfo = {},
}
when{ }
function FrenzyHoe_KSUpdateFrenzyHoeItemInfoMsg(ParamInfo)
	----更新内存数值
	CFrenzyHoeSystemManager:UpdateDigEvent(ParamInfo)
	CFrenzyHoeSystemManager:UpdateBroadCastInfo(ParamInfo) 
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
		if not frenzyHoeSystem then
			return;
		end;
		frenzyHoeSystem:LoadFrenzyHoeEventInfo(ParamInfo);  ---更新所有玩家挖宝事件信息
	end
end

----零点清好友度
define.FrenzyHoe_KSZeroClearFriendNumMsg
{

}
when{ }
function FrenzyHoe_KSZeroClearFriendNumMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
		if not frenzyHoeSystem then
			return;
		end;
		frenzyHoeSystem:ZeroClearFriendNum();  ---零点清好友度
	end
end



-----ks返回  -----检查数据库里是否有该奖励物品 
define.FrenzyHoe_KSCheckAwardItemIdIsInSqlMsg
{
	RoleID = 0,
	Param = false,
}
when{ }
function FrenzyHoe_KSCheckAwardItemIdIsInSqlMsg(RoleID,Param)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	if(not objPlayer) then
		return;
	end
	local frenzyHoeSys = objPlayer:GetSystem('CFrenzyHoeSystem')
	if(not frenzyHoeSys) then
		return;
	end
	frenzyHoeSys:UpdateFrenzyHoeItemInfo(Param)
end


define.FrenzyHoe_KSGetFrenzyHoeItemInfoMsg
{
	RoleID = 0,
	DigEventInfo = {},
	BroadCastInfo = {},
}
when{ }
function FrenzyHoe_KSGetFrenzyHoeItemInfoMsg(RoleID,DigEventInfo,BroadCastInfo)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	if(not objPlayer) then
		return;
	end
	local frenzyHoeSys = objPlayer:GetSystem('CFrenzyHoeSystem')
	if(not frenzyHoeSys) then
		return;
	end
	frenzyHoeSys:GetFrenzyHoeItemInfo(DigEventInfo,BroadCastInfo)
end
----最后一个锄头获取的物品 当未领取后点关闭时发邮件
define.FrenzyHoe_SendFrenzyHoeAwardToMailMsg
{
	user = NONE, 
}
when{ user = NONE }
FrenzyHoe_SendFrenzyHoeAwardToMailMsg = checkUser
when{ }
function FrenzyHoe_SendFrenzyHoeAwardToMailMsg(user)
	if user:IsDead() then
		return;
	end
	local frenzyHoeSys = user:GetSystem('CFrenzyHoeSystem')
	if(not frenzyHoeSys) then
		return;
	end
	frenzyHoeSys:SendFrenzyHoeAwardToMail()
end


----兑换锄头获取物品热更新
define.KSFrenzyHoeHotUpdateMsg
{
}
when{ }
function KSFrenzyHoeHotUpdateMsg()
	FrenzyHoeConfig:Reload();
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("CFrenzyHoeSystem");
		if not sys then
			return;
		end;
		sys:FrenzyHoeHotUpdate();  ---同步热更新
	end
end


----清热更新
define.KSClearFrenzyHoeHotUpdateMsg
{
	
}
when{ }
function KSClearFrenzyHoeHotUpdateMsg()
	if(_G.FrenzyHoeConfig) then
		_G.FrenzyHoeConfig.bOpen = false;
	end
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
		if not frenzyHoeSystem then
			return;
		end;
		user.OnSynFrenzyHoeDataMsg{Infos = frenzyHoeSystem:GetFinalExChangeItemConfig()};
	end
end