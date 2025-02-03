--[[
	¹²ÏíÊý¾Ý¿â
--]]
local base = _G;
_G.ShareDB = ShareConfig.ShareDB;

local Init;
local Connect;
local Close;
local Exec;

Init = function()
    base.db.Connect(base.ShareDB.id,
        base.ShareDB.db_ip,
        base.ShareDB.db_name,
        base.ShareDB.db_user,
        base.ShareDB.db_passwd,
        1);
			
    base.ShareDB.Connect = Connect;
    base.ShareDB.Close = Close;
    base.ShareDB.Exec = Exec;
end

Connect = function(self,...)
    Init();
    return ShareDB;
end

Close = function(self,...)
    base.db.Close(ShareDB.id);
end

Exec = function(self,...)
	local szCmd = string.format(...)
    return base.db.Exec(ShareDB.id, 1, szCmd);
end

base.GetShareDB = function()
	return base.ShareDB;
end

Init()
