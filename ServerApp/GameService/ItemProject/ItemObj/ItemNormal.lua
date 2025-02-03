-------------------------------------
-------------------------------------
--普通道具类
--author lkj

_G.CItemNormal = {};
setmetatable(CItemNormal, {__index = CItemBase});

function CItemNormal:New(dwEnumID)
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
	
	setmetatable(obj, {__index = CItemNormal});
	
	return obj;
end;
--Copy
function CItemNormal:Copy(obj)	
	obj:SetBindType(self:GetBindType());
	obj:SetBornTime(self:GetBornTime());
	obj:SetLifeTime(self:GetLifeTime());
	obj:SetDoodle(self:GetDoodle());
	obj:SetCDTime(self:GetCDTime());
end;

--Get NetData
function CItemNormal:GetNetData()
	local data = {};

	data[1] = self:GetEnumID();
	data[2] = self:GetInstID();			--实例ID
	data[3] = self:GetRoleID();			--所有者的ID
	data[4] = self:GetCount();			--叠加个数
	data[5], data[6] = self:GetPosInfo();--位置信息
	data[7] = self:GetBindType();		--0表示未绑定；1表示绑定
	data[8] = self:GetBornTime();		--出生时间戳
	data[9] = self:GetLifeTime();		---1表示无时间限制
	data[10] = self:GetDoodle();		--签名
	
	return data;
end;
--Parse NetData
function CItemNormal:ParseNetData(data)
	self:SetInstID(data[2]);				--实例ID
	self:SetRoleID(data[3]);				--所有者的ID
	self:SetCount(data[4]);				--叠加个数
	self:SetPosInfo(data[5], data[6]);	--位置信息
	self:SetBindType(data[7]);			--0表示未绑定；1表示绑定
	self:SetBornTime(data[8]);			--出生时间戳
	self:SetLifeTime(data[9]);			-- -1表示无时间限制
	self:SetDoodle(data[10]);			--签名
end;

------------------------------------------------
---------------------GET接口---------------------
------------------------------------------------

--获取品质
function CItemNormal:GetQuality()
	return CGlobalItemManager:GetQuality(self.dwEnumID);
end;


----------------宝石属性--------------
----------------其他勿用--------------

--获取宝石属性加成
function CItemNormal:GetAddAttr()
	local attrInfo = SSingleAttrChange:new();
    --本级的往前找直到最低级
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

	return attrInfo;
end;

--获取装备的评分
function CItemNormal:GetScore()
	local score = 0;
	local sInfo = self:GetAddAttr();
	for k, v in pairs(sInfo) do
		if _G.EquipGradeConfig[k] then
			score = score + v * _G.EquipGradeConfig[k];
		end
	end
	return math.floor(score);
end

-----------------------------------------
------------原代码不得不保留的-----------
-----------------------------------------
--拷贝数据给网络信息结构
function CItemNormal:FillItemMessage(sItemMsg)
	sItemMsg.dwItemEnum	= self:GetEnumID();
	sItemMsg.dwItemID	= self:GetInstID();
	sItemMsg.dwRoleID	= self:GetRoleID();
	sItemMsg.dwItemNumber = self:GetCount();
	sItemMsg.dwHolder, sItemMsg.dwSlot = self:GetPosInfo();
	sItemMsg.dwBindType	= self:GetBindType();
	sItemMsg.dwBornTime	= self:GetBornTime();
	sItemMsg.dwLifeTime	= self:GetLifeTime();
	sItemMsg.sDoodle	= self:GetDoodle();
end
--从网络数据结构中获取数据
function CItemNormal:FillByItemMessage(sItemMsg)
	self:SetInstID(sItemMsg.dwItemID);
	self:SetRoleID(sItemMsg.dwRoleID);
	self:SetCount(sItemMsg.dwItemNumber);
	self:SetPosInfo(sItemMsg.dwHolder, sItemMsg.dwSlot);
	self:SetBindType(sItemMsg.dwBindType);
	self:SetBornTime(sItemMsg.dwBornTime);
	self:SetLifeTime(sItemMsg.dwLifeTime);
	self:SetDoodle(sItemMsg.sDoodle);
end




