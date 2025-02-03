--[[
    [\brief 修炼金身公用函数
    [\author 李中昌, 裴雪阳
    [\date 2014-7-1
    [客户端和服务器公用函数，实现配置文件读取和计算
  ]]

--[[
    [\brief 获取级别
    [\param number nEXP 修炼值
    [\return number 级别
    [\return number 本级别的经验
  ]]
function GoldenBodyConfig:GetLevel(nExp)
    for i = #self.DanList, 1, -1 do
		if nExp >= self.DanList[i].nMaxEXP then
			return i, nExp - self.DanList[i].nMaxEXP;
		end
	end
end

--[[
    [\brief 获取等阶
    [\param number nEXP 经验值
    [\return number nGrade 等阶
    [\return number nLevel  本阶的等级
    [\return number nRetExp 本级的经验	
  ]]
function GoldenBodyConfig:GetGradeAndLevel(nExp)
    local nLevel, nRetExp = GoldenBodyConfig:GetLevel(nExp);
    local nGrade = math.floor((nLevel - 1) / self.nNeiDanCount) + 1;
    local nLevel = nLevel - (nGrade - 1) * self.nNeiDanCount;
    return nGrade, nLevel, nRetExp;
end

--[[
    [\brief 根据等级获取增加的总属性
    [\param number nLevel 等级
    [\return table  tAttr 总属性	
  ]]
function GoldenBodyConfig:GetAttrByLevel(nLevel)
	local oAttrInfo = SSingleAttrChange:new();
	if nLevel < 1 or nLevel > #self.DanList then
		_err("GoldenBodyConfig:GetSingleSysAttr nLevel err")
		return oAttrInfo;
	end
	
	--for i = 1, nLevel do
		for attrType, attrValue in pairs(self.DanList[nLevel].Attr) do
			if oAttrInfo[attrType] then
				oAttrInfo[attrType] = oAttrInfo[attrType] + attrValue;
			end
		end
	--end
	
	return oAttrInfo;
end

--[[
    [\brief 获取天官赐福成功率
    [\param number nExp 经验
　[\param number nTGCFValue 天官赐福值
    [\return number nRate 天官赐福成功率
  ]]
function GoldenBodyConfig:SuccessRate(nExp,nTGCFValue)
	local tBlessCfg = self.BlessList[self:GetGradeAndLevel(nExp)];
	if not tBlessCfg then return 0 end;
	
	local nRate = tBlessCfg.nRate * 1000;

	if nTGCFValue <= tBlessCfg.tRange.nFloor then
		nRate = 0;
	end

	if nTGCFValue >= tBlessCfg.tRange.nCeil then
		nRate = 10000;
	end
	
	return nRate;
end 
 
--[[
    [\brief 判断当前等级是否需要广播 
    [\param number nLevel 等级
    [\param boolean 是需要广播
  ]]
function GoldenBodyConfig:Boardcast(nLevel)
	for k, v in pairs(self.BoardcastLevel) do
		if nLevel == v then
			return true;
		end
	end
	return false;
end
  
  
  
