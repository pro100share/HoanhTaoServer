--[[
文件：LoginApp.lua
类名：CLoginApp
功能说明：游戏服务器针对于登陆服务器的客户端，
备注：
作者：周华杰
版本：v1.0
修改者：
]] 
_G.CLoginApp = {} 
---------------------------------------------------------- 

--创建
function CLoginApp:Create()

	return true;
end;

--释放function C
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
		
