--[[
	[ \brief 通天塔系统接口
	[ \author 李中昌
	[ \date 2014-5-26
	[ 处理通天塔系统接口 
	]]

-- 通天塔配置文件	
local tSysCfg = _G.TongTianTowerConfig;
	
--[[
	[ \brief 挑战函数
	[ 执行挑战逻辑
	]]
function CTongTianTowerSystem:Challenge(bIsDead)  
	if not self:ChallengeCheck(bIsDead) then
		return;
	end
	
	local oPlayer = self:GetPlayer();
	--进入副本
	local oDuplSystem = oPlayer:GetSystem("CDuplSystem")
	oDuplSystem:ReqEnterDupl(tSysCfg.nDupl, 1, 1);
end

--[[
	[ \brief 通天塔胜利函数
	[ 设置通天塔进度和通关总时间
	[\param number nTime 通关时间                           
	]]
function CTongTianTowerSystem:Win(nTime)
	-- 如果时间超过了通关最大时间 
	if nTime > tSysCfg.tower[self.tInfo.nCurLayer].TimeLimit *
		1000  then return end

	self.tInfo.nCurLayer = self.tInfo.nCurLayer + 1;
	self.tInfo.nAllTime = self.tInfo.nAllTime + nTime;
	
	local oPlayer = self:GetPlayer();
	-- 和排行榜进行比较
	self:ChartCheck();
	oPlayer.SyncTongTianTowerAllMsg{Info = self.tInfo};
	
	-- 广播检测
	for k, v in pairs(tSysCfg.BroadcastLayer) do
		if v == self.tInfo.nCurLayer - 1 then
			CGameApp.TongTianTowerBoardcastMsg{Type =
				tSysCfg.BroadcastEnum.Pass, RoleID =
					oPlayer:GetRoleID(), RoleName = oPlayer:GetName(),
						Layer = self.tInfo.nCurLayer};
			break;
		end
	end
	
	-- 更新数据库
	self.oDBQuery:UpdateInfo(self.tInfo);
end

--[[
	[ \brief 通天塔金币重置
	[玩家手动重置 需要消耗金币
	]]
function CTongTianTowerSystem:GoldReset()
	-- 如果超过了最大重置次数
	if self.tInfo.nExtraCount >= tSysCfg.nResetCount then return end
	
	-- 扣除消耗
	local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
	if not oItemSystem:IsGoldEnough(tSysCfg.nResetGold) then
		return
	end
	oItemSystem:CostGold(tSysCfg.nResetGold,
		_G.ItemSysOperType.TongTianTower);
		
	-- 重置
	self:Reset(true);
end

--[[
	[ \brief 通天塔金币重置
	[玩家手动重置 需要消耗金币
	]]
function CTongTianTowerSystem:OnTimeout()
	-- 清除地图上所有的怪物
	local oMap = self:GetPlayer():GetSystem("CMapSystem"):GetCurMap();
	if oMap.tbFun.RemoveMon then
		oMap.tbFun:RemoveMon(oMap);
	else
		_err("CTongTianTowerSystem:OnTimeout cant find RemoveMon");
	end
end	
	
--[[
	[ \brief 得到通天塔的进度（当前打到第几层）
	[\return number 当前进度
	]]
function CTongTianTowerSystem:GetCurLayer()
	return self.tInfo.nCurLayer;
end
