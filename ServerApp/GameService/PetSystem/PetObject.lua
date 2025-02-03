--宠物对象

_G.CPetObject = {};

function CPetObject:new(dwRoleID,tbPetInfo,setEquipLevel,dwBournExp,petSys)
	if not tbPetInfo.dwPetId then
		return nil;
	end
	
	local obj = {};
	
	obj.dwRoleID = dwRoleID;
	obj.dwEnumID = tbPetInfo.dwPetId;
	if(not tbPetInfo.dwFper or tbPetInfo.dwFper == 0) then
		obj.dwFper = PetFunctionConfig.PetRoleDefaultPer; ----宠物给人物加成百分比
	else
		obj.dwFper = tbPetInfo.dwFper;----宠物给人物加成百分比
	end
	obj.szName = tbPetInfo.szName;
	
	obj.dwExp = tbPetInfo.dwExp or 0;
	obj.objDriver = nil;
	obj.bExpChange = false;
	obj.dwLevel = tbPetInfo.dwLevel;
	obj.dwDayConsult = tbPetInfo.dwDayConsult or 0;
	obj.dwConsult = tbPetInfo.dwConsult or 0;
	obj.dwDayImpart = tbPetInfo.dwDayImpart or 0;
	obj.dwAllImpart = tbPetInfo.dwAllImpart or 0;
	obj.dwLastDieTime = tbPetInfo.dwLastDieTime or 0; --上次死亡时间
	
	obj.dwState = tbPetInfo.dwState;--1，未出战；2，出战
	obj.dwDeadFlag = tbPetInfo.dwDeadFlag;	--死亡标志，1：死亡；0：活着
	----
	obj.objCurMap = nil;
	obj.fXPos = 0;
	obj.fYPos = 0;
	obj.Dir = 0;
	obj.dwLogicID = _CreateMapNode(2,dwRoleID,0);
	
	obj.fXPosDes = 0;
	obj.fYPosDes = 0;
	
	----
	obj.setPfxList = {};
	
	--
	obj.sysAttr = CPetAttr:new(obj,tbPetInfo.dwHP);
	obj.petSys = petSys;
	----
	for k,v in pairs(CPetObject)do
		if type(v) == "function" then
			obj[k] = v;
		end
	end
	
	obj:Create(setEquipLevel, dwBournExp);
	
	return obj;
end;

function CPetObject:Create(setEquipLevel, dwBournExp)
	--计算战斗属性
	self.sysAttr:Create(setEquipLevel, dwBournExp);
	--宠物的战斗消息用人物的CSkillPlayer
	self.objSklPlayer = CSkillPlayer:new(self);
	
	--名字初始化
	if self.szName == nil then
		self.szName = PetBasicConfig[self.dwEnumID].PetBaseName;
	end
end;
function CPetObject:Update(dwInterval)
	--玩家驱动
	--print("=========1==========UpdateUpdateUpdateUpdateUpdateUpdate================================",self.bExpChange)
	if self.bExpChange then
		local objDB = self:GetOwnerRole():GetDBQuery();
		if not objDB then
			_err("--Get objDB error ~~ by CPetObject");
			return;
		end;
		--print("========2===========UpdateUpdateUpdateUpdateUpdateUpdate================================")
		local SqlCmd = objDB:CreateUpdateCmd('T_Pet_Info');
		SqlCmd.Fields.dwLevel =  self.dwLevel;
		SqlCmd.Fields.dwExp = self.dwExp;
		SqlCmd.Wheres.dwRoleId = self.dwRoleID;
		SqlCmd.Wheres.dwPetId = self.dwEnumID;
		SqlCmd:execute();
		self.bExpChange = false;
	end
end
---宠物出战
function CPetObject:AddDriver()
	--print("CPetObject:AddDriverCPetObject:AddDriver")
	if not self.objDriver then
		self.objDriver = CDriverManager:AddDriver(eInterval._1min,self,self.Update);
	end
end
---玩家下线
function CPetObject:DestroyDriver()
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver);
		self.objDriver = nil;
	end
