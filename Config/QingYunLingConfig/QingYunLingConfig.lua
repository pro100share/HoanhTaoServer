--[[
	[ 青云勋章系统配置文件
	[ 路广华，赵飞
	[ 2014-3-27
	[ 青云勋章系统
--]]

_G.CloudMedalConfig = {
	--一些文字信息
	Text = {
			RefreshNotice = "是否消耗 %d 个元宝刷新奖励";
			RefreshSameNotice = "存在相同奖励，可获得额外的经验奖励，刷新可能导致额外的奖励损失";
			ItemLess = "玩家青云碎片数量不足";
			ItemLess2 = "玩家元宝数量不足";
			Unit1 = ":%s/%s个";															--界面1，消耗品的数量信息，充足时
			Unit2 = ":<font color = '#FF0000'>%s/%s</font>个";							--界面1，消耗品的数量信息，不足时
			Unit3 = " 倍";																--界面1，下拉条的倍数
			Level = "LV %s";															--界面2，印章等级信息
			YinZhangName = "<p align = 'center'>%s</p>";								--界面1，奖品上tips，“长生印纹.珍” | 界面2，勋章上的tips，中间名称“稀有勋章”
																						--界面2，印章上tips，中间名称 “长生印纹.珍”
			AddShuXing = "<p align = 'left'><font color = '#FFFFFF'>%s</font></p>";		--增加属性的格式,就是“当前属性加成” 或 "增加属性" 的格式
			ShuXing1 = "当前属性加成";													--界面1 套装按钮“增加属性”
			ShuXing2 = "增加属性";														--界面1 总属性加成的“增加属性”
			WZNameJH = "<p align = 'left'><font color = '#ff9900'>%s(%s)</font></p>";	--界面1，套装btn tips，激活状态的显示格式。即： 奇珍勋章（已满阶）
			WZNameWJH = "<p align = 'left'><font color = '#00FF00'>%s(%s)</font></p>";	--界面1，套装btn tips，未激活状态的显示格式。即： 奇珍勋章（未激活）
			CanNot = "未激活";															--勋章“未激活”的状态
			JiHuo = "已激活";															--勋章“已激活”的状态					
			ManJie = "已满阶";															--勋章“已满阶”的状态
			HuoDe = "<font color = '#00FF00'>已获得";															--勋章“已获得”的状态
			YinZhang = "<p align = 'left'><font color = '#00FF00'>已获得勋章:%d个</font></p>";	--界面1 套装btn tips，“已获得勋章：1个”
			DianJi = "<p align = 'center'><font color = '#FFFFFF'>点击可打开青云勋章界面</p>";					--入口tips，最后一行
			Failure = "摇奖失败";														--摇奖失败的提示信息
			Full = "恭喜您，您的所有勋章已经满级！";									--开启的勋章满级后，点击摇奖的提示信息
			ClickOpen = "<p align = 'center'><font color = '#FFFFFF'><br/>点击可查看勋章</p>";						--界面1，套装btn tips上最下边一行；
			
			
			Title = "<p align = 'center'>青云勋章</p>";									--青云勋章标题，即“青云勋章”
			NotGet = "尚未获得青云勋章";												--总属性上，没有属性加成时的提示。
			NotGetThis = "<p align = 'left'><font color = '#FFFFFF'>尚未获得该勋章</p>";				--界面2，激活但不满级的状态
			ExpAdd1 = "经验增加%d";														--界面1，经验跳字
			ExpAdd3 = "<p align = 'left'><font color='#ff9900'>经验：</font><font color='#ffffff'>%s</font></p>"; --界面1，奖品tips，“经验：100”
			
			ManJiYinWen = "<p align = 'left'><font color = '#00FF00'>满级印纹:%d/%d</font></p>";	--界面2，满级印纹:1/6
			YZJiHuo = "<p align = 'left'><font color = '#FFFFFF'>%s</font></p>";		--界面2，勋章tips，已激活的格式。/界面2，印章tips，激活的格式
			YZWeiJiHuo = "<p align = 'left'><font color = '#FF0000'>%s</font></p>";		--界面2，勋章tips，未激活的格式。|界面2，印章tips，未激活的格式
			
			TiaoJianFormat = "<p align = 'left'><font color = '#FFFFFF'>%s</font></p>"; --界面2，勋章tips，获得条件的格式
			HuoDeTiaoJian = "<br/>全部印纹达到LV 10可<br/>获得该勋章";								--界面2，勋章tips，第一阶的获得条件
			HuoDeTiaoJian2 = "<br/>获得<font color = '#00FF00'>%s</font>后可激活该勋章";									--界面2，勋章tips，二阶和以后的获得条件
			
			DengJi = "<p align = 'left'><font color='#ff9900'>等级：</font><font color='#ffffff'>%s</font></p>";	--界面2，印章tips，等级格式
			JingYan = "<p align = 'left'><font color='#ff9900'>经验：</font><font color='#ffffff'>%s/%s</font></p>";	--界面2，印章tips，经验格式
			XiaoGuo = "<font color='#00FF00'>激活可加成属性";													--界面2，印章tips，未激活的印章显示的文字。
			
			NoOpen = "勋章暂未开启，敬请期待";											--界面2，点击未开启的勋章的提示信息。
			NoOpenJS = "此处记录神秘勋章，期待大侠继续探索";							--界面2，勋章tips，未开启的勋章介绍。
			NoJiHuo = "勋章尚未激活，请大侠继续努力";									--界面2，点击未激活的勋章的提示信息。
			sBroadCast = "恭喜%s大侠的青云勋章激活%s，闯荡江湖再添一份胜算！";		
	};
	
	--[[青云勋章玩法
		[标号1] = 标题；
		[标号2...] = 规则内容；
	]]
	RuleText = {
				[1] = "<p>勋章玩法：</p>";
				[2] = "<p>1.玩家每次摇奖消耗青云碎片。</p>";
				[3] = "<p>2.摇出的印纹有相同时，会有额外的经验加成。</p>";
				[4] = "<p>3.摇出的印纹可以使用元宝刷新，直到有相同的印纹出现。</p>";
				[5] = "<p>4.印纹到达Lv10后，将不会被摇出。</p>";
				[6] = "<p>5.本阶所有印纹满级后，勋章自动开启下一阶，直到满阶。</p>";
	};
	
	--[[纹章
		[纹章ID] = {
					Name = 印章名称；
					Gray = 灰色图标；
					Colours = 彩色图标；
		}
	]]
	WenZhang = {
				[1] = {
						Name   	  = "稀有勋章";
						Gray   	  = "img://gn_qyxz_csx_h.png";
						Colours   = "img://gn_qyxz_csx_l.png";
						TiaoZi    = "qyxx_xiyou__huode";
				};
				[2] = {
						Name   	  = "奇珍勋章";
						Gray   	  = "img://gn_qyxz_lhx_h.png";
						Colours   = "img://gn_qyxz_lhx_l.png";
						TiaoZi    = "qyxx_qizhen__huode";
				};
				[3] = {
						Name   	  = "秘宝勋章";
						Gray   	  = "img://gn_qyxz_hhm_h.png";
						Colours   = "img://gn_qyxz_hhm_l.png";
						TiaoZi    = "qyxx_mibao__huode";
				};
				[4] = {
						Name   	  = "真武勋章";
						Gray   	  = "img://gn_qyxz_ktx_h.png";
						Colours   = "img://gn_qyxz_ktx_l.png";
						TiaoZi    = "qyxx_zhenwu__huode";
				};
				[5] = {
						Name   	  = "神威勋章";
						Gray   	  = "img://gn_qyxz_lhz_h.png";
						Colours   = "img://gn_qyxz_lhz_l.png";
						TiaoZi    = "qyxx_shenwei__huode";
				};	
	};
	--[[印章
		[纹章阶段]	 = {
						[印章ID] = {
									Name = 印章名称；
									Gray = 灰色图标；
									Colours = 彩色图标；
									quanzhong = 权重值；
									xzexp = 增加的经验；
						}
		}
	]]
	YinZhang = {
			[1] = {
					[1] = {
							Name   	  = "长生印纹·稀";
							Gray   	  = "img://gn_qyxz_csx_h.png";
							Colours   = "img://gn_qyxz_csx_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[2] = {
							Name   	  = "瀚海印纹·稀";
							Gray   	  = "img://gn_qyxz_hhx_h.png";
							Colours   = "img://gn_qyxz_hhx_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[3] = {
							Name   	  = "开天印纹·稀";
							Gray   	  = "img://gn_qyxz_ktx_h.png";
							Colours   = "img://gn_qyxz_ktx_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[4] = {
							Name   	  = "沉崖印纹·稀";
							Gray   	  = "img://gn_qyxz_cyx_h.png";
							Colours   = "img://gn_qyxz_cyx_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[5] = {
							Name   	  = "疾空印纹·稀";
							Gray   	  = "img://gn_qyxz_jkx_h.png";
							Colours   = "img://gn_qyxz_jkx_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[6] = {
							Name   	  = "雳火印纹·稀";
							Gray   	  = "img://gn_qyxz_lhx_h.png";
							Colours   = "img://gn_qyxz_lhx_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
			};
			[2] = {
					[1] = {
							Name   	  = "长生印纹·珍";
							Gray   	  = "img://gn_qyxz_csz_h.png";
							Colours   = "img://gn_qyxz_csz_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[2] = {
							Name   	  = "瀚海印纹·珍";
							Gray   	  = "img://gn_qyxz_hhz_h.png";
							Colours   = "img://gn_qyxz_hhz_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[3] = {
							Name   	  = "开天印纹·珍";
							Gray   	  = "img://gn_qyxz_ktz_h.png";
							Colours   = "img://gn_qyxz_ktz_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[4] = {
							Name   	  = "沉崖印纹·珍";
							Gray   	  = "img://gn_qyxz_cyz_h.png";
							Colours   = "img://gn_qyxz_cyz_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[5] = {
							Name   	  = "疾空印纹·珍";
							Gray   	  = "img://gn_qyxz_jkz_h.png";
							Colours   = "img://gn_qyxz_jkz_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[6] = {
							Name   	  = "雳火印纹·珍";
							Gray   	  = "img://gn_qyxz_lhz_h.png";
							Colours   = "img://gn_qyxz_lhz_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
			};
			[3] = {
					[1] = {
							Name   	  = "长生印纹·秘";
							Gray   	  = "img://gn_qyxz_csm_h.png";
							Colours   = "img://gn_qyxz_csm_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[2] = {
							Name   	  = "瀚海印纹·秘";
							Gray   	  = "img://gn_qyxz_hhm_h.png";
							Colours   = "img://gn_qyxz_hhm_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[3] = {
							Name   	  = "开天印纹·秘";
							Gray   	  = "img://gn_qyxz_ktm_h.png";
							Colours   = "img://gn_qyxz_ktm_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[4] = {
							Name   	  = "沉崖印纹·秘";
							Gray   	  = "img://gn_qyxz_cym_h.png";
							Colours   = "img://gn_qyxz_cym_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[5] = {
							Name   	  = "疾空印纹·秘";
							Gray   	  = "img://gn_qyxz_jkm_h.png";
							Colours   = "img://gn_qyxz_jkm_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[6] = {
							Name   	  = "雳火印纹·秘";
							Gray   	  = "img://gn_qyxz_lhm_h.png";
							Colours   = "img://gn_qyxz_lhm_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
			};
			[4] = {
					[1] = {
							Name   	  = "长生印纹·真";
							Gray   	  = "img://gn_qyxz_cszh_h.png";
							Colours   = "img://gn_qyxz_cszh_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[2] = {
							Name   	  = "瀚海印纹·真";
							Gray   	  = "img://gn_qyxz_hhzh_h.png";
							Colours   = "img://gn_qyxz_hhzh_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[3] = {
							Name   	  = "开天印纹·真";
							Gray   	  = "img://gn_qyxz_ktzh_h.png";
							Colours   = "img://gn_qyxz_ktzh_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[4] = {
							Name   	  = "沉崖印纹·真";
							Gray   	  = "img://gn_qyxz_cyzh_h.png";
							Colours   = "img://gn_qyxz_cyzh_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[5] = {
							Name   	  = "疾空印纹·真";
							Gray   	  = "img://gn_qyxz_jkzh_h.png";
							Colours   = "img://gn_qyxz_jkzh_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[6] = {
							Name   	  = "雳火印纹·真";
							Gray   	  = "img://gn_qyxz_lhzh_h.png";
							Colours   = "img://gn_qyxz_lhzh_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
			};
			[5] = {
					[1] = {
							Name   	  = "长生印纹·神";
							Gray   	  = "img://gn_qyxz_css_h.png";
							Colours   = "img://gn_qyxz_css_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[2] = {
							Name   	  = "瀚海印纹·神";
							Gray   	  = "img://gn_qyxz_hhs_h.png";
							Colours   = "img://gn_qyxz_hhs_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[3] = {
							Name   	  = "开天印纹·神";
							Gray   	  = "img://gn_qyxz_kts_h.png";
							Colours   = "img://gn_qyxz_kts_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[4] = {
							Name   	  = "沉崖印纹·神";
							Gray   	  = "img://gn_qyxz_cys_h.png";
							Colours   = "img://gn_qyxz_cys_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[5] = {
							Name   	  = "疾空印纹·神";
							Gray   	  = "img://gn_qyxz_jks_h.png";
							Colours   = "img://gn_qyxz_jks_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
					[6] = {
							Name   	  = "雳火印纹·神";
							Gray   	  = "img://gn_qyxz_lhs_h.png";
							Colours   = "img://gn_qyxz_lhs_l.png";
							quanzhong = 1000;
							xzexp 	  = 100;
					};
			};
	};

	--[[印章属性
		[印章ID] = {
						[等级] = {
								  dwExp    = 达到该勋章的经验；
								  dwHPMax  = 生命值；
								  dwMPMax  = 魔法值；
								  dwAttack = 攻击力；
								  dwDefense= 防御力；
								  dwFlee   = 身法；
								  dwCrit   = 暴击；
						};
		}
	]]
	YinZhangSX = {
				[1] = {
						[0]={dwExp=0;       dwHPMax=0;     dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[1]={dwExp=750;     dwHPMax=750;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[2]={dwExp=3750;    dwHPMax=2250;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[3]={dwExp=10500;   dwHPMax=4500;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[4]={dwExp=25500;   dwHPMax=8250;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[5]={dwExp=44250;   dwHPMax=12000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[6]={dwExp=75750;   dwHPMax=17250; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[7]={dwExp=116250;  dwHPMax=24000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[8]={dwExp=170250;  dwHPMax=33000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[9]={dwExp=242250;  dwHPMax=45000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[10]={dwExp=332250; dwHPMax=60000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[11]={dwExp=333075; dwHPMax=61875;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[12]={dwExp=336375; dwHPMax=65625;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[13]={dwExp=343800; dwHPMax=71250;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[14]={dwExp=360300; dwHPMax=80625;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[15]={dwExp=380925; dwHPMax=90000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[16]={dwExp=415575; dwHPMax=103125; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[17]={dwExp=460125; dwHPMax=120000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[18]={dwExp=519525; dwHPMax=142500; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[19]={dwExp=598725; dwHPMax=172500; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[20]={dwExp=697725; dwHPMax=210000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[21]={dwExp=698625; dwHPMax=212700;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[22]={dwExp=702225; dwHPMax=218100;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[23]={dwExp=710325; dwHPMax=226200;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[24]={dwExp=728325; dwHPMax=239700;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[25]={dwExp=750825; dwHPMax=253200; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[26]={dwExp=788625; dwHPMax=272100; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[27]={dwExp=837225; dwHPMax=296400; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[28]={dwExp=902025; dwHPMax=328800; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[29]={dwExp=988425; dwHPMax=372000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[30]={dwExp=1096425; dwHPMax=426000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[31]={dwExp=1097400; dwHPMax=429375;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[32]={dwExp=1101300; dwHPMax=436125;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[33]={dwExp=1110075; dwHPMax=446250;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[34]={dwExp=1129575; dwHPMax=463125;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[35]={dwExp=1153950; dwHPMax=480000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[36]={dwExp=1194900; dwHPMax=503625; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[37]={dwExp=1247550; dwHPMax=534000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[38]={dwExp=1317750; dwHPMax=574500; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[39]={dwExp=1411350; dwHPMax=628500; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[40]={dwExp=1528350; dwHPMax=696000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[41]={dwExp=1529475; dwHPMax=700500;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[42]={dwExp=1533975; dwHPMax=709500;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[43]={dwExp=1544100; dwHPMax=723000;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[44]={dwExp=1566600; dwHPMax=745500;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[45]={dwExp=1594725; dwHPMax=768000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[46]={dwExp=1641975; dwHPMax=799500; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[47]={dwExp=1702725; dwHPMax=840000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[48]={dwExp=1783725; dwHPMax=894000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[49]={dwExp=1891725; dwHPMax=966000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[50]={dwExp=2026725; dwHPMax=1056000; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
				};
				[2] = {
						[0]={dwExp=0;       dwHPMax=0; dwMPMax=0;   dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[1]={dwExp=750;     dwHPMax=0; dwMPMax=7;   dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[2]={dwExp=3750;    dwHPMax=0; dwMPMax=22;  dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[3]={dwExp=10500;   dwHPMax=0; dwMPMax=45;  dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[4]={dwExp=25500;   dwHPMax=0; dwMPMax=82;  dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[5]={dwExp=44250;   dwHPMax=0; dwMPMax=120; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[6]={dwExp=75750;   dwHPMax=0; dwMPMax=172; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[7]={dwExp=116250;  dwHPMax=0; dwMPMax=240; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[8]={dwExp=170250;  dwHPMax=0; dwMPMax=330; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[9]={dwExp=242250;  dwHPMax=0; dwMPMax=450; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[10]={dwExp=332250; dwHPMax=0; dwMPMax=600; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;};
						[11]={dwExp=333075; dwHPMax=0;   dwMPMax=618; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[12]={dwExp=336375; dwHPMax=0;  dwMPMax=656; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[13]={dwExp=343800; dwHPMax=0;  dwMPMax=712; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[14]={dwExp=360300; dwHPMax=0;  dwMPMax=806; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[15]={dwExp=380925; dwHPMax=0; dwMPMax=900; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[16]={dwExp=415575; dwHPMax=0; dwMPMax=1031; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[17]={dwExp=460125; dwHPMax=0; dwMPMax=1200; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[18]={dwExp=519525; dwHPMax=0; dwMPMax=1425; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[19]={dwExp=598725; dwHPMax=0; dwMPMax=1725; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[20]={dwExp=697725; dwHPMax=0; dwMPMax=2100; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[21]={dwExp=698625; dwHPMax=0;   dwMPMax=2127; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[22]={dwExp=702225; dwHPMax=0;  dwMPMax=2181; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[23]={dwExp=710325; dwHPMax=0;  dwMPMax=2262; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[24]={dwExp=728325; dwHPMax=0;  dwMPMax=2397; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[25]={dwExp=750825; dwHPMax=0; dwMPMax=2532; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[26]={dwExp=788625; dwHPMax=0; dwMPMax=2721; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[27]={dwExp=837225; dwHPMax=0; dwMPMax=2964; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[28]={dwExp=902025; dwHPMax=0; dwMPMax=3288; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[29]={dwExp=988425; dwHPMax=0; dwMPMax=3720; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[30]={dwExp=1096425; dwHPMax=0; dwMPMax=4260; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[31]={dwExp=1097400; dwHPMax=0;  dwMPMax=4293; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[32]={dwExp=1101300; dwHPMax=0;  dwMPMax=4361; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[33]={dwExp=1110075; dwHPMax=0;  dwMPMax=4462; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[34]={dwExp=1129575; dwHPMax=0;  dwMPMax=4631; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[35]={dwExp=1153950; dwHPMax=0; dwMPMax=4800; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[36]={dwExp=1194900; dwHPMax=0; dwMPMax=5036; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[37]={dwExp=1247550; dwHPMax=0; dwMPMax=5340; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[38]={dwExp=1317750; dwHPMax=0; dwMPMax=5745; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[39]={dwExp=1411350; dwHPMax=0; dwMPMax=6285; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[40]={dwExp=1528350; dwHPMax=0; dwMPMax=6960; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[41]={dwExp=1529475; dwHPMax=0; dwMPMax=7005; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[42]={dwExp=1533975; dwHPMax=0;  dwMPMax=7095; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[43]={dwExp=1544100; dwHPMax=0;  dwMPMax=7230; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[44]={dwExp=1566600; dwHPMax=0;  dwMPMax=7455; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[45]={dwExp=1594725; dwHPMax=0; dwMPMax=7680; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[46]={dwExp=1641975; dwHPMax=0; dwMPMax=7995; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[47]={dwExp=1702725; dwHPMax=0; dwMPMax=8400; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[48]={dwExp=1783725; dwHPMax=0; dwMPMax=8940; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[49]={dwExp=1891725; dwHPMax=0; dwMPMax=9660; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[50]={dwExp=2026725; dwHPMax=0; dwMPMax=10560; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
				};
				[3] = {
						[0]={dwExp=0;       dwHPMax=0; dwMPMax=0; dwAttack=0;    dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[1]={dwExp=750;     dwHPMax=0; dwMPMax=0; dwAttack=150;  dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[2]={dwExp=3750;    dwHPMax=0; dwMPMax=0; dwAttack=450;  dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[3]={dwExp=10500;   dwHPMax=0; dwMPMax=0; dwAttack=900;  dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[4]={dwExp=25500;   dwHPMax=0; dwMPMax=0; dwAttack=1650; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[5]={dwExp=44250;   dwHPMax=0; dwMPMax=0; dwAttack=2400; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[6]={dwExp=75750;   dwHPMax=0; dwMPMax=0; dwAttack=3450; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[7]={dwExp=116250;  dwHPMax=0; dwMPMax=0; dwAttack=4800; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[8]={dwExp=170250;  dwHPMax=0; dwMPMax=0; dwAttack=6600; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[9]={dwExp=242250;  dwHPMax=0; dwMPMax=0; dwAttack=9000; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[10]={dwExp=332250; dwHPMax=0; dwMPMax=0; dwAttack=12000;dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[11]={dwExp=333075; dwHPMax=0;   dwMPMax=0; dwAttack=12375; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[12]={dwExp=336375; dwHPMax=0;  dwMPMax=0; dwAttack=13125; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[13]={dwExp=343800; dwHPMax=0;  dwMPMax=0; dwAttack=14250; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[14]={dwExp=360300; dwHPMax=0;  dwMPMax=0; dwAttack=16125; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[15]={dwExp=380925; dwHPMax=0; dwMPMax=0; dwAttack=18000; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[16]={dwExp=415575; dwHPMax=0; dwMPMax=0; dwAttack=20625; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[17]={dwExp=460125; dwHPMax=0; dwMPMax=0; dwAttack=24000; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[18]={dwExp=519525; dwHPMax=0; dwMPMax=0; dwAttack=28500; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[19]={dwExp=598725; dwHPMax=0; dwMPMax=0; dwAttack=34500; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[20]={dwExp=697725; dwHPMax=0; dwMPMax=0; dwAttack=42000; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[21]={dwExp=698625; dwHPMax=0;   dwMPMax=0; dwAttack=42540; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[22]={dwExp=702225; dwHPMax=0;  dwMPMax=0; dwAttack=43620; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[23]={dwExp=710325; dwHPMax=0;  dwMPMax=0; dwAttack=45240; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[24]={dwExp=728325; dwHPMax=0;  dwMPMax=0; dwAttack=47940; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[25]={dwExp=750825; dwHPMax=0; dwMPMax=0; dwAttack=50640; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[26]={dwExp=788625; dwHPMax=0; dwMPMax=0; dwAttack=54420; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[27]={dwExp=837225; dwHPMax=0; dwMPMax=0; dwAttack=59280; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[28]={dwExp=902025; dwHPMax=0; dwMPMax=0; dwAttack=65760; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[29]={dwExp=988425; dwHPMax=0; dwMPMax=0; dwAttack=74400; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[30]={dwExp=1096425; dwHPMax=0; dwMPMax=0; dwAttack=85200; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[31]={dwExp=1097400; dwHPMax=0;  dwMPMax=0; dwAttack=85875; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[32]={dwExp=1101300; dwHPMax=0;  dwMPMax=0; dwAttack=87225; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[33]={dwExp=1110075; dwHPMax=0;  dwMPMax=0; dwAttack=89250; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[34]={dwExp=1129575; dwHPMax=0;  dwMPMax=0; dwAttack=92625; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[35]={dwExp=1153950; dwHPMax=0; dwMPMax=0; dwAttack=96000; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[36]={dwExp=1194900; dwHPMax=0; dwMPMax=0; dwAttack=100725; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[37]={dwExp=1247550; dwHPMax=0; dwMPMax=0; dwAttack=106800; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[38]={dwExp=1317750; dwHPMax=0; dwMPMax=0; dwAttack=114900; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[39]={dwExp=1411350; dwHPMax=0; dwMPMax=0; dwAttack=125700; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[40]={dwExp=1528350; dwHPMax=0; dwMPMax=0; dwAttack=139200; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[41]={dwExp=1529475; dwHPMax=0;   dwMPMax=0; dwAttack=140100; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[42]={dwExp=1533975; dwHPMax=0;  dwMPMax=0; dwAttack=141900; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[43]={dwExp=1544100; dwHPMax=0;  dwMPMax=0; dwAttack=144600; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[44]={dwExp=1566600; dwHPMax=0;  dwMPMax=0; dwAttack=149100; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[45]={dwExp=1594725; dwHPMax=0; dwMPMax=0; dwAttack=153600; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[46]={dwExp=1641975; dwHPMax=0; dwMPMax=0; dwAttack=159900; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[47]={dwExp=1702725; dwHPMax=0; dwMPMax=0; dwAttack=168000; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[48]={dwExp=1783725; dwHPMax=0; dwMPMax=0; dwAttack=178800; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[49]={dwExp=1891725; dwHPMax=0; dwMPMax=0; dwAttack=193200; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[50]={dwExp=2026725; dwHPMax=0; dwMPMax=0; dwAttack=211200; dwDefense=0; dwFlee=0; dwCrit=0;}; 
				};
				[4] = {
						[0]={dwExp=0;       dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0;    dwFlee=0; dwCrit=0;}; 
						[1]={dwExp=750;     dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=75;   dwFlee=0; dwCrit=0;}; 
						[2]={dwExp=3750;    dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=225;  dwFlee=0; dwCrit=0;}; 
						[3]={dwExp=10500;   dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=450;  dwFlee=0; dwCrit=0;}; 
						[4]={dwExp=25500;   dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=825;  dwFlee=0; dwCrit=0;}; 
						[5]={dwExp=44250;   dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=1200; dwFlee=0; dwCrit=0;}; 
						[6]={dwExp=75750;   dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=1725; dwFlee=0; dwCrit=0;}; 
						[7]={dwExp=116250;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=2400; dwFlee=0; dwCrit=0;}; 
						[8]={dwExp=170250;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=3300; dwFlee=0; dwCrit=0;}; 
						[9]={dwExp=242250;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=4500; dwFlee=0; dwCrit=0;}; 
						[10]={dwExp=332250; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=6000; dwFlee=0; dwCrit=0;}; 
						[11]={dwExp=333075; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=6187; dwFlee=0; dwCrit=0;}; 
						[12]={dwExp=336375; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=6562; dwFlee=0; dwCrit=0;}; 
						[13]={dwExp=343800; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=7125; dwFlee=0; dwCrit=0;}; 
						[14]={dwExp=360300; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=8062; dwFlee=0; dwCrit=0;}; 
						[15]={dwExp=380925; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=9000; dwFlee=0; dwCrit=0;}; 
						[16]={dwExp=415575; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=10312; dwFlee=0; dwCrit=0;}; 
						[17]={dwExp=460125; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=12000; dwFlee=0; dwCrit=0;}; 
						[18]={dwExp=519525; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=14250; dwFlee=0; dwCrit=0;}; 
						[19]={dwExp=598725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=17250; dwFlee=0; dwCrit=0;}; 
						[20]={dwExp=697725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=21000; dwFlee=0; dwCrit=0;}; 
						[21]={dwExp=698625; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=21270; dwFlee=0; dwCrit=0;}; 
						[22]={dwExp=702225; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=21810; dwFlee=0; dwCrit=0;}; 
						[23]={dwExp=710325; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=22620; dwFlee=0; dwCrit=0;}; 
						[24]={dwExp=728325; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=23970; dwFlee=0; dwCrit=0;}; 
						[25]={dwExp=750825; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=25320; dwFlee=0; dwCrit=0;}; 
						[26]={dwExp=788625; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=27210; dwFlee=0; dwCrit=0;}; 
						[27]={dwExp=837225; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=29640; dwFlee=0; dwCrit=0;}; 
						[28]={dwExp=902025; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=32880; dwFlee=0; dwCrit=0;}; 
						[29]={dwExp=988425; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=37200; dwFlee=0; dwCrit=0;}; 
						[30]={dwExp=1096425; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=42600; dwFlee=0; dwCrit=0;}; 
						[31]={dwExp=1097400; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=42937; dwFlee=0; dwCrit=0;}; 
						[32]={dwExp=1101300; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=43612; dwFlee=0; dwCrit=0;}; 
						[33]={dwExp=1110075; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=44625; dwFlee=0; dwCrit=0;}; 
						[34]={dwExp=1129575; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=46312; dwFlee=0; dwCrit=0;}; 
						[35]={dwExp=1153950; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=48000; dwFlee=0; dwCrit=0;}; 
						[36]={dwExp=1194900; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=50362; dwFlee=0; dwCrit=0;}; 
						[37]={dwExp=1247550; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=53400; dwFlee=0; dwCrit=0;}; 
						[38]={dwExp=1317750; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=57450; dwFlee=0; dwCrit=0;}; 
						[39]={dwExp=1411350; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=62850; dwFlee=0; dwCrit=0;}; 
						[40]={dwExp=1528350; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=69600; dwFlee=0; dwCrit=0;}; 
						[41]={dwExp=1529475; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=70050; dwFlee=0; dwCrit=0;}; 
						[42]={dwExp=1533975; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=70950; dwFlee=0; dwCrit=0;}; 
						[43]={dwExp=1544100; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=72300; dwFlee=0; dwCrit=0;}; 
						[44]={dwExp=1566600; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=74550; dwFlee=0; dwCrit=0;}; 
						[45]={dwExp=1594725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=76800; dwFlee=0; dwCrit=0;}; 
						[46]={dwExp=1641975; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=79950; dwFlee=0; dwCrit=0;}; 
						[47]={dwExp=1702725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=84000; dwFlee=0; dwCrit=0;}; 
						[48]={dwExp=1783725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=89400; dwFlee=0; dwCrit=0;}; 
						[49]={dwExp=1891725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=96600; dwFlee=0; dwCrit=0;}; 
						[50]={dwExp=2026725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=105600; dwFlee=0; dwCrit=0;}; 
				};
				[5] = {
						[0]={dwExp=0;      dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0;   dwCrit=0;}; 
						[1]={dwExp=750;    dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=3;   dwCrit=0;}; 
						[2]={dwExp=3750;   dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=9;   dwCrit=0;}; 
						[3]={dwExp=10500;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=18;  dwCrit=0;}; 
						[4]={dwExp=25500;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=33;  dwCrit=0;}; 
						[5]={dwExp=44250;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=48;  dwCrit=0;}; 
						[6]={dwExp=75750;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=69;  dwCrit=0;}; 
						[7]={dwExp=116250; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=96;  dwCrit=0;}; 
						[8]={dwExp=170250; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=132; dwCrit=0;}; 
						[9]={dwExp=242250; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=180; dwCrit=0;}; 
						[10]={dwExp=332250;dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=240; dwCrit=0;}; 
						[11]={dwExp=333075; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=247; dwCrit=0;}; 
						[12]={dwExp=336375; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=262; dwCrit=0;}; 
						[13]={dwExp=343800; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=285; dwCrit=0;}; 
						[14]={dwExp=360300; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=322; dwCrit=0;}; 
						[15]={dwExp=380925; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=360; dwCrit=0;}; 
						[16]={dwExp=415575; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=412; dwCrit=0;}; 
						[17]={dwExp=460125; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=480; dwCrit=0;}; 
						[18]={dwExp=519525; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=570; dwCrit=0;}; 
						[19]={dwExp=598725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=690; dwCrit=0;}; 
						[20]={dwExp=697725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=840; dwCrit=0;}; 
						[21]={dwExp=698625; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=850; dwCrit=0;}; 
						[22]={dwExp=702225; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=872; dwCrit=0;}; 
						[23]={dwExp=710325; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=904; dwCrit=0;}; 
						[24]={dwExp=728325; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=958; dwCrit=0;}; 
						[25]={dwExp=750825; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1012; dwCrit=0;}; 
						[26]={dwExp=788625; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1088; dwCrit=0;}; 
						[27]={dwExp=837225; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1185; dwCrit=0;}; 
						[28]={dwExp=902025; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1315; dwCrit=0;}; 
						[29]={dwExp=988425; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1488; dwCrit=0;}; 
						[30]={dwExp=1096425; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1704; dwCrit=0;}; 
						[31]={dwExp=1097400; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1717; dwCrit=0;}; 
						[32]={dwExp=1101300; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1744; dwCrit=0;}; 
						[33]={dwExp=1110075; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1785; dwCrit=0;}; 
						[34]={dwExp=1129575; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1852; dwCrit=0;}; 
						[35]={dwExp=1153950; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=1920; dwCrit=0;}; 
						[36]={dwExp=1194900; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2014; dwCrit=0;}; 
						[37]={dwExp=1247550; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2136; dwCrit=0;}; 
						[38]={dwExp=1317750; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2298; dwCrit=0;}; 
						[39]={dwExp=1411350; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2514; dwCrit=0;}; 
						[40]={dwExp=1528350; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2784; dwCrit=0;}; 
						[41]={dwExp=1529475; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2802; dwCrit=0;}; 
						[42]={dwExp=1533975; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2838; dwCrit=0;}; 
						[43]={dwExp=1544100; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2892; dwCrit=0;}; 
						[44]={dwExp=1566600; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=2982; dwCrit=0;}; 
						[45]={dwExp=1594725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=3072; dwCrit=0;}; 
						[46]={dwExp=1641975; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=3198; dwCrit=0;}; 
						[47]={dwExp=1702725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=3360; dwCrit=0;}; 
						[48]={dwExp=1783725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=3576; dwCrit=0;}; 
						[49]={dwExp=1891725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=3864; dwCrit=0;}; 
						[50]={dwExp=2026725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=4224; dwCrit=0;}; 
				};
				[6] = {
						[0]={dwExp=0;      dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=0;}; 
						[1]={dwExp=750;    dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2;}; 
						[2]={dwExp=3750;   dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=6;}; 
						[3]={dwExp=10500;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=13;}; 
						[4]={dwExp=25500;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=24;}; 
						[5]={dwExp=44250;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=36;}; 
						[6]={dwExp=75750;  dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=51;}; 
						[7]={dwExp=116250; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=72;}; 
						[8]={dwExp=170250; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=99;}; 
						[9]={dwExp=242250; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=135;}; 
						[10]={dwExp=332250;dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=180;}; 
						[11]={dwExp=333075; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=185;}; 
						[12]={dwExp=336375; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=196;}; 
						[13]={dwExp=343800; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=213;}; 
						[14]={dwExp=360300; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=241;}; 
						[15]={dwExp=380925; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=270;}; 
						[16]={dwExp=415575; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=309;}; 
						[17]={dwExp=460125; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=360;}; 
						[18]={dwExp=519525; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=427;}; 
						[19]={dwExp=598725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=517;}; 
						[20]={dwExp=697725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=630;}; 
						[21]={dwExp=698625; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=638;}; 
						[22]={dwExp=702225; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=654;}; 
						[23]={dwExp=710325; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=678;}; 
						[24]={dwExp=728325; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=719;}; 
						[25]={dwExp=750825; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=759;}; 
						[26]={dwExp=788625; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=816;}; 
						[27]={dwExp=837225; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=889;}; 
						[28]={dwExp=902025; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=986;}; 
						[29]={dwExp=988425; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1116;}; 
						[30]={dwExp=1096425; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1278;}; 
						[31]={dwExp=1097400; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1288;}; 
						[32]={dwExp=1101300; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1308;}; 
						[33]={dwExp=1110075; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1338;}; 
						[34]={dwExp=1129575; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1389;}; 
						[35]={dwExp=1153950; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1440;}; 
						[36]={dwExp=1194900; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1510;}; 
						[37]={dwExp=1247550; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1602;}; 
						[38]={dwExp=1317750; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1723;}; 
						[39]={dwExp=1411350; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=1885;}; 
						[40]={dwExp=1528350; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2088;}; 
						[41]={dwExp=1529475; dwHPMax=0;   dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2101;}; 
						[42]={dwExp=1533975; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2128;}; 
						[43]={dwExp=1544100; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2169;}; 
						[44]={dwExp=1566600; dwHPMax=0;  dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2236;}; 
						[45]={dwExp=1594725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2304;}; 
						[46]={dwExp=1641975; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2398;}; 
						[47]={dwExp=1702725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2520;}; 
						[48]={dwExp=1783725; dwHPMax=0;dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2682;}; 
						[49]={dwExp=1891725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=2898;}; 
						[50]={dwExp=2026725; dwHPMax=0; dwMPMax=0; dwAttack=0; dwDefense=0; dwFlee=0; dwCrit=3168;}; 
				};
	};
	--纹章分阶表
	LadderInfo = {
			--nLevel纹章等级	nItemID 当前阶消耗物品 nItemNum消耗物品数量 nGold 刷新使用元宝数
			[1] = { nLevel = 10;nItemID =4900107;nItemNum = 2;nGold = 5 };
			[2] = { nLevel = 20;nItemID =4900107;nItemNum = 2;nGold = 5 };
			[3] = { nLevel = 30;nItemID =4900107;nItemNum = 2;nGold = 5 };
			[4] = { nLevel = 40;nItemID =4900107;nItemNum = 2;nGold = 5 };
			[5] = { nLevel = 50;nItemID =4900107;nItemNum = 2;nGold = 5 };
	};
	--整体属性Tips
	 Battle = {
			dwHPMax    = "<font color='#FFFF00'>生命 + </font>",
			dwMPMax    = "<font color='#FFFF00'>内力 + </font>", 
			dwAttack   = "<font color='#FFFF00'>攻击 + </font>", 
			dwDefense  = "<font color='#FFFF00'>防御 + </font>", 
			dwFlee 	   = "<font color='#FFFF00'>身法 + </font>",
			dwCrit     = "<font color='#FFFF00'>暴击 + </font>";
			};
	--tips顺序
	ShunXu = {
			[1] = "dwHPMax";
			[2] = "dwMPMax";
			[3] = "dwAttack";
			[4] = "dwDefense";
			[5] = "dwFlee";
			[6] = "dwCrit";
		  };
	--倍数表
	MultListN = {1,2,5,10,15,};
	MultListC = {"一","二","五","十","十五",};
	--开启前几阶的勋章
	OpenLadder = 5;
};
--[[
	[ \brief 通过印章经验表获得当前等阶
	[ \param table tAll 拥有的奖品表 = {[印章ID] = 经验}
	[ \return number nLadder 等阶
    ]]
function CloudMedalConfig:GetLadder(tAll)
	local tLevel = self:GetLevelInfo(tAll);
	local tInfo = {}
	for k,v in pairs(tLevel) do
		tInfo[k] = 1;
		for key,t in ipairs(self.LadderInfo) do
			if v.nLevel >= t.nLevel then
				tInfo[k] = key + 1
			end
		end
	end
	local nLadder = #self.LadderInfo;
	for k,v in pairs(tInfo)do
		if nLadder > v then
			nLadder = v
		end
	end
	if nLadder > #self.LadderInfo then
		nLadder = #self.LadderInfo;
	end
	return nLadder;
end	

--[[
	[ \brief 摇奖消耗的物品
	[ \param table tAll 拥有的奖品表 = {[印章ID] = 经验}
	[ \param number nMulNum 摇奖的倍数
	[ \return table tbCon = {nItemID = 物品ID；nNum = 物品数量}
    ]]
function CloudMedalConfig:GetConItemInfo(tAll, nMulNum)
	local tCon = {};
	local tInfo = self.LadderInfo[self:GetLadder(tAll)];
	tCon.nItemID = tInfo.nItemID;
	tCon.nNum = tInfo.nItemNum * nMulNum;
	return tCon;
end

--[[
	[ \brief 单次摇奖消耗的物品
	[ \param table tAll 拥有的奖品表 = {[印章ID] = 经验}
	[ \return number nGold = 消耗元宝数
    ]]
function CloudMedalConfig:GetFlushItemInfo(tAll)
	local nGold = self.LadderInfo[self:GetLadder(tAll)].nGold; 
	return nGold;
end;

--[[
	[ \brief 通过印章经验表获得战斗值
	[ \param table tAll 拥有的奖品表  = {[印章ID] = 经验}
	[ \return number nFightNum 战斗值
    ]]
function CloudMedalConfig:GetAttack(tAll)
	local _,tShuXing = self:GetLevelInfo(tAll);
	local nFightNum = 0;
	-- 战斗力参数
	local warli = {dwHPMax = 0.4,dwMPMax = 0.24,dwAttack = 1.2, dwDefense = 1,dwFlee = 2,dwCrit = 2.5}; 
	for k, v in pairs(tShuXing) do
		nFightNum = math.floor(nFightNum + v * warli[k]);
	end
	return nFightNum;
end

--[[
	[ \brief 通过印章总经验表获取勋章级别经验表
	[ \param table tAll = {[印章ID] = 总经验;...}
	[ \return table tAllEx = {[印章ID] = {nLevel = 当前级别，nExp=当前经验};... }
	[ \return table tAttr = {[属性名称] = 属性值;...}
	[ \return number nLadder = 纹章阶数
    ]]
function CloudMedalConfig:GetLevelInfo(tAll)
	local tLevelInfo = {};
	local tAttr = {};
	for k,v in pairs(tAll) do
		local tLevel = CloudMedalConfig.YinZhangSX[k];
		local nCount = #tLevel;
		tLevelInfo[k] = {};
		tLevelInfo[k].nLevel = 0;
		tLevelInfo[k].nExp = v;
		for key, tList in ipairs(tLevel) do
			local nNow = v - tList.dwExp
			if nNow >= 0 then
				tLevelInfo[k] = {};
				tLevelInfo[k].nLevel = key;
				tLevelInfo[k].nExp   = nNow;
			end
		end
		for k,v in pairs(tLevel[tLevelInfo[k].nLevel]) do
			if not (tAttr[k]) then
				tAttr[k] = 0;
			end
			tAttr[k] = v + tAttr[k] or 0;
		end
		--经验满级保护
		if v >= tLevel[nCount].dwExp then
			tLevelInfo[k].nLevel = nCount;
			tLevelInfo[k].nExp = tLevel[nCount].dwExp;
		end
	end
	tAttr.dwExp = nil;
	return tLevelInfo, tAttr;
end

--[[相同令牌经验加成
	[相同个数] = 额外经验；
    ]]
local AddExp = {
	[1] = 0;
	[2] = 100; -- 两个相同 额外加成
	[3] = 300; --  三个相同 额外加成
	[4] = 600; --  四个相同 额外加成
};

--[[
	[ \brief 获取奖品经验
	[ \param table tPrize 印章ID表
	[ \param number nMulNum 摇奖倍数
	[ \param table tAll 总经验表
	[ \return table tPrizeList  总经验表 {[ID] = 总经验}
	[ \return table tPrizeOld 基础经验表（不叠加相同ID） {[ID] = 经验}
    ]]
function CloudMedalConfig:GetExpInfo(tPrize, nMulNum, tAll)
	local tPrizeList = {};
	local tPrizeOld = {};
	local tPrizeSame = {};
	local tPrizeTemp = {};
	local nLadder = self:GetLadder(tAll)
	local tExpInfo = self.YinZhang[nLadder];
	for k, v in pairs(tPrize) do
		tPrizeOld[v] = tExpInfo[v].xzexp;
		tPrizeTemp[v] = (tPrizeTemp[v] or 0) + tPrizeOld[v];
	end
	for k, v in pairs(tPrizeTemp) do
		local nAdd = tExpInfo[k].xzexp
		tPrizeSame[k] = AddExp[math.floor(v/nAdd)]* nMulNum
		tPrizeTemp[k] = v * nMulNum;
		tPrizeList[k] = tPrizeTemp[k] + tPrizeSame[k];
		tPrizeOld[k] = tPrizeOld[k] * nMulNum;
		local nMax = self.YinZhangSX[k][self.LadderInfo[nLadder].nLevel].dwExp;
		if tPrizeList[k] + tAll[k] > nMax then
			tPrizeList[k] = nMax - tAll[k];
		end
	end	
	return tPrizeList, tPrizeOld;
end

--[[
	[ \brief 奖品列表是否满级
	[ \param table tAll 印章经验表 {ID = Exp;...}
	[ \param numer nLadder 纹章等级
	[ \return bool bFlg  是否纹章满级 true 满级； false 不满级
	[ \return table tNoFull 不满的印章ID表
    ]]
function CloudMedalConfig:IsFull(tAll)
	local tNoFull = {};
	if self:GetLadder(tAll) > self.OpenLadder then
		return true,tNoFull;
	end
	local tInfo = self.LadderInfo[self:GetLadder(tAll)]
	local bFlg = true;
	for k,v in pairs(tAll) do
		if v < self.YinZhangSX[k][tInfo.nLevel].dwExp then
			table.insert(tNoFull,k);
			bFlg = false;
		end
	end
	return bFlg, tNoFull;
end

--[[
	[ \brief 随机产生奖品列表
	[ \param table tAll 印章经验表 {ID = Exp}
	[ \param number nIndex  摇奖标号 0 代表摇奖；1-4代表单次摇奖的位置编号；
	[ \return table tPrize 奖品ID表；
    ]]
function CloudMedalConfig:MakePrize(tAll, nIndex)
	local bIsFull,tNoFull = CloudMedalConfig:IsFull(tAll) ;
	local nLadder = self:GetLadder(tAll);
	local tPrize = {};
	if nIndex == 0 then
		for i=1, 4 do
			tPrize[i] = CloudMedalConfig:GetNoFullID(tNoFull, nLadder);
		end
	else	
		tPrize[nIndex] = CloudMedalConfig:GetNoFullID(tNoFull, nLadder);
	end
	return tPrize;
end

--[[
	[ \brief 获得增加权重后的ID
	[ \param table tNoFull 没有满级印章经验表 {ID}
	[ \param number nLadder 纹章阶数
	[ \return number 抽出来的奖品ID
    ]]
function CloudMedalConfig:GetNoFullID(tNoFull, nLadder)
	local maxqz = 0;
	local tempqz = 0;
	local quanzhong = 0;
	local tInfo = self.YinZhang[nLadder]
	for k,v in pairs(tNoFull) do
		maxqz = maxqz + tInfo[v].quanzhong
	end
	quanzhong = math.random(1,maxqz);
	for k,v in pairs(tNoFull) do
		tempqz = tempqz + tInfo[v].quanzhong
		if quanzhong <= tempqz then
			return v;
		end
	end
end

--[[
	[ \brief 获取表的元素个数
	[ \param table tInfo 待测试的表
	[ \return number 表的元素个数
    ]]
function CloudMedalConfig:GetTableCount(tInfo)
	local nCount = 0;
	if tInfo then
		for k, v in pairs(tInfo) do
			nCount = nCount + 1;
		end
	else
		return nCount;
	end

	return nCount;
end
