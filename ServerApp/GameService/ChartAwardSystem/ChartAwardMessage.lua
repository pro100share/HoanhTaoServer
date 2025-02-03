--[[
   [ \brief 排行榜奖励消息
   [ \author 赵旭
   [ \date 2014-05-05
   ]]

-- 请求领取奖励
define.ChartAwardGetMsg
{
    -- 角色对象
    user = NONE;
    -- 奖励编号
    ID = 0;
}
when{ user = NONE }
ChartAwardGetMsg = checkUser;
when{}
function ChartAwardGetMsg(user, ID)
    if ID <= 0 then
        _err("[ChartAward] message parameter fault.");
        return;
    end
    user:GetSystem("CChartAwardSystem"):ChartAwardGet(ID);
end

