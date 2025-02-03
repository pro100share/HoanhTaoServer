--[[
功能：阵法系统脚本
作者：魏云
时间：2013-10-28
--]]
_G.MatrixMethodScript = {};
--普通星配置表

function MatrixMethodScript:GetStarAllLevelExp()
	local AllLevelExp = {}
	local LevelExp1  = _G.MatrixMethodStarExp
	local Exp = _G.MatrixMethodParmConfig
	local Max = MatrixMethodMaxLevel
	AllLevelExp[1] = LevelExp1
	for i=2,Max do
		local bLevel = math.floor(i/10)+1
		if i%10 == 0 then
			bLevel = bLevel - 1
		end
		AllLevelExp[i] = AllLevelExp[i-1]+ Exp[bLevel].StartExp
	end
	for i=2,Max do
		AllLevelExp[i] = AllLevelExp[i]+ AllLevelExp[i-1]
	end
	return AllLevelExp
end
----根据等级获取隐元星的消耗信息
--参数 StarExp 类型：table
--StarExp= {[1]=1000}   [1]  1星；1000 经验
--返回  StarLevel 类型： table
--StarLevel={[1]={2,200,300}} [1] 1星；2级,200经验,300升级需要经验
function MatrixMethodScript:GetStarLevelByExp(StarExp) ----addStarExp要升的等级
	local StarLevel = {}
	local tempInfo = self:GetStarAllLevelExp();
	for k,v in pairs(StarExp) do
		StarLevel[k] = {}
		local level = 0
		for i = 1,#tempInfo do
			if(v < tempInfo[i])then
				level = i-1
				break
			elseif(v == tempInfo[i]) then
				level = i
				break
			end
		end
		local Exp1,Exp2 = 0,tempInfo[level+1]
		if level > 0 then
			if level == MatrixMethodMaxLevel then
				Exp2 = 0
			else
				Exp1 = tempInfo[level]
				Exp2 = tempInfo[level+1] - tempInfo[level] 
			end
		end
		StarLevel[k][1] = level
		StarLevel[k][2] = v-Exp1
		StarLevel[k][3] = Exp2
	end
	
	return StarLevel
end
---根据当前星星总经验获取当前星星等级
function MatrixMethodScript:GetCurStarCurLevel(curTotalExp)
	local tempInfo = self:GetStarAllLevelExp();
	for i = 1,#tempInfo do
		if(curTotalExp < tempInfo[i]) then
			return i-1;
		elseif(curTotalExp == tempInfo[i]) then
			return i;
		end
	end
	return nil;
end
-----根据物品ID获取星星经验
function MatrixMethodScript:GetOneStarAddExpByItem(itemID)
	return 100;
end
-- --隐元等级
-- --参数 ItemNum 目前提交总数量
-- --返回 HideLevel={2,200,300} [1] 1星；2级,200经验,300升级需要经验 
-- function MatrixMethodScript:GetHideLevelByItemNum(ItemNum) ----addStarExp要升的等级
	-- local HideLevel = {0,0,60};
	-- -- local b_ok = false
	-- -- for m,n in pairs(_G.MatrixMethodAddStarConInfoConfig) do
		-- -- if(ItemNum >= n.dwItemNum) then
			-- -- ItemNum = ItemNum - n.dwItemNum
		-- -- else
			-- -- HideLevel = m - 1;
			-- -- break;
		-- -- end
	-- -- end
	-- return HideLevel
-- end
----根据等级获取套装星的消耗信息
--返回 tbConInfo 类型：table {ItemID ,ItemNum} ItemID：物品ID，ItemNum:物品数量
function MatrixMethodScript:GetStarConInfoByLevel(addStarLevel) ----addStarLevel要升的等级
	local tempInfo ={ ItemID = 0,ItemNum = 0}
	for k,v in pairs(_G.MatrixMethodAddStarInfoConfig) do
		if(addStarLevel == k) then
			tempInfo.ItemID =  v.dwItemID;
			tempInfo.ItemNum = v.dwItemNum;
			break;
		end
	end
	return tempInfo
