------------------------------------
------------------------------------
--道具系统内部的接口文件
--author lkj



--用来查询删除指定容器中一定数量指定配置ID的道具的条件
----返回值1	拥有个数是否足够
----返回值2	如果不够差多少
function CItemSystem:CheckDelEnumItemInHolderCond(dwHolderClass, dwEnumID, dwDelNum)
	if (type(dwEnumID) ~= "number") or (type(dwDelNum) ~= "number") then
		_info("itemsystem param type error!!!");
		return false;
	end;
	if (not CGlobalItemManager:IsHaveThisItem(dwEnumID)) or (dwDelNum <= 0) then
		_info("itemsystem param type error!!!");
		return false;
	end;
	local bIsEnough	= true;
	local dwMinus	= 0;
	if dwDelNum and dwDelNum > 0 then
		local dwHaveNum, _, _ = self:GetEnumItemNumInHolder(dwHolderClass, dwEnumID);
		--拥有的是否足够
		bIsEnough	= (dwHaveNum >= dwDelNum);
		if not bIsEnough then
			dwMinus	= dwDelNum - dwHaveNum;
		end;
	end;
	return bIsEnough, dwMinus;
end;



--在指定容器中删除指定配置ID物品
--返回是否删除了绑定的
function CItemSystem:DelEnumItemInHolder(dwHolderClass, dwEnumID, dwNumber, bUseUnBindFirst, szType)
	local dwDelNum = dwNumber;
	local bUseBind = false;
	local setBindObjs, setUnBindObjs = self:GetEnumItemInstInHolder(dwHolderClass, dwEnumID);
	if bUseUnBindFirst then
		for _, objItem in ipairs(setUnBindObjs) do
			if not self:IsItemLocked(objItem:GetInstID()) then
				local dwCount = objItem:GetCount();
				if dwNumber >= dwCount then
					self:DoDelItem(objItem, szType)
					dwNumber = dwNumber - dwCount;
				else
					self:DoDelItemNum(objItem, dwNumber, szType);
					dwNumber = 0;
					break;
				end;
			end;
		end;
		if dwNumber > 0 then
			for _, objItem in ipairs(setBindObjs) do
				if not self:IsItemLocked(objItem:GetInstID()) then
					bUseBind = true;
					local dwCount = objItem:GetCount();
					if dwNumber >= dwCount then
						self:DoDelItem(objItem, szType)
						dwNumber = dwNumber - dwCount;
					else
						self:DoDelItemNum(objItem, dwNumber, szType);
						dwNumber = 0;
						break;
					end;
				end;
			end;
		end;
	else
		for _, objItem in ipairs(setBindObjs) do
			if not self:IsItemLocked(objItem:GetInstID()) then
				bUseBind = true;
				local dwCount = objItem:GetCount();
				if dwNumber >= dwCount then
					self:DoDelItem(objItem, szType)
					dwNumber = dwNumber - dwCount;
				else
					self:DoDelItemNum(objItem, dwNumber, szType);
					dwNumber = 0;
					break;
				end;
			end;
		end;
		if dwNumber > 0 then
			for _, objItem in ipairs(setUnBindObjs) do
				if not self:IsItemLocked(objItem:GetInstID()) then
					local dwCount = objItem:GetCount();
					if dwNumber >= dwCount then
						self:DoDelItem(objItem, szType)
						dwNumber = dwNumber - dwCount;
					else
						self:DoDelItemNum(objItem, dwNumber, szType);
						dwNumber = 0;
						break;
					end;
				end;
			end;
		end;
	end;
	
	--通知其它系统删除了某一个物品
	self:DoItemEvent("NotifyItemDelete", dwEnumID, dwDelNum);
    --记录日志
    local dwBindType = bUseBind and _G.enItemBindType.eYes or _G.enItemBindType.eNo;
    self:LogDelItem(dwEnumID, dwDelNum, szType, dwBindType);
	
	return bUseBind;
end;



--删除道具个数
function CItemSystem:DoDelItemNum(objItem, dwNumber, szType)
	objItem:DelNumber(dwNumber);
	self:OperUpd(objItem, _G.enItemUpdOper.eDel, {dwNumber}, szType);
end;



--删除一个道具实例
function CItemSystem:DoDelItem(objItem, szType)
	local dwHolderClass, _ = objItem:GetPosInfo()
	local holder = self:GetHolder(dwHolderClass);
	holder:DelItem(objItem);
	self.ItemList[objItem:GetInstID()] = nil;
	self:OperDel(objItem, szType);
end;



