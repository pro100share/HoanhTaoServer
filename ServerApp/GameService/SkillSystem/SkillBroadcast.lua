--技能的广播接口



--技能消息广播给周围的人
--isNeedSelf:是否通知自己
-- function CSkillSystem:BroadcastSkillMsgEX(isNeedSelf,szFuncname,...)
	-- local args={...};
	
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- return false;
	-- end;
	
	-- if not objPlayer:IsLoadEnd() then
		-- return false;
	-- end
	
	-- local dwSelfID = objPlayer:GetRoleID();

	-- --发给视野中的人
	-- local objMapSystem = objPlayer:GetSystem("CMapSystem");
	-- local objMap = objMapSystem:GetCurMap();
	-- if not objMap then
		-- return;
	-- end;
	-- local setViewPlayer = objMap:GetCanLookPlayer(objPlayer);
	
	-- if not setViewPlayer then
		-- return;
	-- end
	
	-- for n,v in pairs(setViewPlayer) do		
		-- if isNeedSelf then
			-- local objSkillSys = v:GetSystem("CSkillSystem");
			-- if objSkillSys then
				-- local objFunc = objSkillSys[szFuncname];
				-- if objFunc then
					-- objFunc(objSkillSys,unpack(args));
				-- end
			-- end
		-- else
			-- if v:GetRoleID() ~= dwSelfID then
				-- local objSkillSys = v:GetSystem("CSkillSystem");
				-- if objSkillSys then
					-- local objFunc = objSkillSys[szFuncname];
					-- if objFunc then
						-- objFunc(objSkillSys,unpack(args));
					-- end
				-- end
			-- end
		-- end
	-- end
-- end;

function CSkillSystem:BroadcastSkillMsg(isNeedSelf,szMsgName, tbParam)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return false;
	end;
	
	if not objSelf:IsLoadEnd() then
		return false;
	end
	
	-- local objMapSystem = objSelf:GetSystem("CMapSystem");
	-- local objMap = objMapSystem:GetCurMap();
	-- if not objMap then
		-- return;
	-- end;
	-- local setViewPlayer = objMap:GetCanLookPlayer(objSelf);
	
	-- if not setViewPlayer then
		-- return;
	-- end
	
	-- local dwSelfID = objSelf:GetRoleID();
	
	-- local tbNet = {}
	-- for n,objPlayer in pairs(setViewPlayer) do
		-- if isNeedSelf then
			-- table.insert(tbNet,objPlayer.objNet);
		-- else
			-- if objPlayer:GetRoleID() ~= dwSelfID then
				-- table.insert(tbNet,objPlayer.objNet);
			-- end
		-- end
	-- end
	
	-- _groupcallout(tbNet, szMsgName, tbParam);
	
	local objMapSys = objSelf:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout(szMsgName, tbParam, objMapSys:GetLogicID(), isNeedSelf)
	end
end;


--广播自己的弹出式战斗提示，就是身上飘掉血数字
function CSkillSystem:BroadcastBattleNotice(dwNoticeType,dwValue,dwAttType,dwAttID,isCrit)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return false;
	end;
	
	if not objSelf:IsLoadEnd() then
		return false;
	end
	
	if dwAttID == 0 then
		dwAttType = enEntType.eEntType_Player;
		dwAttID = objSelf:GetRoleID();
	end
	
	local objMapSys = objSelf:GetSystem("CMapSystem");
	if objMapSys then
		_mapcallout("OnBattleNoticeMsg", 
			{
				RoleType=enEntType.eEntType_Player,
				RoleID=objSelf:GetRoleID(),
				NoticeType=dwNoticeType,
				Value=dwValue,
				UserType=dwAttType,
				UserID=dwAttID,
				Crit=isCrit or false,
				SkillID = 0,
				ExecTime = 0,
				ActCount = 0,
			}, 
			objMapSys:GetLogicID(), true)
	end
end;

