--[[
   [ \brief 排行榜奖励脚本
   [ \author 路广华、赵旭
   [ \date 2014-05-04
   [ 用于该系统客户端及服务器细节逻辑处理
   ]]

--[[
   [ \brief 测试value是否在表tab中
   [ \param table tTab 搜索的表
   [ \param table nValue 测试的值
   [ \return true 表示值在表中，false 表示值不在表中 
   ]]
function ChartAwardConfig:TableFind(tTab, nValue)
	for k,v in pairs(tTab) do
		if k == nValue then
			return true;
		end
	end
	return false;
end

--[[
   [ \brief 是否有奖励功能
   [ \param number nID 榜单编号
   [ \return boolean 是否
   ]]
function ChartAwardConfig:IsHaveAward(nID)
    if self.HaveAward[nID] then
        return true;
    else
        return false;
    end
end

--[[
   [ \brief 获得玩家排名等级
   [ \param number nRank 玩家的排名
   [ \return number 奖品的等级
   ]]
function ChartAwardConfig:GetPrizeLevel(nRank)
    if nRank <= 0 or nRank > self.Level[#self.Level] then
        return 0;
    end
	for k,v in ipairs(self.Level) do
		if nRank <= v then
			return k;
		end
	end
end

--[[
   [ \brief 获取奖励项
   [ \param number nID 奖励编号
   [ \param number nRank 名次
   [ \return table 奖励项
   ]]
function ChartAwardConfig:GetAwardItem(nID, nRank)
    return self.Prize[nID][self:GetPrizeLevel(nRank)] or {};
end

--[[
   [ \brief 是否能领取奖励
   [ \param object oSystem 系统对象
   [ \return number 错误码(零表示能够领取，非零表示不能且是原因编号)
   ]]
function ChartAwardConfig:CanGet(oSystem, nID)
    if self.HaveAward[nID] == nil then
        return self.ErrorCode[2];
    end
	if oSystem:GetReceiveds()[nID] then
        return self.ErrorCode[4];
    end
    if self:GetPrizeLevel(oSystem:GetRank(nID)) == 0 then
        return self.ErrorCode[3];
    end
    return 0;
end
