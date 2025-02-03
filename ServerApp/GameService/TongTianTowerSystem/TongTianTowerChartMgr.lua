--[[
	[ \brief 通天塔排名管理器
	[ \author 李中昌
	[ \date 2014-6-18
	[ 处理通天塔排名逻辑
	]]
	
-- 管理器对象
_G.CTongTianTowerChartManager = CSingle:new();     
CSingleManager:AddSingle(CTongTianTowerChartManager);
	
-- 排名信息
CTongTianTowerChartManager.tChart = {
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
}

--[[
	[ \brief 创建排名管理器
	]]	
function CTongTianTowerChartManager:Create()
	return true;
end

--[[
	[ \brief 向ks发送请求系统信心
	]]	
function CTongTianTowerChartManager:RequestInitInfoFromKS()
	CKernelApp.OnRequestTongTianTowerChartMsg
	{
		LineID = CKernelApp.dwLineID;
	}
end;

--[[
	[ \brief ks重连的回调函数 重连之后请求系统排名信息
	]]
function CTongTianTowerChartManager:OnKSReConnect()
	self:RequestInitInfoFromKS();
end;

--[[
	[ \brief ks连接函数 连接之后请求系统排名信心
	]]
function CTongTianTowerChartManager:OnKSConnect()
	self:RequestInitInfoFromKS();
end;		
	
--[[
	[ \brief 更新排名信息
	[\param table tChart 排名信息表
	]]	
function CTongTianTowerChartManager:Update(tChart)
	self.tChart = tChart;
	
	-- 发送给本条线路所有玩家
	local setNet = {};
	for i,oPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, oPlayer.objNet);
	end
	_groupcallout(setNet, "SyncTongTianTowerChartMsg", {Chart = self.tChart});
end	

--[[
	[ \brief 得到排名信息
	[\return table  排名信息表
	]]	
function CTongTianTowerChartManager:GetChart()
	return self.tChart;
end	