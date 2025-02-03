------------------------------------
------------------------------------
--道具工厂和道具基类
--author lkj

--Item工厂
_G.CItem = {};

function CItem:New(dwEnumID)
	if CGlobalItemManager:IsEquip(dwEnumID) then
		return CItemEquip:New(dwEnumID);
	else
		return CItemNormal:New(dwEnumID);
	end;
end;



--Item基类，使用继承实现不同类型的Item
_G.CItemBase = {};

------------------------------------------------
---------------------IS接口---------------------
------------------------------------------------

--是否是装备
function CItemBase:IsEquip()
	return CGlobalItemManager:IsEquip(self:GetEnumID());
end;

--是否是绑定
function CItemBase:IsBind()
	return self.dwBindType == _G.enItemBindType.eYes;
end;

--是否可以出售
function CItemBase:IsCanSell()
	return CGlobalItemManager:IsCanSell(self:GetEnumID());
end;

--是否是永久物品
function CItemBase:IsForever()
	return self:GetLifeTime() == -1;
end;

--是否有效生命周期内
function CItemBase:IsAlive()
	if self:IsForever() then
		return true;
	else
		return (self:GetBornTime() + self:GetLifeTime()) > GetCurTime()
	end;
end;

--是否CD
function CItemBase:IsInCD()
	--如果dwCDTime配置为0，则直接返回false，没有CD
	if self:GetConfigCDTime() == 0 then
		return false;
	else
		return GetCurTime() < self:GetCDTime();
	end;
end

------------------------------------------------
---------------------GET接口---------------------
------------------------------------------------

--获取配置ID
function CItemBase:GetEnumID()
	return self.dwEnumID;
end;

--获取实例ID
function CItemBase:GetInstID()
	return self.dwItemID;
end;

--获取绑定类型
function CItemBase:GetBindType()
	return self.dwBindType;
end;

--获取所属玩家RoleID
function CItemBase:GetRoleID()
	return self.dwRoleID;
end;

--获取Doodle信息
function CItemBase:GetDoodle()
	return self.strDoodle;
end;

--获取生命时间
function CItemBase:GetLifeTime()
	return self.dwLifeTime;
end;

--获取出生时间
function CItemBase:GetBornTime()
	return self.dwBornTime;
end;

--获取个数
function CItemBase:GetCount()
	return self.dwCount;
end;

--获取容器位置
function CItemBase:GetPosInfo()
	return self.dwHolder, self.dwSlot;
end;

--获取数据库中容器存储表示
function CItemBase:GetDBPosInfo()
	return self.dwHolder * 10000 + self.dwSlot;
end;

--获取CD时间
function CItemBase:GetCDTime()
	return self.dwCDTime;
end;

--获取脚本
function CItemBase:GetScript()
	return CGlobalItemManager:GetScript(self:GetEnumID());
end;

--获取等阶
function CItemBase:GetLevel()
	return CGlobalItemManager:GetLevel(self:GetEnumID());
end;

--获取父类型
function CItemBase:GetParentType()
	return CGlobalItemManager:GetParentType(self:GetEnumID());
end;

--获取子类型
function CItemBase:GetChildType()
	return CGlobalItemManager:GetChildType(self:GetEnumID());
end;

--获取角色需求
function CItemBase:GetRoleNeeded()
	return CGlobalItemManager:GetRoleNeeded(self:GetEnumID());
end;

--获取等级需求
function CItemBase:GetLevelNeeded()
	return CGlobalItemManager:GetLevelNeeded(self:GetEnumID());
end;

--获取最大堆叠数量
function CItemBase:GetMaxRepeat()
	return CGlobalItemManager:GetMaxRepeat(self:GetEnumID());
end;

--获取下一阶ID
function CItemBase:GetNextItem()
	return CGlobalItemManager:GetNextItem(self:GetEnumID());
end;

--获取道具名称
function CItemBase:GetName()
	return CGlobalItemManager:GetName(self:GetEnumID());
end;

--获取配置CD时间
function CItemBase:GetConfigCDTime()
	return CGlobalItemManager:GetCDTime(self:GetEnumID());
end;

--获取CD周期
function CItemBase:GetCDType()
	return CGlobalItemManager:GetCDType(self:GetEnumID());
end;

--获取攻击
function CItemBase:GetAttack()
	return CGlobalItemManager:GetAttack(self:GetEnumID());
end;

--获取防御力
function CItemBase:GetDefense()
	return CGlobalItemManager:GetDefense(self:GetEnumID());
end;

--获取暴击
function CItemBase:GetCrit()
	return CGlobalItemManager:GetCrit(self:GetEnumID());
end;

--获取身法
function CItemBase:GetFlee()
	return CGlobalItemManager:GetFlee(self:GetEnumID());
end;

--获取攻击速度
function CItemBase:GetAttackSpeed()
	return CGlobalItemManager:GetAttackSpeed(self:GetEnumID());
end;

--获取移动速度
function CItemBase:GetMoveSpeed()
	return CGlobalItemManager:GetMoveSpeed(self:GetEnumID());
end;

