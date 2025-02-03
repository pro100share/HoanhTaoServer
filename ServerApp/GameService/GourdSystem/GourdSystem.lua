--[[
	时间：2014-1-2
	功能：酒葫芦系统类
	作者：魏云
--]]

_G.CGourdSystem = {};

function CGourdSystem:new()
	local obj = CSystem:new("CGourdSystem");
	obj.Resdata = {
		RoleID = 0,         -----玩家ID
		MendLevel = 0,      -----修炼等级 可计算出阶数
		CurSkillValue = 0,  -----当前熟练度
		CurItemInfos = {},  -----当前提交物品数量信息
		AdornState = 0,     ------佩戴状态   0 未到达 1 到达未佩戴 >1 佩戴
		AddTimesItemIndex = 0,       ------翻倍索引值
	};
	obj.objDBQuery = nil;   ------数据库操作对象
	obj.skillSystem = nil;
	for k,v in pairs(CGourdSystem) do
		if(type(v) == 'function') then
			obj[k] = v;
		end
	end
	return obj;
end

function CGourdSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local objDB = objPlayer:GetDBQuery()
	if(not objDB) then
		return;
	end
	----创建数据库对象
	self.objDBQuery = CGourdSystemDB:new(objDB,self);
	if(not self.objDBQuery) then
		return;
	end
	self.skillSystem = objPlayer:GetSystem("CSkillSystem");
	if(not self.skillSystem) then
		return;
	end
	-----初始化变量信息
	self:InitData()
	--如果是跨服战
	if bIsChangeLine == 2 then
		local Data = objPlayer:GetLineData("CGourdSystem") or {};
		--local Data = objPlayer:GetCrossSvrData("CGourdSystem") or {};
		if(#Data == 0) then
			return;
		end
		-----设置变量信息
		if(#Data[1] > 0) then
			self.Resdata.RoleID = Data[1][1].dwRoleID;
			self.Resdata.MendLevel = Data[1][1].dwMendLevel;
			self.Resdata.AdornState = Data[1][1].dwAdornState;
		end
	else
		-----获取数据库信息
		local Data = objPlayer:GetLineData("CGourdSystem") or {};
		if(#Data == 0) then
			return;
		end
		-----设置变量信息
		if(#Data[1] > 0) then
			self.Resdata.RoleID = Data[1][1].dwRoleID;
			self.Resdata.MendLevel = Data[1][1].dwMendLevel;
			self.Resdata.CurSkillValue = Data[1][1].dwCurSkillValue;
			self.Resdata.CurItemInfos = self:LoadStr(Data[1][1].dwCurItemInfos);
			self.Resdata.AdornState = Data[1][1].dwAdornState;
			self.Resdata.AddTimesItemIndex = Data[1][1].dwAddTimesItemIndex;
		end
	end
	-----更新玩家属性
	if self:HasAuthority("Gourd") then 
		self:UpdateGourdProperty(self.Resdata.MendLevel);
		if(self.Resdata.AdornState > 1) then
			objPlayer:AddViewModel(self.Resdata.AdornState);
		end
	end;   --是否有权限 
	
end

function CGourdSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local Data = {};
	Data[1] = {};
	Data[1].dwRoleID = self.Resdata.RoleID;
	Data[1].dwMendLevel = self.Resdata.MendLevel;
	Data[1].dwCurSkillValue = self.Resdata.CurSkillValue;
	Data[1].dwCurItemInfos = self:UpdateStr(self.Resdata.CurItemInfos);
	Data[1].dwAdornState = self.Resdata.AdornState;
	Data[1].dwAddTimesItemIndex = self.Resdata.AddTimesItemIndex;
	--将数据提交到换线中心
	objPlayer:SetLineData("CGourdSystem",Data);
end

-----换跨服战场
function CGourdSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end
	local tb = {};
	tb[1] = {};
	tb[1].dwRoleID = self.Resdata.RoleID;
	tb[1].dwMendLevel = self.Resdata.MendLevel;
	tb[1].dwAdornState = self.Resdata.AdornState;
	objPlayer:SetCrossSvrData("CGourdSystem",tb);
end;


function CGourdSystem:Update(dwInterval)
	return true;
end
function CGourdSystem:OnEnterScene()
	if(self.Resdata.AddTimesItemIndex == 0 ) then
		self:RandAddTimes();
		self:SaveDB();
	end
	self:SynchronizeToClient();
end
function CGourdSystem:SynchronizeToClient()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	---同步客户端
	objPlayer.OnSynGourdViewItemInfoMsg{Infos = self:GetFinalViewItemConfig()};
	objPlayer.GourdSynchronizeToClientMsg{Infos = self.Resdata};
end

----初始化变量信息
function CGourdSystem:InitData()
	self.Resdata = {
		RoleID = 0,         -----玩家ID
		MendLevel = 1,      -----修炼等级 可计算出阶数
		CurSkillValue = 0,  -----当前熟练度
		CurItemInfos = {},  -----当前提交物品数量信息
		AdornState = 0,     ------佩戴状态   0 未到达 1 到达未佩戴 >1 佩戴
		AddTimesItemIndex = 0, ------翻倍索引值
	};
	for i = 1,#GourdConfig:GetGourdItemInfo() do
		self.Resdata.CurItemInfos[i] = 0;
	end
end
---保存数据库信息
function CGourdSystem:SaveDB()
	if(self.Resdata.RoleID <= 0) then
		self.objDBQuery:InsertGourdInfo();
		self.Resdata.RoleID = self:GetPlayer():GetRoleID();
	else
		self.objDBQuery:UpdateGourdInfo();
	end
end

---加载字符串 转换为 table
function CGourdSystem:LoadStr(str)
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

---更新字符串
function CGourdSystem:UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end
----获取最终显示物品信息
function CGourdSystem:GetFinalViewItemConfig()
	if(_G.UpdateGourdConfig and _G.UpdateGourdConfig.bOpen) then
		return _G.UpdateGourdConfig.Info;
	else
		return _G.GourdConfig:GetGourdItemInfo();
	end
end
-----
function CGourdSystem:GetUpLevelBySkillValue(mendValue)
	for i = self.Resdata.MendLevel,#_G.GourdConfig.LevelConfig do
		if(mendValue >= _G.GourdConfig.LevelConfig[i].Exp) then
			mendValue = mendValue - _G.GourdConfig.LevelConfig[i].Exp;
		else
			if(i == #_G.GourdConfig.LevelConfig) then
				mendValue = 0;
			end
			return i,mendValue;
		end
	end
	return #_G.GourdConfig.LevelConfig,0;
end


----更新玩家属性
function CGourdSystem:UpdateGourdProperty(level,temp)
	local t_attr = _G.SSingleAttrChange:new();
	local tempInfo = {};
	local tempattr = _G.GourdConfig.LevelConfig[level] or {};
	for k,v in pairs (tempattr) do
		if(t_attr[k]) then
			t_attr[k] = tempattr[k];
		end
	end
	self.skillSystem:NotifyGourd(t_attr); ----属性加成
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local RoleID = objPlayer:GetRoleID();
	local RoleName = objPlayer:GetName();
	if(temp) then
		CGameApp.GourdBroadCastAddLevelMsg{RoleID = RoleID,RoleName = RoleName,Level = self.Resdata.MendLevel};
	end
	return t_attr;
end
----每天随机翻倍索引
function CGourdSystem:RandAddTimes()
	local dwMax = 0;
	for location,dwProp in pairs(_G.GourdConfig.RandTimeIndexConfig) do
		dwMax = dwMax + dwProp.weightValue
	end
	local dwRes = math.random(1,dwMax)
	local dwCur = 0;
	for location,dwProp in pairs(_G.GourdConfig.RandTimeIndexConfig) do
		dwCur = dwCur + dwProp.weightValue
		if dwRes <= dwCur then
			self.Resdata.AddTimesItemIndex = location;
			break;
		end
	end
end

----获取翻倍数
function CGourdSystem:GetAddTimesNum(Index)
	if(_G.GourdConfig.RandTimeIndexConfig[self.Resdata.AddTimesItemIndex].Index == Index) then
		return _G.GourdConfig.RandTimeIndexConfig[self.Resdata.AddTimesItemIndex].Num;
	end
	return 1;
end

----获取当前熟练度
function CGourdSystem:GetCurSkillValue()
	return self.Resdata.CurSkillValue;
end

----获取当前等级
function CGourdSystem:GetCurMendLevel()
	return self.Resdata.MendLevel;
end
----获的权限
function CGourdSystem:EventGetAuthority(szAuthName)
	if szAuthName == "Gourd" then
		self:UpdateGourdProperty(self.Resdata.MendLevel);
	end
end

