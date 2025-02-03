_G.CAccountDBQuery = {}

local _DEBUG = true;

CAccountDBQuery.GetAccountIDByNameSql = 
'SELECT "dwAccountID" ' ..
'FROM "T_Account_Info" ' ..
'WHERE "szAccount" = ' .. "'%s'" ..';'

CAccountDBQuery.GetOnlinePlayerSql = 
'SELECT "dwRoleID" ' ..
'FROM "T_Role_Info" ' ..
'WHERE "dwAccountID" = ' .. "'%s'" .. ';'

local strSaveGoldToDBSql = 
'UPDATE "T_Account" ' ..
'SET "dwGlod" = "dwGlod" + ' .. "%d " ..
'WHERE "dwAccountID" = ' .. "%s;";

local strSaveGoldToDBError = 
'INSERT INTO "T_Gold_Error" '..
'("dwAccountID","dwGold","szSql","szTime")'..
"VALUES('%s',%d,'%s','%s')";

local strSumGold = 
[[
SELECT SUM("dwGlod")
FROM "T_Account"
]];

local strSumLiJin = 
[[
SELECT SUM("dwBindGold")
FROM "T_Role_ItemSystem"
]];

local strSumYinLiang = 
[[
SELECT SUM("dwPacketMoney" + "dwStorageMoney")
FROM "T_Role_ItemSystem"
]];

function CAccountDBQuery:Create()
	--连接数据库
	self.objDBQuery = CSql:Connect(CConfig.AccountDB.ConnParam);
    self.objRoleDB = CSql:Connect(CConfig.RoleDB.ConnParam);
	if not self.objDBQuery or not self.objRoleDB then
        return false
    else
        return true;
    end
end;

function CAccountDBQuery:Update(dwInterval)
end;

function CAccountDBQuery:Destroy()
	self.objDBQuery = nil;
end;

function CAccountDBQuery:GetDBQuery()
	return self.objDBQuery;
end;

-- 处理注册数据库
function CAccountDBQuery:RegisterUser(szAccount, szPwd)
	local dbRes = self.objDBQuery:execute('select * from "T_Account_Info" where "szAccount" = $1',string.lower(szAccount));
	if dbRes then
		return 2;
	end;
	
	local dbRes = self.objDBQuery:execute('INSERT into "T_Account_Info"("szAccount", "szPwd") VALUES($1, $2)',string.lower(szAccount), szPwd);
	if not dbRes then
		-- print('Register User error');
		return 1;
	end;
	
	return 0;
end;

_G.UserRegist = function(arg)
    return CAccountDBQuery:RegisterUser(arg[1], arg[2]);
end;
_userregist("UserRegist");

function CAccountDBQuery:LoginUser(szAccount,szPwd)
	szAccount = string.lower(szAccount);
	local dbres = self.objDBQuery:execute('SELECT "dwAccountID","dwAdultFlag" FROM "T_Account_Info" where "szAccount"=$1 and "szPwd"=$2',szAccount, szPwd);
	if not dbres then 
        -- print('OnLogin Ret Error',szAccount); 
		return {-1};
	end;
	local dwAccountID,dwAdultFlag;
	--读取数据	
	dwAccountID = dbres[1].dwAccountID;
	dwAdultFlag = dbres[1].dwAdultFlag or 0;
	--账号是不是错误的
	if (not dwAccountID) 
	or (dwAccountID > 1000000000)
	or (dwAccountID <= 0)then
        -- print('OnLogin Ret Error',szAccount); 
		return {-1};
	end;
    local sInfo ={}; 
    sInfo[1] = dwAccountID;
    sInfo[2] = os.utc(1)-_time(1,{year=1970,month=1,day=1,hour=0,min=0,sec=0});
    local szCheck =  tostring(dwAdultFlag)..tostring(dwAccountID)..tostring(sInfo[2]).."themgai1";
    sInfo[3]  = szCheck:md5();
    sInfo[4] = 0;
    sInfo[5] = 0;
    sInfo[6] = dwAdultFlag; 
    return {0, sInfo};
end;

_G.UserLogin = function(arg)
    return CAccountDBQuery:LoginUser(arg[1], arg[2]);
end;
_userlogin("UserLogin");

