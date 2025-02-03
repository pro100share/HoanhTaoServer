--通天塔配置文件

--通天塔配置
_G.TongTianTowerConfig = {
	-- 每周刷新日期
	nWeekResetDay = "0";
	-- 每周刷新的时间
	sWeekReset = "06:00";
	-- 成为上周擂主广播时间
	sChampBoardcastTime = "20:00";
	-- 每天刷新的时间
	sDayReset = "06:00";
	-- 元宝重置次数
	nResetCount = 1;
	-- 重置消耗的元宝数
	nResetGold = 500;
	--通天塔开放的最高层数
	nMaxLayer = 9;

	-- --点击一次层数变量 (未开放)
	-- nAddNum = 9;

	--称号奖励
	dwItemEnum = 5809707;
	-- 上周擂主邮件标题
	sMailTopic = "恭喜获得上周通天塔擂主";
	-- 上周擂主邮件内容
	sMailContent = "您获得称号卡";
	-- 此处填对应的副本id
	nDupl = 1015;

	tower = {
		[1] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_01.png";
			--每个boss奖励
			tAwardid = {
			--【序号】= {nItemEnum = 物品id，nItemNumber = 个数}
				[1] = {nItemEnum = 2500162,nItemNumber = 1};	--日常道具·小
				[2] = {nItemEnum = 3900030,nItemNumber = 1};	--3品宝石精华
				[3] = {nItemEnum = 2500346,nItemNumber = 1};	--紫薇星图碎片
				[4] = {nItemEnum = 9405041,nItemNumber = 1};	--无极仙元丹·灵
				[5] = {nItemEnum = 6300586,nItemNumber = 1};	--古玩志初级礼包
				[6] = {nItemEnum = 4900109,nItemNumber = 1};	--小金砖						
			};
		-- PassMoney	 钱 -- Gold	  礼金	-- Zhenqi		真气	-- Exp			经验
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[2] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_02.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500162,nItemNumber = 1};	--日常道具·小
				[2] = {nItemEnum = 3900040,nItemNumber = 1};	--4品宝石精华
				[3] = {nItemEnum = 2500346,nItemNumber = 1};	--紫薇星图碎片
				[4] = {nItemEnum = 9405041,nItemNumber = 1};	--无极仙元丹·灵
				[5] = {nItemEnum = 6300586,nItemNumber = 1};	--古玩志初级礼包
				[6] = {nItemEnum = 4900109,nItemNumber = 1};	--小金砖											
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[3] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_03.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500163,nItemNumber = 1};	--日常道具·中
				[2] = {nItemEnum = 3900050,nItemNumber = 1};	--5品宝石精华
				[3] = {nItemEnum = 2500346,nItemNumber = 1};	--紫薇星图碎片
				[4] = {nItemEnum = 9405041,nItemNumber = 1};	--无极仙元丹·灵
				[5] = {nItemEnum = 6300586,nItemNumber = 1};	--古玩志初级礼包
				[6] = {nItemEnum = 3900040,nItemNumber = 1};	--4品宝石精华												
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[4] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_04.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500163,nItemNumber = 1};	--日常道具·中
				[2] = {nItemEnum = 3900060,nItemNumber = 1};	--6品宝石精华
				[3] = {nItemEnum = 2500346,nItemNumber = 1};	--紫薇星图碎片
				[4] = {nItemEnum = 9405041,nItemNumber = 1};	--无极仙元丹·灵
				[5] = {nItemEnum = 6300586,nItemNumber = 1};	--古玩志初级礼包
				[6] = {nItemEnum = 4900163,nItemNumber = 1};	--黄金碎片						
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[5] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_05.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500163,nItemNumber = 1};	--日常道具·中
				[2] = {nItemEnum = 3900070,nItemNumber = 1};	--7品宝石精华
				[3] = {nItemEnum = 2500346,nItemNumber = 1};	--紫薇星图碎片
				[4] = {nItemEnum = 9405041,nItemNumber = 1};	--无极仙元丹·灵
				[5] = {nItemEnum = 6300586,nItemNumber = 1};	--古玩志初级礼包
				[6] = {nItemEnum = 4900163,nItemNumber = 1};	--黄金碎片						
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[6] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_06.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500164,nItemNumber = 1};	--日常道具·大
				[2] = {nItemEnum = 3900080,nItemNumber = 1};	--8品宝石精华
				[3] = {nItemEnum = 2500345,nItemNumber = 1};	--紫薇星图
				[4] = {nItemEnum = 9405042,nItemNumber = 1};	--无极仙元丹·真
				[5] = {nItemEnum = 6300587,nItemNumber = 1};	--古玩志中级礼包
				[6] = {nItemEnum = 4900163,nItemNumber = 1};	--黄金碎片								
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[7] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_07.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500164,nItemNumber = 1};	--日常道具·大
				[2] = {nItemEnum = 3900090,nItemNumber = 1};	--9品宝石精华
				[3] = {nItemEnum = 2500345,nItemNumber = 1};	--紫薇星图
				[4] = {nItemEnum = 9405042,nItemNumber = 1};	--无极仙元丹·真
				[5] = {nItemEnum = 6300587,nItemNumber = 1};	--古玩志中级礼包
				[6] = {nItemEnum = 4900163,nItemNumber = 1};	--黄金碎片					
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[8] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_08.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500164,nItemNumber = 1};	--日常道具·大
				[2] = {nItemEnum = 3900100,nItemNumber = 1};	--10品宝石精华
				[3] = {nItemEnum = 2500345,nItemNumber = 1};	--紫薇星图
				[4] = {nItemEnum = 9405042,nItemNumber = 1};	--无极仙元丹·真
				[5] = {nItemEnum = 6300587,nItemNumber = 1};	--古玩志中级礼包
				[6] = {nItemEnum = 4900163,nItemNumber = 1};	--黄金碎片								
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};
		[9] = {
			--显示第N层的标题字和第N层的掉落
			sExplain = "img://gn_ttt_button_09.png";
			--每个boss奖励
			tAwardid = {
				[1] = {nItemEnum = 2500164,nItemNumber = 1};	--日常道具·大
				[2] = {nItemEnum = 3900100,nItemNumber = 1};	--10品宝石精华
				[3] = {nItemEnum = 2500345,nItemNumber = 1};	--紫薇星图
				[4] = {nItemEnum = 9405043,nItemNumber = 1};	--无极仙元丹·尊
				[5] = {nItemEnum = 6300587,nItemNumber = 1};	--古玩志中级礼包
				[6] = {nItemEnum = 4900163,nItemNumber = 1};	--黄金碎片										
			};
			PassMoney = 0,
			Gold = 0,
			Zhenqi = 0,
			Exp = 0,
			TimeLimit = 180, -- 单位 秒
		};

	};

	UI = {
		--玩法说明
		Explain = "1、玩家只需杀死BOSS即可进入下一层<br/>2、每层BOSS随机掉落奖励道具<br/>3、每周最快通关的玩家将会获得擂主奖励<br/>4、擂主奖励将通过邮件发放<br/>5、通天塔排名顺序为：挑战层数＞挑战时间＞最先录名<br/>";
		--错误提示信息
		Error = "您将继续挑战第%s层，是否继续？";
		Error1 = "重置需要消耗%s元宝";
		Error2 = "您当前尚未通关第一层，无需重置";
		Error3 = "大侠今日剩余重置次数不足，无法重置";
		Error4 = "本层已打通，如需再次挑战，请大侠重置挑战次数";
		Error5 = "寻路到下一层";
		Error6 = "击杀守关BOSS";
		--打通9层后结算提示
		txt2 = "恭喜您成功打通通天塔，用时最少的玩家将成为下一周的擂主。";
		--每天2点半点重置挑战次数
		txt1 = "<font color='#FF0000'>通天塔挑战及重置次数每日</font><font color='#31cf32'>6:00</font><font color='#FF0000'>刷新，玩家可通过挑战更高楼层获得丰厚奖励！</font>";
		--玩家通关某一层时
		broadcast_1 = "恭喜%s大侠打通通天塔第%s层，请再接再厉！";
		--玩家通关通天塔层时，
		broadcast_2 = "恭喜%s大侠成功打通通天塔，睥睨群雄，谁与争锋！";
		--玩家成为擂主时
		broadcast_3 = "恭喜%s大侠成为上周擂主，不愧为一代武林天骄！";

	};
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

	--默认系统信息
	tInfo = {
			nRoleId = 0;
			sName = "系统";
			nLayer = 1;
			nTime = 3600000;--毫秒
			nIconID = 1001; --头像ID
		};
	--检测是否是群侠副本
	IsTongTianTowerFB = function(duplID)
		return DuplConfig[duplID].dwID == TongTianTowerConfig.nDupl;
	end;

	--通天塔广播层数
	BroadcastLayer = {1,2,3,4,5,6,7,8,9,};
	BroadcastEnum = {
		Pass = 1,			-- 通关
		Champion = 2,		-- 成为上周擂主
	};

};