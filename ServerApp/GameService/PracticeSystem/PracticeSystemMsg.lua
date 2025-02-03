--玩家修行请求
define.ReqAddPracticeMsg
{
	user = NONE, 
	AutoBuy = false,
	UseGold = false,
	UseBind = false,
}
when{ user = NONE }
ReqAddPracticeMsg = checkUser
when{ }
function ReqAddPracticeMsg(user, AutoBuy, UseGold, UseBind)
	local practiceSystem = user:GetSystem("CPracticeSystem");
	if not practiceSystem then
		return;
	end;
	practiceSystem:AddPractice(AutoBuy, UseGold, UseBind);
end;

--广播
define.PracticeSys_BroadCastMsg
{
	PlayerName = "",
    PlayerRoleID = 0,
	CurLevel = 0,
}
when{}
function PracticeSys_BroadCastMsg(PlayerName, PlayerRoleID, CurLevel)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "PracticeSys_BroadCastMsg", {PlayerName = PlayerName, PlayerRoleID = PlayerRoleID, CurLevel = CurLevel});	
end;


--零点定时清空修行次数
define.UpdatePracticeInfoMsg
{
	
}
when{}
function UpdatePracticeInfoMsg()
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		--if player and player:GetSystem("CPracticeSystem"):HasAuthority("ZhuangBeiXiuLian") then
			local system = player:GetSystem("CPracticeSystem");
			system:ResetPracticeProgress()
			if player then
				table.insert(setNet, player.objNet);
			end;
		end;
	--end;
	_groupcallout(setNet, "ResetPracticeMsg", {});	
end;

--查看对方修行
define.PracticeSys_ViewOtherMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
PracticeSys_ViewOtherMsg = checkUser
when{ }
function PracticeSys_ViewOtherMsg(user, RoleID)
	local pracSys = user:GetSystem("CPracticeSystem");
	if not pracSys then
		return;
	end;
	pracSys:ViewOtherPractice(RoleID);
end; 


----升隐藏属性等级
define.PracticeSys_UpLevelHideAttrMsg
{
	user = NONE,
}
when{user = NONE}
PracticeSys_UpLevelHideAttrMsg = checkUser
when{}
function PracticeSys_UpLevelHideAttrMsg(user)
	local pracSys = user:GetSystem("CPracticeSystem");
	if not pracSys then
		return;
	end;
	pracSys:UpLevelHideAttr();
end
