_G.DuplShowInfo = {
--------BOSS 品质框颜色types 字段 = "hide"常规  "green"绿色   "blue"蓝色   "pink"紫色   "gold"金色
--副本id
-----------------------------大破联营
	[1003] = {
--怪物波数
		[1] = {
				monster =
				{
					title = "<p>往前方挺进,当心路上敌人!</p><p>突破<font color='#DE6363'>金国前哨站</font>与<font color='#DE6363'>金国驿馆</font></p>",
					[1] = {
						monsterId = {50042002,50042003,50042004,50042005,50052001,50052002,50052003,50052004},
						png = "boss-jjbfz.png",
						name = "金国敌军",
						tips = "<p>到处都是敌人,分不清数量</p>",
						monsterNum = "??",
					},
					[2] = {
						monsterId = {50042001},
						png = "boss-jjxf.png",
						name = "偷懒哨兵",
						tips = "<p>偷懒的哨兵：</p><p>一个偷懒的士兵,你可以揍他一顿试试!!</p>",
						monsterNum = 1,
					},
				},
				
				boss =
				{
				title = "金国驿馆的高级头目,打败不了他就无法继续前进!",
				tips = "<font size='14'><p>“什么?!宋人还敢来袭!!!”</p></font><p>                       --万人敌</p>",
				skillType = "绝学",
				skillDes = "无",
				monsterId = {50052005},
				png = "boss-sftl.png",
				name = "万人敌",
				monsterNum = 1,
				types = "green",
				},
			},
			
		[2] = {
				monster =
				{
					title = "<p>继续挺进,当心路上敌人!</p><p>突破<font color='#DE6363'>金国甬道、粮仓、将营</font></p>",
					[1] = {
						monsterId = {50062002},
						png = "boss-yxrsl.png",
						name = "金军双煞·戮",
						tips = "<p>小心埋伏!!!</p>",
						monsterNum = 1,
					},
					[2] = {
						monsterId = {50062001},
						png = "boss-jjjl.png",
						name = "金军双煞·屠",
						tips = "<p>小心他的弩车队!!!</p>",
						monsterNum = 1,
					},
				},
				
				boss =
				{
				title = "突入到金营腹地,危险重重,小心行事!",
				tips = "<font size='14'><p>“嘿嘿,要来两粒仙丹么!”</p></font><p>                       --金国国师</p>",
				skillType = "绝学",
				skillDes = "巫蛊之术",
				monsterId = {50082001},
				png = "boss-ty.png",
				name = "金国国师",
				monsterNum = 1,
				types = "blue",
				},
			},
			
		[3] = {
				monster =
				{
					title = "<p>突破了金军重围,来到了<font color='#DE6363'>蒙古营地</font></p><p>突破<font color='#DE6363'>蒙古前哨站</font>与<font color='#DE6363'>金国驿馆</font></p>",
					[1] = {
						monsterId = {50092002,50092003,50092004,50092005,50102001,50102002,50102003,50102004},
						png = "boss-fenghuohuwei.png",
						name = "蒙古敌军",
						tips = "<p>到处都是敌人,分不清数量</p>",
						monsterNum = "??",
					},
					[2] = {
						monsterId = {50102005},
						png = "boss-jjxf.png",
						name = "偷懒哨兵",
						tips = "<p>偷懒的哨兵：</p><p>一个偷懒的士兵,你可以揍他一顿试试!!</p>",
						monsterNum = 1,
					},
				},
				
				boss =
				{
				title = "蒙古驿馆的高级头目,打败不了他就无法继续前进!",
				tips = "<font size='14'><p>“金国那群蠢蛋,跟他们联盟真是难堪!”</p></font><p>                       --头目</p>",
				skillType = "绝学",
				skillDes = "无",
				monsterId = {50052005},
				png = "boss-xxz.png",
				name = "头目",
				monsterNum = 1,
				types = "green",
				},
			},
			
		[4] = {
				monster =
				{
					title = "<p>继续挺进,当心路上敌人!</p><p>突破<font color='#DE6363'>蒙古甬道、粮仓、将营</font></p>",
					[1] = {
						monsterId = {50112002},
						png = "boss-ty.png",
						name = "蒙军双将·青",
						tips = "<p>小心埋伏!!!</p>",
						monsterNum = 1,
					},
					[2] = {
						monsterId = {50112001},
						png = "boss-cly.png",
						name = "蒙军双将·红",
						tips = "<p>小心他的弩车队!!!</p>",
						monsterNum = 1,
					},
				},
				
				boss =
				{
				title = "突入到蒙古军营腹地,危险重重,小心行事!",
				tips = "<font size='14'><p>“有两下子,不过也只是一只杂鱼!”</p></font><p>                       --蒙军国师</p>",
				skillType = "绝学",
				skillDes = "天诛",
				monsterId = {50132001},
				png = "boss-jlfw.png",
				name = "蒙军国师",
				monsterNum = 1,
				types = "blue",
				},
			},
			
		[5] = {
				monster =
				{
					title = "抵达了联合指挥营,一鼓作气,拿下!突破<font color='#DE6363'>联军前帐、指挥大帐、辎储地</font>",
					[1] = {
						monsterId = {50142001,50142002,50142003,50152001,50152002},
						png = "boss-xsdz.png",
						name = "联军精兵",
						tips = "在这的都是精兵强将,不留心的话,小命就没了!",
						monsterNum = "??",
					},
					[2] = {
						monsterId = {50152003,50152004},
						png = "boss-xxz.png",
						name = "两国主将",
						tips = "<p>金国:</p><p>   联军智囊</p><p>蒙古:</p><p>   联军悍将</p>",
						monsterNum = 2,
					},
					[3] = {
						monsterId = {50152005},
						png = "boss-oyf.png",
						name = "联军头领",
						tips = "<font size='14'><p>总指挥,只要擒下他,拿下联合军大旗就是砧板上的鱼肉了!</p></font>",
						monsterNum = 1,
					},
				},
				
				boss =
				{
				title = "突破指挥营,擒下联军头领,<font color='#DE6363'>拿下联军大旗</font>!",
				tips = "<font size='14'><p>标志联合军的大旗,只要砍倒他,联军必败!</p>",
				skillType = "绝学",
				skillDes = "只是面旗子...",
				monsterId = {50162002},
				png = "Icon_item_4500020_1.png",
				name = "联盟大旗",
				monsterNum = 1,
				types = "gold",
				},
			},
			
		},
-- -----------------------------真龙棋局
	[1004] = {
--怪物波数
		[1] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第1手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302002},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 1,
					},
					[2] = {
						monsterId = {50302080},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 2,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“当心你的脑袋!”</p></font><p>           --金国将领</p>",
				skillType = "绝学:",
				skillDes = "裂石破天",
				monsterId = {50302001},
				png = "boss-jjjl.png",
				name = "金国将领",
				nameText = "金国将领(40级)",
				monsterNum = 1,
				types = "hide",
				needItem = "无",
				},
				
			},
				
		[2] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第2手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302008},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 2,
					},
					[2] = {
						monsterId = {50302084},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 2,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“呲呲~~毒蛇,你见过吗？”</p></font><p>                      --蚩萝伊</p>",
				skillType = "绝学",
				skillDes = "乱蛇无双",
				monsterId = {50302007},
				png = "boss-cly.png",
				name = "蚩萝伊",
				nameText = "蚩萝伊(50级)",
				monsterNum = 1,
				types = "hide",
				needItem = "千纸鹤(1个)",
				},
				
			},
			
		[3] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第3手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302014},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 2,
					},
					[2] = {
						monsterId = {50302016},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 2,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“吓!? 吃老子一记哭丧棒!”</p></font><p>                        --潇湘子</p>",
				skillType = "绝学",
				skillDes = "哭丧鬼棒",
				monsterId = {50302013},
				png = "boss-xxz.png",
				name = "潇湘子",
				nameText = "潇湘子(55级)",
				monsterNum = 1,
				types = "green",
				needItem = "千纸鹤(1个)",
				},
				
			},
			
		[4] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第4手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302082},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 3,
					},
					[2] = {
						monsterId = {50302005},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 2,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“呔! 看刀--”</p></font><p>               --霍都</p>",
				skillType = "绝学",
				skillDes = "金戈铁马",
				monsterId = {50302004},
				png = "boss-hd.png",
				name = "霍都",
				nameText = "霍都(60级)",
				monsterNum = 1,
				types = "green",
				needItem = "千纸鹤(1个)",
				},
				
			},
			
		[5] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第5手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302054},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 3,
					},
					[2] = {
						monsterId = {50302056},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 3,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“小娃儿,试试你的功夫如何!”</p></font><p>                          --柯震恶</p>",
				skillType = "绝学",
				skillDes = "心之眼、乱斩",
				monsterId = {50302053},
				png = "boss-kze.png",
				name = "柯镇恶",
				nameText = "柯镇恶(65级)",
				monsterNum = 1,
				types = "green",
				needItem = "千纸鹤(2个)",
				},
				
			},
			
		[6] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第6手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302024},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 3,
					},
					[2] = {
						monsterId = {50302026},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 3,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“暗棋之首,这,是一种骄傲的自负!”</p></font><p>                              --天元</p>",
				skillType = "绝学",
				skillDes = "合气十字、毒舞",
				monsterId = {50302023},
				png = "boss-ty.png",
				name = "天元",
				nameText = "天元(70级)",
				monsterNum = 1,
				types = "blue",
				needItem = "千纸鹤(2个)",
				},
				
			},
			
		[7] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第7手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302086},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 4,
					},
					[2] = {
						monsterId = {50302011},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 3,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“蒙古国师的尊严,岂容汝等糟践!”</p></font><p>                         --金轮法王</p>",
				skillType = "绝学",
				skillDes = "天诛地灭",
				monsterId = {50302010},
				png = "boss-jlfw.png",
				name = "金轮法王",
				nameText = "金轮法王(75级)",
				monsterNum = 1,
				types = "blue",
				needItem = "千纸鹤(2个)",
				},
				
			},
			
		[8] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第8手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302019},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 4,
					},
					[2] = {
						monsterId = {50302021},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 4,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“咕咕…咕咕…咕!”</p></font><p>               --欧阳锋</p>",
				skillType = "绝学",
				skillDes = "扭曲空间、蛤蟆功",
				monsterId = {50302018},
				png = "boss-oyf.png",
				name = "欧阳锋",
				nameText = "欧阳锋(80级)",
				monsterNum = 1,
				types = "blue",
				needItem = "千纸鹤(2个)",
				},
				
			},
			
		[9] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第9手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302049},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 4,
					},
					[2] = {
						monsterId = {50302051},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 4,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“苦海无涯.施主,回头是岸!”</p></font><p>                    --一灯大师</p>",
				skillType = "绝学",
				skillDes = "万佛朝宗、不灭金刚",
				monsterId = {50302048},
				png = "boss-ydds.png",
				name = "一灯大师",
				nameText = "一灯大师(90级)",
				monsterNum = 1,
				types = "pink",
				needItem = "千纸鹤(3个)",
				},
				
			},
			
		[10] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第10手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302039},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 5,
					},
					[2] = {
						monsterId = {50302041},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 4,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“桃花影落飞神剑,碧海潮生按玉箫!”</p></font><p>                              --黄药师</p>",
				skillType = "绝学",
				skillDes = "碧海潮生曲、悲怆无言奏",
				monsterId = {50302038},
				png = "boss-hys.png",
				name = "黄药师",
				nameText = "黄药师(100级)",
				monsterNum = 1,
				types = "pink",
				needItem = "千纸鹤(3个)",
				},
				
			},
			
		[11] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第11手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302044},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 5,
					},
					[2] = {
						monsterId = {50302046},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 5,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“你左右手能分别画圆圈跟方块吗?”</p></font><p>                             --周伯通</p>",
				skillType = "绝学",
				skillDes = "左右互搏",
				monsterId = {50302043},
				png = "boss-zbt.png",
				name = "周伯通",
				nameText = "周伯通(110级)",
				monsterNum = 1,
				types = "pink",
				needItem = "千纸鹤(3个)",
				},
				
			},
			
		[12] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第12手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302069},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 6,
					},
					[2] = {
						monsterId = {50302071},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 6,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“快还我的叫花鸡!!!!!”</p></font><p>                  --洪七公</p><font size='14'><p>“我没有拿啊!!!!!”</p></font><p>                      --你</p>",
				skillType = "绝学",
				skillDes = "霸者之路",
				monsterId = {50302068},
				png = "boss-hongqigong.png",
				name = "洪七公",
				nameText = "洪七公(120级)",
				monsterNum = 1,
				types = "gold",
				needItem = "千纸鹤(3个)",
				},
				
			},
			
		[13] = {
				monster =
				{
					title = "<p>与棋痴对话,开启第13手棋局</p><p>注:从第2手开始,需要消耗<font color='#DE6363'>千纸鹤</font></p>",
					[1] = {
						monsterId = {50302074},
						png = "boss-baiqi.png",
						name = "白棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>白色棋子</font>将会给Boss增加<font color='#DE6363'>生命</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 7,
					},
					[2] = {
						monsterId = {50302076},
						png = "boss-heiqi.png",
						name = "黑棋子",
						tips = "<p>Boss出现时,若棋子未被击破</p><p><font color='#DE6363'>黑色棋子</font>将会给Boss增加<font color='#DE6363'>攻击</font>！</p><p>同时,棋子本身将会幻化成棋魂！</p>",
						monsterNum = 7,
					},
				},
				
				boss =
				{
				title = "<p>棋子出现的<font color='#DE6363'>30秒之后</font>,将出现BOSS</p><p>或者将<font color='#DE6363'>棋子全部击破</font>,出现BOSS</p>",
				tips = "<font size='14'><p>“全真教的创始人,就是我了!”</p></font><p>                       --王重阳</p>",
				skillType = "绝学",
				skillDes = "王者天下",
				monsterId = {50302073},
				png = "boss-wangchongyang.png",
				name = "王重阳",
				nameText = "王重阳(130级)",
				monsterNum = 1,
				types = "gold",
				needItem = "千纸鹤(4个)",
				},
				
			},
			
			
		},
