-- 附加属性翻倍符配置
_G.LronClothConfig = {
	LronClothExpID = 4100440; --铁布衫经验消耗物品
	SuitID = 4100441; --铁布衫套装升级消耗物品
	TxNum = 3; --升级后倒数
	PfxConfig = {
		90007,				--倒数时的特效
		7000100,				--倒数完的特效
	};
	--战斗属性
	Shunxu = {"dwHPMax";"dwDefense";"dwForbidLimitParam";"dwCutHurtRate";}; --属性顺序显示
	ProperyName 	= { 																--TIPS属性字符串
				dwHPMax 		= "生命 + %d ";
				dwCritDown 		= "暴击抵抗 + %d ";
				dwAttack 		= "攻击 + %d "; 
                dwDefense 		= "防御 + %d ";
                dwCrit 			= "暴击 + %d ";
                dwFlee 			= "身法+ %d ";				
				dwRemitAttack 	= "霸体减伤 + %d";
				dwForbidLimitParam = "霸体值上限 + %d";
				dwCutHurtRate   = "霸体减伤 + %.1f%%";
			};
	ProperyName1 	= { 																--属性表属性字符串
				dwHPMax 		= "<font color='#FFFF00'>生命</font> + %d ";
				dwCritDown 		= "<font color='#FFFF00'>暴击抵抗</font> + %d ";
				dwAttack 		= "<font color='#FFFF00'>攻击</font> + %d "; 
                dwDefense 		= "<font color='#FFFF00'>防御</font> + %d ";
                dwCrit 			= "<font color='#FFFF00'>暴击</font> + %d ";
                dwFlee 			= "<font color='#FFFF00'>身法</font>+ %d ";				
				dwRemitAttack 	= "<font color='#FFFF00'>霸体减伤</font> + %d";
				dwForbidLimitParam = "<font color='#FFFF00'>霸体值上限</font> + %d";
				dwCutHurtRate   = "<font color='#FFFF00'>霸体减伤</font> + %.1f%%";
			};
	Suit	= { 					--套装
				[1] =  {Name = "套装名字1"; Level =10; ItemNum = 60;};    --Level需要铁布衫等级 ItemNum 消耗数量
				[2] =  {Name = "套装名字2"; Level =20; ItemNum = 140;};
				[3] =  {Name = "套装名字3"; Level =30; ItemNum = 230;};
				[4] =  {Name = "套装名字4"; Level =40; ItemNum = 330;};
				[5] =  {Name = "套装名字5"; Level =50; ItemNum = 450;};
				[6] =  {Name = "套装名字6"; Level =60; ItemNum = 590;};
				[7] =  {Name = "套装名字7"; Level =70; ItemNum = 760;};
				[8] =  {Name = "套装名字8"; Level =80; ItemNum = 960;};
				[9] =  {Name = "套装名字9"; Level =90; ItemNum = 1200;};
				[10] = {Name = "套装名字10";Level =100;ItemNum = 1480;};
	};				--技能开启等级				--彩色图标				--灰色图标
	SkillConfig = {	Level = 1,img = "Icon_Refine_tiebushan_1.png", grayImg = "Icon_Refine_tiebushan_0.png" , des = "<font color='#FFFF00'>金刚不坏功乃铁布衫修炼到一定境界时所领悟，属少林五大神功之一。运功时如穿金甲，刀枪不入，水火不侵。领悟后大幅减少自身所受伤害，效果显著</font>", name = "<font color='#FFFF00'>金刚不坏功</font>", enableMethod = "铁布衫修炼达%d级			金刚不坏功等级随铁布衫修炼等级增长",szType = "被动技能",szContinue = "<font color='#FFFF00'>金刚不坏功可提升自身伤害减免效果</font>"};
    -- 文本
    Text = {
			StrLv     		= "<font color='#4daeed'>Lv.%d</font>";			--等级配置
			StrBFH    		= "<font color='#FFFF00'>%.1f%%</font>";			-- 伤害减免数值
			StrPlay   		= "<font color='#FFFFFF'></font>";			-- 玩法说明
			shuomingTips    = "<font color='#FFFFFF'>用于抵御来自他人或怪物的伤害，抵御数值取决于铁布衫伤害减免效果</font><br/><font color='#4daeed'>霸体值恢复方法：<br/>1.击杀与自身等级相差10级的怪物<br/>2.服用归元散</font>";	    --说明tips
			tujingTips      = "<font color='#FFFFFF'>铁布衫修炼经验获取途径</font><br/><font color='#4daeed'>1.通过击杀与自身等级相差10级的怪物获得（固定经验）<br/>2.通过服用虎骨壮筋散快速获得</font>";		-- 途径Tips
			StrSkill        = "金刚不坏功乃铁布衫修炼到一定境界时所领悟，属少林五大神功之一。运功时如穿金甲，刀枪不入，水火不侵。领悟后大幅减少自身所受伤害，效果显著"; -- 铁布衫技能介绍
			StrContent      = "铁布衫乃少林派一门横练的外家功夫,修习者全身坚硬如铁,拳打脚踢不可损,刀劈斧斫亦不能伤.江湖传言此功臻入化境之时,格挡招架均可伤人,甚至可以获得入水不溺,入火不焚,闭气不绝、不食不饥等常人难以想象的神奇效果.但此功易学难精,究竟有多少人能成此神功不得而知.";		-- 铁布衫介绍
			SuitTips        = "<p><font color='#FFFF00' size='16'>【钢筋铁骨】</font>%s</p><p><font color='#FFFFFF'>当前等级：</font>%s</p>";		-- 套装Tips
			SuitTips1       = "<p><font color='#FFFFFF'>升级所需：满足以下条件后点击钢筋铁骨按钮即可升级</font></p><p><font color='#FFFFFF'>1.铁布衫修炼等级达%s级</font></p><p><font color='#FFFFFF'>2.消耗%s：%s个</font></p>";		-- 套装Tips
			SuitTips2       = "<p><font color='#4daeed'>激活后可获得增益效果</font></p>";		-- 套装Tips
			SuitTips3       = "<p><font color='#4daeed'>当前效果</font></p>";		-- 套装Tips
			SuitTips4       = "<p><font color='#4daeed'>下级效果</font></p>";		-- 套装Tips
			StrNum 			= "%d/%d";					--数值比
			IsEnough		= "<font color='#FFFFFF'>%s</font>";	--物品充足
			IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足
			IsDo       		= "（已激活）";		-- 激活
			IsNoDo      	= "<font color='#FF0000'>（未激活）</font>";		-- 未激活
			StrItem		    = "服用%s可快速获取修炼经验";		-- 服用%s可直接增长修炼经验
			broadcast	    = "恭喜大侠%s已将铁布衫修炼至%d级!";     --铁布衫广播
			broadcast1	    = "恭喜大侠%s已将铁布衫修炼至满级!";     --铁布衫满级广播
			Suitcast	    = "恭喜大侠%s已将铁布衫●钢筋铁骨修炼至%d级!";     --铁布衫套装广播
			Suitcast1	    = "恭喜大侠%s已将铁布衫●钢筋铁骨修炼至满级!";     --铁布衫套装满级广播
			ChangeDown	    = "霸体值%d";    				   --霸体值减少 霸体值管理字符串
			ChangeUp	    = "霸体值+%d";     			    	--霸体值增加
			ExpUp	    	= "铁布衫经验+%d";     			    	--霸体值增加
			IWantStr		= "我也试试！";                       --广播我也试试	
			IsNoCan1		= "钢筋铁骨已达满级";             --套装满级提示
			IsNoCan2		= "钢筋铁骨升级所需锻骨丹不足，无法升级";             --升级套装物品不足
			IsNoCan3		= "请检查包裹内是否拥有足够数量的虎骨壮筋散";           --铁布衫物品不足	
			IsNoCan4		= "对方还未开启铁布衫，无法查看";             --查看玩家失败
			IsNoCan5		=  "铁布衫修炼等级不足,无法升级";             --升级套装铁布衫级别不足			
			IsNoCan6		= "铁布衫修炼已达满级";             --铁布衫满级提示			
    };
	--铁布基本信息
	BasicInfo = {
	[1] = {Exp = 2000,ForbidLimit = 500,CutHurtRate = 0.050;};
	[2] = {Exp = 3000,ForbidLimit = 700,CutHurtRate = 0.051;};
	[3] = {Exp = 4000,ForbidLimit = 900,CutHurtRate = 0.052;};
	[4] = {Exp = 5000,ForbidLimit = 1100,CutHurtRate = 0.053;};
	[5] = {Exp = 6000,ForbidLimit = 1300,CutHurtRate = 0.054;};
	[6] = {Exp = 7000,ForbidLimit = 1500,CutHurtRate = 0.055;};
	[7] = {Exp = 8000,ForbidLimit = 1700,CutHurtRate = 0.056;};
	[8] = {Exp = 9000,ForbidLimit = 1900,CutHurtRate = 0.057;};
	[9] = {Exp = 10000,ForbidLimit = 2100,CutHurtRate = 0.058;};
	[10] = {Exp = 11000,ForbidLimit = 2300,CutHurtRate = 0.059;};
	[11] = {Exp = 14000,ForbidLimit = 2600,CutHurtRate = 0.060;};
	[12] = {Exp = 17000,ForbidLimit = 2900,CutHurtRate = 0.061;};
	[13] = {Exp = 20000,ForbidLimit = 3200,CutHurtRate = 0.062;};
	[14] = {Exp = 23000,ForbidLimit = 3500,CutHurtRate = 0.063;};
	[15] = {Exp = 26000,ForbidLimit = 3800,CutHurtRate = 0.064;};
	[16] = {Exp = 29000,ForbidLimit = 4100,CutHurtRate = 0.065;};
	[17] = {Exp = 32000,ForbidLimit = 4400,CutHurtRate = 0.066;};
	[18] = {Exp = 35000,ForbidLimit = 4700,CutHurtRate = 0.067;};
	[19] = {Exp = 38000,ForbidLimit = 5000,CutHurtRate = 0.068;};
	[20] = {Exp = 41000,ForbidLimit = 5300,CutHurtRate = 0.069;};
	[21] = {Exp = 46000,ForbidLimit = 5800,CutHurtRate = 0.070;};
	[22] = {Exp = 51000,ForbidLimit = 6300,CutHurtRate = 0.071;};
	[23] = {Exp = 56000,ForbidLimit = 6800,CutHurtRate = 0.072;};
	[24] = {Exp = 61000,ForbidLimit = 7300,CutHurtRate = 0.073;};
	[25] = {Exp = 66000,ForbidLimit = 7800,CutHurtRate = 0.074;};
	[26] = {Exp = 71000,ForbidLimit = 8300,CutHurtRate = 0.075;};
	[27] = {Exp = 76000,ForbidLimit = 8800,CutHurtRate = 0.076;};
	[28] = {Exp = 81000,ForbidLimit = 9300,CutHurtRate = 0.077;};
	[29] = {Exp = 86000,ForbidLimit = 9800,CutHurtRate = 0.078;};
	[30] = {Exp = 91000,ForbidLimit = 10300,CutHurtRate = 0.079;};
	[31] = {Exp = 98000,ForbidLimit = 11000,CutHurtRate = 0.081;};
	[32] = {Exp = 105000,ForbidLimit = 11700,CutHurtRate = 0.083;};
	[33] = {Exp = 112000,ForbidLimit = 12400,CutHurtRate = 0.085;};
	[34] = {Exp = 119000,ForbidLimit = 13100,CutHurtRate = 0.087;};
	[35] = {Exp = 126000,ForbidLimit = 13800,CutHurtRate = 0.089;};
	[36] = {Exp = 133000,ForbidLimit = 14500,CutHurtRate = 0.091;};
	[37] = {Exp = 140000,ForbidLimit = 15200,CutHurtRate = 0.093;};
	[38] = {Exp = 147000,ForbidLimit = 15900,CutHurtRate = 0.095;};
	[39] = {Exp = 154000,ForbidLimit = 16600,CutHurtRate = 0.097;};
	[40] = {Exp = 161000,ForbidLimit = 17300,CutHurtRate = 0.099;};
	[41] = {Exp = 171000,ForbidLimit = 18200,CutHurtRate = 0.102;};
	[42] = {Exp = 181000,ForbidLimit = 19100,CutHurtRate = 0.105;};
	[43] = {Exp = 191000,ForbidLimit = 20000,CutHurtRate = 0.108;};
	[44] = {Exp = 201000,ForbidLimit = 20900,CutHurtRate = 0.111;};
	[45] = {Exp = 211000,ForbidLimit = 21800,CutHurtRate = 0.114;};
	[46] = {Exp = 221000,ForbidLimit = 22700,CutHurtRate = 0.117;};
	[47] = {Exp = 231000,ForbidLimit = 23600,CutHurtRate = 0.120;};
	[48] = {Exp = 241000,ForbidLimit = 24500,CutHurtRate = 0.123;};
	[49] = {Exp = 251000,ForbidLimit = 25400,CutHurtRate = 0.126;};
	[50] = {Exp = 261000,ForbidLimit = 26300,CutHurtRate = 0.129;};
	[51] = {Exp = 276000,ForbidLimit = 27500,CutHurtRate = 0.133;};
	[52] = {Exp = 291000,ForbidLimit = 28700,CutHurtRate = 0.137;};
	[53] = {Exp = 306000,ForbidLimit = 29900,CutHurtRate = 0.141;};
	[54] = {Exp = 321000,ForbidLimit = 31100,CutHurtRate = 0.145;};
	[55] = {Exp = 336000,ForbidLimit = 32300,CutHurtRate = 0.149;};
	[56] = {Exp = 351000,ForbidLimit = 33500,CutHurtRate = 0.153;};
	[57] = {Exp = 366000,ForbidLimit = 34700,CutHurtRate = 0.157;};
	[58] = {Exp = 381000,ForbidLimit = 35900,CutHurtRate = 0.161;};
	[59] = {Exp = 396000,ForbidLimit = 37100,CutHurtRate = 0.165;};
	[60] = {Exp = 411000,ForbidLimit = 38300,CutHurtRate = 0.169;};
	[61] = {Exp = 432000,ForbidLimit = 39800,CutHurtRate = 0.173;};
	[62] = {Exp = 453000,ForbidLimit = 41300,CutHurtRate = 0.177;};
	[63] = {Exp = 474000,ForbidLimit = 42800,CutHurtRate = 0.181;};
	[64] = {Exp = 495000,ForbidLimit = 44300,CutHurtRate = 0.185;};
	[65] = {Exp = 516000,ForbidLimit = 45800,CutHurtRate = 0.189;};
	[66] = {Exp = 537000,ForbidLimit = 47300,CutHurtRate = 0.193;};
	[67] = {Exp = 558000,ForbidLimit = 48800,CutHurtRate = 0.197;};
	[68] = {Exp = 579000,ForbidLimit = 50300,CutHurtRate = 0.201;};
	[69] = {Exp = 600000,ForbidLimit = 51800,CutHurtRate = 0.205;};
	[70] = {Exp = 621000,ForbidLimit = 53300,CutHurtRate = 0.209;};
	[71] = {Exp = 649000,ForbidLimit = 55100,CutHurtRate = 0.213;};
	[72] = {Exp = 677000,ForbidLimit = 56900,CutHurtRate = 0.217;};
	[73] = {Exp = 705000,ForbidLimit = 58700,CutHurtRate = 0.221;};
	[74] = {Exp = 733000,ForbidLimit = 60500,CutHurtRate = 0.225;};
	[75] = {Exp = 761000,ForbidLimit = 62300,CutHurtRate = 0.229;};
	[76] = {Exp = 789000,ForbidLimit = 64100,CutHurtRate = 0.233;};
	[77] = {Exp = 817000,ForbidLimit = 65900,CutHurtRate = 0.237;};
	[78] = {Exp = 845000,ForbidLimit = 67700,CutHurtRate = 0.241;};
	[79] = {Exp = 873000,ForbidLimit = 69500,CutHurtRate = 0.245;};
	[80] = {Exp = 901000,ForbidLimit = 71300,CutHurtRate = 0.249;};
	[81] = {Exp = 935000,ForbidLimit = 73400,CutHurtRate = 0.254;};
	[82] = {Exp = 969000,ForbidLimit = 75500,CutHurtRate = 0.259;};
	[83] = {Exp = 1003000,ForbidLimit = 77600,CutHurtRate = 0.264;};
	[84] = {Exp = 1037000,ForbidLimit = 79700,CutHurtRate = 0.269;};
	[85] = {Exp = 1071000,ForbidLimit = 81800,CutHurtRate = 0.274;};
	[86] = {Exp = 1105000,ForbidLimit = 83900,CutHurtRate = 0.279;};
	[87] = {Exp = 1139000,ForbidLimit = 86000,CutHurtRate = 0.284;};
	[88] = {Exp = 1173000,ForbidLimit = 88100,CutHurtRate = 0.289;};
	[89] = {Exp = 1207000,ForbidLimit = 90200,CutHurtRate = 0.294;};
	[90] = {Exp = 1241000,ForbidLimit = 92300,CutHurtRate = 0.299;};
	[91] = {Exp = 1281000,ForbidLimit = 94700,CutHurtRate = 0.304;};
	[92] = {Exp = 1321000,ForbidLimit = 97100,CutHurtRate = 0.309;};
	[93] = {Exp = 1361000,ForbidLimit = 99500,CutHurtRate = 0.314;};
	[94] = {Exp = 1401000,ForbidLimit = 101900,CutHurtRate = 0.319;};
	[95] = {Exp = 1441000,ForbidLimit = 104300,CutHurtRate = 0.324;};
	[96] = {Exp = 1481000,ForbidLimit = 106700,CutHurtRate = 0.329;};
	[97] = {Exp = 1521000,ForbidLimit = 109100,CutHurtRate = 0.334;};
	[98] = {Exp = 1561000,ForbidLimit = 111500,CutHurtRate = 0.339;};
	[99] = {Exp = 1601000,ForbidLimit = 113900,CutHurtRate = 0.344;};
	[100] = {Exp = 0,ForbidLimit = 116300,CutHurtRate = 0.350;};
	};
	--铁布衫广播消息
	BroadCastLevel = {
		ClothLevel = 30;  --铁布衫等级
		SuitLevel = 1;  --套装等级
	};

		--铁布衫套装特效控制
	SuitPfxLevel = {[1] = 3,[2] = 6,[3] = 10}; -- 大于等于[1] 小于[2]为特效1 ，大于等于[2] 小于[3]为特效2 ，大于等于[3] 为特效3
	MaxSuitLevel = 10;
	IsMaxFlg = false;		--批量使用 初始化数量 false 时 为1 ，true时为当前拥有数（不大约 99）
};

