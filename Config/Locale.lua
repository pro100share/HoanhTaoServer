if _G.__langauges==nil then 
	_G.__langauges={};
end

local szMath = "font"
local i = 0;

_G.T=function(str)
	if __langauges[str] then
		local szInfo =  __langauges[str]
		if string.find(str,szMath) then
			return [[<font face="Tahoma">]]..szInfo..[[</font>]];
		end
		return szInfo
	--else
		--logdich(str);
	end
	return str;
end

_G.logdich=function(text)
	i = i + 1;
	local file = _File.new()
	file:create("../Dich/"..i..".txt", "a");
	file:write(text.."\n");
	file:close()
end