------------------------------------------------------------五行道场
	[1006] = {
--怪物波数
		[1] = {
				monster =
				{
					title = "<p><font color='#DE6363'>与五行道人对话</font>,开启五行道场</p><p>按<font color='#DE6363'>属性相克顺序</font>打怪,将提高效率</p>",
					[1] = {
						monsterId = {50502001,50502002,50502003,50502004,50502005},
						png = "boss-yh.png",
						name = "五属性小怪",
						tips = "<p>五属性BOSS的护卫,数量未知</p><p>属性相克顺序:<font color='#DE6363'>请关注头像下方的BUFF说明</font></p>",
						monsterNum = "??",
					},
					[2] = {
						monsterId = {50502006,50502007,50502008,50502009,50502010},
						png = "boss-sx.png",
						name = "五属性BOSS",
						tips = "<p>击败五属性BOSS后,五行圣兽将出现</p><p>属性相克顺序:<font color='#DE6363'>请关注头像下方的BUFF说明</font></p>",
						monsterNum = 5,
					},
				},
				
				boss =
				{
				title = "击败所有怪物后<font color='#DE6363'>五行圣兽</font>将在中央台子处出现",
				tips = "<font size='14'><p>“我可是全属性的哦”</p></font><p>                       --五行圣兽</p>",
				skillType = "绝学",
				skillDes = "流星双元雨",
				monsterId = {50502011},
				png = "boss-wxss.png",
				name = "五行圣兽",
				monsterNum = 1,
				types = "gold",
				needItem = "千纸鹤(1个)",
				},
				
				
			},
		},
