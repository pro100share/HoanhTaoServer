-- 附加属性翻倍符配置
_G.PropertyScrollConfig = {
    -- 消耗
    Consume = {
        -- 阶段 = {[物品标识] = 物品数量;}
		[1] = { [5950030] = 1; };
		[2] = { [5950031] = 1; };
		[3] = { [5950032] = 1; };
		[4] = { [5950033] = 1; };
		[5] = { [5950034] = 1; };
		[6] = { [5950035] = 1; };
		
    };
	----阶段百分比
	levelqj = {
		[1] = {100;200};
		[2] = {200;300};
		[3] = {300;400};
		[4] = {400;500};
		[5] = {500;600};
		[6] = {600;700};
		
	};
    -- 错误
    Error = {
		-- 没有放入装备
        NotHasAuthority =  -2;
	     -- 没有放入装备
        NotHaveEquip =  -1;
		-- 没有放入装备
        Success =  0;
		-- 不是极值状态
		NotMax = 1;
        -- 装备已经满级
        Full = 2;
        -- 消耗材料数量不足
        NotEnoughConsume = 3;
    };
	    -- 属性变化时间
    Time = {
		-- 不暴击
        NotLuck =  1;
	     -- 暴击
        Luck =  0.5;
    };

    -- 图片
    Image = {
					[0] = " <img src = 'img://Xtb_stone.png'>";
					[1] = " <img src = 'img://Xtb_stone.png'>";
					[2] = " <img src = 'img://Xtb_stone.png'>";
					[3] = " <img src = 'img://Xtb_stone.png'>";
					[4] = " <img src = 'img://Xtb_stone.png'>";
					[5] = " <img src = 'img://Xtb_stone.png'>";
					[6] = " <img src = 'img://Xtb_stone.png'>";
    };
		--战斗属性
	Battle = {
		[1] = "攻击 + ",--zb_xfk_shuxing_biaoshi
		[2] = "防御 + ",
		[4] = "暴击 + ",
		[3] = "身法 + ",
		[5] = "生命 + ",
		[6] = "内力 + ",
		[7] = "伤害减免 + ",
	},
    -- 文本
    Text = {
		--规则说明
		
		Error = {
				[-1] 		= "请选择装备";
				[1]			= "请检查装备附加属性是否达到极致属性";
				[2]			= "逆天炼制已达到最高阶段";
				[3]			= "没有足够的%s";
		};
		
		strRule    		= "<font color='#ffc000'>小提示：</font><font color='#ffffff'>逆天炼制通过消耗同阶或高阶卷轴，提升极致附加属性数值，炼制时有几率发生暴击，大幅飙升属性数值及炼制进度，当进度达到100%时属性进阶。接受过逆天炼制的装备在使用装备升阶时，不会受到升阶衰减影响</font>";
		strNoScorll		= "请检查包裹内是否有足够的逆天炼制所需道具";
		strProgress		= "%d%%";
		strTipsPro		= "<font color='#ffc000' size='14' >%s逆天炼制：</font><font size='14' >%d%%</font>";    		--装备tips强化进度
		strTipsPro1		= "<font color='#ffc000' size='14' >(未进行逆天炼制)</font>";  			--装备极致属性时tips添加字段
		strTipHight		= 14;  													--装备极致属性时tips字段字高
		strProgressname	= "%s进度:";                                                
		strBroad   		="%s幸运的将%s附加属性炼制至%s";
		strBroadLuck	="%s爆发大运将%s附加属性暴击炼制至%s";
		strNumcolor		="<font color='#ff0000'>%s</font>";										--材料不足时颜色控制
		strNamecolor	="<font color='#878787'>%s</font>";										--装备颜色控制
		strFull			="顶阶";										--满阶字符串
		strStage = {
					[1] = "【完美属性】";
					[2] = "【无双属性】";
					[3] = "【传说属性】";
					[4] = "【真武属性】";
					[5] = "【神威属性】";
					[6] = "【传世属性】";
					};
		strtips  = {
					[1] = "完美属性";
					[2] = "无双属性";
					[3] = "传说属性";
					[4] = "真武属性";
					[5] = "神威属性";
					[6] = "传世属性";
					};
    };
};