--消耗物品得经验值
--参数 ItemID 类型: number 消耗物品ID
--返回 dwExp  类型: number  消耗一个物品获得经验
function LronClothConfig:GetExpByItemID(ItemID)
	local dwExp  = 5000
	return dwExp
end
--套装等级消耗道具数量

--通过套装级别获取消耗信息
--参数 dwClothLevel:铁布衫等级   dwSuitLevel:套装等级
--返回 ConInof = {ItemID =4100441,ItemNum = 1  }  类型: Table  套装等级   ItemID 消耗物品ID ItemNum 消耗数量
function LronClothConfig:GetSuitConByLevel(dwClothLevel, dwSuitLevel)
	local ConInof = {ItemID =self.SuitID,ItemNum =self.Suit[dwSuitLevel].ItemNum } 
	return ConInof
end

--铁布衫基础减伤比例
--参数：objPlayer:玩家对象   dwClothLevel:铁布衫等级  dwForbidValue:当前霸体值  dwClothExp:当前铁布衫经验
function LronClothConfig:BasicCurtHurtRate(objPlayer, dwClothLevel, dwClothExp, dwForbidValue)
	local curtRate = _G.LronClothConfig.BasicInfo[dwClothLevel].CutHurtRate;
	return curtRate;
end;


-- local LronProperty = {
	-- dwHPMax = 0,  --血量max
	-- dwMPMax = 0,	--内力max
	-- dwAttack = 0,	--攻击
	-- dwDefense = 0, --防御
	-- dwFlee = 0,	--身法
	-- dwCrit = 0,	--暴击
	-- dwMoveSpeed = 0,   --移动速度
	-- dwAttackSpeed = 0,   --攻击速度
	--dwCritDown = 0,      --暴击抵抗 
	--dwRemitAttack          --伤害减免（铁布衫专用）
	
	--dwForbidLimitParam = 0	--霸体值上限(非基础属性)
	--dwCutHurtRate = 0.02;	--附加减伤比例(非基础属性)
-- }
--铁布衫套装属性
local SetAttribute =
{
	[1]= {dwHPMax=1000,dwAttack=0,dwDefense=100,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =3000, dwCutHurtRate =0.02};
	[2]= {dwHPMax=2000,dwAttack=0,dwDefense=200,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =4000, dwCutHurtRate =0.04};
	[3]= {dwHPMax=4000,dwAttack=0,dwDefense=400,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =6000, dwCutHurtRate =0.06};
	[4]= {dwHPMax=7000,dwAttack=0,dwDefense=700,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =9000, dwCutHurtRate =0.08};
	[5]= {dwHPMax=11000,dwAttack=0,dwDefense=1100,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =14000, dwCutHurtRate =0.1};
	[6]= {dwHPMax=16000,dwAttack=0,dwDefense=1600,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =21000, dwCutHurtRate =0.12};
	[7]= {dwHPMax=23000,dwAttack=0,dwDefense=2300,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =30000, dwCutHurtRate =0.14};
	[8]= {dwHPMax=32000,dwAttack=0,dwDefense=3200,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =42000, dwCutHurtRate =0.16};
	[9]= {dwHPMax=42000,dwAttack=0,dwDefense=4200,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =57000, dwCutHurtRate =0.18};
	[10]= {dwHPMax=62000,dwAttack=0,dwDefense=6200,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =80000, dwCutHurtRate =0.2};
}
--铁布衫套装增加属性
--参数： dwClothLevel：铁布衫等级  dwSuitLevel：铁布衫套装等级
function LronClothConfig:GetSuitProperty(objPlayer,dwClothLevel,dwSuitLevel)
	local Attr = {dwHPMax=0,dwAttack=0,dwDefense=0,dwCrit=0,dwFlee=0,dwCritDown=0, dwForbidLimitParam =0, dwCutHurtRate =0}
	if dwSuitLevel ==0 then return Attr end
	Attr   = SetAttribute[dwSuitLevel];
	return Attr;
