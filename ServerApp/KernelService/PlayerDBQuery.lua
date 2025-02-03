_G.CPlayerDBQuery = {}

function CPlayerDBQuery:Create()
	self.objDBQuery = CSql:Connect(CConfig.RoleDB.ConnParam);
	if not self.objDBQuery then return false end;
	return true;
end;

function CPlayerDBQuery:Destroy()
   self.objDBQuery = nil;
end;

function CPlayerDBQuery:GetDBQuery()
   return self.objDBQuery;
end; 

--获取当前最大的角色id
function CPlayerDBQuery:GetMaxRoleID(dwHostCount,dwMaxCount)
	local szSql = 'select max("dwRoleID") from "T_Role_Info" where "dwRoleID" > $1 and "dwRoleID" < $2'
	local resInfo = self.objDBQuery:execute(szSql,dwHostCount,dwHostCount+dwMaxCount)
	if not resInfo then
		return 1;
	end;
	return resInfo[1].max;
end;

--[[
   [ \brief 获取登出标志位值
   [ \param number nAccountID 账号编号
   [ \return boolean 真假
   ]]
function CPlayerDBQuery:GetLogoutSign(nAccountID)
    local sSQL = [[
        SELECT "bOnline" FROM "T_Role_Info" WHERE "dwAccountID"= $1
    ]];
    local tRecord = self.objDBQuery:execute_sync(sSQL, nAccountID);
    if not tRecord or not tRecord[1] or not tRecord[1].bOnline then
        -- 新号或者不不在线
        return true;
    else
        return false;
    end
end

--[[
   [ \brief 设置登出标志位值
   [ \param number nAccountID 账号编号
   [ \param boolean nValue 真假
   ]]
function CPlayerDBQuery:SetLogoutSign(nAccountID, nValue)
    -- 新号可能执行SQL异常，因为数据库中还没有该账号信息。
    local sSQL = [[
        UPDATE "T_Role_Info" SET "bOnline" = $2 WHERE "dwAccountID" = $1
    ]];
    self.objDBQuery:execute_async(sSQL, nAccountID, not nValue);
end
