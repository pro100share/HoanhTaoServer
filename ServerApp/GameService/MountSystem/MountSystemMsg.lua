--[[
功能：客户端坐骑系统与服务器坐骑系统通信
版本：
	v1.0	2012-04-12 create by lkj
	v2.0	10/15/2012 modify by lkj 删除坐骑提升品质消息，屏蔽坐骑激活、删除坐骑、坐骑技能和坐骑资质相关消息
]]

_define()
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--客户端上马请求
define.MountSys_RideUpMsg
{
	user = NONE,
	Shift = 0;
}
when{user = NONE}
MountSys_RideUpMsg = checkUser
when{}
function MountSys_RideUpMsg(user, Shift)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_RideUpMsg");
		return;
	end;
	mountSystem:RideUp(Shift);
end;
--客户端下马请求
define.MountSys_RideDownMsg
{
	user = NONE,
}
when{user = NONE}
MountSys_RideDownMsg = checkUser
when{}
function MountSys_RideDownMsg(user)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_RideDownMsg");
		return;
	end;
	mountSystem:RideDown();
end;
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--客户端激活坐骑请求
-- define.MountSys_ActivateMsg
-- {
	-- user = NONE,
	-- MountInstID = 0;
-- }
-- when{user = NONE}
-- MountSys_ActivateMsg = checkUser
-- when{}
-- function MountSys_ActivateMsg(user, MountInstID)
	-- local mountSystem = user:GetSystem("CMountSystem");
	-- if not mountSystem then
		-- _info("can not find user's CMountSystem by MountSys_ActivateMsg");
		-- return;
	-- end;
	-- mountSystem:Activate(MountInstID);
-- end;
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--客户端删除坐骑请求
-- define.MountSys_DeleteMountInstMsg
-- {
	-- user = NONE,
	-- MountInstID = 0;
-- }
-- when{user = NONE}
-- MountSys_DeleteMountInstMsg = checkUser
-- when{}
-- function MountSys_DeleteMountInstMsg(user, MountInstID)
	-- local mountSystem = user:GetSystem("CMountSystem");
	-- if not mountSystem then
		-- _info("can not find user's CMountSystem by MountSys_DeleteMountInstMsg");
		-- return;
	-- end;
	-- mountSystem:DeleteMountInst(MountInstID);
-- end;
-----------------------------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
--客户端坐骑升阶请求
define.MountSys_UpGradeMsg
{
	user = NONE,
	MountInstID = 0;
	IsAutoBuy	= false;
	IsUseGold	= false;
	IsFirstUseBind = false;
}
when{user = NONE}
MountSys_UpGradeMsg = checkUser
when{}
function MountSys_UpGradeMsg(user, MountInstID, IsAutoBuy, IsUseGold,IsFirstUseBind)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_UpGradeMsg");
		return;
	end;
	mountSystem:UpGrade(MountInstID, IsAutoBuy, IsUseGold,IsFirstUseBind);
end;
--客户端提升坐骑资质请求
-- define.MountSys_UpAptitudeMsg
-- {
	-- user = NONE,
	-- Info = {};
-- }
-- when{user = NONE}
-- MountSys_UpAptitudeMsg = checkUser
-- when{}
-- function MountSys_UpAptitudeMsg(user, Info)
	-- local mountSystem = user:GetSystem("CMountSystem");
	-- if not mountSystem then
		-- _info("can not find user's CMountSystem by MountSys_UpAptitudeMsg");
		-- return;
	-- end;
	-- mountSystem:UpAptitude(Info);
-- end;
--客户端提升坐骑技能请求
-- define.MountSys_UpSkillMsg
-- {
	-- user = NONE,
	-- Info = {};
-- }
-- when{user = NONE}
-- MountSys_UpSkillMsg = checkUser
-- when{}
-- function MountSys_UpSkillMsg(user, Info)
	-- local mountSystem = user:GetSystem("CMountSystem");
	-- if not mountSystem then
		-- _info("can not find user's CMountSystem by MountSys_UpSkillMsg");
		-- return;
	-- end;
	-- mountSystem:UpSkill(Info);