end
----宠物休息
function CPetObject:DelDriver()
	if self.objDriver then
		CDriverManager:DelDriver(self.objDriver);
		self.objDriver = nil;
	end
	if self.bExpChange then
		local objDB = self:GetOwnerRole():GetDBQuery();
		if not objDB then
			_err("--Get objDB error ~~ by CPetObject");
			return;
		end;
		--print("========2===========UpdateUpdateUpdateUpdateUpdateUpdate================================")
		local SqlCmd = objDB:CreateUpdateCmd('T_Pet_Info');
		SqlCmd.Fields.dwExp = self.dwExp;
		SqlCmd.Wheres.dwRoleId = self.dwRoleID;
		SqlCmd.Wheres.dwPetId = self.dwEnumID;
		SqlCmd:execute();
		self.bExpChange = false;
	end
end
--根据宠物上次死亡时间判断是否是死亡状态
function CPetObject:JudgePetDeadState(sysPet)
	if self.dwLastDieTime == 0 then
		self.dwDeadFlag = 0;	--死亡标志，1：死亡；0：活着
	elseif(self.dwLastDieTime > 0) then
		local curTime = GetCurTime();
			
		local func = _G.PetBaseInfo[self.dwEnumID];
		if func then
			local tbBase = func(self:GetOwnerLevel());
			
			--复活判断
			if curTime - self.dwLastDieTime > tbBase.deadDelayTime then
				self:Relive(sysPet);
				
				if self.dwTimeID then
					CTimer:RemoveTimer(self.dwTimeID)
				end
				
				return;
			end
		end
		
		self.dwDeadFlag = 1;	--死亡标志，1：死亡；0：活着
	end
end

--新创建一个宠物对象
function CPetObject:NewCreateObject(dwRoleID,tbPetInfo,setEquipLevel,dwBournExp,petSys)
	local objPet = CPetObject:new(dwRoleID,tbPetInfo,setEquipLevel,dwBournExp,petSys);
	
	objPet.sysAttr:FillHP();
	
	return objPet;
end;

function CPetObject:GetLogicID()
	return self.dwLogicID;
end;

--获得在地图上显示需要的信息
function CPetObject:GetMapShowInfo()
	local tbBtlInfo = self.sysAttr:GetInfo();
	local tbInfo = {};
	tbInfo[1] = self.dwRoleID;
	tbInfo[2] = self.dwEnumID;
	tbInfo[3] = self:GetOwnerLevel();
	tbInfo[4] = tbBtlInfo.dwHP;
	tbInfo[5] = tbBtlInfo.dwHPMax;
	tbInfo[6] = self.szName;
	tbInfo[7] = self.fXPos;
	tbInfo[8] = self.fYPos;
	tbInfo[9] = self.setPfxList;
	
	if self:IsMoving() then
		tbInfo[10] = self.fXPosDes;
		tbInfo[11] = self.fYPosDes;
		tbInfo[12] = self.fSpeed or 0;
	end
	tbInfo[13] = self.dwLastDieTime;
	tbInfo[14] = self.petSys:GetPetBournInfo(self.dwEnumID);

	return tbInfo;
end;

--宠物基本属性
function CPetObject:GetPetBaseInfo()
	local tbBtlInfo = self.sysAttr:GetInfo();
	local dwState = 1;
	if self:IsShow() then
		dwState = 2;
	end
	
	local tbInfo = {};
	tbInfo.dwPetId = self.dwEnumID;
	tbInfo.dwLevel = self:GetOwnerLevel();
	tbInfo.dwExp = self.dwExp;
	tbInfo.dwDayConsult = self.dwDayConsult;
	tbInfo.dwConsult = self.dwConsult;
	tbInfo.dwDayImpart = self.dwDayImpart;
	tbInfo.dwAllImpart = self.dwAllImpart;
	tbInfo.dwState = dwState;
	tbInfo.dwHP = tbBtlInfo.dwHP;
	tbInfo.dwName = self.szName
	tbInfo.dwDeadFlag = self.dwDeadFlag
	tbInfo.dwFper = self.dwFper;
	tbInfo.dwDeadFlag = self.dwDeadFlag; 
	tbInfo.dwLastDieTime = self.dwLastDieTime;
	local isCd = 0;
	local curTime = GetCurTime();
	local timeFun = _G.PetBaseInfo[self.dwEnumID]
	local cfgTime = timeFun(self:GetOwnerLevel()).deadDelayTime
	if(self.dwLastDieTime <= 0) then
		tbInfo.dwLastDieTime = 0;
		tbInfo.dwDeadFlag = 0;
	else
		isCd = cfgTime - (curTime - self.dwLastDieTime);
		tbInfo.isCd = isCd;
	end
	if(isCd <= 0) then
		tbInfo.dwLastDieTime = 0;
		tbInfo.dwDeadFlag = 0;
	end
	--print("CPetObject:GetPetBaseInfo()CPetObject:GetPetBaseInfo()",tbInfo.dwLastDieTime,cfgTime,(curTime - self.dwLastDieTime),self.dwLastDieTime)
	tbInfo.dwHurtMax = tbBtlInfo.dwHurtMax;
	
	return tbInfo;
