--[[
   [ \brief 排行榜奖励管理器接口
   [ \author 赵旭
   [ \date 2014-05-05
   [ 该文件内容提供其他系统使用
   ]]

--[[
   [ \brief 离线领取奖励
   [ \param number nChartID 排行榜编号
   [ \param table tChartList 排行榜数据
   ]]
function CChartAwardManager:ChartAwardOfflineGet(nChartID, tChartList)
    self:ChartAwardOfflineGetImpl(nChartID, tChartList);
end