------------------------------------------------------------十面埋伏
	[1007] = {
--怪物波数
		[1] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第1波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600001},
					png = "999_1.png",
					name = "1/15波",
					tips = "<p>低级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>无特色</font></p>",
					monsterNum = 35,
				},
			},	
			
		},
		[2] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第2波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600002},
					png = "999_1.png",
					name = "2/15波",
					tips = "<p>低级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>无特色</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[3] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第3波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600003},
					png = "999_1.png",
					name = "3/15波",
					tips = "<p>低级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>无特色</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[4] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第4波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600004,},
					png = "999_1.png",
					name = "4/15波",
					tips = "<p>低级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>无特色</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[5] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第5波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600005},
					png = "999_1.png",
					name = "5/15波",
					tips = "<p>低级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>血量多、攻击较低</font></p>",
					monsterNum = 35,
				},
			},	
			boss =
			{
				title = "敌方将领<font color='#DE6363'>斥候将军</font>前来围攻",
				tips = "<font size='14'><p>“由我出马，谁也别想逃走！”</p></font><p>                       --斥候将军</p>",
				skillType = "绝学",
				skillDes = "飞牙冲",
				monsterId = {50603001},
				png = "boss-xeyp.png",
				name = "斥候将军",
				monsterNum = 1,
				types = "pink",
			},
		},
		[6] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第6波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600006},
					png = "999_1.png",
					name = "6/15波",
					tips = "<p>中级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>有几率降低角色暴击</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[7] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第7波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600007},
					png = "999_1.png",
					name = "7/15波",
					tips = "<p>中级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>攻击较高、血量较低</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[8] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第8波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600008},
					png = "999_1.png",
					name = "8/15波",
					tips = "<p>中级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>有几率降低角色攻击</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[9] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第9波金军</font>参与围攻,来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600009},
					png = "999_1.png",
					name = "9/15波",
					tips = "<p>中级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>有几率降低角色身法</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[10] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第10波金军</font>参与围攻来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600010},
					png = "999_1.png",
					name = "10/15波",
					tips = "<p>中级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>有几率降低角色移动速度</font></p>",
					monsterNum = 35,
				},
			},	
			boss =
			{
				title = "敌方将领<font color='#DE6363'>飞爪将军</font>前来围攻",
				tips = "<font size='14'><p>“我也前来助阵，看你们还能跑掉！”</p></font><p>                       --飞爪将军</p>",
				skillType = "绝学",
				skillDes = "血祭",
				monsterId = {50603002},
				png = "boss-menggu001.png",
				name = "飞爪将军",
				monsterNum = 1,
				types = "pink",
			},
		},	
		[11] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第11波金军</font>参与围攻来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600011},
					png = "999_1.png",
					name = "11/15波",
					tips = "<p>高级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>攻击、暴击、身法较高</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[12] = {
			monster =
			{
				title = "<p><font color='#DE6363'>第12波金军</font>参与围攻来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600012},
					png = "999_1.png",
					name = "12/15波",
					tips = "<p>高级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>有几率反伤</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[13] = {
			monster =
			{
				
				title = "<p><font color='#DE6363'>第13波金军</font>参与围攻来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600013},
					png = "999_1.png",
					name = "13/15波",
					tips = "<p>高级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>有几率使角色定身</font></p>",
					monsterNum = 35,
				},
			},	
		},
		[14] = {
			monster =
			{
				
				title = "<p><font color='#DE6363'>第14波金军</font>参与围攻来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600014},
					png = "999_1.png",
					name = "14/15波",
					tips = "<p>高级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>有几率使角色眩晕</font></p>",
					monsterNum = 35,
				},
			},	
		},

		[15] = {
			monster =
			{
				
				title = "<p><font color='#DE6363'>第15波金军</font>参与围攻来势凶猛,彼此之间相互配合,挺过15波金军围攻</p>",
				[1] = {
					monsterId = {50600015},
					png = "999_1.png",
					name = "15/15波",
					tips = "<p>高级小怪,数量未知</p><p>敌方属性:<font color='#DE6363'>攻击较高、有几率降低角色防御</font></p>",
					monsterNum = 35,
				},
			},	
		},
		
		-- [16] = {
			-- boss =
			-- {
				-- title = "敌方将领<font color='#DE6363'>斥候将军</font>前来围攻",
				-- tips = "<font size='14'><p>“由我出马，谁也别想逃走！”</p></font><p>                       --斥候将军</p>",
				-- skillType = "绝学",
				-- skillDes = "飞牙冲",
				-- monsterId = {50603001},
				-- png = "boss-xeyp.png",
				-- name = "斥候将军",
				-- monsterNum = 1,
				-- types = "pink",
				-- needItem = "千纸鹤(1个)",
			-- },
		-- },
		-- [17] = {
			-- boss =
			-- {
				-- title = "敌方将领<font color='#DE6363'>飞爪将军</font>前来围攻",
				-- tips = "<font size='14'><p>“我也前来助阵，看你们还能跑掉！”</p></font><p>                       --飞爪将军</p>",
				-- skillType = "绝学",
				-- skillDes = "血祭",
				-- monsterId = {50603002},
				-- png = "boss-menggu001.png",
				-- name = "飞爪将军",
				-- monsterNum = 1,
				-- types = "pink",
			-- },
		-- },
		
		[18] = {
			
			monster =
			{
				
				title = "金军女将<font color='#DE6363'>柳如英</font>前来围攻,请大家注意！",
				[1] = {
					monsterId = {50603003},
					png = "boss-laoliangmenger.png",
					name = "柳如英",
					tips = "<font size='14'><p>“我来擒拿吧，你们都靠边闪！”</p></font><p>                       --柳如英</p>",
					monsterNum = 1,
				},
			},
			boss =
			{

				title = "最终BOSS<font color='#DE6363'>完颜霸</font>前来围攻,请大家注意！",
				tips = "<font size='14'><p>“你们这帮废物，非得我亲自出马！”</p></font><p>                       --完颜霸</p>",
				skillType = "绝学",
				skillDes = "天下绝刀",
				monsterId = {50604001},
				png = "boss-biaoshi.png",
				name = "完颜霸",
				monsterNum = 1,
				types = "gold",
			},
		},
	},

