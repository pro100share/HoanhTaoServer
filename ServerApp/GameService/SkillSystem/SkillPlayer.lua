--用于存放被技能命中之后的表现，整合为一个消息发送给客户端

--跳字信息，可能会有多个，每个跳字一个结构
_G.CSkipInfoNotice = {};
function CSkipInfoNotice:new()
	local obj = {};
	obj.dwType = 0;--跳字类型
	obj.dwValue = 0;--跳字数值
	obj.dwAttType = 0;--攻击方类型
	obj.dwAttID = 0;--攻击方ID
	obj.isCrit = 0;--是否是暴击
	
	return obj;
end;

--血条信息，可能会有多个，但是要整合到一个结构体中
_G.CBattleInfoNotice = {};
function CBattleInfoNotice:new()
	local obj = {};
	obj.dwHP = 0;
	obj.dwMP = 0;
	obj.dwHPMax = 0;
	obj.dwMPMax = 0;
	
	return obj;
end;
--因为这个消息发送的不是增量，所以直接赋值
function CBattleInfoNotice:AddNotice(tbOld,tbNew)
	if tbNew.dwHP then
		tbOld.dwHP = tbNew.dwHP;
	end
	
	if tbNew.dwMP then
		tbOld.dwMP = tbNew.dwMP;
	end
	
	if tbNew.dwHPMax then
		tbOld.dwHPMax = tbNew.dwHPMax;
	end
	
	if tbNew.dwMPMax then
		tbOld.dwMPMax = tbNew.dwMPMax;
	end
end;

--被击表现的信息，只会有一个被击动作或者光效，这个不给怪物用
_G.CHurtInfoNotice = {};
function CHurtInfoNotice:new()
	local obj = {};
	obj.dwActionID = 0;
	obj.dwIndex = 0;
	obj.dwShadowID = 0;
	obj.dwPfxID = 0;
	obj.szBindPoint = "";
	
	return obj;
end;

_G.CSkillPlayer = {};

function CSkillPlayer:new(objOwner)
	local obj = {};
	obj.objOwner = objOwner;
	obj.tbData = {};
	
	---
	for k,v in pairs(CSkillPlayer)do
		if type(v) == "function" then
			obj[k] = v;
		end
	end
	
	return obj;
end;

function CSkillPlayer:Begin(dwSkillID,dwActCount)
	if not self.tbData[dwSkillID] then
		self.tbData[dwSkillID] = {};
	end
	
	self.tbData[dwSkillID][dwActCount] = {};
end;

function CSkillPlayer:End(dwSkillID,dwActCount,dwExecTime,isLastAct)
	--send msg
	local dwOwnerType = self.objOwner:GetObjType();
	if dwOwnerType == enEntType.eEntType_Player then
		self:SendMsgWithPlayer(dwSkillID,dwActCount,dwExecTime);
	elseif dwOwnerType == enEntType.eEntType_Monster then
		self:SendMsgWithMonster(dwSkillID,dwActCount,dwExecTime);
	elseif dwOwnerType == enEntType.eEntType_Pet then
		self:SendMsgWithPet(dwSkillID,dwActCount,dwExecTime);
	end
	
	--delete
	self.tbData[dwSkillID][dwActCount] = nil;
	if isLastAct then
		self.tbData[dwSkillID] = nil;
	end
end;

--dwType：1--跳字；2--伤血；3--动作特效
function CSkillPlayer:Add(dwSkillID,dwActCount,dwType,tbInfo)
	local tbNow = self.tbData[dwSkillID][dwActCount];
	
	if not tbNow[dwType] then
		tbNow[dwType] = {};
	end
	
	if dwType == 1 then
		table.insert(tbNow[dwType],tbInfo);
	elseif dwType == 2 then
		CBattleInfoNotice:AddNotice(tbNow[dwType],tbInfo);
	elseif dwType == 3 then
		table.insert(tbNow[dwType],tbInfo);
	end
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

function CSkillPlayer:SendMsgWithPlayer(dwSkillID,dwActCount,dwExecTime)
	local objSklSys = self.objOwner:GetSystem("CSkillSystem");
	
	if objSklSys then
		local tbNow = self.tbData[dwSkillID][dwActCount];
		
		if not tbNow[1] then
			tbNow[1] = {};
		end
		
		if not tbNow[2] then
			tbNow[2] = {};
		end
		
		if not tbNow[3] then
			tbNow[3] = {};
		end
		
		-- objSklSys:BroadcastSkillMsg(true,"SendSkillEffect",self.objOwner:GetRoleID(),
			-- dwSkillID,dwExecTime,dwActCount,tbNow[1],tbNow[2],tbNow[3]);
			
		local tbSkipSend = {};
		for n,info in pairs(tbNow[1])do
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
		for key,value in pairs(tbNow[2])do
			local dwIndex = GetAttrNameToIndex(key);
			if dwIndex then
				tbSendBtlInfo[dwIndex] = value;
			end
		end
		
		local tbActSend = {};
		for k,tb in pairs(tbNow[3])do
			local tbTemp = {}
			for n,v in pairs(tb)do
				local dwidx = arrActIndex[n]
				if dwidx then
					tbTemp[dwidx] = v;
				end
			end
			tbActSend[k] = tbTemp;
		end
	
		objSklSys:BroadcastSkillMsg(true,"OnBeSkillUsedMsg",
		{
			RoleType = enEntType.eEntType_Player;
			RoleID = self.objOwner:GetRoleID();
			SkillID = dwSkillID;
			ExecTime = dwExecTime;
			ActCount = dwActCount;
			SkipInfo = tbSkipSend;
			BattleInfo = tbSendBtlInfo;
			ActionInfo = tbActSend;
		})
	end
