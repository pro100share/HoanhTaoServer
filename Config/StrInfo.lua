_G.__langauges = {}

if _dofile then
	_dofile(ClientConfigPath..'Config/StrInfo1.lua')
	_dofile(ClientConfigPath..'Config/StrInfo2.lua')
	_dofile(ClientConfigPath..'Config/StrInfo3.lua')
else
	dofile '../Config/StrInfo1.lua'
	dofile '../Config/StrInfo2.lua'
	dofile '../Config/StrInfo3.lua'
end

for k,v in pairs(StrSplit1) do
	__langauges[k] = v
end

for k,v in pairs(StrSplit2) do
	__langauges[k] = v
end

for k,v in pairs(StrSplit3) do
	__langauges[k] = v
end