-------------------------烽火辎路
	[1008] = {
	--怪物波数
		[1] = {
				monster =
				{
					title = "<p><font color='#DE6363'>与军师对话</font>,开启副本,劫走物辎车</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
					[1] = {
						monsterId = {50702001},
						png = "boss-wuziche.png",
						name = "物辎车",
						tips = "<p>物辎车运载着丰厚的辎重</p>",
						monsterNum = 6,
					},
					-- [2] = {
						-- monsterId = {50702011,50702012},
						-- png = "boss-fenghuohuwei.png",
						-- name = "护卫",
						-- tips = "<p>押送物辎车的护卫</p><p><font color='#DE6363'>会使用晕眩技能,数量未知</font></p>",
						-- monsterNum = "??",
					-- },
					-- [3] = {
						-- monsterId = {50702013,50702014,50702015,50702016,50702017,50702018,50702019,50702022,50702023},
						-- png = "999_0.png",
						-- name = "意外情况",
						-- tips = "<p>五种意外情况,随机出现一种:</p><p><font color='#F8F5A4'>1.解救被俘虏的村民</font></p><p><font color='#F8F5A4'>2.劫走被抢走的家禽</font></p><p><font color='#F8F01D'>3.击败前来捣乱的山贼土匪</font></p><p><font color='#F8F01D'>4.击败前来劫车的金军败兵</font></p><p><font color='#F8F01D'>5.击退从营地过来接应的小队</font></p>",
						-- monsterNum = "??",
					-- },
				},
				
			},
			
		[2] = {
				monster =
				{
					title = "<p>劫走物第二批物辎车（共七批）</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
					[1] = {
						monsterId = {50702001},
						png = "boss-wuziche.png",
						name = "物辎车",
						tips = "<p>物辎车运载着丰厚的辎重</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
						monsterNum = 6,
					},
					-- [2] = {
						-- monsterId = {50702011,50702012},
						-- png = "boss-fenghuohuwei.png",
						-- name = "护卫",
						-- tips = "<p>押送物辎车的护卫</p><p><font color='#DE6363'>会使用晕眩技能,数量未知</font></p>",
						-- monsterNum = "??",
					-- },
					-- [3] = {
						-- monsterId = {50702013,50702014,50702015,50702016,50702017,50702018,50702019,50702022,50702023},
						-- png = "999_0.png",
						-- name = "意外情况",
						-- tips = "<p>五种意外情况,随机出现一种:</p><p><font color='#F8F5A4'>1.解救被俘虏的村民</font></p><p><font color='#F8F5A4'>2.劫走被抢走的家禽</font></p><p><font color='#F8F01D'>3.击败前来捣乱的山贼土匪</font></p><p><font color='#F8F01D'>4.击败前来劫车的金军败兵</font></p><p><font color='#F8F01D'>5.击退从营地过来接应的小队</font></p>",
						-- monsterNum = "??",
					-- },
				},
				
			},
			
		[3] = {
				monster =
				{
					title = "<p>劫走物第三批物辎车（共七批）</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
					[1] = {
						monsterId = {50702001},
						png = "boss-wuziche.png",
						name = "物辎车",
						tips = "<p>物辎车运载着丰厚的辎重</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
						monsterNum = 8,
					},
					-- [2] = {
						-- monsterId = {50702011,50702012},
						-- png = "boss-fenghuohuwei.png",
						-- name = "护卫",
						-- tips = "<p>押送物辎车的护卫</p><p><font color='#DE6363'>会使用晕眩技能,数量未知</font></p>",
						-- monsterNum = "??",
					-- },
					-- [3] = {
						-- monsterId = {50702013,50702014,50702015,50702016,50702017,50702018,50702019,50702022,50702023},
						-- png = "999_0.png",
						-- name = "意外情况",
						-- tips = "<p>五种意外情况,随机出现一种:</p><p><font color='#F8F5A4'>1.解救被俘虏的村民</font></p><p><font color='#F8F5A4'>2.劫走被抢走的家禽</font></p><p><font color='#F8F01D'>3.击败前来捣乱的山贼土匪</font></p><p><font color='#F8F01D'>4.击败前来劫车的金军败兵</font></p><p><font color='#F8F01D'>5.击退从营地过来接应的小队</font></p>",
						-- monsterNum = "??",
					-- },
				},
				
			},
			
		[4] = {
				monster =
				{
					title = "<p>劫走物第四批物辎车（共七批）</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
					[1] = {
						monsterId = {50702001},
						png = "boss-wuziche.png",
						name = "物辎车",
						tips = "<p>物辎车运载着丰厚的辎重</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
						monsterNum = 8,
					},
					-- [2] = {
						-- monsterId = {50702011,50702012},
						-- png = "boss-fenghuohuwei.png",
						-- name = "护卫",
						-- tips = "<p>押送物辎车的护卫</p><p><font color='#DE6363'>会使用晕眩技能,数量未知</font></p>",
						-- monsterNum = "??",
					-- },
					-- [3] = {
						-- monsterId = {50702013,50702014,50702015,50702016,50702017,50702018,50702019,50702022,50702023},
						-- png = "999_0.png",
						-- name = "意外情况",
						-- tips = "<p>五种意外情况,随机出现一种:</p><p><font color='#F8F5A4'>1.解救被俘虏的村民</font></p><p><font color='#F8F5A4'>2.劫走被抢走的家禽</font></p><p><font color='#F8F01D'>3.击败前来捣乱的山贼土匪</font></p><p><font color='#F8F01D'>4.击败前来劫车的金军败兵</font></p><p><font color='#F8F01D'>5.击退从营地过来接应的小队</font></p>",
						-- monsterNum = "??",
					-- },
				},
				
			},
			
		[5] = {
				monster =
				{
					title = "<p>劫走物第五批物辎车（共七批）</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
					[1] = {
						monsterId = {50702001},
						png = "boss-wuziche.png",
						name = "物辎车",
						tips = "<p>物辎车运载着丰厚的辎重</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
						monsterNum = 10,
					},
					-- [2] = {
						-- monsterId = {50702011,50702012},
						-- png = "boss-fenghuohuwei.png",
						-- name = "护卫",
						-- tips = "<p>押送物辎车的护卫</p><p><font color='#DE6363'>会使用晕眩技能,数量未知</font></p>",
						-- monsterNum = "??",
					-- },
					-- [3] = {
						-- monsterId = {50702013,50702014,50702015,50702016,50702017,50702018,50702019,50702022,50702023},
						-- png = "999_0.png",
						-- name = "意外情况",
						-- tips = "<p>五种意外情况,随机出现一种:</p><p><font color='#F8F5A4'>1.解救被俘虏的村民</font></p><p><font color='#F8F5A4'>2.劫走被抢走的家禽</font></p><p><font color='#F8F01D'>3.击败前来捣乱的山贼土匪</font></p><p><font color='#F8F01D'>4.击败前来劫车的金军败兵</font></p><p><font color='#F8F01D'>5.击退从营地过来接应的小队</font></p>",
						-- monsterNum = "??",
					-- },
				},
				
			},
			
		[6] = {
				monster =
				{
					title = "<p>劫走物第六批物辎车（共七批）</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
					[1] = {
						monsterId = {50702001},
						png = "boss-wuziche.png",
						name = "物辎车",
						tips = "<p>物辎车运载着丰厚的辎重</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
						monsterNum = 10,
					},
					-- [2] = {
						-- monsterId = {50702011,50702012},
						-- png = "boss-fenghuohuwei.png",
						-- name = "护卫",
						-- tips = "<p>押送物辎车的护卫</p><p><font color='#DE6363'>会使用晕眩技能,数量未知</font></p>",
						-- monsterNum = "??",
					-- },
					-- [3] = {
						-- monsterId = {50702013,50702014,50702015,50702016,50702017,50702018,50702019,50702022,50702023},
						-- png = "999_0.png",
						-- name = "意外情况",
						-- tips = "<p>五种意外情况,随机出现一种:</p><p><font color='#F8F5A4'>1.解救被俘虏的村民</font></p><p><font color='#F8F5A4'>2.劫走被抢走的家禽</font></p><p><font color='#F8F01D'>3.击败前来捣乱的山贼土匪</font></p><p><font color='#F8F01D'>4.击败前来劫车的金军败兵</font></p><p><font color='#F8F01D'>5.击退从营地过来接应的小队</font></p>",
						-- monsterNum = "??",
					-- },
				},
				
			},
			
		[7] = {
				monster =
				{
					title = "<p>劫走物第七批物辎车（最后一批）</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
					[1] = {
						monsterId = {50702001},
						png = "boss-wuziche.png",
						name = "物辎车",
						tips = "<p>物辎车运载着丰厚的辎重</p><p>若<font color='#DE6363'>10辆</font>辎重送达敌方军营,<font color='#DE6363'>副本失败</font></p>",
						monsterNum = 12,
					},
					-- [2] = {
						-- monsterId = {50702011,50702012},
						-- png = "boss-fenghuohuwei.png",
						-- name = "护卫",
						-- tips = "<p>押送物辎车的护卫</p><p><font color='#DE6363'>会使用晕眩技能,数量未知</font></p>",
						-- monsterNum = "??",
					-- },
					-- [3] = {
						-- monsterId = {50702013,50702014,50702015,50702016,50702017,50702018,50702019,50702022,50702023},
						-- png = "999_0.png",
						-- name = "意外情况",
						-- tips = "<p>五种意外情况,随机出现一种:</p><p><font color='#F8F5A4'>1.解救被俘虏的村民</font></p><p><font color='#F8F5A4'>2.劫走被抢走的家禽</font></p><p><font color='#F8F01D'>3.击败前来捣乱的山贼土匪</font></p><p><font color='#F8F01D'>4.击败前来劫车的金军败兵</font></p><p><font color='#F8F01D'>5.击退从营地过来接应的小队</font></p>",
						-- monsterNum = "??",
					-- },
				},
				
			},
			
		[8] = {
				monster =
				{
					title = "击退敌人",
					[1] = {
						monsterId = {50702024},
						png = "boss-aqqrz.png",
						name = "蒙军精锐",
						tips = "<p>军需官护卫</p>",
						monsterNum = 12,
					},
				},
				
				boss =
				{
				title = "最后一波物辎车劫走后,山脚下出现了蒙古·军需官BOSS！",
				tips = "<font size='14'><p>“完蛋了,喝了太多酒误了大事,回去也得死,小子你有种,看招吧!”</p></font><p>                                                            --军需官</p>",
				skillType = "绝学",
				skillDes = "天诛地灭",
				monsterId = {50702020},
				png = "boss-jlfw.png",
				name = "蒙古军需官",
				monsterNum = 1,
				types = "pink",
				},
				
			},
			
		},
