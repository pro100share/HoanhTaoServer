--群侠录消息
------
--风云客栈购买卡片
define.QunXiaLuBuyCardMsg
{
	user 			= NONE,
	CardId			= 0;
}
when {user = NONE}
QunXiaLuBuyCardMsg = checkUser;
when{}
function QunXiaLuBuyCardMsg(user,CardId)
	local qunXiaLuSystem = user:GetSystem("CQunXiaLuSystem");
	if qunXiaLuSystem then
		qunXiaLuSystem:BuyHotelCard(CardId);
	end
end;


--风云客栈刷新
define.QunXiaLuRefreshMsg
{
	user 			= NONE,
	Type			= 0;
}
when {user = NONE}
QunXiaLuRefreshMsg = checkUser;
when{}
function QunXiaLuRefreshMsg(user, Type)
	local qunXiaLuSystem = user:GetSystem("CQunXiaLuSystem");
	if qunXiaLuSystem then
		qunXiaLuSystem:RefreshHotelCardEx(Type);
	end
end;


--群侠组合镶嵌槽位
define.QunXiaLuGroupInlayMsg
{
	user			= NONE,
	GroupIndex		= 0, 
	SlotIndex		= 0, 
	IsAutoBuy		= false, 
	IsUseGold		= false,
}
when {user = NONE}
QunXiaLuGroupInlayMsg = checkUser;
when{}
function QunXiaLuGroupInlayMsg(user,GroupIndex,SlotIndex,IsAutoBuy,IsUseGold)
	local qunXiaLuSystem = user:GetSystem("CQunXiaLuSystem");
	if qunXiaLuSystem then
		qunXiaLuSystem:GroupInlay(GroupIndex,SlotIndex,IsAutoBuy,IsUseGold);
	end
end



--群侠大侠录镶嵌槽位
define.QunXiaLuDaXiaInlayMsg
{
	user			= NONE,
	DaXiaIndex		= 0, 
	SlotIndex		= 0, 
	IsAutoBuy		= false, 
	IsUseGold		= false,
}
when {user = NONE}
QunXiaLuDaXiaInlayMsg = checkUser;
when{}
function QunXiaLuDaXiaInlayMsg(user,DaXiaIndex,SlotIndex,IsAutoBuy,IsUseGold)
	local qunXiaLuSystem = user:GetSystem("CQunXiaLuSystem");
	if qunXiaLuSystem then
		qunXiaLuSystem:DaXiaInlay(DaXiaIndex,SlotIndex,IsAutoBuy,IsUseGold);
	end
end


--群侠融合
define.QunXiaLuFuseMsg
{
	user			= NONE,
	SetCard			= {},
}
when {user = NONE}
QunXiaLuFuseMsg = checkUser;
when{}
function QunXiaLuFuseMsg(user,SetCard)
	local qunXiaLuSystem = user:GetSystem("CQunXiaLuSystem");
	if qunXiaLuSystem then
		qunXiaLuSystem:Fuse(SetCard);
	end
end

---------------------------------------------广播-----------------------------------------------------------
--风云客栈广播
define.QunXiaLuHotelRefleshCardMsg
{
	RoleId = 0,
    RoleName = "",
    CardId = 0,
}
when{}
function QunXiaLuHotelRefleshCardMsg(RoleId, RoleName, CardId)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "QunXiaLuHotelRefleshCardMsg", {RoleId = RoleId, RoleName = RoleName, CardId = CardId});	
end;


--群侠组合广播
define.QunXiaLuGroupCompeleteMsg
{
	RoleId = 0,
    RoleName = "",
    GroupIndex = 0,
}
when{}
function QunXiaLuGroupCompeleteMsg(RoleId, RoleName, GroupIndex)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "QunXiaLuGroupCompeleteMsg", {RoleId = RoleId, RoleName = RoleName, GroupIndex = GroupIndex});	
end;


--群侠录融合广播
define.QunXiaLuFuseBroadcastMsg
{
	RoleId = 0,
    RoleName = "",
    CardID = 0,
}
when{}
function QunXiaLuFuseBroadcastMsg(RoleId, RoleName, CardID)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "QunXiaLuFuseBroadcastMsg", {RoleId = RoleId, RoleName = RoleName, CardID = CardID});	
end;


--群侠录大侠录广播
define.QunXiaLuDaXiaCompeleteMsg
{
	RoleId = 0,
    RoleName = "",
}
when{}
function QunXiaLuDaXiaCompeleteMsg(RoleId, RoleName)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "QunXiaLuDaXiaCompeleteMsg", {RoleId = RoleId, RoleName = RoleName});	
end;