end;

function CPetObject:GetBattleInfo()
	return self.sysAttr:GetInfo();
end;

--给人物加的属性
function CPetObject:GetInstructInfo()
	-- local objAttr = PetFunctionConfig.FunPetRoleProperty(
		-- self:GetBattleInfo(),
		-- self.dwEnumID,
		-- self:GetOwnerLevel(),
		-- self:IsShow(),
		-- self.dwDayConsult,
		-- self.dwConsult);
	
	-- return objAttr;
	
	local objAttr = SSingleAttrChange:new();
	
	local tbBtlInfo = self:GetBattleInfo();
	
	local tbInstruct = PetFunctionConfig.OnPetInstructProperty(self.dwEnumID, self:GetOwnerLevel(), self.dwDayConsult, self.dwConsult);
	local tbImpart = _G.PetImpartConfig.AddProp(self.dwAllImpart, self.dwDayImpart, self.dwEnumID);
	local tbPetInfo = PetFunctionConfig.PetRoleProperty(self.dwEnumID, self:GetOwnerLevel(),self.dwState,tbBtlInfo,self);
	
	objAttr:AddValue(tbInstruct);
	objAttr:AddValue(tbImpart);
	objAttr:AddValue(tbPetInfo);
	
	return objAttr;
end;

---获取宠物基础属性
function CPetObject:GetPetBaseAttrInfo()
	local tbBtlInfo = self:GetBattleInfo();
	local tbPetInfo = PetFunctionConfig.PetRoleProperty(self.dwEnumID, self:GetOwnerLevel(),self.dwState,tbBtlInfo,self);
	return tbPetInfo;
end
function CPetObject:GetRoleID()
	return self.dwRoleID;
end;
function CPetObject:GetPetID()
	return self.dwEnumID;
end
function CPetObject:GetOwnerRole()
	return CMapManager:GetPlayer(self.dwRoleID);
end;

---给宠物加经验
function CPetObject:AddExp(monExp)
	local dropExp = 0;
	local ownerRoleLevel = self:GetOwnerRole():GetLevel();
	local preLevel = self.dwLevel;
	if((preLevel - ownerRoleLevel ) >=_G.InterLevelIsUpLevel) then
		return;
	end
	--print("=========2==================CPetObject:AddExp========================================",monExp)
	self.bExpChange = true;
	dropExp = monExp;
	self.dwExp = self.dwExp + dropExp;
	if(self.dwExp > PetConfigScript:GetPetTotalExp()) then
		self.dwExp = PetConfigScript:GetPetTotalExp();
	end
	local curLevel,curExp = PetConfigScript:GetPetLevel(self.dwExp);
	local PetId = self:GetPetID();
	local PetLevel = 0;
	--self.dwExp = curExp;
	local PetExp = curExp;
	self.dwLevel = curLevel;
	if(curLevel > preLevel) then
		self:AddUpLevelEffect();
		local tbBaseInfo = self:GetPetBaseInfo();
		local tbBattleInfo = self:GetBattleInfo();
		tbBattleInfo.dwHP = tbBattleInfo.dwHPMax;
		self.sysAttr:FillHP()
		--table.print(tbBattleInfo)
		self:GetOwnerRole().SynchronizeDevelopInfoToClientMsg
		{
			PetId = PetId;
			BaseInfo = tbBaseInfo;
			BattleInfo = tbBattleInfo;
			BOver = true;
		};
		--刷洗宠物给人物加的属性
		local objMapSystem = self:GetOwnerRole():GetSystem("CMapSystem");
		_mapcallout("PetMapHPChangeMsg", 
		{
			RoleID = self:GetOwnerRole():GetRoleID();
			HP = tbBattleInfo.dwHP;
			HPMax = tbBattleInfo.dwHPMax;
			Crit = false;
			EnemyType = 0;
			EnemyID = 0;
			CurLevel = self.dwLevel;
			
		},objMapSystem:GetLogicID(),true)
		self.petSys.petSkill:ExecuteAddPetPassivitySkill(PetId);
		----数据存血量
		local objDB = self:GetOwnerRole():GetDBQuery();
		if not objDB then
			_err("--Get objDB error ~~ by CPetObject");
			return;
		end;
		local SqlCmd = objDB:CreateUpdateCmd('T_Pet_Info');
		SqlCmd.Fields.dwHp = tbBattleInfo.dwHP;
		SqlCmd.Fields.dwLevel =  self.dwLevel;
		SqlCmd.Fields.dwExp = self.dwExp;
		SqlCmd.Wheres.dwRoleId = self.dwRoleID;
		SqlCmd.Wheres.dwPetId = self.dwEnumID;
		SqlCmd:execute();
		self.petSys.petSkill:OpenSkillPos(self.dwEnumID,self.dwLevel)
	end
	PetLevel = self.dwLevel;
	--print("addexp",PetId,PetExp,PetLevel)
	self:GetOwnerRole().PetSys_ChangeExpMsg{PetId = PetId,PetExp = PetExp ,PetLevel = PetLevel}