------------------------------------演武节堂
	[1009] = {
	--怪物波数
		[1] = {
				monster =
				{
					title = "<p>与<font color='#DE6363'>凌教头</font>对话,开启演武节堂</p><p><font color='#0099FF'>注:建议使用多倍经验丹</font></p>",
					[1] = {
						monsterId = {50710001,50710002,50710003,50710004,50710005,50710006,50710007,50710008},
						--monsterId = {50710001,50710002,50710003,50710004,50710005,50710006,50710007,50710008},
						png = "boss-sjjr.png",
						name = "宋军兵士",
						tips = "<p>宋军兵士分为6个级别:</p><p><font color='#F8F6BF'>1.蕃兵</font></p><p><font color='#F8F5A4'>2.乡兵</font></p><p><font color='#F8F48C'>3.厢军</font></p><p><font color='#F8F375'>4.禁军</font></p><p><font color='#F8F25B'>5.殿直卫</font></p><p><font color='#F8F006'>6.侍禁卫</font></p>",--<p><font color='#F8F242'>6.护卫</font></p><p><font color='#F8F01D'>6.精锐</font></p>
						--tips = "<p>宋军兵士分为6个级别:</p><p><font color='#F8F6BF'>1.新兵</font></p><p><font color='#F8F5A4'>2.预备军</font></p><p><font color='#F8F48C'>3.兵士</font></p><p><font color='#F8F375'>4.老兵</font></p><p><font color='#F8F25B'>5.标兵</font></p><p><font color='#F8F242'>6.护卫</font></p><p><font color='#F8F01D'>7.精锐</font></p><p><font color='#F8F006'>8.亲卫</font></p>",
						monsterNum = 750,
					},
				},
				
				boss =
				{
				title = "<p>Boss出现在地图中间的校场中!</p><p><font color='#DE6363'>注:请提前打完Boss,避免损失</font></p>",
				tips = "<p>Boss:</p><p><font color='#F8F6BF' size='14'>1.承信郎</font></p><p><font color='#F8F48C' size='14'>2.忠翊郎</font></p><p><font color='#F8F25B' size='14'>3.武德大夫</font></p><p><font color='#F8F01D' size='14'>4.团练使</font></p>",
				skillType = "绝学",
				skillDes = "无",
				monsterId = {50710011,50710012,50710013,50710018},
				png = "boss-kze.png",
				name = "演武训练官",
				monsterNum = 4,
				types = "blue",
				},
				
			},
			
		},
---------------------------------------守卫襄阳
	[1010] = {
--怪物波数
		[1] = {
				monster =
				{
					title = "<p>与<font color='#DE6363'>吕太守</font>对话,开启副本</p><p>阻止<font color='#DE6363'>100只</font>怪物进入<font color='#DE6363'>襄阳城</font></p>",
					[1] = {
						monsterId = {50720001,50720002,50720003,50720004,50720005,50720006,50720007,50720008},
						png = "999_1.png",
						name = "敌人",
						tips = "<p>襄阳城:<font color='#DE6363'>100只</font>怪物进入则<font color='#DE6363'>防守失败</font>!</p><p>第<font color='#DE6363'>1</font>波:随机1条路线进攻</p><p>第<font color='#DE6363'>2</font>波:随机1条路线进攻</p><p>第<font color='#DE6363'>3</font>波:随机2条路线进攻</p><p>第<font color='#DE6363'>4</font>波:随机2条路线进攻</p><p>第<font color='#DE6363'>5</font>波:随机3条路线进攻</p><p>第<font color='#DE6363'>6</font>波:随机?条路线进攻</p><p>第<font color='#DE6363'>7</font>波:全面进攻??</p><p>第<font color='#DE6363'>8</font>波:??????</p><p></p><p>每波小兵清除后的<font color='#DE6363'>30秒</font>,将刷新下一波</p>",
						monsterNum = "???",
					},
				},
				
				boss =
				{
				title = "<p>情报不足,无法获知<font color='#DE6363'>BOSS</font>信息</p><p>请多留心<font color='#DE6363'>后勤区域</font>的特殊事件</p>",
				tips = "<p>我军探子:</p><p>“抱歉,未曾获取到敌人BOSS的具体信息.</p><p>能知道的是敌人BOSS的任务<font color='#DE6363'>不是进入襄阳城</font>,</p><p>而是在<font color='#DE6363'>襄阳城周围</font>清剿我军!”</p>",
				skillType = "绝学:",
				skillDes = "未知",
				monsterId = {50720011,50720012,50720013,50720014,50720015,50720016,50720017,50720018},
				png = "phb_kqtx_01.png",
				name = "BOSS",
				monsterNum = "???",
				types = "hide",
				},
				
			},
				
		-- [2] = {
				-- monster =
				-- {
					-- title = "<p>怪物<font color='#DE6363'>随机一个路口</font>进攻</p>",
					-- [1] = {
						-- monsterId = {50720002},
						-- png = "boss-aqqrz.png",
						-- name = "驯兽师",
						-- tips = "第二批炮灰,依旧送经验!",
						-- monsterNum = 120,
					-- },
				-- },
				
				-- boss =
				-- {
				-- title = "清完Boss与怪物,<font color='#DE6363'>30秒</font>后刷新下一批",
				-- tips = "敌人养的‘地龙’,实际是蝾螈的一个变种",
				-- skillType = "绝学:",
				-- skillDes = "无",
				-- monsterId = {50720012},
				-- png = "boss-sx.png",
				-- name = "狂兽",
				-- monsterNum = 1,
				-- types = "hide",
				-- },
				
			-- },

		-- [3] = {
				-- monster =
				-- {
					-- title = "<p>怪物<font color='#DE6363'>随机一个路口</font>进攻</p>",
					-- [1] = {
						-- monsterId = {50720003},
						-- png = "boss-sx.png",
						-- name = "野兽",
						-- tips = "一大波怪物,正在靠近....",
						-- monsterNum = 120,
					-- },
				-- },
				
				-- boss =
				-- {
				-- title = "清完Boss与怪物,<font color='#DE6363'>30秒</font>后刷新下一批",
				-- tips = "控兽师,妖艳无比,美如蛇蝎",
				-- skillType = "绝学:",
				-- skillDes = "无",
				-- monsterId = {50720013},
				-- png = "boss-cly.png",
				-- name = "控兽师头目",
				-- monsterNum = 1,
				-- types = "green",
				-- },
				
			-- },
			
		-- [4] = {
				-- monster =
				-- {
					-- title = "<p>怪物<font color='#DE6363'>随机二个路口</font>进攻</p>",
					-- [1] = {
						-- monsterId = {50720004},
						-- png = "boss-cly.png",
						-- name = "控兽师",
						-- tips = "进攻主力的先头部队,虽然不是正规军,但是实力不容小觑",
						-- monsterNum = 240,
					-- },
				-- },
				
				-- boss =
				-- {
				-- title = "清完Boss与怪物,<font color='#DE6363'>30秒</font>后刷新下一批",
				-- tips = "指挥主力先锋,实力难测",
				-- skillType = "绝学:",
				-- skillDes = "无",
				-- monsterId = {50720014},
				-- png = "boss-jjbfz.png",
				-- name = "精锐头目",
				-- monsterNum = 1,
				-- types = "green",
				-- },
				
			-- },
			
		-- [5] = {
				-- monster =
				-- {
					-- title = "<p>怪物<font color='#DE6363'>随机二个路口</font>进攻</p>",
					-- [1] = {
						-- monsterId = {50720005},
						-- png = "boss-jjbfz.png",
						-- name = "精锐",
						-- tips = "进攻主力,请全力迎战!",
						-- monsterNum = 240,
					-- },
				-- },
				
				-- boss =
				-- {
				-- title = "清完Boss与怪物,<font color='#DE6363'>30秒</font>后刷新下一批",
				-- tips = "精通各类武器,善使‘大刀’与‘弓’,近攻远守",
				-- skillType = "绝学:",
				-- skillDes = "无",
				-- monsterId = {50720015},
				-- png = "boss-menggu002.png",
				-- name = "武士头目",
				-- monsterNum = 1,
				-- types = "blue",
				-- },
				
			-- },
			
		-- [6] = {
				-- monster =
				-- {
					-- title = "<p>敌人的总攻!</p><p><font color='#DE6363'>三个路口都会出现敌人!</font></p>",
					-- [1] = {
						-- monsterId = {50720006},
						-- png = "boss-menggu002.png",
						-- name = "武士",
						-- tips = "进攻主力,敌人众多,请全力迎战!",
						-- monsterNum = 360,
					-- },
				-- },
				
				-- boss =
				-- {
				-- title = "清完Boss与怪物,<font color='#DE6363'>30秒</font>后刷新下一批",
				-- tips = "巧取豪夺,诡计多端",
				-- skillType = "绝学:",
				-- skillDes = "无",
				-- monsterId = {50720016},
				-- png = "boss-xsdz.png",
				-- name = "近卫头目",
				-- monsterNum = 1,
				-- types = "blue",
				-- },
				
			-- },
			
		-- [7] = {
				-- monster =
				-- {
					-- title = "<p>敌人的总攻!</p><p><font color='#DE6363'>三个路口都会出现敌人!</font></p>",
					-- [1] = {
						-- monsterId = {50720007},
						-- png = "boss-xsdz.png",
						-- name = "近卫",
						-- tips = "浴血奋战的时候到了!",
						-- monsterNum = 360,
					-- },
				-- },
				
				-- boss =
				-- {
				-- title = "清完Boss与怪物,<font color='#DE6363'>30秒</font>后刷新下一批",
				-- tips = "阴阳双谋,唇枪舌剑",
				-- skillType = "绝学:",
				-- skillDes = "无",
				-- monsterId = {50720017},
				-- png = "boss-xxz.png",
				-- name = "异人头目",
				-- monsterNum = 1,
				-- types = "pink",
				-- },
				
			-- },
			
		-- [8] = {
				-- monster =
				-- {
					-- title = "<p>敌人<font color='#DE6363'>最后的</font>总攻!</p><p><font color='#DE6363'>三个路口都会出现敌人!</font></p>",
					-- [1] = {
						-- monsterId = {50720008},
						-- png = "boss-xxz.png",
						-- name = "异人",
						-- tips = "敌人最后的总攻,请务必抵挡住!",
						-- monsterNum = 360,
					-- },
				-- },
				
				-- boss =
				-- {
				-- title = "最后的战役,没有失败的理由!",
				-- tips = "鬼斧魔兵,血祭天诛",
				-- skillType = "绝学:",
				-- skillDes = "无",
				-- monsterId = {50720018},
				-- png = "boss-ty.png",
				-- name = "下位王",
				-- monsterNum = 1,
				-- types = "gold",
				-- },
				
			-- },
				
				
	},
	

