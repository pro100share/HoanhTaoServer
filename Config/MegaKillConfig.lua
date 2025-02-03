--[[
	--血魔功Config
	--作者：张云华
	--时间：2013-9-11
]]

_G.MegaKillConfig = {
	szLearnText = "修炼进度",
	szLearnProText = "<font color='#D9CCBD'>当修炼进度满值时，可突破到下一功法境界。</font>",
	szvipText = "<font color='#D9CCBD'>VIP每日额外增加%d次血炼</font>",
	szPlayText = "<font color='#DCDCDC'>每日<font color='#FF6100'>前6次击杀其他玩家</font>可获得精血，<font color='#FF6100'>VIP额外增加2次</font>，与被击杀玩家的<font color='#FF6100'>等级差距超过20级</font>及击杀<font color='#FF6100'>同一玩家超过2次</font>,均不会获得精血。精血可用来修炼血魔功，消耗精血血炼会获得属性加成。</font>",
	szXueLianCount = "本日血炼次数:%s/%s<font color='#DCDCDC' size = '14'>（VIP每日额外增加2次血炼次数）</font>",
	szPurchaseText = "购买一次血炼:<font color='#D9CCBD'>%d元宝</font>",
	szOwnSoulText = "当前拥有精血:<font color='#D9CCBD'>%s</font>",
	szJingJieTile = "当前境界:",
	szAbsorbBlood = "<font color=%s size='10'>北冥神功吸血效果增加%s</font><br /><font color=%s size='10'>%s概率触发血屠对目标减血%s</font>",
	szGetText = "<font color='#D9CCBD'>服用斩魄精元丹可以突破自身的血魔功境界，血魔功境界提升后，对应的属性上限也随之提升。</font>",
	szRotionCount = "<font color='#00FF00'>次数：%s</font>",
	szRotionCostSoul = "<font color='#FFFF00'>消耗精血：%s</font>",
	intensifySkill = {skillName = "戾心诀",szIcon='Icon_gf_xuemogong_1.png',szGrayIcon='Icon_gf_xuemogong_0.png',},
	jingjie = {
		[1] = {
			strName = "血手夜叉";
			picName = "XueMoGong_JingJie01_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong1.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie01.png"; -->主界面中境界图片
			curPicUrl = "XueMoGong_JingJie01_0.png"; -->突破界面中当前境界图片
			nextPicUrl = "XueMoGong_JingJie01_1.png"; -->突破界面中下阶境界图片
			Attr = {
				[1] = 40,
				[2] = 20,
				[3] = 200,
				[4] = 10,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 1, money = 0};
			skillLevel = 0; -->技能等级（0：未激活）
		},
		[2] = {
			strName = "勾魂噬魄";
			picName = "XueMoGong_JingJie02_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong2.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie02.png";
			curPicUrl = "XueMoGong_JingJie02_0.png";
			nextPicUrl = "XueMoGong_JingJie02_1.png";
			Attr = {
				[1] = 120,
				[2] = 60,
				[3] = 600,
				[4] = 30,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 2, money = 0};
			skillLevel = 0;
		},
		[3] = {
			strName = "鬼道修罗";
			picName = "XueMoGong_JingJie03_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong3.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie03.png";
			curPicUrl = "XueMoGong_JingJie03_0.png";
			nextPicUrl = "XueMoGong_JingJie03_1.png";
			Attr = {
				[1] = 240,
				[2] = 120,
				[3] = 1200,
				[4] = 60,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 2, money = 0};
			skillLevel = 0;
		},
		[4] = {
			strName = "焚林山魅";
			picName = "XueMoGong_JingJie04_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong4.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie04.png";
			curPicUrl = "XueMoGong_JingJie04_0.png";
			nextPicUrl = "XueMoGong_JingJie04_1.png";
			Attr = {
				[1] = 560,
				[2] = 280,
				[3] = 2800,
				[4] = 140,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 3, money = 0};
			skillLevel = 0;
		},
		[5] = {
			strName = "幽都魍魉";
			picName = "XueMoGong_JingJie05_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong5.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie05.png";
			curPicUrl = "XueMoGong_JingJie05_0.png";
			nextPicUrl = "XueMoGong_JingJie05_1.png";
			Attr = {
				[1] = 960,
				[2] = 480,
				[3] = 4800,
				[4] = 240,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 3, money = 0};
			skillLevel = 0;
		},
		[6] = {
			strName = "九阴邪骸";
			picName = "XueMoGong_JingJie06_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong6.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie06.png";
			curPicUrl = "XueMoGong_JingJie06_0.png";
			nextPicUrl = "XueMoGong_JingJie06_1.png";
			Attr = {
				[1] = 1260,
				[2] = 630,
				[3] = 6300,
				[4] = 315,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 4, money = 0};
			skillLevel = 1;
		},
		[7] = {
			strName = "屠万鬼雄";
			picName = "XueMoGong_JingJie07_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong7.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie07.png";
			curPicUrl = "XueMoGong_JingJie07_0.png";
			nextPicUrl = "XueMoGong_JingJie07_1.png";
			Attr = {
				[1] = 1800,
				[2] = 900,
				[3] = 9000,
				[4] = 450,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 4, money = 0};
			skillLevel = 2;
		},
		[8] = {
			strName = "冥狱无常";
			picName = "XueMoGong_JingJie08_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong8.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie08.png";
			curPicUrl = "XueMoGong_JingJie08_0.png";
			nextPicUrl = "XueMoGong_JingJie08_1.png";
			Attr = {
				[1] = 2420,
				[2] = 1210,
				[3] = 12100,
				[4] = 605,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 5, money = 0};
			skillLevel = 3;
		},
		[9] = {
			strName = "诸神寂灭";
			picName = "XueMoGong_JingJie09_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong9.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie09.png";
			curPicUrl = "XueMoGong_JingJie09_0.png";
			nextPicUrl = "XueMoGong_JingJie09_1.png";
			Attr = {
				[1] = 3120,
				[2] = 1560,
				[3] = 15600,
				[4] = 780,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 5, money = 0};
			skillLevel = 4;
		},
		[10] = {
			strName = "血魔临世";
			picName = "XueMoGong_JingJie10_0.png"; ----商业化活动用的图片
			imageUrl= "HD_yunying_mogong10.png";----商业化活动用的图片
			picUrl = "XueMoGong_JingJie10.png";
			curPicUrl = "XueMoGong_JingJie10_0.png";
			nextPicUrl = "XueMoGong_JingJie10_1.png";
			Attr = {
				[1] = 4480,
				[2] = 2240,
				[3] = 22400,
				[4] = 1120,
			};
			costMaterial = {itemEnumId = 2500331, itemCount = 5, money = 0};
			skillLevel = 5;
		},
	};
	
	
	ResetTime = "23:59";
	RandomNum = 6;	--每天血炼次数
	VipNum = 2;		--vip额外血炼次数
	KillOneMaxTimes = 2; --每天斩杀一个玩家获得精血的最大次数
	
	--获取击杀增加灵魂数
	----killTimes 单日总击杀获得精血的次数
	----killerLevel 击杀者等级
	----loserLevel 被杀者等级
	----isVip	击杀者是否是VIP
	GetAddSoulNum = function(killTimes, killerLevel, loserLevel, isVip)
	    local gaplevel = killerLevel-loserLevel
		local blood = 0
	    if isVip then
	       if killTimes < 8 and gaplevel <=20 then
		      blood = 100
		    else
			  blood = 0
			end;  
	    else
		    if killTimes < 6 and gaplevel <=20 then
		      blood = 100
		    else
			  blood = 0
			end; 
	    end;
		return blood;
	end;
	
	
	--获取屏蔽属性类型花费
	----forbidNum 屏蔽类型个数
	----境界等级
	GetForbidTypeCost = function(forbidNum, level)
		return 10 * forbidNum ;
	end;
	
	--获取购买一次血炼次数花费
	----buyNum 本日已经购买次数
	GetBuyOnceCost = function(buyNum)
	
		return 10 * (buyNum + 1);
	end;
	
	--获取血炼一次魂值花费
	----randTimes 本日已血炼过次数
	----level 境界等级
	GetRandomOnceCost = function(randTimes, level)
		return 100;
	end;
	
	RandomType = {
		[1] = 1;
		[2] = 2;
		[3] = 3;
		[4] = 4;
		[5] = 1;
		[6] = 2;
		[7] = 3;
		[8] = 4;
	};
	
	--获取血炼之后加成属性
	----forbidTable 屏蔽类型表 例如：{1, 3, 4} 屏蔽 1 3 4 属性
	----level 境界等级
	GetRandomAttr = function(forbidTable, level)
		local temp = {};
		for _, v in pairs(forbidTable) do
			temp[v] = true;
		end;
		local randType = {};
		for k, _ in pairs(_G.MegaKillConfig.RandomType) do
			if not temp[k] then
				table.insert(randType, k);
			end;
		end;
		local attr = {};
		if #randType == 0 then--表里没有类型，出错了
			attr.error = true;
		else
			local index = math.random(1, #randType);
			attr.index = randType[index];
			attr.type = _G.MegaKillConfig.RandomType[attr.index];
			--print("=======1111===============",attr.type)
			attr.quality = _G.MegaKillConfig.GetRandQuality(level);
			attr.value = _G.MegaKillConfig.GetRandValue(level,attr.type,attr.quality);
			--print("=======2222===============",attr.value)
			--print("=======3333===============",attr.quality)
		end;
		return attr;
	end;
	--升阶成功率
	RateData ={
		[1]=0.5,
		[2]=0.4,
		[3]=0.2,
		[4]=0.15,
		[5]=0.1,
		[6]=0.1,
		[7]=0.1,
		[8]=0.05,
		[9]=0.05,
		};
	ValueData={

		[1]={[1]=3		,[2]=4		},
		[2]={[1]=22		,[2]=35  	},
		[3]={[1]=105	,[2]=115	},
		[4]={[1]=240	,[2]=260	},
		[5]={[1]=720	,[2]=820	},
		[6]={[1]=1450	,[2]=1650	},
		[7]={[1]=2500	,[2]=2700	},
		[8]={[1]=4250	,[2]=4500	},
		[9]={[1]=6900	,[2]=7500	},
	
	};
	

	SkillData = {
		--伤害系数，随机下限，随机上限
		[0] = {0,0,0};
		[1] = {0.1,0,500};
		[2] = {0.15,500,1500};
		[3] = {0.2,1500,2500};
		[4] = {0.2,2500,4000};
		[5] = {0.25,4000,6000};
	};
		
	--血魔功技能效果
	XueMoGongSkill = function(level) 
		return MegaKillConfig.SkillData[MegaKillConfig.jingjie[level].skillLevel]
	end;
	--获取升阶成功率
	----level 当前等阶数
	----cifu 天官赐福值
	GetUplevelRate = function(level, cifu)
		local rate=0
		if cifu< _G.MegaKillConfig.ValueData[level][1] then
			rate=0
		elseif cifu> _G.MegaKillConfig.ValueData[level][2] then
			rate=10000
		else 
			rate= _G.MegaKillConfig.RateData[level]*10000
		end
		return rate;	
	end;
	
	--获取影响属性信息
	----level 当前等阶数
	----返回值 info{影响类型，影响百分比}
	GetEffectInfo = function(level)
		return 12016, 0.1*MegaKillConfig.jingjie[level].skillLevel;
	end;
	
	GetSkillInfo = function(level)
		local Id = nil;
		if (MegaKillConfig.jingjie[level].skillLevel > 0) then
			Id = 61004
		end
		return Id,MegaKillConfig.jingjie[level].skillLevel;
	end;
	
	--获取升阶成功率(显示相关)
	----level 当前等阶数
	GetUplevelRateText = function(level)
		local a = {
			"普通","普通","困难","困难","困难","困难","极难","极难","极难","极难","极难",
		};
		return a[level];
	end;
	
	--[[
	dwAttack		--攻击
	dwDefense		--防御
	dwHPMax			--生命max
	dwMPMax			--内力max
	dwCrit			--暴击
	dwFlee			--身法
	dwAttackSpeed	--攻击速度
	dwMoveSpeed		--移动速度
	dwRemitAttack	--伤害减免
	]]
	TypeDef = {
		[1] = {
			"dwAttack",
			"攻    击："
		},
		[2] = {
			"dwDefense",
			"防    御："
		},
		[3] = {
			"dwHPMax",
			"生命上限："
		},
		[4] = {
			"dwMPMax",
			"内力上限："
		}
	};
	--广播消息显示属性字符
	BroadCastTypeDef = {
		[1] = "攻击",
		[2] = "防御",
		[3] = "生命上限",
		[4] = "内力上限",
	};
	
	QualityDef = {
		[1] = {szText="普通",pro = 1.0};     
		[2] = {szText="优秀",pro = 1.5};
		[3] = {szText="卓越",pro = 2.0};
		[4] = {szText="极致",pro = 2.5};
		[5] = {szText="完美",pro = 3.0};
	};
	--获取随机概率出现品质的机制
	GetRandQuality = function(level)
		local randQuality = {1, 2, 3, 4, 5};
		local quality = 1;
		local index = 1;

		local randomVal = math.random(1,10000);
		if randomVal <= 1000 then
			index = 1;
		elseif randomVal <= 5200 then
			index = 2;
		elseif randomVal <= 9000 then
			index = 3;
		elseif randomVal <= 9800 then
			index = 4;	
		else
			index = 5
		end	
		quality = randQuality[index];		
		return quality;
	end;
	--获取随机增加的属性值
	GetRandValue = function(level,dwType,quality)
		local randValueList = {
			{8,4,40,4,}, -->对应TypeDef中的（1~4）属性项
			{12,6,60,6,},
			{16,8,80,8,},
			{28,14,140,14,},
			{32,16,160,16,},
			{36,18,180,18,},
			{40,20,200,20,},
			{44,22,220,22,},
			{48,24,240,24,},
			{56,28,280,28,},
		}; -->不同境界属性基数（1~10）
		local value = 0; 
		if level > 0 and level <= #randValueList then
			--local quality = _G.MegaKillConfig.GetRandQuality(level);
			--print("===========666666666666666---------",level,dwType,quality,randValueList[level][dwType],_G.MegaKillConfig.QualityDef[quality].pro);
			value = randValueList[level][dwType]*_G.MegaKillConfig.QualityDef[quality].pro;
		end
		
		return value;
	end;
	
	BroadCastQuality = 4;
	BroadCastLevel = 2;
}

--界面提示
_G.NoticeTextConfig = {
	szAttrBtTip = "点击按钮可锁定此项属性项，锁定后<br>此属性项不会再下次血炼中出现",
	szAttrBtBuy = "您是否花费<font color='#FF6100'>%d元宝</font>锁定该属性项，下次血炼中将不出现此属性项？",
	szNotGold = "元宝不足，无法执行该项操作。",
	szdisabledLock = "您已达到锁定上限，不能再继续锁定",
	szPurchaseTip = "您本日血炼次数已用完",
	szMaxTrace = "您已修炼到最高境界",
	szNotMaterial = "您包裹中的消耗材料不足，无法进行突破",
	szUplevelFail = "您本次未能突破到下一境界，请多尝试几次",
	szNotXueLian = "当前功法境界已修炼圆满，请突破到下一境界",
    szCiFuNotice = "血魔功天官赐福+%d",
	szNotEnoughSoul = "您的精血不足",

	szCiFu = "赐福+%d",
}

--技能图标提示
_G.AbilityTips = {
	szNotActiveText = "<font color='#FF0000' size='14'>%s 未激活</font><br />",
	szActiveText = "<font color='#FF0000' size='14'>%s </font> <font color='#00FF00' size='14'>Lv%d</font><br />",
	szNextText = "<font color='#DCDCDC' size='14'>激活条件：</font><font color='#4DAEED' size='14'>修炼到第六层境界-九阴邪骸</font><br /><font color='#00FF00' size='14'>下一层要求</font><br /><font color='#FF6100' size='14'>境界: %s</font><br /><font color='#00FF00' size='14'>下层效果</font><br /><font color='#FFFF00' size='14'><font color='#DCDCDC' size='14'>效果一：</font>北冥神功吸血效果增加%s</font><br /><font color='#FFFF00' size='14'><font color='#DCDCDC' size='14'>效果二：</font>主动攻击时有%s的概率触发血屠效果<br />血屠的最高伤害可达目标总血量的%s</font><br /><font color='#DCDCDC' size='14'>（伤害最大值不超过自身攻击属性值）</font>",
	szFullText = "已满层<br /><font color='#FFFF00' size='14'><font color='#DCDCDC' size='14'>效果一：</font>北冥神功吸血效果增加%s</font><br /><font color='#FFFF00' size='14'><font color='#DCDCDC' size='14'>效果二：</font>主动攻击时有%s的概率触发血屠效果<br />血屠的最高伤害可达目标总血量的%s</font><br /><font color='#DCDCDC' size='14'>（伤害最大值不超过自身攻击属性值）</font>",
}

--系统公告提示
_G.KillBroadCastText = {
	[1] = "玩家%s大侠在血魔功修炼中灵光一闪血炼到<font color='#FF6100'>%s</font>的<font color='#FF0000'>%s</font>属性！",
	[2] = "血魔功，需要人物达到%d级",
	[3] = "玩家%s大侠血魔功修炼到<font color='#A020F0'>%s</font>境界,功力更进一层，转战江湖更添一分胜算！",
}

--查看其他玩家相关提示
_G.KillLookText = {
	[1] = "<font color='#FFFFFF'>您查看的玩家不在线</font>", -->玩家不在线
	[2] = "<font color='#FFFFFF'>对方还未开启功法，无法查看</font>", -->玩家未开启血魔功(功法)
}
-- 资质配置
_G.MegaKillAptitudeConfig = {

    -- @brief 获取消耗
    -- @param number dwAptitude 精炼值
    -- @return table 消耗
    -- {}
    GetConsume = function(dwAptitude)
       return MegaKillAptitudeConfig.Data.Consume;
    end;

    -- @brief 获取次数上限
    -- @param number dwLevel 名剑等级
    -- @return number 次数
    GetMaxDegree = function (dwLevel)
        return MegaKillAptitudeConfig.CiShu[dwLevel];
    end;

	-- @brief 是否拥有精炼功能
    -- @param number dwLevel 宝甲等级
    -- @return bool  true 拥有 flase 没有
	
    IsHave = function (dwLevel)
		if dwLevel < 1 then
			return false
		end
        return true;
    end;

    -- @brief 获取增长属性
    -- @param number dwAptitude 资质值
    -- @return table 属性
    -- {}
    GetProperty = function (dwAptitude)
        local setResult = {};
        for k, v in pairs(MegaKillAptitudeConfig.Data.AppendProperty) do
           setResult[k] = v * dwAptitude;
        end
        return setResult;
    end;

    -- @brief 是否可以精炼
    -- @param object objSystem 系统对象
	-- @param table setParam 参数表
	--      {
	--          消耗道具标识符;    数量; 宝甲等阶
	--          dwItemID;	dwNum  ; dwLevel ;
	--      }
    -- @return boolean 是否可以精炼
    CanDo = function (objSystem,setParam)
        if MegaKillAptitudeConfig.IsHave(setParam.dwLevel) == false then
           return MegaKillAptitudeConfig.Info.NotHasAuthority;
        end
        if objSystem:IsFull() == true then
            return MegaKillAptitudeConfig.Info.Full;
        end
        if objSystem:IsCanDeleteItem({setParam.dwItemID, setParam.dwNum}) == 
            false then
            return MegaKillAptitudeConfig.Info.NotEnoughConsume;
        end
        return MegaKillAptitudeConfig.Info.IsCan;
    end;

    -- @breif 精炼
    -- @param object objSystem 系统对象
    Do = function (objSystem, setParam)
        objSystem:DeleteItem({setParam.dwItemID, setParam.dwNum});
        objSystem:SetAptitude(objSystem:GetAptitude() + setParam.nCount);
    end;
	
	-- @brief 获取精炼级别
    -- @param number dwAptitude 资质值
    -- @return table 属性
	GetLevel = function(dwAptitude)
		local tInfo = MegaKillAptitudeConfig.CiShu;
		local nLevel = 0;
		for k,v in ipairs(tInfo) do
			if dwAptitude >= v then
				nLevel = k;
			end
		end
		return nLevel;
	end;

    -- 资质数据
    Data = {
        --消耗信息配置 dwItemID：物品ID, dwNum 物品数量
        Consume = {dwItemID = 2500341; dwNum = 3;};
        --噬血一次增加的属性+攻击 +防御 +生命 +身法
        AppendProperty = {dwAttack = 100; dwDefense = 50; dwHPMax = 450; dwFlee = 1;};
    };
	----每阶铸造的次数
	CiShu = {
		   [1] = 15;
		   [2] = 30;
		   [3] = 50;
		   [4] = 85;
		   [5] = 125;
		   [6] = 170;
		   [7] = 225;
		   [8] = 300;
		   [9] = 395;
		   [10] = 500;
		
	};
    -- 信息配置
    Info = {
			IsCan = 0;
			NotHasAuthority = 1;
			Full			= 2;
			NotEnoughConsume = 3;
			
	};
	   -- 界面配置
    UI = {
            --噬血按钮tips表述
			BtnTips = "<font color='#4daeed'>点击按钮进行噬血</font>"; 
			BtnTips1= "%sX%d" ;
			BtnTips2= "<font color='#FF0000'>噬血次数已达本阶上限</font>" ; -- 满级tips 红
			IsEnough		= "<font color='#00FF00'>%s</font>";	--物品充足 绿
			IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足 红
            --噬血图形tips表述
			ImgTips = "<font color='#4daeed'>已噬血次数：</font><font color='#00FF00'>%s</font><br/>";
			ImgTips1 = "<font color='#4daeed'>下阶最大噬血次数：%d</font>";
			ImgTips2 = "<br/><font color ='#FFFF00'>噬血属性加成"; 
			IsNoCan1 = "噬血条件不足！"; --噬血未满足条件
			IsNoCan2 = "噬血次数已达本阶上限！"; --当前等阶噬血已满
			IsNoCan3 = "所需道具不足！"; --噬血物品不足
			IsNoCan4 = "噬血失败！请稍后再试";
			IsSuccess = "噬血成功！"; -- 噬血成功
			Shunxu = {"dwHPMax";"dwAttack";"dwDefense";"dwFlee";}; --属性顺序显示
			ProperyName 	= { 																--TIPS属性字符串
						dwHPMax 		= "生命 + ";
						dwAttack 		= "攻击 + "; 
						dwDefense 		= "防御 + ";
						dwFlee			= "身法 + ";
			};
			BroadCast1 = "恭喜%s大侠噬血再进一阶，功力更进一步！";
			BroadCast2 = "恭喜%s大侠噬血达到最高境界，功力深不可测！";
			
	};
};