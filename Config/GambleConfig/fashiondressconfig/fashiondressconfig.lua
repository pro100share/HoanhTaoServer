
--物品佩戴的位置
-- _G.enItemWearPos = {
	-- eWeapon		= 1,			--武器
	-- eCloth		= 2,			--衣服
	-- eLeg		= 3,			--护腿
	-- eGloves		= 4,			--护手
	-- eBelt		= 5,			--腰带
	-- eHead		= 6,			--头饰
	-- eShoes		= 7,			--鞋子
	-- eCloak		= 8,			--披风
	-- eNecklace	= 9,			--项链
	-- eRing		= 10,			--戒指
	-- eBracelet	= 11,			--手镯
	-- ePendant	= 12,			--腰坠
	-- eAmulet		= 13,			--护身宝甲
	-- eKeepsake	= 14,			--情侣信物
	-- eSpecial1	= 15,			--特殊位置1
	-- eSpecial2	= 16,			--特殊位置2
	-- eSpecial3	= 17,			--特殊位置3
	-- eSpecial4	= 18,			--特殊位置4
	-- eSpecial5	= 19,			--特殊位置5
    -- eSpecial6   = 20,           --特殊位置6
    -- eMount1     = 21,           --坐骑装备鞍具
    -- eMount2     = 22,           --坐骑装备缰绳
    -- eMount3     = 23,           --坐骑装备蹬具
    -- eMount4     = 24,           --坐骑装备蹄铁
-- };

-- _G.enProfType =
-- {
	-- eProfType_Sickle 	= 1;		--镰刀
	-- eProfType_Knife 	= 2;		--刀
	-- eProfType_Sword 	= 3;		--剑
	-- eProfType_Spear 	= 4;		--枪
--}


