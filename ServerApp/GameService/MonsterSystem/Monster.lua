--------------------------------
--[[
服务器 Monster
单个Monster
周长沙
2012-2-3
--]]
--------------------------------
_G.CMonster = {}
CMemoryDebug:Show("ObjMonster");
--------------------------------
local function GetNextBronTime(dwLine,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
	local Info = {
		year = dwYear;		--年
		month = dwMonth;		--月
		day = dwDay;			--日
		hour = dwHour;		--时
		min = dwMin;			--分
		sec = dwSec;			--秒
	}
	Info.sec = Info.sec + 10
	return Info;
end
local function SetDataInfo(BaseInfo,FightInfo,AIInfo,dwDropId)
	local DataInfo = {}
	if (not BaseInfo) or (not FightInfo) or (not AIInfo) or (not dwDropId) then
		return;
	end
	for k,v in pairs(AIInfo) do
		DataInfo[k] = v
	end
	for k,v in pairs(FightInfo) do
		DataInfo[k] = v
	end
	for k,v in pairs(BaseInfo) do
		DataInfo[k] = v
	end
	DataInfo.dwDropId = dwDropId
	return DataInfo
end
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end
--------------------------------
--CMonster更新
function CMonster:Update(dwDelayTime,NowTime)
		if self.Data.blShow then
			for k,v in pairs(self.SYS) do
				v:Update()
				-- if self.Test then
					-- print("Monster update ObjId:"..self.ObjId.." SYS:"..k)
				-- end
			end
		end
	return true
end

--CMonster 刷新逻辑
function CMonster:BornLogic(dwDelayTime,NowTime)
	if not self.Data.blShow then
		if self.dwNextBornTime then
			if self.BornNotice[1] then
				if self.dwNextBornTime - NowTime <= self.BornNotice[1].dwTime then
					self:Notice(self.BornNotice[1].szStr,self.BornNotice[1].dwChannel,self.BornNotice[1].bSystem)
					table.remove(self.BornNotice,1)
				end
			end
			if (NowTime >= self.dwNextBornTime) then
				local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
				sysMonsterMove.dwLastWalkStopTime = GetCurTime()
				self:Show()
			end
		end
	else
		if self.dwNextHideTime and (NowTime > self.dwNextHideTime) then
			self:Hide()
		elseif not self:IsDead() then
			self:ScriptUpdate()
		end
	end
end
--CMonster 脚本逻辑
function CMonster:ScriptUpdate()
	if self.tbFun and self.tbFun.CBMonsterOnUpdate then
		self.tbFun:CBMonsterOnUpdate(self)
	end
end
-----------------------------------
--生成Monster
function CMonster:new(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,Map,bNoShow,DiffTbl,objPlayer,dwGuildID)
	local obj = {}
	setmetatable(obj,{__index=CMonster})
	local BaseInfo = MonsterDataConfig[dwMonsterId]
	local FightInfo = MonsterFightInfo[dwFightId]
	local AIInfo = MonsterAIInfo[dwAIId]
	--怪物信息
	obj.DataInfo = SetDataInfo(BaseInfo,FightInfo,AIInfo,dwDropId)
	if not obj.DataInfo then
		print("Monster ERR(dwMonsterId,dwFightId,dwAIId,dwDropId):",dwMonsterId,dwFightId,dwAIId,dwDropId)
		return;
	end
	--基础信息
	obj.Data = {}
	------
	obj.dwMonsterId = dwMonsterId
	obj.dwFightId = dwFightId
	obj.dwAIId = dwAIId
	obj.dwDropId = dwDropId
	obj.dwExDropId = nil
	obj.dwLookId = dwLookId or dwMonsterId
	------
	obj.Data.blShow 		= not bNoShow										--是否显示
	obj.Data.bDead			= false												--是否处于死亡状态
	obj.Data.dwHideTime 	= 0													--上一次隐藏时间
	obj.Data.dwBornTime		= 0													--刷出时间
	obj.Data.fBornX			= dwX												--出生坐标x
	obj.Data.fBornY			= dwY												--出生坐标y
	obj.Data.dwBornMapId	= Map.MapID 										--出生地图
	obj.Data.dwCurMapID		= obj.Data.dwBornMapId								--当前地图
	obj.Data.dwLastTime		= obj.DataInfo.dwLastTime or 0						--存在时间
	obj.Data.dwDelay		= obj.DataInfo.dwDelay or 0							--刷新时间
	
	obj.Data.szName			= obj.DataInfo.name												--名字
	obj.Data.szTitle		= obj.DataInfo.title											--称号
	obj.Data.dwLookId		= obj.dwLookId													--外形
	obj.Data.dwMonsterId	= obj.DataInfo.id												--配置id
	
	obj.Data.bVariation		= false												--是否变异
	
	obj.Data.Pic 			= {}												--图片
	--难度系数
	obj.DiffTbl = DiffTbl or {}
	if obj.DataInfo.NoDiff==1 then
		obj.DiffTbl = {}
	end
	-------------------------------
	obj.Map								= Map												--Map指针，指向本地图Map对象
	obj.SYS = {}																			--怪物底下的各个系统		
	obj.SYS["CMonsterAISystem"] 		= CMonsterAISystem:new(obj)							--AI
	obj.SYS["CMonsterMoveSystem"] 		= CMonsterMoveSystem:new(obj)						--移动
	obj.SYS["CMonsterSkillSystem"] 		= CMonsterSkillSystem:new(obj)						--技能
	obj.SYS["CMonsterBuffSystem"] 		= CMonsterBuffSystem:new(obj)						--buff
	--对象id
	obj.ObjId = nil
	--函数脚本
	obj.tbFun = {}
	--下次刷新时间
	obj.dwNextBornTime = nil
	--下次隐藏时间
	obj.dwNextHideTime = nil
	--上次说话时间
	obj.dwLastSay = 0
	--刷新公告
	obj.BornNotice = {}
	--所属玩家
	obj.dwPlayerRoleID = nil
	--所属工会
	-- obj.dwGuildID = dwGuildID or 0
	if objPlayer then
		obj.dwPlayerRoleID = objPlayer:GetRoleID()
	end
	
	if dwGuildID then
		obj.dwOwnerType = MonsterOwnerType.Guild;
		obj.dwOwnerID = dwGuildID;
	else
		obj.dwOwnerType = MonsterOwnerType.None;
		obj.dwOwnerID = 0;
	end
	
	--技能缓存
	obj.objSklPlayer = CSkillPlayer:new(obj);
	
	--关心这个怪物的战场ID
	obj.dwOwnWarID = 0;
	
	--基础经验
	obj.Data.dwBaseExp = obj.DataInfo.exp
	
	--策划数据
	obj.UserData = {}
	
	obj.setPfxList = {};
	
	obj.dwLogicID = 0;
	
	CMemoryDebug:AddObject("ObjMonster", obj);
	return obj
end
function CMonster:GetMgr()
	return self.Map.objMonMgr
end
-------------------------------------------------------------------------
-----------------------基础行为接口
-------------------------------------------------------------------------
--服务器开启时是否要刷出
function CMonster:CheckShow()
	if self.Data.blShow then
		self:Show()
	else
		self.Data.bDead = true
		self.Data.dwHideTime = GetCurTime()
		self:SetBornTime()
	end
	self.SYS.CMonsterAISystem:ChangeState(MonsterState.Idel)
end
--移除Monster
function CMonster:Remove()
	if self.Data.blShow then
		self:Hide()
	end
	for k,sys in pairs(self.SYS) do
		sys:Destroy()
	end
	_DeleteMapNode(self.dwLogicID);
	-- self.Data = nil
	-- self.DataInfo = nil
end
--显示Monster
function CMonster:Show()
	if self.tbFun and self.tbFun.CBMonsterOnUpdate then
		self:GetMgr():InsertScriptNode(self:GetRoleID(),self)
	end
	local ObjId = self.ObjId
	self.Data.blShow = true
	self.Data.bDead = false
	self.Data.bVariation = false	
	self.dwGrade = 0;
	self.Data.dwBornTime = GetCurTime()
	self.SYS["CMonsterSkillSystem"]:Create(self)
	self:SetExp(self:GetBaseExp())
	self:ReSetAlertDis()
	self.bFury = false
	if self.DataInfo.Variation == 1 then
		MonsterDecision:BirthAgo(self)
	end
	--执行脚本
	--if self.tbFun and self.tbFun.CBMonsterBeforeBorn then
		self.tbFun:CBMonsterBeforeBorn(self)
	--end
	--血蓝全满
	local sysMonsterSkill = self:GetSystem("CMonsterSkillSystem")
	sysMonsterSkill:FullHPAndMPS()
	
	--如果有战场关注我，就发送HP信息
	if self.dwOwnWarID ~= 0 then
		local objWar = CWarHost:FindWar(self.dwOwnWarID);
		if objWar then
			objWar:EventTrophtHPChg(self:GetID(),self:GetHP());
		end
	end

	--回到出生点
	local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
	sysMonsterMove:SetPos(self.Data.fBornX,self.Data.fBornY)
	self.Data.dwCurMapID	= self.Data.dwBornMapId
	----------------
	--同步到客户端
	local Map = self:GetMap() -- CMapManager:GetMap(self.Data.dwCurMapID)
	if Map then
		
		_InsertNode(Map:GetMapLogicID(),self.dwLogicID,sysMonsterMove:GetVPos().x,sysMonsterMove:GetVPos().y);
		
		-- local tbPLayers = Map:GetCanSeePlayer(self)
		local tbMonster = self:GetSendInfo()
		-- local setNet = {}
		-- local szMsgName = "MonsterAddMonsterMsg"
		-- local tParam = {TbMonster=tbMonster}
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- local sysMonster = tbPlayer:GetSystem("CMonsterSystem")
			-- if sysMonster then
				-- sysMonster:SendMonsterAddMonster(tbMonster)
				-- table.insert(setNet,tbPlayer.objNet)
			-- end
		-- end
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout("MonsterAddMonsterMsg", 
			{
				TbMonster=tbMonster
			}, 
			self.dwLogicID, true)
		
		local mgrMon = Map:GetMonsterMgr()
		mgrMon:OnMonsterBorn(self)
	end
	----------------
	--刷新记录
	self:SetLifeTime()
	--执行脚本
	--if self.tbFun and self.tbFun.CBMonsterOnBorn then
		self.tbFun:CBMonsterOnBorn(self)
	--end
	----------------
end
--隐藏Monster
function CMonster:Hide()
	self:GetMgr():RemoveScriptNode(self:GetRoleID())
	local ObjId = self.ObjId
	self.Data.blShow = false
	self.Data.dwHideTime = GetCurTime()
	self:ClearPic()
	self.Data.bDead = true
	self:GetSystem("CMonsterAISystem"):OnDead()
	self:GetSystem("CMonsterBuffSystem"):OnDead()
	self.UserData = {}
	-----------------
	--同步到客户端
	local Map = self:GetMap()
	if Map then
		-- local tbPLayers = Map:GetAllPlayer()
		-- local setNet = {}
		-- local szMsgName = "MonsterRemoveMonsterMsg"
		-- local tParam = {DwMonsterObjId=self.ObjId}
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- local sysMonster = tbPlayer:GetSystem("CMonsterSystem")
			-- if sysMonster then
				-- sysMonster:SendMonsterDelMonster(self.ObjId)
				-- table.insert(setNet,tbPlayer.objNet)
			-- end
		-- end
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout("MonsterRemoveMonsterMsg", 
			{
				DwMonsterObjId=self.ObjId
			}, 
			self.dwLogicID, true)
		
		_RemoveNode(Map:GetMapLogicID(),self.dwLogicID);
		
		local mgrMon = Map:GetMonsterMgr()
		mgrMon:OnMonsterHide(self)
	end
	-----------------
	--刷新记录
	self:SetBornTime()
	-----------------
	if not self.dwNextBornTime then
		local mgrMon = Map:GetMonsterMgr()
		mgrMon:Remove(ObjId)
	end
end
--Monster修改
function CMonster:Modi(tbInfo)
	self.Data.szName = tbInfo.Name or self.Data.szName
	self.Data.szTitle = tbInfo.Title or self.Data.szTitle
	-------------------
	--同步到客户端
	-------------------
end
--Monster播放动作
function CMonster:Play(szActionName,dwEnemyType,dwRoleId,dwPfxID,dwActionType,vecPos,dwDelay,dwSkillID,dwExecTime,dwActCount)
	local szName = ""
	local dwId = 0
	if type(szActionName) == "number" then
		dwId = szActionName
	else
		szName = szActionName
	end
	if not dwPfxID then
		dwPfxID = 0;
	end
	-------------------
	--同步到客户端
	
	if not dwSkillID then
		dwSkillID = 0;
	end
	if not dwExecTime then
		dwExecTime = 0;
	end
	if not dwActCount then
		dwActCount = 0;
	end
	if not dwActionType then
		dwActionType = 0;
	end
	if not vecPos then
		vecPos = {};
	end
	if not dwDelay then
		dwDelay = 0;
	end
	
	local _,x,y = self:GetPos();
	
	local Map = self:GetMap()
	if Map then
		-- local tbPLayers = Map:GetCanSeePlayer(self)
		-- local setNet = {}
		local szMsgName = ""
		local tParam = {}
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet,tbPlayer.objNet)
		-- end
		if dwActionType == 0 then
			szMsgName = "MonsterPlayActionMsg"
			tParam = 
			{
				DwMonsterObjId=self.ObjId,
				SzActionName=szName,
				DwActionId=dwId,
				DwEnemyType=dwEnemyType,
				DwRoleId=dwRoleId,
				PfxID = dwPfxID,
				PosX = x,
				PosY = y,
				SkillID = dwSkillID,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			}
		else
			szMsgName = "MonsterSkillActionMsg"
			tParam = 
			{
				DwMonsterObjId=self.ObjId,
				DwActionType = dwActionType,
				DwActionId = dwId,
				DwEnemyType=dwEnemyType,
				DwRoleId = dwRoleId,
				Delay = dwDelay,
				PosList = {[1]=vecPos},
				PosX = x,
				PosY = y,
				SkillID = dwSkillID,
				ExecTime = dwExecTime,
				ActCount = dwActCount,
			}
		end
		--group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName, tParam, self.dwLogicID, true)
	end
	-------------------
