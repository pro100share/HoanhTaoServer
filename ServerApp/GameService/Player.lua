 --[[
文件：BaseService/Player.lua
类名：CPlayer
功能说明：玩家类
备注：
作者：周华杰
版本：v1.0
修改者：
]]
 dofile 'GameService/PlayerInfoDefine.lua'
_G.CPlayer = { }; 
--------------------------
--角色信息相关数据
--------------------------
--玩家包含的所有角色
CPlayer.setAllRoleInfo ={};

--角色固定基本信息
CPlayer.sRoleInfo= nil;			--角色信息，玩家模块的基本信息

----------------------------------------------------
--玩家类
---------------------------------------------------- 
function CPlayer:new(dwAccountID,objDB,sPlayerInfo)
	--local obj = objNet;--{};
	local obj = {}; 
	
	obj.objSystemMgr = nil;
	obj.objDBQuery = CPlayerDBCache:new(dwAccountID);
	obj.dwAccountID = dwAccountID;
	--玩家所有的角色
	obj.setAllRoleInfo ={};
	--周兴团--5-4
	obj.szSign = sPlayerInfo.szSign; --玩家验证信息
	obj.dwGold = sPlayerInfo.dwGold; --玩家的元宝信息 
	obj.dwAdultFlag = sPlayerInfo.dwAdultFlag; --0是未成年人，1是成年人；0将会被列入防沉迷系统
--	obj.dwAddicted = sPlayerInfo.dwAddicted; --计入防沉迷的收益比例
	obj.dwAddicted = 1.0; --暂时关闭防沉迷
	obj.dwIPAddr = sPlayerInfo.dwIPAddr; --玩家IP地址
	if not sPlayerInfo.bIsGM or sPlayerInfo.bIsGM == 0 then
		obj.bGMAllowed = false;	--玩家是否有GM权限
	else
		obj.bGMAllowed = true;	--玩家是否有GM权限
	end;
	obj.dwRoleCount = sPlayerInfo.dwRoleCount; --玩家所有的角色
	
	--Player对象是否已经初始化完成的标识
	obj.isLoadEnd = false;
	
   --下面的属性使用在玩家当前角色上
	--创建系统管理器
	obj.objSystemMgr = CPlayerSystems:new(obj);
	
	obj.setPfxList = {};--角色外观的持续性pfx队列
	obj.setModelList = {}; ---角色模型改变列表
	obj.tbUpdateInfo = SynchData:new();

	for i,v in pairs(CPlayer) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;
----------------------------------------------------
--基础相关
----------------------------------------------------


--得到服务器ID
function CPlayer:GetSid() 
	return math.mod(self.dwAccountID,10000);
end; 
--得到玩家数据库,数据库对象：_Database对象
function CPlayer:GetDBQuery()
	return self.objDBQuery;
end;

function CPlayer:SetRoleCount(dwCount)
	self.dwRoleCount = dwCount;
end;

--玩家创建
function CPlayer:Create(bIsChangeLine)  --0：不换线 1：换线 2：跨服战场
	_info("=====================CPlayer:Create===========================", bIsChangeLine);
	local dwAccountID = self:GetAccountID();
	if bIsChangeLine == 0 then
		CPlayerDBQuery:AddAccount(dwAccountID);
	else
		CPlayerDBQuery:AddAccount(dwAccountID,2);
	end;
	_info("=====================CPlayer:Create=1==========================");
	local sInfo = CTransitManager:GetData(dwAccountID,"Player")[1]
	self.sRoleInfo = sInfo
	RoleUpLevelConfig:CompeteLevel(sInfo.dwExp,sInfo); --重算经验
	if bIsChangeLine == 0 then
		if not CLoginDataManager:ExecDataFunc(self) then
			return;
		end
	end;

	if bIsChangeLine == 2 then
		_info("---------test1----------");
		local ok, result = pcall(function() return self.objSystemMgr:CrossOnRegSystems() end);
		-- print(ok, result);
		_info("---------test2----------");
	else
		self.objSystemMgr:OnRegSystems();
	end;
	if not self.objSystemMgr:Create(bIsChangeLine) then
		return;
	end;	
	_info("=====================CPlayer:Create=4==========================");
	local petSystem = self.objSystemMgr:GetSystem("CPetSystem");
	if petSystem then
		petSystem:OnCreateOver();
	end
	
	_info("=====================CPlayer:Create=5==========================");
	local objSkillSystem = self:GetSystem("CSkillSystem");
	if objSkillSystem then
		objSkillSystem:OnCreateOver(bIsChangeLine);
	end

	if bIsChangeLine == 1 then
		self.objSystemMgr:ChangeLineEnd(CKernelApp.dwLineID);
		
		self.bIsChangeLine = true;
	end;
	_info("=====================CPlayer:Create=7==========================");
	self.objDriver = CDriverManager:AddDriver(eInterval._1min,self,self.Update);
	
	--只要进入GS，就不是新建角色了
	self.sRoleInfo.dwNewRoleFlag = 0;
	return true;
