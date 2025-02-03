 --[[
文件：BaseService/Player.lua
类名：CPlayer
功能说明：玩家类
备注：
作者：周华杰
版本：v1.0
修改者：
]] 

_G.CPlayer =  { }; 
--------------------------
--角色信息相关数据
--------------------------
--玩家包含的所有角色
CPlayer.setAllRoleInfo ={};

--角色固定基本信息
CPlayer.sRoleInfo = nil;			--角色信息，玩家模块的基本信息
----------------------------------------------------
--玩家类
----------------------------------------------------
local playerMeta = { __index = CPlayer }
CMemoryDebug:Show("ObjPlayer");

function CPlayer:new(dwAccountID,objDB,dwAdultFlag,dwGold,bIsGM)
	--local obj = objNet;--{};
	local obj = {}; 
	
	obj.objSystemMgr = nil;
	obj.objDBQuery = objDB;
	obj.dwAccountID = dwAccountID;
	--玩家所有的角色
	obj.setAllRoleInfo ={};
	obj.dwRoleCount =0;
	--周兴团--5-4
	obj.dwGold = dwGold;			--玩家的元宝信息
	obj.dwAdultFlag = dwAdultFlag;	--0是未成年人，1是成年人；0将会被列入防沉迷系统
	obj.dwAddicted = 1.0;	--计入防沉迷的收益比例
	obj.bIsGM = bIsGM;
	--Player对象是否已经初始化完成的标识
	obj.isLoadEnd = false;
	
   --下面的属性使用在玩家当前角色上
	--角色固定基本信息
	obj.sRoleInfo 		= SRoleInfo:new();			--角色的固定信息 
	--玩家系统相关数据库操作,私有
 
	obj.objDBOper = CPlayerDBOper:new(objDB,self);	
	for i,v in pairs(CPlayer) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	--setmetatable(obj,playerMeta); 
	CMemoryDebug:AddObject("ObjPlayer", obj);
	return obj;
end;
----------------------------------------------------
--基础相关
----------------------------------------------------
--得到玩家账号ID
function CPlayer:GetAccountID()
	return self.dwAccountID;
end; 

--得到服务器ID
function CPlayer:GetSid() 
	return math.mod(self.dwAccountID,10000);
end; 
--得到玩家数据库,数据库对象：_Database对象
function CPlayer:GetDBQuery()
	return self.objDBQuery;
end;

--玩家创建
function CPlayer:Create()
	--创建系统管理器
	self.objSystemMgr = CPlayerSystems:new(self);
	--读取玩家的角色信息
	--self.dwRoleCount = self.objDBOper:GetAllRoleByUser(self:GetAccountID(),self.setAllRoleInfo)
	-- if self.dwRoleCount == 0 then
		-- CLogSystemManager:game_enter(self,'0','0','0',self:GetIP())
	-- end
    return true;
end;

function CPlayer:SetRoleCount(dwCount)
	self.dwRoleCount = dwCount;
end;

--玩家驱动
function CPlayer:Update(dwInterval)
	if self.objSystemMgr then
		self.objSystemMgr:Update(dwInterval);
	end;
end;

--玩家释放
function CPlayer:Destroy()
	--通知相应的游戏服务器
	-- local objLine = self.setAllGameLine[objPlayer.dwCurLine];
	-- if objLine then
		-- objLine.OnPlayerDestroyMsg{AccountID = self:GetAccountID()};
	-- end;
	--玩家退出线
	CGameLineManager:ExitLine(self); 
	if self.objSystemMgr then --释放系统管理器
		self.objSystemMgr:Destroy();
		self.objSystemMgr = nil;
	end;
end; 
---------------------------------------------
---和当前角色相关的接口
---------------------------------------------
--周兴团--5-4--获取玩家的元宝数量
function CPlayer:GetGold()
	return self.dwGold;
end
--修改玩家的元宝数量，可增可减
function CPlayer:UpdateGold( dwValue )
	self.dwGold = self.dwGold + dwValue;
	if self.dwGold < 0 then
		_info("GoldError!!!", self:GetAccountID(), self.dwGold, dwValue);
		self.dwGold = 0;
	end
	--[[
	if dwValue < 0 then
		CScriptManager:OnGetChargeInfo(_now(),self:GetAccountID(),dwValue)
	end
	--]]
	--在这里进行数据库的保存操作
	CAccountDBQuery:SaveGoldToDB(self.dwAccountID, dwValue);
	local dwDB = CAccountDBQuery:GetGoldByAccountID(self.dwAccountID)
	CLogSystemManager:gold_change(self,dwValue,dwDB,self.dwGold)
	
end
--玩家进行了充值操作
function CPlayer:ChargeGold(dwGold)
	self.dwGold = self.dwGold + dwGold;
	self.objLine.UserChargeGlodMsg{ RoleID = self:GetRoleID(), Gold = dwGold };
end
--判断玩家是否被列入防沉迷系统，返回true和false
function CPlayer:IsInAddicted()
	return self.dwAdultFlag == 0;
