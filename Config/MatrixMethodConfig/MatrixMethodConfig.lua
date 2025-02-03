--[[
功能：阵法系统配置表
作者：魏云
时间：2013-10-28
--]]
----阵法星配置
_G.MatrixMethodStarConfig = {
	[1] = {dwAttack= 40 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax= 0,dwCritDown= 0,dwPoJiaDiKang= 0,}, --- [1] 一等级 riseStartExp 升星所需要的经验
	[2] = {dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax= 200,dwCritDown= 0,dwPoJiaDiKang= 0,},
	[3] = {dwAttack= 0 ,dwDefense= 20,dwFlee= 0,dwCrit= 0,dwHPMax= 0,dwCritDown= 0,dwPoJiaDiKang= 0,},
	[4] = {dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax= 0,dwCritDown= 8,dwPoJiaDiKang= 0,},
	[5] = {dwAttack= 0 ,dwDefense= 0,dwFlee= 12,dwCrit= 0,dwHPMax= 0,dwCritDown= 0,dwPoJiaDiKang= 0,},
	[6] = {dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 8,dwHPMax= 0,dwCritDown= 0,dwPoJiaDiKang= 0,},
	[7] = {dwAttack= 0 ,dwDefense= 0,dwFlee= 0,dwCrit= 0,dwHPMax= 0,dwCritDown= 0,dwPoJiaDiKang= 8,},
};
--普通星一级经验
_G.MatrixMethodStarExp = 100 
_G.MatrixMethodMaxLevel = 100
--普通星配置表
_G.MatrixMethodParmConfig = {
	[1]  = {dwAttack= 20 ,dwDefense= 10,dwFlee= 6,dwCrit= 4,dwHPMax= 100,dwCritDown= 4,dwPoJiaDiKang= 4,StartExp = 50,},  --2级减1级
	[2]  = {dwAttack= 30 ,dwDefense= 15,dwFlee= 9,dwCrit= 6,dwHPMax= 150,dwCritDown= 6,dwPoJiaDiKang= 6,StartExp = 100,}, --11级减10级
	[3]  = {dwAttack= 40 ,dwDefense= 20,dwFlee= 12,dwCrit= 8,dwHPMax= 200,dwCritDown= 8,dwPoJiaDiKang= 8,StartExp = 150,},--21级减20级
	[4]  = {dwAttack= 50 ,dwDefense= 25,dwFlee= 15,dwCrit= 10,dwHPMax= 250,dwCritDown= 10,dwPoJiaDiKang= 10,StartExp = 200,},--31级减30级
	[5]  = {dwAttack= 70 ,dwDefense= 35,dwFlee= 21,dwCrit= 14,dwHPMax= 350,dwCritDown= 14,dwPoJiaDiKang= 14,StartExp = 400,},--41级减40级
	[6]  = {dwAttack= 90 ,dwDefense= 45,dwFlee= 27,dwCrit= 18,dwHPMax= 450,dwCritDown= 18,dwPoJiaDiKang= 18,StartExp = 700,},--51级减50级
	[7]	 = {dwAttack= 110,dwDefense= 55,dwFlee= 33,dwCrit= 22,dwHPMax= 550,dwCritDown= 22,dwPoJiaDiKang= 22,StartExp = 1100,},--61级减60级
	[8]	 = {dwAttack= 140,dwDefense= 70,dwFlee= 42,dwCrit= 28,dwHPMax= 700,dwCritDown= 28,dwPoJiaDiKang= 28,StartExp = 1600,},--71级减70级
	[9]	 = {dwAttack= 200,dwDefense= 100,dwFlee= 60,dwCrit= 40,dwHPMax= 1000,dwCritDown= 40,dwPoJiaDiKang= 40,StartExp = 3200,},--81级减80级
	[10] = {dwAttack= 300,dwDefense= 150,dwFlee= 90,dwCrit= 60,dwHPMax= 1500,dwCritDown= 60,dwPoJiaDiKang= 60,StartExp = 6400,},--91级减90级
}

