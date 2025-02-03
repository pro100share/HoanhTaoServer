--[[
	[ \brief 离线战斗
	[ \author 沈祺
	[ \date 2014-07-3
	[ 玩家可以与离线角色进行战斗
	[ 战斗已战斗力高低分胜负
	[ 内含类似排行榜功能
	[ 接口文件
	]]

--临时配置文件
local tConfig = _G.TalkSwordConfig;
--临时脚本文件
local tScript = _G.TalkSwordScript;

--[[
	[ \brief 向KS申请数据
	]]
function CTalkSwordSystem:RequestPlayerInfo()
	if not self:HasAuthority("CTalkSwordSystem") then
		return;
	end
	CKernelApp.RequestPlayerInfoMsg{ RoleID = self:GetPlayer():GetRoleID() };
end

--[[
	[ \brief 设置基础信息
	[ 设置基础信息
	[ \param table tInfo 需要设置的BaseInfo
	[ \return bool 设置是否成功
	]]
function CTalkSwordSystem:SetBaseInfo(tInfo)
	_assert(tInfo,"tInfo == nil by CTalkSwordSystem:SetBaseInfo");

	self.tBaseInfo.nChallengeUse = tInfo.nChallengeUse;
	self.tBaseInfo.nChallengeAdd = tInfo.nChallengeAdd;
	self.tBaseInfo.bFullTime = tInfo.bFullTime;
	self.tBaseInfo.nAttackAdd = tInfo.nAttackAdd;
	self.tBaseInfo.nCDTime = tInfo.nCDTime;
	return true;
end

--[[
	[ \brief 设置战报信息
	[ 设置战报信息
	[ \param table tInfo 需要设置的ReportInfo
	[ \return bool 设置是否成功
	]]
function CTalkSwordSystem:SetReportInfo(tInfo)
	_assert(tInfo,"tInfo == nil by CTalkSwordSystem:SetReportInfo");
	self.tReport = self:MakeTableByString(tInfo.tReport);
	return true;
end

--[[
	[ \brief 设置奖励榜单信息
	[ 设置奖励榜单信息
	[ \param table tInfo 需要设置的RankRewardInfo
	[ \return bool 设置是否成功
	]]
function CTalkSwordSystem:SetRankRewardInfo(tInfo)
	_assert(tInfo,"tInfo == nil by CTalkSwordSystem:SetRankRewardInfo");
	self.tRankRewardInfo.nRewardState = tInfo.nRewardState;
	return true;
end

--[[
	[ \brief 设置挑战列表ks发过来的
	[ \param table tChallengeList 挑战列表
	[ \return bool 是否设置成功
	]]
function CTalkSwordSystem:SetChallengeList(tChallengeList)
	self.tChallengeList = tChallengeList;
	self.bPrepare = true;
	return true;
end

--[[
	[ \brief 解析DB中战报字符串
	[ 组织成table
	[ \param string sText DB数据库存的数据
	[ \return table tReport
	]]
function CTalkSwordSystem:MakeTableByString(sText)
	local tReport = {};
	local lastIndex = 0;
	if sText == "" then
		return tReport;
	end
	local sTextList = {};
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(sText,";",nextIndex);
		if not lastIndex then
			break;
		end
		local strcut = string.sub(sText, nextIndex, lastIndex - 1);
		table.insert(sTextList,strcut);
	end

	for i,v in ipairs(sTextList) do
		local tInfo = {};
		lastIndex = 0

		--名字
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(v,",",nextIndex);
		local strcut = string.sub(v, nextIndex, lastIndex - 1);
		tInfo[1] = strcut;
		
		--胜负
		nextIndex = lastIndex + 1;
		lastIndex = string.find(v,",",nextIndex);
		strcut = string.sub(v, nextIndex, lastIndex - 1);
		tInfo[2] = tonumber(strcut);

		--排名
		nextIndex = lastIndex + 1;
		lastIndex = string.find(v,",",nextIndex);
		strcut = string.sub(v, nextIndex, lastIndex - 1);
		tInfo[3] = tonumber(strcut);

		--是否是自己挑战的
		nextIndex = lastIndex + 1;
		lastIndex = string.find(v,",",nextIndex);
		strcut = string.sub(v, nextIndex, lastIndex - 1);
		tInfo[4] = tonumber(strcut);
		tReport[i] = tInfo;

		--自己的挑战排名
		nextIndex = lastIndex + 1;
		strcut = string.sub(v, nextIndex, string.len(v));
		tInfo[5] = tonumber(strcut);
	end
	return tReport;
end

--[[
	[ \brief 更新CD时间
	[ \param number nTime 更新时间,
	[ 正为增加CD,负为减少时间
	]]
function CTalkSwordSystem:UpdateCDTime(nTime)
	self.tBaseInfo.nCDTime = self.tBaseInfo.nCDTime + nTime;
	if self.tBaseInfo.nCDTime <= 0 then
		self.tBaseInfo.nCDTime = 0;
		self.tBaseInfo.bFullTime = false;
		--同步客户端
		self:GetPlayer().TalkSwordReduceCoolingTimeMsg{ Success = true };
		return;
	end
	--更新上限CD时间标志位
	if self.tBaseInfo.nCDTime >= tConfig.CoolTimeLimit * 60 then
		self.tBaseInfo.bFullTime = true;
	end
end

--[[
	[ \brief 申请消除挑战CD时间
	]]
function CTalkSwordSystem:ClearCDTime()
	_assert(self:HasAuthority("CTalkSwordSystem"));
	_assert(self:GetPlayer():GetSystem("CItemSystem"):CostGold(
							math.ceil(self.tBaseInfo.nCDTime / 60 ) *
							tConfig.SubTimeGold,_G.ItemSysOperType.TalkSword));
	self.tBaseInfo.nCDTime = 0;
	self.tBaseInfo.bFullTime = false;
	self:GetPlayer().TalkSwordReduceCoolingTimeMsg{ Success = true };
	self.oDBQuery:UpdateDB();
end

--[[
	[ \brief 接收ks的结构信息
	[ \param table tPlayerInfo 组织的玩家华山论家信息
	]]
function CTalkSwordSystem:ReceivePlayerInfoMsg(tPlayerInfo)
	self.tBaseInfo.nRank = tPlayerInfo.nRank;
	self.tRankRewardInfo.nRewardRank = tPlayerInfo.nRewardRank
	self:SetChallengeList(tPlayerInfo.tChallengeList);
end

--[[
	[\brief 定时将数据库中修炼次数清零
  	]]
function CTalkSwordSystem:ResetPracticeTimes()
	if not self:HasAuthority("CTalkSwordSystem") then
		return
	end
	self.tBaseInfo.nChallengeUse = 0;	--当日已挑战次数
	self.tBaseInfo.nChallengeAdd = 0;	--增加的挑战次数
	self.tBaseInfo.nAttackAdd = 0;		--鼓舞战斗力的次数
	self:GetPlayer().ReFreshMyselfInfoMsg{ BaseInfo = self.tBaseInfo};
	self.oDBQuery:UpdateDB();
end

--[[
	[ \brief 组织战报数据
	[ \param table tReport 战报信息
	[ \return string str 战报拼出来的字符串
	]]
function CTalkSwordDB:MakeStringByTable(tReport)
	local str = "";
	if not tReport then
		return str;
	end
	for i,tInfo in ipairs(tReport) do
		for n,v in ipairs(tInfo)do
			local sSpace = ",";
			if n ~= #tInfo then
				str = str..v..sSpace;
			else
				str = str..v;
			end
		end
		str = str..";";
	end
	return str;
end

--[[
	[ \brief 接收KS战报信息
	[ 保存战报并同步给客户端
	[ \param table tReport 战报列表
	]]
function CTalkSwordSystem:SyncReport(tReport)
	table.insert(self.tReport, 1, tReport);
	--只保存5条数据
	if #self.tReport > tConfig.SRecordLimit then
		table.remove(self.tReport);
	end
	self:GetPlayer().ReFreshNewRcordInfoMsg{ NewRcord = tReport };
	self.oDBQuery:UpdateDB();
end