end
--更新玩家的防沉迷比例
function CPlayer:UpdateAddicted( dwValue )
	self.dwAddicted = dwValue;
end
--获取玩家的防沉迷比例 0~1.0
function CPlayer:GetAddicted()
	return self.dwAddicted;
end 
---角色固定基本信息
--sInfo:SRoleInfo
function CPlayer:GetInfo()
	return self.sRoleInfo;
end;

function CPlayer:GetIncoID()
	local dwIncoID = self.sRoleInfo.dwIncoID;
	
	if dwIncoID == 0 then
		dwIncoID = self.sRoleInfo.dwDefIncoID;
	end
	
	return dwIncoID;
end;

function CPlayer:SetInfo(sInfo)
	--获取到套装配置sCreateRoleInfo.dwSuitID 
	local sCurInfo = self:GetInfo();
	if not sCurInfo then
		return nil;
	end; 
	sCurInfo.dwRoleID		= sInfo.dwRoleID;
	sCurInfo.szRoleName		= sInfo.szRoleName;
	sCurInfo.dwProf			= sInfo.dwProf;
	sCurInfo.dwSex			= sInfo.dwSex;			--玩家性别
	sCurInfo.dwFace			= sInfo.dwFace;			--玩家脸型
	sCurInfo.dwHair			= sInfo.dwHair;			--玩家发型
	
	sCurInfo.dwDress		= sInfo.dwDress;		--衣服
	sCurInfo.dwHand			= sInfo.dwHand;		--护手
	sCurInfo.dwShoe			= sInfo.dwShoe;		--鞋子
	sCurInfo.dwArms			= sInfo.dwArms;		--武器
	
	sCurInfo.dwIncoID		= sInfo.dwIncoID;
	sCurInfo.dwDefIncoID	= sInfo.dwDefIncoID or sInfo.dwIncoIDTemp or 0;
	sCurInfo.dwDefFace = sInfo.dwDefFace;
	sCurInfo.dwDefHair = sInfo.dwDefHair;
	sCurInfo.dwDefHand = sInfo.dwDefHand;
	sCurInfo.dwDefDress = sInfo.dwDefDress;
	sCurInfo.dwDefShoe = sInfo.dwDefShoe;
	
	sCurInfo.dwLevelCurExp = sInfo.dwLevelCurExp;
	sCurInfo.dwLevelMaxExp = sInfo.dwLevelMaxExp;
	
	sCurInfo.dwDressLevel		= sInfo.dwDressLevel;		--衣服
	sCurInfo.dwHandLevel		= sInfo.dwHandLevel;		--护手
	sCurInfo.dwShoeLevel		= sInfo.dwShoeLevel;		--鞋子
	sCurInfo.dwArmsLevel		= sInfo.dwArmsLevel;		--武器
	--sInfo.dwHorseID         = Row.dwHorseID;    --坐骑 
	sCurInfo.dwNewRoleFlag		= sInfo.dwNewRoleFlag;
	
	sCurInfo.dwExp			= sInfo.dwExp;			--角色经验
	----------------add by 段磊磊 2012-4-9
	sCurInfo.tmDownlineTime		= sInfo.tmDownlineTime;			--下线时间
	sCurInfo.tmCreateRoleTime = sInfo.tmCreateRoleTime or _now();
	if (not sCurInfo.tmUplineTime) or (sCurInfo.tmUplineTime < 1) then
		sCurInfo.tmUplineTime = _now();
	end
	--add end
	sCurInfo.dwLevel = sInfo.dwLevel; 
	sCurInfo.setActSuitList = sInfo.setActSuitList;
	sCurInfo.szIP = sInfo.szIP
	sCurInfo.szUF = sInfo.szUF
	sCurInfo.bOnline = true
	
	return sCurInfo;
end;
function CPlayer:SaveInfo(sInfo)
	local sInfo = self:SetInfo(sInfo);
	if sInfo then
		self.objDBOper:SaveRoleInfo(sInfo);
	end;
end;
 
--得到角色ID
function CPlayer:GetRoleID()
	return self.sRoleInfo.dwRoleID;
end;
function CPlayer:SetIP(dwIP)
	self.dwIPAddr = dwIP
end
function CPlayer:GetIP()
	return self.dwIPAddr or 0;
end
function CPlayer:SetUF(szUF)
	self.szUF = dwUF
end
function CPlayer:GetUF()
	return self.szUF or '0';
end
--获取指定系统
function CPlayer:GetSystem(szSystemName)
	if not self.objSystemMgr then
		return nil;
	end;
	return self.objSystemMgr:GetSystem(szSystemName);
end;
  
function CPlayer:GetRoleCount()
	return self.dwRoleCount;
end;

--更新玩家经验和等级
function CPlayer:UpdateRoleExp(dwExp,dwLevel)
	self.sRoleInfo.dwExp = dwExp;
	self.sRoleInfo.dwLevel = dwLevel;
	self.objDBOper:SaveRoleExpInfo(dwExp,self:GetRoleID());
