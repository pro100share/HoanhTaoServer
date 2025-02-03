--成就勋章配置

--勋章
_G.AchievementMedalConfig = 
{
	[1] = 
	{
		dwID = 1;
		szName = "默默无闻";
		szIcon = "ChengJiuXunZhang_01_1.png";--图标
		szIconGray = "ChengJiuXunZhang_01_0.png";
		szNamePic = "ChengjiuXunZhangname_01.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 100;
			attrAdv.dwDefense = 50;
			attrAdv.dwHPMax = 500;
			attrAdv.dwCritDown = 15;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 5;--成就点数
		
		dwButtonType = 1;
	};
	[2] = 
	{
		dwID = 2;
		szName = "尺寸之功";
		szIcon = "ChengJiuXunZhang_02_1.png";--图标
		szIconGray = "ChengJiuXunZhang_02_0.png";
		szNamePic = "ChengjiuXunZhangname_02.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 120;
			attrAdv.dwDefense = 60;
			attrAdv.dwHPMax = 600;
			attrAdv.dwCritDown = 18;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 15;--成就点数
		
		dwButtonType = 1;
	};
	[3] = 
	{
		dwID = 3;
		szName = "崭露头角";
		szIcon = "ChengJiuXunZhang_03_1.png";--图标
		szIconGray = "ChengJiuXunZhang_03_0.png";
		szNamePic = "ChengjiuXunZhangname_03.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 150;
			attrAdv.dwDefense = 75;
			attrAdv.dwHPMax = 750;
			attrAdv.dwCritDown = 22;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 35;--成就点数
		
		dwButtonType = 1;
	};
	[4] = 
	{
		dwID = 4;
		szName = "小有名气";
		szIcon = "ChengJiuXunZhang_04_1.png";--图标
		szIconGray = "ChengJiuXunZhang_04_0.png";
		szNamePic = "ChengjiuXunZhangname_04.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 190;
			attrAdv.dwDefense = 95;
			attrAdv.dwHPMax = 950;
			attrAdv.dwCritDown = 28;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 65;--成就点数
		
		dwButtonType = 1;
	};
	[5] = 
	{
		dwID = 5;
		szName = "登堂入室";
		szIcon = "ChengJiuXunZhang_05_1.png";--图标
		szIconGray = "ChengJiuXunZhang_05_0.png";
		szNamePic = "ChengjiuXunZhangname_05.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 240;
			attrAdv.dwDefense = 120;
			attrAdv.dwHPMax = 1200;
			attrAdv.dwCritDown = 36;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 105;--成就点数
		
		dwButtonType = 1;
	};
	[6] = 
	{
		dwID = 6;
		szName = "名噪一时";
		szIcon = "ChengJiuXunZhang_06_1.png";--图标
		szIconGray = "ChengJiuXunZhang_06_0.png";
		szNamePic = "ChengjiuXunZhangname_06.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 300;
			attrAdv.dwDefense = 150;
			attrAdv.dwHPMax = 1500;
			attrAdv.dwCritDown = 45;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 155;--成就点数
		
		dwButtonType = 1;
	};
	[7] = 
	{
		dwID = 7;
		szName = "出人头地";
		szIcon = "ChengJiuXunZhang_07_1.png";--图标
		szIconGray = "ChengJiuXunZhang_07_0.png";
		szNamePic = "ChengjiuXunZhangname_07.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 370;
			attrAdv.dwDefense = 185;
			attrAdv.dwHPMax = 1850;
			attrAdv.dwCritDown = 55;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 215;--成就点数
		
		dwButtonType = 2;
	};
	[8] = 
	{
		dwID = 8;
		szName = "硕果累累";
		szIcon = "ChengJiuXunZhang_08_1.png";--图标
		szIconGray = "ChengJiuXunZhang_08_0.png";
		szNamePic = "ChengjiuXunZhangname_08.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 450;
			attrAdv.dwDefense = 225;
			attrAdv.dwHPMax = 2250;
			attrAdv.dwCritDown = 67;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 285;--成就点数
		
		dwButtonType = 2;
	};
	[9] = 
	{
		dwID = 9;
		szName = "家喻户晓";
		szIcon = "ChengJiuXunZhang_09_1.png";--图标
		szIconGray = "ChengJiuXunZhang_09_0.png";
		szNamePic = "ChengjiuXunZhangname_09.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 540;
			attrAdv.dwDefense = 270;
			attrAdv.dwHPMax = 2700;
			attrAdv.dwCritDown = 81;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 365;--成就点数
		
		dwButtonType = 2;
	};
	[10] = 
	{
		dwID = 10;
		szName = "功成名就";
		szIcon = "ChengJiuXunZhang_10_1.png";--图标
		szIconGray = "ChengJiuXunZhang_10_0.png";
		szNamePic = "ChengjiuXunZhangname_10.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 640;
			attrAdv.dwDefense = 320;
			attrAdv.dwHPMax = 3200;
			attrAdv.dwCritDown = 96;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 455;--成就点数
		
		dwButtonType = 2;
	};
	[11] = 
	{
		dwID = 11;
		szName = "四海皆知";
		szIcon = "ChengJiuXunZhang_11_1.png";--图标
		szIconGray = "ChengJiuXunZhang_11_0.png";
		szNamePic = "ChengjiuXunZhangname_11.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 750;
			attrAdv.dwDefense = 375;
			attrAdv.dwHPMax = 3750;
			attrAdv.dwCritDown = 112;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 555;--成就点数
		
		dwButtonType = 2;
	};
	[12] = 
	{
		dwID = 12;
		szName = "如雷贯耳";
		szIcon = "ChengJiuXunZhang_12_1.png";--图标
		szIconGray = "ChengJiuXunZhang_12_0.png";
		szNamePic = "ChengjiuXunZhangname_12.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 870;
			attrAdv.dwDefense = 435;
			attrAdv.dwHPMax = 4350;
			attrAdv.dwCritDown = 130;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 665;--成就点数
		
		dwButtonType = 2;
	};
	[13] = 
	{
		dwID = 13;
		szName = "久负盛名";
		szIcon = "ChengJiuXunZhang_13_1.png";--图标
		szIconGray = "ChengJiuXunZhang_13_0.png";
		szNamePic = "ChengjiuXunZhangname_13.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 1000;
			attrAdv.dwDefense = 500;
			attrAdv.dwHPMax = 5000;
			attrAdv.dwCritDown = 150;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 785;--成就点数
		
		dwButtonType = 3;
	};
	[14] = 
	{
		dwID = 14;
		szName = "辉煌夺目";
		szIcon = "ChengJiuXunZhang_14_1.png";--图标
		szIconGray = "ChengJiuXunZhang_14_0.png";
		szNamePic = "ChengjiuXunZhangname_14.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 1140;
			attrAdv.dwDefense = 570;
			attrAdv.dwHPMax = 5700;
			attrAdv.dwCritDown = 171;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 915;--成就点数
		
		dwButtonType = 3;
	};
	[15] = 
	{
		dwID = 15;
		szName = "丰功伟绩";
		szIcon = "ChengJiuXunZhang_15_1.png";--图标
		szIconGray = "ChengJiuXunZhang_15_0.png";
		szNamePic = "ChengjiuXunZhangname_15.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 1290;
			attrAdv.dwDefense = 645;
			attrAdv.dwHPMax = 6450;
			attrAdv.dwCritDown = 193;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 1055;--成就点数
		
		dwButtonType = 3;
	};
	[16] = 
	{
		dwID = 16;
		szName = "冠前绝后";
		szIcon = "ChengJiuXunZhang_16_1.png";--图标
		szIconGray = "ChengJiuXunZhang_16_0.png";
		szNamePic = "ChengjiuXunZhangname_16.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 1450;
			attrAdv.dwDefense = 725;
			attrAdv.dwHPMax = 7250;
			attrAdv.dwCritDown = 217;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 1206;--成就点数
		
		dwButtonType = 3;
	};
	[17] = 
	{
		dwID = 17;
		szName = "名垂青史";
		szIcon = "ChengJiuXunZhang_17_1.png";--图标
		szIconGray = "ChengJiuXunZhang_17_0.png";
		szNamePic = "ChengjiuXunZhangname_17.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 1620;
			attrAdv.dwDefense = 810;
			attrAdv.dwHPMax = 8100;
			attrAdv.dwCritDown = 243;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 1368;--成就点数
		
		dwButtonType = 3;
	};
	[18] = 
	{
		dwID = 18;
		szName = "流芳千古";
		szIcon = "ChengJiuXunZhang_18_1.png";--图标
		szIconGray = "ChengJiuXunZhang_18_0.png";
		szNamePic = "ChengjiuXunZhangname_18.png";
		FunAttrCount = function()
			local attrAdv = SSingleAttrChange:new();
			-- local attrPer = nil;
			
			attrAdv.dwAttack = 1800;
			attrAdv.dwDefense = 900;
			attrAdv.dwHPMax = 9000;
			attrAdv.dwCritDown = 270;
			
			return attrAdv;
		end;
		dwCostAchieveNumber = 1541;--成就点数
		
		dwButtonType = 3;
	};
}