-- end;
----------------------------------------------------------------------
--客户端提出查看指定玩家指定坐骑
define.MountSys_ViewOtherMountListMsg
{
	user = NONE,
	RoleID = 0;
	MountInstID = 0;
}
when{user = NONE}
MountSys_ViewOtherMountListMsg = checkUser
when{}
function MountSys_ViewOtherMountListMsg(user, RoleID, MountInstID)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_ViewOtherMountListMsg");
		return;
	end;
	mountSystem:ViewOtherMountList(RoleID, MountInstID);
end;
-------------------------------------------------------------------
--客户端请求给坐骑穿上某件装备
define.MountSys_PutOnEquipMsg
{
	user = NONE,
	MountInstID = 0;
	ItemInstID = 0;
}
when{user = NONE}
MountSys_PutOnEquipMsg = checkUser
when{}
function MountSys_PutOnEquipMsg(user, MountInstID, ItemInstID)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_PutOnEquipMsg");
		return;
	end;
	mountSystem:PutOnEquip(MountInstID, ItemInstID);
end;
--客户端请求给坐骑脱下某件装备
define.MountSys_PutOffEquipMsg
{
	user = NONE,
	MountInstID = 0;
	EquipPos = 0;
	PosPage = 0;
	PosSlot = 0;
}
when{user = NONE}
MountSys_PutOffEquipMsg = checkUser
when{}
function MountSys_PutOffEquipMsg(user, MountInstID, EquipPos, PosPage, PosSlot)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_PutOffEquipMsg");
		return;
	end;
	mountSystem:PutOffEquip(MountInstID, EquipPos, PosPage, PosSlot);
end;
-----------------------------------------------------------
--客户端请求坐骑存盘
define.MountSys_SaveToDBMsg
{
	user = NONE;
}
when{user = NONE}
MountSys_SaveToDBMsg = checkUser
when{}
function MountSys_SaveToDBMsg(user)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_SaveToDBMsg");
		return;
	end;
	mountSystem:Save();
end;


-------------------------------------KS调用
define.MountSys_BroadCastUpGradeMsg
{
	PlayerRoleID = 0;
	PlayerName	= "";
	MountInstID = 0;
	BeforeName = "",
	BeforeQuality = 0,
	AfterName = "",
	AfterQuality = 0
}
when{}
function MountSys_BroadCastUpGradeMsg(PlayerRoleID, PlayerName, MountInstID, BeforeName, BeforeQuality, AfterName, AfterQuality)
	local n_BroadCastLevel = _G.BroadCastConfig.MountUp;
    local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= n_BroadCastLevel then
            table.insert(setNet, objPlayer.objNet);
		end;
	end; 
    _groupcallout(setNet, "MountSys_BroadCastUpGradeMsg", {
                PlayerRoleID	= PlayerRoleID,	
                PlayerName      = PlayerName, 
                MountInstID     = MountInstID,	
                BeforeName      = BeforeName,
				BeforeQuality	= BeforeQuality,
				AfterName		= AfterName,
				AfterQuality	= AfterQuality
			});
end;

-----------------坐骑转生功能-----------------------
----转生按钮
define.MountSys_ChangeRankAddExpMsg
{
	user = NONE;
	Num = 0;
	IsAutoBuy = false;
	IsUseGold = false;
	IsFirstUseBind = false;
}
when{user = NONE}
MountSys_ChangeRankAddExpMsg = checkUser
when{}
function MountSys_ChangeRankAddExpMsg(user,Num,IsAutoBuy,IsUseGold,IsFirstUseBind)
	local mountSystem = user:GetSystem("CMountSystem");
	if not mountSystem then
		_info("can not find user's CMountSystem by MountSys_SaveToDBMsg");
		return;
	end;
	mountSystem:ChangeRankAddExp(Num,IsAutoBuy,IsUseGold,IsFirstUseBind);
end;

---广播
define.BroadCastChangeRankMsg
{
	RoleID	= 0,
	RoleName= "",
	Rank = 0,
};
when{}
function BroadCastChangeRankMsg(RoleID,RoleName,Rank)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastChangeRankMsg", {RoleID = RoleID,RoleName = RoleName,Rank = Rank});	
end


