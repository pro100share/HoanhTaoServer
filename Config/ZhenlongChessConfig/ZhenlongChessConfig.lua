--新珍珑棋局配置文件

--珍珑棋局配置
_G.ZhenlongChessConfig = 
{
	--每天最大挑战次数
	maxCount = 10;
	--次数刷新时间
	resetTime = "00:00";
	--刷怪延时 (秒)
	monsterDelay = 3;
};

--珍珑棋局boss列表
_G.ZhenlongChessBossList = 
{
--[[brief:  bossId 奖励
			szFile 正常 
			grayFile 变灰 
			maxCount 每天最大挑战次数
			goldMaxCount 元宝可以增加的最大次数
			costGold 增加一次消耗的元宝
			awardId 对应奖励ID  
			starId 对应评星条件ID
			bullyAwardId  扫荡]]
	[1] = {
		bossId = 50302001,
		szFile = "img://boss-pinglangzhong.png", 
		grayFile = "img://ZLBoss.png", 
		Name = "平一指",
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 1, 
		starId = 1,
		bullyAwardId = 0, 
		describe = "",
		},
	[2] = {
		bossId = 50302002, 
		szFile = "img://boss-wdjwz.png", 
		grayFile = "img://ZLBoss.png", 
		Name = "七藜", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 2, 
		starId = 2,
		bullyAwardId = 0, 
		describe = "",
		},
	[3] = {
		bossId = 50302003, 
		szFile = "img://boss-xinliangmenger.png", 
		grayFile = "img://ZLBoss.png", 
		Name = "梁梦儿", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 3, 
		starId = 3,
		bullyAwardId = 0,
		describe = "",
		},
	[4] = {
		bossId = 50302004, 
		szFile = "img://boss-hd.png", 
		grayFile = "img://ZLBoss.png", 
		Name = "石渊", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 4, 
		starId = 4,
		bullyAwardId = 0,
		describe = "",
		},
	[5] = {
		bossId = 50302005,
		szFile = "img://boss-xinty.png", 
		grayFile = "img://ZLBoss.png", 
		Name = "苏清岚", 
		maxCount = 1,
		goldMaxCount = 0, 
		awardId = 5,
		starId = 5,
		bullyAwardId = 0,
		describe = "",
		},
	[6] = {
		bossId = 50302006,
		szFile = "img://boss-mcws.png",
		grayFile = "img://ZLBoss.png",
		Name = "尤晃晃", 
		maxCount = 1,
		goldMaxCount = 0, 
		awardId = 6,
		starId = 6,
		bullyAwardId = 0,
		describe = "",
		},
	[7] = {
		bossId = 50302007,
		szFile = "img://boss-xxz.png", 
		grayFile = "img://ZLBoss.png",
		Name = "沙通天", 
		maxCount = 1, 
		goldMaxCount = 0,
		awardId = 7, 
		starId = 7,
		bullyAwardId = 0,
		describe = "",
		},
	[8] = {
		bossId = 50302008, 
		szFile = "img://boss-yangfeng.png", 
		grayFile = "img://ZLBoss.png", 
		Name = "侯通海", 
		maxCount = 1, 
		goldMaxCount = 0,
		awardId = 8, 
		starId = 8,
		bullyAwardId = 0,
		describe = "",
		},
	[9] = {
		bossId = 50302009,
		szFile = "img://boss-lgy.png",
		grayFile = "img://ZLBoss.png", 
		Name = "陆冠英",
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 9,
		starId = 9,
		bullyAwardId = 0,
		describe = "",
		},
	[10] = {
		bossId = 50302010,
		szFile = "img://boss-menggu002.png",
		grayFile = "img://ZLBoss.png", 
		Name = "巴特尔", 
		maxCount = 1, 
		goldMaxCount = 0,
		awardId = 10,
		starId = 10, 
		bullyAwardId = 0,
		describe = "",
		},
	[11] = {
		bossId = 50302011, 
		szFile = "img://boss-nanxiaoyun.png", 
		grayFile = "img://ZLBoss.png",
		Name = "洛观云", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 11, 
		starId = 11,
		bullyAwardId = 0,
		describe = "",
		},
	[12] = {
		bossId = 50302012, 
		szFile = "img://boss-guangpingchanshi.png",
		grayFile = "img://ZLBoss.png",
		Name = "广平禅师", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 12,
		starId = 12, 
		bullyAwardId = 0,
		describe = "",
		},
	[13] = {
		bossId = 50302013, 
		szFile = "img://boss-dailisi.png", 
		grayFile = "img://ZLBoss.png",
		Name = "黛绮丝", 
		maxCount = 1,
		goldMaxCount = 0, 
		awardId = 13,
		starId = 13,
		bullyAwardId = 0,
		describe = "",
		},
	[14] = {
		bossId = 50302014, 
		szFile = "img://fenhuang_1.png",
		grayFile = "img://ZLBoss.png", 
		Name = "阿鸾",
		maxCount = 1,
		goldMaxCount = 0, 
		awardId = 14, 
		starId = 14,
		bullyAwardId = 0,
		describe = "",
		},
	[15] = {
		bossId = 50302015, 
		szFile = "img://boss-bosimingjiaojiaotu.png",
		grayFile = "img://ZLBoss.png", 
		Name = "哲里勒", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 15, 
		starId = 15,
		bullyAwardId = 0,
		describe = "",
		},
	[16] = {
		bossId = 50302016, 
		szFile = "img://boss-menggu001.png",
		grayFile = "img://ZLBoss.png",
		Name = "巴赫拉姆", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 16, 
		starId = 16,
		bullyAwardId = 0,
		describe = "",
		},
	[17] = {
		bossId = 50302017, 
		szFile = "img://boss-jjgs.png",
		grayFile = "img://ZLBoss.png", 
		Name = "何居奇", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 17, 
		starId = 17,
		bullyAwardId = 0,
		describe = "",
		},
	[18] = {
		bossId = 50302018, 
		szFile = "img://boss-dailisi.png", 
		grayFile = "img://ZLBoss.png",
		Name = "王嫣然", 
		maxCount = 1, 
		goldMaxCount = 0, 
		awardId = 18, 
		starId = 18,
		bullyAwardId = 0,
		describe = "",
		},
};
--珍珑棋局boss奖励表
_G.ZhenlongChessAwardList = 
{
	-- itemTbl  物品id 
	-- PassMoney	 钱 
	-- Gold	  礼金
	-- Zhenqi		真气
	-- Exp			经验
	[1] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			},
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 36400,
		},
	[2] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
				
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 41600,
		},
	[3] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 53325,
		},
	[4] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 18960,
		},
	[5] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 23296,
		},
	[6] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 23296,
		},
	[7] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 26873,
		},
	[8] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 26873,
		},
	[9] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 32443,
		},
	[10] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 100, 
			Exp = 32443,
		},
	[11] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 36806,
		},
	[12] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 36806,
		},
	[13] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 43904,
		},
	[14] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 43904,
		},
	[15] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[5500450] = 1,
				[4901000] = 1,
				[5500561] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 49907,
		},
	[16] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[4901000] = 1,
				[2500341] = 1,
				[2500342] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 49907,
		},
	[17] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[4901000] = 1,
				[2500341] = 1,
				[2500342] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 68022,
		},
	[18] = {
			itemTbl = 
			{
				[5500390] = 1,
				[5500400] = 1,
				[4901000] = 1,
				[2500341] = 1,
				[2500342] = 1,
			}, 
			PassMoney = 5000,
			Gold = 0, 
			Zhenqi = 200, 
			Exp = 68022,
		},
};

