--[[
	[ \brief 通天塔系统文件
	[ \author 李中昌
	[ \date 2014-6-18
	[ 处理通天塔系统逻辑
	]]

-- 系统对象
_G.CTongTianTowerSystem = {};

-- 通天塔配置文件
local tSysCfg = _G.TongTianTowerConfig;

--[[
	[ \brief 创建系统对象
	[ 创建通天塔系统对象。
	[ \return object 返回通天塔系统对象
	]]
function CTongTianTowerSystem:new()
	local obj = CSystem:new("CTongTianTowerSystem");
	
	for i,v in pairs(CTongTianTowerSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	
	return obj;
end

--[[
	[ \brief 系统初始化
	[ 处理进入游戏的系统信息初始化，换线数据的处理
	[ \return Boolean false表示初始化失败, true表示初始化成功
	]]
function CTongTianTowerSystem:Create()
	-- 每个系统创建时都会挂接到自己的管理者player身上
	local oPlayer = self:GetPlayer();
	
	-- 初始化DB模块
	local oDB = oPlayer:GetDBQuery();
	if not oDB then
		_err("CTongTianTowerSystem Create Cannot get DBQuery");
		return false;
	end
	self.oDBQuery = CTongTianTowerSystemDB:new(oDB, self);

	self.tInfo = {
		-- 通关进度	
		nCurLayer = 1;
		-- 通关的所有时间 毫秒
		nAllTime = 0;
		-- 重置次数
		nExtraCount = 0;
		
		--本周最高进度
		nWeekLayer = 1;
		--本周最快用时
		nWeekTime = 0;
	};
	
	-- 读取信息
	local tData	= oPlayer:GetLineData("CTongTianTowerSystem")[1];
	table.print(tData);
	if not tData then
		_err("CTongTianTowerSystem Create CanNot GetLineData!!!");
		tData = {}
	end
		
	if tData[1] then
		self.tInfo = tData[1];
	else
		-- 插入数据库
		self.oDBQuery:InsertInfo(self.tInfo);
	end
	
	return true;
end

--[[
	[ \brief 进入游戏场景的函数
	[ 登陆游戏之后，同步系统信息
	]]
function CTongTianTowerSystem:OnEnterScene()
	-- 同步所有
	self:SynAll();
end

--[[
	[ \brief 换线前函数
	[ 换线之前整理数据
	]]
function CTongTianTowerSystem:OnChangeLineBegin()
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("error");
		return
	end
		
	local tData = {};
	tData[1] = self.tInfo;
	oPlayer:SetLineData("CTongTianTowerSystem", tData);
end

--[[
[ \brief 同步扩展次数的函数
[ 向客户端同步所有系统扩展次数
]]
function CTongTianTowerSystem:SynAll()
	local oPlayer = self:GetPlayer();

	oPlayer.SyncTongTianTowerAllMsg{Info = self.tInfo};
	oPlayer.SyncTongTianTowerChartMsg{Chart =
		CTongTianTowerChartManager:GetChart()};
end

--[[
[ \brief 清空玩家上周的最快通过记录
]]
function CTongTianTowerSystem:ResetWeek()
    self.tInfo.nWeekLayer = 1;
    self.tInfo.nWeekTime = 1;
    self:SynAll();
end


--[[
	[ \brief 挑战检查函数
	[ 检查是否符合挑战条件
	[ \return boolean 是否满足挑战条件
	]]
function CTongTianTowerSystem:ChallengeCheck(bIsDead)
	--检测是否拥有权限
	if not self:HasAuthority('TongTianTa') then
		return false;
	end
	
	-- 如果当前进度超过了开放等级
	if self.tInfo.nCurLayer > tSysCfg.nMaxLayer then
		return false;
	end
	
	local oPlayer = self:GetPlayer();
	
	--如果角色在死亡状态则返回
	local oStateSystem = oPlayer:GetSystem("CStateSystem");
	if not oStateSystem then
		_err("CTongTianTowerSystem:ChallengeCheck Cannot get CStateSystem");
		return false;
	end;
	
	-- if oStateSystem:GetState() == enPlayerState.ePS_Dead then
		-- return false
	-- end
	-- if oStateSystem:GetState() == enPlayerState.ePS_Fight then
		-- return false
	-- end
	
	--已经在副本中不能再进入通天塔挑战
	local oDuplSystem = oPlayer:GetSystem("CDuplSystem");
	if not oDuplSystem then
		_err("CTongTianTowerSystem:ChallengeCheck Cannot get CDuplSystem");
		return false;
	end;
	if oDuplSystem:IsInDupl() and not tSysCfg.IsTongTianTowerFB(
		oDuplSystem:GetDuplId()) then return false end;
	
	
	local oWarSystem = oPlayer:GetSystem("CWarSystem");
	if not oWarSystem then
		_err("CTongTianTowerSystem:ChallengeCheck Cannot get CWarSystem");
		return false;
	end;
	if oWarSystem:IsInWar() then return false end;
	
	-- 如果是再来一次 先把玩家复活
	if bIsDead then
		if oStateSystem:GetState() == enPlayerState.ePS_Dead then
			oPlayer:GetSystem("CBattleSystem"):DealQunXiaRelive();
		end
	end
	
	return true;
end

--[[
	[ \brief 设置玩家为本条线路排名第一的玩家
	[ 设置玩家为本线路第一，并发送到ks比较
	[\param table  排行帮的排名信息表
	]]
function CTongTianTowerSystem:SetChart()
	local oPlayer = self:GetPlayer();
	local tChart = {};
	tChart.nRoleId = oPlayer:GetRoleID();
	tChart.sName = oPlayer:GetName();
	tChart.nLayer = self.tInfo.nCurLayer;
	tChart.nTime = self.tInfo.nAllTime;
	tChart.nIconID = oPlayer:GetIncoID();
	
	-- 发送到ks比较
	CKernelApp.TongTianTowerUpdateChartMsg{tChart = tChart;};
end

--[[
	[ \brief 排名更新检查函数
	[ 检查是否排名有变化 如果有，更新排名
	]]
function CTongTianTowerSystem:ChartCheck()
	local bIsChange = false;
	-- 和自己的本周记录比较
	if self.tInfo.nCurLayer > self.tInfo.nWeekLayer then
		self.tInfo.nWeekLayer = self.tInfo.nCurLayer;
		self.tInfo.nWeekTime = self.tInfo.nAllTime;
		bIsChange = true;
	elseif self.tInfo.nCurLayer == self.tInfo.nWeekLayer then
		if self.tInfo.nAllTime < self.tInfo.nWeekTime then
			self.tInfo.nWeekTime = self.tInfo.nAllTime;
			bIsChange = true;
		end
	end
	
	-- 如果没有超过自己的本周最快记录 不用和排行榜比较了
	if not bIsChange then return end
	
	local tChart = CTongTianTowerChartManager:GetChart();
	
	if self.tInfo.nCurLayer > tChart.curWeek.nLayer then
		self:SetChart();
	elseif self.tInfo.nCurLayer == tChart.curWeek.nLayer then
		if self.tInfo.nAllTime < tChart.curWeek.nTime then
			self:SetChart();
		end
	end
end 

--[[
	[ \brief 重置函数
	[\param boolean 是否是金币重置
	]]
function CTongTianTowerSystem:Reset(bIsGoldReset)
	if self.tInfo.nCurLayer == 1 then
		return false
	end
	self.tInfo.nCurLayer = 1;
	self.tInfo.nAllTime = 0;
	if bIsGoldReset then
		self.tInfo.nExtraCount = self.tInfo.nExtraCount + 1;
	end
	-- 更新数据库
	self.oDBQuery:UpdateInfo(self.tInfo);
	-- 同步消息
	local oPlayer = self:GetPlayer();
	oPlayer.SyncTongTianTowerAllMsg{Info = self.tInfo};
	return true;
end

--[[
	[ \brief 每天重置重置函数
	]]
function CTongTianTowerSystem:ResetDay()
	self.tInfo.nExtraCount = 0
	self.tInfo.nCurLayer = 1;
	self.tInfo.nAllTime = 0;
	-- 更新数据库
	self.oDBQuery:UpdateInfo(self.tInfo);
	-- 同步消息
	local oPlayer = self:GetPlayer();
	oPlayer.SyncTongTianTowerAllMsg{Info = self.tInfo};
end

