-- [[
	-- 宠物洗练配置
	-- 时间：2014-1-13
-- ]]
-- 内力，攻击，防御，身法，暴击
local warli = { dwMPMax = 0.25,dwAttack = 1.2, dwDefense = 1,dwFlee = 2,dwCrit = 2.5};
--
local num = {1,1,2,2,3,3,4,4,5,5,};
local zhuanhuan = {
	dwMPMax = "内力:",
	dwAttack = "攻击:",
	dwDefense = "防御:",
	dwFlee = "身法:",
	dwCrit = "暴击:",
};
_G.PetWashConfig = {
	--宠物洗练系统开放等级 （此为宠物等级）
	OpenLevel = 1;
	
	--每一重洗练增加的属性(此为累加属性 即总属性，客户端显示当前属性需要调用其他函数)
	AddAttr = {
		[50710015]= {
			[1]= {dwAttack=100,dwDefense=50,dwFlee=25,dwCrit=30,dwMPMax=20,};
			[2]= {dwAttack=400,dwDefense=200,dwFlee=100,dwCrit=120,dwMPMax=80,};
			[3]= {dwAttack=1000,dwDefense=500,dwFlee=250,dwCrit=300,dwMPMax=200,};
			[4]= {dwAttack=2000,dwDefense=1000,dwFlee=500,dwCrit=600,dwMPMax=400,};
			[5]= {dwAttack=3500,dwDefense=1750,dwFlee=875,dwCrit=1050,dwMPMax=700,};
			[6]= {dwAttack=5600,dwDefense=2800,dwFlee=1400,dwCrit=1680,dwMPMax=1120,};
			[7]= {dwAttack=8400,dwDefense=4200,dwFlee=2100,dwCrit=2520,dwMPMax=1680,};
			[8]= {dwAttack=12000,dwDefense=6000,dwFlee=3000,dwCrit=3600,dwMPMax=2400,};
			[9]= {dwAttack=16500,dwDefense=8250,dwFlee=4125,dwCrit=4950,dwMPMax=3300,};
			[10]= {dwAttack=22000,dwDefense=11000,dwFlee=5500,dwCrit=6600,dwMPMax=4400,};
		};
		[10021030]= {
			[1]= {dwAttack=120,dwDefense=60,dwFlee=30,dwCrit=36,dwMPMax=24,};
			[2]= {dwAttack=480,dwDefense=240,dwFlee=120,dwCrit=144,dwMPMax=96,};
			[3]= {dwAttack=1200,dwDefense=600,dwFlee=300,dwCrit=360,dwMPMax=240,};
			[4]= {dwAttack=2400,dwDefense=1200,dwFlee=600,dwCrit=720,dwMPMax=480,};
			[5]= {dwAttack=4200,dwDefense=2100,dwFlee=1050,dwCrit=1260,dwMPMax=840,};
			[6]= {dwAttack=6720,dwDefense=3360,dwFlee=1680,dwCrit=2016,dwMPMax=1344,};
			[7]= {dwAttack=10080,dwDefense=5040,dwFlee=2520,dwCrit=3024,dwMPMax=2016,};
			[8]= {dwAttack=14400,dwDefense=7200,dwFlee=3600,dwCrit=4320,dwMPMax=2880,};
			[9]= {dwAttack=19800,dwDefense=9900,dwFlee=4950,dwCrit=5940,dwMPMax=3960,};
			[10]= {dwAttack=26400,dwDefense=13200,dwFlee=6600,dwCrit=7920,dwMPMax=5280,};
		};
		[10021015]= {
			[1]= {dwAttack=140,dwDefense=70,dwFlee=35,dwCrit=42,dwMPMax=28,};
			[2]= {dwAttack=560,dwDefense=280,dwFlee=140,dwCrit=168,dwMPMax=112,};
			[3]= {dwAttack=1400,dwDefense=700,dwFlee=350,dwCrit=420,dwMPMax=280,};
			[4]= {dwAttack=2800,dwDefense=1400,dwFlee=700,dwCrit=840,dwMPMax=560,};
			[5]= {dwAttack=4900,dwDefense=2450,dwFlee=1225,dwCrit=1470,dwMPMax=980,};
			[6]= {dwAttack=7840,dwDefense=3920,dwFlee=1960,dwCrit=2352,dwMPMax=1568,};
			[7]= {dwAttack=11760,dwDefense=5880,dwFlee=2940,dwCrit=3528,dwMPMax=2352,};
			[8]= {dwAttack=16800,dwDefense=8400,dwFlee=4200,dwCrit=5040,dwMPMax=3360,};
			[9]= {dwAttack=23100,dwDefense=11550,dwFlee=5775,dwCrit=6930,dwMPMax=4620,};
			[10]= {dwAttack=30800,dwDefense=15400,dwFlee=7700,dwCrit=9240,dwMPMax=6160,};
		};
		[10051001]= {
			[1]= {dwAttack=160,dwDefense=80,dwFlee=40,dwCrit=48,dwMPMax=32,};
			[2]= {dwAttack=640,dwDefense=320,dwFlee=160,dwCrit=192,dwMPMax=128,};
			[3]= {dwAttack=1600,dwDefense=800,dwFlee=400,dwCrit=480,dwMPMax=320,};
			[4]= {dwAttack=3200,dwDefense=1600,dwFlee=800,dwCrit=960,dwMPMax=640,};
			[5]= {dwAttack=5600,dwDefense=2800,dwFlee=1400,dwCrit=1680,dwMPMax=1120,};
			[6]= {dwAttack=8960,dwDefense=4480,dwFlee=2240,dwCrit=2688,dwMPMax=1792,};
			[7]= {dwAttack=13440,dwDefense=6720,dwFlee=3360,dwCrit=4032,dwMPMax=2688,};
			[8]= {dwAttack=19200,dwDefense=9600,dwFlee=4800,dwCrit=5760,dwMPMax=3840,};
			[9]= {dwAttack=26400,dwDefense=13200,dwFlee=6600,dwCrit=7920,dwMPMax=5280,};
			[10]= {dwAttack=35200,dwDefense=17600,dwFlee=8800,dwCrit=10560,dwMPMax=7040,};
		};
		[10092007]= {
			[1]= {dwAttack=180,dwDefense=90,dwFlee=45,dwCrit=54,dwMPMax=36,};
			[2]= {dwAttack=720,dwDefense=360,dwFlee=180,dwCrit=216,dwMPMax=144,};
			[3]= {dwAttack=1800,dwDefense=900,dwFlee=450,dwCrit=540,dwMPMax=360,};
			[4]= {dwAttack=3600,dwDefense=1800,dwFlee=900,dwCrit=1080,dwMPMax=720,};
			[5]= {dwAttack=6300,dwDefense=3150,dwFlee=1575,dwCrit=1890,dwMPMax=1260,};
			[6]= {dwAttack=10080,dwDefense=5040,dwFlee=2520,dwCrit=3024,dwMPMax=2016,};
			[7]= {dwAttack=15120,dwDefense=7560,dwFlee=3780,dwCrit=4536,dwMPMax=3024,};
			[8]= {dwAttack=21600,dwDefense=10800,dwFlee=5400,dwCrit=6480,dwMPMax=4320,};
			[9]= {dwAttack=29700,dwDefense=14850,dwFlee=7425,dwCrit=8910,dwMPMax=5940,};
			[10]= {dwAttack=39600,dwDefense=19800,dwFlee=9900,dwCrit=11880,dwMPMax=7920,};
		};
		[10051003]= {
			[1]= {dwAttack=200,dwDefense=100,dwFlee=50,dwCrit=60,dwMPMax=40,};
			[2]= {dwAttack=800,dwDefense=400,dwFlee=200,dwCrit=240,dwMPMax=160,};
			[3]= {dwAttack=2000,dwDefense=1000,dwFlee=500,dwCrit=600,dwMPMax=400,};
			[4]= {dwAttack=4000,dwDefense=2000,dwFlee=1000,dwCrit=1200,dwMPMax=800,};
			[5]= {dwAttack=7000,dwDefense=3500,dwFlee=1750,dwCrit=2100,dwMPMax=1400,};
			[6]= {dwAttack=11200,dwDefense=5600,dwFlee=2800,dwCrit=3360,dwMPMax=2240,};
			[7]= {dwAttack=16800,dwDefense=8400,dwFlee=4200,dwCrit=5040,dwMPMax=3360,};
			[8]= {dwAttack=24000,dwDefense=12000,dwFlee=6000,dwCrit=7200,dwMPMax=4800,};
			[9]= {dwAttack=33000,dwDefense=16500,dwFlee=8250,dwCrit=9900,dwMPMax=6600,};
			[10]= {dwAttack=44000,dwDefense=22000,dwFlee=11000,dwCrit=13200,dwMPMax=8800,};
		};
		[10082007]= {
			[1]= {dwAttack=220,dwDefense=110,dwFlee=55,dwCrit=66,dwMPMax=44,};
			[2]= {dwAttack=880,dwDefense=440,dwFlee=220,dwCrit=264,dwMPMax=176,};
			[3]= {dwAttack=2200,dwDefense=1100,dwFlee=550,dwCrit=660,dwMPMax=440,};
			[4]= {dwAttack=4400,dwDefense=2200,dwFlee=1100,dwCrit=1320,dwMPMax=880,};
			[5]= {dwAttack=7700,dwDefense=3850,dwFlee=1925,dwCrit=2310,dwMPMax=1540,};
			[6]= {dwAttack=12320,dwDefense=6160,dwFlee=3080,dwCrit=3696,dwMPMax=2464,};
			[7]= {dwAttack=18480,dwDefense=9240,dwFlee=4620,dwCrit=5544,dwMPMax=3696,};
			[8]= {dwAttack=26400,dwDefense=13200,dwFlee=6600,dwCrit=7920,dwMPMax=5280,};
			[9]= {dwAttack=36300,dwDefense=18150,dwFlee=9075,dwCrit=10890,dwMPMax=7260,};
			[10]= {dwAttack=48400,dwDefense=24200,dwFlee=12100,dwCrit=14520,dwMPMax=9680,};
		};
		[10071007]= {
			[1]= {dwAttack=240,dwDefense=120,dwFlee=60,dwCrit=72,dwMPMax=48,};
			[2]= {dwAttack=960,dwDefense=480,dwFlee=240,dwCrit=288,dwMPMax=192,};
			[3]= {dwAttack=2400,dwDefense=1200,dwFlee=600,dwCrit=720,dwMPMax=480,};
			[4]= {dwAttack=4800,dwDefense=2400,dwFlee=1200,dwCrit=1440,dwMPMax=960,};
			[5]= {dwAttack=8400,dwDefense=4200,dwFlee=2100,dwCrit=2520,dwMPMax=1680,};
			[6]= {dwAttack=13440,dwDefense=6720,dwFlee=3360,dwCrit=4032,dwMPMax=2688,};
			[7]= {dwAttack=20160,dwDefense=10080,dwFlee=5040,dwCrit=6048,dwMPMax=4032,};
			[8]= {dwAttack=28800,dwDefense=14400,dwFlee=7200,dwCrit=8640,dwMPMax=5760,};
			[9]= {dwAttack=39600,dwDefense=19800,dwFlee=9900,dwCrit=11880,dwMPMax=7920,};
			[10]= {dwAttack=52800,dwDefense=26400,dwFlee=13200,dwCrit=15840,dwMPMax=10560,};
		};
		[50302063]= {
			[1]= {dwAttack=260,dwDefense=130,dwFlee=65,dwCrit=78,dwMPMax=52,};
			[2]= {dwAttack=1040,dwDefense=520,dwFlee=260,dwCrit=312,dwMPMax=208,};
			[3]= {dwAttack=2600,dwDefense=1300,dwFlee=650,dwCrit=780,dwMPMax=520,};
			[4]= {dwAttack=5200,dwDefense=2600,dwFlee=1300,dwCrit=1560,dwMPMax=1040,};
			[5]= {dwAttack=9100,dwDefense=4550,dwFlee=2275,dwCrit=2730,dwMPMax=1820,};
			[6]= {dwAttack=14560,dwDefense=7280,dwFlee=3640,dwCrit=4368,dwMPMax=2912,};
			[7]= {dwAttack=21840,dwDefense=10920,dwFlee=5460,dwCrit=6552,dwMPMax=4368,};
			[8]= {dwAttack=31200,dwDefense=15600,dwFlee=7800,dwCrit=9360,dwMPMax=6240,};
			[9]= {dwAttack=42900,dwDefense=21450,dwFlee=10725,dwCrit=12870,dwMPMax=8580,};
			[10]= {dwAttack=57200,dwDefense=28600,dwFlee=14300,dwCrit=17160,dwMPMax=11440,};
		};
		[10061001]= {
			[1]= {dwAttack=300,dwDefense=150,dwFlee=75,dwCrit=90,dwMPMax=60,};
			[2]= {dwAttack=1200,dwDefense=600,dwFlee=300,dwCrit=360,dwMPMax=240,};
			[3]= {dwAttack=3000,dwDefense=1500,dwFlee=750,dwCrit=900,dwMPMax=600,};
			[4]= {dwAttack=6000,dwDefense=3000,dwFlee=1500,dwCrit=1800,dwMPMax=1200,};
			[5]= {dwAttack=10500,dwDefense=5250,dwFlee=2625,dwCrit=3150,dwMPMax=2100,};
			[6]= {dwAttack=16800,dwDefense=8400,dwFlee=4200,dwCrit=5040,dwMPMax=3360,};
			[7]= {dwAttack=25200,dwDefense=12600,dwFlee=6300,dwCrit=7560,dwMPMax=5040,};
			[8]= {dwAttack=36000,dwDefense=18000,dwFlee=9000,dwCrit=10800,dwMPMax=7200,};
			[9]= {dwAttack=49500,dwDefense=24750,dwFlee=12375,dwCrit=14850,dwMPMax=9900,};
			[10]= {dwAttack=66000,dwDefense=33000,dwFlee=16500,dwCrit=19800,dwMPMax=13200,};
		};
	};
	
	--最大重数
	MaxLevel = 10;
	
	--每日最大洗练次数
	MaxCount = 10;
	
	--广播起始重数
	BoardcastLevel = 11;
	
	--转换表
	transformTab = {
		"dwAttack",
		"dwDefense",
		"dwFlee",
		"dwCrit",
		"dwMPMax",
	};
};