--侧边按钮
_G.AchieveButtonConfig = 
{
	[1] = 
	{
		dwID = 1;
		szName = "初露锋芒";
		szIcon = "chengjiuxunzhangxl_01.png";
		setMedalList = {1,2,3,4,5,6};
	};
	[2] = 
	{
		dwID = 2;
		szName = "声名远播";
		szIcon = "chengjiuxunzhangxl_02.png";
		setMedalList = {7,8,9,10,11,12};
	};
	[3] = 
	{
		dwID = 3;
		szName = "万众瞩目";
		szIcon = "chengjiuxunzhangxl_03.png";
		setMedalList = {13,14,15,16,17,18};
	};
}

_G.AchievementMedalNumber = 0;

for id,tb in pairs(AchievementMedalConfig)do
	_G.AchievementMedalNumber = _G.AchievementMedalNumber + 1;
	-- if AchieveButtonConfig[tb.dwButtonType] then
		-- table.insert(AchieveButtonConfig[tb.dwButtonType].setMedalList,id)
	-- end
end


--显示属性的配置

local arrNameSort = 
{
	"dwAttack",
	"dwDefense",
	"dwHPMax",
	"dwCritDown",
	
}
local arrNameToString =
{
	dwAttack = "strAttack";
	dwDefense = "strDefence";
	dwHPMax = "strShengMing";
	dwCritDown = "strBaojiDiKang";
	
}

