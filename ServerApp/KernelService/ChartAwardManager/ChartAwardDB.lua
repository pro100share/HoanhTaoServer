--[[
   [ \brief 排行榜奖励数据库操作
   [ \author 赵旭
   [ \date 2014-05-05
   ]]

-- 系统对象
_G.CChartAwardDB = {};

--[[
   [ \brief 系统创建
   [ \param object oDB 数据库对象
   [ \return object 系统对象
   ]]
function CChartAwardDB:Create(oDB)
	self.oDB = oDB;
	return self;
end

--[[
   [ \brief 查询已经领取该奖励的角色编号
   [ \param number nID 奖励编号
   [ \return table 角色编号列表
   ]]
function CChartAwardDB:QueryReceiveds(nID)
    local sSql = 'SELECT * FROM "T_Role_Chart_Award" WHERE "ID" = $1;';
    local tResult = {};
    for k, v in pairs(self.oDB:execute_sync(sSql, nID) or {}) do
        tResult[v.RoleID] = v.ID;
    end
    return tResult;
end

--[[
   [ \brief 删除已经领取该奖励的记录
   [ \param number nID 奖励编号
   ]]
function CChartAwardDB:DeleteReceiveds(nID)
    local sSql = 'DELETE FROM "T_Role_Chart_Award" WHERE "ID" = $1;';
    self.oDB:execute_async(sSql, nID);
end