--得到当前层的属性上限 客户端显示用
function PetWashConfig:GetCurAttr(PetID,dwLevel)
	if not PetID or (PetID == 0) then return {}; end
	if not dwLevel or (dwLevel == 0) then return {}; end
	--本级总属性
	local allAttr = self.AddAttr[PetID][dwLevel];
	--上级总属性
	local preAllAttr = {};
	if (dwLevel - 1) > 0 then
		preAllAttr = self.AddAttr[PetID][dwLevel - 1];
	end
	
	--计算当前属性
	local curAttr = {}
	for k, v in pairs(allAttr) do 
		if preAllAttr[k] then
			curAttr[k] = v - preAllAttr[k];
		else
			return allAttr;
		end
	end
	
	return curAttr;
end

--得到总属性
function PetWashConfig:GetAllAttr(PetID,dwLevel)
	if not PetID or (PetID == 0) then return {}; end
	if not dwLevel or (dwLevel == 0) then return {}; end
	--本级总属性
	local allAttr = self.AddAttr[PetID][dwLevel];
	
	local objData = _G.PetSingleAttr:new(false);
	
	if not allAttr then
		return objData;
	end

	for k,v in pairs(objData) do
		if type(v) ~= "function" and allAttr[k] then
			objData[k] = allAttr[k];
		end
	end
	return objData;