end;

--玩家驱动
function CPlayer:Update(dwInterval)
	if self.bExpChange then
		local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Info');
		SqlCmd.Wheres.dwRoleID		= self.sRoleInfo.dwRoleID;
		SqlCmd.Fields.dwTotalExp	= self.sRoleInfo.dwExp;
		SqlCmd:execute(); 
		self.bExpChange = false;
	end;
	
	local dwAccountID = self:GetAccountID();
	CKernelApp.UpdateRoleInfoMsg{_aid = dwAccountID,RoleInfo = self.sRoleInfo};
end;

--玩家释放
function CPlayer:Destroy(bIsChangeLine)
	local itSys = self:GetSystem("CItemSystem")	
	local nLockGold = itSys:GetLockedGold()
	if nLockGold > 0 then
		itSys:UnlockGold(nLockGold)
		itSys:CostGold(nLockGold, _G.ItemSysOperType.isLocked)
		_info("=Destroy,GoldLocked=",self.dwAccountID,nLockGold)
	end	
	local nLockMoney = itSys:GetPacket():GetLockedMoney()
	if nLockMoney > 0 then
		itSys:UnlockPacketMoney(nLockMoney)
		itSys:CostPacketMoney(nLockMoney, _G.ItemSysOperType.isLocked)
		_info("=Destroy,MoneyLocked=",self.dwAccountID,nLockMoney)
	end
	self.bDestroy = true;
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver);
	end
	if not CConfig.bIsCrossSvr then
		local objWarSys = self:GetSystem("CWarSystem");
		if objWarSys then
			objWarSys:OnDestroyBegin();
		end
	end;
	if bIsChangeLine and bIsChangeLine == 1 then	
        bIsChangeLine = true;
		self.objSystemMgr:ChangeLineBegin(self.dwChangeToLineID);
	else
        bIsChangeLine = false;
        CLogSystemManager:logout( self )
	end;
	
	if self.objSystemMgr then
		self.objSystemMgr:Destroy();
		self.objSystemMgr = nil;
	end;
	
	if self.bExpChange then
		local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Info');
		SqlCmd.Wheres.dwRoleID		= self.sRoleInfo.dwRoleID;
		SqlCmd.Fields.dwTotalExp	= self.sRoleInfo.dwExp;
		SqlCmd:execute();
	end;
	
	local dwAccountID = self:GetAccountID();
	CKernelApp.UpdateRoleInfoMsg{_aid = dwAccountID,RoleInfo = self.sRoleInfo};

	if bIsChangeLine then
		local fnFinished = function()
			-- CTransitManager:AddPlayerData(
				-- dwAccountID,"Player",self.sRoleInfo
			-- ) 
			_callouttoline("GSOnRecvTransitDataMsg", {AccountId=dwAccountID,SystemName="Player",Data=self.sRoleInfo}, self.dwChangeToLineID);
			_callouttoline("GSSendChangeLineDataEndMsg", {AccountID=dwAccountID}, self.dwChangeToLineID);
			-- CTransitManager:SendPlayerData(
				-- dwAccountID,_fnFinished, self.dwChangeToLineID
			-- )
			--换线完成，通知客户端
			-- self.OnChangeLineRtMsg{
				-- NewLineID	= self.dwChangeToLineID,
				-- ResultCode	= 0,
				-- Sign		= self.tbChangeLineInfo.Sign
			-- };
			_switchserver(self.objNet, self.dwChangeToLineID,self.tbChangeLineInfo.Sign);
			self.dwChangeToLineID = nil;
			CPlayerManager.CurPlayerNum = CPlayerManager.CurPlayerNum - 1;
		end 
		CPlayerDBQuery:DelAccount(dwAccountID,fnFinished,2); --换线，不用通知
	else
		local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_Info');
		SqlCmd.Wheres.dwRoleID		= self.sRoleInfo.dwRoleID;
		SqlCmd.Fields.bOnline	    = false;
		SqlCmd:execute();

		local fnFinished = function()
			CKernelApp:SendDelPlayer(
				dwAccountID,self.szSign,GSDelPlayerReason.NetClose
			);
			CPlayerManager.CurPlayerNum = CPlayerManager.CurPlayerNum - 1;
			CTransitManager:ClearData(dwAccountID);
			CLoginDataManager:ClearData(dwAccountID);
		end
		CPlayerDBQuery:DelAccount(dwAccountID,fnFinished);
	end
