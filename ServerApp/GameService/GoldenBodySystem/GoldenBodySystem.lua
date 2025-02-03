--[[
    [ \brief 修炼金身系统文件
    [ \author 李中昌
    [ \date 2014-7-2
    [ 处理修炼金身系统逻辑
    ]]

-- 系统对象
_G.CGoldenBodySystem = {};

-- 修炼金身配置表	
local tConfig = _G.GoldenBodyConfig;

--[[
    [ \brief 创建系统对象
    [ 创建修炼金身系统对象。
    [ \return object 返回修炼金身系统对象
    ]]
function CGoldenBodySystem:new()
	local obj = CSystem:new("CGoldenBodySystem");
	
	for i,v in pairs(CGoldenBodySystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	
	return obj;
end

--[[
    [ \brief 系统初始化
    [ 处理进入游戏的系统信息初始化，换线数据的处理
    [ \param number bIsChangeLine 0:登陆, 1:换线, 2:进入跨服战
    [ \return Boolean false表示初始化失败, true表示初始化成功
    ]]
function CGoldenBodySystem:Create(bIsChangeLine)
	local oPlayer = self:GetPlayer();
    
	local oDB = oPlayer:GetDBQuery();
	if not oDB then
		_err("CGoldenBodySystem Create Cannot get DBQuery");
		return false;
	end
	self.oDBQuery = CGoldenBodySystemDB:new(oDB, self);

	-- 本系统当前经验
	self.nExp = 0;
	-- 修炼值
	self.nPractice = 0;
	
	local tData	= oPlayer:GetLineData("CGoldenBodySystem")[1];
	if not tData then
		_err("CGoldenBodySystem Create CanNot GetLineData!!!");
		tData = {}
	end
		
	if tData[1] then
		self.nExp = tData[1].nExp;
		self.nPractice = tData[1].nPractice;
		
		-- 如果修炼值小于最大值而且是刚登陆 需要计算时间给修炼值
		if self.nPractice < tConfig.nMaxPractice and bIsChangeLine == 0 then
			local nDelayTime = _now() - oPlayer:GetInfo().tmDownlineTime;
			if nDelayTime > 0 then
				self.nPractice = self.nPractice + math.floor(nDelayTime /
					(tConfig.nPracticeTime * 60 * 1000)) *
						tConfig.nPracticeCount;
						
				if self.nPractice > tConfig.nMaxPractice then
					self.nPractice = tConfig.nMaxPractice;
				end	
			end
		end
	else
		-- 插入数据库
		self.oDBQuery:InsertInfo({nExp = 0, nPractice = tConfig.nMaxPractice});
		self.nPractice = tConfig.nMaxPractice;
	end
	
	if self:HasAuthority("GoldenBody") then
		self:ChangeAttr();
	end
	
	return true;
end

--[[
    [ \brief 更新函数
    [ 定时增加玩家的修炼值
    ]]
function CGoldenBodySystem:Update()
	if not self:HasAuthority("GoldenBody") then return; end 
	if self.nPractice >= tConfig.nMaxPractice then return; end 
	
	self.nPractice = self.nPractice + tConfig.nPracticeCount;
	
	if self.nPractice > tConfig.nMaxPractice then
		self.nPractice = tConfig.nMaxPractice;
	end
	
	self:GetPlayer().GoldenBodyPracticeUpdateMsg{Practice = self.nPractice};
	self:UpdateDB();
end

--[[
    [ \brief 换线前函数
    [ 换线之前整理数据
    ]]
function CGoldenBodySystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData(
        "CGoldenBodySystem",
        {[1] = {nExp = self.nExp, nPractice = self.nPractice}}
    );
end

--[[ 
    [ \brief 同步系统所有信息的函数
    [ 向客户端同步系统所有信息
    ]]
function CGoldenBodySystem:SynAll()
	self:GetPlayer().SyncGoldenBodyAllMsg{
        Exp = self.nExp,
        Practice = self.nPractice,
		CiFu = self:GetPlayer():
            GetSystem("CTianGuanCiFuSystem"):Get_GoldenBody()
    };
end

--[[
    [ \brief 计算属性函数
    [ 计算本系统给玩家增加的属性并加给玩家
    ]]
function CGoldenBodySystem:ChangeAttr()
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyGoldenBodyUpdate(
        tConfig:GetAttrByLevel(tConfig:GetLevel(self.nExp)));
end

--[[
    [ \brief 修炼检查函数
    [ 检查是否符合修炼条件
    [ \return boolean 是否满足修炼条件
    ]]
function CGoldenBodySystem:PracticeCheck()
	if not self:HasAuthority("GoldenBody") then return false; end
	
	local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
	local tNeedConfig = tConfig.DanList[tConfig:GetLevel(
		self.nExp)];
	
	-- 检查消耗
	if not oItemSystem:IsPacketMoneyEnough(tNeedConfig.nSilver) then
		return false;
	end

	if self:GetPlayer():GetInfo().dwLevelCurExp <= tNeedConfig.nExp then	
		return false;
	end
	
	if self.nPractice < tNeedConfig.nPractice then return false; end
	
	-- 扣除消耗
	oItemSystem:CostPacketMoney(tNeedConfig.nSilver,_G.ItemSysOperType.GoldenBody);
	self:GetPlayer():CostExp(tNeedConfig.nExp);
	self:SetPractice(self.nPractice - tNeedConfig.nPractice);
	return true;
end

--[[
    [ \brief 突破检查函数
    [ 检查是否符合突破条件
    [ \return boolean 是否满足突破条件
    ]]
function CGoldenBodySystem:UpGrade()
	-- 检测是否拥有权限
	if not self:HasAuthority("GoldenBody") then return false; end
	
	local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
	local tNeedCfg = tConfig.BlessList[tConfig:GetGradeAndLevel(self.nExp)];
	-- 扣除消耗物品	
	if tNeedCfg.nNum > 0 then
		if not oItemSystem:DelEnumItemInPacket(
            tNeedCfg.nId,
            tNeedCfg.nNum,
			false,
            _G.ItemSysOperType.GoldenBody) then
			return false;
		end
	end
	
	return self:CiFu();
end

--[[
    [ \brief 突破赐福函数
    [ 赐福的逻辑处理
    [ \return boolean 是否赐福成功
    ]]
function CGoldenBodySystem:CiFu()
	local oCifuSystem = self:GetPlayer():GetSystem("CTianGuanCiFuSystem");
	local bIsSuccess = oCifuSystem:IsGoldenBodyMax();
	if not bIsSuccess then
		if math.random(1, 10000) <= tConfig:SuccessRate(self.nExp, oCifuSystem:
            Get_GoldenBody()) then
			bIsSuccess = true;
		end
	end
	
	-- 如果赐福成功
	if bIsSuccess then
		oCifuSystem:Set_GoldenBody(0, false);
	else
		oCifuSystem:Add_GoldenBody(tConfig:GetGradeAndLevel(
			self.nExp))
	end
	
	return bIsSuccess;
end

--[[
    [ \brief 获取权限回调函数
    ]]
function CGoldenBodySystem:EventGetAuthority(szAuthName)
	if szAuthName == "GoldenBody" then
		self:ChangeAttr();
	end
end

--[[
    [ \brief 更新数据库函数
    ]]
function CGoldenBodySystem:UpdateDB()
	self.oDBQuery:UpdateInfo({nExp = self.nExp, nPractice = self.nPractice});
end
