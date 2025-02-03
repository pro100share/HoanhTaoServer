--[[
	收集系统配置
	周长沙
	2013-1-22
--]]
_G.CollectTextConfig = 
{
	dwIconW			= 100;
	dwIconH			= 100;
	dwHPMax 		= "生命上限";
	dwMPMax 		= "内力上限";
	dwAttack		= "攻    击";
	dwDefense 		= "防    御";
	dwFlee 			= "身    法";
	dwCrit 			= "暴    击";
	dwMoveSpeed 	= "移动速度";
	dwAttackSpeed 	= "攻击速度";
	dwAppendCrit  = "暴击伤害";
	dwPoJiaValue = "破甲攻击";	
	
	tipPageComplete = "<font color='#00ff00'>已全部激活</font>";
	tipPageLock = "<font color='#ff0000'>需%d级解锁</font>";
	tipProgress = "<font color='#6CE7EE'>当前激活：</font><font color='#dcd9d9'>%d/%d</font><br/><font color='#6BDD65'>风物志分</font><font color='#FDF445'>山河志、尤物志、古学志、古玩志</font><font color='#6BDD65'>等大类</font><br><font color='#6BDD65'>每一类下由诸多小类组成，激活每一小类均可获得属性加成</font><br><font color='#6BDD65'>激活小类需要提交所需道具，全部提交完整方可成功激活。</font>";
	tipBtn = "自动将背包中此类道具全部提交";
	tipSeriesComplete = "<font color='#00ff00'>已激活</font>";
	tipSeriesUnComplete = "<font color='#ff0000'>未激活：%d/%d</font>";
	tipSeriesDes = "<font color='#6BDD65'>收集完整后属性加成</font>";
	tipValue = "<font color='#D9671B'>%s + %d</font>";
	
	lblBtn = "全部提交";
	lblBtnC = "收集完整";
	
	tipTitle = "<font color='#6BDD65'>收集完整后属性加成</font>";--标题
	tipStunnerTitle = "<font color='#6BDD65' size = '16'>当前属性加成</font>";--标题
	tipComplete = "<font color='#FDF445' >%s +%d</font>";--激活后属性+数值
	tipStunner = "<font color='#FDF445' size= '14'>%s：%d/%d</font>";--激活后属性 当前数值/总数值[[<p align = 'right'>]]..self.BaseFont..str..[[</font></p>]]
	tipStunner1 = "%s<br><font color='#6CE7EE'>收集进度：</font><font color='#dcd9d9'>%d/%d</font><br>%s";
	tipUnComplete = "<font color='#FDF445'>%s</font> <font color='#cdc6c4'>+%d</font>";--未激活属性+数值
	StunnerNum = "<font color='#FDF445'>%d/%d</font>";		  --尤物志未完成角标进度字体颜色	
	StunnerNum1 = "<font color='#FDF445'>%d/%d</font>"; 	  --尤物志完成角标进度字体颜色	
	Noitce = "恭喜%s完成【风物志】中【%s-%s】收集 %s";
	NoitceCompose = "恭喜%s完成【风物志】中【%s】收集 %s";
	MeToo = "我也要收集";
	ShunXu = {"dwHPMax","dwMPMax","dwAttack","dwDefense","dwFlee","dwCrit","dwMoveSpeed","dwAttackSpeed","dwAppendCrit","dwPoJiaValue"};

}


local str = [[此类道具为<u><a href = 'asfunction:hrefevent'><font color = '#6BDD65'>%s</font></a></u>中怪物掉落<br><font color='#cdc6c4'>点击“全部提交”按钮可将背包中道具提交进风物志中，以上道具全部提交完整则获得属性加成</font> ]]
str = [[<font size="14">]]..str..[[</font>]]