end;

---------------------------------------------
---和当前角色相关的接口
---------------------------------------------
--周兴团--5-4--获取玩家的元宝数量
function CPlayer:GetGold()
	return self.dwGold;
end
--修改玩家的元宝数量，可增可减
function CPlayer:UpdateGold( dwValue )
	self.dwGold = self.dwGold + dwValue;
	if self.dwGold < 0 then
		_info("GoldError=1==!!!", self:GetAccountID(), self.dwGold, dwValue);
		local itSys = self:GetSystem("CItemSystem");
		if itSys then
			_info("GoldError=2==!!!", itSys:GetGoldNum());
		end;
		self.dwGold = 0;
	end;
	--发送消息到中心服务器上
    --print("====GS Update Gold=====", self.dwGold, dwValue);
	if not CConfig.bIsCrossSvr then
		CKernelApp.UpdatePlayerGoldInfoMsg{RoleID = self.dwAccountID,Gold=dwValue};
	end;
end
--玩家进行了充值操作
function CPlayer:ChargeGold( dwGold ) 
	self.dwGold = self.dwGold + dwGold;
	local itemSys = self:GetSystem("CItemSystem");
	if itemSys then
		itemSys:ChargeGold(dwGold);
	end
	local EventCenter =  self:GetSystem("CPlayerEventCenterSystem");
	if EventCenter then
		EventCenter:DoEvent("EventCharge", dwGold);
	end;
end
--判断玩家是否有GM权限
function CPlayer:IsGMAllowed()
	return self.bGMAllowed;
end
--判断玩家是否被列入防沉迷系统，返回true和false
function CPlayer:IsInAddicted()
	return self.dwAdultFlag == 0;
end
--更新玩家的防沉迷比例
function CPlayer:UpdateAddicted( dwValue )
	self.dwAddicted = dwValue;
	CKernelApp.UpdatePlayerAddictedInfoMsg{RoleID = self.dwAccountID,Addicted=self.dwAddicted};
end
--获取玩家的防沉迷比例 0~1.0
function CPlayer:GetAddicted()
	return self.dwAddicted;
end
---zhouxingtuan end

--Player增加两个获取信息的接口：IP地址和账号的名称---周兴团-6-8
function CPlayer:GetIP()
	return self.dwIPAddr or 0;
end
function CPlayer:SetIP(dwIP)
	self.dwIPAddr = dwIP
end
--设置换线临时数据
function CPlayer:SetLineData(szSysName,arrData)
	local dwAccountID = self:GetAccountID()
	--CTransitManager:AddPlayerData(dwAccountID,szSysName,arrData) 
	-- _info("===SetLineData===",szSysName)
	_callouttoline("GSOnRecvTransitDataMsg", {AccountId=dwAccountID,SystemName=szSysName,Data=arrData}, self.dwChangeToLineID);
end;
--获取换线临时数据
function CPlayer:GetLineData(szSysName)
	local dwAccountID = self:GetAccountID()
	return CTransitManager:GetData(dwAccountID,szSysName) or {};
end;

--设置换线临时数据
function CPlayer:SetCrossSvrData(szSysName,arrData)
	local dwAccountID = self:GetAccountID();
	_G.CallOutToWarKs("ReceiveCrossDataMsg", {AccountId=dwAccountID,RoleId = self:GetRoleID(), SystemName=szSysName,Data=arrData});
end;

