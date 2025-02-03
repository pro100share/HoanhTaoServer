--世家战系统，个人接口

_G.CWarSystem = {};

function CWarSystem:new()
	local obj = CSystem:new("CWarSystem");
	
	obj.dwCurWarID = 0;
	
	---
	for i,v in pairs(CWarSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

---------------------------------------------------------------------------------------------------
function CWarSystem:Create()
	self.dwCurWarID = 0;
	self.dwMyEnmity = 0;
	
	return true;
end;

function CWarSystem:Update()
	-- if self.dwCurWarID == 0 then
		-- return;
	-- end
	
	-- local objSelf = self:GetPlayer();
	-- if not objSelf then
		-- return;
	-- end
	-- local objMapSys = objSelf:GetSystem("CMapSystem");
	-- if not objMapSys then
		-- return;
	-- end
	
	-- local tbScript = CScriptManager:GetScript(5,objMapSys.dwCurMapID);
	-- if tbScript and tbScript.UpdateByWarSystem then
		-- tbScript:UpdateByWarSystem(self,objSelf);
	-- end
	
	return true;
end;

function CWarSystem:Destroy()
	--print("===============destroy",self.dwCurWarID)
	
end;

function CWarSystem:OnDestroyBegin()
	if self.dwCurWarID == 0 then
		return;
	end
	local objSelf = self:GetPlayer();
	if objSelf:GetSystem("CTeamSystem") then
		objSelf:GetSystem("CTeamSystem"):ExitTeam(false)
	end;
	CWarHost:TryLevelWar(objSelf,self.dwCurWarID);
	self.dwCurWarID = 0;
end;

function CWarSystem:OnDead(dwEnemyType,dwEnemyID)
	if self.dwCurWarID == 0 then
		return;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end

	if dwEnemyType == enEntType.eEntType_Player then
		--人杀死人
		local objKiller = CMapManager:GetPlayer(dwEnemyID);
		if objKiller then
			local objWar = CWarHost:FindWar(self.dwCurWarID);
			if objWar then
				objWar:EventKillPlayer(objKiller,objSelf);
			end
		end
	elseif dwEnemyType == enEntType.eEntType_Monster then
		--怪物杀死人
		local objKiller = nil;
		local objMapSystem = objSelf:GetSystem("CMapSystem");
		if objMapSystem then
			local objMap = objMapSystem:GetCurMap();
			if objMap then
				objKiller = objMap:GetMonsterByObjID(dwEnemyID);
			end
		end
		
		if objKiller then
			local objWar = CWarHost:FindWar(self.dwCurWarID);
			if objWar then
				objWar:EventKillPlayer(objKiller,objSelf);
			end
		end
	elseif dwEnemyType == enEntType.eEntType_Pet then
		--宠物打死人算人的
		local objKiller = CMapManager:GetPlayer(dwEnemyID);
		if objKiller then
			local objWar = CWarHost:FindWar(self.dwCurWarID);
			if objWar then
				objWar:EventKillPlayer(objKiller,objSelf);
			end
		end
	elseif dwEnemyType == -1 then
		--自杀
		local objWar = CWarHost:FindWar(self.dwCurWarID);
		if objWar then
			objWar:EventKillPlayer(objSelf,objSelf);
		end
	end
end;

function CWarSystem:OnChangeSceneEnd()
	--场景切换完毕
	if self.dwCurWarID == 0 then
		return;
	end
	--print("==============OnChangeSceneEnd",self.isEntering)
	local objSelf = self:GetPlayer();
	if self.isEntering == 1 then
		--这里角色最终进入War的地图
		local dwLength = 0;
		local dwMyLen = 0;
		local objWar = CWarHost:FindWar(self.dwCurWarID);
		local tbTrophyInfo = {};
		if objWar and  WarEnterConfig[self.dwCurWarID] then
			dwLength = WarEnterConfig[self.dwCurWarID].fShowTime - (GetCurTime() - objWar.dwBeginTime);
			tbTrophyInfo = objWar.setTrophyInfo;
			dwMyLen = objWar:GetRoleLength(objSelf:GetRoleID());
		end
		objSelf.OnEnterWarMsg
		{
			WarID = self.dwCurWarID;
			WarLastLength = dwLength;
			MyHaveLength = dwMyLen;
		};
        
        -- 发送侠客岛怪物信息
        if self.dwCurWarID == 10070 then
            objSelf.WarXiaKeDeadListMsg{DeadList = CWarHost:GetXiaKeList()};
        end
		
		--初始化鼎的数据
		local tbOwnerInfo = {};
		local tbHPInfo = {};
		
		local tmNow = GetCurTime();
		
		for index,info in pairs(tbTrophyInfo)do
			tbOwnerInfo[index] = {};
			tbOwnerInfo[index][1] = info.szOwner;
			if info.tmChangeTime > 0 then
				tbOwnerInfo[index][2] = tmNow - info.tmChangeTime;
			end
			tbHPInfo[index] = info.dwHPValue;
		end;
		objSelf.OnTrophyInitMsg{TrophyList = tbOwnerInfo};
		objSelf.OnTrophyHPChgMsg{ChgInfo = tbHPInfo};
		
		--初始化杀人数等数据
		objWar:SendKillSortToPlayer(objSelf);
		local tbMyInfo = objWar.setRoleFightInfo[objSelf:GetRoleID()];
		if tbMyInfo then
			self:SendMyKillNum(tbMyInfo.dwKillTotal,tbMyInfo.dwKillCombo);
		else
			self:SendMyKillNum(0,0);
		end
		
		--初始化积分数据
		objWar:SendScoreToPlayer(objSelf);
		
		--初始化收益数据
		local tbMyHarvest = objWar.setHarvestList[objSelf:GetRoleID()];
		if tbMyHarvest then
			objSelf.OnWarHarvestMsg
			{
				Exp = tbMyHarvest.jingyan;
				Jin = tbMyHarvest.zhenqi_G;
				Mu = tbMyHarvest.zhenqi_M;
				Shui = tbMyHarvest.zhenqi_S;
				Huo = tbMyHarvest.zhenqi_H;
				Tu = tbMyHarvest.zhenqi_T;
				IsKill = 0;
				IsInit = 1;
			};
		end
		--初始化组队战场积分
		objWar:SendTeamScoreSort()
		--进入副本同步积分
		self.isEntering = nil;
	elseif self.isEntering == 2 then
		CWarHost:TryLevelWar(objSelf,self.dwCurWarID);
		self.dwCurWarID = 0;
		self.isEntering = nil;
	end
end;

function CWarSystem:OnChangeLineCheck()
	if self.dwCurWarID == 0 then
		return true;
	end
	--是因为战场而申请换线则通过
	if self.isBacking then
		return true;
	end
	
	return false;
end;

function CWarSystem:OnChangeLineBegin()
	self.tbOldMapInfo = nil;
end;

function CWarSystem:OnChangeLineEnd()
	local objSelf = self:GetPlayer();
	
	local DataBase = objSelf:GetLineData("CWarSystem");
	if not DataBase then
		return;
	end
	
	local Data = DataBase[1];
	if not Data then
		return;
	end
	
	--是进入还是退出
	if Data.isEnter then
		self.tbOldMapInfo = Data.tbOldInfo;
		
		if CWarHost:TryEnterWarChange(objSelf,Data.dwWarID) then
			self.isEntering = 1;
		end
	else
		--换线进入的时候，直接修改MapSystem中的数据
		--这个地方是在ChangeLineEnd中调用的，之后CMapSystem:ExecChangeMap会被调用，所以这里就不调用了
		local objMapSys = objSelf:GetSystem("CMapSystem");
		if not objMapSys then
			return;
		end;
		
		objMapSys.dwCurMapID = Data.dwCurMapID;
		objMapSys.fXPos = Data.fMyPosX;
		objMapSys.fYPos = Data.fMyPosY;
		objMapSys.fDirValue = math.random(0,6);
		
		objMapSys.isMustReload = true;
	end
	
end;

------------------------------------------------------
--在分机部分的接口
--申请加入
function CWarSystem:TryJoinWar(dwWarID)
	if self.dwCurWarID ~= 0 then
		return;
	end
	
	local objSelf = self:GetPlayer();
	if not CWarJoin:IsOpen(dwWarID) then
		--notice
		_info("===close===",dwWarID)
		objSelf.OnServerNoticeMsg{WordID =6001010304};
		return;
	end
	
	if not CWarJoin:CheckJoinTime(dwWarID) then
		--notice
		_info("===time forbid===",dwWarID)
		objSelf.OnServerNoticeMsg{WordID =6001010304};
		return;
	end
	
	if not CWarJoin:CheckJoinCondition(dwWarID,objSelf) then
		return;
	end
	
	CKernelApp.OnKSRequestWarLineMsg
	{
		RoleID = objSelf:GetRoleID();
		WarID = dwWarID;
		LineID = CKernelApp.dwLineID;
	};
end;

--收到战争目标信息后，换线
function CWarSystem:BeginWar(dwWarID,dwLineID)
	--lineid还表示war当前的异常
	-- -1：没有找到war；-2：服务器满了
	if dwLineID == -1 then
		_info("============can not find war=============",dwWarID)
		return;
	end
	
	if dwLineID == -2 then
		_info("============can not find war line=============",dwWarID)
		return;
	end
	
	local objSelf = self:GetPlayer();
	local objMapSys = objSelf:GetSystem("CMapSystem");
	if not objMapSys then
		_err("");
		return;
	end
	
	--本地服务器的战争
	if dwLineID == CKernelApp.dwLineID then
		self.tbOldMapInfo = {};
		self.tbOldMapInfo.dwOldLine = CKernelApp.dwLineID;
		self.tbOldMapInfo.dwCurMapID = objMapSys.dwCurMapID;
		self.tbOldMapInfo.fMyPosX = objMapSys.fXPos;
		self.tbOldMapInfo.fMyPosY = objMapSys.fYPos;
		
		CWarHost:TryEnterWarLocal(objSelf,dwWarID);
	else
		local Data = {};
		Data.isEnter = true;
		Data.dwWarID = dwWarID;
		Data.tbOldInfo = {};
		Data.tbOldInfo.dwOldLine = CKernelApp.dwLineID;
		Data.tbOldInfo.dwCurMapID = objMapSys.dwCurMapID;
		Data.tbOldInfo.fMyPosX = objMapSys.fXPos;
		Data.tbOldInfo.fMyPosY = objMapSys.fYPos;
	
		if objSelf:ClientChangeLineReq(dwLineID) then
			objSelf:SetLineData("CWarSystem",Data);
		end
	end
	
	local objEventCenter = objSelf:GetSystem("CPlayerEventCenterSystem");
	if objEventCenter then
		if dwWarID == 10001 then
			objEventCenter:DoEvent(enumPlayerEventType.EventEnterLDZ);
		elseif dwWarID == 10010 then
			objEventCenter:DoEvent(enumPlayerEventType.EventEnterMZZ);
		elseif dwWarID == 10020 then
			objEventCenter:DoEvent(enumPlayerEventType.EventEnterYZXY);
		elseif dwWarID >= 10002 and dwWarID <= 10005 then
			objEventCenter:DoEvent(enumPlayerEventType.EventEnterERG);
		end
		
	end
end;

------------------------------------------------------
--在主机部分的接口
--确认加入
function CWarSystem:EnterWar(dwWarID)
	self.dwCurWarID = dwWarID;
end;

--离开战争
function CWarSystem:TryEixtWar()
	if self.dwCurWarID == 0 then
		return;
	end
	
	--self:Back();
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objWar = CWarHost:FindWar(self.dwCurWarID);
	if objWar then
		objWar:KickPlayer(objSelf:GetRoleID());
	end
end;

--回到原来
function CWarSystem:Back()
	local objSelf = self:GetPlayer();
	
	if not self.tbOldMapInfo then
		--修复OldInfo
		self.tbOldMapInfo.dwOldLine = 1;
		
		--修复的Map点，这个是保证存在且可靠的
		local dwRepaireMapID = ResetMapInfoByError.dwMapID;
		local tbCfg = MapInfoConfig[dwRepaireMapID];
		local tbPoint = tbCfg.point[ResetMapInfoByError.dwPointID]
		
		self.tbOldMapInfo.dwCurMapID = dwRepaireMapID;
		self.tbOldMapInfo.fMyPosX = tbPoint.fXPos;
		self.tbOldMapInfo.fMyPosY = tbPoint.fYPos;
		-- print("Role OldMapInfo Empty Repair",objSelf:GetRoleID())
	end
	
	local tbBackInfo = nil;
	local objWar = CWarHost:FindWar(self.dwCurWarID);
	if objWar then
		tbBackInfo = objWar:GetExitInfo()
	end
	if not tbBackInfo then
		tbBackInfo = self.tbOldMapInfo;
	end
	
	--print("============================CWarSystem:Back")
	if self.tbOldMapInfo.dwOldLine == CKernelApp.dwLineID then
		--回到本地的地图
		local objMapSys = objSelf:GetSystem("CMapSystem");
		if not objMapSys then
			_err("");
			return;
		end
		self.isEntering = 2;
		objMapSys:ExecTransforMapXY(tbBackInfo.dwCurMapID,tbBackInfo.fMyPosX,tbBackInfo.fMyPosY,math.random(0,6));
	else
		--跳线
		self.isBacking = true;
		local Data = {};
		Data.isEnter = false;
		Data.dwCurMapID = tbBackInfo.dwCurMapID;
		Data.fMyPosX = tbBackInfo.fMyPosX;
		Data.fMyPosY = tbBackInfo.fMyPosY;
		--print("============================CWarSystem:Back changeline")
		
		local function funDoneWithFail()
			objSelf.CreateGameSessionRequestMsg{ResultCode = -25};
			_closenet(objSelf.objNet);
		end
		if objSelf:ClientChangeLineReq(self.tbOldMapInfo.dwOldLine,funDoneWithFail) then
			objSelf:SetLineData("CWarSystem",Data);
		end
	end
	
	--self.dwCurWarID = 0;
end;

--下线的处理
function CWarSystem:DoneWithOffLine(objMapSys)
	if self.dwCurWarID == 0 then
		return;
	end
	
	if not self.tbOldMapInfo then
		return;
	end
	
	local tbInfo = {};
	
	tbInfo.dwCurMapID = self.tbOldMapInfo.dwCurMapID;
	tbInfo.fXPos = self.tbOldMapInfo.fMyPosX;
	tbInfo.fYPos = self.tbOldMapInfo.fMyPosY;
	tbInfo.fDirValue = math.random(0,6);
	
	return tbInfo;
end;

-------------------------------------------------------------------------------
function CWarSystem:SendTrophyChangeMsg(dwTrophyID,szNewGuildName)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	objSelf.OnTrophyChangeMsg
	{
		TrophyID = dwTrophyID;
		NewGuildName = szNewGuildName;
	}
end;

function CWarSystem:SendTrophyHPInfo(info)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	objSelf.OnTrophyHPChgMsg
	{
		ChgInfo = info;
	}
end;

function CWarSystem:SendSortInfoAll(tbInfo)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	objSelf.OnUpdateKillAllMsg
	{
		KillInfo = tbInfo;
	}
end;

function CWarSystem:SendSortInfoCon(tbInfo)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	objSelf.OnUpdateKillConMsg
	{
		KillInfo = tbInfo;
	}
end;

function CWarSystem:SendMyKillNum(dwAll,dwCon)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	if not dwAll then
		dwAll = 0;
	end
	if not dwCon then
		dwCon = 0;
	end
	
	objSelf.OnMyKillNumMsg
	{
		KillAll = dwAll;
		KillCon = dwCon;
	}
end;

function CWarSystem:SendEnmitySucc(szName)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	objSelf.OnKillEnmityMsg
	{
		EnmityName = szName;
	};
end;

function CWarSystem:SendSplMember(tbList)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	objSelf.OnUpdateSplMemberMsg
	{
		List = tbList;
	};
end;

function CWarSystem:SendMyScore(dwScore)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	objSelf.OnWarMyScoreMsg
	{
		Score = dwScore;
	}
end;

-------------------------------------------------------------------------------
--杀死怪物的事件，在这里把事件扔到War对象中
function CWarSystem:EventMonsterKill(objMonster)
	if self.dwCurWarID == 0 then
		--print("=====CWarSystem:EventMonsterKill=======",self.dwCurWarID)
		return;
	end
	
	local objWar = CWarHost:FindWar(self.dwCurWarID);
	if not objWar then
		--print("=====CWarSystem:EventMonsterKill=======",self.dwCurWarID)
		return;
	end
	
	local cfgWar = WarConfig[self.dwCurWarID];
	if not cfgWar then
		--print("=====CWarSystem:EventMonsterKill=======",self.dwCurWarID)
		return;
	end
	
	local isUsedMon = false;
	for mapid,monid in pairs(cfgWar.TrophyMonster)do
		if monid == objMonster:GetID() then
			isUsedMon = true;
			break;
		end
	end
	
	if isUsedMon then
		objWar:EventTrophyChg(objMonster:GetID(),self:GetPlayer());
	else
		--print("=====CWarSystem:EventMonsterKill=======",objMonster:GetID())
	end
end;

function CWarSystem:CheckWarBuff(dwBuffID)
	if self.dwCurWarID == 0 then
		return true;
	end
	
	return CWarHost:CheckBuffForbid(dwBuffID,self.dwCurWarID);
end;

function CWarSystem:SetMyEnmity(dwRoleID)
	self.dwMyEnmity = dwRoleID;
end;

function CWarSystem:ClearMyEnmity()
	self.dwMyEnmity = 0;
end;

function CWarSystem:GetMyWarScore()
	local objWar = CWarHost:FindWar(self.dwCurWarID);
	if not objWar then
		return 0;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return 0;
	end
	
	local objGuildSys = objSelf:GetSystem("CGuildSystem");
	if not objGuildSys then
		return 0;
	end
	
	return objWar:CountTrophyScore(objGuildSys:GetGuildID());
end;

-------------------------------------------------------------------------------
function CWarSystem:AddHarvest(tbInfo,isKillGet)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	-- local objWar = CWarHost:FindWar(self.dwCurWarID);
	-- if objWar then
		-- objWar:AddRoleHarvest(objSelf:GetRoleID(),tbInfo);
	-- end
	
	objSelf:AddExp(tbInfo.jingyan);
	local objFiveSys = objSelf:GetSystem("CFiveElemSystem");
	if objFiveSys then	
		local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objFiveSys:GetElemValue()	
		
		objFiveSys:ChangeAttr("dwMetalValue",tbInfo.zhenqi_G);
		objFiveSys:ChangeAttr("dwWoodValue",tbInfo.zhenqi_M);
		objFiveSys:ChangeAttr("dwWaterValue",tbInfo.zhenqi_S);
		objFiveSys:ChangeAttr("dwFireValue",tbInfo.zhenqi_H);
		objFiveSys:ChangeAttr("dwEarthValue",tbInfo.zhenqi_T);
		local setData = {
			[1] = {dwCurrent = uItemGold, dwChange = tbInfo.zhenqi_G};
			[2] = {dwCurrent = uItemWood, dwChange = tbInfo.zhenqi_M};
			[3] = {dwCurrent = uItemWater, dwChange = tbInfo.zhenqi_S};
			[4] = {dwCurrent = uItemFire, dwChange = tbInfo.zhenqi_H};
			[5] = {dwCurrent = uItemEarth, dwChange = tbInfo.zhenqi_T};
		}
		
		CLogSystemManager:zhenqi(objSelf, setData, _G.FiveElemSysOperType.WarSystem)	
	end
	
	local dwFlg = 0;
	if isKillGet then
		dwFlg = 1;
	end
	
	objSelf.OnWarHarvestMsg
	{
		Exp = tbInfo.jingyan;
		Jin = tbInfo.zhenqi_G;
		Mu = tbInfo.zhenqi_M;
		Shui = tbInfo.zhenqi_S;
		Huo = tbInfo.zhenqi_H;
		Tu = tbInfo.zhenqi_T;
		IsKill = dwFlg;
		IsInit = 0;
	}
end;

--增加货币，参数分别是：钱，元宝，礼金
function CWarSystem:AddMoneyHarvest(dwMoney,dwGold,dwBindGold)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objItemSys = objSelf:GetSystem("CItemSystem");
	if not objItemSys then
		return;
	end
	
	if dwGold > 0 then
		objItemSys:AddGold(dwGold,_G.ItemSysOperType.WarHarvest);
	end
	if dwMoney > 0 then
		objItemSys:AddPacketMoney(dwMoney,_G.ItemSysOperType.WarHarvest);
	end
	if dwBindGold > 0 then
		objItemSys:AddBindGold(dwBindGold,_G.ItemSysOperType.WarHarvest);
	end
end;

--同步个人小队排位及积分
function CWarSystem:SendWarTeamScore(value, position)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SendWarTeamScoreMsg{Score = value, Pos = position};
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	local members = teamSystem:GetTeamLeaguer();
	if members then
		for _, memberId in pairs(members) do
			if objPlayer:GetRoleID() ~= memberId then
				local player = objPlayer:GetOtherPlayer(memberId, 3);  --获得当前先队友信息
				if player then
					player.SendWarTeamScoreMsg{Score = value, Pos = position};
				end;
			end;	
		end;
	end;
end;

function CWarSystem:CheckExitTeamInWar()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwCurWarID == 0 then
		return;
	end;
	local objWar = CWarHost:FindWar(self.dwCurWarID);
	if not objWar then
		return;
	end;
	objPlayer.SendKickPlayerOutWarMsg{};
	objWar:EventKickPlayerOutWar(objPlayer);
end;

function CWarSystem:ClearDismissInWar()	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwCurWarID == 0 then
		return;
	end;
	local objWar = CWarHost:FindWar(self.dwCurWarID);
	if not objWar then
		return;
	end;
	objWar:ClearWarTeamScore(objPlayer);
end;

--获得战场
function CWarSystem:GetWarObj()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.dwCurWarID == 0 then
		return;
	end;
	local objWar = CWarHost:FindWar(self.dwCurWarID);
	return objWar;
end;

--是否在战场中
function CWarSystem:IsInWar()
	return self.dwCurWarID ~= 0;
end
