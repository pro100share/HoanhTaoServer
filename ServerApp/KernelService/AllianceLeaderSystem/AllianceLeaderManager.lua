--[[
	盟主系统 KS
	周长沙
--]]

_G.CAllianceLeaderManager = CSingle:new();
CSingleManager:AddSingle(CAllianceLeaderManager);

CAllianceLeaderManager.AllianceLeaderInfo = {}
CAllianceLeaderManager.Search = {}
----------------------------------------------------------
local function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
	   if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
	   end
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
	   nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end
---------------------------------------------------------
local CInfo = {}
function CInfo:new()
	local obj = setmetatable({},{__index=CInfo});
	obj.avatarInfoMsg = {};
	obj.szGuildName = "";
	obj.dwType = 0;
	obj.Text = {};
	--obj.szName = avatarInfoMsg.szRoleName;
	return obj;
end
function CInfo:Pack()
	local str = ""
	if nil then
	for k,v in pairs(self.avatarInfoMsg) do
		if k=="setActSuitList" then
			local stv = ""
			for k2,v2 in pairs(v) do
				stv = stv..tostring(k).."#"..tostring(v).."#"
			end
			str = str..tostring(k)..";"..stv..";";
		else
			str = str..tostring(k)..";"..tostring(v)..";";
		end
	end
	end
	str = json.encode(self.avatarInfoMsg)
	return str
end
function CInfo:UnPack(str)
	local t = {}
	if nil then
		local temp = Split(str,";")
		for i=1,#temp,2 do
			if temp[i] ~= "setActSuitList" then
				t[temp[i]] = tonumber(temp[i+1]) or temp[i+1]
			else
				local temp2 = Split(temp[i+1] or "","#")
				local t2 = {}
				for j=1,#temp2,2 do
					t2[temp2[j]] = tonumber(temp2[j+1]) or temp2[j+1]
				end
				t[temp[i]] = t2
			end
		end
	end
	t = json.decode(str)
	self.avatarInfoMsg = t;
end

function CInfo:TPack()
	local str = ""
	str = json.encode(self.Text)
	return str
end
function CInfo:TUnPack(str)
	local t = {}
	t = json.decode(str)
	self.Text = t;
end

----------------------------------------------------------
function CAllianceLeaderManager:Create()
	self.objDB = CPlayerDBQuery:GetDBQuery()
	self.szCmdDel = [[delete from "T_Alliance_Leader" where "dwType" = $1;]];
	self.szCmdInsert = [[insert into "T_Alliance_Leader" values($1,$2,$3,$4);]];
	self.szCmdClear = [[delete from "T_Alliance_Leader";]];
	self.szCmdRead = [[select * from "T_Alliance_Leader"]];
	self.szCmdUpdate = [[update "T_Alliance_Leader" set "szText"=$1 where "dwType" = $2;]];
	self.cfg = _G.AllianceLeaderConfig
	local TimeInfo = {dwWeek = nil, dwTime = nil}
	for k,v in pairs(self.cfg.Clear.Week) do
		TimeInfo.dwWeek = tostring(v);
		TimeInfo.dwTime = self.cfg.Clear.szTime
		_G.CAlarmClock:AddTask(TimeInfo, _G.CAlarmTaskCycleType.eWeek, 1, 0, function() self:OnRecvClear() end, {}, true);
	end
	self:DBRead()
	return true;
end;

function CAllianceLeaderManager:Update()
	return true;
end;

function CAllianceLeaderManager:Destroy()

end;
------------------------------------------------------------
--盟主战结束
function CAllianceLeaderManager:OnWarEnd(dwRoleID,MateRoleID)
	self:SetTypeInfo(1,dwRoleID)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID or 0)
	
	if not objPlayer then
		local f = function()
			CScriptManager:SystemNotice(AllianceLeaderConfig.Notice[2])
		end
		CTimer:AddTimer(60*1000,false,f)
		return 1;
	end
	CGuildManager:OnGainEmperor(CGuildManager:GetGuildIDByRoleID(dwRoleID))
	local f = function()
		CScriptManager:SystemNotice(string.format(AllianceLeaderConfig.Notice[1],objPlayer:GetInfo().szRoleName or "??"))
	end
	CTimer:AddTimer(60*1000,false,f)
	objPlayer.AllianceLeaderSetMsg{Name="",Type=1}
	--获得结婚对象
	do return end;
	if MateRoleID==0 then return end;
	self:SetTypeInfo(2,MateRoleID)
	local Mate = CPlayerManager:GetPlayerByRoleID(MateRoleID or 0)
	if not Mate then return end;
	Mate.AllianceLeaderSetMsg{Name="",Type=2}
end
--------------------------------------------------------------
--获取盟主公会名
function CAllianceLeaderManager:GetGuildName()
	local Info = self.AllianceLeaderInfo[1]
	if not Info then return "" end;
	return Info.szGuildName
