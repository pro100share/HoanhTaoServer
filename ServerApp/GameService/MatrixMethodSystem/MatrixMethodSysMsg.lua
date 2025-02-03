--[[
功能：阵法系统消息
作者：魏云
时间：2013-10-29
--]]
-----玩家手动拉杆消息
define.SelfOperateRanderStarValueMsg
{
	user = NONE,
	addExpNum = 0,       ---加经验倍数
	b_isGold = false,    ---为true 是元宝 false 是物品
	b_IsAutoBuy = false, ------为true 是自动购买 false 是不自动购买
	b_IsUseGold = false, ------为true 是元宝 false 是礼金
	b_IsFirstUseBind = false, ---true优先使用绑定的物品 false不使用绑定的物品
}
when{ user = NONE }
SelfOperateRanderStarValueMsg = checkUser
when{ }
function SelfOperateRanderStarValueMsg(user,addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)
	local sMatrixMethodSys = user:GetSystem("CMatrixMethodSystem");
	if not sMatrixMethodSys then
		return;
	end;
	sMatrixMethodSys:SelfOperateRanderStarValue(addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind);
end
----玩家点击摘星换斗按钮消息
define.ClickMoveStarButRandStarValueMsg
{
	user = NONE,
	addExpNum = 0,       ---加经验倍数
	b_isGold = false,    ---为true 是元宝 false 是物品
	b_IsAutoBuy = false, ------为true 是自动购买 false 是不自动购买
	b_IsUseGold = false, ------为true 是元宝 false 是礼金
	b_IsFirstUseBind = false, ---true优先使用绑定的物品 false不使用绑定的物品
}
when{ user = NONE }
ClickMoveStarButRandStarValueMsg = checkUser
when{ }
function ClickMoveStarButRandStarValueMsg(user,addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)
	local sMatrixMethodSys = user:GetSystem("CMatrixMethodSystem");
	if not sMatrixMethodSys then
		return;
	end;
	sMatrixMethodSys:ClickMoveStarButRandStarValue(addExpNum,b_isGold,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind);
end

----套装星升级
define.SuitStarCollectItemMsg
{
	user = NONE,
}
when{ user = NONE }
SuitStarCollectItemMsg = checkUser
when{}
function SuitStarCollectItemMsg(user)
	local sMatrixMethodSys = user:GetSystem("CMatrixMethodSystem");
	if not sMatrixMethodSys then
		return;
	end;
	sMatrixMethodSys:SuitStarCollectItem();
end

---普通星星升级广播
define.BroadCastStarAddLevelMsg
{
	RoleID	= 0,
	RoleName= "",
	StarIndex= 0,
	StarLevel = 0,
};
when{}
function BroadCastStarAddLevelMsg(RoleID,RoleName,StarIndex,StarLevel)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltCMatrixMethodSystemStarMsg", {RoleID = RoleID,RoleName = RoleName,StarIndex = StarIndex,StarLevel =StarLevel});	
end
----套装星星升级广播
define.BroadCastSuitStarAddLevelMsg
{
	RoleID	= 0,
	RoleName= "",
	SuitLevel = 0,
};
when{}
function BroadCastSuitStarAddLevelMsg(RoleID,RoleName,SuitLevel)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltCMatrixMethodSystemSuitMsg", {RoleID = RoleID,RoleName = RoleName,SuitLevel = SuitLevel});	
end
----隐元星升级广播
define.BroadCastHideStarAddLevelMsg
{
	RoleID	= 0,
	RoleName= "",
	HideLevel = 0,
};
when{}
function BroadCastHideStarAddLevelMsg(RoleID,RoleName,HideLevel)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltCMatrixMethodSystemHideMsg", {RoleID = RoleID,RoleName = RoleName,HideLevel = HideLevel});	
end
--查看对方阵法信息
define.ViewOtherMatrixMethodMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
ViewOtherMatrixMethodMsg = checkUser
when{ }
function ViewOtherMatrixMethodMsg(user, RoleID)
	local sys = user:GetSystem("CMatrixMethodSystem");
	if not sys then
		return;
	end;
	sys:ViewOtherMatrixMethod(RoleID);
end

----同步热更新
define.KSMatrixMethodHotUpdateMsg
{
}
when{}
function KSMatrixMethodHotUpdateMsg()
	MatrixMethodConfig:Reload();
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("CMatrixMethodSystem");
		if not sys then
			return;
		end;
		sys:MatrixMethodHotUpdate();  ---同步热更新
	end
end

---每日清空免费拉杆次数

define.KSMatrixMethodClearFreeNumMsg
{
}
when{}
function KSMatrixMethodClearFreeNumMsg()
	if(_G.MatrixMethodConfig) then
		_G.MatrixMethodConfig.bOpen = false;
	end
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("CMatrixMethodSystem");
		if not sys then
			return;
		end;
		sys:MatrixMethodClearFreeNum(); 
	end
end