_G.CollectConfig = 
{
	[1] = 
	{--页签 1
		szName = "山河志";--页签名字
		dwPic = 1;
		dwLevel = 31;--解锁等级
		dwSubConfig = 0;--外接配置
		szRollDes = "<p><font color='#6BDD65'>记载中华各地的美好河山，名胜古迹，人文情怀。</font></p>";
		[1] = 
		{--系列 1
			dwLevel = 31;--解锁等级
			szName = "<font color='#FDF445'>绝情密涧</font>";--系列名
			dwPic = 1;--图片索引id
			szDes = string.format(str,[[绝情密涧]]);
			szComTips = "绝情密涧已全部收集完成<br>已获得相应属性加成";
			dwIndex = 1005;--上面超链接文字超链接的地图ID
			Reward = --奖励属性
			{
				dwHPMax = 403;--生命上限
				dwMPMax = 29;--内力上限
				dwAttack = 115;--攻击
				dwDefense = 58;--防御
				--dwFlee = 10000;--身法
				--dwCrit = 10000;--暴击
				--dwMoveSpeed = 10000;--移动速度
				--dwAttackSpeed = 10000;--攻击速度
			};
			Item = --需求的道具id和数量
			{

				[1] = {Id=8100030,Num=15};
				[2] = {Id=8100010,Num=10};				
				[3] = {Id=8100020,Num=5};				
				[4] = {Id=8100040,Num=2};				
								
			};
		};
		[2] = 
		{
			dwLevel = 38;
			szName = "<font color='#FDF445'>大理</font>";
			dwPic = 4;
			szDes = string.format(str,[[大理]]);
			dwIndex = 1006;
			szComTips = "大理已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 525;
				dwMPMax = 38;
				dwAttack = 150;
				dwDefense = 75;
				dwFlee = 32;
				--dwCrit = 1000;
				--dwMoveSpeed = 1000;
				--dwAttackSpeed = 1000;
			};
			Item = 
			{


				[1] = {Id=8100090,Num=20};
				[2] = {Id=8100050,Num=15};				
				[3] = {Id=8100060,Num=10};				
				[4] = {Id=8100080,Num=5};				
				[5] = {Id=8100070,Num=2};				
				
							
			};
		};
		[3] = 
		{
			dwLevel = 49;
			szName = "<font color='#FDF445'>白驼山</font>";
			dwPic = 2;
			szDes = string.format(str,[[白驼山]]);
			dwIndex = 1007;
			szComTips = "白驼山已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 788;
				dwMPMax = 57;
				dwAttack = 225;
				dwDefense = 113;
				dwFlee = 48;
				dwCrit = 36;
			};
			Item = 
			{

				[1] = {Id=8100130,Num=40};
				[2] = {Id=8100120,Num=20};				
				[3] = {Id=8100110,Num=15};				
				[4] = {Id=8100140,Num=10};				
				[5] = {Id=8100150,Num=5};				
				[6] = {Id=8100100,Num=2};				
								
				
			};
		};
		[4] = 
		{
			dwLevel = 59;
			szName = "<font color='#FDF445'>终南山</font>";
			dwPic = 3;
			szDes = string.format(str,[[终南山]]);
			dwIndex = 1008;
			szComTips = "终南山已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 1173;
				dwMPMax = 84;
				dwAttack = 335;
				dwDefense = 168;
				dwFlee = 71;
				dwCrit = 54;
			};
			Item = 
			{

				[1] = {Id=8100210,Num=40};
				[2] = {Id=8100160,Num=20};
				[3] = {Id=8100180,Num=15};				
				[4] = {Id=8100170,Num=10};				
				[5] = {Id=8100190,Num=5};				
				[6] = {Id=8100200,Num=2};



				
			};
		};
		[5] = 
		{
			dwLevel = 69;
			szName = "<font color='#FDF445'>丐帮竹林</font>";
			dwPic = 6;
			szDes = string.format(str,[[丐帮竹林]]);
			dwIndex = 1009;
			szComTips = "丐帮竹林已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 1698;
				dwMPMax = 122;
				dwAttack = 485;
				dwDefense = 243;
				dwFlee = 102;
				dwCrit = 78;
			};
			Item = 
			{
				[1] = {Id=8100230,Num=40};
				[2] = {Id=8100240,Num=20};				
				[3] = {Id=8100250,Num=15};				
				[4] = {Id=8100220,Num=10};				
				[5] = {Id=8100270,Num=5};				
				[6] = {Id=8100260,Num=2};				
				
			};
		};
		[6] = 
		{
			dwLevel = 79;
			szName = "<font color='#FDF445'>华山</font>";
			dwPic = 7;
			szDes = string.format(str,[[华山]]);
			dwIndex = 1010;
			szComTips = "华山已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 2345;
				dwMPMax = 168;
				dwAttack = 670;
				dwDefense = 335;
				dwFlee = 141;
				dwCrit = 108;
				dwAttackSpeed = 40;
			};
			Item = 
			{

				[1] = {Id=8100300,Num=80};
				[2] = {Id=8100290,Num=40};				
				[3] = {Id=8100310,Num=20};				
				[4] = {Id=8100280,Num=15};				
				[5] = {Id=8100330,Num=10};				
				[6] = {Id=8100320,Num=5};
				[7] = {Id=8100340,Num=2};				
				
			};
		};
		[7] = 
		{
			dwLevel = 89;
			szName = "<font color='#FDF445'>嵩山少林</font>";
			dwPic = 5;
			szDes = string.format(str,[[嵩山少林]]);
			dwIndex = 1011;
			szComTips = "嵩山少林已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 3168;
				dwMPMax = 227;
				dwAttack = 905;
				dwDefense = 453;
				dwFlee = 191;
				dwCrit = 145;
				dwAttackSpeed = 80;
			};
			Item = 
			{

				[1] = {Id=8100410,Num=80};
				[2] = {Id=8100360,Num=40};				
				[3] = {Id=8100400,Num=20};				
				[4] = {Id=8100380,Num=15};				
				[5] = {Id=8100390,Num=10};				
				[6] = {Id=8100350,Num=5};				
				[7] = {Id=8100370,Num=2};
				
			};
		};
		[8] = 
		{
			dwLevel = 99;
			szName = "<font color='#FDF445'>昆仑山</font>";
			dwPic = 8;
			szDes = string.format(str,[[昆仑山]]);
			dwIndex = 1012;
			szComTips = "昆仑已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 7500;
				dwMPMax = 375;
				dwAttack = 1500;
				dwDefense = 750;
				dwFlee = 315;
				dwCrit = 240;
				dwAttackSpeed = 120;
			};
			Item = 
			{

				[1] = {Id=8100411,Num=120};
				[2] = {Id=8100418,Num=80};				
				[3] = {Id=8100413,Num=40};				
				[4] = {Id=8100412,Num=20};				
				[5] = {Id=8100416,Num=15};				
				[6] = {Id=8100417,Num=10};				
				[7] = {Id=8100415,Num=5};
				[8] = {Id=8100414,Num=2};
				
			};
		};
		[9] = 
		{
			dwLevel = 109;
			szName = "<font color='#FDF445'>黑水遗迹</font>";
			dwPic = 9;
			szDes = string.format(str,[[黑水遗迹]]);
			dwIndex = 1013;
			szComTips = "黑水遗迹已全部收集完成<br>已获得相应属性加成";
			Reward = 
			{
				dwHPMax = 12500;
				dwMPMax = 625;
				dwAttack = 2500;
				dwDefense = 1250;
				dwFlee = 525;
				dwCrit = 400;
				dwAttackSpeed = 150;
			};
			Item = 
			{

				[1] = {Id=8101950,Num=120};
				[2] = {Id=8101960,Num=80};				
				[3] = {Id=8101970,Num=40};				
				[4] = {Id=8101980,Num=20};				
				[5] = {Id=8101990,Num=15};				
				[6] = {Id=8102000,Num=10};				
				[7] = {Id=8102010,Num=5};
				[8] = {Id=8102020,Num=2};
				
			};
		};
	
	
	};
	[2] = 
	{
		szName = "古学志";
		dwLevel = 45;
		dwPic = 2;
		dwLockPic = 2;
		dwSubConfig = 1;--外接配置
		szRollDes = "<p><font color='#6BDD65'>记载了古中国的兵法、历史、医学等古学经典名著。</font></p>";
		szRollDesLock = "<p><font color='#6BDD65'>记载了古中国的兵法、历史、医学等古学经典名著。<br>敬请期待！</font></p>";
		[1] = {	Item = {};};
	};
	[3] = 
	{
		szName = "尤物志";
		dwLevel = 31;
		dwPic = 3;
		dwLockPic = 3;
		dwHideNum = "显示数字";
		dwShowNum = "隐藏数字";
		dwSubConfig = 2;--外接配置
		szRollDes = "<p><font color='#6BDD65'>记载了江湖中十位绝色美女的画像。</font></p>";
		szRollDesLock = "<p><font color='#6BDD65'>记载了江湖中十位绝色美女的画像。<br>敬请期待！</font></p>";
		[1] = 
		{
			szName = "<font color='#FDF445'>道家</font>";
			Reward = 
			{
				dwDefense = 0;
			};
			Item = 
			{
				[1] = {Id=8100430,Num=1};
			};
		};
	};
	[4] = 
	{
		szName = "古玩志";--山海志
		dwLevel = 81;
		dwPic = 4;
		dwLockPic = 4;
		szRollDes = "<p><font color='#6BDD65'>记载了华夏五千年来保存的珍贵文物的相关资料。</font></p>";
		szRollDesLock = "<p><font color='#6BDD65'>记载了华夏五千年来保存的珍贵文物的相关资料。</font></p>";
		[1] = 
		{
			szName = "<font color='#FDF445'>道家</font>";
			Reward = 
			{
				dwDefense = 0;
			};
			Item = 
			{
				[1] = {Id=8100430,Num=1};
			};
		};
	};
	[5] = 
	{
		szName = "神秘的内容";--神农志
		dwLevel = 150;
		dwPic = 6;
		dwLockPic = 6;
		szRollDes = "<p><font color='#6BDD65'>记载了神秘的内容<br>敬请期待！</font></p>";
		szRollDesLock = "<p><font color='#6BDD65'>记载了神秘的内容<br>敬请期待！</font></p>";
	};


	
};

