_G.PersonalEscortConfig = {
	Node = {
		[8070] = {--路线
			{mapid=8070,start={x=-142,y=-22},fin={x=119,y=-25},round=8};
		};

		[8071] = {--路线
			{mapid=8071,start={x=-142,y=-22},fin={x=119,y=-25},round=8};
		};
		
	},
	Npc = {
		mapid = 1002,x = -30.64,y = -91.60,
	},
	Avatar = {
		szStartNpcName = "恭叔 老镖头",
		dwStartNpcLook = 10021018,
		szEndNpcName = "林平直 镖师",
		dwEndNpcLook = 10011022,
	},
	Refresh = {
		Cost = function(objPlayer, dwRefreshTime, dwType, dwQuality)
		local gold = 0
		if dwRefreshTime < 5 then
		   gold = 0
		elseif dwRefreshTime == 5 then
		  gold = 3
		elseif dwRefreshTime == 6 then
		  gold = 6
		elseif dwRefreshTime == 7 then
		  gold = 9
		elseif dwRefreshTime == 8 then
		  gold = 12
		elseif dwRefreshTime == 9 then
		  gold = 15
		else
		  gold = 20
		end
			return gold;
		end,
		Result = function(objPlayer, dwRefreshTime, dwType, dwQuality)
		    local dwQuality = 1
			local value = math.random(1,10000)
			if value <= 3500 then
			   dwQuality = 1
			elseif value <= 6500 then
			   dwQuality = 2
			elseif value <= 8500 then
			   dwQuality = 3
			elseif value <= 9500  then
			   dwQuality = 4
			else
			   dwQuality = 5
			end
			return dwQuality;
		end,
	},
	Car = {
		[1] = {
			[1] = {
				Monster = {
					dwMonsterId = 111;dwAIId = 111;dwFightId = 111;dwDropId = -1;dwLook = 8001;dwLook_MN = 80010;
				};
				Reward = {
					dwExp = 1000000;dwPneuma = 2000;dwMoney = 100000;dwBindGold = 100;
					Item = {
						{dwItemId=5500070,dwNum=1,dwBind=1};{dwItemId=4900050,dwNum=1,dwBind=1};{dwItemId=5809325,dwNum=1,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 1000000;dwPneuma = 2000;dwMoney = 100000;dwBindGold = 100;
					Item = {
						{dwItemId=5500070,dwNum=1,dwBind=1};{dwItemId=4900050,dwNum=1,dwBind=1};{dwItemId=5809325,dwNum=1,dwBind=1};
					};
				},				
			},
			[2] = {
				Monster = {
					dwMonsterId = 111;dwAIId = 111;dwFightId = 111;dwDropId = -1;dwLook = 8001;dwLook_MN = 80010;
				};
				Reward = {
					dwExp = 1500000;dwPneuma = 3000;dwMoney = 150000;dwBindGold = 150;
					Item = {
						{dwItemId=5500070,dwNum=1,dwBind=1};{dwItemId=4900050,dwNum=2,dwBind=1};{dwItemId=5809325,dwNum=1,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 1500000;dwPneuma = 3000;dwMoney = 150000;dwBindGold = 150;
					Item = {
				       {dwItemId=5500070,dwNum=1,dwBind=1};{dwItemId=4900050,dwNum=2,dwBind=1};{dwItemId=5809325,dwNum=1,dwBind=1};
					};
				},				
			},
			[3] = {
				Monster = {
					dwMonsterId = 111;dwAIId = 111;dwFightId = 111;dwDropId = -1;dwLook = 8001;dwLook_MN = 80010;
				};
				Reward = {
					dwExp =2250000;dwPneuma = 4500;dwMoney = 220000;dwBindGold = 225;
					Item = {
					{dwItemId=5500070,dwNum=1,dwBind=1};{dwItemId=4900050,dwNum=3,dwBind=1};{dwItemId=5809325,dwNum=1,dwBind=1};{dwItemId=4100420,dwNum=1,dwBind=1};
					};
				},
				OtherReward = {
					dwExp =2250000;dwPneuma = 4500;dwMoney = 220000;dwBindGold = 225;
					Item = {
					{dwItemId=5500070,dwNum=1,dwBind=1};{dwItemId=4900050,dwNum=3,dwBind=1};{dwItemId=5809325,dwNum=1,dwBind=1};{dwItemId=4100420,dwNum=1,dwBind=1};
					};
				},				
			},
			[4] = {
				Monster = {
					dwMonsterId = 111;dwAIId = 111;dwFightId = 111;dwDropId = -1;dwLook = 8001;dwLook_MN = 80010;
				};
				Reward = {
					dwExp = 3370000;dwPneuma = 6750;dwMoney = 330000;dwBindGold = 337;
					Item = {
					{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=4,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};{dwItemId=4100420,dwNum=2,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 3370000;dwPneuma = 6750;dwMoney = 330000;dwBindGold = 337;
					Item = {
					{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=4,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};{dwItemId=4100420,dwNum=2,dwBind=1};
					};
				},				
			},
			[5] = {
				Monster = {
					dwMonsterId = 111;dwAIId = 111;dwFightId = 111;dwDropId = -1;dwLook = 8001;dwLook_MN = 80010;
				};
				Reward = {
					dwExp = 5050000;dwPneuma = 10125;dwMoney = 490000;dwBindGold = 505;
					Item = {
					{dwItemId=5500070,dwNum=4,dwBind=1};{dwItemId=4900050,dwNum=6,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};{dwItemId=4100420,dwNum=3,dwBind=1};{dwItemId=5501131,dwNum=1,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 5050000;dwPneuma = 10125;dwMoney = 490000;dwBindGold = 505;
					Item = {
					{dwItemId=5500070,dwNum=4,dwBind=1};{dwItemId=4900050,dwNum=6,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};{dwItemId=4100420,dwNum=3,dwBind=1};{dwItemId=5501131,dwNum=1,dwBind=1};
					};
				},				
			},
		},
		[2] = {
	
			[1] = {
				Monster = {
					dwMonsterId = 112;dwAIId = 112;dwFightId = 112;dwDropId = -1;dwLook = 8002;dwLook_MN = 80020;
				};
				Reward = {
					dwExp = 2000000;dwPneuma = 5000;dwMoney = 200000;dwBindGold = 150;
					Item = {
						{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=2,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 2000000;dwPneuma = 5000;dwMoney = 200000;dwBindGold = 150;
					Item = {
						{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=2,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};
					};
				},				
			},
			[2] = {
				Monster = {
					dwMonsterId = 112;dwAIId = 112;dwFightId = 112;dwDropId = -1;dwLook = 8002;dwLook_MN = 80020;
				};
				Reward = {
					dwExp = 3000000;dwPneuma = 7500;dwMoney = 300000;dwBindGold = 225;
					Item = {
						{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=3,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 3000000;dwPneuma = 7500;dwMoney = 300000;dwBindGold = 225;
					Item = {
						{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=3,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};
					};
				},				
			},
			[3] = {
				Monster = {
					dwMonsterId = 112;dwAIId = 112;dwFightId = 112;dwDropId = -1;dwLook = 8002;dwLook_MN = 80020;
				};
				Reward = {
					dwExp = 4500000;dwPneuma = 11250;dwMoney = 450000;dwBindGold = 337;
					Item = {
						{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=4,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};{dwItemId=4100420,dwNum=2,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 4500000;dwPneuma = 11250;dwMoney = 450000;dwBindGold = 337;
					Item = {
						{dwItemId=5500070,dwNum=2,dwBind=1};{dwItemId=4900050,dwNum=4,dwBind=1};{dwItemId=5809325,dwNum=2,dwBind=1};{dwItemId=4100420,dwNum=2,dwBind=1};
					};
				},				
			},
			[4] = {
				Monster = {
					dwMonsterId = 112;dwAIId = 112;dwFightId = 112;dwDropId = -1;dwLook = 8002;dwLook_MN = 80020;
				};
				Reward = {
					dwExp = 6750000;dwPneuma = 16875;dwMoney = 670000;dwBindGold = 505;
					Item = {
		            {dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=6,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};{dwItemId=4100420,dwNum=3,dwBind=1};{dwItemId=5501131,dwNum=1,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 6750000;dwPneuma = 16875;dwMoney = 670000;dwBindGold = 505;
					Item = {
				    {dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=6,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};{dwItemId=4100420,dwNum=3,dwBind=1};{dwItemId=5501131,dwNum=1,dwBind=1};
					};
				},				
			},
			[5] = {
				Monster = {
					dwMonsterId = 112;dwAIId = 112;dwFightId = 112;dwDropId = -1;dwLook = 8002;dwLook_MN = 80020;
				};
				Reward = {
					dwExp = 10120000;dwPneuma = 25312;dwMoney = 1000000;dwBindGold = 757;
					Item = {
					{dwItemId=5500070,dwNum=5,dwBind=1};{dwItemId=4900050,dwNum=8,dwBind=1};{dwItemId=5809325,dwNum=4,dwBind=1};{dwItemId=4100420,dwNum=4,dwBind=1};{dwItemId=5501131,dwNum=2,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 10120000;dwPneuma = 25312;dwMoney = 1000000;dwBindGold = 757;
					Item = {
				    {dwItemId=5500070,dwNum=5,dwBind=1};{dwItemId=4900050,dwNum=8,dwBind=1};{dwItemId=5809325,dwNum=4,dwBind=1};{dwItemId=4100420,dwNum=4,dwBind=1};{dwItemId=5501131,dwNum=2,dwBind=1};
					};
				},				
			},			
		},	
		[3] = {
	
			[1] = {
				Monster = {
					dwMonsterId = 113;dwAIId = 113;dwFightId = 113;dwDropId = -1;dwLook = 8003;dwLook_MN = 80030;
				};
				Reward = {
					dwExp = 3000000;dwPneuma = 10000;dwMoney = 300000;dwBindGold = 200;
					Item = {
						{dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=3,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 3000000;dwPneuma = 10000;dwMoney = 300000;dwBindGold = 200;
					Item = {
						{dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=3,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};
					};
				},				
			},
			[2] = {
				Monster = {
					dwMonsterId = 113;dwAIId = 113;dwFightId = 113;dwDropId = -1;dwLook = 8003;dwLook_MN = 80030;
				};
				Reward = {
					dwExp = 4500000;dwPneuma = 15000;dwMoney = 450000;dwBindGold = 300;
					Item = {
				    {dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=4,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 4500000;dwPneuma = 15000;dwMoney = 450000;dwBindGold = 300;
					Item = {
					{dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=4,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};
					};
				},				
			},
			[3] = {
				Monster = {
					dwMonsterId = 113;dwAIId = 113;dwFightId = 113;dwDropId = -1;dwLook = 8003;dwLook_MN = 80030;
				};
				Reward = {
					dwExp = 6750000;dwPneuma = 22500;dwMoney = 670000;dwBindGold = 450;
					Item = {
					{dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=5,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};{dwItemId=4100420,dwNum=3,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 6750000;dwPneuma = 22500;dwMoney = 670000;dwBindGold = 450;
					Item = {
					{dwItemId=5500070,dwNum=3,dwBind=1};{dwItemId=4900050,dwNum=5,dwBind=1};{dwItemId=5809325,dwNum=3,dwBind=1};{dwItemId=4100420,dwNum=3,dwBind=1};
					};
				},				
			},
			[4] = {
				Monster = {
					dwMonsterId = 113;dwAIId = 113;dwFightId = 113;dwDropId = -1;dwLook = 8003;dwLook_MN = 80030;
				};
				Reward = {
					dwExp = 10120000;dwPneuma = 33750;dwMoney = 1000000;dwBindGold = 675;
					Item = {
						{dwItemId=5500070,dwNum=4,dwBind=1};{dwItemId=4900050,dwNum=7,dwBind=1};{dwItemId=5809325,dwNum=4,dwBind=1};{dwItemId=4100420,dwNum=4,dwBind=1};{dwItemId=5501131,dwNum=1,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 10120000;dwPneuma = 33750;dwMoney = 1000000;dwBindGold = 675;
					Item = {
						{dwItemId=5500070,dwNum=4,dwBind=1};{dwItemId=4900050,dwNum=7,dwBind=1};{dwItemId=5809325,dwNum=4,dwBind=1};{dwItemId=4100420,dwNum=4,dwBind=1};{dwItemId=5501131,dwNum=1,dwBind=1};
					};
				},				
			},
			[5] = {
				Monster = {
					dwMonsterId = 113;dwAIId = 113;dwFightId = 113;dwDropId = -1;dwLook = 8003;dwLook_MN = 80030;
				};
				Reward = {
					dwExp = 15180000;dwPneuma = 50625;dwMoney = 1500000;dwBindGold = 1012;
					Item = {
					{dwItemId=5500070,dwNum=6,dwBind=1};{dwItemId=4900050,dwNum=10,dwBind=1};{dwItemId=5809325,dwNum=5,dwBind=1};{dwItemId=4100420,dwNum=5,dwBind=1};{dwItemId=5501131,dwNum=2,dwBind=1};
					};
				},
				OtherReward = {
					dwExp = 15180000;dwPneuma = 50625;dwMoney = 1500000;dwBindGold = 1012;
					Item = {
					{dwItemId=5500070,dwNum=6,dwBind=1};{dwItemId=4900050,dwNum=10,dwBind=1};{dwItemId=5809325,dwNum=5,dwBind=1};{dwItemId=4100420,dwNum=5,dwBind=1};{dwItemId=5501131,dwNum=2,dwBind=1};
					};
				},				
			},			
		},			
	},
	Icon = {
		[1] = "gryb_pz_01.png",--一级品质
		[2] = "gryb_pz_02.png",--二级品质
		[3] = "gryb_pz_03.png",--三级品质
		[4] = "gryb_pz_04.png",--四级品质
		[5] = "gryb_pz_05.png",--五级品质
		
		[11] = "Qita_money.png",--银两
		[12] = "Qita_exp.png",--经验
		[13] = "Qita_zhenqi.png",--真气
		[14] = "Qita_lijin.png",--礼金
	},
	String = {
		[1] = "当前镖车数量：<font color='#D9CCBD'>%d/%d</font>",
		[2] = "%d小时%d分钟后刷新",
		[3] = "今日出镖次数：<font color='#D9CCBD'>%d/%d</font>",
		[4] = "免费刷新次数：<font color='#D9CCBD'>%d/%d</font>",
		[5] = "刷新花费：<font color='#D9CCBD'>%d元宝</font>",
		[6] = "今日交镖次数：<font color='#D9CCBD'>%d/%d</font>",
		[7] = "交镖次数为每日在终点提交镖车的次数，<br>当可提交镖次数小于1无法出镖或劫镖。",
		
		[11] = "银两：<font color='#D9CCBD'>%d</font>",
		[12] = "经验：<font color='#D9CCBD'>%d</font>",
		[13] = "真气：<font color='#D9CCBD'>%d</font>",
		[14] = "礼金：<font color='#D9CCBD'>%d</font>",
		
		[21] = "抢镖",
		[22] = "押镖",
		
		[31] = "未选中镖车",
		[32] = "行镖江湖还没有开启",
		[33] = "出镖次数已达到上限",
		[34] = "交镖次数已达到上限",
		[35] = "镖车已经被抢空",
		
		[41] = "花费<font color='#FF6100'>%d</font>元宝购买该镖车（若已有镖车，将被替换），是否继续？",
		[42] = "本次刷新需要消耗<font color='#FF6100'>%d</font>元宝，有概率出现高品质镖车，是否继续？",
		[43] = "当前的镖车已经是高品质镖车，是否还要继续刷新？",
		
		[51] = "<font color='#E3170D'>『<b>行镖江湖</b>』</font>恭喜大侠%s",
		[52] = "玩家%s成功抢劫了玩家%s的镖车",
		[53] = "<font color='#E3170D'>『<b>行镖江湖</b>』</font>行镖江湖将于<font color='#00FF00'>%d分钟</font>后开启，各位大侠可前往襄阳城<font color='#00FF00'>牛冲天</font>处进入行镖江湖地图",
		[54] = "<font color='#E3170D'>『<b>行镖江湖</b>』</font>新的一批镖车将于<font color='#00FF00'>%d分钟</font>后准备就绪，有意走镖的侠士请速速前往行镖江湖地图<font color='#00FF00'>恭叔</font>处领取镖车",
		[55] = "立即前往",
		[56] = "刷新出%s品质的镖车",
		
		[61] = "[%s](X:%d,Y:%d)",
		[62] = "押镖剩余时限(%02d:%02d)",
		[63] = "%s %s",
		[64] = "<font  color='#DCB857'>小提示：</font><br><br><font color='#D9CCBD'>1.镖车的品质分为：白色、绿色、蓝色、紫色、金色，品质越高，奖励越好！<br>2.玩家的剩余的交镖次数大于0，才可以发镖或劫镖。</font>",
		
		[71] = "<font color='#00FF00' size='15'><u>牛冲天</u></font>",
		[72] = "<font color='#D9CCBD' size='15'>每日15:00-16:00襄阳城震威镖局总镖头%s将持续招募各路侠士，进入行镖江湖地图赶趟走镖。</font>",
		[73] = "<font color='#D9CCBD' size='15'>与地图内恭叔对话打开押镖界面，通过抢镖获得镖车，然后护送镖车上路。<font color='#00FF00'>（刷新镖车的品质可能获得更高的收益，品质越高，收益越高）</font></font>",
		[74] = "<font color='#D9CCBD' size='15'>保护镖车前进，将它护送到镖师林平直处。<font color='#00FF00'>（小心慢行，镖车只有在你的保护范围内才会跟随前进）</font></font>",
		[75] = "<font color='#D9CCBD' size='15'>小心路上有恶人前来劫镖！<font color='#00FF00'>（若已有待押运或正在押运的镖车，或剩余交镖次数小于1次者，则无法通过击杀其他玩家获得镖车）</font></font>",
		[76] = "<font color='#D9CCBD' size='15'>当你与镖师林平直会师的那一刻，本趟走镖的报酬也就到手了！<font color='#00FF00'>（奖励将直接送入背包内，若背包空间不足，则以邮件形式发放）</font></font>",
		--[77] = "镖车的品质分为：<font color='#FFFFFF'>白色</font>-<font color='#00FF00'>绿色</font>-<font color='#0000FF'>蓝色</font>-<font color='#A020F0'>紫色</font>-<font color='#FFD700'>金色</font>，品质越高，获得奖励越多！",
		
		[81] = "<font color='#E3170D'>『<b>行镖江湖</b>』</font>玩家<font color='#31CF32'>%s</font>击杀玩家<font color='#31CF32'>%s</font>，抢回属于自己的镖车",
		[82] = "<font color='#E3170D'>『<b>行镖江湖</b>』</font>玩家<font color='#31CF32'>%s</font>击杀玩家<font color='#31CF32'>%s</font>，抢到玩家<font color='#31CF32'>%s</font>的镖车",
		
		[91] = "<font color='#FFFFFF'>白色</font>",
		[92] = "<font color='#00FF00'>绿色</font>",
		[93] = "<font color='#31CF32'>蓝色</font>",
		[94] = "<font color='#A020F0'>紫色</font>",
		[95] = "<font color='#FFD700'>金色</font>",
		
		[101] = "一级镖车",
		[102] = "二级镖车",
		[103] = "三级镖车",
	},
}



--镖车刷新信息
_G.RefreshMonster = {
	[8070] = {[1] = {dwMonsterId = 111, dwQuality = 1, dwNum = 25, dwGold = 2},
			  [2] = {dwMonsterId = 112, dwQuality = 2, dwNum = 2, dwGold = 36},
			  [3] = {dwMonsterId = 113, dwQuality = 3, dwNum = 1, dwGold = 88},
			 },
	
	[8071] = {[1] = {dwMonsterId = 111, dwQuality = 1, dwNum = 25, dwGold = 2},
			  [2] = {dwMonsterId = 112, dwQuality = 2, dwNum = 2, dwGold = 36},
			  [3] = {dwMonsterId = 113, dwQuality = 3, dwNum = 1, dwGold = 88},
			 },
	
}

--镖车刷新时间
_G.RefreshMonsterTime = {
	dwFirstWarn = 3;--第一次公告早于镖车更新的时间
	dwWarnTime = "14:57";
	dwStartTime = "15:00";
	dwEndTime = "16:00";
	dwUpdateTime = "06:00";  --个人押镖数据刷新时间 晚于结束时间一分钟
	dwLength = 1; --小时、活动持续时间
	dwSpaceTime = 5; --分钟、镖车刷新间隔
	dwWarnSpaceTime = 1;  --公告早于镖车更新的时间
}

_G.EscortConfig = 
{
	dwEscortSendPosTick = 5 * 1000;--镖车位置广播的间隔
	dwFollowDis = 12;--家主距离
	dwFailTime = 30*60*1000;--多久后失败（毫秒）
	dwFailNoticeTime = 10*60*1000;--离超时失败剩余多少时间进行通知
	dwNoticeLeaderLength = 10* 1000;--通知会长离开镖车过远的时间间隔
	dwLeaderFailTime = 5*60*1000;--离开镖车后，多少时间失败
	
	Notice = {
	    [13001310003]= 10 *1000;
		[13001310004]= 2*60*1000;	
		[13001310007]= 2*60*1000;
		
	};
}

_G.EscortOtherInfo = {
	--战场id
	GetWarId = function(objPlayer)
		local warId = 0;
		local dwLevel = objPlayer:GetInfo().dwLevel;
		if dwLevel >= 45 and dwLevel <= 65 then
			warId = 10050
		elseif dwLevel > 65 then
			warId = 10051
		end;
		return warId;
	end;
	--免费刷新品质次数
	FreeRefreshQuality = 5;
	--每天押镖次数
	RunEscortNum = 1;
	--每天交镖次数
	ShellEscortNum = 2;
	--奖励系数
	GetAwardParam = function(lifeTime)
		return 1;
	end;
	--刷新品质公告
	RefreshQuality = 4;
}

_G.EscortMailMsg = {
	[1] = "行镖江湖",
	[2] = "押镖奖励",
	[3] = "由于您背包已满，系统已自动将押镖奖励以邮件的形式发放，请及时收取道具奖励，避免不必要损失！"
}