------------------------------------天罡北斗阵
	[1011] = {
	--怪物波数
		[1] = {
				monster =
				{
					title = "<p>与<font color='#DE6363'>赵志敬</font>对话，开启天罡北斗阵</p><p>每次破除法阵都会出现<font color='#DE6363'>护阵灵兽</font>",
					[1] = {
						monsterId = {50732001,50732002,50732003,50732004},
						--monsterId = {50710001,50710002,50710003,50710004,50710005,50710006,50710007,50710008},
						png = "boss-sx.png",
						name = "护阵灵兽",
						tips = "<p><font color='#DE6363'>1护阵灵兽-白虎</font></p><p><font color='#DE6363'>2护阵灵兽-朱雀</font></p><p><font color='#DE6363'>3护阵灵兽-青龙</font></p><p><font color='#DE6363'>4护阵灵兽-玄武</font></p>",
						monsterNum = 4,
					},
				},
				
				boss =
				{
				title = "破除全部阵法后<font color='#DE6363'>赵志敬</font>将亲自出战，如果有一个法阵没有破除赵志敬则不会出现",
				tips = "全真掌教赵志敬",
				skillType = "绝学",
				skillDes = "无",
				monsterId = {50732005},
				png = "boss-sjjr.png",
				name = "赵志敬",
				monsterNum = 1,
				types = "blue",
				},
				
			},
			
		},
------------------------------------------------------------夫妻副本
	[1020] = {
--怪物波数
		[1] = {
				monster =
				{
					title = "<p>地图<font color = '#DE6363'>两侧</font>分别有<font color = '#DE6363'>数字1-9的箱子</p><p>夫妻双方共同<font color = '#DE6363'>开启同数字箱子</font> 5 <font color = '#DE6363'>次</font></p>",
					[1] = {
						monsterId = {50202001,50202002,50202003,50202004,50202005,50202006,50202007,50202008,50202009,50202011,50202012,50202013,50202014,50202015,50202016,50202017,50202018,50202019},
						png = "Icon_item_7100058_1.png",
						name = "箱子",
						tips = "<p>地图<font color = '#DE6363'>两侧</font>分别有<font color = '#DE6363'>数字1-9的箱子</p><p>夫妻双方共同<font color = '#DE6363'>开启同数字箱子</font> 5 <font color = '#DE6363'>次</font></p>",
						monsterNum = "??",
					},
					-- [2] = {
						-- monsterId = {50502006,50502007,50502008,50502009,50502010},
						-- png = "boss-sx.png",
						-- name = "五属性BOSS",
						-- tips = "<p>击败五属性BOSS后,五行圣兽将出现</p><p>属性相克顺序:<font color='#DE6363'>金 -> 木 -> 水 -> 火 -> 土</font></p>",
						-- monsterNum = 5,
					-- },
				},
				
				boss =
				{
				title = "达成<font color = '#DE6363'>心有灵犀 5 次后</font>,地图中将会出现<font color = '#DE6363'>Boss</font>",
				tips = "<p>他/她,被情所伤,对天下鸳鸯恨之入骨</p><p>然而却又渴望再次得到那份情</p><p>是什么让他/她如此疯狂!?</p><p> </p><p>这已经不再重要,因为--</p><p><font color = '#DE6363'>他/她现在要拆散你们!</font></p>",
				skillType = "绝学",
				skillDes = "未知",
				monsterId = {50202100,50202101},
				png = "999_1.png",
				name = "未知",
				monsterNum = 1,
				types = "gold",
				},
				
				
			},
		},
---------------------------------------小猪快跑
	[1017]={
--怪物波数
		[1] = {
			monster =
			{
				title = "在小猪愤怒之前把它们赶回猪圈，否则它们将对你发起攻击！",
				[1] = {
					monsterId = {50740001,50740002},
					png = "Icon_item_9405000_1.png",
					name = "小猪",
					tips = "<p><font color='#F8F6BF' size='14'>1.小猪</font></p><p><font color='#F8F48C' size='14'>2.愤怒的小猪</font></p>",
					monsterNum = "??",
				},			
			},
			boss =
			{
				title = "老母猪暴走之后的攻击力十分惊人，一定要尽快赶回猪圈！！",
				tips = "<p><font color='#F8F6BF' size='14'>1.老母猪</font></p><p><font color='#F8F48C' size='14'>2.暴走老母猪</font></p>",
				skillType = "绝学",
				skillDes = "野蛮冲撞",
				monsterId = {50740003,50740004},
				png = "Icon_item_9405000_1.png",
				name = "老母猪",
				monsterNum = "??",
				types = "pink",
			},
		},
	},
	

