--登录数据的接受端

_G.CLoginDataManager = {};

CLoginDataManager.setLoginData = {};
CLoginDataManager.setDataFunction = {};
CLoginDataManager.setAccountNewFlag = {};

CLoginDataManager.setLoginDataEmpty = {};

local errSystemExec = 
{
	CAmuletSystem = {1};
	CBournSystem = {1};
	CVipSystem = {1};
	CTianGuanCiFuSystem = {1};
	CBuildRampartSystem = {1};
	CDataCenterSystem = {1};
	CDuplSystem = {2,4};
	CFriendSystem = {1};
	CGiftSystem = {1};
	CItemSystem = {1};
	CMapSystem = {1};
	CMarriageSystem = {2};
	CMartialSystem = {1};
	CMissionDailySystem = {1};
	CMountSystem = {1};
	CMuseSystem = {1};
	CNpcConnectionSystem = {1};
	CPKSystem = {1};
	CPlayerShopSystem = {2};
	CPulseSystem = {1};
	CSettingSystem = {1};
	CSkillSystem = {2};
	CTaskSystem = {2};
}


function CLoginDataManager:AddLoginData(dwAccountID,dwSystemID,bIsNewRole,dwExecID,dwRowNum,data)
	local szSystem = SystemIDToName[dwSystemID];
	--print("===AddLoginData===",bIsNewRole,data)
	if not szSystem then
		-- print("ERROR: Login Data SystemID err",dwSystemID)
		return;
	end
	
	if (bIsNewRole == false) and (#data == 0) then
		local isNeedShow = false;
		local tbList = errSystemExec[szSystem];
		if tbList then
			for _,v in pairs(tbList)do
				if v == dwExecID then
					isNeedShow = true;
					break;
				end
			end
		end
		
		if isNeedShow then
			_info("ERROR: Login Data Empty ",dwAccountID,szSystem,dwExecID)
			-- self.setLoginDataEmpty[dwAccountID] = 1;
		end
	end
	
	self.setAccountNewFlag[dwAccountID] = bIsNewRole;
	
	if not self.setLoginData[dwAccountID] then
		self.setLoginData[dwAccountID] = {};
	end
	if not self.setLoginData[dwAccountID][szSystem] then
		self.setLoginData[dwAccountID][szSystem] = {};
	end
	if not self.setLoginData[dwAccountID][szSystem][dwExecID] then
		self.setLoginData[dwAccountID][szSystem][dwExecID] = {};
	end
	
	local tbCurExec = self.setLoginData[dwAccountID][szSystem][dwExecID];
	
	if dwRowNum > 0 then
		for k,v in pairs(data)do
			table.insert(tbCurExec,v);
		end
	end
	
	-- table.insert(
		-- self.setLoginData[dwAccountID][szSystem][dwExecID],
		-- tbTemp
	-- );
end;

function CLoginDataManager:AddDataFunc(szSystem,func)
	self.setDataFunction[szSystem] = func;
end;

function CLoginDataManager:ExecDataFunc(objPlayer)
	local dwAccountID = objPlayer:GetAccountID();
	
	-- if self.setLoginDataEmpty[dwAccountID] then
		-- self.setLoginDataEmpty[dwAccountID] = nil;
		-- _closenet(objPlayer.objNet);
		-- return;
	-- end
	
	for n,v in pairs(SystemNameToID)do
		--print("===ExecDataFunc===",v)
		_loadinfo(dwAccountID,v);
	end
	
	local tbAllLoginData = self.setLoginData[dwAccountID];
	if not tbAllLoginData then
		return;
	end
	
	--print("****ExecDataFunc**",self.setAccountNewFlag[dwAccountID])
	
	for szSystem,tbInfo in pairs(tbAllLoginData)do
		local func = self.setDataFunction[szSystem];
		if func then
			func(objPlayer,tbInfo,self.setAccountNewFlag[dwAccountID])
		end
	end
	
	self.setLoginData[dwAccountID] = nil;
	
	return true;
end;

--处理Login数据的过程中发现异常，则设置这个函数
function CLoginDataManager:SetLoginFail(dwAccountID)
	
end;

function CLoginDataManager:ClearData(dwAccountID)
	self.setLoginData[dwAccountID] = nil;
	self.setAccountNewFlag[dwAccountID] = nil;
end;

_G.FunctionLoginData = function(dwAccountID,dwSystemID,bIsNewRole,dwExecID,dwRowNum,data)
	--print("===FunctionLoginData===",dwAccountID,dwSystemID,bIsNewRole,dwExecID,dwRowNum,data);
	CLoginDataManager:AddLoginData(dwAccountID,dwSystemID,bIsNewRole,dwExecID,dwRowNum,data);
end;
_G.FunctionLoginDataEnd = function(dwAccountID) 
	CPlayerManager:ProcCreateSession(dwAccountID);
end;
define.GSSendChangeLineDataEndMsg
{
	AccountID = 0;
}
when{}
function GSSendChangeLineDataEndMsg(AccountID) 
	CPlayerManager:ProcCreateSession(AccountID);
end;


------------------------------------------------------------------------------------
---------------------------------------跨服战场-------------------------------------
------------------------------------------------------------------------------------
define.GSSendCrossDataEndMsg
{
	AccountID = 0;
}
when{}
function GSSendCrossDataEndMsg(AccountID) 
	CPlayerManager:CrossProcCreateSession(AccountID);
end;

--_setlogincall("FunctionLoginData");


_G.CLoginCall = {}
function CLoginCall:AddCall(szSystem,func)
	CLoginDataManager:AddDataFunc(szSystem,func);
end;