-- @brief 获取账号id通过账号名
-- @param szAccount string 账号名
-- @return number 账号id
function CAccountDBQuery:GetAccountIDByName(szAccount)
    if not szAccount then
        return nil;
    end

    local sql = string.format(CAccountDBQuery.GetAccountIDByNameSql,
        szAccount);
    if _DEBUG then
        -- print("GetAccountIDByNameSql " .. sql);
    end
    local data = self.objDBQuery:execute(sql);
    if data then
        return data[1].dwAccountID;
    else
        return nil;
    end
end

-- @brief 获取在线角色通过账号id
-- @param dwAccountID number 账号id
-- @return table 在线用户
function CAccountDBQuery:GetOnlinePlayer(dwAccountID)
    if not dwAccountID then
        return nil;
    end

    local sql = string.format(CAccountDBQuery.GetOnlinePlayerSql,
        tostring(dwAccountID));
    if _DEBUG then
        -- print("GetOnlinePlayerSql " .. sql);
    end
    local data = self.objRoleDB:execute(sql);
    if data then
        for k, v in pairs(data) do
            if _DEBUG then
                -- print(v.dwRoleID);
            end
            local player = CPlayerManager:GetPlayerByRoleID(v.dwRoleID);
            if player then
                return player;
            end
        end
    end
end

--通过账号，获取玩家的元宝信息
function CAccountDBQuery:GetGoldByAccountID(dwAccountID)
    if not dwAccountID then
        return nil;
    end

	local Data = self.objDBQuery:execute('select "dwGlod","bISGM" from "T_Account" where "dwAccountID" = $1',dwAccountID);
	if not Data then
		self:AddAccount(dwAccountID,"szUserName",0,0,_now());--如果数据库T_Account中没有玩家元宝记录，那么需要创建一个记录，因为往后的Update都会无效
		return 0,0
	end; 
	return Data[1].dwGlod,Data[1].bISGM;
end;

function CAccountDBQuery:AddAccount(dwAccountID,szUserName,dwGlod,dwMoney,dwTime)
	local db = self.objDBQuery; 
	if not db then
		return false;
	end;
	local SqlCmd = db:CreateInsertCmd('T_Account');

	SqlCmd.Fields.dwAccountID       = dwAccountID;
	SqlCmd.Fields.szUserName		= szUserName;		--玩家名字
	SqlCmd.Fields.dwGlod		    = dwGlod;		--玩家性别
	SqlCmd.Fields.dwMoney			= dwMoney;		--玩家脸型
	SqlCmd.Fields.tmRegTime			= dwTime;		--玩家发型
	SqlCmd.Fields.tmLostTime		= dwTime;		--玩家发型
	
	if not SqlCmd:execute() then
		_info("Insert T_Account To DB Error");
		return false;
	end;
	return true;
end;

function CAccountDBQuery:SaveGoldToDB(dwAccountID,dwGold)
	local sql = string.format(strSaveGoldToDBSql, dwGold, tostring(dwAccountID));
	local res = self.objDBQuery:execute(sql);
	if res and (tonumber(res) > 0) then
		return true;
	else
		_info("Save Gold Error!!!",dwAccountID,dwGold,sql)
		local year,month,day,hour,min,sec = CTimeFormat:todate( math.modf(_now()/1000), true)
		local time = string.format("%d-%d-%d %d:%d:%d",year,month,day,hour,min,sec)
		local sql = string.format(strSaveGoldToDBError, tostring(dwAccountID), dwGold, sql, time);
		self.objDBQuery:execute(sql);
		return false;
	end
end;

function CAccountDBQuery:SumGold()
	local setData = self:Exec(strSumGold);
    if setData ~= nil and setData[1] ~= nil and setData[1].sum ~= nil then
        return setData[1].sum;
    else
        return 0;
    end
end

function CAccountDBQuery:SumLiJin()
	local setData = self:RoleDBExec(strSumLiJin);
    if setData ~= nil and setData[1] ~= nil and setData[1].sum ~= nil then
        return setData[1].sum;
    else
        return 0;
    end
end

function CAccountDBQuery:SumYinLiang()
	local setData = self:RoleDBExec(strSumYinLiang);
    if setData ~= nil and setData[1] ~= nil and setData[1].sum ~= nil then
        return setData[1].sum;
    else
        return 0;
    end
end

function CAccountDBQuery:Exec(szSql)
	return self.objDBQuery:execute(szSql);
end

function CAccountDBQuery:RoleDBExec(szSql)
	return self.objRoleDB:execute(szSql);
end
