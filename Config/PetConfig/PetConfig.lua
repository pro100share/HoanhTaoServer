--模型状态 （无需配置）


--[[
	宠物结交条件配置说明
	宠物结交条件为下表中的_G.PetBasicConfig[宠物ID].KnowCondition.ConditionTbl字段
	比如需要宠物结交条件为 角色等级达到30级,充值达到20，ConditionTbl = {   { 2, {30}  },  {5,{20}  } , } 
	条件类型如下(具体见petScript.lua)
	{
		1 = 无条件
		2 = 玩家等级
		3 = 接受任务
		4 = 完成任务
		5 = 充值
		6 = 消费
		100 = 不可结交
	}
--]]

_G.PetStateConfig = {StayState = 1,AttackState = 2,DeadState = 3};
_G.PetBasicConfig = {
[50710015] = {
		KnowCondition = {
			ConditionTbl = {};  --脚本对应的条件
			ConditionStr="完成任务江湖侠客，再来与我结交";
			LabelStr = "完成任务江湖侠客赠送";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			};
			--需要消耗元宝
			NeedGold = 0;		
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-tiejiang.png";
			UnAssociateszModelPic = "img://boss-tiejiang1.png";							
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[50710015].szFile, 
				sklFile= ResNpcModelConfig.Skls[50710015].szFile, 
				sanFile = ResNpcModelConfig.Sans[5071001501].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(0,-10,2);
				LookPos = _Vector3.new(0,0,-0.2);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002103901,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002103990,								--模型动作
											},	
								},
			[PetStateConfig.DeadState] = { 	
										szTalk = 
										{
											'再来一次！！',
											'恭喜啊！大侠',
										},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002103991,								--模型动作
											},	
								}
		};		
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5500050, dwBindType = 1, dwNum = 10},
			-- };
		--};
		--传功次数
		Consult = 12;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000010}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "杨虎";
		--排序大小
		SortSizeField = 1;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_yh_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_yh_mingzi0.png";---灰色
		ActivePetName = "img://JH_yh_mingzi1.png" ;
	};
	[10021030] = {
		KnowCondition = {
			ConditionTbl = {{ 2, {30} }};  --脚本对应的条件
			ConditionStr="你的等级不足，30级后再来与我结交";
			LabelStr = "需要人物等级达30级才可结交";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			};
			--需要消耗元宝
			NeedGold = 0;		
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-wangkangxing.png";
			UnAssociateszModelPic = "img://boss-wangkangxing1.png";							
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10021030].szFile, 
				sklFile= ResNpcModelConfig.Skls[10021030].szFile, 
				sanFile = ResNpcModelConfig.Sans[1002103001].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(0,-9,2);
				LookPos = _Vector3.new(0,0,-0.2);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002103901,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002103990,								--模型动作
											},	
								},
			[PetStateConfig.DeadState] = { 	
										szTalk = 
										{
											'再来一次！！',
											'恭喜啊！大侠',
										},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002103991,								--模型动作
											},	
								}
		};		
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5500050, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 16;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000001}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "康兴哥";
		--排序大小
		SortSizeField = 2;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_kxg_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_kxg_mingzi0.png";---灰色
		ActivePetName = "img://JH_kxg_mingzi1.png" ;
	};
		
	[10021015] = {
		KnowCondition = {
		ConditionTbl = {{ 2, {60} }}; --脚本对应的条件
			ConditionStr="你的等级不足，60级后再来与我结交";
			LabelStr = "需要人物等级达60级才可结交";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id			
			AssociateszModelPic = "img://boss-xuzhu.png";
			UnAssociateszModelPic = "img://boss-xuzhu1.png";	
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10021015].szFile, 
				sklFile= ResNpcModelConfig.Skls[10021015].szFile, 
				sanFile = ResNpcModelConfig.Sans[1002101501].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(3.5,-10.5,0);
				LookPos = _Vector3.new(-0.3,0,-0.3);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002101501,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002101501,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 20;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000002}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "许竹青";
		--排序大小
		SortSizeField = 3;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_xzq_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_xzq_mingzi0.png";
		ActivePetName = "img://JH_xzq_mingzi1.png" ;
		
	};
	[10051001] = {
		KnowCondition = {
		ConditionTbl = {{100}};  --脚本对应的条件
			ConditionStr="侠客未开启，去疯狂的锄头中用友好度来兑换吧";
			LabelStr = "<font color='#FF0000'>疯狂的锄头中友好度兑换获得</font>";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-zbt.png";
			UnAssociateszModelPic = "img://boss-zbt1.png";	
			
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10051001].szFile, 
				sklFile= ResNpcModelConfig.Skls[10051001].szFile, 
				sanFile = ResNpcModelConfig.Sans[1005100101].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(5,-7.5,3);
				LookPos = _Vector3.new(-0.3,0,-0.5);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 25;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000003}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "周伯通";
		--排序大小
		SortSizeField = 5;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_zbt_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_zbt_mingzi0.png";
		ActivePetName = "img://JH_zbt_mingzi1.png" ;
	};
		[10092007] = {
		KnowCondition = {
		ConditionTbl = {{ 5, {100} }};  --脚本对应的条件
			ConditionStr="充值100元宝，就可以拥有我噢！";
			LabelStr = "充值满100元宝，立即获得";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-limochou.png";
			UnAssociateszModelPic = "img://boss-limochou1.png";	
			
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10092007].szFile, 
				sklFile= ResNpcModelConfig.Skls[10092007].szFile, 
				sanFile = ResNpcModelConfig.Sans[1009200701].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(0,-8,0);
				LookPos = _Vector3.new(-0.2,0,-0.2);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 30;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000004}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "李莫愁";
		--排序大小
		SortSizeField = 4;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_lmc_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_lmc_mingzi0.png";
		ActivePetName = "img://JH_lmc_mingzi1.png" ;
	};
		[10051003] = {
		KnowCondition = {
		ConditionTbl = {};  --脚本对应的条件
			ConditionStr="所需上古珍玩数量不足";
			LabelStr = "<font color='#FF0000'>需要集齐上古珍玩100个方可结交</font>";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
				[1] = {dwItemEnum = 9701013, dwBindType = 1, dwNum = 1},
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-hys.png";
			UnAssociateszModelPic = "img://boss-hys1.png";	
			
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10051003].szFile, 
				sklFile= ResNpcModelConfig.Skls[10051003].szFile, 
				sanFile = ResNpcModelConfig.Sans[1005100301].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(4,-11,0);
				LookPos = _Vector3.new(-0.3,0,-0.3);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 30;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000005}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "黄药师";
		--排序大小
		SortSizeField = 6;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_hys_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_hys_mingzi0.png";
		ActivePetName = "img://JH_hys_mingzi1.png" ;
	};
	[10082007] = {
		KnowCondition = {
		ConditionTbl = {};  --脚本对应的条件
			ConditionStr="所需宫廷烧鸡不足";
			LabelStr = "<font color='#FF0000'>需要集齐宫廷烧鸡100个方可结交</font>";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			[1] = {dwItemEnum = 9701014, dwBindType = 1, dwNum = 1},
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-hongqigong.png";
			UnAssociateszModelPic = "img://boss-hongqigong1.png";	
			
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10082007].szFile, 
				sklFile= ResNpcModelConfig.Skls[10082007].szFile, 
				sanFile = ResNpcModelConfig.Sans[1008200701].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(4,-10,0);
				LookPos = _Vector3.new(-0.3,0,-0.3);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 35;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000006}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "洪七公";
		--排序大小
		SortSizeField = 7;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_htg_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_htg_mingzi0.png";
		ActivePetName = "img://JH_htg_mingzi1.png" ;
	};
	[10071007] = {
		KnowCondition = {
		ConditionTbl = {};  --脚本对应的条件
			ConditionStr="拥有侠客令牌·欧阳锋即可获得";
			LabelStr = "<font color='#FF0000'>拥有侠客令牌·欧阳锋即可获得</font>";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			[1] = {dwItemEnum = 9701018, dwBindType = 1, dwNum = 1},
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-oyf.png";
			UnAssociateszModelPic = "img://boss-oyf1.png";	
			
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10071007].szFile, 
				sklFile= ResNpcModelConfig.Skls[10071007].szFile, 
				sanFile = ResNpcModelConfig.Sans[1007100701].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(4,-12,0);
				LookPos = _Vector3.new(-0.3,0,-0.3);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 40;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000007}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "欧阳锋";
		--排序大小
		SortSizeField = 8;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_oyf_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_oyf_mingzi0.png";
		ActivePetName = "img://JH_oyf_mingzi1.png" ;
	};
	[50302063] = {
		KnowCondition = {
		ConditionTbl = {};  --脚本对应的条件
			ConditionStr="拥有侠客令牌·小龙女即可获得";
			LabelStr = "<font color='#FF0000'>拥有侠客令牌·小龙女即可获得</font>";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			[1] = {dwItemEnum = 9701020, dwBindType = 1, dwNum = 1},			
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-xiaolongnv.png";
			UnAssociateszModelPic = "img://boss-xiaolongnv1.png";	
			
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[50302063].szFile, 
				sklFile= ResNpcModelConfig.Skls[50302063].szFile, 
				sanFile = ResNpcModelConfig.Sans[5030206301].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(4,-6,0);
				LookPos = _Vector3.new(-0.3,0,-0.2);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 45;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000008}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "小龙女";
		--排序大小
		SortSizeField = 9;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_xlv_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_xlv_mingzi0.png";
		ActivePetName = "img://JH_xlv_mingzi1.png" ;
	};
	[10061001] = {
		KnowCondition = {
		ConditionTbl = {{100}};  --脚本对应的条件
			ConditionStr="即将开放，敬请期待";
			LabelStr = "<font color='#FF0000'>即将开放，敬请期待</font>";   --Label显示的文字
			--需要消耗的道具
			NeedItem = {
			};
			--需要消耗元宝
			NeedGold = 0;
		};
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id
			AssociateszModelPic = "img://boss-ydds.png";
			UnAssociateszModelPic = "img://boss-ydds1.png";	
			
			szUIType = 'UINPC',					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10061001].szFile, 
				sklFile= ResNpcModelConfig.Skls[10061001].szFile, 
				sanFile = ResNpcModelConfig.Sans[1006100101].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(4,-10,0);
				LookPos = _Vector3.new(-0.5,0,-0.3);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 5,
			--聊天泡泡显示间隔(毫秒)
			dwShowTalkInterval = 3,
			
			[PetStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
		-- Instruction = {	
			-- dwMoney = 1000000,
			-- dwNeedElement = 10000,
			-- NeedItem = {
				--[1] = {dwItemEnum = 5501040, dwBindType = 1, dwNum = 10},
			-- };
		-- };
		--传功次数
		Consult = 50;
		--每天传功次数
		DayConsult = 1;
		--宠物固定技能配置Id
		PetSkillConfig = {20000009}; ----宠物配置Id，固定技能id，固定技能id
		--宠物初始名字
		PetBaseName = "一灯大师";
		--排序大小
		SortSizeField = 10;	
		-- 宠物描述图片
		PetDescribeImage= "img://JH_ydds_miaoshu.png";
		--宠物名字描述图片
		UnActivePetName = "img://JH_idds_mingzi0.png";
		ActivePetName = "img://JH_idds_mingzi1.png" ;
	};
}

