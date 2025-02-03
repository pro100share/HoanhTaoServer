--[[
说明：360红钻登陆服务数据解析器
作者：赵旭
]] 

local function func(objPlayer, tbInfoList, isNewRole)
    local setData = {
        setReward = {};
    };
    local setDBData1 = tbInfoList[1];
    for k, v in pairs(setDBData1) do
        table.insert(setData.setReward, v.dwItemIndex);
    end
    CTransitManager:RecvData(objPlayer:GetAccountID(), "C360RedJewelSystem", setData);
    return true;
end

CLoginCall:AddCall("C360RedJewelSystem", func);