end
--------------------------------------------------------------
--读取数据库
function CAllianceLeaderManager:DBRead()
	local Infos = self.objDB:execute(self.szCmdRead)
	if not Infos then return end;
	for i=1,#Infos do
		local Info = CInfo:new()
		Info.szGuildName = Infos[i].szGuildName;
		Info.dwType = Infos[i].dwType;
		Info:UnPack(Infos[i].szAvaInfo)
		Info:TUnPack(Infos[i].szText)
		self.AllianceLeaderInfo[Info.dwType] = Info
	end
end

--写入数据库
function CAllianceLeaderManager:DBWrite(dwType,dwOpera)
	if (not dwOpera) or (dwOpera == 0) then
		return self.objDB:execute(self.szCmdDel,dwType)
	end
	local Info = self.AllianceLeaderInfo[dwType]
	if not Info then return end;
	return self.objDB:execute(self.szCmdInsert,Info.dwType,Info.szGuildName,Info:Pack(),Info:TPack())
end

--清除数据
function CAllianceLeaderManager:DBClear()
	return self.objDB:execute(self.szCmdClear)
end

--更新数据库
function CAllianceLeaderManager:DBUpdate(dwType)
	local Info = self.AllianceLeaderInfo[dwType]
	if not Info then return end;
	return self.objDB:execute(self.szCmdUpdate,Info:TPack(),Info.dwType)
end
--------------------------------------------------------------
--获取盟主信息
function CAllianceLeaderManager:GetAllianceLeaderInfo()
	return self.AllianceLeaderInfo
end
--判断是不是盟主
function CAllianceLeaderManager:IsLeader(szName)
	local Info = self.AllianceLeaderInfo[1]
	if not Info then return false end;
	return Info.avatarInfoMsg.szRoleName == szName
end
--清除某个职位的信息
function CAllianceLeaderManager:ClearInfo(dwType)
	self.AllianceLeaderInfo[dwType] = nil
	self:DBWrite(dwType)
end
--设置某个职位
function CAllianceLeaderManager:SetTypeInfo(dwType,dwRoleID)
	local objLeader = nil
	local dwLeaderID = 0
	if dwType~=1 then
		objLeader = CPlayerManager:GetPlayerByRoleName(self.AllianceLeaderInfo[1].avatarInfoMsg.szRoleName)
		if objLeader then
			dwLeaderID = objLeader:GetRoleID()
		end
	end
	if (not dwRoleID) or (dwRoleID==0) then
		local Info = self.AllianceLeaderInfo[dwType]
		local objPlayer = nil
		if Info then
			objPlayer = CPlayerManager:GetPlayerByRoleName(Info.avatarInfoMsg.szRoleName)
		end
		local dwRoleID = 0
		if objPlayer then
			dwRoleID = objPlayer:GetRoleID()
		end
		if self.AllianceLeaderInfo[1] then
			CScriptManager:ScriptChatNoticeAll(SysStringConfigInfo[6001047027],7,bSystem,
				{
					{
						szFunStr=self.AllianceLeaderInfo[1].avatarInfoMsg.szRoleName,
						dwFunId=27,
						param=
						{
							dwLeaderID,
							self.AllianceLeaderInfo[1].avatarInfoMsg.szRoleName
						}
					};
					{
						szFunStr=self.AllianceLeaderInfo[dwType].avatarInfoMsg.szRoleName,
						dwFunId=27,
						param=
						{
							dwRoleID,
							self.AllianceLeaderInfo[dwType].avatarInfoMsg.szRoleName
						}
					}
				}
			)
		end
		self:ClearInfo(dwType)
		return 0,objPlayer;
	end
	local objPlayer = CPlayerManager:GetPlayerByRoleID(dwRoleID)
	if (not objPlayer) and (dwType~=2) then
		return 3;
	end
	if objPlayer then
		local avatarInfoMsg = SPlayerAvatarViewMsg:new();
		local tabPlayerInfo = objPlayer:GetInfo();
		for k,v in pairs(avatarInfoMsg) do
			avatarInfoMsg[k] = tabPlayerInfo[k];
		end
		avatarInfoMsg.dwRoleID = objPlayer:GetRoleID()
		local Info = CInfo:new()
		Info.avatarInfoMsg = avatarInfoMsg
		Info.dwType = dwType
		Info.szGuildName = CGuildManager:GetGuildNameByRoleID(dwRoleID) or ""
		self.AllianceLeaderInfo[dwType] = Info
		self:DBWrite(dwType,dwRoleID)
		--local f = function()
			--objPlayer.PlayerShowTextOnKSAskForInfoMsg{Type=dwType;RoleID=dwRoleID}
		--end
		--CDelayerManager:Delay(eInterval._10sec,f)
	else
		local avatarInfoMsg = self:GetPlayerShowInfo(dwRoleID)
		local Info = CInfo:new()
		Info.avatarInfoMsg = avatarInfoMsg
		Info.dwType = dwType
		Info.szGuildName = CGuildManager:GetGuildNameByRoleID(dwRoleID) or ""
		self.AllianceLeaderInfo[dwType] = Info
		self:DBWrite(dwType,dwRoleID)
	end
	if dwType == 3 or dwType == 4 then 
		CScriptManager:ScriptChatNoticeAll(SysStringConfigInfo[6001047026],7,bSystem,
			{{szFunStr=self.AllianceLeaderInfo[1].avatarInfoMsg.szRoleName,dwFunId=27,param={dwLeaderID,self.AllianceLeaderInfo[1].avatarInfoMsg.szRoleName}};
			{szFunStr=self.AllianceLeaderInfo[dwType].avatarInfoMsg.szRoleName,dwFunId=27,param={dwRoleID,self.AllianceLeaderInfo[dwType].avatarInfoMsg.szRoleName}}}
		)
	end
	return 0
