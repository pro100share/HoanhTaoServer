
--[[
���ܣ�����ϵͳ�����ࣨ��������
���ߣ�κ��
ʱ�䣺2014-2-19
--]]



--------------------------------
_G.CGuildSystemManager = CSingle:new();
--���뵥�������
CSingleManager:AddSingle(CGuildSystemManager,true);

--��ʼ��
function CGuildSystemManager:Create()
	----�ٻ��� 
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
---����ʹ���ٻ�����Ϣ
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
---����ʹ���ٻ��ǰ����
function CGuildSystemManager:SetCurPosByUseCallItem(posx,posy, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].CurfXPos = posx;
	self.tabInfo[dwGuildID].CurfYPos = posy;
end
---����ʹ���ٻ��ǰ��
function CGuildSystemManager:SetCurLineByUseCallItem(line, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].Curline = line;
end
---����ʹ���ٻ��ǰ��ͼ
function CGuildSystemManager:SetCurMapIDByUseCallItem(mapID, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].CurMapID = mapID;
end
---����ʹ���ٻ���ʱ��
function CGuildSystemManager:SetUseTimeByUseCallItem(dwGuildID,curtime)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].UseItemTime = curtime;
end
----�����������
function CGuildSystemManager:SetRoleNameByUseCallItem(name, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].RoleName = name;
end
---��ȡʹ���ٻ������ID
function CGuildSystemManager:SetRoleIDByUseCallItem(roleID, dwGuildID)
	if not self.tabInfo[dwGuildID] then
		self.tabInfo[dwGuildID] = {};
	end;
	self.tabInfo[dwGuildID].RoleID = roleID;
end
---��ȡʹ���ٻ��ǰ����
function CGuildSystemManager:GetCurPosByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0,0;
	end;
	return self.tabInfo[dwGuildID].CurfXPos,self.tabInfo[dwGuildID].CurfYPos
end
---��ȡʹ���ٻ��ǰ��
function CGuildSystemManager:GetCurLineByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].Curline;
end
---��ȡʹ���ٻ��ǰ��ͼ
function CGuildSystemManager:GetCurMapIDByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].CurMapID;
end
---��ȡʹ���ٻ���ʱ��
function CGuildSystemManager:GetUseTimeByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].UseItemTime;
end
----��ȡ�������
function CGuildSystemManager:GetRoleNameByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return "";
	end;
	return self.tabInfo[dwGuildID].RoleName;
end
---��ȡʹ���ٻ������ID
function CGuildSystemManager:GetRoleIDByUseCallItem(dwGuildID)
	if not self.tabInfo[dwGuildID] then
		return 0;
	end;
	return self.tabInfo[dwGuildID].RoleID;
end
---��ӻ������
function CGuildSystemManager:AddChangeLinePlayerID(roleID)
	local index = #self.changeLineByUseItem;
	self.changeLineByUseItem[index] = roleID;
end
---ɾ���������
function CGuildSystemManager:DelChangeLinePlayerID(roleID)
	for i = 1,#self.changeLineByUseItem do
		if(self.changeLineByUseItem[i] == roleID) then
			self.changeLineByUseItem[i] = nil;
		end
	end
end
---����Ƿ��ǻ������
function CGuildSystemManager:CheckPlayerIsChangeLine(roleID)
	for i = 1,#self.changeLineByUseItem do
		if(self.changeLineByUseItem[i] == roleID) then
			return true;
		end
	end
	return false;
end
