﻿--岑夫子活动
--配置
_G.ExaminationConf = {
	StartWeek	= {1,2,3,4,5,6,7};--星期几
	NoticeTime	= "19:00";	--通知活动即将开始的时间
	StartTime	= "19:02";	--开始时间
	EndTime		= "19:30";	--结束时间
	QuestionNum	= 40;		--问题数目
	MakeUpGold	= 10;		--补考花销元宝
	MakeUpBindGold	= 0;	--补考花销礼金
	ReadyTime = 121000;     --准备时间毫秒（121-1s显示）
	AnswerTime = 11000;     --答题倒计时毫秒（11-1s显示）
	RankFailed = "未上榜";  --玩家没能上榜
	BoardCast = "岑夫子活动结束，本次活动中积分前三名的玩家分别是：%s";
	BuKaoTips = "";
	--积分 delt传入值为毫秒
	GetPoint = function(delt)
		if delt < 3000 then
			return 3;
		elseif delt < 6000 then
			return 2;
		elseif delt < 11000 then
			return 1;
		else
			return -1;
		end;
	end;
	
	--奖励
	GetReward = function(level)
		local reward = {
			nExp = math.floor(_G.RoleUpLevelConfig[level].dwTaskExpHuan * 0.2);
			nMoney = level * 45;
			nElem = math.floor(150 + (level * 3));
		}
		return reward;
	end;
};
--题库题个数
_G.ExaminationPoolNum = 143;
--题库
_G.ExaminationQuestion={ 
    [1] = {
        [1] = '天官赐福值将在每日几点重置清零？',
        [2] = {
            [1] = '6点',
            [2] = '7点',
            [3] = '8点',
            [4] = '4点',
        },
        [3] = 1,
    },
    [2] = {
        [1] = '风云任务每8环的特殊奖励包括？',
        [2] = {
            [1] = '经验、真气、银两、神龙果',
            [2] = '经验、真气、银两、强化石',
            [3] = '经验、真气、银两、亮银砂',
            [4] = '经验、真气、银两、剑魂石',
        },
        [3] = 1,
    },
    [3] = {
        [1] = '风云客栈的当家是？',
        [2] = {
            [1] = '许竹青',
            [2] = '谢听风',
            [3] = '梁梦儿',
            [4] = '洛观云',
        },
        [3] = 1,
    },
    [4] = {
        [1] = '梁梦儿的真实身份是？',
        [2] = {
            [1] = '完颜洪烈的孙女',
            [2] = '江南五家后人',
            [3] = '邻家小妹',
            [4] = '平一指的女儿',
        },
        [3] = 1,
    },
    [5] = {
        [1] = '南疆五仙教的五仙巫使分别为？',
        [2] = {
            [1] = '天蛛、圣蝎、玄蛇、冥蟾、幽蜈',
            [2] = '飞、断、空、长、立',
            [3] = '天蛛、圣蝎、玄蛇、冥蟾、沙蜥',
            [4] = '天蛛、圣蝎、赤狐、玄蛇、冥蟾',
        },
        [3] = 1,
    },
    [6] = {
        [1] = '在白驼山庄假扮欧阳锋的人是？',
        [2] = {
            [1] = '天元',
            [2] = 'GM',
            [3] = '研发团队',
            [4] = '欧阳克',
        },
        [3] = 1,
    },
    [7] = {
        [1] = '四阶名剑赤霄可触发的名剑效果剑气·断骨可降低敌方的什么属性？',
        [2] = {
            [1] = '50%身法',
            [2] = '30%身法',
            [3] = '80%身法',
            [4] = '50%防御',
        },
        [3] = 1,
    },
    [8] = {
        [1] = '升阶玄铁和升阶玄晶哪个是用在宝甲升阶的宝物？',
        [2] = {
            [1] = '升阶玄晶',
            [2] = '升阶玄铁',
            [3] = '两个都是',
            [4] = '两个都不是',
        },
        [3] = 1,
    },
    [9] = {
        [1] = '与老顽童摇骰子时，摇到一个“全”字可获得全属性真气多少点？',
        [2] = {
            [1] = '5000',
            [2] = '3000',
            [3] = '4000',
            [4] = '10000',
        },
        [3] = 1,
    },
    [10] = {
        [1] = '【众志成城】的城墙修复值达到100%时，可触发全服几倍经验奖励？',
        [2] = {
            [1] = '5倍',
            [2] = '3倍',
            [3] = '2倍',
            [4] = '10倍',
        },
        [3] = 1,
    },
    [11] = {
        [1] = '打什么怪物最容易掉落夜光杯？',
        [2] = {
            [1] = '草上飞',
            [2] = '白驼剑侍',
            [3] = 'GM',
            [4] = '这题就是来坑爹的',
        },
        [3] = 4,
    },
    [12] = {
        [1] = '大破联营的最后通关条件是？',
        [2] = {
            [1] = '砍倒联盟大旗',
            [2] = '击杀联营统帅',
            [3] = '杀死所有敌人',
            [4] = '完成以上三条',
        },
        [3] = 1,
    },
    [13] = {
        [1] = '《守卫襄阳》副本中，多少个敌人攻入襄阳城，将造成副本失败？',
        [2] = {
            [1] = '100个',
            [2] = '300个',
            [3] = '250个',
            [4] = '180个',
        },
        [3] = 1,
    },
    [14] = {
        [1] = '丘山四隐原本要将《武穆遗书》送给谁？',
        [2] = {
            [1] = '岳四公子',
            [2] = '岳三公子',
            [3] = '郭靖',
            [4] = '你',
        },
        [3] = 1,
    },
    [15] = {
        [1] = '最贵的定情信物，价值几何？',
        [2] = {
            [1] = '8亿银两',
            [2] = '10亿银两',
            [3] = '1万元宝',
            [4] = '8亿礼金',
        },
        [3] = 1,
    },
    [16] = {
        [1] = '当夫妻二人的亲密度达到多少值时，可以申请举办婚宴？',
        [2] = {
            [1] = '100',
            [2] = '1000',
            [3] = '200',
            [4] = '50',
        },
        [3] = 1,
    },
    [17] = {
        [1] = '恩仇令的作用是？',
        [2] = {
            [1] = '打探仇人的下落',
            [2] = '卖萌',
            [3] = '占背包格子',
            [4] = '增加伴侣亲密度',
        },
        [3] = 1,
    },
    [18] = {
        [1] = '经脉贯通可以加成哪一种江湖绝学的技能伤害？',
        [2] = {
            [1] = '六脉神剑',
            [2] = '一阳指',
            [3] = '弹指神通',
            [4] = '狮子吼',
        },
        [3] = 1,
    },
    [19] = {
        [1] = '称号·武林十尊对应的是哪一个排行榜的前十名侠士？',
        [2] = {
            [1] = '战力榜',
            [2] = '等级榜',
            [3] = '实战榜',
            [4] = '经脉榜',
        },
        [3] = 1,
    },
    [20] = {
        [1] = '世家称谓达到几级时，可享受到已激活的世家属性加成？',
        [2] = {
            [1] = '新贵（四级）',
            [2] = '精英（五级）',
            [3] = '骨干（六级）',
            [4] = '才俊（三级）',
        },
        [3] = 1,
    },
    [21] = {
        [1] = '世家图腾进阶至麒麟时，世家成员上限可扩增至多少人？',
        [2] = {
            [1] = '100人',
            [2] = '150人',
            [3] = '80人',
            [4] = '95人',
        },
        [3] = 1,
    },
    [22] = {
        [1] = '世家押镖可以由谁来发起？',
        [2] = {
            [1] = '仅限家主',
            [2] = '家主和执事',
            [3] = '本世家成员皆可',
            [4] = '你猜',
        },
        [3] = 1,
    },
    [23] = {
        [1] = '暗棋是由谁创立的？',
        [2] = {
            [1] = '岳飞',
            [2] = '天元',
            [3] = '完颜亮',
            [4] = '你大爷',
        },
        [3] = 3,
    },
    [24] = {
        [1] = '天外陨石可以用来做什么？',
        [2] = {
            [1] = '找何居奇兑换宝物',
            [2] = '砸人',
            [3] = '嚼着吃，嘎嘣脆',
            [4] = '召唤神龙',
        },
        [3] = 1,
    },
    [25] = {
        [1] = '多少个棋魂可以兑换一个60级紫色装备箱？',
        [2] = {
            [1] = '38个',
            [2] = '40个',
            [3] = '48个',
            [4] = '28个',
        },
        [3] = 1,
    },
    [26] = {
        [1] = '《烽火辎路》副本中，小猪的作用是？',
        [2] = {
            [1] = '掉落商城道具',
            [2] = '撞人',
            [3] = '卖萌',
            [4] = '烤着吃',
        },
        [3] = 1,
    },
    [27] = {
        [1] = '最多能有几个人一起进行演武团练？',
        [2] = {
            [1] = '10个人',
            [2] = '8个人',
            [3] = '12个人',
            [4] = '7个人',
        },
        [3] = 1,
    },
    [28] = {
        [1] = '宝石套装·辉曜宝器的最低激活条件是？',
        [2] = {
            [1] = '12件装备满镶嵌3品宝石',
            [2] = '7件装备满镶嵌3品宝石',
            [3] = '7件装备满镶嵌5品宝石',
            [4] = '12件装备满镶嵌5品宝石',
        },
        [3] = 1,
    },
    [29] = {
        [1] = '下列哪项不属于武林盟主的尊贵特权？',
        [2] = {
            [1] = '攻击目标时，有一定概率触发一剑封喉',
            [2] = '上线全服发送盟主降临公告',
            [3] = '任免副盟主',
            [4] = '【武林盟主】唯一称号',
        },
        [3] = 1,
    },
    [30] = {
        [1] = '占领亢龙鼎可获得多少经验加成？',
        [2] = {
            [1] = '百分之二十',
            [2] = '百分之二十五',
            [3] = '百分之四十',
            [4] = '百分之十五',
        },
        [3] = 1,
    },
    [31] = {
        [1] = '冥蟾巫使的女儿蓝瞳瞳被你改名之后，叫什么？',
        [2] = {
            [1] = '蓝凤凰',
            [2] = '蓝朱雀',
            [3] = '任盈盈',
            [4] = '屠娇娇',
        },
        [3] = 1,
    },
    [32] = {
        [1] = '多少级以下的少侠可以享受免费洗点？',
        [2] = {
            [1] = '25级以下',
            [2] = '20级以下',
            [3] = '30级以下',
            [4] = '28级以下',
        },
        [3] = 1,
    },
    [33] = {
        [1] = '获得实战经验的唯一方式是？',
        [2] = {
            [1] = '参阅《武尊断篇》',
            [2] = '参阅《武尊残章》',
            [3] = '击杀其他玩家',
            [4] = '击杀BOSS',
        },
        [3] = 1,
    },
    [34] = {
        [1] = '夫妻之间相互赠送什么可以增加亲密度？',
        [2] = {
            [1] = '千纸鹤',
            [2] = '恩仇令',
            [3] = '鲜花',
            [4] = '鸡蛋',
        },
        [3] = 1,
    },
    [35] = {
        [1] = '达成600连斩可获得什么状态？',
        [2] = {
            [1] = '侠骨',
            [2] = '独尊',
            [3] = '铁血',
            [4] = '忠魂',
        },
        [3] = 1,
    },
    [36] = {
        [1] = '玉米受潮后产生的致癌物质是什么？',
        [2] = {
            [1] = '黄曲黄霉素',
            [2] = '黄曲红霉素',
            [3] = '黄曲青霉素',
            [4] = '红曲黄霉素',
        },
        [3] = 1,
    },
    [37] = {
        [1] = '中岳嵩山分为太室山和少室山。少林寺在那座山？',
        [2] = {
            [1] = '少室山',
            [2] = '太室山',
            [3] = '武当山',
            [4] = '嵩山',
        },
        [3] = 1,
    },
    [38] = {
        [1] = '《三国演义》中的“凤雏”是谁？',
        [2] = {
            [1] = '庞统',
            [2] = '诸葛亮',
            [3] = '姜维',
            [4] = '周瑜',
        },
        [3] = 1,
    },
    [39] = {
        [1] = 'WNBA代表什么?',
        [2] = {
            [1] = '美国女子职业篮球赛',
            [2] = '女人吧',
            [3] = '宝马迷你',
            [4] = '美国女子职业棒球赛',
        },
        [3] = 1,
    },
    [40] = {
        [1] = '乌鱼蛋是什么？',
        [2] = {
            [1] = '雌墨鱼卵巢干制品',
            [2] = '墨鱼的蛋',
            [3] = '墨鱼的子宫',
            [4] = '墨鱼的脑髓',
        },
        [3] = 1,
    },
    [41] = {
        [1] = '行星距离太阳近的时候运转速度快，对吗？',
        [2] = {
            [1] = '对',
            [2] = '不对',
            [3] = '似对非对',
            [4] = '对不对关我什么事',
        },
        [3] = 1,
    },
    [42] = {
        [1] = '在亚洲反法西斯战争中，盟军中牺牲的最高级别将领是：',
        [2] = {
            [1] = '张自忠',
            [2] = '傅作义',
            [3] = '叶挺',
            [4] = '李宗仁',
        },
        [3] = 1,
    },
    [43] = {
        [1] = '交通银行属于什么性质？',
        [2] = {
            [1] = '股份制银行',
            [2] = '政策性银行',
            [3] = '农村合作银行',
            [4] = '商业银行',
        },
        [3] = 1,
    },
    [44] = {
        [1] = '坏血病是因缺什么而造成的？',
        [2] = {
            [1] = '维生素C',
            [2] = '维生素A',
            [3] = '维生素B',
            [4] = '维生素D',
        },
        [3] = 1,
    },
    [45] = {
        [1] = '汉字“廿”表示：',
        [2] = {
            [1] = '二十',
            [2] = '四十',
            [3] = '十二',
            [4] = '二',
        },
        [3] = 1,
    },
    [46] = {
        [1] = '辽宁曾被称为：',
        [2] = {
            [1] = '奉天',
            [2] = '顺天',
            [3] = '应天',
            [4] = '黄龙府',
        },
        [3] = 1,
    },
    [47] = {
        [1] = '黄山分为前海，天海，北海，东海，西海等五大景区，所谓的“海”指的是什么？',
        [2] = {
            [1] = '云海',
            [2] = '山泉',
            [3] = '天池',
            [4] = '林海',
        },
        [3] = 1,
    },
    [48] = {
        [1] = '黄金与其它金属混合可以制成五颜六色的色金首饰，当黄金与铜按比例混合，能制成：',
        [2] = {
            [1] = '红色金',
            [2] = '白色金',
            [3] = '棕色金',
            [4] = '乌金',
        },
        [3] = 1,
    },
    [49] = {
        [1] = '如果名义利率低于通货膨胀率时，储蓄是否划算？',
        [2] = {
            [1] = '不划算',
            [2] = '划算',
            [3] = '你猜',
            [4] = '我的钱都在余X宝！',
        },
        [3] = 1,
    },
    [50] = {
        [1] = '古代著名的水利工程都江堰是谁设计的？',
        [2] = {
            [1] = '李冰父子',
            [2] = '李冰',
            [3] = '李刚',
            [4] = '李大钊',
        },
        [3] = 1,
    },
    [51] = {
        [1] = '沟通太平洋和印度洋的水道是：',
        [2] = {
            [1] = '马六甲海峡',
            [2] = '麦哲伦海峡',
            [3] = '好望角',
            [4] = '白令海峡',
        },
        [3] = 1,
    },
    [52] = {
        [1] = '七大洲中面积最小的是：',
        [2] = {
            [1] = '南极洲',
            [2] = '北美洲',
            [3] = '大洋洲',
            [4] = '非洲',
        },
        [3] = 1,
    },
    [53] = {
        [1] = '围棋的产生与什么有关？',
        [2] = {
            [1] = '与古代战争有关',
            [2] = '与古代象棋有关',
            [3] = '与古代政治有关',
            [4] = '与古代音乐有关',
        },
        [3] = 1,
    },
    [54] = {
        [1] = '人参的主要产地在：',
        [2] = {
            [1] = '东北',
            [2] = '西北',
            [3] = '东南',
            [4] = '中原',
        },
        [3] = 1,
    },
    [55] = {
        [1] = '哪一类茶属于发酵茶？',
        [2] = {
            [1] = '红茶',
            [2] = '绿茶',
            [3] = '普洱',
            [4] = '大红袍',
        },
        [3] = 1,
    },
    [56] = {
        [1] = '云南的“普洱茶”缘于什麽？',
        [2] = {
            [1] = '地名',
            [2] = '人名',
            [3] = '植物名',
            [4] = '水道名',
        },
        [3] = 1,
    },
    [57] = {
        [1] = '《奥德赛》的主人公是：',
        [2] = {
            [1] = '俄底修斯',
            [2] = '普罗米修斯',
            [3] = '图兰朵',
            [4] = '奥德赛',
        },
        [3] = 1,
    },
    [58] = {
        [1] = '铁锅通常用哪种铁制成？',
        [2] = {
            [1] = '生铁',
            [2] = '熟铁',
            [3] = '不锈钢',
            [4] = '铁合金',
        },
        [3] = 1,
    },
    [59] = {
        [1] = '在狗的眼睛里世界是什么颜色的？',
        [2] = {
            [1] = '只有黑白灰色',
            [2] = '只有红白黑色',
            [3] = '只有红黄蓝色',
            [4] = '只有红绿蓝色',
        },
        [3] = 1,
    },
    [60] = {
        [1] = '请问在相等分量下，下面哪种食物胆固醇含量最低？',
        [2] = {
            [1] = '兔肉',
            [2] = '牛肉',
            [3] = '猪肉',
            [4] = '鸡肉',
        },
        [3] = 1,
    },
    [61] = {
        [1] = '一般认为篮球起源于：',
        [2] = {
            [1] = '美国',
            [2] = '英国',
            [3] = '西班牙',
            [4] = '巴西',
        },
        [3] = 1,
    },
    [62] = {
        [1] = '樱桃白兰地是用樱桃作原料酿制的，对不对？',
        [2] = {
            [1] = '对',
            [2] = '不对',
            [3] = '实际上是番茄',
            [4] = '它只是颜色像樱桃',
        },
        [3] = 1,
    },
    [63] = {
        [1] = '世界上最大的冰川在哪个洲？',
        [2] = {
            [1] = '南极洲',
            [2] = '北极洲',
            [3] = '大洋洲',
            [4] = '北美洲',
        },
        [3] = 1,
    },
    [64] = {
        [1] = '商品的性价比越高，其市场竞争力越：',
        [2] = {
            [1] = '强',
            [2] = '弱',
            [3] = '看广告',
            [4] = '看疗效',
        },
        [3] = 1,
    },
    [65] = {
        [1] = '世界第一枚邮票出现在：',
        [2] = {
            [1] = '英国',
            [2] = '美国',
            [3] = '奥地利',
            [4] = '比利时',
        },
        [3] = 1,
    },
    [66] = {
        [1] = '在什么条件下柿子才可以结冰？',
        [2] = {
            [1] = '低于零摄氏度',
            [2] = '低于零下十度',
            [3] = '低于五摄氏度',
            [4] = '低于零下一度',
        },
        [3] = 1,
    },
    [67] = {
        [1] = '"蜃楼疑海上，鸟道没云中”赞美的是：',
        [2] = {
            [1] = '悬空寺',
            [2] = '黄山云海',
            [3] = '空中花园',
            [4] = '蓬莱岛',
        },
        [3] = 1,
    },
    [68] = {
        [1] = '海南岛是我国的第几大岛？',
        [2] = {
            [1] = '第二大岛',
            [2] = '第三大岛',
            [3] = '第一大岛',
            [4] = '第四大岛',
        },
        [3] = 1,
    },
    [69] = {
        [1] = '人们最初发明滑冰，是把它作为：',
        [2] = {
            [1] = '交通工具',
            [2] = '社交工具',
            [3] = '休闲工具',
            [4] = '娱乐工具',
        },
        [3] = 1,
    },
    [70] = {
        [1] = '"自由女神像”是哪个国家送给美国的礼物？',
        [2] = {
            [1] = '法国',
            [2] = '英国',
            [3] = '意大利',
            [4] = '西班牙',
        },
        [3] = 1,
    },
    [71] = {
        [1] = '"双喜临门”是我国哪个省市的名字？',
        [2] = {
            [1] = '重庆',
            [2] = '成都',
            [3] = '丽江',
            [4] = '香格里拉',
        },
        [3] = 1,
    },
    [72] = {
        [1] = '阿尔卑斯山脉的最高峰是：',
        [2] = {
            [1] = '勃朗峰',
            [2] = '珠穆朗玛峰',
            [3] = '乞力马扎罗峰',
            [4] = '圣母峰',
        },
        [3] = 1,
    },
    [73] = {
        [1] = '有“植物熊猫”之称的是：',
        [2] = {
            [1] = '银杉',
            [2] = '水杉',
            [3] = '红豆杉',
            [4] = '洋槐',
        },
        [3] = 1,
    },
    [74] = {
        [1] = '古筝和古琴哪一个的弦更多？',
        [2] = {
            [1] = '古筝',
            [2] = '古琴',
            [3] = '我只是来卖萌的',
            [4] = '排除一个错误答案',
        },
        [3] = 1,
    },
    [75] = {
        [1] = '蒲松龄的故居在：',
        [2] = {
            [1] = '山东淄博',
            [2] = '山西临汾',
            [3] = '浙江义乌',
            [4] = '海南三亚',
        },
        [3] = 1,
    },
    [76] = {
        [1] = '小说《包法利夫人》的作者是：',
        [2] = {
            [1] = '福楼拜',
            [2] = '卡梅尔',
            [3] = '契诃夫',
            [4] = '普希金',
        },
        [3] = 1,
    },
    [77] = {
        [1] = '中国共产党的创始人之一李大钊是被哪一方势力杀害的？',
        [2] = {
            [1] = '军阀',
            [2] = '国军',
            [3] = '日伪',
            [4] = '义和团',
        },
        [3] = 1,
    },
    [78] = {
        [1] = '有记录的世界上飞翔距离最远的是什么鸟？',
        [2] = {
            [1] = '北极燕鸥',
            [2] = '虎皮鹦鹉',
            [3] = '丹顶鹤',
            [4] = '旅鸽',
        },
        [3] = 1,
    },
    [79] = {
        [1] = '一个杯子里装有水，水上有一块冰，此时水已满杯，当冰溶后：',
        [2] = {
            [1] = '水会溢出杯子',
            [2] = '水会变少',
            [3] = '水会变暖',
            [4] = '水会被喝掉',
        },
        [3] = 1,
    },
    [80] = {
        [1] = '蔬菜、水果、鸡蛋等商品在不同的时间里价格不同，这差别叫做什么差价？',
        [2] = {
            [1] = '季节差价',
            [2] = '变质差价',
            [3] = '时间差价',
            [4] = '时段差价',
        },
        [3] = 1,
    },
    [81] = {
        [1] = '大气中起吸收紫外线、保护地球生命作用的是哪种成分？',
        [2] = {
            [1] = '臭氧',
            [2] = '一氧化碳',
            [3] = '一氧化氮',
            [4] = '氧化氢',
        },
        [3] = 1,
    },
    [82] = {
        [1] = '"世界三大男高音"中的多明戈和卡雷拉斯都是哪国人？',
        [2] = {
            [1] = '西班牙人',
            [2] = '奥地利人',
            [3] = '意大利人',
            [4] = '法国人',
        },
        [3] = 1,
    },
    [83] = {
        [1] = '人民英雄纪念碑上的雕塑作品《五四运动》是：',
        [2] = {
            [1] = '浮雕',
            [2] = '篆刻',
            [3] = '透雕',
            [4] = '圆雕',
        },
        [3] = 1,
    },
    [84] = {
        [1] = '京剧《群英会》中“周瑜”的行当是：',
        [2] = {
            [1] = '小生',
            [2] = '青衣',
            [3] = '武生',
            [4] = '正生',
        },
        [3] = 1,
    },
    [85] = {
        [1] = '"安哥拉兔”由何得名？',
        [2] = {
            [1] = '原产地',
            [2] = '物种发现者',
            [3] = '圣经典故',
            [4] = '皮毛制品',
        },
        [3] = 1,
    },
    [86] = {
        [1] = '徐悲鸿以画什么闻名世界？',
        [2] = {
            [1] = '奔马',
            [2] = '飞鸟',
            [3] = '游鱼',
            [4] = '植物',
        },
        [3] = 1,
    },
    [87] = {
        [1] = '茶叶的含水量高于8%会导致什么后果？',
        [2] = {
            [1] = '发生霉变',
            [2] = '喝了会变丧尸',
            [3] = '无法泡开',
            [4] = '产生致癌物',
        },
        [3] = 1,
    },
    [88] = {
        [1] = '目前在世界范围内仍使用的历法又叫：',
        [2] = {
            [1] = '格里高利历',
            [2] = '太阳历',
            [3] = '太阴历',
            [4] = '玛雅历',
        },
        [3] = 1,
    },
    [89] = {
        [1] = 'WTO是哪个组织的称呼？',
        [2] = {
            [1] = '世界贸易组织',
            [2] = '世界经济组织',
            [3] = '世界体育组织',
            [4] = '世界社团组织',
        },
        [3] = 1,
    },
    [90] = {
        [1] = '《掀起你的盖头来》是哪个民族的民歌？',
        [2] = {
            [1] = '维吾尔族',
            [2] = '回族',
            [3] = '哈萨克族',
            [4] = '蒙古族',
        },
        [3] = 1,
    },
    [91] = {
        [1] = '人体最大的器官是：',
        [2] = {
            [1] = '皮肤',
            [2] = '大脑',
            [3] = '心脏',
            [4] = '肠道',
        },
        [3] = 1,
    },
    [92] = {
        [1] = '“问君能有几多愁”诗句的下句是：',
        [2] = {
            [1] = '恰似一江春水向东流',
            [2] = '恰似一群太监上青楼',
            [3] = '恰似李煜看了皱眉头',
            [4] = '恰似一夜春风花满楼',
        },
        [3] = 1,
    },
    [93] = {
        [1] = '我国生长的孔雀种类是：',
        [2] = {
            [1] = '绿孔雀',
            [2] = '蓝孔雀',
            [3] = '白孔雀',
            [4] = '孔雀明王',
        },
        [3] = 1,
    },
    [94] = {
        [1] = '地球上出现的潮汐是由于：',
        [2] = {
            [1] = '地月吸引力',
            [2] = '海洋季风',
            [3] = '亚热带季风',
            [4] = '冷热洋流交替',
        },
        [3] = 1,
    },
    [95] = {
        [1] = '我们看到的月光是？',
        [2] = {
            [1] = '月亮反射太阳光',
            [2] = '月球自发光',
            [3] = '月球射线',
            [4] = '云层折射',
        },
        [3] = 1,
    },
    [96] = {
        [1] = '"名不正则言不顺”是哪家的思想？',
        [2] = {
            [1] = '儒家',
            [2] = '道家',
            [3] = '墨家',
            [4] = '法家',
        },
        [3] = 1,
    },
    [97] = {
        [1] = '古人常用松鹤延年图祝寿，鹤是生长在：',
        [2] = {
            [1] = '沼泽地',
            [2] = '悬崖边',
            [3] = '山涧',
            [4] = '半山腰',
        },
        [3] = 1,
    },
    [98] = {
        [1] = '古代游牧民族生活存在太阳崇拜吗？',
        [2] = {
            [1] = '存在',
            [2] = '不存在',
            [3] = '祖先崇拜',
            [4] = '水火崇拜',
        },
        [3] = 1,
    },
    [99] = {
        [1] = '《四世同堂》主题区《重整河山待后生》属于哪一种曲艺形式？',
        [2] = {
            [1] = '鼓词',
            [2] = '评弹',
            [3] = '京剧',
            [4] = '琴书',
        },
        [3] = 1,
    },
    [100] = {
        [1] = '月亮金字塔坐落在哪里？',
        [2] = {
            [1] = '墨西哥',
            [2] = '埃及',
            [3] = '阿拉伯',
            [4] = '阿富汗',
        },
        [3] = 1,
    },
    [101] = {
        [1] = '中国最大的商业银行是：',
        [2] = {
            [1] = '中国工商银行',
            [2] = '中国交通银行',
            [3] = '中国建设银行',
            [4] = '中国邮政银行',
        },
        [3] = 1,
    },
    [102] = {
        [1] = '"海的女儿”是哪个城市的城徽？',
        [2] = {
            [1] = '哥本哈根',
            [2] = '苏黎世',
            [3] = '马德里',
            [4] = '索菲亚',
        },
        [3] = 1,
    },
    [103] = {
        [1] = '全国性抗日战争爆发的标志是？',
        [2] = {
            [1] = '七七事件',
            [2] = '九一八事变',
            [3] = '西安事变',
            [4] = '白色恐怖',
        },
        [3] = 1,
    },
    [104] = {
        [1] = '《第九交响曲》（即《合唱交响曲》）的作者是：',
        [2] = {
            [1] = '贝多芬',
            [2] = '巴赫',
            [3] = '肖邦',
            [4] = '约翰·施特劳斯',
        },
        [3] = 1,
    },
    [105] = {
        [1] = '中国最热的地方在哪里？',
        [2] = {
            [1] = '吐鲁番盆地',
            [2] = '海南',
            [3] = '乌鲁木齐',
            [4] = '格里木盆地',
        },
        [3] = 1,
    },
    [106] = {
        [1] = '七大洲中面积第二的是：',
        [2] = {
            [1] = '非洲',
            [2] = '北美洲',
            [3] = '南美洲',
            [4] = '亚洲',
        },
        [3] = 1,
    },
    [107] = {
        [1] = '斯芬克斯之谜中的“斯芬克斯”是指：',
        [2] = {
            [1] = '希腊神话中的女妖',
            [2] = '人名',
            [3] = '地名',
            [4] = '著作名',
        },
        [3] = 1,
    },
    [108] = {
        [1] = '《嘎达梅林》是哪个民族的叙事歌曲？',
        [2] = {
            [1] = '蒙古族',
            [2] = '维吾尔族',
            [3] = '回族',
            [4] = '藏族',
        },
        [3] = 1,
    },
    [109] = {
        [1] = '被称为“国际会议之都”的城市是：',
        [2] = {
            [1] = '日内瓦',
            [2] = '维也纳',
            [3] = '马德里',
            [4] = '罗马',
        },
        [3] = 1,
    },
    [110] = {
        [1] = '我国最大的淡水湖是：',
        [2] = {
            [1] = '鄱阳湖',
            [2] = '洞庭湖',
            [3] = '青海湖',
            [4] = '洪泽湖',
        },
        [3] = 1,
    },
    [111] = {
        [1] = '哪个国家是钻石的最大产出国？',
        [2] = {
            [1] = '扎伊尔',
            [2] = '南非',
            [3] = '刚果',
            [4] = '阿富汗',
        },
        [3] = 1,
    },
    [112] = {
        [1] = '好莱坞位于美国什么州：',
        [2] = {
            [1] = '加利福尼亚州',
            [2] = '华盛顿州',
            [3] = '夏威夷州',
            [4] = '尤他州',
        },
        [3] = 1,
    },
    [113] = {
        [1] = '闪电的传播路径是：',
        [2] = {
            [1] = '距离最短的路线',
            [2] = '空气最稀薄的路线',
            [3] = '空气最密集的路线',
            [4] = '水分最密集的路线',
        },
        [3] = 1,
    },
    [114] = {
        [1] = '"席梦思”三个字源于什么？',
        [2] = {
            [1] = '人名',
            [2] = '地名',
            [3] = '原材料名',
            [4] = '企业名',
        },
        [3] = 1,
    },
    [115] = {
        [1] = '参加第一届古代奥运会的国家有几个？',
        [2] = {
            [1] = '三个',
            [2] = '四个',
            [3] = '五个',
            [4] = '六个',
        },
        [3] = 1,
    },
    [116] = {
        [1] = '"吹箫吴市”中的“吹箫”是用来婉指：',
        [2] = {
            [1] = '乞丐',
            [2] = '你懂的',
            [3] = '杂耍',
            [4] = '卖艺',
        },
        [3] = 1,
    },
    [117] = {
        [1] = '"皇帝”作为国家元首的正式称号，始于：',
        [2] = {
            [1] = '秦始皇',
            [2] = '伏羲',
            [3] = '轩辕',
            [4] = '神农',
        },
        [3] = 1,
    },
    [118] = {
        [1] = '中央台的文艺频道是第几套节目?',
        [2] = {
            [1] = '三套',
            [2] = '四套',
            [3] = '五套',
            [4] = '七套',
        },
        [3] = 1,
    },
    [119] = {
        [1] = '甲骨文是写在哪种材质上面的？',
        [2] = {
            [1] = '龟甲',
            [2] = '牛骨',
            [3] = '猪骨',
            [4] = '牛头',
        },
        [3] = 1,
    },
    [120] = {
        [1] = '内蒙古人所说的“风季”是哪个季节？',
        [2] = {
            [1] = '春季',
            [2] = '夏季',
            [3] = '秋季',
            [4] = '冬季',
        },
        [3] = 1,
    },
    [121] = {
        [1] = '世界上最好的咖啡产于：',
        [2] = {
            [1] = '牙买加',
            [2] = '肯尼亚',
            [3] = '巴西',
            [4] = '古巴',
        },
        [3] = 1,
    },
    [122] = {
        [1] = '《孙子兵法》的作者是：',
        [2] = {
            [1] = '孙武',
            [2] = '孙膑',
            [3] = '孙中山',
            [4] = '孙悟空',
        },
        [3] = 1,
    },
    [123] = {
        [1] = '在正常情况下，除婴儿外，骨髓中哪种物质一般无造血功能？',
        [2] = {
            [1] = '黄骨髓',
            [2] = '骨髓液',
            [3] = '白骨髓',
            [4] = '骨髓质',
        },
        [3] = 1,
    },
    [124] = {
        [1] = '最早能制造工具的人类被称为：',
        [2] = {
            [1] = '能人',
            [2] = '智人',
            [3] = '才人',
            [4] = '现代人',
        },
        [3] = 1,
    },
    [125] = {
        [1] = '最早发明的缝纫机没有投入生产是因为：',
        [2] = {
            [1] = '不愿使裁缝失业',
            [2] = '生产成本太高',
            [3] = '生产耗时太长',
            [4] = '只能用人工装配',
        },
        [3] = 1,
    },
    [126] = {
        [1] = '"贝丘”是一种什么遗迹？',
        [2] = {
            [1] = '人类生活遗迹',
            [2] = '人类进化遗迹',
            [3] = '史前文明遗迹',
            [4] = '地质遗迹',
        },
        [3] = 1,
    },
    [127] = {
        [1] = '河南出土的商代文物“司母戊鼎”是用什么材料制作的？',
        [2] = {
            [1] = '青铜',
            [2] = '生铁',
            [3] = '陶瓷',
            [4] = '陶土',
        },
        [3] = 1,
    },
    [128] = {
        [1] = '“傩舞”是一种什么舞蹈？',
        [2] = {
            [1] = '祭祀舞蹈',
            [2] = '崇神舞蹈',
            [3] = '教育舞蹈',
            [4] = '炫技舞蹈',
        },
        [3] = 1,
    },
    [129] = {
        [1] = '重阳节，人们有登高、赏菊、插茱萸和喝什么酒的风俗？',
        [2] = {
            [1] = '菊花酒',
            [2] = '桂花酒',
            [3] = '梅子酒',
            [4] = '竹叶青酒',
        },
        [3] = 1,
    },
    [130] = {
        [1] = '京剧中，饰演性格活泼、开朗的青年女性的应是：',
        [2] = {
            [1] = '花旦',
            [2] = '青衣',
            [3] = '彩旦',
            [4] = '武旦',
        },
        [3] = 1,
    },
    [131] = {
        [1] = '在0摄式度时，水会：',
        [2] = {
            [1] = '热缩冷胀',
            [2] = '热胀冷缩',
            [3] = '不胀不缩',
            [4] = '边胀边缩',
        },
        [3] = 1,
    },
    [132] = {
        [1] = '世界上最早种植棉花的国家是：',
        [2] = {
            [1] = '印度',
            [2] = '古中国',
            [3] = '古埃及',
            [4] = '古罗马',
        },
        [3] = 1,
    },
    [133] = {
        [1] = '东汉时，谁既是杰出的科学家又是著名的文学家？',
        [2] = {
            [1] = '张衡',
            [2] = '司马迁',
            [3] = '司马光',
            [4] = '司马相如',
        },
        [3] = 1,
    },
    [134] = {
        [1] = '太平天国中的西王是谁?',
        [2] = {
            [1] = '萧朝贵',
            [2] = '石达开',
            [3] = '陈玉秀',
            [4] = '陈光秀',
        },
        [3] = 1,
    },
    [135] = {
        [1] = '中国最早的文言志怪小说是：',
        [2] = {
            [1] = '《搜神记》',
            [2] = '《聊斋志异》',
            [3] = '《封神演义》',
            [4] = '《山海经》',
        },
        [3] = 1,
    },
    [136] = {
        [1] = '最初“糖果”的糖取自哪里？',
        [2] = {
            [1] = '蜂蜜',
            [2] = '甘蔗',
            [3] = '苹果',
            [4] = '花蜜',
        },
        [3] = 1,
    },
    [137] = {
        [1] = '下半旗是把旗子下降到：',
        [2] = {
            [1] = '距离杆顶的1／3处',
            [2] = '距离杆顶1/2处',
            [3] = '距离杆顶1/4处',
            [4] = '距离杆顶2/3处',
        },
        [3] = 1,
    },
    [138] = {
        [1] = '人体的第一次心跳是什么时候开始的？',
        [2] = {
            [1] = '胚胎发育到第3星期',
            [2] = '胚胎发育到第4星期',
            [3] = '胚胎发育到第5星期',
            [4] = '胚胎发育到第6星期',
        },
        [3] = 1,
    },
    [139] = {
        [1] = '最早进入青铜器时代的国家是：',
        [2] = {
            [1] = '阿拉伯叙利亚',
            [2] = '商朝',
            [3] = '古印度',
            [4] = '古埃及',
        },
        [3] = 1,
    },
    [140] = {
        [1] = '“好来宝”是哪个民族的即兴诗？',
        [2] = {
            [1] = '蒙古族',
            [2] = '藏族',
            [3] = '维吾尔族',
            [4] = '回族',
        },
        [3] = 1,
    },
    [141] = {
        [1] = '在我国，卫星发射的最佳时间是：',
        [2] = {
            [1] = '19点至21点',
            [2] = '15点至17点',
            [3] = '17点至19点',
            [4] = '21点至23点',
        },
        [3] = 1,
    },
    [142] = {
        [1] = '中国无声影片的最高峰《神女》是谁的代表作？',
        [2] = {
            [1] = '阮玲玉',
            [2] = '林徽因',
            [3] = '陆小曼',
            [4] = '周璇',
        },
        [3] = 1,
    },
    [143] = {
        [1] = '《西游记》中孙悟空偷的是哪种三千年一开花，三千年一结果，再过三千年才能熟的果实？',
        [2] = {
            [1] = '人参果',
            [2] = '蟠桃',
            [3] = '朱果',
            [4] = '玉露琼浆',
        },
        [3] = 1,
    },

}