end

function CMonster:CompelMove(dwActID,dwDelay,dwRoleId,tbPosList,dwSkillID,dwExecTime,dwActCount)
	local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
	sysMonsterMove:StopMove()
	
	local Map = self:GetMap()
	if Map then
		--local setNet = {}
		local szMsgName = "MonsterCompelMoveMsg"
		-- local tbPLayers = Map:GetCanSeePlayer(self)
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet,tbPlayer.objNet)
		-- end
		local tParam = {
				DwMonsterObjId=self.ObjId,
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
	
	sysMonsterMove:BeginCompelMove(dwDelay,tbPosList[1]);
end;

--Monster 死亡
function CMonster:Dead(dwEnemyID)
	local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
	if sysMonsterMove:IsMoving() then
		sysMonsterMove:StopMove()
	end
	self:ClearPic()
	self.Data.bDead = true
	self:GetSystem("CMonsterAISystem"):OnDead()
	self:GetSystem("CMonsterBuffSystem"):OnDead()
	self.UserData = {}
	-------------------
	--同步到客户端
	local Map = self:GetMap()
	if Map then
		--local tbPLayers = Map:GetAllPlayer()
		--local setNet = {}
		local szMsgName = "MonsterDeadMsg"
		local tParam = {DwMonsterObjId=self.ObjId,EnemyID = dwEnemyID}
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet, tbPlayer.objNet);
		-- end
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName,tParam, self.dwLogicID, true)
		
		local mgrMon = Map:GetMonsterMgr()
		mgrMon:OnMonsterDead(self)
	end
	self:OnDead(dwEnemyID)
	----------------------