end
----根据不同星等级判断返回是否需要广播
--参数  StarLevel 类型： table
--StarLevel={[1]={2,200}} [1] 1星；2级,200经验
--返回 true 广播，false不广播
function MatrixMethodScript:GetISBroadByLevel(starIndex,starLevel,suitStarLevel,hideStarLevel,preLevel) ----addStarLevel要升的等级
	local b_result = false;
	if(starIndex and starLevel) then ---普通星星
		for k,v in pairs(_G.UpStarBroadCastConfig[1]) do
			if(starIndex == k) then
				for m,n in pairs(v) do
					if(starLevel == n) then
						b_result = true;
						break;
					elseif preLevel and (preLevel< n) and (starLevel> n)  then
						b_result = true;
						break;
					end
				end
				break;
			end
		end
		return b_result;
	end
	
	if(suitStarLevel) then ----套装星星
		for k,v in pairs(_G.UpStarBroadCastConfig[2]) do
			if(suitStarLevel == v) then
				b_result = true;
				break;
			end
		end	
		return b_result;
	end
	if(hideStarLevel) then
		for k,v in pairs(_G.UpStarBroadCastConfig[3]) do
			if(hideStarLevel == v) then
				b_result = true;
				break;
			end
		end	
		return b_result;
	end
	return false;
end
----隐元星等级
function MatrixMethodScript:GetCurHideSuitLevel(starLevelList)
	local level = starLevelList[1]
	for k,v in pairs(starLevelList) do
		if(level >= v) then
			level = v;
		end
	end
	local index = 0;
	local tempLevel = 0;
	for k,v in pairs(_G.HideStarUpLevelConfig) do
		if(level == v) then
			index = k;
			tempLevel = v;
			break
		elseif(level > v and tempLevel < v) then
			index = k;
			tempLevel = v;
		end
	end
	return index;
