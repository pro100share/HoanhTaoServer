--[[
    [ \brief 修炼金身系统接口
    [ \author 李中昌
    [ \date 2014-7-2
    [ 修炼金身系统接口 
    ]]

-- 修炼金身配置表    
local tSystemConfig = _G.GoldenBodyConfig;
	
--[[
    [ \brief 修炼函数
    [ 执行修炼逻辑
    ]]
function CGoldenBodySystem:Practice()
	local nLevel = tSystemConfig:GetLevel(self.nExp);
	-- 如果是突破
	if (nLevel % tSystemConfig.nNeiDanCount == 0) then
		if not self:UpGrade() then return; end
		-- 给经验升到下一级
		self:SetExp(tSystemConfig.DanList[nLevel + 1].nMaxEXP);
		
	else
		if not self:PracticeCheck() then return; end
		-- 给修炼经验
		self:AddExp(nLevel);
		
		-- 广播检查
		local nNextLevel = tSystemConfig:GetLevel(self.nExp);
		if nNextLevel > nLevel and tSystemConfig:Boardcast(nNextLevel) then
			CGameApp.GoldenBodyBoardcastMsg{
                RoleID = self:GetPlayer():GetRoleID(),
				RoleName = self:GetPlayer():GetName(),
                Grade = tSystemConfig:GetGradeAndLevel(self.nExp)
            };
		end
	end
	
	-- 更新属性
	self:ChangeAttr();
end

--[[ 
    [ \brief 增加经验函数
    [ 修炼增加经验
    [ \param number nLevel 修练金身的等级 需要根据等级计算经验
    ]]
function CGoldenBodySystem:AddExp(nLevel)
	local tExpConfig = tSystemConfig.DanList[nLevel];
	-- 判断是否暴击
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
    [ \brief 设置经验值 
    [ \param number nValue 经验值 
    [ \param number bIsCrit 经验是否暴击
    ]]
function CGoldenBodySystem:SetExp(nValue, bIsCrit)
	self.nExp = nValue;
	-- 发消息
	self:GetPlayer().GoldenBodyExpUpdateMsg{Exp = self.nExp, bIsCrit = bIsCrit};
	-- 数据库
	self:UpdateDB();
end	
	
--[[
    [ \brief 得到修炼值
    [ \return number 返回修炼值
    ]]
function CGoldenBodySystem:GetPractice()
	return self.nPractice;
end	
	
--[[
    [ \brief 设置修炼值
    [ \param number nValue 修炼值
    ]]
function CGoldenBodySystem:SetPractice(nValue)
	if nValue > tSystemConfig.nMaxPracticePro then
		nValue = tSystemConfig.nMaxPracticePro;
	end
	
	self.nPractice = nValue;
	
	-- 发消息
	self:GetPlayer().GoldenBodyPracticeUpdateMsg{Practice = self.nPractice};
	-- 数据库
	self:UpdateDB();
end

--[[
    [ \brief 同步天官赐福值
    [ \param number nValue 天官赐福值
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
    [ \brief 得到天官赐福清除时间
    [ \return number 清除时间
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
    [ \brief 查看消息的处理函数
    [ \param number nRoleID 被查看的玩家ID
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
    [ \brief 被查看的处理
    [ \param number nFromRoleID 查看人的
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
    [ \brief 发送查看结果
    [ \param boolean bIsOk 是否查看成功
    [ \param number nPractice 修炼值
    [ \param number nExp 经验值
    ]]
function CGoldenBodySystem:ViewResult(bIsOk, nPractice, nExp)
	self:GetPlayer().GoldenBosyViewOtherResultMsg{
        IsOK = bIsOk,
        Practice = nPractice,
        Exp = nExp
    };
end