_G.PetInstructionStrConfig = {
	InstructionInfo = "<font color='#cdc6c4'>点击指教按钮与<font color='#00FF00'>%s</font>进行传功指教，可增加人物属性。</font><br/>";
	DayInstructionNumber = "<font color='#DAA569'>今日传功指教：</font>";
	SumInstructionNumber = "<font color='#DAA569'>总传功指教：</font>";
	InstructionNeed = "<font color='#DAA569'>指教需求</font><br/>";
	Money  = "<font color='#DAA569'>银两：</font>";
	NeedElement = "<font color='#DAA569'>真气：</font>";
	NeedItem = "<font color='#DAA569'>材料：</font>";
}

_G.PetAddRoleAttrConfig = {
	RestAddRoleAttr = "<font color='#cdc6c4'>侠客为您加成属性</font><font color='#FF0000'>【未出战】</font><br/>";
	AttackAddRoleAttr = "<font color='#cdc6c4'>侠客为您加成属性</font><font color='#4fd388'>【已出战】</font><br/>";
	dwHPMax = "<font color='#DAA569'>生命：</font>";
	dwMPMax= "<font color='#DAA569'>内力：</font>";
	dwAttack="<font color='#DAA569'>攻击：</font>";
	dwDefense="<font color='#DAA569'>防御：</font>";
	dwFlee="<font color='#DAA569'>身法：</font>";
	dwCrit="<font color='#DAA569'>暴击：</font>";
	dwAttackSpeed="";
	dwMoveSpeed="";
}