end
----套装星星的等级
function MatrixMethodScript:GetCurStarSuitLevel(starLevelList)
	local level = 0
	for k,v in pairs(starLevelList) do	
		level = v + level;
	end
	level = math.floor(level/#starLevelList)
	local index = 0;
	local tempLevel = 0;
	for k,v in pairs(_G.SuitStarUpLevelConfig) do
		if(level == v) then
			index = k;
			tempLevel = v;
			break
		elseif(level > v and tempLevel < v) then
			index = k;
			tempLevel = v;
		end
	end
	return index;
end
------获取手动拉杆消耗
--返回 tbConInfo 类型：table {ItemID ,ItemNum,GoldNum} ItemID：物品ID，ItemNum:物品数量 GoldNum:元宝数量 BindGold  礼金消耗数量
function MatrixMethodScript:GetConInfo()
	local tbConInfo = {ItemID=0,ItemNum=0,GoldNum = 0,BindGold = 0}
	tbConInfo.ItemID = _G.MatrixMethodConInfo.dwItemID;
	tbConInfo.ItemNum = _G.MatrixMethodConInfo.dwItemNum;
	tbConInfo.GoldNum = _G.MatrixMethodConInfo.dwGold;
	return tbConInfo
end
---获取斗转星移消耗
--返回 tbMovecon 类型：{ItemID ,ItemNum}ItemID：物品ID，ItemNum:物品数量
function MatrixMethodScript:GetMoveConInfo()
	local tbMoveCon = {ItemID=0,ItemNum=0}
	tbMoveCon.ItemID = _G.MatrixMethodStartMoveConInfo.dwItemID;
	tbMoveCon.ItemNum =  _G.MatrixMethodStartMoveConInfo.dwItemNum;
	return tbMoveCon
end
----根据等级获取普通星的属性加成
--参数 starIndex 类型Number 第几颗星
--参数  StarLevel 类型： Number
--StarAttr ={dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax= 100,dwMPMax= 0,dwMoveSpeed= 0,dwAttackSpeed= 0}  [1] 1星；后面各个属性
function MatrixMethodScript:GetAttrByLevel(starIndex,starLevel)
	local StarAttr = {}
	if starLevel == 0 then
		return{dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax= 0,dwCritDown= 0,dwPoJiaDiKang= 0,}
	end
	StarAttr[1] = MatrixMethodStarConfig[starIndex]
	local AttrAdd = _G.MatrixMethodParmConfig
	for i=2,starLevel do
		StarAttr[i] = {}
		local bLevel = math.floor(i/10)+1
		if i%10 == 0 then
			bLevel = bLevel - 1
		end
		local Attr2 = 0 
		for k,v in pairs(StarAttr[1]) do
			if v > 0 then
				StarAttr[i][k] = StarAttr[i-1][k]+ AttrAdd[bLevel][k]
			end
		end
	end
	return StarAttr[starLevel]
end

---根据等级获取星套装的属性加成
--返回 SuitAttr ={dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax= 100,dwMPMax= 0,dwMoveSpeed= 0,dwAttackSpeed= 0} 各个属性
function MatrixMethodScript:GetSuitAddAttr(SuitLevel)  ---- 星套装等级
	local SuitAttr = {dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax=0,dwCritDown= 0,dwPoJiaDiKang= 0,}
	for k,v in pairs(_G.MatrixMethodBasicStarSuitAttrConfig) do
		if(k == SuitLevel) then
			return v;
		end
	end
	return SuitAttr
end

-----获取套装特效
function MatrixMethodScript:GetSuitEffectIDByLevel(suitLevel)
	local effectID = 0;
	for k,v in pairs(_G.SuitStarEffectLevelConfig) do
		if(k == suitLevel) then
			effectID = v;
			break;
		end
	end
	return effectID;
end

---获取加成经验值
function MatrixMethodScript:GetMatrixMethodAddExp(starIndex,starTypeNum) -----starIndex星星的索引  starTypeNum 星星种类数
	local temp = 0;
	for k,v in pairs(_G.MatrixMethodRanderAddExpConfig) do
		if(k == starIndex) then
			temp = v[starTypeNum];
			break;
		end
	end
	return temp;
end
---获取随机星星后经验加成
function MatrixMethodScript:GetMatrixMethodRanderAddExp(sameNum,starIndex1,starIndex2,starIndex3) ---sameNum 星星相同总数，starIndex星星的索引
	local addexpInfo = {};
	if(sameNum == 3) then
		addexpInfo[1] = {};
		addexpInfo[1][1] = starIndex1;
		addexpInfo[1][2] = self:GetMatrixMethodAddExp(starIndex1,1)*sameNum
	elseif(sameNum == 2) then
		addexpInfo[1] = {};
		addexpInfo[1][1] = starIndex1;
		addexpInfo[1][2] = self:GetMatrixMethodAddExp(starIndex1,2)*sameNum
		addexpInfo[2] = {};
		addexpInfo[2][1] = starIndex2;
		addexpInfo[2][2] = self:GetMatrixMethodAddExp(starIndex2,3)
	elseif(sameNum == 1) then
		addexpInfo[1] = {};
		addexpInfo[1][1] = starIndex1;
		addexpInfo[1][2] = self:GetMatrixMethodAddExp(starIndex1,3)
		addexpInfo[2] = {};
		addexpInfo[2][1] = starIndex2;
		addexpInfo[2][2] = self:GetMatrixMethodAddExp(starIndex2,3)
		addexpInfo[3] = {};
		addexpInfo[3][1] = starIndex3;
		addexpInfo[3][2] = self:GetMatrixMethodAddExp(starIndex3,3)
	end
	return addexpInfo;
end
---获取权重总值
function MatrixMethodScript:GetMatrixMethodCountWeightValue(randerIndex,index,weightValueList) -----randerIndex 哪颗星星随机出来了，index 第几次随机 --weightValueList 最终权重表
	local dwMax = 0;
	local tempWeightInfo = {};
	for k,v in pairs(weightValueList) do
		if(randerIndex == k) then
			dwMax = dwMax + v[index];
			tempWeightInfo[k] = {};
			tempWeightInfo[k].weightValue = v[index];
		else
			dwMax = dwMax + v[1];
			tempWeightInfo[k] = {};
			tempWeightInfo[k].weightValue = v[1];
		end
	end
	return dwMax,tempWeightInfo;
end
---获取随机的那颗星星
function MatrixMethodScript:GetMatrixMethodStarValue(randerNum,weightValueList)
	if(randerNum > 3) then
		return;
	end
	local dwMax = 0;
	local tempWeightInfo = {};
	dwMax,tempWeightInfo = self:GetMatrixMethodCountWeightValue(0,0,weightValueList)
	local resInfo = {};
	for i = 1,randerNum do
		local dwRes = math.random(1,dwMax)
		local dwCur = 0;
		for k,v in pairs(tempWeightInfo) do
			dwCur = dwCur + v.weightValue
			if dwRes <= dwCur then
				resInfo[i] = k
				if(i+1 <= randerNum ) then
					dwMax,tempWeightInfo = self:GetMatrixMethodCountWeightValue(k,i+1,weightValueList)
				end
				break;
			end
		end
	end
	return resInfo;
end



