--宠物资质基本配置
local itemid = {9405044,9405045,9405046,9405047,9405048};
local shuxing = {
	[50710015] = {200,400,600,800,1100,1500,2000,2600,3300,4300,};
	[10021030] = {240,480,720,960,1320,1800,2400,3120,3960,5160,};
	[10021015] = {280,560,840,1120,1540,2100,2800,3640,4620,6020,};
	[10051001] = {320,640,960,1280,1760,2400,3200,4160,5280,6880,};
	[10092007] = {360,720,1080,1440,1980,2700,3600,4680,5940,7740,};
	[10051003] = {400,800,1200,1600,2200,3000,4000,5200,6600,8600,};
	[10082007] = {440,880,1320,1760,2420,3300,4400,5720,7260,9460,};
	[10071007] = {480,960,1440,1920,2640,3600,4800,6240,7920,10320,};
	[50302063] = {520,1040,1560,2080,2860,3900,5200,6760,8580,11180,};
	[10061001] = {600,1200,1800,2400,3300,4500,6000,7800,9900,12900,};
};
local xishu = {0.2,1,0.5,0.3,0.25};
local jiacheng = {
----内力 攻击 防御 暴击 身法
	[50710015] = {8,40,20,12,10};
	[10021030] = {9,48,24,14,12};
	[10021015] = {11,56,28,16,14};
	[10051001] = {12,64,32,19,16};
	[10092007] = {14,72,36,21,18};
	[10051003] = {16,80,40,24,20};
	[10082007] = {17,88,44,26,22};
	[10071007] = {19,96,48,28,24};
	[50302063] = {20,104,52,31,26};
	[10061001] = {24,120,60,36,30};
}
local itemnum = {1,1,2,2,3,3,4,4,5,5,};
_G.PetAptitudeConfig = {
	--基本信息
	BasicInfo = {
		--内力
		[1] = {
			UpValue = 0;   --上限
		},
		--攻击
		[2] = {
			UpValue = 0;   --上限
		},
		--防御
		[3] = {
			UpValue = 0;   --上限
		},
		--暴击
		[4] = {
			UpValue = 0;   --上限
		},
		--身法
		[5] = {
			UpValue = 0;   --上限
		},
	};
	--方法
	Function = {
		--消耗道具id及个数  dwType:1：内力 2：攻击   dwCurValue:类型对应的当前资质值
		GetEnumInfo = function(dwType, dwCurValue, dwPetId, petBournLevel)
			local dwEnumId = itemid[dwType];
			local num = 0;
			local temol = 0;
			for y = 1,petBournLevel do
				temol = math.floor(temol + shuxing[dwPetId][y] * xishu[dwType])
				if temol >= dwCurValue then
					num = itemnum[y];
					break;
				end
			end
			return dwEnumId, num;
		end;
		--增加资质值  dwType:1：内力 2：攻击   dwCurValue:类型对应的当前资质值
		AddAptitudeValue = function(dwType, dwCurValue, dwPetId)
			local dwAddValue = jiacheng[dwPetId][dwType];
			local rndsuiji = math.floor(math.random(110));
			local dwNum = 0;
			local dwCritType = 0;   --1：普通 2：衰减 3：暴击
			if rndsuiji <= 30 then
				dwAddValue = math.floor(dwAddValue * 0.5);
				dwCritType = 2;
			elseif (rndsuiji <= 90 ) and (rndsuiji > 30) then
				dwAddValue = math.floor(dwAddValue * 1);
				dwCritType = 1;
			elseif (rndsuiji <= 110)and (rndsuiji > 90) then
				dwAddValue = math.floor(dwAddValue * 2);
				dwCritType = 3;
			end
			return dwAddValue, dwCritType;
		end;
		--通过宠物境界增加资质上限   dwType:1：内力 2：攻击   dwBournLevel:宠物境界等阶
		GetAptitudeUpLimit = function(dwType, dwBournLevel, dwPetId)  
			local temp = 0;
			for i = 1,dwBournLevel do
				temp = math.floor(temp + shuxing[dwPetId][i] * xishu[dwType])
			end
			return temp;
		end;
	};
};

_G.AptitudeBournImage = {
[1]="img://ui_xiakezizhi_1_1.png";
[2]="img://ui_xiakezizhi_2_1.png";
[3]="img://ui_xiakezizhi_3_1.png";
[4]="img://ui_xiakezizhi_4_1.png";
[5]="img://ui_xiakezizhi_5_1.png";
[6]="img://ui_xiakezizhi_6_1.png";
[7]="img://ui_xiakezizhi_7_1.png";
[8]="img://ui_xiakezizhi_8_1.png";
[9]="img://ui_xiakezizhi_9_1.png";
[10]="img://ui_xiakezizhi_10_1.png";
};

_G.AptitudeBournImageUnActive = {
[1]="img://ui_xiakezizhi_1_0.png";
[2]="img://ui_xiakezizhi_2_0.png";
[3]="img://ui_xiakezizhi_3_0.png";
[4]="img://ui_xiakezizhi_4_0.png";
[5]="img://ui_xiakezizhi_5_0.png";
[6]="img://ui_xiakezizhi_6_0.png";
[7]="img://ui_xiakezizhi_7_0.png";
[8]="img://ui_xiakezizhi_8_0.png";
[9]="img://ui_xiakezizhi_9_0.png";
[10]="img://ui_xiakezizhi_10_0.png";
};

--宠物等级检测
_G.PetLevelConfig = {
	[50710015] = 1;
};

_G.PetCurBourn ="<font color='#ffffff'>【当前境界】</font>";
_G.PetAptitudeAddActive ="<p align='center'><font color='#ffffff'>%s资质：%d点</font></p>";
_G.PetAptitudeAddUnActive ="<p align='center'><font color='#5a5a5a'>%s资质：%d点</font></p>";
_G.PetAptitudeTipsl ="<font color='#ffffff'>消耗</font><font color='#00ff00'>%d</font><font color='#ffffff'>个</font><font color='#ffd700'>%s</font><font color='#ffffff'>道具提升侠客%s资质</font>";
_G.PetAptitudeItemColor ="<u><font color='#00ff00'>%s</font></u>";
_G.PetAptitudeItemColor1 ="<u><font color='#ff0000'>%s</font></u>";

_G.Bj = "人品爆发增加%s资质%d点";
_G.zc = "增加%s资质%d点";

_G.AptitudeAttr = {
[1]= "内力";
[2]="攻击";
[3]="防御";
[4]="暴击";
[5]="身法";
};

_G.PetAptitudeTips ="<p><font color='#fffc00' size = '20'>小提示：</font></p><p><font color='#D9CCBD'>1.玩家每次提升需要消耗对应物品<p>2.吃丹可提升资质，提升的资质有概率减少或暴击<p>3.玩家提升资质有上限限制<p>4.侠客境界可提高侠客资质上限</font></p>";
