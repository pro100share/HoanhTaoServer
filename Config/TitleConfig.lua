_G.TitleGlobalConfig = {
	dwMaxShow = 1;
	dwVIPMaxShow = 1;
};

_G.TitleSwitchConfig = {
	10013,10001,10004,10014,10008,10007,10010,10005,10003,10002,10006,10011,10015,10016,10017,10018,10019,10020,10021,
	10022,10023,10024,10025,10026,10027,10028,10029,10030,10031,10032,10033,10034,10035,10036,10037,10038,10039,10040,
	10041,10042,10043,10044,10045,10046,10047,10048,10049,10050,10051,10052,10053,10054,10055,10056,10057,10058,10059,
	10060,10061,10062,10063,10064,10065,10066,10067,10068,10069,10070,10071,10072,10073,10074,10075,10076,10077,10078,
	10079,10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,
	10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109,10110,10111,10112,10113,10114,10115,10116,
	10117,10118,10119,10120,10121,10122,10123,10124,10125,10126,10127,10128,10129,10130,10131,10132,10133,10134,10135,
	10136,10137,10138,10139,10140,10141,10142,10143,10144,10145,10146,10147,10148,10149,10150,10151,10152,10153,10154,
	10155,10156,10157,10158,10159,10160,10161,10162,10163,10164,10165,10166,10167,10168,10169,10170,10171,10172,10173,
	10174,10175,10176,10177,10178,10179,10180,10181,10182,10183,10184,10185,10186,10187,10188,10189,10190,10191,10192,
	10193,10194,10195,10196,10197,10198,10199,10200,
};
-- *请不要修改已有称号编号*
_G.TitleStringConfig = {
	[1] = "<font color='#00b0f0'>称号状态：</font>",
	[2] = "<font color='#ff0000'>未获取</font>",
	[3] = "<font color='#00ff00'>已获取</font>",
	[4] = "<font color='#00b0f0'>称号显示：</font>",
	
	[6] = "称号说明：",
	[7] = "<font color='#FDF445'>%s +%d</font>",
	[8] = "<font color='#FDF445'>%s</font> <font color='#cdc6c4'>+%d</font>",
	[9] = "<font color='#6BDD65'>称号获取后方可开启显示<br>称号显示数量有上限</font><br>",--<font color='#FDF445'>开通vip</font><font color='#6BDD65'>后可增加称号显示数量上限</font>",
	
	[11] = "显示称号 %s",
	[12] = "隐藏称号 %s",
	
	[21] = "攻    击",
	[22] = "防    御",
	[23] = "身    法",
	[24] = "暴    击",
	[25] = "生命上限",
	[26] = "内力上限",
	
	[101] = "暴击抵抗",
	[102] = "移动速度",
	[103] = "攻击速度",
	[104] = "破甲伤害",
	[105] = "追加伤害",
	[106] = "伤害减免",
	[107] = "伤害反弹",
	[108] = "伤害抵御",
	[109] = "命    中",
	[110] = "闪    避",
	[111] = "暴击伤害",
	[112] = "破    甲",
	[113] = "破甲抵抗",
	[31] = "<font color='#6BDD65'>显示称号后属性加成</font>",
	[32] = "<font color='#6BDD65'>此称号无属性加成</font>",
	
	[41] = "<font color='#2ff326'>我去看看</font>",
}

--属性增加
  --dwAttack 攻击
  --dwDefense 防御
  --dwFlee 身法
  --dwCrit 暴击
  --dwHPMax 生命max
  --dwMPMax 内力max