--珍珑棋局boss评星条件、星级
_G.ZhenlongChessStarList = 
{
	-- losttime  计时	[秒] = 星级
	[1] = {
			losttime = 
			{
				[9] = 5,
				[13] = 3,
				[16] = 1,
			},
		},
	[2] = {
			losttime = 
			{
				[10] = 5,
				[15] = 3,
				[18] = 1,
			},
		},
	[3] = {
			losttime = 
			{
				[11] = 5,
				[17] = 3,
				[20] = 1,
			},
		},
	[4] = {
			losttime = 
			{
				[12] = 5,
				[19] = 3,
				[22] = 1,
			},        
		},            
	[5] = {           
			losttime = 
			{         
				[13] = 5,
				[22] = 3,
				[25] = 1,
			},        
		},            
	[6] = {           
			losttime = 
			{         
				[7] = 5,
				[10] = 3,
				[13] = 1,
			},
		},
	[7] = {
			losttime = 
			{
				[13] = 5,
				[17] = 3,
				[20] = 1,
			},        
		},            
	[8] = {           
			losttime = 
			{         
				[13] = 5,
				[18] = 3,
				[21] = 1,
			},        
		},            
	[9] = {           
			losttime = 
			{         
				[15] = 5,
				[20] = 3,
				[23] = 1,
			},
		},
	[10] = {
			losttime = 
			{
				[15] = 5,
				[21] = 3,
				[24] = 1,
			},        
		},            
	[11] = {          
			losttime = 
			{         
				[18] = 5,
				[26] = 3,
				[29] = 1,
			},        
		},            
	[12] = {          
			losttime = 
			{         
				[14] = 5,
				[19] = 3,
				[22] = 1,
			},
		},
	[13] = {
			losttime = 
			{
				[15] = 5,
				[20] = 3,
				[23] = 1,
			},        
		},            
	[14] = {          
			losttime = 
			{         
				[15] = 5,
				[21] = 3,
				[24] = 1,
			},        
		},            
	[15] = {          
			losttime = 
			{         
				[16] = 5,
				[22] = 3,
				[25] = 1,
			},
		},
	[16] = {
			losttime = 
			{
				[16] = 5,
				[23] = 3,
				[26] = 1,
			},        
		},            
	[17] = {          
			losttime = 
			{         
				[17] = 5,
				[25] = 3,
				[28] = 1,
			},        
		},            
	[18] = {          
			losttime = 
			{         
				[16] = 5,
				[22] = 3,
				[25] = 1,
			},
		},
};

