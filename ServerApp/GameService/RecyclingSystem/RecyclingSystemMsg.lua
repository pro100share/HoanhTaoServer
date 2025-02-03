--[[
    [ \brief 资源回收系统消息文件
    [ \author 李中昌
    [ \date 2014-8-7
    ]]

-- 请求追回资源
define.RecyclingRequestGetResourcesMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
    -- 活动ID  -1 代表全部追回
    ID              = 0,
    -- 使用的货币类型  1:银两, 2:礼金, 3:元宝
    MoneyType       = 0,
}
when {user = NONE}
RecyclingRequestGetResourcesMsg = checkUser;
when{}
function RecyclingRequestGetResourcesMsg(user, ID, MoneyType)
    print("RecyclingRequestGetResourcesMsg==", ID, MoneyType)
	user:GetSystem("CRecyclingSystem"):Recycling(ID, MoneyType);
end
