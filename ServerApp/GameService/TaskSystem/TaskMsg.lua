--[[
功能：任务系统 消息（服务器）
作者：周长沙
时间：2012-2-11
]]
_define()

-- 消息对象
_G.TaskMessage = {
    -- 密钥
    dwSecretKey = 777;
};

-----------------------------------------
--收到玩家请求获取当前所有任务信息
define.TaskGetPlayerTaskMsg
{
	user = NONE;
}
when{ user = NONE }
TaskGetPlayerTaskMsg = checkUser
when{}
function TaskGetPlayerTaskMsg(user)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:SendAllTaskInfo()
end
--收到玩家接受任务请求
define.TaskAskForAcceptMsg
{
	user = NONE;
	DwTaskId = 0;
}
when{ user = NONE }
TaskAskForAcceptMsg = checkUser
when{}
function TaskAskForAcceptMsg(user,DwTaskId)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:RcvAcceptTask(DwTaskId)
end
--收到玩家放弃任务请求
define.TaskAskForDoffMsg
{
	user = NONE;
	DwTaskId = 0;
}
when{ user = NONE }
TaskAskForDoffMsg = checkUser
when{}
function TaskAskForDoffMsg(user,DwTaskId)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:RcvDoffTask(DwTaskId)
end
--收到玩家完成任务请求
define.TaskAskForCompleteMsg
{
	user = NONE;
	DwTaskId = 0;
}
when{ user = NONE }
TaskAskForCompleteMsg = checkUser
when{}
function TaskAskForCompleteMsg(user,DwTaskId)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:RcvCompleteTask(DwTaskId)
end
--收到玩家到达任务地点请求
define.TaskAskForRightPlaceMsg
{
	user = NONE;
}
when{ user = NONE }
TaskAskForRightPlaceMsg = checkUser
when{}
function TaskAskForRightPlaceMsg(user)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:RcvRightPlace()
end
--收到玩家检查任务进度请求
define.TaskAskForCheckMsg
{
	user = NONE;
	TaskId = 0;
}
when{ user = NONE }
TaskAskForCheckMsg = checkUser
when{}
function TaskAskForCheckMsg(user,TaskId)
	local sysTask = user:GetSystem("CTaskSystem");
	if sysTask:CheckTaskProgressOnUpdate(TaskId) then
		sysTask:SendUpdateTask(TaskId)
	end
end
--收到玩家与npc对话完成消息
define.TaskAskForTalkOverMsg
{
	user = NONE;
	TaskId = 0;
	NpcId = 0;
}
when{ user = NONE }
TaskAskForTalkOverMsg = checkUser
when{}
function TaskAskForTalkOverMsg(user,TaskId,NpcId)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:OnAskForTalkOver(TaskId,NpcId)
end
--收到快速完成周环任务消息
define.TaskAskForCompleteWeeklyMsg
{
	user = NONE;
}
when{ user = NONE }
TaskAskForCompleteWeeklyMsg = checkUser
when{}
function TaskAskForCompleteWeeklyMsg(user)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:RcvCompleteWeekly()
end


define.TaskAskForCompleteWeeklyAllMsg
{
	user = NONE;
}
when{ user = NONE }
TaskAskForCompleteWeeklyAllMsg = checkUser
when{}
function TaskAskForCompleteWeeklyAllMsg(user)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:RcvCompleteWeeklyAll()
end

--风云任务调整星级
define.TaskChangeQualityRequestMsg
{
	user = NONE;
}
when{user = NONE}
TaskChangeQualityRequestMsg = checkUser
when{}
function TaskChangeQualityRequestMsg(user)
	local sysTask = user:GetSystem("CTaskSystem");
	if sysTask then
		sysTask:ChangeTaskQuality();
	end
end;

-- 风云任务满星广播
define.TaskMaxQualityBroadcastMsg
{
    -- 密钥
    SecretKey = 0;
    -- 角色标识符
    RoleID = 0;
    -- 角色名称
    RoleName = "";
}
when{}
function TaskMaxQualityBroadcastMsg(SecretKey, RoleID, RoleName)
    if SecretKey ~= TaskMessage.dwSecretKey then
        return;
    end

	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	_groupcallout(setNet,
        "TaskMaxQualityBroadcastMsg", { 
            RoleID = RoleID;
            RoleName = RoleName;
        });	
end

--------------------------------------------------
--模拟事件中心消息（测试用）
define.TaskAskForEventMsg
{
	user = NONE;
	EventName = "";
	Num = 0;
}
when{ user = NONE }
TaskAskForEventMsg = checkUser
when{}
function TaskAskForEventMsg(user,EventName,Num)
	local sysTask = user:GetSystem("CTaskSystem");
	sysTask:OnEventCenter(EventName,Num)
end
--------------------------------------------------



