_G.PetBatStrConfig = {
	str1 = "点击按钮，切回休息状态";
	str2 = "点击按钮，切回战斗状态";	
	str3 = "(死亡)";	
	str4 = "(休息)";	
	str5= "(出战)";	
	str6= "被攻击固定扣除%d生命";	
	str7= "出战";	
	str8= "休息";
	str9 = "点击按钮,召回侠客";	
}

_G.PetLvAndExpStrConfig = {
	str1 = "<font color='#DAA569'>侠客当前等级:</font>%s<br/>";
	str2 = "<font color='#DAA569'>侠客经验:</font>%s/%s<br/>";
	str3 = "侠客可通过击杀怪物获得经验<br/>";	
}

--宠物第一次指教消耗
local advicecostFirst = {
		[50710015] = {10000,500};  -- 宠物ID  消耗银两	消耗真气
		[10021030] = {200000,2000};
		[10021015] = {500000,4000};
		[10051001] = {1000000,8000};
		[10092007] = {2000000,15000};
		[10051003] = {3000000,30000};
		[10082007] = {4000000,60000};
		[10071007] = {5000000,100000};
		[50302063] = {7000000,200000};
		[10061001] = {10000000,300000};
};
--宠物其他次数银两消耗
local MoneyRatio={
		[50710015] = {10000,2000};  -- 宠物ID  系数1	 系数2
		[10021030] = {40000,8000};
		[10021015] = {60000,12000};
		[10051001] = {80000,16000};
		[10092007] = {100000,20000};
		[10051003] = {120000,24000};
		[10082007] = {140000,28000};
		[10071007] = {160000,32000};
		[50302063] = {180000,36000};
		[10061001] = {200000,40000};
		
};
--宠物其他次数真气消耗
local VitalRatio = {
		[50710015] = {500,200};  -- 宠物ID  系数1	 系数2
		[10021030] = {2000,600};
		[10021015] = {4000,1200};
		[10051001] = {6000,1800};
		[10092007] = {8000,2400};
		[10051003] = {10000,3000};
		[10082007] = {12000,3600};
		[10071007] = {14000,4200};
		[50302063] = {16000,4800};
		[10061001] = {20000,6000};
};

