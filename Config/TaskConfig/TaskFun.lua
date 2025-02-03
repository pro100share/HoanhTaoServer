_G.TaskFun = {}

TaskFun.MaxLevel = 119
TaskFun.Daily = nil
TaskFun.Weekly = nil
TaskFun.LevelDaily = {}
TaskFun.LevelWeekly = {}
TaskFun.TaskType = {}
TaskFun.setQualityRandomTable = nil
local dwStep = 5

local tMonsterKill = 1	--杀怪			monster_num1
local tItemSubmit = 2	--物品提交		item_num1
local tSpecialOpera = 3	--特殊操作		special_num1
local tMapExplore = 4	--地图探索		map_id
local tItemUse = 5		--物品使用		use_time
local tNpcSpeak = 6		--npc对话		npc_need1

local tLevelMap = {
	[30] = {[1005]=1};
	[31] = {[1005]=1};
	[32] = {[1005]=1};
	[33] = {[1005]=1};
	[34] = {[1005]=1};
	[35] = {[1005]=1};
	[36] = {[1005]=1};
	[37] = {[1005]=1};	
	[38] = {[1005]=1};	
	[39] = {[1005]=1};	
}
------------------------------------
--数值取整
local function FloatToInt(dwValue)
	local szValue = tostring(dwValue)
	local ps,pe,v = string.find(szValue,"(%d+)%c?.?")
	local dwValue = tonumber(v)
	return dwValue or 0
end
--取日环
local function GetDaily()
	local Daily = {}
	for k,v in pairs(TaskConfig) do
		if v._type==TaskTypeConfig.Daily then
			table.insert(Daily,k)
		end
	end
	return Daily
end
--取周环
local function GetWeekly()
	local Weekly = {}
	for k,v in pairs(TaskConfig) do
		if v._type==TaskTypeConfig.Weekly then
			table.insert(Weekly,k)
		end
	end
	return Weekly
end
--取某个环任务是否无视等级
local function IsNoTask(cfg)
	if cfg.use_time>0 then return true end;
	if #cfg.monster_id1 > 0 then return false end;
	if #cfg.monster_id2 > 0 then return false end;
	if #cfg.monster_id3 > 0 then return false end;
	if #cfg.monster_id4 > 0 then return false end;
	return true
end
--设置等级日环
local function SetLevelDaily()
	TaskFun.Daily = GetDaily() or {}
	for dwLevel=1,TaskFun.MaxLevel do
		TaskFun.LevelDaily[dwLevel] = {}
		local dwMin = math.floor(dwLevel-math.mod(dwLevel,10))
		local dwMax = (math.floor(dwLevel/10)+1)*10-1
		for _,dwTaskId in pairs(TaskFun.Daily) do
			local cfg = TaskConfig[dwTaskId]
			local dwLevelNeed = cfg.need_lv
			if ((dwLevelNeed >= dwMin) or IsNoTask(cfg)) and (dwLevelNeed<=dwLevel) then
				table.insert(TaskFun.LevelDaily[dwLevel],dwTaskId)
			end
		end
	end
end
--设置等级周环
local function SetLevelWeekly()
	TaskFun.Weekly = GetWeekly()
	for dwLevel=1,TaskFun.MaxLevel do
		TaskFun.LevelWeekly[dwLevel] = {}
		local dwMin = dwLevel - 5
		local dwMax = dwLevel + 5
		if dwMin < math.floor(dwLevel-math.mod(dwLevel,10)) then
			dwMin = math.floor(dwLevel-math.mod(dwLevel,10))
		end
		if dwMax >((math.floor(dwLevel/10)+1)*10-1) then
			dwMax = ((math.floor(dwLevel/10)+1)*10-1)
		end
		for _,dwTaskId in pairs(TaskFun.Weekly) do
			local cfg = TaskConfig[dwTaskId]
			local dwLevelNeed = cfg.need_lv
			if ((dwLevelNeed >= dwMin) or IsNoTask(cfg)) and (dwLevelNeed<=dwLevel) then
				local dwTaskType = 1
				if cfg.monster_num1 > 0 then
					dwTaskType = tMonsterKill
				elseif cfg.item_num1 > 0 then
					dwTaskType = tItemSubmit
				elseif cfg.special_num1 > 0 then
					dwTaskType = tSpecialOpera
				elseif cfg.map_id > 0 then
					dwTaskType = tMapExplore
				elseif cfg.use_time > 0 then
					dwTaskType = tItemUse
				elseif cfg.npc_need1 > 0 then
					dwTaskType = tNpcSpeak
				end
				if tLevelMap[dwLevel] and not tLevelMap[dwLevel][cfg.target_map] then
				else
					TaskFun.LevelWeekly[dwLevel][dwTaskType] = TaskFun.LevelWeekly[dwLevel][dwTaskType] or {}
					table.insert(TaskFun.LevelWeekly[dwLevel][dwTaskType],dwTaskId)
					TaskFun.TaskType[dwTaskId] = dwTaskType
				end
			end
		end
	end
end
--SetLevelDaily()
if CConfig then
	SetLevelWeekly()