end;



--检测套装是否可以升级 dwClothLevel:当前铁布衫等级, dwSuitLevel：当前套装等级
function LronClothConfig:CheckActivationSuit(objPlayer, dwClothLevel, dwSuitLevel)
	local suitLevel = (dwSuitLevel or 0) + 1;
	local bUpLevelFlag = false;
	local basicSuitTbl = self.Suit
	if not basicSuitTbl[suitLevel] then
		bUpLevelFlag = false;
	else
		if dwClothLevel >= basicSuitTbl[suitLevel].Level then
			bUpLevelFlag = true;
		else
			bUpLevelFlag = false;			
		end;
	end;
	return bUpLevelFlag;
end;

--怪物死亡增加修炼经验
function LronClothConfig:AddExp(objPlayer, objMon)
	local dwLevel = objPlayer:GetInfo().dwLevel;   --玩家等级
	--获得怪物的等级
	local dwMonsterLevel = objMon:GetLevel();   --玩家等级
	local dwExp = 0;
    if math.abs(dwLevel - dwMonsterLevel) > 10 then
	   dwExp = 0;
	else
		dwExp = 1;
	end;
	return dwExp;
end;
--霸体值恢复
local BtRecovery = {
	[1] = 62;
	[2] =63;
	[3] =64;
	[4] =64;
	[5] =65;
	[6] =65;
	[7] =65;
	[8] =65;
	[9] =65;
	[10] =65;
	[11] =68;
	[12] =70;
	[13] =72;
	[14] =74;
	[15] =76;
	[16] =77;
	[17] =78;
	[18] =79;
	[19] =80;
	[20] =81;
	[21] =85;
	[22] =88;
	[23] =91;
	[24] =94;
	[25] =97;
	[26] =100;
	[27] =102;
	[28] =104;
	[29] =106;
	[30] =108;
	[31] =112;
	[32] =115;
	[33] =119;
	[34] =122;
	[35] =125;
	[36] =128;
	[37] =131;
	[38] =133;
	[39] =136;
	[40] =138;
	[41] =142;
	[42] =145;
	[43] =149;
	[44] =152;
	[45] =155;
	[46] =158;
	[47] =161;
	[48] =164;
	[49] =167;
	[50] =169;
	[51] =174;
	[52] =178;
	[53] =182;
	[54] =186;
	[55] =190;
	[56] =193;
	[57] =197;
	[58] =200;
	[59] =203;
	[60] =207;
	[61] =211;
	[62] =216;
	[63] =220;
	[64] =224;
	[65] =229;
	[66] =233;
	[67] =236;
	[68] =240;
	[69] =244;
	[70] =247;
	[71] =252;
	[72] =257;
	[73] =262;
	[74] =266;
	[75] =270;
	[76] =275;
	[77] =279;
	[78] =283;
	[79] =287;
	[80] =291;
	[81] =295;
	[82] =300;
	[83] =305;
	[84] =310;
	[85] =314;
	[86] =319;
	[87] =323;
	[88] =327;
	[89] =331;
	[90] =335;
	[91] =340;
	[92] =345;
	[93] =350;
	[94] =355;
	[95] =359;
	[96] =364;
	[97] =368;
	[98] =372;
	[99] =377;
	[100] =381;
	[101]=381;
};
--怪物死亡增加霸体值
function LronClothConfig:AddForbidValue(objPlayer, dwMonsterLevel)
	local dwLevel = objPlayer:GetInfo().dwLevel;   --玩家等级
	local tieBuShanSystem = objPlayer:GetSystem("CTieBuShanSystem");
	local dwClothLevel = 0;--铁布衫等级
	if tieBuShanSystem then
		dwClothLevel = tieBuShanSystem:GetClothLevel();
	end;
	local dwForbidValue = 0;
	if math.abs(dwLevel - dwMonsterLevel) > 10 then
		dwForbidValue = 0;
	else
		dwForbidValue = BtRecovery[dwClothLevel+1];
	end;

	return dwForbidValue;
end;