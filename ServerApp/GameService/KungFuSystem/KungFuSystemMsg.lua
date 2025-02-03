--炼丹的相关消息
------
--开始炼丹，；itemID--丹药的道具配置ID,  itemCount--丹药的数量
define.StudyKungFuMsg
{
	user = NONE,
	KungFuID = 0,
	IsUseGold	= false;
	IsUseUnBindFirst = false;
	IsAutoBuy	= false;
}
when {user = NONE}
StudyKungFuMsg = checkUser;
when{}
function StudyKungFuMsg(user,KungFuID,IsUseGold,IsUseUnBindFirst,IsAutoBuy)
	local kungFuSystem = user:GetSystem("CKungFuSystem");
	if kungFuSystem then
		kungFuSystem:Study(KungFuID,IsUseGold,IsUseUnBindFirst,IsAutoBuy,true);
	end
end;

--客户端提出查看指定玩家功法领悟进度
define.KungFuSys_ViewOtherProcessMsg
{
	user = NONE,
	RoleID = 0;
}
when{user = NONE}
KungFuSys_ViewOtherProcessMsg = checkUser
when{}
function KungFuSys_ViewOtherProcessMsg(user, RoleID)
	local kungFuSystem = user:GetSystem("CKungFuSystem");
	if not kungFuSystem then
		_info("can not find user's CKungFuSystem by KungFuSys_ViewOtherProcessMsg");
		return;
	end;
	kungFuSystem:ViewOtherKungFuProcess(RoleID);
end;

-------广播
--[[define.ServStudyKungFuSuccessCastMsg
{
	user = NONE, 
	castType = 1, --广播类型  1 = 功法升级广播, 2 = 功法满级广播
	roleID = -1,
	roleName = '',
	kungFuID = 0,
	zhaoshiID = 0
}
when{ user = NONE }
ServStudyKungFuSuccessCastMsg = checkUser
when{ }
function ServStudyKungFuSuccessCastMsg(user, castType, roleID, roleName, kungFuID, zhaoshiID)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
			table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltStudyKungFuSucessCastMsg", {CastType = castType, RoleID = roleID, RoleName = roleName, KungFuID = kungFuID, ZhaoshiID = zhaoshiID});
	print("KungFUSystem cast roleName = "..roleName.."zhaoshiID = "..zhaoshiID)	
end--]]