--获取换线临时数据
function CPlayer:GetCrossSvrData(szSysName)
	local dwAccountID = self:GetAccountID()
	return CTransitManager:GetData(dwAccountID,szSysName) or {};
end;

---角色固定基本信息
--sInfo:SRoleInfo
function CPlayer:GetInfo()
	return self.sRoleInfo;
end;

function CPlayer:GetIncoID()
	local dwIncoID = self.sRoleInfo.dwIncoID;
	
	if dwIncoID == 0 then
		dwIncoID = self.sRoleInfo.dwDefIncoID;
	end
	if dwIncoID == 0 then
		dwIncoID = self.sRoleInfo.dwProf * 1000 + math.mod(self.sRoleInfo.dwDefHair,10000) - 1000
	end
	return dwIncoID;
end;

function CPlayer:GetBattleInfo()
	local info = {};
	
	local objSklSystem = self:GetSystem("CSkillSystem");
	if not objSklSystem then
		_info("Error : has no SkillSystem");
		return nil;
	end
	
	local sysTieBuShan = self:GetSystem("CTieBuShanSystem");
	if not sysTieBuShan then
		_info("Error : has no TieBuShanSystem");
		return nil;
	end
	
	local sBtlInfo = objSklSystem:GetInfo();
	
	info.dwHP = sBtlInfo.dwHP;
	info.dwMP = sBtlInfo.dwMP;
	info.dwHPMax = sBtlInfo.dwHPMax;
	info.dwMPMax = sBtlInfo.dwMPMax;
	info.dwPKForbid = sBtlInfo.dwPKForbid;
	
	if sysTieBuShan:HasAuthority("LronCloth") then
		info.dwForbidValue = sysTieBuShan:GetForbidValue();
		info.dwForbidValueMax = sysTieBuShan:GetForbidValueMax();
	else
		info.dwForbidValue = 0;
		info.dwForbidValueMax = 0;
	end
	
	return info;
end; 



--得到玩家账号ID
function CPlayer:GetAccountID()
	return self.dwAccountID;
end; 

--获取玩家等级
function CPlayer:GetLevel()
	return self.sRoleInfo.dwLevel;
end;

--获取玩家职业
function CPlayer:GetProf()
	return self.sRoleInfo.dwProf;
end;


--得到角色ID
function CPlayer:GetRoleID()
	return self.sRoleInfo.dwRoleID;
end;

--得到角色名字
function CPlayer:GetName()
	return self.sRoleInfo.szRoleName;
end;



--为玩家添加经验
function CPlayer:AddExp(dwExp,dwMovementExp,nFlag)
	if self.bDestroy then return end;
	
	if not dwMovementExp then
		dwMovementExp = 0
	end
	dwExp = dwExp + dwMovementExp
	if self.sRoleInfo.dwLevel <= 0 then
		self.sRoleInfo.dwLevel = 1;
	end;
	if( self.sRoleInfo.dwExp >= RoleUpLevelConfig[RoleUpLevelConfig.dwMaxLevel+1].dwExp and dwExp > 0) then  ----达到顶级
		return;
	end
	self.sRoleInfo.dwExp = self.sRoleInfo.dwExp + dwExp;
	self.bExpChange = true;
	
 	local nRetCode =  RoleUpLevelConfig:CompeteLevel(self.sRoleInfo.dwExp,self.sRoleInfo);
	if nRetCode < 0 then
		return;
	end;
	--发送经验
	local sExpInfo = 
	{
		dwExp = self.sRoleInfo.dwExp;
		dwMovementExp = dwMovementExp;
		dwLevelMaxExp = self.sRoleInfo.dwLevelMaxExp;
		dwLevelCurExp = self.sRoleInfo.dwLevelCurExp;
		dwLevel = 0;
	}
	
	local oldLevel = self.sRoleInfo.dwLevel;
	if nRetCode > 0 then --升级了
		self.sRoleInfo.dwLevel = nRetCode;
		sExpInfo.dwLevel = self.sRoleInfo.dwLevel;
	end;
	self.SendExpChangeMsg
	{
		Exp = sExpInfo.dwExp;
		MovementExp = sExpInfo.dwMovementExp;
		LevelMaxExp = sExpInfo.dwLevelMaxExp;
		LevelCurExp = sExpInfo.dwLevelCurExp;
		Level = sExpInfo.dwLevel;
		Flag = nFlag;
	};
	
	if nRetCode > 0 then
		self:OnUpLevel(oldLevel,nRetCode);
	end;