end
--怪物的死亡回调
function CMonster:OnDead(dwEnemyID)
end
--怪物受伤回调
function CMonster:OnHurt(objEnemy,dwSkillID,dwHurtValue)
end
--设置生命时间
function CMonster:SetLifeTime()
	if self.DataInfo.dwLastTime > 0 then
		self.dwNextHideTime = self.Data.dwBornTime + self.DataInfo.dwLastTime*1000
	else
		self.dwNextHideTime = nil
	end
	if self.dwNextHideTime then
		self:GetMgr():InsertBornNode(self:GetRoleID(),self)
	else
		self:GetMgr():RemoveBornNode(self:GetRoleID())
	end
end
--设置刷新时间
function CMonster:SetBornTime()
	if self.DataInfo.dwDelay > 0 then
		self.dwNextBornTime = self.Data.dwHideTime + self.DataInfo.dwDelay*1000
	else
		self.dwNextBornTime = nil
	end
	if self.tbFun and self.tbFun.GetNextBronTime then
		local dwNowTime = math.modf(GetCurTime()/1000)
		local dwYear,dwMonth,dwDay,dwHour,dwMin,dwSec = CTimeFormat:todate(dwNowTime, true, quick)
		local dwWeek = CTimeFormat:toweekEx(dwNowTime) + 1
		local Info,Pos = self.tbFun:GetNextBronTime(self:GetMap():GetLineID(),self:GetMap().MapID,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
		if Info then
			self.dwNextBornTime = _time(1, Info)*1000
			if self.tbFun and self.tbFun.GetBronNotice then
				self.BornNotice = self.tbFun:GetBronNotice(self:GetMap():GetLineID(),self:GetMap().MapID,Info) or {}
			end
		end
		if Pos then
			self:SetBornPos(Pos.x,Pos.y)
		end
	end
	if self.dwNextBornTime then
		self:GetMgr():InsertBornNode(self:GetRoleID(),self)
	else
		self:GetMgr():RemoveBornNode(self:GetRoleID())
	end
end
--设置出生点
function CMonster:SetBornPos(fPosX,fPosY)
	self.Data.fBornX,self.Data.fBornY = fPosX or 0,fPosY or 0
end
--怪物公告
function CMonster:Notice(szStr,dwChannel,bSystem)
	-------------------
	--同步到客户端
	local Map = self:GetMap()
	if Map then
		-- local tbPLayers = Map:GetCanSeePlayer(self)
		-- local setNet = {}
		local szMsgName = "MonsterNoticeMsg"
		local tParam = {Str=szStr,Channel=dwChannel,System=bSystem}
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet, tbPlayer.objNet);
		-- end
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName,tParam, self.dwLogicID, true)
	end
	-------------------
