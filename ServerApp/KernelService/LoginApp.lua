--[[
�ļ���LoginApp.lua
������CLoginApp
����˵������Ϸ����������ڵ�½�������Ŀͻ��ˣ�
��ע��
���ߣ��ܻ���
�汾��v1.0
�޸��ߣ�
]] 
_G.CLoginApp = {} 
---------------------------------------------------------- 

--����
function CLoginApp:Create()

	return true;
end;

--�ͷ�function C
function CLoginApp:Destroy()
	
end;


function CLoginApp:OnConnect(objNet)
	-- print("Login Server Connect");
    self.objNet = objNet;
    _mycallout(self);
    CGameLineManager:UpdateGameLineInfo(1);--send all
end;

function CLoginApp:OnDisconnect() 
	_err("Login Server Disconnect");
	self.objNet = nil;
end;

function CLoginApp:SendMsg(nType,args)
	
end;

function _G.LoginAppConn()
	CGameLineManager:UpdateGameLineInfo(1);
end;
		
