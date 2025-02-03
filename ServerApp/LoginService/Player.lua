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

----------------------------------------------------
--玩家类
----------------------------------------------------

function CPlayer:new(dwAccountID,objDB,dwAdultFlag,dwGold,bIsGM)
	local obj = {}; 
	
	obj.objDBQuery = objDB;
	obj.dwAccountID = dwAccountID;
	--玩家所有的角色
	obj.setAllRoleInfo ={};
	obj.dwRoleCount =0;
	--周兴团--5-4
	obj.dwGold = dwGold;			--玩家的元宝信息
	--print("new player gold", dwGold);
	obj.dwAdultFlag = dwAdultFlag;	--0是未成年人，1是成年人；0将会被列入防沉迷系统
	obj.dwAddicted = 1.0;	--计入防沉迷的收益比例
	obj.bIsGM = bIsGM;
	
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
function CPlayer:Create(IP,UF)
	--读取玩家的角色信息
	self.dwRoleCount = self.objDBOper:GetAllRoleByUser(self:GetAccountID(),self.setAllRoleInfo)
    --设置IP
	self:SetIP(IP);
	self:SetUF(UF);
	if self.dwRoleCount == 0 then
        CKSApp.PlayerLoginMsg{
            AccountID = self:GetAccountID();
            IP = self:GetIP();
			UF = self:GetUF();
        }
	end
    return true;
end;

function CPlayer:SetIP(dwIP)
	self.dwIPAddr = dwIP
end

function CPlayer:GetIP()
	return self.dwIPAddr;
end
function CPlayer:SetUF(szUF)
	self.szUF = szUF
end

function CPlayer:GetUF()
	return self.szUF or '0';
end

function CPlayer:GetRoleCount()
	return self.dwRoleCount;
end;

--------------------------------------
--私有成员函数
--------------------------------------

--添加一个角色
function CPlayer:AddRole(sInfo)
	if self.setAllRoleInfo[sInfo.dwRoleID] then
	    return false;
	end;
	self.setAllRoleInfo[sInfo.dwRoleID] = sInfo;
	return true;
end;
--删除一个角色
function CPlayer:DelRole(dwRoleID)
	self.setAllRoleInfo[dwRoleID] = nil;
end;
--得到一个角色
--return :SRoleListShowInfo
function CPlayer:GetRole(dwRoleID)
	return self.setAllRoleInfo[dwRoleID];
end;
--创建角色
--参数 sCreateRoleInfo :SCreateInfo
--替换字符串中的所有敏感词，返回替换后的字符串和字符串中包含的敏感词数量
_G.CSensitiveWordSystem = {};
function CSensitiveWordSystem:Replace( strText, replace)
	local wordTable = _G.SensitiveCharacters;
	replace = replace or "*";
	local dwCount = 0;
	local dwNum = 0;
	for k,word in ipairs(wordTable) do
		strText, dwNum = string.gsub(strText, word, replace);
		if dwNum ~= 0 then
			dwCount = dwCount + dwNum;
		end
	end
	return strText, dwCount;
end

