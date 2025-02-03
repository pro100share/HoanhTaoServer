--ͬ����ͼ����ҵ���Ϣ




--��ʾ��ҵ�ʱ�����������ҵ���Ϣ
local arrPosIndex =
{
	fXPos = 1;
	fYPos = 2;
	fDirValue = 3;
}

--ͬ�����ͻ��˵�ʱ��
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

--���µ�����
local enUpdateType = 
{
	tmInfo = 1;
	tmBtl = 2;
	tmPKValue = 3;
	tmPfx = 4;
	tmShowText = 5;
	tmModel = 6;
}

--�����Ҫ���µ���Ŀ
local function CheckUpdateTime(tbRecord,tbUpdate)
	local tbNeed = {};
	
	for k,v in pairs(tbRecord)do
		if tbUpdate[k] and v < tbUpdate[k] then
			tbNeed[k] = enUpdateType[k];
		end
	end
	
	return tbNeed;
end;

--������ɫ
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
--���½�ɫ��Ϣ
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
--����ս����Ϣ
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
--����PKֵ
local function UpdatePKValue(objSendr,objOther)
	local pkSys = objOther:GetSystem("CPKSystem");
	
	objSendr.OnPKValueChangeMsg
	{
		RoleID = objOther:GetRoleID(),
		PKValue = pkSys.dwPKValue,
	}
end;
--������Ч�б�
local function UpdatePfxList(objSendr,objOther)
	objSendr.OnInitViewPfxMsg
	{
		RoleID = objOther:GetRoleID();
		PfxList = objOther.setPfxList;
	}
end;
--����ģ���б�
local function UpdateModelList(objSendr,objOther)
	objSendr.OnInitViewModelMsg
	{
		RoleType = enEntType.eEntType_Player;
		RoleID = objOther:GetRoleID();
		ModelList = objOther.setModelList;
	}
end;
--������ʾ����
local function UpdateShowText(objSendr,objOther)
	if not CConfig.bIsCrossSvr then
		local sysPlayerShowText = objOther:GetSystem("PlayerShowTextSystem")
		if sysPlayerShowText then
			sysPlayerShowText:SendMyInfo(objSendr)
		end
	end;
end;
--����״̬
local function UpdateState(objSendr,objOther)
	local stateSys = objOther:GetSystem("CStateSystem");
	--�ͻ��˳�ʼ����Normal״̬������״���²���Ҫͬ��
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
	
	--�Ƿ��Ѿ������������ɫ
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
		--û�м���������£�ȫ��ͬ��
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
			--�в��ּ���������£�ѡ��ͬ��
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
	-- --�ж�
	-- local dwOtherRole = objOther:GetRoleID();
	-- local objMapSys =  objOther:GetSystem("CMapSystem");
	-- local tbPos = objMapSys:GetPlayerPos();
	
	-- local objSendrMap = objSendr:GetSystem("CMapSystem");
	-- local tbSendrPos = objSendrMap:GetPlayerPos();
	-- objSendrMap.setUpdateTick[dwOtherRole] = objSendrMap.setUpdateTick[dwOtherRole] or 0;
	
	-- --����У���ֻͬ��λ��
	-- if not isMust then
		-- if objSendrMap.setUpdateTick[dwOtherRole] > objOther.tmUpdateTime then
			-- objMapSys:SendNowPosInfo(objSendr);
			-- objSendrMap:SendNowPosInfo(objOther);
			-- return;
		-- end
	-- end
	
	-- --��������
	-- local sRoleInfo = objOther:GetInfo();
	-- local sBattleInfo = objOther:GetBattleInfo();
	-- local dwPulseNum = objOther:GetSystem("CPulseSystem"):GetPulseNum() --������Ч
	-- local bIsVip = objOther:GetSystem("CVipSystem"):isVip() --VIP״̬
	-- local buffSys = objOther:GetSystem("CBuffSystem");
	-- local stateSys = objOther:GetSystem("CStateSystem");
	-- local itemSys = objOther:GetSystem("CItemSystem");
	-- local pkSys = objOther:GetSystem("CPKSystem");
	 -- --λ����Ϣ
	-- local sPosInfo ={};
	-- sPosInfo.fXPos =  math.floor(tbPos.x*100);		--��ҵ�xλ��
	-- sPosInfo.fYPos =  math.floor(tbPos.y*100);		--��ҵ�Yλ��
	-- sPosInfo.fDirValue  = objMapSys.fDirValue;   --��ҵķ���
	-- --lw:��Ϣ�ṹ�����л�
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
	
	-- --������״̬��ͬ��
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
	-- --ͬ��buff��Ч���Ͷ���

	-- local sysPlayerShowText = objOther:GetSystem("PlayerShowTextSystem")
	-- if sysPlayerShowText then
		-- sysPlayerShowText:SendMyInfo(objSendr)
	-- end
	
	-- --��۹�Ч
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
