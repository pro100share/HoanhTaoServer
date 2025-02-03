--[[
   [ \brief 排行榜奖励接口
   [ \author 赵旭
   [ \date 2014-05-05
   [ 该文件内容提供其他系统使用
   ]]

--[[
   [ \brief 发送已领取奖励列表
   ]]
function CChartAwardSystem:SendReceivedsMsg()
  self:SendReceivedsMsgImpl();
end

--[[
   [ \brief 删除玩家接收的奖励记录
   [ \param number nID 奖励编号
   ]]
function CChartAwardSystem:DeleteReceived(nID)
    self:DeleteReceivedImpl(nID);
end

--[[
   [ \brief 获取玩家排行榜名次
   [ \param number nID 榜单编号
   [ \return number 名次(*零表示未上榜*)
   ]]
function CChartAwardSystem:GetRank(nID)
    return CChartManager:GetChartNumber(
        nID, "dwRoleID", self:GetPlayer():GetRoleID()
    ) or 0;
end

--[[
   [ \brief 获取已领取奖励
   [ \return table {奖励编号 = 奖励编号}
   ]]
function CChartAwardSystem:GetReceiveds()
    return self.tReceived;
end

