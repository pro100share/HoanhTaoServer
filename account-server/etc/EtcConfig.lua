_G.ChargeConfig = 
{
	-- 是否开启Key验证
	IsSecurity = false;

	-- 缓存库
	DB = {
		-- 数据库连接
		db_ip = "127.0.0.1:5432";
		-- 数据库名
		db_name = "gc"; 
		-- 用户名
		db_user = "postgres";
		-- 密码
		db_passwd = "";
		-- ID
		id = 10000;
	};

    -- 密钥
	Key = "hstx";

    -- 金额数据转换游戏数据
    TransitionsG = {
        -- @brief 人民币充值
        -- @funcname 1
        -- @param tData table 数据表
        -- @return number 游戏数据
        [1] = function (tData)
			local dwGold = tonumber(tData["quantity"]) * 10 + 0.5;
			return math.floor(dwGold);
        end;
    };

    -- 同步失败订单周期(秒)
    SyncPeriod = 30 * 60;
};

_G.ShareConfig = 
{
	-- 共享库
	ShareDB = {
		-- 数据库连接
		db_ip = "127.0.0.1:5432";
		-- 数据库名
		db_name = "gs"; 
		-- 用户名
		db_user = "postgres";
		-- 密码
		db_passwd = "";
		-- ID
		id = 10001;
	};
};