function CPlayer:CreateRoleRequest(sCreateRoleInfo,UF)
	local resStr = sCreateRoleInfo.szName;
	resStr = CSensitiveWordSystem:Replace(resStr, "")
	sCreateRoleInfo.szName = resStr;
	sCreateRoleInfo.szName =  string.format(SysStringConfigInfo[102],self:GetSid(),sCreateRoleInfo.szName);
	local bRet = self.objDBOper:RoleNameIsExists(sCreateRoleInfo.szName); 
	if bRet then
		_info('Role Name Is Exists',sCreateRoleInfo.szName);	
		return 1,nil;
	end;
	local dwRoleCount = 0;
	for i ,v in pairs(self.setAllRoleInfo) do
		dwRoleCount = dwRoleCount +1;
	end;
	if dwRoleCount >= 1 then
		_info('Role Full');	
		return 5,nil;
	end;
	 
	--创建内存角色
	local sInfo = SRoleListShowInfo:new(); 
	sInfo.szRoleName		= sCreateRoleInfo.szName;		--玩家名字
	sInfo.dwSex				= sCreateRoleInfo.dwSex;		--玩家性别 
	sInfo.dwProf 			= sCreateRoleInfo.dwProf;	    --玩家职业
	--获取到套装配置sCreateRoleInfo.dwSuitID
	sInfo.dwIncoID			= sCreateRoleInfo.dwIncoID or 0; 
	sInfo.dwDefIncoID       = sCreateRoleInfo.dwDefIncoID or 0; 
	local ProfConfig = CreateRoleConfig.ProfConfig[sInfo.dwProf];
	if not ProfConfig then
		_info("No Prof Info ProfConfig",sInfo.dwProf);
		return -1,nil;
	end;
	
	sInfo.dwFace			= 0;
	sInfo.dwHair			= 0;
	
	sInfo.dwDress			= 0;		--衣服
	sInfo.dwHand			= 0;		--护手
	sInfo.dwShoe			= 0;		--鞋子
	sInfo.dwArms			= 0; --ProfConfig.ArmsModelID;		--武器开始的时候没有武器
	sInfo.dwHorseID         = 0;		--坐骑为空
	
	sInfo.dwDressLevel		= 0;		--衣服
	sInfo.dwHandLevel		= 0;		--护手
	sInfo.dwShoeLevel		= 0;		--鞋子
	sInfo.dwArmsLevel		= 0;		--武器
	
	sInfo.dwDefFace 		= sCreateRoleInfo.dwFace;		--玩家脸型
	sInfo.dwDefHair 		= sCreateRoleInfo.dwHair;		--玩家发型
	
	sInfo.dwDefDress	    = ProfConfig.DefBodyModelID;		--衣服
	sInfo.dwDefHand			= ProfConfig.DefHandModelID;		--护手
	sInfo.dwDefShoe			= ProfConfig.DefFeetModelID;		--鞋子 
	sInfo.dwExp				= 0;			--角色当前总经验  
	sInfo.dwLevel			= 0;			--角色等级
	sInfo.dwLevelMaxExp 	= 0;
	sInfo.dwLevelCurExp 	= 0;
	sInfo.dwNewRoleFlag		= 1;
	
	--插入数据库
	local nRetCode,dwRoleID = self.objDBOper:CreateRole(self:GetAccountID(),sInfo);
	if not nRetCode or dwRoleID == 0 then
		_info('Create Role Error by DB');--	数据库创建角色失败
		sInfo = nil;
		return -1,nil;
	end;
	sInfo.dwRoleID = dwRoleID;
	
	if not self:AddRole(sInfo) then
		_info('Add Role Error ');
		sInfo = nil;
		return -1,nil;
	end;
	
	--将信息发送到客户端
    if not self:SendListShowInfo(sInfo.dwRoleID,true) then
		_info('send Show Info Error') ;
		self:DelRole();
		return -1,nil;
	end;

	if UF=="" then
		UF = nil
	end
    
	return 0,sInfo;
end;

--读取玩家所有角色
function CPlayer:ReadAllRole()
	self.objDBOper:GetAllRoleByUser(self:GetAccountID(),self.setAllRoleInfo)
	local dwRoleCount = 0;	
	local nearTime = 0;
	local nearRoleID = 0;
    for id,RoleInfo in pairs(self.setAllRoleInfo) do
        if RoleInfo.tmDownlineTime and RoleInfo.tmDownlineTime >= nearTime then
            nearTime = RoleInfo.tmDownlineTime;
            nearRoleID = id;
        end;
    end;
    
    for I,Role in pairs(self.setAllRoleInfo) do
        local dwRoleID = I;
        if dwRoleID ~= 0 then
            if nearRoleID == dwRoleID then
                self:SendListShowInfo(dwRoleID,true);
            else
                self:SendListShowInfo(dwRoleID,false);
            end;
            dwRoleCount = dwRoleCount + 1;
        end;
    end;
    self.OnRoleInfoCompleteMsg{RoleCount = dwRoleCount};
end; 

--玩家选择了一个角色
function CPlayer:SelectRole(dwRoleID)
	--获取信息并保存
    self.sRoleInfo = self:GetRole(dwRoleID); --从数据库将角色信息读出来:
	if not self.sRoleInfo then
		self:SendSelectRoleResult(dwRoleID,-1,"");
		return;
	end;
	self:SendSelectRoleResult(dwRoleID,0,self.sRoleInfo.szRoleName);
end;

