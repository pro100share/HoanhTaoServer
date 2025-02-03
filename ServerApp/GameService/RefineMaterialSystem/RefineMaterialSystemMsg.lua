--炼丹的相关消息
------
--开始炼丹，；itemID--丹药的道具配置ID,  itemCount--丹药的数量
define.RequestRefineMaterialMsg
{
	user = NONE,
	itemID = 0,
	itemCount = 0,
}
when {user = NONE}
RequestRefineMaterialMsg = checkUser;
when{}
function RequestRefineMaterialMsg(user,itemID,itemCount)
	local refineMaterialSystem = user:GetSystem("CRefineMaterialSystem");
	if refineMaterialSystem then
		refineMaterialSystem:OnMake(itemID, itemCount);
	end
end;

-------广播
define.ServRefineSuccessCastMsg
{
	user = NONE, 
	roleID = -1,
	roleName = '',
	itemID = 1
}
when{ user = NONE }
ServRefineSuccessCastMsg = checkUser
when{ }
function ServRefineSuccessCastMsg(user,roleID,roleName,itemID)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltDecodeRefineMsg", {RoleID = roleID, RoleName = roleName, ItemID = itemID});
end