end
--怪物说话
function CMonster:Say(szStr)
	self.dwLastSay = GetCurTime()
	if type(szStr) == "number" then
		szStr = NpcStringConfigInfo[szStr] or tostring(szStr)
	end
	local Map = self:GetMap()
	if Map then
		-- local tbPLayers = Map:GetCanSeePlayer(self)
		-- local setNet = {}
		local szMsgName = "MonsterSayMsg"
		local tParam = {ObjId=self.ObjId,Str=szStr}
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet, tbPlayer.objNet);
		-- end
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName,tParam, self.dwLogicID, true)
	end
end

--添加怪物图片
function CMonster:AddPic(dwId,vPos,fWidth,fHight)
	table.insert(self.Data.Pic,{dwId=dwId,vPos=vPos,fWidth=fWidth,fHight=fHight})
end
--清除怪物图片
function CMonster:ClearPic()
	self.Data.Pic = {}
end

--判断怪物是否要显示到客户端
function CMonster:IsNeedSend()
	if self.Data and (self.Data.blShow) and (self:GetSystem("CMonsterAISystem"):GetState() ~= MonsterState.Dead) and (self:GetSystem("CMonsterSkillSystem").sBaseInfo.dwHP>0) and (not self:IsDead()) then
		return true
	end
	return false
end

--怪物进入战斗说话
function CMonster:SayOnFightStart()
	local dwSpeakId = MonsterDataConfig[self:GetID()].MonSay or 0
	if dwSpeakId==0 then
		dwSpeakId = self:GetID()
	end
	local cfg = (MNSpeakConfig.monster[dwSpeakId] or {}).FightStart
	if not cfg then return end;
	local AllOrder = 0
	for i=1,#cfg do
		AllOrder = AllOrder + cfg[i].dwOrder
	end
	local dwRand = math.random(1,AllOrder)
	AllOrder = 0
	for i=1,#cfg do
		AllOrder = AllOrder + cfg[i].dwOrder
		if AllOrder >= dwRand then
			self:Say(cfg[i].dwTextId)
			return;
		end
	end
end
--战斗说话
function CMonster:SayOnFightIng()
	if not self then return end;
	local dwSpeakId = MonsterDataConfig[self:GetID()].MonSay or 0
	if dwSpeakId==0 then
		dwSpeakId = self:GetID()
	end
	local cfg = (MNSpeakConfig.monster[dwSpeakId] or {}).FightStart
	if not cfg then return end;
	if cfg.dwDelay and (GetCurTime() - self.dwLastSay > cfg.dwDelay) then
		local AllOrder = 0
		for i=1,#cfg do
			AllOrder = AllOrder + cfg[i].dwOrder
		end
		local dwRand = math.random(1,AllOrder)
		AllOrder = 0
		for i=1,#cfg do
			AllOrder = AllOrder + cfg[i].dwOrder
			if AllOrder >= dwRand then
				self:Say(cfg[i].dwTextId)
				return;
			end
		end
	end
