--[[
	怪物接口
	周长沙
	2012-4-16
--]]
_G.CMonsterFun = {}
-------------------------------------
local function Table_CPY(T)
	local obj = {}
	for k,v in pairs(T) do
		if type(v)=="table" then
			obj[k] = Table_CPY(v)
		else
			obj[k]=v
		end
	end
	return obj
end
local function set_born(b_info,t_info)
	local bMatch = false
	for i=1,#b_info do
		local t = Table_CPY(b_info[i])
		t.year = t.year or t_info.year
		t.month = t.month or t_info.month
		t.day = t.day or t_info.day
		t.hour = t.hour or t_info.hour
		t.min = t.min or t_info.min
		t.sec = t.sec or t_info.sec
		local b_time = _time(1, t)
		local n_time = _time(1, t_info)
		if b_time>n_time then
			bMatch = true
			return t
		end
	end
	local t = Table_CPY(b_info[1])
	t.year = t.year or t_info.year
	t.month = t.month or t_info.month
	t.day = (t.day or t_info.day) + 1
	t.hour = t.hour or t_info.hour
	t.min = t.min or t_info.min
	t.sec = t.sec or t_info.sec
	return t
end
-------------------------------------
local t_time = {}
-------------------------------------
--获取某个配置id怪物所在地图id
function CMonsterFun:GetMapIdByMonsterId(dwMonsterId)
	local cfgMap = MapInfoConfig
	for dwMapId,MapInfo in pairs(cfgMap) do
		if type(MapInfo)=="table" then
			if type(MapInfo.monster)=="table" then
				for k,v in pairs(MapInfo.monster) do
					if dwMonsterId == v.mon_id then
						return dwMapId;
					end
				end
			end
		end
	end
end
--获得某id的怪物的下次刷新时间
function CMonsterFun:GetNextBornTime(dwMonsterId,dwMapId)
	local cfg = MonsterBossBornInfo[dwMonsterId]
	if cfg then
		t_time.year,t_time.month,t_time.day,t_time.hour,t_time.min,t_time.sec = CTimeFormat:todate( math.modf(GetCurTime()/1000), true, quick)
		t_time = set_born(cfg,t_time)
		t_time.year = 2014
		return _time(1, t_time)*1000
	end
	local dwMapId = dwMapId or self:GetMapIdByMonsterId(dwMonsterId)
	local Map = CMapManager:GetMap(dwMapId )
	if not Map then return 0 end;
	local mgrMon = Map:GetMonsterMgr()
	local Mon = mgrMon:GetMonsterInfoById(dwMonsterId)
	if Mon then
		return Mon:GetNextBornTime()
	end
	return 0
end
--刷新配置的怪
function CMonsterFun:GMBornMonster()
	local cfg = _G.Field_Monster_BOSS
	for k,v in pairs(cfg) do
		local Map = CMapManager:GetMap(v.dwMapId)
		local mgrMon = Map:GetMonsterMgr()
		local dwId = v.dwMonsterId
		local dwLook = v.dwLook
		mgrMon:Add(dwId,dwId,dwId,dwId,dwLook,v.X,v.Y,bNoShow,dwObjId,objPlayer,dwGuildID)
	end
end

--获得当前线路所有怪物总数量
function CMonsterFun:GetLineMonsterCount()
	local dwCount = 0
	for k,Map in pairs(CMapManager.setAllMap) do
		local mgrMon = Map.objMonMgr
		dwCount = dwCount + mgrMon:GetAllMonsterNum()
	end
	return dwCount
end