end

----给宠物加升级特效
function CPetObject:AddUpLevelEffect()
	-- local objPlayer = self:GetOwnerRole();
	-- if(not objPlayer) then
		-- return;
	-- end
	local dwPfxCfg = 0;
	dwPfxCfg = _G.PetUpLevelEffectID;
	self:AddViewPfx(dwPfxCfg);
end
function CPetObject:GetOwnerLevel()
	return self.dwLevel;
end;

function CPetObject:GetLevel()
	return self:GetOwnerLevel()
end

function CPetObject:GetEnumID()
	return self.dwEnumID;
end

function CPetObject:GetLastDieTime()
	return self.dwLastDieTime;
end
-------------------------------------------------------------------------------
--在地图显示
function CPetObject:Show(objMap,fPosX,fPosY)
	_InsertNode(objMap:GetMapLogicID(),self:GetLogicID(),fPosX,fPosY);
	
	self.objCurMap = objMap;
	self.fXPos = fPosX;
	self.fYPos = fPosY;
	self.dwState = 2;
	self:GetOwnerRole():GetSystem("CPetSystem"):DBPetStateChg(self.dwEnumID, self.dwState);

	local tbPetShowInfo = {};
	
	tbPetShowInfo = self:GetMapShowInfo();
	
	--print("===Show pet 1===",tbPetShowInfo[7],tbPetShowInfo[8])
	--print("===Show pet 2===",tbPetShowInfo[10],tbPetShowInfo[11],tbPetShowInfo[12])
	
	objMap:AddPet(self);
	
	--广播
	_mapcallout("PetMapGetAllMsg", 
	{
		Add = {tbPetShowInfo};
	}, 
	self:GetLogicID(), true);
end;

function CPetObject:Hide()
	if not self.objCurMap then return end
	
	self.dwState = 1;
	self:GetOwnerRole():GetSystem("CPetSystem"):DBPetStateChg(self.dwEnumID, self.dwState);
	
	 
 	--广播
	_mapcallout("PetMapGetAllMsg", 
	{
		Del = {self:GetRoleID()};
	}, 
	self:GetLogicID(), true);
	self.objCurMap:DelPet(self);
	_RemoveNode(self.objCurMap:GetMapLogicID(),self:GetLogicID());
	self.bMoving = false;
	
	self.objCurMap = nil;
end;

function CPetObject:IsShow()
	return (self.dwState == 2);
end;

function CPetObject:GetCurMap()
	return self.objCurMap;
end;

-------------------------------------------------------------------------------
function CPetObject:IsMoving()
	if not self:IsShow() then
		return false;
	end
	
	return self.bMoving;
end;