---------------------------------------卧虎藏龙
	[1013]={
-- 怪物波数
		[1] = {
			monster =
			{
				title = "卧虎藏龙",
				[1] = {
					monsterId = {},
					png = "boss-btdz.png",
					name = "玉娇龙",
					tips = "点击npc选择模式开启副本",
					monsterNum = "0",
				},			
			},
		},
		[2] = {
			monster =
			{
				title = "卧虎藏龙车轮战",
				[1] = {
					monsterId = {50770001,50770002,50770003,50770004,50770005,50770006,50770007,50770008,50770009,50770010},
					png = "boss-btdz.png",
					name = "车轮群侠",
					tips = "<p><font color='#F8F48C' size='14'>车轮群侠名录：</font></p><p><font color='#F8F48C' size='14'>晓薇</font></p><p><font color='#F8F48C' size='14'>刘雨</font></p><p><font color='#F8F48C' size='14'>南筱芸</font></p><p><font color='#F8F48C' size='14'>戈楠</font></p><p><font color='#F8F48C' size='14'>杨锋</font></p><p><font color='#F8F48C' size='14'>章博</font></p><p><font color='#F8F48C' size='14'>周静恒</font></p><p><font color='#F8F48C' size='14'>欧雅琪</font></p><p><font color='#F8F48C' size='14'>秦江</font></p><p><font color='#F8F48C' size='14'>许竹青</font></p>",
					monsterNum = "10",
				},			
			},
		},
		[3] = {
			monster =
			{
				title = "卧虎藏龙大乱斗",
				[1] = {
					monsterId = {50770011,50770012,50770017,50770018,50770019,50770020,50770021,50770022,50770023,50770024,50770026,50770027},
					png = "boss-btdz.png",
					name = "乱斗群侠",
					tips = "<p><font color='#F8F48C' size='14'>乱斗群侠名录：</font></p><p><font color='#F8F48C' size='14'>晓薇</font></p><p><font color='#F8F48C' size='14'>刘雨</font></p><p><font color='#F8F48C' size='14'>南筱芸</font></p><p><font color='#F8F48C' size='14'>戈楠</font></p><p><font color='#F8F48C' size='14'>杨锋</font></p><p><font color='#F8F48C' size='14'>阿熊</font></p><p><font color='#F8F48C' size='14'>章博</font></p><p><font color='#F8F48C' size='14'>周静恒</font></p><p><font color='#F8F48C' size='14'>欧雅琪</font></p><p><font color='#F8F48C' size='14'>秦江</font></p><p><font color='#F8F48C' size='14'>康兴哥</font></p><p><font color='#F8F48C' size='14'>许竹青</font></p>",
					monsterNum = "12",
				},	
			},
		},
	},

}
-------------------------------------------------------------------------------
----------------------------------副本内怪物记录-------------------------------
-------------------------------------------------------------------------------
_G.DuplMonsterType = {
---------------------------------大破联营
	[1003] = {
		[1] = {[50042002] = 1,[50042003] = 1,[50042004] = 1,[50042005] = 1,[50052001] = 1,[50052002] = 1,[50052003] = 1,[50052004] = 1,[50042001] = 2,},
		[2] = {[50062002] = 1,[50062001] = 2,},
		[3] = {[50092002] = 1,[50092003] = 1,[50092004] = 1,[50092005] = 1,[50102001] = 1,[50102002] = 1,[50102003] = 1,[50102004] = 1,[50092001] = 2,},
		[4] = {[50112002] = 1,[50112001] = 2,},
		[5] = {[50142001] = 1,[50142002] = 1,[50142003] = 1,[50152001] = 1,[50152002] = 1,[50152003] = 2,[50152004] = 2,[50152005] = 3,},
		["boss"] = {[50052005] = true,[50082001] = true,[50102005] = true,[50132001] = true,[50162002] = true,},
	},
-----------------真龙棋局
	[1004] = {
		[1] = {[50302002] = 1,[50302080] = 2,},
		[2] = {[50302008] = 1,[50302084] = 2,},
		[3] = {[50302014] = 1,[50302016] = 2,},
		[4] = {[50302082] = 1,[50302005] = 2,},
		[5] = {[50302054] = 1,[50302056] = 2,},
		[6] = {[50302024] = 1,[50302026] = 2,},
		[7] = {[50302086] = 1,[50302011] = 2,},
		[8] = {[50302019] = 1,[50302021] = 2,},
		[9] = {[50302049] = 1,[50302051] = 2,},
		[10] = {[50302039] = 1,[50302041] = 2,},
		[11] = {[50302044] = 1,[50302046] = 2,},
		[12] = {[50302069] = 1,[50302071] = 2,},
		[13] = {[50302074] = 1,[50302076] = 2,},
		
		["boss"] = {[50302001] = true,[50302007] = true,[50302013] = true,[50302004] = true,[50302053] = true,[50302023] = true,[50302010] = true,[50302018] = true,[50302048] = true,[50302038] = true,[50302043] = true,[50302068] = true,[50302073] = true,},
	},
---------------------------------五行道场
	[1006] = {
		[1] = {
			[50502001] = 1,
			[50502002] = 1,
			[50502003] = 1,
			[50502004] = 1,
			[50502005] = 1,
			[50502006] = 2,
			[50502007] = 2,
			[50502008] = 2,
			[50502009] = 2,
			[50502010] = 2,
		},
		["boss"] = {
			[50502011] = true,
		},
	},
---------------------------------十面埋伏
	
	[1007] = {
		[1] = {[50600001] = 1,},
		[2] = {[50600002] = 1,},
		[3] = {[50600003] = 1,},
		[4] = {[50600004] = 1,},
		[5] = {[50600005] = 1,},
		[6] = {[50600006] = 1,},
		[7] = {[50600007] = 1,},
		[8] = {[50600008] = 1,},
		[9] = {[50600009] = 1,},
		[10] = {[50600010] = 1,},
		[11] = {[50600011] = 1,},
		[12] = {[50600012] = 1,},
		[13] = {[50600013] = 1,},
		[14] = {[50600014] = 1,},
		[15] = {[50600015] = 1,},
		[18] = {[50603003] = 1,},
		
		["boss"] = {[50603001] = true,[50603002] = true,[50604001] = true,},
	},
	
---------------------烽火辎路
	[1008] = {
		[1] = {[50702001] = 1,},
		[2] = {[50702002] = 1,},
		[3] = {[50702003] = 1,},
		[4] = {[50702004] = 1,},
		[5] = {[50702005] = 1,},
		[6] = {[50702006] = 1,},
		[7] = {[50702007] = 1,},
		[8] = {[50702024] = 1,},
		["boss"] = {[50702020] = true,},
	},
---------------------演武节堂
	[1009] = {
		[1] = {[50710001] = 1,[50710002] = 1,[50710003] = 1,[50710004] = 1,[50710005] = 1,[50710006] = 1,[50710007] = 1,[50710008] = 1,},
		
		["boss"] = {[50710011] = true,[50710012] = true,[50710013] = true,[50710018] = true,},
	},
	
	---------------------小猪
	[1017] = {
		[1] = {[50740001] = 1,[50740002] = 1,[50740006] = 1,[50740007] = 1,},
		["boss"] = {
			[50740003] = true,
			[50740004] = true,
			[50740008] = true,
			[50740009] = true,
		},	
	},
	
---------------------守卫襄阳
	[1010] = {
		[1] = {[50720001] = 1,[50720002] = 1,[50720003] = 1,[50720004] = 1,[50720005] = 1,[50720006] = 1,[50720007] = 1,[50720008] = 1,},
		-- [2] = {[50720002] = 1,},
		-- [3] = {[50720003] = 1,},
		-- [4] = {[50720004] = 1,},
		-- [5] = {[50720005] = 1,},
		-- [6] = {[50720006] = 1,},
		-- [7] = {[50720007] = 1,},
		-- [8] = {[50720008] = 1,},
		
		["boss"] = {[50720011] = true,[50720012] = true,[50720013] = true,[50720014] = true,[50720015] = true,[50720016] = true,[50720017] = true,[50720018] = true,},
	},
---------------------天罡北斗阵
	[1011] = {
	    [1] = {[50732001] = 1,[50732002] = 1,[50732003] = 1,[50732004] = 1,},
		["boss"] = {[50732005] = true,},
	},
---------------------夫妻副本
	[1020] = {
		[1] = {
			[50202001] = 1,
			[50202002] = 1,
			[50202003] = 1,
			[50202004] = 1,
			[50202005] = 1,
			[50202006] = 1,
			[50202007] = 1,
			[50202008] = 1,
			[50202009] = 1,
			[50202011] = 1,
			[50202012] = 1,
			[50202013] = 1,
			[50202014] = 1,
			[50202015] = 1,
			[50202016] = 1,
			[50202017] = 1,
			[50202018] = 1,
			[50202019] = 1,
		},
		["boss"] = {
			[50202100] = true,
			[50202101] = true,
		},
	},
	

---------------------卧虎藏龙
	[1013] = {
	    [2] = {
			[50770001] = 1,
			[50770002] = 1,
			[50770003] = 1,
			[50770004] = 1,
			[50770005] = 1,
			[50770006] = 1,
			[50770007] = 1,
			[50770008] = 1,
			[50770009] = 1,
			[50770010] = 1,
			},
		[3] = {
			[50770011] = 1,
			[50770012] = 1,
			[50770013] = 0,
			[50770014] = 0,
			[50770015] = 0,
			[50770016] = 0,
			[50770017] = 1,
			[50770018] = 1,
			[50770019] = 1,
			[50770020] = 1,
			[50770021] = 1,
			[50770022] = 1,
			[50770023] = 1,
			[50770024] = 1,
			[50770025] = 5,
			[50770026] = 1,
			[50770027] = 1,
			},
			
	},
---------------------珍珑棋局
	[1014] = {
		[1] = {
			[50302001] = 1,
			[50302002] = 1,
			[50302003] = 1,
			[50302004] = 1,
			[50302005] = 1,
			[50302006] = 1,
			[50302007] = 1,
			[50302008] = 1,
			[50302009] = 1,
			[50302010] = 1,
			[50302011] = 1,
			[50302012] = 1,
			[50302013] = 1,
			[50302014] = 1,
			[50302015] = 1,
			[50302016] = 1,
			[50302017] = 1,
			[50302018] = 1,
			[50302019] = 1,
			[50302020] = 1,
			[50302021] = 1,
			[50302022] = 1,
			[50302023] = 1,
			[50302024] = 1,
			[50302025] = 1,
			[50302026] = 1,
			[50302027] = 1,
			[50302028] = 1,
			[50302029] = 1,
			[50302030] = 1,
			[50302031] = 1,
			[50302032] = 1,
			[50302033] = 1,
			[50302034] = 1,
			[50302035] = 1,
			[50302036] = 1,
			[50302037] = 1,
			[50302038] = 1,
			[50302039] = 1,
			[50302040] = 1,
			[50302041] = 1,
			[50302042] = 1,
			[50302043] = 1,
			[50302044] = 1,
			[50302045] = 1,
			[50302046] = 1,
			[50302047] = 1,
			[50302048] = 1,
			[50302049] = 1,
			[50302050] = 1,
			[50302051] = 1,
			[50302052] = 1,
			[50302053] = 1,
			[50302054] = 1,
			[50302055] = 1,
			[50302056] = 1,
			[50302057] = 1,
			[50302058] = 1,
			[50302059] = 1,
			[50302060] = 1,
			[50302061] = 1,
			[50302062] = 1,
			[50302063] = 1,
			[50302064] = 1,
			[50302065] = 1,
			[50302066] = 1,
			[50302067] = 1,
			[50302068] = 1,
			[50302069] = 1,
			[50302070] = 1,
			[50302071] = 1,
			[50302072] = 1,
			[50302073] = 1,
			[50302074] = 1,
			[50302075] = 1,
			[50302076] = 1,
			[50302077] = 1,
			[50302078] = 1,
			[50302079] = 1,
			[50302080] = 1,
			[50302081] = 1,
			[50302082] = 1,
			[50302083] = 1,
			[50302084] = 1,
			[50302085] = 1,
			[50302086] = 1,
			[50302087] = 1,
			[50302088] = 1,
			[50302089] = 1,
			[50302090] = 1,
			[50302091] = 1,
			[50302092] = 1,
			[50302093] = 1,
			[50302094] = 1,
			[50302095] = 1,
			[50302096] = 1,
			[50302097] = 1,
			[50302098] = 1,
			[50302099] = 1,
			[50302100] = 1,
			},
	},

---------------------通天塔
	[1015] = {
		[1] = {
			[51000001] = 1,
			[51000002] = 1,
			[51000003] = 1,
			[51000004] = 1,
			[51000005] = 1,
			[51000006] = 1,
			[51000007] = 1,
			[51000008] = 1,
			[51000009] = 1,
			[51000010] = 1,
			[51000011] = 1,
			[51000012] = 1,
			[51000013] = 1,
			[51000014] = 1,
			[51000015] = 1,
			[51000016] = 1,
			[51000017] = 1,
			[51000018] = 1,
			[51000019] = 1,
			[51000020] = 1,
			[51000021] = 1,
			[51000022] = 1,
			[51000023] = 1,
			[51000024] = 1,
			[51000025] = 1,
			[51000026] = 1,
			[51000027] = 1,
			},
	},
	
}

