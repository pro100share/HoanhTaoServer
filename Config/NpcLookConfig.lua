--npc配置
_G.NpcLookConfig = {
 -------Player-----------电影模式（剧情）对话摄像头
 player = {
	[1] = {Eye = _Vector3.new(0.4,-2,0.9);Look = _Vector3.new(-0.55,0,0.9);};--镰
	[2] = {Eye = _Vector3.new(0.4,-2.4,1.4);Look = _Vector3.new(-0.6,0,1.4);};--刀
	[3] = {Eye = _Vector3.new(0.45,-2.4,1.45);Look = _Vector3.new(-0.6,0,1.45);};--剑
	[4] = {Eye = _Vector3.new(0.4,-2,1.45);Look = _Vector3.new(-0.5,0,1.45);};--枪
};
---★----drop--掉落----------★
 ------通用盒子      标准配置
 -- [1]={	--------表ID
	-- LookId = 1;	-------LOOK ID
	-- Icon = 1;	--------攻击ID
	-- Skl = 1;	--------骨骼ID
	-- Skn = 1;	--------皮肤ID
	-- --AddSkn = {1;2;3;};	--------多加的皮肤ID
	-- --Pfx = 1;	--------特效ID
	-- San = 	--------动作ID
	-- {
		-- Idel = 101;	--------正常待机ID（NPC用待机）
		-- --Act = 101;	--------休闲ID
		
		-- --FIdel = 101;	--------战斗待机ID
		-- --Move = 101;	--------移动ID（跑步）
		-- --Atk = 101;	--------攻击ID
		-- --Hurt = 101;	--------被击ID
		-- --Dead = 101;	--------死亡动作ID
		
		-- --[1] = 180;	--------配置的特殊待机动作（主要剧情用）
		-- --[2] = 181;	--------配置的特殊待机动作（主要剧情用）
	-- };
	-- Width = 1;
	-- StartPos = _Vector3.new(0,0,1);		------跳字的起点
	-- HurtPfxPos = _Vector3.new(0,0,1);		------被击光效的位置
	-- HurtPfxScal = _Vector3.new(1,1,1);		------被击光效的缩放
	-- Talk_0 = {Eye = _Vector3.new(0.3,-3,0.7);Look = _Vector3.new(0.35,0,0.7);};		---对话镜头
	-- Movie_0 = {Eye = _Vector3.new(0.47,-2,0.9);Look = _Vector3.new(-0.55,0,0.9);};		---剧情镜头
 -- };
  -------掉落
 [1]={
	LookId = 1;Icon = 1;Skl = 1;Skn = 1;
	San = {
		Bron1 = 110;---出生动作
	
		Idel = 1;
		
		FIdel = 111;	--------战斗待机ID
		Move = 112;	--------移动ID（跑步）
		Atk = 113;	--------攻击ID
		Hurt = 114;	--------被击ID
		Dead = 115;	--------死亡动作ID
		};
	Height = 1;
 };
 [11]={
	LookId = 11;Icon = 11;Skl = 11;Skn = 11;
	San ={Idel = 1101;};
	Width = 1;
 };
 -------几个铜板
 [13]={
	LookId = 13;Icon = 13;Skl = 13;Skn = 13;
	San ={Idel = 1301;};
	Width = 1;
 };
 -------一堆铜板
 [12]={
	LookId = 12;Icon = 12;Skl = 12;Skn = 12;
	San ={Idel = 1201;};
	Width = 1;
 };
 -------银子+铜板
  [13]={
	LookId = 13;Icon = 13;Skl = 13;Skn = 13;
	San ={Idel = 1301;};
	Width = 1;
 };
 -------银子
  [14]={
	LookId = 14;Icon = 14;Skl = 14;Skn = 14;
	San ={Idel = 1401;};
	Width = 1;
 };
 -------金子
  [15]={
	LookId = 15;Icon = 15;Skl = 15;Skn = 15;
	San ={Idel = 1501;};
	Width = 1;
 };
  -------掉落武器-镰
  [16]={
	LookId = 16;Icon = 16;Skl = 16;Skn = 16;
	San ={Idel = 1601;};
	Width = 1;
 }; 
  -------掉落武器-刀
  [17]={
	LookId = 17;Icon = 17;Skl = 17;Skn = 17;
	San ={Idel = 1701;};
	Width = 1;
 }; 
  -------掉落武器-剑
  [18]={
	LookId = 18;Icon = 18;Skl = 18;Skn = 18;
	San ={Idel = 1801;};
	Width = 1;
 }; 
  -------掉落武器-枪
  [19]={
	LookId = 19;Icon = 19;Skl = 19;Skn = 19;
	San ={Idel = 1901;};
	Width = 1;
 }; 
 
--★-----采集-----★
-----三七
  [30]={
	LookId = 30;Icon = 30;Skl = 30;Skn = 30;Pfx = 99;
	San = {Idel = 3001;};
	Width = 1;
 };
 -----白芨草
   [31]={
	LookId = 31;Icon = 31;Skl = 31;Skn = 31;Pfx = 99;
	San = {Idel = 3101;};
	Width = 1;
 };
 -----紫茯苓草
   [32]={
	LookId = 32;Icon = 32;Skl = 32;Skn = 32;Pfx = 99;
	San = {Idel = 3201;};
	Width = 1;
 };
 -----包袱
   [33]={
	LookId = 33;Icon = 33;Skl = 33;Skn = 33;Pfx = 99;
	San = {Idel = 3301;};
	Width = 1;
 };
 -----宝箱
   [34]={
	LookId = 34;Icon = 34;Skl = 34;Skn = 34;Pfx = 99;
	San = {Idel = 3401;};
	Width = 1;
 };
 -----粮草
   [35]={
	LookId = 35;Icon = 35;Skl = 35;Skn = 35;Pfx = 98;
	San = {Idel = 3501;};
	Width = 1;
 };
 -----大粮草
   [36]={
	LookId = 36;Icon = 36;Skl = 36;Skn = 36;Pfx = 97;
	San = {Idel = 3601;};
	Width = 1;
 };
 -----冲车
   [37]={
	LookId = 37;Icon = 37;Skl = 37;Skn = 37;Pfx = 97;
	San = {Idel = 3701;};
	Width = 1;
 };
 -----焦木
   [38]={
	LookId = 38;Icon = 38;Skl = 38;Skn = 38;Pfx = 99;
	San = {Idel = 3801;};
	Width = 1;
 };
 -----野山菌
   [39]={
	LookId = 39;Icon = 39;Skl = 39;Skn = 39;Pfx = 99;
	San = {Idel = 3901;};
	Width = 1;
 };
 -----疫区蘑菇
   [40]={
	LookId = 40;Icon = 40;Skl = 40;Skn = 40;Pfx = 99;
	San = {Idel = 4001;};
	Width = 1;
 };
 -----石碑
   [41]={
	LookId = 41;Icon = 41;Skl = 41;Skn = 41;Pfx = 99;
	San = {Idel = 4101;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-4.3,0.8);Look = _Vector3.new(0.6,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.60);Look = _Vector3.new(-0.4,0,1.60);};
 };
 -----蜂窝
   [42]={
	LookId = 42;Icon = 42;Skl = 42;Skn = 42;Pfx = 99;
	San = {Idel = 4201;};
	Width = 1;
 };
  -----水桶
   [43]={
	LookId = 43;Icon = 43;Skl = 43;Skn = 43;Pfx = 99;
	San = {Idel = 4301;};
	Width = 1;
 };
  -----荷包
   [44]={
	LookId = 44;Icon = 44;Skl = 44;Skn = 44;Pfx = 99;
	San = {Idel = 4401;};
	Width = 1;
 };
  -----猴儿酒
   [45]={
	LookId = 45;Icon = 45;Skl = 45;Skn = 45;Pfx = 99;
	San = {Idel = 4501;};
	Width = 1;
 };
  -----剑鞘
   [46]={
	LookId = 46;Icon = 46;Skl = 46;Skn = 46;Pfx = 99;
	San = {Idel = 4601;};
	Width = 1;
 };
  -----木头
   [47]={
	LookId = 47;Icon = 47;Skl = 47;Skn = 47;Pfx = 99;
	San = {Idel = 4701;};
	Width = 1;
 };
  -----奇特武器
   [48]={
	LookId = 48;Icon = 48;Skl = 48;Skn = 48;Pfx = 99;
	San = {Idel = 4801;};
	Width = 1;
 };
  -----桃花瓣
   [49]={
	LookId = 49;Icon = 49;Skl = 49;Skn = 49;Pfx = 99;
	San = {Idel = 4901;};
	Width = 1;
 };
  -----桃花枝
   [50]={
	LookId = 50;Icon = 50;Skl = 50;Skn = 50;Pfx = 99;
	San = {Idel = 5001;};
	Width = 1;
 };
  -----藤条
   [51]={
	LookId = 51;Icon = 51;Skl = 51;Skn = 51;Pfx = 99;
	San = {Idel = 5101;};
	Width = 1;
 };
  -----银镯
   [52]={
	LookId = 52;Icon = 52;Skl = 52;Skn = 52;Pfx = 99;
	San = {Idel = 5201;};
	Width = 1;
 };
  -----玉佩
   [53]={
	LookId = 53;Icon = 53;Skl = 53;Skn = 53;Pfx = 99;
	San = {Idel = 5301;};
	Width = 1;
 };
  -----壁画
    [54]={
	LookId = 54;Icon = 54;Skl = 54;Skn = 54;Pfx = 99;
	San = {Idel = 5401;};
	Width = 1;
 };
  -----大石块
    [55]={
	LookId = 55;Icon = 55;Skl = 55;Skn = 55;Pfx = 99;
	San = {Idel = 5501;};
	Width = 1;
 };
  -----废铁
   [56]={
	LookId = 56;Icon = 56;Skl = 56;Skn = 56;Pfx = 99;
	San = {Idel = 5601;};
	Width = 1;
 };
  -----祭坛石雕
   [57]={
	LookId = 57;Icon = 57;Skl = 57;Skn = 57;Pfx = 99;
	San = {Idel = 5701;};
	Width = 1;
 };
  -----破帽
   [58]={
	LookId = 58;Icon = 58;Skl = 58;Skn = 58;Pfx = 99;
	San = {Idel = 5801;};
	Width = 1;
 };
  -----天坑窟口 木头
   [59]={
	LookId = 59;Icon = 59;Skl = 59;Skn = 59;Pfx = 99;
	San = {Idel = 5901;};
	Width = 1;
 };
 ---------竖着的藤条
  [60]={
	LookId = 60;Icon = 60;Skl = 60;Skn = 60;
	San = {Idel = 6001;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,0);Look = _Vector3.new(0.5,0,0);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.4,1.45);Look = _Vector3.new(-0.6,0,1.45);};
 };
 ---------新手村拿武器--剑
 [61]={
	LookId = 61;Icon = 61;Skl = 61;Skn = 61;Pfx = 191;
	San = {Idel = 6101;};
	Width = 1;
 };
 ---------新手村拿武器--刀
 [62]={
	LookId = 62;Icon = 62;Skl = 62;Skn = 62;Pfx = 192;
	San = {Idel = 6201;};
	Width = 1;
 };
 ---------新手村拿武器--镰
 [63]={
	LookId = 63;Icon = 63;Skl = 63;Skn = 63;Pfx = 193;
	San = {Idel = 6301;};
	Width = 1;
 };
 ---------新手村拿武器--枪
 [64]={
	LookId = 64;Icon = 64;Skl = 64;Skn = 64;Pfx = 194;
	San = {Idel = 6401;};
	Width = 1;
 };
 ---------药柜
 [65]={
	LookId = 65;Icon = 65;Skl = 65;Skn = 65;Pfx = 97;
	San = {Idel = 6501;};
	Width = 1;
 };
 ---------石灯
 [66]={
	LookId = 66;Icon = 66;Skl = 66;Skn = 66;Pfx = 98;
	San = {Idel = 6601;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-5,-2.3,1.25);Look = _Vector3.new(3,0,1.25);};
 };
  ---------新石鹤
 [67]={
	LookId = 67;Icon = 67;Skl = 67;Skn = 67;Pfx = 98;
	San = {Idel = 6701;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.1,-9,2.1);Look = _Vector3.new(1.2,0,1.7);};
	Movie_0 = {Eye = _Vector3.new(1.1,-7,2.1);Look = _Vector3.new(-1.7,0,2);};
 };
---------石鹤
 [68]={
	LookId = 68;Icon = 68;Skl = 68;Skn = 68;Pfx = 98;
	San = {Idel = 6801;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.1,-10.3,4.1);Look = _Vector3.new(-0.2,0,1.1);};
 };
---------石桌
 [69]={
	LookId = 69;Icon = 69;Skl = 69;Skn = 69;Pfx = 98;
	San = {Idel = 6901;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.1,-10.3,4.1);Look = _Vector3.new(-0.2,0,1.1);};
 };
---------竹子
 [70]={
	LookId = 70;Icon = 70;Skl = 70;Skn = 70;Pfx = 98;
	San = {Idel = 7001;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.1,-10.3,10.1);Look = _Vector3.new(0.8,0,4.1);};
 };
---------竹笋
 [71]={
	LookId = 71;Icon = 71;Skl = 71;Skn = 71;Pfx = 98;
	San = {Idel = 7101;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-10.3,4.1);Look = _Vector3.new(1.5,0,1.1);};
 };
---------石壁 - 完好
 [72]={
	LookId = 72;Icon = 72;Skl = 72;Skn = 72;Pfx = 98;
	San = {Idel = 7201;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-20,6);Look = _Vector3.new(1.5,0,4.5);};
	Movie_0 = {Eye = _Vector3.new(0,-20,6);Look = _Vector3.new(-1.5,0,4.5);};
 };
---------石壁 - 破损
 [73]={
	LookId = 73;Icon = 73;Skl = 73;Skn = 73;Pfx = 98;
	San = {Idel = 7301;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-20,6);Look = _Vector3.new(1.5,0,4.5);};
	Movie_0 = {Eye = _Vector3.new(0,-20,6);Look = _Vector3.new(-1.5,0,4.5);};
 };
