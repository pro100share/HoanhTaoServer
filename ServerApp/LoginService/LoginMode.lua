--��¼ʱ��ģ��

--����λ�ĸ�ʽȫ��д%s

_G.ParamType =
{
	dwRoleID = 1,
	dwAccountID = 2,
	szRoleName = 3,
}

_G.CLoginMode = {};

CLoginMode.tbMode = {};

--������
--dwSystemID:ϵͳID����SystemNameToID�ж���
--szSql:sql���
--tbParam:���Ĳ����б�����ר��ָ�������ͣ�ParamType
--dwExec:��һ��System�ж��Sql��Ҫִ��ʱ��������������ã�Ĭ����1
function CLoginMode:AddMode(dwSystemID,szSql,tbParam,dwExec,dwAccountFlag)
	local tb = 
	{
		System = dwSystemID;
		Sql = szSql;
		ExecFlag = dwAccountFlag or 0;
		ExecID = dwExec or 1;
		AccFlag = tbParam[1].Param;--dwAccountFlag or 0;
	}
	table.insert(CLoginMode.tbMode,tb);
end;

function CLoginMode:LoadMode()
	_lsvr:ModeLoadConfig(CLoginMode.tbMode);
	
	local tb = CConfig.RoleDB.ConnParam;
	_lsvr:DBConnect(tb.szConnectStr,tb.szUser,tb.szPwd,tb.szDBName);
end;

function CLoginMode:LoadRole(nAccount,nRoleID,szName,dwLineID,dwNewFlag)
	-- print("===CLoginMode:LoadRole===",nAccount,nRoleID,szName,dwLineID,dwNewFlag)
	_RoleLoad(nAccount,nRoleID,szName,dwLineID,dwNewFlag);
end;



_G.OnRoleLoadOver = function(dwAccount,nSendTo)
	--print("===_G.OnRoleLoadOver===",dwAccount)
	CKSApp.OnRoleLoadOverMsg
	{
		AccountID = dwAccount;
		SendToLine = nSendTo;
	};
end;
_setLoginOver("OnRoleLoadOver");

