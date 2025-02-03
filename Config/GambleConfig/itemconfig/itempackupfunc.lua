--整理的排序函数

--排序算法，本地函数，从小到大
local function FuncSortItem(a,b)
	if a.dwItemEnum == b.dwItemEnum then	--判断物品的配置ID
		if a.dwBindType == b.dwBindType then--判断物品的绑定类型
			if a.dwCount == b.dwCount then
				return a.dwItemID < b.dwItemID;
			else
				return a.dwCount > b.dwCount;--判断物品的数量
			end
		else
			return a.dwBindType < b.dwBindType;
		end
	else
		--不同的物品首先按照大类从小到大来排序，相同的大类中按照子类从小到大来排序
		local dwAPType = CGlobalItemManager:GetParentType(a.dwItemEnum);
		local dwBPType = CGlobalItemManager:GetParentType(b.dwItemEnum);
		
		if dwAPType == dwBPType then
			local dwACType = CGlobalItemManager:GetChildType(a.dwItemEnum);
			local dwBCType = CGlobalItemManager:GetChildType(b.dwItemEnum);
			
			if dwACType == dwBCType then
				local dwARNeed = CGlobalItemManager:GetRoleNeeded(a.dwItemEnum);
				local dwBRNeed = CGlobalItemManager:GetRoleNeeded(b.dwItemEnum);
				
				--子类的内部按照角色需求从小到大排序
				if dwARNeed == dwBRNeed then	
					--最后按照配置ID来排序
					return a.dwItemEnum < b.dwItemEnum;
				else
					return dwARNeed < dwBRNeed;
				end
			else
				return dwACType < dwBCType;
			end
		else
			return dwAPType < dwBPType;
		end
	end
end

--获取objItem排序所需的info
local function FuncGetItemSortInfo(objItem)
	local objInfo = {}--CItemSortInfo:new();
	objInfo.dwItemID = objItem:GetInstID();
	objInfo.dwItemEnum = objItem:GetEnumID();
	objInfo.dwBindType = objItem:GetBindType();
	local temp;
	temp,objInfo.dwPos = objItem:GetPosInfo();
	objInfo.isFull = nil;
	if objItem:IsEquip() then
		objInfo.dwCount = objItem:GetEndure();
		objInfo.isFull = true;
	else
		objInfo.dwCount = objItem:GetCount();
	end
	objInfo.isNeedDel = nil;
	
	return objInfo;
end;

--计算合并后的数量
local function FuncSetInfoCount(setInfoList,tbIDList)
	local dwAllCount = 0;
	local dwMaxRepeat = 0;
	
	for _,id in pairs(tbIDList)do
		dwAllCount = dwAllCount + setInfoList[id].dwCount;
		
		dwMaxRepeat = CGlobalItemManager:GetMaxRepeat(setInfoList[id].dwItemEnum);
	end
	
	for _,id in pairs(tbIDList)do
		local dwUsed = 0;
		
		if dwAllCount > dwMaxRepeat then
			dwUsed = dwMaxRepeat;
			setInfoList[id].isFull = true;
		else
			dwUsed = dwAllCount;
			setInfoList[id].isFull = false;
		end
		setInfoList[id].dwCount = dwUsed;
		
		if dwUsed == 0 then
			setInfoList[id].isNeedDel = true;
		end
		
		dwAllCount = dwAllCount - dwUsed;
	end
end;

--setItemList：id--物品obj列表
--返回操作序列
function _G.SortHolderItem(setItemList)
	--返回的操作序列
	local tbRslOpeList = {
		[_G.enItemSysOper.eUpd] = {};
		[_G.enItemSysOper.eDel] = {};
	};
	
	--objItem被转为info结构
	local setSortInfoList = {};
	for id,objItem in pairs(setItemList)do
		setSortInfoList[id] = FuncGetItemSortInfo(objItem);
	end
	
	--不满的Item对象
	local tbNotFullItemList = {};
	--首先筛选中不满的对象，进行合并
	for id,objItem in pairs(setItemList)do
		if objItem:CanAddHowMany() > 0 then
			local dwEnum = objItem:GetEnumID();
			local dwBind = objItem:GetBindType();
			local dwKey = dwEnum * 10 + dwBind;
			
			tbNotFullItemList[dwKey] = tbNotFullItemList[dwKey] or {};
			table.insert(tbNotFullItemList[dwKey],id);
			
			setSortInfoList[id].isFull = false;
		else
			setSortInfoList[id].isFull = true;
		end
	end
	
	for key,tbList in pairs(tbNotFullItemList)do
		FuncSetInfoCount(setSortInfoList,tbList);
	end
	
	--参与排序的Info
	local tbInfoInSort = {};
	for id,info in pairs(setSortInfoList)do
		if not info.isNeedDel then
			table.insert(tbInfoInSort,info);
		end
	end
	--排序
	table.sort(tbInfoInSort,FuncSortItem);
	--设置位置
	for n,info in pairs(tbInfoInSort)do
		setSortInfoList[info.dwItemID].dwPos = n;
	end
	
	-- print("=====sort result begin=====")
	-- for id,info in pairs(setSortInfoList)do
		-- print("=====item id 1====",id)
		-- for n,v in pairs(info)do
			-- print("====item info====",n,v)
		-- end
		-- print("=====item id 0====",id)
	-- end
	-- print("=====sort result end=====")
	--与原始数据对比，生成操作序列
	for id,objItem in pairs(setItemList)do
		local tbAftInfo = setSortInfoList[id];
		--因为做排序的时候，装备的Count是耐久，这里要改成1
		if objItem:IsEquip() then
			tbAftInfo.dwCount = 1;
		end
		
		if tbAftInfo.dwCount == 0 then
			local t = {
				[1] = objItem:GetInstID();
			};
			table.insert(tbRslOpeList[_G.enItemSysOper.eDel], t);
		else
			local dwNum = objItem:GetCount();
			if tbAftInfo.dwCount > dwNum then
				local t = {
					[1] = objItem:GetInstID();
					[2] = enItemUpdOper.eAdd;
					[3] = {tbAftInfo.dwCount - dwNum};
				};
				table.insert(tbRslOpeList[_G.enItemSysOper.eUpd], t);
			elseif tbAftInfo.dwCount < dwNum then
				local t = {
					[1] = objItem:GetInstID();
					[2] = enItemUpdOper.eDel;
					[3] = {dwNum - tbAftInfo.dwCount};
				};
				table.insert(tbRslOpeList[_G.enItemSysOper.eUpd], t);
			end
			
			local dwType,dwPos = objItem:GetPosInfo();
			if tbAftInfo.dwPos ~= dwPos then
				local t = {
					[1] = objItem:GetInstID();
					[2] = enItemUpdOper.ePosn;
					[3] = {dwType,tbAftInfo.dwPos};
				};
				table.insert(tbRslOpeList[_G.enItemSysOper.eUpd], t);
			end
		end
	end
	
	return tbRslOpeList;
end;
