_G.FestivalJson = {}

--方法
local readfile
local dealtable
local dealreward
local ParseReward;
local dealfestival
local dealbtn
local dealcombi

--数据
local jsonstring
local jsontable
local button_config
local festival_config
local rewards_config
local reward
local festival
local button
local fun = {}

-------------------------------------------------------------------
--字符串切割，参数： 源字符串，切割符
--返回：切割后的表
local function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
	   if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
	   end
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
	   nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end

local function getformattime(str)
	local _,_,y,m,d,h,mi,s = string.find(str,"(.+)-(.+)-(.+) (.+):(.+):(.+)")
	return {m=m,d=d,h=h,mi=mi}
end

local function TableSort(r1,r2)
	return (r1.rewards_id or 999999) < (r2.rewards_id or 999999)
end
-------------------------------------------------------------------
readfile = function()
	local file = io.open("../Data/Festival/Festival.json")
	local temp = file:read("*a")
	if string.find(jsonstring or "",temp) then return end
	jsonstring = temp
	local res,data = pcall(json.decode,jsonstring)
	if not res then
		return
	end

	jsontable = data
	return jsontable
end

dealtable = function()
	button_config = jsontable.button_config
	festival_config = jsontable.festival_config
	rewards_config = jsontable.rewards_config

	return button_config and festival_config and rewards_config
end

dealreward = function()
	reward = {}
	for k,v in pairs(rewards_config) do
		local Info = {}
		local rewards_id = tonumber(v.rewards_id)

		Info.szDes = v.szDes
		Info.Cost = {}
		Info.Reward = {}
		Info.dwTimes = tonumber(v.dwTimes)
		Info.dwRule = tonumber(v.rewards_id)
		Info.bSingle = (v.isSingle=="1")
		Info.dwPos = rewards_id
		Info.dwLevel = tonumber(v.dwLevel)


		Info.fun_id = tonumber(v.fun_id)
		Info.fun_param = Split(v.fun_param,",")
		Info.festival_id = tonumber(v.festival_id)
		Info.rewards_id = rewards_id

		Info.dwRequireLevel = tonumber(v.dwRequireLevel)
		Info.dwRequireType = tonumber(v.dwRequireType)
		Info.dwRequireValue = tonumber(v.dwRequireValue)
		local costCash = tonumber(v.costCash)
		local costGold = tonumber(v.costGold)
		local costMoney = tonumber(v.costMoney)
		local costItems = v.costItems
		local rewards = nil;
        if Info.bSingle then
            rewards =
            {
                [1] = {value = v.rewardsA, name = v.rewardsA_name};
                [2] = {value = v.rewardsB, name = v.rewardsB_name};
                [3] = {value = v.rewardsC, name = v.rewardsC_name};
                [4] = {value = v.rewardsD, name = v.rewardsD_name};
                [5] = {value = v.rewardsE, name = v.rewardsE_name};
                [6] = {value = v.rewardsF, name = v.rewardsF_name};
            };
        else
            rewards = v.rewards;
        end

		Info.Cost.dwMoney = costMoney
		Info.Cost.dwCash = costCash
		Info.Cost.dwGold = costGold
		local cItems = Split(costItems,",")
		for k,v in pairs(cItems) do
			local tmp = Split(v,":")
			local dwItemID = tonumber(tmp[1])
			local dwNum = tonumber(tmp[2])
			local cfg = OtherBaseData[dwItemID] or EquipBaseData[dwItemID]
			if cfg and (dwItemID~=0) then
				table.insert(Info.Cost,{dwItemID=dwItemID;dwNum=dwNum})
			end
		end

        if Info.bSingle then
            for k, v in pairs(rewards) do
                Info.Reward[k] = {
					value = {};
					name = v.name;
				};
                ParseReward(v.value, Info.Reward[k].value);
            end
        else
            ParseReward(rewards, Info.Reward);
        end

		reward[Info.festival_id] = reward[Info.festival_id] or {}

		table.insert(reward[Info.festival_id],Info)
	end

	return reward
end

ParseReward = function (strSource, setGoal)
    if strSource == nil or setGoal == nil then
        return;
    end
    local rItems = Split(strSource, ",");
    for k,v in pairs(rItems) do
        local tmp = Split(v,":")
        local dwItemID = tonumber(tmp[1])
        local dwNum = tonumber(tmp[2])
        local dwBindType = tonumber(tmp[3])
        local dwLifeTime = tonumber(tmp[4])
		local szBornTime = tmp[5];
		local dwBornTime=nil
		if szBornTime then
			local r,_,year,month,day=string.find(szBornTime,"(%d+)-(%d+)-(%d+)");
			if r then
				year=tonumber(year)
				month=tonumber(month)
				day=tonumber(day)
				dwBornTime=CTimeFormat:GetThisTimeMsec(year  , month , day  , 0,  0,  0)
			end
		end
        local cfg = OtherBaseData[dwItemID] or EquipBaseData[dwItemID]
        if cfg and (dwItemID~=0) then
            table.insert(setGoal,{dwItemID=dwItemID;dwNum=dwNum;dwBindType=dwBindType;dwLifeTime=dwLifeTime;dwBornTime=dwBornTime})
        end
    end