end
--怪物移动
function CMonster:MoveTo(path,bFight)
	if not self:IsDead() then
		self:ChangeAI(MonsterState.ForceRun,path,bFight)
	end
	--self:GetSystem("CMonsterMoveSystem"):StartMove(fPosX,fPosY,fSpeed)
end
--怪物是否在移动
function CMonster:IsMoving()
	return self:GetSystem("CMonsterMoveSystem"):IsMoving()
end
--切换ai状态
function CMonster:ChangeAI(dwAIType,...)
	return self:GetSystem("CMonsterAISystem"):ChangeState(dwAIType,...)
end
--设置归属工会
function CMonster:SetGuildID(dwGuildID)
	self.dwOwnerID = dwGuildID
	self.dwOwnerType = MonsterOwnerType.Guild;
end
--获取怪物所属工会ID
function CMonster:GetGuildID()
	if self.dwOwnerType == MonsterOwnerType.Guild then
		return self.dwOwnerID
	else
		return 0;
	end
end
function CMonster:SetOwner(dwType,dwID)
	self.dwOwnerType = dwType;
	self.dwOwnerID = dwID;
end;
function CMonster:GetOwnerType()
	return self.dwOwnerType;
end
function CMonster:GetOwnerID()
	return self.dwOwnerID;
end
--设置怪物的额外掉落
function CMonster:SetDropEx(dwDropId)
	self.dwExDropId = dwDropId
end
-------------------------------------------------------------------------------------
--------------------------战斗接口
-------------------------------------------------------------------------------------
--怪物被攻击
function CMonster:Hurt(dwHurtValue,isCrit,objEnemy,dwSkillID,dwExecTime,dwActCount)
	if self:IsDead() then return dwHurtValue; end;
	--lw：伤害免疫的状态，目前只有镖车用到
	if self.isNotHurt then return dwHurtValue; end;
	--end
	if self.DataInfo.fixed_value and (self.DataInfo.fixed_value ~= 0) then
		dwHurtValue = self.DataInfo.fixed_value
	end
	
	if not dwActCount then
		dwActCount = 0;
	end
	
	local sysMonsterSkill = self:GetSystem("CMonsterSkillSystem")
	local dwEnemyType = objEnemy:GetObjType();
	local dwEnemyID = 0;
	local dwPetID = 0;
	local isPetAttack = false;
	if dwEnemyType == enEntType.eEntType_Player then
		dwEnemyID = objEnemy:GetRoleID();
		if not CConfig.bIsCrossSvr then
			local petSys = objEnemy:GetSystem("CPetSystem");
			if(petSys) then
				dwPetID = petSys:GetOutPetEnumId()
			end
		end;
		self:GetSystem("CMonsterAISystem"):AddHatred(dwEnemyType,dwEnemyID,dwHurtValue)
	elseif dwEnemyType == enEntType.eEntType_Monster then
		dwEnemyID = objEnemy.ObjId;
	elseif dwEnemyType == enEntType.eEntType_Pet then
		dwEnemyID = objEnemy:GetRoleID();
		dwPetID = objEnemy:GetPetID();
		self:GetSystem("CMonsterAISystem"):AddHatred(dwEnemyType,dwEnemyID,dwHurtValue * 2)
		-- local sysAI = self:GetSystem("CMonsterAISystem")
		--print("CMonster:Hurt by pet addHatred , curState ",dwHurtValue * 2,sysAI:GetState(),dwPetID)
		isPetAttack = true;
	end
	dwHurtValue = sysMonsterSkill:ChgHP(-dwHurtValue,isCrit,dwEnemyType,dwEnemyID,dwSkillID,dwExecTime,dwActCount,dwPetID)
	
	--if self.tbFun and self.tbFun.CBMonsterOnAttacked then
		if isPetAttack then
			if self.tbFun.CBMonsterOnPetAttacked then
				self.tbFun.CBMonsterOnPetAttacked(self,objEnemy,dwSkillID,dwHurtValue);
			end
		else
			self.tbFun:CBMonsterOnAttacked(self,objEnemy,dwSkillID,dwHurtValue)
		end
	--end
	self:OnHurt(objEnemy,dwSkillID,dwHurtValue)
	if self:GetAIState()==MonsterState.ForceRun then
		return dwHurtValue
	end
	
	--播放被击的光效，怪物被击技能--id = 3
	local dwPfxID = 0;
	local cfSkill = SkillConfig[3];
	if cfSkill and cfSkill.EventMonsterHurtP then
		dwPfxID = cfSkill:EventMonsterHurtP(dwSkillID,self,objEnemy,dwHurtValue,isCrit);
	end
	
	if dwSkillID and dwSkillID ~= 0 then
		local tbPlayInfo = {};
		tbPlayInfo.szActionName = "Hurt";
		tbPlayInfo.dwActionID = 0;
		tbPlayInfo.dwEnemyType = dwEnemyType;
		tbPlayInfo.dwRoleId = dwEnemyID;
		tbPlayInfo.dwPfxID = dwPfxID;
		--self.objSklPlayer:Add(dwSkillID,dwActCount,3,tbPlayInfo);
		CSkillPlayerManager:Add(self,dwSkillID,dwActCount,3,tbPlayInfo);
	else
		self:Play("Hurt",dwEnemyType,dwEnemyID,dwPfxID,nil,nil,nil,dwSkillID,dwExecTime,dwActCount)
	end
	if (not self:IsDead()) and (self.DataInfo.Fury>0) and (not self.bFury)then
		if (self:GetHP()/self:GetMaxHP()) < (self.DataInfo.Fury/10000) then
			self.bFury = true
			MonsterDecision:Fury(self)
		end
	end
	return dwHurtValue;