end
--清除所有职位信息
function CAllianceLeaderManager:Clear()
	self.AllianceLeaderInfo = {}
	self:DBClear()
end
-----------------------------------------------------------------
--收到盟主战结束消息
function CAllianceLeaderManager:OnRecvWarEnd(dwRoleID,MateRoleID)
	self:Clear()
	self:OnWarEnd(dwRoleID,MateRoleID)
	self:SendSetInfo()
end
--收到设置某个职位消息
function CAllianceLeaderManager:OnRecvSetInfo(dwType,szRoleName)
	if szRoleName == "" then--删除
		local dwRes,objPlayer = self:SetTypeInfo(dwType,0)
		self:SendSetInfo()
		return dwRes,objPlayer
	end
	for k,v in pairs(self.AllianceLeaderInfo) do
		if v.avatarInfoMsg.szRoleName == szRoleName then
			return 2--已经有职位
		end
	end
	local objPlayer = CPlayerManager:GetPlayerByRoleName(szRoleName)
	if not objPlayer then return 3 end;--玩家不存在或不在线
	local dwRoleID = objPlayer:GetRoleID()
	local dwRes = self:SetTypeInfo(dwType,dwRoleID)
	self:SendSetInfo()
	return dwRes,objPlayer
end
--收到清除所有职位消息
function CAllianceLeaderManager:OnRecvClear()
	local Info = self.AllianceLeaderInfo
	self:Clear()
	self:SendSetInfo()
	for k,v in pairs(Info) do
		local objPlayer =  CPlayerManager:GetPlayerByRoleName(v.avatarInfoMsg.szRoleName)
		if objPlayer then
			objPlayer.AllianceLeaderSetMsg{Name="",Type=0}
		end
	end
	if Info[1] then
		local dwGuildID = CGuildManager:GetGuildIDByRoleID(Info[1].avatarInfoMsg.dwRoleID)
		CGuildManager:OnLostEmperor(dwGuildID)
	end
end
--收到盟主上线消息
function CAllianceLeaderManager:OnRecvEnterGame()
	for k,v in pairs(CGameLineManager:GetAllLine()) do
		v.AllianceLeaderOnRecvEnterGameMsg{Name=self.AllianceLeaderInfo[1].avatarInfoMsg.szRoleName}
	end
end

--收到盟主称号
function CAllianceLeaderManager:OnRecvShowText(dwRoleID,dwType,Info)
	local Leader = self.AllianceLeaderInfo[dwType]
	if not Leader then return end;
	Leader.Text = Info
	self:DBUpdate(dwType)
	local AllLine = CGameLineManager:GetAllLine()
	for dwLineID,objLine in pairs(AllLine) do
		objLine.AllianceLeaderShowTextMsg{RoleID=dwRoleID;Type=dwType;Info=Info}
	end
end

--收到搜索请求
function CAllianceLeaderManager:OnRecvSearch(szStr)
	self.Search = {}
	for dwRoleID,objPlayer in pairs(CPlayerManager.setAllPlayerByRoleID) do
		local szName = objPlayer.sRoleInfo.szRoleName
		local bHave = false
		for k,v in pairs(self.AllianceLeaderInfo) do
			if v.avatarInfoMsg.szRoleName == szName then
				bHave = true
			end
		end
		if not bHave then
			if string.find(szName,szStr) or string.find(szStr,szName) then
				local dwLevel = objPlayer.sRoleInfo.dwLevel
				local dwProf = objPlayer.sRoleInfo.dwProf
				local Info = {}
				Info.dwRoleID = dwRoleID
				Info.szName = szName
				Info.dwLevel = dwLevel
				Info.dwProf = dwProf
				table.insert(self.Search,Info)
			end
		end
	end
	self:OnRecvGetPage(1)
