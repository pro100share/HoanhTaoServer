--[[
说明：360红钻系统数据库
作者：赵旭
]] 

-- 系统对象
_G.C360RedJewelSystemDB = {};

-- @brief 构造函数
-- @param object objDB 数据库对象
-- @param object objSys 所属系统对象
-- @return object 系统对象
function C360RedJewelSystemDB:new(objDB, objSys)
	local obj = {}
	obj.objDB = objDB;
	obj.objSys = objSys;
	for i, v in pairs(C360RedJewelSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

-- @brief 添加已领取奖励
-- @param number dwAccountID 帐号ID
-- @param number dwItemIndex 奖励项索引
function C360RedJewelSystemDB:InsertReward(dwAccountID, dwItemIndex)
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_360RedJewel');
	SqlCmd.Fields.dwItemIndex = dwItemIndex;
	SqlCmd.Wheres.dwAccountID = dwAccountID;
	SqlCmd:execute()
end