--	CKernelApp.UpdateRoleExpMsg{
--		_aid = self.dwAccountID,
--		Exp = self.sRoleInfo.dwExp,
--		Level = self.sRoleInfo.dwLevel
--	};
	--zcs add
	local sysIncomeRecord = self:GetSystem("CIncomeRecordSystem")
	if sysIncomeRecord then
		sysIncomeRecord:OnAddExp(dwExp)
	end
	--add end
end; 

-- 消耗经验
function CPlayer:CostExp(nExp)
	if self.bDestroy then return end;
	-- 消耗经验不能太多，保证不会降级
	if nExp >= self.sRoleInfo.dwLevelCurExp then return end
	
	self.sRoleInfo.dwExp = self.sRoleInfo.dwExp - nExp;
	RoleUpLevelConfig:CompeteLevel(self.sRoleInfo.dwExp,self.sRoleInfo);
	--发送经验
	local sExpInfo = 
	{
		dwExp = self.sRoleInfo.dwExp;
		dwMovementExp = dwMovementExp;
		dwLevelMaxExp = self.sRoleInfo.dwLevelMaxExp;
		dwLevelCurExp = self.sRoleInfo.dwLevelCurExp;
		dwLevel = 0;
	}
	
	self.SendExpChangeMsg
	{
		Exp = sExpInfo.dwExp;
		MovementExp = sExpInfo.dwMovementExp;
		LevelMaxExp = sExpInfo.dwLevelMaxExp;
		LevelCurExp = sExpInfo.dwLevelCurExp;
		Level = sExpInfo.dwLevel;
	};
end

--当升级的时候，
function CPlayer:OnUpLevel(dwCurLevel,dwNextLevel)
	--技能系统的升级处理
	self:GetSystem("CSkillSystem"):OnLevelUp(dwCurLevel,dwNextLevel);
	
	--更新队友等级
	self:GetSystem("CTeamSystem"):SynPlayerLevel(dwNextLevel);
	self:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventLevelUp,dwNextLevel - dwCurLevel,dwNextLevel);
end;

--角色死亡的处理
function CPlayer:OnDead(dwEnemyType,dwEnemyID)
	self.objSystemMgr:OnDead(dwEnemyType,dwEnemyID);
end;
--玩家进入安全区
function CPlayer:OnEnterSafeArea()
	self.objSystemMgr:OnEnterSafeArea();
end;
--玩家进入危险区
function CPlayer:OnEnterDangerArea()
	self.objSystemMgr:OnEnterDangerArea();
end;

--设置装备佩戴的位置,目前只能换这几个，后面再加:
-- dwModeID 为具体的模型id,nil为脱妆
-- dwItemEnum 为物品的配置ID
--enItemWearPos.eCloth   （2）衣服， 
--enItemWearPos.eGloves   （4）手，
--enItemWearPos.eLeg   （7）鞋子，
--enItemWearPos.eWeapon   （1）武器，
--isForbideNotice	是否禁止广播，create时是不需要广播的
function CPlayer:SetEquip(dwWearPos, dwItemEnum, dwModeID, dwLevel, isForbideNotice)
	if not dwWearPos then
		return;
	end;
	
	local dwChgMode = 0;
	
	local sInfo = {};
	sInfo[1] = dwWearPos;
	sInfo[2] = dwModeID;
	sInfo[3] = dwItemEnum;
	sInfo[4] = dwLevel;
	if dwWearPos == enItemWearPos.eHead then
		-- self:GetInfo().dwHair = dwModeID or 0;
	elseif dwWearPos == enItemWearPos.eCloth then
		if self:GetInfo().dwDress ~= dwItemEnum then
			dwChgMode = 1;
		end
		self:GetInfo().dwDress = dwItemEnum or 0;
		self:GetInfo().dwDressLevel = dwLevel;
	elseif dwWearPos == enItemWearPos.eGloves then
		if self:GetInfo().dwHand ~= dwItemEnum then
			dwChgMode = 1;
		end
		self:GetInfo().dwHand = dwItemEnum or 0;
		self:GetInfo().dwHandLevel = dwLevel;
	elseif dwWearPos == enItemWearPos.eShoes then
		if self:GetInfo().dwShoe ~= dwItemEnum then
			dwChgMode = 1;
		end
		self:GetInfo().dwShoe = dwItemEnum or 0;
		self:GetInfo().dwShoeLevel = dwLevel;
	elseif dwWearPos == enItemWearPos.eWeapon then
		if self:GetInfo().dwArms ~= dwItemEnum then
			dwChgMode = 1;
		end
		self:GetInfo().dwArms = dwItemEnum or 0;
		self:GetInfo().dwArmsLevel = dwLevel;
	elseif dwWearPos == enItemWearPos.eHorse then 
		self:GetInfo().dwHorseID = dwModeID;
	end; 
	self.OnEquipChangeMsg{EquipInfo = sInfo};
	
	sInfo[5]  = self:GetInfo().dwRoleID;
	
	if not isForbideNotice then
		local objMapSys = self:GetSystem("CMapSystem");
		if objMapSys then
			_mapcallout("OnPlayerEquipChangeMsg", 
			{
				Type 	= sInfo[1];
				ModeID 	= sInfo[2];
				ItemEnum = sInfo[3];
				Level 	= sInfo[4];
				RoleID 	= sInfo[5];
			},objMapSys:GetLogicID(),false);
		end
	end
	
	self:ViewChange()
	
	return dwChgMode;