_G.TitleContentConfig = {
    [10013] = {
		szName = "武林十尊", szImage = "zz-djb.png", dwPos = 31, bHide = false, szText = "战斗力榜排名前十位的绝顶高手可获此称号。<br>转战天下，只求一败而不可得，问世间英雄谁属，唯吾是尊。",
		tabAttribute = { --[[dwAttack = 40, dwDefense = 40 ]]},
	};--战斗力排行榜
	[10001] = {
		szName = "霸世战狂", szImage = "zz-zdlb.png", dwPos = 32, bHide = false, szText = "等级榜排名前十位的顶级高手可获此称号。<br>痴心向武，不为外物所扰，众人浑噩之时，吾已傲视于群雄。",
		tabAttribute = { --[[dwAttack = 10, dwDefense = 10]] },
	};
	[10004] = {
		szName = "万贯巨富", szImage = "zz-cfb.png", dwPos = 33, bHide = false, szText = "财富榜排名前十位的豪士富翁可获此称号。<br>古有吕氏今有吾，玉阶珠履紫金屋。千金散尽美人笑，乾坤一掷惊陶朱。",
		tabAttribute = { --[[dwAttack = 40, dwDefense = 40]] },
	};
	[10014] = {
		szName = "御风神骑", szImage = "zz-zqb.png", dwPos = 34, bHide = false, szText = "坐骑榜排名前十位的奇珍异兽之主可获此称号。<br>待吾成龙之日，当与君乘奔御风，尽览山河，若有来犯，与君共敌之！",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10008] = {
		szName = "催命十煞", szImage = "zz-lzb.png", dwPos = 35, bHide = false, szText = "连斩榜排名前十位的勇武之士可获此称号。<br>杀意沸腾于吾心，唯战可平。侠骨铮铮，忠魂灼灼，煞元结成，尔命休矣！",
		tabAttribute = { --[[dwAttack = 80, dwDefense = 80 ]]},
	};
	[10007] = {
		szName = "金身天君", szImage = "zz-jmb.png", dwPos = 36, bHide = false, szText = "经脉榜排名前十位的修身名家可获此称号。<br>修一己之身，立万世之名，金身大成之日，笑傲江湖之时。",
		tabAttribute = { --[[dwAttack = 70, dwDefense = 70]] },
	};
	[10010] = {
		szName = "十大恶人", szImage = "zz-ssb.png", dwPos = 37, bHide = false, szText = "杀手榜排名前十位的凶神煞星可获此称号。<br>以杀止杀，以血还血。知之者，谓吾心忧；不知者，谓吾何求。",
		tabAttribute = { --[[dwAttack = 10, dwDefense = 10 ]]},
	};
	[10005] = {
		szName = "威赫四海", szImage = "zz-cjb.png", dwPos = 38, bHide = false, szText = "成就榜排名前十位的望族名士可获此称号。<br>声名远播，资深德劭，总有一种人会被敬畏地称作“老江湖”。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10003] = {
		szName = "诛邪奇侠", szImage = "zz-bossb.png", dwPos = 39, bHide = false, szText = "BOSS击杀榜排名前十位的无畏豪侠可获此称号。<br>吾辈不信有不可战胜之神，只信手中兵刃，没有不可斩杀之人。",
		tabAttribute = { --[[dwHPMax = 30, dwMPMax = 30]] },
	};
	[10002] = {
		szName = "龙甲无敌", szImage = "zz-bjb.png", dwPos = 40, bHide = false, szText = "宝甲榜排名前十位的龙甲天衣之主可获此称号。<br>宝甲护体，天衣无缝，任你剑气冲云，我自岿然不动。",
		tabAttribute = { --[[dwFlee = 20, dwCrit = 20 ]]},
	};
	[10006] = {
		szName = "万剑朝宗", szImage = "zz-hbb.png", dwPos = 41, bHide = false, szText = "名剑榜排名前十位的利刃青锋之主可获此称号。<br>无坚不摧，攻无不克，吾剑一出，谁与争锋。",
		tabAttribute = { --[[dwAttack = 60, dwDefense = 60]] },
	};--接口已经改为名剑，称号名称需要变更
	[10011] = {
		szName = "神乎其技", szImage = "zz-wgb.png", dwPos = 42, bHide = false, szText = "实战榜排名前十位的百战精英可获此称号。<br>武魂未已，百战不殆，翻手为云覆手雨，朴实之中见真章。",
		tabAttribute = { --[[dwAttack = 20, dwDefense = 20]] },
	};
	[10009] = {
		szName = "第一世家", szImage = "zz-sjb.png", dwPos = 44, bHide = false, szText = "江湖排名第一世家的成员可获得此称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 90, dwDefense = 90 ]]},
	};
	[10012] = {
		szName = "混元十圣", szImage = "zz-wxb.png", dwPos = 43, bHide = false, szText = "于我，过去、现在以及未来<br>全球领先的互联网服务企业是趣游人的远景目标<br>信任、勤奋、创新、成就！<br>请专心工作。",--szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 30, dwDefense = 30 ]]},
	};--目前游戏没有真气排行榜
	
	[10015] = {
		szName = "17173称号", szImage = "Title_MeiTi_17173.png", dwPos = 45, bHide = true, szText = "17173游戏专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10016] = {
		szName = "新浪称号", szImage = "Title_MeiTi_Xinlang.png", dwPos = 46, bHide = true, szText = "新浪游戏专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10017] = {
		szName = "Cwan称号", szImage = "Title_MeiTi_Cwan.png", dwPos = 47, bHide = true, szText = "Cwan游戏专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10018] = {
		szName = "腾讯称号", szImage = "Title_MeiTi_Tengxunyouxi.png", dwPos = 48, bHide = true, szText = "腾讯游戏专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10019] = {
		szName = "多玩称号", szImage = "Title_MeiTi_Duowanyouxi.png", dwPos = 49, bHide = true, szText = "多玩游戏专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10020] = {
		szName = "07073称号", szImage = "Title_MeiTi_07073.png", dwPos = 50, bHide = true, szText = "07073游戏专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10021] = {
		szName = "265G称号", szImage = "Title_MeiTi_265G.png", dwPos = 51, bHide = true, szText = "265G游戏专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10022] = {
		szName = "页游网称号", szImage = "Title_MeiTi_Yeyou.png", dwPos = 52, bHide = true, szText = "页游网专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10023] = {
		szName = "360至尊", szImage = "Title_MeiTi_360_zhizun.png", dwPos = 53, bHide = true, szText = "360专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10024] = {
		szName = "360霸主", szImage = "Title_MeiTi_360_bazhu.png", dwPos = 54, bHide = true, szText = "360专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10025] = {
		szName = "360盟主", szImage = "Title_MeiTi_360_mengzhu.png", dwPos = 55, bHide = true, szText = "360专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10026] = {
		szName = "洪武尊者", szImage = "zz-hwzz.png", dwPos = 56, bHide = true, szText = "洪武尊者。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 50, dwHPMax = 300,dwDefense = 25, },
	};
	[10027] = {
		szName = "360凤凰奇侠", szImage = "Title_MeiTi_360_qixia.png", dwPos = 57, bHide = true, szText = "360专属称号。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10028] = {
		szName = "年少有为", szImage = "Title_MeiTi_baidu_nsyw.png", dwPos = 58, bHide = true, szText = "年少有为",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10029] = {
		szName = "阿兰家族", szImage = "Title_MeiTi_baidu_alan.png", dwPos = 59, bHide = true, szText = "阿兰家族",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10030] = {
		szName = "独一无二", szImage = "Title_MeiTi_duyiwuer.png", dwPos = 60, bHide = true, szText = "独一无二",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10031] = {
		szName = "生日礼物", szImage = "Title_MeiTi_Shengri.png", dwPos = 61, bHide = true, szText = "生日礼物",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10032] = {
		szName = "贵宾称号", szImage = "Title_MeiTi_GuiBinVIP.png", dwPos = 62, bHide = true, szText = "我顶网贵宾称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10033] = {
		szName = "VIP称号", szImage = "Title_MeiTi_VIP.png", dwPos = 63, bHide = true, szText = "我顶网VIP称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10034] = {
		szName = "凤凰校尉", szImage = "Title_MeiTi_360_xiaowei.png", dwPos = 64, bHide = true, szText = "凤凰校尉称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10035] = {
		szName = "凤凰都尉", szImage = "Title_MeiTi_360_duwei.png", dwPos = 65, bHide = true, szText = "凤凰都尉称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10036] = {
		szName = "凤凰将军", szImage = "Title_MeiTi_360_jiangjun.png", dwPos = 66, bHide = true, szText = "凤凰将军称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10037] = {
		szName = "一代宗师", szImage = "zz-idzs.png", dwPos = 67, bHide = true, szText = "一代宗师称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10038] = {
		szName = "绝世高手", szImage = "zz-jsgs.png", dwPos = 68, bHide = true, szText = "绝世高手称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10039] = {
		szName = "YY土豪", szImage = "zz-YYtuhao.png", dwPos = 69, bHide = true, szText = "YY土豪称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10040] = {
		szName = "高端大气", szImage = "zz-gdyq.png", dwPos = 70, bHide = true, szText = "高端大气上档次称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10041] = {
		szName = "低调奢华", szImage = "zz-ddsh.png", dwPos = 71, bHide = true, szText = "低调奢华有内涵称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10042] = {
		szName = "至尊王者", szImage = "zz-zzwz.png", dwPos = 72, bHide = true, szText = "至尊王者称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10043] = {
		szName = "高级会员", szImage = "zz-gjhy.png", dwPos = 73, bHide = true, szText = "高级会员称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10044] = {
		szName = "钻石会员", szImage = "zz-zshy.png", dwPos = 74, bHide = true, szText = "钻石会员称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10045] = {
		szName = "至尊会员", szImage = "zz-zzhy.png", dwPos = 75, bHide = true, szText = "至尊会员称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10046] = {
		szName = "一统江湖", szImage = "zz-ytjh.png", dwPos = 75, bHide = true, szText = "日出东方，唯我不败。一统江湖，千秋万代。",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 50, dwDefense = 50]] },
	};
	[10047] = {
		szName = "略有小成", szImage = "zz-lyxc.png", dwPos = 76, bHide = true, szText = "略有小成称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 150, dwDefense = 75, dwHPMax = 750 },
	};
	[10048] = {
		szName = "初窥门径", szImage = "zz-ckmj.png", dwPos = 77, bHide = true, szText = "初窥门径称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 375, dwDefense = 187, dwHPMax = 1875 },
	};
	[10049] = {
		szName = "融会贯通", szImage = "zz-rhgt.png", dwPos = 78, bHide = true, szText = "融会贯通称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 525, dwDefense = 262, dwHPMax = 2625 },
	};
	[10050] = {
		szName = "风尘隐侠", szImage = "zz-fcyx.png", dwPos = 79, bHide = true, szText = "风尘隐侠称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 825, dwDefense = 412, dwHPMax = 4125 },
	};
	[10051] = {
		szName = "罕有敌手", szImage = "zz-xyds.png", dwPos = 80, bHide = true, szText = "罕有敌手称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1275, dwDefense = 637, dwHPMax = 6375 },
	};
	[10052] = {
		szName = "旷世奇才", szImage = "zz-ksqc.png", dwPos = 81, bHide = true, szText = "旷世奇才称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1500, dwDefense = 750, dwHPMax = 7500 },
	};
	[10053] = {
		szName = "两肋插刀", szImage = "zz-llcd.png", dwPos = 82, bHide = true, szText = "两肋插刀称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 200, dwDefense = 100, dwHPMax = 1000 },
	};
	[10054] = {
		szName = "绝代天骄", szImage = "zz-jdsj.png", dwPos = 83, bHide = true, szText = "绝代天骄称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 250, dwHPMax = 2500 },
	};
	[10055] = {
		szName = "心领神会", szImage = "zz-slsh.png", dwPos = 84, bHide = true, szText = "心领神会称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 700, dwDefense = 350, dwHPMax = 3500 },
	};
	[10056] = {
		szName = "纵横乾坤", szImage = "zz-zhqk.png", dwPos = 85, bHide = true, szText = "纵横乾坤称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 900, dwDefense = 450, dwHPMax = 4500 },
	};
	[10057] = {
		szName = "笑傲江湖", szImage = "zz-xajh.png", dwPos = 86, bHide = true, szText = "笑傲江湖称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1100, dwDefense = 550, dwHPMax = 5500 },
	};
	[10058] = {
		szName = "睥睨天下", szImage = "zz-pntx.png", dwPos = 87, bHide = true, szText = "睥睨天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1300, dwDefense = 650, dwHPMax = 6500 },
	};
	[10059] = {
		szName = "出类拔萃", szImage = "zz-clbc.png", dwPos = 88, bHide = true, szText = "出类拔萃称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1500, dwDefense = 750, dwHPMax = 7500 },
	};
	[10060] = {
		szName = "万仞孤峰", szImage = "zz-wrgf.png", dwPos = 89, bHide = true, szText = "万仞孤峰称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1700, dwDefense = 850, dwHPMax = 8500 },
	};
	[10061] = {
		szName = "炉火纯青", szImage = "zz-lhcq.png", dwPos = 90, bHide = true, szText = "炉火纯青称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1900, dwDefense = 950, dwHPMax = 9500 },
	};
	[10062] = {
		szName = "名震寰宇", szImage = "zz-mzhy.png", dwPos = 91, bHide = true, szText = "名震寰宇称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2200, dwDefense = 1100, dwHPMax = 11000 },
	};
	[10063] = {
		szName = "名动天下", szImage = "zz-mdtx.png", dwPos = 92, bHide = true, szText = "名动天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 3000, dwDefense = 1500, dwHPMax = 15000 },
	};
	[10064] = {
		szName = "横扫天下", szImage = "zz-hstx.png", dwPos = 93, bHide = true, szText = "横扫天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 350, dwDefense = 175, dwHPMax = 1750 },
	};
	[10065] = {
		szName = "唯我独尊", szImage = "zz-wwdz.png", dwPos = 94, bHide = true, szText = "唯我独尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 875, dwDefense = 437, dwHPMax = 4375 },
	};
	[10066] = {
		szName = "武林至尊", szImage = "zz-wlzz.png", dwPos = 95, bHide = true, szText = "武林至尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1575, dwDefense = 787, dwHPMax = 7875 },
	};
	[10067] = {
		szName = "泰山北斗", szImage = "zz-tsbd.png", dwPos = 96, bHide = true, szText = "泰山北斗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2275, dwDefense = 1137, dwHPMax = 11375 },
	};
	[10068] = {
		szName = "登峰造极", szImage = "zz-dfzj.png", dwPos = 97, bHide = true, szText = "登峰造极称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2975, dwDefense = 1487, dwHPMax = 14875 },
	};
	[10069] = {
		szName = "高深莫测", szImage = "zz-gsmc.png", dwPos = 98, bHide = true, szText = "高深莫测称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 3675, dwDefense = 1837, dwHPMax = 18375 },
	};
	[10070] = {
		szName = "出神入化", szImage = "zz-csrh.png", dwPos = 99, bHide = true, szText = "出神入化称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 4375, dwDefense = 2187, dwHPMax = 21875 },
	};
	[10071] = {
		szName = "所向披靡", szImage = "zz-sqpm.png", dwPos = 100, bHide = true, szText = "所向披靡称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5075, dwDefense = 2537, dwHPMax = 25375 },
	};
	[10072] = {
		szName = "傲视群雄", szImage = "zz-ksqx.png", dwPos = 101, bHide = true, szText = "傲视群雄称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5775, dwDefense = 2887, dwHPMax = 28875 },
	};
	[10073] = {
		szName = "返璞归真", szImage = "zz-fpgz.png", dwPos = 102, bHide = true, szText = "返璞归真称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 6300, dwDefense = 3150, dwHPMax = 31500 },
	};
	[10074] = {
		szName = "天人合一", szImage = "zz-tshy.png", dwPos = 103, bHide = true, szText = "天人合一称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 7350, dwDefense = 3675, dwHPMax = 36750 },
	};
	[10075] = {
		szName = "震古铄今", szImage = "zz-zgyj.png", dwPos = 104, bHide = true, szText = "震古铄今称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 8400, dwDefense = 4200, dwHPMax = 42000 },
	};
	[10076] = {
		szName = "惊世骇俗", szImage = "zz-jshs.png", dwPos = 105, bHide = true, szText = "惊世骇俗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 9450, dwDefense = 4725, dwHPMax = 47250 },
	};
	[10077] = {
		szName = "神功盖世", szImage = "zz-sggs.png", dwPos = 106, bHide = true, szText = "神功盖世称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 10500, dwDefense = 5250, dwHPMax = 52500 },
	};
	[10078] = {
		szName = "独孤求败", szImage = "zz-dgqb.png", dwPos = 107, bHide = true, szText = "独孤求败称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 14000, dwDefense = 7000, dwHPMax = 70000 },
	};
	[10079] = {
		szName = "横扫天下", szImage = "zz-hstx.png", dwPos = 108, bHide = true, szText = "横扫天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 350, dwDefense = 175, dwHPMax = 1750 },
	};
	[10080] = {
		szName = "唯我独尊", szImage = "zz-wwdz.png", dwPos = 109, bHide = true, szText = "唯我独尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 875, dwDefense = 437, dwHPMax = 4375 },
	};
	[10081] = {
		szName = "武林至尊", szImage = "zz-wlzz.png", dwPos = 110, bHide = true, szText = "武林至尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1575, dwDefense = 787, dwHPMax = 7875 },
	};
	[10082] = {
		szName = "泰山北斗", szImage = "zz-tsbd.png", dwPos = 111, bHide = true, szText = "泰山北斗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2275, dwDefense = 1137, dwHPMax = 11375 },
	};
	[10083] = {
		szName = "登峰造极", szImage = "zz-dfzj.png", dwPos = 112, bHide = true, szText = "登峰造极称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2975, dwDefense = 1487, dwHPMax = 14875 },
	};
	[10084] = {
		szName = "高深莫测", szImage = "zz-gsmc.png", dwPos = 113, bHide = true, szText = "高深莫测称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 3675, dwDefense = 1837, dwHPMax = 18375 },
	};
	[10085] = {
		szName = "出神入化", szImage = "zz-csrh.png", dwPos = 114, bHide = true, szText = "出神入化称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 4375, dwDefense = 2187, dwHPMax = 21875 },
	};
	[10086] = {
		szName = "所向披靡", szImage = "zz-sqpm.png", dwPos = 115, bHide = true, szText = "所向披靡称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5075, dwDefense = 2537, dwHPMax = 25375 },
	};
	[10087] = {
		szName = "傲视群雄", szImage = "zz-ksqx.png", dwPos = 116, bHide = true, szText = "傲视群雄称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5775, dwDefense = 2887, dwHPMax = 28875 },
	};
	[10088] = {
		szName = "返璞归真", szImage = "zz-fpgz.png", dwPos = 117, bHide = true, szText = "返璞归真称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 6300, dwDefense = 3150, dwHPMax = 31500 },
	};
	[10089] = {
		szName = "天人合一", szImage = "zz-tshy.png", dwPos = 118, bHide = true, szText = "天人合一称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 7350, dwDefense = 3675, dwHPMax = 36750 },
	};
	[10090] = {
		szName = "震古铄今", szImage = "zz-zgyj.png", dwPos = 119, bHide = true, szText = "震古铄今称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 8400, dwDefense = 4200, dwHPMax = 42000 },
	};
	[10091] = {
		szName = "惊世骇俗", szImage = "zz-jshs.png", dwPos = 120, bHide = true, szText = "惊世骇俗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 9450, dwDefense = 4725, dwHPMax = 47250 },
	};
	[10092] = {
		szName = "神功盖世", szImage = "zz-sggs.png", dwPos = 121, bHide = true, szText = "神功盖世称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 10500, dwDefense = 5250, dwHPMax = 52500 },
	};
	[10093] = {
		szName = "独孤求败", szImage = "zz-dgqb.png", dwPos = 122, bHide = true, szText = "独孤求败称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 14000, dwDefense = 7000, dwHPMax = 70000 },
	};
	[10094] = {
		szName = "老玩家回归", szImage = "zz-lwjhg.png", dwPos = 123, bHide = true, szText = "老玩家回归称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14000, dwDefense = 7000, dwHPMax = 70000]] },
	};
	[10095] = {
		szName = "52PK", szImage = "zz-52.png", dwPos = 124, bHide = true, szText = "52PK",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14000, dwDefense = 7000, dwHPMax = 70000]] },
	};
	[10096] = {
		szName = "小萝莉", szImage = "zz-wrslxll.png", dwPos = 125, bHide = true, szText = "温柔善良小萝莉",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500  },
		tabSkillLevel = 
		{
			[51005] = 5;
		},
	};
	[10097] = {
		szName = "御姐范", szImage = "zz-mldfyjf.png", dwPos = 126, bHide = true, szText = "美丽大方御姐范",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[41005] = 5;
		},
	};
	[10098] = {
		szName = "帅小伙", szImage = "zz-flttsxh.png", dwPos = 127, bHide = true, szText = "风流倜傥帅小伙",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[21005] = 5;
		},
	};
	[10099] = {
		szName = "猛大叔", szImage = "zz-cgwmdds.png", dwPos = 128, bHide = true, szText = "粗犷威猛的大叔",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[31005] = 5;
		},
	};
	[10100] = {
		szName = "勇者传说", szImage = "zz-cszdyz.png", dwPos = 129, bHide = true, szText = "传说中的勇者",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500, dwHPMax = 5000, dwMoveSpeed = 50,  },
	};
	[10101] = {
		szName = "小萝莉", szImage = "zz-wrslxll.png", dwPos = 130, bHide = true, szText = "温柔善良小萝莉",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[51005] = 5;
		},
	};
	[10102] = {
		szName = "御姐范", szImage = "zz-mldfyjf.png", dwPos = 131, bHide = true, szText = "美丽大方御姐范",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[41005] = 5;
		},
	};
	[10103] = {
		szName = "帅小伙", szImage = "zz-flttsxh.png", dwPos = 132, bHide = true, szText = "风流倜傥帅小伙",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[21005] = 5;
		},
	};
	[10104] = {
		szName = "猛大叔", szImage = "zz-cgwmdds.png", dwPos = 133, bHide = true, szText = "粗犷威猛的大叔",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[31005] = 5;
		},
	};
	[10105] = {
		szName = "勇者传说", szImage = "zz-cszdyz.png", dwPos = 134, bHide = true, szText = "传说中的勇者",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500, dwHPMax = 5000, dwMoveSpeed = 50, },
	};
	[10106] = {
		szName = "小萝莉", szImage = "zz-wrslxll.png", dwPos = 135, bHide = true, szText = "温柔善良小萝莉",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[51005] = 5;
		},
	};
	[10107] = {
		szName = "御姐范", szImage = "zz-mldfyjf.png", dwPos = 136, bHide = true, szText = "美丽大方御姐范",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[41005] = 5;
		},
	};
	[10108] = {
		szName = "帅小伙", szImage = "zz-flttsxh.png", dwPos = 137, bHide = true, szText = "风流倜傥帅小伙",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[21005] = 5;
		},
	};
	[10109] = {
		szName = "猛大叔", szImage = "zz-cgwmdds.png", dwPos = 138, bHide = true, szText = "粗犷威猛的大叔",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500,  },
		tabSkillLevel = 
		{
			[31005] = 5;
		},
	};
	[10110] = {
		szName = "勇者传说", szImage = "zz-cszdyz.png", dwPos = 139, bHide = true, szText = "传说中的勇者",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 500, dwHPMax = 5000, dwMoveSpeed = 50,  },
	};
	[10111] = {
		szName = "第一杀手", szImage = "zz-txdyss.png", dwPos = 140, bHide = true, szText = "天下第一杀手",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 10000, dwDefense = 5000, dwCrit = 500,dwHPMax = 50000,  },
	};
	[10112] = {
		szName = "BUG般的存在", szImage = "zz-bugbdcz.png", dwPos = 141, bHide = true, szText = "BUG般的存在",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 20000, dwDefense = 10000, dwCrit = 1000,dwHPMax = 100000,  },
	};
	[10113] = {
		szName = "横扫天下", szImage = "zz-hstx.png", dwPos = 142, bHide = true, szText = "横扫天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 350, dwDefense = 175, dwHPMax = 1750 },
	};
	[10114] = {
		szName = "唯我独尊", szImage = "zz-wwdz.png", dwPos = 143, bHide = true, szText = "唯我独尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 875, dwDefense = 437, dwHPMax = 4375 },
	};
	[10115] = {
		szName = "武林至尊", szImage = "zz-wlzz.png", dwPos = 144, bHide = true, szText = "武林至尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1575, dwDefense = 787, dwHPMax = 7875 },
	};
	[10116] = {
		szName = "泰山北斗", szImage = "zz-tsbd.png", dwPos = 145, bHide = true, szText = "泰山北斗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2275, dwDefense = 1137, dwHPMax = 11375 },
	};
	[10117] = {
		szName = "登峰造极", szImage = "zz-dfzj.png", dwPos = 146, bHide = true, szText = "登峰造极称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2975, dwDefense = 1487, dwHPMax = 14875 },
	};
	[10118] = {
		szName = "高深莫测", szImage = "zz-gsmc.png", dwPos = 147, bHide = true, szText = "高深莫测称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 3675, dwDefense = 1837, dwHPMax = 18375 },
	};
	[10119] = {
		szName = "出神入化", szImage = "zz-csrh.png", dwPos = 148, bHide = true, szText = "出神入化称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 4375, dwDefense = 2187, dwHPMax = 21875 },
	};
	[10120] = {
		szName = "所向披靡", szImage = "zz-sqpm.png", dwPos = 149, bHide = true, szText = "所向披靡称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5075, dwDefense = 2537, dwHPMax = 25375 },
	};
	[10121] = {
		szName = "傲视群雄", szImage = "zz-ksqx.png", dwPos = 150, bHide = true, szText = "傲视群雄称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5775, dwDefense = 2887, dwHPMax = 28875 },
	};
	[10122] = {
		szName = "返璞归真", szImage = "zz-fpgz.png", dwPos = 151, bHide = true, szText = "返璞归真称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 6300, dwDefense = 3150, dwHPMax = 31500 },
	};
	[10123] = {
		szName = "天人合一", szImage = "zz-tshy.png", dwPos = 152, bHide = true, szText = "天人合一称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 7350, dwDefense = 3675, dwHPMax = 36750 },
	};
	[10124] = {
		szName = "震古铄今", szImage = "zz-zgyj.png", dwPos = 153, bHide = true, szText = "震古铄今称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 8400, dwDefense = 4200, dwHPMax = 42000 },
	};
	[10125] = {
		szName = "惊世骇俗", szImage = "zz-jshs.png", dwPos = 154, bHide = true, szText = "惊世骇俗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 9450, dwDefense = 4725, dwHPMax = 47250 },
	};
	[10126] = {
		szName = "神功盖世", szImage = "zz-sggs.png", dwPos = 155, bHide = true, szText = "神功盖世称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 10500, dwDefense = 5250, dwHPMax = 52500 },
	};
	[10127] = {
		szName = "独孤求败", szImage = "zz-dgqb.png", dwPos = 156, bHide = true, szText = "独孤求败称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 14000, dwDefense = 7000, dwHPMax = 70000 },
	};
	[10128] = {
		szName = "真命天子", szImage = "zz-zmtz.png", dwPos = 157, bHide = true, szText = "真命天子称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};
	[10129] = {
		szName = "霸气十足", szImage = "zz-bqsz.png", dwPos = 158, bHide = true, szText = "霸气十足称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};
	[10130] = {
		szName = "只手遮天", szImage = "zz-zszt.png", dwPos = 159, bHide = true, szText = "只手遮天称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};
	[10131] = {
		szName = "十大战神", szImage = "zz-sdzs.png", dwPos = 160, bHide = true, szText = "十大战神称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};
	[10132] = {
		szName = "名震天下", szImage = "zz-mztx.png", dwPos = 161, bHide = true, szText = "名震天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};
	[10133] = {
		szName = "万众瞩目", szImage = "zz-wzzm.png", dwPos = 162, bHide = true, szText = "万众瞩目称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};
	[10134] = {
		szName = "圣诞义士", szImage = "zz-sdys.png", dwPos = 163, bHide = true, szText = "圣诞义士称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwHPMax = 5000 },
	};
	[10135] = {
		szName = "圣诞侠客", szImage = "zz-sdxk.png", dwPos = 164, bHide = true, szText = "圣诞侠客称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwDefense = 500, dwHPMax = 5000 },
	};
	[10136] = {
		szName = "圣诞王者", szImage = "zz-sdwz.png", dwPos = 165, bHide = true, szText = "圣诞王者称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwDefense = 500, dwHPMax = 5000, dwFlee = 250, dwCrit = 250  },
	};
	[10137] = {
		szName = "圣诞至尊", szImage = "zz-sdzz.png", dwPos = 166, bHide = true, szText = "圣诞至尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwAttack = 1000, dwDefense = 500, dwHPMax = 5000, dwFlee = 250, dwCrit = 250  },
	};
	[10138] = {
		szName = "冥土青龙", szImage = "zz-qinglong.png", dwPos = 167, bHide = true, szText = "冥土青龙称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwAttack = 3000, dwFlee = 500,  dwCrit = 500  },
	};
    [10139] = {
		szName = "烈焰朱雀", szImage = "zz-zhuque.png", dwPos = 168, bHide = true, szText = "烈焰朱雀称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwAttack = 2000,  dwFlee = 300, dwCrit = 300  },
	};
	[10140] = {
		szName = "暴风白虎", szImage = "zz-baihu.png", dwPos = 169, bHide = true, szText = "暴风白虎称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwAttack = 1000, dwFlee = 200, dwCrit = 200  },
	};
	[10141] = {
		szName = "寒冰玄武", szImage = "zz-xuanwu.png", dwPos = 170, bHide = true, szText = "寒冰玄武称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwAttack = 500  },
	};
	[10142] = {
		szName = "正妹啾咪", szImage = "zz-zhengmeijiumi.png", dwPos = 171, bHide = true, szText = "正妹啾咪称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwAttack = 150, dwDefense = 80, dwHPMax = 700 },
	};
	[10143] = {
		szName = "辣妹驾到", szImage = "zz-lameijiadao.png", dwPos = 172, bHide = true, szText = "辣妹驾到称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {  dwAttack = 150, dwDefense = 80, dwHPMax = 700  },
	};	
	[10144] = {
		szName = "吉星高照", szImage = "zz-jxgz.png", dwPos = 173, bHide = true, szText = "吉星高照称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {},
	};
	[10145] = {
		szName = "马到功成", szImage = "zz-mdgc.png", dwPos = 174, bHide = true, szText = "马到功成称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {},
	};
	[10146] = {
		szName = "财色双收", szImage = "zz-csss.png", dwPos = 175, bHide = true, szText = "财色双收称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = {},
	};
	[10147] = {
		szName = "一马当先", szImage = "zz-mscg1.png", dwPos = 176, bHide = true, szText = "一马当先称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};		
	[10148] = {
		szName = "马上成功", szImage = "zz-ymdx.png", dwPos = 177, bHide = true, szText = "马上成功称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14, dwDefense = 70, dwHPMax = 70]] },
	};	
	[10149] = {
		szName = "CompGamer", szImage = "zz-TGCompGamer.png", dwPos = 178, bHide = true, szText = "CompGamer",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 100 },
	};
	[10150] = {
		szName = "Online-Station", szImage = "zz-TGOnline-Station.png", dwPos = 179, bHide = true, szText = "Online-Station",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 100 },
	};	
	--马来要的10天称号
	[10151] = {
		szName = "略有小成", szImage = "zz-lyxc.png", dwPos = 180, bHide = true, szText = "略有小成称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 150, dwDefense = 75, dwHPMax = 750 },
	};
	[10152] = {
		szName = "初窥门径", szImage = "zz-ckmj.png", dwPos = 181, bHide = true, szText = "初窥门径称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 375, dwDefense = 187, dwHPMax = 1875 },
	};
	[10153] = {
		szName = "融会贯通", szImage = "zz-rhgt.png", dwPos = 182, bHide = true, szText = "融会贯通称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 525, dwDefense = 262, dwHPMax = 2625 },
	};
	[10154] = {
		szName = "风尘隐侠", szImage = "zz-fcyx.png", dwPos = 183, bHide = true, szText = "风尘隐侠称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 825, dwDefense = 412, dwHPMax = 4125 },
	};
	[10155] = {
		szName = "罕有敌手", szImage = "zz-xyds.png", dwPos = 184, bHide = true, szText = "罕有敌手称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1275, dwDefense = 637, dwHPMax = 6375 },
	};
	[10156] = {
		szName = "旷世奇才", szImage = "zz-ksqc.png", dwPos = 185, bHide = true, szText = "旷世奇才称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1500, dwDefense = 750, dwHPMax = 7500 },
	};
	[10157] = {
		szName = "两肋插刀", szImage = "zz-llcd.png", dwPos = 186, bHide = true, szText = "两肋插刀称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 200, dwDefense = 100, dwHPMax = 1000 },
	};
	[10158] = {
		szName = "绝代天骄", szImage = "zz-jdsj.png", dwPos = 187, bHide = true, szText = "绝代天骄称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 500, dwDefense = 250, dwHPMax = 2500 },
	};
	[10159] = {
		szName = "心领神会", szImage = "zz-slsh.png", dwPos = 188, bHide = true, szText = "心领神会称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 700, dwDefense = 350, dwHPMax = 3500 },
	};
	[10160] = {
		szName = "纵横乾坤", szImage = "zz-zhqk.png", dwPos = 189, bHide = true, szText = "纵横乾坤称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 900, dwDefense = 450, dwHPMax = 4500 },
	};
	[10161] = {
		szName = "笑傲江湖", szImage = "zz-xajh.png", dwPos = 190, bHide = true, szText = "笑傲江湖称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1100, dwDefense = 550, dwHPMax = 5500 },
	};
	[10162] = {
		szName = "睥睨天下", szImage = "zz-pntx.png", dwPos = 191, bHide = true, szText = "睥睨天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1300, dwDefense = 650, dwHPMax = 6500 },
	};
	[10163] = {
		szName = "出类拔萃", szImage = "zz-clbc.png", dwPos = 192, bHide = true, szText = "出类拔萃称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1500, dwDefense = 750, dwHPMax = 7500 },
	};
	[10164] = {
		szName = "万仞孤峰", szImage = "zz-wrgf.png", dwPos = 193, bHide = true, szText = "万仞孤峰称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1700, dwDefense = 850, dwHPMax = 8500 },
	};
	[10165] = {
		szName = "炉火纯青", szImage = "zz-lhcq.png", dwPos = 194, bHide = true, szText = "炉火纯青称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1900, dwDefense = 950, dwHPMax = 9500 },
	};
	[10166] = {
		szName = "名震寰宇", szImage = "zz-mzhy.png", dwPos = 195, bHide = true, szText = "名震寰宇称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2200, dwDefense = 1100, dwHPMax = 11000 },
	};
	[10167] = {
		szName = "名动天下", szImage = "zz-mdtx.png", dwPos = 196, bHide = true, szText = "名动天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 3000, dwDefense = 1500, dwHPMax = 15000 },
	};
	[10168] = {
		szName = "横扫天下", szImage = "zz-hstx.png", dwPos = 197, bHide = true, szText = "横扫天下称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 350, dwDefense = 175, dwHPMax = 1750 },
	};
	[10169] = {
		szName = "唯我独尊", szImage = "zz-wwdz.png", dwPos = 198, bHide = true, szText = "唯我独尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 875, dwDefense = 437, dwHPMax = 4375 },
	};
	[10170] = {
		szName = "武林至尊", szImage = "zz-wlzz.png", dwPos = 199, bHide = true, szText = "武林至尊称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 1575, dwDefense = 787, dwHPMax = 7875 },
	};
	[10171] = {
		szName = "泰山北斗", szImage = "zz-tsbd.png", dwPos = 200, bHide = true, szText = "泰山北斗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2275, dwDefense = 1137, dwHPMax = 11375 },
	};
	[10172] = {
		szName = "登峰造极", szImage = "zz-dfzj.png", dwPos = 201, bHide = true, szText = "登峰造极称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 2975, dwDefense = 1487, dwHPMax = 14875 },
	};
	[10173] = {
		szName = "高深莫测", szImage = "zz-gsmc.png", dwPos = 202, bHide = true, szText = "高深莫测称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 3675, dwDefense = 1837, dwHPMax = 18375 },
	};
	[10174] = {
		szName = "出神入化", szImage = "zz-csrh.png", dwPos = 203, bHide = true, szText = "出神入化称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 4375, dwDefense = 2187, dwHPMax = 21875 },
	};
	[10175] = {
		szName = "所向披靡", szImage = "zz-sqpm.png", dwPos = 204, bHide = true, szText = "所向披靡称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5075, dwDefense = 2537, dwHPMax = 25375 },
	};
	[10176] = {
		szName = "傲视群雄", szImage = "zz-ksqx.png", dwPos = 205, bHide = true, szText = "傲视群雄称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5775, dwDefense = 2887, dwHPMax = 28875 },
	};
	[10177] = {
		szName = "返璞归真", szImage = "zz-fpgz.png", dwPos = 206, bHide = true, szText = "返璞归真称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 6300, dwDefense = 3150, dwHPMax = 31500 },
	};
	[10178] = {
		szName = "天人合一", szImage = "zz-tshy.png", dwPos = 207, bHide = true, szText = "天人合一称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 7350, dwDefense = 3675, dwHPMax = 36750 },
	};
	[10179] = {
		szName = "震古铄今", szImage = "zz-zgyj.png", dwPos = 208, bHide = true, szText = "震古铄今称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 8400, dwDefense = 4200, dwHPMax = 42000 },
	};
	[10180] = {
		szName = "惊世骇俗", szImage = "zz-jshs.png", dwPos = 209, bHide = true, szText = "惊世骇俗称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 9450, dwDefense = 4725, dwHPMax = 47250 },
	};
	[10181] = {
		szName = "神功盖世", szImage = "zz-sggs.png", dwPos = 210, bHide = true, szText = "神功盖世称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 10500, dwDefense = 5250, dwHPMax = 52500 },
	};
	[10182] = {
		szName = "独孤求败", szImage = "zz-dgqb.png", dwPos = 211, bHide = true, szText = "独孤求败称号",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 14000, dwDefense = 7000, dwHPMax = 70000 },
	};	
	[10183] = {
		szName = "标兵·银", szImage = "Title_MeiTi_LaoDongJie_yin.png", dwPos = 212, bHide = true, szText = "劳动节标兵·银",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 10500, dwDefense = 5250, dwHPMax = 52500]] },
	};
	[10184] = {
		szName = "标兵·金", szImage = "Title_MeiTi_LaoDongJie_jin.png", dwPos = 213, bHide = true, szText = "劳动节标兵·金",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { --[[dwAttack = 14000, dwDefense = 7000, dwHPMax = 70000]] },
	};	
	[10185] = {
		szName = "第一人", szImage = "Title_MeiTi_diyiren.png", dwPos = 214, bHide = true, szText = "横扫天下第一人",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 100000, dwDefense = 50000, dwHPMax = 500000,dwCrit = 50000,dwFlee = 50000},
	};
	[10186] = {
		szName = "天下无敌", szImage = "Title_MeiTi_tianxiawudi.png", dwPos = 215, bHide = true, szText = "天下无敌",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 80000, dwDefense = 40000, dwHPMax = 400000,dwCrit = 40000,dwFlee = 40000},
	};
	[10187] = {
		szName = "亘古烁今", szImage = "Title_MeiTi_gengushuojin.png", dwPos = 216, bHide = true, szText = "亘古烁今",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 70000, dwDefense = 35000, dwHPMax = 350000,dwCrit = 30000,dwFlee = 30000},
	};
	[10188] = {
		szName = "君临天下", szImage = "Title_MeiTi_junlintianxia.png", dwPos = 217, bHide = true, szText = "君临天下",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 60000, dwDefense = 30000, dwHPMax = 300000,dwCrit = 30000,dwFlee = 30000},
	};
	[10189] = {
		szName = "唯我独尊", szImage = "Title_MeiTi_weiwoduzhun.png", dwPos = 218, bHide = true, szText = "唯我独尊",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 50000, dwDefense = 25000, dwHPMax = 250000,dwCrit = 25000,dwFlee = 25000},
	};
	[10190] = {
		szName = "乾坤无极", szImage = "Title_MeiTi_qiankunwuji.png", dwPos = 219, bHide = true, szText = "乾坤无极",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 40000, dwDefense = 20000, dwHPMax = 200000,dwCrit = 20000,dwFlee = 20000},
	};
	[10191] = {
		szName = "霸者无双", szImage = "Title_MeiTi_bazhewushuang.png", dwPos = 220, bHide = true, szText = "霸者无双",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 30000, dwDefense = 20000, dwHPMax = 200000,dwCrit = 15000,dwFlee = 15000},
	};	
	[10192] = {
		szName = "气吞山河", szImage = "Title_MeiTi_qitunshanhe.png", dwPos = 221, bHide = true, szText = "气吞山河",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 25000, dwDefense = 15000, dwHPMax = 150000,dwCrit = 10000,dwFlee = 10000},
	};
	[10193] = {
		szName = "先发制人", szImage = "zz-xfzr.png", dwPos = 222, bHide = true, szText = "先发制人",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5000, dwCrit = 1600},
	};
	[10194] = {
		szName = "禁打大人", szImage = "zz-jddr.png", dwPos = 223, bHide = true, szText = "禁打大人",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwDefense = 5000,dwFlee = 2500},
	};
	[10195] = {
		szName = "长岁大人", szImage = "zz-csdr.png", dwPos = 224, bHide = true, szText = "长岁大人",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwHPMax = 15000,dwMPMax = 8000},
	};
	[10196] = {
		szName = "横扫道王", szImage = "zz-hsdw.png", dwPos = 225, bHide = true, szText = "横扫道王",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 5000, dwDefense = 5000, dwCrit = 1600,dwFlee = 2500},
	};	
	[10197] = {
		szName = "横扫道皇", szImage = "zz-hsdh.png", dwPos = 226, bHide = true, szText = "横扫道皇",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 6000, dwDefense = 6000, dwHPMax = 21000, dwMPMax = 10000,dwCrit = 3000,dwFlee = 3000},
	};
	[10198] = {
		szName = "通天塔擂主", szImage = "Title_MeiTi_TongTianLeiZhu.png", dwPos = 227, bHide = true, szText = "通天塔擂主",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 35000, dwDefense = 15000, dwHPMax = 55000, dwCrit = 5500},
	};	
	[10199] = {
		szName = "绝顶至尊", szImage = "Title_MeiTi_ZhiZun.png", dwPos = 227, bHide = true, szText = "绝顶至尊",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 10000, dwDefense = 8000, dwHPMax = 28000, dwMPMax = 13000,dwFlee = 4000 , dwCrit = 4000},
	};		
	[10200] = {
		szName = "地府使者", szImage = "zz_dfsz.png", dwPos = 227, bHide = true, szText = "地府使者",szNotice = "恭喜玩家<font color='#FF6100'>%s</font>获得<font color='#A020F0'>%s</font>的称号。",
		tabAttribute = { dwAttack = 17000, dwDefense = 3000, dwHPMax = 15000, dwMPMax = 10000,dwFlee = 8000 , dwCrit = 8000},
	};		
};