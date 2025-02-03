
_G.CExaminationMgr = CSingle:new();
CSingleManager:AddSingle(CExaminationMgr);
--create
function CExaminationMgr:Create()
	for _, week in pairs(_G.ExaminationConf.StartWeek) do
		--初始化计时器
		CAlarmClock:AddTask(
			{dwWeek = week - 1, dwTime = _G.ExaminationConf.NoticeTime},
			CAlarmTaskCycleType.eWeek, 1, 0,
			function() self:NoticeStart() end, {}
		)
		CAlarmClock:AddTask(
			{dwWeek = week - 1, dwTime = _G.ExaminationConf.StartTime},
			CAlarmTaskCycleType.eWeek, 1, 0,
			function() self:StartExam() end, {}
		)
		CAlarmClock:AddTask(
			{dwWeek = week - 1, dwTime = _G.ExaminationConf.EndTime},
			CAlarmTaskCycleType.eWeek, 1, 0,
			function() self:NoticeEnd() end, {}
		)
	end;
	--
	self.nState = 3;
	--每轮问题数目
	self.nQuestionNum = _G.ExaminationConf.QuestionNum;
	
	return true;
end;

function CExaminationMgr:NoticeStart()
	--参与者列表
	self.tJoinTable = {};
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.DT_KSCallGS_NoticeStartMsg{};
	end;
end;

function CExaminationMgr:NoticeEnd()
	self.nState = 3;
	--参与者列表
	-- self.tJoinTable = {};
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.DT_KSCallGS_NoticeEndMsg{};
	end;
end;

function CExaminationMgr:StartExam()
	self.nState = 1;
	--题库
	self.tQuestionPool = {};
	--初始化问题
	self:InitializeExam();
	
	--添加发题定时器
	CAlarmClock:AddTask(
		{dwMsec = _now() + 1000},
		CAlarmTaskCycleType.eMinute, 0.25, self.nQuestionNum,
		function() self:SendQuestion() end, {}
	);
	--添加发结果定时器
	CAlarmClock:AddTask(
		{dwMsec = _now() + 12000},
		CAlarmTaskCycleType.eMinute, 0.25, self.nQuestionNum,
		function() self:SendRank() end, {}
	);
end;


--初始化题库
function CExaminationMgr:InitializeExam()
	local tempT = {}; 
	for i=1, self.nQuestionNum do
		local index = math.random(1, _G.ExaminationPoolNum);
		while tempT[index] do
			index = math.random(1, _G.ExaminationPoolNum);
		end;
		tempT[index] = true;
		table.insert(self.tQuestionPool, index);
	end;
end;

--发题
function CExaminationMgr:SendQuestion()
	local index = self.tQuestionPool[1];
	if index then
		table.remove(self.tQuestionPool, 1);
		local id = self.nQuestionNum - #self.tQuestionPool;
		for i,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.DT_KSCallGS_SendQuestionMsg{ID = id, Index = index};
		end;
	end;
end;

local function tempSort(a, b)
	if a[3] > b[3] then
		return true;
	elseif a[3] == b[3] then
		if a[4] > b[4] then
			return true;
		elseif a[4] == b[4] then
			return a[1] > b[1];
		end;
	end;
	return false;
end;

--发送积分排行
function CExaminationMgr:SendRank()
	--排名
	local tTemp = {};
	for roleid, info in pairs(self.tJoinTable) do
		local t = {
			[1] = roleid,
			[2] = info.name;
			[3] = info.point;
			[4] = info.exps;
		};
		table.insert(tTemp, t);
	end;
	table.sort(tTemp, tempSort);
	local tRank = {};
	for i = 1, 10 do
		if tTemp[i] then
			tTemp[i][4] = nil;
			tRank[i] = tTemp[i];
		end;
	end;
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.DT_KSCallGS_SendRankMsg{Rank = tRank};
	end;
	
	if #self.tQuestionPool == 0 then
		self.nState = 2;
		for i,objLine in pairs(CGameLineManager:GetAllLine()) do
			objLine.DT_KSCallGS_EndMsg{};
		end;
	end;
end;




--玩家答题加积分
function CExaminationMgr:AddPoint(RoleID, Point)
	local player = CPlayerManager:GetPlayerByRoleID(RoleID);
	if player then
		local info = self.tJoinTable[RoleID];
		if not info then
			self.tJoinTable[RoleID] = {
				point = 0;
				right = 0;
				wrong = 0;
				name  = player:GetName();
				exps  = player:GetExp();
			};
			info = self.tJoinTable[RoleID]
		end;
		if Point > 0 then
			info.right = info.right + 1;
			info.point = info.point + Point;
			info.exps  = player:GetExp();
		else
			info.wrong = info.wrong + 1;
			info.exps  = player:GetExp();
		end
	end;
end;

--玩家参与补考
function CExaminationMgr:MakeUp(LineID, RoleID)
	local line = CGameLineManager:GetLine(LineID);
    if line then
		if self.nState == 2 then
			if self.tJoinTable[RoleID] then
				line.DT_KSCallGS_MakeUpResultMsg{RoleID = RoleID, State = 1};
			else
				self.tJoinTable[RoleID] = {
					point = 1;
					right = 0;
					wrong = 0;
				};
				line.DT_KSCallGS_MakeUpResultMsg{RoleID = RoleID, State = 2};
			end;
		else
			line.DT_KSCallGS_MakeUpResultMsg{RoleID = RoleID, State = 0};
		end;
    end;
end;

function CExaminationMgr:GetPlayerInfo(LineID, RoleID)
	local line = CGameLineManager:GetLine(LineID);
    if line then
		local info = self.tJoinTable[RoleID];
		if info then
			line.DT_KSCallGS_SetPlayerInfoMsg{RoleID = RoleID, Right = info.right, Wrong = info.wrong, Point = info.point};
		else
			line.DT_KSCallGS_SetPlayerInfoMsg{RoleID = RoleID};
		end;
    end;
end

-- 统计玩家今日答题数量
function CExaminationMgr:CalculateCount(tCount, nMaxCount, nID)
    if not self.tJoinTable then return; end
    for nRoleID, tInfo in pairs(self.tJoinTable) do 
         if not tCount[nRoleID] then tCount[nRoleID] = {}; end
         tCount[nRoleID][nID] = nMaxCount - tInfo.right - tInfo.wrong;
    end
end

define.DT_GSCallKS_AddPointMsg
{
	RoleID = 0;
	Point = 0;
}
when{}
function DT_GSCallKS_AddPointMsg(RoleID, Point)
	CExaminationMgr:AddPoint(RoleID, Point)
end;

define.DT_GSCallKS_MakeUpMsg
{
	LineID = 0;
	RoleID = 0;
}
when{}
function DT_GSCallKS_MakeUpMsg(LineID, RoleID)
	CExaminationMgr:MakeUp(LineID, RoleID)
end;

define.DT_GSCallKS_GetPlayerInfoMsg
{
	LineID = 0;
	RoleID = 0;
}
when{}
function DT_GSCallKS_GetPlayerInfoMsg(LineID, RoleID)
	CExaminationMgr:GetPlayerInfo(LineID, RoleID)
end;


