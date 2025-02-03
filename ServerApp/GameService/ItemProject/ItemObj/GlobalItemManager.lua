
---------------------------------------
--道具全局静态表
_G.CGlobalItemManager = {};
CGlobalItemManager.setItemConfig	= {};		--物品的配置列表
CGlobalItemManager.setItemScript	= {};		--物品的脚本列表,由EquipBaseData和OtherBaseData合并得来

--服务器启动便创建服务器的所有物品配置
function CGlobalItemManager:Create()
	--合并配置文件
	self:CombineConfig();
	--读取脚本文件
	self:ReadScript();
	
	return true;
end;
----------------------------------------
--合并配置文件
function CGlobalItemManager:CombineConfig()
	--寻找所有配置表的列名称
	local setColumns = {};
	for dwItemEnum, tItemCfg in pairs(EquipBaseData) do
		for key,value in pairs(tItemCfg) do
			setColumns[key] = key;
		end
		break;
	end
	for dwItemEnum, tItemCfg in pairs(OtherBaseData) do
		for key,value in pairs(tItemCfg) do
			setColumns[key] = key;
		end
		break;
	end
	--拷贝所有的数据到新表中，没有则默认为0
	for dwItemEnum, tItemCfg in pairs(EquipBaseData) do
		self.setItemConfig[dwItemEnum] = {};
		for key,strCol in pairs(setColumns) do
			self.setItemConfig[dwItemEnum][strCol] = tItemCfg[strCol] or 0;
		end
	end
	for dwItemEnum, tItemCfg in pairs(OtherBaseData) do
		self.setItemConfig[dwItemEnum] = {};
		for i,strCol in pairs(setColumns) do
			self.setItemConfig[dwItemEnum][strCol] = tItemCfg[strCol] or 0;
		end
	end
	--从宝石增加的属性列表中合并信息，与装备的相关条目相同，字段名称一样
	for dwItemEnum, tItemCfg in pairs(StoneBaseData) do
		if not self.setItemConfig[dwItemEnum] then
			_err("self.setItemConfig[dwItemEnum]", dwItemEnum);
		else
			for strCol,value in pairs(tItemCfg) do
				-- if not self.setItemConfig[dwItemEnum][strCol] then
					-- _err("self.setItemConfig[dwItemEnum][strCol]", dwItemEnum, strCol);
				-- else
					self.setItemConfig[dwItemEnum][strCol] = tItemCfg[strCol];
				--end
			end
		end
	end
end
--增加一个脚本回调函数
function CGlobalItemManager:AddScript( dwItemEnum, objItemScript )
	CGlobalItemManager.setItemScript[dwItemEnum] = objItemScript;
end
--读取道具脚本
function CGlobalItemManager:ReadScript()
	dofile("../Config/ItemScript/Include.lua");
	-- local strResPath = "../Config/ItemScript/";
	-- for dwItemEnum, tItemCfg in pairs(self.setItemConfig) do
		-- local res, msg = pcall(dofile, strResPath .. "Item_" .. tostring(dwItemEnum) .. ".lua" );
	-- end;
end;

--创建
CGlobalItemManager:Create();

--判断配置表中是有有此id道具
function CGlobalItemManager:IsHaveThisItem(dwItemEnum)
	return self.setItemConfig[dwItemEnum] and true or false;
end;
--获取一个对应配置ID的物品配置信息，打印错误信息，确保有效
function CGlobalItemManager:GetConfig(dwItemEnum)
	local tItemCfg = self.setItemConfig[dwItemEnum];
	if not tItemCfg then
		_err("Error Message: " .. tostring(dwItemEnum) .. " Does Not Exits.");
	end
	return tItemCfg;
end
--获取一个物品的脚本
function CGlobalItemManager:GetScript(dwItemEnum)
	return self.setItemScript[dwItemEnum] or CItemScript;
end