--时装配置
_G.FashionDressConfig = {
	--strName 名称
	--dwWearPos 位置 同FashionDressWearPos  1,
	--dwPro 职业要求 
	-- 1,2,3 对应 DressInfobyTimeType 
	--dwRoleNeeded 职业ID
	--strDescription 描述
	--TabProperty 属性表  [化身丹等级] = {属性名 = 属性值}
	--strIcon 彩色图片
	--strIconGray 灰色图片
	--dwMshID 模型ID
	--dwItemID 装备ID（必须要没有属性的装备ID）
	--TabMoney dwDay 购买类型 dwNum 价格  dwDay为 0 为永久  不能购买 TabMoney = nil
	--TabHowGet 获取途径
	--TabSuit  TabID 能组成套装的ID列表， dwSuit 对应 SuitAttrList 中的属性 
	--boardcast = false;  获得之后是否需要广播
	DressList = 
	{
	-- 职业镰
	[1] = {	
			[10001] = {
				dwDressID = 10001;strName=T"<font color='#ccbb00'>郎情妾意化身</font>",dwWearPos= 2,dwPro = 1,
				strDescription=T'结婚套化身',
				TabProperty = { [1] = {dwHPMax = 18888,},[2] = nil,[3] = {dwDefense = 1888,},[4] = nil,[5] = {dwPoJiaDiKang = 1888,},[6] = nil,[7] = {dwCritDown = 1000,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_lian_jiehunyifu.png',strIconGray='0',
				dwMshID = 102010,
				dwItemID = 1810001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 1999};
					[2] = {dwDay = 30,dwNum = 3999};
					[3] = {dwDay = 0,dwNum = 9999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};

			[11001] = {
				dwDressID = 11001;strName=T"<font color='#ccbb00'>叱咤风云衣服化身</font>",dwWearPos= 2,dwPro = 1,
				strDescription=T'战场套衣服',
				TabProperty = { [1] = {dwHPMax = 26666,},[2] = nil,[3] = {dwDefense = 2666,},[4] = nil,[5] = {dwPoJiaDiKang = 2666,},[6] = nil,[7] = {dwCritDown = 1300,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_lian_zcyifu.png',strIconGray='0',
				dwMshID = 103010,
				dwItemID = 1910001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 49999};
					[2] = {dwDay = 30,dwNum = 199999};
					[3] = {dwDay = 0,dwNum = 599999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};	
				
				[11002] = {
				dwDressID = 11002;strName=T"<font color='#ccbb00'>叱咤风云武器化身</font>",dwWearPos= 1,dwPro = 1,
				strDescription=T'战场套武器',
				TabProperty = { [1] = {dwAttack = 32555,},[2] = nil,[3] = {dwCrit = 1455,},[4] = nil,[5] = {dwPoJiaValue = 2155,},[6] = nil,[7] = {dwAppendCrit = 1355,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_lian_zcwuqi.png',strIconGray='0',
				dwMshID = 103011,
				dwItemID = 1910002,
				TabMoney = nil,
				LifeInfo = {
					[1] = {dwDay = 3};
					[2] = {dwDay = 7};
					[3] = {dwDay = 0};
				},
				TabHowGet = {3}; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = true;
				};									
			};
	-- 职业刀
	[2] = {
			[20001] = {
				dwDressID = 20001;strName=T"<font color='#ccbb00'>郎情妾意化身</font>",dwWearPos= 2,dwPro = 2,
				strDescription=T'结婚套化身',
				TabProperty = { [1] = {dwHPMax = 18888,},[2] = nil,[3] = {dwDefense = 1888,},[4] = nil,[5] = {dwPoJiaDiKang = 1888,},[6] = nil,[7] = {dwCritDown = 1000,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_dao_jiehunyifu.png',strIconGray='0',
				dwMshID = 202010,
				dwItemID = 1820001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 1999};
					[2] = {dwDay = 30,dwNum = 3999};
					[3] = {dwDay = 0,dwNum = 9999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};

			[21001] = {
				dwDressID = 21001;strName=T"<font color='#ccbb00'>叱咤风云衣服化身</font>",dwWearPos= 2,dwPro = 2,
				strDescription=T'战场套衣服',
				TabProperty = { [1] = {dwHPMax = 26666,},[2] = nil,[3] = {dwDefense = 2666,},[4] = nil,[5] = {dwPoJiaDiKang = 2666,},[6] = nil,[7] = {dwCritDown = 1300,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_dao_zcyifu.png',strIconGray='0',
				dwMshID = 203010,
				dwItemID = 1920001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 49999};
					[2] = {dwDay = 30,dwNum = 199999};
					[3] = {dwDay = 0,dwNum = 599999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};	
				
			[21002] = {
				dwDressID = 21002;strName=T"<font color='#ccbb00'>叱咤风云武器化身</font>",dwWearPos= 1,dwPro = 2,
				strDescription=T'战场套武器',
				TabProperty = { [1] = {dwAttack = 32555,},[2] = nil,[3] = {dwCrit = 1455,},[4] = nil,[5] = {dwPoJiaValue = 2155,},[6] = nil,[7] = {dwAppendCrit = 1355,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_dao_zcwuqi.png',strIconGray='0',
				dwMshID = 203011,
				dwItemID = 1920002,
				TabMoney = nil,
				LifeInfo = {
					[1] = {dwDay = 3};
					[2] = {dwDay = 7};
					[3] = {dwDay = 0};
				},				
				TabHowGet = {3}; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = true;
				};				
			};	
	-- 职业剑
	[3] = {
			[30001] = {
				dwDressID = 30001;strName=T"<font color='#ccbb00'>郎情妾意化身</font>",dwWearPos= 2,dwPro = 3,
				strDescription=T'结婚套化身',
				TabProperty = { [1] = {dwHPMax = 18888,},[2] = nil,[3] = {dwDefense = 1888,},[4] = nil,[5] = {dwPoJiaDiKang = 1888,},[6] = nil,[7] = {dwCritDown = 1000,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_jian_jiehunyifu.png',strIconGray='0',
				dwMshID = 302010,
				dwItemID = 1830001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 1999};
					[2] = {dwDay = 30,dwNum = 3999};
					[3] = {dwDay = 0,dwNum = 9999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};

			[31001] = {
				dwDressID = 31001;strName=T"<font color='#ccbb00'>叱咤风云衣服化身</font>",dwWearPos= 2,dwPro = 3,
				strDescription=T'战场套衣服',
				TabProperty = { [1] = {dwHPMax = 26666,},[2] = nil,[3] = {dwDefense = 2666,},[4] = nil,[5] = {dwPoJiaDiKang = 2666,},[6] = nil,[7] = {dwCritDown = 1300,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_jian_zcyifu.png',strIconGray='0',
				dwMshID = 303010,
				dwItemID = 1930001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 49999};
					[2] = {dwDay = 30,dwNum = 199999};
					[3] = {dwDay = 0,dwNum = 599999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};	
				
			[31002] = {
				dwDressID = 31002;strName=T"<font color='#ccbb00'>叱咤风云武器化身</font>",dwWearPos= 1,dwPro = 3,
				strDescription=T'战场套武器',
				TabProperty = { [1] = {dwAttack = 32555,},[2] = nil,[3] = {dwCrit = 1455,},[4] = nil,[5] = {dwPoJiaValue = 2155,},[6] = nil,[7] = {dwAppendCrit = 1355,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_jian_zcwuqi.png',strIconGray='0',
				dwMshID = 303011,
				dwItemID = 1930002,
				TabMoney = nil,
				LifeInfo = {
					[1] = {dwDay = 3};
					[2] = {dwDay = 7};
					[3] = {dwDay = 0};
				},				
				TabHowGet = {3}; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = true;
				};							
			};
	-- 职业枪
	[4] = {
			[40001] = {
				dwDressID = 40001;strName=T"<font color='#ccbb00'>郎情妾意化身</font>",dwWearPos= 2,dwPro = 4,
				strDescription=T'结婚套化身',
				TabProperty = { [1] = {dwHPMax = 18888,},[2] = nil,[3] = {dwDefense = 1888,},[4] = nil,[5] = {dwPoJiaDiKang = 1888,},[6] = nil,[7] = {dwCritDown = 1000,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_qiang_jiehunyifu.png',strIconGray='0',
				dwMshID = 402010,
				dwItemID = 1840001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 1999};
					[2] = {dwDay = 30,dwNum = 3999};
					[3] = {dwDay = 0,dwNum = 9999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};
				
			[41001] = {
				dwDressID = 41001;strName=T"<font color='#ccbb00'>叱咤风云衣服化身</font>",dwWearPos= 2,dwPro = 4,
				strDescription=T'战场套衣服',
				TabProperty = { [1] = {dwHPMax = 26666,},[2] = nil,[3] = {dwDefense = 2666,},[4] = nil,[5] = {dwPoJiaDiKang = 2666,},[6] = nil,[7] = {dwCritDown = 1300,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_qiang_zcyifu.png',strIconGray='0',
				dwMshID = 403010,
				dwItemID = 1940001,
				TabMoney = {
					[1] = {dwDay = 7,dwNum = 49999};
					[2] = {dwDay = 30,dwNum = 199999};
					[3] = {dwDay = 0,dwNum = 599999};
				},
				TabHowGet = nil; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = false;
				};
				
			[41002] = {
				dwDressID = 41002;strName=T"<font color='#ccbb00'>叱咤风云武器化身</font>",dwWearPos= 1,dwPro = 4,
				strDescription=T'战场套武器',
				TabProperty = { [1] = {dwAttack = 32555,},[2] = nil,[3] = {dwCrit = 1455,},[4] = nil,[5] = {dwPoJiaValue = 2155,},[6] = nil,[7] = {dwAppendCrit = 1355,},[8] = nil,[9] = nil,[10] = nil,},
				strIcon = 'Icon_huashen_qiang_zcwuqi.png',strIconGray='0',
				dwMshID = 403011,
				dwItemID = 1940002,
				TabMoney = nil,
				LifeInfo = {
					[1] = {dwDay = 3};
					[2] = {dwDay = 7};
					[3] = {dwDay = 0};
				},				
				TabHowGet = {3}; -- 1，对应HowGetDressbyType 后的描述
				TabSuit = nil;
				boardcast = true;
				};				
			};
	};
	
	DressByItem = {
			[1] = 11002;
			[2] = 21002;
			[3] = 31002;
			[4] = 41002;
	};
	
	
	WearPosList = 
	{
		enItemWearPos.eWeapon,
		enItemWearPos.eCloth,
		enItemWearPos.eGloves,
		enItemWearPos.eShoes,
	};
	
	--时装操作消息类型
	OperMsgType = 
	{
		Buy		= 1,	--购买 续费
		Wear	= 2,	--穿戴
		TakeOff	= 3,	--脱掉
		Show	= 4,	--显示
		Hide	= 5,	--隐藏
		
	};
	
	--时装操作返回消息类型
	OperRetMsgType = 
	{
		ADD 		= 1,
		UPDATE 		= 2,
		DELTE		= 3,
	};
	
	--时装容器类型
	PacketType = 
	{
		PACKET = 1, --衣柜
		EQUIP = 2, 	--装备
	};
	
	--获取途径对应表
	HowGetDressbyType =
	{
		[1] = {str = T"每日奖励：不拉不拉";click = function() print(1111111) end;bSuper =false;}; --T"每日奖励：不拉不拉"
		[2] = {str = T"击杀Boss：不拉不拉";click = function() print(2222222) end;bSuper =false;}; --T"击杀Boss：不拉不拉"
		[3] = {str = T"通过充值活动等方式获得叱咤风云武器券";click = function() print(3333333) end;bSuper =false;}; --T"充值活动：不拉不拉"
		[4] = {str = T"世家活动：不拉不拉";click = function() print(4444444) end;bSuper =false;}; --T"世家活动：不拉不拉"
	};
	
	--套装列表
	SuitList = {
		[1] = {setDressId = {10000, 30000}, attr = {dwAttack= 20 ,dwDefense= 10,}, name = T"兔女郎套装"},
		[2] = {setDressId = {20000, 40000}, attr = {dwAttack= 30 ,dwDefense= 20,}, name = T"兔女郎套装"},
	};
	
	--推荐时装列表
	--[职业] =  {}
	RecommendList = {
		[1] = {11002,};
		[2] = {21002,};
		[3] = {31002,};
		[4] = {41002,};
	};
	--重点推荐图片列表
	PriorityList = {
		--[职业]  = {[  顺序]=  { Img 图片，dwItemID 物品ID } }
		[1] = {
				[1] = {Img = "img://load1.png",dwDressID = 10001};
				[2] = {Img = "img://load2.png",dwDressID = 11001};
				[3] = {Img = "img://load3.png",dwDressID = 11002};				
				};		
		[2] = {
				[1] = {Img = "img://load1.png",dwDressID = 20001};
				[2] = {Img = "img://load2.png",dwDressID = 21001};
				[3] = {Img = "img://load3.png",dwDressID = 21002};
				};		
		[3] = {
				[1] = {Img = "img://load1.png",dwDressID = 30001};
				[2] = {Img = "img://load2.png",dwDressID = 31001};
				[3] = {Img = "img://load3.png",dwDressID = 31002};
				};		
		[4] = {
				[1] = {Img = "img://load1.png",dwDressID = 40001};
				[2] = {Img = "img://load2.png",dwDressID = 41001};
				[3] = {Img = "img://load3.png",dwDressID = 41002};
				};

	};
	--赠送格子数
	InitBoxNum = 2;
	--衣柜配置
	ClothBox = {
		-- 格子序号， nItemID消耗物品ID  nNum消耗数量
		[1] = {nItemID = 5500020;nNum = 1;};
		[2] = {nItemID = 5500020;nNum = 1;};
		[3] = {nItemID = 5500020;nNum = 3;};
		[4] = {nItemID = 5500020;nNum = 6;};
		-- [5] = {nItemID = 5500020;nNum = 9;};
		-- [6] = {nItemID = 5500020;nNum = 12;};
	};
	WearPosImg = {
		[1] = "img://UI_shizhuang_wuqi.png",
		[2] = "img://UI_shizhuang_yifu.png",
	};
	--属性字符串
	ProperyName 	= { 																--TIPS属性字符串
				dwHPMax 		= T"生命 + %d";
				dwMPMax         = T"内力 + %d";
				dwCritDown 		= T"暴击抵抗 + %d";
				dwAttack 		= T"攻击 + %d"; 
                dwDefense 		= T"防御 + %d";
                dwCrit 			= T"暴击 + %d";
                dwFlee 			= T"身法 + %d";				
				dwPoJiaDiKang 	= T"伤害抵御 + %d";
				dwPoJiaValue 	= T"破甲攻击 + %s";		
				dwAppendCrit	= T"暴击伤害 + %s";				
			};
	Text = {
			Attr = T"<font color='#09a8dc'>属性增加</font><font color='#FFFF00' size='10'>（放入衣橱才能生效）</font>"; --属性增加
			HuaLevel = T"<font color='#FF0000'>（化身丹%d级）</font>"; -- 化身丹%d级
			BuyBtn1  = T"卸下"; -- 卸下
			BuyBtn2  = T"穿戴"; -- 穿戴
			BuyBtn3  = T"获得"; -- 获得	（元宝购买）
			BuyBtn4  = T"获得"; -- 获得（不能用元宝）	
			TryBtn1  = T"试穿"; -- 试穿
			TryBtn2  = T"卸下"; -- 卸下	
			TryBtn3  = T"移出衣橱"; -- 移出衣柜
			TryBtn4  = T"放入衣橱"; -- 放入衣柜
			Label    = T"活动获得"; -- 活动获得
			Color1   = "<font color='#17cf3e'>%s</font>";	--属性条件满足属性颜色
			Color2	 = "<font color='#5a5a5a'>%s</font>";	--属性条件不满足属性颜色
			Color3   = "<font color='#FFFFFF'>%s</font>";	--套装条件满足套装名颜色
			Color4	 = "<font color='#FF0000'>%s</font>";	--套装条件不满足套装名颜色	
			Color5   = "<font color='#FFFFFF'>%s</font>";	--套装条件满足属性颜色
			Color6	 = "<font color='#FF0000'>%s</font>";	--套装条件不满足属性颜色
			Progress1 = "(%d/%d)"; --满足套装Tips 个数
			Progress2 = "(%d/%d)"; --不满足套装Tips 个数
			DayStr   = T"%d天"; -- 几天  
			MaxTime  = T"永久";--下拉菜单永久
			dwGold   = T"<font color='#fffc00'>续费总元宝：</font><img src = 'img://GodMoneyIcon.png' width='19' height='12'>%d元宝";--续费总元宝
			NeedGold = T"(<img src = 'img://GodMoneyIcon.png' width='19' height='12'>%d元宝)";--购买元宝
			Aging    = T"时效：%s"; -- 购买时效
			IsNoCan1 = T"元宝不足"; -- 元宝不足
			IsNoCan2 = T"此时装永久"; -- 此时装永久
			IsNoCan3 = T"已拥有此时装"; -- 已拥有此时装
			IsNoCan4 = T"请选择续费的时装"; -- 请选择续费的时装
			IsNoCan5 = T"没有足够的衣箱格子"; -- 没有足够的衣箱格子
			IsNoCan6 = T"开放格子物品不足"; -- 开放格子物品不足
			IsNoCan7 = T"先开放前面格子"; -- 先开放前面格子
			StrDay   = T"%d天";
			StrHour  = T"%d小时";
			strMin   = T"%d分钟";
			strtime1 = T"<font color='#17cf3e'>到期时间：</font>%s";--删除时间：
			strtime2 = T"<font color='#17cf3e'>剩余时间：</font>%s";--剩余时间：
			strHow   = T"获取途径";--获取方式
			broadcast= T"恭喜%s获得了%s，战力大增";
			strItem  = T"激活需要背包中有<font color='#00FF00'>%d个%s</font>"; -- 激活需要背包中有2个扩展券
			strExtend= T"请问您是要开启新格位吗？"; -- 请问你要激活---
			Attrstr  = T"<font color='#00aeff'>衣橱属性加成</font><br/>%s"; -- 衣橱属性加成---
			WinNotice= T"卸下该化身会移除所加属性，是否继续？"; -- 卸下该化身会移除所加属性，是否继续？
			AddNotice= T"当前衣橱没有空位放置，是否开启新格位？"; -- 卸下该化身会移除所加属性，是否继续？
			DelNotice= T"%s已过期，请续费"; -- 删除%s请续费
			DelTry   = T"化身续费";--赶紧续费
			srtDeffect = T"1.使用彩戏绣包获得<br/>2.活动赠送<br/>3.商城购买"
	};
	Tips = {
			Name = "<p align='center' ><font color='#fffc00' size='16'>【%s】</font></p>"; --武器名字
			Pos  = T"<font color='#ff9900' size='14'>化身类别：</font><font color='#ffffff' size='14'>%s</font><br>" ;--佩戴部位：
			Pro  = T"<font color='#ff9900' size='14'>职业：</font><font color='#ffffff' size='14'>%s</font><br><br>"; --职业：
			Attr = T"<font color='#00aeff' size='12' >增加属性:<br>%s</font>"; --增加属性
			Suit = T"<font size='12'>套装效果：%s</font>"; -- 套装效果：
			Effect = T"<font size='12'>激活效果：</font>"; -- 激活效果：
			Time1  = T"<font size='12'>到期时间：%s</font>"; -- 化身装到期时间：
			Time2  = T"<font size='12'>剩余时间：%s</font>"; -- 化身装剩余时间：
			Time3  = T"<font size='12'>【永久】</font>"; --【永久】
			DesStr = T"<font color='#FFFF00'>购买后放入衣柜才可获得属性加成</font>"; --购买后放入衣柜才可获得属性加成
	};
	--自动变换时间 /秒
	AutoTime = 5;
	--自动变化标志位
	bAutoflg = true;
	--时装续费时间间隔/分钟
	ContinueTime = 30;
	--时装少于多少时间提示/分钟
	NeedContinueTime = 60;
	--模型大小因数
	fSclValue = 1.5;  
	--客户端时间延迟
	delay   = 5;
};

--根据化身丹等级得到时装属性
function FashionDressConfig:GetDressAttr(dwHuaShenDanLevel, dwProf, dwDressId)
	local attrCfg = self.DressList[dwProf][dwDressId].TabProperty;
	if not attrCfg then return end;

	local t_attr = _G.SSingleAttrChange:new();
	for level, attr in pairs(attrCfg) do
		if dwHuaShenDanLevel >= level then
			for k, v in pairs(attr) do
				if t_attr[k] then
					t_attr[k] = t_attr[k] + v;
				end
			end
		end
	end
	
	return t_attr;
end;

local function IsContainTab(setFather, setSon)
	local bIsCantain = false;
	for _, v in pairs(setSon) do
		for _, v1 in pairs(setFather) do
			bIsCantain = false;
			if v == v1 then
				bIsCantain = true;
				break;
			end
		end
		
		if not bIsCantain then
			return false;
		end
	end
	
	return true
end

--得到所有套装属性
function FashionDressConfig:GetAllSuitAttr(dwProf, setEquipDress)
	local t_attr = _G.SSingleAttrChange:new();
	
	--统计所有已穿戴的dressId
	local dressList = {}
	for _, v in pairs(setEquipDress) do
		table.insert( dressList, v.dressId)
	end
	
	--循环所有已穿戴装备 统计满足条件的套装
	local suitList = {};
	local dressCfg = nil;
	local suitCfg = nil;
	for dwWearPos, dressInfo in pairs(setEquipDress) do
		dressCfg = self.DressList[dwProf][dressInfo.dressId];
		if dressCfg.TabSuit then
			suitCfg = self.SuitList[dressCfg.TabSuit];
			if IsContainTab(dressList, suitCfg.setDressId) then
				suitList[dressCfg.TabSuit] = 1;
			end
		end
	end
	
	--计算所有满足的套装属性
	for dwSuitId, _ in pairs(suitList) do
		suitCfg = self.SuitList[dwSuitId];
		
		for k, v in pairs(suitCfg.attr) do
			if t_attr[k] then
				t_attr[k] = t_attr[k] + v;
			end
		end
	end
	
	return t_attr;
end

_G.HuaShenDanConfig = {
	--属性信息
	AttrInfo = {
		--所加属性 覆盖型  1为初始值没有属性
		[1] = {dwAttack= 0 ,dwDefense= 0,dwHPMax= 0,dwMPMax= 0,dwFlee= 0,dwCrit= 0,}, --- [1] 一等级 riseStartExp 升星所需要的经验
		[2]={dwAttack =1000,dwDefense =500,dwHPMax =5000,dwMPMax =100,dwFlee =20,dwCrit =20,},
		[3]={dwAttack =2500,dwDefense =1250,dwHPMax =12500,dwMPMax =250,dwFlee =50,dwCrit =50,},
		[4]={dwAttack =5000,dwDefense =2500,dwHPMax =25000,dwMPMax =500,dwFlee =100,dwCrit =100,},
		[5]={dwAttack =9000,dwDefense =4500,dwHPMax =45000,dwMPMax =900,dwFlee =180,dwCrit =180,},
		[6]={dwAttack =15000,dwDefense =7500,dwHPMax =75000,dwMPMax =1500,dwFlee =300,dwCrit =300,},
		[7]={dwAttack =23000,dwDefense =11500,dwHPMax =115000,dwMPMax =2300,dwFlee =460,dwCrit =460,},
		[8]={dwAttack =33500,dwDefense =16750,dwHPMax =167500,dwMPMax =3350,dwFlee =670,dwCrit =670,},
		[9]={dwAttack =46500,dwDefense =23250,dwHPMax =232500,dwMPMax =4650,dwFlee =930,dwCrit =930,},
		[10]={dwAttack =63000,dwDefense =31500,dwHPMax =315000,dwMPMax =6300,dwFlee =1260,dwCrit =1260,},
		[11]={dwAttack =84000,dwDefense =42000,dwHPMax =420000,dwMPMax =8400,dwFlee =1680,dwCrit =1680,},
	};
	--表现信息（化身丹图片配置）
	DataInfo = {
		[1] = {Icon = "img://UI_shizhuang_huashen1.png";};
		[2] = {Icon = "img://UI_shizhuang_huashen2.png";};
		[3] = {Icon = "img://UI_shizhuang_huashen3.png";};
		[4] = {Icon = "img://UI_shizhuang_huashen4.png";};
		[5] = {Icon = "img://UI_shizhuang_huashen5.png";};
		[6] = {Icon = "img://UI_shizhuang_huashen6.png";};
		[7] = {Icon = "img://UI_shizhuang_huashen7.png";};
		[8] = {Icon = "img://UI_shizhuang_huashen8.png";};
		[9] = {Icon = "img://UI_shizhuang_huashen9.png";};
		[10] = {Icon = "img://UI_shizhuang_huashen10.png";};
		[11] = {Icon = "img://UI_shizhuang_huashen10.png";};
	};
	--级别信息
	LevelInfo = {
		--dwItemID 物品ID dwNum -- 数量  dwExp 升级经验 dwMoney 消耗银两 0则不显示
		[1] = {dwItemID =5501190 ;dwNum =2 ;dwExp = 0;dwMoney = 0;};
		[2] = {dwItemID =5501190 ;dwNum =3 ;dwExp = 5000;dwMoney = 0;};
		[3] = {dwItemID =5501190 ;dwNum =4 ;dwExp = 12000;dwMoney = 0;};
		[4] = {dwItemID =5501190 ;dwNum =6 ;dwExp = 22000;dwMoney = 0;};
		[5] = {dwItemID =5501190 ;dwNum =8 ;dwExp = 34000;dwMoney = 0;};
		[6] = {dwItemID =5501190 ;dwNum =10 ;dwExp = 48000;dwMoney = 0;};
		[7] = {dwItemID =5501190 ;dwNum =12 ;dwExp = 64000;dwMoney = 0;};
		[8] = {dwItemID =5501190 ;dwNum =14 ;dwExp = 82000;dwMoney = 0;};
		[9] = {dwItemID =5501190 ;dwNum =16 ;dwExp = 103000;dwMoney = 0;};
		[10] = {dwItemID =5501190 ;dwNum =20 ;dwExp = 127000;dwMoney = 0;};
		[11] = {dwItemID =5501190 ;dwNum =20 ;dwExp = 155000;dwMoney = 0;};
		
		dwMaxLevel = 11;
	};
	
	--化身丹广播等级
	BoardcastLevel = 5;
	
	--消耗倍数列表
	MoreList = {1,5,10};
	--模型大小因数
	fSclValue = 1; 
	--经验初始化图片
	InitImg ={dwExp = 0,dwImg ="img://UI_shizhuang_jingyan1.png",Name = T"<font color='#00ff00'>次品龙丹</font>"};
	--化身丹升级配置
	HuaShenUpLevel = 
	{
		quality = 
		{
			{dwExp = 100, dwWeight = 70000,dwImg ="img://UI_shizhuang_jingyan2.png",Name = T"<font color='#00aeff'>普通龙丹</font>"},
			{dwExp = 200, dwWeight = 20000,dwImg ="img://UI_shizhuang_jingyan3.png",Name = T"<font color='#fffc00'>珍品龙丹</font>"},
			{dwExp = 500, dwWeight = 10000,dwImg ="img://UI_shizhuang_jingyan4.png",Name = T"<font color='#f000ff'>至尊龙丹</font>"},
		},
		
		multiple = 
		{
			{mul = 1, dwWeight = 70000,},
			{mul = 2, dwWeight = 20000,},
			{mul = 5, dwWeight = 10000,},
		},
	};
	
	
	--自动升阶间隔 /秒
	AutoTime = 1;
	--文字配置
	Text = {
		IsEnough		= "<font color='#FFFFFF'>%s</font>";								--物品充足
		IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足
		AutoBtnStr1     = T"自动升阶"; -- 自动升阶
		AutoBtnStr2     = T"停止"; -- 自动升阶停止
		UpLadder        = T"升阶%d次"; --升阶几次
		TotalAttr       = T"<font color='#00aeff'>总属性加成:</font><br>%s";
		IsNoCan1        = T"物品不足"; -- 物品不足
		IsNoCan2        = T"银两不足"; -- 银两不足
		IsNoCan3        = T"阶段无法提升，化身丹已满阶"; -- 满级
		broadcast       = T"恭喜%s成功的将化身丹提升至%d级，战力大增";
		broadcast1       = T"恭喜%s成功的将化身丹提升至满级，战力大增";
		gxtips   		= T"取消勾选隐藏该时装";
		ImgTips         = T"<font color='#00ff00'>次品龙丹</font><font color='#ffffff'>:无法获得任何经验的龙丹</font><br><font color='#00aeff'>普通龙丹</font><font color='#ffffff'>:朴实无华的龙丹，每颗可增加化身丹100经验</font><br><font color='#fffc00'>珍品龙丹</font><font color='#ffffff'>:珍贵无比的龙丹，每颗可增加化身丹200经验</font><br><font color='#f000ff'>至尊龙丹</font><font color='#ffffff'>:丹中至尊的龙丹，每颗可增加化身丹500经验</font><br><font color='#00ffff'>玩家每次摇奖可以随机出来一颗品质龙丹以及获得的数<br>量，最终获得的经验以龙丹品质和数量为准</font>";
	};

};

--总经验计算化身丹等级信息
-- i 等级 dwExp - dwMax 当前等级经验
function HuaShenDanConfig:ExpToLevel(dwExp)
	for i = self.LevelInfo.dwMaxLevel, 1, -1 do
		local dwMax = self.LevelInfo[i].dwExp
		if dwExp >= dwMax then 
			return i,dwExp - dwMax
		end;
	end
	return 1,0
end
--通过经验获取图片
--dwExp 基础经验
function HuaShenDanConfig:GetExpImg(dwExp)
	local Info = self.HuaShenUpLevel.quality
	if not dwExp then return self.InitImg end
	for k,v in pairs(Info) do
		if  v.dwExp == dwExp then
			return v
		end
	end
	return self.InitImg
end

--通过属性计算战斗力
--属性表 tInfo
function HuaShenDanConfig:GetScoreByTable(tInfo)
	local nValue = 0;
	for k,v in pairs (tInfo) do
		if EquipGradeConfig[k] then
			nValue = nValue + EquipGradeConfig[k]*v;
		end
	end
	return math.floor(nValue);
end
function HuaShenDanConfig:RandomUpLevel()
	--随机一个基础经验
	local dwExp = 0;
	local dwMul = 0;
	
	local dwTotalWeight = 0;
	for k, v in pairs(self.HuaShenUpLevel.quality) do
		dwTotalWeight = dwTotalWeight + v.dwWeight;
	end
	
	local randomNum = math.random(1, dwTotalWeight);
	dwTotalWeight = 0;
	for k, v in pairs(self.HuaShenUpLevel.quality) do
		dwTotalWeight = dwTotalWeight + v.dwWeight;
		if randomNum <= dwTotalWeight then
			dwExp = v.dwExp;
			break;
		end
	end
	
	--随机一个经验倍数
	dwTotalWeight = 0;
	for k, v in pairs(self.HuaShenUpLevel.multiple) do
		dwTotalWeight = dwTotalWeight + v.dwWeight;
	end
	
	randomNum = math.random(1, dwTotalWeight);
	dwTotalWeight = 0;
	for k, v in pairs(self.HuaShenUpLevel.multiple) do
		dwTotalWeight = dwTotalWeight + v.dwWeight;
		if randomNum <= dwTotalWeight then
			dwMul = v.mul;
			break;
		end
	end
	
	return dwExp, dwMul;
end