_G.PetZJConfig = {	
	AdviceCost = function(dwPetID,dwCount)--dwPetID：宠物ID ，dwCount： 宠物指教次数
		if not dwPetID or not dwCount or dwCount == 0 then return 0,0; end
		local value = advicecostFirst[dwPetID];
		if value then
			if dwCount == 1 then
				value = advicecostFirst[dwPetID];
				return value[1],value[2];
			else
				local mulVal = MoneyRatio[dwPetID];
				local eleVal = VitalRatio[dwPetID]
				local money = mulVal[1]*(dwCount-2) + mulVal[2];
				local element = eleVal[1]*(dwCount-2)+eleVal[2];
				
				return money,element;
			end
		end
	end;
}
--指教标准值
local standard = {
	[50710015] = 300,
	[10021030] = 500,
	[10021015] = 700,
	[10051001] = 1000,
	[10092007] = 1300,
	[10051003] = 1700,
	[10082007] = 2100,
	[10071007] = 2600,
	[50302063] = 3100,
	[10061001] = 3700
	};
--指教最大次数
local numberofall={
	[50710015] = 11,
	[10021030] = 15,
	[10021015] = 19,
	[10051001] = 24,
	[10092007] = 29,
	[10051003] = 29,
	[10082007] = 34,
	[10071007] = 39,
	[50302063] = 44,
	[10061001] = 49
};

