_G.CGameApp = {}
CGameApp.setCallBackInfo = {};

_G.GSRemoteCall = function(dwRoleID,szSystem,szFunc,tabArg,fnCallBack)
	CGameApp.GSRemoteCallMsg{
		_rid = dwRoleID,
		_cbk = fnCallBack,
        RoleID = dwRoleID,
        System = szSystem,
        Func = szFunc,
        Args = tabArg
	}
end

function CGameApp:Create()   
	CGameApp.dwCurSendKey = 1; 
	setmetatable(CGameApp,{__index=function(CGameApp,func,arg) 
		if type(func) =='string' and func:byte(1) >= 65 and func:byte(1) <= 91 then
			return function(arg)
				--检查是不是在本地
				if arg._rid then --如果有玩家id，首先判断是不是本地的
					local objUser = CPlayerManager:GetPlayerByRoleID(arg._rid);
					if objUser then
                        arg._aid = objUser:GetAccountID();
                        if _G[func] then
                            _G[func](arg);--直接调函数 
                        end;
						if arg._cbk then
							arg._cbk(arg._rid, 0, arg._key);--直接回调
						end;
						return;
					end;
				end;
				
                local taskID    = 0;
                local rid       = 0;
                if arg._cbk then
                    taskID      = CGameApp.dwCurSendKey;
                    CGameApp.setCallBackInfo[taskID] ={arg._rid, arg._cbk, arg._key};
					CGameApp.dwCurSendKey = CGameApp.dwCurSendKey +1;
                    arg._cbk = nil;
                    arg._key = nil;
                end;
                if arg._rid then
                    rid = arg._rid;
                    arg._rid = nil;
                end;
                CKernelApp.ProcessTransMsg{
                    TaskID  = taskID;
                    RID     = rid;
                    Name    = func;
                    Arg     = arg;
                };
			end
		end 
	end
	}) 
end;

--远程调用函数
define.GSRemoteCallMsg
{
	RoleID = 0,		--对应的角色id
	System = "",
	Func = "",
	Args ={}
}
when{}
function GSRemoteCallMsg(RoleID,System,Func,Args)
	if RoleID > 0 then
		local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID);
		if not objPlayer then
			_info("user not exisits:",RoleID);
			return;
		end;
		local sys = objPlayer:GetSystem(System);
		if not sys then
			_err("call sys by :",System);
			return;
		end;
		local func = sys[Func];
		if func and type(func) == "function" then
			func(sys, unpack(Args));
		end;
	else
		for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
			local  b, s = pcall(
				function ()
					local sys = objPlayer:GetSystem(System);
					if sys then
						local func = sys[Func];
						if func and type(func) == "function" then
							func(sys, unpack(Args));
						end;
					else
						_err("call sys by :",i,System);
					end;
				end
			);
			if not b then
				_err("GSRemoteCallMsg Error: ", s);
			end
		end; 
	end;
end;
--执行回调
define.GSRemoteCallBackMsg
{
	KeyID = 0; --掉用键值
	Result = 0; --返回编码 0成功， -1失败
}
when{}
function GSRemoteCallBackMsg(KeyID,Result)
	local sInfo = CGameApp.setCallBackInfo[KeyID];
	if not sInfo then
		return;
	end;
	sInfo[2](sInfo[1],Result,sInfo[3]);
	--释放内存
	CGameApp.setCallBackInfo[KeyID] = nil;
end; 
