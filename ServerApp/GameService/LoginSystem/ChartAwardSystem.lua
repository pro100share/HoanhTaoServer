--[[
   [ \brief 排行榜奖励
   [ \author 赵旭
   [ \date 2014-05-05
   ]]

local function func(objPlayer, tbInfoList, isNewRole)
    local tData = {
        tReceived = {};
    };
    for k, v in pairs(tbInfoList[1]) do
        tData.tReceived[v.ID] = v.ID;
    end
    CTransitManager:RecvData(
        objPlayer:GetAccountID(), "CChartAwardSystem", tData
    );
    return true;
end

CLoginCall:AddCall("CChartAwardSystem", func);
