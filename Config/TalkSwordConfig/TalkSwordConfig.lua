--[[
	[ \brief 华山论剑 配置文件
	[ \author 路广华，沈祺
	[ \date 2014-5-10
--]]

-- 定义全局配置变量
_G.TalkSwordConfig = {};

-- 文字说明
TalkSwordConfig.Text = {
		ServersBusy = "服务器繁忙，请大侠重新来过！";
		MyRank = "%d";
		HonorValue = "%d";
		UseCounts = "%d/%d";
		CoolingTime = "%s";
		CDTime = "<font color='#FF0000'>%s</font>";
		AttackValue = "%d + %d%%";
		AttackValueTemp = "%d";
		Day = "%d天";
		Hour = "%d时";
		Min = "%d分";
		Sec = "%d秒";
		ReduceTimeFail = "消除冷却时间失败";
		
		AddCountsTip = "消耗%d元宝可增加一次挑战次数，每天总共可购买%d次";
		SubTimeTip = "消耗元宝可清除冷却时间，每分钟需要消耗%d元宝";
		AddAttackTip = "每次鼓舞可增加%d%%的临时战斗力，临时增加的战斗力在每天的%s时失效";
		
		AddCountsText = "购买第%d次挑战机会需要%d个元宝，是否购买？";
		SubTimeText = "是否花费%d元宝清除挑战的冷却时间？";
		AddAttackText = "礼金鼓舞有几率失败，元宝鼓舞必定成功。";
		AddAttackResult = "鼓舞效果：战斗力+%d";
		AddAttackFail = "很遗憾，本次鼓舞失败";
		Enough = "%s";
		NotEnough = "<font color='#FFFFFF'>%s</font>";
		
		JiLu = "挑战记录";
		FailRecord = "<p><font color='#31cf32'>%s</font>挑战您失败，您排名不变</p>";
		WinRecord = "<p><font color='#FF0000'>%s</font>挑战您成功，您排名降至<font color='#FF0000'>%d</font></p>";
		ChaFailRecord = "<p>您挑战<font color='#FF0000'>%s</font>失败，排名不变</p>";
		ChaWinRecord = "<p>您挑战<font color='#31cf32'>%s</font>成功，排名升至%d</p>";
		ChaWinRecord2 = "<p>您挑战<font color='#31cf32'>%s</font>成功，排名不变</p>";
		
		ShuoMing = "<font color='#FF0000'>华山论剑排名越靠前，每日奖励越多，荣誉点数可在荣誉商城中兑换珍惜道具</font>";
		ShuoMingBtn = "<U>玩法说明</U>";
		ShuoMingContent = "<p>1，排名越高，每日领取的奖励就越高；</p>" ..
						  "<p>2，每天21点整可以领取当天的排名奖励；</p>" ..
						  "<p>3，每天6点整重置挑战次数；</p>" ..
						  "<p>4，排名奖励到期未领取，默认放弃本次奖励；</p>" ..
						  "<p>5，每天最多可购买10次挑战次数；</p>"..
						  "<p>6，角色必须装备武器才能进行战斗。</p>";
		
		GetPrizeBtn = "领奖";
		DailyPrizeBtn = "每日奖励";
		OpenPrize = "点击打开领奖界面";
		
		SuccessResult = "%d";
		ExpResult = "经验 + %d";
		HonorResult = "荣誉值 + %d";
		
		PlayerRank = "排名：%d";
		PlayerName = "<font color='#FF0000'>%s</font>";
		MyName = "<font color='#FFFF00'>%s</font>";
		PlayerAttack = "%d";
		
		Fighting = "您确定要挑战这位玩家？";
		FightChange = "挑战的玩家发生变化，请大侠重新选择。";
		FightMaxHP = 100;
		FightConnot = "您的挑战次数已满，无法挑战。";
		FightConnot2 = "您的挑战时间正在冷却，无法挑战。";
		
		ToBeNO1 = "<font color='#FF0000'>%s</font>大侠挥一挥手，轻松带走<font color='#FF0000'>%s</font>，成为华山第一人！";
		ToBeNO2 = "特大新闻：<font color='#FF0000'>%s</font>大侠将<font color='#FF0000'>%s</font>暴打一顿后，抢得华山第%d名！";
		Combo = "恭喜<font color='#FF0000'>%s</font>大侠已连续击败%d位大侠，人挡杀人，神挡杀神！";
		ComboStop = "异军突起，<font color='#FF0000'>%s</font>大侠成功阻止<font color='#FF0000'>%s</font>的%d连杀！";
		IWantStr = "我也试试";
};

-- 额外增加挑战次数所消耗的元宝数量
-- {[增加的次数] = 元宝数量;...}
TalkSwordConfig.AddCountsGold = {
			[1] = 10;
			[2] = 15;
			[3] = 20;
			[4] = 25;
			[5] = 30;
			[6] = 35;
			[7] = 40;
			[8] = 45;
			[9] = 50;
			[10] = 55;
};
-- 挑战次数的基础上限
TalkSwordConfig.BaseCounts = 10;

-- 减少冷却时间所消耗的元宝数量
TalkSwordConfig.SubTimeGold = 1;
-- 每次挑战CD(分钟)
TalkSwordConfig.CoolTime = 10;
-- 禁止挑战CD上限(分钟)
TalkSwordConfig.CoolTimeLimit = 10;

-- 鼓舞临时战斗力所需元宝数量
TalkSwordConfig.AddAttackGold = {
	[0] = {Gold = 10; BindGold = 10};
	[1] = {Gold = 20; BindGold = 20};
	[2] = {Gold = 30; BindGold = 30};
	[3] = {Gold = 40; BindGold = 40};
	[4] = {Gold = 50; BindGold = 50};
	[5] = {Gold = 60; BindGold = 60};
};
-- 鼓舞临时战斗力的值
-- {[鼓舞次数] = 增加的战斗力百分比;...}
TalkSwordConfig.AddAttackValue = {
				[0] = 0;
				[1] = 10;
				[2] = 20;
				[3] = 30;
				[4] = 40;
				[5] = 50;
};
-- 元宝鼓舞成功率
-- {[次数] = 成功率}
TalkSwordConfig.GoldPer = {
				[0] = 1;
				[1] = 1;
				[2] = 1;
				[3] = 1;
				[4] = 1;
				[5] = 1;
};
-- 礼金鼓舞成功率
-- {[次数] = 成功率}
TalkSwordConfig.BindGoldPer = {
				[0] = 0.3;
				[1] = 0.2;
				[2] = 0.1;
				[3] = 0.1;
				[4] = 0.1;
				[5] = 0.1;
};
-- 战斗力失效的时间
TalkSwordConfig.AttackDisabled = "6:00";

-- 奖励刷新时间
TalkSwordConfig.PrizeRefreshTime = "21:00:00";
-- 一天的时间(秒)
TalkSwordConfig.DayTime = 24 * 60 * 60;

-- 挑战记录客户端可保存的上限
TalkSwordConfig.CRecordLimit = 7;
-- 挑战记录服务器可保存的上限
TalkSwordConfig.SRecordLimit = 5;

-- 战斗列表名次抽取的间隔
TalkSwordConfig.RankInterval = {
				[300] = 20;
				[200] = 15;
				[100] = 10;
				[1] = 1;
};

-- 背景图间隔
-- {[间隔] = 图片;...}
TalkSwordConfig.BackGround = {
			[1] = "img://Qita_HuasHan_ShanDing.png";  
			[2] = "img://Qita_HuasHan_ShanYao.png";  
			[3] = "img://Qita_HuasHan_ShanDi.png";     
};
-- 背景图间隔
-- {[背景图编号] = 最大名次;...}
TalkSwordConfig.BackGroundRange = {
			[1] = 10; 
			[2] = 100;
};

-- 模型套装
-- {[编号] = 等级;...}
TalkSwordConfig.ModelSuitLevel = {
	[1] = 80;
	[2] = 100;
	[3] = 120;
};
-- 模型套装
-- {[职业] = {[套装级别] = {骨骼;头;衣服;手;鞋;武器};...}...}
TalkSwordConfig.ModelSuit = {
	-- 职业 镰女
	[1] = {
			[1] = {
				  [1] = 1;
				  [2] = 101001;
				  [3] = 103005;
				  [4] = 104005;
				  [6] = 106005;
				  [5] = 105005;
			};
			[2] = {
				  [1] = 1;
				  [2] = 101001;
				  [3] = 103006;
				  [4] = 104006;
				  [5] = 105006;
				  [6] = 106006;
			};
			[3] = {
				  [1] = 1;
				  [2] = 101001;
				  [3] = 103007;
				  [4] = 104007;
				  [5] = 105007;
				  [6] = 106007;
			};
	};
	-- 职业 刀男
	[2] = {
			[1] = {
				  [1] = 2;
				  [2] = 201001;
				  [3] = 203005;
				  [4] = 204005;
				  [5] = 205005;
				  [6] = 206005;
			};
			[2] = {
				  [1] = 2;
				  [2] = 201001;
				  [3] = 203006;
				  [4] = 204006;
				  [5] = 205006;
				  [6] = 206006;
			};
			[3] = {
				  [1] = 2;
				  [2] = 201001;
				  [3] = 203007;
				  [4] = 204007;
				  [5] = 205007;
				  [6] = 206007;
			};
	};
	-- 职业 剑男
	[3] = {
			[1] = {
				  [1] = 3;
				  [2] = 301001;
				  [3] = 303005;
				  [4] = 304005;
				  [5] = 305005;
				  [6] = 306005;
			};
			[2] = {               
				  [1] = 3;
				  [2] = 301001;
				  [3] = 303006;
				  [4] = 304006;
				  [5] = 305006;
				  [6] = 306006;
			};
			[3] = {                
				  [1] = 3;
				  [2] = 301001;
				  [3] = 303007;
				  [4] = 304007;
				  [5] = 305007;
				  [6] = 306007;
			};
	};
	-- 职业 枪女
	[4] = {
			-- 级别
			[1] = {
				  [1] = 4;
				  [2] = 401001;
				  [3] = 403005;
				  [4] = 404005;
				  [5] = 405005;
				  [6] = 406005;
			};
			[2] = {
				  [1] = 4;
				  [2] = 401001;
				  [3] = 403006;
				  [4] = 404006;
				  [5] = 405006;
				  [6] = 406006;
			};
			[3] = {
				  [1] = 4;
				  [2] = 401001;
				  [3] = 403007;
				  [4] = 404007;
				  [5] = 405007;
				  [6] = 406007;
			};
	};					
};
-- 技能ID
-- {[职业] = {技能1;技能2;技能3;胜利动作}}
TalkSwordConfig.SkillInfo = {
			-- 职业 镰女
			[1] = {
				[1] = 51001;
				[2] = 51003;
				[3] = 51006;
				[4] = 101009000;
			};
			-- 职业 刀男
			[2] = {
				[1] = 31001;
				[2] = 31003;
				[3] = 31006;
				[4] = 201109000;
			};
			-- 职业 剑男
			[3] = {
				[1] = 21001;
				[2] = 21003;
				[3] = 21006;
				[4] = 301109000;
			};				
			-- 职业 枪女
			[4] = {
				[1] = 41001;
				[2] = 41003;
				[3] = 41006;
				[4] = 401009000;
			};					
};

-- 排名公告，需要多少排名以上需要公告
TalkSwordConfig.NoticeRank = 5;
-- 连斩公告配置
-- {[编号] = 连斩的次数}
TalkSwordConfig.Kill = {
	[1] = 10;
	[2] = 20;
	[3] = 50;
	[4] = 100;
	[5] = 999999;
};

-- 奖励BTN图片
-- 1 不可以领奖； 2 可领奖
TalkSwordConfig.PrizeBtn = {
			[1] = "img://Qita_HuasHan_LingJiang2.png";  
			[2] = "img://Qita_HuasHan_LingJiang1.png";  
};
-- 奖励等级图片
TalkSwordConfig.PrizeIcon = {
			[1] = "img://hsjl_01.png";  
			[2] = "img://hsjl_02.png";  
			[3] = "img://hsjl_03.png";  
			[4] = "img://hsjl_04.png";  
			[5] = "img://hsjl_05.png";
			[6] = "img://hsjl_06.png";
			[7] = "img://hsjl_07.png";
			[8] = "img://hsjl_08.png";
};

-- 场景
-- {场景文件;背景光;天空光}
TalkSwordConfig.Scence = {
	szSceneFile = "Huodong_HuaShanLunJian_LeiTai.sen";
	dwAmbientLight= 0xff555555;
	dwSkyLight= 0xff555555;
};
-- 位置
-- {[玩家编号] = {当前位置，移动速度，脸的朝向}}
TalkSwordConfig.Pos = {
	[1] = {
		CurPos = _Vector3.new(0, -9, 0);
		Speed = _Vector3.new(-0.1, 0.1, 0);
		FaceTo = 3.9;
	};
	[2] = {
		CurPos = _Vector3.new(-9, 0, 0);
		Speed = _Vector3.new(0.1, -0.1, 0);
		FaceTo = 0.8;
	};
};
-- 摄像机
-- {Look = 看得点；EyeSou = 眼的初始点；EyeDis = 眼的终点；Speed = 镜头的速度}
TalkSwordConfig.Camara = {
	Look = _Vector3.new(-3, -3, 0);
	EyeSou = _Vector3.new(-18, -18, 31);
	EyeDis = _Vector3.new(0,0,15);
	Speed = 0.2;
};
-- 两个人的距离
TalkSwordConfig.Distance = 4;
-- 界面的左上角位置
TalkSwordConfig.UIPos = {
	x = 0;
	y = 0;
};

-- 战斗时战斗力差值
-- 伤害=战斗力差值对应的伤害加成+技能伤害加成+胜利玩家的伤害加成
TalkSwordConfig.AttackChaZhi = {
	[1] = -100000;
	[2] = -50000;
	[3] = -1000;
	[4] = 0;
	[5] = 1000;
	[6] = 50000;
	[7] = 100000;
};
-- 战斗力伤害加成
-- {[战斗力差值等级] = 伤害加成}
TalkSwordConfig.AttackJiaCheng = {
	[1] = -4;
	[2] = -3;
	[3] = -2;
	[4] = 0;
	[5] = 2;
	[6] = 3;
	[7] = 4;
};
-- 获胜伤害加成
TalkSwordConfig.WinJiaChang = 12;
-- 技能等级伤害加成
-- {[技能等级] = 技能伤害加成}
TalkSwordConfig.SkillHarm = {
	[1] = 6;
	[2] = 8;
	[3] = 10;
};

-- 奖励间隔
-- 奖励榜单区间,奖励榜单区间的K对应奖励榜单的k,最后的区间就是奖励榜单最大数量
-- {[奖励等级] = 该行最大排名}
TalkSwordConfig.PrizeInterval = {
			[1] = 1;  
			[2] = 2;  
			[3] = 3;  
			[4] = 10;  
			[5] = 20;
			[6] = 50;
			[7] = 100;
			[8] = 3000;
};
-- 奖励榜单对应奖励
-- {[等级] = {[奖品号] = {奖品ID; 奖品数量; 绑定类型；生命周期；}}}
TalkSwordConfig.Prize = {
	[1] = {
		[1] = {ItemID = 6300578; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[2] = {ItemID = 2500335; ItemNum = 16; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920004; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930005; ItemNum = 4; BindType = 1; LifeTime = nil;};
	}; 
	[2] = {
		[1] = {ItemID = 6300579; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[2] = {ItemID = 2500335; ItemNum = 15; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920001; ItemNum = 17; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930004; ItemNum = 7; BindType = 1; LifeTime = nil;};
	}; 
	[3] = {
		[1] = {ItemID = 6300580; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[2] = {ItemID = 2500335; ItemNum = 15; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920001; ItemNum = 15; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930004; ItemNum = 6; BindType = 1; LifeTime = nil;};
	}; 
	[4] = {
		[1] = {ItemID = 6300581; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[2] = {ItemID = 2500335; ItemNum = 14; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920001; ItemNum = 13; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930004; ItemNum = 4; BindType = 1; LifeTime = nil;};
	}; 
	[5] = {
		[1] = {ItemID = 6300582; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[2] = {ItemID = 2500335; ItemNum = 13; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920001; ItemNum = 11; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930004; ItemNum = 3; BindType = 1; LifeTime = nil;};
	}; 
	[6] = {
		[1] = {ItemID = 6300583; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[2] = {ItemID = 2500335; ItemNum = 12; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920001; ItemNum = 7; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930004; ItemNum = 2; BindType = 1; LifeTime = nil;};
	}; 
	[7] = {
		[1] = {ItemID = 6300584; ItemNum = 1; BindType = 1; LifeTime = nil;};			
		[2] = {ItemID = 2500335; ItemNum = 11; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920001; ItemNum = 4; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930004; ItemNum = 1; BindType = 1; LifeTime = nil;};
	}; 
	[8] = {
		[1] = {ItemID = 6300585; ItemNum = 1; BindType = 1; LifeTime = nil;};
		[2] = {ItemID = 2500335; ItemNum = 10; BindType = 1; LifeTime = nil;};
		[3] = {ItemID = 5920001; ItemNum = 2; BindType = 1; LifeTime = nil;};
		[4] = {ItemID = 5930003; ItemNum = 1; BindType = 1; LifeTime = nil;};
	}; 
};

-- 挑战双方的战斗力差值
-- [id] = {战力差}
-- 注意：ChallengeValue 的id必须与 ChallengePrize 的id对应
TalkSwordConfig.ChallengeValue = {
				[1] = 0;
				[2] = 5000;
				[3] = 10000;
				[4] = 15000;
				[5] = 20000;
				[6] = 25000;
				[7] = 30000;
				[8] = 35000;
				[9] = 40000;
				[10] = 45000;
				[11] = 50000;
				[12] = 55000;
				[13] = 60000;
				[14] = 65000;
				[15] = 70000;
				[16] = 75000;
				[17] = 80000;
				[18] = 85000;
				[19] = 90000;
				[20] = 95000;
				[21] = 100000;
				[22] = 105000;
				[23] = 110000;
				[24] = 115000;
				[25] = 120000;
				[26] = 125000;
				[27] = 130000;
				[28] = 135000;
				[29] = 140000;
				[30] = 145000;
				[31] = 150000;
				[32] = 155000;
				[33] = 160000;
				[34] = 165000;
				[35] = 170000;
				[36] = 175000;
				[37] = 180000;
				[38] = 185000;
				[39] = 190000;
				[40] = 195000;
				[41] = 200000;
				[42] = 205000;
				[43] = 210000;
				[44] = 215000;
				[45] = 220000;
				[46] = 225000;
				[47] = 99999999999999;
};
-- 挑战获胜的成功率和奖励
-- {[id] = {Per = 成功率;Reward = {Exp = 经验;Honor = 荣誉值}}}
TalkSwordConfig.ChallengePrize = {
				[1] = {Per = 0.5; 
					  Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[2] = {Per = 0.5; 
					  Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[3] = {Per = 0.56;
					   Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[4] = {Per = 0.61;
					   Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[5] = {Per = 0.66;
					   Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[6] = {Per = 0.7; 
					  Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[7] = {Per = 0.74;
					   Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[8] = {Per = 0.77;
					   Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[9] = {Per = 0.8; 
					  Reward = {[1] = {Exp = 20000; Honor = 20;};
								[2] = {Exp = 10000; Honor = 15;};};
				};
				[10]  = {Per = 0.83; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[11]  = {Per = 0.85; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[12]  = {Per = 0.87; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[13]  = {Per = 0.88; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[14]  = {Per = 0.89; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[15]  = {Per = 0.91; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[16]  = {Per = 0.92; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[17]  = {Per = 0.93; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[18]  = {Per = 0.93; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[19]  = {Per = 0.94; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[20]  = {Per = 0.95; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[21]  = {Per = 0.95; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[22]  = {Per = 0.96; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[23]  = {Per = 0.96; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[24]  = {Per = 0.96; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[25]  = {Per = 0.97; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[26]  = {Per = 0.97; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[27]  = {Per = 0.97; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[28]  = {Per = 0.97; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[29]  = {Per = 0.98; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[30]  = {Per = 0.98; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[31]  = {Per = 0.98; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[32]  = {Per = 0.98; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[33]  = {Per = 0.98; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[34]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[35]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[36]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[37]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[38]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[39]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[40]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[41]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[42]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[43]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[44]  = {Per = 0.99; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[45]  = {Per = 1; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
				[46] = {Per = 1; 
						Reward = {[1] = {Exp = 20000; Honor = 20;};
								  [2] = {Exp = 10000; Honor = 15;};};
				};
};

-- 机器人配表,
-- {[排名] = {nRoleID = 玩家ID或机器人编号, sPlayerName = 名称, nAttack = 战斗力,
--            nIconID = 头像ID, nIsRobot = 0是机器人。1不是, nContinuousKill=连斩数量,
--			  nProfessionID=职业ID，nLevel=机器人模型等级。}}
-- 注意：服务器根据次表，初始化榜单
TalkSwordConfig.Robot = {
	[1] = {nRoleID = 1; sPlayerName = "无名侠客"; nAttack = 1186679; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[2] = {nRoleID = 2; sPlayerName = "无名侠客"; nAttack = 1185669; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[3] = {nRoleID = 3; sPlayerName = "无名侠客"; nAttack = 1184659; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[4] = {nRoleID = 4; sPlayerName = "无名侠客"; nAttack = 1183649; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[5] = {nRoleID = 5; sPlayerName = "无名侠客"; nAttack = 1182639; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[6] = {nRoleID = 6; sPlayerName = "无名侠客"; nAttack = 1181629; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[7] = {nRoleID = 7; sPlayerName = "无名侠客"; nAttack = 1180619; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[8] = {nRoleID = 8; sPlayerName = "无名侠客"; nAttack = 1179609; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[9] = {nRoleID = 9; sPlayerName = "无名侠客"; nAttack = 1178599; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[10] = {nRoleID = 10; sPlayerName = "无名侠客"; nAttack = 1177589; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[11] = {nRoleID = 11; sPlayerName = "无名侠客"; nAttack = 1176579; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[12] = {nRoleID = 12; sPlayerName = "无名侠客"; nAttack = 1175569; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[13] = {nRoleID = 13; sPlayerName = "无名侠客"; nAttack = 1174559; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[14] = {nRoleID = 14; sPlayerName = "无名侠客"; nAttack = 1173549; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[15] = {nRoleID = 15; sPlayerName = "无名侠客"; nAttack = 1172539; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[16] = {nRoleID = 16; sPlayerName = "无名侠客"; nAttack = 1171529; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[17] = {nRoleID = 17; sPlayerName = "无名侠客"; nAttack = 1170519; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[18] = {nRoleID = 18; sPlayerName = "无名侠客"; nAttack = 1169509; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[19] = {nRoleID = 19; sPlayerName = "无名侠客"; nAttack = 1168499; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[20] = {nRoleID = 20; sPlayerName = "无名侠客"; nAttack = 1167489; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[21] = {nRoleID = 21; sPlayerName = "无名侠客"; nAttack = 1166479; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[22] = {nRoleID = 22; sPlayerName = "无名侠客"; nAttack = 1165469; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[23] = {nRoleID = 23; sPlayerName = "无名侠客"; nAttack = 1164459; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[24] = {nRoleID = 24; sPlayerName = "无名侠客"; nAttack = 1163449; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[25] = {nRoleID = 25; sPlayerName = "无名侠客"; nAttack = 1162439; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[26] = {nRoleID = 26; sPlayerName = "无名侠客"; nAttack = 1161429; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[27] = {nRoleID = 27; sPlayerName = "无名侠客"; nAttack = 1160419; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[28] = {nRoleID = 28; sPlayerName = "无名侠客"; nAttack = 1159409; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[29] = {nRoleID = 29; sPlayerName = "无名侠客"; nAttack = 1158399; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[30] = {nRoleID = 30; sPlayerName = "无名侠客"; nAttack = 1157389; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[31] = {nRoleID = 31; sPlayerName = "无名侠客"; nAttack = 1156379; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[32] = {nRoleID = 32; sPlayerName = "无名侠客"; nAttack = 1155369; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[33] = {nRoleID = 33; sPlayerName = "无名侠客"; nAttack = 1154359; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[34] = {nRoleID = 34; sPlayerName = "无名侠客"; nAttack = 1153349; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[35] = {nRoleID = 35; sPlayerName = "无名侠客"; nAttack = 1152339; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[36] = {nRoleID = 36; sPlayerName = "无名侠客"; nAttack = 1151329; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[37] = {nRoleID = 37; sPlayerName = "无名侠客"; nAttack = 1150319; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[38] = {nRoleID = 38; sPlayerName = "无名侠客"; nAttack = 1149309; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[39] = {nRoleID = 39; sPlayerName = "无名侠客"; nAttack = 1148299; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[40] = {nRoleID = 40; sPlayerName = "无名侠客"; nAttack = 1147289; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[41] = {nRoleID = 41; sPlayerName = "无名侠客"; nAttack = 1146279; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[42] = {nRoleID = 42; sPlayerName = "无名侠客"; nAttack = 1145269; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[43] = {nRoleID = 43; sPlayerName = "无名侠客"; nAttack = 1144259; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[44] = {nRoleID = 44; sPlayerName = "无名侠客"; nAttack = 1143249; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[45] = {nRoleID = 45; sPlayerName = "无名侠客"; nAttack = 1142239; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[46] = {nRoleID = 46; sPlayerName = "无名侠客"; nAttack = 1141229; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[47] = {nRoleID = 47; sPlayerName = "无名侠客"; nAttack = 1140219; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[48] = {nRoleID = 48; sPlayerName = "无名侠客"; nAttack = 1139209; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[49] = {nRoleID = 49; sPlayerName = "无名侠客"; nAttack = 1138199; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[50] = {nRoleID = 50; sPlayerName = "无名侠客"; nAttack = 1137189; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[51] = {nRoleID = 51; sPlayerName = "无名侠客"; nAttack = 1136179; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[52] = {nRoleID = 52; sPlayerName = "无名侠客"; nAttack = 1135169; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[53] = {nRoleID = 53; sPlayerName = "无名侠客"; nAttack = 1134159; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[54] = {nRoleID = 54; sPlayerName = "无名侠客"; nAttack = 1133149; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[55] = {nRoleID = 55; sPlayerName = "无名侠客"; nAttack = 1132139; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[56] = {nRoleID = 56; sPlayerName = "无名侠客"; nAttack = 1131129; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[57] = {nRoleID = 57; sPlayerName = "无名侠客"; nAttack = 1130119; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[58] = {nRoleID = 58; sPlayerName = "无名侠客"; nAttack = 1129109; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[59] = {nRoleID = 59; sPlayerName = "无名侠客"; nAttack = 1128099; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[60] = {nRoleID = 60; sPlayerName = "无名侠客"; nAttack = 1127089; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[61] = {nRoleID = 61; sPlayerName = "无名侠客"; nAttack = 1126079; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[62] = {nRoleID = 62; sPlayerName = "无名侠客"; nAttack = 1125069; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[63] = {nRoleID = 63; sPlayerName = "无名侠客"; nAttack = 1124059; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[64] = {nRoleID = 64; sPlayerName = "无名侠客"; nAttack = 1123049; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[65] = {nRoleID = 65; sPlayerName = "无名侠客"; nAttack = 1122039; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[66] = {nRoleID = 66; sPlayerName = "无名侠客"; nAttack = 1121029; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[67] = {nRoleID = 67; sPlayerName = "无名侠客"; nAttack = 1120019; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[68] = {nRoleID = 68; sPlayerName = "无名侠客"; nAttack = 1119009; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[69] = {nRoleID = 69; sPlayerName = "无名侠客"; nAttack = 1117999; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[70] = {nRoleID = 70; sPlayerName = "无名侠客"; nAttack = 1116989; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[71] = {nRoleID = 71; sPlayerName = "无名侠客"; nAttack = 1115979; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[72] = {nRoleID = 72; sPlayerName = "无名侠客"; nAttack = 1114969; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[73] = {nRoleID = 73; sPlayerName = "无名侠客"; nAttack = 1113959; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[74] = {nRoleID = 74; sPlayerName = "无名侠客"; nAttack = 1112949; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[75] = {nRoleID = 75; sPlayerName = "无名侠客"; nAttack = 1111939; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[76] = {nRoleID = 76; sPlayerName = "无名侠客"; nAttack = 1110929; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[77] = {nRoleID = 77; sPlayerName = "无名侠客"; nAttack = 1109919; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[78] = {nRoleID = 78; sPlayerName = "无名侠客"; nAttack = 1108909; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[79] = {nRoleID = 79; sPlayerName = "无名侠客"; nAttack = 1107899; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[80] = {nRoleID = 80; sPlayerName = "无名侠客"; nAttack = 1106889; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[81] = {nRoleID = 81; sPlayerName = "无名侠客"; nAttack = 1105879; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[82] = {nRoleID = 82; sPlayerName = "无名侠客"; nAttack = 1104869; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[83] = {nRoleID = 83; sPlayerName = "无名侠客"; nAttack = 1103859; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[84] = {nRoleID = 84; sPlayerName = "无名侠客"; nAttack = 1102849; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[85] = {nRoleID = 85; sPlayerName = "无名侠客"; nAttack = 1101839; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[86] = {nRoleID = 86; sPlayerName = "无名侠客"; nAttack = 1100829; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[87] = {nRoleID = 87; sPlayerName = "无名侠客"; nAttack = 1099819; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[88] = {nRoleID = 88; sPlayerName = "无名侠客"; nAttack = 1098809; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[89] = {nRoleID = 89; sPlayerName = "无名侠客"; nAttack = 1097799; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[90] = {nRoleID = 90; sPlayerName = "无名侠客"; nAttack = 1096789; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[91] = {nRoleID = 91; sPlayerName = "无名侠客"; nAttack = 1095779; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[92] = {nRoleID = 92; sPlayerName = "无名侠客"; nAttack = 1094769; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 120;};
	[93] = {nRoleID = 93; sPlayerName = "无名侠客"; nAttack = 1093759; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[94] = {nRoleID = 94; sPlayerName = "无名侠客"; nAttack = 1092749; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[95] = {nRoleID = 95; sPlayerName = "无名侠客"; nAttack = 1091739; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[96] = {nRoleID = 96; sPlayerName = "无名侠客"; nAttack = 1090729; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 120;};
	[97] = {nRoleID = 97; sPlayerName = "无名侠客"; nAttack = 1089719; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 120;};
	[98] = {nRoleID = 98; sPlayerName = "无名侠客"; nAttack = 1088709; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[99] = {nRoleID = 99; sPlayerName = "无名侠客"; nAttack = 1087699; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[100] = {nRoleID = 100; sPlayerName = "无名侠客"; nAttack = 1086689; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 120;};
	[101] = {nRoleID = 101; sPlayerName = "无名侠客"; nAttack = 1085679; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[102] = {nRoleID = 102; sPlayerName = "无名侠客"; nAttack = 1084669; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[103] = {nRoleID = 103; sPlayerName = "无名侠客"; nAttack = 1083659; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[104] = {nRoleID = 104; sPlayerName = "无名侠客"; nAttack = 1082649; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[105] = {nRoleID = 105; sPlayerName = "无名侠客"; nAttack = 1081639; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[106] = {nRoleID = 106; sPlayerName = "无名侠客"; nAttack = 1080629; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[107] = {nRoleID = 107; sPlayerName = "无名侠客"; nAttack = 1079619; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[108] = {nRoleID = 108; sPlayerName = "无名侠客"; nAttack = 1078609; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[109] = {nRoleID = 109; sPlayerName = "无名侠客"; nAttack = 1077599; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[110] = {nRoleID = 110; sPlayerName = "无名侠客"; nAttack = 1076589; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[111] = {nRoleID = 111; sPlayerName = "无名侠客"; nAttack = 1075579; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[112] = {nRoleID = 112; sPlayerName = "无名侠客"; nAttack = 1074569; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[113] = {nRoleID = 113; sPlayerName = "无名侠客"; nAttack = 1073559; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[114] = {nRoleID = 114; sPlayerName = "无名侠客"; nAttack = 1072549; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[115] = {nRoleID = 115; sPlayerName = "无名侠客"; nAttack = 1071539; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[116] = {nRoleID = 116; sPlayerName = "无名侠客"; nAttack = 1070529; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[117] = {nRoleID = 117; sPlayerName = "无名侠客"; nAttack = 1069519; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[118] = {nRoleID = 118; sPlayerName = "无名侠客"; nAttack = 1068509; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[119] = {nRoleID = 119; sPlayerName = "无名侠客"; nAttack = 1067499; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[120] = {nRoleID = 120; sPlayerName = "无名侠客"; nAttack = 1066489; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[121] = {nRoleID = 121; sPlayerName = "无名侠客"; nAttack = 1065479; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[122] = {nRoleID = 122; sPlayerName = "无名侠客"; nAttack = 1064469; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[123] = {nRoleID = 123; sPlayerName = "无名侠客"; nAttack = 1063459; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[124] = {nRoleID = 124; sPlayerName = "无名侠客"; nAttack = 1062449; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[125] = {nRoleID = 125; sPlayerName = "无名侠客"; nAttack = 1061439; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[126] = {nRoleID = 126; sPlayerName = "无名侠客"; nAttack = 1060429; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[127] = {nRoleID = 127; sPlayerName = "无名侠客"; nAttack = 1059419; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[128] = {nRoleID = 128; sPlayerName = "无名侠客"; nAttack = 1058409; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[129] = {nRoleID = 129; sPlayerName = "无名侠客"; nAttack = 1057399; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[130] = {nRoleID = 130; sPlayerName = "无名侠客"; nAttack = 1056389; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[131] = {nRoleID = 131; sPlayerName = "无名侠客"; nAttack = 1055379; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[132] = {nRoleID = 132; sPlayerName = "无名侠客"; nAttack = 1054369; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[133] = {nRoleID = 133; sPlayerName = "无名侠客"; nAttack = 1053359; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[134] = {nRoleID = 134; sPlayerName = "无名侠客"; nAttack = 1052349; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[135] = {nRoleID = 135; sPlayerName = "无名侠客"; nAttack = 1051339; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[136] = {nRoleID = 136; sPlayerName = "无名侠客"; nAttack = 1050329; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[137] = {nRoleID = 137; sPlayerName = "无名侠客"; nAttack = 1049319; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[138] = {nRoleID = 138; sPlayerName = "无名侠客"; nAttack = 1048309; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[139] = {nRoleID = 139; sPlayerName = "无名侠客"; nAttack = 1047299; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[140] = {nRoleID = 140; sPlayerName = "无名侠客"; nAttack = 1046289; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[141] = {nRoleID = 141; sPlayerName = "无名侠客"; nAttack = 1045279; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[142] = {nRoleID = 142; sPlayerName = "无名侠客"; nAttack = 1044269; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[143] = {nRoleID = 143; sPlayerName = "无名侠客"; nAttack = 1043259; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[144] = {nRoleID = 144; sPlayerName = "无名侠客"; nAttack = 1042249; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[145] = {nRoleID = 145; sPlayerName = "无名侠客"; nAttack = 1041239; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[146] = {nRoleID = 146; sPlayerName = "无名侠客"; nAttack = 1040229; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[147] = {nRoleID = 147; sPlayerName = "无名侠客"; nAttack = 1039219; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[148] = {nRoleID = 148; sPlayerName = "无名侠客"; nAttack = 1038209; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[149] = {nRoleID = 149; sPlayerName = "无名侠客"; nAttack = 1037199; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[150] = {nRoleID = 150; sPlayerName = "无名侠客"; nAttack = 1036189; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[151] = {nRoleID = 151; sPlayerName = "无名侠客"; nAttack = 1035179; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[152] = {nRoleID = 152; sPlayerName = "无名侠客"; nAttack = 1034169; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[153] = {nRoleID = 153; sPlayerName = "无名侠客"; nAttack = 1033159; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[154] = {nRoleID = 154; sPlayerName = "无名侠客"; nAttack = 1032149; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[155] = {nRoleID = 155; sPlayerName = "无名侠客"; nAttack = 1031139; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[156] = {nRoleID = 156; sPlayerName = "无名侠客"; nAttack = 1030129; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[157] = {nRoleID = 157; sPlayerName = "无名侠客"; nAttack = 1029119; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[158] = {nRoleID = 158; sPlayerName = "无名侠客"; nAttack = 1028109; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[159] = {nRoleID = 159; sPlayerName = "无名侠客"; nAttack = 1027099; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[160] = {nRoleID = 160; sPlayerName = "无名侠客"; nAttack = 1026089; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[161] = {nRoleID = 161; sPlayerName = "无名侠客"; nAttack = 1025079; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[162] = {nRoleID = 162; sPlayerName = "无名侠客"; nAttack = 1024069; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[163] = {nRoleID = 163; sPlayerName = "无名侠客"; nAttack = 1023059; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[164] = {nRoleID = 164; sPlayerName = "无名侠客"; nAttack = 1022049; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[165] = {nRoleID = 165; sPlayerName = "无名侠客"; nAttack = 1021039; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[166] = {nRoleID = 166; sPlayerName = "无名侠客"; nAttack = 1020029; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[167] = {nRoleID = 167; sPlayerName = "无名侠客"; nAttack = 1019019; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[168] = {nRoleID = 168; sPlayerName = "无名侠客"; nAttack = 1018009; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[169] = {nRoleID = 169; sPlayerName = "无名侠客"; nAttack = 1016999; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[170] = {nRoleID = 170; sPlayerName = "无名侠客"; nAttack = 1015989; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[171] = {nRoleID = 171; sPlayerName = "无名侠客"; nAttack = 1014979; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[172] = {nRoleID = 172; sPlayerName = "无名侠客"; nAttack = 1013969; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[173] = {nRoleID = 173; sPlayerName = "无名侠客"; nAttack = 1012959; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[174] = {nRoleID = 174; sPlayerName = "无名侠客"; nAttack = 1011949; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[175] = {nRoleID = 175; sPlayerName = "无名侠客"; nAttack = 1010939; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[176] = {nRoleID = 176; sPlayerName = "无名侠客"; nAttack = 1009929; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[177] = {nRoleID = 177; sPlayerName = "无名侠客"; nAttack = 1008919; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[178] = {nRoleID = 178; sPlayerName = "无名侠客"; nAttack = 1007909; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[179] = {nRoleID = 179; sPlayerName = "无名侠客"; nAttack = 1006899; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[180] = {nRoleID = 180; sPlayerName = "无名侠客"; nAttack = 1005889; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[181] = {nRoleID = 181; sPlayerName = "无名侠客"; nAttack = 1004879; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[182] = {nRoleID = 182; sPlayerName = "无名侠客"; nAttack = 1003869; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[183] = {nRoleID = 183; sPlayerName = "无名侠客"; nAttack = 1002859; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[184] = {nRoleID = 184; sPlayerName = "无名侠客"; nAttack = 1001849; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[185] = {nRoleID = 185; sPlayerName = "无名侠客"; nAttack = 1000839; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[186] = {nRoleID = 186; sPlayerName = "无名侠客"; nAttack = 999829; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[187] = {nRoleID = 187; sPlayerName = "无名侠客"; nAttack = 998819; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[188] = {nRoleID = 188; sPlayerName = "无名侠客"; nAttack = 997809; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[189] = {nRoleID = 189; sPlayerName = "无名侠客"; nAttack = 996799; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[190] = {nRoleID = 190; sPlayerName = "无名侠客"; nAttack = 995789; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[191] = {nRoleID = 191; sPlayerName = "无名侠客"; nAttack = 994779; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[192] = {nRoleID = 192; sPlayerName = "无名侠客"; nAttack = 993769; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[193] = {nRoleID = 193; sPlayerName = "无名侠客"; nAttack = 992759; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[194] = {nRoleID = 194; sPlayerName = "无名侠客"; nAttack = 991749; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[195] = {nRoleID = 195; sPlayerName = "无名侠客"; nAttack = 990739; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[196] = {nRoleID = 196; sPlayerName = "无名侠客"; nAttack = 989729; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[197] = {nRoleID = 197; sPlayerName = "无名侠客"; nAttack = 988719; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[198] = {nRoleID = 198; sPlayerName = "无名侠客"; nAttack = 987709; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[199] = {nRoleID = 199; sPlayerName = "无名侠客"; nAttack = 986699; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[200] = {nRoleID = 200; sPlayerName = "无名侠客"; nAttack = 985689; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[201] = {nRoleID = 201; sPlayerName = "无名侠客"; nAttack = 984679; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[202] = {nRoleID = 202; sPlayerName = "无名侠客"; nAttack = 983669; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[203] = {nRoleID = 203; sPlayerName = "无名侠客"; nAttack = 982659; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[204] = {nRoleID = 204; sPlayerName = "无名侠客"; nAttack = 981649; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[205] = {nRoleID = 205; sPlayerName = "无名侠客"; nAttack = 980639; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[206] = {nRoleID = 206; sPlayerName = "无名侠客"; nAttack = 979629; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[207] = {nRoleID = 207; sPlayerName = "无名侠客"; nAttack = 978619; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[208] = {nRoleID = 208; sPlayerName = "无名侠客"; nAttack = 977609; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[209] = {nRoleID = 209; sPlayerName = "无名侠客"; nAttack = 976599; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[210] = {nRoleID = 210; sPlayerName = "无名侠客"; nAttack = 975589; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[211] = {nRoleID = 211; sPlayerName = "无名侠客"; nAttack = 974579; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[212] = {nRoleID = 212; sPlayerName = "无名侠客"; nAttack = 973569; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[213] = {nRoleID = 213; sPlayerName = "无名侠客"; nAttack = 972559; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[214] = {nRoleID = 214; sPlayerName = "无名侠客"; nAttack = 971549; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[215] = {nRoleID = 215; sPlayerName = "无名侠客"; nAttack = 970539; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[216] = {nRoleID = 216; sPlayerName = "无名侠客"; nAttack = 969529; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[217] = {nRoleID = 217; sPlayerName = "无名侠客"; nAttack = 968519; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[218] = {nRoleID = 218; sPlayerName = "无名侠客"; nAttack = 967509; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[219] = {nRoleID = 219; sPlayerName = "无名侠客"; nAttack = 966499; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[220] = {nRoleID = 220; sPlayerName = "无名侠客"; nAttack = 965489; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[221] = {nRoleID = 221; sPlayerName = "无名侠客"; nAttack = 964479; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[222] = {nRoleID = 222; sPlayerName = "无名侠客"; nAttack = 963469; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[223] = {nRoleID = 223; sPlayerName = "无名侠客"; nAttack = 962459; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[224] = {nRoleID = 224; sPlayerName = "无名侠客"; nAttack = 961449; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[225] = {nRoleID = 225; sPlayerName = "无名侠客"; nAttack = 960439; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[226] = {nRoleID = 226; sPlayerName = "无名侠客"; nAttack = 959429; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[227] = {nRoleID = 227; sPlayerName = "无名侠客"; nAttack = 958419; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[228] = {nRoleID = 228; sPlayerName = "无名侠客"; nAttack = 957409; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[229] = {nRoleID = 229; sPlayerName = "无名侠客"; nAttack = 956399; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[230] = {nRoleID = 230; sPlayerName = "无名侠客"; nAttack = 955389; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[231] = {nRoleID = 231; sPlayerName = "无名侠客"; nAttack = 954379; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[232] = {nRoleID = 232; sPlayerName = "无名侠客"; nAttack = 953369; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[233] = {nRoleID = 233; sPlayerName = "无名侠客"; nAttack = 952359; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[234] = {nRoleID = 234; sPlayerName = "无名侠客"; nAttack = 951349; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[235] = {nRoleID = 235; sPlayerName = "无名侠客"; nAttack = 950339; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[236] = {nRoleID = 236; sPlayerName = "无名侠客"; nAttack = 949329; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[237] = {nRoleID = 237; sPlayerName = "无名侠客"; nAttack = 948319; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[238] = {nRoleID = 238; sPlayerName = "无名侠客"; nAttack = 947309; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[239] = {nRoleID = 239; sPlayerName = "无名侠客"; nAttack = 946299; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[240] = {nRoleID = 240; sPlayerName = "无名侠客"; nAttack = 945289; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[241] = {nRoleID = 241; sPlayerName = "无名侠客"; nAttack = 944279; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[242] = {nRoleID = 242; sPlayerName = "无名侠客"; nAttack = 943269; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[243] = {nRoleID = 243; sPlayerName = "无名侠客"; nAttack = 942259; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[244] = {nRoleID = 244; sPlayerName = "无名侠客"; nAttack = 941249; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[245] = {nRoleID = 245; sPlayerName = "无名侠客"; nAttack = 940239; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[246] = {nRoleID = 246; sPlayerName = "无名侠客"; nAttack = 939229; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[247] = {nRoleID = 247; sPlayerName = "无名侠客"; nAttack = 938219; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[248] = {nRoleID = 248; sPlayerName = "无名侠客"; nAttack = 937209; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[249] = {nRoleID = 249; sPlayerName = "无名侠客"; nAttack = 936199; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[250] = {nRoleID = 250; sPlayerName = "无名侠客"; nAttack = 935189; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[251] = {nRoleID = 251; sPlayerName = "无名侠客"; nAttack = 934179; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[252] = {nRoleID = 252; sPlayerName = "无名侠客"; nAttack = 933169; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[253] = {nRoleID = 253; sPlayerName = "无名侠客"; nAttack = 932159; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[254] = {nRoleID = 254; sPlayerName = "无名侠客"; nAttack = 931149; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[255] = {nRoleID = 255; sPlayerName = "无名侠客"; nAttack = 930139; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[256] = {nRoleID = 256; sPlayerName = "无名侠客"; nAttack = 929129; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[257] = {nRoleID = 257; sPlayerName = "无名侠客"; nAttack = 928119; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[258] = {nRoleID = 258; sPlayerName = "无名侠客"; nAttack = 927109; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[259] = {nRoleID = 259; sPlayerName = "无名侠客"; nAttack = 926099; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[260] = {nRoleID = 260; sPlayerName = "无名侠客"; nAttack = 925089; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[261] = {nRoleID = 261; sPlayerName = "无名侠客"; nAttack = 924079; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[262] = {nRoleID = 262; sPlayerName = "无名侠客"; nAttack = 923069; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[263] = {nRoleID = 263; sPlayerName = "无名侠客"; nAttack = 922059; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[264] = {nRoleID = 264; sPlayerName = "无名侠客"; nAttack = 921049; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[265] = {nRoleID = 265; sPlayerName = "无名侠客"; nAttack = 920039; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[266] = {nRoleID = 266; sPlayerName = "无名侠客"; nAttack = 919029; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[267] = {nRoleID = 267; sPlayerName = "无名侠客"; nAttack = 918019; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[268] = {nRoleID = 268; sPlayerName = "无名侠客"; nAttack = 917009; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[269] = {nRoleID = 269; sPlayerName = "无名侠客"; nAttack = 915999; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[270] = {nRoleID = 270; sPlayerName = "无名侠客"; nAttack = 914989; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[271] = {nRoleID = 271; sPlayerName = "无名侠客"; nAttack = 913979; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[272] = {nRoleID = 272; sPlayerName = "无名侠客"; nAttack = 912969; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[273] = {nRoleID = 273; sPlayerName = "无名侠客"; nAttack = 911959; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[274] = {nRoleID = 274; sPlayerName = "无名侠客"; nAttack = 910949; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[275] = {nRoleID = 275; sPlayerName = "无名侠客"; nAttack = 909939; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[276] = {nRoleID = 276; sPlayerName = "无名侠客"; nAttack = 908929; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[277] = {nRoleID = 277; sPlayerName = "无名侠客"; nAttack = 907919; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[278] = {nRoleID = 278; sPlayerName = "无名侠客"; nAttack = 906909; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[279] = {nRoleID = 279; sPlayerName = "无名侠客"; nAttack = 905899; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[280] = {nRoleID = 280; sPlayerName = "无名侠客"; nAttack = 904889; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[281] = {nRoleID = 281; sPlayerName = "无名侠客"; nAttack = 903879; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[282] = {nRoleID = 282; sPlayerName = "无名侠客"; nAttack = 902869; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[283] = {nRoleID = 283; sPlayerName = "无名侠客"; nAttack = 901859; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[284] = {nRoleID = 284; sPlayerName = "无名侠客"; nAttack = 900849; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[285] = {nRoleID = 285; sPlayerName = "无名侠客"; nAttack = 899839; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[286] = {nRoleID = 286; sPlayerName = "无名侠客"; nAttack = 898829; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[287] = {nRoleID = 287; sPlayerName = "无名侠客"; nAttack = 897819; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[288] = {nRoleID = 288; sPlayerName = "无名侠客"; nAttack = 896809; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[289] = {nRoleID = 289; sPlayerName = "无名侠客"; nAttack = 895799; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[290] = {nRoleID = 290; sPlayerName = "无名侠客"; nAttack = 894789; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[291] = {nRoleID = 291; sPlayerName = "无名侠客"; nAttack = 893779; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[292] = {nRoleID = 292; sPlayerName = "无名侠客"; nAttack = 892769; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[293] = {nRoleID = 293; sPlayerName = "无名侠客"; nAttack = 891759; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[294] = {nRoleID = 294; sPlayerName = "无名侠客"; nAttack = 890749; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[295] = {nRoleID = 295; sPlayerName = "无名侠客"; nAttack = 889739; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[296] = {nRoleID = 296; sPlayerName = "无名侠客"; nAttack = 888729; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 100;};
	[297] = {nRoleID = 297; sPlayerName = "无名侠客"; nAttack = 887719; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 100;};
	[298] = {nRoleID = 298; sPlayerName = "无名侠客"; nAttack = 886709; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[299] = {nRoleID = 299; sPlayerName = "无名侠客"; nAttack = 885699; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 100;};
	[300] = {nRoleID = 300; sPlayerName = "无名侠客"; nAttack = 884689; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 100;};
	[301] = {nRoleID = 301; sPlayerName = "无名侠客"; nAttack = 883679; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[302] = {nRoleID = 302; sPlayerName = "无名侠客"; nAttack = 882669; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[303] = {nRoleID = 303; sPlayerName = "无名侠客"; nAttack = 881659; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[304] = {nRoleID = 304; sPlayerName = "无名侠客"; nAttack = 880649; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[305] = {nRoleID = 305; sPlayerName = "无名侠客"; nAttack = 879639; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[306] = {nRoleID = 306; sPlayerName = "无名侠客"; nAttack = 878629; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[307] = {nRoleID = 307; sPlayerName = "无名侠客"; nAttack = 877619; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[308] = {nRoleID = 308; sPlayerName = "无名侠客"; nAttack = 876609; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[309] = {nRoleID = 309; sPlayerName = "无名侠客"; nAttack = 875599; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[310] = {nRoleID = 310; sPlayerName = "无名侠客"; nAttack = 874589; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[311] = {nRoleID = 311; sPlayerName = "无名侠客"; nAttack = 873579; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[312] = {nRoleID = 312; sPlayerName = "无名侠客"; nAttack = 872569; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[313] = {nRoleID = 313; sPlayerName = "无名侠客"; nAttack = 871559; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[314] = {nRoleID = 314; sPlayerName = "无名侠客"; nAttack = 870549; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[315] = {nRoleID = 315; sPlayerName = "无名侠客"; nAttack = 869539; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[316] = {nRoleID = 316; sPlayerName = "无名侠客"; nAttack = 868529; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[317] = {nRoleID = 317; sPlayerName = "无名侠客"; nAttack = 867519; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[318] = {nRoleID = 318; sPlayerName = "无名侠客"; nAttack = 866509; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[319] = {nRoleID = 319; sPlayerName = "无名侠客"; nAttack = 865499; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[320] = {nRoleID = 320; sPlayerName = "无名侠客"; nAttack = 864489; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[321] = {nRoleID = 321; sPlayerName = "无名侠客"; nAttack = 863479; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[322] = {nRoleID = 322; sPlayerName = "无名侠客"; nAttack = 862469; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[323] = {nRoleID = 323; sPlayerName = "无名侠客"; nAttack = 861459; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[324] = {nRoleID = 324; sPlayerName = "无名侠客"; nAttack = 860449; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[325] = {nRoleID = 325; sPlayerName = "无名侠客"; nAttack = 859439; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[326] = {nRoleID = 326; sPlayerName = "无名侠客"; nAttack = 858429; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[327] = {nRoleID = 327; sPlayerName = "无名侠客"; nAttack = 857419; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[328] = {nRoleID = 328; sPlayerName = "无名侠客"; nAttack = 856409; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[329] = {nRoleID = 329; sPlayerName = "无名侠客"; nAttack = 855399; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[330] = {nRoleID = 330; sPlayerName = "无名侠客"; nAttack = 854389; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[331] = {nRoleID = 331; sPlayerName = "无名侠客"; nAttack = 853379; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[332] = {nRoleID = 332; sPlayerName = "无名侠客"; nAttack = 852369; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[333] = {nRoleID = 333; sPlayerName = "无名侠客"; nAttack = 851359; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[334] = {nRoleID = 334; sPlayerName = "无名侠客"; nAttack = 850349; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[335] = {nRoleID = 335; sPlayerName = "无名侠客"; nAttack = 849339; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[336] = {nRoleID = 336; sPlayerName = "无名侠客"; nAttack = 848329; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[337] = {nRoleID = 337; sPlayerName = "无名侠客"; nAttack = 847319; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[338] = {nRoleID = 338; sPlayerName = "无名侠客"; nAttack = 846309; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[339] = {nRoleID = 339; sPlayerName = "无名侠客"; nAttack = 845299; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[340] = {nRoleID = 340; sPlayerName = "无名侠客"; nAttack = 844289; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[341] = {nRoleID = 341; sPlayerName = "无名侠客"; nAttack = 843279; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[342] = {nRoleID = 342; sPlayerName = "无名侠客"; nAttack = 842269; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[343] = {nRoleID = 343; sPlayerName = "无名侠客"; nAttack = 841259; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[344] = {nRoleID = 344; sPlayerName = "无名侠客"; nAttack = 840249; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[345] = {nRoleID = 345; sPlayerName = "无名侠客"; nAttack = 839239; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[346] = {nRoleID = 346; sPlayerName = "无名侠客"; nAttack = 838229; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[347] = {nRoleID = 347; sPlayerName = "无名侠客"; nAttack = 837219; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[348] = {nRoleID = 348; sPlayerName = "无名侠客"; nAttack = 836209; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[349] = {nRoleID = 349; sPlayerName = "无名侠客"; nAttack = 835199; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[350] = {nRoleID = 350; sPlayerName = "无名侠客"; nAttack = 834189; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[351] = {nRoleID = 351; sPlayerName = "无名侠客"; nAttack = 833179; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[352] = {nRoleID = 352; sPlayerName = "无名侠客"; nAttack = 832169; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[353] = {nRoleID = 353; sPlayerName = "无名侠客"; nAttack = 831159; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[354] = {nRoleID = 354; sPlayerName = "无名侠客"; nAttack = 830149; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[355] = {nRoleID = 355; sPlayerName = "无名侠客"; nAttack = 829139; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[356] = {nRoleID = 356; sPlayerName = "无名侠客"; nAttack = 828129; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[357] = {nRoleID = 357; sPlayerName = "无名侠客"; nAttack = 827119; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[358] = {nRoleID = 358; sPlayerName = "无名侠客"; nAttack = 826109; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[359] = {nRoleID = 359; sPlayerName = "无名侠客"; nAttack = 825099; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[360] = {nRoleID = 360; sPlayerName = "无名侠客"; nAttack = 824089; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[361] = {nRoleID = 361; sPlayerName = "无名侠客"; nAttack = 823079; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[362] = {nRoleID = 362; sPlayerName = "无名侠客"; nAttack = 822069; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[363] = {nRoleID = 363; sPlayerName = "无名侠客"; nAttack = 821059; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[364] = {nRoleID = 364; sPlayerName = "无名侠客"; nAttack = 820049; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[365] = {nRoleID = 365; sPlayerName = "无名侠客"; nAttack = 819039; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[366] = {nRoleID = 366; sPlayerName = "无名侠客"; nAttack = 818029; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[367] = {nRoleID = 367; sPlayerName = "无名侠客"; nAttack = 817019; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[368] = {nRoleID = 368; sPlayerName = "无名侠客"; nAttack = 816009; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[369] = {nRoleID = 369; sPlayerName = "无名侠客"; nAttack = 814999; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[370] = {nRoleID = 370; sPlayerName = "无名侠客"; nAttack = 813989; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[371] = {nRoleID = 371; sPlayerName = "无名侠客"; nAttack = 812979; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[372] = {nRoleID = 372; sPlayerName = "无名侠客"; nAttack = 811969; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[373] = {nRoleID = 373; sPlayerName = "无名侠客"; nAttack = 810959; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[374] = {nRoleID = 374; sPlayerName = "无名侠客"; nAttack = 809949; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[375] = {nRoleID = 375; sPlayerName = "无名侠客"; nAttack = 808939; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[376] = {nRoleID = 376; sPlayerName = "无名侠客"; nAttack = 807929; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[377] = {nRoleID = 377; sPlayerName = "无名侠客"; nAttack = 806919; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[378] = {nRoleID = 378; sPlayerName = "无名侠客"; nAttack = 805909; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[379] = {nRoleID = 379; sPlayerName = "无名侠客"; nAttack = 804899; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[380] = {nRoleID = 380; sPlayerName = "无名侠客"; nAttack = 803889; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[381] = {nRoleID = 381; sPlayerName = "无名侠客"; nAttack = 802879; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[382] = {nRoleID = 382; sPlayerName = "无名侠客"; nAttack = 801869; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[383] = {nRoleID = 383; sPlayerName = "无名侠客"; nAttack = 800859; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[384] = {nRoleID = 384; sPlayerName = "无名侠客"; nAttack = 799849; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[385] = {nRoleID = 385; sPlayerName = "无名侠客"; nAttack = 798839; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[386] = {nRoleID = 386; sPlayerName = "无名侠客"; nAttack = 797829; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[387] = {nRoleID = 387; sPlayerName = "无名侠客"; nAttack = 796819; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[388] = {nRoleID = 388; sPlayerName = "无名侠客"; nAttack = 795809; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[389] = {nRoleID = 389; sPlayerName = "无名侠客"; nAttack = 794799; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[390] = {nRoleID = 390; sPlayerName = "无名侠客"; nAttack = 793789; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[391] = {nRoleID = 391; sPlayerName = "无名侠客"; nAttack = 792779; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[392] = {nRoleID = 392; sPlayerName = "无名侠客"; nAttack = 791769; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[393] = {nRoleID = 393; sPlayerName = "无名侠客"; nAttack = 790759; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[394] = {nRoleID = 394; sPlayerName = "无名侠客"; nAttack = 789749; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[395] = {nRoleID = 395; sPlayerName = "无名侠客"; nAttack = 788739; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[396] = {nRoleID = 396; sPlayerName = "无名侠客"; nAttack = 787729; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[397] = {nRoleID = 397; sPlayerName = "无名侠客"; nAttack = 786719; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[398] = {nRoleID = 398; sPlayerName = "无名侠客"; nAttack = 785709; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[399] = {nRoleID = 399; sPlayerName = "无名侠客"; nAttack = 784699; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[400] = {nRoleID = 400; sPlayerName = "无名侠客"; nAttack = 783689; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[401] = {nRoleID = 401; sPlayerName = "无名侠客"; nAttack = 782679; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[402] = {nRoleID = 402; sPlayerName = "无名侠客"; nAttack = 781669; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[403] = {nRoleID = 403; sPlayerName = "无名侠客"; nAttack = 780659; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[404] = {nRoleID = 404; sPlayerName = "无名侠客"; nAttack = 779649; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[405] = {nRoleID = 405; sPlayerName = "无名侠客"; nAttack = 778639; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[406] = {nRoleID = 406; sPlayerName = "无名侠客"; nAttack = 777629; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[407] = {nRoleID = 407; sPlayerName = "无名侠客"; nAttack = 776619; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[408] = {nRoleID = 408; sPlayerName = "无名侠客"; nAttack = 775609; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[409] = {nRoleID = 409; sPlayerName = "无名侠客"; nAttack = 774599; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[410] = {nRoleID = 410; sPlayerName = "无名侠客"; nAttack = 773589; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[411] = {nRoleID = 411; sPlayerName = "无名侠客"; nAttack = 772579; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[412] = {nRoleID = 412; sPlayerName = "无名侠客"; nAttack = 771569; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[413] = {nRoleID = 413; sPlayerName = "无名侠客"; nAttack = 770559; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[414] = {nRoleID = 414; sPlayerName = "无名侠客"; nAttack = 769549; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[415] = {nRoleID = 415; sPlayerName = "无名侠客"; nAttack = 768539; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[416] = {nRoleID = 416; sPlayerName = "无名侠客"; nAttack = 767529; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[417] = {nRoleID = 417; sPlayerName = "无名侠客"; nAttack = 766519; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[418] = {nRoleID = 418; sPlayerName = "无名侠客"; nAttack = 765509; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[419] = {nRoleID = 419; sPlayerName = "无名侠客"; nAttack = 764499; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[420] = {nRoleID = 420; sPlayerName = "无名侠客"; nAttack = 763489; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[421] = {nRoleID = 421; sPlayerName = "无名侠客"; nAttack = 762479; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[422] = {nRoleID = 422; sPlayerName = "无名侠客"; nAttack = 761469; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[423] = {nRoleID = 423; sPlayerName = "无名侠客"; nAttack = 760459; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[424] = {nRoleID = 424; sPlayerName = "无名侠客"; nAttack = 759449; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[425] = {nRoleID = 425; sPlayerName = "无名侠客"; nAttack = 758439; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[426] = {nRoleID = 426; sPlayerName = "无名侠客"; nAttack = 757429; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[427] = {nRoleID = 427; sPlayerName = "无名侠客"; nAttack = 756419; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[428] = {nRoleID = 428; sPlayerName = "无名侠客"; nAttack = 755409; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[429] = {nRoleID = 429; sPlayerName = "无名侠客"; nAttack = 754399; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[430] = {nRoleID = 430; sPlayerName = "无名侠客"; nAttack = 753389; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[431] = {nRoleID = 431; sPlayerName = "无名侠客"; nAttack = 752379; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[432] = {nRoleID = 432; sPlayerName = "无名侠客"; nAttack = 751369; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[433] = {nRoleID = 433; sPlayerName = "无名侠客"; nAttack = 750359; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[434] = {nRoleID = 434; sPlayerName = "无名侠客"; nAttack = 749349; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[435] = {nRoleID = 435; sPlayerName = "无名侠客"; nAttack = 748339; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[436] = {nRoleID = 436; sPlayerName = "无名侠客"; nAttack = 747329; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[437] = {nRoleID = 437; sPlayerName = "无名侠客"; nAttack = 746319; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[438] = {nRoleID = 438; sPlayerName = "无名侠客"; nAttack = 745309; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[439] = {nRoleID = 439; sPlayerName = "无名侠客"; nAttack = 744299; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[440] = {nRoleID = 440; sPlayerName = "无名侠客"; nAttack = 743289; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[441] = {nRoleID = 441; sPlayerName = "无名侠客"; nAttack = 742279; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[442] = {nRoleID = 442; sPlayerName = "无名侠客"; nAttack = 741269; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[443] = {nRoleID = 443; sPlayerName = "无名侠客"; nAttack = 740259; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[444] = {nRoleID = 444; sPlayerName = "无名侠客"; nAttack = 739249; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[445] = {nRoleID = 445; sPlayerName = "无名侠客"; nAttack = 738239; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[446] = {nRoleID = 446; sPlayerName = "无名侠客"; nAttack = 737229; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[447] = {nRoleID = 447; sPlayerName = "无名侠客"; nAttack = 736219; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[448] = {nRoleID = 448; sPlayerName = "无名侠客"; nAttack = 735209; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[449] = {nRoleID = 449; sPlayerName = "无名侠客"; nAttack = 734199; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[450] = {nRoleID = 450; sPlayerName = "无名侠客"; nAttack = 733189; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[451] = {nRoleID = 451; sPlayerName = "无名侠客"; nAttack = 732179; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[452] = {nRoleID = 452; sPlayerName = "无名侠客"; nAttack = 731169; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[453] = {nRoleID = 453; sPlayerName = "无名侠客"; nAttack = 730159; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[454] = {nRoleID = 454; sPlayerName = "无名侠客"; nAttack = 729149; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[455] = {nRoleID = 455; sPlayerName = "无名侠客"; nAttack = 728139; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[456] = {nRoleID = 456; sPlayerName = "无名侠客"; nAttack = 727129; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[457] = {nRoleID = 457; sPlayerName = "无名侠客"; nAttack = 726119; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[458] = {nRoleID = 458; sPlayerName = "无名侠客"; nAttack = 725109; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[459] = {nRoleID = 459; sPlayerName = "无名侠客"; nAttack = 724099; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[460] = {nRoleID = 460; sPlayerName = "无名侠客"; nAttack = 723089; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[461] = {nRoleID = 461; sPlayerName = "无名侠客"; nAttack = 722079; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[462] = {nRoleID = 462; sPlayerName = "无名侠客"; nAttack = 721069; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[463] = {nRoleID = 463; sPlayerName = "无名侠客"; nAttack = 720059; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[464] = {nRoleID = 464; sPlayerName = "无名侠客"; nAttack = 719049; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[465] = {nRoleID = 465; sPlayerName = "无名侠客"; nAttack = 718039; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[466] = {nRoleID = 466; sPlayerName = "无名侠客"; nAttack = 717029; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[467] = {nRoleID = 467; sPlayerName = "无名侠客"; nAttack = 716019; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[468] = {nRoleID = 468; sPlayerName = "无名侠客"; nAttack = 715009; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[469] = {nRoleID = 469; sPlayerName = "无名侠客"; nAttack = 713999; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[470] = {nRoleID = 470; sPlayerName = "无名侠客"; nAttack = 712989; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[471] = {nRoleID = 471; sPlayerName = "无名侠客"; nAttack = 711979; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[472] = {nRoleID = 472; sPlayerName = "无名侠客"; nAttack = 710969; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[473] = {nRoleID = 473; sPlayerName = "无名侠客"; nAttack = 709959; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[474] = {nRoleID = 474; sPlayerName = "无名侠客"; nAttack = 708949; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[475] = {nRoleID = 475; sPlayerName = "无名侠客"; nAttack = 707939; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[476] = {nRoleID = 476; sPlayerName = "无名侠客"; nAttack = 706929; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[477] = {nRoleID = 477; sPlayerName = "无名侠客"; nAttack = 705919; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[478] = {nRoleID = 478; sPlayerName = "无名侠客"; nAttack = 704909; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[479] = {nRoleID = 479; sPlayerName = "无名侠客"; nAttack = 703899; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[480] = {nRoleID = 480; sPlayerName = "无名侠客"; nAttack = 702889; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[481] = {nRoleID = 481; sPlayerName = "无名侠客"; nAttack = 701879; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[482] = {nRoleID = 482; sPlayerName = "无名侠客"; nAttack = 700869; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[483] = {nRoleID = 483; sPlayerName = "无名侠客"; nAttack = 699859; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[484] = {nRoleID = 484; sPlayerName = "无名侠客"; nAttack = 698849; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[485] = {nRoleID = 485; sPlayerName = "无名侠客"; nAttack = 697839; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[486] = {nRoleID = 486; sPlayerName = "无名侠客"; nAttack = 696829; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[487] = {nRoleID = 487; sPlayerName = "无名侠客"; nAttack = 695819; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[488] = {nRoleID = 488; sPlayerName = "无名侠客"; nAttack = 694809; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[489] = {nRoleID = 489; sPlayerName = "无名侠客"; nAttack = 693799; nIconID = 3003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};
	[490] = {nRoleID = 490; sPlayerName = "无名侠客"; nAttack = 692789; nIconID = 4001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[491] = {nRoleID = 491; sPlayerName = "无名侠客"; nAttack = 691779; nIconID = 4002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[492] = {nRoleID = 492; sPlayerName = "无名侠客"; nAttack = 690769; nIconID = 4003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[493] = {nRoleID = 493; sPlayerName = "无名侠客"; nAttack = 689759; nIconID = 1001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[494] = {nRoleID = 494; sPlayerName = "无名侠客"; nAttack = 688749; nIconID = 1002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[495] = {nRoleID = 495; sPlayerName = "无名侠客"; nAttack = 687739; nIconID = 1003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[496] = {nRoleID = 496; sPlayerName = "无名侠客"; nAttack = 686729; nIconID = 2001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 1; nLevel = 80;};
	[497] = {nRoleID = 497; sPlayerName = "无名侠客"; nAttack = 685719; nIconID = 2002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[498] = {nRoleID = 498; sPlayerName = "无名侠客"; nAttack = 684709; nIconID = 2003; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 2; nLevel = 80;};
	[499] = {nRoleID = 499; sPlayerName = "无名侠客"; nAttack = 683699; nIconID = 3001; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 3; nLevel = 80;};
	[500] = {nRoleID = 500; sPlayerName = "无名侠客"; nAttack = 682689; nIconID = 3002; nIsRobot = 0; nContinuousKill = 0; nProfessionID = 4; nLevel = 80;};												
};
