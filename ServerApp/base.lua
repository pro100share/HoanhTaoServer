--require'clidebug'
debug.dumpdepth = 5

--_G._info = print
--print = function( ) end

_G._info = print

--公共的方法---------------------------------------------------------------------------------
--字符串的分割方法
string.split = function(str, pattern)
  pattern = pattern or "[^%s]+"
  if pattern:len() == 0 then pattern = "[^%s]+" end
  local parts = {__index = table.insert}
  setmetatable(parts, parts)
  str:gsub(pattern, parts)
  setmetatable(parts, nil)
  parts.__index = nil
  return parts
end
--给事件注入player参数
function _G.validateLogin( _args )
	local net = _from
	local player = players[net]
	if not player then
		error('please login')
	end
	_args.player = player
end

--生成模版的工具方法-------------------------------------------------------------------------

function NOOP(_args) end
function NOOPTRUE(_args) return true end
-- return f(_args.arg1, _args.arg2 ...)
function WRAP(f)
	local s, _s = { debug.getargs(f) }
	if #s == 0 then return f end
	if s[#s] == '_args' then
		if #s == 1 then return f
		else _s = true s[#s] = nil end
	end
	return function (_args) return f(table.unpack(_args, s, _s and _args)) end
end
-- return (s(_args)[a])
function DOT(s, a)
	if not a then return function (_args) return _args[a] end end -- s ignored
	local s = WRAP(s)
	return function (_args) return (s(_args)[a]) end
end
-- a(_args) b(_args) ... return (last(_args))
function DO(a, ...)
	if not a then return NOOP end
	local s = ...
	if not s then return WRAP(a) end
	s = { a, ... }
	for i = 1,#s do s[i] = WRAP(s[i]) end
	return function (_args)
		for i = 1,#s-1 do s[i](_args) end
		return s[#s](_args)
	end
end
-- local ok = a(_args) and b(_args) and c(_args)
-- local ok = AND(a, b, c)(_args)
-- return a(_args) and b(_args) ... and last(_args)
function AND(a, b, ...)
	if not a then return NOOPTRUE end
	if not b then return WRAP(a) end
	local s = ...
	if not s then
		a = WRAP(a) b = WRAP(b)
		return function (_args)
			local p, q = a(_args)
			if p then p, q = b(_args) end
			return p, q
		end
	end
	s = { a, b, ... }
	for i = 1,#s do s[i] = WRAP(s[i]) end
	return function (_args)
		local p, q
		for i = 1,#s do p, q = s[i](_args) if not p then return p, q end end
		return p, q
	end
end

function OR(a, b, ...)
	if not a then return NOOP end
	if not b then return WRAP(a) end
	local s = ...
	if not s then
		a = WRAP(a) b =  WRAP(b)
		return function (_args)
			local p, q = a(_args)
			if not p then p, q = b(_args) end
			return p, q
		end
	end
	s = { a, b, ... }
	for i = 1,#s do s[i] = WRAP(s[i]) end
	return function (_args)
		local p, q
		for i = 1,#s do p, q = s[i](_args) if p then return p, q end end
		return p, q
	end
end
function NOT(x)
	x = WRAP(x)
	return function (_args) return not x(_args) end
end
function IF(x, yes, no)
	x = WRAP(x)
	if yes and no then
		yes = WRAP(yes) no = WRAP(no)	
		return function (_args) if x(_args) then return yes(_args) else return no(_args) end end
	elseif yes then
		yes = WRAP(yes)
		return function (_args) if x(_args) then return yes(_args) end end
	elseif no then
		no = WRAP(yes)
		return function (_args) if x(_args) then else return no(_args) end end
	else error('need then or else') end
end
function TRY(x, hint, ...)
	local s = ...
	if not s then
		x = WRAP(x)
		return function (_args)
			local p = x(_args)
			if p then return true else return p, hint end
		end
	end
	s = { x, hint, ... }
	for i = 1,#s,2 do s[i] = WRAP(s[i]) end
	return function (_args)
		for i = 1,#s,2 do
			local p = s[i](_args)
			if not p then return p, s[i+1] end
		end
		return true
	end
end
function RANGE(x, a, min, max)
	x = WRAP(x)
	if type(a)=='number' then -- a ignored
		if not min then min = 1/0 end -- max
		return function (_args) local v = int(x(_args)) return v >= a and v <= min end
	end
	if not min then min = -1/0 end
	if not max then max = 1/0 end
	return function (_args) local v = int(x(_args)[a]) return v >= min and v <= max end
end
function TRUE(x, a)
	x = WRAP(x)
	if a then return function (_args) return not not x(_args)[a] end end
	return function (_args) return not not x(_args) end -- a ignored
end
function FALSE(x, a)
	x = WRAP(x)
	if a then return function (_args) return not x(_args)[a] end end
	return function (_args) return not x(_args) end -- a ignored
end

function CONTEXT(s)
	if CONTEXTS[s] then return s end
	if not s then return EMPTY end
	local vks = {}
	for k,v in next,s do
		if not CONTEXTS[v] then error(tostring(v)..' not context') end
		vks[v] = k s[k] = nil
	end
	table.copy(s, vks)
	CONTEXTS[s] = true
	return s
end
function CALL(f, arg)
	local c = arg._context or _defvalues(f) and _defvalues(f)._context
	if not c then
		return function () return f((table.copy({}, arg))) end
	end
	CONTEXT(c)
	return function (_args)
		local s = table.copy({}, arg)
		local _c = _args._context
		if _c then
			CONTEXT(_c)
			for k,v in next,c do s[v] = _args[_c[k]] end
		else
			for k,v in next,c do s[v] = _args[v] end
		end
		return f(s)
	end
end	
function REMOTE(remote, name, args)
	remote = _defname(remote) and CALL(remote, {}) or WRAP(remote)
	return function (_args)
		remote(_args)[name](args)
	end
end

function table.onlyarray(s)
	local ss = {}
	for i = 1,#s do ss[i] = s[i] end
	return ss
end
function table.noarray(s)
	local ss = {}
	for k, v in next, s do if type(k) ~= 'number' then ss[k] = v end end
	return ss
end
function table.unpairs(s)
	local ss = {}
	for k, v in next, s do ss[#ss+1]=k ss[#ss+1]=v end
	return ss
end
function table.print(t,d)
	d = d or 0
	for k,v in pairs(t) do
		local s = ''
		for i = 1,d do
			s = s..'\t'
		end
		print(s..k,v)
		if type(v) == 'table' then
			table.print(v,d + 1)
		end
	end
end

--------------------------------------------------------------------------------------------
LOGBEFORECALL = false
LOGAFTERCALL= false

LOGCALLOUT = false
LOGLISTEN = false
LOGDISCONNECT = false

math.randomseed(_now(0))

-- 时间（若测试要时间加速，重新定义MINUTE HOUR DAY的进制S2M M2H H2D）
_G.CTimeFormat = {}

SECOND = 1
S2M = 60
MINUTE = S2M * SECOND
M2H = 60
HOUR = M2H * MINUTE
H2D = 24
DAY = H2D * HOUR

-- 日志开关


-- 翻译语种
LANGUAGE = 'zh_CN'

-- 数据库SQL监测
LOGDBSTATISTIC = false
LogDbStatisticLogPath = '../Log/logs/sql.log'
-----------------------------------------------------------------------------

-- 网络监听
listening = nil
-- 网络连接 { net = { ip, port ... } }
nets = {}
-- 在线用户 { net = player.name, player.name = net }
netplayers = {}
-- 在线角色 { net = role.name, role.name = net }
netroles = {}
-- 在线数
onlineRoleNum = 0

-- 网络发送
function netSend(net, data, from, to, head)
	if head then
		net:send(head)
	else
		net:send(string.from32b(to-from+1+8, true))
		net:send('\0\0\0\0')
	end
	net:send(data, from, to)
end
-- 网络发送头
function netHead(data, from, to)
	return string.from32b(to-from+1+8)..'\0\0\0\0'
end

-----------------------------------------------------------------------------

--时间转换（支持测试时的时间加速）
local function toint(n)
	return tonumber(math.floor(n))
end
local function leapyear(year)
	local f1, f2, f3
	f1 = ((year%4) == 0)
	f2 = ((year%100) == 0)
	f3 = ((year%400) == 0)
	if (f1 and not f2) or (f2 and f3) then
		return true
	else
		return false
	end
end

-- quick为true则代表时间加速
local function today(sec, quick)
	local day, hour, minute, second
	day=quick and toint(sec/DAY) or toint(sec/24/60/60)
	local ds = quick and day*DAY or day*24*60*60
	hour=quick and toint((sec-ds)/HOUR) or toint((sec-ds)/60/60)
	local hs = quick and hour*HOUR or hour*60*60
	minute=quick and toint((sec-ds-hs)/MINUTE) or toint((sec-ds-hs)/60)
	local ms = quick and minute*MINUTE or minute*60
	second=sec-ds-hs-ms
	return day, hour, minute, second
end

local function toyear(startyear, day)
	local y=startyear
	local d=day
	while true do
		if leapyear(y) then
			if d <= 366 then break end
			d=d-366
			y=y+1
		else
			if d<=365 then break end
			d=d-365
			y=y+1
		end
	end
	return y, d
end


local function month2day(year, month, day)
	local md = {0,31,28,31,30,31,30,31,31,30,31,30,31}
	if leapyear(year) then md[3]=md[3]+1 end
	local d=0
	for i=1,month do
		d=d+md[i]
	end
	return d+day
end

local yearday1970 = {}
local function setYearday1970()
	local cnt=0
	for i=1970,991970 do
		cnt = leapyear(i) and cnt+366 or cnt+365
		yearday1970[i+1]=cnt
	end
end
setYearday1970()

local function dayfrom1970(year, month, day)
	local d = yearday1970[year]
	d = d + month2day(year,month,day)
	return d
end
-----add by lkj 返回从2000年1月1日到现在的天数 04/29/2012
local function dayfrom2000(year, month, day)
	local d1 = dayfrom1970(2000, 1, 1);
	local d2 = dayfrom1970(year, month, day);
	local d = d2 - d1;
	return d;
end;

local function day2month(year, day)
	local md = {31,28,31,30,31,30,31,31,30,31,30,31}
	if leapyear(year) then md[2]=md[2]+1 end
	local m,d = 1,0
	while true do
		if day <= md[m] then
			d = day
			break
		end
		day = day-md[m]
		m = m+1
	end
	return m,d
end

-- quick为true则代表时间加速
local function diffdate(startdate, sec, quick)
	local d, h, m, s = today(sec, quick)
	local year,month,day,hour,minute,second
	local carry=0
	second = startdate.second + s
	if second >= (quick and S2M or 60) then
		carry=1
		second = second - (quick and S2M or 60)
	end
	minute = startdate.minute + carry + m
	if minute >= (quick and M2H or 60) then
		carry=1
		minute = minute - (quick and M2H or 60)
	else
		carry=0
	end
	hour = startdate.hour + carry + h
	if hour >= (quick and H2D or 24) then
		carry=1
		hour = hour-(quick and H2D or 24)
	else
		carry=0
	end
	day = month2day(startdate.year, startdate.month, startdate.day) + carry + d
	year, day = toyear(startdate.year, day)
	month, day = day2month(year, day)
	return year, month, day, hour, minute, second
end

-- 以下用于判断，带时间加速
local OneDayMsec = DAY*1000
local TodayStartMsec
--- 返回今天的起始时间（毫秒）
local function todayStartMsec()
	local cur = _now()
	if TodayStartMsec and cur-TodayStartMsec<OneDayMsec then return TodayStartMsec end
	local y,m,d,h,min,s = CTimeFormat:mtodate(cur,true,true)
	TodayStartMsec = dayfrom2000(y,m,d)*OneDayMsec
	return TodayStartMsec
end

local function day2week(y,m,d)
	if(m==1) then
		m=13;
		y = y - 1
	end
	if(m==2) then
		m=14;
		y = y - 1
	end
	local week=math.floor((d+2*m+math.floor(3*(m+1)/5)+y+math.floor(y/4)-math.floor(y/100)+math.floor(y/400))%7);
	return week;
end
-----------------------------
--Public:
-----------------------------

ONE_SECOND_MSEC = 1000;
ONE_MINUTE_MSEC = 60 * ONE_SECOND_MSEC;
ONE_HOUR_MSEC = 60 * ONE_MINUTE_MSEC;
ONE_DAY_MSEC = 24 * ONE_HOUR_MSEC;
ONE_WEEK_MSEC = 7 * ONE_DAY_MSEC;
local TODAY_START_MSEC
--返回今天的起始时间（毫秒） add by lkj 不采用时间加速
function CTimeFormat:GetTodayStartMsec()
	local cur = _now()
	if TODAY_START_MSEC and cur - TODAY_START_MSEC < ONE_DAY_MSEC then return TODAY_START_MSEC end;
	local y, mo, d, h, mi, s = CTimeFormat:mtodate(cur, true, false);
	TODAY_START_MSEC = dayfrom2000(y, mo, d) * ONE_DAY_MSEC;
	return TODAY_START_MSEC
end
--返回今天hour:minute的时间戳毫秒数
function CTimeFormat:GetTodayThisTimeMsec(hour, minute)
	local today_start_msec = self:GetTodayStartMsec();
	return today_start_msec + hour * ONE_HOUR_MSEC + minute * ONE_MINUTE_MSEC;
end;
--返回指定时间的时间戳毫秒数 --add by lkj 05/09/2012
function CTimeFormat:GetThisTimeMsec(year, month, day, hour, minute, second)
	local msec = dayfrom2000(year, month, day) * ONE_DAY_MSEC;
	msec = msec + hour * ONE_HOUR_MSEC;
	msec = msec + minute * ONE_MINUTE_MSEC;
	msec = msec + second * ONE_SECOND_MSEC;
	return msec;
end;--add over
--- 输入_now(1)返回的时间整数（秒），返回日期时间字符串
-- 如果fmt为true，则返回year,month,day,hour,min,sec
-- 如果quick为true，则用时间加速的计算方法
function CTimeFormat:todate(sec, fmt, quick)
	local startdate={year=2000,month=1,day=1,hour=0,minute=0,second=0}
	if type(fmt)=='boolean' and fmt == true then
		return diffdate(startdate, sec, quick)
	elseif type(fmt)=='string' then
		return string.format(fmt, diffdate(startdate, sec, quick))
	end
	return string.format('%04d-%02d-%02d %02d:%02d:%02d',diffdate(startdate, sec, quick))
end
--- 输入_now(0.001)返回的时间整数（毫秒），返回日期时间字符串
function CTimeFormat:mtodate(msec, fmt,quick)
	return CTimeFormat:todate(msec/1000,fmt,quick)
end
--- 输入一个毫秒参数，如果是今天返回true，否则返回false
function CTimeFormat:isToday(msec)
	local t = todayStartMsec()
	return msec>=t and msec<t+OneDayMsec
end
--- 输入一个秒参数，如果是今天返回true，否则返回false
function CTimeFormat:isTodayEx(sec)
	local msec = sec*1000
	local t = todayStartMsec()
	return msec>=t and msec<t+OneDayMsec
end
-- 输入_now(1)返回的时间整数（秒）,返回星期几，6为星期天，0为星期一
function CTimeFormat:toweekEx(sec)
	local y,m,d,h,min,s = CTimeFormat:todate(sec,true,true)
	return day2week(y,m,d)
end
--输入年月日返回星期几 add by lkj 05/09/2012
function CTimeFormat:DayToWeek(year, month, day)
	return day2week(year, month, day);
end;--add over
---输入一个毫秒参数，如果是本周返回true，否则返回false
function CTimeFormat:isThisWeek(msec)
	local sec = math.floor(msec/1000)
	return CTimeFormat:isThisWeekEx(sec)
end
---输入一个秒参数，如果是本周返回true，否则返回false
function CTimeFormat:isThisWeekEx(sec)
	local y,m,d,h,min,s = CTimeFormat:todate(_now(1),true,true)
	local y2,m2,d2,h2,min2,s2 = CTimeFormat:todate(sec,true,true)
	if math.ceil((dayfrom1970(y, m, d)+3)/7) ~= math.ceil((dayfrom1970(y2, m2, d2)+3)/7) then
		return false
	else
		return true
	end
end
--获得格式化的 时：分：秒
function CTimeFormat:sec2format(secs)
	local hour = 0
	local min = 0
	local sec = 0
	--local now_time = os.time()
	local now_time = secs
	sec = math.floor(math.mod(now_time,60))
	min = math.floor(math.mod(now_time/60,60))
	hour = math.floor(math.mod(now_time/3600,24))
	return hour,min,sec
end

local day1970_2000 = dayfrom1970(2000, 1, 1);
ONE_DAY_SEC = 24 * 3600;
local sec1970_2000 = day1970_2000 * ONE_DAY_SEC;
function CTimeFormat:MsecToUTC(msec)
	local sec = math.floor(msec/1000);
	return sec + sec1970_2000;
end;
-----------------------------------------------------------------------------
-- 错误处理+日志（配置： LOGFILELV LOGCONSOLELV LOGFILE LOGCONSOLE ）
--[[
ERRORCODE={[1]='DEBUG',[2]='info', [3]='warn', [4]='err', [5]='sys', [6]='fatal',
			DEBUG=1, info=2, warn=3, err=4, sys=5, fatal=6}
--DEBUG-调试信息 INFO-输出信息 WARN-警告信息 ERROR-抛给用户的错误提示 SYS-系统必须输出的信息 FATAL-系统已知错误（有可能是外挂导致）
--zhj modlocal 
szParam1 = os.info[1] or "gs";
local LogFilePath=LOGFILE and assert(io.open( '../ServerApp/logs/'..string.upper(szParam1)..'log'..table.concat({CTimeFormat:todate(_now(1),'%04d%02d%02d%02d%02d%02d')},'')..'.log', 'w')) or nil
OldPrint = print
--- 写日志文件
-- @param 和print相同，最后一个参数为ERRORCODE，若没有指定ERRORCODE，默认为DEBUG
-- @usage 直接替代:print=LogWrite
function LogWrite(...)
	local cnt = select('#',...)
	local args={...}
	local e = type(args[#args]) == 'string' and args[#args] or 0
	local lv = ERRORCODE[e] and e or 'DEBUG'
	if e and ERRORCODE[e] then
		cnt = cnt -1;
	end;
	if ERRORCODE[e] then table.remove(args,#args) end
	local err=''
	for i=1,cnt do
		err = err..tostring(args[i])..'	'
	end
	err = err=='' and 'nil' or err; 
	
	if LOGCONSOLE and ERRORCODE[lv] >= ERRORCODE[LOGCONSOLELV] then OldPrint('['..CTimeFormat:mtodate(_now())..'] ['..lv..'] ' ..err) end
	if LOGFILE and ERRORCODE[lv] >= ERRORCODE[LOGFILELV] then LogFilePath:write('['..CTimeFormat:mtodate(_now())..'] ['..lv..'] ' ..err..'\n') end
	
	-- if LOGCONSOLE  then OldPrint('['..CTimeFormat:mtodate(_now())..'] ['..lv..'] ' ..err) end
	-- if LOGFILE then LogFilePath:write('['..CTimeFormat:mtodate(_now())..'] ['..lv..'] ' ..err..'\n') end
end
print = LogWrite;
_G._info = print
--LogWrite = print

--- 构造抛出错误
-- @param s 如果s不为nil或者false则直接返回s
-- @param err 错误文本信息
-- @param lv  错误等级（不填写则默认为FATAL）
-- @usage 替代 assert 和 error 在系统中使用
function ErrorAssert(s, err,lv)
	if s then return s end
	local cur = mtodate(_now())
	if lv and ERRORCODE[lv] then
		if ERRORCODE[lv] == ERRORCODE['ERR'] or ERRORCODE[lv] == ERRORCODE['FATAL']then -- 只有错误才抛出
			assert(false, '['..ERRORCODE[lv]..'] ['..cur..'] '..err)
		end
	else
		assert(false, '['..ERRORCODE['FATAL']..'] ['..cur..'] '..err)
	end
end

--- 解析抛出的错误
-- @param err 系统抛出的错误文本信息
-- @return 错误产生位置 错误文本 错误级别 （如果没有解析成功，直接返回err）
-- @usage 在 errcall中调用
function ErrorParse(err) 
	local idx1,idx2,place,lv,t,errText = string.find(err,'^(.*lua.*): %[([0-9])%] %[(.*)%](.*)')
	if idx1 then
		return place, tonumber(lv), t, errText
	else
		return err
	end
end
--]]
-----------------------------------------------------------------------------
-- 多语言支持（配置：LANGUAGE）
local TransPattern = '(%{[%a_]*%a+%})'
--zhj mod
local confs_translate = nil; --dofile'config/cfg_translate.lua'

local function transZh_cn(str,...)
	local args={...}
	local i = 0
	local s = string.gsub(str,TransPattern,
		function (p)
			i = i+1
			if args[i] == false then return 'false' end
			if args[i] == nil then
				print('parameter is nil in string.trans #'..i..' str=\''..str..'\'','WARN')
				return 'nil'
			end
			return args[i]
		end
	)
	return s
end


local function transOther(language, str, ...)
	assert(confs_translate[str], 'can not find language text: '.. str)
	local transtr=assert(confs_translate[str][language], 'can not find text ('..str..') in language '..language)
	
	local args = {...}
	local tb = {}
	local cnt = 0
	for w in string.gfind(str,TransPattern) do
		cnt = cnt+1
		tb[w]=args[cnt]
		assert(tb[w],'not enough parameters in string.trans #'..cnt)
	end
	
	
	
	local s = string.gsub(transtr,TransPattern,
		function (p)
			return assert(tb[p],'can not find parameter in string.trans: '..p)
		end
	)
	return s
end

function string.trans(str, ...)
		if LANGUAGE == 'zh_CN' then
			return transZh_cn(str, ...)
		else
			return transOther(LANGUAGE,str,...)
		end
end
--[[
local teststr='测试一下把{player}的{chinese}翻译为{english}'
LANGUAGE='en_US'
print(string.trans(teststr,'InWind','简体中文','English'))
]]--
-----------------------------------------------------------------------------
-- 数据库
local sql = nil
-- 数据库缓存
cache = nil

-- 事务begin使用标记
local TransBegin = 0
-- SQL语句log
-- zhj mod
local sqlLog = LOGDBSTATISTIC and assert(io.open( LogDbStatisticLogPath , 'w')) or nil

function table.readonly(x, name, deep, meta, udata, deepudata)
	if deep then
		for k, v in next, x do
			if type(v)=='table' then
				x[k] = table.readonly(v, name..'.'..k, true, false, deepudata, deepudata)
			end
		end
	end
	local m = { __index = x }
	local s = udata and _udata(m) or {}
	m.__metatable = meta == true and s or meta
	if udata then
		return s, m
	end
	m.__newindex = function () error(name and 'readonly '..name or 'readonly') end
	return setmetatable(s, m), m
end

-- 表示父类型
SUPER = _udata()

-- 处理游戏数据类型
function types()

	local append = table.append
	local empty = {}
	local defaults = {} -- { TYPE = type }
	local metas = {} -- { TYPE = meta }
	local supers = {} -- { TYPE = { SUPER=true } }
	local clones = {} -- { meta = { name=type } }
	-- 防止对类型的意外修改
	EMPTYTB = table.readonly(function () error'EMPTY is empty' end, 'EMPTY')
	for name, d in next, TYPE do
		local t, meta = table.readonly(d, name, true, true, true)
		_G[name] = t
		defaults[t] = d
		metas[t] = meta
		meta.__tostring = function (data)
			if metas[data] then return name end
			local addr = _address(data)
			local di, dn = data.id, data.name
			local id, nn = tonumber(di), dn ~= nil and tostring(dn)
			local idn = id == nil and di ~= nil and tostring(di) 
			if id then
				return nn and ('%s#%d`%s@%08x'):format(name, id, nn, addr)
					or ('%s#%d@%08x'):format(name, id, addr)
			elseif idn then
				return nn and ('%s#%s`%s@%08x'):format(name, idn, nn, addr)
					or ('%s#%s@%08x'):format(name, idn, addr)
			else
				return nn and ('%s`%s@%08x'):format(name, nn, addr)
					or ('%s@%08x'):format(name, addr)
			end
		end
		supers[t] = {}
		clones[meta] = {}
	end
	-- 处理父类型
	for t, d in next, defaults do
		for supname, SUP in next, d do
			if SUP == SUPER then
				d[supname] = nil
				supers[t][_G[supname]] = true
			end
		end
	end
	-- 处理祖先类型
	local more = true
	while more do
		more = false
		for sub, sups in next, supers do
			for sup, _ in next, sups do
				local sups, ok = append(sups, supers[sup]) -- supers循环可能重复或丢失 但有外围where
				if sups[sub] then
					error 'cycle subtype'
				end
				more = ok or more
			end
		end
	end
	for sub, sups in next, supers do
		local subm = metas[sub]
		local subd = defaults[sub]
		for sup, _ in next, sups do
			subm[metas[sup]] = true
			append(subd, defaults[sup])
		end
		for name, v in next, subd do
			if type(v) == 'table' then
				clones[subm][name] = subd[name]
			end
		end
	end
	TYPE = nil
	SUPER = nil
	types = nil

	local function getmeta(data)
		local meta = getmetatable(data)
		if meta then
			meta = metas[meta]
		end
		if not meta then
			error 'not game datatype'
		end
		return meta
	end

	local function clone(to, from, meta, shallow)
		if not shallow then
			for name, default in next, clones[meta] do
				if to[name] == default then to[name] = append({}, from[name]) end
			end
		end
		return (append(to, from))
	end

	-- 判断游戏数据类型
	function is(Type, data)
		local t = getmetatable(data)
		return t == Type or (supers[t] or empty)[Type] == true
	end

	-- 判断游戏数据类型
	function same(Type, data)
		local t = getmetatable(data)
		return t == Type
	end

	-- 检查游戏数据类型
	function must(Type, data)
		local t = getmetatable(data)
		if not (t == Type or (supers[t] or empty)[Type]) then
			error(tostring(data)..' must be '..tostring(Type)..' or subtype')
		end
	end

	-- 创建游戏数据实例，并复制默认属性
	function instance(Type, data)
		local meta = metas[Type]
		setmetatable(data, meta)
		return clone(data, defaults[Type], meta)
	end

	-- 扩展游戏数据实例为子类型实例，并复制默认属性
	function subInstance(subType, sup)
		local supt = getmetatable(sup)
		local subm = metas[subType]
		if supt then
			if supt == subType or (supers[supt] or empty)[subType] then
				return sup -- 已经是子类型
			end
			if not (supers[subType] or empty)[supt] then -- 父子类型不匹配
				error(tostring(subType)..' must be subtype of '..tostring(supt))
			end
			metas[supt].__metatable = nil
			setmetatable(sup, subm)
			metas[supt].__metatable = supt
		else
			setmetatable(sup, subm) -- 相当于 instance()
		end
		return clone(sup, defaults[subType], subm)
	end

	-- 复制游戏数据实例
	function cloneInstance(data, shallow)
		local meta = getmeta(data)
		return clone(setmetatable({}, meta), data, meta, shallow)
	end
end

-----------------------------------------------------------------------------

sql = {}

-- function _sql(db)
	-- return setmetatable({ db }, { __index = sql })
-- end

-- 设置返回行集，默认
function sql:rows(after, ...)
	self[2] = after
	self[5] = {...}
	return self
end

-- 设置返回列集，访问数据库后恢复默认
function sql:columns()
	self[2] = false
	return self
end

-- 设置不返回的列
function sql:exclude(...)
	self[6] = {...}
	return self
end

-- 设置无数据时返回nil，默认
function sql:nils()
	self[3] = false
	return self
end
-- 设置无数据时返回空集，访问数据库后恢复默认
function sql:emptys()
	self[3] = true
	return self
end

-- 设置抛出错误，默认
function sql:err()
	self[4] = false
	return self
end
-- 设置返回错误信息，访问数据库后恢复默认
function sql:message()
	self[4] = true
	return self
end

-- 解决数组读取的解析问题
function sql:toarray(code)
	local te = string.to32b(code, 9) -- 数组类型
	local len = string.to32b(code, 13) -- 数组长度
	local st = string.to32b(code, 17)
	local elem, elemlen, pos = {},0,0
	if te == 20 then -- int8
		for i=st,len+st-1 do
			local elemlen = string.to32b(code, 21+pos)
			if elemlen==4294967295 then
				elemlen = 0
				elem[i] = nil
			else
				elem[i] = string.to64b(code, 21+4+pos, true)
			end
			pos = pos + 4 + elemlen
		end
		return elem
	elseif te == 23 then -- int4
		for i=st,len+st-1 do
			local elemlen = string.to32b(code, 21+pos)
			if elemlen==4294967295 then
				elemlen = 0
				elem[i] = nil
			else
				elem[i] = string.to32b(code, 21+4+pos, true)
			end
			pos = pos + 4 + elemlen
		end
		return elem
	elseif te == 21 then -- int2
		for i=st,len+st-1 do
			local elemlen = string.to32b(code, 21+pos)
			if elemlen==4294967295 then
				elemlen = 0
				elem[i] = nil
			else
				elem[i] = string.to16b(code, 21+4+pos, true)
			end
			pos = pos + 4 + elemlen
		end
		return elem
	elseif te == 16 then -- boolean
		for i=st,len+st-1 do
			local elemlen = string.to32b(code, 21+pos)
			if elemlen==4294967295 then
				elemlen = 0
				elem[i] = nil
			else
				elem[i] = string.byte(code, 21+4+pos, 21+4+pos) == 1
			end
			pos = pos + 4 + elemlen
		end
		return elem
	else -- 按字符串转
		for i=st,len+st-1 do
			local elemlen = string.to32b(code, 21+pos)
			if elemlen==4294967295 then
				elemlen = 0
				elem[i] = nil
			else
				elem[i] = string.sub(code, 21+4+pos, 21+4+pos+elemlen-1)
			end
			pos = pos + 4 + elemlen
		end
		return elem
	end
	error("type code: "..te.. " can not to array")
end

--将table转换为postgre所识别的数组类型
--为了往postgre中插入数组结构的字段类型
function sql:getArrayString(t)
	assert(t,'传入的table为nil')
	local result = {}
	result[#result +1] = '{'
	for k,v in next,t do
		if 'table' == type(v) then
			result[#result +1] =sql:getArrayString(v)
		elseif 'string' == type(v) then
			result[#result +1] = "\"" .. v .. "\""
		else
			result[#result +1] = v		
		end
		result[#result +1] = ','
	end
	if #result == 1 then
		result[#result +1 ] = '}'
	else
		result[#result] = '}'
	end
	
	return table.concat(result,'')
end
-- timestamp解码
function sql:totime(code)
	return string.to64b(code,1,true)	
end

-- 2000.1.1. 00:00 UTC (postgresql timestamp起始时间) 到
-- 1970.1.1. 00:00 UTC (lua 起始时间)过的秒数
--local T2000 = 946656000 
local T2000 = 946684800
-- postgresql timestamp to lua msec
function p2mtime(ptime)
	return ptime/1000 + T2000*1000
end
-- lua msec to postgresql timestamp 
function m2ptime(ltime)
	return (ltime-T2000*1000)*1000
end

-- (语句,参数...)->数据集,行数,错误信息
function sql:execute(stat, ...)
	if stat == 'begin' then 
		TransBegin = 1
	elseif stat == 'commit' or stat == 'rollback' then
		if TransBegin == 1 then 
			TransBegin = 0
		else
			return
		end
	end
	if LOGDBSTATISTIC then
		if sqlLog == nil then
			print('['..todate(_now(1))..' UTC] ');
			print(stat);
			print('\n');
		else
			sqlLog:write('['..todate(_now(1))..' UTC] ')
			sqlLog:write(stat)	
			sqlLog:write('\n')
		end;
	end
	local after, emptys, message, afters, exclude = self[2], self[3], self[4], self[5], self[6]
	self[2] = nil
	self[3] = false
	self[4] = false
	self[5] = nil
	self[6] = nil
	local ex ={}
	if exclude then
		for i=1, #exclude do
			ex[exclude[i]] = true
		end
	end
	local q = self[1]:newCommand(stat)
	local p = q:execute(...)
	if not p:good() then
		if message then
			return emptys and {} or nil, 0, p:errorMessage()
		end
		error(p:errorMessage())
	end
	if not emptys and not p:hasData() then
		return nil, p:cmdTuples()=='' and 0 or int(p:cmdTuples())
	end
	local m = p:nfields()
	local s, n = {}, 0
	if after == false then -- 列集
		for i = 1, m do
			s[p:columnName(i-1)] = {}
		end
		while p:hasData() do
			n = n+1
			local r = { p:read() }
			for i = 1, m do
				s[p:columnName(i-1)][n] = r[i]
			end
		end
	else -- 行集
		while p:hasData() do
			n = n+1
			local r = { p:read() }
			for i = 1, m do
				if ex[p:columnName(i-1)] ~= true then
					r[p:columnName(i-1)] = r[i]
				end
				r[i] = nil
			end
			s[#s+1] = r
		end
		if after then
			s = after(s, unpack(afters))
		end
	end
	return s, n > 0 and n or p:cmdTuples()=='' and 0 or int(p:cmdTuples())
end

local function instanceIndex(s, Type, key)
	return table.index(table.instance(s, Type), key)
end

function sql:types(Type, key)
	if key then
		return self:rows(instanceIndex, Type, key)
	else
		return self:rows(table.instance, Type)
	end
end
	--[[
	print('-------------------------------------------------------------------', from, to);
	local HEX = { [0]='0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f' }
	local function hex(i)
	return HEX[bit.rshift(i,4)]..HEX[i%16]
	end
	local s = {}
	for i = from,to do
	s[#s+1] = string.byte(data,i) >= 32 and hex(string.byte(data,i))..':'..string.udata(data,i,i) or hex(string.byte(data,i))
	end
	print(table.concat(s, '  '))
	--]]
-----------------------------------------------------------------------------

--- 使用key字段作为索引建立新表
function table.index(tb, key)
	local s = {}
	for k, v in next, tb do
		local vk = v[key]
		if vk then
			if s[vk] then
				error(key..'='..vk..' has duplicate record.')
			end
			s[vk] = v
		else
			error (key.." does not exists in "..k)
		end
	end
	return s
end

--- 为表tb建立类型为Type的instance
function table.instance(tb, Type)
	for k, v in next, tb do
		instance(Type, v)
	end
	return tb
end

-- 为multiIndex服务
local function multiIndexLine(linekey, line, tb, ...)
	local keys={...}
	if #keys == 1 then
		local key = keys[1]
		local keyv = line[key]
		if keyv == nil then
			error(key..' does not exists in '..linekey)
		end
		if type(keyv) == 'table' then
			for i,v in next, keyv do
				if tb[v] then
					error('duplicate '..key..'='..v..' in '..linekey)
				end
				tb[v] = line
			end
		else
			if tb[keyv] then
				error('duplicate '..key..'='..keyv..' in '..linekey)
			end
			tb[keyv] = line
		end
		return
	end
	local key = keys[1]
	local keyv = line[key]
	if keyv == nil then
		error(key..' does not exists in '..linekey)
	end
	table.remove(keys,1)
	if type(keyv) == 'table' then
		local c=0
		for i,v in next, keyv do
			tb[v] = tb[v] or {}
			multiIndexLine(linekey, line, tb[v], unpack(keys))
			c=c+1
		end
			if c == 0 then
				error(key..' does not exists in '..linekey)
			end
	else
		tb[keyv] = tb[keyv] or {}
		multiIndexLine(linekey, line, tb[keyv], unpack(keys))
	end
end
--- 为表tb建立多级索引结构(支持table类型的多级索引)
function table.multiIndex(tb,...)
	local newtb = {}
	for k,v in next, tb do
		multiIndexLine(k,v,newtb,...)
	end
	return newtb
end


--- 为配置表tb建立多个key字段的索引(Hash)
function mulIndexConfig( tb, ... )
	local s = {}
	local arg = { ... }
	for k, v in next, tb do
		local index = ''
		for i, key in next, arg do
			if not v[key] then
				error ( 'there is no key' .. key )
			else
				index = index .. v[key]
			end
		end
		s[index] = v
	end
	return s
end


function table.indexOf( t, v, from, PropName )
	if table.maxn( t ) < 0 or v == nil then return -1; end;
	from = from or 1;
	if PropName then
		for ii = from, table.maxn( t ) do
			if t[ii] and t[ii][PropName] == v then
				return ii;
			end
		end
	else
		for ii = from, table.maxn( t ) do
			if t[ii] == v then
				return ii;
			end
		end
	end
	return -1;
end

--数组方法
function table.forEach( t, func )
	for ii = 1, table.maxn( t ) do
		t[ii] = func( t[ii] );
	end
	return t;
end

function table.each( t, func )
	for ii = 1, table.maxn( t ) do
		func( t[ii] );
	end
end

function table.props( t, propName, from, to )
	from = from or 1;
	to = to or table.maxn( t );
	local a = {}
	table.each( t, function( v )
		if not v then return nil; end;
		table.insert( a, v[ propName ] );
	end)
	return a;
end

local function serialize ( o, s )
	if type(o) == "number" then
		s = s..o;
	elseif type(o) == "string" then
		s = s.."'"..o.."'";
	elseif type(o) == "boolean" then
		s = s..( o and "true" or "false" );
	elseif type(o) == "table" then
		s = s.."{";
		for k, v in next, o do
			if type(k) == 'number' then
				s = s.."["..k.."]=";
				serialize( v, s );
				s = s..","
			elseif type(k) == 'string' then
				s = s.."['"..k.."']=";
				serialize( v, s );
				s = s..","
			elseif type(k) == "boolean" then
				s = s.."["..( k and "true" or "false" ).."]=";
				serialize( v, s );
				s = s..","
			end
		end
		s = s.."}";
	elseif type(o) == "function" then
		print( "ignor" );
	elseif type(o) == "userdata" then
		print( "ignor" );
	else
		error("cannot serialize a " .. type(o))
	end
end

function table.tostring( t )
	serialize( t, "" );
end

--扩展table功能
--qinlongji
--2011-12-12

_G.Table = {};

--返回表的元素长度
--parms:	表
function Table:Count( t )
	local count = 0
	if type(t) == "table" then
		for k , v in pairs( t ) do
			count = count + 1
		end
	end
	return count
end
--跳过指定元素
--parms:	表	元素个数
--return:	新的表
function Table:Skip( t, count )
	local i = 0;
	local total = Table:Count(t);
	if(total<=count) then
		return {};
	end
	local newtable = {}
	for key, value in pairs(t) do
		if(count > i) then
			i = i + 1;
		else
			table.insert( newtable, value );
		end
	end
	t = nil;
	return newtable;
end 
--从表中取出指定数量元素
--parms:	表	元素个数
--return:	新的表
function Table:Take( t, count )
	local i = 0;
	if Table:Count(t) == 0 then
		return {};
	end
	local newtable = {}
	for key, value in pairs(t) do
		if(count > i) then
			table.insert( newtable , value );
			i = i + 1;
		else
			break;
		end
	end
	t = nil;
	return newtable;
end
--table copy
function Table:DeepCopy(ori_tab)
    if (type(ori_tab) ~= "table") then
        return nil;
    end
    local new_tab = {};
    for i,v in pairs(ori_tab) do
        local vtyp = type(v);
        if (vtyp == "table") then
            new_tab[i] = Table:DeepCopy(v);
        elseif (vtyp == "thread") then
            new_tab[i] = v;
        elseif (vtyp == "userdata") then
            new_tab[i] = v;
		elseif (vtyp == "function") then
			--
        else
            new_tab[i] = v;
        end
    end
    return new_tab;
end
-----------------------------------------------------------------------------
--日志打印
_G._err = function(...)
	_error_log(...)
	_error_log(debug.traceback())
end
_G._debug = _debug_log
_G._info = _info_log
_G._record = _record_log
_G._assert = function(c, ...)
	if not c then
		_err(...);
		error();
	end
end
_G.print = _G._debug
-----------------------------------------------------------------------------
