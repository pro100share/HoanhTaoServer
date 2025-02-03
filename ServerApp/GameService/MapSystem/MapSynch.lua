--同步地图上玩家的信息




--显示玩家的时候，用来组合玩家的信息
local arrPosIndex =
{
	fXPos = 1;
	fYPos = 2;
	fDirValue = 3;
}

--同步到客户端的时间
_G.SynchData = {};
function SynchData:new()
	local obj = {};
	obj.tmInfo = GetCurTime();
	obj.tmBtl = GetCurTime();
	obj.tmPKValue = GetCurTime();
	obj.tmPfx = GetCurTime();
	obj.tmShowText = GetCurTime();
	obj.tmModel = GetCurTime();
	
	return obj;
end

local function SetCurTime(tbInfo)
	tbInfo.tmInfo = GetCurTime();
	tbInfo.tmBtl = GetCurTime();
	tbInfo.tmPKValue = GetCurTime();
	tbInfo.tmPfx = GetCurTime();
	tbInfo.tmShowText = GetCurTime();
	tbInfo.tmModel = GetCurTime();
end;

--更新的类型
local enUpdateType = 
{
	tmInfo = 1;
	tmBtl = 2;
	tmPKValue = 3;
	tmPfx = 4;
	tmShowText = 5;
	tmModel = 6;
}

--检查需要更新的项目
local function CheckUpdateTime(tbRecord,tbUpdate)
	local tbNeed = {};
	
	for k,v in pairs(tbRecord)do
		if tbUpdate[k] and v < tbUpdate[k] then
			tbNeed[k] = enUpdateType[k];
		end
	end
	
	return tbNeed;
end;

--创建角色
local function CreateRole(objSendr,objOther)
	local sRoleInfo = objOther:GetInfo();
	
	local tbRoleSend = {};
	for n,v in pairs(sRoleInfo)do
		local key = GetAttrNameToIndex(n);
		if key then
			tbRoleSend[key] = v;
		end
	end
	
	objSendr.OnCreateRoleMsg
	{
		Info = tbRoleSend;
	}
end;
--更新角色信息
local function UpdateRoleInfo(objSendr,objOther)
	local sRoleInfo = objOther:GetInfo();
	
	local tbUpdateInfo = SRoleInfoForUpdate:new();
	_G.MakeUpdateInfoByRoleInfo(tbUpdateInfo,sRoleInfo);
	
	local tbRoleSend = {};
	for n,v in pairs(tbUpdateInfo)do
		local key = GetAttrNameToIndex(n);
		if key then
			tbRoleSend[key] = v;
		end
	end
	
	objSendr.OnUpdateRoleInfoMsg
	{
		RoleID = objOther:GetRoleID();
		Info = tbRoleSend;
	}
end;
--更新战斗信息
local function UpdateBattleInfo(objSendr,objOther)
	local sBattleInfo = objOther:GetBattleInfo();
	
	local tbBtlSend = {};
	for n,v in pairs(sBattleInfo)do
		local key = GetAttrNameToIndex(n);
		if key then
			tbBtlSend[key] = v;
		end
	end
	
	objSendr.OnUpdateBattleInfoMsg
	{
		RoleID = objOther:GetRoleID();
		Info = tbBtlSend;
	}
end;
--更新PK值
local function UpdatePKValue(objSendr,objOther)
	local pkSys = objOther:GetSystem("CPKSystem");
	
	objSendr.OnPKValueChangeMsg
	{
		RoleID = objOther:GetRoleID(),
		PKValue = pkSys.dwPKValue,
	}
end;
--更新特效列表
local function UpdatePfxList(objSendr,objOther)
	objSendr.OnInitViewPfxMsg
	{
		RoleID = objOther:GetRoleID();
		PfxList = objOther.setPfxList;
	}
end;
--更新模型列表
local function UpdateModelList(objSendr,objOther)
	objSendr.OnInitViewModelMsg
	{
		RoleType = enEntType.eEntType_Player;
		RoleID = objOther:GetRoleID();
		ModelList = objOther.setModelList;
	}
end;
--更新显示文字
local function UpdateShowText(objSendr,objOther)
	if not CConfig.bIsCrossSvr then
		local sysPlayerShowText = objOther:GetSystem("PlayerShowTextSystem")
		if sysPlayerShowText then
			sysPlayerShowText:SendMyInfo(objSendr)
		end
	end;
