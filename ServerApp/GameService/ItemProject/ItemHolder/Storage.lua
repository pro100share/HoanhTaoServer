
--玩家的仓库
_G.CStorage = {};
setmetatable(CStorage, {__index = CItemBaseHolder});

--构造函数
function CStorage:New(dwHolderClass)
	local obj = {};
	
	--变量
	----容器类型
	obj.dwHolderClass = dwHolderClass;
	
	----栏位数
	obj.dwSlotNum	= 0;
	----空栏位数
	obj.dwEmpSlotNum = 0;
	
	----银两
	obj.dwMoney		= 0;

	
	--需维护的表
	----位置对应道具ID表
	obj.setSlotToItemID		= {};
	----配置ID对应道具ID表
	obj.setEnumIDToItemID	= {};
	
	setmetatable(obj, {__index = CStorage});
	
	return obj;
end



--设置数据
function CStorage:SetData(dwSlotNum, dwMoney)
	self.dwSlotNum		= dwSlotNum;
	self.dwMoney		= dwMoney;
	
	self.dwEmpSlotNum	= self.dwSlotNum;
	
	for i=1, self.dwSlotNum do
		self.setSlotToItemID[i] = 0;
	end;
end;

--取得数据
function CStorage:GetData()
	return self.dwSlotNum, self.dwMoney;
end;




--仓库是否能够扩展
function CStorage:IsCanExtend()
	if self:GetSlotNum() < _G.InitConfig.dwMaxAllStorageSlotNum then
		return true;
	else
		return false;
	end;
end;

--仓库增加栏位
function CStorage:AddSlotNum(dwSlotNum)
	for i = self.dwSlotNum + 1, self.dwSlotNum + dwSlotNum do
		self.setSlotToItemID[i] = 0;
	end;
	self.dwSlotNum = self.dwSlotNum + dwSlotNum;
	self.dwEmpSlotNum = self.dwEmpSlotNum + dwSlotNum;
end;



--获取仓库金钱
function CStorage:GetMoney()
	return self.dwMoney;
end

--更新仓库金钱
function CStorage:UpdateMoney(dwValue)
	self.dwMoney = self.dwMoney + dwValue;
end







