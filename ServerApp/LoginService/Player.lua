 --[[
�ļ���BaseService/Player.lua
������CPlayer
����˵���������
��ע��
���ߣ��ܻ���
�汾��v1.0
�޸��ߣ�
]] 

_G.CPlayer =  { }; 
--------------------------
--��ɫ��Ϣ�������

----------------------------------------------------
--�����
----------------------------------------------------

function CPlayer:new(dwAccountID,objDB,dwAdultFlag,dwGold,bIsGM)
	local obj = {}; 
	
	obj.objDBQuery = objDB;
	obj.dwAccountID = dwAccountID;
	--������еĽ�ɫ
	obj.setAllRoleInfo ={};
	obj.dwRoleCount =0;
	--������--5-4
	obj.dwGold = dwGold;			--��ҵ�Ԫ����Ϣ
	--print("new player gold", dwGold);
	obj.dwAdultFlag = dwAdultFlag;	--0��δ�����ˣ�1�ǳ����ˣ�0���ᱻ���������ϵͳ
	obj.dwAddicted = 1.0;	--��������Ե��������
	obj.bIsGM = bIsGM;
	
   --���������ʹ������ҵ�ǰ��ɫ��
	--��ɫ�̶�������Ϣ
	obj.sRoleInfo 		= SRoleInfo:new();			--��ɫ�Ĺ̶���Ϣ 
	--���ϵͳ������ݿ����,˽��
 
	obj.objDBOper = CPlayerDBOper:new(objDB,self);	
	for i,v in pairs(CPlayer) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;
----------------------------------------------------
--�������
----------------------------------------------------
--�õ�����˺�ID
function CPlayer:GetAccountID()
	return self.dwAccountID;
end; 

--�õ�������ID
function CPlayer:GetSid() 
	return math.mod(self.dwAccountID,10000);
end; 

--�õ�������ݿ�,���ݿ����_Database����
function CPlayer:GetDBQuery()
	return self.objDBQuery;
end;

--��Ҵ���
function CPlayer:Create(IP,UF)
	--��ȡ��ҵĽ�ɫ��Ϣ
	self.dwRoleCount = self.objDBOper:GetAllRoleByUser(self:GetAccountID(),self.setAllRoleInfo)
    --����IP
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
--˽�г�Ա����
--------------------------------------

--���һ����ɫ
function CPlayer:AddRole(sInfo)
	if self.setAllRoleInfo[sInfo.dwRoleID] then
	    return false;
	end;
	self.setAllRoleInfo[sInfo.dwRoleID] = sInfo;
	return true;
end;
--ɾ��һ����ɫ
function CPlayer:DelRole(dwRoleID)
	self.setAllRoleInfo[dwRoleID] = nil;
end;
--�õ�һ����ɫ
--return :SRoleListShowInfo
function CPlayer:GetRole(dwRoleID)
	return self.setAllRoleInfo[dwRoleID];
