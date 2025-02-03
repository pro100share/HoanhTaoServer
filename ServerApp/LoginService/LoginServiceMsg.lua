
local bKorea = false;



_G.checkUser = function(_args)
    _args.user = CPlayerService:GetClientByNet(_from);
end;

-------------------------
--������ʱ��ͬ��Э��
-------------------------
define.RequestTimeMsg{
user = NONE,
ReqTime =0,	--�ͻ��˷�������ʱ��Ŀͻ���ʱ��
 }
when{user = NONE} 
RequestTimeMsg = checkUser
when{}
function RequestTimeMsg(user,ReqTime)
	local dwServerTime = _now(); --ȡ�÷������ϵ�ʱ��
	user.ResultTimeMsg{ServerTime=dwServerTime,ReqTime = ReqTime};
end; 
-------------------------
--
-------------------------


--�û����봴���Ự��Ϣ
define.CreateSessionMsg
{
	AccountID = 0,		--���ID
	Sign = "";		    --��һỰID
	Time = 0;
	AdultFlag = 0;      --�����Ա��
	FirstLogin = false;
	UF = '0';			--����
	Index = 0;
};
when{}
function CreateSessionMsg(AccountID,Sign,Time,AdultFlag, FirstLogin,UF,Index)
	_info("==LoginStep==1==", AccountID);
	local client = CPlayerService:GetClientByNet(_from);
	local curTime = os.utc(1)-_time(1,{year=1970,month=1,day=1,hour=0,min=0,sec=0});
	if math.abs(Time - curTime) > 60*30 then
		-- print("time errorself.dwTime - curTime",Time,curTime);
		_info("==LoginStep==1==err1==", AccountID);
		client.CreateGameSessionRequestMsg{ResultCode = -11};
		_closenet(_from);
		return;
	end;  
	local signAccountID = math.floor(AccountID/10000); 
	local szCheck =  tostring(AdultFlag)..tostring(signAccountID)..tostring(Time).."themgai1";
	szCheck = szCheck:md5(); 
	--print("szCheck,self.szSign,self.dwTime,curTime1111111111111111111111",szCheck,Sign,Time,curTime);  
	if not string.find(szCheck,Sign) then
		-- print("Md5 error szCheck,self.szSign",szCheck,Sign);
		_info("==LoginStep==1==err2==", AccountID);
		client.CreateGameSessionRequestMsg{ResultCode = -12};
		_closenet(_from);
		return;
	end;
	
	CPlayerService:ReadyCreateSession(_from,AccountID,AdultFlag, FirstLogin,UF);
	
	if SERVERVERSION==106 then--�����汾����
		local Data = CAccountDBQuery:execute('select * from "t_korea_seq2index" where "seqid" = $1', signAccountID);
		if not Data then
			local SqlCmd = CAccountDBQuery:CreateInsertCmd('t_korea_seq2index');
			SqlCmd.Fields.seqid		= signAccountID;
			SqlCmd.Fields.indexid	= Index;
			SqlCmd:execute();
		else
			local SqlCmd = CAccountDBQuery:CreateUpdateCmd('t_korea_seq2index');
			SqlCmd.Wheres.seqid		= signAccountID;
			SqlCmd.Fields.indexid	= Index;
			SqlCmd:execute();
		end; 
	end;
end;

--KS����˺Ŷ����߼���ɣ����Ե�¼
define.OnKSLoginCheckOverMsg
{
	AccountID = 0;
}
when{}
function OnKSLoginCheckOverMsg(AccountID)
	CPlayerService:RealCreateSessin(AccountID);
end;

---������ɫ
define.CreateRoleMsg
{
	user    = NONE,
	RoleName= "",	--��ɫ����
	RoleSex = 0,	--��ɫ�Ա�
	Face	= 0,
	Hair 	= 0,
	SuitID	= 0,
	RoleProf= 0,	--��ɫְҵ
	IncoID  = 0,	--���ͷ��
	UF		= "";	--������zcs add��
}
when{user = NONE}
CreateRoleMsg = checkUser
when{}
function CreateRoleMsg(user,RoleName,RoleSex,Face,Hair,SuitID,RoleProf,IncoID,UF)
    local sInfo = SCreateInfo:new();
	sInfo.szName 			= RoleName;			--�������
	sInfo.dwSex 			= RoleSex;			--����Ա�
	sInfo.dwFace			= Face;			--�������
	sInfo.dwHair 			= Hair;			--��ҷ���
	sInfo.dwProf			= RoleProf;		--���ְҵ
	sInfo.dwSuitID 			= SuitID;			--���Ĭ����װID
	sInfo.dwIncoID 			= IncoID;
	local nRetCode,sInfo = user:CreateRoleRequest(sInfo,UF);
	if nRetCode ~= 0 then
		user:SendCreateRoleResult(0,RoleName, nRetCode);
		--_err("nRetCode  ~= 0 by CreateRoleMsg");
		return;
	end; 
	user:SendCreateRoleResult(sInfo.dwRoleID ,sInfo.szRoleName, 0);