------套装属性配置
_G.MatrixMethodBasicStarSuitAttrConfig = {

	[1] = {dwAttack= 500 ,dwDefense= 250,dwFlee= 150,dwCrit= 100,dwHPMax= 2500,dwCritDown= 100,dwPoJiaDiKang= 100,},
    [2] = {dwAttack= 1000 ,dwDefense= 500,dwFlee= 300,dwCrit= 200,dwHPMax= 5000,dwCritDown= 200,dwPoJiaDiKang= 200,},    
    [3] = {dwAttack= 1550 ,dwDefense= 775,dwFlee= 465,dwCrit= 310,dwHPMax= 7750,dwCritDown= 310,dwPoJiaDiKang= 310,},
    [4] = {dwAttack= 2150 ,dwDefense= 1075,dwFlee= 645,dwCrit= 430,dwHPMax= 10750,dwCritDown= 430,dwPoJiaDiKang= 430,},
    [5] = {dwAttack= 2800 ,dwDefense= 1400,dwFlee= 840,dwCrit= 560,dwHPMax= 14000,dwCritDown= 560,dwPoJiaDiKang= 560,},
    [6] = {dwAttack= 3500 ,dwDefense= 1750,dwFlee= 1050,dwCrit= 700,dwHPMax= 17500,dwCritDown= 700,dwPoJiaDiKang= 700,},
    [7] = {dwAttack= 4250 ,dwDefense= 2125,dwFlee= 1275,dwCrit= 850,dwHPMax= 21250,dwCritDown= 850,dwPoJiaDiKang= 850,},
    [8] = {dwAttack= 5050 ,dwDefense= 2525,dwFlee= 1515,dwCrit= 1010,dwHPMax= 25250,dwCritDown= 1010,dwPoJiaDiKang= 1010,},
    [9] = {dwAttack= 5900 ,dwDefense= 2950,dwFlee= 1770,dwCrit= 1180,dwHPMax= 29500,dwCritDown= 1180,dwPoJiaDiKang= 1180,},
    [10] = {dwAttack= 6800 ,dwDefense= 3400,dwFlee= 2040,dwCrit= 1360,dwHPMax= 34000,dwCritDown= 1360,dwPoJiaDiKang= 1360,}, 	
};
------套装星基本的信息
_G.MatrixMethodAddStarInfoConfig = {
	[1] = {dwItemID = 5809368,dwItemNum = 50},    -----[1]套装星等级  dwItemID消耗的物品 dwItemNum 消耗的数量
    [2] = {dwItemID = 5809368,dwItemNum = 100},
    [3] = {dwItemID = 5809368,dwItemNum = 160},
    [4] = {dwItemID = 5809368,dwItemNum = 230},
    [5] = {dwItemID = 5809368,dwItemNum = 320},
	[6] = {dwItemID = 5809368,dwItemNum = 430},
	[7] = {dwItemID = 5809368,dwItemNum = 570},
	[8] = {dwItemID = 5809368,dwItemNum = 740},
	[9] = {dwItemID = 5809368,dwItemNum = 950},
	[10] = {dwItemID = 5809368,dwItemNum = 1200},  
	
};
---洞明星经验加成
_G.MatrixMethodHideStarInfoConfig = {
	[1] = 20,
    [2] = 40,
    [3] = 60,
    [4] = 80,
    [5] = 100,
	[6] = 120,
	[7] = 140,
	[8] = 160,
	[9] = 200,
	[10] = 240,
}
-----------手动拉杆消耗
_G.MatrixMethodConInfo = {dwGold = 10,dwItemID = 5809367,dwItemNum = 1, };
-------摘星换斗消耗
_G.MatrixMethodStartMoveConInfo = { dwItemID = 5809368,dwItemNum = 1,dwGold = 1,};
-------实时更新物品  1,斗转星消耗物品ID.2, 手拉消耗物品ID.3，隐元星消耗物品ID
_G.MatrixMethodItemID = {MatrixMethodStartMoveConInfo.dwItemID, MatrixMethodConInfo.dwItemID,MatrixMethodAddStarInfoConfig[1].dwItemID};
----随机权重配置表
_G.MatrixMethodWeightValueConfig = {
	[1] = {10,10,10}, -----[] 是那颗星 {}	权重值，因为最大要随机3个，所以有3个权重值
	[2] = {10,10,10},
	[3] = {10,10,10},
	[4] = {10,10,10},
	[5] = {10,10,10},
	[6] = {10,10,10},
	[7] = {10,10,10},
};
----随机加经验配置表
_G.MatrixMethodRanderAddExpConfig = {
	[1] = {180,120,100}, ---[1]第一颗星星 {1} 是三颗都一样，{2}两颗都一样 ，{3}一颗星时
	[2] = {180,120,100},
	[3] = {180,120,100},
	[4] = {180,120,100},
	[5] = {180,120,100},
	[6] = {180,120,100},
	[7] = {180,120,100},
	
};
----使用道具升星星经验
_G.UseItemAddStarExpConfig = {
	[5809463] = {starIndex = 1,starExp = 1000,effectIndex = 1};  --破军             ---[2334234] ---物品ID，starIndex 星索引值 ，effectIndex 特效索引值
	[5809464] = {starIndex = 1,starExp = 5000,effectIndex = 2};
	[5809465] = {starIndex = 1,starExp = 10000,effectIndex = 3};
	[5809466] = {starIndex = 2,starExp = 1000,effectIndex = 1};  --武曲
	[5809467] = {starIndex = 2,starExp = 5000,effectIndex = 2};
	[5809468] = {starIndex = 2,starExp = 10000,effectIndex = 3};
	[5809469] = {starIndex = 3,starExp = 1000,effectIndex = 1};  --康贞
	[5809470] = {starIndex = 3,starExp = 5000,effectIndex = 2};
	[5809471] = {starIndex = 3,starExp = 10000,effectIndex = 3};
	[5809472] = {starIndex = 4,starExp = 1000,effectIndex = 1};  --文曲
	[5809473] = {starIndex = 4,starExp = 5000,effectIndex = 2};
	[5809474] = {starIndex = 4,starExp = 10000,effectIndex = 3};
	[5809475] = {starIndex = 5,starExp = 1000,effectIndex = 1};  --禄存
	[5809476] = {starIndex = 5,starExp = 5000,effectIndex = 2};
	[5809477] = {starIndex = 5,starExp = 10000,effectIndex = 3};
	[5809478] = {starIndex = 6,starExp = 1000,effectIndex = 1};  --巨门
	[5809479] = {starIndex = 6,starExp = 5000,effectIndex = 2};
	[5809480] = {starIndex = 6,starExp = 10000,effectIndex = 3};
	[5809481] = {starIndex = 7,starExp = 1000,effectIndex = 1};  --贪狼
	[5809482] = {starIndex = 7,starExp = 5000,effectIndex = 2};
	[5809483] = {starIndex = 7,starExp = 10000,effectIndex = 3};
	
}
----使用道具升星星等级
_G.UseItemAddStarLevelConfig = {
	[5809494] = {starIndex = 0,starLevelNum = 1,effectIndex = 4};  --全部升级    ---[2334234] ---物品ID，starIndex  星索引值 0  全部升级， 1---7 单个升级   ，starLevelNum  升的等级数 effectIndex 特效索引值 固定为4
	[5809487] = {starIndex = 1,starLevelNum = 1,effectIndex = 4};
	[5809488] = {starIndex = 2,starLevelNum = 1,effectIndex = 4};
	[5809489] = {starIndex = 3,starLevelNum = 1,effectIndex = 4};
	[5809490] = {starIndex = 4,starLevelNum = 1,effectIndex = 4};
	[5809491] = {starIndex = 5,starLevelNum = 1,effectIndex = 4};
	[5809492] = {starIndex = 6,starLevelNum = 1,effectIndex = 4};
	[5809493] = {starIndex = 7,starLevelNum = 1,effectIndex = 4};
}
---星套装等级获取方式
_G.MatrixMethodStarSuitLevelTypeConfig = 0  ----0 总的星星等级 1 平均的星星等级
_G.MatrixMethodFreeUsedMaxNumConfig = 10;    ----免费拉杆次数
_G.MatrixMethodVipFreeUsedNumConfig = 10;
_G.MatrixMethodIsCanBuyFlag = false  ----是否自动购买
----经验乘以几倍配置表
_G.MatrixMethodExpMultiplyConfig = {1,3,5,10 };
---隐元星经验加成或加星星属性倍数
_G.MatrixMethodHideStarAddType = {
	addExp = 1;  -----1 为加经验， nil 为不加
	addAttr = 1; ---1 为加属性，nil为不加
};
---星套装等级获取方式
_G.MatrixMethodStrConfig = {
	Rule     	= "<p>1.三星连珠可获经验>两星连珠可获经验>孤星独闪可获经验.</p><p>2.选择X10次+摘星换斗=10次三星连珠=巨额单颗星斗经验！</p><p>3.激活隐元星，即可获得北斗七星阵专属人物特效，隐元星级愈高，特效愈加炫目！</p><p>4.洞明星关乎北斗七星可从转盘中获取的星斗经验，洞明星级愈高，提升愈加显著！</p>"; 															--规则
	zhaixingRule= "使用星轨获得摘星换斗之力，可确保下一次拉杆100%为三星连珠。"; 		    --摘星TIPs
	yaojiangRule= "三星连珠可获经验>两星连珠可获经验>孤星独闪可获经验"; --摇奖Tips
	cishuRule	= "一键选择多次拉杆，迅速获得星斗经验"; --倍数Tips
	OthStarTips = "<p><font color='#FFFF00'>【星斗●%s】</font></p><p><font color='#FFFFFF'>当前等级:</font><font color='#4daeed'>%s</p>%s</font>";								--查看星tips    4daeed
	OthHideStar = "<p><font color='#FFFF00'>【星斗●%s】</font>%s</p><p><font color='#FFFFFF'>当前等级:</font><font color='#4daeed'>%s</p>%s</font>";							--查看隐元tips
	OthSuitTips = "<p><font color='#FFFF00'>【星斗●%s】</font>%s</p><p><font color='#FFFFFF'>当前等级:</font><font color='#4daeed'>%s</p>%s</font>";							--查看隐元tips
	StarTips 	= "<p><font color='#FFFF00'>【星斗●%s】</font></p><p><font color='#FFFFFF'>当前等级:</font>%s</p><p><font color='#FFFFFF'>升级所需经验:</font><font color='#FFFFFF'>%s</font></p>%s<p><font color='#4daeed'>下级效果:</font></p>%s";			--星tips
	HideStar 	= "<p><font color='#FFFF00'>【星斗●%s】</font>%s</p><p><font color='#FFFFFF'>当前等级:</font><font color='#4daeed'>%s</p><p>%s</p>%s</font>";					--隐元tips
	SuitTips 	= "<p><font color='#FFFF00'>【星斗●%s】</font>%s</p><p><font color='#FFFFFF'>当前等级:</font><font color='#4daeed'>%s</p><p>%s</p>%s</font>";					--套装tips
	ProperyName1	= { 																--总属属性字符串
				dwHPMax 		= "<font color='#FFFF00'>生命</font> + ";
				dwAttack 		= "<font color='#FFFF00'>攻击</font> + "; 
                dwDefense 		= "<font color='#FFFF00'>防御</font> + ";
                dwCrit 			= "<font color='#FFFF00'>暴击</font> + ";
                dwFlee 			= "<font color='#FFFF00'>身法</font> + ";				
				dwPoJiaDiKang 	= "<font color='#FFFF00'>伤害抵御</font> + ";
				dwCritDown 		= "<font color='#FFFF00'>暴击抵抗</font> + ";
			};
	Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwCrit";"dwFlee";"dwCritDown";"dwPoJiaDiKang";}; --属性顺序显示
	ProperyName 	= { 																--TIPS属性字符串
				dwHPMax 		= "生命 + ";
				dwCritDown 		= "暴击抵抗 + ";
				dwAttack 		= "攻击 + "; 
                dwDefense 		= "防御 + ";
                dwCrit 			= "暴击 + ";
                dwFlee 			= "身法 + ";				
				dwPoJiaDiKang 	= "伤害抵御 + ";
			};
	star		= { 					--星名字     Img0 : 摇中的
				[1] = {Name = "破军";Img = "img://xingdou_01.png";Img0 = "img://xingdou_11.png";};
				[2] = {Name = "武曲";Img = "img://xingdou_02.png";Img0 = "img://xingdou_12.png";};
				[3] = {Name = "廉贞";Img = "img://xingdou_03.png";Img0 = "img://xingdou_13.png";};
				[4] = {Name = "文曲";Img = "img://xingdou_04.png";Img0 = "img://xingdou_14.png";};
				[5] = {Name = "禄存";Img = "img://xingdou_05.png";Img0 = "img://xingdou_15.png";};
				[6] = {Name = "巨门";Img = "img://xingdou_06.png";Img0 = "img://xingdou_16.png";};
				[7] = {Name = "贪狼";Img = "img://xingdou_07.png";Img0 = "img://xingdou_17.png";};
				[8] = {Name = "洞明";Img = "img://xingdou_08.png";Img0 = "img://xingdou_18.png";};   --套装星
				[9] = {Name = "隐元";Img = "img://xingdou_09.png";Img0 = "img://xingdou_19.png";};	  --隐元
			};
	Suit	= { 					--套装
				[1] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-阳明魂元】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[2] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-阴精魂神】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[3] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-真人魄元】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[4] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-玄冥魄精】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[5] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-丹元魄灵】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[6] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-北极魂灵】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>	     <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[7] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-天关魂明】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[8] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-七元解厄】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[9] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-紫微盛明】</font>";Condition = "满足以下条件后点击隐元星按钮即可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
				[10] = {Name= "<font color='#FFFF00'>【激活北斗七星阵套装效果-诸天万象】</font>";Condition = "满足以下条件后点击隐元星即按钮可升级</p><p>		 <font color='#FFFFFF'>1.星斗等级平均达%s级</font></p><p>		 <font color='#FFFFFF'>2.消耗%s:%s个</font></p><p>		 <font color='#FF0000'>(隐元星升级需要单独消耗星轨与摘星换斗消耗星轨无关）</font>";};
	};
	HideAttr	= { 					--隐元增益效果
				[1] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成20%</font>";Condition = "不包括隐元星在内的所有星斗等级均达10级";};
				[2] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成40%</font>";Condition = "不包括隐元星在内的所有星斗等级均达20级";};
				[3] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成60%</font>";Condition = "不包括隐元星在内的所有星斗等级均达30级";};
				[4] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成80%</font>";Condition = "不包括隐元星在内的所有星斗等级均达40级";};
				[5] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成100%</font>";Condition = "不包括隐元星在内的所有星斗等级均达50级";};
				[6] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成120%</font>";Condition = "不包括隐元星在内的所有星斗等级均达60级";};
				[7] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成140%</font>";Condition = "不包括隐元星在内的所有星斗等级均达70级";};
				[8] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成160%</font>";Condition = "不包括隐元星在内的所有星斗等级均达80级";};
				[9] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成200%</font>";Condition = "不包括隐元星在内的所有星斗等级均达90级";};
				[10] = {Name= "<font color='#FFFF00'>获得星斗经验额外加成240%</font>";Condition = "不包括隐元星在内的所有星斗等级均达95级";};
	};
	strHide1	= "<font color='#FFFFFF'>激活所需:%s</font>";	
	strHide2	= "<font color='#FFFFFF'>升级所需:%s</font>";		--
	strHide3	= "<p><font color='#4daeed'>激活后获得效果</font></p><p><font color='#C0C0C0'>%s</font></p>";
	strHide4	= "<p><font color='#4daeed'>当前效果:</font></p><p>%s</p><p><font color='#4daeed'>下级效果:</font></p><p>%s</p>";
	strHide5	= "<p><font color='#4daeed'>当前效果:</font></p><p>%s</p>";
	strSuit1	= "<font color='#FFFFFF'>激活所需：%s</font>";	
	strSuit2	= "<font color='#FFFFFF'>升级所需：%s</font>";		
	strSuit3	= "<p><font color='#4daeed'>激活后获得效果</font></p>%s<p>%s</p>";
	strSuit4	= "<p>当前效果:</p>%s<p>%s</p><p>下级效果:</p>%s<p>%s</p>";
	strSuit5	= "<p>当前效果:</p>%s<p>%s</p>";
	StrDo		= "（已激活）";					--激活
	StrNot		= "<font color='#FF0000'>（未激活）</font>";					--未激活
	StrLevel    = "<font color='#4daeed'>LV.%d</font>";						--LV.
	strAdd1		= "<p><font color='#4daeed'>当前效果:</font></p>";  
	strAdd2		= "";    	
	StarUplevel	= "";
	Exp1		= "<font color='#FFFFFF'>经验×%d</font>";
	Exp2        = "<font color='#FFFFFF'>经验×%d</font>";
	Exp3		= "<font color='#FFFFFF'>经验×%d</font>";
	Exp4		= "<font color='#FFFFFF'>经验×%d</font>";
	IsWait		= "大侠请稍安勿躁";			--点击太快提示
	IsNoCan1		= "免费拉杆次数不足";		
	IsNoCan2		= "请检查包裹内是否拥有足够数量的星灵和星轨";			
	IsNoCan3		= "元宝不足";		
	IsNoCan4		= "升级隐元星条件不足，无法升级";	
	IsNoCan5		= "没有足够的礼金";		
	IsNoCan6		= "请检查包裹内是否拥有足够数量的星灵和星轨";		
	IsNoCan7		= "摘星换斗所需星轨不足";	
	IsNoCan8		= "除隐元星以外的星斗已达满级！";		
	IsNoCan9		= "隐元星已达满级";		
	starbroadcast	= "恭喜大侠%s已将%s星斗升至%d级!";
	suitstrBroda	= "恭喜大侠%s已获得%s套装!";
	IsEnough		= "<font color='#FFFFFF'>%s</font>";								--物品充足
	IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足
	MaterialDescribe = "自动购买界面说明";
	IWantStr		= "我也试试！";
	IsNoHaveAut		= "对方还未开启北斗七星阵，无法查看";	--查看别人没有权限提示
	IsNoOnLine		= "被查看的玩家没在线";	--查看别人没有在线
	strVip		    = "VIP玩家每日可获得额外10次机会";	--查看别人没有在线
};
--摇奖控件控制
_G.MatrixMethodMcControl=
{
	TWEEN_TIME = 0.1;--单个滚动速度（秒）

	TIME       = 12;--整体滚动次数（个）
};
--特效级别控制
_G.MatrixMethodPfxConfig={
	[1] = {15,30,60};					--普通星特效级别控制 。
	[2] = {3,5,10};					    --套装星特效级别控制
	[3] = {1,2,3};						--隐元星特效级别控制
};