local function CountInstructProperty(dwPetId, dwLevel, dwDayConsult, dwConsult)
	local tbAddInfo = PetSingleAttr:new();
	if dwConsult == 1 then
		tbAddInfo.dwHPMax = math.floor(standard[dwPetId]*0.1*5);
		tbAddInfo.dwMPMax = math.floor(standard[dwPetId]*0.1*0.12);
		tbAddInfo.dwAttack = math.floor(standard[dwPetId]*0.1*1);
		tbAddInfo.dwDefense = math.floor(standard[dwPetId]*0.1*0.5);
		tbAddInfo.dwFlee = math.floor(standard[dwPetId]*0.1*0.15);
		tbAddInfo.dwCrit = math.floor(standard[dwPetId]*0.1*0.1);
	elseif dwConsult > 1 then
		tbAddInfo.dwHPMax = math.floor(standard[dwPetId]*0.9*5/numberofall[dwPetId]);
		tbAddInfo.dwMPMax = math.floor(standard[dwPetId]*0.9*0.12/numberofall[dwPetId]);
		tbAddInfo.dwAttack = math.floor(standard[dwPetId]*0.9*1/numberofall[dwPetId]);
		tbAddInfo.dwDefense = math.floor(standard[dwPetId]*0.9*0.5/numberofall[dwPetId]);
		tbAddInfo.dwFlee = math.floor(standard[dwPetId]*0.9*0.15/numberofall[dwPetId]);
		tbAddInfo.dwCrit = math.floor(standard[dwPetId]*0.9*0.1/numberofall[dwPetId]);
	end
	return tbAddInfo;
end;

_G.PetFunctionConfig = {
	--结交条件
	CheckKnowCon = function(dwRoleId, dwPetId)
		local KnowCondition = _G.PetBasicConfig[dwPetId].KnowCondition;
		local ConditionTbl = KnowCondition.ConditionTbl;
		for _, info in pairs(ConditionTbl) do
			local dwConditionId = info[1];
			local param = info[2];
			local fun = PetScript[dwConditionId];
			local res = fun(dwRoleId,param);
			if not res then return false end
		end;
		return true;
	end;
		
	--指教增加的人物属性
	OnPetInstructProperty = function(dwPetId, dwLevel, dwDayConsult, dwConsult)
		local tbAddInfo = PetSingleAttr:new();
	--	print("===OnPetInstructProperty===",dwPetId,dwConsult)
		if dwConsult > 0 then
			for i = 1,dwConsult do
				local tbTmp = CountInstructProperty(dwPetId, dwLevel, dwDayConsult, i);
				--print("===OnPetInstructProperty 2===",dwPetId,i,tbTmp.dwAttack)
				tbAddInfo:AddValue(tbTmp);
			end
		end
		--print("===OnPetInstructProperty 3===",tbAddInfo.dwAttack)
		return tbAddInfo;
	end;
	--宠物的属性
	PetBasicProperty = function(dwPetId, dwLevel)
		local func = PetBaseInfo[dwPetId];
		if func then
			return func(dwLevel);
		end
	end;
	
	--宠物属性给人物的比例-----没用的
	PetRolePropertyParam = function(dwPetId,dwLevel,dwState)
		
	end;
	---宠物给人加成默认百分比
	PetRoleDefaultPer = 1;
	---宠物给人
	PetRoleAddPerMaxConfig = {
	     [50710015] = 1,
	     [10021030] = 1,
	     [10021015] = 1,
	     [10051001] = 1,
	     [10092007] = 1,
	     [10051003] = 1,
	     [10082007] = 1,
	     [10071007] = 1,
	     [50302063] = 1,
	     [10061001] = 1	
	};
	--宠物给人加的属性
	PetRoleProperty = function(dwPetId,dwLevel,dwState,tbPetBatlInfo,petsys)
		local proInfo = {}--_G.PetFunctionConfig.PetBasicProperty(dwPetId,dwLevel)
		
		local fPer = 0;
		if dwState == 1 then
			fPer = petsys:GetFPer();
		elseif dwState == 2 then
			fPer = petsys:GetFPer();
		end
		proInfo.dwAttack = tbPetBatlInfo.dwAttack * fPer;
		proInfo.dwDefense = tbPetBatlInfo.dwDefense * fPer;
		proInfo.dwFlee = tbPetBatlInfo.dwFlee * fPer;			--身法
		proInfo.dwCrit = tbPetBatlInfo.dwCrit * fPer;			--暴击
		proInfo.dwMPMax = tbPetBatlInfo.dwMPMax * fPer;
		proInfo.dwHitPercent = 0;
		proInfo.dwMoveSpeed = 0;			--移动速度
		proInfo.dwHPMax = tbPetBatlInfo.dwHPMax * fPer;			--生命上限
		proInfo.dwDuck = 0;
		return proInfo;
	end;
	
	--出战宠物属性加成
	InBattlePropParam = function(petsys)
		return petsys:GetShowFPer();
	end;
	--休息宠物属性加成
	InRestPropParam = function(petsys)
		return petsys:GetShowFPer();
	end;
	--宠物日指教次数更新
	RefreshTime = "06:00";
	
	--宠物最大血量
	GetMaxHp = function(dwPetId, dwLevel)
		return 5000;
	end;
	
	--宠物死亡后头像显示的字
	szDeadShow = "侠客阵亡%d秒后复活";
	
	--宠物主界面等级TIP的字
	szLevelTip = "侠客升级，即将开放";
}