end;

--��ȡ��ɫ����
define.ReadRoleMsg
{
	user = NONE
}
when{user = NONE}
ReadRoleMsg = checkUser
when{}
function ReadRoleMsg(user)
	if user then
		user:ReadAllRole();
	end;
end;

--ѡ��һ����ɫ
define.SelectRoleMsg
{
	user = NONE ,	
	RoleID = 0 ,	--ѡ��Ľ�ɫID
}
when {user = NONE}
SelectRoleMsg = checkUser
when{}
function SelectRoleMsg(user,RoleID)
	if user then
		user:SelectRole(RoleID);
	end;
end;

--ɾ��һ����ɫ
define.WriteInfoToDBMsg
{
	user = NONE ,	
	RoleID = 0 ,	--ѡ��Ľ�ɫID
	OperFlag = true,
}
when {user = NONE}
WriteInfoToDBMsg = checkUser
when{}
function WriteInfoToDBMsg(user,RoleID, OperFlag)
	user:RecordInfo(RoleID, OperFlag);
end;

--����һ����ɫ
define.DeleteRoleInfoMsg
{
	user = NONE ,	
	RoleID = 0 ,	--ѡ��Ľ�ɫID 
}
when {user = NONE}
DeleteRoleInfoMsg = checkUser
when{}
function DeleteRoleInfoMsg(user,RoleID)
	user:DeleteRoleInfo(RoleID);
end;


--���ѡ����Ϸ��·
define.SelectGameLineMsg
{
	user = NONE,
	GameLine = 0,
	UF = "";	--������zcs add��
}
when{ user = NONE }
SelectGameLineMsg = checkUser
when{ }
function SelectGameLineMsg(user,GameLine,UF)
	if user then
		CGameLineManager:SelectGameLine(user, GameLine, UF);
	end;
end;



--��ȡ��·��Ϣ
define.GetGameLineInfoMsg
{
	user = NONE,
}
when{ user = NONE }
GetGameLineInfoMsg = checkUser
when{ }
function GetGameLineInfoMsg(user)
	if user then
		CGameLineManager:GetGameLineInfo(user);
	end;
end; 

--KS������·�Ľ��
define.OnSelectLineRtMsg
{
	AccountID = 0;
	LineID = 0;
	ResultCode = 0;
	Sing = "";
}
when{}
function OnSelectLineRtMsg(AccountID,LineID,ResultCode,Sing)
	if CPlayerService.setWaitingAccount[AccountID] then--����Ѿ��еȴ���net��
		local info = CPlayerService.setWaitingAccount[AccountID];
		CPlayerService.setWaitingAccount[AccountID] = nil;
		CPlayerService.setWaitingNet[info[1]] = nil;
		--����
		local objPlayer = CPlayerManager:GetPlayer(AccountID);
		if objPlayer then
			objPlayer.CreateGameSessionRequestMsg{ResultCode = -19}
			CPlayerService.setConnect[objPlayer.objNet] = nil;
			_closenet(objPlayer.objNet)
			CPlayerManager:DelPlayer(AccountID);
		end;
		CPlayerService:ReadyCreateSession(info[1],info[2],info[3], info[4], info[5]);
	else
		local objPlayer = CPlayerManager:GetPlayer(AccountID);
		if objPlayer then		
			objPlayer.OnSelectLineRtMsg
			{
				AccountID   = AccountID;
				LineID      = LineID,				--��ID
				ResultCode  = ResultCode,			--���ر��� 
				Sign        = Sing;
			}
			if ResultCode == 0 then
				CLoginMode:LoadRole(AccountID,objPlayer:GetRoleID(),objPlayer.sRoleInfo.szRoleName,LineID,objPlayer.dwNewFlag)
				_switchserver(objPlayer.objNet, LineID);
			else
				if ResultCode == -1 then
					--GS���ʧ��
					objPlayer.CreateGameSessionRequestMsg{ResultCode = -18}
					_closenet(objPlayer.objNet);
				elseif ResultCode == -2 then
					objPlayer.bSelectLining = nil;
					--Ŀ���߲�����
				elseif ResultCode == -3 then
					objPlayer.bSelectLining = nil;
					--Ŀ��������
				elseif ResultCode == -4 then
					--�������ڱ��˶�
					objPlayer.CreateGameSessionRequestMsg{ResultCode = -17}
					_closenet(objPlayer.objNet);
				end
			end;
		end;
	end;
end;