--古学志配置
_G.CollectSubConfig = {
	szSubmitBtn = "合成";
	szListBtn = "显示列表";
	szListBtnHide = "隐藏列表";
	szHave = "已合成";
	szNoHave = "未合成";
	[1] = {
		szDes = "说明";
		Notice = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		Items = {
			[1] = {
				dwItemID = 8101010;
				NeedItem = {
					{8100590,1};--id,num 
					{8100580,40};
					{8100460,40};
					{8100520,40};
				};
				NeedMoney = 50000000;
			};
			[2] = {
				dwItemID = 8101020;
				NeedItem = {
					{8100600,1};--id,num 
					{8100550,40};
					{8100490,40};
					{8100540,40};
				};
				NeedMoney = 50000000;
			};
			[3] = {
				dwItemID = 8101030;
				NeedItem = {
					{8100610,1};--id,num 
					{8100560,40};
					{8100490,40};
					{8100540,40};
				};
				NeedMoney = 50000000;
			};
			[4] = {
				dwItemID = 8101040;
				NeedItem = {
					{8100620,1};--id,num 
					{8100560,40};
					{8100460,40};
					{8100520,40};
				};
				NeedMoney = 50000000;
			};
			[5] = {
				dwItemID = 8101050;
				NeedItem = {
					{8100630,1};--id,num 
					{8100570,40};
					{8100470,40};
					{8100510,40};
				};
				NeedMoney = 50000000;
			};
			[6] = {
				dwItemID = 8101060;
				NeedItem = {
					{8100640,1};--id,num 
					{8100580,40};
					{8100480,40};
					{8100530,40};
				};
				NeedMoney =50000000;
			};
			[7] = {
				dwItemID = 8101070;
				NeedItem = {
					{8100650,1};--id,num  
					{8100580,40};
					{8100470,40};
					{8100510,40};
				};
				NeedMoney = 50000000;
			};
			[8] = {
				dwItemID = 8101080;
				NeedItem = {
					{8100660,1};--id,num  
					{8100570,40};
					{8100490,40};
					{8100540,40};
				};
				NeedMoney = 50000000;
			};
			[9] = {
				dwItemID = 8101090;
				NeedItem = {
					{8100670,1};--id,num 
					{8100550,40};
					{8100460,40};
					{8100520,40};
				};
				NeedMoney = 50000000;
			};
			[10] = {
				dwItemID = 8101100;
				NeedItem = {
					{8100680,1};--id,num 
					{8100560,40};
					{8100470,40};
					{8100510,40};
				};
				NeedMoney = 50000000;
			};
			[11] = {
				dwItemID = 8101110;
				NeedItem = {
					{8100690,1};--id,num  
					{8100570,40};
					{8100480,40};
					{8100530,40};
				};
				NeedMoney = 50000000;
			};
			[12] = {
				dwItemID = 8101120;
				NeedItem = {
					{8100700,1};--id,num  
					{8100550,40};
					{8100480,40};
					{8100530,40};
				};
				NeedMoney = 50000000;
			};
		};
		--[[
			dwHPMax --生命
			dwMPMax --内力
			dwAttack --攻击
			dwDefense --防御
			dwFlee --身法
			dwCrit --暴击
		--]]
		Values = {
			[0] = {--	特殊属性
				szValueName = "暴击";
				szValueType = "dwCrit";
				Reward = 
			{
				dwHPMax = 12000;                                                  --这里的数值为合成12本书加成的属性
				--dwMPMax = 1200;
				dwAttack = 3000;
				dwDefense = 1500;
				dwFlee = 420;
				dwCrit = 300;
				--dwMoveSpeed  = 1200;
				--dwAttackSpeed = 1200;
			};

				szTips = "<font color = '#FFFFFF'>每激活一本书属性加成</font><br>生命上限 +1000<br>攻    击 +250<br>防    御 +125<br>身    法 +35<br>暴    击 +25<br>";           --根据最终属性修改内容
				szNowTip = "<font color='#6BDD65'>当前属性加成</font><br>";
				szPic = "img://Qita_collect_pass_0.png";
				szGrayPic = "img://Qita_collect_pass_1.png";
			};
			[1] = {
				szValueName = "攻击";
				szValueType = "dwAttack";
				dwValue = 600;
				szValueText = "攻击+600";
				szTips = "激活后属性加成<br>攻击+600<br>合成<font color='#FF6100'>本草纲目、春秋、六韬、孟德新书</font>可激活";
				szPic = "img://Qita_collect_point01_0.png";
				szGrayPic = "img://Qita_collect_point01_1.png";
			};
			[2] = {
				szValueName = "生命";
				szValueType = "dwHPMax";
				dwValue = 3000;
				szValueText = "生命+3000";
				szTips = "激活后属性加成<br>生命+3000<br>合成<font color='#FF6100'>春秋、鬼谷子、孟德新书、青囊书</font>可激活";
				szPic = "img://Qita_collect_point02_0.png";
				szGrayPic = "img://Qita_collect_point02_1.png";
			};
			[3] = {
				szValueName = "攻击速度";
				szValueType = "dwAttackSpeed";
				dwValue = 500;
				szValueText = "攻速+500";
				szTips = "激活后属性加成<br>攻击速度+500<br>合成<font color='#FF6100'>鬼谷子、黄帝内经、青囊书、三略</font>可激活";
				szPic = "img://Qita_collect_point03_0.png";
				szGrayPic = "img://Qita_collect_point03_1.png";
			};
			[4] = {
				szValueName = "防御";
				szValueType = "dwDefense";
				dwValue = 300;
				szValueText = "防御+300";
				szTips = "激活后属性加成<br>防御+300<br>合成<font color='#FF6100'>六韬、孟德新书、史记、孙子兵法</font>可激活";
				szPic = "img://Qita_collect_point04_0.png";
				szGrayPic = "img://Qita_collect_point04_1.png";
			};
			[5] = {
				szValueName = "暴击";
				szValueType = "dwCrit";
				dwValue = 120;
				szValueText = "暴击+120";
				szTips = "激活后属性加成<br>暴击+120<br>合成<font color='#FF6100'>孟德新书、青囊书、孙子兵法、吴子兵法</font>可激活";
				szPic = "img://Qita_collect_point05_0.png";
				szGrayPic = "img://Qita_collect_point05_1.png";
			};
			[6] = {
				szValueName = "身法";
				szValueType = "dwFlee";
				dwValue = 150;
				szValueText = "身法+150";
				szTips = "激活后属性加成<br>身法+150<br>合成<font color='#FF6100'>青囊书、三略、吴子兵法、左传</font>可激活";
				szPic = "img://Qita_collect_point06_0.png";
				szGrayPic = "img://Qita_collect_point06_1.png";
			};
		
		};
	};
};