end;
--设置坐骑
function CPlayer:SetMount(n_MountID,isForbideNotice)
	self:GetInfo().dwHorseID = n_MountID;
	--通知自己
	self.OnMountChangeMsg{ModelID = n_MountID};
	--通知
	-- local t_otherPlayer = self:GetOtherPlayer(nil,1);
	local info = {};
	info[1]  = self:GetRoleID();
	info[2] = n_MountID;
	
	if not isForbideNotice then
		local objMapSys = self:GetSystem("CMapSystem");
		if objMapSys then
			_mapcallout("OnPlayerMountChangeMsg", 
			{
				Info = info;
			},objMapSys:GetLogicID(),false);
		end
	end
	
	self:ViewChange()
end;

function CPlayer:SetSuitList(tbSuitList,isForbideNotice)
	local tbAct = {};
	
	for id,info in pairs(tbSuitList)do
		--_info("===SetSuitList===",id,info.isActive,info.dwActNumber)
		if info.isActive == 1 then
			table.insert(tbAct,id);
		end
	end
	
	self:GetInfo().setActSuitList = tbAct;
	self.OnSuitChangeMsg{SuitList = tbAct};
	
	if not isForbideNotice then
		local objMapSys = self:GetSystem("CMapSystem");
		if objMapSys then
			_mapcallout("OnPlayerSuitChangeMsg", 
			{
				RoleID = self:GetRoleID();
				SuitList = tbAct;
			},objMapSys:GetLogicID(),false);
		end
	end
	
	self:ViewChange()
end;
 
--获取指定系统
function CPlayer:GetSystem(szSystemName)
	if not self.objSystemMgr then
		--_err(szSystemName);
		-- print("player has quit",szSystemName);
		-- print(debug.traceback(""));
		return nil;
	end;
	local sys =self.objSystemMgr:GetSystem(szSystemName);
	if not sys then
		--暂时取消了，未找到系统时对堆栈的打印
		--_err(szSystemName);
		--print("can not find system:"..szSystemName)
		-- print(debug.traceback(""));
	end;
	return sys;
end;
  
function CPlayer:GetRoleCount()
	return self.dwRoleCount;
end;

function CPlayer:IsLoadEnd()
	return self.isLoadEnd;
end;

function CPlayer:IsDead()
	local objBattleSystem = self:GetSystem("CBattleSystem");
	if objBattleSystem then
		return objBattleSystem.dwDeadFlag == 1;
	end
	return true;
	-- return self:GetSystem("CBattleSystem").dwDeadFlag == 1;
end
--------------------------------------
--私有成员函数
--------------------------------------

--获取对象类型
function CPlayer:GetObjType()
	return enEntType.eEntType_Player;
end

