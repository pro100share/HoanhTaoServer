------------------------------------------------
--系统基础
------------------------------------------------
_G.CSystem = {}
CMemoryDebug:Show("ObjSystem");
function CSystem:new(szName)
	local obj ={};
	obj.szName = szName;
	obj.objPlayer =	nil;	--系统所属的玩家
	obj.objSysMgr = nil;    --系统管理器
	for i, v in pairs(CSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	CMemoryDebug:AddObject("ObjSystem", obj);
	return obj;
end;

function CSystem:Create()
	return true;
end;

function CSystem:Update(dwInterval)
	return true;
end;

function CSystem:UpdateEX(dwInterval)
	return true;
end;

function CSystem:Destroy()
	self.objPlayer = nil;
end;

--客户端进入游戏登入所有场景之后
function CSystem:OnEnterScene()
	
end;

--切换场景完毕
function CSystem:OnChangeSceneEnd()
	
end;

function CSystem:GetPlayer()
	return self.objPlayer;
end;

--添加权限检测 mod by gzy 2012-5-15
function CSystem:HasAuthority(szAuthority)
	local objSystem = self.objPlayer:GetSystem('CAuthoritySystem')
	return objSystem:CheckAuthority(szAuthority)
end;
--mod end
--系统换线开始
function CSystem:OnChangeLineBegin(dwNewLineID)
end;
--系统换线结束
function CSystem:OnChangeLineEnd(dwNewLineID)
end;

--启动换线时候的检查
function CSystem:OnChangeLineCheck(dwNewLineID)
	return true;
end;

------------------------------------------------
--系统管理器
------------------------------------------------
_G.CSystemManager = {};
--系统管理器，
CSystemManager.setAllSystem = {};
CSystemManager.objPlayer = nil;

_G.tmExecUpdateTime = 0;
_G.dwExecUpdateNumber = 1;

_G.tbSystemExecInfo = {};

function CSystemManager:new(objPlayer)
    local obj = obj or {};
	--setmetatable(obj,{__index = CSystemManager});
	obj.setAllSystem = {};
	obj.setSystemSque = {};
	obj.objPlayer = objPlayer;
	obj.setUpdateFuncForSystem = {};--system需要update执行的函数
	for i,v in pairs(CSystemManager) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	
	return obj;
end;


--注册系统
function CSystemManager:AddSystem(objSystem,eUpdateInterval)
    objSystem.objPlayer = self.objPlayer;
    self.setAllSystem[objSystem.szName] = objSystem;
	table.insert(self.setSystemSque,objSystem);
	objSystem.objSysMgr = self;
	objSystem.eUpdateInterval = eUpdateInterval;
end;

--通知所有系统创建
function CSystemManager:Create(bIsChangeLine)
	for I,System in ipairs(self.setSystemSque) do
		local fn = function() return System:Create(bIsChangeLine) end;
		local ok, result = pcall(fn);
		if ok then
			if System.eUpdateInterval then
				System.objDriver = CDriverManager:AddDriver(
					System.eUpdateInterval,System,System.Update
				);
			end
		else
			_err(System.szName, result);
		end;
	end;
	self.bCreate = true;
	return true;
end;
--通知所有系统释放
function CSystemManager:Destroy()
	print("System destroy begin");
	for I,System in ipairs(self.setSystemSque) do
		if System.objDriver then
			CDriverManager:DelDriver(System.objDriver);
		end
		local fn = function() return System:Destroy() end;
		local ok, result = pcall(fn);
		if not ok then
			_err(System.szName, result);
		end;
	end;
	for I,System in ipairs(self.setSystemSque) do
		System.objPlayer = nil;
	end;
	print("System destroy end");
end;

--客户端进入游戏登入所有场景之后
function CSystemManager:EnterScene()
	for I,System in ipairs(self.setSystemSque) do
		System:OnEnterScene();
	end;
end;

--切换场景完毕
function CSystemManager:ChangeSceneEnd()
	for I,System in ipairs(self.setSystemSque) do
		System:OnChangeSceneEnd();
	end;
end;

function CSystemManager:OnDead(dwEnemyType,dwEnemyID)
	for I,System in ipairs(self.setSystemSque) do
		local func = System["OnDead"];
		if func then
			func(System,dwEnemyType,dwEnemyID);
		end
	end;
end;
--进入安全区
function CSystemManager:OnEnterSafeArea()
	for I,System in ipairs(self.setSystemSque) do
		local func = System["OnEnterSafeArea"];
		if func then
			func(System);
		end
	end;
end;
--进入非安全区
function CSystemManager:OnEnterDangerArea()
	for I,System in ipairs(self.setSystemSque) do
		local func = System["OnEnterDangerArea"];
		if func then
			func(System);
		end
	end;
end;

--系统换线开始
function CSystemManager:ChangeLineBegin(dwNewLineID)
	for I,System in ipairs(self.setSystemSque) do
		local ok, result = pcall(function () return System:OnChangeLineBegin(dwNewLineID) end);
		if not ok then
			_err(System.szName, result);
		end;
	end;
end;
--系统换线结束
function CSystemManager:ChangeLineEnd(dwNewLineID)
	for I,System in ipairs(self.setSystemSque) do
		local ok, result = pcall(function () return System:OnChangeLineEnd(dwNewLineID) end);
		if not ok then
			_err(System.szName, result);
		end;
	end;
end;

--启动换线时候的检查
function CSystemManager:ChangeLineCheck(dwNewLineID)
	if not self.bCreate then return false end;
	for I,System in ipairs(self.setSystemSque) do
		if not System:OnChangeLineCheck(dwNewLineID) then
			return false;
		end;
	end;
	return true;
end;

--KS重连完成
function CSystemManager:KSReConnect()
	for I,System in ipairs(self.setSystemSque) do
		local func = System["OnKSReConnect"];
		if func then
			func(System);
		end
	end;
	return true;
end;

--子类需要一个函数来注册所有的系统
   
--得到一个子系统
function CSystemManager:GetSystem(szSystemName)
	return self.setAllSystem[szSystemName];
end;

--系统换线开始
function CSystemManager:EnterCrossBegin(dwNewLineID)
	for I,System in ipairs(self.setSystemSque) do	
		local func = System["OnEnterCrossBegin"];
		if func then
			local ok, result = pcall(function () return System:OnEnterCrossBegin(dwNewLineID) end);
			if not ok then
				_err(System.szName, result);
			end;
		end
	end;
end;
--系统换线结束
function CSystemManager:EnterCrossEnd(dwNewLineID)
	print("===========+++++++++++++++++++++++===================");
	for I,System in ipairs(self.setSystemSque) do
		local func = System["OnEnterCrossEnd"];
		if func then
			print("===========+++++++++++++++++++++++111===================", System.szName);
			local ok, result = pcall(function () return System:OnEnterCrossEnd(dwNewLineID) end);
			if not ok then
				_err(System.szName, result);
			end;
		end
	end;
end;


