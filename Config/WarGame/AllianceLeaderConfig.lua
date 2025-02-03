_G.AllianceLeaderConfig = {
	--模型配置
	Model = {
		dwMapID = 1002;
		[1] = {x=8.18,y=28.33,dir=5.5};--盟主
		--[2] = {x=0,y=0,dir=0};--夫人
		--[3] = {x=8.64,y=26.28,dir=5.5};--左
		--[4] = {x=6.31,y=28.96,dir=5.5};--右
	};
	--清除盟主时间
	Clear = {
		Week = {5};
		szTime = "19:30";
	};
	Delay = {
		EnterGame = 5*60*1000;--盟主上线
		ChangeMap = 5*60*1000;--官员换地图
	};
	Prof = {
		[1] = "镰",
		[2] = "刀",
		[3] = "剑",
		[4] = "枪",
	};
	--文本
	Text = {
		Title = {
			[1] = "武林盟主"; --盟主
			[2] = {					--配偶（本项按职业区分）
				[1] = "盟主夫人";
				[2] = "盟主情人";
				[3] = "盟主相公";
				[4] = "盟主姘头";
			};
			[3] = "副盟主"; --左
			[4] = "副盟主"; --右
		};
		Opera = {
			Btn = {--按钮上的字
				[1] = "任免"; --任免
				[2] = "罢免"; --罢免
			}
		};
		Name = "%s";--人物名字
		Guild = "世家:%s";--世家名字
		NoGuild = [[<p align='center'>暂无世家</p>]];--没有世家
	};
	--奖励属性(固定)
	Attr = {
		[1] = {dwAttack = 500,dwDefense = 250,dwHPMax = 1888,
		};
		[2] = {--配偶
		};
		[3] = {--左
		};
		[4] = {--右
		};
	};
	--奖励属性(比例)
	PAttr = {
		[1] = {--盟主
		};
		[2] = {--配偶
		};
		[3] = {--左
		};
		[4] = {--右
		};
	};
	Pic = {
		[1] = "Play_title_wulinmengzhu.png";--盟主
		[2] = "Play_title_mengzhubanlv.png";--配偶
		[3] = "Play_title_fumengzhu.png";--左
		[4] = "Play_title_fumengzhu.png";--右
	};
	NoticePic = {
		[1] = "img://Play_title_wulinmengzhu.png";--盟主
		[2] = "img://Play_title_mengzhubanlv.png";--配偶
		[3] = "img://Play_title_fumengzhu.png";--左
		[4] = "img://Play_title_fumengzhu.png";--右
	};
	Err = {
		[-1]= _G.SysStringConfigInfo[6001047008];
		[0] = _G.SysStringConfigInfo[6001047009];
		[1] = _G.SysStringConfigInfo[6001047010];
		[2] = _G.SysStringConfigInfo[6001047011];
		[3] = _G.SysStringConfigInfo[6001047012];
		[20] = _G.SysStringConfigInfo[6001047013];
		[21] = _G.SysStringConfigInfo[6001047014];
		[22] = "没有输入玩家名字";
		[23] = "已经是第一页了";
		[24] = "已经是最后一页了";
		[25] = "没有找到任何玩家";
	};
	Notice = {
		[1] = _G.SysStringConfigInfo[6001047015];
		[2] =  _G.SysStringConfigInfo[6001047016];
	};
	szRollOver = _G.SysStringConfigInfo[6001047017];



}