_G.MedalStringConfig = 
{
	strAttack = "<p><font color='#DCB857'>攻    击 + %d</font></p>";
	strDefence = "<p><font color='#DCB857'>防    御 + %d</font></p>";
	strShengMing = "<p><font color='#DCB857'>生命上限 + %d</font></p>";
	strBaojiDiKang = "<p><font color='#DCB857'>暴击抵抗 + %d</font></p>";
	
	
	strPointShow = "<font color= '%s' > %d </font>";--显示在兑换消耗出的字符串
	strColorWhite = "#dcdcdc";--白色
	strColorRed = "#ff0000";--红色
	
	strTipTitle = "<font color = '#87CEEB'>%s</font>  <font color = '#dcdcdc'>进度:%d/%d</font><br>";
	strTipTitle2 = "<font color='#FF6100' >加成属性</font><br>";
	
	strShowTip = "使用道具获得成就点数%d";
	
	strNoticeError = "成就点数不足";
	
	strBtnComplete = "恭喜玩家%s兑换了<font color='#FF6100'>%s</font>所有的勋章";
	
	FunGetAttrString = function(objAttr)
		local strOut = "";
		
		for _,k in pairs(arrNameSort)do
			local v = arrNameToString[k];
			local val = objAttr[k];
			if v and val and (val>0) then
				local tmp = string.format(MedalStringConfig[v],val);
				
				strOut = strOut..tmp;
			end
		end
		
		return strOut;
	end;
	
	FunGetAttrStringAll = function(objAttr)
		local strOut = "";
		
		for _,k in pairs(arrNameSort)do
			local v = arrNameToString[k];
			local val = objAttr[k];
			if v and val then
				local tmp = string.format(MedalStringConfig[v],val);
				
				strOut = strOut..tmp;
			end
		end
		
		return strOut;
	end;
}

