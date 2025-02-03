local function tabletostr(t,d)
	local d = d or 1
	if d > 15 then return "nil" end;
	local s = "{\n"
	for k,v in pairs(t) do
		local s1 = ""
		for i = 1,d do
			s1 = s1..'\t'
		end
		if type(k)=="string" then
			s1 = s1..'["'..k..'"] = '
		elseif type(k)=="number" then
			s1 = s1..'['..k..'] = '
		end

		if type(v) =="string" then
			s1 = s1 .. [["]]..v..[["]]
		elseif type(v)=="number" then
			s1 = s1 .. v
		elseif type(v)=="boolean" then
			s1 = s1 .. tostring(v)
		elseif type(v)=="table" then
			s1 = s1 .. tabletostr(v,d+1)
		end

		s = s .. s1 ..";\n"
	end
	for i = 1,d-1 do
		s = s..'\t'
	end
	s = s.."}"
	return s;
end


local function table_compare(t1,t2)
	if (type(t1)~="table") or (type(t2)~="table") then
		return false
	end
	for k,v in pairs(t1) do
		if k=="UpdateTime" then
			
		elseif (type(v)=="number") or (type(v)=="string") then
			if v ~= t2[k] then
				return false
			end
		elseif type(v)=="table" then
			if not table_compare(v,t2[k]) then
				return false
			end
		end
	end
	return true
end


local open_file = function(szFileName,szMode)
	local szFileName = "../Data/AFConfig/"..szFileName
	local file = io.open(szFileName,szMode)
	return file
end
local close_file = function(file)
	file:flush()
	file:close()
end
local do_file = function(szFileName)
	local szFileName = "../Data/AFConfig/"..szFileName
	dofile(szFileName)
end
----------------------------------

function CFestivalManager:SaveTable(strFileName,strName,tInfo)
	tInfo.UpdateTime = _now(1)
	local file = open_file(strFileName,"w")
	file:write(strName.." = ")
	file:write(tabletostr(tInfo))
	file:write("\n")
	close_file(file)
end

function CFestivalManager:SaveFestival()
	local cfg = FestivalMainConfig
	for k,v in pairs(cfg) do
		local szName = "Festival_"..k
		local szFile = szName..".lua"
		do_file(szFile)
		if not table_compare(v,_G[szName]) then
			self:SaveTable(szFile,"_G."..szName,v)
		end
	end
end

function CFestivalManager:SaveLine()
	local cfg = FestivalListConfig
	for dwType,Config in pairs(cfg) do
		for k,v in pairs(Config) do
			local szName = "Line_"..dwType.."_"..k
			local szFile = szName..".lua"
			do_file(szFile)
			if not table_compare(v,_G[szName]) then
				self:SaveTable(szName..".lua","_G."..szName,v)
			end
		end
	end
end

function CFestivalManager:SaveScript()
	local cfg = FestivalScript
	local szName = "FestivalScript"
	local szFile = szName..".lua"
	self:SaveTable(szName..".lua","_G."..szName,cfg)
end

function CFestivalManager:SaveAll()
	self:SaveFestival()
	self:SaveLine()
	self:SaveScript()
end










