end



--得到增加的属性
function PetWashConfig:GetAddAttr(dwLevel, setCurAttr, b_RuneActive, petId)
	local transAttr = self:AttrTransform(setCurAttr)
	local cfgAttr = self.AddAttr[petId][dwLevel];
	local rndnum = 0;
	if not cfgAttr then
		_info("PetWashConfig:GetAddAttr cant find cfg");
		return
	end
	
	local objData = _G.PetSingleAttr:new(false);
	--local retData = _G.PetSingleAttr:new(false);
	
	--local upLevelCount = 0;
	
	for k, v in pairs(transAttr) do
		rndnum = math.ceil(math.random(1,self.AddAttr[petId][1][k]))
		rndnum = math.ceil( rndnum/10 )
		if not b_RuneActive then 
			rndnum = math.ceil(rndnum * 0.8)
		end
		objData[k] = v + rndnum
		--retData[k] = objData[k];
		
		if objData[k] >= cfgAttr[k] then
			objData[k] = cfgAttr[k]
			--upLevelCount = upLevelCount + 1;
		end
	end
	
	-- if upLevelCount >= #self.transformTab then
		-- return retData;
	-- end
	
	return objData;
end


--转换函数  把属性在服务器的表结构转换成配置表的结构
function PetWashConfig:AttrTransform(setCurAttr)
	if not setCurAttr then
		return
	end
	if not setCurAttr[1] then return setCurAttr; end
	
	if #setCurAttr ~= #self.transformTab then
		_info("PetWashConfig:AttrTransform table element count err");
		return
	end
	
	local retAttrTab = {}
	
	for k, v in pairs(self.transformTab) do
		retAttrTab[v] = setCurAttr[k];
	end
	
	return retAttrTab;
