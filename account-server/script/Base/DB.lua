local base = _G;

local strConnInfoFormat = "hostaddr=%s port=%s dbname=%s user=%s password=%s connect_timeout=%s";
local strConnTimeout = "5";
local dbsrcs = {};

local LoadSql;
local Connect;
local GetIdx;
local Close;
local IsExist;
local Exec;

-- @brief 加载sql脚本
-- @param filename string 脚本文件路径
-- @return string sql字符串
LoadSql = function (filename)
	if not filename then
		return;
	end

	base.Log:Info("---LoadSql Start---");
	
	dofile(filename);
	base.Log:Info(base.strSql);
	
	base.Log:Info("---LoadSql End---");
    return base.strSql;
end

-- @brief 连接数据库
-- @param server_id number 服务器id
-- @param db_ip string 数据库ip
-- @param db_user string 数据库用户名
-- @param db_passwd string 数据库密码
-- @param dbidx number 指定数据库(1-Account,2-Role)
Connect = function (server_id, db_ip, db_name, db_user, db_passwd, dbidx)
    if not server_id or
        not db_ip or
        not db_name or
        not db_user or
        not db_passwd or
        not dbidx then
        return;
    end

	base.Log:Info("---Connect Start---");
	
	_, _, IP, Port = string.find(db_ip, "(%d*.%d*.%d*.%d*):(%d*)");
	local strConnInfo = string.format(strConnInfoFormat, IP, Port, db_name, db_user, db_passwd, strConnTimeout);
	local dwIdx = GetIdx(server_id, dbidx);
	base.Log:Info(dwIdx, strConnInfo);
	_ConnectDB(dwIdx, strConnInfo);
	
	base.Log:Info("---Connect End---");
end

GetIdx = function (dwServerID, dwType)
	return tonumber(dwServerID) * 10 + tonumber(dwType);
end

-- @brief 关闭连接
-- @param server_id number 服务器id
Close = function (server_id)
    if not server_id then
        return;
    end

	_CloseDB(GetIdx(server_id, 1));
	_CloseDB(GetIdx(server_id, 2));
end

-- @brief 数据库是否存在
-- @param server_id string 目标服务器
-- @return boolean 是否存在
IsExist = function (server_id)
    if not server_id then
        return;
    end

	return _IsExistDB(GetIdx(server_id, 1));
end

-- @brief 执行sql语句
-- @param server_id string 服务器id
-- @param dbidx number 指定数据库(1-Account, 2-Role)
-- @param sql string sql语句
-- @return table 结果
Exec = function (server_id, dbidx, ...)
    if not server_id or not dbidx then
        return;
    end

	base.Log:Info("---Exec Start---");
	base.Log:Info(server_id, dbidx);
	
	local sqls = "";
	local arg = {...};
	if #arg == 1 then
		sqls = sqls .. arg[1];
	else
        for k, v in pairs(arg) do
            sqls = sqls .. v .. ';';
        end
	end
	
	base.Log:Info(sqls);
	base.Log:Info("---Exec End---");
	return _ExecSQL(GetIdx(server_id, dbidx), sqls);
end

_G.db = {};
db.LoadSql = LoadSql;
db.Connect = Connect;
db.Close = Close;
db.IsExist = IsExist;
db.Exec = Exec;
