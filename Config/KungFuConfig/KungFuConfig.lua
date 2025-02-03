--[[
	--功法易筋经Config
	--作者：张云华
	--时间：2013-8-27
]]

--功法系统分页签
_G.KungFuList = {
	szTextBless = "<font color='#FFFF00'>领悟失败会增加赐福值，赐福值越高则下次领悟成功几率越高，</font></font><font color='#FF0000'>每日凌晨6:00会准时清空赐福值，为了避免您的损失，请在此期间完成领悟。</font>",
	-------------------------------------------------------------------------------------------------------------------------------------------------------------
	--易筋经显示技能
	yiJinJingShowInfo = {
		name = "<font color='#03B3FD'>抵御·断骨</font>",
		tips = "<font color='#FFFF00'>触发宝甲效果时有一定几率<font color='#00FF00'>抵御名剑剑气·断骨</font>效果</font>",
		desc = "<font color='#4daeed'>使用”法身降魔咒”可解除七杀心经所造成的沉默效果，并在随后短时间内免受七杀心经所困。</font><font color='#FFFF00'>【将技能图标放入快捷栏，按下快捷键使用】</font>",
	},
	--以下是易筋经
	[1] = {
		name = "易筋经";
		describe = "<font color='#CBC4C2'>易筋经相传为达摩祖师所创，“易”是变通、改换、脱换之意，“筋”指筋骨、筋膜，“经”则带有指南、法典之意。佛祖以挽回斡旋之法，俾筋挛者易之以舒，筋弱者易之以强，筋弛者易之以和，筋缩者易之以长，筋靡者易之以壮。身之利也，圣之基也。若能依照功法而行之，则可脱胎换骨，乃成万劫不化之身，方是金刚之体矣。</font>",
		MaterialDescribe = "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.商城购买，活动赠送<br/>2.击杀BOSS有几率掉落<br/>";
		backGroundPic = "yjj_bj.jpg";
		--发送广播的起始招式
		beginBroadcastZhaoshiID = 4;
		isUseMoney = false; -->是否使用礼金
		zhaoshi = {
			[1] = {
				picUrl = "1.png";
				szName = "韦驮献杵"; ----商业化活动显示用
				addAttr = {n_ShengMing=160,n_NeiLi=15,n_GongJi=40,n_FangYu=16,n_BaoJi=0,n_ShenFa=0,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_01_ZhanShi.san|A_UI_YiJinJing_01_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_UI_YiJinJing_01_DaiJi.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_01_DaiJi.san|A_UI_YiJinJing_01_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_UI_YiJinJing_01_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 1, [13022] = 1,[13020] = 0,[13018] = 0,[13024] = 0,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 1,};
				lingWuZhuFu = {tWinOdds = 6000, minLimit = 9, maxLimit = 10,};
				
				--技能层数等于0 代表未激活
				addSkill = {[61003] = 0,};
			},
			[2] = {
				picUrl = "2.png";
				szName = "金刚怒目"; ----商业化活动显示用
				addAttr = {n_ShengMing=520,n_NeiLi=30,n_GongJi=130,n_FangYu=52,n_BaoJi=0,n_ShenFa=0,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_02_ZhanShi.san|A_UI_YiJinJing_02_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book02_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_02_DaiJi.san|A_UI_YiJinJing_02_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 1, [13022] = 1,[13020] = 1,[13018] = 1,[13024] = 0,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 2,};
				lingWuZhuFu = {tWinOdds = 6000, minLimit = 32, maxLimit = 35,};
				addSkill = {[61003] = 0,};
			},
			[3] = {
				picUrl = "3.png";
				szName = "步步生莲"; ----商业化活动显示用
				addAttr = {n_ShengMing=1000,n_NeiLi=40,n_GongJi=250,n_FangYu=100,n_BaoJi=0,n_ShenFa=12,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_03_ZhanShi.san|A_UI_YiJinJing_03_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book03_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_03_DaiJi.san|A_UI_YiJinJing_03_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 1, [13022] = 1,[13020] = 1,[13018] = 1,[13024] = 1,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 2,};
				lingWuZhuFu = {tWinOdds = 6000, minLimit = 110, maxLimit = 130,};
				addSkill = {[61003] = 0,};
			},
			[4] = {
				picUrl = "4.png";
				szName = "拈花心传"; ----商业化活动显示用
				addAttr = {n_ShengMing=2080,n_NeiLi=61,n_GongJi=520,n_FangYu=208,n_BaoJi=20,n_ShenFa=26,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_04_ZhanShi.san|A_UI_YiJinJing_04_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book04_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_04_DaiJi.san|A_UI_YiJinJing_04_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 2, [13022] = 2,[13020] = 1,[13018] = 1,[13024] = 1,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 3,};
				lingWuZhuFu = {tWinOdds = 3500, minLimit = 350, maxLimit = 380,};
				addSkill = {[61003] = 1,};
			},
			[5] = {
				picUrl = "5.png";
				szName = "摩诃无量"; ----商业化活动显示用
				addAttr = {n_ShengMing=3200,n_NeiLi=84,n_GongJi=800,n_FangYu=320,n_BaoJi=32,n_ShenFa=40,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_05_ZhanShi.san|A_UI_YiJinJing_05_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book05_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_05_DaiJi.san|A_UI_YiJinJing_05_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 2, [13022] = 2,[13020] = 2,[13018] = 2,[13024] = 2,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 3,};
				lingWuZhuFu = {tWinOdds = 3000, minLimit = 700, maxLimit = 800,};
				addSkill = {[61003] = 2,};
			},
			[6] = {
				picUrl = "6.png";
				szName = "慈行普渡"; ----商业化活动显示用
				addAttr = {n_ShengMing=4600,n_NeiLi=112,n_GongJi=1150,n_FangYu=460,n_BaoJi=46,n_ShenFa=57,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_06_ZhanShi.san|A_UI_YiJinJing_06_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book06_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_06_DaiJi.san|A_UI_YiJinJing_06_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 3, [13022] = 3,[13020] = 2,[13018] = 2,[13024] = 2,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 4,};
				lingWuZhuFu = {tWinOdds = 2000, minLimit = 1350, maxLimit = 1500,};
				addSkill = {[61003] = 3,};
			},
			[7] = {
				picUrl = "7.png";
				szName = "八相成道"; ----商业化活动显示用
				addAttr = {n_ShengMing=7200,n_NeiLi=164,n_GongJi=1800,n_FangYu=720,n_BaoJi=72,n_ShenFa=90,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_07_ZhanShi.san|A_UI_YiJinJing_07_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book06_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_07_DaiJi.san|A_UI_YiJinJing_07_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 3, [13022] = 3,[13020] = 3,[13018] = 3,[13024] = 2,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 4,};
				lingWuZhuFu = {tWinOdds = 2000, minLimit = 2300, maxLimit = 2600,};
				addSkill = {[61003] = 4,};
			},
			[8] = {
				picUrl = "8.png";
				szName = "五蕴皆空"; ----商业化活动显示用
				addAttr = {n_ShengMing=12000,n_NeiLi=260,n_GongJi=3000,n_FangYu=1200,n_BaoJi=120,n_ShenFa=150,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_08_ZhanShi.san|A_UI_YiJinJing_08_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book06_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_08_DaiJi.san|A_UI_YiJinJing_08_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 3, [13022] = 3,[13020] = 3,[13018] = 3,[13024] = 3,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 5,};
				lingWuZhuFu = {tWinOdds = 1500, minLimit = 2850, maxLimit = 2950,};
				addSkill = {[61003] = 5,};
			},
			[9] = {
				picUrl = "9.png";
				szName = "枯荣由它"; ----商业化活动显示用
				addAttr = {n_ShengMing=20800,n_NeiLi=436,n_GongJi=5200,n_FangYu=2080,n_BaoJi=208,n_ShenFa=260,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_09_ZhanShi.san|A_UI_YiJinJing_09_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book06_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_09_DaiJi.san|A_UI_YiJinJing_09_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 4, [13022] = 4,[13020] = 3,[13018] = 3,[13024] = 3,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 5,};
				lingWuZhuFu = {tWinOdds = 1500, minLimit = 4200, maxLimit = 4500,};
				addSkill = {[61003] = 6,};
			},
			[10] = {
				picUrl = "10.png";
				szName = "常乐我净"; ----商业化活动显示用
				addAttr = {n_ShengMing=31200,n_NeiLi=644,n_GongJi=7800,n_FangYu=3120,n_BaoJi=312,n_ShenFa=390,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_10_ZhanShi.san|A_UI_YiJinJing_10_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book06_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_10_DaiJi.san|A_UI_YiJinJing_10_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 4, [13022] = 4,[13020] = 4,[13018] = 4,[13024] = 4,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 6,};
				lingWuZhuFu = {tWinOdds = 1000, minLimit = 6050, maxLimit = 6250,};
				addSkill = {[61003] = 7,};
			},
			[11] = {
				picUrl = "11.png";
				szName = "娑婆世界"; ----商业化活动显示用
				addAttr = {n_ShengMing=46400,n_NeiLi=948,n_GongJi=11600,n_FangYu=4640,n_BaoJi=464,n_ShenFa=580,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_11_ZhanShi.san|A_UI_YiJinJing_11_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book06_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_11_DaiJi.san|A_UI_YiJinJing_11_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 5, [13022] = 5,[13020] = 5,[13018] = 5,[13024] = 5,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 8,};
				lingWuZhuFu = {tWinOdds = 800, minLimit = 7600, maxLimit = 7900,};
				addSkill = {[61003] = 8,};
			},
			[12] = {
				picUrl = "12.png";
				szName = "即心即佛"; ----商业化活动显示用
				addAttr = {n_ShengMing=64000,n_NeiLi=1300,n_GongJi=16000,n_FangYu=6400,n_BaoJi=640,n_ShenFa=800,};
				model = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_12_ZhanShi.san|A_UI_YiJinJing_12_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_Practice_Book06_daiji.san"; 
				};
				model_idle = {	
					sknFile = "A_UI_YiJinJing.skn"; sklFile="A_UI_YiJinJing.skl"; sanFile ="A_UI_YiJinJing_12_DaiJi.san|A_UI_YiJinJing_12_DaiJi.tag"; param_1_x = 0; param_1_y =-16; param_1_z = 2.0;param_2_x = 0; param_2_y = 0; param_2_z = 0.0; lieAction = "A_NPC_Equip_BaoJian_DaiJi.san"; 
				};
				intensifySkill = {[13026] = 6, [13022] = 6,[13020] = 6,[13018] = 6,[13024] = 6,};
				upLevelNeed = {itemEnumId = 4100430, itemCount = 10,};
				lingWuZhuFu = {tWinOdds = 500, minLimit = 9800, maxLimit = 10200,};
				addSkill = {[61003] = 9,};
			},
		};
	},

	
	--获取当前招式对应的技能等级
	GetAddSkillLevel = function(curKungFu,curZhaoShi)
		if not curKungFu or not curZhaoShi then return; end
		if not _G.KungFuList[curKungFu] or not _G.KungFuList[curKungFu].zhaoshi then return; end
		local zhaoshi = _G.KungFuList[curKungFu].zhaoshi;
		for itemId,level in pairs(zhaoshi[curZhaoShi].addSkill) do
			if itemId then
				return level;
			end
		end
		return nil;
	end;
	-------------------------------------------------------------------------------------------------------------------------------------------------------------
	--以下是公用函数
	
	S_SuccessRate = function(kungFuId, zhaoshiId, nTGCFValue)
		if kungFuId == 0 or zhaoshiId == 0 then return 0; end
		local  successRateCfg = KungFuList[kungFuId].zhaoshi[zhaoshiId].lingWuZhuFu;
		local dwWinOdds = 0;
		if not successRateCfg then
			dwWinOdds = 0 ;
		end ;
		
		dwWinOdds 	= successRateCfg.tWinOdds ;

		--底限
		local nMinLimit 	= successRateCfg.minLimit ;
		
		if nMinLimit then
			if nTGCFValue <= nMinLimit then
				dwWinOdds 	= 0	;
			end
		end	;

		--保底
		local nMaxLimit 	= successRateCfg.maxLimit;
		if nMaxLimit then
			if nTGCFValue >= nMaxLimit then
				dwWinOdds 	= 10000	;
			end
		end	;
		
		return dwWinOdds ;
	end	;
	--获取升阶成功率(显示相关)
	GetSuccessRateStr = function(dwSuccessRate)
		local RateText = "普通";
		
		return RateText;
	end
	
}