--记录删除的角色
function CPlayer:RecordInfo(dwRoleID, operFlag)
	self.objDBOper:RecordDelInfo(self, dwRoleID, operFlag);
end;
--销毁一个角色
function CPlayer:DeleteRoleInfo(dwRoleID)
    CDeleteCall:DoDelete(dwRoleID);
	self.objDBOper:PinRoleInfo(self, dwRoleID);
	self:DelRole(dwRoleID)
end;

--发送创建角色的结果
function CPlayer:SendCreateRoleResult(dwRoleID ,szRoleName,nResultCode)
	self.OnCreateRoleRtMsg{
        ResultCode  = nResultCode ,		--返回编码
        RoleID      = dwRoleID,			--刚刚创建的角色ID
        RoleName    = szRoleName,		--刚刚创建的角色名
	};
end;

local forbidClientProp = {
	dwHorseID		= true;
	dwSex			= true;
	dwGold			= true;
	dwBindGold		= true;
	dwMoney			= true;
	dwExp			= true;
	dwLevelMaxExp	= true;
	dwLevelCurExp	= true;
	tmDownlineTime	= true;
	tmUplineTime	= true;
}
----设置模型列表  (以后又有模型就在这里增加)
function CPlayer:AddModelList(sInfo,dwRoleID)
	sInfo.dwModelList = {};
	local dwGourdID = self.objDBOper:GetGourdModelID(dwRoleID);  ----增加的模型ID
	self:SetModelID(sInfo.dwModelList,dwGourdID);
end
----设置模型iD
function CPlayer:SetModelID(ModelList,modelID)
	if(ModelList[modelID]) then
		_info("Error modelID repeat",modelID);
		return;
	end
	ModelList[modelID] = modelID;
end
--发送玩家列表显示的信息
function CPlayer:SendListShowInfo(dwRoleID,bIsDefine)
	local sInfo = self:GetRole(dwRoleID);
	if sInfo == nil then
		return false;
	end; 
	self:AddModelList(sInfo,dwRoleID);
	local tbSendInfo = {};
	for n,v in pairs(sInfo)do
		if not forbidClientProp[n] then
			local key = GetAttrNameToIndex(n);
			if key then
				tbSendInfo[key] = v;
			end
		end;
	end
	
	self.OnRoleListShowInfoMsg{
		RoleListShowInfo = tbSendInfo,
		IsDefRole =bIsDefine
	};
	return true;
end;

function CPlayer:SendSelectRoleResult(dwRoleID, nResultCode,szRoleName)
	self.OnSelectRoleRtMsg{
		RoleID = dwRoleID,
		ResultCode = nResultCode,
		RoleName = szRoleName,
	};
end;

function CPlayer:GetRoleID()
	return self.sRoleInfo.dwRoleID;
end;

--获取对象类型
function CPlayer:GetObjType()
	return enEntType.eEntType_Player;
end 

--添加发送到GS的数据
function CPlayer:SetLineData(szSystemName,Data)
	local dwAccountID = self:GetAccountID()
	--CTransitManager:AddPlayerData(dwAccountID,szSystemName,Data)
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

--玩家模块的数据库操作类
_G.CPlayerDBOper = {}; 
function CPlayerDBOper:new(objDB,objPlayer)
    local obj = {};
	setmetatable(obj,{__index = CPlayerDBOper});
	obj.objDBQuery = objDB;
	obj.objPlayer = objPlayer;
	return obj;
end;