end;
--������ɫ
--���� sCreateRoleInfo :SCreateInfo
--�滻�ַ����е��������дʣ������滻����ַ������ַ����а��������д�����
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
	 
	--�����ڴ��ɫ
	local sInfo = SRoleListShowInfo:new(); 
	sInfo.szRoleName		= sCreateRoleInfo.szName;		--�������
	sInfo.dwSex				= sCreateRoleInfo.dwSex;		--����Ա� 
	sInfo.dwProf 			= sCreateRoleInfo.dwProf;	    --���ְҵ
	--��ȡ����װ����sCreateRoleInfo.dwSuitID
	sInfo.dwIncoID			= sCreateRoleInfo.dwIncoID or 0; 
	sInfo.dwDefIncoID       = sCreateRoleInfo.dwDefIncoID or 0; 
	local ProfConfig = CreateRoleConfig.ProfConfig[sInfo.dwProf];
	if not ProfConfig then
		_info("No Prof Info ProfConfig",sInfo.dwProf);
		return -1,nil;
	end;
	
	sInfo.dwFace			= 0;
	sInfo.dwHair			= 0;
	
	sInfo.dwDress			= 0;		--�·�
	sInfo.dwHand			= 0;		--����
	sInfo.dwShoe			= 0;		--Ь��
	sInfo.dwArms			= 0; --ProfConfig.ArmsModelID;		--������ʼ��ʱ��û������
	sInfo.dwHorseID         = 0;		--����Ϊ��
	
	sInfo.dwDressLevel		= 0;		--�·�
	sInfo.dwHandLevel		= 0;		--����
	sInfo.dwShoeLevel		= 0;		--Ь��
	sInfo.dwArmsLevel		= 0;		--����
	
	sInfo.dwDefFace 		= sCreateRoleInfo.dwFace;		--�������
	sInfo.dwDefHair 		= sCreateRoleInfo.dwHair;		--��ҷ���
	
	sInfo.dwDefDress	    = ProfConfig.DefBodyModelID;		--�·�
	sInfo.dwDefHand			= ProfConfig.DefHandModelID;		--����
	sInfo.dwDefShoe			= ProfConfig.DefFeetModelID;		--Ь�� 
	sInfo.dwExp				= 0;			--��ɫ��ǰ�ܾ���  
	sInfo.dwLevel			= 0;			--��ɫ�ȼ�
	sInfo.dwLevelMaxExp 	= 0;
	sInfo.dwLevelCurExp 	= 0;
	sInfo.dwNewRoleFlag		= 1;
	
	--�������ݿ�
	local nRetCode,dwRoleID = self.objDBOper:CreateRole(self:GetAccountID(),sInfo);
	if not nRetCode or dwRoleID == 0 then
		_info('Create Role Error by DB');--	���ݿⴴ����ɫʧ��
		sInfo = nil;
		return -1,nil;
	end;
	sInfo.dwRoleID = dwRoleID;
	
	if not self:AddRole(sInfo) then
		_info('Add Role Error ');
		sInfo = nil;
		return -1,nil;
	end;
	
	--����Ϣ���͵��ͻ���
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

--��ȡ������н�ɫ
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

--���ѡ����һ����ɫ
function CPlayer:SelectRole(dwRoleID)
	--��ȡ��Ϣ������
    self.sRoleInfo = self:GetRole(dwRoleID); --�����ݿ⽫��ɫ��Ϣ������:
	if not self.sRoleInfo then
		self:SendSelectRoleResult(dwRoleID,-1,"");
		return;
	end;
	self:SendSelectRoleResult(dwRoleID,0,self.sRoleInfo.szRoleName);
end;

--��¼ɾ���Ľ�ɫ
function CPlayer:RecordInfo(dwRoleID, operFlag)
	self.objDBOper:RecordDelInfo(self, dwRoleID, operFlag);
end;
--����һ����ɫ
function CPlayer:DeleteRoleInfo(dwRoleID)
    CDeleteCall:DoDelete(dwRoleID);
	self.objDBOper:PinRoleInfo(self, dwRoleID);
	self:DelRole(dwRoleID)
end;

