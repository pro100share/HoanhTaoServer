--[[
    [ \brief ��������ϵͳ�ӿ�
    [ \author ���в�
    [ \date 2014-7-2
    [ ��������ϵͳ�ӿ� 
    ]]

-- �����������ñ�    
local tSystemConfig = _G.GoldenBodyConfig;
	
--[[
    [ \brief ��������
    [ ִ�������߼�
    ]]
function CGoldenBodySystem:Practice()
	local nLevel = tSystemConfig:GetLevel(self.nExp);
	-- �����ͻ��
	if (nLevel % tSystemConfig.nNeiDanCount == 0) then
		if not self:UpGrade() then return; end
		-- ������������һ��
		self:SetExp(tSystemConfig.DanList[nLevel + 1].nMaxEXP);
		
	else
		if not self:PracticeCheck() then return; end
		-- ����������
		self:AddExp(nLevel);
		
		-- �㲥���
		local nNextLevel = tSystemConfig:GetLevel(self.nExp);
		if nNextLevel > nLevel and tSystemConfig:Boardcast(nNextLevel) then
			CGameApp.GoldenBodyBoardcastMsg{
                RoleID = self:GetPlayer():GetRoleID(),
				RoleName = self:GetPlayer():GetName(),
                Grade = tSystemConfig:GetGradeAndLevel(self.nExp)
            };
		end
	end
	
	-- ��������
	self:ChangeAttr();
end

--[[ 
    [ \brief ���Ӿ��麯��
    [ �������Ӿ���
    [ \param number nLevel ��������ĵȼ� ��Ҫ���ݵȼ����㾭��
    ]]
function CGoldenBodySystem:AddExp(nLevel)
	local tExpConfig = tSystemConfig.DanList[nLevel];
	-- �ж��Ƿ񱩻�
	local nExp = tExpConfig.nPlus;
	local bIsCrit = false;
	if math.random() < tExpConfig.nBonusChance then
		nExp = tExpConfig.nBonus 
		bIsCrit = true;
	end
	
    if nExp + self.nExp > tSystemConfig.DanList[
        #tSystemConfig.DanList].nMaxEXP then
        nExp = tSystemConfig.DanList[#tSystemConfig.DanList].nMaxEXP -
            self.nExp;
    end
    
	self:SetExp(nExp + self.nExp, bIsCrit);
end

--[[
    [ \brief ���þ���ֵ 
    [ \param number nValue ����ֵ 
    [ \param number bIsCrit �����Ƿ񱩻�
    ]]
function CGoldenBodySystem:SetExp(nValue, bIsCrit)
	self.nExp = nValue;
	-- ����Ϣ
	self:GetPlayer().GoldenBodyExpUpdateMsg{Exp = self.nExp, bIsCrit = bIsCrit};
	-- ���ݿ�
	self:UpdateDB();
end	
	
--[[
    [ \brief �õ�����ֵ
    [ \return number ��������ֵ
    ]]
function CGoldenBodySystem:GetPractice()
	return self.nPractice;
end	
	
--[[
    [ \brief ��������ֵ
    [ \param number nValue ����ֵ
    ]]
function CGoldenBodySystem:SetPractice(nValue)
	if nValue > tSystemConfig.nMaxPracticePro then
		nValue = tSystemConfig.nMaxPracticePro;
	end
	
	self.nPractice = nValue;
	
	-- ����Ϣ
	self:GetPlayer().GoldenBodyPracticeUpdateMsg{Practice = self.nPractice};
	-- ���ݿ�
	self:UpdateDB();
end

--[[
    [ \brief ͬ����ٴ͸�ֵ
    [ \param number nValue ��ٴ͸�ֵ
    ]]
function CGoldenBodySystem:SynTianGuanCiFu(nValue)	
	if not CConfig.bIsCrossSvr then
		self:GetPlayer().GoldenBodyCiFuUpdateMsg{
            Value = nValue,
			RestTime = (nValue and nValue == 0) and 0 or self:GetRestTime()
        };
	end
end

--[[
    [ \brief �õ���ٴ͸����ʱ��
    [ \return number ���ʱ��
    ]]
function CGoldenBodySystem:GetRestTime()
	local nEndTime = CTimeFormat:GetTodayThisTimeMsec(6, 0); 
	local nResstTime = 0;
	if GetCurTime() < nEndTime then
		nResstTime = nEndTime - GetCurTime();
	end
	if GetCurTime() > nEndTime then
		nResstTime = 24 * 60 * 60 * 1000 - (GetCurTime() - nEndTime);
	end
	return nResstTime;
end

--[[
    [ \brief �鿴��Ϣ�Ĵ�����
    [ \param number nRoleID ���鿴�����ID
    ]]
function CGoldenBodySystem:ViewOtherProcess(nRoleID)
	_G.GSRemoteCall(
        nRoleID,
        "CGoldenBodySystem",
        "BeViewProcess",
		{self:GetPlayer():GetRoleID()},
        function(_, result, _)
    		if result == -1 then
    			self:ViewResult(false);
    		end
        end
    );
end

--[[ 
    [ \brief ���鿴�Ĵ���
    [ \param number nFromRoleID �鿴�˵�
    ]]
function CGoldenBodySystem:BeViewProcess(nFromRoleID)
	if self:HasAuthority('GoldenBody') then
		_G.GSRemoteCall(nFromRoleID, "CGoldenBodySystem", "ViewResult",
			{true, self.nPractice, self.nExp}, nil);
	else
		_G.GSRemoteCall(nFromRoleID, "CGoldenBodySystem", "ViewResult",
			{false, {}}, nil);
	end
	
end

--[[
    [ \brief ���Ͳ鿴���
    [ \param boolean bIsOk �Ƿ�鿴�ɹ�
    [ \param number nPractice ����ֵ
    [ \param number nExp ����ֵ
    ]]
function CGoldenBodySystem:ViewResult(bIsOk, nPractice, nExp)
	self:GetPlayer().GoldenBosyViewOtherResultMsg{
        IsOK = bIsOk,
        Practice = nPractice,
        Exp = nExp
    };
end