--获取其他玩家
--dwType:1当前可见，2：当前地图，3:当前服务器，dwRoleID = 0获取所有玩家
function CPlayer:GetOtherPlayer(dwRoleID,dwType)
	local mapSystem = self:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	dwRoleID = dwRoleID or 0;
	if dwType == 1 then 
		local objMap =  mapSystem:GetCurMap();
		local allPlayer = objMap:GetCanLookPlayer(self);
		if not allPlayer then 
			return nil;
		end;  
		if dwRoleID == 0 then
			return allPlayer;	
		else
			return allPlayer[dwRoleID];
		end;
	elseif dwType == 2 then
		local objMap =  mapSystem:GetCurMap();
		if dwRoleID == 0 then
			return objMap:GetAllPlayer();	
		else
			return objMap:GetAllPlayer(dwRoleID);
		end; 
	elseif dwType == 3 then 
		if dwRoleID == 0 then
			return CMapManager:GetPlayer();	
		else
			return CMapManager:GetPlayer(dwRoleID);
		end;
	elseif dwType == 4 then
		_err("please change your parameter sooner~!!!");
	end;
end; 
--判断同一个地图上自己和其他玩家之间的距离
function CPlayer:GetDisByPlayer(dwRoleID)
	local objOtherPlayer = self:GetOtherPlayer(dwRoleID,2);
	if not objOtherPlayer then
		return -1;
	end
	local sysMapOther = objOtherPlayer:GetSystem("CMapSystem");
	if not sysMapOther then
		_info("sysMapOther is null!!!!!!!!!!");
		return -1;
	end;
	
	local sysMap = self:GetSystem("CMapSystem");
	return Vector2.sub(Vector2.new(sysMap.fXPos,sysMap.fYPos),Vector2.new(sysMapOther.fXPos,sysMapOther.fYPos)):magnitude();
end; 

--玩家处理客户端换线请求消息
function CPlayer:ClientChangeLineReq(dwLineID,funFailDone)
	if not self:IsLoadEnd() then
		if funFailDone then
			funFailDone();
		end
		return false;
	end
	if self.dwChangeToLineID then
		self.OnChangeLineRtMsg{NewLineID =dwLineID,ResultCode = -1}; --换线中，不能重复换线
		-- if funFailDone then
			-- funFailDone();
		-- end
		return false;
	end;
	if CKernelApp.dwLineID == dwLineID then
		self.OnChangeLineRtMsg{NewLineID =dwLineID,ResultCode = -1}; --已经在本线里面了。
		-- if funFailDone then
			-- funFailDone();
		-- end
		return false;
	end;
	if not self.objSystemMgr:ChangeLineCheck(dwLineID) then
		self.OnChangeLineRtMsg{NewLineID =dwLineID,ResultCode = -2}; --某个系统不允许换线
		if funFailDone then
			funFailDone();
		end
		return false;
	end;
	
	--如果连接
	if not CKernelApp:isConnectOK() then
		if funFailDone then
			funFailDone();
		end
		return false;
	end
	local itSys = self:GetSystem("CItemSystem")
	if itSys:GetLockedGold() > 0 then
		if funFailDone then
			funFailDone();
		end
		_info("=ClientChangeLineReq,GoldLocked=",self.dwAccountID)
		return false
	end	

	if itSys:GetPacket():GetLockedMoney()  > 0 then
		if funFailDone then
			funFailDone();
		end
		_info("=ClientChangeLineReq,MoneyLocked=",self.dwAccountID)
		return false
	end
	self.dwChangeToLineID = dwLineID;
	CKernelApp.ChangeLineRequestMsg{_aid = self:GetAccountID(),NewGameLine = dwLineID};
	self.dwGameState = _G.CPlayerGameState.ChangeLining;
	
	self.funFailDone = funFailDone;
	return true
end;

--处理从ks上反馈回来的换线请求
function CPlayer:KSChangeLineRes(nResCode,arrParam)  
	if nResCode ~= 0 then--如果失败
		--self.objNet.AcceptMsg = true;
		self.OnChangeLineRtMsg{NewLineID =self.dwChangeToLineID,ResultCode = -3}; --某个系统不允许换线
		self.dwChangeToLineID = nil;
		self.dwGameState = _G.CPlayerGameState.InGaming;
		_info("Role Change Line Fail Code ",nResCode);
		if self.funFailDone then
			self.funFailDone();
		end
		return;
	end;
	self.tbChangeLineInfo = {Sign = arrParam[1]};
	local dwAccountID = self:GetAccountID();
	CPlayerManager:DelPlayer(dwAccountID,1);
	self.dwGameState = _G.CPlayerGameState.ChangeLined;
	self.funFailDone = nil;
