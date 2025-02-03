--[[
���ܣ���ϵͳ��Ϣ
���ߣ�κ��
ʱ�䣺2013-10-29
--]]
-----����ֶ�������Ϣ
define.SelfOperateRanderStarValueMsg
{
	user = NONE,
	addExpNum = 0,       ---�Ӿ��鱶��
	b_isGold = false,    ---Ϊtrue ��Ԫ�� false ����Ʒ
	b_IsAutoBuy = false, ------Ϊtrue ���Զ����� false �ǲ��Զ�����
	b_IsUseGold = false, ------Ϊtrue ��Ԫ�� false �����
	b_IsFirstUseBind = false, ---true����ʹ�ð󶨵���Ʒ false��ʹ�ð󶨵���Ʒ
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
----��ҵ��ժ�ǻ�����ť��Ϣ
define.ClickMoveStarButRandStarValueMsg
{
	user = NONE,
	addExpNum = 0,       ---�Ӿ��鱶��
	b_isGold = false,    ---Ϊtrue ��Ԫ�� false ����Ʒ
	b_IsAutoBuy = false, ------Ϊtrue ���Զ����� false �ǲ��Զ�����
	b_IsUseGold = false, ------Ϊtrue ��Ԫ�� false �����
	b_IsFirstUseBind = false, ---true����ʹ�ð󶨵���Ʒ false��ʹ�ð󶨵���Ʒ
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

----��װ������
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

---��ͨ���������㲥
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
----��װ���������㲥
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
----��Ԫ�������㲥
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
--�鿴�Է�����Ϣ
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

----ͬ���ȸ���
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
		sys:MatrixMethodHotUpdate();  ---ͬ���ȸ���
	end
end

---ÿ�����������˴���

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



