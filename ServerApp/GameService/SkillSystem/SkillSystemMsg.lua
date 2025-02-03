--[[
功能:	技能系统消息处理
作者:	周华杰
--]]

--玩家请求自己的技能信息 
define.ReadSkllInfoRequestMsg
{
	user = NONE,
	SkillID = 0, --0，nil代表所有技能
};
when {user = NONE}
ReadSkllInfoRequestMsg = checkUser;
when{}
function ReadSkllInfoRequestMsg(user ,SkillID)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:ReadSkllInfoRequest(SkillID);
end;

--玩家请求学习某个技能
define.StudySkillRequestMsg 
{
	user = NONE,
	SkillID = 0,
}
when {user = NONE}
StudySkillRequestMsg = checkUser;
when{}
function StudySkillRequestMsg(user ,SkillID)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:StudySkillRequest(SkillID);
end;

--玩家升级一个技能
define.SkillLevelUpMsg
{
	user = NONE,
	SkillID = 0,
}
when {user = NONE}
SkillLevelUpMsg = checkUser;
when{}
function SkillLevelUpMsg(user ,SkillID)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:LevelUpSkillRequest(SkillID);
end;

--玩家锁定一个目标
define.LockTargetRequestMsg
{
	user = NONE,
	Type = 0,	--怪物或者人
	ID	=0,		--对应的id
}
when {user = NONE}
LockTargetRequestMsg = checkUser;
when{}
function LockTargetRequestMsg(user ,Type,ID)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:LockTargetRequest(Type,ID);
end;

-- --玩家执行了某个技能
-- define.ExecSkillRequestMsg 
-- {
	-- user = NONE,
	-- SkillID = 0,
	-- Param = {},			--技能的作用指向坐标点
	-- ExecTargetList = {},
	-- ExecTime = 0,
	-- ActionType = 0,
	-- ActionID = 0,
	-- Delay = 0,
	-- PosList = {},
	-- TargetList = {},
	-- Index = 0,
	-- ShadowID = 0,
	-- XPos = 0,
	-- YPos = 0,
	-- DirValue = 0,
-- }
-- when {user = NONE}
-- ExecSkillRequestMsg = checkUser;
-- when{}
-- function ExecSkillRequestMsg(user ,SkillID,Param,ExecTargetList,ExecTime,
	-- ActionType,ActionID,Delay,Index,PosList,TargetList,ShadowID,XPos,YPos,DirValue)
	-- if XPos ~= 0 then
		-- local MapSystem = user:GetSystem("CMapSystem");
		-- if MapSystem then
			-- MapSystem:BroadcastPositionInfo(XPos,YPos,DirValue)
		-- end
	-- end
	
	-- local SkillSystem = user:GetSystem("CSkillSystem");
	-- if not SkillSystem then
		-- return;
	-- end;
	-- if ActionID ~= 0 then
		-- SkillSystem:RecordSkillUserAction(ActionType,ActionID,Delay,
			-- Index,PosList,TargetList,ShadowID);
	-- end
	
	-- SkillSystem:ExecSkillRequest(SkillID,Param,ExecTime,ExecTargetList);
-- end;

-- --玩家预先执行了技能的起始动作
-- define.ExecSkillActionMsg 
-- {
	-- user = NONE,
	-- ActionType = 0,
	-- ActionID = 0,
	-- Delay = 0,
	-- PosList = {},
	-- TargetList = {},
	-- Index = 0,
	-- ShadowID = 0,
	-- XPos = 0,
	-- YPos = 0,
	-- DirValue = 0,
-- }
-- when {user = NONE}
-- ExecSkillActionMsg = checkUser;
-- when{}
-- function ExecSkillActionMsg(user,ActionType,ActionID,Delay,Index,PosList,TargetList,ShadowID,XPos,YPos,DirValue)
	-- -- local MapSystem = user:GetSystem("CMapSystem");
	-- -- if MapSystem then
		-- -- MapSystem:BroadcastPositionInfo(XPos,YPos,DirValue)
	-- -- end
	
	-- local SkillSystem = user:GetSystem("CSkillSystem");
	-- if not SkillSystem then
		-- return;
	-- end;
	
	-- SkillSystem:RecordSkillUserAction(ActionType,ActionID,Delay,Index,PosList,TargetList,ShadowID);
-- end;

--玩家的技能动作停止
define.StopSkillActionMsg
{
	user = NONE,
	XPos = 0,
	YPos = 0,
	DirValue = 0,
}
when {user = NONE}
StopSkillActionMsg = checkUser;
when{}
function StopSkillActionMsg(user,XPos,YPos,DirValue)
	-- local MapSystem = user:GetSystem("CMapSystem");
	-- if MapSystem then
		-- MapSystem:BroadcastPositionInfo(XPos,YPos,DirValue)
	-- end
	
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	
	SkillSystem:StopMoveAction();
end;

--
define.ReliveRequestMsg
{
	user = NONE,
	Mode = 0,	--复活模式
}
when {user = NONE}
ReliveRequestMsg = checkUser;
when{}
function ReliveRequestMsg(user,Mode)
	local BattleSystem = user:GetSystem("CBattleSystem");
	if not BattleSystem then
		return;
	end;
	
	BattleSystem:Relive(Mode);
end;

--开始复活
define.ReliveBeginMsg
{
	user = NONE,
}
when {user = NONE}
ReliveBeginMsg = checkUser;
when{}
function ReliveBeginMsg(user)
	local BattleSystem = user:GetSystem("CBattleSystem");
	if not BattleSystem then
		return;
	end;
	
	BattleSystem:BeginRelive();
end;


--
define.SetBattlePointMsg
{
	user = NONE,
	PointInfo = {},
}
when {user = NONE}
SetBattlePointMsg = checkUser;
when{}
function SetBattlePointMsg(user,PointInfo)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:SetPoint(PointInfo);
end;

--
define.ResetPointRequestMsg
{
	user = NONE,
}
when {user = NONE}
ResetPointRequestMsg = checkUser;
when{}
function ResetPointRequestMsg(user)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:ResetPoint();
end;


-------------------------------------------------------------------------------
--技能执行相关的消息
--开始执行技能
define.OnSkillExecBeginMsg
{
	user = NONE,
	SkillID = 0,
	ExecTime = 0,
	ExecPoint = {},
	ParamList = {},
}
when {user = NONE}
OnSkillExecBeginMsg = checkUser;
when{}
function OnSkillExecBeginMsg(user,SkillID,ExecTime,ExecPoint,ParamList)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:ExecSkillBegin(SkillID,ExecTime,ExecPoint,ParamList);
end;

--技能效果执行
define.OnSkillExecProcessMsg
{
	user = NONE,
	SkillID = 0,
	TargetList = {},
	ActNumber = 0,
}
when {user = NONE}
OnSkillExecProcessMsg = checkUser;
when{}
function OnSkillExecProcessMsg(user,SkillID,TargetList,ActNumber)
	local SkillSystem = user:GetSystem("CSkillSystem");
	if not SkillSystem then
		return;
	end;
	SkillSystem:ExecSkillProc(SkillID,TargetList,ActNumber)
	-- print("player OnSkillProcessMsg SkillID", SkillID)
	--table.print(TargetList)
end;