--珍珑棋局 特殊奖励配置
_G.ZhenlongChessTxt = 
{
	Explain="    棋痴老先生穷尽一生精力所创，棋局之内变幻莫测，身处其中如入幻境，稍不留神便会走火入魔；而能成功破局者皆成一代大侠，受万众景仰。";	-- 背景文字描述
	--挑战按钮
	Duelbtn = "挑战";

	--错误信息
	Error = "挑战次数已经上限";

	--错误信息
	Error2 = "当前累积评星不足，无法领取";

	--错误信息
	Error3 = "该boss未开启，无法挑战";
	
	--错误信息
	Error4 = "当前状态不可退出副本";

	--配置颜色
	IsWhite	= "<font color='#FFFFFF'>%s</font>";	--白色
	IsRed	= "<font color='#FF0000'>%s</font>";	--红色

	--珍珑棋局进入副本
	PingxinglabelText = "<font color='#FFFFFF'>    获得最高星的玩家(%d星)</font>";
	ChakanlabelText = "<font color='#FFFFFF'>     点击头像查看玩家信息</font>";

	--多少分钟击杀boss
	StarText = "<font color='#FFFFFF'>【</font><font color='#FF0000'> %d </font><font color='#FFFFFF'>秒之内击杀 BOSS 】</font>";

	RewardIcon = {
		[1] = {
			szIcon = "img://Qita_money.png";--钱的图标
			szDes = "金钱:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[2] = {
			szIcon = "img://Qita_exp.png";--经验的图标
			szDes = "经验:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[3] = {
			szIcon = "img://Qita_zhenqi.png";--真气的图标
			szDes = "真气:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
		[4] = {
			szIcon = "img://Qita_lijin.png";--元宝的图标
			szDes = "礼金:%d";
			szMyriad = "%s万";
			szNormal = "%s";
		};
	};
	--第几局
	Bureau = 
	{
		[1] = {round = "珍珑棋局   第一局"},
		[2] = {round = "珍珑棋局   第二局"},
		[3] = {round = "珍珑棋局   第三局"},
	};
};

--珍珑棋局 组合配置
_G.ZhenlongChessGroup = 
{
	--[局索引] = {index, index, index, ...}
	[1] = {1,2,3,4,5,6},
	[2] = {7,8,9,10,11,12},
	[3] = {13,14,15,16,17,18},
};

--珍珑棋局星级对应奖励
_G.ZhenlongChessStarAward = 
{	--星级 =  奖励
	[5] = {
		itemTbl = 
			{
				[5500070] = 1,	--绣包
				[2500040] = 3,	--益元丹
				[5940002] = 1,	--真气丹（500）
				[9405010] = 2,	--神龙果
			},
		StarLevel = "5星可领取"
		},
	[10] = {
		itemTbl = 
			{
				[5500070] = 2,	--绣包
				[4100210] = 5,	--精铁锭
				[9405010] = 5,	--神龙果
				[5940002] = 2,	--真气丹（500）
				[4100448] = 3,	--蜂蜡
				[5500310] = 2,	--充盈的钱袋
			},
		StarLevel = "10星可领取"
		},
	[20] = {
		itemTbl = 
			{
				[5500070] = 5,	--绣包
				[4100210] = 5,	--精铁锭
				[4100140] = 5,	--强化石
				[9405011] = 1,	--龙池甘露
				[4100080] = 3,	--亮银砂
				[4100446] = 3,	--檀木托
			},
		StarLevel = "20星可领取"
		},
	[40] = {
		itemTbl = 
			{
				[5500070] = 10,	--绣包
				[2500051] = 1,	--武尊通鉴
				[4100080] = 5,	--亮银砂
				[4100421] = 1,	--一品金鳞甲片
				[4100210] = 10,	--精铁锭
				[5600030] = 2,	--稀有藏宝图
			},
		StarLevel = "40星可领取"
		},
	[60] = {
		itemTbl = 
			{
				[9405011] = 5,	--龙池甘露
				[5500071] = 5,	--珍珑绣包
				[4100110] = 10,	--剑魂石
				[4100420] = 5,	--紫钧元
				[2500331] = 5,	--斩魄精元丹
				[9405052] = 3,	--坐骑转生丹
			},
		StarLevel = "60星可领取"
		},
	[90] = {
		itemTbl = 
			{
				[4100420] = 10,	--紫钧元
				[5501190] = 5,	--无相元珠
				[4100430] = 10,	--檀心丹
				[5809368] = 10,	--星轨
				[4100423] = 5,	--三品金鳞甲片
				[9405052] = 10,	--坐骑转生丹
			},
		StarLevel = "90星可领取"
		},
};

--刷怪函数
function ZhenlongChessBossList:RefreshMonster(objPlayer, monsterId)
	local sysMap = objPlayer:GetSystem("CMapSystem");	----地图系统
	local sysScript = objPlayer:GetSystem("CScriptSystem");	----脚本系统
	local Map = sysMap:GetCurMap();		----获取玩家所在地图
	local mgrMonster = Map:GetMonsterMgr();		----获得怪物管理器
	local dwDelay = (_G.ZhenlongChessConfig.monsterDelay + 1) * 1000;		----延时
	local monster = {
		[1] = {monid = 50302001 , fightid = 50302001 , aiId = 50302001 , dropid = 50302001 , lookid = 100110010},
		[2] = {monid = 50302002 , fightid = 50302002 , aiId = 50302001 , dropid = 50302002 , lookid = 100620060},
		[3] = {monid = 50302003 , fightid = 50302003 , aiId = 50302001 , dropid = 50302003 , lookid = 100110110},
		[4] = {monid = 50302004 , fightid = 50302004 , aiId = 50302001 , dropid = 50302004 , lookid = 100920061},
		[5] = {monid = 50302005 , fightid = 50302005 , aiId = 50302001 , dropid = 50302005 , lookid = 101120070},
		[6] = {monid = 50302006 , fightid = 50302006 , aiId = 50302001 , dropid = 50302006 , lookid = 503020140},
		[7] = {monid = 50302007 , fightid = 50302007 , aiId = 50302001 , dropid = 50302007 , lookid = 503020130},
		[8] = {monid = 50302008 , fightid = 50302008 , aiId = 50302001 , dropid = 50302008 , lookid = 100210050},
		[9] = {monid = 50302009 , fightid = 50302009 , aiId = 50302001 , dropid = 50302009 , lookid = 100210010},
		[10] = {monid = 50302010 , fightid = 50302010 , aiId = 50302001 , dropid = 50302010 , lookid = 100920020},
		[11] = {monid = 50302011 , fightid = 50302011 , aiId = 50302001 , dropid = 50302011 , lookid = 100210040},
		[12] = {monid = 50302012 , fightid = 50302012 , aiId = 50302001 , dropid = 50302012 , lookid = 100210130},
		[13] = {monid = 50302013 , fightid = 50302013 , aiId = 50302001 , dropid = 50302013 , lookid = 100710060},
		[14] = {monid = 50302014 , fightid = 50302014 , aiId = 50302001 , dropid = 50302014 , lookid = 12810},
		[15] = {monid = 50302015 , fightid = 50302015 , aiId = 50302001 , dropid = 50302015 , lookid = 100710100},
		[16] = {monid = 50302016 , fightid = 50302016 , aiId = 50302001 , dropid = 50302016 , lookid = 100320050},
		[17] = {monid = 50302017 , fightid = 50302017 , aiId = 50302001 , dropid = 50302017 , lookid = 100120050},
		[18] = {monid = 50302018 , fightid = 50302018 , aiId = 50302001 , dropid = 50302018 , lookid = 100710060},
		[19] = {monid = 50302019 , fightid = 50302019 , aiId = 50302001 , dropid = 50302019 , lookid = 100210040},
		[20] = {monid = 50302020 , fightid = 50302020 , aiId = 50302001 , dropid = 50302020 , lookid = 100620020},
		[21] = {monid = 50302021 , fightid = 50302021 , aiId = 50302001 , dropid = 50302021 , lookid = 100410171},
		[22] = {monid = 50302022 , fightid = 50302022 , aiId = 50302001 , dropid = 50302022 , lookid = 100720020},
		[23] = {monid = 50302023 , fightid = 50302023 , aiId = 50302001 , dropid = 50302023 , lookid = 100320040},
		[24] = {monid = 50302024 , fightid = 50302024 , aiId = 50302001 , dropid = 50302024 , lookid = 100320040},
		[25] = {monid = 50302025 , fightid = 50302025 , aiId = 50302001 , dropid = 50302025 , lookid = 100320050},
		[26] = {monid = 50302026 , fightid = 50302026 , aiId = 50302001 , dropid = 50302026 , lookid = 100620020},
		[27] = {monid = 50302027 , fightid = 50302027 , aiId = 50302001 , dropid = 50302027 , lookid = 100720020},
		[28] = {monid = 50302028 , fightid = 50302028 , aiId = 50302001 , dropid = 50302028 , lookid = 507200080},
		[29] = {monid = 50302029 , fightid = 50302029 , aiId = 50302001 , dropid = 50302029 , lookid = 100320060},
		[30] = {monid = 50302030 , fightid = 50302030 , aiId = 50302001 , dropid = 50302030 , lookid = 507200080},
		[31] = {monid = 50302031 , fightid = 50302031 , aiId = 50302001 , dropid = 50302031 , lookid = 100320050},
		[32] = {monid = 50302032 , fightid = 50302032 , aiId = 50302001 , dropid = 50302032 , lookid = 100920020},
		[33] = {monid = 50302033 , fightid = 50302033 , aiId = 50302001 , dropid = 50302033 , lookid = 100120050},
		[34] = {monid = 50302034 , fightid = 50302034 , aiId = 50302001 , dropid = 50302034 , lookid = 100410030},
		[35] = {monid = 50302035 , fightid = 50302035 , aiId = 50302001 , dropid = 50302035 , lookid = 100410040},
		[36] = {monid = 50302036 , fightid = 50302036 , aiId = 50302001 , dropid = 50302036 , lookid = 503020070},
		[37] = {monid = 50302037 , fightid = 50302037 , aiId = 50302001 , dropid = 50302037 , lookid = 100510010},
		[38] = {monid = 50302038 , fightid = 50302038 , aiId = 50302001 , dropid = 50302038 , lookid = 100920070},
		[39] = {monid = 50302039 , fightid = 50302039 , aiId = 50302001 , dropid = 50302039 , lookid = 100510031},
		[40] = {monid = 50302040 , fightid = 50302040 , aiId = 50302001 , dropid = 50302040 , lookid = 100920050},
		[41] = {monid = 50302041 , fightid = 50302041 , aiId = 50302001 , dropid = 50302041 , lookid = 100510060},
		[42] = {monid = 50302042 , fightid = 50302042 , aiId = 50302001 , dropid = 50302042 , lookid = 101220010},
		[43] = {monid = 50302043 , fightid = 50302043 , aiId = 50302001 , dropid = 50302043 , lookid = 100520060},
		[44] = {monid = 50302044 , fightid = 50302044 , aiId = 50302001 , dropid = 50302044 , lookid = 100510060},
		[45] = {monid = 50302045 , fightid = 50302045 , aiId = 50302001 , dropid = 50302045 , lookid = 100610010},
		[46] = {monid = 50302046 , fightid = 50302046 , aiId = 50302001 , dropid = 50302046 , lookid = 100210130},
		[47] = {monid = 50302047 , fightid = 50302047 , aiId = 50302001 , dropid = 50302047 , lookid = 100210130},
		[48] = {monid = 50302048 , fightid = 50302048 , aiId = 50302001 , dropid = 50302048 , lookid = 100210130},
		[49] = {monid = 50302049 , fightid = 50302049 , aiId = 50302001 , dropid = 50302049 , lookid = 100210110},
		[50] = {monid = 50302050 , fightid = 50302050 , aiId = 50302001 , dropid = 50302050 , lookid = 503020070},
		[51] = {monid = 50302051 , fightid = 50302051 , aiId = 50302001 , dropid = 50302051 , lookid = 100610020},
		[52] = {monid = 50302052 , fightid = 50302052 , aiId = 50302001 , dropid = 50302052 , lookid = 100720030},
		[53] = {monid = 50302053 , fightid = 50302053 , aiId = 50302001 , dropid = 50302053 , lookid = 100710070},
		[54] = {monid = 50302054 , fightid = 50302054 , aiId = 50302001 , dropid = 50302054 , lookid = 101120061},
		[55] = {monid = 50302055 , fightid = 50302055 , aiId = 50302001 , dropid = 50302055 , lookid = 100610020},
		[56] = {monid = 50302056 , fightid = 50302056 , aiId = 50302001 , dropid = 50302056 , lookid = 100210010},
		[57] = {monid = 50302057 , fightid = 50302057 , aiId = 50302001 , dropid = 50302057 , lookid = 100820030},
		[58] = {monid = 50302058 , fightid = 50302058 , aiId = 50302001 , dropid = 50302058 , lookid = 100920090},
		[59] = {monid = 50302059 , fightid = 50302059 , aiId = 50302001 , dropid = 50302059 , lookid = 100710060},
		[60] = {monid = 50302060 , fightid = 50302060 , aiId = 50302001 , dropid = 50302060 , lookid = 100710100},
		[61] = {monid = 50302061 , fightid = 50302061 , aiId = 50302001 , dropid = 50302061 , lookid = 101010020},
		[62] = {monid = 50302062 , fightid = 50302062 , aiId = 50302001 , dropid = 50302062 , lookid = 100810030},
		[63] = {monid = 50302063 , fightid = 50302063 , aiId = 50302001 , dropid = 50302063 , lookid = 100820050},
		[64] = {monid = 50302064 , fightid = 50302064 , aiId = 50302001 , dropid = 50302064 , lookid = 100110120},
		[65] = {monid = 50302065 , fightid = 50302065 , aiId = 50302001 , dropid = 50302065 , lookid = 100710110},
		[66] = {monid = 50302066 , fightid = 50302066 , aiId = 50302001 , dropid = 50302066 , lookid = 100820060},
		[67] = {monid = 50302067 , fightid = 50302067 , aiId = 50302001 , dropid = 50302067 , lookid = 100920111},
		[68] = {monid = 50302068 , fightid = 50302068 , aiId = 50302001 , dropid = 50302068 , lookid = 100920061},
		[69] = {monid = 50302069 , fightid = 50302069 , aiId = 50302001 , dropid = 50302069 , lookid = 100920010},
		[70] = {monid = 50302070 , fightid = 50302070 , aiId = 50302001 , dropid = 50302070 , lookid = 100820080},
		[71] = {monid = 50302071 , fightid = 50302071 , aiId = 50302001 , dropid = 50302071 , lookid = 100920061},
		[72] = {monid = 50302072 , fightid = 50302072 , aiId = 50302001 , dropid = 50302072 , lookid = 100920070},
		[73] = {monid = 50302073 , fightid = 50302073 , aiId = 50302001 , dropid = 50302073 , lookid = 100410170},
		[74] = {monid = 50302074 , fightid = 50302074 , aiId = 50302001 , dropid = 50302074 , lookid = 100920010},
		[75] = {monid = 50302075 , fightid = 50302075 , aiId = 50302001 , dropid = 50302075 , lookid = 100410171},
		[76] = {monid = 50302076 , fightid = 50302076 , aiId = 50302001 , dropid = 50302076 , lookid = 100920110},
		[77] = {monid = 50302077 , fightid = 50302077 , aiId = 50302001 , dropid = 50302077 , lookid = 100210240},
		[78] = {monid = 50302078 , fightid = 50302078 , aiId = 50302001 , dropid = 50302078 , lookid = 101020150},
		[79] = {monid = 50302079 , fightid = 50302079 , aiId = 50302001 , dropid = 50302079 , lookid = 100920080},
		[80] = {monid = 50302080 , fightid = 50302080 , aiId = 50302001 , dropid = 50302080 , lookid = 101120110},
		[81] = {monid = 50302081 , fightid = 50302081 , aiId = 50302001 , dropid = 50302081 , lookid = 500120010},
		[82] = {monid = 50302082 , fightid = 50302082 , aiId = 50302001 , dropid = 50302082 , lookid = 101020150},
		[83] = {monid = 50302083 , fightid = 50302083 , aiId = 50302001 , dropid = 50302083 , lookid = 100210130},
		[84] = {monid = 50302084 , fightid = 50302084 , aiId = 50302001 , dropid = 50302084 , lookid = 100920080},
		[85] = {monid = 50302085 , fightid = 50302085 , aiId = 50302001 , dropid = 50302085 , lookid = 100110120},
		[86] = {monid = 50302086 , fightid = 50302086 , aiId = 50302001 , dropid = 50302086 , lookid = 101020180},
		[87] = {monid = 50302087 , fightid = 50302087 , aiId = 50302001 , dropid = 50302087 , lookid = 101020090},
		[88] = {monid = 50302088 , fightid = 50302088 , aiId = 50302001 , dropid = 50302088 , lookid = 101120120},
		[89] = {monid = 50302089 , fightid = 50302089 , aiId = 50302001 , dropid = 50302089 , lookid = 101220050},
		[90] = {monid = 50302090 , fightid = 50302090 , aiId = 50302001 , dropid = 50302090 , lookid = 101120170},
		[91] = {monid = 50302091 , fightid = 50302091 , aiId = 50302001 , dropid = 50302091 , lookid = 100210080},
		[92] = {monid = 50302092 , fightid = 50302092 , aiId = 50302001 , dropid = 50302092 , lookid = 101220060},
		[93] = {monid = 50302093 , fightid = 50302093 , aiId = 50302001 , dropid = 50302093 , lookid = 100120041},
		[94] = {monid = 50302094 , fightid = 50302094 , aiId = 50302001 , dropid = 50302094 , lookid = 100920090},
		[95] = {monid = 50302095 , fightid = 50302095 , aiId = 50302001 , dropid = 50302095 , lookid = 101120070},
		[96] = {monid = 50302096 , fightid = 50302096 , aiId = 50302001 , dropid = 50302096 , lookid = 101220060},
		[97] = {monid = 50302097 , fightid = 50302097 , aiId = 50302001 , dropid = 50302097 , lookid = 100610010},
		[98] = {monid = 50302098 , fightid = 50302098 , aiId = 50302001 , dropid = 50302098 , lookid = 100920111},
		[99] = {monid = 50302099 , fightid = 50302099 , aiId = 50302001 , dropid = 50302099 , lookid = 100210240},
		[100] = {monid = 50302100 , fightid = 50302100 , aiId = 50302001 , dropid = 50302100 , lookid = 100920110},
	}
	for i = 1 , #monster do
		if monsterId == monster[i].monid then
			local D1 = function()
				local NAID = {5005001,5005002,5005003}
				local rand = math.random(#NAID)
				sysScript:Story(NAID[rand])
			end
			CTimer:AddTimer( 3000, false, D1, {} )
			mgrMonster:DelayAdd(monster[i].monid, monster[i].fightid, monster[i].aiId, monster[i].dropid, monster[i].lookid, -22, -22, dwObjId, dwDelay);
		end
	end
end


--评星函数
function ZhenlongChessBossList:CalcStarLevel(bossId, useTime, killCount, remainCount, fightSource, HP, dwHurt, ZhenlongChessSys)
	local TimeLv = {};
	local Base = 0;
	local bossList = _G.ZhenlongChessBossList;
	local StarList = _G.ZhenlongChessStarList;
	for i = 1 , #bossList do
		if bossId == bossList[i].bossId then
			local id = bossList[i].starId
			local TimeValue = StarList[id].losttime
			for j , _ in pairs(TimeValue) do
				if (useTime <= j * 1000) then
					table.insert(TimeLv,TimeValue[j])
				end
			end
			
			for k = 1 , #TimeLv do
				if Base < TimeLv[k] then
					Base = TimeLv[k]
				end
			end
			
			if ZhenlongChessSys:GetBossStarLevel(bossId) < Base then
				ZhenlongChessSys:SetBossStarLevel(bossId, Base)
			end
		end
	end
end

