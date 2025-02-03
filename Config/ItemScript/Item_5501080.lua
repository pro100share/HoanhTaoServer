local dwItemId = 5501080
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--[[
	只重写需要重写的方法。
	比如：
		这个脚本需要有 CheckForUse 和 OnUseItem 方法，
		则只需重写这两个方法。
		另两个 OnGetItem OnDeleteItem不需要重写。
]]
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForUse(objItemSys, objItem)
	return 0;
end

--奖励包
local award = {
	-- 职业镰
	[1] = {
		{1104040,100},--装备配置ID,出现权重
		{1204040,100},--装备配置ID,出现权重
		{1214040,100},--装备配置ID,出现权重
		{1224040,100},--装备配置ID,出现权重
		{1234040,100},--装备配置ID,出现权重
		{1254040,100},--装备配置ID,出现权重
		{1400040,100},--装备配置ID,出现权重
		{1410040,100},--装备配置ID,出现权重
		{1420040,100},--装备配置ID,出现权重
		{1430040,100},--装备配置ID,出现权重
		{1440040,100},--装备配置ID,出现权重
		{1450040,100},--装备配置ID,出现权重
	};
	-- 职业2刀
	[2] = {
		{1102040,100},--装备配置ID,出现权重
		{1202040,100},--装备配置ID,出现权重
		{1212040,100},--装备配置ID,出现权重
		{1222040,100},--装备配置ID,出现权重
		{1232040,100},--装备配置ID,出现权重
		{1252040,100},--装备配置ID,出现权重
		{1400040,100},--装备配置ID,出现权重
		{1410040,100},--装备配置ID,出现权重
		{1420040,100},--装备配置ID,出现权重
		{1430040,100},--装备配置ID,出现权重
		{1440040,100},--装备配置ID,出现权重
		{1450040,100},--装备配置ID,出现权重

	};
	-- 职业3剑
	[3] = {
		{1101040,100},--装备配置ID,出现权重
		{1201040,100},--装备配置ID,出现权重
		{1211040,100},--装备配置ID,出现权重
		{1221040,100},--装备配置ID,出现权重
		{1231040,100},--装备配置ID,出现权重
		{1251040,100},--装备配置ID,出现权重
		{1400040,100},--装备配置ID,出现权重
		{1410040,100},--装备配置ID,出现权重
		{1420040,100},--装备配置ID,出现权重
		{1430040,100},--装备配置ID,出现权重
		{1440040,100},--装备配置ID,出现权重
		{1450040,100},--装备配置ID,出现权重

	};
	-- 职业4枪
	[4] = {
		{1103040,100},--装备配置ID,出现权重
		{1203040,100},--装备配置ID,出现权重
		{1213040,100},--装备配置ID,出现权重
		{1223040,100},--装备配置ID,出现权重
		{1233040,100},--装备配置ID,出现权重
		{1253040,100},--装备配置ID,出现权重
		{1400040,100},--装备配置ID,出现权重
		{1410040,100},--装备配置ID,出现权重
		{1420040,100},--装备配置ID,出现权重
		{1430040,100},--装备配置ID,出现权重
		{1440040,100},--装备配置ID,出现权重
		{1450040,100},--装备配置ID,出现权重
	};
};


--重置附加属性出现几条条数权值
local PropNumProbability = {
	[1] = 0,--1条
	[2] = 0,--2条
	[3] = 0,--3条
	[4] = 0,--4条
	[5] = 250,--5条
	[6] = 750,--6条
};

--出现何种类型属性权值
local PropTypeProbability = {
	[1] = 120,--攻击力
	[2] = 120,--防御
	[3] = 190,--身法
	[4] = 190,--暴击
	[5] = 190,--加生命值上限
	[6] = 190,--加蓝上限
};

--出现何种类型权值衰减度
local PropTypeAttenuation = function(appearTime)
	return 1- (0.05 * appearTime);
end;

--初始百分比加成区间
local PropValueInit = {
	dwMin = 200000,
	dwMax = 300000,
};


--强化等级权重
local StrongLevelProbability = {
	[0] = 0;
	[1] = 0;
	[2] = 0;
	[3] = 600;
	[4] = 250;
	[5] = 100;
	[6] = 50;
	[7] = 0;
	[8] = 0;
	[9] = 0;
	[10] = 0;
	[11] = 0;
	[12] = 0;
	[13] = 0;
	[14] = 0;
	[15] = 0;
};