--发送学习技能的结果
function CSkillSystem:SendStudySkillResult(dwSkillID,nResCode,dwLevelUpFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	objPlayer.OnStudySkillResultMsg
	{
		ResultCode = nResCode,
		SkillID = dwSkillID,
		LevelUpFlag = dwLevelUpFlag,
	};
end;

local arrSkillInfoIndex = 
{
	dwRoleID = 1;
	dwSkillID = 2;
	dwSkillKnowValue = 3;
	dwSkillLevel = 4;
}
function CSkillSystem:SendSkillInfoToClient(objSkill)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	local sInfo = {}; 
	sInfo.dwRoleID = objSkill:GetInfo().dwRoleID;
	sInfo.dwSkillID = objSkill:GetInfo().dwSkillID; 
	sInfo.dwSkillKnowValue = objSkill:GetInfo().dwSkillKnowValue; 
	sInfo.dwSkillLevel = objSkill:GetInfo().dwSkillLevel; 
	--sInfo.dwSkillExLevel = 0; 
	
	local tbSend = {};
	for n,v in pairs(sInfo)do
		local key = arrSkillInfoIndex[n];
		if key then
			tbSend[key] = v;
		end
	end
	objPlayer.OnAddSkillInfoMsg{SkillInfo = tbSend};
end;

--发送技能释放结果，只发给自己
function CSkillSystem:SendSkillExecCode(dwSkillID,dwCode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	objPlayer.OnExecSkillResultMsg{SkillID = dwSkillID,ResultCode = dwCode};
end;

--发送技能在对象身上的效果
function CSkillSystem:SendSkillRoleMsg(dwActionID,dwRoleType,dwRoleID,dwIndex,dwShadowID,dwSkillID,dwExecTime,dwActCount)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) or (not objPlayer:IsLoadEnd()) then
		return false;
	end;
	--print("play action "..dwActionID)
	objPlayer.OnPlaySkillRoleActionMsg
	{
		ActionID = dwActionID,
		RoleType = dwRoleType,
		RoleID = dwRoleID,
		Index = dwIndex,
		ShadowID = dwShadowID,
		SkillID = dwSkillID,
		ExecTime = dwExecTime,
		ActCount = dwActCount,
	}
end;

--发送攻击地面点的效果
function CSkillSystem:SendSkillTargetMsg(dwActionID,dwStartType,dwStartID,posList,dwDelay,dwIndex,dwShadowID,dwSkillID,dwExecTime,dwActCount)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) or (not objPlayer:IsLoadEnd()) then
		return false;
	end;
	
	objPlayer.OnPlaySkillTargetActionMsg
	{
		ActionID = dwActionID,
		StartType = dwStartType,
		StartID = dwStartID,
		PosList = posList,
		Delay = dwDelay,
		Index = dwIndex,
		ShadowID = dwShadowID,
		SkillID = dwSkillID,
		ExecTime = dwExecTime,
		ActCount = dwActCount,
	}
end;

--发送追踪的效果
function CSkillSystem:SendSkillPursueMsg(dwActionID,dwStartType,dwStartID,tbTarList,dwDelay,dwIndex,dwShadowID,dwSkillID,dwExecTime,dwActCount)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) or (not objPlayer:IsLoadEnd()) then
		return false;
	end;
	
	objPlayer.OnPlaySkillPursueActionMsg
	{
		ActionID = dwActionID,
		StartType = dwStartType,
		StartID = dwStartID,
		TargetList = tbTarList,
		Delay = dwDelay,
		Index = dwIndex,
		ShadowID = dwShadowID,
		SkillID = dwSkillID,
		ExecTime = dwExecTime,
		ActCount = dwActCount,
	}
end;

function CSkillSystem:SendSkillMoveMsg(dwActionID,dwStartType,dwStartID,posList,dwDelay,dwIndex,dwShadowID,dwSkillID,dwExecTime,dwActCount)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) or (not objPlayer:IsLoadEnd()) then
		return false;
	end;
	
	objPlayer.OnPlaySkillMoveEffectMsg
	{
		ActionID = dwActionID,
		StartType = dwStartType,
		StartID = dwStartID,
		PosList = posList,
		Delay = dwDelay,
		Index = dwIndex,
		ShadowID = dwShadowID,
		SkillID = dwSkillID,
		ExecTime = dwExecTime,
		ActCount = dwActCount,
	}
end;

--停止技能动作
function CSkillSystem:SendStopActionMsg(dwActionID,dwRoleType,dwRoleID)
	local objPlayer = self:GetPlayer();
	if (not objPlayer) or (not objPlayer:IsLoadEnd()) then
		return false;
	end;
	
	
end;

--角色状态的同步
function CSkillSystem:SendPlayerState(dwRoleID,dwActionID,Param)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	objPlayer.PlayerStateMsg
	{
		RoleID = dwRoleID,
		ActionID = dwActionID,
		Param = Param,
	}
end;

