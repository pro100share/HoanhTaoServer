--[[
功能：全局通天塔管理器
类型：继承于CSingle类，用来管理通天塔定时清除
版本：
	v1.0	2014-6-19 create by lizc
]]


_G.CTongTianTowerMgr = CSingle:new();
CSingleManager:AddSingle(CTongTianTowerMgr);

-- 排名表
CTongTianTowerMgr.tChart = {
	lastWeek = {
		nRoleId = 0;
		sName = "";
		nLayer = 1;
		nTime = 0;
		nIconID = 0;
	};
	
	curWeek = {
		nRoleId = 0;
		sName = "";
		nLayer = 1;
		nTime = 0;
		nIconID = 0;
	};
};

--[[
	[ \brief 创建管理器对象
	[初始化定时器
	]]
function CTongTianTowerMgr:Create()	
	--初始化计时器
	-- 每天清理通天塔系统信息
	CAlarmClock:AddTask({dwTime = _G.TongTianTowerConfig.sDayReset},
		CAlarmTaskCycleType.eDay, 1, 0, function() self:ResetDay() end, {});
	
	-- 每周排名
	CAlarmClock:AddTask({dwWeek = _G.TongTianTowerConfig.nWeekResetDay,
		dwTime = _G.TongTianTowerConfig.sWeekReset},CAlarmTaskCycleType.eWeek,
			1, 0, function() self:ResetWeek() end, {});
		
	-- 擂主广播
	CAlarmClock:AddTask({dwWeek = _G.TongTianTowerConfig.nWeekResetDay,
		dwTime = _G.TongTianTowerConfig.sChampBoardcastTime},
			CAlarmTaskCycleType.eWeek, 1, 0, function() self:BoardCast() end, {});
		
	--读取排行榜信息
	self:ReadInfoFromDB();
	return true;
end;

--[[
	[ \brief 每日重置
	]]
function CTongTianTowerMgr:ResetDay()
	local sSql = [[update "T_Role_TongTianTower_Info" set 
		"nCurLayer"=$1, "nExtraCount"=$2, "nAllTime"=$3;]]
	CPlayerDBQuery:GetDBQuery():execute(sSql, 1, 0, 0);
		
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CTongTianTowerSystem",
			Func = "ResetDay",};
	end;	
end;

--[[
	[ \brief 每周重置
	]]
function CTongTianTowerMgr:ResetWeek()
    _info("CTongTianTowerMgr:ResetWeek=========1");
	-- 用本周的数据替换上周的数据
	local sSql = [[update "T_TongTianTower_Chart" set "nRoleId"=$1, "sName"=$2,
		"nLayer"= $3, "nTime"=$4, "nIconID"=$5 where "nWeekType"=$6;]]
		
	local tCurWeek = self.tChart.curWeek;
	CPlayerDBQuery:GetDBQuery():execute(sSql, tCurWeek.nRoleId, tCurWeek.sName,
		tCurWeek.nLayer, tCurWeek.nTime, tCurWeek.nIconID, 1);
	
	-- 本周数据重置
	CPlayerDBQuery:GetDBQuery():execute(sSql, 0, '', 1, 0, 0, 2);
	
	self.tChart.lastWeek = tCurWeek;
	self.tChart.curWeek = {
		nRoleId = 0;
		sName = "";
		nLayer = 1;
		nTime = 0;
		nIconID = 0;
	};
	
	-- 发邮件
	self:SendAward();
	
	-- 通知所有线路
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.TongTianTowerChartUpdateMsg{tChart = self.tChart};
	end;
    
    -- 重置每个玩家的每周最快记录
    sSql = [[update "T_Role_TongTianTower_Info" set "nWeekLayer"=$1, "nWeekTime"
        =$2;]]
    CPlayerDBQuery:GetDBQuery():execute(sSql, 1, 0);
    for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CTongTianTowerSystem",
			Func = "ResetWeek"};
	end;
    _info("CTongTianTowerMgr:ResetWeek=========2");		
end;

--[[
	[ \brief 从数据库读取排行榜信息
	]]
function CTongTianTowerMgr:ReadInfoFromDB()
	local dbres = CPlayerDBQuery:GetDBQuery()
		:execute_sync('select * from "T_TongTianTower_Chart"');
		
	--如果没有信息 插入数据库初始信息
	if not dbres then
		local szSql = [[insert into "T_TongTianTower_Chart" values
			($1,$2,$3,$4,$5,$6);]];
		CPlayerDBQuery:GetDBQuery():execute(szSql, 1, 0, "", 1, 0, 0);
		CPlayerDBQuery:GetDBQuery():execute(szSql, 2, 0, "", 1, 0, 0);
		return;
	end
	
	for _, tChart in pairs(dbres) do
		-- nWeekType 1 上周数据,  2本周数据
		if tChart.nWeekType == 1 then
			self.tChart.lastWeek = tChart;
		elseif tChart.nWeekType == 2 then
			self.tChart.curWeek = tChart;
		else
			_err("CTongTianTowerMgr:ReadInfoFromDB nWeekType err!!")
		end
	end	
end

--[[
	[ \brief 给gs发送排行榜信息
	]]
function CTongTianTowerMgr:SendInfo(nLineId)
	local oLine = CGameLineManager:GetLine(nLineId);
	if oLine then
		oLine.TongTianTowerChartUpdateMsg{tChart = self.tChart};
	end 
end

--[[
	[ \brief 更新排行榜信息并发送给所有gs
	]]

function CTongTianTowerMgr:Update(tChart)
	self.tChart.curWeek = tChart;
	table.print(tChart)
	-- 存数据库
	local szSql =
		[[ update "T_TongTianTower_Chart" set "nRoleId"=$1, "sName"=$2,
			"nLayer"= $3, "nIconID"=$4, "nTime"=$5 where "nWeekType"=$6;
		]]
			
	CPlayerDBQuery:GetDBQuery():execute(szSql, tChart.nRoleId, tChart.sName,
		tChart.nLayer, tChart.nIconID, tChart.nTime, 2);

	-- 同步给所有gs
	local tLine = CGameLineManager:GetAllLine();
	for _,oLine in pairs(tLine)do
		oLine.TongTianTowerChartUpdateMsg{tChart = self.tChart};
	end
end

--[[
	[ \brief 给上周的擂主发奖励
	]]
function CTongTianTowerMgr:SendAward()
	local tItem = {}
	
	local oItem = SItemMessage:new();
	oItem.dwItemEnum = TongTianTowerConfig.dwItemEnum;
	oItem.dwItemNumber = 1;
	local itemCfg = _G.OtherBaseData[oItem.dwItemEnum];
	if itemCfg then
		oItem.dwBindType = itemCfg.dwBindType;
	else 
		oItem.dwBindType = _G.enItemBindType.eYes;
	end
	table.insert(tItem, oItem);
	
	local objMail = CMail:new();
	objMail:SetSender(10086, "系统");
	objMail:SetReceiver(self.tChart.lastWeek.nRoleId, "");
	objMail:SetContent(TongTianTowerConfig.sMailTopic,
		TongTianTowerConfig.sMailContent);
	objMail:SetLifeTime(SMailInfo.life*24*60*60*1000);
	objMail:SetAccessory(0, 0, 0, tItem);
	CMailManager:SendMail(objMail);
end	


--[[
	[\brief 擂主广播
	]]
function CTongTianTowerMgr:BoardCast()
	-- 同步给所有gs
	local tLastWeek = self.tChart.lastWeek;
	local tLine = CGameLineManager:GetAllLine();
	for _,oLine in pairs(tLine)do
		oLine.TongTianTowerBoardcastMsg{Type =
				_G.TongTianTowerConfig.BroadcastEnum.Champion, RoleID =
					tLastWeek.nRoleId, RoleName = tLastWeek.sName,
						Layer = tLastWeek.nLayer - 1};
	end
end	
	
