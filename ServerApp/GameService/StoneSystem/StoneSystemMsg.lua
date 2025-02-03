--[[
功能：宝石合成
作者：曲莹
时间：2012-2-16
]]

define.RequestStoneComposeMsg
{
	user = NONE,
	DwItemEnum = 0, --0，nil代表所有技能
	UseUnBindFlag = false,
	AutoCom = false;
	Num = 0;
};
when{user = NONE}
RequestStoneComposeMsg = checkUser;
when{}

function RequestStoneComposeMsg(user, DwItemEnum, UseUnBindFlag, AutoCom, Num)
	local StoneSystem = user:GetSystem("CStoneSystem");
	if not StoneSystem then
		return;
	end;
	StoneSystem:StoneComposeCondition(DwItemEnum, UseUnBindFlag, AutoCom, Num);
end;

--lw
--客户端装备镶嵌宝石请求
define.EISys_AddStoneMsg
{
	user = NONE,
	--ItemInstId 		= 0,		--要镶嵌的装备的实例Id
	StoneInstId 	= 0,		--要镶嵌的宝石的实例Id
	Slot			= 0,		--槽位
}
when{user = NONE}
EISys_AddStoneMsg = checkUser;
when{}
function EISys_AddStoneMsg(user, StoneInstId, Slot)
	local StoneSystem = user:GetSystem("CStoneSystem");
	if not StoneSystem then 
		_err("can not find user's CStoneSystem by EISys_AddStoneMsg");
		return; 
	end;
	StoneSystem:AddStone( StoneInstId, Slot);
end;
--客户端装备拆除宝石请求
define.EISys_DelStoneMsg
{
	user = NONE,
	--ItemInstId 		= 0,		--要镶嵌的装备的实例Id
	--Slot			= 0,		--槽位
	--PacketInfo		= {},
	StoneInstId		= 0,--宝石实例id
}
when{user = NONE}
EISys_DelStoneMsg = checkUser;
when{}
function EISys_DelStoneMsg(user, StoneInstId)
	local StoneSystem = user:GetSystem("CStoneSystem");
	if not StoneSystem then 
		_err("can not find user's CStoneSystem by EISys_DelStoneMsg");
		return; 
	end;
	StoneSystem:DelStone(StoneInstId);
end;

----广播
define.StoneSys_BroadCastMsg
{
	PlayerName	= "",
	PlayerRoleID= 0,
	NextItemEnum = 0, 
	SuccNum = 0,
	Info		= {},
	Flag = false;
}
when{}
function StoneSys_BroadCastMsg(PlayerName, PlayerRoleID, NextItemEnum, SuccNum, Info, Flag)
	local n_BroadCastLevel = _G.BroadCastConfig.StoneCompose;
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= n_BroadCastLevel then
			table.insert(setNet, objPlayer.objNet);
		end;
	end;
	_groupcallout(setNet, "StoneSys_BroadCastMsg", {PlayerName = PlayerName, PlayerRoleID = PlayerRoleID, NextItemEnum = NextItemEnum, SuccNum = SuccNum, Info = Info, Flag = Flag});	
end;

----宝石铸造 消息 by weiyun
----请求宝石铸造
define.StoneSys_RequestStoneFoundMsg
{
	user = NONE,
	Slot			= 0,		--装备位
};
when{user = NONE}
StoneSys_RequestStoneFoundMsg = checkUser;
when{}
function StoneSys_RequestStoneFoundMsg(user, Slot)
	local StoneSystem = user:GetSystem("CStoneSystem");
	if not StoneSystem then
		return;
	end;
	StoneSystem:FoundStone(Slot);
end;

--宝石铸造广播
define.StoneSys_BroadFoundryCastMsg
{
	PlayerID = 0,
	PlayerName ="",  -----玩家名字
	WearPos = 0,     -----装备位
	FoundryNum = 0,
};
when{}

function StoneSys_BroadFoundryCastMsg(PlayerID,PlayerName,WearPos,FoundryNum)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "StoneSys_BroadFoundryCastMsg", {PlayerID = PlayerID,PlayerName = PlayerName, WearPos = WearPos,FoundryNum = FoundryNum});	
end;


--查看对方宝石铸造信息
define.StoneSys_ViewOtherFoundryMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
StoneSys_ViewOtherFoundryMsg = checkUser
when{ }
function StoneSys_ViewOtherFoundryMsg(user, RoleID)
	local stoneSys = user:GetSystem("CStoneSystem");
	if not stoneSys then
		return;
	end;
	stoneSys:ViewOtherFoundry(RoleID);
end;






