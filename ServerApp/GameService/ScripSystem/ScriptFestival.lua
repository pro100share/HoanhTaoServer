--[[
	���սű�
	�ܳ�ɳ
	2013-5-23
--]]
---------------------------------------------------------------------------
--------����
--�ȼ�
function CScriptSystem:CheckMountLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysMount = objPlayer:GetSystem("CMountSystem")
	local dwMaxLevel = 0
	
	for _,Mount in pairs(sysMount.t_Mount) do
		local n_Level = Mount.n_Level
		if n_Level > dwMaxLevel then--�ȼ�
			dwMaxLevel = n_Level
		end
	end
	return dwLevel <= dwMaxLevel
end
--�Ƚ�
function CScriptSystem:CheckMountGrade(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysMount = objPlayer:GetSystem("CMountSystem")
	local dwMaxGrade = 0
	
	for _,Mount in pairs(sysMount.t_Mount) do
		local n_Grade = Mount:GetGrade()--�Ƚ�
		if n_Grade > dwMaxGrade then
			dwMaxGrade = n_Grade
		end
	end
	return dwLevel <= dwMaxGrade
end

------����
--�Ƚ�
function CScriptSystem:CheckSwordLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysSword = objPlayer:GetSystem("CSwordSystem")
	return sysSword:GetSwordLadder() >= dwLevel
end
--�Ƚ�

------����
--�Ƚ�
function CScriptSystem:CheckAmuletLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysAmulet = objPlayer:GetSystem("CAmuletSystem")
	return sysAmulet:GetLevel() >= dwLevel
end
--�Ƚ�

------ʵս
--�ȼ�
function CScriptSystem:CheckBournLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysBourn = objPlayer:GetSystem("CBournSystem")
	return sysBourn:GetBournLv() >= dwLevel
end

-----����--�ȼ�
function CScriptSystem:CheckPracticeLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CPracticeSystem")
	return sysObj:GetPracticeLevel() >= dwLevel
end


---�׽--�ȼ�
function CScriptSystem:CheckKungFuLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CKungFuSystem")
	return sysObj:GetKungfuLevel(1) >= dwLevel
end


-----Ѫħ��--�ȼ�
function CScriptSystem:CheckMegaKillLevel(dwLevel)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CMegaKillSystem")
	return sysObj:GetLevelVal() >= dwLevel
end

function CScriptSystem:GetLoginDays(szStartDate,szEndDate)
	local objPlayer = self:GetPlayer()
	local sysObj = objPlayer:GetSystem("CLoginDaysSystem")
	-- print("^^^^^^^^^^^^^^^^^^^^^^",sysObj:GetLoginDays(szStartDate,szEndDate))
	return sysObj:GetLoginDays(szStartDate,szEndDate)
end



-------------------------------------------------------------------------
--��ֵ��¼
function CScriptSystem:GetDateCharge(y,m,d)
	local dwIndex = y*10000+m*100+d
	return self.ChargeList[dwIndex] or 0
end

--20140713
function CScriptSystem:GetNumCharge(dwIndex)
	local dwIndex = dwIndex
	return self.ChargeList[dwIndex] or 0
end

--���Ѽ�¼
function CScriptSystem:GetDateCost(y,m,d)
	local dwIndex = y*10000+m*100+d
	return self.CostList[dwIndex] or 0
end

--20140706
function CScriptSystem:GetNumCost(dwIndex)
	local dwIndex = dwIndex
	return self.CostList[dwIndex] or 0
end

--ĳ��ʱ���ڵĳ�ֵ��¼(20130712-20130712)
function CScriptSystem:GetRegionCharge(dwStart,dwEnd)
	local dwCharge = 0
	for dwIndex=dwStart,dwEnd do
		dwCharge = dwCharge + (self.ChargeList[dwIndex] or 0)
	end
	return dwCharge
end

--ĳ��ʱ���ڵ����Ѽ�¼(20130712-20130712)
function CScriptSystem:GetRegionCost(dwStart,dwEnd)
	local dwCost = 0
	for dwIndex=dwStart,dwEnd do
		dwCost = dwCost + (self.CostList[dwIndex] or 0)
	end
	return dwCost
end

--�������쵽�����ĳ�ֵ��¼
function CScriptSystem:GetRelCharge(dwStart,dwEnd)
	local dwServerStart = CTimeRewardManager:GetServerStartTime()
	local dwStartTime = dwServerStart + 1000*60*60*24*(dwStart - 1)
	local dwEndTime = dwServerStart + 1000*60*60*24*(dwEnd - 1)
	local sy,sm,sd = CTimeFormat:mtodate(dwStartTime, true,true)
	local ey,em,ed = CTimeFormat:mtodate(dwEndTime, true,true)
	local dwRealS = sy*10000+sm*100+sd
	local dwRealE = ey*10000+em*100+ed

	local dwCharge = 0
	for dwIndex=dwRealS,dwRealE do
		dwCharge = dwCharge + (self.ChargeList[dwIndex] or 0)
	end
	return dwCharge
end

--�������쵽���������Ѽ�¼
function CScriptSystem:GetRelCost(dwStart,dwEnd)
	local dwServerStart = CTimeRewardManager:GetServerStartTime()
	local dwStartTime = dwServerStart + 1000*60*60*24*(dwStart - 1)
	local dwEndTime = dwServerStart + 1000*60*60*24*(dwEnd - 1)
	local sy,sm,sd = CTimeFormat:mtodate(dwStartTime, true,true)
	local ey,em,ed = CTimeFormat:mtodate(dwEndTime, true,true)
	local dwRealS = sy*10000+sm*100+sd
	local dwRealE = ey*10000+em*100+ed
	
	local dwCost = 0
	for dwIndex=dwRealS,dwRealE do
		dwCost = dwCost + (self.CostList[dwIndex] or 0)
	end
	return dwCost
end

--��ȡ����һСʱ��ֵ��
function CScriptSystem:GetTodayOneHourChargeNum()
	return self.Charge.TodayNum;
end;

--��ȡָ��ʱ����ڳ�ֵ����ָ�����������
function CScriptSystem:GetDayNumGreaterThanMoney(money, timeA, timeB)
	local num = 0;
	for n=timeA, timeB do
		if self.ChargeList[n] and self.ChargeList[n] >= money then
			num = num + 1;
		end;
	end;
	return num;
end