end

--收到请求某页(1 页 5 个)
function CAllianceLeaderManager:OnRecvGetPage(dwIndex)
	local dwIndex = dwIndex
	local dwMax = math.ceil((#self.Search)/5)
	if dwIndex < 1 then
		dwIndex = 1
	end
	if dwIndex>dwMax then
		dwIndex = dwMax
	end
	
	local Page = {}
	local dwStart = (dwIndex-1)*5 + 1
	local dwEnd = dwIndex * 5
	for i=dwStart,dwEnd do
		local Info = self.Search[i]
		if Info then
			table.insert(Page,Info)
		end
	end
	Page.dwIndex = dwIndex
	Page.dwMax = dwMax
	
	local objPlayer =  CPlayerManager:GetPlayerByRoleName(self.AllianceLeaderInfo[1].avatarInfoMsg.szRoleName)
	objPlayer.AllianceLeaderGetPageMsg{Page=Page}
end
------------------------------------------------------------------
--发送职位更新的消息
function CAllianceLeaderManager:SendSetInfo(objLine)
	if objLine then
		objLine.AllianceLeaderUpdateMsg{Info=self.AllianceLeaderInfo}
		return
	end
	local AllLine = CGameLineManager:GetAllLine()
	for dwLineID,objLine in pairs(AllLine) do
		objLine.AllianceLeaderUpdateMsg{Info=self.AllianceLeaderInfo}
	end
end

--------------------------------------------------------------------
--将suit的DBstr翻译为table
local function MakeTableByString(str)
	local tb = {};
	local lastIndex = 0;
	
	if not str then
		return tb;
	end
	
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str,";",nextIndex);
		if not lastIndex then
			break;
		end
		
		local strcut = string.sub(str, nextIndex, lastIndex - 1);
		local dwNumber = tonumber(strcut);
		
		table.insert(tb,dwNumber);
	end
	
	return tb;
end;
function CAllianceLeaderManager:GetPlayerShowInfo(dwRoleID)
	local objDBQuery = CPlayerDBQuery.objDBQuery
	if not objDBQuery then return end;
	local dbres = objDBQuery:execute('select * from "T_Role_Info" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
	if not dbres then
		_info("dbres nll")
		return nil;
	end;
	local Row = dbres[1];
	if Row == nil then 
		_info("Row nll")
		return nil;
	end;
	local sInfo = SRoleListShowInfo:new();
	
	sInfo.dwRoleID 			= Row.dwRoleID;			--角色ID
	sInfo.szRoleName		= Row.szRoleName;		--玩家名字
	sInfo.dwSex				= Row.dwSex;		--玩家性别
	sInfo.dwFace			= Row.dwFace;		--玩家脸型
	sInfo.dwHair			= Row.dwHair;		--玩家发型
	sInfo.dwProf 			= Row.dwProf;	--玩家职业
	sInfo.dwIncoID			= Row.dwIncoID;
--获取到套装配置sCreateRoleInfo.dwSuitID
	sInfo.dwDress			= Row.dwDress;		--衣服
	sInfo.dwHand			= Row.dwHand;		--护手
	sInfo.dwShoe			= Row.dwShoe;		--鞋子
	sInfo.dwArms			= Row.dwArms;		--武器
	
	sInfo.dwDressLevel		= Row.dwDressLevel;		--衣服
	sInfo.dwHandLevel		= Row.dwHandLevel;		--护手
	sInfo.dwShoeLevel		= Row.dwShoeLevel;		--鞋子
	sInfo.dwArmsLevel		= Row.dwArmsLevel;		--武器
	--sInfo.dwHorseID         = Row.dwHorseID;    --坐骑
	
	sInfo.dwDefFace			= Row.dwDefFace;		--玩家脸型
	sInfo.dwDefHair			= Row.dwDefHair;		--玩家发型
	sInfo.dwDefDress		= Row.dwDefDress;		--衣服
	sInfo.dwDefHand			= Row.dwDefHand;		--护手
	sInfo.dwDefShoe			= Row.dwDefShoe;		--鞋子
	
	sInfo.dwExp			= Row.dwTotalExp;			--角色经验
	----------------add by 段磊磊 2012-4-9
	sInfo.tmDownlineTime		= Row.tmDownlineTime;			--下线时间
	sInfo.tmUplineTime			= _now();			--上线时间
	sInfo.tmCreateRoleTime = Row.tmCreateRoleTime;
	--add end
	sInfo.setActSuitList = MakeTableByString(Row.strActSuit);
	
	sInfo.dwLevel = RoleUpLevelConfig:CompeteLevel(sInfo.dwExp,sInfo);
	return sInfo;
end



