-------------------------------------------------------------------------------------
------------------------------副本内显示时间-----------------------------------------
-------------------------------------------------------------------------------------
_G.DuplShowTime = {
	fastPng = "Icon_sk_zq_1001_1.png",
	png = function(fastTime, pastTime)      
		local showPng = ""
		if fastTime > pastTime then
			showPng = "Icon_sk_13008_1.png";
		else
			showPng = "Icon_Buff_1004_1.png";
		end;					
		return showPng;
	end;
}

------------------------------------------------------------------------
--------------------------------珍珑棋局boss----------------------------
------------------------------------------------------------------------
_G.ZLBossTbl = {
	size = 13,
	boss = {
		[50302001] = 1,				
		[50302007] = 2,
		[50302013] = 3,
		[50302004] = 4,
		[50302053] = 5,			
		[50302023] = 6,
		[50302010] = 7,		
		[50302018] = 8,
		[50302048] = 9,
		[50302038] = 10,				
		[50302043] = 11,
		[50302068] = 12,					
		[50302073] = 13,
	},
}

_G.DuplTbl = {
	[1004] = true,
}

_G.EnterDuplSilver = {
	[1004] = 20000,
}

_G.DefaultPng = "999_1.png"
_G.PassPng = "Fbtg.png";

--进入副本事件
_G.EnterDuplEvent = {
	[1003] = _G.enumPlayerEventType.EventDaPoDungeon,
	[1006] = _G.enumPlayerEventType.EventWuXingDungeon,
	[1008] = _G.enumPlayerEventType.EventFengHuoDungeon,
	[1009] = _G.enumPlayerEventType.EventYanWuDungeon,
	[1010] = _G.enumPlayerEventType.EventShowWeiDungeon,
	[1013] = _G.enumPlayerEventType.EventWohuDungeon,
}
--通关副本事件
_G.EnterPassEvent = {
	[1003] = _G.enumPlayerEventType.EventPassDaPoDungeon,
	[1006] = _G.enumPlayerEventType.EventPassWuXingDungeon,
	[1008] = _G.enumPlayerEventType.EventPassFengHuoDungeon,
	[1009] = _G.enumPlayerEventType.EventPassYanWuDungeon,
	[1010] = _G.enumPlayerEventType.EventPassShowWeiDungeon,
	[1020] = _G.enumPlayerEventType.EventPassFuQiDungeon,
	[1007] = _G.enumPlayerEventType.EventPassMaiFuDungeon,
	[1013] = _G.enumPlayerEventType.EventPassWohuDungeon,
}

--小猪快跑快捷栏的技能ID
_G.UIRunSkill = 
{
	[1] = 52000,
	[2] = 52001,
}

_G.DuplShowPanel = 
{
	[1017] = true,
};

--副本专属界面配置
_G.UIDuplOwnConfig = 
{
	[1017] = "CUIPigRun";
}