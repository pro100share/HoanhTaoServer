--[[
	[ \brief 圣火令系统文件
	[ \author 李中昌
	[ \date 2014-5-6
	[ 处理圣火令系统逻辑
	[ 
	]]

-- 系统对象
_G.CShengHuoLingSystem = {};
	
--[[
	[ \brief 字符串解析
	[ 解析数据库中圣火令卡片状态的字符串。
	[ \param stirng sParse 数据库字符串
	[ \param table tState 解析后存储状态的表
	[ \return table 返回存储状态的表
	]]
local function ParseStateStr(sParse, tState)
	local nLastIndex = 0;
	while true do
		-- 找到;前面的字符串
		local nNextIndex = nLastIndex + 1;
		nLastIndex = string.find(sParse, ";", nNextIndex)
		if not nLastIndex then break end
		local str1 = string.sub(sParse, nNextIndex, nLastIndex - 1);
			
		-- 找到=前面的字符串
		local nEqualIndex = string.find(str1, "=");
		if not nEqualIndex then 
			_err("QunXiaLuSystem.lua ParseGroupSlotStr dont find equal sign!!")
			return
		end
		local nGroupIndex = string.sub(str1, 1, nEqualIndex - 1);
		tState[tonumber(nGroupIndex)] = {}
		
		-- 找到=后面的字符串
		local sSlotState = string.sub(str1, nEqualIndex + 1);
		
		local nLastSlotIndex = 0;
		while true do
			local nNextSlotIndex = nLastSlotIndex + 1;
			nLastSlotIndex = string.find(sSlotState, ",", nNextSlotIndex);
			if not nLastSlotIndex then break end
			local nState = string.sub(sSlotState, nNextSlotIndex,
			nLastSlotIndex - 1);
			table.insert(tState[tonumber(nGroupIndex)], tonumber(nState))
		end
	end

	return tState;
end

--[[
	[ \brief 格式化字符串
	[ 把存储卡片状态的表格式化为字符串。
	[ \param table tState 存储卡片状态的表
	[ \return string 返回格式化字符串
	]]
local function FormatStateStr(tState)
	local sFormat = "";
	for k , v in pairs(tState) do
		sFormat = sFormat..k.."=";
		for _, nState in pairs(v) do 
			sFormat = sFormat..nState..","
		end
		sFormat = sFormat..";"
	end
	
	return sFormat;
end

--[[
	[ \brief 创建系统对象
	[ 创建圣火令系统对象。
	[ \return object 返回圣火令系统对象
	]]
function CShengHuoLingSystem:new()
	local obj = CSystem:new("CShengHuoLingSystem");
	
	for i,v in pairs(CShengHuoLingSystem) do
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
function CShengHuoLingSystem:Create()
	-- 每个系统创建时都会挂接到自己的管理者player身上
	local oPlayer = self:GetPlayer();
	
	-- 初始化DB模块
	local oDB = oPlayer:GetDBQuery();
	if not oDB then
		_err("CShengHuoLingSystem Create Cannot get DBQuery");
		return false;
	end
	self.oDBQuery = CShengHuoLingSystemDB:new(oDB, self);

	-- 所有槽位的状态
	-- 槽位状态 -1为未镶嵌 0 为已经镶嵌 1234...为强化等级
	self.tState = {};
	
	-- 读取信息
	local tData	= oPlayer:GetLineData("CShengHuoLingSystem")[1];
	if not tData then
		_err("CShengHuoLingSystem Create CanNot GetLineData!!!");
		tData = {}
	end
		
	if tData[1] then
		ParseStateStr(tData[1].szSetState, self.tState);
		
		-- 上线统计属性给人物加上
		self:ChangeAttr()
		
	else
		-- 初始化卡片状态
		self:StateInit();
		
		-- 插入数据库
		local tDBInfo = {};
		tDBInfo.szSetState = FormatStateStr(self.tState);
		self.oDBQuery:InsertStateInfo(tDBInfo);
	end
	
	return true;
end

--[[
	[ \brief 进入游戏场景的函数
	[ 登陆游戏之后，同步系统信息
	]]
function CShengHuoLingSystem:OnEnterScene()
	-- 同步槽位状态
	self:SynSetState();
end

--[[
	[ \brief 换线前函数
	[ 换线之前整理数据
	]]
function CShengHuoLingSystem:OnChangeLineBegin()
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("error");
		return
	end
		
	local tData = {};
	tData[1] = {};
	tData[1].szSetState = FormatStateStr(self.tState);
	oPlayer:SetLineData("CShengHuoLingSystem", tData);
end

--[[
[ \brief 槽位状态初始化函数
[ 把所有槽位初始化为未镶嵌状态 -1
]]
function CShengHuoLingSystem:StateInit()
	for k, v in pairs(_G.ShengHuoLingConfig) do
		if type(k) == "number" then
			self.tState[k] = {};
			for index, _ in pairs(v.setSlot) do
				-- 状态置为-1   -1代表槽位未镶嵌 0代表已镶嵌 其他代表强化等级
				self.tState[k][index] = -1;
			end
		end
	end
end

--[[
[ \brief 同步槽位状态的函数
[ 向客户端同步所有槽位的状态
]]
function CShengHuoLingSystem:SynSetState()
	-- 系统属于角色，故不需要检测角色是否存在
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("error");
		return
	end
	
	oPlayer.SyncShengHuoLingSetStateMsg{SetState = self.tState};
end

--[[
[ \brief 属性处理函数
[ 计算系统给人物增加的属性并加到技能系统
]]
function CShengHuoLingSystem:ChangeAttr()
	-- 技能系统
	local oSkillSystem = self:GetPlayer():GetSystem("CSkillSystem");
	if not oSkillSystem then
		_err("CShengHuoLingSystem:ChangeAttr Cannot get SkillSystem----");
		return false;
	end
	oSkillSystem:NotifyShengHuoLingUpdate(
		ShengHuoLingConfig.GetAllAttr(self.tState));
end

--[[
	[ \brief 强化检查函数
	[ 检查是否符合强化条件
	[ \param number nGroupIndex 卡片组索引
	[ \param number nSlotIndex 卡片槽位索引
	[ \return boolean 是否满足强化条件
	]]
function CShengHuoLingSystem:StrengthCheck(nGroupIndex, nSlotIndex)
	-- 检测是否拥有权限
	if not self:HasAuthority('ShengHuoLing') then return false end
	
	-- 检查配置文件
	local nSlot = _G.ShengHuoLingConfig[nGroupIndex].setSlot[nSlotIndex];
	local tSlotCfg = ShengHuoLingSlotConfig[nSlot]
	if not tSlotCfg then
		_err("CShengHuoLingSystem:StrengthCheck cant get tSlotCfg", nSlot);
		return false;
	end 
	
	-- 检测系统内存里是否存在 nGroupIndex ,和 nSlotIndex , 
	-- 如果不存在但配置表里有 ,则为新增加了配置, 需要重新写到内存和数据库
	if not self.tState[nGroupIndex] then
		self.tState[nGroupIndex] = {};
		for k, _ in pairs(_G.ShengHuoLingConfig[nGroupIndex].setSlot) do
			self.tState[nGroupIndex][k] = -1;
		end
	elseif not self.tState[nGroupIndex][nSlotIndex] then
		self.tState[nGroupIndex][nSlotIndex] = -1;
	end
		
	-- 已经满级了
	if self.tState[nGroupIndex][nSlotIndex] >=
		_G.ShengHuoLingConfig.MaxSuitLevel then
		return false;
	end
	
	return self:StrengthCost(nGroupIndex, nSlotIndex);
end

--[[
	[ \brief 强化消耗检查函数
	[ 检查是强化消耗是否足够
	[ \param number nGroupIndex 卡片组索引
	[ \param number nSlotIndex 卡片槽位索引
	[ \return boolean 强化消耗是否足够
	]]
function CShengHuoLingSystem:StrengthCost(nGroupIndex, nSlotIndex)
	local tSlotCfg = ShengHuoLingSlotConfig[
		_G.ShengHuoLingConfig[nGroupIndex].setSlot[nSlotIndex]]
	local tLevelCfg = tSlotCfg[self.tState[nGroupIndex][nSlotIndex] + 1]
	
	local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
	if not oItemSystem then
		_err("CShengHuoLingSystem StrengthCost Cannot get ItemSystem");
		return false;
	end
	
	-- 检查镶嵌卡片是否足够
	local tGroupCfg = _G.ShengHuoLingConfig[nGroupIndex];
	if tLevelCfg.cardCount > 0 and
		not oItemSystem:CheckDelEnumItemInPacketCond(tGroupCfg.cardId,
			tLevelCfg.cardCount) then
		return false;
	end
	
	-- 消耗道具是否足够
	if tLevelCfg.itemCount > 0 and 
		not oItemSystem:CheckDelEnumItemInPacketCond(tGroupCfg.itemId,
			tLevelCfg.itemCount) then
		return false;
	end
	
	-- 检查银两是否足够
	if not oItemSystem:IsPacketMoneyEnough(tLevelCfg.silver) then
		return false;
	end
	
	-- 扣除
	if tLevelCfg.cardCount > 0 then
		oItemSystem:DelEnumItemInPacket(tGroupCfg.cardId,
			tLevelCfg.cardCount, false, _G.ItemSysOperType.ShengHuoLing);
	end
	
	if tLevelCfg.itemCount > 0 then
		oItemSystem:DelEnumItemInPacket(tGroupCfg.itemId,
			tLevelCfg.itemCount, false, _G.ItemSysOperType.ShengHuoLing);
	end
	
	oItemSystem:CostPacketMoney(tLevelCfg.silver,
		_G.ItemSysOperType.ShengHuoLing);
		
	return true;
end