--���ʹ�����ɫ�Ľ��
function CPlayer:SendCreateRoleResult(dwRoleID ,szRoleName,nResultCode)
	self.OnCreateRoleRtMsg{
        ResultCode  = nResultCode ,		--���ر���
        RoleID      = dwRoleID,			--�ոմ����Ľ�ɫID
        RoleName    = szRoleName,		--�ոմ����Ľ�ɫ��
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
----����ģ���б�  (�Ժ�����ģ�;�����������)
function CPlayer:AddModelList(sInfo,dwRoleID)
	sInfo.dwModelList = {};
	local dwGourdID = self.objDBOper:GetGourdModelID(dwRoleID);  ----���ӵ�ģ��ID
	self:SetModelID(sInfo.dwModelList,dwGourdID);
end
----����ģ��iD
function CPlayer:SetModelID(ModelList,modelID)
	if(ModelList[modelID]) then
		_info("Error modelID repeat",modelID);
		return;
	end
	ModelList[modelID] = modelID;
end
--��������б���ʾ����Ϣ
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

--��ȡ��������
function CPlayer:GetObjType()
	return enEntType.eEntType_Player;
end 

--��ӷ��͵�GS������
function CPlayer:SetLineData(szSystemName,Data)
	local dwAccountID = self:GetAccountID()
	--CTransitManager:AddPlayerData(dwAccountID,szSystemName,Data)
end
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--������ݿ���
--------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------
--��suit��DBstr����Ϊtable
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

--���ģ������ݿ������
_G.CPlayerDBOper = {}; 
function CPlayerDBOper:new(objDB,objPlayer)
    local obj = {};
	setmetatable(obj,{__index = CPlayerDBOper});
	obj.objDBQuery = objDB;
	obj.objPlayer = objPlayer;
	return obj;
end;

--��ȡ������е��û�
--sInfo:SRoleListShowInfo
function CPlayerDBOper:GetAllRoleByUser(dwAccuntID,setAllUser)
	local dbres = self.objDBQuery:execute('select * from "T_Role_Info" where "dwAccountID" = $1',dwAccuntID);
	if dbres == nil then--û�н�ɫ
		return 0;
	end;
	
	for nIndex,Row in pairs(dbres) do
	    local sInfo = SRoleListShowInfo:new();
		if sInfo == nil then 
			return -1;
		end;
		sInfo.dwRoleID 			= Row.dwRoleID;			--��ɫID
		sInfo.szRoleName		= Row.szRoleName;		--�������
		sInfo.dwSex				= Row.dwSex;		--����Ա�
		sInfo.dwFace			= Row.dwFace;		--�������
		sInfo.dwHair			= Row.dwHair;		--��ҷ���
		sInfo.dwProf 			= Row.dwProf;	--���ְҵ
		sInfo.dwIncoID 			= Row.dwIncoID;
	--��ȡ����װ����sCreateRoleInfo.dwSuitID
		sInfo.dwDress			= Row.dwDress;		--�·�
		sInfo.dwHand			= Row.dwHand;		--����
		sInfo.dwShoe			= Row.dwShoe;		--Ь��
		sInfo.dwArms			= Row.dwArms;		--����
		--sInfo.dwHorseID         = Row.dwHorseID;	--����
		sInfo.dwDressLevel		= Row.dwDressLevel;		--�·�
		sInfo.dwHandLevel		= Row.dwHandLevel;		--����
		sInfo.dwShoeLevel		= Row.dwShoeLevel;		--Ь��
		sInfo.dwArmsLevel		= Row.dwArmsLevel;		--����
		
		
		sInfo.dwDefFace			= Row.dwDefFace;		--�������
		sInfo.dwDefHair			= Row.dwDefHair;		--��ҷ���
		sInfo.dwDefDress		= Row.dwDefDress;		--Ĭ���·�
		sInfo.dwDefHand			= Row.dwDefHand;		--Ĭ�ϻ���
		sInfo.dwDefShoe			= Row.dwDefShoe;		--Ĭ��Ь��
		sInfo.dwDefIncoID       = Row.dwIncoIDTemp;         --Ĭ��ͷ��
		sInfo.dwExp			= Row.dwTotalExp;			--��ɫ����
		sInfo.dwLevel = RoleUpLevelConfig:CompeteLevel(sInfo.dwExp,sInfo);
		sInfo.tmDownlineTime = Row.tmDownlineTime;	
		sInfo.tmCreateRoleTime = Row.tmCreateRoleTime;
		--add quying 2012-9-13
		sInfo.dwLockStart = Row.dwLockStart;
		sInfo.dwLockTime = Row.dwLockTime;
		sInfo.szLockReason = Row.szLockReason;
		sInfo.dwNewRoleFlag = Row.dwNewRoleFlag;
        --���
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

--������ɫ
--sInfo:SRoleListShowInfo
function CPlayerDBOper:CreateRole(dwAccountID,sInfo)
	local dwRoleID = CPlayerManager:GetCurRoleID();
	local dbres =self.objDBQuery:execute('select * from "T_Role_Info" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
   if dbres then
		_err("RoleID is Exists Error",dwRoleID);
		return false;
   end; 
	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_Info');
	SqlCmd.Fields.dwRoleID 			= dwRoleID;			--��ɫID
	SqlCmd.Fields.dwAccountID		= dwAccountID;
	SqlCmd.Fields.szRoleName		= sInfo.szRoleName;		--�������
	SqlCmd.Fields.dwSex				= sInfo.dwSex;		--����Ա�
	SqlCmd.Fields.dwFace			= sInfo.dwFace;		--�������
	SqlCmd.Fields.dwHair			= sInfo.dwHair;		--��ҷ���
	SqlCmd.Fields.dwProf			= sInfo.dwProf;	    --���ְҵ
	SqlCmd.Fields.dwIncoID 			= sInfo.dwIncoID;   --���Ĭ��ͷ��
--��ȡ����װ����sCreateRoleInfo.dwSuitID
	SqlCmd.Fields.dwDress			= sInfo.dwDress;    --�·�
	SqlCmd.Fields.dwHand			= sInfo.dwHand;		--����
	SqlCmd.Fields.dwShoe			= sInfo.dwShoe;		--Ь��
	SqlCmd.Fields.dwArms			= sInfo.dwArms;		--����
	SqlCmd.Fields.dwDressLevel		= sInfo.dwDressLevel;		--�·�
	SqlCmd.Fields.dwHandLevel		= sInfo.dwHandLevel;		--����
	SqlCmd.Fields.dwShoeLevel		= sInfo.dwShoeLevel;		--Ь��
	SqlCmd.Fields.dwArmsLevel		= sInfo.dwArmsLevel;		--���� = 
	
	
	SqlCmd.Fields.dwDefFace			= sInfo.dwDefFace;		--�������
	SqlCmd.Fields.dwDefHair			= sInfo.dwDefHair;		--��ҷ���
	SqlCmd.Fields.dwDefDress		= sInfo.dwDefDress;		--�·�
	SqlCmd.Fields.dwDefHand			= sInfo.dwDefHand;		--����
	SqlCmd.Fields.dwDefShoe			= sInfo.dwDefShoe;		--Ь��
	SqlCmd.Fields.dwIncoIDTemp		= sInfo.dwDefIncoID;   --���ͷ��
	
	SqlCmd.Fields.dwTotalExp		= sInfo.dwExp;			--��ɫ�ȼ�	
	----------------add by ������ 2012-4-9
	SqlCmd.Fields.tmDownlineTime	= 0;			--����ʱ��	
	SqlCmd.Fields.tmUplineTime		= 0;			--����ʱ��	
	-------------------add by quying 2012-04-29
	SqlCmd.Fields.tmCreateRoleTime = _now()             --������ɫʱ��
	
	SqlCmd.Fields.dwNewRoleFlag		= sInfo.dwNewRoleFlag;
	----add end
	--���㾭��
	sInfo.dwLevel = RoleUpLevelConfig:CompeteLevel(sInfo.dwExp,sInfo);
	local bRet,szSql = SqlCmd:execute();
	if not bRet then
		_info("Create Role To DB Error");
		return false;
	end;
	
	return true, dwRoleID;
end;



--�жϽ�ɫ�����ǲ��Ǵ���
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
	
	sInfo.dwRoleID 			= Row.dwRoleID;				--��ɫID
	sInfo.szRoleName		= Row.szRoleName;			--�������
	sInfo.dwSex				= Row.dwSex;				--����Ա�
	sInfo.dwFace			= Row.dwFace;				--�������
	sInfo.dwHair			= Row.dwHair;				--��ҷ���
	sInfo.dwProf 			= Row.dwProf;				--���ְҵ
	sInfo.dwDefIncoID		= Row.dwIncoIDTemp or 0;             --���Ĭ��ͷ��
--��ȡ����װ����sCreateRoleInfo.dwSuitID
	sInfo.dwDress			= Row.dwDress;				--�·�
	sInfo.dwHand			= Row.dwHand;				--����
	sInfo.dwShoe			= Row.dwShoe;				--Ь��
	sInfo.dwArms			= Row.dwArms;				--����
	
	sInfo.dwDressLevel		= Row.dwDressLevel;			--�·�
	sInfo.dwHandLevel		= Row.dwHandLevel;			--����
	sInfo.dwShoeLevel		= Row.dwShoeLevel;			--Ь��
	sInfo.dwArmsLevel		= Row.dwArmsLevel;			--����
	--sInfo.dwHorseID		= Row.dwHorseID;			--����
	
	sInfo.dwDefFace			= Row.dwDefFace;			--�������
	sInfo.dwDefHair			= Row.dwDefHair;			--��ҷ���
	sInfo.dwDefDress		= Row.dwDefDress;			--�·�
	sInfo.dwDefHand			= Row.dwDefHand;			--����
	sInfo.dwDefShoe			= Row.dwDefShoe;			--Ь��
	sInfo.dwIncoID          = Row.dwIncoID or 0;    --���ͷ��
	
	sInfo.dwExp				= Row.dwTotalExp;			--��ɫ����
	----------------add by ������ 2012-4-9
	sInfo.tmDownlineTime		= Row.tmDownlineTime;	--����ʱ��
	sInfo.tmUplineTime			= _now()				--����ʱ��
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

-----��ȡ��«ģ��ID
function CPlayerDBOper:GetGourdModelID(dwRoleID)
	local dbres = self.objDBQuery:execute('select * from "T_Role_Gourd" where "dwRoleID" = $1',dwRoleID);
	if dbres == nil then--û�н�ɫ
		return 0;
	end;
	return dbres[1].dwAdornState;
end