end

-- --根据洗练属性获取等级 （重数）
-- function PetWashConfig:AttrToLevel(setCurAttr)
	-- local transAttr = self:AttrTransform(setCurAttr)
	-- local retLevel = 1;
	-- for i = self.MaxLevel, 2, -1 do
		-- retLevel = i;
		-- local cfgAttr = self.AddAttr[i];
		-- local cfgPreAttr = self.AddAttr[i - 1]
		
		-- local b_IsThisLevel = true
		-- for k, v in pairs(cfgAttr) do
			-- if not(transAttr[k] <= v and transAttr[k] > cfgPreAttr[k]) then
				-- b_IsThisLevel = false;
				-- break;
			-- end
		-- end
		
		-- local activeState = true;
		-- if b_IsThisLevel then
			-- for k, v in pairs(cfgAttr) do
				-- if transAttr[k] ~= v then
					-- activeState = false;
					-- break;
				-- end
			-- end
			-- local activeLevel = 0;
			-- if activeState then
				-- retLevel = i + 1;
				-- activeLevel = i;
			-- else
				-- activeLevel = i-1;
			-- end
			-- return retLevel,activeLevel;
		-- end
	-- end
	
	-- return 1,0;
-- end

--根据洗练属性获取等级 （重数）
function PetWashConfig:AttrToLevel(PetID,setCurAttr)
	local transAttr = self:AttrTransform(setCurAttr)
	for i = self.MaxLevel, 1, -1 do
		local cfgAttr = self.AddAttr[PetID][i];
		
		local b_IsThisLevel = true
		for k, v in pairs(cfgAttr) do
			if transAttr[k] < v then
				b_IsThisLevel = false;
				break;
			end
		end
		if b_IsThisLevel then
			if i == self.MaxLevel then
				return i,i;
			end
			return i + 1,i;
		end
	end
	
	return 1,0;
