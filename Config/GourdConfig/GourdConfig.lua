--[[
功能：葫芦系统配置表
作者：赵飞
时间：2014-01-01
--]]
_G.GourdConfig={
		--葫芦属性及经验配置
		LevelConfig = {	--Exp 升级经验 （最后一个必须为零）
		[1]={dwAttack=100,dwDefense=50,dwFlee=12,dwCrit=15,dwHPMax=500,dwCritDown=15,dwPoJiaDiKang=10,Exp =1000,},
		[2]={dwAttack=200,dwDefense=100,dwFlee=24,dwCrit=30,dwHPMax=1000,dwCritDown=30,dwPoJiaDiKang=20,Exp =2000,},
		[3]={dwAttack=300,dwDefense=150,dwFlee=36,dwCrit=45,dwHPMax=1500,dwCritDown=45,dwPoJiaDiKang=30,Exp =3000,},
		[4]={dwAttack=400,dwDefense=200,dwFlee=48,dwCrit=60,dwHPMax=2000,dwCritDown=60,dwPoJiaDiKang=40,Exp =4000,},
		[5]={dwAttack=500,dwDefense=250,dwFlee=60,dwCrit=75,dwHPMax=2500,dwCritDown=75,dwPoJiaDiKang=50,Exp =7000,},
		[6]={dwAttack=700,dwDefense=350,dwFlee=84,dwCrit=105,dwHPMax=3500,dwCritDown=105,dwPoJiaDiKang=70,Exp =10500,},
		[7]={dwAttack=900,dwDefense=450,dwFlee=108,dwCrit=135,dwHPMax=4500,dwCritDown=135,dwPoJiaDiKang=90,Exp =14500,},
		[8]={dwAttack=1100,dwDefense=550,dwFlee=132,dwCrit=165,dwHPMax=5500,dwCritDown=165,dwPoJiaDiKang=110,Exp =19000,},
		[9]={dwAttack=1300,dwDefense=650,dwFlee=156,dwCrit=195,dwHPMax=6500,dwCritDown=195,dwPoJiaDiKang=130,Exp =24000,},
		[10]={dwAttack=1500,dwDefense=750,dwFlee=180,dwCrit=225,dwHPMax=7500,dwCritDown=225,dwPoJiaDiKang=150,Exp =33000,},
		[11]={dwAttack=1900,dwDefense=950,dwFlee=228,dwCrit=285,dwHPMax=9500,dwCritDown=285,dwPoJiaDiKang=190,Exp =43000,},
		[12]={dwAttack=2300,dwDefense=1150,dwFlee=276,dwCrit=345,dwHPMax=11500,dwCritDown=345,dwPoJiaDiKang=230,Exp =54000,},
		[13]={dwAttack=2700,dwDefense=1350,dwFlee=324,dwCrit=405,dwHPMax=13500,dwCritDown=405,dwPoJiaDiKang=270,Exp =66000,},
		[14]={dwAttack=3100,dwDefense=1550,dwFlee=372,dwCrit=465,dwHPMax=15500,dwCritDown=465,dwPoJiaDiKang=310,Exp =79000,},
		[15]={dwAttack=3500,dwDefense=1750,dwFlee=420,dwCrit=525,dwHPMax=17500,dwCritDown=525,dwPoJiaDiKang=350,Exp =102000,},
		[16]={dwAttack=4300,dwDefense=2150,dwFlee=516,dwCrit=645,dwHPMax=21500,dwCritDown=645,dwPoJiaDiKang=430,Exp =127500,},
		[17]={dwAttack=5100,dwDefense=2550,dwFlee=612,dwCrit=765,dwHPMax=25500,dwCritDown=765,dwPoJiaDiKang=510,Exp =155500,},
		[18]={dwAttack=5900,dwDefense=2950,dwFlee=708,dwCrit=885,dwHPMax=29500,dwCritDown=885,dwPoJiaDiKang=590,Exp =186000,},
		[19]={dwAttack=6700,dwDefense=3350,dwFlee=804,dwCrit=1005,dwHPMax=33500,dwCritDown=1005,dwPoJiaDiKang=670,Exp =219000,},
		[20]={dwAttack=7500,dwDefense=3750,dwFlee=900,dwCrit=1125,dwHPMax=37500,dwCritDown=1125,dwPoJiaDiKang=750,Exp =277000,},
		[21]={dwAttack=8900,dwDefense=4450,dwFlee=1068,dwCrit=1335,dwHPMax=44500,dwCritDown=1335,dwPoJiaDiKang=890,Exp =341250,},
		[22]={dwAttack=10300,dwDefense=5150,dwFlee=1236,dwCrit=1545,dwHPMax=51500,dwCritDown=1545,dwPoJiaDiKang=1030,Exp =411750,},
		[23]={dwAttack=11700,dwDefense=5850,dwFlee=1404,dwCrit=1755,dwHPMax=58500,dwCritDown=1755,dwPoJiaDiKang=1170,Exp =488500,},
		[24]={dwAttack=13100,dwDefense=6550,dwFlee=1572,dwCrit=1965,dwHPMax=65500,dwCritDown=1965,dwPoJiaDiKang=1310,Exp =571500,},
		[25]={dwAttack=14500,dwDefense=7250,dwFlee=1740,dwCrit=2175,dwHPMax=72500,dwCritDown=2175,dwPoJiaDiKang=1450,Exp =729500,},
		[26]={dwAttack=16700,dwDefense=8350,dwFlee=2004,dwCrit=2505,dwHPMax=83500,dwCritDown=2505,dwPoJiaDiKang=1670,Exp =906250,},
		[27]={dwAttack=18900,dwDefense=9450,dwFlee=2268,dwCrit=2835,dwHPMax=94500,dwCritDown=2835,dwPoJiaDiKang=1890,Exp =1101750,},
		[28]={dwAttack=21100,dwDefense=10550,dwFlee=2532,dwCrit=3165,dwHPMax=105500,dwCritDown=3165,dwPoJiaDiKang=2110,Exp =1316000,},
		[29]={dwAttack=23300,dwDefense=11650,dwFlee=2796,dwCrit=3495,dwHPMax=116500,dwCritDown=3495,dwPoJiaDiKang=2330,Exp =1549000,},
		[30]={dwAttack=25500,dwDefense=12750,dwFlee=3060,dwCrit=3825,dwHPMax=127500,dwCritDown=3825,dwPoJiaDiKang=2550,Exp =2007000,},
		[31]={dwAttack=28700,dwDefense=14350,dwFlee=3444,dwCrit=4305,dwHPMax=143500,dwCritDown=4305,dwPoJiaDiKang=2870,Exp =2521250,},
		[32]={dwAttack=31900,dwDefense=15950,dwFlee=3828,dwCrit=4785,dwHPMax=159500,dwCritDown=4785,dwPoJiaDiKang=3190,Exp =3091750,},
		[33]={dwAttack=35100,dwDefense=17550,dwFlee=4212,dwCrit=5265,dwHPMax=175500,dwCritDown=5265,dwPoJiaDiKang=3510,Exp =3718500,},
		[34]={dwAttack=38300,dwDefense=19150,dwFlee=4596,dwCrit=5745,dwHPMax=191500,dwCritDown=5745,dwPoJiaDiKang=3830,Exp =4401500,},
		[35]={dwAttack=41500,dwDefense=20750,dwFlee=4980,dwCrit=6225,dwHPMax=207500,dwCritDown=6225,dwPoJiaDiKang=4150,Exp =5984500,},
		[36]={dwAttack=45900,dwDefense=22950,dwFlee=5508,dwCrit=6885,dwHPMax=229500,dwCritDown=6885,dwPoJiaDiKang=4590,Exp =7792500,},
		[37]={dwAttack=50300,dwDefense=25150,dwFlee=6036,dwCrit=7545,dwHPMax=251500,dwCritDown=7545,dwPoJiaDiKang=5030,Exp =9825500,},
		[38]={dwAttack=54700,dwDefense=27350,dwFlee=6564,dwCrit=8205,dwHPMax=273500,dwCritDown=8205,dwPoJiaDiKang=5470,Exp =12083500,},
		[39]={dwAttack=59100,dwDefense=29550,dwFlee=7092,dwCrit=8865,dwHPMax=295500,dwCritDown=8865,dwPoJiaDiKang=5910,Exp =14566500,},
		[40]={dwAttack=63500,dwDefense=31750,dwFlee=7620,dwCrit=9525,dwHPMax=317500,dwCritDown=9525,dwPoJiaDiKang=6350,Exp =17139500,},		
		[41]={dwAttack=69300,dwDefense=34650,dwFlee=8316,dwCrit=10395,dwHPMax=346500,dwCritDown=10395,dwPoJiaDiKang=6930,Exp =19730500,},
		[42]={dwAttack=75100,dwDefense=37550,dwFlee=9012,dwCrit=11265,dwHPMax=375500,dwCritDown=11265,dwPoJiaDiKang=7510,Exp =22339500,},
		[43]={dwAttack=80900,dwDefense=40450,dwFlee=9708,dwCrit=12135,dwHPMax=404500,dwCritDown=12135,dwPoJiaDiKang=8090,Exp =24966500,},
		[44]={dwAttack=86700,dwDefense=43350,dwFlee=10404,dwCrit=13005,dwHPMax=433500,dwCritDown=13005,dwPoJiaDiKang=8670,Exp =27611500,},
		[45]={dwAttack=92500,dwDefense=46250,dwFlee=11100,dwCrit=13875,dwHPMax=462500,dwCritDown=13875,dwPoJiaDiKang=9250,Exp =0,},
		};

	--战斗属性
	Shunxu = {"dwAttack";"dwDefense";"dwFlee";"dwCrit";"dwHPMax";"dwCritDown";"dwPoJiaDiKang";}; --属性顺序显示
	ProperyName 	= { 																--界面属性字符串
				dwHPMax 		= "<font color='#FFFF00'>生命</font> + %d ";
				dwCritDown 		= "<font color='#FFFF00'>暴击抵抗</font> + %d ";
				dwAttack 		= "<font color='#FFFF00'>攻击</font> + %d "; 
                dwDefense 		= "<font color='#FFFF00'>防御</font> + %d ";
                dwCrit 			= "<font color='#FFFF00'>暴击</font> + %d ";
                dwFlee 			= "<font color='#FFFF00'>身法</font> + %d ";				
				dwPoJiaDiKang 	= "<font color='#FFFF00'>伤害抵御</font> + %d";
			};
		Text = {
				Rule  		= "<font color='#4daeed'>1.大侠每日可通过提交缨穗、檀木托、烙画图谱、蜂蜡4种道具获得酒葫芦升阶所需的成长值<br/></font><font color='#4daeed'>2.檀木托、烙画图谱、蜂蜡这三种道具每日可提交数量有限</font><font color='#ff0000'>（每日6：00点重置）</font><br/><font color='#4daeed'>3.每日将从檀木托、烙画图谱、蜂蜡3种道具中随机选出一种作为急需品<br/>  当日提交该道具则可获得多倍成长值！</font><font color='#ff0000'>（每日6：00点重置）</font>"; --玩法说明-----------
				StrLadder   = "<font color='#ffff00'>%d阶</font>";
				StrLevel    = "<font color='#ffff00'>%d级</font>";
				StrExp  	= "<font color='#4daeed'>%d成长值</font>";		--熟练度字符串
				ColorExp  	= "<font color='#ffff00'>%d成长值</font>";		--翻倍熟练度字符串颜色控制
				IsLuck  	= "<font color='#ff0000' size='15'>今日提交%s可获得%s倍成长值</font>";		--翻倍熟练度字符串颜色控制
				NoLimit  	= "不限";		--无限制
				IsEnough	= "<font color='#FFFFFF'>%s</font>";	--物品充足
				IsNoEnough	= "<font color='#FF0000'>%s</font>";	--物品不足			
				IsNoCan1	= "该物品已达今日提交次数上限，无法提交";	--此物品已经达到提交上限
				IsNoCan2	= "该物品不足，无法提交";	--此物品不足无法执行提交操作
				IsNoCan3	= "当前没有可以佩戴的酒葫芦";	--目前没有可佩戴的葫芦
				IsNoCan4	= "无法佩戴当前阶段酒葫芦";	--此模型不可佩戴，请选择可佩带的模型
				IsNoCan5	= "酒葫芦成长阶段已达满阶，无法提交";	--已经满级无需提交任何物品
				IsNoHaveAut	= "对方暂未开启酒葫芦，无法查看";	--查看别人没有权限提示
				IsNoOnLine	= "被查看的玩家没在线";	--查看别人没有在线	恭喜大侠“玩家名称”酒葫芦修炼阶段已达XX阶。
				IsNoHave	= "78级开启酒葫芦功能";	--BTNTips暂未开启酒葫芦
				IsHaveTips	= "<font color='#ffffff'>当前酒葫芦阶段：</font><font color='#4daeed'>%s阶</font><br/><font color='#ffffff'>当前酒葫芦等级：</font><font color='#4daeed'>%s级</font><br/><font color='#FFFF00'>【点击酒葫芦按钮打开酒葫芦界面】</font>";	--BTNTips已开启
				broadcast	= "恭喜大侠%s将酒葫芦提升至%s";     --广播
				IWantStr    = "我也试试！";		--广播我也试试
				TipsBtn1    = "佩戴%s"; --佩戴什么葫芦
				TipsBtn2    = "摘下%s"; --摘下什么葫芦
				TipsBtn3    = "成长阶段达五阶可佩戴酒葫芦"; -- 目前没有可佩戴的葫芦是的 提示
				ExpUp       = "成长值+ %d"
		};
	GourdString =  
				{
					[1] = {Name = "一阶·黄皮葫芦";};  --酒葫芦名称
					[2] = {Name = "二阶·青藤葫芦";};
					[3] = {Name = "三阶·流霞葫芦";};
					[4] = {Name = "四阶·雨潇葫芦";};
					[5] = {Name = "五阶·紫金葫芦";};
					[6] = {Name = "六阶·如意葫芦";};
					[7] = {Name = "七阶·醉仙葫芦";};
					[8] = {Name = "八阶·吞天葫芦";};  
                    [9] = {Name = "九阶·腾蛟葫芦"}					
				};
	-----随机翻倍索引配置表
	RandTimeIndexConfig = {
		[1] = {weightValue = 5000,Index = 2,Num = 3},
		[2] = {weightValue = 4000,Index = 3,Num = 3},
		[3] = {weightValue = 1000,Index = 4,Num = 3},
	};
	--提交特效标志位 true 播放
	IsItemPfx = false;
	--模型配置
	ModelIDConfig = 
	{
	
	AvatarRect	= {x = 1400, y = 1400};
	--阶数
	[1] = {
		model = {	
			sknFile = "A_Equip_JiuHuLu_01.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san"; 
		},
		action = {{pfxId = 100041,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},
	[2] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_02.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0;lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100042,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}}, 
	},	
	[3] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_03.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100043,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},	
	[4] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_04.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100044,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},	
	[5] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_05.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100045,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},	
	[6] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_06.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100046,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},	
	[7] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_07.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100047,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},	
	[8] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_08.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100048,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},
	[9] = {
		model = {
			sknFile = "A_Equip_JiuHuLu_10.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_JiuHuLu_XiuXian.san"; param_1_x = 0; param_1_y =-3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_JiuHuLu_DaiJi.san";
		},
		action = {{pfxId = 100049,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	},	
	
	-- [10] = {
		-- model = {
		-- sknFile = "A_Equip_BaoJian_10.skn"; sklFile="A_Equip_JiuHuLu.skl"; sanFile ="A_Equip_BaoJian_DaiJi.san"; param_1_x = -0.169; param_1_y =-9.339; param_1_z = 2.874;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_NPC_Equip_BaoJian_XiuXian.san";
		-- },
		-- action = {{pfxId = 100050,bindPos ="dummy01"},{pfxId = 0,bindPos ="tx1"}},
	-- },	
	};
	---葫芦佩戴模型ID
	AdornModelIDConfig = {
		[5]  = 0;
		[10] = 0;
		[15] = 0;
		[21] = 11;
		[26] = 12;
		[31] = 13;
		[36] = 14;
		[41] = 15;
	};
	-----葫芦广播配置表
	GourdBroadCastConfig = {
		6,11,16,21,26,31,36,41,   ----等级
	}
};
_G.GourdHotUpdateTime = "06:00";  ----热更新时间
_G.GourdClearTime = "10:00";      ----清热更新时间
_G.GourdAddTimes = "06:00";       ----增加翻倍时间
--获取消耗的物品信息
--返回值 Info 类型：talbe  [1] ={ItemID = 5910001;Limit = 1000;AddExp = 1000};    ItemID 物品ID，Limit 提交最大数量（初定 Limit = -1 为无限）Addexp 消耗该物品获得经验值
function GourdConfig:GetGourdItemInfo()
	local Info = {
	[1] = {ItemID = 4100445;Limit = -1;AddExp = 100};	
	[2] = {ItemID = 4100446;Limit = 30;AddExp = 200};	
	[3] = {ItemID = 4100447;Limit = 30;AddExp = 300};
	[4] = {ItemID = 4100448;Limit = 30;AddExp = 600};
	} 
	return Info
end
--获取当前等级属性
--参数 dwLevel类型：Number  当前级别
--返回值 Info 类型：talbe 当前等级属性
function GourdConfig:GetGourdProInfo(dwLevel)
	local Info = {dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwCritDown=0,dwPoJiaDiKang=0}
	if dwLevel == 0 then return Info end
	local dwLevelInfo =self.LevelConfig[dwLevel]
	for k,v in pairs(Info) do
		Info[k] = dwLevelInfo[k]
	end
	return Info
end
--获取阶段和等级
--参数 dwLevel类型：Number  当前级别
--返回值 Info 类型：talbe  当前阶段，Ladder 阶段级别 Level 当前阶段小等级
function GourdConfig:GetGourdLevelInfo(dwLevel)
	local Info = {Ladder = 1,Level = 1}
	local Num  = math.floor(dwLevel%5) 
	if Num == 0 then
		Info.Ladder = math.floor(dwLevel/5);
		Info.Level  = 5
	else
		Info.Ladder = math.floor(dwLevel/5)+1;
		Info.Level  = Num
	end
	return Info
end