--尤物志配置
_G.StunnerConfig = {
[1] = {
		szName="襄阳红娘";
		szDes = "<font color='#6BDD65'>襄阳红娘</font><br>爱侣古城沐红绸，共结连理行江湖。<br><font color='#DCDCDC'>此类道具由初级尤物志礼包开出，世界BOSS、恶人谷BOSS、副本BOSS、珍珑棋局BOSS掉落、风云任务奖励。</font>";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 11;
		szPicBig = "img://collect_xiangyanghongniang_0.jpg";				--szPicBig彩色大图片	
		szComTips = "襄阳红娘已全部收集完成<br>已获得相应属性加成";   --收集完成按钮 Tips内容
		szRollDes = "<font color='#6BDD65'>襄阳红娘</font>";
		szRollDesLock = "<p><font color='#6BDD65'>襄阳红娘<br>爱侣古城沐红绸，共结连理行江湖。</font></p>";
		dwLevel = 31;                                                --级别
		Items = {		--szPic彩色图片，szGrayPic灰色图片，NeedItem = {8100701,1} 物品ID和 数量
			[1] = 	{szPic = "img://collect_8100701_0.png";	szGrayPic = "img://collect_8100701_1.png";NeedItem = {8100701,1};};
			-- [2] = 	{szPic = "img://2.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100702,1};};
			-- [3] = 	{szPic = "img://3.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100703,1};};
			-- [4] = 	{szPic = "img://4.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100704,1};};
			-- [5] = 	{szPic = "img://5.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100705,1};};
			-- [6] = 	{szPic = "img://6.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100706,1};};
			-- [7] = 	{szPic = "img://7.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100707,1};};
			-- [8] = 	{szPic = "img://8.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100708,1};};
			-- [9] = 	{szPic = "img://9.png";	szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100709,1};};
			-- [10] = 	{szPic = "img://10.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100710,1};};
			-- [11] = 	{szPic = "img://11.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100711,1};};
			-- [12] = 	{szPic = "img://12.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100712,1};};
			-- [13] = 	{szPic = "img://13.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100713,1};};
			-- [14] = 	{szPic = "img://14.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100714,1};};
			-- [15] =	{szPic = "img://15.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100715,1};};
			-- [16] = 	{szPic = "img://16.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100716,1};};
			-- [17] =	{szPic = "img://17.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100717,1};};
			-- [18] =	{szPic = "img://18.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100718,1};};
			-- [19] = 	{szPic = "img://19.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100719,1};};
			-- [20] = 	{szPic = "img://20.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100720,1};};
			-- [21] = 	{szPic = "img://21.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100721,1};};
			-- [22] = 	{szPic = "img://22.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100722,1};};
			-- [23] = 	{szPic = "img://23.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100723,1};};
			-- [24] = 	{szPic = "img://24.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100724,1};};
				};
		--RewardSmall 完成小图片每个加成属性，RewardBig 完成大图片加成属性
		--dwHPMax ：生命		dwMPMax ：内力	dwAttack ：攻击		dwDefense ：防御		dwFlee ：身法	dwCrit ：暴击	dwMoveSpeed：移动速度		dwAttackSpeed ：攻速
		RewardSmall	= {dwAttack = 20;dwDefense = 10;dwHPMax = 100;dwMPMax = 4;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwAttack = 100;dwDefense = 50;dwHPMax = 500;dwMPMax = 20;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		};
[2] = {
		szName="郊野温香";
		szDes = "<font color='#6BDD65'>郊野温香</font><br>涛涛战火连荒野，软玉卸妆守襄阳。<br><font color='#DCDCDC'>此类道具由初级尤物志礼包开出，世界BOSS、恶人谷BOSS、副本BOSS、珍珑棋局BOSS掉落、风云任务奖励。</font>";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 12;
		szPicBig = "img://collect_jiaoyewenxiang_0.jpg";				--szPicBig彩色大图片	
		szComTips = "郊野温香已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>郊野温香</font>";
		szRollDesLock = "<p><font color='#6BDD65'>郊野温香<br>涛涛战火连荒野，软玉卸妆守襄阳。</font></p>";
		dwLevel = 31;
		Items = {
			[1] = 	{szPic = "img://collect_8100725_0.png";szGrayPic = "img://collect_8100725_1.png";NeedItem = {8100725,2};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100726,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100727,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100728,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100729,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100730,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100731,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100732,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100733,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100734,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100735,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100736,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100737,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100738,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100739,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100740,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100741,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100742,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100743,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100744,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100745,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100746,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100747,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100748,1};};
				};
		RewardSmall	= {dwAttack = 30;dwDefense = 15;dwHPMax = 150;dwMPMax = 6;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwAttack = 150;dwDefense = 75;dwHPMax = 750;dwMPMax = 30;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		};
[3] = {
		szName="白陀舞姬";
		szDes = "<font color='#6BDD65'>白陀舞姬</font><br>漫天黄沙卷邪欲，侠行万里斩异妖。<br><font color='#DCDCDC'>此类道具由初级尤物志礼包开出，世界BOSS、恶人谷BOSS、副本BOSS、珍珑棋局BOSS掉落、风云任务奖励。</font>";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 13;
		szPicBig = "img://collect_baituowuji_0.jpg";				--szPicBig彩色大图片，		
		szComTips = "白陀舞姬已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>白陀舞姬</font>";
		szRollDesLock = "<p><font color='#6BDD65'>白陀舞姬<br>漫天黄沙卷邪欲，侠行万里斩异妖。</font></p>";
		dwLevel = 31;
		Items = {
			[1] = 	{szPic = "img://collect_8100749_0.png";szGrayPic = "img://collect_8100749_1.png";NeedItem = {8100749,3};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100750,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100751,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100752,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100753,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100754,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100755,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100756,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100757,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100758,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100759,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100760,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100761,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100762,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100763,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100764,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100765,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100766,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100767,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100768,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100769,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100770,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100771,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100772,1};};
				};
		RewardSmall	= {dwAttack = 40;dwDefense = 20;dwHPMax = 200;dwMPMax = 8;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwAttack = 200;dwDefense = 100;dwHPMax = 1000;dwMPMax = 40;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};				
		};
[4] = {
		szName="绝情玉女";
		szDes = "<font color='#6BDD65'>绝情玉女</font><br>暗黑泉涧无天日，绮梦幽境亦有情。<br><font color='#DCDCDC'>此类道具由初级尤物志礼包开出，世界BOSS、恶人谷BOSS、副本BOSS、珍珑棋局BOSS掉落、风云任务奖励。</font>";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 14;
		szPicBig = "img://collect_jueqingyunv_0.jpg";				--szPicBig彩色大图片，szGrayPicBig灰色大图片		
		szComTips = "绝情玉女已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>绝情玉女</font>";
		szRollDesLock = "<p><font color='#6BDD65'>绝情玉女<br>暗黑泉涧无天日，绮梦幽境亦有情。</font></p>";
		dwLevel = 31;
		Items = {
			[1] = 	{szPic = "img://collect_8100773_0.png";szGrayPic = "img://collect_8100773_1.png";NeedItem = {8100773,4};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100774,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100775,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100776,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100777,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100778,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100779,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100780,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100781,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100782,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100783,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100784,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100785,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100786,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100787,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100788,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100789,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100790,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100791,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100792,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100793,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100794,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100795,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100796,1};};
				};
		RewardSmall	= {dwHPMax = 300;dwMPMax = 12;dwAttack = 60;dwDefense = 30;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwHPMax = 1500;dwMPMax = 60;dwAttack = 300;dwDefense = 150;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};	
		};
[5] = {
		szName="西域佳人";
		szDes = "<font color='#6BDD65'>西域佳人</font><br>葡萄美酒醉风情，灵兽相伴走天涯。<br><font color='#DCDCDC'>此类道具由初级尤物志礼包开出，世界BOSS、恶人谷BOSS、副本BOSS、珍珑棋局BOSS掉落、风云任务奖励。</font>";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 15;
		szPicBig = "img://collect_xiyujiaren_0.jpg";				--szPicBig彩色大图片，szGrayPicBig灰色大图片		
		szComTips = "西域佳人已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>西域佳人</font>";
		szRollDesLock = "<p><font color='#6BDD65'>西域佳人<br>葡萄美酒醉风情，灵兽相伴走天涯。</font></p>";
		dwLevel = 31;
		Items = {		
			[1] = 	{szPic = "img://collect_8100797_0.png";szGrayPic = "img://collect_8100797_1.png";NeedItem = {8100797,5};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100798,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100799,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100800,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100801,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100802,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100803,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100804,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100805,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100806,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100807,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100808,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100809,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100810,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100811,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100812,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100813,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100814,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100815,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100816,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100817,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100818,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100819,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100820,1};};
				};
		RewardSmall	= {dwHPMax = 400;dwMPMax = 16;dwAttack = 80;dwDefense = 40;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwHPMax = 2000;dwMPMax = 80;dwAttack = 400;dwDefense = 200;dwFlee = 0;dwCrit = 0;dwMoveSpeed  = 0;dwAttackSpeed = 0;};	
		};
[6] = {
		szName="江南秀阮";
		szDes = "<font color='#6BDD65'>江南秀阮</font><br>儿女誓雪世家仇，乱世江湖风云起。";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 16;
		szPicBig = "img://collect_jiangnanxiuruan_0.jpg";				--szPicBig彩色大图片，szGrayPicBig灰色大图片		
		szComTips = "江南秀阮已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>江南秀阮</font>";
		szRollDesLock = "<p><font color='#6BDD65'>江南秀阮<br>儿女誓雪世家仇，乱世江湖风云起。</font></p>";
		dwLevel = 150;
		Items = {
			[1] = 	{szPic = "img://collect_8100821_0.png";szGrayPic = "img://collect_8100821_1.png";NeedItem = {8100821,1};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
				};
		RewardSmall	= {dwHPMax = 1200;dwMPMax = 0;dwAttack = 300;dwDefense = 150;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwHPMax = 12000;dwMPMax = 0;dwAttack = 3000;dwDefense = 1500;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};	
		};
[7] = {
		szName="深谷罗敷";
		szDes = "<font color='#6BDD65'>深谷罗敷</font><br>寂寞年华锁春心，恶人谷底血成河。";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 17;
		szPicBig = "img://collect_shenguluofu_0.jpg";				--szPicBig彩色大图片，szGrayPicBig灰色大图片		
		szComTips = "深谷罗敷已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>深谷罗敷</font>";
		szRollDesLock = "<p><font color='#6BDD65'>深谷罗敷<br>寂寞年华锁春心，恶人谷底血成河。</font></p>";
		dwLevel = 150;
		Items = {
			[1] = 	{szPic = "img://collect_8100845_0.png";szGrayPic = "img://collect_8100845_1.png";NeedItem = {8100845,1};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
				};
		RewardSmall	= {dwHPMax = 1200;dwMPMax = 0;dwAttack = 300;dwDefense = 150;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwHPMax = 12000;dwMPMax = 0;dwAttack = 3000;dwDefense = 1500;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};	
		};
[8] = {
		szName="南疆巾帼";
		szDes = "<font color='#6BDD65'>南疆巾帼</font><br>纵使南北千里迢迢，亦将保镖不辱使命。";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 18;
		szPicBig = "img://collect_nanjiangjinguo_0.jpg";				--szPicBig彩色大图片，szGrayPicBig灰色大图片		
		szComTips = "南疆巾帼已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>南疆巾帼</font>";
		szRollDesLock = "<p><font color='#6BDD65'>南疆巾帼<br>纵使南北千里迢迢，亦将保镖不辱使命。</font></p>";
		dwLevel = 150;
		Items = {
			[1] = 	{szPic = "img://collect_8100869_0.png";szGrayPic = "img://collect_8100869_1.png";NeedItem = {8100869,1};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
				};
		RewardSmall	= {dwHPMax = 1200;dwMPMax = 0;dwAttack = 300;dwDefense = 150;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 10;dwAttackSpeed = 2;};
		RewardBig 	= {dwHPMax = 1000;dwMPMax = 0;dwAttack = 300;dwDefense = 1500;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 10;dwAttackSpeed = 2;};	
		};
[9] = {
		szName="东海青娥";
		szDes = "<font color='#6BDD65'>东海青娥</font><br>世人皆慕藏宝图，东海远航寻珍奇。";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 19;
		szPicBig = "img://collect_donghaiqinge_0.jpg";				--szPicBig彩色大图片，szGrayPicBig灰色大图片		
		szComTips = "东海青娥已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>东海青娥</font>";
		szRollDesLock = "<p><font color='#6BDD65'>东海青娥<br>世人皆慕藏宝图，东海远航寻珍奇。</font></p>";
		dwLevel = 150;
		Items = {
			[1] = 	{szPic = "img://collect_8100893_0.png";szGrayPic = "img://collect_8100893_1.png";NeedItem = {8100893,1};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
				};
		RewardSmall	= {dwHPMax = 1200;dwMPMax = 0;dwAttack = 300;dwDefense = 150;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwHPMax = 12000;dwMPMax = 0;dwAttack = 3000;dwDefense = 1500;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};	
		};
[10] = {
		szName="南山淑媛";
		szDes = "<font color='#6BDD65'>南山淑媛</font><br>南山书香气悠然，夫子为国鉴英才。";
		Tips = "可以合成古学志物品：<font color = '#00FF00'>[%s]</font>,是否立即合成？";
		dwLockPic = 20;
		szPicBig = "img://collect_nanshanshuyuan_0.jpg";				--szPicBig彩色大图片，szGrayPicBig灰色大图片		
		szComTips = "南山淑媛已全部收集完成<br>已获得相应属性加成";
		szRollDes = "<font color='#6BDD65'>南山淑媛</font>";
		szRollDesLock = "<p><font color='#6BDD65'>南山淑媛<br>南山书香气悠然，夫子为国鉴英才。</font></p>";
		dwLevel = 150;
		Items = {
			[1] = 	{szPic = "img://collect_8100917_0.png";szGrayPic = "img://collect_8100917_1.png";NeedItem = {8100917,1};};
			-- [2] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [3] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [4] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [5] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [6] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [7] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [8] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [9] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [10] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [11] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [12] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [13] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [14] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [15] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [16] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [17] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [18] =	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [19] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [20] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [21] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [22] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [23] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
			-- [24] = 	{szPic = "img://Qita_collect_point04_0.png";szGrayPic = "img://Qita_collect_point04_1.png";NeedItem = {8100600,1};};
				};
		RewardSmall	= {dwHPMax = 1200;dwMPMax = 0;dwAttack = 300;dwDefense = 150;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};
		RewardBig 	= {dwHPMax = 12000;dwMPMax = 0;dwAttack = 3000;dwDefense = 1500;dwFlee = 420;dwCrit = 300;dwMoveSpeed  = 0;dwAttackSpeed = 0;};	
		};
};
local function tableFormat ()
	local cfg = StunnerConfig
	for j = 1,#cfg do
		for i = 2,24 do
			cfg[j].Items[i]={}
			cfg[j].Items[i].NeedItem = {}
			cfg[j].Items[i].NeedItem[1] = cfg[j].Items[1].NeedItem[1] + (i-1)
			cfg[j].Items[i].NeedItem[2] = cfg[j].Items[1].NeedItem[2]
			cfg[j].Items[i].szPic ="img://collect_"..cfg[j].Items[i].NeedItem[1].."_0.png" 
			cfg[j].Items[i].szGrayPic ="img://collect_"..cfg[j].Items[i].NeedItem[1].."_1.png" 
		end
	end
end

tableFormat ()