_G.ExaminationMakeUpNotice = {     ---补考提示信息
	[1] = "答题活动进行中，无法补考";
	[2] = "您背包中的元宝不足";
	[3] = "已经参加过考试，无法补考";
	[4] = "补考完成";
}

_G.ExaminationTimeColor = {        ----倒计时颜色信息
	[1] = '<font color = "#00FF00">%d</font>';     --绿色
	[2] = '<font color = "#FFFF00">%d</font>';     --黄色
	[3] = '<font color = "#FF0000">%d</font>';     --红色
}

_G.ExaminationReadyNotice = {      ----倒计时提示语言
	[1] = "活动开启时间:     秒";      --活动前
	[2] = "答题剩余时间:     秒";      --活动中
} 

_G.TextNotice = {      ----答题注意事项
	[1] = "1.在<font color='#FDF445'>3秒</font>内答对题目，获得<font color='#FDF445'>3点</font>积分<br/>2.在<font color='#FDF445'>6秒</font>内答对题目，获得<font color='#FDF445'>2点</font>积分<br/>3.在<font color='#FDF445'>10秒</font>内答对题目，获得<font color='#FDF445'>1点</font>积分<br/>4.答错或放弃将不能获得积分<br/><font color='#DD4747'>您只有一次选择的机会，做出选择后将无法更改。</font>";      --注意事项配置
	[2] = "岑夫子活动已结束<br/>活动开启时间：每晚19:00";      --活动结束配置
} 