local IndexToPropType = 
{
	enPropertyType.eAttackPower,
	enPropertyType.eDefence,
	enPropertyType.eBaoJi,
	enPropertyType.eShenFa,
	enPropertyType.eHPLimited,
	enPropertyType.eMPLimited,
};
--获取重复的附加属性类型，参数：附加属性条数
function CGlobalItemManager:GetRepeatProperty(dwPropNum, tPropCfg)
	local setProperty = {};
	for i=1,dwPropNum do
		local dwRandIndex = math.random(1, #IndexToPropType);
		local propType = IndexToPropType[dwRandIndex];
		local strMinName = _G.PropertyTypeToMinMax[propType][1];
		local strMaxName = _G.PropertyTypeToMinMax[propType][2];
		local dwMin = tPropCfg[strMinName];
		local dwMax = tPropCfg[strMaxName];
		local dwMinValue = math.floor(dwMin/dwMax* 1000000);
		local dwValue = math.random(dwMinValue, 300000);
		local tProp = {
			dwPropertyType = propType,
			dwValue = dwValue,
		};
		table.insert(setProperty, tProp);
	end
	return setProperty;
end
--获取不重复的附加属性类型，参数：附加属性条数
function CGlobalItemManager:GetNoneRepeatProperty(dwPropNum, tPropCfg)
	if dwPropNum > #IndexToPropType then
		_err("CGlobalItemManager:GetNoneRepeatProperty dwPropNum > #IndexToPropType");
		return {};
	end
	local setProperty = {};
	local setRandType = {};
	--获取Index到附加属性类型的一个备份
	local copyIndexToProp = {};
	for k,v in ipairs(IndexToPropType) do
		copyIndexToProp[k] = v;
	end
	--随机出附加属性类型，类型不重复
	for i=1, dwPropNum do
		local index = math.random(1, #copyIndexToProp);
		local dwtype = copyIndexToProp[index];
		table.remove(copyIndexToProp, index);
		table.insert(setRandType, dwtype);
	end
	--根据类型随机出附加属性的值
	for k,v in ipairs(setRandType) do
		local strMinName = _G.PropertyTypeToMinMax[v][1];
		local strMaxName = _G.PropertyTypeToMinMax[v][2];
		local dwMin = tPropCfg[strMinName];
		local dwMax = tPropCfg[strMaxName];
		local dwMinValue = math.floor(dwMin/dwMax* 1000000);
		local dwValue = math.random(dwMinValue, 300000);
		local tProp = {
			dwPropertyType = v,
			dwValue = dwValue,
		};
		table.insert(setProperty, tProp);
	end
	return setProperty;
end
--传入物品的品质信息，根据品质信息获取物品的附加属性详见： enQualityType
function CGlobalItemManager:GetPropertyByQuality(dwItemEnum, dwQualityType)
	--判断物品是否是装备
	if not self:IsEquip(dwItemEnum) then return	end;
	if (not dwQualityType) or (dwQualityType > enQualityType.eGold) or (dwQualityType < enQualityType.eNormal) then 
		_err("GetPropertyByQuality dwQualityType Error:", dwQualityType);
		return;
	end;
	local dwPropertyID = self:GetPropertyID(dwItemEnum);
	local setProperty;
	--获取品质到附加属性条数的配置表
	local tabQuaNum = _G.QualityToProperty[dwQualityType];
	--随机出附加属性的条数
	local dwPropNum = math.random(tabQuaNum[1], tabQuaNum[2]);
	--获取装备对应的附加属性表的信息
	local tPropCfg = _G.EquipAppendConfig[dwPropertyID];
	--根据公式计算出附加属性的类型
	if tPropCfg.dwAppendType == 0 then --类型可以重复
		setProperty = self:GetRepeatProperty(dwPropNum, tPropCfg);
	else--类型不可以重复
		setProperty = self:GetNoneRepeatProperty(dwPropNum, tPropCfg);
	end
	return setProperty;
end





--------------------------------------------
------------------IS判断接口----------------
--------------------------------------------

--判断是否是装备
function CGlobalItemManager:IsEquip(dwEnumID)
	return _G.EquipBaseData[dwEnumID];
end;

--判断是否可叠加
function CGlobalItemManager:IsCanMerge(dwEnumID)
	return self:GetMaxRepeat(dwEnumID) > 1;
end;

--判断是否可以出售
function CGlobalItemManager:IsCanSell(dwEnumID)
	return self:GetSellType(dwEnumID) == _G.enItemSellType.eYes;
end;



--------------------------------------------
---------------获取道具相关配置-------------
--------------------------------------------

--获取穿戴位置
function CGlobalItemManager:GetWearPos(dwEnumID)
	return self:GetConfig(dwEnumID).dwWearPos;
end;

--获取耐久度
function CGlobalItemManager:GetEquipEndure(dwEnumID)
	return self:GetConfig(dwEnumID).dwEquipEndure;
end;

--获取配置CD时间
function CGlobalItemManager:GetCDTime(dwEnumID)
	return self:GetConfig(dwEnumID).dwCDTime;
end;

--获取CD周期
function CGlobalItemManager:GetCDType(dwEnumID)
	return self:GetConfig(dwEnumID).dwCDType;
end;

--获取品质
function CGlobalItemManager:GetQuality(dwEnumID)
	return self:GetConfig(dwEnumID).dwQuality;
end;

--获取等阶
function CGlobalItemManager:GetLevel(dwEnumID)
	return self:GetConfig(dwEnumID).dwLevel;
end;

--获取父类型
function CGlobalItemManager:GetParentType(dwEnumID)
	return self:GetConfig(dwEnumID).dwParentType;
end;

--获取子类型
function CGlobalItemManager:GetChildType(dwEnumID)
	return self:GetConfig(dwEnumID).dwChildType;
end;

--获取角色需求
function CGlobalItemManager:GetRoleNeeded(dwEnumID)
	return self:GetConfig(dwEnumID).dwRoleNeeded;
end;

--获取等级需求
function CGlobalItemManager:GetLevelNeeded(dwEnumID)
	return self:GetConfig(dwEnumID).dwLevelNeeded;
end;

--获取配置绑定类型
function CGlobalItemManager:GetBindType(dwEnumID)
	return self:GetConfig(dwEnumID).dwBindType;
end;

--获取配置生命时长
function CGlobalItemManager:GetLifeTime(dwEnumID)
	return self:GetConfig(dwEnumID).dwLifeTime;
end;

--获取购买价格
function CGlobalItemManager:GetBuyPrice(dwEnumID)
	return self:GetConfig(dwEnumID).dwBuyPrice;
end;

--获取卖出价格
function CGlobalItemManager:GetSellPrice(dwEnumID)
	return self:GetConfig(dwEnumID).dwSellPrice;
end;

--获取卖出类型
function CGlobalItemManager:GetSellType(dwEnumID)
	return self:GetConfig(dwEnumID).dwSellType;
end;

--获取最大叠加数
function CGlobalItemManager:GetMaxRepeat(dwEnumID)
	return self:GetConfig(dwEnumID).dwMaxRepeat;
end;

--获取附加属性组ID
function CGlobalItemManager:GetPropertyID(dwEnumID)
	return self:GetConfig(dwEnumID).dwPropertyID;
end;

--获取下一阶ID
function CGlobalItemManager:GetNextItem(dwEnumID)
	return self:GetConfig(dwEnumID).dwNextItem;
end;

--获取上一阶ID
function CGlobalItemManager:GetLastItem(dwEnumID)
	return self:GetConfig(dwEnumID).dwLastItem;
end;

--获取名字
function CGlobalItemManager:GetName(dwEnumID)
	return self:GetConfig(dwEnumID).strName;
end;

--获取攻击力
function CGlobalItemManager:GetAttack(dwEnumID)
	return self:GetConfig(dwEnumID).dwPower;
end;

--获取防御力
function CGlobalItemManager:GetDefense(dwEnumID)
	return self:GetConfig(dwEnumID).dwDefence;
end;

--获取暴击
function CGlobalItemManager:GetCrit(dwEnumID)
	return self:GetConfig(dwEnumID).dwBaoJi;
end;

--获取身法
function CGlobalItemManager:GetFlee(dwEnumID)
	return self:GetConfig(dwEnumID).dwShenFa;
end;

--获取攻击速度
function CGlobalItemManager:GetAttackSpeed(dwEnumID)
	return self:GetConfig(dwEnumID).dwAttackSpeed;
end;

--获取移动速度
function CGlobalItemManager:GetMoveSpeed(dwEnumID)
	return self:GetConfig(dwEnumID).dwMoveSpeed;
end;

--获取生命值上限 
function CGlobalItemManager:GetHPMax(dwEnumID)
	return self:GetConfig(dwEnumID).dwHPLimited;
end;

--获取内力上限
function CGlobalItemManager:GetMPMax(dwEnumID)
	return self:GetConfig(dwEnumID).dwMPLimited;
end;

--获取伤害减免
function CGlobalItemManager:GetRemitAttack(dwEnumID)
	return self:GetConfig(dwEnumID).dwSubDamage;
end;

--获取MshID
function CGlobalItemManager:GetMshID(dwEnumID)
	return self:GetConfig(dwEnumID).dwMshID;
end;



