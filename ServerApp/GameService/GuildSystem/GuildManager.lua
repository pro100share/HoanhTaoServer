
--[[
功能：世家系统管理类（服务器）
作者：魏云
时间：2014-2-19
--]]



--------------------------------
_G.CGuildSystemManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CGuildSystemManager,true);

--初始化
function CGuildSystemManager:Create()
	----召唤令 
	self.tabInfo = {};
	-- self.tabInfo.CurfXPos = 0;
	-- self.tabInfo.CurfYPos = 0;
	-- self.tabInfo.Curline = 0;
	-- self.tabInfo.CurMapID = 0;
	-- self.tabInfo.UseItemTime = {};
	-- self.tabInfo.RoleName = "";
	-- self.tabInfo.RoleID = 0;
	-- self.changeLineByUseItem = {};
end
---设置使用召唤令信息
function CGuildSystemManager:SetInfoByUseCallItem(tabInfo)
	if not tabInfo then
		return;
	end;
	if not tabInfo.dwGuildID then
		return;
	end;
	self.tabInfo[tabInfo.dwGuildID] = {};
	
	self.tabInfo[tabInfo.dwGuildID].CurfXPos = tabInfo.CurfXPos;
	self.tabInfo[tabInfo.dwGuildID].CurfYPos = tabInfo.CurfYPos;
	self.tabInfo[tabInfo.dwGuildID].Curline = tabInfo.Curline;
	self.tabInfo[tabInfo.dwGuildID].CurMapID = tabInfo.CurMapID;
	--self.tabInfo.UseItemTime[tabInfo.dwGuildID or 1] = tabInfo.CurTime;
	self.tabInfo[tabInfo.dwGuildID].UseItemTime = tabInfo.CurTime;
	self.tabInfo[tabInfo.dwGuildID].RoleName = tabInfo.RoleName;
	self.tabInfo[tabInfo.dwGuildID].RoleID = tabInfo.RoleID;
end
---设置使用召唤令当前坐标
function CGuildSystemManager:SetCurPosByUseCallItem(posx,posy, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].CurfXPos = posx;
	self.tabInfo[dwGuildID].CurfYPos = posy;
end
---设置使用召唤令当前线
function CGuildSystemManager:SetCurLineByUseCallItem(line, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].Curline = line;
end
---设置使用召唤令当前地图
function CGuildSystemManager:SetCurMapIDByUseCallItem(mapID, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].CurMapID = mapID;
end
---设置使用召唤令时间
function CGuildSystemManager:SetUseTimeByUseCallItem(dwGuildID,curtime)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].UseItemTime = curtime;
end
----设置玩家名字
function CGuildSystemManager:SetRoleNameByUseCallItem(name, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].RoleName = name;
end
---获取使用召唤令玩家ID
function CGuildSystemManager:SetRoleIDByUseCallItem(roleID, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].RoleID = roleID;
end
---获取使用召唤令当前坐标
function CGuildSystemManager:GetCurPosByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0,0;
	end;
	return self.tabInfo[dwGuildID].CurfXPos,self.tabInfo[dwGuildID].CurfYPos
end
---获取使用召唤令当前线
function CGuildSystemManager:GetCurLineByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].Curline;
end
---获取使用召唤令当前地图
function CGuildSystemManager:GetCurMapIDByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].CurMapID;
end
---获取使用召唤令时间
function CGuildSystemManager:GetUseTimeByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].UseItemTime;
end
----获取玩家名字
function CGuildSystemManager:GetRoleNameByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return "";
	end;
	return self.tabInfo[dwGuildID].RoleName;
end
---获取使用召唤令玩家ID
function CGuildSystemManager:GetRoleIDByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].RoleID;
end
---添加换线玩家
function CGuildSystemManager:AddChangeLinePlayerID(roleID)
	local index = #self.changeLineByUseItem;
	self.changeLineByUseItem[index] = roleID;
end
---删除换线玩家
function CGuildSystemManager:DelChangeLinePlayerID(roleID)
	for i = 1,#self.changeLineByUseItem do
		if(self.changeLineByUseItem[i] == roleID) then
			self.changeLineByUseItem[i] = nil;
		end
	end
end
---检查是否是换线玩家
function CGuildSystemManager:CheckPlayerIsChangeLine(roleID)
	for i = 1,#self.changeLineByUseItem do
		if(self.changeLineByUseItem[i] == roleID) then
			return true;
		end
	end
	return false;
end