--获取玩家所有的用户
--sInfo:SRoleListShowInfo
function CPlayerDBOper:GetAllRoleByUser(dwAccuntID,setAllUser)
	local dbres = self.objDBQuery:execute('select * from "T_Role_Info" where "dwAccountID" = $1',dwAccuntID);
	if dbres == nil then--没有角色
		return 0;
	end;
	
	for nIndex,Row in pairs(dbres) do
	    local sInfo = SRoleListShowInfo:new();
		if sInfo == nil then 
			return -1;
		end;
		sInfo.dwRoleID 			= Row.dwRoleID;			--角色ID
		sInfo.szRoleName		= Row.szRoleName;		--玩家名字
		sInfo.dwSex				= Row.dwSex;		--玩家性别
		sInfo.dwFace			= Row.dwFace;		--玩家脸型
		sInfo.dwHair			= Row.dwHair;		--玩家发型
		sInfo.dwProf 			= Row.dwProf;	--玩家职业
		sInfo.dwIncoID 			= Row.dwIncoID;
	--获取到套装配置sCreateRoleInfo.dwSuitID
		sInfo.dwDress			= Row.dwDress;		--衣服
		sInfo.dwHand			= Row.dwHand;		--护手
		sInfo.dwShoe			= Row.dwShoe;		--鞋子
		sInfo.dwArms			= Row.dwArms;		--武器
		--sInfo.dwHorseID         = Row.dwHorseID;	--坐骑
		sInfo.dwDressLevel		= Row.dwDressLevel;		--衣服
		sInfo.dwHandLevel		= Row.dwHandLevel;		--护手
		sInfo.dwShoeLevel		= Row.dwShoeLevel;		--鞋子
		sInfo.dwArmsLevel		= Row.dwArmsLevel;		--武器
		
		
		sInfo.dwDefFace			= Row.dwDefFace;		--玩家脸型
		sInfo.dwDefHair			= Row.dwDefHair;		--玩家发型
		sInfo.dwDefDress		= Row.dwDefDress;		--默认衣服
		sInfo.dwDefHand			= Row.dwDefHand;		--默认护手
		sInfo.dwDefShoe			= Row.dwDefShoe;		--默认鞋子
		sInfo.dwDefIncoID       = Row.dwIncoIDTemp;         --默认头像
		sInfo.dwExp			= Row.dwTotalExp;			--角色经验
		sInfo.dwLevel = RoleUpLevelConfig:CompeteLevel(sInfo.dwExp,sInfo);
		sInfo.tmDownlineTime = Row.tmDownlineTime;	
		sInfo.tmCreateRoleTime = Row.tmCreateRoleTime;
		--add quying 2012-9-13
		sInfo.dwLockStart = Row.dwLockStart;
		sInfo.dwLockTime = Row.dwLockTime;
		sInfo.szLockReason = Row.szLockReason;
		sInfo.dwNewRoleFlag = Row.dwNewRoleFlag;
        --解封
        if sInfo.dwLockStart + sInfo.dwLockTime < _now() then
            local SqlCmd = self.objDBQuery:CreateUpdateCmd("T_Role_Info");
            SqlCmd.Wheres.dwRoleID = sInfo.dwRoleID;
            SqlCmd.Fields.dwLockStart = 0;
            SqlCmd.Fields.dwLockTime = 0;
            SqlCmd.Fields.szLockReason = "";
            local res = SqlCmd:execute()
            sInfo.dwLockStart = 0;
            sInfo.dwLockTime = 0;
            sInfo.szLockReason = "";
        end;
		--end;
		sInfo.setActSuitList = MakeTableByString(Row.strActSuit);
		
		local result = self.objDBQuery:execute('select "dwMapID" from "T_Role_Map_Info" where "dwRoleID" = $1',Row.dwRoleID);
		if result then
			sInfo.dwMapId = result[1].dwMapID;
		end;
		local delRes = self.objDBQuery:execute('select count(*) from "T_Role_Del_Info" where "dwRoleID" = $1',Row.dwRoleID);
		local timeRes = self.objDBQuery:execute('select "dwTime" from "T_Role_Del_Info" where "dwRoleID" = $1',Row.dwRoleID);
		if delRes[1].count > 0 then
			sInfo.dwDelRoleFlag = true;
			sInfo.dwTimeRes = _G.LoginPinTime["time"] * 60 *60 * 1000  - (_now() - timeRes[1].dwTime);
		else
			sInfo.dwDelRoleFlag = false;
		end;
		setAllUser[sInfo.dwRoleID] = sInfo;
		table.sort(setAllUser);
	end; 
	return #dbres;
end;

