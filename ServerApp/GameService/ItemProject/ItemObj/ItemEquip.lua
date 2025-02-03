------------------------------------
------------------------------------
--装备类
--author lkj

_G.CItemEquip = {};
setmetatable(CItemEquip, {__index = CItemBase});

--New()
function CItemEquip:New(dwEnumID)
	local obj = {};
	
	--初始化变量
	obj.dwEnumID	= dwEnumID;
	obj.dwItemID	= 0;	--实例ID
	obj.dwRoleID	= 0;	--所有者的ID
	obj.dwCount		= 1;	--叠加个数
	obj.dwHolder	= 0;	--容器类型
	obj.dwSlot		= 0;	--哪一格
	obj.dwBindType	= 0;	--0表示未绑定；1表示绑定
	obj.dwBornTime	= 0;	--出生时间戳
	obj.dwLifeTime	= 0;	-- -1表示无时间限制
	obj.strDoodle	= "";	--签名
	obj.dwCDTime	= 0;	--CD
	
	--初始化独有变量
	obj.dwEndure		= CGlobalItemManager:GetEquipEndure(dwEnumID);--耐久度
	obj.dwStrongLevel	= 0;	--强化等级
	obj.dwTianSheng		= 0;	--天生属性
	obj.setProp			= {};	--装备的附加属性
	
	setmetatable(obj, {__index = CItemEquip});
	
	return obj;
end;

--Copy
function CItemEquip:Copy(obj)	
	obj:SetBindType(self:GetBindType());
	obj:SetBornTime(self:GetBornTime());
	obj:SetLifeTime(self:GetLifeTime());
	obj:SetDoodle(self:GetDoodle());
	obj:SetCDTime(self:GetCDTime());
	obj:SetEndure(self:GetEndure());
	obj:SetStrongLevel(self:GetStrongLevel());
	obj:SetTianSheng(self:GetTianSheng());
	obj:SetProperty(self:GetProperty());
end;

--Get NetData
function CItemEquip:GetNetData()
	local data = {};
	
	data[1] = self:GetEnumID();
	data[2] = self:GetInstID();				--实例ID
	data[3] = self:GetRoleID();				--所有者的ID
	data[4] = self:GetCount();				--叠加个数
	data[5], data[6] = self:GetPosInfo();	--位置信息
	data[7] = self:GetBindType();			--0表示未绑定；1表示绑定
	data[8] = self:GetBornTime();			--出生时间戳
	data[9] = self:GetLifeTime();			-- -1表示无时间限制
	data[10] = self:GetDoodle();			--签名
	data[11] = self:GetEndure();			--耐久度
	data[12] = self:GetStrongLevel();		--强化等级
	data[13] = self:GetTianSheng();			--天生属性
	data[14] = self:GetPropertyNetData();	--装备的附加属性
	
	return data;
end;
--Parse NetData
function CItemEquip:ParseNetData(data)
	self:SetInstID(data[2]);				--实例ID
	self:SetRoleID(data[3]);				--所有者的ID
	self:SetCount(data[4]);					--叠加个数
	self:SetPosInfo(data[5], data[6]);		--位置信息
	self:SetBindType(data[7]);				--0表示未绑定；1表示绑定
	self:SetBornTime(data[8]);				--出生时间戳
	self:SetLifeTime(data[9]);				-- -1表示无时间限制
	self:SetDoodle(data[10]);				--签名
	self:SetEndure(data[11]);				--耐久度
	self:SetStrongLevel(data[12]);			--强化等级
	self:SetTianSheng(data[13]);			--天生属性
	self:ParsePropertyNetData(data[14]);	--装备的附加属性
end;



------------------------------------------------
--------------------Get接口---------------------
------------------------------------------------

