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
--------------------------
--��Ұ��������н�ɫ
CPlayer.setAllRoleInfo ={};

--��ɫ�̶�������Ϣ
CPlayer.sRoleInfo = nil;			--��ɫ��Ϣ�����ģ��Ļ�����Ϣ
----------------------------------------------------
--�����
----------------------------------------------------
local playerMeta = { __index = CPlayer }
CMemoryDebug:Show("ObjPlayer");

function CPlayer:new(dwAccountID,objDB,dwAdultFlag,dwGold,bIsGM)
	--local obj = objNet;--{};
	local obj = {}; 
	
	obj.objSystemMgr = nil;
	obj.objDBQuery = objDB;
	obj.dwAccountID = dwAccountID;
	--������еĽ�ɫ
	obj.setAllRoleInfo ={};
	obj.dwRoleCount =0;
	--������--5-4
	obj.dwGold = dwGold;			--��ҵ�Ԫ����Ϣ
	obj.dwAdultFlag = dwAdultFlag;	--0��δ�����ˣ�1�ǳ����ˣ�0���ᱻ���������ϵͳ
	obj.dwAddicted = 1.0;	--��������Ե��������
	obj.bIsGM = bIsGM;
	--Player�����Ƿ��Ѿ���ʼ����ɵı�ʶ
	obj.isLoadEnd = false;
	
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
	--setmetatable(obj,playerMeta); 
	CMemoryDebug:AddObject("ObjPlayer", obj);
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
function CPlayer:Create()
	--����ϵͳ������
	self.objSystemMgr = CPlayerSystems:new(self);
	--��ȡ��ҵĽ�ɫ��Ϣ
	--self.dwRoleCount = self.objDBOper:GetAllRoleByUser(self:GetAccountID(),self.setAllRoleInfo)
	-- if self.dwRoleCount == 0 then
		-- CLogSystemManager:game_enter(self,'0','0','0',self:GetIP())
	-- end
    return true;
end;

function CPlayer:SetRoleCount(dwCount)
	self.dwRoleCount = dwCount;
end;

--�������
function CPlayer:Update(dwInterval)
	if self.objSystemMgr then
		self.objSystemMgr:Update(dwInterval);
	end;
end;

--����ͷ�
function CPlayer:Destroy()
	--֪ͨ��Ӧ����Ϸ������
	-- local objLine = self.setAllGameLine[objPlayer.dwCurLine];
	-- if objLine then
		-- objLine.OnPlayerDestroyMsg{AccountID = self:GetAccountID()};
	-- end;
	--����˳���
	CGameLineManager:ExitLine(self); 
	if self.objSystemMgr then --�ͷ�ϵͳ������
		self.objSystemMgr:Destroy();
		self.objSystemMgr = nil;
	end;
end; 
---------------------------------------------
---�͵�ǰ��ɫ��صĽӿ�
---------------------------------------------
--������--5-4--��ȡ��ҵ�Ԫ������
function CPlayer:GetGold()
	return self.dwGold;
end
--�޸���ҵ�Ԫ�������������ɼ�
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
	--������������ݿ�ı������
	CAccountDBQuery:SaveGoldToDB(self.dwAccountID, dwValue);
	local dwDB = CAccountDBQuery:GetGoldByAccountID(self.dwAccountID)
	CLogSystemManager:gold_change(self,dwValue,dwDB,self.dwGold)
	
end
--��ҽ����˳�ֵ����
function CPlayer:ChargeGold(dwGold)
	self.dwGold = self.dwGold + dwGold;
	self.objLine.UserChargeGlodMsg{ RoleID = self:GetRoleID(), Gold = dwGold };
end
--�ж�����Ƿ����������ϵͳ������true��false
function CPlayer:IsInAddicted()
	return self.dwAdultFlag == 0;
end
--������ҵķ����Ա���
function CPlayer:UpdateAddicted( dwValue )
	self.dwAddicted = dwValue;
end
--��ȡ��ҵķ����Ա��� 0~1.0
function CPlayer:GetAddicted()
	return self.dwAddicted;
end 
---��ɫ�̶�������Ϣ
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
	--��ȡ����װ����sCreateRoleInfo.dwSuitID 
	local sCurInfo = self:GetInfo();
	if not sCurInfo then
		return nil;
	end; 
	sCurInfo.dwRoleID		= sInfo.dwRoleID;
	sCurInfo.szRoleName		= sInfo.szRoleName;
	sCurInfo.dwProf			= sInfo.dwProf;
	sCurInfo.dwSex			= sInfo.dwSex;			--����Ա�
	sCurInfo.dwFace			= sInfo.dwFace;			--�������
	sCurInfo.dwHair			= sInfo.dwHair;			--��ҷ���
	
	sCurInfo.dwDress		= sInfo.dwDress;		--�·�
	sCurInfo.dwHand			= sInfo.dwHand;		--����
	sCurInfo.dwShoe			= sInfo.dwShoe;		--Ь��
	sCurInfo.dwArms			= sInfo.dwArms;		--����
	
	sCurInfo.dwIncoID		= sInfo.dwIncoID;
	sCurInfo.dwDefIncoID	= sInfo.dwDefIncoID or sInfo.dwIncoIDTemp or 0;
	sCurInfo.dwDefFace = sInfo.dwDefFace;
	sCurInfo.dwDefHair = sInfo.dwDefHair;
	sCurInfo.dwDefHand = sInfo.dwDefHand;
	sCurInfo.dwDefDress = sInfo.dwDefDress;
	sCurInfo.dwDefShoe = sInfo.dwDefShoe;
	
	sCurInfo.dwLevelCurExp = sInfo.dwLevelCurExp;
	sCurInfo.dwLevelMaxExp = sInfo.dwLevelMaxExp;
	
	sCurInfo.dwDressLevel		= sInfo.dwDressLevel;		--�·�
	sCurInfo.dwHandLevel		= sInfo.dwHandLevel;		--����
	sCurInfo.dwShoeLevel		= sInfo.dwShoeLevel;		--Ь��
	sCurInfo.dwArmsLevel		= sInfo.dwArmsLevel;		--����
	--sInfo.dwHorseID         = Row.dwHorseID;    --���� 
	sCurInfo.dwNewRoleFlag		= sInfo.dwNewRoleFlag;
	
	sCurInfo.dwExp			= sInfo.dwExp;			--��ɫ����
	----------------add by ������ 2012-4-9
	sCurInfo.tmDownlineTime		= sInfo.tmDownlineTime;			--����ʱ��
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
 