--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	--算出是否背包是否有空位
	if not objItemSys:IsPacketSlotEnoughFor(1) then return 9000110010 end;
	--玩家对象
	local objPlayer = objItemSys:GetPlayer();
	--职业
	local dwProf = objPlayer:GetProf();
	
	--算出奖励装备
	----奖励装备包
	local awardTable = award[dwProf];
	----没有配对应职业奖励包,不删除玩家道具
	if not awardTable then return 0 end;
	----奖励装备包中装备个数
	local equipNum = #awardTable;
	----个数为0,配置错误，不删除玩家道具
	if equipNum == 0 then return 0 end;
	----所有装备出现权重和
	local totalWeight1 = 0;
	for i=1, equipNum do
		totalWeight1 = totalWeight1 + (awardTable[i][2] or 1);
	end;
	----默认出现装备下标
	local index = 1;
	----随机[1, totalWeight1],判断权重区间
	local rand1 = math.random(1, totalWeight1);
	----根据权重算出出现装备下标
	for i=1, equipNum do
		totalWeight1 = totalWeight1 - (awardTable[i][2] or 1);
		if rand1 > totalWeight1 then
			index = i;
			break;
		end;
	end;
	----算出装备ID
	local equipID = awardTable[index][1];
	----配置错误，不删除玩家道具
	if not equipID then return 0 end;
	----配置错误，不删除玩家道具
	if not CGlobalItemManager:IsHaveThisItem(equipID) then return 0 end;
	
	--算出附加属性
	----附加属性表
	local appendProp = {};
	----出现条数权重总和
	local totalWeight2 = 0;
	for k, v in pairs(PropNumProbability) do
		totalWeight2 = totalWeight2 + v;
	end;
	----随机[1, totalWeight2],判断权重区间
	local rand2 = math.random(1, totalWeight2);
	----根据权重算出出现几条附加属性
	local propNum = 1;
	for k, v in pairs(PropNumProbability) do
		totalWeight2 = totalWeight2 - v;
		if rand2 > totalWeight2 then
			propNum = k;
			break;
		end;
	end;
	----计算出现何种类型的附加属性和数值
	------记录每种类型附加属性出现次数
	local appearance = {
		[1] = 0;
		[2] = 0;
		[3] = 0;
		[4] = 0;
		[5] = 0;
		[6] = 0;
	};
	------权重衰减的新权重表
	local newPropTypeProbability = {};
	------权重总和
	local totalWeight3 = 0;
	------随机[1, totalWeight3]
	local rand3 = 0;
	for i=1, propNum do
		--根据类型出现次数运算出下次出现何种类型属性权重表
		for k, v in pairs(PropTypeProbability) do
			newPropTypeProbability[k] = math.ceil(v * PropTypeAttenuation(appearance[k]));
		end;
		totalWeight3 = 0;
		for k, v in pairs(newPropTypeProbability) do
			totalWeight3 = totalWeight3 + v ;
		end;
		rand3 = math.random(1, totalWeight3);
		local propType = 0;
		for k, v in pairs(newPropTypeProbability) do
			totalWeight3 = totalWeight3 - v;
			if rand3 > totalWeight3 then
				propType = k;
				appearance[propType] = appearance[propType] + 1;
				break;
			end;
		end;
		local baseValue = math.floor((_G.EquipAppendConfig[CGlobalItemManager:GetPropertyID(equipID)][_G.EquipAppendTypeNumToStrConfig[propType].dwMin] / _G.EquipAppendConfig[CGlobalItemManager:GetPropertyID(equipID)][_G.EquipAppendTypeNumToStrConfig[propType].dwMax]) * 1000000);
		local propValue = baseValue + math.random(PropValueInit.dwMin, PropValueInit.dwMax);
		appendProp[i] = {dwPropertyType = propType, dwValue = propValue};
	end;
	
	--算出强化等级
	local strongLevel = 0;
	local totalWeight4 = 0;
	for k, v in pairs(StrongLevelProbability) do
		totalWeight4 = totalWeight4 + v;
	end;
	local rand4 = math.random(1, totalWeight4);
	for k, v in pairs(StrongLevelProbability) do
		totalWeight4 = totalWeight4 - v;
		if rand4 > totalWeight4 then
			strongLevel = k;
			break;
		end;
	end;
	
	--增加道具
	local setAddList = {
		[1] = {
			dwItemEnum = equipID,
			dwItemNumber = 1,
			dwBindType = _G.enItemBindType.eYes,
			setProperty = appendProp,
			dwStrongLevel = strongLevel;
		};
	};
	if not objItemSys:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.Used, true) then
		return 0;
	end;
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 