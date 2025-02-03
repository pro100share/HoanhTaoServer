--[[
	[ \brief 功法扩展系统文件
	[ \author 李中昌
	[ \date 2014-6-9
	[ 处理功法扩展系统逻辑
	[ 
	]]

-- 系统对象
_G.CKungFuExtendSystem = {};
	
--[[
	[ \brief 字符串解析
	[ 解析数据库中功法扩展次数的字符串。
	[ \param stirng sParse 数据库字符串
	[ \param table tCount 解析后存储状态的表
	[ \return table 返回存储状态的表
	]]
local function ParseCountStr(sParse, tCount)
	local nLastIndex = 0;
	while true do
		-- 找到;前面的字符串
		local nNextIndex = nLastIndex + 1;
		nLastIndex = string.find(sParse, ";", nNextIndex)
		if not nLastIndex then break end
		local str1 = string.sub(sParse, nNextIndex, nLastIndex - 1);
			
		-- 找到=前面的字符串
		local nIndex1 = string.find(str1, ",");
		if not nIndex1 then 
			_err("CKungFuExtendSystem ParseCountStr error!")
			return
		end
		local nSystemEnum = string.sub(str1, 1, nIndex1 - 1);
		local nExtendCount = string.sub(str1, nIndex1 + 1);
		tCount[tonumber(nSystemEnum)] = tonumber(nExtendCount);
	end

	return tCount;
end

--[[
	[ \brief 格式化字符串
	[ 把存储扩展次数的表格式化为字符串。
	[ \param table tCount 存储扩展次数的表
	[ \return string 返回格式化字符串
	]]
local function FormatCountStr(tCount)
	local sFormat = "";
	for k , v in pairs(tCount) do
		sFormat = sFormat..k..","..v..";";
	end
	
	return sFormat;
end

--[[
	[ \brief 创建系统对象
	[ 创建功法扩展系统对象。
	[ \return object 返回功法扩展系统对象
	]]
function CKungFuExtendSystem:new()
	local obj = CSystem:new("CKungFuExtendSystem");
	
	for i,v in pairs(CKungFuExtendSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	
	return obj;
end

--[[
	[ \brief 系统初始化
	[ 处理进入游戏的系统信息初始化，换线数据的处理
	[ \return Boolean false表示初始化失败, true表示初始化成功
	]]
function CKungFuExtendSystem:Create()
	-- 每个系统创建时都会挂接到自己的管理者player身上
	local oPlayer = self:GetPlayer();
	
	-- 初始化DB模块
	local oDB = oPlayer:GetDBQuery();
	if not oDB then
		_err("CKungFuExtendSystem Create Cannot get DBQuery");
		return false;
	end
	self.oDBQuery = CKungFuExtendSystemDB:new(oDB, self);

	-- 保存所有功法系统扩展次数
	self.tCount = {};
	
	-- 保存所有功法系统扩展次数上限
	self.tMaxCount = {};
	
	-- 读取信息
	local tData	= oPlayer:GetLineData("CKungFuExtendSystem")[1];
	if not tData then
		_err("CKungFuExtendSystem Create CanNot GetLineData!!!");
		tData = {}
	end
		
	if tData[1] then
		ParseCountStr(tData[1].tCount, self.tCount);
		self:ParseConfig();
		-- 上线统计属性给人物加上
		self:ChangeAttr()
		
	else
		-- 初始系统扩展次数
		self:CountInit();
		
		-- 插入数据库
		local tDBInfo = {};
		tDBInfo.tCount = FormatCountStr(self.tCount);
		self.oDBQuery:InsertCountInfo(tDBInfo);
	end
	
	return true;
end

--[[
	[ \brief 进入游戏场景的函数
	[ 登陆游戏之后，同步系统信息
	]]
function CKungFuExtendSystem:OnEnterScene()
	self:UpdateAllCount();
	-- 同步扩展次数
	self:SynCount();
end

--[[
	[ \brief 判断数据库和配置文件的差异
	[ 如果数据库新增了配置 则重新写入数据库
	]]
function CKungFuExtendSystem:ParseConfig()
	-- 字符串解析完之后判断配置文件里有没有新增的配置
	local bIsNewCfg = false;
	for nSysEnum, _ in pairs(KungFuExtendConfig) do
		if type(nSysEnum) == "number" then
			if not self.tCount[nSysEnum] then
				self.tCount[nSysEnum] = 0;
				bIsNewCfg = true;
			end
		end
	end
	if bIsNewCfg then
		-- 更新数据库
		local tDBInfo = {};
		tDBInfo.tCount = FormatCountStr(self.tCount);
		self.oDBQuery:UpdateCountInfo(tDBInfo);
	end
end

--[[
	[ \brief 更新所有系统的次数上限
	]]

function CKungFuExtendSystem:UpdateAllCount()
	-- 获取各个系统的等级
	local oPlayer = self:GetPlayer();
	local nSysLevel = 0; 
	
	for nSysEnum, tInfo in pairs(_G.KungFuExtendConfig) do 
		if type(nSysEnum) == "number" then
			if nSysEnum == _G.KungFuEnum.YiJingJing then
				nSysLevel = oPlayer:GetSystem("CKungFuSystem"):GetKungfuLevel(1);
			elseif nSysEnum == _G.KungFuEnum.MatrixMethod then
				nSysLevel = oPlayer:GetSystem(
					"CMatrixMethodSystem").ResData.dwHideStarLevel;
			elseif nSysEnum == _G.KungFuEnum.TieBuShan then
				nSysLevel = oPlayer:GetSystem(
					"CTieBuShanSystem"):GetSuitLevel();
			elseif nSysEnum == _G.KungFuEnum.TongLaoGong then
				nSysLevel = oPlayer:GetSystem(
					"CPractiseSkillSystem"):GetCurStarLevel();
			elseif nSysEnum == _G.KungFuEnum.Gourd then
				nSysLevel = oPlayer:GetSystem(
					"CGourdSystem"):GetCurMendLevel();
			elseif nSysEnum == _G.KungFuEnum.HiddenWeapon then
				nSysLevel = oPlayer:GetSystem(
					"CHiddenWeaponSystem"):getLevel();
			elseif nSysEnum == _G.KungFuEnum.Banner then
				nSysLevel = oPlayer:GetSystem(
					"CBannerSystem"):getLevel();
			elseif nSysEnum == _G.KungFuEnum.Shield then
				nSysLevel = oPlayer:GetSystem(
					"CShieldSystem"):getLevel();
			elseif nSysEnum == _G.KungFuEnum.Practice then
				nSysLevel = oPlayer:GetSystem(
					"CPracticeSystem"):getLevel();
			elseif nSysEnum == _G.KungFuEnum.ErrantHonor then
				nSysLevel = oPlayer:GetSystem(
					"CErrantHonorSystem"):GetErrantLevel();
			end
			
			-- print("CKungFuExtendSystem:UpdateAllCount", nSysEnum, nSysLevel)
			self.tMaxCount[nSysEnum] = tInfo.tLevel[nSysLevel].maxCount;
		end
	end
end

--[[
	[ \brief 换线前函数
	[ 换线之前整理数据
	]]
function CKungFuExtendSystem:OnChangeLineBegin()
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("error");
		return
	end
		
	local tData = {};
	tData[1] = {};
	tData[1].tCount = FormatCountStr(self.tCount);
	oPlayer:SetLineData("CKungFuExtendSystem", tData);
end

--[[
	[ \brief 换线后函数
	[ 换线之后整理数据
	]]
function CKungFuExtendSystem:OnChangeLineEnd()
	self:UpdateAllCount();
end

--[[
[ \brief 系统次数初始化函数
[ 把所有系统扩展次数初始化为0次
]]
function CKungFuExtendSystem:CountInit()
	for k, v in pairs(_G.KungFuExtendConfig) do
		if type(k) == "number" then
			self.tCount[k] = 0;
		end
	end
end

--[[
[ \brief 同步扩展次数的函数
[ 向客户端同步所有系统扩展次数
]]
function CKungFuExtendSystem:SynCount()
	local oPlayer = self:GetPlayer();
	oPlayer.SyncKungFuExtendCountMsg{tCount = self.tCount, 
			-- tMaxCount = self.tMaxCount
		};
end

--[[
[ \brief 属性处理函数
[ 计算系统给人物增加的属性并加到技能系统
]]
function CKungFuExtendSystem:ChangeAttr()
	-- 技能系统
	local oSkillSystem = self:GetPlayer():GetSystem("CSkillSystem");
	if not oSkillSystem then
		_err("CKungFuExtendSystem:ChangeAttr Cannot get SkillSystem----");
		return false;
	end
	
	for k, v in pairs(_G.KungFuExtendConfig) do
		if type(k) == "number" then
			oSkillSystem:NotifyKungFuExtendUpdate(
			KungFuExtendConfig.GetSingleSysAttr(self.tCount, k), k);
		end
	end
end

--[[
	[ \brief 扩展检查函数
	[ 检查是否符合扩展条件
	[ \param number nSysEnum 系统枚举
	[ \param number nOptCount 操作次数
	[ \return boolean 是否满足扩展条件
	]]
function CKungFuExtendSystem:ExtendCheck(nSysEnum, nOptCount)
	-- 检测是否拥有权限
	local sAuthority = _G.KungFuExtendConfig[nSysEnum].authorityName;
	if not self:HasAuthority(sAuthority) then return false end
	
	-- local nCurLevel = _G.KungFuExtendConfig.GetLevelByCount(
		-- self.tCount[nSysEnum], nSysEnum);
		
	local tExtendCfg = 	_G.KungFuExtendConfig[nSysEnum].Data.Consume;
	if not tExtendCfg then return false end
	
	--更新所有系统上限
	self:UpdateAllCount();
	
	-- print("CKungFuExtendSystem:ExtendCheck ===",nSysEnum, nOptCount)
	-- 升级次数超过上限
	if self.tMaxCount[nSysEnum] - self.tCount[nSysEnum] < nOptCount then
		return false;
	end
	
	-- 扣除
	local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
	if not oItemSystem then
		_err("CKungFuExtendSystem StrengthCost Cannot get ItemSystem");
		return false;
	end
	
	if tExtendCfg.itemCount > 0 and 
		not oItemSystem:CheckDelEnumItemInPacketCond(tExtendCfg.itemId,
			tExtendCfg.itemCount * nOptCount) then
		return false;
	end

	if not oItemSystem:IsPacketMoneyEnough(tExtendCfg.silver * nOptCount) then
		return false;
	end

	if tExtendCfg.itemCount > 0 then
		oItemSystem:DelEnumItemInPacket(tExtendCfg.itemId,
			tExtendCfg.itemCount * nOptCount, false, _G.ItemSysOperType.KungFuExtend);
	end
	
	oItemSystem:CostPacketMoney(tExtendCfg.silver * nOptCount,
		_G.ItemSysOperType.KungFuExtend);
	
	return true;
end
