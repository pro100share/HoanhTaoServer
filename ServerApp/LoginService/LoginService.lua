--[[
文件：LoginService/LoginService.lua
类名：CLoginService
功能说明：登录服务器
备注：
作者：刘科建
版本：v1.0
修改者：
]]


_G.CLoginService = {}

function CLoginService:Create()
  	_info("Connect Account DB"); 
	_G.CAccountDBQuery = CSql:Connect(CConfig.AccountDB.ConnParam);
	_info 'Connect Account DB Success';
	
	_info('Connect Player DB');
    _G.CPlayerDBQuery = CSql:Connect(CConfig.RoleDB.ConnParam);
	_info 'Connect Player DB Success';
    
    CPlayerManager:Create();
	
    CKSApp:Create();
   
    CPSApp:Create();
	
	CLoginMode:LoadMode()
    
	return true;
end; 


--[[
功能：程序释放，退出的时候调用
备注：
]]
function CLoginService:Destroy()
	
end;


-- 处理注册数据库
function CLoginService:RegisterUser(szAccount, szPwd)
    --print("Regist User==", szAccount, szPwd);
	local dbRes = CAccountDBQuery:execute('select * from "T_Account_Info" where "szAccount" = $1',string.lower(szAccount));
	if dbRes then
		return {2};
	end;
	
	local dbRes = CAccountDBQuery:execute('INSERT into "T_Account_Info"("szAccount", "szPwd") VALUES($1, $2)',string.lower(szAccount), szPwd);
	if not dbRes then
		-- print('Register User error');
		return {1};
	end;
	
	return {0};
end;


function CLoginService:LoginUser(szAccount,szPwd)
	szAccount = string.lower(szAccount);
    --print("Login User==", szAccount, szPwd);
	local dbres = CAccountDBQuery:execute('SELECT "dwAccountID","dwAdultFlag" FROM "T_Account_Info" where "szAccount"=$1 and "szPwd"=$2',szAccount, szPwd);
	if not dbres then 
        -- print('OnLogin Ret Error',szAccount); 
		return {-1};
	end;
	local dwAccountID,dwAdultFlag;
	--读取数据	
	dwAccountID = dbres[1].dwAccountID;
	dwAdultFlag = dbres[1].dwAdultFlag or 0;
	--账号是不是错误的
	if (not dwAccountID) 
	or (dwAccountID > 1000000000000)
	or (dwAccountID <= 0)then
        -- print('OnLogin Ret Error',szAccount); 
		return {-1};
	end;
    local sInfo ={}; 
    sInfo[1] = dwAccountID;
    sInfo[2] = os.utc(1)-_time(1,{year=1970,month=1,day=1,hour=0,min=0,sec=0});
    local szCheck =  tostring(dwAdultFlag)..tostring(dwAccountID)..tostring(sInfo[2]).."themgai1";
    sInfo[3]  = szCheck:md5();
    sInfo[4] = dwAdultFlag; 
    return {0, sInfo};
end;


--通过账号，获取玩家的元宝信息
function CLoginService:GetGoldByAccountID(dwAccountID)
	local Data = CAccountDBQuery:execute('select "dwGlod","bISGM" from "T_Account" where "dwAccountID" = $1',dwAccountID);
	if not Data then
        local nowTime = _now()
		local SqlCmd = CAccountDBQuery:CreateInsertCmd('T_Account');

        SqlCmd.Fields.dwAccountID       = dwAccountID;
        SqlCmd.Fields.szUserName		= "szUserName";
        SqlCmd.Fields.dwGlod		    = 0;
        SqlCmd.Fields.dwMoney			= 0;
        SqlCmd.Fields.tmRegTime			= nowTime;
        SqlCmd.Fields.tmLostTime		= nowTime;
        
        SqlCmd:execute();
		return 0, 0;
	end; 
	return Data[1].dwGlod or 0,Data[1].bISGM or 0;
end;



_G.UserRegist = function(arg)
    return CLoginService:RegisterUser(arg[1], arg[2]);
end;
_userregist("UserRegist");


_G.UserLogin = function(arg)
    return CLoginService:LoginUser(arg[1], arg[2]);
end;
_userlogin("UserLogin");