end
------------------------------------
--获取日环任务
function TaskFun:GetDaily(dwLevel,dwLoop)
	do return 0 end;
	return 0
end
--获取日环奖励
function TaskFun:GetDailyReward(dwLoop,dwExp,dwMoney,dwPneuma)
	local Reward = {}
	Reward.Item = {}
	Reward.ProfItem = {}
	Reward.dwExp = FloatToInt(dwExp*(1+dwLoop/10))
	Reward.dwMoney = FloatToInt(dwMoney*(1+dwLoop/10))
	Reward.dwPneuma = FloatToInt(dwPneuma*(1+dwLoop/10))
	
	local dwItemId1 = 0
	local dwNum1 = 0
	
	if dwLoop==10 then
		dwItemId1 = 5500070
		dwNum1 = 2
	end
	
	if dwLoop==20 then
		dwItemId1 = 5500070
		dwNum1 = 4
	end
	
	Reward.Item[1] = {dwId=dwItemId1;dwNum=dwNum1};
	Reward.Item[2] = {dwId=0;dwNum=0};
	--职业
	Reward.ProfItem[1] = {dwId=0;dwNum=0};
	Reward.ProfItem[2] = {dwId=0;dwNum=0};
	Reward.ProfItem[3] = {dwId=0;dwNum=0};
	Reward.ProfItem[4] = {dwId=0;dwNum=0};
	return Reward