_G.HotUpdateTime = "10:00"; ----热更新时间
_G.MatrixMethodFlyXingNum= 15; ----经验飞入小白球数量
----套装星星等级特效配置表
_G.SuitStarEffectLevelConfig = {
	[1] = 6000101,
	[2] = 6000102,
	[3] = 6000103,
	[4] = 6000104,
	[5] = 6000105,
	[6] = 6000106,
	[7] = 6000107,
	[8] = 6000108,
	[9] = 6000109,
	[10] = 6000110,
	
}
-----套装星等级配置表
_G.SuitStarUpLevelConfig = {
	[1] = 10,  ----[1]套装星星等级 12 平均普通星星等级
	[2] = 20,
	[3] = 30,
	[4] = 40,
	[5] = 50,
	[6] = 60,
	[7] = 70,
	[8] = 80,
	[9] = 90,
	[10] = 100,
}

_G.HideStarUpLevelConfig = {
	[1] = 10,  ----[1]隐元星星等级 1 最小普通星星等级
	[2] = 20,
	[3] = 30,
	[4] = 40,
	[5] = 50,
	[6] = 60,
	[7] = 70,
	[8] = 80,
	[9] = 90,
	[10] = 95,
}

----广播配置表
_G.UpStarBroadCastConfig = {
	[1] = {  ----普通星星
		[1] = {15,30,60,90,100}, ---{30,60}, 多少等级可以广播
		[2] = {15,30,60,90,100},
		[3] = {15,30,60,90,100},
		[4] = {15,30,60,90,100},
		[5] = {15,30,60,90,100},
		[6] = {15,30,60,90,100},
		[7] = {15,30,60,90,100},
	},
	[2] = {3,5,7,9,10}, ---- 套装星星  {1,9} 多少等级可以广播
	[3] = {3,5,7,9,10}, ---- 洞明星 {1,9} 多少等级可以广播
}