end;
--更新状态
local function UpdateState(objSendr,objOther)
	local stateSys = objOther:GetSystem("CStateSystem");
	--客户端初始就是Normal状态，这种状况下不需要同步
	if stateSys.dwCurState == enPlayerState.ePS_Normal then
		return
	end
	
	local par = 0;
	if stateSys.dwCurState == enPlayerState.ePS_Dead then
		par = 1;
	end
	objSendr.PlayerStateMsg
	{
		RoleID = objOther:GetRoleID(),
		ActionID = stateSys.dwCurState,
		Param = par,
	}
end;

function CMapSystem:SendAddPlayerInfo(objSendr,objOther,isMust)
	local dwOtherRole = objOther:GetRoleID();
	
	local objSendrMap = objSendr:GetSystem("CMapSystem");
	local objOtherMap =  objOther:GetSystem("CMapSystem");
	
	--是否已经看见过这个角色
	local isSee = true;
	--print("@@@@SendAddPlayerInfo@==",objSendrMap.setUpdateTick[dwOtherRole])
	if not objSendrMap.setUpdateTick[dwOtherRole] then
		objSendrMap.setUpdateTick[dwOtherRole] = SynchData:new();
		isSee = false;
	end
	
	if isMust then
		CreateRole(objSendr,objOther);
		
		objOtherMap:SendNowPosInfo(objSendr);
		--objSendrMap:SendNowPosInfo(objOther);
		
		UpdateBattleInfo(objSendr,objOther);
		UpdatePKValue(objSendr,objOther);
		UpdatePfxList(objSendr,objOther);
		UpdateModelList(objSendr,objOther);
		UpdateShowText(objSendr,objOther);
		UpdateState(objSendr,objOther);
	else
		--没有见过的情况下，全部同步
		if not isSee then
			CreateRole(objSendr,objOther);
			
			objOtherMap:SendNowPosInfo(objSendr);
			--objSendrMap:SendNowPosInfo(objOther);
			
			UpdateBattleInfo(objSendr,objOther);
			UpdatePKValue(objSendr,objOther);
			UpdatePfxList(objSendr,objOther);
			UpdateModelList(objSendr,objOther);
			UpdateShowText(objSendr,objOther);
		else
			--有部分见过的情况下，选择同步
			objOtherMap:SendNowPosInfo(objSendr);
			--objSendrMap:SendNowPosInfo(objOther);
			
			local tbUpList = CheckUpdateTime(objSendrMap.setUpdateTick[dwOtherRole],objOther.tbUpdateInfo);
			for n,v in pairs(tbUpList)do
				if v == 1 then
					UpdateRoleInfo(objSendr,objOther);
				elseif v == 2 then
					UpdateBattleInfo(objSendr,objOther);
				elseif v == 3 then
					UpdatePKValue(objSendr,objOther);
				elseif v == 4 then
					UpdatePfxList(objSendr,objOther);
				elseif v == 5 then
					UpdateShowText(objSendr,objOther);
				elseif v == 6 then
					UpdateModelList(objSendr,objOther);
				end
			end
		end
		
		UpdateState(objSendr,objOther);
	end
	
	SetCurTime(objSendrMap.setUpdateTick[dwOtherRole]);
end