end

--返回战斗力
function PetWashConfig:CaclPower(setCurAttr)
	local transAttr = self:AttrTransform(setCurAttr)
	--这个 transAttr 里有这个宠物的洗练增加的属性 金亮可以用这个去计算给宠物增加的战斗力
	local addFightNum = 0;
	for k, v in pairs(transAttr) do
		addFightNum = math.floor(addFightNum + v * warli[k]);
	end
	return addFightNum;
end

--升级所需物品和银两
--dwLayerLevel:层级（1~10）,setCurAttr:当前层获得属性,bState:远古符文开启状态（true/false:开启/关闭）,dwPetId:宠物Id
function PetWashConfig:NeedItem(dwLayerLevel,setCurAttr,bState,dwPetId)
	local retTab = {};
	if bState then
		retTab = {[9405051] = num[dwLayerLevel], silver = 0};
	else
		retTab = {[9405050] = num[dwLayerLevel], silver = 0};
	end
	return retTab;
end;

--是否显示快速购买
--dwPetId:宠物id,flag:远古符文按钮状态
function PetWashConfig:IsShowQuickPurchase(dwPetId,flag)
	return false;
end;

--根据宠物是否隐藏礼金
--dwPetId：宠物Id
function PetWashConfig:GetMoneyState(dwPetId)
	return true;
end;


function PetWashConfig:IsOpenWash(dwLevel)	
	if not dwLevel then return end
	
	return dwLevel >= self.OpenLevel;
end