end;

function CSkillPlayer:SendMsgWithPet(dwSkillID,dwActCount,dwExecTime)
	local objPetSys = self.objOwner:GetOwnerRole():GetSystem("CPetSystem");
	
	local objSklSys = nil;
	
	if objPetSys then
		objSklSys = objPetSys:GetPetSikllSystem();
	end
	
	
	if objSklSys then
		local tbNow = self.tbData[dwSkillID][dwActCount];
		
		if not tbNow[1] then
			tbNow[1] = {};
		end
		
		if not tbNow[2] then
			tbNow[2] = {};
		end
		
		if not tbNow[3] then
			tbNow[3] = {};
		end
		
		-- objSklSys:BroadcastSkillMsg(true,"SendSkillEffect",self.objOwner:GetRoleID(),
			-- dwSkillID,dwExecTime,dwActCount,tbNow[1],tbNow[2],tbNow[3]);
			
		local tbSkipSend = {};
		for n,info in pairs(tbNow[1])do
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
		for key,value in pairs(tbNow[2])do
			local dwIndex = GetAttrNameToIndex(key);
			if dwIndex then
				tbSendBtlInfo[dwIndex] = value;
			end
		end
		
		local tbActSend = {};
		for k,tb in pairs(tbNow[3])do
			local tbTemp = {}
			for n,v in pairs(tb)do
				local dwidx = arrActIndex[n]
				if dwidx then
					tbTemp[dwidx] = v;
				end
			end
			tbActSend[k] = tbTemp;
		end
	
		objSklSys:BroadcastSkillMsg(true,"OnPetBeSkillUsedMsg",
		{
			RoleType = enEntType.eEntType_Pet;
			RoleID = self.objOwner:GetRoleID();
			SkillID = dwSkillID;
			ExecTime = dwExecTime;
			ActCount = dwActCount;
			SkipInfo = tbSkipSend;
			BattleInfo = tbSendBtlInfo;
			ActionInfo = tbActSend;
		})
	end
end;

function CSkillPlayer:SendMsgWithMonster(dwSkillID,dwActCount,dwExecTime)
	local tbNow = self.tbData[dwSkillID][dwActCount];
		
	if not tbNow[1] then
		tbNow[1] = {};
	end
	
	if not tbNow[2] then
		tbNow[2] = {};
	end
	
	if not tbNow[3] then
		tbNow[3] = {};
	end
	
	local objSklSys = self.objOwner:GetSystem("CMonsterSkillSystem");
	if objSklSys then
		objSklSys:BroadcastSkillEffect(dwSkillID,dwExecTime,dwActCount,tbNow[1],tbNow[2],tbNow[3]);
	end
end;

---------------------------------------------------------------------------------------------------
_G.CSkillPlayerManager = {};



function CSkillPlayerManager:Ready(objOwner,dwSkillID,dwActCount)
	local dwRoleType = objOwner:GetObjType();
	
	if dwRoleType == enEntType.eEntType_Player then
		local objBtl = objOwner:GetSystem("CBattleSystem");
		if objBtl and objBtl.objSklPlayer then
			objBtl.objSklPlayer:Begin(dwSkillID,dwActCount);
		end
	elseif dwRoleType == enEntType.eEntType_Monster then
		objOwner:ReadySkillEffect(dwSkillID,dwActCount)
	elseif dwRoleType == enEntType.eEntType_Pet then
		objOwner.objSklPlayer:Begin(dwSkillID,dwActCount);
	end
	
end;

function CSkillPlayerManager:End(objOwner,dwSkillID,dwActCount,dwNowTime,isLastAct)
	local dwRoleType = objOwner:GetObjType();
	
	if dwRoleType == enEntType.eEntType_Player then
		local objBtl = objOwner:GetSystem("CBattleSystem");
		if objBtl and objBtl.objSklPlayer then
			objBtl.objSklPlayer:End(dwSkillID,dwActCount,dwNowTime,isLastAct);
		end
	elseif dwRoleType == enEntType.eEntType_Monster then
		objOwner:EndSkillEffect(dwSkillID,dwActCount,dwNowTime,isLastAct)
	elseif dwRoleType == enEntType.eEntType_Pet then
		objOwner.objSklPlayer:End(dwSkillID,dwActCount,dwNowTime,isLastAct);
	end
end;

function CSkillPlayerManager:Add(objOwner,dwSkillID,dwActCount,dwType,tbInfo)
	local dwRoleType = objOwner:GetObjType();
	
	if dwActCount < 0 then
		dwActCount = 0 - dwActCount;
		
		if dwType == 1 then
			tbInfo.dwType = enBattleNoticeType.eBNT_SWORD;
		end
	end
	
	if dwRoleType == enEntType.eEntType_Player then
		local objBtl = objOwner:GetSystem("CBattleSystem");
		if objBtl and objBtl.objSklPlayer then
			objBtl.objSklPlayer:Add(dwSkillID,dwActCount,dwType,tbInfo);
		end
	elseif dwRoleType == enEntType.eEntType_Monster then
		objOwner.objSklPlayer:Add(dwSkillID,dwActCount,dwType,tbInfo);
	elseif dwRoleType == enEntType.eEntType_Pet then
		objOwner.objSklPlayer:Add(dwSkillID,dwActCount,dwType,tbInfo);
	end

end;