---------襁褓中的婴儿
 [74]={
	LookId = 74;Icon = 74;Skl = 74;Skn = 74;Pfx = 98;
	San = {Idel = 7401;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-2.3,2.8);Look = _Vector3.new(0.4,0,0.3);};
	Movie_0 = {Eye = _Vector3.new(0,-2.3,2.8);Look = _Vector3.new(-0.6,0,0.7);};
 };
 ---------无名洞 - 石头01
 [75]={
	LookId = 75;Icon = 75;Skl = 75;Skn = 75;Pfx = 98;
	San = {Idel = 7501;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-10,1.5);Look = _Vector3.new(1,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0,-9,1.2);Look = _Vector3.new(-0.9,0,1.2);};
 };
 ---------无名洞 - 石头02
 [76]={
	LookId = 76;Icon = 76;Skl = 76;Skn = 76;Pfx = 98;
	San = {Idel = 7601;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-10,3.3);Look = _Vector3.new(1,0,0.3);};
	Movie_0 = {Eye = _Vector3.new(0,-9,3.3);Look = _Vector3.new(-0.9,0,0.7);};
 };
  ---------春节活动 - 烟花1 多管炮
 [77]={
	LookId = 77;Icon = 77;Skl = 77;Skn = 77;Pfx = 99;
	AddPfx1 = {291};
	San = {Idel = 7701;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
   ---------春节活动 - 烟花2 塔形炮
 [78]={
	LookId = 78;Icon = 78;Skl = 78;Skn = 78;Pfx = 99;
	AddPfx1 = {292};
	San = {Idel = 7801;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
   ---------春节活动 - 烟花3 荷花炮
 [79]={
	LookId = 79;Icon = 79;Skl = 79;Skn = 79;Pfx = 99;
	AddPfx1 = {293};
	San = {Idel = 7901;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
   ---------春节活动 - 烟花4
 [80]={
	LookId = 80;Icon = 80;Skl = 80;Skn = 80;Pfx = 99;
	AddPfx1 = {294};
	San = {Idel = 8001;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
   ---------春节活动 - 烟花5
 [81]={
	LookId = 81;Icon = 81;Skl = 81;Skn = 81;Pfx = 99;
	AddPfx1 = {295};
	San = {Idel = 8101;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
   ---------春节活动 - 花灯1
 [82]={
	LookId = 82;Icon = 82;Skl = 82;Skn = 82;Pfx = 99;
	AddPfx1 = {296};
	San = {Idel = 8201;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
    ---------春节活动 - 花灯2
 [83]={
	LookId = 83;Icon = 83;Skl = 83;Skn = 83;Pfx = 99;
	AddPfx1 = {297};
	San = {Idel = 8301;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
    ---------春节活动 - 花灯3
 [84]={
	LookId = 84;Icon = 84;Skl = 84;Skn = 84;Pfx = 99;
	AddPfx1 = {298};
	San = {Idel = 8401;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
    ---------春节活动 - 火锅
 [85]={
	LookId = 85;Icon = 85;Skl = 85;Skn = 85;Pfx = 99;
	AddPfx1 = {299};
	San = {Idel = 8501;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-17,3);Look = _Vector3.new(2,0,3);};
	Movie_0 = {Eye = _Vector3.new(0,-17,3);Look = _Vector3.new(2,0,3);};
 };
     ---------春节活动 - 花灯4
 [86]={
	LookId = 86;Icon = 86;Skl = 86;Skn = 86;Pfx = 99;
	AddPfx1 = {290};
	San = {Idel = 8601;};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};
 };
      ---------冰火岛——屠龙刀
[87]={		
	LookId = 87;Icon = 87;Skl = 87;Skn = 87;	
	AddPfx1 = {400};	
	San = {Idel = 8701;};	
	Width = 1;	
	Talk_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};	
	Movie_0 = {Eye = _Vector3.new(0,-5,0.8);Look = _Vector3.new(0.9,0,0.8);};	
 };		
 
--★-------场景物件NPC★
----新手村-肉铺
 [310]={
	LookId = 310;Icon = 310;Skl = 310;Skn = 310;
	San = {Idel = 31001;};
	Width = 1;
 };
----新手村-旗幡
 [311]={
	LookId = 311;Icon = 311;Skl = 311;Skn = 311;
	San = {Idel = 31101;};
	Width = 1;
 };
----襄阳城-精炼铺
 [320]={
	LookId = 320;Icon = 320;Skl = 320;Skn = 320;
	San = {Idel = 32001;};
	Width = 1;
 }; 
----襄阳野郊-战船
  [330]={
	LookId = 330;Icon = 330;Skl = 330;Skn = 330;
	San = {Idel = 33001;};
	Width = 1;
 };
----场景-帐篷
  [331]={
	LookId = 331;Icon = 331;Skl = 331;Skn = 331;
	San = {Idel = 33101;[1] = 33102;};
	Width = 1;
 };
----场景-锁剑
  [332]={
	LookId = 332;Icon = 332;Skl = 332;Skn = 332;
	San = {Idel = 33201;};
	Width = 1;
 };
--★-------Ui Npc----★
----强化界面--铁匠
  [900]={
	LookId = 900;Icon = 900;Skl = 900;Skn = 900;
	San = {
		Idel = 90001;
		-- [1] = 90002;--打铁
		-- [2] = 90003;--锻造成功
		-- [3] = 90004;--锻造失败
		-- [4] = 90005;--休闲
		};
	Width = 1;
};
----骰子
  [999]={
	LookId = 999;Icon = 999;Skl = 999;Skn = 999;
	San = {
		Idel = 99901;
		[1] = 99980;--转
		[2] = 99981;--金
		[3] = 99982;--木
		[4] = 99983;--水
		[5] = 99984;--火
		[6] = 99985;--土
		[6] = 99986;--全部
		};
	Width = 1;
};
 
--★-------调试用Npc----★
---空模型
 [1000]={
	LookId = 1000;Icon = 1000;Skl = 1000;Skn = 1000;
	San = {
		Idel = 100001;
		
		FIdel = 100011;
		Move = 100012;
		Atk = 100013;
		Hurt = 100014;
		Dead = 100015;
		};
	Width = 1;
 };
 
--★----战斗不反击模型---★
 -----木桩
  [1001]={
	LookId = 1001;Icon = 1001;Skl = 1001;Skn = 1001;
	San = {
			Idel = 100101;
			--Act = 100102;
			
			FIdel = 100111;
			Move = 100112;
			Atk = 100113;
			Hurt = 100114;
			Dead = 100115;
		};
	Width = 1;
};
 -----小鸡
  [1002]={
	LookId = 1002;Icon = 1002;Skl = 1002;Skn = 1002;
	San = {
			Idel = 100201;
			--Act = 100202;
			
			FIdel = 100211;
			Move = 100212;
			Atk = 100213;
			Hurt = 100214;
			Dead = 100215;
		};
	Width = 1;
};
-----公鸡
  [1003]={
	LookId = 1003;Icon = 1003;Skl = 1003;Skn = 1003;
	San = {
			Idel = 100301;
			--Act = 100302;
			
			FIdel = 100311;
			Move = 100312;
			Atk = 100313;
			Hurt = 100314;
			Dead = 100315;
		};
	Width = 1;
};
-----鹅
  [1004]={
	LookId = 1004;Icon = 1004;Skl = 1004;Skn = 1004;
	San = {
			Idel = 100401;
			--Act = 100402;
			
			FIdel = 100411;
			Move = 100412;
			Atk = 100413;
			Hurt = 100414;
			Dead = 100415;
		};
	Width = 1;
};
 -----小猪
  [1005]={
	LookId = 1005;Icon = 1005;Skl = 1005;Skn = 1005;
	San = {
			Idel = 100501;
			--Act = 100502;
			
			FIdel = 100511;
			Move = 100512;
			Atk = 100513;
			Hurt = 100514;
			Dead = 100515;
		};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.5,-4,0.5);Look = _Vector3.new(0.5,0,0.5);};
};
-----乌鸦
  [1006]={
	LookId = 1006;Icon = 1006;Skl = 1006;Skn = 1006;
	San = {
			Idel = 100601;
			--Act = 100602;
			
			FIdel = 100611;
			Move = 100612;
			Atk = 100613;
			Hurt = 100614;
			Dead = 100615;
		};
	Width = 1;
};
-----兔子
  [1007]={
	LookId = 1007;Icon = 1007;Skl = 1007;Skn = 1007;
	San = {
			Idel = 100701;
			--Act = 100702;
			
			FIdel = 100711;
			Move = 100712;
			Atk = 100713;
			Hurt = 100714;
			Dead = 100715;
		};
	Width = 1;
};
 -----鲤鱼
  [1008]={
	LookId = 1008;Icon = 1008;Skl = 1008;Skn = 1008;
	San = {
			Idel = 100801;
			--Act = 100802;
			
			FIdel = 100811;
			Move = 100812;
			Atk = 100813;
			Hurt = 100814;
			Dead = 100815;
		};
	Width = 1;
};
 -----元宝猪
  [1009]={
	LookId = 1009;Icon = 1009;Skl = 1009;Skn = 1009;
	San = {
			Idel = 100901;
			--Act = 100902;
			
			FIdel = 100911;
			Move = 100912;
			Atk = 100913;
			Hurt = 100914;
			Dead = 100915;
		};
	Width = 1.3;
};
 -----地刺
  [1010]={
	LookId = 1010;Icon = 1010;Skl = 1010;Skn = 1010;
	San = {
			Idel = 101001;
			--Act = 101002;
			
			FIdel = 101011;
			Move = 101012;
			Atk = 101013;
			Hurt = 101014;
			Dead = 101015;
		};
	Width = 1;
};
 -----盟主令
  [1011]={
	LookId = 1011;Icon = 1011;Skl = 1011;Skn = 1011;
	AddPfx1 = {190};
	San = {
			Idel = 101101;
			Act = 101102;
			
			FIdel = 101111;
			Move = 101112;
			Atk = 101113;
			Hurt = 101114;
			Dead = 101115;
		};
	Width = 1;
};
 -----圣诞树
  [1012]={
	LookId = 1012;Icon = 1012;Skl = 1012;Skn = 1012;
	AddPfx1 = {280};
	San = {
			Idel = 101201;
		--	Act = 101202;
		};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-1,-18,5);Look = _Vector3.new(0.5,0,5);};
};
 -----圣诞雪人
  [1013]={
	LookId = 1013;Icon = 1013;Skl = 1013;Skn = 1013;
	San = {
			Idel = 101301;
		--	Act = 101302;
		
			FIdel = 101311;
			Move = 101312;
			Atk = 101313;
			Hurt = 101314;
			Dead = 101315;
		};
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-2,-18,4);Look = _Vector3.new(2,0,4);};
};
 -----鼎 ---01
  [1101]={
	LookId = 1101;Icon = 1101;Skl = 1101;Skn = 1101;Pfx = 98;
	San = {
			Idel = 110101;
			--Act = 110102;
			
			FIdel = 110111;
			Move = 110112;
			Atk = 110113;
			Hurt = 110114;
			Dead = 110115;
		};
		Width = 3;
 };
 -----鼎 ---02
  [1102]={
	LookId = 1102;Icon = 1102;Skl = 1102;Skn = 1102;Pfx = 98;
	San = {
			Idel = 110201;
			--Act = 110202;
			
			FIdel = 110211;
			Move = 110212;
			Atk = 110213;
			Hurt = 110214;
			Dead = 110215;
		};
		Width = 3;
 };
 -----鼎 ---03
  [1103]={
	LookId = 1103;Icon = 1103;Skl = 1103;Skn = 1103;Pfx = 98;
	San = {
			Idel = 110301;
			--Act = 110302;
			
			FIdel = 110311;
			Move = 110312;
			Atk = 110313;
			Hurt = 110314;
			Dead = 110315;
		};
		Width = 3;
 };
  -----炼铁炉子
  [1109]={
	LookId = 1109;Icon = 1109;Skl = 1109;Skn = 1109;
	San = {
			Idel = 110901;
			--Act = 110902;
			
			FIdel = 110911;
			Move = 110912;
			Atk = 110913;
			Hurt = 110914;
			Dead = 110915;
		};
		Width = 3;
		Talk_0 = {Eye = _Vector3.new(1.1,-2.3,4.1);Look = _Vector3.new(-0.2,0,1.1);};
 };
---------旗帜
  [1111]={
	LookId = 1111;Icon = 1111;Skl = 1111;Skn = 1111;
	San = {
			Idel = 111101;
			--Act = 111102;
			
			FIdel = 111111;
			Move = 111112;
			Atk = 111113;
			Hurt = 111114;
			Dead = 111115;
		};
		Width = 3;
	Talk_0 = {Eye = _Vector3.new(0.9,-10,3);Look = _Vector3.new(1.7,0,3);};
	Movie_0 = {Eye = _Vector3.new(0.65,-7,3);Look = _Vector3.new(-1.7,0,3);};
 };
 -----木宝箱
  [1120]={
	LookId = 1120;Icon = 1120;Skl = 1120;Skn = 1120;
	AddPfx1 = {180};
	San = {
			Idel = 112001;
			--Act = 112002;
			
			FIdel = 112011;
			Move = 112012;
			Atk = 112013;
			Hurt = 112014;
			Dead = 112015;
		};
		Width = 1.5;
 };
 -----银宝箱
  [1121]={
	LookId = 1121;Icon = 1121;Skl = 1121;Skn = 1121;
	AddPfx1 = {181};
	San = {
			Idel = 112101;
			--Act = 112102;
			
			FIdel = 112111;
			Move = 112112;
			Atk = 112113;
			Hurt = 112114;
			Dead = 112115;
		};
		Width = 1.75;
 };
 -----金宝箱
  [1122]={
	LookId = 1122;Icon = 1122;Skl = 1122;Skn = 1122;
	AddPfx1 = {182};
	San = {
			Idel = 112201;
			--Act = 112202;
			
			FIdel = 112211;
			Move = 112212;
			Atk = 112213;
			Hurt = 112214;
			Dead = 112215;
		};
		Width = 2;
 };
 -----天外陨石
  [1130]={
	LookId = 1130;Icon = 1130;Skl = 1130;Skn = 1130;
	AddPfx1 = {250};
	San = {
			Born1 = 113000;
			
			Idel = 113001;
			--Act = 113002;
			
			FIdel = 113011;
			Move = 113012;
			Atk = 113013;
			Hurt = 113014;
			Dead = 113015;
		};
		Width = 2;
 };
 -------婚宴桌子01
 [1151]={
	LookId = 1151;Icon = 1151;Skl = 1151;Skn = 1151;
	San = {
			Idel = 115101;
			--Act = 115102;
			
			FIdel = 115111;
			Move = 115112;
			Atk = 115113;
			Hurt = 115114;
			Dead = 115115;
		};
		Width = 3;
	Talk_0 = {Eye = _Vector3.new(1.1,-2.3,4.1);Look = _Vector3.new(-0.2,0,1.1);};
	};
 -------婚宴桌子02
 [1152]={
	LookId = 1152;Icon = 1152;Skl = 1152;Skn = 1152;
	San = {
			Idel = 115201;
			--Act = 115202;
			
			FIdel = 115211;
			Move = 115212;
			Atk = 115213;
			Hurt = 115214;
			Dead = 115215;
		};
		Width = 3;
	Talk_0 = {Eye = _Vector3.new(1.1,-3.1,3.5);Look = _Vector3.new(-0.2,0,1.1);};
	};
 -------婚宴桌子03
 [1153]={
	LookId = 1153;Icon = 1153;Skl = 1153;Skn = 1153;
	San = {
			Idel = 115301;
			--Act = 115302;
			
			FIdel = 115311;
			Move = 115312;
			Atk = 115313;
			Hurt = 115314;
			Dead = 115315;
		};
		Width = 3;
	Talk_0 = {Eye = _Vector3.new(5.55,-3.45,4.65);Look = _Vector3.new(-1.2,0.9,0.7);};
	};
 -------乌龟 - 石像
 [1160]={
	LookId = 1160;Icon = 1160;Skl = 1160;Skn = 1160;
	AddPfx1 = {210};
	San = {
			Idel = 116001;
			--Act = 116002;
			
			FIdel = 116011;
			Move = 116012;
			Atk = 116013;
			Hurt = 116014;
			Dead = 116015;
		};
		Width = 2;
	};
 -------白虎 - 石像
 [1161]={
	LookId = 1161;Icon = 1161;Skl = 1161;Skn = 1161;
	AddPfx1 = {220};
	San = {
			Idel = 116101;
			--Act = 116102;
			
			FIdel = 116111;
			Move = 116112;
			Atk = 116113;
			Hurt = 116114;
			Dead = 116115;
		};
		Width = 2;
	};
 -------朱雀 - 石像
 [1162]={
	LookId = 1162;Icon = 1162;Skl = 1162;Skn = 1162;
	AddPfx1 = {230};
	San = {
			Idel = 116201;
			--Act = 116202;
			
			FIdel = 116211;
			Move = 116212;
			Atk = 116213;
			Hurt = 116214;
			Dead = 116215;
		};
		Width = 2;
	};
 -------青龙 - 石像
 [1163]={
	LookId = 1163;Icon = 1163;Skl = 1163;Skn = 1163;
	AddPfx1 = {240};
	San = {
			Idel = 116301;
			--Act = 116302;
			
			FIdel = 116311;
			Move = 116312;
			Atk = 116313;
			Hurt = 116314;
			Dead = 116315;
		};
		Width = 2;
	};
  ----------------坐骑
  ----马1阶
	[1201]={
		LookId = 1201;Icon = 1201;Skl = 1201;Skn = 1201;
		San = {
			Idel = 120101;
			--Act = 120102;
			
			FIdel = 120111;
			Move = 120112;
			Atk = 120113;
			Hurt = 120114;
			Dead = 120115;
		};
		Width = 3;
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----马2阶
	[1202]={
		LookId = 1202;Icon = 1202;Skl = 1202;Skn = 1202;
		San = {
			Idel = 120101;
			--Act = 120102;
			
			FIdel = 120111;
			Move = 120112;
			Atk = 120113;
			Hurt = 120114;
			Dead = 120115;
		};
		Width = 3;
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----马3阶
	[1203]={
		LookId = 1203;Icon = 1203;Skl = 1203;Skn = 1203;
		San = {
			Idel = 120101;
			--Act = 120102;
			
			FIdel = 120111;
			Move = 120112;
			Atk = 120113;
			Hurt = 120114;
			Dead = 120115;
		};
		Width = 3;
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   ----大象1阶
	[1211]={
		LookId = 1211;Icon = 1211;Skl = 1211;Skn = 1211;
		San = {
			Idel = 121101;
			--Act = 121102;
			
			FIdel = 121111;
			Move = 121112;
			Atk = 121113;
			Hurt = 121114;
			Dead = 121115;
		};
		Width = 3;
		StartPos = _Vector3.new(0.15,0.6,1.8);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.3);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----大象2阶
	[1212]={
		LookId = 1212;Icon = 1212;Skl = 1212;Skn = 1212;
		San = {
			Idel = 121101;
			--Act = 121102;
			
			FIdel = 121111;
			Move = 121112;
			Atk = 121113;
			Hurt = 121114;
			Dead = 121115;
		};
		Width = 3;
		StartPos = _Vector3.new(0.15,0.6,1.8);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.3);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----大象3阶
	[1213]={
		LookId = 1213;Icon = 1213;Skl = 1213;Skn = 1213;
		San = {
			Idel = 121101;
			--Act = 121102;
			
			FIdel = 121111;
			Move = 121112;
			Atk = 121113;
			Hurt = 121114;
			Dead = 121115;
		};
		Width = 3;
		StartPos = _Vector3.new(0.15,0.6,1.8);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.3);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   ----犀牛1阶
	[1221]={
		LookId = 1221;Icon = 1221;Skl = 1221;Skn = 1221;
		San = {
			Idel = 122101;
			--Act = 122102;
			
			FIdel = 122111;
			Move = 122112;
			Atk = 122113;
			Hurt = 122114;
			Dead = 122115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----犀牛2阶
	[1222]={
		LookId = 1222;Icon = 1222;Skl = 1222;Skn = 1222;
		San = {
			Idel = 122101;
			--Act = 122102;
			
			FIdel = 122111;
			Move = 122112;
			Atk = 122113;
			Hurt = 122114;
			Dead = 122115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----犀牛3阶
	[1223]={
		LookId = 1223;Icon = 1223;Skl = 1223;Skn = 1223;
		San = {
			Idel = 122101;
			--Act = 122102;
			
			FIdel = 122111;
			Move = 122112;
			Atk = 122113;
			Hurt = 122114;
			Dead = 122115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   ----豹子1阶
	[1231]={
		LookId = 1231;Icon = 1231;Skl = 1231;Skn = 1231;
		San = {
			Idel = 123101;
			--Act = 123102;
			
			FIdel = 123111;
			Move = 123112;
			Atk = 123113;
			Hurt = 123114;
			Dead = 123115;
		};
		Width = 2;
		StartPos = _Vector3.new(0.15,0.6,1.6);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----豹子2阶
	[1232]={
		LookId = 1232;Icon = 1232;Skl = 1232;Skn = 1232;
		San = {
			Idel = 123101;
			--Act = 123102;
			
			FIdel = 123111;
			Move = 123112;
			Atk = 123113;
			Hurt = 123114;
			Dead = 123115;
		};
		Width = 2;
		StartPos = _Vector3.new(0.15,0.6,1.6);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----豹子3阶
	[1233]={
		LookId = 1233;Icon = 1233;Skl = 1233;Skn = 1233;
		San = {
			Idel = 123101;
			--Act = 123102;
			
			FIdel = 123111;
			Move = 123112;
			Atk = 123113;
			Hurt = 123114;
			Dead = 123115;
		};
		Width = 2;
		StartPos = _Vector3.new(0.15,0.6,1.6);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----野猪
	[1241]={
		LookId = 1241;Icon = 1241;Skl = 1241;Skn = 1241;
		AddPfx1 = {200,201,202,203,204};
		San = {
			Idel = 124101;
			--Act = 124102;
			
			FIdel = 124111;
			Move = 124112;
			Atk = 124113;
			Hurt = 124114;
			Dead = 124115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-5,-6,1.6);Look = _Vector3.new(1.4,0,1.3);};
	};
  ----青锋 狼
	[1242]={
		LookId = 1242;Icon = 1242;Skl = 1242;Skn = 1242;
		San = {
			Idel = 124201;
			--Act = 124202;
			
			FIdel = 124211;
			Move = 124212;
			Atk = 124213;
			Hurt = 124214;
			Dead = 124215;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-5,-6,1.6);Look = _Vector3.new(1.4,0,1.3);};
	};
  ----蝎子
	[1251]={
		LookId = 1251;Icon = 1251;Skl = 1251;Skn = 1251;
		San = {
			Idel = 125101;
			--Act = 125102;
			
			FIdel = 125111;
			Move = 125112;
			Atk = 125113;
			Hurt = 125114;
			Dead = 125115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----乌龟
	[1261]={
		LookId = 1261;Icon = 1261;Skl = 1261;Skn = 1261;
		San = {
			Idel = 126101;
			--Act = 126102;
			
			FIdel = 126111;
			Move = 126112;
			Atk = 126113;
			Hurt = 126114;
			Dead = 126115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----白虎
	[1271]={
		LookId = 1271;Icon = 1271;Skl = 1271;Skn = 1271;
		San = {
			Idel = 127101;
			--Act = 127102;
			
			FIdel = 127111;
			Move = 127112;
			Atk = 127113;
			Hurt = 127114;
			Dead = 127115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----朱雀
	[1281]={
		LookId = 1281;Icon = 1281;Skl = 1281;Skn = 1281;
		San = {
			Idel = 128101;
			--Act = 128102;
			
			FIdel = 128111;
			Move = 128112;
			Atk = 128113;
			Hurt = 128114;
			Dead = 128115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-7.5,2.8);Look = _Vector3.new(0.55,0,2.5);};
	Movie_0 = {Eye = _Vector3.new(2,-7,4);Look = _Vector3.new(-1,0,3.5);};
	};
  ----青龙
	[1291]={
		LookId = 1291;Icon = 1291;Skl = 1291;Skn = 1291;
		San = {
			Idel = 129101;
			--Act = 129102;
			
			FIdel = 129111;
			Move = 129112;
			Atk = 129113;
			Hurt = 129114;
			Dead = 129115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----炎龙
	[1292]={
		LookId = 1291;Icon = 1291;Skl = 1291;Skn = 1292;
		San = {
			Idel = 129101;
			--Act = 129102;
			
			FIdel = 129111;
			Move = 129112;
			Atk = 129113;
			Hurt = 129114;
			Dead = 129115;
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----麒麟
	[1293]={
		LookId = 1293;Icon = 1293;Skl = 1293;Skn = 1293;
		AddPfx1 = {260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277};
		San = {
			Idel = 129301;
			--Act = 129302;
			
		};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
		Talk_0 = {Eye = _Vector3.new(1,-10,2.3);Look = _Vector3.new(0.8,0,2.3);};
	};
----------------★角色模型★--------------
-----剑  0阶
 [2000]={
	LookId = 2000;Icon = 2000;Skl = 2000;Skn = 2000;
	AddSkn = {2001;2002;2003;};
	San = {
			Idel = 200001;
			--Act = 200002;
			
			FIdel = 200011;
			Move = 200012;
			Atk = 200013;
			Hurt = 200014;
			Dead = 200015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.7,1.4);Look = _Vector3.new(-0.6,0,1.4);};
	};
-----剑  1阶
 [2100]={
	LookId = 2100;Icon = 2000;Skl = 2000;Skn = 2000;
	AddSkn = {2004;2005;2006;};
	San = {
			Idel = 200001;
			--Act = 200002;
			
			FIdel = 200011;
			Move = 200012;
			Atk = 200013;
			Hurt = 200014;
			Dead = 200015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.7,1.4);Look = _Vector3.new(-0.6,0,1.4);};
	};
-----剑  2阶
 [2200]={
	LookId = 2200;Icon = 2000;Skl = 2000;Skn = 2000;
	AddSkn = {2007;2008;2009;};
	San = {
			Idel = 200001;
			--Act = 200002;
			
			FIdel = 200011;
			Move = 200012;
			Atk = 200013;
			Hurt = 200014;
			Dead = 200015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.7,1.4);Look = _Vector3.new(-0.6,0,1.4);};
	};
-----剑  3阶
 [2300]={
	LookId = 2300;Icon = 2000;Skl = 2000;Skn = 2000;
	AddSkn = {2010;2011;2012;};
	San = {
			Idel = 200001;
			--Act = 200002;
			
			FIdel = 200011;
			Move = 200012;
			Atk = 200013;
			Hurt = 200014;
			Dead = 200015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.7,1.4);Look = _Vector3.new(-0.6,0,1.4);};
	};
-----剑  4阶
 [2400]={
	LookId = 2400;Icon = 2000;Skl = 2000;Skn = 2000;
	AddSkn = {2013;2014;2015;};
	San = {
			Idel = 200001;
			--Act = 200002;
			
			FIdel = 200011;
			Move = 200012;
			Atk = 200013;
			Hurt = 200014;
			Dead = 200015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.7,1.4);Look = _Vector3.new(-0.6,0,1.4);};
	};
-----剑  5阶
 [2500]={
	LookId = 2500;Icon = 2000;Skl = 2000;Skn = 2000;
	AddSkn = {2016;2017;2018;};
	San = {
			Idel = 200001;
			--Act = 200002;
			
			FIdel = 200011;
			Move = 200012;
			Atk = 200013;
			Hurt = 200014;
			Dead = 200015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.7,1.4);Look = _Vector3.new(-0.6,0,1.4);};
	};
 
-----刀  0阶
 [3000]={
	LookId = 3000;Icon = 3000;Skl = 3000;Skn = 3000;
	AddSkn = {3001;3002;3003;};
	San = {
			Idel = 300001;
			--Act = 300002;
			
			FIdel = 300011;
			Move = 300012;
			Atk = 300013;
			Hurt = 300014;
			Dead = 300015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.4,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
-----刀  1阶
 [3100]={
	LookId = 3100;Icon = 3000;Skl = 3000;Skn = 3000;
	AddSkn = {3004;3005;3006;};
	San = {
			Idel = 300001;
			--Act = 300002;
			
			FIdel = 300011;
			Move = 300012;
			Atk = 300013;
			Hurt = 300014;
			Dead = 300015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-4,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
-----刀  2阶
 [3200]={
	LookId = 3200;Icon = 3000;Skl = 3000;Skn = 3000;
	AddSkn = {3007;3008;3009;};
	San = {
			Idel = 300001;
			--Act = 300002;
			
			FIdel = 300011;
			Move = 300012;
			Atk = 300013;
			Hurt = 300014;
			Dead = 300015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-4,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
-----刀  3阶
 [3300]={
	LookId = 3300;Icon = 3000;Skl = 3000;Skn = 3000;
	AddSkn = {3010;3011;3012;};
	San = {
			Idel = 300001;
			--Act = 300002;
			
			FIdel = 300011;
			Move = 300012;
			Atk = 300013;
			Hurt = 300014;
			Dead = 300015;
			
			[1] = 300080;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-4,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	Talk_1 = {Eye = _Vector3.new(0.45,-4,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_1 = {Eye = _Vector3.new(0.4,-3.4,0.8);Look = _Vector3.new(-0.6,0,1.1);};
	};
-----刀  4阶
 [3400]={
	LookId = 3400;Icon = 3000;Skl = 3000;Skn = 3000;
	AddSkn = {3013;3014;3015;};
	San = {
			Idel = 300001;
			--Act = 300002;
			
			FIdel = 300011;
			Move = 300012;
			Atk = 300013;
			Hurt = 300014;
			Dead = 300015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-4,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
-----刀  5阶
 [3500]={
	LookId = 3500;Icon = 3000;Skl = 3000;Skn = 3000;
	AddSkn = {3016;3017;3018;};
	San = {
			Idel = 300001;
			--Act = 300002;
			
			FIdel = 300011;
			Move = 300012;
			Atk = 300013;
			Hurt = 300014;
			Dead = 300015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-4,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
 
 -----枪  0阶
 [4000]={
	LookId = 4000;Icon = 4000;Skl = 4000;Skn = 4000;
	AddSkn = {4001;4002;4003;};
	San = {
			Idel = 400001;
			--Act = 400002;
			
			FIdel = 400011;
			Move = 400012;
			Atk = 400013;
			Hurt = 400014;
			Dead = 400015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3.5,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.3);Look = _Vector3.new(-0.6,0,1.3);};
	};
-----枪  1阶
 [4100]={
	LookId = 4100;Icon = 4000;Skl = 4000;Skn = 4000;
	AddSkn = {4004;4005;4006;};
	San = {
			Idel = 400001;
			--Act = 400002;
			
			FIdel = 400011;
			Move = 400012;
			Atk = 400013;
			Hurt = 400014;
			Dead = 400015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3.5,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.3);Look = _Vector3.new(-0.6,0,1.3);};
	};
-----枪  2阶
 [4200]={
	LookId = 4200;Icon = 4000;Skl = 4000;Skn = 4000;
	AddSkn = {4007;4008;4009;};
	San = {
			Idel = 400001;
			--Act = 400002;
			
			FIdel = 400011;
			Move = 400012;
			Atk = 400013;
			Hurt = 400014;
			Dead = 400015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3.5,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.3);Look = _Vector3.new(-0.6,0,1.3);};
	};
-----枪  3阶
 [4300]={
	LookId = 4300;Icon = 4000;Skl = 4000;Skn = 4000;
	AddSkn = {4010;4011;4012;};
	San = {
			Idel = 400001;
			--Act = 400002;
			
			FIdel = 400011;
			Move = 400012;
			Atk = 400013;
			Hurt = 400014;
			Dead = 400015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3.5,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.3);Look = _Vector3.new(-0.6,0,1.3);};
	};
-----枪  4阶
 [4400]={
	LookId = 4400;Icon = 4000;Skl = 4000;Skn = 4000;
	AddSkn = {4013;4014;4015;};
	San = {
			Idel = 400001;
			--Act = 400002;
			
			FIdel = 400011;
			Move = 400012;
			Atk = 400013;
			Hurt = 400014;
			Dead = 400015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3.5,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.3);Look = _Vector3.new(-0.6,0,1.3);};
	};
-----枪  5阶
 [4500]={
	LookId = 4500;Icon = 4000;Skl = 4000;Skn = 4000;
	AddSkn = {4016;4017;4018;};
	San = {
			Idel = 400001;
			--Act = 400002;
			
			FIdel = 400011;
			Move = 400012;
			Atk = 400013;
			Hurt = 400014;
			Dead = 400015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3.5,1.1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.5,1.3);Look = _Vector3.new(-0.6,0,1.3);};
	};
 
-----镰  0阶
 [5000]={
	LookId = 5000;Icon = 5000;Skl = 5000;Skn = 5000;
	AddSkn = {5001;5002;5003;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.4,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
-----镰  特殊需求   出生套 双马尾
 [5001]={
	LookId = 5000;Icon = 5000;Skl = 5000;Skn = 5901;
	AddSkn = {5001;5002;5003;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.4,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
-----镰  特殊需求   60套 新头发
 [5002]={
	LookId = 5000;Icon = 5000;Skl = 5000;Skn = 5902;
	AddSkn = {5013;5014;5015;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.9,-4,1.3);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.65,-2.4,1.45);Look = _Vector3.new(-0.6,0,1.45);};
	};
-----镰  1阶
 [5100]={
	LookId = 5100;Icon = 5000;Skl = 5000;Skn = 5000;
	AddSkn = {5004;5005;5006;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3,0.75);Look = _Vector3.new(0.4,0,0.75);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2,1);Look = _Vector3.new(-0.6,0,1);}
	};
-----镰  2阶
 [5200]={
	LookId = 5200;Icon = 5000;Skl = 5000;Skn = 5000;
	AddSkn = {5007;5008;5009;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3,0.75);Look = _Vector3.new(0.4,0,0.75);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2,1);Look = _Vector3.new(-0.6,0,1);}
	};
-----镰  3阶
 [5300]={
	LookId = 5300;Icon = 5000;Skl = 5000;Skn = 5000;
	AddSkn = {5010;5011;5012;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3,0.75);Look = _Vector3.new(0.4,0,0.75);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2,1);Look = _Vector3.new(-0.6,0,1);}
	};
-----镰  4阶
 [5400]={
	LookId = 5400;Icon = 5000;Skl = 5000;Skn = 5000;
	AddSkn = {5013;5014;5015;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3,0.75);Look = _Vector3.new(0.4,0,0.75);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2,1);Look = _Vector3.new(-0.6,0,1);}
	};
-----镰  5阶
 [5500]={
	LookId = 5500;Icon = 5000;Skl = 5000;Skn = 5000;
	AddSkn = {5016;5017;5018;};
	San = {
			Idel = 500001;
			--Act = 500002;
			
			FIdel = 500011;
			Move = 500012;
			Atk = 500013;
			Hurt = 500014;
			Dead = 500015;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.45,-3,0.75);Look = _Vector3.new(0.4,0,0.75);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2,1);Look = _Vector3.new(-0.6,0,1);};
	};
--------------车子
---镖车01/物资车
 [8001]={
	LookId = 8001;Icon = 8001;Skl = 8001;Skn = 8001;Pfx = 98;
	San = {
			Idel = 800101;
			--Act = 800102;
			
			FIdel = 800111;
			Move = 800112;
			Atk = 800113;
			Hurt = 800114;
			Dead = 800115;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
---镖车02
 [8002]={
	LookId = 8002;Icon = 8002;Skl = 8002;Skn = 8002;Pfx = 98;
	San = {
			Idel = 800201;
			--Act = 800202;
			
			FIdel = 800211;
			Move = 800212;
			Atk = 800213;
			Hurt = 800214;
			Dead = 800215;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-4.25,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
---镖车03 
 [8003]={
	LookId = 8003;Icon = 8003;Skl = 8003;Skn = 8003;Pfx = 98;
	San = {
			Idel = 800301;
			--Act = 800302;
			
			FIdel = 800311;
			Move = 800312;
			Atk = 800313;
			Hurt = 800314;
			Dead = 800315;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-5,2.1);Look = _Vector3.new(-0.7,0,1.65);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
---襄阳客车
 [8010]={
	LookId = 8010;Icon = 8010;Skl = 8010;Skn = 8010;
	San = {
			Idel = 801001;
			--Act = 801002;
			
			FIdel = 801011;
			Move = 801012;
			Atk = 801013;
			Hurt = 801014;
			Dead = 801015;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-4.25,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
---手推车
 [8101]={
	LookId = 8101;Icon = 8101;Skl = 8101;Skn = 8101;Pfx = 98;
	San = {
			Idel = 810101;
			--Act = 810102;
			
			FIdel = 810111;
			Move = 810112;
			Atk = 810113;
			Hurt = 810114;
			Dead = 810115;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-1.3,-3,1.9);Look = _Vector3.new(0,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(-1.3,-3,1.9);Look = _Vector3.new(-0.1,0,1.5);};
	};
---弩车
  [8102]={
	LookId = 8102;Icon = 8102;Skl = 8102;Skn = 8102;Pfx = 98;
	San = {
			Idel = 810201;
			--Act = 810202;
			
			FIdel = 810211;
			Move = 810212;
			Atk = 810213;
			Hurt = 810214;
			Dead = 810215;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
---投石车
  [8103]={
	LookId = 8103;Icon = 8103;Skl = 8103;Skn = 8103;Pfx = 98;
	San = {
			Idel = 810301;
			--Act = 810302;
			
			FIdel = 810311;
			Move = 810312;
			Atk = 810313;
			Hurt = 810314;
			Dead = 810315;
		  };
	Width = 5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
 ---白棋子
  [8201]={
	LookId = 8201;Icon = 8201;Skl = 8201;Skn = 8201;Pfx = 98;
	San = {
			Born1 = 820100;
			
			Idel = 820101;
			--Act = 820102;
			
			FIdel = 820111;
			Move = 820112;
			Atk = 820113;
			Hurt = 820114;
			Dead = 820115;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
---黑棋子
  [8202]={
	LookId = 8202;Icon = 8202;Skl = 8202;Skn = 8202;Pfx = 98;
	San = {
			Born1 = 820200;
	
			Idel = 820201;
			--Act = 820202;
			
			FIdel = 820211;
			Move = 820212;
			Atk = 820213;
			Hurt = 820214;
			Dead = 820215;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(-3,-3.75,2.1);Look = _Vector3.new(-0.7,0,1.8);};
	};
 -------------★----★----★★常规模型★★----★----★-----------
   --商城导购 - 红衣服 战斗
  [10010997]={
	LookId = 10010997;Icon = 10010997;Skl = 10010997;Skn = 10010997;
	San = {
			Idel = 1001099701;
			--Act = 1001099702;
			
			-- FIdel = 1001099711;
			-- Move = 1001099712;
			-- Atk = 1001099713;
			-- Hurt = 1001099714;
			-- Dead = 1001099715;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-4,1.3);Look = _Vector3.new(0.6,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.2,-2.7,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
  --商城导购 - 红衣服版UI
  [10010998]={
	LookId = 10010998;Icon = 10010998;Skl = 10010998;Skn = 10010998;
	San = {
			Idel = 1001099801;
			--Act = 1001099802;
			
			-- FIdel = 1001099811;
			-- Move = 1001099812;
			-- Atk = 1001099813;
			-- Hurt = 1001099814;
			-- Dead = 1001099815;
			
			[91] = 1001099891;
			[92] = 1001099892;
			[93] = 1001099893;
			[94] = 1001099894;
			
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-4,1.3);Look = _Vector3.new(0.6,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.2,-2.7,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
 --商城导购 - 红衣服版
  [10010999]={
	LookId = 10010999;Icon = 10010999;Skl = 10010999;Skn = 10010999;
	San = {
			Idel = 1001099901;
			--Act = 1001099902;
			
			-- FIdel = 1001099911;
			-- Move = 1001099912;
			-- Atk = 1001099913;
			-- Hurt = 1001099914;
			-- Dead = 1001099915;
			
			[91] = 1001099991;
			[92] = 1001099992;
			[93] = 1001099993;
			[94] = 1001099994;
			
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-4,1.3);Look = _Vector3.new(0.6,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.2,-2.7,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
 --商城导购
  [10011000]={
	LookId = 10011000;Icon = 10011000;Skl = 10011000;Skn = 10011000;
	San = {
			Idel = 1001100001;
			--Act = 1001100002;
			
			-- FIdel = 1001100011;
			-- Move = 1001100012;
			-- Atk = 1001100013;
			-- Hurt = 1001100014;
			-- Dead = 1001100015;
			
			[91] = 1001100091;
			[92] = 1001100092;
			[93] = 1001100093;
			[94] = 1001100094;
			[95] = 1001100095;
			[96] = 1001100096;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-4,1.3);Look = _Vector3.new(0.6,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.2,-2.7,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
 --平郎中
  [10011001]={
	LookId = 10011001;Icon = 10011001;Skl = 10011001;Skn = 10011001;
	San = {
			Idel = 1001100101;
			Act = 1001100102;
			
			FIdel = 1001100111;
			Move = 1001100112;
			Atk = 1001100113;
			Hurt = 1001100114;
			Dead = 1001100115;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-5,1.5);Look = _Vector3.new(0.9,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.2,-2.7,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
 --村长 徐翁
  [10011002]={
	LookId = 10011002;Icon = 10011002;Skl = 10011002;Skn = 10011002;
	San = {
			Idel = 1001100201;
			Act = 1001100202;
			
			[1] = 1001100280;---剧情 站立
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-3.5,0.6);Look = _Vector3.new(0.4,0,0.6);};
	Movie_0 = {Eye = _Vector3.new(0,-3,0.9);Look = _Vector3.new(-0.6,0,0.9);};
	Talk_1 = {Eye = _Vector3.new(0.1,-4.5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_1 = {Eye = _Vector3.new(-0.8,-3,1.35);Look = _Vector3.new(-0.7,0,1.35);};
	};
 --铁匠 杨虎
  [10011003]={
	LookId = 10011003;Icon = 10011003;Skl = 10011003;Skn = 10011003;
	San = {
			Idel = 1001100301;
			Act = 1001100302;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-0.9,-5.3,2.3);Look = _Vector3.new(1.1,0,0.6);};
	Movie_0 = {Eye = _Vector3.new(-0.7,-3,2.6);Look = _Vector3.new(-0.35,0,1.1);};
	};
 --裁缝 路雯
  [10011004]={
	LookId = 10011004;Icon = 10011004;Skl = 10011004;Skn = 10011004;
	San = {
			Idel = 1001100401;
			Act = 1001100402;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-3.3,1.5);Look = _Vector3.new(0.5,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.2,-1.85,1.55);Look = _Vector3.new(-0.4,0,1.4);};
	};
 --猎户
  [10011005]={
	LookId = 10011005;Icon = 10011005;Skl = 10011005;Skn = 10011005;
	San = {
			Idel = 1001100501;
			--Act = 1001100502;
			
			FIdel = 1001100511;
			Move = 1001100512;
			Atk = 1001100513;
			Hurt = 1001100514;
			Dead = 1001100515;
			
			[1] = 1001100580;---剧情 跑过去拥抱
			[2] = 1001100581;---剧情 拥抱待机中
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.8,-5,1.7);Look = _Vector3.new(0.6,0,1.35);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3.5,1.8);Look = _Vector3.new(-0.6,0,1.6);};
	Talk_1 = {Eye = _Vector3.new(3,-10,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_1 = {Eye = _Vector3.new(3,-8,1.2);Look = _Vector3.new(-3,0,1.2);};
	Talk_2 = {Eye = _Vector3.new(3,-10,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_2 = {Eye = _Vector3.new(3,-8,1.2);Look = _Vector3.new(-3,0,1.2);};
	};
 --樵夫妻子  林李氏
  [10011006]={
	LookId = 10011006;Icon = 10011006;Skl = 10011006;Skn = 10011006;
	San = {
			Idel = 1001100601;
			Act = 1001100602;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-4,1.4);Look = _Vector3.new(0.65,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.7,-2.5,1.4);Look = _Vector3.new(-0.5,0,1.4);};
	};
 --樵夫 林中才
  [10011007]={
	LookId = 10011007;Icon = 10011007;Skl = 10011007;Skn = 10011007;
	San = {
			Idel = 1001100701;
			Act = 1001100702;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.4,-4.6,1.15);Look = _Vector3.new(0.65,0,1.15);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2.9,1.5);Look = _Vector3.new(-0.55,0,1.5);};
	};
 --肉铺老板
  [10011010]={
	LookId = 10011010;Icon = 10011010;Skl = 10011010;Skn = 10011010;
	San = {
			Idel = 1001101001;
			Act = 1001101002;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,1.4);Look = _Vector3.new(0.55,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,1.6);Look = _Vector3.new(-0.7,0,1.6);};
	};
 --新梁梦儿
   [10011011]={
	LookId = 10011011;Icon = 10011011;Skl = 10011011;Skn = 10011011;
	San = {
			Idel = 1001101101;
			Act = 1001101102;
			
			FIdel = 1001101111;
			Move = 1001101112;
			Atk = 1001101113;
			Hurt = 1001101114;
			Dead = 1001101115;
			
			[1] = 1001101180;--受伤
			[2] = 1001101181;--躺地
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-4,1.5);Look = _Vector3.new(0.75,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.6,-2.2,1.5);Look = _Vector3.new(-0.4,0,1.45);};
	Talk_1 = {Eye = _Vector3.new(4.2,-4.5,2);Look = _Vector3.new(1.1,0,0.8);};
	Movie_1 = {Eye = _Vector3.new(0.8,-2.2,1.45);Look = _Vector3.new(-0.4,0,1.45);};
	Talk_2 = {Eye = _Vector3.new(2.3,-5,5);Look = _Vector3.new(0.85,0,1);};
	Movie_2 = {Eye = _Vector3.new(0.8,-2.1,2);Look = _Vector3.new(-0.4,0,0.8);};
	};
 --新梁梦儿 无休闲动作
   [10011099]={
	LookId = 10011011;Icon = 10011011;Skl = 10011011;Skn = 10011011;
	San = {
			Idel = 1001101101;
			--Act = 1001101102;
			
			FIdel = 1001101111;
			Move = 1001101112;
			Atk = 1001101113;
			Hurt = 1001101114;
			Dead = 1001101115;
			
			[1] = 1001101180;--受伤
			[2] = 1001101181;--躺地
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-4,1.5);Look = _Vector3.new(0.75,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.6,-2.2,1.5);Look = _Vector3.new(-0.4,0,1.45);};
	Talk_1 = {Eye = _Vector3.new(4.2,-4.5,2);Look = _Vector3.new(1.1,0,0.8);};
	Movie_1 = {Eye = _Vector3.new(0.8,-2.2,1.45);Look = _Vector3.new(-0.4,0,1.45);};
	Talk_2 = {Eye = _Vector3.new(2.3,-5,5);Look = _Vector3.new(0.85,0,1);};
	Movie_2 = {Eye = _Vector3.new(0.8,-2.1,2);Look = _Vector3.new(-0.4,0,0.8);};
	};
--老梁梦儿
   [10011012]={
	LookId = 10011012;Icon = 10011012;Skl = 10011012;Skn = 10011012;
	San = {
			Idel = 1001101201;
			Act = 1001101202;
			
			FIdel = 1001101211;
			Move = 1001101212;
			Atk = 1001101213;
			Hurt = 1001101214;
			Dead = 1001101215;
			
			[1] = 1001101280;--受伤
			[2] = 1001101281;--躺地
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-4,1.5);Look = _Vector3.new(0.75,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.6,-2.2,1.5);Look = _Vector3.new(-0.4,0,1.45);};
	Talk_1 = {Eye = _Vector3.new(4.2,-4.5,2);Look = _Vector3.new(1.1,0,0.8);};
	Movie_1 = {Eye = _Vector3.new(0.8,-2.2,1.45);Look = _Vector3.new(-0.4,0,1.45);};
	Talk_2 = {Eye = _Vector3.new(2.3,-5,5);Look = _Vector3.new(0.85,0,1);};
	Movie_2 = {Eye = _Vector3.new(0.8,-2.1,2);Look = _Vector3.new(-0.4,0,0.8);};
	};
 --陆仁毅
   [10011022]={
	LookId = 10011022;Icon = 10011022;Skl = 10011022;Skn = 10011022;
	AddPfx2 = {21,22};AddPfx3 = {20};
	San = {
			Idel = 1001102201;
			
			Move = 1001102212;
			[1] = 1001102280;--打木桩
			[2] = 1001102281;--打拳
			[3] = 1001102282;--打坐
			[4] = 1001102283;--跳崖
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.8,-3.3,1.3);Look = _Vector3.new(0.5,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.5,-2.2,1.3);Look = _Vector3.new(-0.6,0,1);};
	};
  --武林人士-舞剑
   [10011023]={
	LookId = 10011023;Icon = 10011023;Skl = 10011023;Skn = 10011023;
	San = {
			Idel = 1001102301;
		  };
	Width = 1;
	};
 --肉铺老板 - 怪物群侠
  [10011024]={
	LookId = 10011024;Icon = 10011024;Skl = 10011024;Skn = 10011024;
	San = {
			Idel = 1001102401;
			--Act = 1001102402;
			
			FIdel = 1001102411;
			Move = 1001102412;
			Atk = 1001102413;
			Hurt = 1001102414;
			Dead = 1001102415;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,1.4);Look = _Vector3.new(0.55,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,1.6);Look = _Vector3.new(-0.7,0,1.6);};
	};
 --野狼
   [10012001]={
	LookId = 10012001;Icon = 10012001;Skl = 10012001;Skn = 10012001;
	San = {
			Idel = 1001200101;
			
			Born1 = 1001200110;
			FIdel = 1001200111;
			Move = 1001200112;
			Atk = 1001200113;
			Hurt = 1001200114;
			Dead = 1001200115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
 --村头地痞
   [10012002]={
	LookId = 10012002;Icon = 10012002;Skl = 10012002;Skn = 10012002;
	San = {
			Idel = 1001200201;
			
			FIdel = 1001200211;
			Move = 1001200212;
			Atk = 1001200213;
			Hurt = 1001200214;
			Dead = 1001200215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,0.82);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.08);--被击光效的位置
	HurtPfxScal = _Vector3.new(0.91,0.91,0.91);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-1,-4.1,1);Look = _Vector3.new(0.75,0,0.7);};
	Movie_0 = {Eye = _Vector3.new(-1,-3,1.3);Look = _Vector3.new(-0.5,0,1.3);};
	};
 --异乡人
   [10012003]={
	LookId = 10012003;Icon = 10012003;Skl = 10012003;Skn = 10012003;
	San = {
			Idel = 1001200301;
			
			FIdel = 1001200311;
			Move = 1001200312;
			Atk = 1001200313;
			Hurt = 1001200314;
			Dead = 1001200315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,0.82);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.08);--被击光效的位置
	HurtPfxScal = _Vector3.new(0.91,0.91,0.91);--被击光效的缩放
	};
 --异乡人首领
   [10012004]={
	LookId = 10012004;Icon = 10012004;Skl = 10012004;Skn = 10012004;
	AddPfx1 = {80};
	San = {
			Idel = 1001200401;
			
			FIdel = 1001200411;
			Move = 1001200412;
			Atk = 1001200413;
			Hurt = 1001200414;
			Dead = 1001200415;
			
			[1] = 1001200480;--剧情 躺地
		  };
	Width = 2;
	StartPos = _Vector3.new(0.5,0.5,2.4);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.34);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1.4,-6,1.3);Look = _Vector3.new(0.65,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(1.6,-4.2,1.7);Look = _Vector3.new(-1,0,1.7);};
	};
 --金军高手
   [10012005]={
	LookId = 10012005;Icon = 10012005;Skl = 10012005;Skn = 10012005;
	San = {
			Idel = 1001200501;
			
			FIdel = 1001200511;
			Move = 1001200512;
			Atk = 1001200513;
			Hurt = 1001200514;
			Dead = 1001200515;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.5,0.5,2.4);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.3,0.34);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.9,-6,1.6);Look = _Vector3.new(1,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(1.5,-3,2);Look = _Vector3.new(-0.85,0,1.8);};
	};
 --追杀之人
   [10012006]={
	LookId = 10012006;Icon = 10012006;Skl = 10012006;Skn = 10012006;
	San = {
			Idel = 1001200601;
			
			FIdel = 1001200611;
			Move = 1001200612;
			Atk = 1001200613;
			Hurt = 1001200614;
			Dead = 1001200615;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,0.82);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.08);--被击光效的位置
	HurtPfxScal = _Vector3.new(0.91,0.91,0.91);--被击光效的缩放
	};
 --异乡人头领
   [10012007]={
	LookId = 10012007;Icon = 10012007;Skl = 10012007;Skn = 10012007;
	AddPfx1 = {80};
	San = {
			Idel = 1001200701;
			
			FIdel = 1001200711;
			Move = 1001200712;
			Atk = 1001200713;
			Hurt = 1001200714;
			Dead = 1001200715;
			
		  };
	Width = 2;
	StartPos = _Vector3.new(0.5,0.5,2.4);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.34);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1.4,-6,1.3);Look = _Vector3.new(0.65,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(1.6,-4.2,1.7);Look = _Vector3.new(-1,0,1.7);};
	};	
 --路雯-拿枪
   [50012001]={
	LookId = 50012001;Icon = 50012001;Skl = 50012001;Skn = 50012001;
	San = {
			Idel = 5001200101;
			
			FIdel = 5001200111;
			Move = 5001200112;
			Atk = 5001200113;
			Hurt = 5001200114;
			Dead = 5001200115;
			
			[1] = 5001200180;--剧情 倒地
			[2] = 5001200181;--剧情 躺地
			[3] = 5001200182;--剧情 被抱起过程中
			[4] = 5001200183;--剧情 被抱起
		  };
	Width = 1.3;
	StartPos = _Vector3.new(0.15,0.5,0.82);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.08);--被击光效的位置
	HurtPfxScal = _Vector3.new(0.91,0.91,0.91);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.9,-5,1.6);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(1.5,-3,1.5);Look = _Vector3.new(-0.85,0,1.5);};
	};
	
------------
  --陆冠英
  [10021001]={
	LookId = 10021001;Icon = 10021001;Skl = 10021001;Skn = 10021001;
	San = {
			Idel = 1002100101;
			Act = 1002100102;
			
			FIdel = 1002100111;
			Move = 1002100112;
			Atk = 1002100113;
			Hurt = 1002100114;
			Dead = 1002100115;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.7,-5,1.4);Look = _Vector3.new(0.75,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.5,-2.7,2);Look = _Vector3.new(-0.4,0,1.6);};
	};
 --吕太守
  [10021002]={
	LookId = 10021002;Icon = 10021002;Skl = 10021002;Skn = 10021002;
	San = {
			Idel = 1002100201;
			Act = 1002100202;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.05,-4.8,1.1);Look = _Vector3.new(0.75,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0,-3.1,1.9);Look = _Vector3.new(-0.5,0,1.32);};
	};
  --戈楠 武器商
  [10021003]={
	LookId = 10021003;Icon = 10021003;Skl = 10021003;Skn = 10021003;
	San = {
			Idel = 1002100301;
			--Act = 1002100302;
			
			FIdel = 1002100311;
			Move = 1002100312;
			Atk = 1002100313;
			Hurt = 1002100314;
			Dead = 1002100315;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-3.5,1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.2,-2.2,1.25);Look = _Vector3.new(-0.35,0,1.25);};
	};
  --南筱芸 防具商
  [10021004]={
	LookId = 10021004;Icon = 10021004;Skl = 10021004;Skn = 10021004;
	San = {
			Idel = 1002100401;
			Act = 1002100402;
			
			FIdel = 1002100411;
			Move = 1002100412;
			Atk = 1002100413;
			Hurt = 1002100414;
			Dead = 1002100415;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-3.9,1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.7,1.2);Look = _Vector3.new(-0.6,0,1.2);};
	};
  --杨锋 装备炼制
  [10021005]={
	LookId = 10021005;Icon = 10021005;Skl = 10021005;Skn = 10021005;
	San = {
			Idel = 1002100501;
			Act = 1002100502;
			
			FIdel = 1002100511;
			Move = 1002100512;
			Atk = 1002100513;
			Hurt = 1002100514;
			Dead = 1002100515;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.5,-5.2,1.3);Look = _Vector3.new(0.5,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3.7,1.5);Look = _Vector3.new(-1,0,1.5);};
	};
  --客栈 小二
  [10021006]={
	LookId = 10021006;Icon = 10021006;Skl = 10021006;Skn = 10021006;
	San = {
			Idel = 1002100601;
			Act = 1002100602;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-3.5,0.9);Look = _Vector3.new(0.55,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0,-2.2,1.1);Look = _Vector3.new(-0.45,0,1.1);};
	};
  --章博 秘籍商
  [10021007]={
	LookId = 10021007;Icon = 10021007;Skl = 10021007;Skn = 10021007;
	San = {
			Idel = 1002100701;
			Act = 1002100702;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-0.3,-3.8,1.2);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(-0.3,-2.8,1.4);Look = _Vector3.new(-0.5,0,1.4);};
	};
  --晓薇 杂货商
  [10021008]={
	LookId = 10021008;Icon = 10021008;Skl = 10021008;Skn = 10021008;
	San = {
			Idel = 1002100801;
			Act = 1002100802;
			
			FIdel = 1002100811;
			Move = 1002100812;
			Atk = 1002100813;
			Hurt = 1002100814;
			Dead = 1002100815;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.5,-3,1.8);Look = _Vector3.new(0.35,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0.1,-2,1.7);Look = _Vector3.new(-0.5,0,1);};
	};
  --周静恒 饰品商
  [10021009]={
	LookId = 10021009;Icon = 10021009;Skl = 10021009;Skn = 10021009;
	San = {
			Idel = 1002100901;
			Act = 1002100902;
			
			FIdel = 1002100911;
			Move = 1002100912;
			Atk = 1002100913;
			Hurt = 1002100914;
			Dead = 1002100915;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-0.3,-3.9,1.3);Look = _Vector3.new(0.63,0,1.15);};
	Movie_0 = {Eye = _Vector3.new(-0.3,-2.5,1.4);Look = _Vector3.new(-0.5,0,1.4);};
	};
  --纪开泰 仓库管理员
  [10021010]={
	LookId = 10021010;Icon = 10021010;Skl = 10021010;Skn = 10021010;
	San = {
			Idel = 1002101001;
			Act = 1002101002;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-0.1,-5.5,1.4);Look = _Vector3.new(1.2,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0,-4,1.4);Look = _Vector3.new(-0.4,0,1.4);};
	};
  --刘雨 坐骑商
  [10021011]={
	LookId = 10021011;Icon = 10021011;Skl = 10021011;Skn = 10021011;
	San = {
			Idel = 1002101101;
			Act = 1002101102;
			
			FIdel = 1002101111;
			Move = 1002101112;
			Atk = 1002101113;
			Hurt = 1002101114;
			Dead = 1002101115;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.4,-3.7,1);Look = _Vector3.new(0.7,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2,1.4);Look = _Vector3.new(-0.5,0,1.4);};
	};
  --欧雅琪 药品商
  [10021012]={
	LookId = 10021012;Icon = 10021012;Skl = 10021012;Skn = 10021012;
	San = {
			Idel = 1002101201;
			Act = 1002101202;
			
			FIdel = 1002101211;
			Move = 1002101212;
			Atk = 1002101213;
			Hurt = 1002101214;
			Dead = 1002101215;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.5,-3.5,1);Look = _Vector3.new(0.55,0,1);};
	Movie_0 = {Eye = _Vector3.new(0,-2,1.5);Look = _Vector3.new(-0.4,0,1.5);};
	};
	
		--欧雅琪 群侠怪物
	[10021041]={
	LookId = 10021041;Icon = 10021041;Skl = 10021041;Skn = 10021041;
	San = {
			Idel = 1002104101;
		--	Act = 1002104102;
			
			FIdel = 1002104111;
			Move = 1002104112;
			Atk = 1002104113;
			Hurt = 1002104114;
			Dead = 1002104115;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-10,2.8);Look = _Vector3.new(0.7,0,2.8);};
	Movie_0 = {Eye = _Vector3.new(0.4,-10,2.8);Look = _Vector3.new(0.7,0,2.8);};
	};
	-----
  --广平禅师 护身镜商
  [10021013]={
	LookId = 10021013;Icon = 10021013;Skl = 10021013;Skn = 10021013;
	San = {
			Idel = 1002101301;
			Act = 1002101302;
			
			FIdel = 1002101311;
			Move = 1002101312;
			Atk = 1002101313;
			Hurt = 1002101314;
			Dead = 1002101315;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-5.7,1.5);Look = _Vector3.new(1.1,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0,-2.6,2);Look = _Vector3.new(-0.45,0,1.7);};
	};
  --颜灵 宝石匠人
  [10021014]={
	LookId = 10021014;Icon = 10021014;Skl = 10021014;Skn = 10021014;
	San = {
			Idel = 1002101401;
			Act = 1002101402;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.4,-3.8,1.2);Look = _Vector3.new(0.6,0,1.15);};
	Movie_0 = {Eye = _Vector3.new(0.4,-2.2,1.8);Look = _Vector3.new(-0.5,0,1.5);};
	};
  --许竹青 客栈老板
  [10021015]={
	LookId = 10021015;Icon = 10021015;Skl = 10021015;Skn = 10021015;
	San = {
			Idel = 1002101501;
			Act = 1002101502;
			
			FIdel = 1002101511;
			Move = 1002101512;
			Atk = 1002101513;
			Hurt = 1002101514;
			Dead = 1002101515;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.6,-5.3,1.1);Look = _Vector3.new(0.5,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3.7,1.5);Look = _Vector3.new(-0.6,0,1.5);};
	};
  --小孩
  [10021016]={
	LookId = 10021016;Icon = 10021016;Skl = 10021016;Skn = 10021016;
	San = {
			Idel = 1002101602;
			Act = 1002101601;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-1.7,0.2);Look = _Vector3.new(0.3,0,0.2);};
	Movie_0 = {Eye = _Vector3.new(1,-1.3,0.5);Look = _Vector3.new(-0.5,0,0.5);};
	};
  --后勤军官（坐骑商人老版）
  [10021017]={
	LookId = 10021017;Icon = 10021017;Skl = 10021017;Skn = 10021017;
	San = {
			Idel = 1002101701;
			Act = 1002101702;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.8,-3.5,1);Look = _Vector3.new(0.5,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.7,-1.4,1.45);Look = _Vector3.new(-0.4,0,1.45);};
	};
  --牛冲天 帮会管理员
  [10021018]={
	LookId = 10021018;Icon = 10021018;Skl = 10021018;Skn = 10021018;
	San = {
			Idel = 1002101801;
			Act = 1002101802;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.6,-4,1.1);Look = _Vector3.new(0.6,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.5,-3.3,1.7);Look = _Vector3.new(-0.55,0,1.7);};
	};
  --谢听风   （老的装备精炼师）
  [10021019]={
	LookId = 10021019;Icon = 10021019;Skl = 10021019;Skn = 10021019;
	San = {
			Idel = 1002101901;
			Act = 1002101902;
			
			Move = 1002101912;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4,1);Look = _Vector3.new(0.65,0,1);};
	Movie_0 = {Eye = _Vector3.new(0,-2.7,1.2);Look = _Vector3.new(-0.45,0,1.25);};
	};
  --乞丐
	[10021020]={
	LookId = 10021020;Icon = 10021020;Skl = 10021020;Skn = 10021020;
	San = {
			Idel = 1002102001;
			--Act = 1002102002;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4,0.2);Look = _Vector3.new(0.65,0,0.5);};
	Movie_0 = {Eye = _Vector3.new(0,-3,0.2);Look = _Vector3.new(-0.6,0,0.8);};
	};
  --说书人
	[10021021]={
	LookId = 10021021;Icon = 10021021;Skl = 10021021;Skn = 10021021;
	San = {
			Idel = 1002102101;
			Act = 1002102102;
			
			Move = 1002102112;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.3,1.2);Look = _Vector3.new(0.67,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3.65,1.0);Look = _Vector3.new(-0.65,0,1.4);};
	};
  --巡逻衙役  NPC
	[10021022]={
	LookId = 10021022;Icon = 10021022;Skl = 10021022;Skn = 10021022;
	San = {
			Idel = 1002102201;
			Act = 1002102202;
			
			Move = 1002102212;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.75,1.15);Look = _Vector3.new(0.8,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.6,1.0);Look = _Vector3.new(-0.7,0,1.4);};
	};

  --官僚
	[10021023]={
	LookId = 10021023;Icon = 10021023;Skl = 10021023;Skn = 10021023;
	San = {
			Idel = 1002102301;
			--Act = 1002102302;
			
			FIdel = 1002102311;
			Move = 1002102312;
			Dead = 1002102315;
			
			[1] = 1002102315;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5.5,1.15);Look = _Vector3.new(0.8,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.6,1.0);Look = _Vector3.new(-0.7,0,1.4);};
	};
  --普通青年读书人
	[10021024]={
	LookId = 10021024;Icon = 10021024;Skl = 10021024;Skn = 10021024;
	San = {
			Idel = 1002102401;
			--Act = 1002102402;
			
			FIdel = 1002102411;
			Move = 1002102412;
			Atk = 1002102413;
			Hurt = 1002102414;
			Dead = 1002102415;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,1.1);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1.2);Look = _Vector3.new(-0.6,0,1.5);};
	};
	--长歌狐姬
	[10021025]={
	LookId = 10021025;Icon = 10021025;Skl = 10021025;Skn = 10021025;
	San = {
			Idel = 1002102501;
			--Act = 1002102502;
			
			[1] = 1002102581;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.5,1.2);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1.0);Look = _Vector3.new(-0.7,0,1.4);};
	};
	--小男孩
	[10021026]={
	LookId = 10021026;Icon = 10021026;Skl = 10021026;Skn = 10021026;
	San = {
			Idel = 1002102601;
			Act = 1002102602;
			
			Move = 1002102612;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.2,0);Look = _Vector3.new(0.7,0,0.95);};
	Movie_0 = {Eye = _Vector3.new(0,-3,0.0);Look = _Vector3.new(-0.6,0,1.3);};
	};
	
	--书呆子
	[10021027]={
	LookId = 10021027;Icon = 10021027;Skl = 10021027;Skn = 10021027;
	San = {
			Idel = 1002102701;
			Act = 1002102702;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.3,1.0);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1);Look = _Vector3.new(-0.6,0,1.2);};
	};

	--巡逻捕头 NPC
	[10021028]={
	LookId = 10021028;Icon = 10021028;Skl = 10021028;Skn = 10021028;
	San = {
			Idel = 1002102801;
			Act = 1002102802;
			
			Move = 1002102812;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.3,1.0);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1);Look = _Vector3.new(-0.6,0,1.2);};
	};
	
	--愤青读书人
	[10021029]={
	LookId = 10021029;Icon = 10021029;Skl = 10021029;Skn = 10021029;
	San = {
			Idel = 1002102901;
			Act = 1002102902;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.7,-10,2.9);Look = _Vector3.new(0.8,0,2.6);};
	Movie_0 = {Eye = _Vector3.new(0.7,-8,3.4);Look = _Vector3.new(-1.8,0,3);};
	};
	
	--康兴哥 怪物
	[10021030]={
	LookId = 10021030;Icon = 10021030;Skl = 10021030;Skn = 10021030;
	San = {
			Idel = 1002103001;
			Act = 1002103002;
			
			FIdel = 1002103011;
			Move = 1002103012;
			Atk = 1002103013;
			Hurt = 1002103014;
			Dead = 1002103015;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-3.5,0.9);Look = _Vector3.new(0.55,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0,-2.2,1.1);Look = _Vector3.new(-0.45,0,1.1);};
	};
	
	--牛冲天 怪物
	[10021031]={
	LookId = 10021031;Icon = 10021031;Skl = 10021031;Skn = 10021031;
	San = {
			Idel = 1002103101;
			--Act = 1002103102;
			
			FIdel = 1002103111;
			Move = 1002103112;
			Atk = 1002103113;
			Hurt = 1002103114;
			Dead = 1002103115;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.6,-4,1.1);Look = _Vector3.new(0.6,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.5,-3.3,1.7);Look = _Vector3.new(-0.55,0,1.7);};
	};
	
  --纨绔子弟
	[10021032]={
	LookId = 10021032;Icon = 10021032;Skl = 10021032;Skn = 10021032;
	San = {
			Idel = 1002103201;
			Act = 1002103202;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.6,-4,1.1);Look = _Vector3.new(0.6,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.5,-3.3,1.7);Look = _Vector3.new(-0.55,0,1.7);};
	};
	
  --跳舞狐姬
	[10021033]={
	LookId = 10021033;Icon = 10021033;Skl = 10021033;Skn = 10021033;
	San = {
			Idel = 1002103301;
			Act = 1002103302;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.6,-4,1.1);Look = _Vector3.new(0.6,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.5,-3.3,1.7);Look = _Vector3.new(-0.55,0,1.7);};
	};
	
  --谄媚跟班
	[10021034]={
	LookId = 10021034;Icon = 10021034;Skl = 10021034;Skn = 10021034;
	San = {
			Idel = 1002103401;
			Act = 1002103402;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-3.5,0.9);Look = _Vector3.new(0.55,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0,-2.2,1.1);Look = _Vector3.new(-0.45,0,1.1);};
	};
	
  --老年乞丐
	[10021035]={
	LookId = 10021035;Icon = 10021035;Skl = 10021035;Skn = 10021035;
	San = {
			Idel = 1002103501;
			Act = 1002103502;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.5,1);Look = _Vector3.new(0.55,0,0.7);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1.1);Look = _Vector3.new(-0.55,0,0.7);};
	};
	
  --年轻乞丐
	[10021036]={
	LookId = 10021036;Icon = 10021036;Skl = 10021036;Skn = 10021036;
	San = {
			Idel = 1002103601;
			Act = 1002103602;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.5,1);Look = _Vector3.new(0.55,0,0.7);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1.1);Look = _Vector3.new(-0.55,0,0.7);};
	};
	
	--巡逻捕头 怪物
	[10021037]={
	LookId = 10021037;Icon = 10021037;Skl = 10021037;Skn = 10021037;
	San = {
			Idel = 1002103701;
			Act = 1002103702;
			
			FIdel = 1002103711;
			Move = 1002103712;
			Atk = 1002103713;
			Hurt = 1002103714;
			Dead = 1002103715;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.3,1.0);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1);Look = _Vector3.new(-0.6,0,1.2);};
	};

  --巡逻衙役 怪物
	[10021038]={
	LookId = 10021038;Icon = 10021038;Skl = 10021038;Skn = 10021038;
	San = {
			Idel = 1002103801;
			Act = 1002103802;
			
			FIdel = 1002103811;
			Move = 1002103812;
			Atk = 1002103813;
			Hurt = 1002103814;
			Dead = 1002103815;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.75,1.15);Look = _Vector3.new(0.8,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.6,1.0);Look = _Vector3.new(-0.7,0,1.4);};
	};
	
  --康兴哥拿锄头 UI 用
	[10021039]={
	LookId = 10021039;Icon = 10021039;Skl = 10021039;Skn = 10021039;
	San = {
			Idel = 1002103901;
			Act = 1002103902;
			
			-- FIdel = 1002103911;
			-- Move = 1002103912;
			-- Atk = 1002103913;
			-- Hurt = 1002103914;
			-- Dead = 1002103915;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.75,1.15);Look = _Vector3.new(0.8,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.6,1.0);Look = _Vector3.new(-0.7,0,1.4);};
	};

  --章博 怪物群侠
  [10021040]={
	LookId = 10021040;Icon = 10021040;Skl = 10021040;Skn = 10021040;
	San = {
			Idel = 1002104001;
			
			FIdel = 1002104011;
			Move = 1002104012;
			Atk = 1002104013;
			Hurt = 1002104014;
			Dead = 1002104015;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-0.3,-3.8,1.2);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(-0.3,-2.8,1.4);Look = _Vector3.new(-0.5,0,1.4);};
	};
	
  --小女孩
	[10021050]={
	LookId = 10021050;Icon = 10021050;Skl = 10021050;Skn = 10021050;
	San = {
			Idel = 1002105001;
			Act = 1002105002;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.2,0);Look = _Vector3.new(0.7,0,0.95);};
	Movie_0 = {Eye = _Vector3.new(0,-3,0.0);Look = _Vector3.new(-0.6,0,1.3);};
	};

  --商城导购-丁珰
	[10021051]={
	LookId = 10021051;Icon = 10021051;Skl = 10021051;Skn = 10021051;
	San = {
			Idel = 1002105101;
			Act = 1002105102;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.2,0);Look = _Vector3.new(0.7,0,0.95);};
	Movie_0 = {Eye = _Vector3.new(0,-3,0.0);Look = _Vector3.new(-0.6,0,1.3);};
	};
	
 --活动管理员
	[10021098]={
	LookId = 10021098;Icon = 10021098;Skl = 10021098;Skn = 10021098;
	San = {
			Idel = 1002109801;
			Act = 1002109802;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-4.5,2.7);Look = _Vector3.new(0.6,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0,-2,2);Look = _Vector3.new(-0.5,0,1.6);};
	};
  --告示牌
  [10021100]={
	LookId = 10021100;Icon = 10021100;Skl = 10021100;Skn = 10021100;
	San = {
			Idel = 1002110001;
			--Act = 1002110002;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.5,-7,2.7);Look = _Vector3.new(0.7,0,2.1);};
	Movie_0 = {Eye = _Vector3.new(1.2,-5,3.1);Look = _Vector3.new(-1,0,2.2);};
	};
  --飞贼
  [10022099]={
	LookId = 10022099;Icon = 10022099;Skl = 10022099;Skn = 10022099;
	AddPfx1 = {171};
	San = {
			Idel = 1002209901;
			--Act = 1002209902;
			
			FIdel = 1002209911;
			Move = 1002209912;
			Atk = 1002209913;
			Hurt = 1002209914;
			Dead = 1002209915;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.5,-7,2.8);Look = _Vector3.new(1.35,0,1.6);};
	Movie_0 = {Eye = _Vector3.new(1.2,-4.7,3.3);Look = _Vector3.new(-1.5,0,1.9);};
	};
 ---------襄阳野郊----------
  --宋将军
  [10031001]={
	LookId = 10031001;Icon = 10031001;Skl = 10031001;Skn = 10031001;
	San = {
			Idel = 1003100101;
			Act = 1003100102;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-5,1.3);Look = _Vector3.new(0.75,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.1,-3,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
  --宋军小兵
  [10031003]={
	LookId = 10031003;Icon = 10031003;Skl = 10031003;Skn = 10031003;
	San = {
			Idel = 1003100301;
			--Act = 1003100302;
			
			FIdel = 1003100311;
			Move = 1003100312;
			Atk = 1003100313;
			Hurt = 1003100314;
			Dead = 1003100315;
			
			[1] = 1003100380;---剧情 躺地
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.7,-3.7,2.35);Look = _Vector3.new(0.6,0,0.85);};
	Movie_0 = {Eye = _Vector3.new(0.5,-2.6,2.5);Look = _Vector3.new(-0.7,0,1.1);};
	};
  --宋军小兵 - 走路动作 巡逻用
  [10031004]={
	LookId = 10031004;Icon = 10031004;Skl = 10031004;Skn = 10031004;
	San = {
			Idel = 1003100401;
			--Act = 1003100402;
			
			FIdel = 1003100411;
			Move = 1003100412;
			Atk = 1003100413;
			Hurt = 1003100414;
			Dead = 1003100415;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.7,-3.7,2.35);Look = _Vector3.new(0.6,0,0.85);};
	Movie_0 = {Eye = _Vector3.new(0.5,-2.6,2.5);Look = _Vector3.new(-0.7,0,1.1);};
	};
   --韩副将
  [10031023]={
	LookId = 10031023;Icon = 10031023;Skl = 10031023;Skn = 10031023;
	San = {
			Idel = 1003102301;
			Act = 1003102302;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.2,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.25,-3,1.6);Look = _Vector3.new(-0.65,0,1.6);};
	};
  --凌教头 Npc
  [10031009]={
	LookId = 10031009;Icon = 10031009;Skl = 10031009;Skn = 10031009;
	San = {
			Idel = 1003100901;
			Act = 1003100902;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,0.82);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.08);--被击光效的位置
	HurtPfxScal = _Vector3.new(0.91,0.91,0.91);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-4.5,1.4);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3,1.7);Look = _Vector3.new(-0.7,0,1.7);};
	};
  --凌教头 Monster
  [50022001]={
	LookId = 50022001;Icon = 50022001;Skl = 50022001;Skn = 50022001;
	San = {
			Idel = 5002200101;
			--Act = 5002200102;
			
			FIdel = 5002200111;
			Move = 5002200112;
			Atk = 5002200113;
			Hurt = 500220014;
			Dead = 5002200115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,0.82);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.08);--被击光效的位置
	HurtPfxScal = _Vector3.new(0.91,0.91,0.91);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-4.5,1.4);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3,1.7);Look = _Vector3.new(-0.7,0,1.7);};
	};
  --金军先锋
  [10032001]={
	LookId = 10032001;Icon = 10032001;Skl = 10032001;Skn = 10032001;
	San = {
			Idel = 1003200101;
			--Act = 1003200102;
			
			FIdel = 1003200111;
			Move = 1003200112;
			Atk = 1003200113;
			Hurt = 1003200114;
			Dead = 1003200115;
			
			[1] = 1003200180;--躺地
			[2] = 1003200181;--偷懒
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,1.75);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.15,0.32);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.1,1.1,1.1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,2);Look = _Vector3.new(0.7,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.9,-3.2,1.9);Look = _Vector3.new(-0.8,0,1.5);};
	};
  --金军步兵
  [10032002]={
	LookId = 10032002;Icon = 10032002;Skl = 10032002;Skn = 10032002;
	San = {
			Idel = 1003200201;
			--Act = 1003200102;
			
			FIdel = 1003200211;
			Move = 1003200212;
			Atk = 1003200213;
			Hurt = 1003200214;
			Dead = 1003200215;

		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,1.25);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.25);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.0,1.0,1.0);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-3.5,1.9);Look = _Vector3.new(0.5,0,1.0);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3.5,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
	
  --金军弓兵
  [10032003]={
	LookId = 10032003;Icon = 10032003;Skl = 10032003;Skn = 10032003;
	San = {
			Idel = 1003200301;
			--Act = 1003200302;
			
			FIdel = 1003200311;
			Move = 1003200312;
			Atk = 1003200313;
			Hurt = 1003200314;
			Dead = 1003200315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,1.25);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.25);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.0,1.0,1.0);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-4,1.55);Look = _Vector3.new(0.5,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.7,-2.3,1.35);Look = _Vector3.new(-0.5,0,1.35);};
	};
  --金军百夫长
  [10032004]={
	LookId = 10032004;Icon = 10032004;Skl = 10032004;Skn = 10032004;
	San = {
			Idel = 1003200401;
			--Act = 1003200402;
			
			FIdel = 1003200411;
			Move = 1003200412;
			Atk = 1003200413;
			Hurt = 1003200414;
			Dead = 1003200415;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,1.75);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.15,0.32);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.1,1.1,1.1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-5,1.2);Look = _Vector3.new(0.75,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3.5,1.6);Look = _Vector3.new(-0.5,0,1.6);};
	};
  --蒙古游骑
  [10032005]={
	LookId = 10032005;Icon = 10032005;Skl = 10032005;Skn = 10032005;
	San = {
			Idel = 1003200501;
			--Act = 1003200502;
			
			FIdel = 1003200511;
			Move = 1003200512;
			Atk = 1003200513;
			Hurt = 1003200514;
			Dead = 1003200515;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-5,1.2);Look = _Vector3.new(0.75,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3.5,1.6);Look = _Vector3.new(-0.8,0,1.6);};
	};
  --先锋头目
  [50720008]={
	LookId = 50720008;Icon = 50720008;Skl = 50720008;Skn = 50720008;
	San = {
			Idel = 5072000801;
			--Act = 5072000802;
			
			FIdel = 5072000811;
			Move = 5072000812;
			Atk = 5072000813;
			Hurt = 5072000814;
			Dead = 5072000815;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.5,1.75);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.15,0.32);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.1,1.1,1.1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-5.5,1.4);Look = _Vector3.new(0.6,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0,-4,1.7);Look = _Vector3.new(-0.9,0,1.7);};
	};
  --金军将领
  [10032006]={
	LookId = 10032006;Icon = 10032006;Skl = 10032006;Skn = 10032006;
	AddPfx1 = {50};
	San = {
			Idel = 1003200601;
			--Act = 1003200602;
			
			FIdel = 1003200611;
			Move = 1003200612;
			Atk = 1003200613;
			Hurt = 1003200614;
			Dead = 1003200615;
		  };
	Width = 2;
	StartPos = _Vector3.new(0.5,0.9,2.4);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.14);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(5.5,-4,1.3);Look = _Vector3.new(1,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.7,-5,1.6);Look = _Vector3.new(-0.8,0,1.6);};
	};
  -------------------桃花岛
  --桃花岛哑仆
  [10041001]={
	LookId = 10041001;Icon = 10041001;Skl = 10041001;Skn = 10041001;
	San = {
			Idel = 1004100101;
			Act = 1004100102;
			
			[1] = 1004100190; -- 甩棋子动作01
			[2] = 1004100191; -- 甩棋子动作02
			[3] = 1004100192; -- 甩棋子动作03
			
			Move = 1004100112;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.9,-4.7,1.2);Look = _Vector3.new(0.85,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3,1.6);Look = _Vector3.new(-0.6,0,1.6);};
	};
  --傻姑
  [10041002]={
	LookId = 10041002;Icon = 10041002;Skl = 10041002;Skn = 10041002;
	San = {
			Idel = 1004100201;
			Act = 1004100202;
			
			FIdel = 1004100211;
			Move = 1004100212;
			Atk = 1004100213;
			Hurt = 1004100214;
			Dead = 1004100215;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.3,-4,1);Look = _Vector3.new(0.6,0.25,1);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.4);Look = _Vector3.new(-0.7,0.25,1.4);};
	};
  --柯镇恶
  [10041003]={
	LookId = 10041003;Icon = 10041003;Skl = 10041003;Skn = 10041003;
	San = {
			Idel = 1004100301;
			--Act = 1004100302;
			
			FIdel = 1004100311;
			Move = 1004100312;
			Atk = 1004100313;
			Hurt = 1004100314;
			Dead = 1004100315;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.5,-4.7,1.2);Look = _Vector3.new(0.7,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.2,-3,1.5);Look = _Vector3.new(-0.53,0,1.5);};
	};
  --郭靖
  [10041004]={
	LookId = 10041004;Icon = 10041004;Skl = 10041004;Skn = 10041004;
	AddPfx1 = {90,91};
	San = {
			Idel = 1004100401;
			Act = 1004100402;
			
			FIdel = 1004100411;
			Move = 1004100412;
			Atk = 1004100413;
			Hurt = 1004100414;
			Dead = 1004100415;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.5,-5,2.4);Look = _Vector3.new(0.7,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.6,-3.3,2);Look = _Vector3.new(-0.8,0,1.9);};
	};
  --郭芙
  [10041005]={
	LookId = 10041005;Icon = 10041005;Skl = 10041005;Skn = 10041005;
	San = {
			Idel = 1004100501;
			Act = 1004100502;
			
			Move = 1004100512;
			
			[1] = 1004100580;--受伤
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-3.4,1.8);Look = _Vector3.new(0.5,0,1);};
	Movie_0 = {Eye = _Vector3.new(0,-2.2,1.5);Look = _Vector3.new(-0.4,0,1.5);};
	Talk_1 = {Eye = _Vector3.new(0,-3.4,1.2);Look = _Vector3.new(0.5,0,0.4);};
	Movie_1 = {Eye = _Vector3.new(0,-2.2,1.2);Look = _Vector3.new(-0.4,0,0.4);};
	};
  --傻姑-群侠
  [10041006]={
	LookId = 10041006;Icon = 10041006;Skl = 10041006;Skn = 10041006;
	San = {
			Idel = 1004100601;
			Act = 1004100602;
			
			FIdel = 1004100611;
			Move = 1004100612;
			Atk = 1004100613;
			Hurt = 1004100614;
			Dead = 1004100615;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1.3,-4,1);Look = _Vector3.new(0.6,0.25,1);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.4);Look = _Vector3.new(-0.7,0.25,1.4);};
	};
  --大飞 白余明
  [10041017]={
	LookId = 10041017;Icon = 10041017;Skl = 10041017;Skn = 10041017;
	San = {
			Idel = 1004101701;
			--Act = 1004101702;
			
			FIdel = 1004101711;
			Move = 1004101712;
			Atk = 1004101713;
			Hurt = 1004101714;
			Dead = 1004101715;
			
			[1] = 1004101780;--受伤
			[2] = 1004101781;--躺下
		  };
	Width = 1.3;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-5,1);Look = _Vector3.new(0.8,0,1);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.60);Look = _Vector3.new(-0.5,0,1.60);};
	Talk_1 = {Eye = _Vector3.new(1,-5,1);Look = _Vector3.new(0.8,0,1);};
	Movie_1 = {Eye = _Vector3.new(0.5,-2.2,1);Look = _Vector3.new(-0.45,0,1);};
	Talk_2 = {Eye = _Vector3.new(1,-5,1);Look = _Vector3.new(0.8,0,1);};
	Movie_2 = {Eye = _Vector3.new(1,-3,1.60);Look = _Vector3.new(-0.5,0,1.60);};
	};
  --灵猴
  [10042001]={
	LookId = 10042001;Icon = 10042001;Skl = 10042001;Skn = 10042001;
	San = {
			Idel = 1004200101;
			--Act = 1004200102;
			
			FIdel = 1004200111;
			Move = 1004200112;
			Atk = 1004200113;
			Hurt = 1004200114;
			Dead = 1004200115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,0.46);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.1,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  --不诡哑仆
  [10042002]={
	LookId = 10042002;Icon = 10042002;Skl = 10042002;Skn = 10042002;
	San = {
			Idel = 1004200201;
			--Act = 1004200202;
			
			FIdel = 1004200211;
			Move = 1004200212;
			Atk = 1004200213;
			Hurt = 1004200214;
			Dead = 1004200215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,1.35);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.25);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.0,1.0,1.0);--被击光效的缩放
	};
  --凶恶哑仆
  [10042003]={
	LookId = 10042003;Icon = 10042003;Skl = 10042003;Skn = 10042003;
	San = {
			Idel = 1004200301;
			--Act = 1004200302;
			
			FIdel = 1004200311;
			Move = 1004200312;
			Atk = 1004200313;
			Hurt = 1004200314;
			Dead = 1004200315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,1.35);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,0.25);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.0,1.0,1.0);--被击光效的缩放
	};
  --毒蝎
  [10042004]={
	LookId = 10042004;Icon = 10042004;Skl = 10042004;Skn = 10042004;
	San = {
			Idel = 1004200401;
			--Act = 1004200402;
			
			FIdel = 1004200411;
			Move = 1004200412;
			Atk = 1004200413;
			Hurt = 1004200414;
			Dead = 1004200415;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  --玉蟾
  [10042005]={
	LookId = 10042005;Icon = 10042005;Skl = 10042005;Skn = 10042005;
	San = {
			Idel = 1004200501;
			--Act = 1004200502;
			
			FIdel = 1004200511;
			Move = 1004200512;
			Atk = 1004200513;
			--Hurt = 1004200514;
			Dead = 1004200515;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
 
 ------------绝情密涧
  --周伯通
  [10051001]={
	LookId = 10051001;Icon = 10051001;Skl = 10051001;Skn = 10051001;
	San = {
			Idel = 1005100101;
			Act = 1005100102;
			
			FIdel = 1005100111;
			Move = 1005100112;
			Atk = 1005100113;
			Hurt = 1005100114;
			Dead = 1005100115;
			
			[1] = 1005100190;
			[2] = 1005100191;
			[3] = 1005100192;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-5,1.8);Look = _Vector3.new(0.8,0,1);};
	Movie_0 = {Eye = _Vector3.new(1,-3.2,1.8);Look = _Vector3.new(-0.85,0,1.2);};
	};
   --裘千尺
  [10051002]={
	LookId = 10051002;Icon = 10051002;Skl = 10051002;Skn = 10051002;
	San = {
			Idel = 1005100201;
			Act = 1005100202;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-3.3,0.7);Look = _Vector3.new(0.4,0,0.7);};
	Movie_0 = {Eye = _Vector3.new(0,-2.05,0.9);Look = _Vector3.new(-0.4,0,0.9);};
	};
  --黄药师
  [10051003]={
	LookId = 10051003;Icon = 10051003;Skl = 10051003;Skn = 10051003;
	San = {
			Idel = 1005100301;
			Act = 1005100302;
			
			FIdel = 1005100311;
			Move = 1005100312;
			Atk = 1005100313;
			Hurt = 1005100314;
			Dead = 1005100315;
		  };
	Width = 1.3;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2.5,-5.5,1.9);Look = _Vector3.new(1,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(2,-3.7,2);Look = _Vector3.new(-0.9,0,2);};
	};
  --被困周伯通
  [10051004]={
	LookId = 10051004;Icon = 10051004;Skl = 10051004;Skn = 10051004;
	San = {
			Idel = 1005100401;
			Act = 1005100402;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.7,-4.5,1.8);Look = _Vector3.new(0.5,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,1.8);Look = _Vector3.new(-0.7,0,1.3);};
	};
  --公孙绿萼
  [10051006]={
	LookId = 10051006;Icon = 10051006;Skl = 10051006;Skn = 10051006;
	San = {
			Idel = 1005100601;
			Act = 1005100602;
			
			FIdel = 1005100611;
			Move = 1005100612;
			Atk = 1005100613;
			Hurt = 1005100614;
			Dead = 1005100615;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-3,1.3);Look = _Vector3.new(0.45,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-2.2,1.6);Look = _Vector3.new(-0.5,0,1.1);};
	}; 
  --地牢看守
  [10052001]={
	LookId = 10052001;Icon = 10052001;Skl = 10052001;Skn = 10052001;
	San = {
			Idel = 1005200101;
			--Act = 1005200102;
			
			FIdel = 1005200111;
			Move = 1005200112;
			Atk = 1005200113;
			Hurt = 1005200114;
			Dead = 1005200115;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.5,0.9,2.35);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.14);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-5.3,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3.5,1.5);Look = _Vector3.new(-0.75,0,1.5);};
	};
  --巡视弟子
  [10052002]={
	LookId = 10052002;Icon = 10052002;Skl = 10052002;Skn = 10052002;
	San = {
			Idel = 1005200201;
			--Act = 1005200202;
			
			FIdel = 1005200211;
			Move = 1005200212;
			Atk = 1005200213;
			Hurt = 1005200214;
			Dead = 1005200215;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.5,0.9,2.35);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.14);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-4.4,1.6);Look = _Vector3.new(0.30,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1.4);Look = _Vector3.new(-0.63,0,1.27);};
	};
   --野猴
  [10052003]={
	LookId = 10052003;Icon = 10052003;Skl = 10052003;Skn = 10052003;
	San = {
			Idel = 1005200301;
			--Act = 1005200302;
			
			FIdel = 1005200311;
			Move = 1005200312;
			Atk = 1005200313;
			Hurt = 1005200314;
			Dead = 1005200315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.5,0.9,2.35);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.14);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	};
   --鳄鱼
  [10052004]={
	LookId = 10052004;Icon = 10052004;Skl = 10052004;Skn = 10052004;
	San = {
			Idel = 1005200401;
			--Act = 1005200402;
			
			FIdel = 1005200411;
			Move = 1005200412;
			Atk = 1005200413;
			Hurt = 1005200414;
			Dead = 1005200415;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   --巨鳄
  [10052005]={
	LookId = 10052005;Icon = 10052005;Skl = 10052005;Skn = 10052005;
	San = {
			Idel = 1005200501;
			--Act = 1005200502;
			
			FIdel = 1005200511;
			Move = 1005200512;
			Atk = 1005200513;
			Hurt = 1005200514;
			Dead = 1005200515;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   --公孙止
  [10052006]={
	LookId = 10052006;Icon = 10052006;Skl = 10052006;Skn = 10052006;
	San = {
			Idel = 1005200601;
			--Act = 1005200602;
			
			FIdel = 1005200611;
			Move = 1005200612;
			Atk = 1005200613;
			Hurt = 1005200614;
			Dead = 1005200615;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-10,2.1);Look = _Vector3.new(1.4,0,2.1);};
	Movie_0 = {Eye = _Vector3.new(0,-7,2.5);Look = _Vector3.new(-1,0,2.4);};
	};
  ------------------------大理
  --一灯大师
  [10061001]={
	LookId = 10061001;Icon = 10061001;Skl = 10061001;Skn = 10061001;
	AddPfx1 = {30};
	San = {
			Idel = 1006100101;
			Act = 1006100102;
			
			FIdel = 1006100111;
			Move = 1006100112;
			Atk = 1006100113;
			Hurt = 1006100114;
			Dead = 1006100115;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-6,2.1);Look = _Vector3.new(0.6,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,1.9);Look = _Vector3.new(-0.95,0,1.9);};
	};
  --天竺神僧
  [10061002]={
	LookId = 10061002;Icon = 10061002;Skl = 10061002;Skn = 10061002;
	San = {
			Idel = 1006100201;
			Act = 1006100202;
			
			FIdel = 1006100211;
			Move = 1006100212;
			Atk = 1006100213;
			Hurt = 1006100214;
			Dead = 1006100215;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-5,1.3);Look = _Vector3.new(0.6,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-4,1.7);Look = _Vector3.new(-0.7,0,1.7);};
	}; 
  --觉明禅师
  [10061003]={
	LookId = 10061003;Icon = 10061003;Skl = 10061003;Skn = 10061003;
	San = {
			Idel = 1006100301;
			Act = 1006100302;
			
			Move = 1006100312;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,1.9);Look = _Vector3.new(0.85,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.7,1.8);Look = _Vector3.new(-0.6,0,1.5);};
	}; 
  --老道人（老的天竺神僧）
  [10061004]={
	LookId = 10061004;Icon = 10061004;Skl = 10061004;Skn = 10061004;
	San = {
			Idel = 1006100401;
			Act = 1006100402;
			
			Move = 1006100412;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-5,1.3);Look = _Vector3.new(0.6,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-4,1.7);Look = _Vector3.new(-0.7,0,1.7);};
	}; 
	--蓝凤凰
  [10061005]={
	LookId = 10061005;Icon = 10061005;Skl = 10061005;Skn = 10061005;
	San = {
			Idel = 1006100501;
			Act = 1006100502;
			
			FIdel = 1006100511;
			Move = 1006100512;
			Atk = 1006100513;
			Hurt = 1006100514;
			Dead = 1006100515;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-4.9,1.3);Look = _Vector3.new(0.8,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0,-3,2.0);Look = _Vector3.new(-0.7,0,1.4);};
	}; 
	
	--冉千江
  [10061007]={
	LookId = 10061007;Icon = 10061007;Skl = 10061007;Skn = 10061007;
	San = {
			Idel = 1006100701;
			Act = 1006100702;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-5.2,1.2);Look = _Vector3.new(0.75,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,2.0);Look = _Vector3.new(-0.7,0,1.4);};
	}; 
		
  --地痞没拿枪
  [10061008]={
	LookId = 10061008;Icon = 10061008;Skl = 10061008;Skn = 10061008;
	San = {
			Idel = 1006100801;
			Act = 1006100802;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.1,-3.7,0.9);Look = _Vector3.new(0.55,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0,-2,1.2);Look = _Vector3.new(-0.45,0,1.2);};
	}; 
   --发狂疫民
  [10062001]={
	LookId = 10062001;Icon = 10062001;Skl = 10062001;Skn = 10062001;
	San = {
			Idel = 1006200101;
			--Act = 1006200102;
			
			FIdel = 1006200111;
			Move = 1006200112;
			Atk = 1006200113;
			Hurt = 1006200114;
			Dead = 1006200115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   --五毒教探子
  [10062002]={
	LookId = 10062002;Icon = 10062002;Skl = 10062002;Skn = 10062002;
	San = {
			Idel = 1006200201;
			--Act = 1006200202;
			
			FIdel = 1006200211;
			Move = 1006200212;
			Atk = 1006200213;
			Hurt = 1006200214;
			Dead = 1006200215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.5,-4.7,2.2);Look = _Vector3.new(0.85,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0.6,-2.8,1.7);Look = _Vector3.new(-0.4,0,1);};
	};
   --穿山甲
  [10062003]={
	LookId = 10062003;Icon = 10062003;Skl = 10062003;Skn = 10062003;
	San = {
			Idel = 1006200301;
			--Act = 1006200302;
			
			FIdel = 1006200311;
			Move = 1006200312;
			Atk = 1006200313;
			Hurt = 1006200314;
			Dead = 1006200315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   --赤狐
  [10062004]={
	LookId = 10062004;Icon = 10062004;Skl = 10062004;Skn = 10062004;
	San = {
			Idel = 1006200401;
			--Act = 1006200402;
			
			FIdel = 1006200411;
			Move = 1006200412;
			Atk = 1006200413;
			Hurt = 1006200414;
			Dead = 1006200415;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
   --九尾灵狐
  [10062005]={
	LookId = 10062005;Icon = 10062005;Skl = 10062005;Skn = 10062005;
	San = {
			Idel = 1006200501;
			Act = 1006200502;
			
			FIdel = 1006200511;
			Move = 1006200512;
			Atk = 1006200513;
			Hurt = 1006200514;
			Dead = 1006200515;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.5,-3.25,2.1);Look = _Vector3.new(0.6,0,0.7);};
	Movie_0 = {Eye = _Vector3.new(0.1,-2.2,1.5);Look = _Vector3.new(-0.35,0,0.6);};
	};
   --五毒教巫祝
  [10062006]={
	LookId = 10062006;Icon = 10062006;Skl = 10062006;Skn = 10062006;
	AddPfx1 = {110,111};
	San = {
			Idel = 1006200601;
			--Act = 1006200402;
			
			FIdel = 1006200611;
			Move = 1006200612;
			Atk = 1006200613;
			Hurt = 1006200614;
			Dead = 1006200615;
		  };
	Width = 2;		--选中的光圈缩放
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-7,2.2);Look = _Vector3.new(1,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.7,-4,2.6);Look = _Vector3.new(-0.95,0,2.5);};
	};
   --五毒教蛊师
  [10062007]={
	LookId = 10062007;Icon = 10062007;Skl = 10062007;Skn = 10062007;
	San = {
			Idel = 1006200701;
			--Act = 1006200702;
			
			FIdel = 1006200711;
			Move = 1006200712;
			Atk = 1006200713;
			Hurt = 1006200714;
			Dead = 1006200715;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--------------白驼山
	--振威镖头 万里行
	[10071001]={
	LookId = 10071001;Icon = 10071001;Skl = 10071001;Skn = 10071001;
	San = {
			Idel = 1007100101;
			Act = 1007100102;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(1,-5.5,1.5);Look = _Vector3.new(0.6,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.6,-3.5,1.9);Look = _Vector3.new(-0.6,0,1.9);};
	}; 
	--何不留
	[10071004]={
	LookId = 10071004;Icon = 10071004;Skl = 10071004;Skn = 10071004;
	San = {
			Idel = 1007100401;
			Act = 1007100402;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-4.5,1.8);Look = _Vector3.new(0.65,0,1);};
	Movie_0 = {Eye = _Vector3.new(0,-3,1.4);Look = _Vector3.new(-0.65,0,1.4);};
	}; 
	--知客弟子
	[10071005]={
	LookId = 10071005;Icon = 10071005;Skl = 10071005;Skn = 10071005;
	San = {
			Idel = 1007100501;
			Act = 1007100502;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.19,-3.6,1.4);Look = _Vector3.new(0.64,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.2,-1.85,1.55);Look = _Vector3.new(-0.4,0,1.4);};
	}; 
	--黛丽丝
	[10071006]={
	LookId = 10071006;Icon = 10071006;Skl = 10071006;Skn = 10071006;
	AddPfx1 = {140,141,142};
	San = {
			Idel = 1007100601;
			Act = 1007100602;
			
			FIdel = 1007100611;
			Move = 1007100612;
			Atk = 1007100613;
			Hurt = 1007100614;
			Dead = 1007100615;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.2,-4.5,1.3);Look = _Vector3.new(0.5,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.2,-3.15,1.4);Look = _Vector3.new(-0.7,0,1.4);};
	}; 
	--欧阳锋
	[10071007]={
	LookId = 10071007;Icon = 10071007;Skl = 10071007;Skn = 10071007;
	AddPfx1 ={10,11};
	San = {
			Idel = 1007100701;
			--Act = 1007100702;
			
			FIdel = 1007100711;
			Move = 1007100712;
			Atk = 1007100713;
			Hurt = 1007100714;
			Dead = 1007100715;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.7,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-5,1.8);Look = _Vector3.new(-0.75,0,1.8);};
	}; 
	--明教教徒
	[10071008]={
	LookId = 10071008;Icon = 10071008;Skl = 10071008;Skn = 10071008;
	San = {
			Idel = 1007100801;
			Act = 1007100802;
			
			FIdel = 1007100811;
			Move = 1007100812;
			Atk = 1007100813;
			Hurt = 1007100814;
			Dead = 1007100815;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.9,-5.5,1.4);Look = _Vector3.new(0.8,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3.5,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	}; 
	--新欧阳锋
	[10071009]={
	LookId = 10071009;Icon = 10071009;Skl = 10071009;Skn = 10071009;
	San = {
			Idel = 1007100901;
			--Act = 1007100902;
			
			FIdel = 1007100911;
			Move = 1007100912;
			Atk = 1007100913;
			Hurt = 1007100914;
			Dead = 1007100915;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.7,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-5,1.8);Look = _Vector3.new(-0.75,0,1.8);};
	}; 
	--波斯明教教徒
	[10071010]={
	LookId = 10071010;Icon = 10071010;Skl = 10071010;Skn = 10071010;
	San = {
			Idel = 1007101001;
			--Act = 1007101002;
			
			FIdel = 1007101011;
			Move = 1007101012;
			Atk = 1007101013;
			Hurt = 1007101014;
			Dead = 1007101015;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,1.1);Look = _Vector3.new(0.66,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.7,0.9);Look = _Vector3.new(-0.87,0,1.5);};
	};
	--中土明教长老
	[10071011]={
	LookId = 10071011;Icon = 10071011;Skl = 10071011;Skn = 10071011;
	San = {
			Idel = 1007101101;
			--Act = 1007101102;
			
			FIdel = 1007101111;
			Move = 1007101112;
			Atk = 1007101113;
			Hurt = 1007101114;
			Dead = 1007101115;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,1.1);Look = _Vector3.new(0.66,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.7,0.9);Look = _Vector3.new(-0.87,0,1.5);};
	};
	
	--回族平民
	[10071012]={
	LookId = 10071012;Icon = 10071012;Skl = 10071012;Skn = 10071012;
	San = {
			Idel = 1007101201;
			Act = 1007101202;
			
			Move = 1007101212;
			Dead = 1007101215;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.7,-3,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.7,-2,1.3);Look = _Vector3.new(-0.5,0,1.3);};
	}; 
	
	--新明教教徒
	[10071013]={
	LookId = 10071013;Icon = 10071013;Skl = 10071013;Skn = 10071013;
	San = {
			Idel = 1007101301;
			--Act = 1007101302;
			
			FIdel = 1007101311;
			Move = 1007101312;
			Atk = 1007101313;
			Hurt = 1007101314;
			Dead = 1007101315;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0,-5,1.1);Look = _Vector3.new(0.66,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-3.7,0.9);Look = _Vector3.new(-0.87,0,1.5);};
	};
	
	--白驼宫女
	[10071099]={
	LookId = 10071099;Icon = 10071099;Skl = 10071099;Skn = 10071099;
	San = {
			Idel = 1007109901;
			Act = 1007109902;
			
			FIdel = 1007109911;
			Move = 1007109912;
			Atk = 1007109913;
			Hurt = 1007109914;
			Dead = 1007109915;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.7,-3,0.9);Look = _Vector3.new(0.55,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0.7,-2,1.1);Look = _Vector3.new(-0.5,0,1.1);};
	}; 
	--沙蜥
	[10072001]={
	LookId = 10072001;Icon = 10072001;Skl = 10072001;Skn = 10072001;
	San = {
			Idel = 1007200101;
			--Act = 1007200102;
			
			FIdel = 1007200111;
			Move = 1007200112;
			Atk = 1007200113;
			Hurt = 1007200114;
			Dead = 1007200115;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--沙匪
	[10072002]={
	LookId = 10072002;Icon = 10072002;Skl = 10072002;Skn = 10072002;
	San = {
			Idel = 1007200201;
			--Act = 1007200202;
			
			FIdel = 1007200211;
			Move = 1007200212;
			Atk = 1007200213;
			Hurt = 1007200214;
			Dead = 1007200215;
		  };
	Width = 1.3;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1.8,-5,1.1);Look = _Vector3.new(0.8,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3,1.5);Look = _Vector3.new(-0.4,0,1.5);};
	};
	--沙匪头领
	[10072003]={
	LookId = 10072003;Icon = 10072003;Skl = 10072003;Skn = 10072003;
	AddPfx1 = {100,101};
	San = {
			Idel = 1007200301;
			--Act = 1007200302;
			
			FIdel = 1007200311;
			Move = 1007200312;
			Atk = 1007200313;
			Hurt = 1007200314;
			Dead = 1007200315;
		  };
	Width = 2;
	StartPos = _Vector3.new(0.5,0.5,2.4);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.3,0.34);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-6,1.4);Look = _Vector3.new(0.65,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0.7,-4.5,1.6);Look = _Vector3.new(-1,0,1.6);};
	};
	--白驼弟子
	[10072005]={
	LookId = 10072005;Icon = 10072005;Skl = 10072005;Skn = 10072005;
	San = {
			Idel = 1007200501;
			--Act = 1007200502;
			
			FIdel = 1007200511;
			Move = 1007200512;
			Atk = 1007200513;
			Hurt = 1007200514;
			Dead = 1007200515;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--白驼剑侍
	[10071098]={
	LookId = 10071098;Icon = 10071098;Skl = 10071098;Skn = 10071098;
	San = {
			Idel = 1007109801;
			Act = 1007109802;
			
			FIdel = 1007109811;
			Move = 1007109812;
			Atk = 1007109813;
			Hurt = 1007109814;
			Dead = 1007109815;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-0.1,-3.6,0.9);Look = _Vector3.new(0.6,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(-0.03,-2,1.6);Look = _Vector3.new(-0.4,0,1.1);};
	};
	-----------------------丐帮竹林
	--刘乞儿
	[10081001]={
	LookId = 10081001;Icon = 10081001;Skl = 10081001;Skn = 10081001;
	San = {
			Idel = 1008100101;
			Act = 1008100102;
			
			Move = 1008100112;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(-0.2,-4.5,1.2);Look = _Vector3.new(0.7,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(-0.2,-3.5,1.4);Look = _Vector3.new(-0.6,0,1.4);};
	};
	--鲁有脚
	[10081003]={
	LookId = 10081003;Icon = 10081003;Skl = 10081003;Skn = 10081003;
	San = {
			Idel = 1008100301;
			--Act = 1008100302;
			
			FIdel = 1008100311;
			Move = 1008100312;
			Atk = 1008100313;
			Hurt = 1008100314;
			Dead = 1008100315;
			
			[1] = 1008100380;
			[2] = 1008100381;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.8,-5,1.2);Look = _Vector3.new(0.8,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.8,-3.6,0.9);Look = _Vector3.new(-0.7,0,1.55);};
	};
	--丐帮弟子
	[10082001]={
	LookId = 10082001;Icon = 10082001;Skl = 10082001;Skn = 10082001;
	San = {
			Idel = 1008200101;
			--Act = 1008200102;
			
			FIdel = 1008200111;
			Move = 1008200112;
			Atk = 1008200113;
			Hurt = 1008200114;
			Dead = 1008200115;
			
			[9] = 1008200190;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.8,-5.2,1);Look = _Vector3.new(0.6,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.8,-3.6,0.9);Look = _Vector3.new(-0.7,0,1.55);};
	};
	--神秘刀客
	[10082002]={
	LookId = 10082002;Icon = 10082002;Skl = 10082002;Skn = 10082002;
	San = {
			Idel = 1008200201;
			--Act = 1008200202;
			
			FIdel = 1008200211;
			Move = 1008200212;
			Atk = 1008200213;
			Hurt = 1008200214;
			Dead = 1008200215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.1,-4.5,0.7);Look = _Vector3.new(0.7,0,0.8);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,1.2);Look = _Vector3.new(-0.6,0,1.2);};
	};
	--护卫番僧
	[10082003]={
	LookId = 10082003;Icon = 10082003;Skl = 10082003;Skn = 10082003;
	San = {
			Idel = 1008200301;
			--Act = 1008200302;
			
			FIdel = 1008200311;
			Move = 1008200312;
			Atk = 1008200313;
			Hurt = 1008200314;
			Dead = 1008200315;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-5.74,2);Look = _Vector3.new(0.83,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(1.5,-3.4,2.3);Look = _Vector3.new(-1,0,1.3);};
	};
	--五毒教众
	[10082004]={
	LookId = 10082004;Icon = 10082004;Skl = 10082004;Skn = 10082004;
	San = {
			Idel = 1008200401;
			--Act = 1008200402;
			
			FIdel = 1008200411;
			Move = 1008200412;
			Atk = 1008200413;
			Hurt = 1008200414;
			Dead = 1008200415;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-4.5,1.5);Look = _Vector3.new(0.7,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3,1.5);Look = _Vector3.new(-0.5,0,1.5);};
	};
	--金轮法王
	[10082005]={
	LookId = 10082005;Icon = 10082005;Skl = 10082005;Skn = 10082005;
	AddPfx1 = {120};
	San = {
			Idel = 1008200501;
			--Act = 1008200502;
			
			FIdel = 1008200511;
			Move = 1008200512;
			Atk = 1008200513;
			Hurt = 1008200514;
			Dead = 1008200515;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-6,2);Look = _Vector3.new(0.4,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(1.5,-5,2.5);Look = _Vector3.new(-1.35,0,2);};
	};
	--金毛狮王
	[10082006]={
	LookId = 10082006;Icon = 10082006;Skl = 10082006;Skn = 10082006;
	San = {
			Idel = 1008200601;
			--Act = 1008200602;
			
			FIdel = 1008200611;
			Move = 1008200612;
			Atk = 1008200613;
			Hurt = 1008200614;
			Dead = 1008200615;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-6,2);Look = _Vector3.new(0.4,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(1.5,-5,2.5);Look = _Vector3.new(-1.35,0,2);};
	};
	--洪七公
	[10082007]={
	LookId = 10082007;Icon = 10082007;Skl = 10082007;Skn = 10082007;
	San = {
			Idel = 1008200701;
			--Act = 1008200702;
			
			FIdel = 1008200711;
			Move = 1008200712;
			Atk = 1008200713;
			Hurt = 1008200714;
			Dead = 1008200715;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-6,2);Look = _Vector3.new(0.4,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(1.5,-5,2.5);Look = _Vector3.new(-1.35,0,2);};
	};
	--达尔巴
	[10082008]={
	LookId = 10082008;Icon = 10082008;Skl = 10082008;Skn = 10082008;
	San = {
			Idel = 1008200801;
			--Act = 1008200802;
			
			FIdel = 1008200811;
			Move = 1008200812;
			Atk = 1008200813;
			Hurt = 1008200814;
			Dead = 1008200815;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-6,1.5);Look = _Vector3.new(0.7,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(1.5,-5,2);Look = _Vector3.new(-1,0,2);};
	};
	--君莫问
	[10082009]={
	LookId = 10082009;Icon = 10082009;Skl = 10082009;Skn = 10082009;
	San = {
			Idel = 1008200901;
			--Act = 1008200902;
			
			FIdel = 1008200911;
			Move = 1008200912;
			Atk = 1008200913;
			Hurt = 1008200914;
			Dead = 1008200915;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1.5,-4,1.2);Look = _Vector3.new(0.7,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(1.5,-3,1.5);Look = _Vector3.new(-1,0,1.5);};
	};
	----------------------终南山
	--布阵弟子
	[10092001]={
	LookId = 10092001;Icon = 10092001;Skl = 10092001;Skn = 10092001;
	San = {
			Idel = 1009200101;
			--Act = 1009200102;
			
			FIdel = 1009200111;
			Move = 1009200112;
			Atk = 1009200113;
			Hurt = 1009200114;
			Dead = 1009200115;
			
			[1] = 1009200180;
			
			[9] = 1009200190;
		  };
	Width = 1.3;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-5,1);Look = _Vector3.new(0.8,0,1);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.60);Look = _Vector3.new(-0.5,0,1.60);};
	};
	--杨过
	[10091002]={
	LookId = 10091002;Icon = 10091002;Skl = 10091002;Skn = 10091002;
	San = {
			Idel = 1009100201;
			Act = 1009100202;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(1,-4.3,1.1);Look = _Vector3.new(0.7,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.60);Look = _Vector3.new(-0.4,0,1.60);};
	};
	--蒙军武士
	[10092002]={
	LookId = 10092002;Icon = 10092002;Skl = 10092002;Skn = 10092002;
	San = {
			Idel = 1009200201;
			--Act = 1009200202;
			
			FIdel = 1009200211;
			Move = 1009200212;
			Atk = 1009200213;
			Hurt = 1009200214;
			Dead = 1009200215;
			
			[1] = 1009200280;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-5.5,1.3);Look = _Vector3.new(0.8,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(1.2,-3.5,1.55);Look = _Vector3.new(-0.85,0,1.60);};
	};
	--玉蜂
	[10092003]={
	LookId = 10092003;Icon = 10092003;Skl = 10092003;Skn = 10092003;
	San = {
			Idel = 1009200301;
			--Act = 1009200302;
			
			FIdel = 1009200311;
			Move = 1009200312;
			Atk = 1009200313;
			Hurt = 1009200314;
			Dead = 1009200315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--暗棋潜入者
	[10092004]={
	LookId = 10092004;Icon = 10092004;Skl = 10092004;Skn = 10092004;
	San = {
			Idel = 1009200401;
			--Act = 1009200402;
			
			FIdel = 1009200411;
			Move = 1009200412;
			Atk = 1009200413;
			Hurt = 1009200414;
			Dead = 1009200415;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--杨过 怪物
	[10092005]={
	LookId = 10092005;Icon = 10092005;Skl = 10092005;Skn = 10092005;
	San = {
			Idel = 1009200501;
			--Act = 1009200502;
			
			FIdel = 1009200511;
			Move = 1009200512;
			Atk = 1009200513;
			Hurt = 1009200514;
			Dead = 1009200515;
		  };
	Width = 1.2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-4.3,1.1);Look = _Vector3.new(0.6,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.60);Look = _Vector3.new(-0.4,0,1.60);};
	};
	--霍都
	[10092006]={
	LookId = 10092006;Icon = 10092006;Skl = 10092006;Skn = 10092006;
	AddPfx1 = {40};
	San = {
			Idel = 1009200601;
			--Act = 1009200602;
			
			FIdel = 1009200611;
			Move = 1009200612;
			Atk = 1009200613;
			Hurt = 1009200614;
			Dead = 1009200615;
		  };
	Width = 1.2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4.85,1.2);Look = _Vector3.new(0.9,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-3.3,1.1);Look = _Vector3.new(-0.4,0,1.4);};
	};
	--李莫愁
	[10092007]={
	LookId = 10092007;Icon = 10092007;Skl = 10092007;Skn = 10092007;
	San = {
			Idel = 1009200701;
			Act = 1009200702;
			
			FIdel = 1009200711;
			Move = 1009200712;
			Atk = 1009200713;
			Hurt = 1009200714;
			Dead = 1009200715;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.5);Look = _Vector3.new(-0.4,0,1.5);};
	};
	
	--赵志敬
	[10092008]={
	LookId = 10092008;Icon = 10092008;Skl = 10092008;Skn = 10092008;
	San = {
			Idel = 1009200801;
			Act = 1009200802;
			
			FIdel = 1009200811;
			Move = 1009200812;
			Atk = 1009200813;
			Hurt = 1009200814;
			Dead = 1009200815;
		  };
	Width = 1.5;
	Talk_0 = {Eye = _Vector3.new(0.78,-5,1.0);Look = _Vector3.new(0.75,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0.5,-3.6,1.0);Look = _Vector3.new(-0.7,0,1.55);};
	};
	
	--蒙古力士
	[10092009]={
	LookId = 10092009;Icon = 10092009;Skl = 10092009;Skn = 10092009;
	San = {
			Idel = 1009200901;
			--Act = 1009200902;
			
			FIdel = 1009200911;
			Move = 1009200912;
			Atk = 1009200913;
			Hurt = 1009200914;
			Dead = 1009200915;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.5);Look = _Vector3.new(-0.4,0,1.5);};
	};
	
	--木偶人
	[10092010]={
	LookId = 10092010;Icon = 10092010;Skl = 10092010;Skn = 10092010;
	San = {
			Idel = 1009201001;
			--Act = 1009201002;
			
			FIdel = 1009201011;
			Move = 1009201012;
			Atk = 1009201013;
			Hurt = 1009201014;
			Dead = 1009201015;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.5);Look = _Vector3.new(-0.4,0,1.5);};
	};
	
	--王重阳
	[10092011]={
	LookId = 10092011;Icon = 10092011;Skl = 10092011;Skn = 10092011;
	San = {
			Idel = 1009201101;
			--Act = 1009201102;
			
			FIdel = 1009201111;
			Move = 1009201112;
			Atk = 1009201113;
			Hurt = 1009201114;
			Dead = 1009201115;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	------------------------华山
	--黄蓉
	[10101002]={
	LookId = 10101002;Icon = 10101002;Skl = 10101002;Skn = 10101002;
	San = {
			Idel = 1010100201;
			Act = 1010100202;
			
			FIdel = 1010100211;
			Move = 1010100212;
			Atk = 1010100213;
			Hurt = 1010100214;
			Dead = 1010100215;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.6);Look = _Vector3.new(-0.6,0,1.6);};
	};
	--天蛛
	[10102005]={
	LookId = 10102005;Icon = 10102005;Skl = 10102005;Skn = 10102005;
	San = {
			Idel = 1010200501;
			-- Act = 1010200502;
			
			FIdel = 1010200511;
			Move = 1010200512;
			Atk = 1010200513;
			Hurt = 1010200514;
			Dead = 1010200515;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-11,1.6);Look = _Vector3.new(1,0,1.6);};
	Movie_0 = {Eye = _Vector3.new(0.3,-6,2);Look = _Vector3.new(-0.8,0,2);};
	};
	--活死人(老的潇湘子)
	[10102006]={
	LookId = 10102006;Icon = 10102006;Skl = 10102006;Skn = 10102006;
	San = {
			Idel = 1010200601;
			--Act = 1010200602;
			
			FIdel = 1010200611;
			Move = 1010200612;
			Atk = 1010200613;
			Hurt = 1010200614;
			Dead = 1010200615;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.6);Look = _Vector3.new(-0.6,0,1.6);};
	};
	--张君宝
	[10102007]={
	LookId = 10102007;Icon = 10102007;Skl = 10102007;Skn = 10102007;
	San = {
			Idel = 1010200701;
			Act = 1010200702;
			
			FIdel = 1010200711;
			Move = 1010200712;
			Atk = 1010200713;
			Hurt = 1010200714;
			Dead = 1010200715;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	--绝缘大师
	[10102008]={
	LookId = 10102008;Icon = 10102008;Skl = 10102008;Skn = 10102008;
	San = {
			Idel = 1010200801;
			Act = 1010200802;
			
			-- FIdel = 1010200811;
			-- Move = 1010200812;
			-- Atk = 1010200813;
			-- Hurt = 1010200814;
			-- Dead = 1010200815;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2.5,1.3);Look = _Vector3.new(-0.5,0,1.3);};
	};
	--白猿
	[10102009]={
	LookId = 10102009;Icon = 10102009;Skl = 10102009;Skn = 10102009;
	San = {
			Idel = 1010200901;
			Act = 1010200902;
			
			FIdel = 1010200911;
			Move = 1010200912;
			Atk = 1010200913;
			Hurt = 1010200914;
			Dead = 1010200915;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-7.5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-5,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	--幼豹
	[10102010]={
	LookId = 10102010;Icon = 10102010;Skl = 10102010;Skn = 10102010;
	San = {
			Idel = 1010201001;
			Act = 1010201002;
			
			FIdel = 1010201011;
			Move = 1010201012;
			Atk = 1010201013;
			Hurt = 1010201014;
			Dead = 1010201015;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,0.7);Look = _Vector3.new(0.6,0,0.7);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,0.8);Look = _Vector3.new(-0.7,0,0.8);};
	};
	--雪豹
	[10102011]={
	LookId = 10102011;Icon = 10102011;Skl = 10102011;Skn = 10102011;
	San = {
			Idel = 1010201101;
			Act = 1010201102;
			
			FIdel = 1010201111;
			Move = 1010201112;
			Atk = 1010201113;
			Hurt = 1010201114;
			Dead = 1010201115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-6.5,1);Look = _Vector3.new(0.8,6.5,1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-5,1.2);Look = _Vector3.new(-0.9,0,1.2);};
	};
	--五岳剑客
	[10102012]={
	LookId = 10102012;Icon = 10102012;Skl = 10102012;Skn = 10102012;
	San = {
			Idel = 1010201201;
			Act = 1010201202;
			
			FIdel = 1010201211;
			Move = 1010201212;
			Atk = 1010201213;
			Hurt = 1010201214;
			Dead = 1010201215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	--五毒教尸傀
	[10102013]={
	LookId = 10102013;Icon = 10102013;Skl = 10102013;Skn = 10102013;
	San = {
			Idel = 1010201301;
			Act = 1010201302;
			
			FIdel = 1010201311;
			Move = 1010201312;
			Atk = 1010201313;
			Hurt = 1010201314;
			Dead = 1010201315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	--吴越剑派弟子
	[10102014]={
	LookId = 10102014;Icon = 10102014;Skl = 10102014;Skn = 10102014;
	San = {
			Idel = 1010201401;
			Act = 1010201402;
			
			FIdel = 1010201411;
			Move = 1010201412;
			Atk = 1010201413;
			Hurt = 1010201414;
			Dead = 1010201415;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4.5,1);Look = _Vector3.new(0.6,0,1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-3.5,1.1);Look = _Vector3.new(-0.7,0,1.1);};
	};
	---明教锐金旗众
	[10102015]={
	LookId = 10102015;Icon = 10102015;Skl = 10102015;Skn = 10102015;
	San = {
			Idel = 1010201501;
			Act = 1010201502;
			
			FIdel = 1010201511;
			Move = 1010201512;
			Atk = 1010201513;
			Hurt = 1010201514;
			Dead = 1010201515;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	---明教厚土旗众
	[10102016]={
	LookId = 10102016;Icon = 10102016;Skl = 10102016;Skn = 10102016;
	San = {
			Idel = 1010201601;
			Act = 1010201602;
			
			FIdel = 1010201611;
			Move = 1010201612;
			Atk = 1010201613;
			Hurt = 1010201614;
			Dead = 1010201615;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	---郭襄
	[10102017]={
	LookId = 10102017;Icon = 10102017;Skl = 10102017;Skn = 10102017;
	San = {
			Idel = 1010201701;
			Act = 1010201702;
			
			-- FIdel = 1010201711;
			 Move = 1010201712;
			-- Atk = 1010201713;
			-- Hurt = 1010201714;
			-- Dead = 1010201715;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.3);Look = _Vector3.new(0.7,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-3,1.3);Look = _Vector3.new(-0.5,0,1.3);};
	};
	---风清扬
	[10102018]={
	LookId = 10102018;Icon = 10102018;Skl = 10102018;Skn = 10102018;
	San = {
			Idel = 1010201801;
			Act = 1010201802;
			
			FIdel = 1010201811;
			Move = 1010201812;
			Atk = 1010201813;
			Hurt = 1010201814;
			Dead = 1010201815;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-10,2.9);Look = _Vector3.new(0.7,0,2.5);};
	Movie_0 = {Eye = _Vector3.new(0.3,-8,2.9);Look = _Vector3.new(-0.8,0,2.5);};
	};
	--张君宝 - 剧情用 - 无鸟
	[10102019]={
	LookId = 10102019;Icon = 10102019;Skl = 10102019;Skn = 10102019;
	San = {
			Idel = 1010201901;
			Act = 1010201902;
			
			FIdel = 1010201911;
			Move = 1010201912;
			-- Atk = 1010201913;
			-- Hurt = 1010201914;
			-- Dead = 1010201915;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	------------------------嵩山
	--暗棋刺客
	[10112002]={
	LookId = 10112002;Icon = 10112002;Skl = 10112002;Skn = 10112002;
	San = {
			Idel = 1011200201;
			--Act = 1011200202;
			
			FIdel = 1011200211;
			Move = 1011200212;
			Atk = 1011200213;
			Hurt = 1011200214;
			Dead = 1011200215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.6);Look = _Vector3.new(-0.6,0,1.6);};
	};
	--少林武僧
	[10112004]={
	LookId = 10112004;Icon = 10112004;Skl = 10112004;Skn = 10112004;
	San = {
			Idel = 1011200401;
			--Act = 1011200402;
			
			FIdel = 1011200411;
			Move = 1011200412;
			Atk = 1011200413;
			Hurt = 1011200414;
			Dead = 1011200415;
		  };
	Width = 1.1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.6,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.9);Look = _Vector3.new(-0.9,0,1.9);};
	};
	--德瓦西
	[10112005]={
	LookId = 10112005;Icon = 10112005;Skl = 10112005;Skn = 10112005;
	San = {
			Idel = 1011200501;
			--Act = 1011200502;
			
			FIdel = 1011200511;
			Move = 1011200512;
			Atk = 1011200513;
			Hurt = 1011200514;
			Dead = 1011200515;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.6,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.9);Look = _Vector3.new(-0.9,0,1.9);};
	};
	--天元
	[10112006]={
	LookId = 10112006;Icon = 10112006;Skl = 10112006;Skn = 10112006;
	AddPfx1 = {70,71,72};
	San = {
			Idel = 1011200601;
			--Act = 1011200602;
			
			FIdel = 1011200611;
			Move = 1011200612;
			Atk = 1011200613;
			Hurt = 1011200614;
			Dead = 1011200615;
			
			[1] = 1011200690;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-6.5,1.6);Look = _Vector3.new(0.85,0,1.6);};
	Movie_0 = {Eye = _Vector3.new(0.7,-4,2);Look = _Vector3.new(-0.9,0,2);};
	Talk_1 = {Eye = _Vector3.new(0.7,-10,1.7);Look = _Vector3.new(1.5,0,1.6);};
	Movie_1 = {Eye = _Vector3.new(0.7,-4,2);Look = _Vector3.new(-0.9,0,2);};
	};
	
	--新天元
	[10112007]={
	LookId = 10112007;Icon = 10112007;Skl = 10112007;Skn = 10112007;
	San = {
			Idel = 1011200701;
			--Act = 1011200702;
			
			FIdel = 1011200711;
			Move = 1011200712;
			Atk = 1011200713;
			Hurt = 1011200714;
			Dead = 1011200715;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-8,2.5);Look = _Vector3.new(0.85,0,2.5);};
	Movie_0 = {Eye = _Vector3.new(0.7,-4,2);Look = _Vector3.new(-0.9,0,2);};
	};
	
	--少林铜人
	[10112008]={
	LookId = 10112008;Icon = 10112008;Skl = 10112008;Skn = 10112008;
	San = {
			Idel = 1011200801;
			--Act = 1011200802;
			
			FIdel = 1011200811;
			Move = 1011200812;
			Atk = 1011200813;
			Hurt = 1011200814;
			Dead = 1011200815;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	
	--持棍武僧
	[10112009]={
	LookId = 10112009;Icon = 10112009;Skl = 10112009;Skn = 10112009;
	San = {
			Idel = 1011200901;
			--Act = 1011200902;
			
			FIdel = 1011200911;
			Move = 1011200912;
			Atk = 1011200913;
			Hurt = 1011200914;
			Dead = 1011200915;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-5.5,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.35);Look = _Vector3.new(-0.7,0,1.35);};
	};
	
	--昆仑派修士
	[10112010]={
	LookId = 10112010;Icon = 10112010;Skl = 10112010;Skn = 10112010;
	San = {
			Idel = 1011201001;
			--Act = 1011201002;
			
			FIdel = 1011201011;
			Move = 1011201012;
			Atk = 1011201013;
			Hurt = 1011201014;
			Dead = 1011201015;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3.5,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	
	--临尘师太
	[10112011]={
	LookId = 10112011;Icon = 10112011;Skl = 10112011;Skn = 10112011;
	San = {
			Idel = 1011201101;
			Act = 1011201102;
			
			FIdel = 1011201111;
			Move = 1011201112;
			Atk = 1011201113;
			Hurt = 1011201114;
			Dead = 1011201115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-4,1.1);Look = _Vector3.new(0.7,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3,1.2);Look = _Vector3.new(-0.7,0,1.2);};
	};
	
	--昆仑三圣何足道
	[10112012]={
	LookId = 10112012;Icon = 10112012;Skl = 10112012;Skn = 10112012;
	San = {
			Idel = 1011201201;
			Act = 1011201202;
			
			FIdel = 1011201211;
			Move = 1011201212;
			Atk = 1011201213;
			Hurt = 1011201214;
			Dead = 1011201215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-5.5,1.3);Look = _Vector3.new(0.55,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.3,-4.5,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	
	--执法堂武僧
	[10112013]={
	LookId = 10112013;Icon = 10112013;Skl = 10112013;Skn = 10112013;
	San = {
			Idel = 1011201301;
			--Act = 1011201302;
			
			FIdel = 1011201311;
			Move = 1011201312;
			Atk = 1011201313;
			Hurt = 1011201314;
			Dead = 1011201315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.6,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.9);Look = _Vector3.new(-0.9,0,1.9);};
	};
	
	--无色禅师
	[10112014]={
	LookId = 10112014;Icon = 10112014;Skl = 10112014;Skn = 10112014;
	San = {
			Idel = 1011201401;
			Act = 1011201402;
			
			FIdel = 1011201411;
			Move = 1011201412;
			Atk = 1011201413;
			Hurt = 1011201414;
			Dead = 1011201415;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.4);Look = _Vector3.new(0.6,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.6);Look = _Vector3.new(-0.7,0,1.6);};
	};
	
	--西域刀客
	[10112015]={
	LookId = 10112015;Icon = 10112015;Skl = 10112015;Skn = 10112015;
	San = {
			Idel = 1011201501;
			Act = 1011201502;
			
			FIdel = 1011201511;
			Move = 1011201512;
			Atk = 1011201513;
			Hurt = 1011201514;
			Dead = 1011201515;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.5);Look = _Vector3.new(-0.9,0,1.5);};
	};
	
	--被束缚的觉远
	[10112016]={
	LookId = 10112016;Icon = 10112016;Skl = 10112016;Skn = 10112016;
	San = {
			Idel = 1011201601;
			Act = 1011201602;
			
			-- FIdel = 1011201611;
			Move = 1011201612;
			Atk = 1011201613;
			-- Hurt = 1011201614;
			Dead = 1011201615;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.4);Look = _Vector3.new(-0.9,0,1.4);};
	};
	
	--光明左使 杨逍
	[10112017]={
	LookId = 10112017;Icon = 10112017;Skl = 10112017;Skn = 10112017;
	San = {
			Idel = 1011201701;
			Act = 1011201702;
			
			FIdel = 1011201711;
			Move = 1011201712;
			Atk = 1011201713;
			Hurt = 1011201714;
			Dead = 1011201715;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-3.5,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	
	--药师佛
	[10112018]={
	LookId = 10112018;Icon = 10112018;Skl = 10112018;Skn = 10112018;
	San = {
			Idel = 1011201801;
			-- Act = 1011201802;
			
			-- FIdel = 1011201811;
			-- Move = 1011201812;
			-- Atk = 1011201813;
			-- Hurt = 1011201814;
			-- Dead = 1011201815;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-7,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	
	--释迦牟尼佛
	[10112019]={
	LookId = 10112019;Icon = 10112019;Skl = 10112019;Skn = 10112019;
	San = {
			Idel = 1011201901;
			-- Act = 1011201902;
			
			-- FIdel = 1011201911;
			-- Move = 1011201912;
			-- Atk = 1011201913;
			-- Hurt = 1011201914;
			-- Dead = 1011201915;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-7,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	
	--阿弥陀佛
	[10112020]={
	LookId = 10112020;Icon = 10112020;Skl = 10112020;Skn = 10112020;
	San = {
			Idel = 1011202001;
			-- Act = 1011202002;
			
			-- FIdel = 1011202011;
			-- Move = 1011202012;
			-- Atk = 1011202013;
			-- Hurt = 1011202014;
			-- Dead = 1011202015;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-7,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(-0.7,0,1.5);};
	};
	------------------------昆仑山
	--玉虚宫守卫
	[10122001]={
	LookId = 10122001;Icon = 10122001;Skl = 10122001;Skn = 10122001;
	San = {
			Idel = 1012200101;
			Act = 1012200102;
			
			FIdel = 1012200111;
			Move = 1012200112;
			Atk = 1012200113;
			Hurt = 1012200114;
			Dead = 1012200115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.4);Look = _Vector3.new(-0.9,0,1.4);};
	};
	--青灵子
	[10122002]={
	LookId = 10122002;Icon = 10122002;Skl = 10122002;Skn = 10122002;
	San = {
			Idel = 1012200201;
			Act = 1012200202;
			
			-- FIdel = 1012200211;
			Move = 1012200212;
			-- Atk = 1012200213;
			-- Hurt = 1012200214;
			-- Dead = 1012200215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.2);Look = _Vector3.new(0.6,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.4);Look = _Vector3.new(-0.9,0,1.4);};
	};
	--黑袍武士
	[10122003]={
	LookId = 10122003;Icon = 10122003;Skl = 10122003;Skn = 10122003;
	San = {
			Idel = 1012200301;
			Act = 1012200302;
			
			FIdel = 1012200311;
			Move = 1012200312;
			Atk = 1012200313;
			Hurt = 1012200314;
			Dead = 1012200315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.5);Look = _Vector3.new(-0.9,0,1.5);};
	};
	--白袍武士
	[10122004]={
	LookId = 10122004;Icon = 10122004;Skl = 10122004;Skn = 10122004;
	San = {
			Idel = 1012200401;
			Act = 1012200402;
			
			FIdel = 1012200411;
			Move = 1012200412;
			Atk = 1012200413;
			Hurt = 1012200414;
			Dead = 1012200415;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.5);Look = _Vector3.new(-0.9,0,1.5);};
	};
	--韦一笑
	[10122005]={
	LookId = 10122005;Icon = 10122005;Skl = 10122005;Skn = 10122005;
	San = {
			Idel = 1012200501;
			--Act = 1012200502;
			
			FIdel = 1012200511;
			Move = 1012200512;
			Atk = 1012200513;
			Hurt = 1012200514;
			Dead = 1012200515;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.5);Look = _Vector3.new(-0.9,0,1.5);};
	};
	--霍青桐
	[10122006]={
	LookId = 10122006;Icon = 10122006;Skl = 10122006;Skn = 10122006;
	San = {
			Idel = 1012200601;
			Act = 1012200602;
			
			FIdel = 1012200611;
			Move = 1012200612;
			Atk = 1012200613;
			Hurt = 1012200614;
			Dead = 1012200615;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-5,1.3);Look = _Vector3.new(0.7,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.5);Look = _Vector3.new(-0.9,0,1.5);};
	};
	--尸化何足道
	[10122007]={
	LookId = 10122007;Icon = 10122007;Skl = 10122007;Skn = 10122007;
	San = {
			Idel = 1012200701;
			Act = 1012200702;
			
			FIdel = 1012200711;
			Move = 1012200712;
			Atk = 1012200713;
			Hurt = 1012200714;
			Dead = 1012200715;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-10,2.8);Look = _Vector3.new(0.7,0,2.8);};
	Movie_0 = {Eye = _Vector3.new(0.4,-10,2.8);Look = _Vector3.new(0.7,0,2.8);};
	};
	----------------------------------1013地图
	--阿红  --体型中
	[10131001]={
	LookId = 10131001;Icon = 10131001;Skl = 10131001;Skn = 10131001;
	San = {
			Idel = 1013100101;
			Act = 1013100102;
			
			FIdel = 1013100111;
			Move = 1013100112;
			Atk = 1013100113;
			Hurt = 1013100114;
			Dead = 1013100115;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,0.9);Look = _Vector3.new(0.5,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-3.2,2);Look = _Vector3.new(-0.4,0,1.6);};  --人物考前
	};
	--香香公主
	[10131002]={
	LookId = 10131002;Icon = 10131002;Skl = 10131002;Skn = 10131002;
	San = {
			Idel = 1013100201;
			Act = 1013100202;
			
			FIdel = 1013100211;
			Move = 1013100212;
			Atk = 1013100213;
			Hurt = 1013100214;
			Dead = 1013100215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.3,-4,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.6);Look = _Vector3.new(-0.6,0,1.6);};
	};
	--蒙军大将
	[10131003]={
	LookId = 10131003;Icon = 10131003;Skl = 10131003;Skn = 10131003;
	San = {
			Idel = 1013100301;
			Act = 1013100302;
			
			FIdel = 1013100311;
			Move = 1013100312;
			Atk = 1013100313;
			Hurt = 1013100314;
			Dead = 1013100315;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1.0,-7,1.3);Look = _Vector3.new(1.0,0,1.8);};
	Movie_0 = {Eye = _Vector3.new(1.0,-7,1.3);Look = _Vector3.new(-0.9,0,2.5);};
	};
	--盗墓贼
	[10131004]={
	LookId = 10131004;Icon = 10131004;Skl = 10131004;Skn = 10131004;
	San = {
			Idel = 1013100401;
			Act = 1013100402;
			
			FIdel = 1013100411;
			Move = 1013100412;
			Atk = 1013100413;
			Hurt = 1013100414;
			Dead = 1013100415;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1.0,-4,1.2);Look = _Vector3.new(0.4,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.5);Look = _Vector3.new(-0.9,0,1.5);};
	};
	
	--丹巴喇嘛
	[10131005]={
	LookId = 10131005;Icon = 10131005;Skl = 10131005;Skn = 10131005;
	San = {
			Idel = 1013100501;
			Act = 1013100502;
			
			FIdel = 1013100511;
			Move = 1013100512;
			Atk = 1013100513;
			Hurt = 1013100514;
			Dead = 1013100515;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1.0,-5,1.2);Look = _Vector3.new(0.55,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(0.3,-2,1.6);Look = _Vector3.new(-0.6,0,1.6);};
	};
	--双头怪蟒
	[10131006]={
	LookId = 10131006;Icon = 10131006;Skl = 10131006;Skn = 10131006;
	San = {
			Idel = 1013100601;
			Act = 1013100602;
			
			FIdel = 1013100611;
			Move = 1013100612;
			Atk = 1013100613;
			Hurt = 1013100614;
			Dead = 1013100615;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-1.1,-7,1.2);Look = _Vector3.new(1.8,3,2.1);};
	Movie_0 = {Eye = _Vector3.new(-1.1,-7,1.2);Look = _Vector3.new(-0.6,0,2.5);};
	};		
	--猞猁
	[10131007]={
	LookId = 10131007;Icon = 10131007;Skl = 10131007;Skn = 10131007;
	San = {
			Idel = 1013100701;
			Act = 1013100702;
			
			FIdel = 1013100711;
			Move = 1013100712;
			Atk = 1013100713;
			Hurt = 1013100714;
			Dead = 1013100715;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-1.1,-11,2);Look = _Vector3.new(3.8,6,2.1);};
	Movie_0 = {Eye = _Vector3.new(-1.8,-9,2);Look = _Vector3.new(-0.6,0,2.5);};
	};	
	--中军蒙兵
	[10131008]={
	LookId = 10131008;Icon = 10131008;Skl = 10131008;Skn = 10131008;
	San = {
			Idel = 1013100801;
			Act = 1013100802;
			
			FIdel = 1013100811;
			Move = 1013100812;
			Atk = 1013100813;
			Hurt = 1013100814;
			Dead = 1013100815;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-1.0,-6,1.2);Look = _Vector3.new(1.8,3,1.8);};
	Movie_0 = {Eye = _Vector3.new(-0.4,-4,1.2);Look = _Vector3.new(-0.6,3,2.5);};
	};	
	--小双头蛇
	[10131009]={
	LookId = 10131009;Icon = 10131009;Skl = 10131009;Skn = 10131009;
	San = {
			Idel = 1013100901;
			Act = 1013100902;
			
			FIdel = 1013100911;
			Move = 1013100912;
			Atk = 1013100913;
			Hurt = 1013100914;
			Dead = 1013100915;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-1.1,-7,1.2);Look = _Vector3.new(1.8,3,2.1);};
	Movie_0 = {Eye = _Vector3.new(-1.1,-7,1.2);Look = _Vector3.new(-0.6,0,2.5);};
	};		
	--近卫蒙兵
	[10131010]={
	LookId = 10131010;Icon = 10131010;Skl = 10131010;Skn = 10131010;
	San = {
			Idel = 1014100801;
			Act = 1014100802;
			
			FIdel = 1014100811;
			Move = 1014100812;
			Atk = 1014100813;
			Hurt = 1014100814;
			Dead = 1014100815;
		  };
	Width = 1;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(-1.0,-6,1.2);Look = _Vector3.new(1.8,3,1.8);};
	Movie_0 = {Eye = _Vector3.new(-0.4,-4,1.2);Look = _Vector3.new(-0.6,6,2.5);};
	};		
	------------------------珍珑棋局石像
	--金军将领 石像
	[50051011]={
	LookId = 50051011;Icon = 50051011;Skl = 50051011;Skn = 50051011;
	San = {
			Idel = 5005101101;
			--Act = 1003200602;
			
			FIdel = 5005101111;
			Move = 5005101112;
			Atk = 5005101113;
			Hurt = 5005101114;
			Dead = 5005101115;
		  };
	Width = 2;
	StartPos = _Vector3.new(0.5,0.9,2.4);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.14);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(5.5,-4,1.3);Look = _Vector3.new(1,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0.7,-5,1.6);Look = _Vector3.new(-0.8,0,1.6);};
	};
	--蚩萝伊 石像
	[50051012]={
	LookId = 50051012;Icon = 50051012;Skl = 50051012;Skn = 50051012;
	San = {
			Idel = 5005101201;
			--Act = 5005101202;
			
			FIdel = 5005101211;
			Move = 5005101212;
			Atk = 5005101213;
			Hurt = 5005101214;
			Dead = 5005101215;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.6,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.9);Look = _Vector3.new(-0.9,0,1.9);};
	};
	--潇湘子  石像
	[50051013]={
	LookId = 50051013;Icon = 50051013;Skl = 50051013;Skn = 50051013;
	San = {
			Idel = 5005101301;
			-- Act = 5005101302;
			
			FIdel = 5005101311;
			Move = 5005101312;
			Atk = 5005101313;
			Hurt = 5005101314;
			Dead = 5005101315;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,2);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,2);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-10,2.5);Look = _Vector3.new(0.7,0,2.5);};
	Movie_0 = {Eye = _Vector3.new(1,-6.5,2.5);Look = _Vector3.new(-1.5,0,2.5);};
	};
	--霍都 石像
	[50051014]={
	LookId = 50051014;Icon = 50051014;Skl = 50051014;Skn = 50051014;
	San = {
			Idel = 5005101401;
			--Act = 5005101402;
			
			FIdel = 5005101411;
			Move = 5005101412;
			Atk = 5005101413;
			Hurt = 5005101414;
			Dead = 5005101415;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--柯镇恶 石像
	[50051015]={
	LookId = 50051015;Icon = 50051015;Skl = 50051015;Skn = 50051015;
	San = {
			Idel = 5005101501;
			--Act = 5005101502;
			
			FIdel = 5005101511;
			Move = 5005101512;
			Atk = 5005101513;
			Hurt = 5005101514;
			Dead = 5005101515;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.5,-4.7,1.2);Look = _Vector3.new(0.7,0,1.2);};
	Movie_0 = {Eye = _Vector3.new(0.2,-3,1.5);Look = _Vector3.new(-0.53,0,1.5);};
	};
	--天元 石像
	[50051016]={
	LookId = 50051016;Icon = 50051016;Skl = 50051016;Skn = 50051016;
	San = {
			Idel = 5005101601;
			--Act = 5005101602;
			
			FIdel = 5005101611;
			Move = 5005101612;
			Atk = 5005101613;
			Hurt = 5005101614;
			Dead = 5005101615;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.7,-6.5,1.6);Look = _Vector3.new(0.85,0,1.6);};
	Movie_0 = {Eye = _Vector3.new(0.7,-3.8,2);Look = _Vector3.new(-0.75,0,2);};
	};
	--金轮法王 石像
	[50051017]={
	LookId = 50051017;Icon = 50051017;Skl = 50051017;Skn = 50051017;
	San = {
			Idel = 5005101701;
			--Act = 5005101702;
			
			FIdel = 5005101711;
			Move = 5005101712;
			Atk = 5005101713;
			Hurt = 5005101714;
			Dead = 5005101715;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-6,2);Look = _Vector3.new(0.4,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(1.5,-5,2.5);Look = _Vector3.new(-1.35,0,2);};
	};
	--欧阳锋 石像
	[50051018]={
	LookId = 50051018;Icon = 50051018;Skl = 50051018;Skn = 50051018;
	San = {
			Idel = 5005101801;
			--Act = 5005101802;
			
			FIdel = 5005101811;
			Move = 5005101812;
			Atk = 5005101813;
			Hurt = 5005101814;
			Dead = 5005101815;
		  };
	Width = 1;
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.7,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-5,1.8);Look = _Vector3.new(-0.75,0,1.8);};
	}; 
	--一灯大师 石像
	[50051019]={
	LookId = 50051019;Icon = 50051019;Skl = 50051019;Skn = 50051019;
	San = {
			Idel = 5005101901;
			--Act = 5005101902;
			
			FIdel = 5005101911;
			Move = 5005101912;
			Atk = 5005101913;
			Hurt = 5005101914;
			Dead = 5005101915;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-6,2.1);Look = _Vector3.new(0.6,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,1.9);Look = _Vector3.new(-0.95,0,1.9);};
	};
	--黄药师 石像
	[50051020]={
	LookId = 50051020;Icon = 50051020;Skl = 50051020;Skn = 50051020;
	San = {
			Idel = 5005102001;
			--Act = 5005102002;
			
			FIdel = 5005102011;
			Move = 5005102012;
			Atk = 5005102013;
			Hurt = 5005102014;
			Dead = 5005102015;
		  };
	Width = 1.3;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2.5,-5.5,1.9);Look = _Vector3.new(1,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(2,-3.7,2);Look = _Vector3.new(-0.9,0,2);};
	};
	--周伯通 石像
	[50051021]={
	LookId = 50051021;Icon = 50051021;Skl = 50051021;Skn = 50051021;
	San = {
			Idel = 5005102101;
			--Act = 5005102102;
			
			FIdel = 5005102111;
			Move = 5005102112;
			Atk = 5005102113;
			Hurt = 5005102114;
			Dead = 5005102115;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(2,-5,1.8);Look = _Vector3.new(0.8,0,1);};
	Movie_0 = {Eye = _Vector3.new(1,-3.2,1.8);Look = _Vector3.new(-0.85,0,1.2);};
	};
	------------------------其他
	--蚩萝伊
	[50302007]={
	LookId = 50302007;Icon = 50302007;Skl = 50302007;Skn = 50302007;
	AddPfx1 = {130,131,132};
	San = {
			Idel = 5030200701;
			--Act = 5030200702;
			
			FIdel = 5030200711;
			Move = 5030200712;
			Atk = 5030200713;
			Hurt = 5030200714;
			Dead = 5030200715;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0.4,-6,1.5);Look = _Vector3.new(0.6,0,1.5);};
	Movie_0 = {Eye = _Vector3.new(0.4,-4,1.9);Look = _Vector3.new(-0.9,0,1.9);};
	};
	--演武护卫  铁匠
	[50710015]={
	LookId = 50710015;Icon = 50710015;Skl = 50710015;Skn = 50710015;
	San = {
			Idel = 5071001501;
			--Act = 5071001502;
			
			FIdel = 5071001511;
			Move = 5071001512;
			Atk = 5071001513;
			Hurt = 5071001514;
			Dead = 5071001515;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--五行圣兽
	[50502011]={
	LookId = 50502011;Icon = 50502011;Skl = 50502011;Skn = 50502011;
	AddPfx1 = {60};
	San = {
			Born1 = 5050201100;
			
			Idel = 5050201101;
			--Act = 5050201102;
			
			FIdel = 5050201111;
			Move = 5050201112;
			Atk = 5050201113;
			Hurt = 5050201114;
			Dead = 5050201115;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--小龙女
	[50302063]={
	LookId = 50302063;Icon = 50302063;Skl = 50302063;Skn = 50302063;
	AddPfx1 = {160,161};
	San = {
			Idel = 5030206301;
			Act = 5030206302;
			
			FIdel = 5030206311;
			Move = 5030206312;
			Atk = 5030206313;
			Hurt = 5030206314;
			Dead = 5030206315;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-3.4,0.9);Look = _Vector3.new(0.5,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0,-2.5,1.2);Look = _Vector3.new(-0.5,0,1.2);};
	};
	--小龙女-群侠
	[50302064]={
	LookId = 50302064;Icon = 50302064;Skl = 50302064;Skn = 50302064;
	AddPfx1 = {160,161};
	San = {
			Idel = 5030206401;
			Act = 5030206402;
			
			FIdel = 5030206411;
			Move = 5030206412;
			Atk = 5030206413;
			Hurt = 5030206414;
			Dead = 5030206415;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0,0,1);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-3.4,0.9);Look = _Vector3.new(0.5,0,0.9);};
	Movie_0 = {Eye = _Vector3.new(0,-2.5,1.2);Look = _Vector3.new(-0.5,0,1.2);};
	};
	--被囚村民
	[50702022]={
	LookId = 50702022;Icon = 50702022;Skl = 50702022;Skn = 50702022;
	San = {
			Idel = 5070202201;
			-- Act = 5070202202;
			
			FIdel = 5070202211;
			Move = 5070202212;
			Atk = 5070202213;
			Hurt = 5070202214;
			Dead = 5070202215;
		  };
	Width = 1;
	StartPos = _Vector3.new(0.15,0.5,1.75);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.15,0.32);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.1,1.1,1.1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-2.06,1.32);Look = _Vector3.new(0,0,1.32);};
	Movie_0 = {Eye = _Vector3.new(0,-1.8,1.32);Look = _Vector3.new(0,0,1.32);};
	};
	--潇湘子
	[50302013]={
	LookId = 50302013;Icon = 50302013;Skl = 50302013;Skn = 50302013;
	San = {
			Idel = 5030201301;
			-- Act = 5030201302;
			
			FIdel = 5030201311;
			Move = 5030201312;
			Atk = 5030201313;
			Hurt = 5030201314;
			Dead = 5030201315;
		  };
	Width = 2;
	StartPos = _Vector3.new(0,0,2);--跳字的起点
	HurtPfxPos = _Vector3.new(0,0,2);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-10,2.5);Look = _Vector3.new(0.7,0,2.5);};
	Movie_0 = {Eye = _Vector3.new(1,-6.5,2.5);Look = _Vector3.new(-1.5,0,2.5);};
	};
	--冥蟾巫师
	[50302014]={
	LookId = 50302014;Icon = 50302014;Skl = 50302014;Skn = 50302014;
	AddPfx1 = {150,151};
	San = {
			Idel = 5030201401;
			-- Act = 5030201402;
			
			FIdel = 5030201411;
			Move = 5030201412;
			Atk = 5030201413;
			Hurt = 5030201414;
			Dead = 5030201415;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.5,1.75);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.15,0.32);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.1,1.1,1.1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-5.5,1.5);Look = _Vector3.new(0.9,0,1.4);};
	Movie_0 = {Eye = _Vector3.new(0,-3.5,2);Look = _Vector3.new(-0.6,0,2);};
	};
	--金虚狼石雕
	[50502012]={
	LookId = 50502012;Icon = 50502012;Skl = 50502012;Skn = 50502012;
	San = {
			Idel = 5050201201;
			-- Act = 5050201202;
			
			FIdel = 5050201211;
			Move = 5050201212;
			Atk = 5050201213;
			Hurt = 5050201214;
			Dead = 5050201215;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--木灵猴石雕
	[50502013]={
	LookId = 50502013;Icon = 50502013;Skl = 50502013;Skn = 50502013;
	San = {
			Idel = 5050201301;
			-- Act = 5050201302;
			
			FIdel = 5050201311;
			Move = 5050201312;
			Atk = 5050201313;
			Hurt = 5050201314;
			Dead = 5050201315;
		  };
	Width = 2;
	StartPos = _Vector3.new(0.5,0.9,2.35);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.14);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	};
	--水元鳄石雕
	[50502014]={
	LookId = 50502014;Icon = 50502014;Skl = 50502014;Skn = 50502014;
	San = {
			Idel = 5050201401;
			-- Act = 5050201402;
			
			FIdel = 5050201411;
			Move = 5050201412;
			Atk = 5050201413;
			Hurt = 5050201414;
			Dead = 5050201415;
		  };
	Width = 2;
	StartPos = _Vector3.new(0.5,0.9,2.35);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.2,0.14);--被击光效的位置
	HurtPfxScal = _Vector3.new(1.6,1.6,1.6);--被击光效的缩放
	};
	--火玄狐石雕
	[50502015]={
	LookId = 50502015;Icon = 50502015;Skl = 50502015;Skn = 50502015;
	San = {
			Idel = 5050201501;
			-- Act = 5050201502;
			
			FIdel = 5050201511;
			Move = 5050201512;
			Atk = 5050201513;
			Hurt = 5050201514;
			Dead = 5050201515;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
	--土幻蜥石雕
	[50502016]={
	LookId = 50502016;Icon = 50502016;Skl = 50502016;Skn = 50502016;
	San = {
			Idel = 5050201601;
			-- Act = 5050201502;
			
			FIdel = 5050201611;
			Move = 5050201612;
			Atk = 5050201613;
			Hurt = 5050201614;
			Dead = 5050201615;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	};
  ----麒麟
	[50752001]={
		LookId = 50752001;Icon = 50752001;Skl = 50752001;Skn = 50752001;
		AddPfx1 = {300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317};
		San = {
			Idel = 5075200101;
			-- Act = 5075200102;
			
			FIdel = 5075200111;
			Move = 5075200112;
			Atk = 5075200113;
			Hurt = 5075200114;
			Dead = 5075200115;
			};
		Width = 2;		--选中的光圈缩放
		StartPos = _Vector3.new(0.15,0.6,1.7);--跳字的起点
		HurtPfxPos = _Vector3.new(0,0,1.2);--被击光效的位置
		HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
		Talk_0 = {Eye = _Vector3.new(1,-10,2.3);Look = _Vector3.new(0.8,0,2.3);};
	};
	--剧情动作专用 - 杨过
	[50990001]={
	LookId = 50990001;Icon = 50990001;Skl = 50990001;Skn = 50990001;
	San = {
			Idel = 5099000101;
			
			Move = 5099000112;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(1,-4.3,1.1);Look = _Vector3.new(0.6,0,1.1);};
	Movie_0 = {Eye = _Vector3.new(1,-3,1.60);Look = _Vector3.new(-0.4,0,1.60);};
	};
	--剧情动作专用 - 龙女
	[50990002]={
	LookId = 50990002;Icon = 50990002;Skl = 50990002;Skn = 50990002;
	San = {
			Idel = 5099000201;
			
			Move = 5099000212;
		  };
	Width = 1.5;
	StartPos = _Vector3.new(0.15,0.6,0.3);--跳字的起点
	HurtPfxPos = _Vector3.new(0,-0.75,-0.1);--被击光效的位置
	HurtPfxScal = _Vector3.new(1,1,1);--被击光效的缩放
	Talk_0 = {Eye = _Vector3.new(0,-4.5,2);Look = _Vector3.new(0.6,0,1.3);};
	Movie_0 = {Eye = _Vector3.new(0,-2,2);Look = _Vector3.new(-0.5,0,1.6);};
	};
	---------战旗-------------
	[130001]={		
		LookId = 130001;Icon = 130001;Skl = 130001;Skn = 130001;
		San = {Idel = 13000101;};	
		Width = 1;
	 };
	[130002]={		
		LookId = 130002;Icon = 130002;Skl = 130002;Skn = 130002;
		San = {Idel = 13000201;};	
		Width = 1;
	 };	
	[130003]={		
		LookId = 130003;Icon = 130003;Skl = 130003;Skn = 130003;
		San = {Idel = 13000301;};	
		Width = 1;
	 };	
	[130004]={		
		LookId = 130004;Icon = 130004;Skl = 130004;Skn = 130004;
		San = {Idel = 13000401;};	
		Width = 1;
	 };	
	[130005]={		
		LookId = 130005;Icon = 130005;Skl = 130005;Skn = 130005;
		San = {Idel = 13000501;};	
		Width = 1;
	 };	
-----------------------------------------------------------------------------------------
}