--创建角色
--sInfo:SRoleListShowInfo
function CPlayerDBOper:CreateRole(dwAccountID,sInfo)
	local dwRoleID = CPlayerManager:GetCurRoleID();
	local dbres =self.objDBQuery:execute('select * from "T_Role_Info" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
   if dbres then
		_err("RoleID is Exists Error",dwRoleID);
		return false;
   end; 
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_Info');
	SqlCmd.Fields.dwRoleID 			= dwRoleID;			--角色ID
	SqlCmd.Fields.dwAccountID		= dwAccountID;
	SqlCmd.Fields.szRoleName		= sInfo.szRoleName;		--玩家名字
	SqlCmd.Fields.dwSex				= sInfo.dwSex;		--玩家性别
	SqlCmd.Fields.dwFace			= sInfo.dwFace;		--玩家脸型
	SqlCmd.Fields.dwHair			= sInfo.dwHair;		--玩家发型
	SqlCmd.Fields.dwProf			= sInfo.dwProf;	    --玩家职业
	SqlCmd.Fields.dwIncoID 			= sInfo.dwIncoID;   --玩家默认头像
--获取到套装配置sCreateRoleInfo.dwSuitID
	SqlCmd.Fields.dwDress			= sInfo.dwDress;    --衣服
	SqlCmd.Fields.dwHand			= sInfo.dwHand;		--护手
	SqlCmd.Fields.dwShoe			= sInfo.dwShoe;		--鞋子
	SqlCmd.Fields.dwArms			= sInfo.dwArms;		--武器
	SqlCmd.Fields.dwDressLevel		= sInfo.dwDressLevel;		--衣服
	SqlCmd.Fields.dwHandLevel		= sInfo.dwHandLevel;		--护手
	SqlCmd.Fields.dwShoeLevel		= sInfo.dwShoeLevel;		--鞋子
	SqlCmd.Fields.dwArmsLevel		= sInfo.dwArmsLevel;		--武器 = 
	
	
	SqlCmd.Fields.dwDefFace			= sInfo.dwDefFace;		--玩家脸型
	SqlCmd.Fields.dwDefHair			= sInfo.dwDefHair;		--玩家发型
	SqlCmd.Fields.dwDefDress		= sInfo.dwDefDress;		--衣服
	SqlCmd.Fields.dwDefHand			= sInfo.dwDefHand;		--护手
	SqlCmd.Fields.dwDefShoe			= sInfo.dwDefShoe;		--鞋子
	SqlCmd.Fields.dwIncoIDTemp		= sInfo.dwDefIncoID;   --玩家头像
	
	SqlCmd.Fields.dwTotalExp		= sInfo.dwExp;			--角色等级	
	----------------add by 段磊磊 2012-4-9
	SqlCmd.Fields.tmDownlineTime	= 0;			--下线时间	
	SqlCmd.Fields.tmUplineTime		= 0;			--上线时间	
	-------------------add by quying 2012-04-29
	SqlCmd.Fields.tmCreateRoleTime = _now()             --创建角色时间
	
	SqlCmd.Fields.dwNewRoleFlag		= sInfo.dwNewRoleFlag;
	----add end
	--计算经验
	sInfo.dwLevel = RoleUpLevelConfig:CompeteLevel(sInfo.dwExp,sInfo);
	local bRet,szSql = SqlCmd:execute();
	if not bRet then
		_info("Create Role To DB Error");
		return false;
	end;
	
	return true, dwRoleID;
end;



--判断角色名称是不是存在
function CPlayerDBOper:RoleNameIsExists(szRoleName)
	local dbres = self.objDBQuery:execute('select * from "T_Role_Info" where "szRoleName" = $1 LIMIT 1',szRoleName);
	if dbres then 
		return true;
	else
		return false;
	end;
end;

function CPlayerDBOper:LoadRoleInfo(dwRoleID)
	local dbres = self.objDBQuery:execute('select * from "T_Role_Info" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
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
	
	sInfo.dwRoleID 			= Row.dwRoleID;				--角色ID
	sInfo.szRoleName		= Row.szRoleName;			--玩家名字
	sInfo.dwSex				= Row.dwSex;				--玩家性别
	sInfo.dwFace			= Row.dwFace;				--玩家脸型
	sInfo.dwHair			= Row.dwHair;				--玩家发型
	sInfo.dwProf 			= Row.dwProf;				--玩家职业
	sInfo.dwDefIncoID		= Row.dwIncoIDTemp or 0;             --玩家默认头像
--获取到套装配置sCreateRoleInfo.dwSuitID
	sInfo.dwDress			= Row.dwDress;				--衣服
	sInfo.dwHand			= Row.dwHand;				--护手
	sInfo.dwShoe			= Row.dwShoe;				--鞋子
	sInfo.dwArms			= Row.dwArms;				--武器
	
	sInfo.dwDressLevel		= Row.dwDressLevel;			--衣服
	sInfo.dwHandLevel		= Row.dwHandLevel;			--护手
	sInfo.dwShoeLevel		= Row.dwShoeLevel;			--鞋子
	sInfo.dwArmsLevel		= Row.dwArmsLevel;			--武器
	--sInfo.dwHorseID		= Row.dwHorseID;			--坐骑
	
	sInfo.dwDefFace			= Row.dwDefFace;			--玩家脸型
	sInfo.dwDefHair			= Row.dwDefHair;			--玩家发型
	sInfo.dwDefDress		= Row.dwDefDress;			--衣服
	sInfo.dwDefHand			= Row.dwDefHand;			--护手
	sInfo.dwDefShoe			= Row.dwDefShoe;			--鞋子
	sInfo.dwIncoID          = Row.dwIncoID or 0;    --玩家头像
	
	sInfo.dwExp				= Row.dwTotalExp;			--角色经验
	----------------add by 段磊磊 2012-4-9
	sInfo.tmDownlineTime		= Row.tmDownlineTime;	--下线时间
	sInfo.tmUplineTime			= _now()				--上线时间
	sInfo.tmCreateRoleTime		= Row.tmCreateRoleTime;
	--add end
	sInfo.setActSuitList		= MakeTableByString(Row.strActSuit);
	
	sInfo.dwNewRoleFlag		= Row.dwNewRoleFlag;
	
	sInfo.dwLevel				= RoleUpLevelConfig:CompeteLevel(sInfo.dwExp,sInfo);
	return sInfo;
end; 


function CPlayerDBOper:RecordDelInfo(objPlayer, dwRoleID, flag)
	local nowTime = nil;
	if flag then
		self.objDBQuery:execute('insert into "T_Role_Del_Info" values($1, $2)',dwRoleID, _now());
		nowTime = _now()
	else
		self.objDBQuery:execute('delete from "T_Role_Del_Info" where "dwRoleID" = $1',dwRoleID);
	end;
	local sInfo = self:LoadRoleInfo(dwRoleID);
	local result = self.objDBQuery:execute('select "dwMapID" from "T_Role_Map_Info" where "dwRoleID" = $1',dwRoleID);
	if result then
		sInfo.dwMapId = result[1].dwMapID;
	end;
	if nowTime then
		sInfo.dwDelRoleFlag = true;
		sInfo.dwTimeRes = _G.LoginPinTime["time"] * 60 *60 * 1000  - (_now() - nowTime);
	else
		sInfo.dwDelRoleFlag = false;
		sInfo.dwTimeRes = nil;
	end;
	objPlayer.setAllRoleInfo[dwRoleID] = sInfo;
	objPlayer.ReturnDelTimeMsg{RoleId = dwRoleID, Times = sInfo.dwTimeRes, Flag = flag}
end;

--quying chg 2012-08-02
function CPlayerDBOper:PinRoleInfo(objPlayer, dwRoleID) 
	local sInfo = objPlayer.setAllRoleInfo[dwRoleID];
	if sInfo and sInfo.dwTimeRes then
		local timeInfo = sInfo.dwTimeRes;
		if timeInfo > 0 then
			if objPlayer then
				objPlayer.ReturnPinMsg{Flag = false, RoleId = dwRoleID}
			end;
			return;
		end;
		self.objDBQuery:execute('delete from "T_Role_Info" where "dwRoleID" = $1',dwRoleID);
		self.objDBQuery:execute('delete from "T_Role_Del_Info" where "dwRoleID" = $1',dwRoleID);
		if objPlayer then
			objPlayer.ReturnPinMsg{Flag = true, RoleId = dwRoleID}
			return;
		end;
	end;
	if objPlayer then
		objPlayer.ReturnPinMsg{Flag = false, RoleId = dwRoleID}
	end;
end;

-----获取葫芦模型ID
function CPlayerDBOper:GetGourdModelID(dwRoleID)
	local dbres = self.objDBQuery:execute('select * from "T_Role_Gourd" where "dwRoleID" = $1',dwRoleID);
	if dbres == nil then--没有角色
		return 0;
	end;
	return dbres[1].dwAdornState;
end