--提示信息
_G.KungFuErratConfig = {
	szNotQueue = "<font color='#FFFFFF'>您上级招式尚未练成</font>",
	szUnderstanded = "<font color='#FFFFFF'>您已领悟当前招式</font>",
	szNotUnderstand = "您还未领悟易筋经招式",
	szMaxTrace = "<font color='#FFFFFF'>您已领悟所有易筋经招式</font>",
	szFullTrace = "已领悟所有招式",
	szNotMaterial = "<font color='#FFFFFF'>您包裹中的消耗材料不足，无法进行领悟</font>",
	AutoBuyNoRoom = _G.SysStringConfigInfo[7000110018],
	AutoBuyNoMoney	= _G.SysStringConfigInfo[7000110019]; --自动购买元宝不足
	UpGradeSuccess = "恭喜大侠成功领悟%s第%d式!"; --"您成功完成%s%d式到%d式领悟", --升阶成功提示
	UpGradeFailed = "<font color='#FFFFFF'>您本次领悟未成功,请再接再厉</font>", --升阶失败提示
	CannotViewSelf = "<font color='#FFFFFF'>大侠无需在此查看您的功法</font>",
	PlayerNotOnLine = "<font color='#FFFFFF'>对方还未开启易筋经，无法查看</font>",
	PlayerNotOnLine1 = "<font color='#FFFFFF'>对方还未领悟易筋经，无法查看</font>",
	NotUnderstanded = "未领悟易筋经招式",
	szForbid = "<font color='#FFFFFF'>您还未到达主线%d级</font>",
	understandedTrace = "已领悟-第%s式",
	skillLevel = "层",
}

--功法模型大小配置
_G.KungFuListModelRang = {
	YiJinJingAvatarRect = {x = 1250, y = 1250},
	Backcolor = 0x004d8b9f,
}

--技能提示悬浮框
_G.YiJinJingSkillTips = {
	AllZhaoShiText = _G.SkillStringConfig[6100350]; -->所有招式文本
}

--系统公告提示
_G.YiJinJingBroadcastConfig = {
	[1] = "恭喜大侠:%s 成功领悟第%d式易筋经招式！",
	[2] = "恭喜大侠:%s 成功领悟全部易筋经招式！",
}