function CPetObject:MoveToRequest(fXSrc,fYSrc,fXDis,fYDis,fSpeed)
	--检测
	if not self:IsShow() then
		return;
	end
	
	local fMySpeed = self:GetBattleInfo().dwMoveSpeed;
	
	--记录
	self.fSpeed = fMySpeed;
	self.fXPos = fXSrc;
	self.fYPos = fYSrc;
	
	local fX = fXDis - fXSrc;
	local fY = fYDis - fYSrc;
	local fDis = math.sqrt(fX*fX + fY*fY);
	self.vecSpeed = 
	{
		x = fX * self.fSpeed / (fDis*100000);
		y = fY * self.fSpeed / (fDis*100000);
	}
	self.fXPosDes = fXDis
	self.fYPosDes = fYDis
	
	--移动
	_MoveToRequest(self:GetLogicID(),fXSrc,fYSrc,fXDis,fYDis,self.fSpeed);
	
	self.bMoving = true;
	self.tmMoveBegin = GetCurTime();
	
	--广播
	_mapcallout("PetMoveToMsg", 
	{
		RoleID = self:GetRoleID(),
		XSrc = math.floor(fXSrc*100),
		YSrc = math.floor(fYSrc*100),
		XDis = math.floor(fXDis*100),
		YDis = math.floor(fYDis*100),
		Speed = math.floor(self.fSpeed*100),
	},self:GetLogicID(),false);
	
end;

function CPetObject:MoveStopRequest(fXStop,fYStop,fDirValue)
	--检测
	if not self:IsShow() then
		return;
	end
	
	--停止
	_StopMove(self:GetLogicID(),fXStop,fYStop);
	self.bMoving = false;
	self.Dir = fDirValue
	
	--广播
	_mapcallout("PetMoveStopMsg",
	{
		RoleID = self.dwRoleID,
		XStop = math.floor(fXStop*100),
		YStop = math.floor(fYStop*100),
		DirValue = math.floor(fDirValue*100)
	},self:GetLogicID(),false);
	
end;

---------------------------------------
--响应移动停止
function CPetObject:DoneWithMoveEnd(tbPos)
	self.bMoving = false;
	
	if not tbPos then
		tbPos = self:GetPetPos();
	end
	self.fXPos = tbPos.x 
	self.fYPos = tbPos.y 
end;

function CPetObject:CompelMove(dwActID,dwDelay,dwRoleId,tbPosList,dwSkillID,dwExecTime,dwActCount)
	self:DoneWithMoveEnd()
	
	local tbPos = self:GetPetPos();
	
	_StopMove(self.dwLogicID,tbPos.x,tbPos.y);
	
	

	local Map = self:GetCurMap()
	if Map then
		--local setNet = {}
		local szMsgName = "PetCompelMoveMsg"
		-- local tbPLayers = Map:GetCanSeePlayer(self)
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet,tbPlayer.objNet)
		-- end
		local tParam = {
				DwPetRoleId=self.dwRoleID,
				DwActionId=dwActID,
				Delay = dwDelay,
				DwRoleId = dwRoleId,
				PosList = tbPosList,
				SkillID = dwSkillID,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			}
		--group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName,tParam, self.dwLogicID, true)
	end
	
	self:BeginCompelMove(dwDelay,tbPosList[1]);
end;


function CPetObject:BeginCompelMove(dwDelay,tbMoveToPos)
	local objMap = self:GetCurMap();
	
	self.tbMoveActionInfo = {};
	
	local posDis = {};
	posDis.x = tbMoveToPos.x - self.fXPos;
	posDis.y = tbMoveToPos.y - self.fYPos;
	
	self.tbMoveActionInfo.dwBegin = GetCurTime();
	self.tbMoveActionInfo.dwTime = dwDelay;
	self.tbMoveActionInfo.vecDis = posDis;
	
	objMap:AddTimeEvent(dwDelay,function()
		self:DoneWithCompelEnd(tbMoveToPos);
	end)
end;

function CPetObject:DoneWithCompelEnd(tbMoveToPos)
	self.tbMoveActionInfo = nil;
	
	self:MoveStopRequest(tbMoveToPos.x,tbMoveToPos.y ,self.Dir);
end;

--响应视野区域改变
function CPetObject:DoneWithCheckerChange(tbOldID,tbNewID)
	for n,dwRoleId in pairs(tbOldID)do
		local objOld = self:GetCurMap():GetPlayerByRoleID(dwRoleId);
		if objOld then
			local sysPet = objOld:GetSystem("CPetSystem")
			if sysPet then
				sysPet:SendDelPetInView(self:GetRoleID())
			end;
		end
	end
	
	for n,dwRoleId in pairs(tbNewID)do
		local objNew = self:GetCurMap():GetPlayerByRoleID(dwRoleId);
		if objNew then
			local sysPet = objNew:GetSystem("CPetSystem")
			if sysPet then
				sysPet:SendAddPetInView(self)
			end;
		end
	end