_G.KnowPetBroadCast = {
	[10092007] = 15;
	[10051001] = 15;
	[10051003] = 15;
	[10082007] = 15;
	[10071007] = 15;
	[50302063] = 15;
	[10061001] = 15;	

}
_G.BroadInfo = "恭喜<font color='#278cf1'>%s</font>大侠成功结交<font color='#31cf32'>%s</font>侠客，江湖险恶，与君肝胆相照，携手仗义行侠！%s";
_G.ZJFull = "传功已满";
_G.Dist = 120;

_G.GetPetLookID = function(dwEnumID,dwLevel)
	if dwEnumID == 50710015 then
		return 507100150
	elseif dwEnumID == 10021030 then
		return 100210300
	elseif dwEnumID == 10021015 then
		return 100210150
	elseif dwEnumID == 10051001 then
		return 100510010
	elseif dwEnumID == 10092007 then
		return 100920070
	elseif dwEnumID == 10051003 then
		return 100510030
	elseif dwEnumID == 10082007 then
		return 100820070
	elseif dwEnumID == 10071007 then
		return 100710070
	elseif dwEnumID == 50302063 then
		return 503020630
	elseif dwEnumID == 10061001 then
		return 100610010
	end
end

--宠物在地图上显示的相关配置
_G.PetShowConfig = 
{
	fPetNameHeight = 0.16;--名字的高度
	fOwnerNameHeight = 0;--主人名字的高度
	
	x = 0;
	y = 0.10;
	z = 0.05;--血条与名字的高度差
	_y = -0.0002;--血条和底板的位置差
	---------------------------------------
	size = 0.085;  --宠物名字大小
	textcolor = 0xFFFFEFEF;--宠物名字颜色
	edgeColor = 0xFF000000;--宠物名字边框颜色
	_textcolor = 0xFFFFEFEF;--宠物名字颜色(鼠标指向时)
	_edgeColor = 0xFF000000;--宠物名字边框颜色(鼠标指向时)
	
	textcolor_o = 0xFF53C353;--宠物主人名字颜色
	edgeColor_o = 0xFF000000;--宠物主人名字边框颜色
	_textcolor_o = 0xFF00FF00;--宠物主人名字颜色(鼠标指向时)
	_edgeColor_o = 0xFF000000;--宠物主人名字边框颜色(鼠标指向时)
	
	bournIcon = {
		[1] = {--底图
			title_bournimgwidth = 0.9;--宠物境界图片宽（底图）
			title_bournimgheight = 0.184;--宠物境界图片高
			bournPos = {x = 0;y = 0.06;z = 0.45;};
		};
		[2] = {--星级
			title_bournimgwidth = 0.9;--宠物境界图片宽（底图）
			title_bournimgheight = 0.184;--宠物境界图片高
			bournPos = {x = 0;y = 0.06;z = 0.6;};
		};
	};
	
	----------------------------------------
	say_size = 0.090;--说话大小
	say_textcolor = 0xfffdee05;--说话颜色  0xEFFFFF00
	say_edgeColor = 0xFF000000;--说话边框颜色   0x00BFDF57
	_say_textcolor = 0xFFFFE384;--说话颜色(鼠标指向时)
	_say_edgeColor = 0xFF000000;--说话边框颜色(鼠标指向时)
}

--宠物界面UILoader位置
_G.PetUILoaderPos = 
{
	[0] = {_x = -73,_y = -39};--未结交
	[1] = {_x = -93,_y = -39};--已结交
}