end
--怪物被攻击并且miss了
function CMonster:StrikeMiss(dwEnemyType,dwRoleId,dwSkillID,dwExecTime,dwActCount)
	self:GetSystem("CMonsterAISystem"):AddHatred(dwEnemyType,dwRoleId,1)
	local Map = self:GetMap()
	if Map then
		-- local setPlayer = Map:GetCanSeePlayer(self)
		-- local setNet = {}
		local szMsgName = "OnBattleNoticeMsg"
		-- for dwPos,tbPlayer in pairs(setPlayer) do
			-- table.insert(setNet, tbPlayer.objNet);
		-- end
		local tParam = 
		{
			RoleType=enEntType.eEntType_Monster,RoleID=self.ObjId,
			NoticeType=enBattleNoticeType.eBNT_MISS,Value=0,
			UserType=enEntType.eEntType_Player,UserID=dwRoleId,Crit=isCrit or false,
			SkillID = dwSkillID,ExecTime = dwExecTime,ActCount = dwActCount,
		}
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName,tParam, self.dwLogicID, true)
	end
end
--给怪物附上buff
function CMonster:AddBuff(dwId, level)
	local sysMonsterBuff = self:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(dwId, level)
end

function CMonster:DeleteBuffByID(buffId)
	local sysMonsterBuff = self:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:DeleteBuffByID(buffId);
end;
--------------------------------------------------------------------------------------
--------------------------AI 接口
--------------------------------------------------------------------------------------
--对目标使用技能 (废弃)
--玩家id，技能动作文件名，伤害数值，技能id，技能等级，是否强制命中，是否强制暴击
function CMonster:UseSkill(dwRoleId,szActionName,dwValue,dwSkillId,dwSkillLevel,bHit,bCrit)
	
	local dwRoleId = dwRoleId
	local sysSkill = sysSkill
	local sysBattle = sysBattle
	local sysState = nil;
	local dwSkillID = dwSkillID or 1
	local dwSkillLevel = dwSkillLevel or 1
	
	local Player = self:GetMap():GetPlayerByRoleID(dwRoleId)
	if Player then
		sysBattle = Player:GetSystem("CBattleSystem");
		sysSkill = Player:GetSystem("CSkillSystem");
		sysState = Player:GetSystem("CStateSystem");
		
		sysState:CheckPlayerAction(enPlayerAction.ePA_Hurt);
	else
		return false
	end
	
	local szActionName = szActionName
	if not szActionName then
		self:Play("Atk",dwRoleId)
	else
		self:Play(szActionName,dwRoleId)
	end
	
	local dwHitNum = CBattleCalculator:HitCalculator(self,Player)
	local bHit = bHit or (dwHitNum > math.random(0,10000))
	if bHit==false then
		sysSkill:BroadcastBattleNotice(enBattleNoticeType.eBNT_MISS,0,enEntType.eEntType_Monster,self.ObjId,false)
		return true;
	end
	
	local dwCritNum = CBattleCalculator:CritCalculator(self,Player)
	
	local bCrit = bCrit or (dwCritNum > math.random(0,10000))
	local dwValue = dwValue or CBattleCalculator:DamageCalculator(dwSkillID,dwSkillLevel,self,Player,bCrit) or 1
	sysBattle:Hurt(dwValue,bCrit,self);
	
	return true
end


---------------------------------------------------------------------------------------
---------------------------数据接口
---------------------------------------------------------------------------------------
--返回Monster data 信息
function CMonster:GetData()
	return self.Data
end
--返回MonsterId
function CMonster:GetID()
	return self.Data.dwMonsterId
end
--获取 Monster 坐标
function CMonster:GetPos()
	local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
	return self.Data.dwCurMapID,sysMonsterMove:GetVPos().x,sysMonsterMove:GetVPos().y
end

function CMonster:GetVectorPos()
	local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
	return sysMonsterMove:GetVPos()
end;
--获取当前AI状态
function CMonster:GetAIState()
	return self:GetSystem("CMonsterAISystem"):GetState()
end
--获取怪物经验
function CMonster:GetExp()
	return self.DataInfo.exp * (self.DiffTbl.dwExp or 1)
end
--设置怪物经验
function CMonster:SetExp(dwExp)
	self.DataInfo.exp = dwExp
end
--获取怪物基础经验
function CMonster:GetBaseExp()
	return self.Data.dwBaseExp
end
--获取怪物名字
function CMonster:GetName()
	return self.Data.szName
end
--获取怪物等级
function CMonster:GetLevel()
	return self.DataInfo.dwLevel
end
--获取怪物血上限
function CMonster:GetMaxHP()
	local sysMonsterSkill = self:GetSystem("CMonsterSkillSystem")
	return sysMonsterSkill:GetInfo().dwHPMax
