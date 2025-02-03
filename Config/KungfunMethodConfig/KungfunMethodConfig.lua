--功法扩展配置文件

_G.KungFuEnum = {
	YiJingJing = 1;		--易筋经
	MatrixMethod = 2;	--北斗七星阵
	TieBuShan = 3;		--铁布衫
	TongLaoGong = 4;	--童姥功
    Gourd = 5;          -- 酒葫芦
    HiddenWeapon = 6;	-- 暗器
    Banner = 7;			-- 战旗
    Shield = 8;			-- 法宝
    Practice = 9;		-- 修行
    ErrantHonor = 10;	-- 腰牌
};

_G.KungFuEnumHide = {
	YiJingJing = true;		--易筋经
	MatrixMethod = true;	--北斗七星阵 false;
	TieBuShan = true;		--铁布衫
	TongLaoGong = true;		--童姥功
    Gourd = true;           --酒葫芦
    HiddenWeapon = true;    --暗器
    Banner = false;          --战旗
    Shield = false;          --法宝
    Practice = false;        --修行
    ErrantHonor = false;     --腰牌
};

-- attrName 属性的归属系统名 从Server\GameService\PlayerInfoDefine.lua中找
-- authorityName 权限系统配置名称 从Config\AuthorityConfig.lua中找
_G.KungFuExtendConfig = {
	[KungFuEnum.YiJingJing]={		
		attrName = "KungFu";
		authorityName = "YiJinJing";
		Data =
		{	
			--消耗物品数量   物品数量     消耗银币数量
			Consume = {itemId = 2500343; itemCount = 3; silver = 0;};
			--增加的属性+攻击 +防御 +生命 +暴击抵抗
			attr = {dwAttack = 60; dwDefense = 30; dwHPMax = 500; dwCritDown = 5;};
			baseAttr = {dwAttack = 0; dwDefense = 0; dwHPMax = 0; dwCritDown = 175;};
		};
		tLevel = {
			[0] = {maxCount = 0;};
			--0等级策划不需要配 但是需要保留
			[1] = {maxCount = 15;};
			[2] = {maxCount = 25;};
			[3] = {maxCount = 45;};
			[4] = {maxCount = 60;};
			[5] = {maxCount = 90;};
			[6] = {maxCount = 125;};
			[7] = {maxCount = 175;};
			[8] = {maxCount = 235;};
			[9] = {maxCount = 295;};
			[10] = {maxCount = 345;};
			[11] = {maxCount = 395;};
			[12] = {maxCount = 465;};
		};
		-- 界面配置
		UI = 
		{
			--配置批量使用界面对应系统图片	
			Img = "img://gf_yijinjing_famai.png";
			txt1 = "伐脉次数:";
			txt2 = "消耗物品:";
			txt3 = "消耗数量:";
			txt4 = "操作次数";
			txt5 = "开始伐脉";
			BtnTips = "<font color='#4daeed'>点击按钮进行伐脉</font>"; 
			ImgTips = "<font color='#4daeed'>已伐脉次数：</font><font color='#00FF00'>%s</font><br/>";
			ImgTips1 = "<font color='#4daeed'>下阶最大伐脉次数：%d</font>";
			ImgTips2 = "<br/><font color ='#FFFF00'>伐脉属性加成"; 
			ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：易筋经领悟第%s式"; --升阶所需
			Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwCritDown";}; --属性顺序显示
			IsNoCan1 = "伐脉次数已达本阶上限！"; --上限
			IsNoCan2 = "所需道具不足！"; --物品不足
			IsNoCan3 = "所需金钱不足！"; --金钱
			IsSuccess = "伐脉成功！"; -- 伐脉操作成功
			IsSuccess1 = "功能尚未开启，需易筋经领悟第一式 ";
			BroadCast1 = "恭喜%s大侠伐脉再进一阶，功力更进一步！";
			BroadCast2 = "恭喜%s大侠伐脉达到最高境界，功力深不可测！";
			ProperyName = { 																--TIPS属性字符串
				dwHPMax 		= "生命 + ";
				dwAttack 		= "攻击 + "; 
				dwDefense 		= "防御 + ";
				dwCritDown			= "暴击抵抗 + ";
			};
		};
	};
	[KungFuEnum.MatrixMethod]={
		attrName = "MatrixMethod";
		authorityName = "MatrixMethod";
		Data =
		{	
			--消耗物品数量   物品数量     消耗银币数量
			Consume = {itemId = 2500345; itemCount = 3; silver = 0;};
			--增加的属性+攻击 +防御 +生命 +身法	
			attr = {dwAttack = 70; dwDefense = 50; dwHPMax = 350; dwFlee = 5;};
			baseAttr = {dwAttack = 0; dwDefense = 0; dwHPMax = 0; dwFlee = 200;};
		};
		tLevel = {
			[0] = {maxCount = 0;};
			--0等级策划不需要配 但是需要保留
			[1] = {maxCount = 10;};
			[2] = {maxCount = 35;};
			[3] = {maxCount = 55;};
			[4] = {maxCount = 90;};
			[5] = {maxCount = 155;};
			[6] = {maxCount = 205;};
			[7] = {maxCount = 265;};
			[8] = {maxCount = 315;};
			[9] = {maxCount = 395;};
			[10] = {maxCount = 485;};
		};
		-- 界面配置
		UI = 
		{
			--配置批量使用界面对应系统图片	
			Img = "img://gf_beidouqixingzhen_xuangong.png";
			txt1 = "玄宫次数:";
			txt2 = "消耗物品:";
			txt3 = "消耗数量:";
			txt4 = "操作次数";
			txt5 = "开始玄宫";
			BtnTips = "<font color='#4daeed'>点击按钮进行玄宫</font>"; 
			ImgTips = "<font color='#4daeed'>玄宫次数：</font><font color='#00FF00'>%s</font><br/>";
			ImgTips1 = "<font color='#4daeed'>下阶最大玄宫次数：%d</font>";
			ImgTips2 = "<br/><font color ='#FFFF00'>玄宫属性加成"; 
			ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：星斗洞明达到%s级"; --升阶所需
			Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwFlee";}; --属性顺序显示
			IsNoCan1 = "玄宫次数已达本阶上限！"; --上限
			IsNoCan2 = "所需道具不足！"; --物品不足
			IsNoCan3 = "所需金钱不足！"; --金钱
			IsSuccess = "玄宫成功！"; -- 玄宫操作成功
			IsSuccess1 = "功能尚未开启，需星斗洞明达到1级 ";
			BroadCast1 = "恭喜%s大侠玄宫再进一阶，功力更进一步！";
			BroadCast2 = "恭喜%s大侠玄宫达到最高境界，功力深不可测！";
			ProperyName = { 																--TIPS属性字符串
				dwHPMax 		= "生命 + ";
				dwAttack 		= "攻击 + ";
				dwDefense 		= "防御 + ";
				dwFlee			= "身法 + ";
			};
		};
	};
	[KungFuEnum.TieBuShan]={
		attrName = "TieBuShan";
		authorityName = "LronCloth";
		Data =
		{	
			--消耗物品数量   物品数量     消耗银币数量
			Consume = {itemId = 2500347; itemCount = 3; silver = 0;};
			--增加的属性+攻击 +防御 +生命 +伤害抵御	
			attr = {dwAttack = 60; dwDefense = 100; dwHPMax = 300; dwDefenseValue = 5;};
			baseAttr = {dwAttack = 0; dwDefense = 0; dwHPMax = 0; dwDefenseValue = 300;};
		};
		tLevel = {
			[0] = {maxCount = 0;};
			--0等级策划不需要配 但是需要保留
			[1] = {maxCount = 10;};
			[2] = {maxCount = 25;};
			[3] = {maxCount = 40;};
			[4] = {maxCount = 60;};
			[5] = {maxCount = 110;};
			[6] = {maxCount = 160;};
			[7] = {maxCount = 225;};
			[8] = {maxCount = 300;};
			[9] = {maxCount = 375;};
			[10] = {maxCount = 485;};
		};
		-- 界面配置
		UI = 
		{
			--配置批量使用界面对应系统图片	
			Img = "img://gf_tiebushan_lianti.png";
			txt1 = "炼体次数:";
			txt2 = "消耗物品:";
			txt3 = "消耗数量:";
			txt4 = "操作次数";
			txt5 = "开始炼体";
			BtnTips = "<font color='#4daeed'>点击按钮进行炼体</font>"; 
			ImgTips = "<font color='#4daeed'>已炼体次数：</font><font color='#00FF00'>%s</font><br/>";
			ImgTips1 = "<font color='#4daeed'>下阶最大炼体次数：%d</font>";
			ImgTips2 = "<br/><font color ='#FFFF00'>炼体属性加成"; 
			ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：钢筋铁骨达到%s级"; --升阶所需
			Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwDefenseValue";}; --属性顺序显示
			IsNoCan1 = "炼体次数已达本阶上限！"; --上限
			IsNoCan2 = "所需道具不足！"; --物品不足
			IsNoCan3 = "所需金钱不足！"; --金钱
			IsSuccess = "炼体成功！"; -- 炼体操作成功
			IsSuccess1 = "功能尚未开启，需钢筋铁骨达到1级 ";
			BroadCast1 = "恭喜%s大侠炼体再进一阶，功力更进一步！";
			BroadCast2 = "恭喜%s大侠炼体达到最高境界，功力深不可测！";
			ProperyName = { 																--TIPS属性字符串
				dwHPMax 		= "生命 + ";
				dwAttack 		= "攻击 + "; 
				dwDefense 		= "防御 + ";
				dwDefenseValue	= "伤害抵御 + ";
			};
		};
	};

	[KungFuEnum.TongLaoGong]={
		attrName = "PractiseSkill";
		authorityName = "PractiseSkill";
		Data =
		{	
			--消耗物品数量   物品数量     消耗银币数量
			Consume = {itemId = 2500359; itemCount = 3; silver = 0;};
			--增加的属性+攻击 +防御 +生命 +伤害抵御	
			attr = {dwAttack = 45; dwDefense = 105; dwHPMax = 340; dwPoJiaValue = 3; dwAppendCrit= 4;};
			baseAttr = {dwAttack = 0; dwDefense = 0; dwHPMax = 0; dwPoJiaValue = 275; dwAppendCrit= 245;};
		};
		tLevel = {
			[0] = {maxCount = 0;};
			--0等级策划不需要配 但是需要保留
			[1] = {maxCount = 10;};
			[2] = {maxCount = 20;};
			[3] = {maxCount = 45;};
			[4] = {maxCount = 90;};
			[5] = {maxCount = 175;};
			[6] = {maxCount = 310;};
			[7] = {maxCount = 505;};

		};
		-- 界面配置
		UI = 
		{
			--配置批量使用界面对应系统图片	
			Img = "img://gf_tonglaogong_huantong.png";
			txt1 = "还童次数:";
			txt2 = "消耗物品:";
			txt3 = "消耗数量:";
			txt4 = "操作次数";
			txt5 = "开始还童";
			BtnTips = "<font color='#4daeed'>点击按钮进行还童</font>"; 
			ImgTips = "<font color='#4daeed'>已还童次数：</font><font color='#00FF00'>%s</font><br/>";
			ImgTips1 = "<font color='#4daeed'>下阶最大还童次数：%d</font>";
			ImgTips2 = "<br/><font color ='#FFFF00'>还童属性加成"; 
			ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：童姥功修炼阶段达到%s重"; --升阶所需
			Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwPoJiaValue";"dwAppendCrit";}; --属性顺序显示
			IsNoCan1 = "还童次数已达本阶上限！"; --上限
			IsNoCan2 = "所需道具不足！"; --物品不足
			IsNoCan3 = "所需金钱不足！"; --金钱
			IsSuccess = "还童成功！"; -- 还童操作成功
			IsSuccess1 = "功能尚未开启，需童姥功修炼阶段达到1重 ";
			BroadCast1 = "恭喜%s大侠还童再进一阶，功力更进一步！";
			BroadCast2 = "恭喜%s大侠还童达到最高境界，功力深不可测！";
			ProperyName = { 																--TIPS属性字符串
				dwHPMax 		= "生命 + ";
				dwAttack 		= "攻击 + ";
				dwDefense 		= "防御 + ";
				dwPoJiaValue	= "破甲攻击 + ";
				dwAppendCrit    = "暴击伤害 + ";
			};
		};
	};

    [KungFuEnum.Gourd]={
        attrName = "Gourd";
        authorityName = "Gourd";
        Data =
        {   
            --消耗物品数量   物品数量     消耗银币数量
            Consume = {itemId = 2500367; itemCount = 4; silver = 0;};
            --增加的属性+攻击 +防御 +生命 +暴击 +暴击伤害    
            attr = {dwAttack = 120; dwDefense = 100; dwHPMax = 240; dwCrit = 6; dwAppendCrit= 3;};
            baseAttr = {dwAttack = 0; dwDefense = 0; dwHPMax = 0; dwCrit = 600; dwAppendCrit= 500;};
        };
        tLevel = {
            [0] = {maxCount = 0;};
            --0等级策划不需要配 但是需要保留
			[1] = {maxCount = 0;};
			[2] = {maxCount = 0;};
			[3] = {maxCount = 0;};
			[4] = {maxCount = 0;};
			[5] = {maxCount = 0;};
			[6] = {maxCount = 0;};
			[7] = {maxCount = 0;};
			[8] = {maxCount = 0;};
			[9] = {maxCount = 0;};
			[10] = {maxCount = 0;};
			[11] = {maxCount = 0;};
			[12] = {maxCount = 0;};
			[13] = {maxCount = 0;};
			[14] = {maxCount = 0;};
			[15] = {maxCount = 0;};
			[16] = {maxCount = 0;};
			[17] = {maxCount = 0;};
			[18] = {maxCount = 0;};
			[19] = {maxCount = 0;};
			[20] = {maxCount = 0;};
			[21] = {maxCount = 0;};
			[22] = {maxCount = 0;};
			[23] = {maxCount = 0;};
			[24] = {maxCount = 0;};
			[25] = {maxCount = 0;};
			[26] = {maxCount = 80;};
			[27] = {maxCount = 120;};
			[28] = {maxCount = 160;};
			[29] = {maxCount = 200;};
			[30] = {maxCount = 240;};
			[31] = {maxCount = 300;};
			[32] = {maxCount = 360;};
			[33] = {maxCount = 420;};
			[34] = {maxCount = 480;};
			[35] = {maxCount = 540;};
			[36] = {maxCount = 620;};
			[37] = {maxCount = 700;};
			[38] = {maxCount = 780;};
			[39] = {maxCount = 860;};
			[40] = {maxCount = 940;};
			[41] = {maxCount = 1040;};
			[42] = {maxCount = 1140;};
			[43] = {maxCount = 1240;};
			[44] = {maxCount = 1340;};
			[45] = {maxCount = 1440;};

        };
        -- 界面配置
        UI = 
        {
            --配置批量使用界面对应系统图片    
            Img = "img://jiuhulu_paozhi.png";
            txt1 = "炮制次数:";
            txt2 = "消耗道具:";
            txt3 = "消耗数量:";
            txt4 = "操作次数";
            txt5 = "开始炮制";
            BtnTips = "<font color='#4daeed'>点击可进行炮制操作</font>"; 
            ImgTips = "已炮制：%s<br/>";
            ImgTips1 = "<font color='#4daeed'>下级炮制次数：%s</font>";
            ImgTips2 = "<br/><font color ='#FFFF00'>炮制属性加成："; 
            ImgTips3 = "<br/><font color ='#FF0000'>升阶所需:酒葫芦达到%s阶"; --升阶所需
            ImgTips4 = "<br/><font color ='#FF0000'>开启所需：酒葫芦达到6阶<br/>"; 		--开启所需
            Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwCrit";"dwAppendCrit";}; --属性顺序显示
            IsNoCan1 = "炮制已达本级上限！"; --上限
            IsNoCan2 = "道具不足，操作失败"; --物品不足
            IsNoCan3 = "所需金钱不足！"; --金钱
            IsSuccess = "操作成功！"; -- 操作成功
            IsSuccess1 = "炮制暂未开启需要酒葫芦到达6阶 ";
            BroadCast1 = "恭喜%s大侠炮制酒葫芦再进一级，功力更进一步！";
            BroadCast2 = "恭喜%s大侠炮制酒葫芦达到最高境界，功力深不可测！";
            ProperyName = {                                                                 --TIPS属性字符串
                dwHPMax         = "生命 + ";
                dwAttack        = "攻击 + ";
                dwDefense       = "防御 + ";
                dwCrit   		= "暴击 + ";
                dwAppendCrit    = "暴击伤害 + ";
            };
		};
    };

    [KungFuEnum.HiddenWeapon]={
        attrName = "HiddenWeapon";
        authorityName = "HiddenWeapon";
        Data =
        {   
            --消耗物品数量   物品数量     消耗银币数量
            Consume = {itemId = 4100530; itemCount = 1; silver = 0;};
            --增加的属性+攻击 +防御 +生命 +伤害抵御    
            attr = {dwAttack = 300; dwCrit = 7; dwHPMax = 400; dwAppendCrit= 6;};
            baseAttr = {dwAttack = 0; dwCrit = 0; dwHPMax = 0; dwAppendCrit= 0;};
        };
        tLevel = {
            [0] = {maxCount = 0;};
            --0等级策划不需要配 但是需要保留
            [1] = {maxCount = 10;};
			[2] = {maxCount = 15;};
			[3] = {maxCount = 20;};
			[4] = {maxCount = 25;};
			[5] = {maxCount = 30;};
			[6] = {maxCount = 40;};
			[7] = {maxCount = 50;};
			[8] = {maxCount = 60;};
			[9] = {maxCount = 70;};
			[10] = {maxCount = 80;};
			[11] = {maxCount = 95;};
			[12] = {maxCount = 110;};
			[13] = {maxCount = 125;};
			[14] = {maxCount = 140;};
			[15] = {maxCount = 155;};
			[16] = {maxCount = 185;};
			[17] = {maxCount = 215;};
			[18] = {maxCount = 245;};
			[19] = {maxCount = 275;};
			[20] = {maxCount = 305;};
			[21] = {maxCount = 350;};
			[22] = {maxCount = 395;};
			[23] = {maxCount = 440;};
			[24] = {maxCount = 485;};
			[25] = {maxCount = 530;};
			[26] = {maxCount = 590;};
			[27] = {maxCount = 650;};
			[28] = {maxCount = 710;};
			[29] = {maxCount = 770;};
			[30] = {maxCount = 830;};
			[31] = {maxCount = 905;};
			[32] = {maxCount = 980;};
			[33] = {maxCount = 1055;};
			[34] = {maxCount = 1130;};
			[35] = {maxCount = 1205;};
			[36] = {maxCount = 1295;};
			[37] = {maxCount = 1385;};
			[38] = {maxCount = 1475;};
			[39] = {maxCount = 1565;};
			[40] = {maxCount = 1655;};
        };
        -- 界面配置
        UI = 
        {
            --配置批量使用界面对应系统图片    
            Img = "img://gf_anqi_cuidu.png";
            txt1 = "淬毒次数:";
            txt2 = "消耗物品:";
            txt3 = "消耗数量:";
            txt4 = "操作次数";
            txt5 = "开始淬毒";
            BtnTips = "<font color='#4daeed'>点击按钮进行淬毒</font>"; 
            ImgTips = "<font color='#4daeed'>已淬毒次数：</font><font color='#00FF00'>%s</font><br/>";
            ImgTips1 = "<font color='#4daeed'>下级最大淬毒次数：%d</font>";
            ImgTips2 = "<br/><font color ='#FFFF00'>淬毒属性加成"; 
            ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：暗器修炼阶段达到%s阶"; --升阶所需
            ImgTips4 = "<br/><font color ='#FF0000'>开启所需：暗器达到1阶<br/>"; 		--开启所需			
            Shunxu = {"dwHPMax";"dwAttack";"dwCrit";"dwAppendCrit";}; --属性顺序显示
            IsNoCan1 = "淬毒次数已达本阶上限！"; --上限
            IsNoCan2 = "所需道具不足！"; --物品不足
            IsNoCan3 = "所需金钱不足！"; --金钱
            IsSuccess = "淬毒成功！"; -- 还童操作成功
            IsSuccess1 = "功能尚未开启，需暗器修炼阶段达到1阶 ";
            BroadCast1 = "恭喜%s大侠淬毒再进一阶，功力更进一步！";
            BroadCast2 = "恭喜%s大侠淬毒达到最高境界，功力深不可测！";
            ProperyName = {                                                                 --TIPS属性字符串
                dwHPMax         = "生命 + ";
                dwAttack        = "攻击 + ";
                dwCrit	        = "暴击 + ";
                dwAppendCrit    = "暴击伤害 + ";
            };
 		PlaySucPfx = "Tx_Ui_jiuhulu_cuidu1",	-- 进度条增长 特效
 		PlayCanDoPfx = 'Tx_Ui_jiuhulu_cuidu', --  铸造能铸造特效(按钮 特效 ) 
		};
    };

    [KungFuEnum.Banner]={
        attrName = "Banner";
        authorityName = "Banner";
        Data =
        {   
            --消耗物品数量   物品数量     消耗银币数量
            Consume = {itemId = 4100533; itemCount = 1; silver = 0;};
            --增加的属性+攻击 +防御 +生命 +伤害抵御    
            attr = {dwAttack = 150; dwDefense = 400; dwHPMax = 370; dwCritDown= 10;};
            baseAttr = {dwAttack = 0; dwDefense = 0; dwHPMax = 0; dwCritDown = 0;};
        };
        tLevel = {
            [0] = {maxCount = 0;};
            --0等级策划不需要配 但是需要保留
            [1] = {maxCount = 0;};
			[2] = {maxCount = 0;};
			[3] = {maxCount = 0;};
			[4] = {maxCount = 0;};
			[5] = {maxCount = 0;};
			[6] = {maxCount = 0;};
			[7] = {maxCount = 0;};
			[8] = {maxCount = 0;};
			[9] = {maxCount = 0;};
			[10] = {maxCount = 0;};
			[11] = {maxCount = 0;};
			[12] = {maxCount = 0;};
			[13] = {maxCount = 0;};
			[14] = {maxCount = 0;};
			[15] = {maxCount = 0;};
			[16] = {maxCount = 15;};
			[17] = {maxCount = 20;};
			[18] = {maxCount = 25;};
			[19] = {maxCount = 35;};
			[20] = {maxCount = 45;};
			[21] = {maxCount = 55;};
			[22] = {maxCount = 75;};
			[23] = {maxCount = 95;};
			[24] = {maxCount = 115;};
			[25] = {maxCount = 145;};
			[26] = {maxCount = 175;};
			[27] = {maxCount = 205;};
			[28] = {maxCount = 255;};
			[29] = {maxCount = 305;};
			[30] = {maxCount = 355;};
			[31] = {maxCount = 425;};
			[32] = {maxCount = 495;};
			[33] = {maxCount = 565;};
			[34] = {maxCount = 655;};
			[35] = {maxCount = 745;};
			[36] = {maxCount = 835;};
			[37] = {maxCount = 955;};
			[38] = {maxCount = 1075;};
			[39] = {maxCount = 1195;};
			[40] = {maxCount = 1315;};
        };
        -- 界面配置
        UI = 
        {
            --配置批量使用界面对应系统图片    
            Img = "img://gf_zhanqi_jingzhi.png";
            txt1 = "精织次数:";
            txt2 = "消耗物品:";
            txt3 = "消耗数量:";
            txt4 = "操作次数";
            txt5 = "开始精织";
            BtnTips = "<font color='#4daeed'>点击按钮进行精织</font>"; 
            ImgTips = "<font color='#4daeed'>已精织次数：</font><font color='#00FF00'>%s</font><br/>";
            ImgTips1 = "<font color='#4daeed'>下级最大精织次数：%d</font>";
            ImgTips2 = "<br/><font color ='#FFFF00'>精织属性加成"; 
            ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：战旗修炼阶段达到%s阶"; --升阶所需
            ImgTips4 = "<br/><font color ='#FF0000'>开启所需：战旗达到4阶<br/>"; 		--开启所需
            Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwCritDown";}; --属性顺序显示
            IsNoCan1 = "精织次数已达本阶上限！"; --上限
            IsNoCan2 = "所需道具不足！"; --物品不足
            IsNoCan3 = "所需金钱不足！"; --金钱
            IsSuccess = "精织成功！"; -- 还童操作成功
            IsSuccess1 = "功能尚未开启，需战旗修炼阶段达到4阶 ";
            BroadCast1 = "恭喜%s大侠精织再进一阶，功力更进一步！";
            BroadCast2 = "恭喜%s大侠精织达到最高境界，功力深不可测！";
            ProperyName = {                                                                 --TIPS属性字符串
                dwHPMax         = "生命 + ";
                dwAttack        = "攻击 + ";
                dwDefense       = "防御 + ";
                dwCritDown    	= "暴击抵抗 + ";
            };
 		PlaySucPfx = "Tx_Ui_jiuhulu_jingzhi1",	-- 进度条增长 特效
 		PlayCanDoPfx = 'Tx_Ui_jiuhulu_jingzhi', --  铸造能铸造特效(按钮 特效 ) 
		};
    };

    [KungFuEnum.Shield]={
        attrName = "Shield";
        authorityName = "Shield";
        Data =
        {   
            --消耗物品数量   物品数量     消耗银币数量
            Consume = {itemId = 4100531; itemCount = 1; silver = 0;};
            --增加的属性+攻击 +防御 +生命 +伤害抵御    
            attr = {dwDefense = 180; dwHPMax = 500; dwCritDown = 10; dwPoJiaDiKang= 15;};
            baseAttr = {dwDefense = 0; dwHPMax = 0; dwCritDown = 0; dwPoJiaDiKang= 0;};
        };
        tLevel = {
            [0] = {maxCount = 0;};
            --0等级策划不需要配 但是需要保留
			[1] ={maxCount = 5;};
			[2] ={maxCount = 15;};
			[3] ={maxCount = 25;};
			[4] ={maxCount = 35;};
			[5] ={maxCount = 45;};
			[6] ={maxCount = 60;};
			[7] ={maxCount = 75;};
			[8] ={maxCount = 90;};
			[9] ={maxCount = 105;};
			[10] ={maxCount = 120;};
			[11] ={maxCount = 140;};
			[12] ={maxCount = 160;};
			[13] ={maxCount = 180;};
			[14] ={maxCount = 200;};
			[15] ={maxCount = 220;};
			[16] ={maxCount = 255;};
			[17] ={maxCount = 290;};
			[18] ={maxCount = 325;};
			[19] ={maxCount = 360;};
			[20] ={maxCount = 395;};
			[21] ={maxCount = 440;};
			[22] ={maxCount = 485;};
			[23] ={maxCount = 530;};
			[24] ={maxCount = 575;};
			[25] ={maxCount = 620;};
			[26] ={maxCount = 680;};
			[27] ={maxCount = 740;};
			[28] ={maxCount = 800;};
			[29] ={maxCount = 860;};
			[30] ={maxCount = 920;};
			[31] ={maxCount = 995;};
			[32] ={maxCount = 1070;};
			[33] ={maxCount = 1145;};
			[34] ={maxCount = 1220;};
			[35] ={maxCount = 1295;};
			[36] ={maxCount = 1395;};
			[37] ={maxCount = 1495;};
			[38] ={maxCount = 1595;};
			[39] ={maxCount = 1695;};
			[40] ={maxCount = 1795;};
			};
        -- 界面配置
        UI = 
        {
            --配置批量使用界面对应系统图片    
            Img = "img://gf_fabao_jilian.png";
            txt1 = "祭炼次数:";
            txt2 = "消耗物品:";
            txt3 = "消耗数量:";
            txt4 = "操作次数";
            txt5 = "开始祭炼";
            BtnTips = "<font color='#4daeed'>点击按钮进行祭炼</font>"; 
            ImgTips = "<font color='#4daeed'>已祭炼次数：</font><font color='#00FF00'>%s</font><br/>";
            ImgTips1 = "<font color='#4daeed'>下级最大祭炼次数：%d</font>";
            ImgTips2 = "<br/><font color ='#FFFF00'>祭炼属性加成"; 
            ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：法宝修炼阶段达到%s阶"; --升阶所需
            ImgTips4 = "<br/><font color ='#FF0000'>开启所需：法宝达到1阶<br/>"; 		--开启所需
            Shunxu = {"dwHPMax";"dwDefense";"dwCritDown";"dwPoJiaDiKang";}; --属性顺序显示
            IsNoCan1 = "祭炼次数已达本阶上限！"; --上限
            IsNoCan2 = "所需道具不足！"; --物品不足
            IsNoCan3 = "所需金钱不足！"; --金钱
            IsSuccess = "祭炼成功！"; -- 还童操作成功
            IsSuccess1 = "功能尚未开启，需法宝修炼阶段达到1阶 ";
            BroadCast1 = "恭喜%s大侠祭炼再进一阶，功力更进一步！";
            BroadCast2 = "恭喜%s大侠祭炼达到最高境界，功力深不可测！";
            ProperyName = {                                                                 --TIPS属性字符串
                dwHPMax         = "生命 + ";
                dwDefense       = "防御 + ";
                dwCritDown    	= "暴击抵抗 + ";
                dwPoJiaDiKang   = "破甲抵抗 + ";
            };
 		PlaySucPfx = "Tx_Ui_jiuhulu_jilian1",	-- 进度条增长 特效
 		PlayCanDoPfx = 'Tx_Ui_jiuhulu_jilian', --  铸造能铸造特效(按钮 特效 ) 
		};
    };

    [KungFuEnum.Practice]={
        attrName = "Practice";
        authorityName = "XiuXing";
        Data =
        {   
            --消耗物品数量   物品数量     消耗银币数量
            Consume = {itemId = 4100532; itemCount = 1; silver = 0;};
            --增加的属性+攻击 +防御 +生命 +伤害抵御    
            attr = {dwAttack = 200; dwDefense = 150; dwFlee = 5; dwCrit = 10;};
            baseAttr = {dwAttack = 0; dwDefense = 0; dwFlee = 450; dwCrit = 550;};
        };
        tLevel = {
            [0] = {maxCount = 0;};
            [1] = {maxCount = 20;};
			[2] = {maxCount = 50;};
			[3] = {maxCount = 95;};
			[4] = {maxCount = 155;};
			[5] = {maxCount = 230;};
			[6] = {maxCount = 320;};
			[7] = {maxCount = 425;};
			[8] = {maxCount = 545;};
			[9] = {maxCount = 680;};
			[10] = {maxCount = 830;};
			[11] = {maxCount = 995;};
			[12] = {maxCount = 1175;};			
        };
        -- 界面配置
        UI = 
        {
            --配置批量使用界面对应系统图片    
            Img = "img://gf_xiuxing_kuxiu.png";
            txt1 = "苦修次数:";
            txt2 = "消耗物品:";
            txt3 = "消耗数量:";
            txt4 = "操作次数";
            txt5 = "开始苦修";
            BtnTips = "<font color='#4daeed'>点击按钮进行苦修</font>"; 
            ImgTips = "<font color='#4daeed'>已苦修次数：</font><font color='#00FF00'>%s</font><br/>";
            ImgTips1 = "<font color='#4daeed'>下阶最大苦修次数：%d</font>";
            ImgTips2 = "<br/><font color ='#FFFF00'>苦修属性加成"; 
            ImgTips3 = "<br/><font color ='#FF0000'>升阶所需：修行修炼阶段达到%s阶"; --升阶所需
            ImgTips4 = "<br/><font color ='#FF0000'>开启所需：修行达到2阶<br/>"; 		--开启所需			
            Shunxu = {"dwAttack";"dwDefense";"dwFlee";"dwCrit";}; --属性顺序显示
            IsNoCan1 = "苦修次数已达本阶上限！"; --上限
            IsNoCan2 = "所需道具不足！"; --物品不足
            IsNoCan3 = "所需金钱不足！"; --金钱
            IsSuccess = "苦修成功！"; -- 还童操作成功
            IsSuccess1 = "功能尚未开启，需修行修炼阶段达到2阶 ";
            BroadCast1 = "恭喜%s大侠苦修再进一阶，功力更进一步！";
            BroadCast2 = "恭喜%s大侠苦修达到最高境界，功力深不可测！";
            ProperyName = {                                                                 --TIPS属性字符串
                dwAttack        = "攻击 + ";
                dwDefense       = "防御 + ";
                dwFlee    		= "身法 + ";
                dwCrit		    = "暴击 + ";
            };
 		PlaySucPfx = "Tx_Ui_jiuhulu_kuxiu1",	-- 进度条增长 特效
 		PlayCanDoPfx = 'Tx_Ui_jiuhulu_kuxiu', --  铸造能铸造特效(按钮 特效 )
		};
    };

    [KungFuEnum.ErrantHonor]={
        attrName = "ErrantHonor";
        authorityName = "XiaYiXunZhang";
        Data =
        {   
            --消耗物品数量   物品数量     消耗银币数量
            Consume = {itemId = 4100534; itemCount = 1; silver = 0;};
            --增加的属性+攻击 +防御 +生命 +伤害抵御    
            attr = {dwAttack = 500; dwHPMax = 375; dwPoJiaValue = 10; dwFlee = 8;};
            baseAttr = {dwAttack = 0; dwHPMax = 0; dwPoJiaValue = 0; dwFlee= 0;};
        };
        tLevel = {
            [0] = {maxCount = 0;};
            --0等级策划不需要配 但是需要保留
			[1] ={maxCount = 0;};
			[2] ={maxCount = 0;};
			[3] ={maxCount = 0;};
			[4] ={maxCount = 0;};
			[5] ={maxCount = 0;};
			[6] ={maxCount = 0;};
			[7] ={maxCount = 0;};
			[8] ={maxCount = 0;};
			[9] ={maxCount = 0;};
			[10] ={maxCount = 0;};
			[11] ={maxCount = 0;};
			[12] ={maxCount = 0;};
			[13] ={maxCount = 0;};
			[14] ={maxCount = 0;};
			[15] ={maxCount = 0;};
			[16] ={maxCount = 0;};
			[17] ={maxCount = 0;};
			[18] ={maxCount = 0;};
			[19] ={maxCount = 0;};
			[20] ={maxCount = 0;};
			[21] ={maxCount = 0;};
			[22] ={maxCount = 0;};
			[23] ={maxCount = 0;};
			[24] ={maxCount = 0;};
			[25] ={maxCount = 0;};
			[26] ={maxCount = 0;};
			[27] ={maxCount = 0;};
			[28] ={maxCount = 0;};
			[29] ={maxCount = 0;};
			[30] ={maxCount = 0;};
			[31] ={maxCount = 0;};
			[32] ={maxCount = 0;};
			[33] ={maxCount = 0;};
			[34] ={maxCount = 0;};
			[35] ={maxCount = 0;};
			[36] ={maxCount = 0;};
			[37] ={maxCount = 0;};
			[38] ={maxCount = 0;};
			[39] ={maxCount = 0;};
			[40] ={maxCount = 0;};
			[41] ={maxCount = 0;};
			[42] ={maxCount = 0;};
			[43] ={maxCount = 0;};
			[44] ={maxCount = 0;};
			[45] ={maxCount = 0;};
			[46] ={maxCount = 0;};
			[47] ={maxCount = 0;};
			[48] ={maxCount = 0;};
			[49] ={maxCount = 0;};
			[50] ={maxCount = 0;};
			[51] ={maxCount = 0;};
			[52] ={maxCount = 0;};
			[53] ={maxCount = 0;};
			[54] ={maxCount = 0;};
			[55] ={maxCount = 0;};
			[56] ={maxCount = 0;};
			[57] ={maxCount = 0;};
			[58] ={maxCount = 0;};
			[59] ={maxCount = 0;};
			[60] ={maxCount = 0;};
			[61] ={maxCount = 0;};
			[62] ={maxCount = 0;};
			[63] ={maxCount = 0;};
			[64] = {maxCount = 20;};
			[65] = {maxCount = 30;};
			[66] = {maxCount = 40;};
			[67] = {maxCount = 60;};
			[68] = {maxCount = 80;};
			[69] = {maxCount = 100;};
			[70] = {maxCount = 125;};
			[71] = {maxCount = 150;};
			[72] = {maxCount = 175;};
			[73] = {maxCount = 205;};
			[74] = {maxCount = 235;};
			[75] = {maxCount = 265;};
			[76] = {maxCount = 300;};
			[77] = {maxCount = 335;};
			[78] = {maxCount = 370;};
			[79] = {maxCount = 410;};
			[80] = {maxCount = 450;};
			[81] = {maxCount = 490;};
			[82] = {maxCount = 550;};
			[83] = {maxCount = 610;};
			[84] = {maxCount = 670;};
			[85] = {maxCount = 740;};
			[86] = {maxCount = 810;};
			[87] = {maxCount = 880;};
			[88] = {maxCount = 960;};
			[89] = {maxCount = 1040;};
			[90] = {maxCount = 1120;};		
        };
        -- 界面配置
        UI = 
        {
            --配置批量使用界面对应系统图片    
            Img = "img://gf_yaopai_jinggong.png";
            txt1 = "精工次数:";
            txt2 = "消耗物品:";
            txt3 = "消耗数量:";
            txt4 = "操作次数";
            txt5 = "开始精工";
            BtnTips = "<font color='#4daeed'>点击按钮进行精工</font>"; 
            ImgTips = "<font color='#4daeed'>已精工次数：</font><font color='#00FF00'>%s</font><br/>";
            ImgTips1 = "<font color='#4daeed'>下级最大精工次数：%d</font>";
            ImgTips2 = "<br/><font color ='#FFFF00'>精工属性加成"; 
            ImgTips3 = "<br/><font color ='#FF0000'>开启所需：腰牌达到8阶"; --升阶所需
            ImgTips4 = "<br/><font color ='#FF0000'>开启所需：腰牌达到8阶<br/>"; 		--开启所需
            Shunxu = {"dwHPMax";"dwAttack";"dwFlee";"dwPoJiaValue";}; --属性顺序显示
            IsNoCan1 = "精工次数已达本阶上限！"; --上限
            IsNoCan2 = "所需道具不足！"; --物品不足
            IsNoCan3 = "所需金钱不足！"; --金钱
            IsSuccess = "精工成功！"; -- 还童操作成功
            IsSuccess1 = "功能尚未开启，需腰牌修炼阶段达到8阶 ";
            BroadCast1 = "恭喜%s大侠精工再进一阶，功力更进一步！";
            BroadCast2 = "恭喜%s大侠精工达到最高境界，功力深不可测！";
            ProperyName = {                                                                 --TIPS属性字符串
                dwHPMax         = "生命 + ";
                dwAttack        = "攻击 + ";
                dwFlee	        = "身法 + ";
                dwPoJiaValue    = "破甲攻击 + ";
            };
 		PlaySucPfx = "Tx_Ui_jiuhulu_jinggong1",	-- 进度条增长 特效
 		PlayCanDoPfx = 'Tx_Ui_jiuhulu_jinggong', --  铸造能铸造特效(按钮 特效 )
		};
    };
		
	-- UI = 
 --    {
 		-- TODO 奇物里所有扩展 多添加2个字段 特效名
 		PlaySucPfx = "Tx_Ui_jiuhulu_jindutiao1",	-- 进度条增长 特效
 		PlayCanDoPfx = 'Tx_Ui_jiuhulu_paozhi', --  铸造能铸造特效(按钮 特效 )
 --    }
	-- 暴击抵抗的基数
	nCritDownBase = 175;

	--获取Consume 物品 系统标识
	GetConsume = function (dwAptitude,nSystemEnum) 
		-- print("==dwAptitude,nSystemEnum===",dwAptitude,nSystemEnum)
		return KungFuExtendConfig[nSystemEnum].Data.Consume;

	end;


	-- 得到当前系统总属性(单个系统)
	GetSingleSysAttr = function(tCount, nSystemEnum)
		local oAttrInfo = SSingleAttrChange:new();
		local nCount = tCount[nSystemEnum];
		if not nCount then
			_err("KungFuExtendConfig.GetSingleSysAttr cant get nCount",
				nSystemEnum)
			return oAttrInfo;
		end
		
		if nCount == 0 then
			return oAttrInfo;
		end
	
		for attrType, attrValue in pairs(KungFuExtendConfig[nSystemEnum].Data.attr) do
			if oAttrInfo[attrType] then
				oAttrInfo[attrType] = oAttrInfo[attrType] + attrValue * nCount;
			end
		end
	
		local baseAttr = _G.KungFuExtendConfig[nSystemEnum].Data.baseAttr;
		if baseAttr then
			for k, v in pairs(baseAttr) do
				if oAttrInfo[k] then
					oAttrInfo[k] = oAttrInfo[k] + v;
				end
			end
		end
				
		return oAttrInfo;
	end;
	
	GetAllAttr = function(tCount)
		local oAttrInfo = SSingleAttrChange:new();
		
		for k, v in pairs(KungFuExtendConfig) do
			if type(k) == "number" then
				KungFuExtendConfig.GetSingleSysAttr(tCount, k):CountAttrValue(oAttrInfo);
			end
		end
		return oAttrInfo;
	end;

};


_G.PublicUI = {
	IsEnough		= "<font color='#00FF00'>%s</font>";	--物品充足 绿
	IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足 红
};
