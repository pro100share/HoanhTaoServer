--请求结交宠物
define.RequestKonwPetMsg
{
	user = NONE,
	DwPetId = 0,
}
when{ user = NONE }
RequestKonwPetMsg = checkUser
when{ }
function RequestKonwPetMsg(user, DwPetId)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem:KnowPet(DwPetId);
end; 

--请求宠物指教
define.RequestPetInstructMsg
{
	user = NONE,
	DwPetId = 0,
}
when{ user = NONE }
RequestPetInstructMsg = checkUser
when{ }
function RequestPetInstructMsg(user, DwPetId)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem:OnPetInstruct(DwPetId);
end; 

--请求宠物出战/休息
define.RequestPetStateMsg
{
	user = NONE,
	DwPetId = 0,
	State = 1,   --1休息， 2出战
}
when{ user = NONE }
RequestPetStateMsg = checkUser
when{}
function RequestPetStateMsg(user, DwPetId, State)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem:OnPetStateChg(DwPetId, State);
end; 

--定时清空日指教次数
define.UpdatePetInfoMsg
{
	
}
when{}
function UpdatePetInfoMsg()
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		local system = player:GetSystem("CPetSystem");
		system:ResetPetDayConsult()
		system:ResetPetDayImpart()
		system:ResetPetWashCount()
		if player then
			table.insert(setNet, player.objNet);
		end;
	end;
	
	--此消息重置宠物每日指教和传功次数
	_groupcallout(setNet, "ResetPetDayInfoMsg", {});	
end;

define.PetMoveToRequestMsg
{
	user = NONE;
	XSrc = 0;
	YSrc = 0;
	XDis = 0;
	YDis = 0;
	Speed = 0;
}
when{user = NONE}
PetMoveToRequestMsg = checkUser
when{}
function PetMoveToRequestMsg(user,XSrc,YSrc,XDis,YDis,Speed)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	
	local objPet = petSystem:GetOutPetObject();
	if not objPet then
		return;
	end
	
	objPet:MoveToRequest(XSrc,YSrc,XDis,YDis,Speed);
end;

define.PetMoveStopRequestMsg
{
	user = NONE; 
	XStop = 0;
	YStop = 0;
	DirValue = 0; 
}
when{ user = NONE }
PetMoveStopRequestMsg = checkUser
when{ }
function PetMoveStopRequestMsg( user,XStop,YStop,DirValue )
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	
	local objPet = petSystem:GetOutPetObject();
	if not objPet then
		return;
	end
	objPet:MoveStopRequest(XStop,YStop,DirValue);
end;

----广播
define.PetSys_BroadCastMsg
{
	PlayerName	= "",
	PlayerRoleID= 0,
	PetId = 0,
}
when{}
function PetSys_BroadCastMsg(PlayerName, PlayerRoleID, PetId)
	local n_BroadCastLevel = _G.KnowPetBroadCast[PetId];
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		if objPlayer:GetInfo().dwLevel >= n_BroadCastLevel then
			table.insert(setNet, objPlayer.objNet);
		end;
	end;
	_groupcallout(setNet, "PetSys_BroadCastMsg", {PlayerName = PlayerName, PlayerRoleID = PlayerRoleID, PetId = PetId});	
end;
--申请视野内的所有宠物
define.RequestViewPetMsg
{
	user = NONE; 
}
when{ user = NONE }
RequestViewPetMsg = checkUser
when{ }
function RequestViewPetMsg(user)
	if not CConfig.bIsCrossSvr then
		local petSystem = user:GetSystem("CPetSystem");
		if not petSystem then
			return;
		end;
		petSystem:Clear();
		petSystem:SendMapPetInfo();
	end;
end;


--查看对方宠物
define.PetSys_ViewOtherSwordMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
PetSys_ViewOtherSwordMsg = checkUser
when{ }
function PetSys_ViewOtherSwordMsg(user, RoleID)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem:ViewOtherPet(RoleID);
end; 


--请求宠物传功
define.PetImpartMsg
{
	user = NONE,
	PetID  = 0,
	IsAutoBuy	= false;
	IsUseGold	= false;
}
when{ user = NONE }
PetImpartMsg = checkUser
when{ }
function PetImpartMsg(user, PetID, IsAutoBuy, IsUseGold)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem:OnPetImpart(PetID, IsAutoBuy, IsUseGold);
end; 

-------------------------------------------------------------------------------
--技能执行相关的消息
--开始执行技能

--客户端请求宠物使用技能
define.OnPetSkillExecBeginMsg
{
	user = NONE;
	SkillID = 0,
	ExecTime = 0,
	ExecPoint = {},
	ParamList = {},
	DirValue = 0;
}
when{ user = NONE }
OnPetSkillExecBeginMsg = checkUser
when{ }

function OnPetSkillExecBeginMsg(user,SkillID,ExecTime,ExecPoint,ParamList,DirValue)
	local PetSystem = user:GetSystem("CPetSystem");
	if not PetSystem then
		return;
	end;
	--print("===OnPetSkillExecBeginMsg===",SkillID)
	PetSystem:GetPetSikllSystem():ExecSkillBegin(SkillID,ExecTime,ExecPoint,ParamList,DirValue);
end;


define.OnPetSkillProcessMsg
{
	user = NONE,
	SkillID = 0,
	TargetList = {},
	ActNumber = 0,
}
when {user = NONE}
OnPetSkillProcessMsg = checkUser;
when{}
function OnPetSkillProcessMsg(user,SkillID,TargetList,ActNumber)
	local PetSystem = user:GetSystem("CPetSystem");
	if not PetSystem then
		return;
	end;
	--print("===OnPetSkillProcessMsg===",SkillID)
	PetSystem:GetPetSikllSystem():ExecSkillProc(SkillID,TargetList,ActNumber)
end;