--获取生命值上限 
function CItemBase:GetHPMax()
	return CGlobalItemManager:GetHPMax(self:GetEnumID());
end;

--获取内力上限
function CItemBase:GetMPMax()
	return CGlobalItemManager:GetMPMax(self:GetEnumID());
end;

--获取伤害减免
function CItemBase:GetRemitAttack()
	return CGlobalItemManager:GetRemitAttack(self:GetEnumID());
end;

--获取评分
function CItemBase:GetScore()
	local score = 0;
	local sInfo = self:GetAddAttr();
	for k, v in pairs(sInfo) do
		if _G.EquipGradeConfig[k] then
			score = score + v * _G.EquipGradeConfig[k];
		end
	end
	return math.floor(score);
end
------------------------------------------------
--------------------SET接口---------------------
------------------------------------------------
--设置绑定类型
function CItemBase:SetBindType(dwBindType)
	self.dwBindType = dwBindType;
end;

--设置绑定
function CItemBase:Bind()
	self:SetBindType(_G.enItemBindType.eYes);
end;

--设置实例ID
function CItemBase:SetInstID(dwItemID)
	self.dwItemID = dwItemID;
end;

--设置拥有者ID
function CItemBase:SetRoleID(dwRoleID)
	self.dwRoleID = dwRoleID;
end;

--设置Doodle信息
function CItemBase:SetDoodle(str)
	self.strDoodle = str;
end;

--设置生命时间
function CItemBase:SetLifeTime(dwTime)
	self.dwLifeTime = dwTime;
end;

--设置出生时间
function CItemBase:SetBornTime(dwTime)
	self.dwBornTime = dwTime;
end;

--设置个数
function CItemBase:SetCount(dwCount)
	self.dwCount = dwCount;
end;

--设置位置信息
function CItemBase:SetPosInfo(dwHolder, dwSlot)
	self.dwHolder	= dwHolder;
	self.dwSlot		= dwSlot;
end;

--设置CD时间
function CItemBase:SetCDTime(dwNowTime)
	self.dwCDTime = dwNowTime + self:GetConfigCDTime();
end;




------------------------------------------------
-------------------合并接口---------------------
------------------------------------------------

--判断道具是否能够与传入配置合并，返回能够合并的个数
function CItemBase:CanMergeHowMany(dwEnumID, dwBindType, dwLifeTime, dwBornTime)
	--不同种类的物品不可合并
	if self:GetEnumID() ~= dwEnumID then
		return 0;
	end
	--叠加为1的物品不可合并
	if self:GetMaxRepeat() == 1 then
		return 0;
	end;
	--绑定类型不同的物品不可以叠加
	if self:GetBindType() ~= dwBindType then
		return 0;
	end;
	--生命时长不是同一类型的不可以合并
	if self:GetLifeTime() ~= dwLifeTime then
		return 0;
	end
	--生命时长不是-1永久存在的物品，就要查看他们的出生时间是否相同
	if (not self:IsForever()) and self.dwBornTime ~= dwBornTime then
		return 0;
	end
	
	return self:GetMaxRepeat() - self:GetCount();
end;
--判断道具能否与传入道具对象合并，返回能够合并的个数
function CItemBase:CanMergeObjHowMany(objItem)
	return self:CanMergeHowMany(objItem:GetEnumID(), objItem:GetBindType(), objItem:GetLifeTime(), objItem:GetBornTime());
end;



------------------------------------------------
----------------改变数量接口--------------------
------------------------------------------------

--可以增加多少
function CItemBase:CanAddHowMany()
	if self.dwLifeTime ~= -1 then
		return 0;
	end
	return self:GetMaxRepeat() - self:GetCount();
end;

--尝试添加物品数量，并返回变化值
function CItemBase:AddNumber(dwNumber)
	self:SetCount(self:GetCount() + dwNumber);
end;

--减少物品数量
function CItemBase:DelNumber(dwNumber)
	self:SetCount(self:GetCount() - dwNumber);
end;








-----------------------------------------
------------原代码不得不保留的-----------
-----------------------------------------
_G.SItemMessage = {};
function SItemMessage:new( oobj )
	local obj = oobj or {};
	--obj.dwItemID = 0;			--记录物品的ID
	--obj.dwRoleID = 0;			--记录物品所属角色的ID
	--obj.dwHolder = 0;			--代码约定的物品位置信息，仓库、背包等
	--obj.dwSlot = 0;				--物品所属仓库或背包的分页数--物品在背包中当前页的顺序，左右、上下数	
	obj.dwItemEnum = 0;			--代码约定的具体物品的枚举，物品类型
	obj.dwItemNumber = 0;		--物品的数量，从1到最大值（代码约定）
	obj.dwBindType = 0;			--代码约定的物品绑定类型
	obj.setProperty = {};		--物品的附加属性Type和value，格式：{ [1] = { dwPropertyType, dwValue }  }
	obj.dwStrongLevel = 0;
	obj.dwTianSheng = 0;		--天生属性信息
	--obj.dwBornTime = 0;			--物品出生的时间
	obj.dwLifeTime = 0;			--物品生命的最大时间
	obj.sDoodle	= "";
	return obj;
end