end
--获取怪物当前血
function CMonster:GetHP()
	local sysMonsterSkill = self:GetSystem("CMonsterSkillSystem")
	return sysMonsterSkill:GetHp()
end

--返回Monster需要发送给客户端的消息
function CMonster:GetSendInfo()
	if self.DataInfo.Hidden==1 then
		return {}
	end
	local sysMonsterSkill = self:GetSystem("CMonsterSkillSystem")
	local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
	local sInfo = sysMonsterSkill:GetInfo()
	local Monster = {}
	Monster.ObjId = self.ObjId
	Monster[2] = {}
	--显示信息
	Monster[2][1]			= self.Data.szName		--名字
	Monster[2][2]		= self.Data.szTitle		--称号
	Monster[2][3]		= self.Data.dwLookId	--外形
	Monster[2][4]	= self.Data.dwMonsterId	--配置id
	Monster[2][5]		= self.DataInfo.dwLevel	--等级
	Monster[2][6]			= self.Data.Pic			--图片
	--位置信息
	Monster[2][7]			= self:GetVectorPos().x		--x
	Monster[2][8]			= self:GetVectorPos().y		--y
	if tostring(Monster[2][7])=="nan" then
		Monster[2][7] = self.Data.fBornX
		sysMonsterMove:SetPos(self.Data.fBornX,self.Data.fBornY)
	end
	if tostring(Monster[2][8])=="nan" then
		Monster[2][8] = self.Data.fBornY
		sysMonsterMove:SetPos(self.Data.fBornX,self.Data.fBornY)
	end
	Monster[2][9]		= self.Data.dwCurMapID	--map
	--战斗属性
	local sInfo = sysMonsterSkill:GetInfo()
	Monster[2][10]			= sInfo.dwHP
	Monster[2][11]		= sInfo.dwHPMax
	Monster[2][12]			= sInfo.dwMP
	Monster[2][13]		= sInfo.dwMPMax
	Monster[2][14]			= self.Data.bDead
	--归属信息
	Monster[2][15]	= self:GetOwnerType();
	
	Monster[2][16]	= self.setPfxList;
	
	Monster[2][17] = self:GetGrade()
	
	Monster[2][18] = self:GetOwnerID()
	
	--如果怪物在移动，需要添加移动数据
	if sysMonsterMove:IsMoving() then
		Monster[3] = {};
		Monster[3][1] = sysMonsterMove.vTarget.x;
		Monster[3][2] = sysMonsterMove.vTarget.y;
		Monster[3][3] = sysMonsterMove.fSpeed;
		Monster[3][4] = sysMonsterMove.fDir;
	end
	return Monster
end

--判断对象是否是boss
function CMonster:IsBoss()
	return self.DataInfo._type == 2
end
--判断是否是任务boss
function CMonster:IsTaskBoss()
	return self.DataInfo.isTaskBoss==1;
end


--返回怪物类型
function CMonster:GetMonsterType()
	return self.DataInfo._type
end

--获取对象类型
function CMonster:GetObjType()
	return enEntType.eEntType_Monster;
end
--获取对象id
function CMonster:GetRoleID()
	return self.ObjId;
end
--获取地图
function CMonster:GetMap()
	return self.Map
end
--获取出生点
function CMonster:GetBornPos()
	return {x=self.Data.fBornX;y=self.Data.fBornY};
end
--获取系统
function CMonster:GetSystem(szName)
	return self.SYS[szName]
end
--获取脚本
function CMonster:GetScript()
	return self.tbFun
end
--判断怪物是否死亡
function CMonster:IsDead()
	if not self.Data then return true end;
	return self.Data.bDead