end;

--添加发送到KS的数据
function CPlayer:AddLineData(szSystemName,Data)
end

--玩家发送进入跨服战场请求(向指定战场指定服务器发送)
function CPlayer:ClientEnterCrossReq(dwLineID,funFailDone)
	_info("-----------ClientEnterCrossReq----", dwLineID);
	--发系统数据
	self.objSystemMgr:EnterCrossBegin();	
	
	--发送消息到游戏服务器上创建临时会话
	local szSign = ("quying"..tostring(self:GetAccountID())):md5();  --给Client/目标ks
	
	local info = self.sRoleInfo;
	info.dwGold = self.dwGold;
	info.szSign = szSign;
	self:SetCrossSvrData("Player", info);
	--将player放入临时容器
	CPlayerManager:DelPlayerByCross(self:GetAccountID())
	
	--给客户端发切换网络消息
	self.SwitchNetMsg{
	SzSign = szSign;
	IPAddr  = CConfig.Network.strCrossServiceServer .. ":" .. CConfig.CrossServiceNetwork.dwUserPort;   --取战场服务器ip
	ToLineId = dwLineID;
	}
end;

-------------------------------------------------------------------------------
----检查是否有该特效
function CPlayer:CheckIsViewPfx(dwPfxCfg)
	if(not self.setPfxList[dwPfxCfg]) then
		return false;
	end
	return true;
end
--外形pfx相关
function CPlayer:AddViewPfx(dwPfxCfg)
	if not Effect_Deploy[dwPfxCfg] then
		return;
	end
	
	self.setPfxList[dwPfxCfg] = dwPfxCfg;
	
	local objMapSys = self:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("OnRoleAddViewPfxMsg", 
		{
			RoleType = enEntType.eEntType_Player;
			RoleID = self:GetRoleID();
			PfxCfg = dwPfxCfg;
		},objMapSys:GetLogicID(),true);
	end
	
	self:PfxChange();
end;

function CPlayer:RmvViewPfx(dwPfxCfg)
	if not Effect_Deploy[dwPfxCfg] then
		return;
	end
	self.setPfxList[dwPfxCfg] = nil;
	
	local objMapSys = self:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("OnRoleRmvViewPfxMsg", 
		{
			RoleType = enEntType.eEntType_Player;
			RoleID = self:GetRoleID();
			PfxCfg = dwPfxCfg;
		},objMapSys:GetLogicID(),true);
	end
	
	self:PfxChange();
end;
----模型
function CPlayer:AddViewModel(dwModelCfg)
	if not Model_Deploy[dwModelCfg] then
		return;
	end
	
	self.setModelList[dwModelCfg] = dwModelCfg;
	
	local objMapSys = self:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("OnRoleAddViewModelMsg", 
		{
			RoleType = enEntType.eEntType_Player;
			RoleID = self:GetRoleID();
			ModelCfg = dwModelCfg;
		},objMapSys:GetLogicID(),true);
	end
	
	self:ModelChange();
end;

function CPlayer:RmvViewModel(dwModelCfg)
	if not Model_Deploy[dwModelCfg] then
		return;
	end
	self.setModelList[dwModelCfg] = nil;
	
	local objMapSys = self:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("OnRoleRmvViewModelMsg", 
		{
			RoleType = enEntType.eEntType_Player;
			RoleID = self:GetRoleID();
			ModelCfg = dwModelCfg;
		},objMapSys:GetLogicID(),true);
	end
	
	self:ModelChange();
end;
-----------------------------------------------------------
function CPlayer:ViewChange()
	self.tbUpdateInfo.tmInfo = GetCurTime();
end;

function CPlayer:BattleChange()
	self.tbUpdateInfo.tmBtl = GetCurTime();
end;

function CPlayer:PfxChange()
	self.tbUpdateInfo.tmPfx = GetCurTime();
end;

function CPlayer:ModelChange()
	self.tbUpdateInfo.tmModel = GetCurTime();
end

function CPlayer:PKValueChange()
	self.tbUpdateInfo.tmPKValue = GetCurTime();
end;

function CPlayer:ShowTextChange()
	self.tbUpdateInfo.tmShowText = GetCurTime();
end;