end; 
--获取玩家等级
function CPlayer:GetLevel()
	return self.sRoleInfo.dwLevel;
end; 
--获取玩家经验
function CPlayer:GetExp()
	return self.sRoleInfo.dwExp;
end;
--获取玩家名称
function CPlayer:GetName()
	return self.sRoleInfo.szRoleName;
end;
--------------------------------------
--私有成员函数
--------------------------------------


--添加发送到GS的数据
function CPlayer:SetLineData(szSystemName,Data)
	local dwAccountID = self:GetAccountID()
	CTransitManager:AddPlayerData(dwAccountID,szSystemName,Data)
end
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--玩家数据库类
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
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
--用suittable翻译为DBstr
local function MakeStringByTable(tbList)
	local str = "";
	for n,v in pairs(tbList)do
		str = str..v..";";
	end
	return str;
end;

--玩家模块的数据库操作类
_G.CPlayerDBOper = {}; 
function CPlayerDBOper:new(objDB,objPlayer)
    local obj = {};
	setmetatable(obj,{__index = CPlayerDBOper});
	obj.objDBQuery = objDB;
	obj.objPlayer = objPlayer;
	return obj;
end;


--单独保存经验
function CPlayerDBOper:SaveRoleExpInfo(dwExp,dwRoleID)
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Info');
	SqlCmd.Wheres.dwRoleID			= dwRoleID;
	SqlCmd.Fields.dwTotalExp		= dwExp;	
	if not SqlCmd:execute() then
		_info("Save Role To DB Error");
		return false;
	end;
	return true;
end;

function CPlayerDBOper:SaveRoleInfo(sInfo)
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Info');
	SqlCmd.Wheres.dwRoleID			= sInfo.dwRoleID;
	
	SqlCmd.Fields.dwAccountID		= dwAccountID;
	SqlCmd.Fields.szRoleName		= sInfo.szRoleName;		--玩家名字
	SqlCmd.Fields.dwSex				= sInfo.dwSex;			--玩家性别
	SqlCmd.Fields.dwFace			= sInfo.dwFace;			--玩家脸型
	SqlCmd.Fields.dwHair			= sInfo.dwHair;			--玩家发型
	SqlCmd.Fields.dwProf			= sInfo.dwProf;			--玩家职业
	if sInfo.dwIncoID == 0 then 
		sInfo.dwIncoID = sInfo.dwProf * 1000 + math.mod(sInfo.dwDefHair,10000) - 1000
	end
	SqlCmd.Fields.dwIncoID 			= sInfo.dwIncoID;
--获取到套装配置sCreateRoleInfo.dwSuitID

	SqlCmd.Fields.dwDress			= sInfo.dwDress;		--衣服
	SqlCmd.Fields.dwHand			= sInfo.dwHand;			--护手
	SqlCmd.Fields.dwShoe			= sInfo.dwShoe;			--鞋子
	SqlCmd.Fields.dwArms			= sInfo.dwArms;			--武器 = 
	
	SqlCmd.Fields.dwDressLevel		= sInfo.dwDressLevel;	--衣服
	SqlCmd.Fields.dwHandLevel		= sInfo.dwHandLevel;	--护手
	SqlCmd.Fields.dwShoeLevel		= sInfo.dwShoeLevel;	--鞋子
	SqlCmd.Fields.dwArmsLevel		= sInfo.dwArmsLevel;	--武器 = 
	--SqlCmd.Fields.dwHorseID		= sInfo.dwHorseID or 0;	--坐骑
	
	SqlCmd.Fields.dwDefFace			= sInfo.dwDefFace;		--玩家脸型
	SqlCmd.Fields.dwDefHair			= sInfo.dwDefHair;		--玩家发型
	SqlCmd.Fields.dwDefDress		= sInfo.dwDefDress;		--衣服
	SqlCmd.Fields.dwDefHand			= sInfo.dwDefHand;		--护手
	SqlCmd.Fields.dwDefShoe			= sInfo.dwDefShoe;		--鞋子
	SqlCmd.Fields.dwIncoIDTemp		= sInfo.dwDefIncoID;    --IconID
	
	SqlCmd.Fields.tmDownlineTime	= _now();				--下线时间	
	SqlCmd.Fields.tmUplineTime		= sInfo.tmUplineTime or 0;--上线时间	
	SqlCmd.Fields.szIP				= sInfo.szIP			--ip
	SqlCmd.Fields.bOnline			= sInfo.bOnline			--在线标志
	
	SqlCmd.Fields.strActSuit		= MakeStringByTable(sInfo.setActSuitList);
	SqlCmd.Fields.dwNewRoleFlag		= sInfo.dwNewRoleFlag;
	
	local bRet ,szSql = SqlCmd:execute();
	if not bRet then
		_info("Save Role To DB Error",szSql);
		return false;
	end;
	return true;
end; 
