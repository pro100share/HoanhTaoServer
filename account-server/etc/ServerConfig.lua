_unpack("../script.pak")

_G.AccountServer = 
{
    -- GS监听地址
	GSIPAddr = "127.0.0.1:2223";
    -- GS最大连接数
    GSMaxConnectNum = 5;
    -- Http监听地址
	HttpIPAddr = "127.0.0.1:2224";
    -- Http最大连接数
    HttpMaxConnectNum = 5;
	-- 充值监听地址
    ChargeIPAddr = "127.0.0.1:2225";
    -- 充值最大连接数
    ChargeMaxConnectNum = 5;

	-- Lua栈数量
	LuaStateNumber = 1;
	-- 线程数
	ThreadNumber = 1;
	-- 数据库连接数
	DBNumber = 1;
};

return AccountServer;