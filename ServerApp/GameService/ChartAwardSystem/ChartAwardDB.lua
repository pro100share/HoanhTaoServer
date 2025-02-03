--[[
   [ \brief 排行榜奖励数据库操作
   [ \author 赵旭
   [ \date 2014-05-05
   ]]

-- 系统对象
_G.CChartAwardDB = {};

-- 表名称
CChartAwardDB.sTableName = "T_Role_Chart_Award";

--[[
   [ \brief 构造函数
   [ \param object oDB 数据库对象
   [ \return object 系统对象
   ]]
function CChartAwardDB:new(oDB)
	local obj = {}
	obj.oDB = oDB;
	for i, v in pairs(CChartAwardDB) do
        if type(v) == "function" then
            obj[i] = v;
        end
	end
	return obj;
end

--[[
   [ \brief 创建函数
   ]]
function CChartAwardDB:Create()
end

--[[
   [ \brief 插入已接受奖励
   [ \param number nRoleID 角色编号
   [ \param number nID 排行榜编号
   ]]
function CChartAwardDB:InsertReceived(nRoleID, nID)
	local SqlCmd = self.oDB:CreateInsertCmd(CChartAwardDB.sTableName);
	SqlCmd.Fields.ID = nID;
	SqlCmd.Wheres.RoleID = nRoleID;
	SqlCmd:execute()
end