--�õ���ɫID
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
--��ȡָ��ϵͳ
function CPlayer:GetSystem(szSystemName)
	if not self.objSystemMgr then
		return nil;
	end;
	return self.objSystemMgr:GetSystem(szSystemName);
end;
  
function CPlayer:GetRoleCount()
	return self.dwRoleCount;
end;

--������Ҿ���͵ȼ�
function CPlayer:UpdateRoleExp(dwExp,dwLevel)
	self.sRoleInfo.dwExp = dwExp;
	self.sRoleInfo.dwLevel = dwLevel;
	self.objDBOper:SaveRoleExpInfo(dwExp,self:GetRoleID());
end; 
--��ȡ��ҵȼ�
function CPlayer:GetLevel()
	return self.sRoleInfo.dwLevel;
end; 
--��ȡ��Ҿ���
function CPlayer:GetExp()
	return self.sRoleInfo.dwExp;
end;
--��ȡ�������
function CPlayer:GetName()
	return self.sRoleInfo.szRoleName;
end;
--------------------------------------
--˽�г�Ա����
--------------------------------------


--��ӷ��͵�GS������
function CPlayer:SetLineData(szSystemName,Data)
	local dwAccountID = self:GetAccountID()
	CTransitManager:AddPlayerData(dwAccountID,szSystemName,Data)
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
--��suittable����ΪDBstr
local function MakeStringByTable(tbList)
	local str = "";
	for n,v in pairs(tbList)do
		str = str..v..";";
	end
	return str;
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


--�������澭��
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
	SqlCmd.Fields.szRoleName		= sInfo.szRoleName;		--�������
	SqlCmd.Fields.dwSex				= sInfo.dwSex;			--����Ա�
	SqlCmd.Fields.dwFace			= sInfo.dwFace;			--�������
	SqlCmd.Fields.dwHair			= sInfo.dwHair;			--��ҷ���
	SqlCmd.Fields.dwProf			= sInfo.dwProf;			--���ְҵ
	if sInfo.dwIncoID == 0 then 
		sInfo.dwIncoID = sInfo.dwProf * 1000 + math.mod(sInfo.dwDefHair,10000) - 1000
	end
	SqlCmd.Fields.dwIncoID 			= sInfo.dwIncoID;
--��ȡ����װ����sCreateRoleInfo.dwSuitID

	SqlCmd.Fields.dwDress			= sInfo.dwDress;		--�·�
	SqlCmd.Fields.dwHand			= sInfo.dwHand;			--����
	SqlCmd.Fields.dwShoe			= sInfo.dwShoe;			--Ь��
	SqlCmd.Fields.dwArms			= sInfo.dwArms;			--���� = 
	
	SqlCmd.Fields.dwDressLevel		= sInfo.dwDressLevel;	--�·�
	SqlCmd.Fields.dwHandLevel		= sInfo.dwHandLevel;	--����
	SqlCmd.Fields.dwShoeLevel		= sInfo.dwShoeLevel;	--Ь��
	SqlCmd.Fields.dwArmsLevel		= sInfo.dwArmsLevel;	--���� = 
	--SqlCmd.Fields.dwHorseID		= sInfo.dwHorseID or 0;	--����
	
	SqlCmd.Fields.dwDefFace			= sInfo.dwDefFace;		--�������
	SqlCmd.Fields.dwDefHair			= sInfo.dwDefHair;		--��ҷ���
	SqlCmd.Fields.dwDefDress		= sInfo.dwDefDress;		--�·�
	SqlCmd.Fields.dwDefHand			= sInfo.dwDefHand;		--����
	SqlCmd.Fields.dwDefShoe			= sInfo.dwDefShoe;		--Ь��
	SqlCmd.Fields.dwIncoIDTemp		= sInfo.dwDefIncoID;    --IconID
	
	SqlCmd.Fields.tmDownlineTime	= _now();				--����ʱ��	
	SqlCmd.Fields.tmUplineTime		= sInfo.tmUplineTime or 0;--����ʱ��	
	SqlCmd.Fields.szIP				= sInfo.szIP			--ip
	SqlCmd.Fields.bOnline			= sInfo.bOnline			--���߱�־
	
	SqlCmd.Fields.strActSuit		= MakeStringByTable(sInfo.setActSuitList);
	SqlCmd.Fields.dwNewRoleFlag		= sInfo.dwNewRoleFlag;
	
	local bRet ,szSql = SqlCmd:execute();
	if not bRet then
		_info("Save Role To DB Error",szSql);
		return false;
	end;
	return true;
end; 
