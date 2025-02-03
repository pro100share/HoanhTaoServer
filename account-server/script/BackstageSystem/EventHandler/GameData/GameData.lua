local base = _G;

local load_sql;
local game_data;
local exec;

local ParseMountEquip;
local ParseMatrixMethodLevel;

local type_name = {
    [1] = "Base";
    [2] = "Prop";
    [3] = "Mount";
    [4] = "Sword";
    [5] = "Amulet";
    [6] = "Bourn";
    [7] = "Pulse";
    [8] = "Skill";
    [9] = "MatrixMethod";
};

local sql_script_dir = BackstageSystem.strEventHandlerDir .. "GameData/SqlScript/";
local query_cmd = {
    Base = {
        sql_script = "Base.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end

            local ret = data[1];
			ret.dwAccountID = base.GetOriginAccountID(ret.dwAccountID);
			
			ret.dwLevel = base.RoleUpLevelConfig:ExpToLevel(tonumber(ret.dwTotalExp)) or 1;
			
			ret.dwUpExp = base.RoleUpLevelConfig[ret.dwLevel].dwExp;
			ret.dwExp = tonumber(ret.dwTotalExp) - tonumber(ret.dwUpExp);
			
			ret.dwUpExp = base.RoleUpLevelConfig[ret.dwLevel + 1].dwExp or 1;
			
			ret.create = CTimeFormat:
				mtodate(tonumber(ret.create) or _now(),
					nil,
					true);
			
			ret.login = CTimeFormat:
				mtodate(tonumber(ret.tmUplineTime) or _now(),
					nil,
					true);
			ret.tmUplineTime = nil;
			
            if ret.HusbandName == ret.szName then
                ret.szLover = ret.WifeName;
            elseif ret.WifeName == ret.szName then
                ret.szLover = ret.HusbandName;
            end
            ret.HusbandName = nil;
            ret.WifeName = nil;
            
            if tonumber(ret.dwVipTime) == 0 then
                ret.bIsVip = 0;
            else
                ret.bIsVip = 1;
            end

            if tonumber(ret.dwBanTime) == 0 then
                ret.bChatBan = 0;
            else
                ret.bChatBan = 1;
            end
            ret.dwBanTime = nil;
			
			if ret.online and ret.online == 't' then
				ret.online = 1;
			else
				ret.online = 0;
			end

            return ret;
        end
    },
    Prop = {
        sql_script = "Prop.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end

            return data[1];
        end
    },
    Mount = {
        sql_script = "Mount.sql",
        sql = "",
        format = function (data)
            if not data or not data[1] then
                return;
            end

            for k, v in pairs(data) do
                v.s_Name = ConfigSystem:GetMountName(tonumber(v.n_EnumID));
                v.t_Equip = {};
                ParseMountEquip(v.s_Equip, v.t_Equip);
                v.s_Equip = nil;
            end

            return data;
        end
    },
    Sword  = {
        sql_script = "Sword.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end

            data[1].szName = ConfigSystem:GetSwordName(
                tonumber(data[1].dwSwordLadder));

            return data[1];
        end
    },
    Amulet  = {
        sql_script = "Amulet.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end

            data[1].szName = ConfigSystem:GetAmuletName(
                tonumber(data[1].dwAmuletLevel));

            return data[1];
        end
    },
    Bourn  = {
        sql_script = "Bourn.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end

            return data[1];
        end
    },
    Pulse = {
        sql_script = "Pulse.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end

            local ret = {};
            for k, v in pairs(data[1]) do
                table.insert(ret, v);
            end
            return ret;
        end
    },
    Skill = {
        sql_script = "Skill.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end

            return data;
        end
    },
    MatrixMethod = {
        sql_script = "MatrixMethod.sql",
        sql = nil,
        format = function (data)
            if not data or not data[1] then
                return;
            end
            return {
                [1] = ParseMatrixMethodLevel(data[1].dwOrdinaryStarTotalExp);
                [2] = data[1].dwSuitStarLevel;
                [3] = data[1].dwHideStarLevel;
                [4] = data[1].dwUsedFreeNum;
            };
        end
    }
};

-- @brief 加载sql脚本
load_sql = function ()
    for k, v in pairs(query_cmd) do
        v.sql = base.db.LoadSql(sql_script_dir .. v.sql_script);
    end
end

-- @brief 查询玩家的物品
-- @param tCmd table 命令表
-- @retrun json 查询结果
game_data = function (tCmd)
	base.GetRoleID:Attempt(tCmd);
	if not next(tCmd.role_id) then
		return {};
    else
        tCmd.role_id = tCmd.role_id[1];
	end
	
	local cmd_type = tonumber(tCmd.type);
    local ret = {};
    if cmd_type == 0 then
        for idx, name in pairs(type_name) do
            ret[name] = exec(name,
                tCmd.role_id,
                tCmd.server_id,
                tCmd.page,
                tCmd.page_size);
        end
    else
        local name = type_name[cmd_type];
        ret[name] = exec(name,
            tCmd.role_id,
            tCmd.server_id,
            tCmd.page,
            tCmd.page_size);
    end
    return ret;
end

-- @brief 执行命令查询
-- @param name string 命令名
-- @param role_id number 角色id
-- @param server_id nubmer 服务器id
-- @param page number 当前页
-- @param page_size number 页大小
-- @return table 查询结果
exec = function (name, role_id, server_id, page, page_size)
    local cmd = query_cmd[name];
    return cmd.format(
        base.db.Exec(
            server_id, 2, base.AddPaging(
                page, page_size, string.format(
                    cmd.sql, tostring(role_id)
                )
            )
        )
    );
end

ParseMountEquip = function (str, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local m = string.find(str1, ",", 1);
		local str2 = string.sub(str1, 1, m - 1);
		local str3 = string.sub(str1, m + 1);
		local key = tonumber(str2);
		local value = tonumber(str3);
		if key < 9 then
			t[key] = value;
		end;
	end;
end

ParseMatrixMethodLevel = function (str)
	if(str == nil) then
		return false;
	end
	local b = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		b[index] = value;
		index = index + 1;
	end;
	return b;
end

load_sql();
BackstageSystem:RegistEvent("game_data", game_data);