_G.AttckIntertime = 700;
_G.PetConfigScript = {};
_G.InterLevelIsUpLevel = 0; ----根据宠物高于玩家XXX级后 不再升级
_G.PetUpLevelEffectID = 53; ----宠物升级特效ID
_G.PetLevelExpConfig = {  -----每个宠物的等级经验是一样的
	[1]=0,
	[2]=15,
	[3]=51,
	[4]=109,
	[5]=205,
	[6]=367,
	[7]=617,
	[8]=985,
	[9]=1489,
	[10]=2145,
	[11]=2991,
	[12]=4071,
	[13]=5407,
	[14]=7042,
	[15]=9032,
	[16]=11432,
	[17]=14312,
	[18]=17792,
	[19]=22292,
	[20]=27842,
	[21]=34892,
	[22]=44072,
	[23]=56432,
	[24]=73232,
	[25]=96182,
	[26]=126632,
	[27]=166142,
	[28]=217082,
	[29]=282632,
	[30]=366482,
	[31]=471782,
	[32]=603032,
	[33]=769082,
	[34]=977432,
	[35]=1237625,
	[36]=1558319,
	[37]=1951374,
	[38]=2428522,
	[39]=3004881,
	[40]=3732997,
	[41]=4600799,
	[42]=5632631,
	[43]=6861662,
	[44]=8326992,
	[45]=10085762,
	[46]=12195230,
	[47]=14712846,
	[48]=17696278,
	[49]=21203422,
	[50]=25337357,
	[51]=30178159,
	[52]=35837602,
	[53]=42456359,
	[54]=50209578,
	[55]=59314301,
	[56]=70039403,
	[57]=82873343,
	[58]=98307637,
	[59]=116974227,
	[60]=139777436,
	[61]=167365703,
	[62]=200583611,
	[63]=240603633,
	[64]=288872611,
	[65]=347176596,
	[66]=417721902,
	[67]=502729843,
	[68]=604700154,
	[69]=726408155,
	[70]=870890779,
	[71]=1041164388,
	[72]=1234947857,
	[73]=1454533717,
	[74]=1702330149,
	[75]=1980842214,
	[76]=2292648320,
	[77]=2640371821,
	[78]=3026647728,
	[79]=3454084703,
	[80]=3925222632,
	[81]=4440431710,
	[82]=5003821075,
	[83]=5619910781,
	[84]=6293672888,
	[85]=7030576661,
	[86]=7836638291,
	[87]=8718475588,
	[88]=9683368145,
	[89]=10739323512,
	[90]=11895149997,
	[91]=13160536734,
	[92]=14546141775,
	[93]=16063688975,
	[94]=17726074575,
	[95]=19547484440,
	[96]=21543523021,
	[97]=23731355215,
	[98]=26129862408,
	[99]=28759814126,
	[100]=31644000000,
	[101]=229472000000,
	[102]=38278500000,
	[103]=42086700000,
	[104]=46265700000,
	[105]=50852700000,
	[106]=55887600000,
	[107]=61415400000,
	[108]=67485000000,
	[109]=74149800000,
	[110]=81469800000,
	[111]=89509500000,
	[112]=98340900000,
	[113]=108043000000,
	[114]=118703000000,
	[115]=130415000000,
	[116]=143285000000,
	[117]=157428000000,
	[118]=172971000000,
	[119]=190055000000,
	[120]=229472000000,
	[121]=229472000000,
}
----根据宠物技能获取宠物等级
function PetConfigScript:GetPetLevel(dwTotalExp)
	local dwTotalExp = dwTotalExp;
	for i = 2,#_G.PetLevelExpConfig do
		if(dwTotalExp >= _G.PetLevelExpConfig[i]) then
			dwTotalExp = dwTotalExp - _G.PetLevelExpConfig[i] 
		else
			return i-1,dwTotalExp;
		end
	end
	return #_G.PetLevelExpConfig,dwTotalExp;
end

----获取宠物总经验
function PetConfigScript:GetPetTotalExp()
	local petTotalExp = 0;
	for k,v in pairs(_G.PetLevelExpConfig) do
		petTotalExp = petTotalExp + v
	end
	return petTotalExp;
end