_G.ExaminationPaiLie = {      --4个选项的排列方式
	[1] = {[1] = 1;
		   [2] = 2;
		   [3] = 3;
		   [4] = 4;};
	[2] = {[1] = 1;
		   [2] = 2;
		   [3] = 4;
		   [4] = 3;};
	[3] = {[1] = 1;
		   [2] = 3;
		   [3] = 2;
		   [4] = 4;};
	[4] = {[1] = 1;
		   [2] = 3;
		   [3] = 4;
		   [4] = 2;};
	[5] = {[1] = 1;
		   [2] = 4;
		   [3] = 2;
		   [4] = 3;};
	[6] = {[1] = 1;
		   [2] = 4;
		   [3] = 3;
		   [4] = 2;};
	[7] = {[1] = 2;
		   [2] = 1;
		   [3] = 3;
		   [4] = 4;};
	[8] = {[1] = 2;
		   [2] = 1;
		   [3] = 4;
		   [4] = 3;};
	[9] = {[1] = 2;
		   [2] = 3;
		   [3] = 1;
		   [4] = 4;};
	[10] = {[1] = 2;
		    [2] = 3;
			[3] = 4;
			[4] = 1;};
	[11] = {[1] = 2;
		    [2] = 4;
			[3] = 1;
			[4] = 3;};
	[12] = {[1] = 2;
		    [2] = 4;
			[3] = 3;
			[4] = 1;};
	[13] = {[1] = 3;
		    [2] = 1;
			[3] = 2;
			[4] = 4};
	[14] = {[1] = 3;
		    [2] = 1;
			[3] = 4;
			[4] = 2;};
	[15] = {[1] = 3;
		    [2] = 2;
			[3] = 1;
			[4] = 4};
	[16] = {[1] = 3;
		    [2] = 2;
			[3] = 4;
			[4] = 1;};
	[17] = {[1] = 3;
		    [2] = 4;
			[3] = 1;
			[4] = 2};
	[18] = {[1] = 3;
		    [2] = 4;
			[3] = 2;
			[4] = 1;};
	[19] = {[1] = 4;
		    [2] = 1;
			[3] = 2;
			[4] = 3;};
	[20] = {[1] = 4;
			[2] = 1;
			[3] = 3;
			[4] = 2;};
	[21] = {[1] = 4;
			[2] = 2;
			[3] = 1;
			[4] = 3;};
	[22] = {[1] = 4;
			[2] = 2;
			[3] = 3;
			[4] = 1;};
	[23] = {[1] = 4;
			[2] = 3;
			[3] = 1;
			[4] = 2;};
	[24] = {[1] = 4;
			[2] = 3;
			[3] = 2;
			[4] = 1;};
}