end;

function CPetObject:DoneWithSpeedChange(fNewSpeed,tbPosNow)
	self.fSpeed = fNewSpeed*100000;
	self.fXPos = tbPosNow.x;
	self.fYPos = tbPosNow.y;
	
	self.tmMoveBegin = GetCurTime();
	
	_mapcallout("PetMoveToMsg", 
	{
		RoleID = objPlayer:GetRoleID(),
		XSrc = math.floor(tbPosNow.x*100),
		YSrc = math.floor(tbPosNow.y*100),
		XDis = math.floor(self.fXPosDes*100),
		YDis = math.floor(self.fYPosDes*100),
		Speed = math.floor(self.fSpeed*100),
	},self:GetLogicID(),false);
end;

--获得当前的宠物坐标
function CPetObject:GetPetPos()
	local tbRsl = {x=self.fXPos;y=self.fYPos};
	
	-- if self.tbMoveActionInfo and self.tbMoveActionInfo.dwBegin then
		-- local dwTimeDis = GetCurTime() - self.tbMoveActionInfo.dwBegin;
		
		-- if dwTimeDis < 0 then
			-- dwTimeDis = 0;
		-- end
		
		-- if dwTimeDis < self.tbMoveActionInfo.dwTime then
			-- tbRsl.x = self.fXPos + self.tbMoveActionInfo.vecDis.x*dwTimeDis/self.tbMoveActionInfo.dwTime;
			-- tbRsl.y = self.fYPos + self.tbMoveActionInfo.vecDis.y*dwTimeDis/self.tbMoveActionInfo.dwTime;
		-- else
			-- self:EndMoveAction();
			
			-- tbRsl.x = self.fXPos;
			-- tbRsl.y = self.fYPos;
		-- end
		
		-- return tbRsl;
	-- end
	
	if self.bMoving then
		local dwTimeDis = GetCurTime() - self.tmMoveBegin;
		
		tbRsl.x = self.fXPos + self.vecSpeed.x*dwTimeDis;
		tbRsl.y = self.fYPos + self.vecSpeed.y*dwTimeDis;
	end
	
	return tbRsl;
end;

-------------------------------------------------------------------------------
function CPetObject:AddViewPfx(dwPfxCfg)
	if not Effect_Deploy[dwPfxCfg] then
		return;
	end
	
	self.setPfxList[dwPfxCfg] = 1;
	
	--broadcast
	if self:IsShow() then
		local szMsgName = "OnRoleAddViewPfxMsg"
		local tParam = 
		{
			RoleType = enEntType.eEntType_Pet;
			RoleID = self:GetRoleID();
			PfxCfg = dwPfxCfg;
		}
		
		_mapcallout(szMsgName,tParam, self:GetLogicID(), true)
	end
end;

function CPetObject:RmvViewPfx(dwPfxCfg)
	self.setPfxList[dwPfxCfg] = nil;
	
	--broadcast
	if self:IsShow() then
		local szMsgName = "OnRoleRmvViewPfxMsg"
		local tParam = 
		{
			RoleType = enEntType.eEntType_Pet;
			RoleID = self.dwRoleID;
			PfxCfg = dwPfxCfg;
		}
		
		_mapcallout(szMsgName,tParam, self:GetLogicID(), true)
	end
end;

function CPetObject:ChgHPByMedica(dwValue)
	return self.sysAttr:ChgHPByMedica(dwValue)
end

--检查是否是满血
function CPetObject:IsFullHP()
	return self.sysAttr:IsFullHP();
end
-------------------------------------------------------------------------------


--获取对象类型
function CPetObject:GetObjType()
	return enEntType.eEntType_Pet;
end
----设置宠物给人物加成百分比
function CPetObject:SetFPer(dwFper)
	self.dwFper = self.dwFper+dwFper*100;
	self.petSys.objDBQuery:UpdatePetFper(self.dwEnumID, self.dwFper);
	self:GetOwnerRole().SynchronizeFPerToClientMsg{PetId =self.dwEnumID,Fper = dwFper*100};
	self.petSys.petSkill:ExecuteAddPetPassivitySkill(self.dwEnumID)
end
----获取宠物给人物加成百分比
function CPetObject:GetFPer()
	return self.dwFper/100;
end