--显示文本相关数据
_G.PetWashConfig.Data = {
	--功能未开放
	szNotOpenWash = "侠客洗炼未开放，需要侠客等级%d级";
	--已到达最高等级
	szHadMaxLv = "<font color='#FFFFFF'>您已到达最高等级</font>";
	--消耗物品不足提示
	szNotMaterial = "<font color='#FFFFFF'>没有足够的%s，请检查包裹内%s数量</font>";
	--消耗银两不足
	szNotEnoughtSliver = "<font color='#FFFFFF'>大侠您的银两不足!</font>";
	--消耗物品颜色
	costMatrcolor = {
		[1] = "#FF0000";--材料不足
		[2] = "#FFFFFF";--材料充足
	};
	--远古符文标题
	szLongSignTitle = "远古符文";
	--快速购买界面获得物品途径介绍
	szMaterialDescribe = {
		[1] = "您可以通过花费元宝购买"; --未开启远古符文
		[2] = "您可以通过花费元宝购买"; --开启远古符文
	};
	--属性
	szAttrMode = "<font color='#FFFFFF'>%s:</font><font color='#FFFF00'>%d</font>";
	--本日洗练上限
	szWashMaxNum = "<font color='#FFFFFF'>本日洗炼上限：%d/%d</font>";
	--远古符文使用提示
	szLongSignExplain = "<font color='#FF0000'>小提示:</font><font color='#FFFFFF'>激活远古符文，消耗化身金丹洗炼资质，获得大量洗练属性，不增加每日洗炼次数。</font>";
	--进度值格式
	szProgressMode = "<font color='#FFFFFF'>%d/%d</font>";
	--总属性加成tips
	szAllAttr = {
		[1] = "<font color='#FFFF00'>总属性加成：</font><br />";
		[2] = "<font color='#FFFFFF'>%s：%d</font><br />";
	};
	--当前层级显示格式
	szLayerLv = "<font color='#FFFF00'>第%d重</font>";
	--资质到达上限
	szFullLevel = "<font color='#FFFF00'>大侠您的资质已亘古未见</font><br />";
	--已激活提示
	szHadActive = "<font color='#00ff00'>当前境界已突破</font>";
	--未激活提示链接
	szNotActiveWash = [[<font color='#31cf32'><u><a href="asfunction:hrefevent,">请先突破上一重</a></u></font>]];
	--本日洗练次数已达上限
	szNotWashNum = "<font color='#31cf32'>大侠您今日洗炼次数已达上限</font>";
	--关闭消息
	szBroadCast = "<font color='#31cf32'>%s的%s突破了侠客洗炼第%d层次，为侠客增加了%d战斗力</font>";
	--洗练属性提示{dwAttrIndex:属性类型索引(0:表示总属性,1:内力，2:攻击，3:防御，4:身法，5:暴击)，dwLevel:当前重数,dwCurProgress:属性当前进度}
	szWashAttrTips = function(dwAttrIndex,dwLevel,dwCurProgress)
		local str = "";
		local ku = {"第一重","第二重","第三重","第四重","第五重","第六重","第七重","第八重","第九重","第十重"};
		local line="<p><img src = 'img://PartingLine.png' width= '140'  > </p>";
		str = string.format("<p align='center'><font color='#ffcc00' size = '20' >%s</font></p>",ku[dwLevel]);
		str = str .. line;
		str = str .. "<p><font color='#06ff00'>总进度满之后可提升至下一重级</font>";
			
		return str;
	end;
	
	--洗练资质按钮提示{dwLevel:当前重数,dwCurProgress:属性当前总进度}
	szWashBtTips = function(dwLevel,dwCurProgress)
		local str = "点击洗炼按钮，洗炼侠客资质";
		return str;
	end;
	
	--远古符文按钮提示{dwLevel:当前重数,dwCurProgress:属性当前总进度}
	szSingBtTips = function(dwLevel,dwCurProgress)
		local str = "<font color='#FFFFFF'>点击激活远古符文，激活后可消耗化身金丹来<br>洗炼资质，获得大量洗练属性，不增加每日洗<br>炼次数。</font>";
		return str;
	end;
	--洗练按钮点击时间间隔
	timeGap = 300;
};

--属性显示文本
_G.PetWashConfig.PropertyText = {
	dwAttack = "攻    击",
	dwDefense = "防    御",
	dwFlee = "身    法",
	dwCrit = "暴    击",
	dwMPMax = "内    力",
	--获取属性显示顺序(属性列表)
	GetShowSort = function(key)
		local index = 0;
		if key == "dwAttack" then index = 1;
		elseif key == "dwDefense" then index = 2;
		elseif key == "dwFlee" then index = 3;
		elseif key == "dwCrit" then index = 4;
		elseif key == "dwMPMax" then index = 5;
		end
		return index,_G.PetWashConfig.PropertyText[key];
	end;
};