-- function CMapSystem:SendAddPlayerInfoEx(objSendr,objOther,isMust)
	-- --判断
	-- local dwOtherRole = objOther:GetRoleID();
	-- local objMapSys =  objOther:GetSystem("CMapSystem");
	-- local tbPos = objMapSys:GetPlayerPos();
	
	-- local objSendrMap = objSendr:GetSystem("CMapSystem");
	-- local tbSendrPos = objSendrMap:GetPlayerPos();
	-- objSendrMap.setUpdateTick[dwOtherRole] = objSendrMap.setUpdateTick[dwOtherRole] or 0;
	
	-- --如果有，则只同步位置
	-- if not isMust then
		-- if objSendrMap.setUpdateTick[dwOtherRole] > objOther.tmUpdateTime then
			-- objMapSys:SendNowPosInfo(objSendr);
			-- objSendrMap:SendNowPosInfo(objOther);
			-- return;
		-- end
	-- end
	
	-- --基础部分
	-- local sRoleInfo = objOther:GetInfo();
	-- local sBattleInfo = objOther:GetBattleInfo();
	-- local dwPulseNum = objOther:GetSystem("CPulseSystem"):GetPulseNum() --经脉光效
	-- local bIsVip = objOther:GetSystem("CVipSystem"):isVip() --VIP状态
	-- local buffSys = objOther:GetSystem("CBuffSystem");
	-- local stateSys = objOther:GetSystem("CStateSystem");
	-- local itemSys = objOther:GetSystem("CItemSystem");
	-- local pkSys = objOther:GetSystem("CPKSystem");
	 -- --位移信息
	-- local sPosInfo ={};
	-- sPosInfo.fXPos =  math.floor(tbPos.x*100);		--玩家的x位置
	-- sPosInfo.fYPos =  math.floor(tbPos.y*100);		--玩家的Y位置
	-- sPosInfo.fDirValue  = objMapSys.fDirValue;   --玩家的方向
	-- --lw:消息结构体序列化
	-- local tbBtlSend = {};
	-- for n,v in pairs(sBattleInfo)do
		-- local key = GetAttrNameToIndex(n);
		-- if key then
			-- tbBtlSend[key] = v;
		-- end
	-- end
	
	-- local tbRoleSend = {};
	-- for n,v in pairs(sRoleInfo)do
		-- local key = GetAttrNameToIndex(n);
		-- if key then
			-- tbRoleSend[key] = v;
		-- end
	-- end
	
	-- local tbPosSend = {};
	-- for n,v in pairs(sPosInfo)do
		-- local key = arrPosIndex[n];
		-- if key then
			-- tbPosSend[key] = v;
		-- end
	-- end
	
	-- --add end
	-- objSendr.OnAddRoleMsg
	-- {
		-- Info = tbRoleSend,
		-- BattleInfo = tbBtlSend,
		-- PosInfo = tbPosSend,
		-- PulseInfo = dwPulseNum,
		-- VipInfo = bIsVip,
		-- PKValue = pkSys.dwPKValue,
	-- };
	
	-- --打坐等状态的同步
	-- local par = 0;
	-- if stateSys.dwCurState == enPlayerState.ePS_Dead then
		-- par = 1;
	-- end
	-- objSendr.PlayerStateMsg
	-- {
		-- RoleID = objOther:GetRoleID(),
		-- ActionID = stateSys.dwCurState,
		-- Param = par,
	-- }
	-- --local buffInfo = buffSys:CopyBuffInfo();
	-- --objSendr.BroadBuffActionMsg{RoleType = enEntType.eEntType_Player,RoleId = objOther:GetRoleID(),BuffTbl = buffInfo};
	-- --同步buff的效果和动作

	-- local sysPlayerShowText = objOther:GetSystem("PlayerShowTextSystem")
	-- if sysPlayerShowText then
		-- sysPlayerShowText:SendMyInfo(objSendr)
	-- end
	
	-- --外观光效
	-- local isNeedSendViewPfx = false;
	-- for n,v in pairs(objOther.setPfxList)do
		-- isNeedSendViewPfx = true;
		-- break;
	-- end
	-- if isNeedSendViewPfx then
		-- objSendr.OnInitViewPfxMsg
		-- {
			-- RoleID = objOther:GetRoleID();
			-- PfxList = objOther.setPfxList;
		-- }
	-- end
	
	-- if objMapSys.bMoving then
		-- local tbPos = objMapSys:GetPlayerPos();
		-- objSendr.OnPlayerMoveToMsg
		-- {
			-- RoleID = objOther:GetRoleID(),
			-- XSrc = math.floor(tbPos.x*100),
			-- YSrc = math.floor(tbPos.y*100),
			-- XDis = math.floor(objMapSys.fXPosDes*100),
			-- YDis = math.floor(objMapSys.fYPosDes*100),
			-- Speed = math.floor(objMapSys.fSpeed*100),
			-- UseCanTo = objMapSys.bUseCanToChecker,
		-- };
	-- end
	
	-- objSendrMap.setUpdateTick[dwOtherRole] = GetCurTime();
-- end;
