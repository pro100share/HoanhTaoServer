 --[[
�ļ���BaseService/BaseServiceMsg.lua
���ߣ��ܻ���  
]] 


---�����ķ��������������ڴ���һ����ң�
define.GSAddPlayerMsg
{ 
	PlayerInfo = {};   --���䵽����Ϸ�˿ڣ�ͨ��������Ϸ�������˿�+��id
	ChangeLineParam = {};
}
when{}
function GSAddPlayerMsg(PlayerInfo,ChangeLineParam)
    --print("===GSAddPlayerMsg===")
	CKernelApp:AddPlayerRequest(PlayerInfo,ChangeLineParam);
end; 

define.UserChargeGlodMsg
{
	user = NONE ;
	RoleID = 0;
	Gold = 0;
}
when{user = NONE}
UserChargeGlodMsg = checkKSUser
when{}
function UserChargeGlodMsg(user, RoleID, Gold)
	local player = CPlayerManager:GetPlayerByRoleID(RoleID);
	if player then
		player:ChargeGold(Gold);
	end
end; 

--KS������Ϣ
define.DelReplaceUserMsg
{
	AccountID = 0 ; 
} 
when{}
function DelReplaceUserMsg(AccountID)
	_info("==LoginStep==6==", AccountID);
	local sInfo = CKernelApp:PopSessionInfo(AccountID);
	_info("DelReplaceUserMsg(AccountID)! 1",AccountID);
	if CPlayerManager:IsSavingAccount(AccountID) then--���ڱ�����ǲ����ظ�ɾ���ģ���Ҫ�ȴ�
		_info("IsSavingAccount!!!!!!!!!!!!!!!!!!! 1",AccountID);
		return 
	end
	_info("DelReplaceUserMsg(AccountID)! 2",AccountID);
	local user = CPlayerManager:GetPlayer(AccountID);
	if user then
		user.CreateGameSessionRequestMsg{ResultCode = -23}--�����˺��ڱ𴦵�¼
		CPlayerManager:DelPlayer(AccountID);
		_closenet(user.objNet);
		_info("DelReplaceUserMsg(AccountID)! 3",user.objNet,AccountID); 
	else
		if CPlayerManager.setCrossAllPlayer[AccountID] then
			--print("------------------33333333333333----------", CPlayerManager.setCrossAllPlayer[AccountID]);
			CPlayerManager.setCrossAllPlayer[AccountID].CreateGameSessionRequestMsg{ResultCode = -23}--�����˺��ڱ𴦵�¼
		else
			CKernelApp:SendDelPlayer(AccountID, nil, _G.GSDelPlayerReason.GSKick);
			_info("DelReplaceUserMsg(AccountID)! 4",AccountID);
		end;
	end;
end;

define.GSUpdateLifeResMsg{}
when{}
function GSUpdateLifeResMsg()
	print("GSUpdateLifeResMsg !!!!!!!!!!!!!!!!!!!");
end;
-----------------------------------------------------
--�����Ϣ
-----------------------------------------------------
define.CreateGameSessionRequestMsg
{
	AccountID = 0;
	Sign = "";
	IsFrist = true;
}
when{}
function CreateGameSessionRequestMsg(AccountID,Sign,IsFrist)
    local client = CGameService:GetClientByNet(_from); 
	if not client then return end;
    client.dwAccountID = AccountID;
	local nRetCode = CPlayerManager:CreateSession(_from,AccountID,Sign);
	if nRetCode < 0 then
		CTransitManager:ClearData(AccountID);
		CLoginDataManager:ClearData(AccountID);
		if nRetCode > -5 then
			CKernelApp.setTempPlayerInfo[AccountID] = nil;
			CKernelApp:SendDelPlayer(AccountID,Sign, _G.GSDelPlayerReason.GSKick);
		end;
		client.CreateGameSessionRequestMsg{ResultCode =nRetCode};
        _closenet(_from);
		_info("Create Session error Close net", AccountID, nRetCode);
		return;
	else 
        client.CreateGameSessionRequestMsg{ResultCode =nRetCode};
	end;
end;  
-----------------------------------------------------
--�������
-----------------------------------------------------
define.CreatePlayerMsg{
	AccountID = 0;
}
when{}
function CreatePlayerMsg(AccountID)
	CPlayerManager:CreatePlayer(AccountID)
	CTransitManager:ClearData(AccountID)
	CLoginDataManager:ClearData(AccountID);
end

-------------------------
--������ʱ��ͬ��Э��
-------------------------
define.RequestTimeMsg{user = NONE,
ReqTime =0,	--�ͻ��˷�������ʱ��Ŀͻ���ʱ��
 }
when{user = NONE} 
RequestTimeMsg = checkUser
when{}
function RequestTimeMsg(user,ReqTime)
	local dwServerTime = _now(); --ȡ�÷������ϵ�ʱ��
	user.ResultTimeMsg{ServerTime=dwServerTime,ReqTime = ReqTime};
end;  


define.WriteInfoToDBMsg
{
	user = NONE ,	
	RoleID = 0 ,	
	OperFlag = true,
}
when {user = NONE}
WriteInfoToDBMsg = checkUser
when{}
function WriteInfoToDBMsg(user,RoleID, OperFlag)
	user:RecordInfo(RoleID, OperFlag);
end; 

--����л���Ϸ��·
define.ChangeGameLineMsg
{
	user = NONE,
	NewGameLine = 0,
}
when{ user = NONE }
ChangeGameLineMsg = checkUser
when{ }
function ChangeGameLineMsg(user,NewGameLine)
	user:ClientChangeLineReq(NewGameLine);
end; 

define.DesconnectMsg
{
	user = NONE, 
}
when{ user = NONE }
DesconnectMsg = checkUser
when{ }
function DesconnectMsg(user)
    _closenet(user.objNet);
end; 

define.KSChangeLineResMsg
{
	AccountID = 0,
	ResCode = 0,
	Param = {};
} 
when{ }
function KSChangeLineResMsg(AccountID,ResCode,Param) 
	local objPlayer = CPlayerManager:GetPlayer(AccountID);
	if objPlayer then
		objPlayer:KSChangeLineRes(ResCode,Param);
	end;
end; 


---------------------------
--ִ������㷢�����Ľű�
define.KSBroadCastSourceMsg
{
	Source = ""
}
when{}
function KSBroadCastSourceMsg(Source)
	pcall(loadstring(Source))
end


-----------------------------
--KS֪ͨɾ����ɫ������Ҫ����
define.KSDelRoleByNoneMsg
{
	AccountID = 0;
}
when{}
function KSDelRoleByNoneMsg(AccountID)
	local sInfo = CKernelApp:PopSessionInfo(AccountID);
	_info("KSDelRoleByNoneMsg(AccountID) ",AccountID,sInfo);--����лػ���Ϣ��ɾ��
	
	if CPlayerManager:IsSavingAccount(AccountID) then return end
	
	local user = CPlayerManager:GetPlayer(AccountID);
	if user then
		user.CreateGameSessionRequestMsg{ResultCode = -22}
		_closenet(user.objNet);
	end;
	
	--���Login��DB���ݣ�ɾ��
	CLoginDataManager:ClearData(AccountID)
end;