end

dealfestival = function()
	festival = {}
	for k,v in pairs(festival_config) do
		local Info = {}
		Info.szName = v.szName
		Info.szPic = v.szPic --

		Info.dwPanelType = tonumber(v.festival_type)--

		Info.dwChargeType = tonumber(v.dwChargeType)
		Info.dwRefe = tonumber(v.dwRefe)
		Info.StartTime = {}
		Info.dwEndTime = tonumber(v.dwEndTime)
		Info.dwRewardTime = tonumber(v.dwRewardTime)
		Info.szRule = v.szRule
		Info.dwBackType = tonumber(v.dwBackType)
		Info.szTips = v.szTips

		Info.btn_id = tonumber(v.btn_id)
		Info.festival_id = tonumber(v.festival_id)

		Info.Festival = {}

		Info.dwType=1
		Info.StartTime[1]=tonumber(v.StartTime);
		if(Info.StartTime[1]==0) then
			Info.dwType=2
			local strTime = v.StartDateTime
			Info.StartTime[2] = getformattime(strTime)
		end

		--dwType==4表示是合服时间
		if button[Info.btn_id] and button[Info.btn_id].dwType==4 then
			Info.dwType=4;
		end

		festival[Info.festival_id] = Info
	end
	return festival
end


dealbtn = function()
	button = {}
	for k,v in pairs(button_config) do
		local Info = {}
		Info.szName = v.szName
		Info.szNamePic = v.szNamePic
		Info.szBackPic = v.szBackPic
		Info.dwRefe = tonumber(v.dwRefe)

		Info.dwBtn = tonumber(v.btn_id)
		Info.StartTime = {}
		Info.dwEndTime = tonumber(v.dwEndTime)

		if tonumber(v.is_open) == 1 then
            Info.bIsOpen = true;
        else
            Info.bIsOpen = false;
        end


		if tonumber(v.is_merge) ==1 then
			Info.is_merge = true
		else
			Info.is_merge = false
		end


		Info.Festiva = {}

		Info.dwType=1
		Info.StartTime[1]=tonumber(v.StartTime);

		if Info.is_merge then
			Info.dwType=4;
		end

		if(Info.StartTime[1]==0) then
			Info.dwType=2
			local strTime = v.StartDateTime
			Info.StartTime[2] = getformattime(strTime)
		end


		button[Info.dwBtn] = Info
	end
	return button
end

dealcombi = function()
	_G.FestivalMainConfig = button
	_G.FestivalListConfig = {}
	_G.FestivalScript = FestivalScript

	for festival_id,Info in pairs(reward) do
		local festival = festival[festival_id]
		if festival then
			festival.Festival = Info
			table.sort(Info,TableSort)
			local dwType = festival.dwPanelType
			if dwType > 3 then
				dwType = 3
			end
			for k,v in pairs(Info) do
				local fun_id = v.fun_id
				local fun_param = v.fun_param
				local rewards_id = v.rewards_id
				local key = ""
				if dwType==1 then
					key = "RushCondition"
				elseif dwType==2 then
					key = nil
				elseif dwType==3 then
					key = "OtherCondition"
				end
				if type(fun_param)=="table" then
					for i=1,#fun_param do
						local tempVar=tonumber(fun_param[i])
						if tempVar == nil then --如果转换数字失败，则把值作为字符串处理
							tempVar=fun_param[i]
						end
						fun_param[i] = tempVar
					end
				end


				if rewards_id and key then
					FestivalScript[key] = FestivalScript[key] or {}
					FestivalScript[key][rewards_id] = {
						fun = fun_id;
						param = fun_param;
					}
				elseif dwType ~= 2 then
					Info[k] = nil
				end
			end
		end
	end

	for festival_id,Info in pairs(festival) do
		local dwBtn = Info.btn_id
		local dwType = Info.dwPanelType
		if dwType > 3 then
			dwType = 3
		end
		local dwIndex = Info.festival_id
		FestivalListConfig[dwType] = FestivalListConfig[dwType] or {}
		FestivalListConfig[dwType][dwIndex] = Info

		local Main = FestivalMainConfig[dwBtn]
		if Main then
			Main.Festiva[dwIndex] = {
				dwType=dwType;
				dwIndex = dwIndex;
			}
		end
	end

	return FestivalMainConfig and FestivalListConfig and FestivalScript
end






function FestivalJson:Init()

	if not readfile() then return 1 end;
	if not dealtable() then return 2 end;
	if not dealbtn() then return 5 end;
	if not dealfestival() then return 4 end;
	if not dealreward() then return 3 end;
	if not dealcombi() then return 6 end;

	return true
end

function FestivalJson:Reload()
	if self:Init() ~= true then return end;
	CFestivalManager:Create()
	CFestivalManager:SendFestivalModi()
	return true
end






