--获取品质
function CItemEquip:GetQuality()
	return _G.PropertyToQuality[#self.setProp];
end;

--获取强化等级
function CItemEquip:GetStrongLevel()
	return self.dwStrongLevel;
end;

--获取天生属性(后叫兵魂)
function CItemEquip:GetTianSheng()
	return self.dwTianSheng;
end;

--获取附加属性列表
function CItemEquip:GetProperty()
	local tempProperty = {};
	for _, v in ipairs(self.setProp) do
		local tempT = {
			dwPropertyType	= v.dwPropertyType;
			dwValue			= v.dwValue;
		};
		table.insert(tempProperty, tempT);
	end;
	return tempProperty;
end;

--获取附加属性数据库存储格式
function CItemEquip:GetDBProperty()
	local str = "";
	local strT1 = "%d,%d;";
	local strT2 = "%s%s";
	for k, v in ipairs(self.setProp) do
		str = string.format(strT2, str, string.format(strT1, v.dwPropertyType, v.dwValue));
	end;
	return str;
end;

--获取附加属性网络信息
function CItemEquip:GetPropertyNetData()
	local data = {};
	for _, v in ipairs(self.setProp) do
		local tempT = {
			[1]	= v.dwPropertyType;
			[2] = v.dwValue;
		};
		table.insert(data, tempT);
	end;
	return data;
end;

--解析附加属性网络信息
function CItemEquip:ParsePropertyNetData(data)
	local temp = {};
	for _, v in ipairs(data) do
		local tempT = {
			dwPropertyType	= v[1];
			dwValue			= v[2];
		};
		table.insert(temp, tempT);
	end;
	self.setProp = temp;
end;

--获取耐久度
function CItemEquip:GetEndure()
	return self.dwEndure;
end;


--获取穿戴位置
function CItemEquip:GetWearPos()
	return CGlobalItemManager:GetWearPos(self:GetEnumID());
end;

--获取附加属性组ID
function CItemEquip:GetPropertyID()
	return CGlobalItemManager:GetPropertyID(self:GetEnumID());
end;

--获取配置耐久度
function CItemEquip:GetConfigEndure()
	return CGlobalItemManager:GetEquipEndure(self:GetEnumID());
end;

--获取MshID
function CItemEquip:GetMshID()
	return CGlobalItemManager:GetMshID(self:GetEnumID());
end;


------------------------------------------------
--------------------Set接口---------------------
------------------------------------------------

--设置耐久度
function CItemEquip:SetEndure(dwEndure)
	self.dwEndure = dwEndure;
end;

--设置天生属性(后叫兵魂)
function CItemEquip:SetTianSheng(dwTianSheng)
	self.dwTianSheng = dwTianSheng;
end;

--设置强化等级
function CItemEquip:SetStrongLevel(dwStrongLevel)
	self.dwStrongLevel = dwStrongLevel;
end;

--设置附加属性
function CItemEquip:SetProperty(tProperty)
	self.setProp = {};
	for _, v in ipairs(tProperty) do
		local tempT = {
			dwPropertyType	= v.dwPropertyType;
			dwValue			= v.dwValue;
		};
		table.insert(self.setProp, tempT);
	end;
end;


--掉耐久度
function CItemEquip:DownEndure(dwValue)
	if self:GetConfigEndure() == -1 then
		return false;--耐久度为-1的装备为永不磨损
	end
	local dwCurEndure = self:GetEndure();
	dwCurEndure = dwCurEndure - dwValue;
	dwCurEndure = (dwCurEndure >= 0) and dwCurEndure or 0;
	self:SetEndure(dwCurEndure);
	return true;
end;

--修复耐久度
function CItemEquip:FixEquipEndure()
	if self:GetEndure() ~= self:GetConfigEndure() then
		self:SetEndure(self:GetConfigEndure());
		return true;
	else
		return false;
	end;
end;



local ProTypeToMax = {
	[enPropertyType.eAttackPower] = "dwMaxPower";
	[enPropertyType.eDefence]	= "dwMaxDefence";
	[enPropertyType.eBaoJi] 	= "dwMaxBaoJi";
	[enPropertyType.eShenFa]	= "dwMaxShenFa";
	[enPropertyType.eHPLimited] = "dwMaxHPLimited";
	[enPropertyType.eMPLimited] = "dwMaxMPLimited";
	[enPropertyType.eSubDamage] = "dwMaxSubDamage";
};
--获取物品的附加属性配置表Max数值
local function GetProConfigMaxValue(dwPropertyID, dwPropertyType)
	local tCfg = _G.EquipAppendConfig[dwPropertyID];
	if not tCfg then
		return nil;
	end
	return tCfg[ProTypeToMax[dwPropertyType]];
end

--装备升阶生成新的附加属性表
function CItemEquip:UpGradeNewProperty()
    if CPropertyScrollSystem:IsUsed(self) then
       return; 
    end

	local oldPropID = self:GetPropertyID();
	local newPropID = CGlobalItemManager:GetPropertyID(self:GetNextItem());
	for _, tabProp in ipairs(self.setProp) do
		--计算新的百分比
		local oldMax = GetProConfigMaxValue(oldPropID, tabProp.dwPropertyType);
		local newMax = GetProConfigMaxValue(newPropID, tabProp.dwPropertyType);
		if newMax then
			tabProp.dwValue = math.floor(tabProp.dwValue * oldMax / newMax);--下取整，获得新的百分比
		else
			_err("CItemEquip:UpGradeNewProperty() Error!!!:", self:GetNextItem());
		end
	end
end;

--装备升阶
function CItemEquip:UpGrade()
	if self:GetNextItem() == 0 then
		return false;
	end
	
	self:UpGradeNewProperty();
	
	self.dwEnumID = self:GetNextItem();
	
	return true;
end;



--------------------------------------------
-------------计算装备属性加成---------------
--------------------------------------------

--获取天生属性加成
function CItemEquip:GetTianShengPercent()
	return 1 + self:GetTianSheng() / _G.IntensifyBornPropConfig.MaxIntensifyValue;
end;

--获取强化等级加成
function CItemEquip:GetStrongLevelPercent()
	return 1 + _G.EquipStrongConfig.CalculateStrong(self:GetLevel(), self:GetWearPos(), self:GetStrongLevel());
end;

--天生属性和强化属性加成
function CItemEquip:CalculateStrong(attrInfo)
	--天生属性加成系数
	local dwTianShengPercent = self:GetTianShengPercent()
	attrInfo:Multiply(dwTianShengPercent);
	--装备强化加成系数
	local dwStrongLevelPercent = self:GetStrongLevelPercent()
	attrInfo:Multiply(dwStrongLevelPercent);
end;

local ProTypeToKey = {
	[enPropertyType.eAttackPower]	= "dwAttack";
	[enPropertyType.eDefence]		= "dwDefense";
	[enPropertyType.eBaoJi] 		= "dwCrit";
	[enPropertyType.eShenFa]		= "dwFlee";
	[enPropertyType.eHPLimited] 	= "dwHPMax";
	[enPropertyType.eMPLimited] 	= "dwMPMax";
}
--装备附加属性加成
function CItemEquip:CalculateAppend(attrInfo)
	local tempAttrInfo = SSingleAttrChange:new();
	local dwPropID = self:GetPropertyID();
	for _, tabProp in ipairs(self.setProp) do
		local dwMax = GetProConfigMaxValue(dwPropID, tabProp.dwPropertyType);
		tempAttrInfo[ProTypeToKey[tabProp.dwPropertyType]] = tempAttrInfo[ProTypeToKey[tabProp.dwPropertyType]] + math.floor(tabProp.dwValue * dwMax / _G.AddAppendPropValueConfig.MaxAppendPropValue);
	end
	attrInfo:AddValue(tempAttrInfo);
end;


--获取装备属性加成
function CItemEquip:GetAddAttr()
	local attrInfo = SSingleAttrChange:new();
	--计算配置属性
	attrInfo.dwAttack		= self:GetAttack();		--攻击
	attrInfo.dwDefense		= self:GetDefense();	--防御
	attrInfo.dwFlee			= self:GetFlee();		--身法
	attrInfo.dwCrit			= self:GetCrit();		--暴击
	attrInfo.dwHPMax		= self:GetHPMax();		--生命max
	attrInfo.dwMPMax		= self:GetMPMax();		--内力max
	attrInfo.dwMoveSpeed	= self:GetMoveSpeed();	--移动速度
	attrInfo.dwAttackSpeed	= self:GetAttackSpeed();--攻击速度
	attrInfo.dwRemitAttack	= self:GetRemitAttack();--伤害减免
	--计算受天生和强化加成的基本属性
	self:CalculateStrong(attrInfo);
	--计算装备的附加属性
	self:CalculateAppend(attrInfo);

	return attrInfo;
end;

-----------------------------------------
------------原代码不得不保留的-----------
-----------------------------------------
--拷贝数据给网络信息结构
function CItemEquip:FillItemMessage(sItemMsg)
	sItemMsg.dwItemEnum	= self:GetEnumID();
	sItemMsg.dwItemID	= self:GetInstID();
	sItemMsg.dwRoleID	= self:GetRoleID();
	sItemMsg.dwItemNumber = self:GetCount();
	sItemMsg.dwHolder, sItemMsg.dwSlot = self:GetPosInfo();
	sItemMsg.dwBindType	= self:GetBindType();
	sItemMsg.dwBornTime	= self:GetBornTime();
	sItemMsg.dwLifeTime	= self:GetLifeTime();
	sItemMsg.sDoodle	= self:GetDoodle();
	
	sItemMsg.setProperty	= self:GetProperty();
	sItemMsg.dwStrongLevel	= self:GetStrongLevel();
	sItemMsg.dwTianSheng	= self:GetTianSheng();
end
--从网络数据结构中获取数据
function CItemEquip:FillByItemMessage(sItemMsg)
	self:SetInstID(sItemMsg.dwItemID);
	self:SetRoleID(sItemMsg.dwRoleID);
	self:SetCount(sItemMsg.dwItemNumber);
	self:SetPosInfo(sItemMsg.dwHolder, sItemMsg.dwSlot);
	self:SetBindType(sItemMsg.dwBindType);
	self:SetBornTime(sItemMsg.dwBornTime);
	self:SetLifeTime(sItemMsg.dwLifeTime);
	self:SetDoodle(sItemMsg.sDoodle);
	self:SetProperty(sItemMsg.setProperty);
	self:SetStrongLevel(sItemMsg.dwStrongLevel);
	self:SetTianSheng(sItemMsg.dwTianSheng);
end



