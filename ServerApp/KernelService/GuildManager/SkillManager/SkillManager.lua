local function DecodeStr(str, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local m = string.find(str1, ",", 1);
		if not m then
			_err("----------------");
		end;
		local str2 = string.sub(str1, 1, m - 1);
		local str3 = string.sub(str1, m + 1);
		local key = tonumber(str2);
		local value = tonumber(str3);
		if not key or not value then
			_err("!@#!$%%", str2, str3);
		end;
		t[key] = value;
	end;
end;
-------------------------------------------------------------------------------
--公会技能数据
-------------------------------------------------------------------------------
local szTable = 'T_Guild_Skill';
local tabPrimeKey = {'dwGuildID'};
local tabDataKey = {'szSkill'};
CGuildDatabase:AddTable(szTable,tabPrimeKey,tabDataKey);
-------------------------------------------------------------------------------
_G.CGuildSkill = CGuildData:inherit();
CGuildSkill.table = 'T_Guild_Skill';
function CGuildSkill:Create(tabInfo)
	self.dwGuildID	= tabInfo.dwGuildID; --公会ID
	self.szSkill	= tabInfo.szSkill;		--公会技能字符串
	self.tSkill		= {};
	for k, _ in pairs(_G.GuildSkillConfig) do
		self.tSkill[k] = 0;
	end;
	DecodeStr(self.szSkill, self.tSkill);
end;
-------------------------------------------------------------------------------
--公会技能系统
-------------------------------------------------------------------------------
_G.CGuildSkillMgr = CGuildBaseMgr:inherit();
function CGuildSkillMgr:Create()
	self.tabDataMap = {};
	local objDB = CGuildDatabase:GetTable('T_Guild_Skill');
	local tabRes = objDB:Select() or {};
	for _,v in pairs(tabRes) do
		self:Add(CGuildSkill:new(v));
	end;
	--扩展老版本
	local tabList = {}
	local fn = function(objGuild)
		if not self.tabDataMap[objGuild.dwGuildID] then
			table.insert(tabList,objGuild.dwGuildID);
		end;
	end;
	CGuildInfoMgr:Iterator(fn);
	for _, dwGuildID in pairs(tabList) do
		local t = {};
		t.dwGuildID = dwGuildID;
		t.szSkill = "";
		self:Add(CGuildSkill:new(t)):Insert();
	end
end;
function CGuildSkillMgr:Add(objGuildSkill)
	self.tabDataMap[objGuildSkill.dwGuildID] = objGuildSkill;
	return objGuildSkill;
end;
function CGuildSkillMgr:Get(dwGuildID)
	return self.tabDataMap[dwGuildID];
end;
function CGuildSkillMgr:Del(dwGuildID)
	local objGuildSkill = self.tabDataMap[dwGuildID];
	self.tabDataMap[dwGuildID] = nil;
	return objGuildSkill;
end;
function CGuildSkillMgr:GetSkillList(dwGuildID)
	return self:Get(dwGuildID).tSkill;
end;
-------------------------------------------------------------------------------
function CGuildSkillMgr:Build(dwGuildID)
	local t = { dwGuildID = dwGuildID }
	local t = {};
	t.dwGuildID = dwGuildID;
	t.szSkill = "";
	self:Add(CGuildSkill:new(t)):Insert();
end;
function CGuildSkillMgr:Dismiss(dwGuildID)
	local objGuildSkill = self:Del(dwGuildID);
	if objGuildSkill then
		objGuildSkill:Delete();
	end;
end;



