--[[
���ܣ����鸱��������
���ߣ���Ө
ʱ�䣺2013-09-29
]]
_G.CGutDuplManager = {}
CSingleManager:AddSingle(CGutDuplManager);

--������·
function CGutDuplManager:Create()
	self.setAllDupl = {};
	self.setAllPlayer = setmetatable({},{__mode="v"});
	self.dwLastUpdateTime = GetCurTime();
end;

--������·
function CGutDuplManager:Update()
	return true;
end;

--�ͷ���·
function CGutDuplManager:Destroy()
	for i,sDupl in pairs(self.setAllDupl) do
		sDupl:Destroy();
	end;
end;

--����һ�����鱾
function CGutDuplManager:AddGutDupl(objDupl)
	if self.setAllDupl[objDupl:GetFbEntityId()] then 
		_err("gut dupl entityId exist!!!");
		return false;
	end;
	self.setAllDupl[objDupl:GetFbEntityId()] = objDupl;
	return true;
end;
--��þ��鱾
function CGutDuplManager:GetGutDupl(dwEntityId)
	if not dwEntityId then
		return;
	end;
	return self.setAllDupl[dwEntityId];
end;
function CGutDuplManager:DelGutDupl(objDupl) 
	if objDupl then
		if self.setAllDupl[objDupl:GetFbEntityId()] then
			self.setAllDupl[objDupl:GetFbEntityId()] = nil;
		end;
	end;
	objDupl = nil;
end;

--��ҽ���ĳ����
function CGutDuplManager:EnterGutDupl(objDupl, objPlayer) 
	if not objDupl then
		return false;
	end;
	objDupl:PlayerEnter(objPlayer);
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	return true;
end;

--����˳�ĳ����
function CGutDuplManager:ExitGutDupl(objPlayer, objDupl) 
	if objDupl then
		objDupl:PlayerExit(objPlayer:GetRoleID());
	end;
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
end;

--��ȡ��Ϸ���
function CGutDuplManager:GetPlayer(dwRoleID)
	if not dwRoleID or dwRoleID == 0 then
		return self.setAllPlayer;
	end;
	return self.setAllPlayer[dwRoleID];
end;

function CGutDuplManager:CreateGutDupl(duplEntityId, dwDuplID, roleId, level, line)
	local cfDupl = DuplConfig[dwDuplID]; --��ȡ�������� 
	if not cfDupl then
		-- print("===CreateGutDupl -1===")
		return;
	end;
	local objDupl = CDupl:new(roleId,dwDuplID,cfDupl.dwPlayerCount, duplEntityId, DuplConfig[dwDuplID].fbDifficity[0] , level, 0); 
	if objDupl then
		objDupl:SetLifeTime();
		local Time = {};
		local CycleType
			= _G.CAlarmTaskCycleType.eMinute ;
		local CycleTime = DuplConfig[objDupl.dwCfgID].dwCloseFbTime;
		local CycleTime1 = DuplConfig[objDupl.dwCfgID].dwCloseFbTime - DuplConfig[objDupl.dwCfgID].dwCountDownTime / 60;
		local RunTimes = 1;

		local Param = {objDupl};
		--����������ѵĸø�����Ϣ	
		--local duplLifeIndex = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, objDupl.DeleteGutDupl, Param);
		--local duplLifeIndex1 = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime1, RunTimes, objDupl.CountDownGutDupl, Param);
		--objDupl:SetDuplCreateAlock(duplLifeIndex);
		--objDupl:SetDuplTsAlock(duplLifeIndex1);
	else
		_info("---------new dupl failed-----", dwDuplID);
		return false;
	end;
	local mapSet, dwMapId = cfDupl.MapSet();
	if not objDupl:Create(mapSet) then 
		-- print("===CreateGutDupl -2===")
		return false;
	end;
	if not self:AddGutDupl(objDupl) then 
		-- print("===CreateGutDupl -3===")
		return false;
	end;
	objDupl.dwTempMapId = dwMapId;
	return true;
end;