end
--获得下一次刷新时间
function CMonster:GetNextBornTime()
	if GetCurTime() < (self.dwNextBornTime or 0) then
		return self.dwNextBornTime or 0
	end
	if self.tbFun and self.tbFun.GetNextBronTime then
		local dwNowTime = math.modf(GetCurTime()/1000)
		local dwYear,dwMonth,dwDay,dwHour,dwMin,dwSec = CTimeFormat:todate(dwNowTime, true, quick)
		local dwWeek = CTimeFormat:toweekEx(dwNowTime) + 1
		local Info,Pos = self.tbFun:GetNextBronTime(self:GetMap():GetLineID(),self:GetMap().MapID,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
		if Info then
			self.dwNextBornTime = _time(1, Info)*1000
			return self.dwNextBornTime
		end
	end
	if self.DataInfo.dwDelay > 0 then
		self.dwNextBornTime = GetCurTime() + self.DataInfo.dwDelay*1000
		return self.dwNextBornTime
	end
end
--获取怪物的掉落id
function CMonster:GetDropId()
	return self.DataInfo.dwDropId,self.dwExDropId
end	

--给怪物所在地图的所有玩家发送消息
function CMonster:MapNotice(dwId,dwType)
	local Map = self:GetMap()
	local Players = Map:GetAllPlayer()
	for k,v in pairs(Players) do
		local sysScrip = v:GetSystem("CScriptSystem")
		if sysScrip then
			sysScrip:Notice(dwId,dwType)
		end
	end
end
local _type_define = {
	[1] = "szName";
	[2] = "szTitle";
	[3] = "dwLookId";
	[4] = "dwMonsterId";
}
--修改出生之前要发送的数据
function CMonster:SetSendData(dwType,tValue)
	local _type = _type_define[dwType]
	if _type then
		self.Data[_type] = tValue
		return true
	end
	return false
end
-----------------------------------------------------------
function CMonster:SetProperty(key,value)
	local sysSkill = self:GetSystem("CMonsterSkillSystem")
	return sysSkill:SetProperty(key,value)
end
function CMonster:GetFightId()
	return self.dwFightId
end
--设置是否变异
function CMonster:SetVariation(bVariation,dwGrade)
	self.Data.bVariation = bVariation or false
	self.dwGrade = dwGrade or 0	
end
--返回怪物星数
function CMonster:GetGrade()
	return self.dwGrade or 0
end

--返回变异信息
function CMonster:IsVariation()
	return self.Data.bVariation
end
--设置副本数据
function CMonster:SetDuplData(dwData)
	local Map = self:GetMap()
	if not Map then return end;
	local Dupl = Map:GetDuplObj()
	if not Dupl then return end;
	Dupl:SetMonsterTime(dwData)
end

--设置ZL副本数据
function CMonster:SetZLDuplData()
	local Map = self:GetMap()
	if not Map then return end;
	local Dupl = Map:GetDuplObj()
	if not Dupl then return end;
	Dupl:SetInfoByDead(self:GetID())
end

-- function CMonster:ReadySkillEffect(dwSkillID,dwActCount)
	-- self.objSklPlayer:Begin(dwSkillID,dwActCount);
-- end;

function CMonster:ReadySkillEffect(dwSkillID,dwActCount)
	self.objSklPlayer:Begin(dwSkillID,dwActCount);
end;

function CMonster:EndSkillEffect(dwSkillID,dwActCount,dwNowTime,isLastAct)
	self.objSklPlayer:End(dwSkillID,dwActCount,dwNowTime,isLastAct);
end;

--获取 Monster 安全区
function CMonster:GetSafeState()
	local sysMonsterMove = self:GetSystem("CMonsterMoveSystem")
	local mapId = self.Data.dwCurMapID;
	local posx = sysMonsterMove:GetVPos().x;
	local posy = sysMonsterMove:GetVPos().y;
	local mapInfo = SafeSideConfig[mapId];
	if not mapInfo then return end;
	for _, info in pairs(mapInfo) do
		local xPos = info.xPos;
		local yPos = info.yPos;
		local dwRange = info.dwRange;
		
		if math.sqrt((xPos - posx) ^ 2 + (yPos - posy) ^ 2) <= dwRange then 
			return true;
		end;
	end;
	return false;
end

function CMonster:IsScript()
	return self.DataInfo.Warn == 1
end

function CMonster:SetAlertDis(dwValue)
	local sysAI = self:GetSystem("CMonsterAISystem")
	sysAI:SetAlertDis(dwValue)
end
function CMonster:ReSetAlertDis()
	local sysAI = self:GetSystem("CMonsterAISystem")
	sysAI:ReSetAlertDis()
end

function CMonster:SetDuplState()
	local Map = self:GetMap()
	if not Map then return end;
	local Dupl = Map:GetDuplObj()
	if not Dupl then return end;
	Dupl:SetDuplDefState(false);
end

function CMonster:GetLogicID()
	return self.dwLogicID;
end;

function CMonster:GetEscortInfo()
	local sysAI = self:GetSystem("CMonsterAISystem")
	return sysAI:GetEscornInfo();
end;

-------------------------------------------------------------------------------
--外形pfx相关
function CMonster:AddViewPfx(dwPfxCfg)
	if not Effect_Deploy[dwPfxCfg] then
		return;
	end
	
	self.setPfxList[dwPfxCfg] = dwPfxCfg;
	
	--broadcast
	-- local tbPlayerList = {};
	-- local objMap = self:GetMap()
	-- if objMap then
		-- tbPlayerList = objMap:GetCanSeePlayer(self);
	-- end
	
	-- local setNet = {}
	local szMsgName = "OnRoleAddViewPfxMsg"
	local tParam = 
	{
		RoleType = enEntType.eEntType_Monster;
		RoleID = self:GetRoleID();
		PfxCfg = dwPfxCfg;
	}
	
	-- for n,objPlayer in pairs(tbPlayerList)do
		-- table.insert(setNet, objPlayer.objNet);
	-- end
	-- group_msg(setNet,szMsgName,tParam)
	
	_mapcallout(szMsgName,tParam, self.dwLogicID, true)
end;

function CMonster:RmvViewPfx(dwPfxCfg)
	self.setPfxList[dwPfxCfg] = nil;
	
	--broadcast
	-- local tbPlayerList = {};
	-- local objMap = self:GetMap()
	-- if objMap then
		-- tbPlayerList = objMap:GetCanSeePlayer(self);
	-- end
	-- local setNet = {}
	local szMsgName = "OnRoleRmvViewPfxMsg"
	local tParam = 
	{
		RoleType = enEntType.eEntType_Monster;
		RoleID = self:GetRoleID();
		PfxCfg = dwPfxCfg;
	}
	-- for n,objPlayer in pairs(tbPlayerList)do
		-- table.insert(setNet, objPlayer.objNet);
	-- end
	-- group_msg(setNet,szMsgName,tParam)
	
	_mapcallout(szMsgName,tParam, self.dwLogicID, true)
end;


