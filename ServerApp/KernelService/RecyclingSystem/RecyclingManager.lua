--[[
    [ \brief 功能：全局资源收回管理器
    [ \author 李中昌
    [ \date 2014-8-5
    ]]

--定义配置文件
local tConfig = _G.RecyclingConfig;    

-- 管理器对象    
_G.CRecyclingManager = CSingle:new();
CSingleManager:AddSingle(CRecyclingManager);

--[[
    [ \brief 创建管理器对象
    [ 初始化定时器
    ]]
function CRecyclingManager:Create()	
	CAlarmClock:AddTask(
        {dwTime = _G.RecyclingConfig.RefreshTime},
        CAlarmTaskCycleType.eDay,
		1,
        0,
        function() self:UpdateCount() end,
        {}
	)
	return true;
end;

--[[
    [ \brief 统计玩家昨日数据 写入数据库
    ]]
function CRecyclingManager:UpdateCount()
    local tAllCount = {};
    local tSqlResult = CPlayerDBQuery:GetDBQuery():execute(
        [[SELECT * FROM "T_Role_Recycling"]]);
    if not tSqlResult then return; end
    for _, v in pairs(tSqlResult) do 
        tAllCount[v.nRoleId] = {};
    end
    
    for k, v in pairs(tConfig.Resources) do
        v.KSUpdate(v, tAllCount);
    end    
    
    for nRoleID, tCount in pairs(tAllCount) do
        for nID, nCount in pairs(tCount) do
            if nCount <= 0 then
               tCount[nID] = nil ;
            end
        end
        CPlayerDBQuery:GetDBQuery():execute(
            [[UPDATE "T_Role_Recycling" SET "tCount" =
                $1 WHERE "nRoleId" = $2;]],
            tConfig.FormatString(tCount),
            nRoleID
        );
    end
		
	for i, oLine in pairs(CGameLineManager:GetAllLine()) do
		oLine.GSRemoteCallMsg{
            System = "CRecyclingSystem",
			Func = "UpdateCount"};
	end;	  
end;