end
------------------------------------
--获取周环任务
function TaskFun:GetWeekly(dwLevel,dwWeeklyLoop,dwDailyLoop,dwNowLoop,dwLastTaskId)
	local dwLoop = dwDailyLoop
	if dwLevel < TaskOpenLevel.Weekly then
		return 0
	end
	if dwLevel > 119 then
		dwLevel = 119
	end

	if dwLoop > 20 then
		return 0
	end
	local dwTaskType = self.TaskType[dwLastTaskId] or 0
	local dwTaskId = 0
	local Task = nil
	local dwCount = 0
	while not Task do
		dwTaskType = math.mod(dwTaskType,6)+1
		Task = self.LevelWeekly[dwLevel][dwTaskType]
		dwCount = dwCount + 1
		if dwCount > 20 then
			return 0;
		end
	end
	local dwRand = math.random(1,#Task)
	dwTaskId = Task[dwRand] or 0
	
	return dwTaskId;
end
--获取周环奖励
--dwWeeklyLoop 周环
--dwDailyLoop 天接去次数
--dwNowLoop 8换1奖励的环数
--dwQuality 任务的星级，1-10
function TaskFun:GetWeeklyReward(dwWeeklyLoop,dwDailyLoop,dwNowLoop,dwExp,dwMoney,dwPneuma,dwLevel,dwQuality)
	if dwQuality == nil or dwQuality < 1 or dwQuality > 10 then
		dwQuality = 1
	end
	
	local dwQualityXiShu = { 0.7 ,0.8 ,0.9 ,1 ,1.1 ,1.2 ,1.3 ,1.4 ,1.6 , 2.2 };
	local Reward = {}
	Reward.Item = {}
	Reward.ProfItem = {}
	Reward.dwExp		= FloatToInt(math.floor(_G.RoleUpLevelConfig[dwLevel].dwTaskExpHuan * (1+dwDailyLoop*0.01) * dwQualityXiShu[dwQuality]));
	Reward.dwMoney 		= FloatToInt(math.floor(( 5000 + dwLevel * (100+dwLevel*3)) * (1+dwDailyLoop*0.01)) * dwQualityXiShu[dwQuality]);
	Reward.dwPneuma 	= FloatToInt(math.floor((260+dwLevel/4*10)*(1+dwDailyLoop*0.01)) * dwQualityXiShu[dwQuality]);
	Reward.dwXiayi      = FloatToInt(math.floor(340+dwLevel*3)* dwQualityXiShu[dwQuality]);
--[[
	local dwItemId1 = 0
	local dwNum1 = 0
	
	if dwNowLoop == 8 then
		dwItemId1 = 2500122
		dwNum1 = FloatToInt(9+math.floor(dwWeeklyLoop/20)*10)
	end
	]]--
	
	Reward.Item[1] = {dwId=dwItemId1;dwNum=dwNum1};
	Reward.Item[2] = {dwId=0;dwNum=0};
	
	--职业
	Reward.ProfItem[1] = {dwId=0;dwNum=0};
	Reward.ProfItem[2] = {dwId=0;dwNum=0};
	Reward.ProfItem[3] = {dwId=0;dwNum=0};
	Reward.ProfItem[4] = {dwId=0;dwNum=0};
	return Reward
end
--获取周环的特殊奖励
function TaskFun:GetWeeklyRewardSP(dwDailyLoop,dwWeeklyLoop,dwLevel)
	local Info = {
		dwExp = math.floor(_G.RoleUpLevelConfig[dwLevel].dwTaskExpHuan * 6.1);
	--  =dwMoney = math.floor((5000+dwLevel*(100+dwLevel*6))*6.31);
		dwMoney = 0;
		dwPneuma = math.floor((260+dwLevel/4*10)*8.15);
		dwCash = math.floor(65+math.floor(dwLevel/4)*5);
	    dwXiayi = math.floor(476+dwLevel*4.2);
		Item = {
			[1] = {dwId=9405010;dwNum=3;dwBind=1};
			[2] = {dwId=5809524;dwNum=1;dwBind=1};
		};
	}
	return Info;
end

--获取特殊任务奖励
function TaskFun:GetHuoDongReward(dwQuality,dwExp,dwMoney,dwPneuma,dwLevel)
	local Info = {
		dwExp = math.floor(100000+(dwLevel-50)*10000*(1+0.5*math.floor((dwLevel-50)/10)));
		dwMoney = math.floor(2000+(dwLevel-50)*100*(1+0.5*math.floor((dwLevel-50)/10)));
		dwPneuma = 0;
		dwCash = 0;
	    dwXiayi = 0;
		Item = {};
	}
	return Info;
end
------------------------------------
function TaskFun:IsBHTask(dwType)
	return BHTaskTypeConfig[dwType]
end
function TaskFun:CheckSpNeed(objPlayer,dwSp)
	if not objPlayer then return false end;
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	
	-- if dwSp == 999 then
		-- if objPlayer:GetName()=="LXX367" then
			-- return true
		-- end
	-- end
	
	if dwSp == 1 then
		return sysScript:CheckBournLevel(2)
	end
	
	if dwSp == 2 then
		return sysScript:CheckSwordLevel(2)
	end

	if dwSp == 3 then
		return sysScript:CheckAmuletLevel(2)
	end

	if dwSp == 4 then
		return sysScript:CheckMountGrade(2)
	end
	
	return false;		
end

--任务id ，今日接受数量，当前环数，本周环数，玩家等级
function TaskFun:GetOneKetAllCompleteReward(dwTaskId,dwNum,dwNow,dwWeekly,dwLevel,dwQuality)
	local dwWeekly = dwWeekly
	local dwNum = dwNum
	local dwNow = dwNow
	local dwLevel = dwLevel
	local dwTaskId = dwTaskId
	local Cfg = TaskConfig[dwTaskId]
	if not Cfg then return end;
	local dwMoney = Cfg.money
	local dwExp = Cfg.exp
	local dwPneuma = Cfg.pneuma
	local All = {}
	local dwReal = dwNow - 1
	for i=0,(21 - dwNum-1) do
		dwReal = dwReal+1
		if dwReal>8 then
			dwReal = 1
		end
		dwQuality = 10
		local Base = TaskFun:GetWeeklyReward(dwWeekly,dwNum+i,dwReal,dwExp,dwMoney,dwPneuma,dwLevel,dwQuality)
		local Sp = {}
		if dwReal==8 then
			Sp = TaskFun:GetWeeklyRewardSP(dwNum+i,dwWeekly,dwLevel)
		end
		All.dwExp = (All.dwExp or 0) + Base.dwExp + (Sp.dwExp or 0)
		All.dwMoney = (All.dwMoney or 0) + Base.dwMoney + (Sp.dwMoney or 0)
		All.dwPneuma = (All.dwPneuma or 0) + Base.dwPneuma + (Sp.dwPneuma or 0)
		All.dwCash  = (All.dwCash or 0) + (Sp.dwCash or 0)
		All.dwXiayi = (All.dwXiayi or 0) +Base.dwXiayi+ (Sp.dwXiayi or 0)
		All.Item = All.Item or {}
		if Sp.Item and Sp.Item[1] then
			for i=1,#Sp.Item do
				All.Item[i] = All.Item[i] or {}
				All.Item[i].dwItemNumber = (All.Item[i].dwItemNumber or 0) + (Sp.Item[i].dwNum or 0)
				All.Item[i].dwItemEnum = All.Item[i].dwItemEnum or Sp.Item[i].dwId
				All.Item[i].dwBindType = All.Item[i].dwBindType or Sp.Item[i].dwBind
			end
		end
	end
	All.dwReal = dwReal
	return All
end

-- @brief 计算风云任务星级
-- @param object objSystem 系统对象
-- @reutrn number 星级
function TaskFun:GenerateQuality(objSystem)
    if self.setQualityRandomTable == nil then
        local setRadix = {75, 100, 250, 300, 300, 200, 200, 200, 100, 45};
        local setTable = {};
        for k, v in pairs(setRadix) do
            for i = 1, v do
                table.insert(setTable, k);
            end
        end
        self.setQualityRandomTable = setTable;
    end
    return self.setQualityRandomTable[math.random(1, 1770)] or 1;
end

-- @brief 获取调整星级花费
-- @param object objSystem 系统对象
-- @reutrn table 花销
-- {
    -- 类型 1 - 银两 2 - 元宝 0 - 不消耗
    -- dwType = 0;
    -- 数值
    -- dwValue = 0;
-- }
function TaskFun:GetChangeQualityConsume(objSystem)
    return {
        dwType = 1;
        dwValue = 20000;
    };
end

-- @brief 是否最大星级
-- @param number dwQuality 星级
-- @return boolean 是否
function TaskFun:IsMaxQuality(dwQuality)
    return dwQuality == 10;
end