--播放特效
function CSkillSystem:SendPlayPfx(dwActionID,szBindPos,dwRoleID,dwSkillID,dwExecTime,dwActCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	objPlayer.OnPlayPfxMsg
	{
		ActionID = dwActionID,
		BindPos = szBindPos,
		RoleID = dwRoleID,
		SkillID = dwSkillID,
		ExecTime = dwExecTime,
		ActCount = dwActCount,
	}
end;

--停止特效
function CSkillSystem:SendStopPfx(dwActionID,dwRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	objPlayer.OnStopPfxMsg
	{
		ActionID = dwActionID,
		RoleID = dwRoleID,
	}
end;

--发送属性改变
function CSkillSystem:SendAttrChangeMsg(szTypeName,tbChangeAttr)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	local tbSendInfo = {};
	for key,value in pairs(tbChangeAttr)do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSendInfo[dwIndex] = value;
		end
	end
	
	objPlayer.OnRoleAttrChangeMsg
	{
		StrType = szTypeName,
		ChangeTable = tbSendInfo,
	};
end;

--初始化属性
function CSkillSystem:SendPlayerInfoLoad(szTypeName,tbAttrInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	local tbSendInfo = {};
	for key,value in pairs(tbAttrInfo)do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSendInfo[dwIndex] = value;
		end
	end
	
	objPlayer.OnLoadAttrInfoMsg
	{
		StrType = szTypeName,
		InfoTable = tbSendInfo,
		IsInit = false,
	};
end;

--角色战斗属性改变
function CSkillSystem:SendPlayerBattleInfo(dwRoleID,tbChange,dwSkillID,dwExecTime,dwActCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	local tbSendInfo = {};
	for key,value in pairs(tbChange)do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSendInfo[dwIndex] = value;
		end
	end
	
	objPlayer.OnRoleBattleInfoMsg
	{
		RoleID = dwRoleID,
		ChangeTable = tbSendInfo,
		SkillID = dwSkillID,
		ExecTime = dwExecTime,
		ActCount = dwActCount,
	};
end;

function CSkillSystem:SendLevelUp(dwRoleID,dwNewLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	objPlayer.OnRoleLevelUpMsg
	{
		RoleID = dwRoleID,
		NewLevel = dwNewLevel,
	};
end;

local arrSkipIndex = 
{
	dwAttType = 1;
	dwAttID = 2;
	dwType = 3;
	dwValue = 4;
	isCrit = 5;
};
local arrActIndex = 
{
	dwPfxID = 1;
	szBindPoint = 2;
	szActionName = 3;
	dwActionID = 4;
	dwRoleId = 5;
	dwShadowID = 6;
}
--技能的执行效果
function CSkillSystem:SendSkillEffect(dwRoleID,dwSkillID,dwExecTime,dwActCount,tbSkipInfo,tbBtlInfo,tbActInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if not objPlayer:IsLoadEnd() then
		return false;
	end
	
	
	local tbSkipSend = {};
	for n,info in pairs(tbSkipInfo)do
		local tbcv = {};
		for key,val in pairs(info)do
			local dinx = arrSkipIndex[key];
			if dinx then
				tbcv[dinx] = val;
			end
		end
		tbSkipSend[n] = tbcv;
	end
	
	local tbSendBtlInfo = {};
	for key,value in pairs(tbBtlInfo)do
		local dwIndex = GetAttrNameToIndex(key);
		if dwIndex then
			tbSendBtlInfo[dwIndex] = value;
		end
	end
	
	local tbActSend = {};
	for k,tb in pairs(tbActInfo)do
		local tbTemp = {}
		for n,v in pairs(tb)do
			local dwidx = arrActIndex[n]
			if dwidx then
				tbTemp[dwidx] = v;
			end
		end
		tbActSend[k] = tbTemp;
	end
	
	objPlayer.OnBeSkillUsedMsg
	{
		RoleType = enEntType.eEntType_Player;
		RoleID = dwRoleID;
		SkillID = dwSkillID;
		ExecTime = dwExecTime;
		ActCount = dwActCount;
		SkipInfo = tbSkipSend;
		BattleInfo = tbSendBtlInfo;
		ActionInfo = tbActSend;
	};
end;

--发送技能学习结果的公告
function CSkillSystem:SendSkillLearnWord(dwWordID,tbParam)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	objPlayer.OnWarNoticeMsg
	{
		NoticeType = 1;
		StringID = dwWordID;
		Param = tbParam;
	}
end;

--发送技能开始
function CSkillSystem:SendRoleSkillBegin(dwRoleID,dwSkillID,tbParamList)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	objPlayer.OnRoleSkillBeginMsg
	{
		RoleID = dwRoleID;
		SkillID = dwSkillID;
		ParamList = tbParamList;
	}
end;
