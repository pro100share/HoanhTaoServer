---附加属性配置序号规则：道具大类+道具子类+道具等级+强化等级（没有强化等级不加）   例如：1级武器：110 0 0 1    1级强化五行：11000101
----任务奖励物品编号规则：任务ID+A序号()

--附加属性配置
--[[	1 = 攻击
	2 = 防御
	3 = 身法
	4 = 暴击
	5 = 生命
	6 = 内力
	7 = 伤害减免
]]



_G.GiftConfig =
{
	enumGiftType =
	{
		OnlineTime = 1,
		Level = 2,
		Pack = 3,
		NoPack = 11,
		LevelUp = 12,
		Success = 13,
		UnlockTimeGift = 14,
		UniCast = 15,
	},

	PropConfig =
	{
--------任务物品奖励↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

		[10030] =
		{
			Dis = '1阶武器',
			dwStrongEnum = 0,
			PropList =
			{
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102010,
	             ---剑
				[enProfType.eProfType_Sword] = 1101010,
				 ---枪
				[enProfType.eProfType_Spear] = 1103010,
			}
		},

		--单体近战技能书
		[10050] =
		{
			Dis = '单体技能书',
			dwStrongEnum = 0,
			PropList =
			{
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 5151001, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 5131001,
	             ---剑
				[enProfType.eProfType_Sword] = 5121001,
				 ---枪
				[enProfType.eProfType_Spear] = 5141001,
			}
		},

		--1阶衣服
		[10080] =
		{
			Dis = '1阶衣服',
			dwStrongEnum = 0,
			PropList =
			{
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1204010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1202010,
	             ---剑
				[enProfType.eProfType_Sword] = 1201010,
				 ---枪
				[enProfType.eProfType_Spear] = 1203010,
			}
		},

		--1阶项链
		[10120] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶项链',
			dwStrongEnum = 0,
			PropList =
			{
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1400010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1400010,
	             ---剑
				[enProfType.eProfType_Sword] = 1400010,
				 ---枪
				[enProfType.eProfType_Spear] = 1400010,
			}
		},

		--自身扇形技能书
		[10170] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶武器',
			dwStrongEnum = 0,
			PropList =
			{
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] 	= 5151004, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] 	= 5131004,
	             ---剑
				[enProfType.eProfType_Sword] 	= 5121004,
				 ---枪
				[enProfType.eProfType_Spear] 	= 5141004,
			}
		},

		--1阶披风
		[10190] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶鞋子',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 450000,
				},
				{
					dwPropertyType = 5,
					dwValue = 500000,
				},
				{
					dwPropertyType = 6,
					dwValue = 400000,
				},

			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1440010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1440010,
	             ---剑
				[enProfType.eProfType_Sword] = 1440010,
				 ---枪
				[enProfType.eProfType_Spear] = 1440010,
			}
		},


		--职业坐骑
		[20380] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '职业坐骑',
			dwStrongEnum = 0,
			PropList =
			{
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] 	= 9404000,
	             ---刀
				[enProfType.eProfType_Knife] 	= 9402000,
	             ---剑
				[enProfType.eProfType_Sword] 	= 9401000,
				 ---枪
				[enProfType.eProfType_Spear] 	= 9403000,
			}
		},

		--自身范围技能书
		[20110] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '自身范围技能书',
			dwStrongEnum = 0,
			PropList =
			{
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] 	= 5151003, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] 	= 5131003,
	             ---剑
				[enProfType.eProfType_Sword] 	= 5121003,
				 ---枪
				[enProfType.eProfType_Spear] 	= 5141003,
			}
		},

		--1阶腰坠
		[20120] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶腰坠',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 250000,
				},
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 150000,
				},
				{
					dwPropertyType = 6,
					dwValue = 250000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1430010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1430010,
	             ---剑
				[enProfType.eProfType_Sword] = 1430010,
				 ---枪
				[enProfType.eProfType_Spear] = 1430010,
			}
		},

		--1阶蓝色武器
		[20180] =
		{
			Dis = '1阶蓝色武器',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 450000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 300000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102010,
	             ---剑
				[enProfType.eProfType_Sword] = 1101010,
				 ---枪
				[enProfType.eProfType_Spear] = 1103010,
			}
		},



		--1阶蓝色武器项链
		[20310] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶项链',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 3,
					dwValue = 300000,
				},
				{
					dwPropertyType = 4,
					dwValue = 300000,
				},
				{
					dwPropertyType = 6,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 300000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1400010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1400010,
	             ---剑
				[enProfType.eProfType_Sword] = 1400010,
				 ---枪
				[enProfType.eProfType_Spear] = 1400010,
			}
		},

		--4阶蓝色戒指
		[141004015] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶戒指',
			dwStrongEnum = 15,
			PropList =
			{

				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 300000,
				},
				{
					dwPropertyType = 1,
					dwValue = 300000
				},
				{
					dwPropertyType = 2,
					dwValue = 300000,
				},
				{
					dwPropertyType = 5,
					dwValue = 450000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1410040, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1410040,
	             ---剑
				[enProfType.eProfType_Sword] = 1410040,
				 ---枪
				[enProfType.eProfType_Spear] = 1410040,
			}
		},
		--2阶紫色戒指
		[20350] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶戒指',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 450000,
				},
				{
					dwPropertyType = 1,
					dwValue = 300000,
				},
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 250000,
				},
				{
					dwPropertyType = 5,
					dwValue = 550000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1410020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1410020,
	             ---剑
				[enProfType.eProfType_Sword] = 1410020,
				 ---枪
				[enProfType.eProfType_Spear] = 1410020,
			}
		},
		--3阶绿色戒指
		[141003002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶绿色戒指',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 4,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1410030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1410030,
	             ---剑
				[enProfType.eProfType_Sword] = 1410030,
				 ---枪
				[enProfType.eProfType_Spear] = 1410030,
			}
		},

		--2阶蓝色手镯
		[30140] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶手镯',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 250000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 1,
					dwValue = 300000,
				},
				{
					dwPropertyType = 4,
					dwValue = 200000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1450020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1450020,
	             ---剑
				[enProfType.eProfType_Sword] = 1450020,
				 ---枪
				[enProfType.eProfType_Spear] = 1450020,
			}
		},

		--2阶蓝色绒革缰绳
		[30270] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶绒革缰绳',
			dwStrongEnum = 5,
			PropList =
			{

				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
				{
					dwPropertyType = 6,
					dwValue = 500000,
				},
				{
					dwPropertyType = 3,
					dwValue = 300000,
				},
				{
					dwPropertyType = 6,
					dwValue = 250000,
				},
				{
					dwPropertyType = 3,
					dwValue = 200000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1710002, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1710002,
	             ---剑
				[enProfType.eProfType_Sword] = 1710002,
				 ---枪
				[enProfType.eProfType_Spear] = 1710002,
			}
		},


		--2阶蓝色头饰
		[30340] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶头饰',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 300000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 4,
					dwValue = 300000,
				},
				{
					dwPropertyType = 5,
					dwValue = 300000,
				},
				{
					dwPropertyType = 5,
					dwValue = 250000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1420020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1420020,
	             ---剑
				[enProfType.eProfType_Sword] = 1420020,
				 ---枪
				[enProfType.eProfType_Spear] = 1420020,
			}
		},

		--2阶蓝色披风
		[40120] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶披风',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 300000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 500000,
				},
				{
					dwPropertyType = 6,
					dwValue = 500000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1440020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1440020,
	             ---剑
				[enProfType.eProfType_Sword] = 1440020,
				 ---枪
				[enProfType.eProfType_Spear] = 1440020,
			}
		},
		--3阶绿色披风
		[81446001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶披风',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},

			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1440030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1440030,
	             ---剑
				[enProfType.eProfType_Sword] = 1440030,
				 ---枪
				[enProfType.eProfType_Spear] = 1440030,
			}
		},

		--2阶蓝色裤子
		[40210] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶裤子',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},

				{
					dwPropertyType = 6,
					dwValue = 400000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1254020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1252020,
	             ---剑
				[enProfType.eProfType_Sword] = 1251020,
				 ---枪
				[enProfType.eProfType_Spear] = 1253020,
			}
		},
		--3阶绿色裤子
		[4031002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶绿色裤子',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1254030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1252030,
	             ---剑
				[enProfType.eProfType_Sword] = 1251030,
				 ---枪
				[enProfType.eProfType_Spear] = 1253030,
			}
		},
		--3阶蓝色缰绳
		[171000304] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶蓝色缰绳',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 350000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1710003, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1710003,
	             ---剑
				[enProfType.eProfType_Sword] = 1710003,
				 ---枪
				[enProfType.eProfType_Spear] = 1710003,
			}
		},

--------礼包奖励↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
---------------------------------------武器↓↓↓↓↓↓↓
		[5151005] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '特殊技能书',
			dwStrongEnum = 0,
			PropList =
			{
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 5151005, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 5131005,
	             ---剑
				[enProfType.eProfType_Sword] = 5121005,
				 ---枪
				[enProfType.eProfType_Spear] = 5141005,
			}
		},


		[110001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶武器',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102010,
	             ---剑
				[enProfType.eProfType_Sword] = 1101010,
				 ---枪
				[enProfType.eProfType_Spear] = 1103010,
			}
		},


		[11000401] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '4阶武器',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104040, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102040,
	             ---剑
				[enProfType.eProfType_Sword] = 1101040,
				 ---枪
				[enProfType.eProfType_Spear] = 1103040,
			}
		},

		[110002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶武器',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102020,
	             ---剑
				[enProfType.eProfType_Sword] = 1101020,
				 ---枪
				[enProfType.eProfType_Spear] = 1103020,
			}
		},

		[11000210] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶紫色武器，强化10级',
			dwStrongEnum = 10,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102020,
	             ---剑
				[enProfType.eProfType_Sword] = 1101020,
				 ---枪
				[enProfType.eProfType_Spear] = 1103020,
			}
		},
		[11000211] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶紫色武器，强化10级',
			dwStrongEnum = 10,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102030,
	             ---剑
				[enProfType.eProfType_Sword] = 1101030,
				 ---枪
				[enProfType.eProfType_Spear] = 1103030,
			}
		},
	    [110003] =--[[这个是附加属性序号，你自己定]]-- 3阶武器+5
		{
			Dis = '3阶武器',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102030,
	             ---剑
				[enProfType.eProfType_Sword] = 1101030,
				 ---枪
				[enProfType.eProfType_Spear] = 1103030,
			}
		},
		[110004] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '4阶武器',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1104040, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1102040,
	             ---剑
				[enProfType.eProfType_Sword] = 1101040,
				 ---枪
				[enProfType.eProfType_Spear] = 1103040,
			}
		},
---------------------------------------衣服↓↓↓↓↓↓↓
		[120001] =--[[这个是附加属性序号，你自己定]]-- 绿色衣服
		{
			Dis = '1阶衣服',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1204010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1202010,
	             ---剑
				[enProfType.eProfType_Sword] = 1201010,
				 ---枪
				[enProfType.eProfType_Spear] = 1203010,
			}
		},
		[120002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶衣服',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1204020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1202020,
	             ---剑
				[enProfType.eProfType_Sword] = 1201020,
				 ---枪
				[enProfType.eProfType_Spear] = 1203020,
			}
		},
		[120003] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶衣服',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1204030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1202030,
	             ---剑
				[enProfType.eProfType_Sword] = 1201030,
				 ---枪
				[enProfType.eProfType_Spear] = 1203030,
			}
		},
		[12000304] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶紫色衣服',
			dwStrongEnum = 0,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},
				{
					dwPropertyType = 4,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1204030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1202030,
	             ---剑
				[enProfType.eProfType_Sword] = 1201030,
				 ---枪
				[enProfType.eProfType_Spear] = 1203030,
			}
		},
		[120004] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '4阶衣服',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1204040, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1202040,
	             ---剑
				[enProfType.eProfType_Sword] = 1201040,
				 ---枪
				[enProfType.eProfType_Spear] = 1203040,
			}
		},
---------------------------------------鞋子↓↓↓↓↓↓↓
		[121001] =--[[这个是附加属性序号，你自己定]]-- 绿色鞋子
		{
			Dis = '1阶鞋子',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1214010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1212010,
	             ---剑
				[enProfType.eProfType_Sword] = 1211010,
				 ---枪
				[enProfType.eProfType_Spear] = 1213010,
			}
		},
		[121002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶鞋子',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1214020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1212020,
	             ---剑
				[enProfType.eProfType_Sword] = 1211020,
				 ---枪
				[enProfType.eProfType_Spear] = 1213020,
			}
		},
		[121003] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3级鞋子',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1214030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1212030,
	             ---剑
				[enProfType.eProfType_Sword] = 1211030,
				 ---枪
				[enProfType.eProfType_Spear] = 1213030,
			}
		},
		[121004] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '4级鞋子',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1214040, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1212040,
	             ---剑
				[enProfType.eProfType_Sword] = 1211040,
				 ---枪
				[enProfType.eProfType_Spear] = 1213040,
			}
		},
---------------------------------------护手↓↓↓↓↓↓↓
		[122001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶护手',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1224010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1222010,
	             ---剑
				[enProfType.eProfType_Sword] = 1221010,
				 ---枪
				[enProfType.eProfType_Spear] = 1223010,
			}
		},
		[122002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶护手',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1224020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1222020,
	             ---剑
				[enProfType.eProfType_Sword] = 1221020,
				 ---枪
				[enProfType.eProfType_Spear] = 1223020,
			}
		},
		[122003] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶护手',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1224030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1222030,
	             ---剑
				[enProfType.eProfType_Sword] = 1221030,
				 ---枪
				[enProfType.eProfType_Spear] = 1223030,
			}
		},
		[122004] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '4阶护手',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 100,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1224040, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1222040,
	             ---剑
				[enProfType.eProfType_Sword] = 1221040,
				 ---枪
				[enProfType.eProfType_Spear] = 1223040,
			}
		},
		[12200301] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶护手',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1224030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1222030,
	             ---剑
				[enProfType.eProfType_Sword] = 1221030,
				 ---枪
				[enProfType.eProfType_Spear] = 1223030,
			}
		},
---------------------------------------↓↓↓↓↓↓↓腰带
        [123001] =--[[这个是附加属性序号，你自己定]]-- 1阶绿色腰带
		{
			Dis = '1阶腰带',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1234010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1232010,
	             ---剑
				[enProfType.eProfType_Sword] = 1231010,
				 ---枪
				[enProfType.eProfType_Spear] = 1233010,
			}
		},
        [123002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶腰带',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1234020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1232020,
	             ---剑
				[enProfType.eProfType_Sword] = 1231020,
				 ---枪
				[enProfType.eProfType_Spear] = 1233020,
			}
		},
        [123003] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶腰带',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1234030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1232030,
	             ---剑
				[enProfType.eProfType_Sword] = 1231030,
				 ---枪
				[enProfType.eProfType_Spear] = 1233030,
			}
		},
		[123004] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '4阶腰带',
			dwStrongEnum = 5,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 3,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1234040, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1232040,
	             ---剑
				[enProfType.eProfType_Sword] = 1231040,
				 ---枪
				[enProfType.eProfType_Spear] = 1233040,
			}
		},
		[124001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶头饰',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1244010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1242010,
	             ---剑
				[enProfType.eProfType_Sword] = 1241010,
				 ---枪
				[enProfType.eProfType_Spear] = 1243010,
			}
		},
		[124002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶头饰',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 4,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1244020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1242020,
	             ---剑
				[enProfType.eProfType_Sword] = 1241020,
				 ---枪
				[enProfType.eProfType_Spear] = 1243020,
			}
		},
		[145003002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶头饰绿色',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 4,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1450030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1450030,
	             ---剑
				[enProfType.eProfType_Sword] = 1450030,
				 ---枪
				[enProfType.eProfType_Spear] = 1450030,
			}
		},
		--3阶紫色头饰
		[145003004] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶紫色头饰',
			dwStrongEnum = 0,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
				{
					dwPropertyType = 4,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 4,
					dwValue = 450000,
				},
				{
					dwPropertyType = 5,
					dwValue = 300000,
				},
			----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1450030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1450030,
	             ---剑
				[enProfType.eProfType_Sword] = 1450030,
				 ---枪
				[enProfType.eProfType_Spear] = 1450030,
			}
		},
		[125001] =--[[这个是附加属性序号，你自己定]]-- 1阶绿色护腿
		{
			Dis = '1阶护腿',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1254010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1252010,
	             ---剑
				[enProfType.eProfType_Sword] = 1251010,
				 ---枪
				[enProfType.eProfType_Spear] = 1253010,
			}
		},
		[125002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶护腿',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 3,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1254020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1252020,
	             ---剑
				[enProfType.eProfType_Sword] = 1251020,
				 ---枪
				[enProfType.eProfType_Spear] = 1253020,
			}
		},
		[140001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶项链',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1400010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1400010,
	             ---剑
				[enProfType.eProfType_Sword] = 1400010,
				 ---枪
				[enProfType.eProfType_Spear] = 1400010,
			}
		},
		[140002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶项链',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1400020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1400020,
	             ---剑
				[enProfType.eProfType_Sword] = 1400020,
				 ---枪
				[enProfType.eProfType_Spear] = 1400020,
			}
		},
		[140003] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶项链',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
				{
					dwPropertyType = 6,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1400030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1400030,
	             ---剑
				[enProfType.eProfType_Sword] = 1400030,
				 ---枪
				[enProfType.eProfType_Spear] = 1400030,
			}
		},
        [141001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶戒指',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1410010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1410010,
	             ---剑
				[enProfType.eProfType_Sword] = 1410010,
				 ---枪
				[enProfType.eProfType_Spear] = 1410010,
			}
		},
		[142001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶手镯',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1420010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1420010,
	             ---剑
				[enProfType.eProfType_Sword] = 1420010,
				 ---枪
				[enProfType.eProfType_Spear] = 1420010,
			}
		},
		[142002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶手镯',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1420020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1420020,
	             ---剑
				[enProfType.eProfType_Sword] = 1420020,
				 ---枪
				[enProfType.eProfType_Spear] = 1420020,
			}
		},
		[142003] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶手镯',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1420030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1420030,
	             ---剑
				[enProfType.eProfType_Sword] = 1420030,
				 ---枪
				[enProfType.eProfType_Spear] = 1420030,
			}
		},
		[143001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶腰坠',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1430010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1430010,
	             ---剑
				[enProfType.eProfType_Sword] = 1430010,
				 ---枪
				[enProfType.eProfType_Spear] = 1430010,
			}
		},
		[143002] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '2阶腰坠',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1430020, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1430020,
	             ---剑
				[enProfType.eProfType_Sword] = 1430020,
				 ---枪
				[enProfType.eProfType_Spear] = 1430020,
			}
		},
		[143003] =--[[这个是附加属性序号，你自己定]]-- 3阶蓝色腰坠
		{
			Dis = '3阶腰坠',
			dwStrongEnum = 3,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 5,
					dwValue = 350000,
				},
				{
					dwPropertyType = 6,
					dwValue = 350000,
				},
				{
					dwPropertyType = 1,
					dwValue = 350000,
				},
				{
					dwPropertyType = 2,
					dwValue = 350000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1430030, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1430030,
	             ---剑
				[enProfType.eProfType_Sword] = 1430030,
				 ---枪
				[enProfType.eProfType_Spear] = 1430030,
			}
		},
        [144001] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '1阶披风',
			dwStrongEnum = 2,
			PropList =
			{
				{
					dwPropertyType = 1,
					dwValue = 400000,
				},
				{
					dwPropertyType = 2,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1440010, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1440010,
	             ---剑
				[enProfType.eProfType_Sword] = 1440010,
				 ---枪
				[enProfType.eProfType_Spear] = 1440010,
			}
		},
        [170003] =--[[这个是附加属性序号，你自己定]]--
		{
			Dis = '3阶马鞍（青铜鞍具）',
			dwStrongEnum = 4,
			PropList =
			{
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
				{
					dwPropertyType = 5,
					dwValue = 400000,
				},
	----每个职业配置的装备
			},
			ProfEquipEnum =
			{
	             ---镰刀
				[enProfType.eProfType_Sickle] = 1700003, --这里就是不同职业的装备配置号，来自ItemEquipConfig.lua
	             ---刀
				[enProfType.eProfType_Knife] = 1700003,
	             ---剑
				[enProfType.eProfType_Sword] = 1700003,
				 ---枪
				[enProfType.eProfType_Spear] = 1700003,
			}
		},
	},
	---------------------------------------↓↓↓↓↓↓↓
---等级礼包配置
	LevelGift =
	{
	----5级新手礼包
		{
			Level = 5,
			dwBindGold = 0,
			szDis = '1.5级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 2100010, --1级红药
					dwItemNum = 99,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2200010, --1级蓝药
					dwItemNum = 99,
					dwBindType = 1,
				},
			},
			EquipList =
			{
				{
					dwPropEnum = 110001,--绿色1级武器[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 122001,--绿色1级护手[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
		},
    ---10级新手礼包
	    {
			Level = 10,
			dwBindGold = 0,
			szDis = '1.10级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 2400110, ---双倍经验丹
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100010, ---千纸鹤
					dwItemNum = 5,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5500020, ----扩展符
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405010,---神龙果
					dwItemNum = 5,
					dwBindType = 1,
				},


			},
			EquipList =
			{
				{
					dwPropEnum = 120001,--1级绿色衣服 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 121001,--1级绿色鞋子 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
	    },

    ---15级新手礼包
	    {
			Level = 15,
			dwBindGold = 0,
			szDis = '1.15级新手礼包，您可以领取到以下奖励',
			ItemList =
			{

				{
					dwItemEnum = 2500070, ---血池小
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500080, ---蓝池小
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100140, ----强化石
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5500010, ----小喇叭
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5940001, ------真气丹(100)
					dwItemNum = 5,
					dwBindType = 1,
				},
			},
			EquipList =
			{
				{
					dwPropEnum = 125001,--1级绿色护腿 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 123001,--1级绿色腰带 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
		--		{
		--			dwPropEnum = 11000210,--2阶紫色强化+10武器 [[这里填的就是上面配的附加属性PropConfig序号]]--,
		--			dwBindType = 1,
		--		},
		----		{
		--			dwPropEnum = 145003004,--3阶紫色头饰 没强化 [[这里填的就是上面配的附加属性PropConfig序号]]--,
		--			dwBindType = 1,
		--		},
			},
		},

    ---20级新手礼包
	    {
			Level = 20,
			dwBindGold = 0,
			szDis = '1.20级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				--{
				--	dwItemEnum = 2400110,  ---双倍经验丹
				----	dwItemNum = 2,
				--	dwBindType = 1,
				--},
				{
					dwItemEnum = 2100020,----20级红药 止血散
					dwItemNum = 99,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2200020, ----20级蓝药 纳元散
					dwItemNum = 99,
					dwBindType = 1,
				},
				--{
				--	dwItemEnum = 5940002, ---真气丹(500)
				--	dwItemNum = 2,
				----	dwBindType = 1,
				--},
				{
					dwItemEnum = 5500020, ---扩展符
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405010, ----神龙果
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5920001, ---银两钱袋
					dwItemNum = 1,
					dwBindType = 1,
				},

			},
			EquipList =
			{
				{
					dwPropEnum = 110002,--2级绿色武器 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 122002,--2级绿色护手 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 5151005,--[[各职业技能书]]--,
					dwBindType = 1,
				},
			},
        },

    ---25级新手礼包
	    {
			Level = 25,
			dwBindGold = 0,
			szDis = '1.25级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 2500071, ---血池中
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500081,---蓝池中
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100010, ---千纸鹤
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500100, ---武尊断篇·初
					dwItemNum = 5,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5940003, ----1000真气丹
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500050, ----武尊残章
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5501132, ----三星变异怪召唤令
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{
				{
					dwPropEnum = 120002,--2级绿色衣服 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 121002,-- 2阶绿色鞋子 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},

			},
        },
	--30级新手礼包
	    {
			Level = 30,
			dwBindGold = 0,
			szDis = '1.30级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 2400110, ---双倍经验
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5920001, ---游戏币10W
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5500020, ---扩展符
					dwItemNum = 2,
					dwBindType = 1,
				},

				{
					dwItemEnum = 9405010,---神龙果
					dwItemNum = 5,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5940003, ----真气丹
					dwItemNum = 3,
					dwBindType = 1,
				},
					{
					dwItemEnum = 5602010, ----藏宝图（绿色）
					dwItemNum = 3,
					dwBindType = 1,
				},
			},
			EquipList =
			{
				{
					dwPropEnum = 125002,--2阶绿色护腿 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 123002,--2阶绿色腰带 [[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
        },
	--35级新手礼包
	    {
			Level = 35,
			dwBindGold = 0,
			szDis = '1.35级新手礼包，您可以领取到以下奖励',
			ItemList =
			{

				{
					dwItemEnum = 2500071,---血池中
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500081,----蓝池中
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 8100010,---情花果
					dwItemNum = 3,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405010,---神龙果
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500010,---冲灵丹
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5602020,----藏宝图（蓝色）
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5501132,----亮银沙
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500030,----闭关令牌
					dwItemNum = 2,
					dwBindType = 1,
				},

			},
			EquipList =
			{
				{
					dwPropEnum = 110003,--3阶绿色+5武器[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 12000304,--3阶紫色+0衣服[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
        },
	--40级新手礼包
	    {
			Level = 40,
			dwBindGold = 0,
			szDis = '1.40级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5600040,----藏宝图（紫色）
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100140, ----强化石
					dwItemNum = 15,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500090, ----洗点符
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5500020,---扩展符
					dwItemNum = 3,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405010, ----神龙果
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2400210, ----坐骑双倍经验丹
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 3900010, ----1级宝石精华
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5501133, ----四星变异怪召唤令
					dwItemNum = 1,
					dwBindType = 1,
				},				
				
			},
			EquipList =
			{
				{
					dwPropEnum = 143003,--3阶蓝色腰坠[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
        },
	--45级新手礼包
	    {
			Level = 45,
			dwBindGold = 0,
			szDis = '1.45级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 2400110, ---双倍经验
					dwItemNum = 3,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500071,----血池中
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500081,----蓝池中
					dwItemNum = 2,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5920002,----游戏币20W
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5940003,---5000真气丹
					dwItemNum = 5,
					dwBindType = 1,
				},

				{
					dwItemEnum = 3900020,---2级宝石
					dwItemNum = 3,
					dwBindType = 1,
				},
								{
					dwItemEnum = 4100080,---亮银砂*15
					dwItemNum = 15,
					dwBindType = 1,
				},


			},
			EquipList =
			{
				{
					dwPropEnum = 141003002,--3阶绿色戒指[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 145003002,--3阶绿色头饰[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
        },
	--50级新手礼包
	    {
			Level = 50,
			dwBindGold = 0,
			szDis = '1.50级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum =  4100140,---强化石
					dwItemNum = 20,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100410, ---古书注解
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500040, ---益元丹
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405010,---神龙果
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100120,---升阶玄铁
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5501133, ----4行变异怪召唤令
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500050,----武尊残章
					dwItemNum = 5,
					dwBindType = 1,
				},
			},
			EquipList =
			{
				{
					dwPropEnum = 171000304,--3阶蓝色缰绳[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
				{
					dwPropEnum = 4031002,--3阶绿色裤子[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},

			},
        },
	--55级新手礼包
	    {
			Level = 55,
			dwBindGold = 0,
			szDis = '1.55级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 2400120,----3倍经验
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5500080,----副本令
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5500020, ---扩展符
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5920002,----游戏币50W
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5940006,----1W真气丹
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 3900030, ----1级宝石精华
					dwItemNum = 3,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100080,----亮银砂
					dwItemNum = 20,
					dwBindType = 1,
				},


			},
			EquipList =
			{
				{
					dwPropEnum = 12200301,--3阶绿色披风[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},

				{
					dwPropEnum = 81446001,--3阶绿色披风[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
        },
	--60级新手礼包
	    {
			Level = 60,
			dwBindGold = 0,
			szDis = '1.60级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5600040,----藏宝图 紫色
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100140, ----强化石
					dwItemNum = 25,
					dwBindType = 1,
				},

				{
					dwItemEnum = 2500071,---血池中
					dwItemNum = 3,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500081,----蓝池中
					dwItemNum = 3,
					dwBindType = 1,
				},

				{
					dwItemEnum = 9405010,---神龙果
					dwItemNum = 20,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100010, ---千纸鹤
					dwItemNum = 20,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100110, ----剑气石
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5501133, ----4行变异怪召唤令
					dwItemNum = 1,
					dwBindType = 1,
				},

			},
			EquipList =
			{
				{
					dwPropEnum = 11000401,--4阶绿色武器[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
				},
			},
        },
	--65级新手礼包
	    {
			Level = 65,
			dwBindGold = 0,
			szDis = '1.65级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5940007,----真气丹*5W
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405010, ----神龙果*30
					dwItemNum = 30,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100410,---古书注解*10
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5501134,----五星侠客令*1
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5950001,---强化卷+10*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 3900060, ---6品宝石精华*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4902009, ----铜锄头*2
					dwItemNum = 2,
					dwBindType = 1,
				},	
				{
					dwItemEnum = 4902012, ----精炼锤*5
					dwItemNum = 5,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },
		
		
	---70级新手礼包
	    {
			Level = 70,
			dwBindGold = 0,
			szDis = '1.70级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5940007,----真气丹*5W
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500050, ----武尊残章*30
					dwItemNum = 30,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100110,---剑魂石*10
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100430,----易经丹*10
					dwItemNum = 10,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5500080,---副本令牌*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100421, ---一品金陵甲片*20
					dwItemNum = 20,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4902009, ----铜锄头*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100440, ----虎骨壮筋散*1
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },
		
	---75级新手礼包
	    {
			Level = 75,
			dwBindGold = 0,
			szDis = '1.75级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5940007,----真气丹*5W
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405010, ----神龙果*30
					dwItemNum = 30,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100130,---升阶玄晶*15
					dwItemNum = 15,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5501134,----五星侠客令*1
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 9405040,---坐骑丹属性*10
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5805001, ---威望丹小*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4902009, ----铜锄头*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100442, ----九转熊蛇丸*1
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },
	--80级新手礼包
	    {
			Level = 80,
			dwBindGold = 0,
			szDis = '1.80级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5940008,----真气丹*10W
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100110, ----剑魂石*30
					dwItemNum = 30,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100430,---易经经丹*15
					dwItemNum = 15,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500050,----武尊残章*15
					dwItemNum = 15,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5809260,---属性归一符*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100421, ---一品金陵甲片*50
					dwItemNum = 50,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4902009, ----铜锄头*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100446, ----檀木托*5
					dwItemNum = 5,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },

		--85级新手礼包
	    {
			Level = 85,
			dwBindGold = 0,
			szDis = '1.85级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5930004,----经验丹50万*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100170, ----悟道残卷*10
					dwItemNum = 10,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100450,---侠客秘传*10
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5809580,----风云声望丹·小*1
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5809367,---星灵*10
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4902008, ---银锄头
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },

		--90级新手礼包
	    {
			Level = 90,
			dwBindGold = 0,
			szDis = '1.90级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5930005,----经验丹100万*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405046, ----固甲丹*5
					dwItemNum = 5,
					dwBindType = 1,
				},

				{
					dwItemEnum = 9405047,---狂袭丹*5
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5809580,----风云声望丹·小*1
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5809368,---星轨*5
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4902008, ---银锄头*1
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },

		--95级新手礼包
	    {
			Level = 95,
			dwBindGold = 0,
			szDis = '1.95级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5930005,----经验丹100万*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405044, ----提神丹*10
					dwItemNum = 10,
					dwBindType = 1,
				},

				{
					dwItemEnum = 9405045,---聚力丹*5
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5809580,----风云声望丹·小*1
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4902012,---精铁锤*5
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4902008, ---银锄头*1
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },

		--100级新手礼包
	    {
			Level = 100,
			dwBindGold = 0,
			szDis = '1.100级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5930005,----经验丹100万*4
					dwItemNum = 4,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100445, ----缨穗*10
					dwItemNum = 10,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100447,---烙画图谱*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5809580,----风云声望丹·小*1
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100440,---虎骨壮筋散*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5920004, ---钱袋（100万）*1
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },

		--105级新手礼包
	    {
			Level = 105,
			dwBindGold = 0,
			szDis = '1.105级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5930005,----经验丹100万*4
					dwItemNum = 4,
					dwBindType = 1,
				},
				{
					dwItemEnum = 9405048, ----敏身丹*5
					dwItemNum = 5,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4100400,---云英之玉*5
					dwItemNum = 5,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5809580,----风云声望丹·小*2
					dwItemNum = 2,
					dwBindType = 1,
					
				},

				{
					dwItemEnum = 4100442,---九转熊蛇丸*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5920004, ---钱袋（100万）*2
					dwItemNum = 2,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },

			--110级新手礼包
	    {
			Level = 110,
			dwBindGold = 0,
			szDis = '1.110级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5930007,----经验丹（500万）*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100446, ----檀木托*5
					dwItemNum = 5,
					dwBindType = 1,
				},

				{
					dwItemEnum = 9405052,---坐骑转生丹*10
					dwItemNum = 10,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5809580,----风云声望丹·小*2
					dwItemNum = 2,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5809686,---紫卡礼包（随机一张）
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5920005, ---钱袋（500万）*1
					dwItemNum = 1,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },

				--115级新手礼包
	    {
			Level = 115,
			dwBindGold = 0,
			szDis = '1.115级新手礼包，您可以领取到以下奖励',
			ItemList =
			{
				{
					dwItemEnum = 5930006,----经验丹（500万）*2
					dwItemNum = 2,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5920006, ----钱袋（1000万）*1
					dwItemNum = 1,
					dwBindType = 1,
				},

				{
					dwItemEnum = 4902007,---金锄头*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 5809580,----风云声望丹·小*2
					dwItemNum = 2,
					dwBindType = 1,
				},

				{
					dwItemEnum = 5809687,---金卡礼包（随机一张）*1
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 4100448, ---蜂蜡*5
					dwItemNum = 5,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
        },
	},




---背包中奖励礼包
	OtherGift =
	{
----连斩礼包
			[6500220] = --这个ID是礼包物品的ID 100连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500230] = --这个ID是礼包物品的ID 200连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500240] = --这个ID是礼包物品的ID 300连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500250] = --这个ID是礼包物品的ID 400连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 4,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500260] = --这个ID是礼包物品的ID 500连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 15,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500270] = --这个ID是礼包物品的ID 600连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 6,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 15,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500280] = --这个ID是礼包物品的ID 700连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 7,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 20,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500290] = --这个ID是礼包物品的ID 800连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 20,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500300] = --这个ID是礼包物品的ID 900连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 9,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 30,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500310] = --这个ID是礼包物品的ID 1000连斩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 30,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500430] = --这个ID是礼包物品的ID 3阶坐骑礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500440] = --这个ID是礼包物品的ID 4阶坐骑礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500450] = --这个ID是礼包物品的ID 5阶坐骑礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},

			[6500000] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 4100140,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
            [6500010] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 4100120,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
            [6500020] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 4100060,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
            [6500030] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 4100040,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500040] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 4100130,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100210,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500050] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400160,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500060] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 2400310,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400260,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500070] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405020,
						dwItemNum = 10,
						dwBindType = 1,
					},
--[[				{
						dwItemEnum = 9405030,
						dwItemNum = 10,
						dwBindType = 1,
					},]]
				},
				EquipList =
				{

				},
			},
			[6500080] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 3100010,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3200010,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3300010,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3500010,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500090] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500100,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500100] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 2300180,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300190,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300200,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300210,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300220,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500110] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 2300110,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300120,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300130,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300140,
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2300150,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500120] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 2500170,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500130] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 4100010,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500140] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 5121001,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5121003,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5121004,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5121005,
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500150] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 5131001,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5131003,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5131004,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5131005,
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500160] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 5141003,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5141004,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5141005,
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500170] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 5151001,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5151003,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5151004,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5151005,
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500180] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 5113001,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5113002,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5113003,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5113004,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5113005,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5113006,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
					    dwItemEnum = 5113007,
					    dwItemNum = 1,
					    dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			[6500190] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 5112002,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5112003,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5112004,
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
			---特殊技能礼包
			[6500200] = --这个ID是礼包物品的ID
			{
				ItemList =
				{
					{
						dwItemEnum = 5111003,
						dwItemNum = 1,
						dwBindType = 1,
					},
					-- {
						-- dwItemEnum = 5111004,
						-- dwItemNum = 1,
						-- dwBindType = 1,
					-- },
					{
						dwItemEnum = 5111007,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5111008,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5111009,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5111011,
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5111012,
						dwItemNum = 1,
						dwBindType = 1,
					},
				    {
						dwItemEnum = 5113007,
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
				{

				},
			},
		[6500210] = --这个ID是礼包物品的ID
			{
				ItemList =
				{


				},
				EquipList =
				{
					{
					dwPropEnum = 110001,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 110002,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 110003,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 120001,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 120002,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 120003,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 121001,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 121002,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 121003,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 122001,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 122002,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
					{
					dwPropEnum = 122003,--[[这里填的就是上面配的附加属性PropConfig序号]]--,
					dwBindType = 1,
					},
				},
			},
--------------------------------首充补偿礼包
			[6500998] = --这个ID是礼包物品的ID   首充礼包·斩
			{
				ItemList =
				{
					{
						dwItemEnum = 2500011,---幻灵丹
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940008,---真气丹10万
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920004, ---银两100万
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, ---三倍经验丹
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500030, ---闭关要诀
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
						{
							dwPropEnum = 11000211,--20级紫色+10武器 [[这里填的就是上面配的附加属性PropConfig序号]]--,
							dwBindType = 1,
						},

					},
			},
			[6500999] = --这个ID是礼包物品的ID   回归大礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500030,  ---闭关要诀
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020,---扩展符
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071,---血池中
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081, ---蓝池中
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
						{
							dwPropEnum = 11000210,--20级紫色+10武器 [[这里填的就是上面配的附加属性PropConfig序号]]--,
							dwBindType = 1,
						},
						{
							dwPropEnum = 145003004,--2级绿色护手 [[这里填的就是上面配的附加属性PropConfig序号]]--,
							dwBindType = 1,
						},
					},
			},			

---------------------------以下是运营相关礼包
			[6500510] = --这个ID是礼包物品的ID   回归大礼包
			{
				NoticeText ="恭喜大侠%s,领取价值2888元宝回归大礼包",
				NoticeChat ="恭喜大侠%s,领取价值2888元宝回归大礼包",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 3900010, ---宝石精华1级
						dwItemNum = 500,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5910003,---礼金盒
						dwItemNum = 30,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 50,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6500500] = --这个ID是礼包物品的ID   新手卡礼包
			{
				NoticeText ="恭喜大侠%s,领取价值1188元宝新手卡礼包",
				NoticeChat ="恭喜大侠%s,领取价值1188元宝新手卡礼包",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5910003,---礼金盒
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, ---千纸鹤
						dwItemNum = 20,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 20,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300180] = --这个ID是礼包物品的ID   武林至尊礼包
			{
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100140, ----强化石
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5910006,----5000礼金
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300170] = --这个ID是礼包物品的ID   手机认证礼包
			{
				NoticeText ="恭喜大侠%s,领取价值888礼金手机认证礼包",
				NoticeChat ="恭喜大侠%s,领取价值888礼金手机认证礼包",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 5500010, ---喇叭
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, ----扩展符
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010,---千纸鹤
						dwItemNum = 8,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300190] = --这个ID是礼包物品的ID   Q群礼包
			{
				NoticeText ="恭喜大侠%s,领取价值400礼金Q群礼包",
				NoticeChat ="恭喜大侠%s,领取价值400礼金Q群礼包",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 2400210, ---坐骑双倍经验丹
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500030,---恩仇令
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300200] = --这个ID是礼包物品的ID   封测大礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>封测大礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>封测大礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500010, ---喇叭
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500090, ----洗点符
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300210] = --这个ID是礼包物品的ID   横扫天下17173直通卡
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>横扫天下17173直通卡礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>横扫天下17173直通卡礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500010, ---喇叭
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100140, ----强化石
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500680,---技能残卷礼包
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500710,---银两1717300
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300220] = --这个ID是礼包物品的ID   横扫天下17173特权卡
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>横扫天下17173特权卡礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>横扫天下17173特权卡礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{
						dwItemEnum = 5500730,  ---17173专属称号卡
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500700, ---17173专属特效卡
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400110,  ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500010, ---喇叭
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100140, ----强化石
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500680,---技能残卷礼包
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500720,---礼金666
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500710,---银两1717300
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300230] = --这个ID是礼包物品的ID   老玩家回归礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500020, ----扩展符
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, ---千纸鹤
						dwItemNum = 8,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300240] = --这个ID是礼包物品的ID   QQ群回归礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900010, ----1级宝石精华
						dwItemNum = 30,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500030, ---闭关要诀
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300250] = --这个ID是礼包物品的ID   《横扫天下》活动礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500020, ----扩展符
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5910003,---礼金100
						dwItemNum = 4,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6500530] = --这个ID是礼包物品的ID   充值礼包A
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, ---千纸鹤
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920002, ---10W银两
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6500540] = --这个ID是礼包物品的ID   充值礼包B
			{
				ItemList =
				{
					{
						dwItemEnum = 4100140, ----强化石
						dwItemNum = 9,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, ---千纸鹤
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920002, ---10W银两
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6500550] = --这个ID是礼包物品的ID   家主礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500610, ----礼金8888
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5600040,----藏宝图 紫色
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400010, ---药王针·疾
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3900010, ----1级宝石精华
						dwItemNum = 40,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920003, ----50W银两
						dwItemNum = 4,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 4,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6500560] = --这个ID是礼包物品的ID   世家成员礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5602020,----藏宝图（蓝色）
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400000, ---药王针·御
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3900010, ----1级宝石精华
						dwItemNum = 20,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920003, ----50W银两
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6500570] = --这个ID是礼包物品的ID   包月vip礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500040,----新秀帖
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, ----扩展符
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6500580] = --这个ID是礼包物品的ID   季度VIP礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500050,----名宿帖
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405010,---神龙果
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100080, ----亮银砂
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5910005, ----礼金1000
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6500590] = --这个ID是礼包物品的ID   半年VIP礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100290, ----剑气石
						dwItemNum = 30,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500100,---武尊断篇·初
						dwItemNum = 15,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500101, ----武尊断篇·成
						dwItemNum = 15,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500060, ----英雄帖
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6500600, ----江湖武学
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300320] = --这个ID是礼包物品的ID   黄金补偿礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 4,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 4,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300330] = --这个ID是礼包物品的ID   钻石补偿礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400260, ---1阶演武收益丹
						dwItemNum = 4,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300340] = --这个ID是礼包物品的ID   至尊补偿礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, ---双倍经验丹
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500030, ---闭关要诀
						dwItemNum = 4,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400260, ---1阶演武收益丹
						dwItemNum = 4,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
--------------------------------------------------------------------------
---------------------------------------------------------------------------
			[6300370] = --双倍经验丹小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},

			[6300371] = --双倍经验丹中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300372] = --双倍经验丹大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300373] = --三倍经验丹小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400120,
						dwItemNum = 5,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300374] = --三倍经验丹中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400120,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300375] = --三倍经验丹大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400120,
						dwItemNum = 20,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300376] = --九花玉露丸·中小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300377] = --九花玉露丸·中中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300378] = --九花玉露丸·中大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},

			[6300379] = --元气通神酒·中小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500081,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300380] = --元气通神酒·中中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500081,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300381] = --元气通神酒·中大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500081,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300382] = --1阶演武收益丹小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400260,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300383] = --1阶演武收益丹中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400260,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300384] = --1阶演武收益丹大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400260,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300385] = --坐骑双倍经验丹小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400210,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300386] = --坐骑双倍经验丹中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400210,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300387] = --坐骑双倍经验丹大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400210,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300388] = --千里传音小包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500010,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300389] = --千里传音中包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500010,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300390] = --千里传音大包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500010,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300391] = --扩展券小包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500020,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300392] = --扩展券中包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500020,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300393] = --扩展券大包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500020,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300394] = --恩仇令小包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500030,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300395] = --恩仇令中包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500030,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300396] = --恩仇令大包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500030,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300397] = --千纸鹤小包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100010,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300398] = --千纸鹤中包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100010,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300399] = --千纸鹤大包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100010,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300400] = --闭关要诀小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500030,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300401] = --闭关要诀中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500030,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300402] = --闭关要诀大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500030,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300403] = --药王针·御小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400000,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300404] = --药王针·御中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400000,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300405] = --药王针·御大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400000,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300406] = --药王针·疾小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400010,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300407] = --药王针·疾中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400010,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300408] = --药王针·疾大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400010,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300409] = --副本令·通用小包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500080,
						dwItemNum = 5,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300410] = --副本令·通用中包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500080,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300411] = --副本令·通用大包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500080,
						dwItemNum = 20,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300412] = --洗点符小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500090,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300413] = --洗点符中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500090,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300414] = --洗点符大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500090,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300415] = --神龙果小包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300416] = --神龙果中包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300417] = --神龙果大包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300418] = --强化石小包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100140,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300419] = --强化石中包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100140,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300420] = --强化石大包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100140,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300421] = --武尊残章小包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300422] = --武尊残章中包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300423] = --武尊残章大包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300424] = --亮银砂小包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100080,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300425] = --亮银砂中包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100080,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300426] = --亮银砂大包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100080,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300427] = --剑魂石小包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100110,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300428] = --剑魂石中包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100110,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300429] = --剑魂石大包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100110,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300430] = --1品宝石精华小包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900010,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300431] = --1品宝石精华小包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900010,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300432] = --1品宝石精华小包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900010,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300433] = --升阶玄铁小包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100120,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300434] = --升阶玄铁中包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100120,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300435] = --升阶玄铁大包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100120,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300436] = --升阶玄晶小包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100130,
						dwItemNum = 10,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300437] = --升阶玄晶中包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100130,
						dwItemNum = 50,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},
			[6300438] = --升阶玄晶大包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100130,
						dwItemNum = 100,
						dwBindType = 0,
					},
				},
				EquipList =
					{
					},
			},

			[6300439] = --九花玉露丸特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300440] = --神龙果特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300441] = --1品宝石特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900010,
						dwItemNum = 50,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300442] = --千纸鹤特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100010,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300443] = --剑魂石特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100110,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300444] = --强化石特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100140,
						dwItemNum = 20,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300445] = --升阶玄晶特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100130,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300446] = --亮银砂特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100080,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300447] = --武尊残章特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300448] = --扩展特惠包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500020,
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
--------------------------------5D运营礼包---------------------------------------------------------------------------------
			[6307001] = --笑天下礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>笑天下礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>笑天下礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---蓝池中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,
					},
					{---洗点符
						dwItemEnum = 2500090,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},


			[6307002] = --07073精英礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>07073精英礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>07073精英礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---蓝池中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},


			[6307003] = --07073豪杰礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>07073豪杰礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>07073豪杰礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---扩展符
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6307004] = --07073英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>07073英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>07073英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---07073媒体专属称号
						dwItemEnum = 5500740,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},
					{ ---1品宝石精华*20
						dwItemEnum = 3900010,dwItemNum = 20,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},


			[6307005] = --265G精英礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>265G精英礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>265G精英礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---1品宝石精华*50
						dwItemEnum = 3900010,dwItemNum = 50,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307006] = --265G豪杰礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>265G豪杰礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>265G豪杰礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 10,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307007] = --265G英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>265G英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>265G英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---265G媒体专属称号
						dwItemEnum = 5500750,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 10,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010, dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},


			[6307008] = --多玩“霸刀”礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“霸刀”礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“霸刀”礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---多玩媒体专属称号
						dwItemEnum = 5500760,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍坐骑丹
						dwItemEnum = 2400210,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 10,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6307009] = --多玩“名剑”礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“名剑”礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“名剑”礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---多玩媒体专属称号
						dwItemEnum = 5500760,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,
					},
					{ ---1品宝石精华*100
						dwItemEnum = 3900010,dwItemNum = 100,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6307010] = --多玩“神枪”礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“神枪”礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“神枪”礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---多玩媒体专属称号
						dwItemEnum = 5500760,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展符
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307011] = --多玩“帝镰”礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“帝镰”礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>多玩“帝镰”礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---多玩媒体专属称号
						dwItemEnum = 5500760,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 10,dwBindType = 1,
					},
					{ ---演武丹
						dwItemEnum = 2400260,dwItemNum = 3,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 10,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307012] = --17173英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>17173英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>17173英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·小
						dwItemEnum = 2500070,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·小
						dwItemEnum = 2500080,dwItemNum = 3,dwBindType = 1,
					},
					{ ---演武丹
						dwItemEnum = 2400260,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---1品宝石精华*100
						dwItemEnum = 3900010,dwItemNum = 100,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307013] = --Cwan英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>Cwan英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>Cwan英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
				    { ---Cwan专属称号卡
						dwItemEnum = 5500790,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 10,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6307014] = --腾讯英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>腾讯英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>腾讯英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---腾讯媒体专属称号
						dwItemEnum = 5500770,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---双倍坐骑丹
						dwItemEnum = 2400210,dwItemNum = 5,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 1,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307015] = --页游网英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>页游网英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>页游网英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{

					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307016] = --网易英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>网易英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>网易英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展符
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307017] = --新浪英雄礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>新浪英雄礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>新浪英雄礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---新浪媒体专属称号
						dwItemEnum = 5500780,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 15,dwBindType = 1,
					},
					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---1品宝石精华*20
						dwItemEnum = 3900010,dwItemNum = 20,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307018] = --横扫天下17173特权卡
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>横扫天下17173特权卡</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>横扫天下17173特权卡</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---17173专属称号
						dwItemEnum = 5500730,dwItemNum = 1,dwBindType = 1,
					},
					{ ---17173专属人物特效
						dwItemEnum = 5500700,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 10,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},


			[6307019] = --武林宝箱
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---礼金100*3
						dwItemEnum = 5910003,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307020] = --横扫天下《横扫天下》新手卡
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---血池中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---蓝池中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307021] = --手机认证礼包
			{
				NoticeText ="恭喜大侠%s,领取了<font color='#4daeed'>手机认证礼包</font>",
				NoticeChat ="恭喜大侠%s,领取了<font color='#4daeed'>手机认证礼包</font>",
				NoticeTry = "我要领奖",
				NoticeFun = function() CUIGetReword:DoOpen("UIDailyCode") end;
				ItemList =
				{
					{ ---1阶演武收益丹
						dwItemEnum = 2400260,dwItemNum = 3,dwBindType = 1,
					},
					{ ---喇叭
						dwItemEnum = 5500010,dwItemNum = 4,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

		    [6307022] = --骨灰级老用户礼包
			{
				ItemList =
				{

					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 8,dwBindType = 1,
					},
					{ ---武尊残章
						dwItemEnum = 2500050,dwItemNum = 6,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 8,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---副本通用令*1
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
					{ ---扩展卷
						dwItemEnum = 5500020,dwItemNum = 5,dwBindType = 1,
					},
					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 10,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			 [6307023] = --资深级老用户礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 4,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 4,dwBindType = 1,
					},
					{ ---副本通用令*1
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
 					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 6,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 8,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---扩展卷
						dwItemEnum = 5500020,dwItemNum = 6,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307024] = --精英级老用户礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
 					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 4,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---扩展卷
						dwItemEnum = 5500020,dwItemNum = 4,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307025] = --黄金补偿礼包
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---血池中
						dwItemEnum = 2500071, dwItemNum = 4,dwBindType = 1,
					},
					{ ---蓝池中
						dwItemEnum = 2500081,dwItemNum = 4,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307026] = --  钻石补偿礼包
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---1阶演武收益丹
						dwItemEnum = 2400260,dwItemNum = 4,dwBindType = 1,
					},
					{ ---血池中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---蓝池中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6307027] = --  至尊补偿礼包
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110, dwItemNum = 2,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 4,dwBindType = 1,
					},
					{ ---1阶演武收益丹
						dwItemEnum = 2400260,dwItemNum = 4,dwBindType = 1,
					},
					{ ---血池中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---蓝池中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6307028] = --  幸运礼包
			{
				ItemList =
				{
					{ ---彩戏绣包
						dwItemEnum = 5500070,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},


			[6307029] = --  超级贵宾礼包
			{
				ItemList =
				{
					{ ---神龙果
						dwItemEnum = 9405010,dwItemNum = 30,dwBindType = 1,
					},
					{ ---扩展券
						dwItemEnum = 5500020,dwItemNum = 20,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 20,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 5,dwBindType = 1,
					},
					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 20,dwBindType = 1,
					},
					{ ---副本通用令
						dwItemEnum = 5500080,dwItemNum = 2,dwBindType = 1,
					},
					{ ---1品宝石精华 300个
						dwItemEnum = 3900010,dwItemNum = 300,dwBindType = 1,
					},
					{  ---新秀贴
						dwItemEnum = 5500040,dwItemNum = 1,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			[6307030] = --  钻石贵宾礼包
			{
				ItemList =
				{
					{  ---神龙果
						dwItemEnum = 9405010,dwItemNum = 15,dwBindType = 1,
					},
					{ ---亮银沙
						dwItemEnum = 4100080,dwItemNum = 10,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 20,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 5,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 15,dwBindType = 1,
					},
					{ ---副本通用令
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
		    [6307031] = --  高级贵宾礼包
			{
				ItemList =
				{
					{ ---双倍经验
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---神龙果
						dwItemEnum = 9405010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---扩展券
						dwItemEnum = 5500020,dwItemNum = 8,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			 [6307031] = --  高级贵宾礼包
			{
				ItemList =
				{
					{ ---双倍经验
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---神龙果
						dwItemEnum = 9405010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---扩展券
						dwItemEnum = 5500020,dwItemNum = 8,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			 [6307032] = --  感恩贵宾礼包
			{
				ItemList =
				{
					{ ---双倍经验
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---扩展券
						dwItemEnum = 5500020,dwItemNum = 4,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 4,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 4,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 4,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			[6307034] = --  07073英雄笑礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
			[6307035] = --  07073英雄笑礼包
			{
				ItemList =
				{
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---扩展券
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
			[6307036] = --  07073江山笑礼包
			{
				ItemList =
				{
					{ ---07073专属称号卡
						dwItemEnum = 5500740,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 20,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
			[6307037] = --  265G红颜笑礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 50,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
			[6307038] = --  265G英雄笑礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 10,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
		    [6307039] = --  265G江山笑礼包
			{
				ItemList =
				{
					{ ---265G专属称号卡
						dwItemEnum = 5500750,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 10,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6307040] = --  多玩倾城礼包
			{
				ItemList =
				{
					{ ---多玩专属称号卡
						dwItemEnum = 5500760,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---亮银砂
						dwItemEnum = 4100080,dwItemNum = 10,dwBindType = 1,
					},
					{ ---1阶演武收益丹
						dwItemEnum = 2400260,dwItemNum = 3,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 10,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307041] = --  17173倾城礼包
			{
				ItemList =
				{
					{ ---17173专属称号卡
						dwItemEnum = 5500730,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·小
						dwItemEnum = 2500070,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·小
						dwItemEnum = 2500080,dwItemNum = 3,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 100,dwBindType = 1,
					},
					{ ---1阶演武收益丹
						dwItemEnum = 2400260,dwItemNum = 3,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6307042] = --  C玩倾城礼包
			{
				ItemList =
				{
					{ ---Cwan专属称号卡
						dwItemEnum = 5500790,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---亮银砂
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 10,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307043] = --  腾讯倾城礼包
			{
				ItemList =
				{
					{ ---腾讯专属称号卡
						dwItemEnum = 5500770,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---坐骑双倍经验丹
						dwItemEnum = 2400210,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307044] = --  页游网倾城礼包
			{
				ItemList =
				{
					{ ---页游网专属称号卡
						dwItemEnum = 5500800,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---升阶玄铁
						dwItemEnum = 4100120,dwItemNum = 2,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 5,dwBindType = 1,
					},
					{ ---坐骑双倍经验丹
						dwItemEnum = 2400210,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---礼金券(100礼金)*3
						dwItemEnum = 5910003,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307045] = --  新浪倾城礼包
			{
				ItemList =
				{
					{ ---新浪专属称号卡
						dwItemEnum = 5500780,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 20,dwBindType = 1,
					},
					{ ---恩仇令
						dwItemEnum = 5500030,dwItemNum = 15,dwBindType = 1,
					},
					{ ---亮银砂
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 10,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			
		   [6307046] = --  倾城礼包
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 8,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 8,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307047] = --  红颜笑礼包
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---剑气石
						dwItemEnum = 4100290,dwItemNum = 20,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 50,dwBindType = 1,
					},
					{ ---礼金袋(1000礼金)
						dwItemEnum = 5910005,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307048] = --  英雄笑礼包
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---副本令·通用
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
					{ ---剑气石
						dwItemEnum = 4100290,dwItemNum = 50,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 100,dwBindType = 1,
					},
					{ ---礼金*3000
						dwItemEnum = 5910005,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307049] = --  君王笑礼包
			{
				ItemList =
				{
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 10,dwBindType = 1,
					},
					{ ---副本令·通用
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
					{ ---剑气石
						dwItemEnum = 4100290,dwItemNum = 100,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 200,dwBindType = 1,
					},
					{ ---礼金*5000
						dwItemEnum = 5910005,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
						[6307050] = --  礼金袋(888礼金)
			{
				ItemList =
				{
					{ 
						dwItemEnum = 5919002,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
						[6307051] = --  礼金袋(1888礼金)
			{
				ItemList =
				{
					{ 
						dwItemEnum = 5919003,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6307052] = --  我顶网贵宾礼包
			{
				ItemList =
				{
					{ ---我顶网贵宾称号卡
						dwItemEnum = 5500705,dwItemNum = 1,dwBindType = 1,
					},
					{ ---钻石宝箱
						dwItemEnum = 5501110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---江湖威望丹·小
						dwItemEnum = 5805001,dwItemNum = 2,dwBindType = 1,
					},
					{ ---三倍经验丹
						dwItemEnum = 2400120,dwItemNum = 2,dwBindType = 1,
					},
					{ ---钱袋(100万)
						dwItemEnum = 5920004,dwItemNum = 5,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 5,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 10,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 20,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 100,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			[6307053] = --  我顶网VIP礼包
			{
				ItemList =
				{
					{ ---我顶网VIP称号卡
						dwItemEnum = 5500706,dwItemNum = 1,dwBindType = 1,
					},
					{ ---我顶网VIP特效卡
						dwItemEnum = 5500704,dwItemNum = 1,dwBindType = 1,
					},
					{ ---等级飞跃包
						dwItemEnum = 5809252,dwItemNum = 1,dwBindType = 1,
					},
					{ ---五倍经验丹
						dwItemEnum = 2400130,dwItemNum = 1,dwBindType = 1,
					},
					{ ---强化卷轴包
						dwItemEnum = 5809267,dwItemNum = 1,dwBindType = 1,
					},
					{ ---三倍经验丹
						dwItemEnum = 2400120,dwItemNum = 2,dwBindType = 1,
					},
					{ ---钱袋(500万)
						dwItemEnum = 5920005,dwItemNum = 2,dwBindType = 1,
					},
					{ ---江湖威望丹·小
						dwItemEnum = 5805001,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·大
						dwItemEnum = 2500072,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·大
						dwItemEnum = 2500082,dwItemNum = 2,dwBindType = 1,
					},
					{ ---变异怪召唤令
						dwItemEnum = 5501135,dwItemNum = 5,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
			[6307054] = -- 《横扫天下》贵宾礼包
			{
				ItemList =
				{
					{ ---洪武尊者称号卡
						dwItemEnum = 5500850,dwItemNum = 1,dwBindType = 1,
					},
					{ ---洪武尊者特效卡
						dwItemEnum = 5500707,dwItemNum = 1,dwBindType = 1,
					},
					{ ---60级紫色装备箱
						dwItemEnum = 5500670,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·大
						dwItemEnum = 2500072,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·大
						dwItemEnum = 2500082,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307055] = -- 高富帅礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·大
						dwItemEnum = 2500072,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·大
						dwItemEnum = 2500082,dwItemNum = 5,dwBindType = 1,
					},
					{ ---礼金袋(1888礼金)
						dwItemEnum = 5919003,dwItemNum = 1,dwBindType = 1,
					},
					{ ---钱袋(500万)
						dwItemEnum = 5920005,dwItemNum = 1,dwBindType = 1,
					},
					{ ---月光宝盒
						dwItemEnum = 2500320,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6307056] = -- 高帅富礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·大
						dwItemEnum = 2500072,dwItemNum = 10,dwBindType = 1,
					},
					{ ---元气通神酒·大
						dwItemEnum = 2500082,dwItemNum = 10,dwBindType = 1,
					},
					{ ---礼金袋(1888礼金)
						dwItemEnum = 5919003,dwItemNum = 1,dwBindType = 1,
					},
					{ ---钱袋(500万)
						dwItemEnum = 5920005,dwItemNum = 1,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---月光宝盒
						dwItemEnum = 2500320,dwItemNum = 5,dwBindType = 1,
					},
					{ ---老玩家回归称号卡
						dwItemEnum = 5500897,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307057] = -- 土豪礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·大
						dwItemEnum = 2500072,dwItemNum = 20,dwBindType = 1,
					},
					{ ---元气通神酒·大
						dwItemEnum = 2500082,dwItemNum = 20,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 10,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---老玩家回归称号卡
						dwItemEnum = 5500897,dwItemNum = 1,dwBindType = 1,
					},
					{ ---完美属性卷轴
						dwItemEnum = 5950030,dwItemNum = 5,dwBindType = 1,
					},
					{ ---五星变异怪召唤令
						dwItemEnum = 5501134,dwItemNum = 5,dwBindType = 1,
					},
					{ ---金锄头
						dwItemEnum = 4902007,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307058] = -- 至尊大礼
			{
				ItemList =
				{
					{ ---九花玉露丸·练气
						dwItemEnum = 2500073,dwItemNum = 10,dwBindType = 1,
					},
					{ ---元气通神酒·化神
						dwItemEnum = 2500083,dwItemNum = 10,dwBindType = 1,
					},
					{ ---月光宝盒
						dwItemEnum = 2500320,dwItemNum = 5,dwBindType = 1,
					},
					{ ---强化经验丹
						dwItemEnum = 2500310,dwItemNum = 20,dwBindType = 1,
					},
					{ ---真气丹(1万)
						dwItemEnum = 5940006,dwItemNum = 10,dwBindType = 1,
					},
					{ ---老玩家回归称号卡
						dwItemEnum = 5500897,dwItemNum = 1,dwBindType = 1,
					},
					{ ---神威属性卷轴
						dwItemEnum = 5950034,dwItemNum = 5,dwBindType = 1,
					},
					{ ---金锄头
						dwItemEnum = 4902007,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
						[6307059] = -- 义薄云天礼包
			{
				ItemList =
				{
					{ ---升阶玄铁×8
						dwItemEnum = 4100120,dwItemNum = 8,dwBindType = 1,
					},
					{ ---武尊残章×6
						dwItemEnum = 2500050,dwItemNum = 6,dwBindType = 1,
					},
					{ ---千纸鹤×8
						dwItemEnum = 4100010,dwItemNum = 8,dwBindType = 1,
					},
					{ ---闭关要诀×2
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---副本令·通用×1
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
					{ ---扩展劵×5
						dwItemEnum = 5500020,dwItemNum = 5,dwBindType = 1,
					},
					{ ---亮银砂×10
						dwItemEnum = 4100080,dwItemNum = 10,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6307060] = -- 265G至尊宝箱
			{
				ItemList =
				{
					{ ---265G专属称号卡×1
						dwItemEnum = 5500750,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
						[6307061] = -- 265G极致宝箱
			{
				ItemList =
				{
					{ ---265G专属称号卡×1
						dwItemEnum = 5500750,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×6
						dwItemEnum = 2500071,dwItemNum = 6,dwBindType = 1,
					},
					{ ---元气通神酒·中×6
						dwItemEnum = 2500081,dwItemNum = 6,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×4
						dwItemEnum = 2400110,dwItemNum = 4,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307062] = -- 页游网至尊宝箱
			{
				ItemList =
				{
					{ ---页游网专属称号卡×1
						dwItemEnum = 5500800,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
						[6307063] = -- 52PK至尊宝箱
			{
				ItemList =
				{
					{ ---52PK专属称号卡×1
						dwItemEnum = 5500791,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307064] = -- 07073至尊宝箱
			{
				ItemList =
				{
					{ ---07073专属称号卡
						dwItemEnum = 5500740,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
						[6307065] = -- 07073极致宝箱
			{
				ItemList =
				{
					{ ---07073专属称号卡
						dwItemEnum = 5500740,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 4,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 4,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6307066] = -- 07073无上宝箱
			{
				ItemList =
				{
					{ ---07073专属称号卡
						dwItemEnum = 5500740,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×6
						dwItemEnum = 2500071,dwItemNum = 6,dwBindType = 1,
					},
					{ ---元气通神酒·中×6
						dwItemEnum = 2500081,dwItemNum = 6,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×10
						dwItemEnum = 4100140,dwItemNum = 10,dwBindType = 1,
					},
					{ ---双倍经验丹×4
						dwItemEnum = 2400110,dwItemNum = 4,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
						[6307067] = -- Cwan至尊宝箱
			{
				ItemList =
				{
					{ ---Cwan专属称号卡
						dwItemEnum = 5500790,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×6
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符×8
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
						[6307068] = -- 客服感恩礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5920007,		--钱袋(5000万)*2
						dwItemNum = 2,
						dwBindType = 1,
					},    
					{
						dwItemEnum = 5949003,		--真气丹(188888)*10
						dwItemNum = 10,
						dwBindType = 1,
					},    
					{
						dwItemEnum = 2400140,		--十倍经验丹*3
						dwItemNum = 3,
						dwBindType = 1,
					},    
					{
						dwItemEnum = 4900109,		--小金砖*20
						dwItemNum = 20,
						dwBindType = 1,
					},    
					{
						dwItemEnum = 4900170,		--龙纹玉*10
						dwItemNum = 10,
						dwBindType = 1,
					},  
					{
						dwItemEnum = 9405041,		--无极仙元丹·灵*10	
						dwItemNum = 10,
						dwBindType = 1,
					},   		
				},
				EquipList =
					{
					},
			},			
--------------------------------------------------------百度运营礼包-----------------------------------------------------------------

             [6308002] = --《问剑》删档测试精英礼包
			{
				ItemList =
				{
					{ ---神龙果
						dwItemEnum = 9405010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---副本令·通用×1
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308003] = --《问剑》官网新手卡
			{
				ItemList =
				{
					{ ---彩戏绣包
						dwItemEnum = 5500070,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·小
						dwItemEnum = 2500070,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·小
						dwItemEnum = 2500080,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308004] = --《问剑》媒体新手卡
			{
				ItemList =
				{
					{ ---彩戏绣包
						dwItemEnum = 5500070,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

 			[6308005] = --《问剑》帝王礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308006] = --《问剑》绝学宗师特权礼包
			{
				ItemList =
				{
					{ ---益元丹
						dwItemEnum = 2500040,dwItemNum = 5,dwBindType = 1,
					},
					{ ---武尊断篇·初
						dwItemEnum = 2500100,dwItemNum = 3,dwBindType = 1,
					},
					{ ---武尊断篇·成
						dwItemEnum = 2500101,dwItemNum = 2,dwBindType = 1,
					},
					{ ---页游网专属称号卡
						dwItemEnum = 5500800,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308007] = --《问剑》武林宗师特权礼包
			{
				ItemList =
				{
					{ ---益元丹
						dwItemEnum = 2500040,dwItemNum = 5,dwBindType = 1,
					},
					{ ---武尊断篇·初
						dwItemEnum = 2500100,dwItemNum = 3,dwBindType = 1,
					},
					{ ---武尊断篇·成
						dwItemEnum = 2500101,dwItemNum = 2,dwBindType = 1,
					},
					{ ---07073专属称号卡×1
						dwItemEnum = 5500740,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

		    [6308008] = --《问剑》正邪宗师特权礼包
			{
				ItemList =
				{
					{ ---益元丹
						dwItemEnum = 2500040,dwItemNum = 5,dwBindType = 1,
					},
					{ ---武尊断篇·初
						dwItemEnum = 2500100,dwItemNum = 3,dwBindType = 1,
					},
					{ ---武尊断篇·成
						dwItemEnum = 2500101,dwItemNum = 2,dwBindType = 1,
					},
					{ ---265G专属称号卡
						dwItemEnum = 5500750,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

		    [6308011] = --《问剑》888礼金大礼包
			{
				ItemList =
				{
					{ ---礼金券(888礼金)
						dwItemEnum = 5919002,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308012] = --《问剑》2000礼金大礼包
			{
				ItemList =
				{
					{ ---礼金袋1000礼金)
						dwItemEnum = 5910005,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

		    [6308013] = --《问剑》皇冠大礼包
			{
				ItemList =
				{
					{ ---真气丹1万
						dwItemEnum = 5940006,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308014] = --100万游戏币礼包
			{
				ItemList =
				{
					{ ---100万游戏币礼包
						dwItemEnum = 5920004,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308015] = --1000礼金大礼包
			{
				ItemList =
				{
					{ ---礼金袋1000礼金
						dwItemEnum = 5910005,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308016] = --1000万游戏币礼包
			{
				ItemList =
				{
					{ ---1000万游戏币礼包
						dwItemEnum = 5920006,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6308017] = --5000万游戏币礼包
			{
				ItemList =
				{
					{ ---5000万游戏币礼包
						dwItemEnum = 5920007,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308018] = --武林达人礼包
			{
				ItemList =
				{
					{ ---剑魂石
						dwItemEnum = 4100110,dwItemNum = 10,dwBindType = 1,
					},
					{ ---神龙果
						dwItemEnum = 9405010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---升阶玄晶
						dwItemEnum = 4100130,dwItemNum = 10,dwBindType = 1,
					},
					{ ---武尊残章
						dwItemEnum = 2500050,dwItemNum = 10,dwBindType = 1,
					},
					{ ---1W真气丹
						dwItemEnum = 5940006,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308019] = --《问剑》黄金特权礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 15,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308020] = --《问剑》水晶特权礼包
			{
				ItemList =
				{
					{ ---武尊残章
						dwItemEnum = 2500050,dwItemNum = 2,dwBindType = 1,
					},
					{ ---扩展券
						dwItemEnum = 5500020,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308021] = --《问剑》钻石特权礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308022] = --《问剑》百度视频特权礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---1品宝石精华
						dwItemEnum = 3900010,dwItemNum = 15,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308023] = --《问剑》一游网活动礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---药王针·御
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·疾
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308024] = --《问剑》265G七夕活动礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308025] = --实战礼包
			{
				ItemList =
				{
					{ ---武尊残章×5
						dwItemEnum = 2500050,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308026] = --经脉礼包
			{
				ItemList =
				{
					{ ---真气丹(1000)×20
						dwItemEnum = 5940003,dwItemNum = 20,dwBindType = 1,
					},
					{ ---益元丹×3
						dwItemEnum = 2500040,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308027] = --名剑礼包
			{
				ItemList =
				{
					{ ---剑气石×10
						dwItemEnum = 4100290,dwItemNum = 10,dwBindType = 1,
					},
					{ ---剑魂石×5
						dwItemEnum = 4100110,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308028] = --保甲礼包
			{
				ItemList =
				{
					{ ---精铁锭×10
						dwItemEnum = 4100210,dwItemNum = 10,dwBindType = 1,
					},
					{ ---升阶玄晶×5
						dwItemEnum = 4100130,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308029] = --装备礼包
			{
				ItemList =
				{
					{ ---棋魂×5
						dwItemEnum = 4901000,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308030] = --藏宝图礼包
			{
				ItemList =
				{
					{ ---珍奇藏宝图×5
						dwItemEnum = 5601030,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308031] = --年少有为
			{
				ItemList =
				{
					{ ---年少有为称号卡×1
						dwItemEnum = 5500860,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308032] = --阿兰专属礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---阿兰家族称号卡×1
						dwItemEnum = 5500870,dwItemNum = 1,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千里传音
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308033] = --《问剑》豪杰礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308034] = --《问剑》猛将礼包
			{
				ItemList =
				{
					{ --药王针·御*3
						dwItemEnum = 2400000,dwItemNum = 3,dwBindType = 1,
					},
					{ --药王针·疾*3
						dwItemEnum = 2400010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石×3
						dwItemEnum = 4100140,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6308035] = --生日礼包
			{
				ItemList =
				{
					{ ---生日称号卡
						dwItemEnum = 5500880,dwItemNum = 1,dwBindType = 1,
					},
					{ ---五倍经验丹×2
						dwItemEnum = 2400130,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·大×18
						dwItemEnum = 2500072,dwItemNum = 18,dwBindType = 1,
					},
					{ ---元气通神酒·大×18
						dwItemEnum = 2500082,dwItemNum = 18,dwBindType = 1,
					},
					{ ---千纸鹤×33
						dwItemEnum = 4100010,dwItemNum = 33,dwBindType = 1,
					},
					{ ---传世藏宝图×10
						dwItemEnum = 5602030,dwItemNum = 10,dwBindType = 1,
					},
					{ ---彩戏绣包×10
						dwItemEnum = 5500070,dwItemNum = 10,dwBindType = 1,
					},
					{ ---副本令·通用×3
						dwItemEnum = 5500080,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
						[6308036] = --武林新秀
			{
				ItemList =
				{
					{ ---60级紫武器*1、
						dwItemEnum = 5500671,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹*5、
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---真气丹（500）*10
						dwItemEnum = 5940002,dwItemNum = 10,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
						[6308037] = --武林高手
			{
				ItemList =
				{
					{ ---40级紫色装备*2、
						dwItemEnum = 5500660,dwItemNum = 2,dwBindType = 1,
					},
					{ ---背包扩展符*5、
						dwItemEnum = 5500020,dwItemNum = 5,dwBindType = 1,
					},
					{ ---1品宝石精华*20
						dwItemEnum = 3900010,dwItemNum = 20,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
			[6308053] = --旺信礼包
			{
				ItemList =
				{
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤*10
						dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---传世藏宝*3
						dwItemEnum = 5602030,dwItemNum = 3,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
						
			[6308054] = --新手卡
			{
				ItemList =
				{
					{ ---彩戏绣包×2
						dwItemEnum = 5500070,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·小×3
						dwItemEnum = 2500070,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·小×3
						dwItemEnum = 2500080,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤×5
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6308055] = --登陆礼包
			{
				ItemList =
				{
					{ ---礼金券(100礼金)×1
						dwItemEnum = 5910003,dwItemNum = 1,dwBindType = 1,
					},
					{ ---奇珍藏宝图×1
						dwItemEnum = 5602020,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹×5
						dwItemEnum = 2400110,dwItemNum = 5,dwBindType = 1,
					},
					{ ---九花玉露丸·中×1
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中×1
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6308056] = --进阶礼包
			{
				ItemList =
				{
					{ ---礼金券(100礼金)×3
						dwItemEnum = 5910003,dwItemNum = 3,dwBindType = 1,
					},
					{ ---奇珍藏宝图×3
						dwItemEnum = 5602020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---双倍经验丹×10
						dwItemEnum = 2400110,dwItemNum = 10,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×1
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---强化石×10
						dwItemEnum = 4100140,dwItemNum = 10,dwBindType = 1,
					},
					{ ---神龙果×10
						dwItemEnum = 9405010,dwItemNum = 10,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
						[6308057] = --专属礼包
			{
				ItemList =
				{
					{ ---礼金券(100礼金)×5
						dwItemEnum = 5910003,dwItemNum = 5,dwBindType = 1,
					},
					{ ---奇珍藏宝图×5
						dwItemEnum = 5602020,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×10
						dwItemEnum = 2400110,dwItemNum = 10,dwBindType = 1,
					},
					{ ---九花玉露丸·中×5
						dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---强化石×10
						dwItemEnum = 4100140,dwItemNum = 10,dwBindType = 1,
					},
					{ ---真气丹(1000)×5
						dwItemEnum = 5940003,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

						[6308058] = --金钻会员礼包
			{
				ItemList =
				{
					{ ---五倍经验丹*3
						dwItemEnum = 2400130,dwItemNum = 3,dwBindType = 1,
					},
					{ ---钱袋(18888888)*1
						dwItemEnum = 5929006,dwItemNum = 1,dwBindType = 1,
					},
					{ ---真气丹(10万)*1
						dwItemEnum = 5940008,dwItemNum = 1,dwBindType = 1,
					},
					{ ---金锄头*3
						dwItemEnum = 4902007,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

						[6308059] = --年费金钻礼包
			{
				ItemList =
				{
					{ ---五倍经验丹*5
						dwItemEnum = 2400130,dwItemNum = 5,dwBindType = 1,
					},
					{ ---钱袋(18888888)*2
						dwItemEnum = 5929006,dwItemNum = 2,dwBindType = 1,
					},
					{ ---真气丹(10万)*2
						dwItemEnum = 5940008,dwItemNum = 2,dwBindType = 1,
					},
					{ ---金锄头*5
						dwItemEnum = 4902007,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

						[6308060] = --金钻LV2礼包
			{
				ItemList =
				{
					{ ---小金砖*2
						dwItemEnum = 4900109,dwItemNum = 2,dwBindType = 1,
					},
					{ ---礼金盒(2888礼金)*1
						dwItemEnum = 5919004,dwItemNum = 1,dwBindType = 1,
					},
					{ ---剑魂石*100
						dwItemEnum = 4100110,dwItemNum = 100,dwBindType = 1,
					},
					{ ---坐骑资质丹*5
						dwItemEnum = 9405040,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

						[6308061] = --金钻LV3礼包
			{
				ItemList =
				{
					{ ---小金砖*3
						dwItemEnum = 4900109,dwItemNum = 3,dwBindType = 1,
					},
					{ ---礼金盒(2888礼金)*2
						dwItemEnum = 5919004,dwItemNum = 2,dwBindType = 1,
					},
					{ ---剑魂石*150
						dwItemEnum = 4100110,dwItemNum = 150,dwBindType = 1,
					},
					{ ---坐骑资质丹*6
						dwItemEnum = 9405040,dwItemNum = 6,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	

						[6308062] = --金钻LV4礼包
			{
				ItemList =
				{
					{ ---小金砖*4
						dwItemEnum = 4900109,dwItemNum = 4,dwBindType = 1,
					},
					{ ---礼金盒(2888礼金)*3
						dwItemEnum = 5919004,dwItemNum = 3,dwBindType = 1,
					},
					{ ---剑魂石*200
						dwItemEnum = 4100110,dwItemNum = 200,dwBindType = 1,
					},
					{ ---坐骑资质丹*7
						dwItemEnum = 9405040,dwItemNum = 7,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	

						[6308063] = --金钻LV5礼包
			{
				ItemList =
				{
					{ ---小金砖*5
						dwItemEnum = 4900109,dwItemNum = 5,dwBindType = 1,
					},
					{ ---礼金盒(2888礼金)*4
						dwItemEnum = 5919004,dwItemNum = 4,dwBindType = 1,
					},
					{ ---剑魂石*300
						dwItemEnum = 4100110,dwItemNum = 300,dwBindType = 1,
					},
					{ ---坐骑资质丹*8
						dwItemEnum = 9405040,dwItemNum = 8,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	

						[6308064] = --金钻LV6礼包
			{
				ItemList =
				{
					{ ---小金砖*6
						dwItemEnum = 4900109,dwItemNum = 6,dwBindType = 1,
					},
					{ ---礼金盒(2888礼金)*5
						dwItemEnum = 5919004,dwItemNum = 5,dwBindType = 1,
					},
					{ ---剑魂石*350
						dwItemEnum = 4100110,dwItemNum = 350,dwBindType = 1,
					},
					{ ---无极仙元丹·灵*5
						dwItemEnum = 9405041,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	       
			
[6302013] = --CompGamer礼包		
{		
	ItemList =	
	{	
		{dwItemEnum = 5809684,dwItemNum = 1,dwBindType = 1,},     --------“CompGamer”称号卡*1
		{dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,},     --------九花玉露丸·中*3
		{dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,},     --------元气通神酒·中*3
		{dwItemEnum = 5500030,dwItemNum = 15,dwBindType = 1,},     --------恩仇令*15
		{dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,},     --------亮银砂*5
		{dwItemEnum = 5500010,dwItemNum = 10,dwBindType = 1,},     --------千里传音*10
		{dwItemEnum = 3900010,dwItemNum = 20,dwBindType = 1,},     --------1品宝石精华*20
		{dwItemEnum = 5910004,dwItemNum = 2,dwBindType = 1,},     --------礼金券(500礼金)*2
	},	
	EquipList =	
	{	
	},	
},		
[6302014] = --Online-Station礼包		
{		
	ItemList =	
	{	
		{dwItemEnum = 5809685,dwItemNum = 1,dwBindType = 1,},     --------“Online-Station”称号卡*1
		{dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,},     --------双倍经验丹*3
		{dwItemEnum = 2400210,dwItemNum = 5,dwBindType = 1,},     --------坐骑双倍经验丹*5
		{dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,},     --------九花玉露丸·中*3
		{dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,},     --------元气通神酒·中*3
		{dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,},     --------强化石*5
		{dwItemEnum = 2400010,dwItemNum = 1,dwBindType = 1,},     --------药王针·疾*1
		{dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,},     --------药王针·御*1
		{dwItemEnum = 5910004,dwItemNum = 2,dwBindType = 1,},     --------礼金券(500礼金)*2
	},	
	EquipList =	
	{	
	},	
},		
[6302015] = --最强新手卡		
{		
	ItemList =	
	{	
		{dwItemEnum = 2500071,dwItemNum = 10,dwBindType = 1,},     --------九花玉露丸·中*10
		{dwItemEnum = 2500081,dwItemNum = 10,dwBindType = 1,},     --------元气通神酒·中*10
		{dwItemEnum = 2400110,dwItemNum = 10,dwBindType = 1,},     --------双倍经验丹*10
		{dwItemEnum = 4100010,dwItemNum = 20,dwBindType = 1,},     --------千纸鹤*20
		{dwItemEnum = 2400000,dwItemNum = 5,dwBindType = 1,},     --------药王针·御*5
		{dwItemEnum = 2400010,dwItemNum = 5,dwBindType = 1,},     --------药王针·疾*5
		{dwItemEnum = 5940006,dwItemNum = 5,dwBindType = 1,},     --------真气丹(1万)*5
		{dwItemEnum = 9405010,dwItemNum = 30,dwBindType = 1,},     --------神龙果*30
		{dwItemEnum = 4100140,dwItemNum = 30,dwBindType = 1,},     --------强化石*30
		{dwItemEnum = 5910003,dwItemNum = 10,dwBindType = 1,},     --------礼金券(100礼金)*10
	},	
	EquipList =	
	{	
	},	
},		
--------------------------------------------------------联运商礼包-----------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
			[6309001] = --至尊宝箱
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩张符
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 6,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 8,dwBindType = 1,
					},
					{ ---强化石
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6309002] = --英雄宝箱
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---千里传音×10
						dwItemEnum = 5500010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,
					},
					{ ---洗点符
						dwItemEnum = 2500090,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6309003] = --精英宝箱
			{
				ItemList =
				{
					{ ---九花玉露丸·中
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---闭关要诀
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤
						dwItemEnum = 4100010,dwItemNum = 4,dwBindType = 1,
					},
					{ ---扩展符
						dwItemEnum = 5500020,dwItemNum = 5,dwBindType = 1,
					},
					{ ---亮银砂
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
--------------------------------------------------------360运营礼包-----------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
  			[6305001] = --360《凤凰令》新手礼包
			{
				ItemList =
				{
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---千纸鹤*3
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸(中)*1
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒(中)*1
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---药王针•御*1
						dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
  			[6305002] = --360《凤凰令》白银礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中*2
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---一阶演武收益丹*2
						dwItemEnum = 2400260,dwItemNum = 2,dwBindType = 1,
					},
					{ ---礼金*300
						dwItemEnum = 5910003,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305003] = --360《凤凰令》黄金礼包
			{
				ItemList =
				{
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·中*4
						dwItemEnum = 2500071,dwItemNum = 4,dwBindType = 1,
					},
					{ ---元气通神酒·中*4
						dwItemEnum = 2500081,dwItemNum = 4,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305004] = --360《凤凰令》白金礼包
			{
				ItemList =
				{
					{ ---双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---一阶演武收益丹*4
						dwItemEnum = 2400260,dwItemNum = 4,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305005] = --360《凤凰令》钻石礼包
			{
				ItemList =
				{
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·中*2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中*2
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---一阶演武收益丹*4
						dwItemEnum = 2400260,dwItemNum = 4,dwBindType = 1,
					},
					{ ---闭关要诀*4
						dwItemEnum = 2500030,dwItemNum = 4,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305006] = --金玉满堂
			{
				ItemList =
				{
					{ ---金玉满堂人物特效（道具）
						dwItemEnum = 5500840,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---升阶玄铁*2
						dwItemEnum = 4100120,dwItemNum = 2,dwBindType = 1,
					},
					{ ---武尊残章*3
						dwItemEnum = 2500050,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305007] = --战天礼包
			{
				ItemList =
				{
					{ --彩戏绣包×2
						dwItemEnum = 5500070,dwItemNum = 2,dwBindType = 1,
					},
					{ --千纸鹤×5
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ ---强化石×2
						dwItemEnum = 4100140,dwItemNum = 2,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			[6305008] = --浴火重生礼包
			{
				ItemList =
				{
					{ --神龙果×5
						dwItemEnum = 9405010,dwItemNum = 5,dwBindType = 1,
					},
					{ --强化石×5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ ---千纸鹤×3
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---副本令·通用×1
						dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305009] = --凤凰令礼包
			{
				ItemList =
				{
					{ --闭关要诀*2
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
					{ --千纸鹤*4
						dwItemEnum = 4100010,dwItemNum = 4,dwBindType = 1,
					},
					{ ---九花玉露丸·中*1
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中*1
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ ---扩展券*4
						dwItemEnum = 5500020,dwItemNum = 4,dwBindType = 1,
					},
					{ ---亮银沙*5
						dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305010] = --360《凤凰令》尊享礼包
			{
				ItemList =
				{
					{ --1品宝石精华*15
						dwItemEnum = 3900010,dwItemNum = 15,dwBindType = 1,
					},
					{ --银两10w
						dwItemEnum = 5920002,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6305011] = --360《凤凰令》至尊礼包
			{
				ItemList =
				{
					{ --360-凤凰至尊（有效期15天）
						dwItemEnum = 5500810,dwItemNum = 1,dwBindType = 1,
					},
					{ --1品宝石精华*25
						dwItemEnum = 3900010,dwItemNum = 25,dwBindType = 1,
					},
					{ --银两30w
						dwItemEnum = 5920002,dwItemNum = 3,dwBindType = 1,
					},
					{ ---双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6305012] = --360《凤凰令》北冥礼包
			{
				ItemList =
				{
					{ --360-凤凰霸主（有效期15天）
						dwItemEnum = 5500820,dwItemNum = 1,dwBindType = 1,
					},
					{ --1品宝石精华*30
						dwItemEnum = 3900010,dwItemNum = 30,dwBindType = 1,
					},
					{ --银两50w
						dwItemEnum = 5920002,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---真气5000
						dwItemEnum = 5940005,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305013] = --360《凤凰令》六脉礼包
			{
				ItemList =
				{
					{ --360-凤凰盟主（有效期15天）
						dwItemEnum = 5500830,dwItemNum = 1,dwBindType = 1,
					},
					{ --1品宝石精华*30
						dwItemEnum = 3900010,dwItemNum = 30,dwBindType = 1,
					},
					{ --银两100w
						dwItemEnum = 5920004,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---真气10000
						dwItemEnum = 5940005,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·御*2
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·疾*2
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ ---强化石*5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305014] = --360《凤凰令》265G武侠礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ --千纸鹤*5
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ --双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ --扩展券*2
						dwItemEnum = 5500020,dwItemNum = 2,dwBindType = 1,
					},
					{ ---洗点符*2
						dwItemEnum = 2500090,dwItemNum = 2,dwBindType = 1,
					},
					{ ---恩仇令*10
						dwItemEnum = 5500030,dwItemNum = 10,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305015] = --360《凤凰令》新浪黄金礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中*2
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ --强化石*5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},
					{ --药王针·御*1
						dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,
					},
					{ --药王针·疾*1
						dwItemEnum = 2400010,dwItemNum = 1,dwBindType = 1,
					},
					{ ---洗点符*2
						dwItemEnum = 2500090,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305016] = --360《凤凰令》多玩武神礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中*2
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ --洗点符*2
						dwItemEnum = 2500090,dwItemNum = 2,dwBindType = 1,
					},
					{ --千里传音*5
						dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,
					},
					{ --1品宝石精华*20
						dwItemEnum = 3900010,dwItemNum = 20,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305017] = --360《凤凰令》多玩至尊礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*1
						dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,
					},
					{ ---元气通神酒·中*1
						dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,
					},
					{ --恩仇令*5
						dwItemEnum = 5500030,dwItemNum = 5,dwBindType = 1,
					},
					{ --千纸鹤*5
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ --升阶玄铁*3
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305018] = --360《凤凰令》武林礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ --强化石*10
						dwItemEnum = 4100140,dwItemNum = 10,dwBindType = 1,
					},
					{ --双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ --药王针·御*1
						dwItemEnum = 2400000,dwItemNum = 1,dwBindType = 1,
					},
					{ --药王针·疾*1
						dwItemEnum = 2400010,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6305019] = --360《凤凰令》17173畅游礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ --千纸鹤*8
						dwItemEnum = 4100010,dwItemNum = 8,dwBindType = 1,
					},
					{ --恩仇令*8
						dwItemEnum = 5500030,dwItemNum = 8,dwBindType = 1,
					},
					{ --双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6305020] = --360《凤凰令》17173江湖礼包
			{
				ItemList =
				{
					{ ---强化石*3
						dwItemEnum = 4100140,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券*2
						dwItemEnum = 5500020,dwItemNum = 2,dwBindType = 1,
					},
					{ --药王针·御*2
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ --药王针·疾*2
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ --双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6305021] = --360《凤凰令》宝典礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中*2
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ --洗点符*2
						dwItemEnum = 2500090,dwItemNum = 2,dwBindType = 1,
					},
					{ --千纸鹤*5
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ --升阶玄铁*3
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},
					{ --1品宝石精华*10
						dwItemEnum = 3900010,dwItemNum = 10,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6305022] = --360《凤凰令》07073侠客礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中*3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---千纸鹤*5
						dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,
					},
					{ --1品宝石精华*15
						dwItemEnum = 3900010,dwItemNum = 15,dwBindType = 1,
					},
					{ --双倍经验丹*3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			
			[6305023] = --360《凤凰令》07073侠客礼包
			{
				ItemList =
				{
					{ ---武尊残章*2
						dwItemEnum = 2500050,dwItemNum = 2,dwBindType = 1,
					},
					{ ---扩展券*2
						dwItemEnum = 5500020,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·御*2
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ --药王针·疾*2
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ --双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},

			[6305024] = --360《凤凰令》07073钻石礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中*2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中*2
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---洗点符*2
						dwItemEnum = 2500090,dwItemNum = 2,dwBindType = 1,
					},
					{ --千纸鹤*3
						dwItemEnum = 4100010,dwItemNum = 3,dwBindType = 1,
					},
					{ --升阶玄铁*3
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},
					{ --1品宝石精华*15
						dwItemEnum = 3900010,dwItemNum = 15,dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			[6305025] = --360礼包1
			{
				ItemList =
				{
					{ ---洗点符*10
						dwItemEnum = 2500090,dwItemNum = 10,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6305026] = --360礼包2
			{
				ItemList =
				{
					 ---千里传音*5  千纸鹤*10
					{	dwItemEnum = 5500010,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			[6305027] = --360礼包3
			{
				ItemList =
				{
					 ---九花玉露丸·中*3   药王针·疾*2
					{	dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			[6305028] = --360礼包4
			{
				ItemList =
				{
					 ---元气通神酒·中*3   药王针·御*2
					{	dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			
			[6305029] = --360礼包5
			{
				ItemList =
				{
					---  双倍经验丹*3  双倍坐骑丹*3  1阶演武*3
					{ 	dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,},
					{ 	dwItemEnum = 2400260,dwItemNum = 3,dwBindType = 1,},
					{ 	dwItemEnum = 2400210,dwItemNum = 3,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			
			[6305030] = --360安全卫士等级礼包1
			{
				ItemList =
				{
					 ---  双倍经验丹*2 九花玉露丸·中*5 元气通神酒·中*5 一阶演武收益丹*4
					{ 	dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,},
					{ 	dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,},
					{ 	dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,},
					{ 	dwItemEnum = 2400260,dwItemNum = 4,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			
			[6305031] = --360安全卫士等级礼包2
			{
				ItemList =
				{
					 ---  双倍经验丹*2 九花玉露丸·中*5 元气通神酒·中*5 强化石*5 闭关要诀*3
					{	dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 2500030,dwItemNum = 3,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			
			[6305032] = --360安全卫士等级礼包3
			{
				ItemList =
				{
					 ---  称号：360凤凰奇侠 双倍经验丹*2 九花玉露丸·中*5 元气通神酒·中*5 强化石*5 亮银砂*5
				    {  	dwItemEnum = 5500702,dwItemNum = 1,dwBindType = 1,},
					{	dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			[6305033] = --360安全卫士等级礼包4
			{
				ItemList =
				{
					 ---  特效卡：卫士荣耀 双倍经验丹*2 九花玉露丸·中*5 元气通神酒·中*5 强化石*5 亮银砂*5 药王针.御*2
				    { 	dwItemEnum = 5500701,dwItemNum = 1,dwBindType = 1,},
					{	dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,},
					{   dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,},
					
				},
				EquipList =
					{
					},
			},
			
			[6305034] = --浏览器3级特权礼包
			{
				ItemList =
				{
					 ---  礼包奖品：<br/>九花玉露丸·小×5<br/>元气通神酒·小×5<br/>双倍经验丹×2
				    { 	dwItemEnum = 2500070,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 2500080,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,},					
				},
				EquipList =
					{
					},
			},
			[6305035] = --浏览器6级特权礼包
			{
				ItemList =
				{
					 ---  礼包奖品：<br/>九花玉露丸·中×2<br/>元气通神酒·中×2<br/>双倍经验丹×3<br/>钱袋(50万)×1
				    { 	dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 5920003,dwItemNum = 1,dwBindType = 1,},				
				},
				EquipList =
					{
					},
			},
			
			[6305036] = --浏览器8级特权礼包
			{
				ItemList =
				{
					 ---  礼包奖品：<br/>九花玉露丸·中×3<br/>元气通神酒·中×3<br/>1品宝石精华×25<br/>闭关要诀×1<br/>1阶演武收益丹×1
				    { 	dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 3900010,dwItemNum = 25,dwBindType = 1,},
					{	dwItemEnum = 2500030,dwItemNum = 1,dwBindType = 1,},
					{	dwItemEnum = 2400260,dwItemNum = 1,dwBindType = 1,},					
				},
				EquipList =
					{
					},
			},
			[6305037] = --浏览器9级特权礼包
			{
				ItemList =
				{
					 ---  礼包奖品：<br/>药王针·御×2<br/>药王针·疾×2<br/>强化石×5<br/>真气丹(5000)×1<br/>亮银沙×5<br/>恩仇令×20
				    { 	dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 5940005,dwItemNum = 1,dwBindType = 1,},	
					{	dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,},	
					{	dwItemEnum = 5500030,dwItemNum = 20,dwBindType = 1,},						
				},
				EquipList =
					{
					},
			},
			[6305038] = --360金币尽情礼包
			{
				ItemList =
				{
					 ---  礼包奖品：<br/>彩戏绣包×2<br/>九花玉露丸·小×3<br/>元气通神酒·小×3
				    { 	dwItemEnum = 5500070,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2500070,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 2500080,dwItemNum = 3,dwBindType = 1,},				
				},
				EquipList =
					{
					},
			},
			[6305039] = --360金币尽享礼包
			{
				ItemList =
				{
					 ---  礼包奖品：<br/>千纸鹤×5<br/>闭关要诀×2<br/>彩戏绣包×4<br/>九花玉露丸·中×1<br/>元气通神酒·中×1
				    { 	dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,},					
					{	dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 5500070,dwItemNum = 4,dwBindType = 1,},	
				    { 	dwItemEnum = 2500071,dwItemNum = 1,dwBindType = 1,},
					{	dwItemEnum = 2500081,dwItemNum = 1,dwBindType = 1,},					
				},
				EquipList =
					{
					},
			},						
			[6305040] = --360金币至尊礼包
			{
				ItemList =
				{
					 ---  <扩展券×4<br/>亮银砂×5<br/>彩戏绣包×5<br/>千纸鹤×5<br/>强化石×2
				    { 	dwItemEnum = 5500020,dwItemNum = 4,dwBindType = 1,},					
					{	dwItemEnum = 4100080,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 5500070,dwItemNum = 5,dwBindType = 1,},	
				    { 	dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100140,dwItemNum = 2,dwBindType = 1,},					
				},
				EquipList =
					{
					},
			},				
			[6305041] = --决战江湖
			{
				ItemList =
				{
					 --- 木材×5<br/>石料×5<br/>世家令·天×3<br/>世家令·地×3<br/>世家令·玄×3<br/>世家令·黄×3
				    { 	dwItemEnum = 4902001,dwItemNum = 5,dwBindType = 1,},					
					{	dwItemEnum = 4902002,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4500030,dwItemNum = 3,dwBindType = 1,},	
				    { 	dwItemEnum = 4500040,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 4500050,dwItemNum = 3,dwBindType = 1,},	
					{	dwItemEnum = 4500060,dwItemNum = 3,dwBindType = 1,},	
				},
				EquipList =
					{
					},
			},	
			[6305042] = --决战武林
			{
				ItemList =
				{
					 ---  连斩延迟丹×2<br/>木材×10<br/>石料×10<br/>棋魂×10<br/>副本令·通用×1<br/>世家令·天×3<br/>世家令·地×3<br/>世家令·玄×3<br/>世家令·黄×3
					{ 	dwItemEnum = 2400370,dwItemNum = 2,dwBindType = 1,},
				    { 	dwItemEnum = 4902001,dwItemNum = 10,dwBindType = 1,},					
					{	dwItemEnum = 4902002,dwItemNum = 10,dwBindType = 1,},
					{	dwItemEnum = 4901000,dwItemNum = 10,dwBindType = 1,},
					{	dwItemEnum = 5500080,dwItemNum = 1,dwBindType = 1,},
					{	dwItemEnum = 4500030,dwItemNum = 3,dwBindType = 1,},	
				    { 	dwItemEnum = 4500040,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 4500050,dwItemNum = 3,dwBindType = 1,},	
					{	dwItemEnum = 4500060,dwItemNum = 3,dwBindType = 1,},						
				},
				EquipList =
					{
					},
			},	
			[6305043] = --独家新手卡
			{
				ItemList =
				{
					 ---  千纸鹤×5<br/>真气丹(1000)×5
				    { 	dwItemEnum = 4100010,dwItemNum = 5,dwBindType = 1,},					
					{	dwItemEnum = 5940003,dwItemNum = 5,dwBindType = 1,},				
				},
				EquipList =
					{
					},
			},	
			[6305044] = --幸运宝箱
			{
				ItemList =
				{
					 ---  彩戏绣包×5<br/>奇珍藏宝图×3<br/>扩展卷×2
				    { 	dwItemEnum = 5500070,dwItemNum = 5,dwBindType = 1,},					
					{	dwItemEnum = 5602020,dwItemNum = 3,dwBindType = 1,},
					{	dwItemEnum = 5500020,dwItemNum = 2,dwBindType = 1,},			
				},
				EquipList =
					{
					},
			},	
			[6305045] = --初露锋芒礼包
			{
				ItemList =
				{
					 --- 千纸鹤×10<br/>剑气石·战×5<br/>升阶玄晶×5<br/>真气丹(5000)×2<br/>连斩延时丹×1
				    { 	dwItemEnum = 4100010,dwItemNum = 10,dwBindType = 1,},					
					{	dwItemEnum = 4100300,dwItemNum = 5,dwBindType = 1,},
					{	dwItemEnum = 4100130,dwItemNum = 5,dwBindType = 1,},	
				    { 	dwItemEnum = 5940005,dwItemNum = 2,dwBindType = 1,},
					{	dwItemEnum = 2400370,dwItemNum = 1,dwBindType = 1,},					
				},
				EquipList =
					{
					},
			},	
			[6305046] = --武林豪杰礼包
			{
				ItemList =
				{
					 ---  江湖威望丹·小×1<br/>连斩延时丹×1<br/>真气丹（5000）×3<br/>剑气石·战×10<br/>传世藏宝图×3<br/>礼金券(888礼金)×1
				    { 	dwItemEnum = 5805001,dwItemNum = 1,dwBindType = 1,},					
					{	dwItemEnum = 2400370,dwItemNum = 1,dwBindType = 1,},
					{	dwItemEnum = 5940005,dwItemNum = 3,dwBindType = 1,},	
				    { 	dwItemEnum = 4100300,dwItemNum = 10,dwBindType = 1,},
					{	dwItemEnum = 5602030,dwItemNum = 3,dwBindType = 1,},	
					{	dwItemEnum = 5919002,dwItemNum = 1,dwBindType = 1,},					
				},
				EquipList =
					{
					},
			},	
			[6305047] = --6305047
			{
				ItemList =
				{
					{ ---金玉满堂人物特效（道具）
						dwItemEnum = 5500840,dwItemNum = 1,dwBindType = 1,
					},
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---升阶玄铁*2
						dwItemEnum = 4100120,dwItemNum = 2,dwBindType = 1,
					},
					{ ---武尊残章*3
						dwItemEnum = 2500050,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中*2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中*2
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},				
					{ ---真气丹(500)*2
						dwItemEnum = 5940002,dwItemNum = 2,dwBindType = 1,
					},
					{ ---强化石*3
						dwItemEnum = 4100140,dwItemNum = 3,dwBindType = 1,
					},
					{ ---亮银砂*3
						dwItemEnum = 4100080,dwItemNum = 3,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6305048] = --凤凰令会员尊贵礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中×2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中×2 
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹×1
						dwItemEnum = 2400110,dwItemNum = 1,dwBindType = 1,
					},
					{ ---闭关要诀×1
						dwItemEnum = 2500030,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6305049] = --凤凰令护城校尉礼包
			{
				ItemList =
				{
					{ ---凤凰校尉称号卡×1
						dwItemEnum = 5500881,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---闭关要诀×2
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	
			[6305050] = --凤凰令护城都尉礼包
			{
				ItemList =
				{
					{ ---凤凰都尉称号卡×1
						dwItemEnum = 5500882,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×5
						dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·中×5
						dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---钱袋(50万)×1
						dwItemEnum = 5920003,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},		
			[6305051] = --凤凰令护城将军礼包
			{
				ItemList =
				{
					{ ---凤凰将军称号卡×1
						dwItemEnum = 5500883,dwItemNum = 1,dwBindType = 1,
					},
					{ ---药王针·御×2
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·疾×2
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ ---彩戏秀包×3
						dwItemEnum = 5500070,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中×5
						dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·中×5
						dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,
					},
					{ ---钱袋(100万)×1
						dwItemEnum = 5920004,dwItemNum = 1,dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},	


--
			[6305052] = --6级会员特权包  
			{
				ItemList =
				{
					{ ---九花玉露丸·中*5
						dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·中*5
						dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹*2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---1品宝石精华*15
						dwItemEnum = 3900010,dwItemNum = 15,dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},
--			
			[6305053] = --8级会员特权包 
			{
				ItemList =
				{
					{ ---360凤凰霸主称号卡
						dwItemEnum = 5500820,dwItemNum = 1,dwBindType = 1,
					},
					{ ---陨石碎片*20
						dwItemEnum = 4900010,dwItemNum = 20,dwBindType = 1,
					},
					{ ---棋魂*1
						dwItemEnum = 4901000,dwItemNum = 1,dwBindType = 1,
					},
					{ ---强化石*5
						dwItemEnum = 4100140,dwItemNum = 5,dwBindType = 1,
					},	
					{ ---亮银砂*3
						dwItemEnum = 4100080,dwItemNum = 3,dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},	
			[6305054] = --9级会员特权包   
			{
				ItemList =
				{
					{ ---360凤凰盟主称号卡
						dwItemEnum = 5500830,dwItemNum = 1,dwBindType = 1,
					},
					{ ---陨石碎片*30
						dwItemEnum = 4900010,dwItemNum = 30,dwBindType = 1,
					},
					{ ---棋魂*2
						dwItemEnum = 4901000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---九华玉露丸*5
						dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,
					},	
					{ ---元气通神酒*5
						dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,
					},	
					{ ---真气丹（1万）*1
						dwItemEnum = 5940006,dwItemNum = 1,dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},		
			[6305055] = --15级会员特权包  
			{
				ItemList =
				{
					{ ---360坐骑赐福丹
						dwItemEnum = 5801999,dwItemNum = 1,dwBindType = 1,
					},
					{ ---陨石碎片*50
						dwItemEnum = 4900010,dwItemNum = 50,dwBindType = 1,
					},
					{ ---棋魂*3
						dwItemEnum = 4901000,dwItemNum = 3,dwBindType = 1,
					},
					{ ---药王针·御*2
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},	
					{ ---药王针·疾*2、
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},	
					{ ---真气丹（1万）*1
						dwItemEnum = 5940006,dwItemNum = 1,dwBindType = 1,
					},	
					{ ---升阶玄铁*3
						dwItemEnum = 4100120,dwItemNum = 3,dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},				

			
			[6305048] = --凤凰令会员尊贵礼包
			{
				ItemList =
				{
					{ ---九花玉露丸·中×2
						dwItemEnum = 2500071,dwItemNum = 2,dwBindType = 1,
					},
					{ ---元气通神酒·中×2 
						dwItemEnum = 2500081,dwItemNum = 2,dwBindType = 1,
					},
					{ ---双倍经验丹×1
						dwItemEnum = 2400110,dwItemNum = 1,dwBindType = 1,
					},
					{ ---闭关要诀×1
						dwItemEnum = 2500030,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6305049] = --凤凰令护城校尉礼包
			{
				ItemList =
				{
					{ ---凤凰校尉称号卡×1
						dwItemEnum = 5500881,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×3
						dwItemEnum = 2500071,dwItemNum = 3,dwBindType = 1,
					},
					{ ---元气通神酒·中×3
						dwItemEnum = 2500081,dwItemNum = 3,dwBindType = 1,
					},
					{ ---双倍经验丹×2
						dwItemEnum = 2400110,dwItemNum = 2,dwBindType = 1,
					},
					{ ---闭关要诀×2
						dwItemEnum = 2500030,dwItemNum = 2,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	
			[6305050] = --凤凰令护城都尉礼包
			{
				ItemList =
				{
					{ ---凤凰都尉称号卡×1
						dwItemEnum = 5500882,dwItemNum = 1,dwBindType = 1,
					},
					{ ---九花玉露丸·中×5
						dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·中×5
						dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,
					},
					{ ---双倍经验丹×3
						dwItemEnum = 2400110,dwItemNum = 3,dwBindType = 1,
					},
					{ ---扩展券×3
						dwItemEnum = 5500020,dwItemNum = 3,dwBindType = 1,
					},
					{ ---钱袋(50万)×1
						dwItemEnum = 5920003,dwItemNum = 1,dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},		
			[6305051] = --凤凰令护城将军礼包
			{
				ItemList =
				{
					{ ---凤凰将军称号卡×1
						dwItemEnum = 5500883,dwItemNum = 1,dwBindType = 1,
					},
					{ ---药王针·御×2
						dwItemEnum = 2400000,dwItemNum = 2,dwBindType = 1,
					},
					{ ---药王针·疾×2
						dwItemEnum = 2400010,dwItemNum = 2,dwBindType = 1,
					},
					{ ---彩戏秀包×3
						dwItemEnum = 5500070,dwItemNum = 3,dwBindType = 1,
					},
					{ ---九花玉露丸·中×5
						dwItemEnum = 2500071,dwItemNum = 5,dwBindType = 1,
					},
					{ ---元气通神酒·中×5
						dwItemEnum = 2500081,dwItemNum = 5,dwBindType = 1,
					},
					{ ---钱袋(100万)×1
						dwItemEnum = 5920004,dwItemNum = 1,dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},				
--------------------------------------------------------------------------------
			[6300449] = --绝情密涧礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 8100030, ---密涧猴儿酒
						dwItemNum = 15,
						dwBindType = 1,
					},
					{
						dwItemEnum = 8100010, ---青花果
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 8100020, ---断肠草
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 8100040, ---龙女花
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6306037] = --一年		
			{		
				ItemList =	
				{	
					{dwItemEnum = 9405010,dwItemNum = 100,dwBindType = 1,},     --------神龙果*100
					{dwItemEnum = 2500050,dwItemNum = 50,dwBindType = 1,},     --------武尊残章*50
					{dwItemEnum = 5910006,dwItemNum = 2,dwBindType = 1,},     --------礼金盒(5000礼金)*2
					{dwItemEnum = 5940006,dwItemNum = 5,dwBindType = 1,},     --------真气丹(1万)*5
					{dwItemEnum = 2400130,dwItemNum = 5,dwBindType = 1,},     --------五倍经验丹*5
					{dwItemEnum = 5500020,dwItemNum = 20,dwBindType = 1,},     --------扩展券*20
				},	
				EquipList =	
				{	
				},	
			},		
			[6306038] = --屠龙		
			{		
				ItemList =	
				{	
					{dwItemEnum = 4100445,dwItemNum = 100,dwBindType = 1,},     --------缨穗*100
					{dwItemEnum = 5809367,dwItemNum = 100,dwBindType = 1,},     --------星灵*100
					{dwItemEnum = 9405052,dwItemNum = 50,dwBindType = 1,},     --------坐骑转生丹*50
					{dwItemEnum = 3900050,dwItemNum = 20,dwBindType = 1,},     --------5品宝石精华*20
					{dwItemEnum = 5809368,dwItemNum = 100,dwBindType = 1,},     --------星轨*100
					{dwItemEnum = 5500020,dwItemNum = 50,dwBindType = 1,},     --------扩展券*50
				},	
				EquipList =	
				{	
				},	
			},		
			[6306039] = --黄蓉		
			{		
				ItemList =	
				{	
					{dwItemEnum = 9405010,dwItemNum = 100,dwBindType = 1,},     --------神龙果*100
					{dwItemEnum = 4100430,dwItemNum = 100,dwBindType = 1,},     --------檀心丹*100
					{dwItemEnum = 4100170,dwItemNum = 100,dwBindType = 1,},     --------悟道残卷*100
					{dwItemEnum = 5809268,dwItemNum = 50,dwBindType = 1,},     --------古学志礼包*50
					{dwItemEnum = 2500330,dwItemNum = 1,dwBindType = 1,},     --------签筒*1
					{dwItemEnum = 5940006,dwItemNum = 5,dwBindType = 1,},     --------真气丹(1万)*5
				},	
				EquipList =	
				{	
				},	
			},		
			[6306040] = --郭靖		
			{		
				ItemList =	
				{	
					{dwItemEnum = 4100110,dwItemNum = 100,dwBindType = 1,},     --------剑魂石*100
					{dwItemEnum = 4100140,dwItemNum = 100,dwBindType = 1,},     --------强化石*100
					{dwItemEnum = 4100080,dwItemNum = 100,dwBindType = 1,},     --------亮银砂*100
					{dwItemEnum = 4902010,dwItemNum = 50,dwBindType = 1,},     --------无字天书·上卷*50
					{dwItemEnum = 4902011,dwItemNum = 50,dwBindType = 1,},     --------无字天书·下卷*50
					{dwItemEnum = 5950030,dwItemNum = 10,dwBindType = 1,},     --------完美属性卷轴*10
					{dwItemEnum = 5950006,dwItemNum = 1,dwBindType = 1,},     --------强化卷轴 +15*1
				},	
				EquipList =	
				{	
				},	
			},	
			[6306041] = --龙女		
			{		
				ItemList =	
				{	
					{dwItemEnum = 9405010,dwItemNum = 200,dwBindType = 1,},     --------神龙果*200
					{dwItemEnum = 4100440,dwItemNum = 200,dwBindType = 1,},     --------虎骨壮筋散*200
					{dwItemEnum = 9405051,dwItemNum = 100,dwBindType = 1,},     --------化身金丹*100
					{dwItemEnum = 5809268,dwItemNum = 50,dwBindType = 1,},     --------古学志礼包*50
					{dwItemEnum = 2500330,dwItemNum = 1,dwBindType = 1,},     --------签筒*1
					{dwItemEnum = 5940006,dwItemNum = 5,dwBindType = 1,},     --------真气丹(1万)*5
				},	
				EquipList =	
				{	
				},	
			},	
			[6306042] = --杨过		
			{		
				ItemList =	
				{	
					{dwItemEnum = 4100410,dwItemNum = 200,dwBindType = 1,},     --------古书注解*200
					{dwItemEnum = 4902007,dwItemNum = 10,dwBindType = 1,},     --------金锄头*10
					{dwItemEnum = 4100120,dwItemNum = 200,dwBindType = 1,},     --------升阶玄铁*200
					{dwItemEnum = 4100441,dwItemNum = 100,dwBindType = 1,},     --------锻骨丹*100
					{dwItemEnum = 3900060,dwItemNum = 20,dwBindType = 1,},     --------6品宝石精华*20
					{dwItemEnum = 5950031,dwItemNum = 10,dwBindType = 1,},     --------无双属性卷轴*10
					{dwItemEnum = 9405052,dwItemNum = 100,dwBindType = 1,},     --------坐骑转生丹*100
				},	
				EquipList =	
				{	
				},	
			},	
			[6306043] = --不死		
			{		
				ItemList =	
				{	
					{dwItemEnum = 9405010,dwItemNum = 120,dwBindType = 1,},     --------神龙果*120
					{dwItemEnum = 4902010,dwItemNum = 70,dwBindType = 1,},     --------无字天书·上卷*70
					{dwItemEnum = 5809368,dwItemNum = 70,dwBindType = 1,},     --------星轨*70
					{dwItemEnum = 4100442,dwItemNum = 70,dwBindType = 1,},     --------九转熊蛇丸*70
					{dwItemEnum = 5809367,dwItemNum = 70,dwBindType = 1,},     --------星灵*70
					{dwItemEnum = 4100441,dwItemNum = 70,dwBindType = 1,},     --------锻骨丹*70
					{dwItemEnum = 5910006,dwItemNum = 2,dwBindType = 1,},     --------礼金盒(5000礼金)*2
				},	
				EquipList =	
				{	
				},	
			},		
			[6306044] = --无双		
			{		
				ItemList =	
				{	
					{dwItemEnum = 4100110,dwItemNum = 150,dwBindType = 1,},     --------剑魂石*150
					{dwItemEnum = 4902011,dwItemNum = 150,dwBindType = 1,},     --------无字天书·下卷*150
					{dwItemEnum = 2500050,dwItemNum = 150,dwBindType = 1,},     --------武尊残章*150
					{dwItemEnum = 4100410,dwItemNum = 150,dwBindType = 1,},     --------古书注解*150
					{dwItemEnum = 2500331,dwItemNum = 150,dwBindType = 1,},     --------斩魄精元丹*150
					{dwItemEnum = 5940006,dwItemNum = 20,dwBindType = 1,},     --------真气丹(1万)*20
					{dwItemEnum = 4100170,dwItemNum = 150,dwBindType = 1,},     --------悟道残卷*150
				},	
				EquipList =	
				{	
				},	
			},		
			[6306045] = --长期		
			{		
				ItemList =	
				{	
					{dwItemEnum = 3900040,dwItemNum = 120,dwBindType = 1,},     --------4品宝石精华*120
					{dwItemEnum = 9405052,dwItemNum = 50,dwBindType = 1,},     --------坐骑转生丹*50
					{dwItemEnum = 2400120,dwItemNum = 20,dwBindType = 1,},     --------三倍经验丹*20
					{dwItemEnum = 5500670,dwItemNum = 5,dwBindType = 1,},     --------60级紫色装备箱*5
					{dwItemEnum = 4100140,dwItemNum = 120,dwBindType = 1,},     --------强化石*120
					{dwItemEnum = 5501135,dwItemNum = 20,dwBindType = 1,},     --------变异怪召唤令*20
					{dwItemEnum = 4100120,dwItemNum = 120,dwBindType = 1,},     --------升阶玄铁*120
				},	
				EquipList =	
				{	
				},	
			},	
			[6306046] = --凯旋		
			{		
				ItemList =	
				{	
					{dwItemEnum = 4902010,dwItemNum = 150,dwBindType = 1,},     --------无字天书·上卷*150
					{dwItemEnum = 5950030,dwItemNum = 10,dwBindType = 1,},     --------完美属性卷轴*10
					{dwItemEnum = 4100430,dwItemNum = 150,dwBindType = 1,},     --------檀心丹*150
					{dwItemEnum = 4902008,dwItemNum = 10,dwBindType = 1,},     --------银锄头*10
					{dwItemEnum = 4902011,dwItemNum = 150,dwBindType = 1,},     --------无字天书·下卷*150
					{dwItemEnum = 4100445,dwItemNum = 150,dwBindType = 1,},     --------缨穗*150
					{dwItemEnum = 2500011,dwItemNum = 1,dwBindType = 1,},     --------幻灵丹*1
				},	
				EquipList =	
				{	
				},	
			},	
			[6306047] = --远征		
			{		
				ItemList =	
				{	
					{dwItemEnum = 5809365,dwItemNum = 5,dwBindType = 1,},     --------战魂诏令·传世*5
					{dwItemEnum = 9405010,dwItemNum = 100,dwBindType = 1,},     --------神龙果*100
					{dwItemEnum = 4900050,dwItemNum = 100,dwBindType = 1,},     --------太玄经*100
					{dwItemEnum = 4100290,dwItemNum = 100,dwBindType = 1,},     --------剑气石*100
					{dwItemEnum = 4100210,dwItemNum = 100,dwBindType = 1,},     --------精铁锭*100
					{dwItemEnum = 5500670,dwItemNum = 5,dwBindType = 1,},     --------60级紫色装备箱*5
					{dwItemEnum = 5500020,dwItemNum = 100,dwBindType = 1,},     --------扩展券*100
				},	
				EquipList =	
				{	
				},	
			},		
			[6306048] = --长生		
			{		
				ItemList =	
				{	
					{dwItemEnum = 2500050,dwItemNum = 150,dwBindType = 1,},     --------武尊残章*150
					{dwItemEnum = 5809268,dwItemNum = 50,dwBindType = 1,},     --------古学志礼包*50
					{dwItemEnum = 5950031,dwItemNum = 10,dwBindType = 1,},     --------无双属性卷轴*10
					{dwItemEnum = 4100420,dwItemNum = 200,dwBindType = 1,},     --------紫钧元*200
					{dwItemEnum = 5940006,dwItemNum = 20,dwBindType = 1,},     --------真气丹(1万)*20
					{dwItemEnum = 2500011,dwItemNum = 1,dwBindType = 1,},     --------幻灵丹*1
					{dwItemEnum = 3900040,dwItemNum = 200,dwBindType = 1,},     --------4品宝石精华*200
				},	
				EquipList =	
				{	
				},	
			},				

-------------------------------------越南END------------------------------------------------------
------------------------------------------抢购礼包-------------------------------------------------------
           [6300450] = --神龙果抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010, ---神龙果*3
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

           [6300451] = --武尊残章抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050, ---武尊残章*5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300452] = --升阶玄晶抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100130, ---升阶玄晶*5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300453] = --剑魂石抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100110, ---剑魂石x5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300454] = --1品宝石精华抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900010, ---1品宝石精华x50
						dwItemNum = 50,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300455] = --2品宝石抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900020, ---2品宝石精华x30
						dwItemNum = 30,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300456] = --益元丹抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500040, ---益元丹x3
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300457] = --精铁锭抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100210, ---精铁锭x10
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300458] = --剑气石抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100310, ---剑气石·魂x10
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300459] = --千纸鹤抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100010, ---千纸鹤x5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300460] = --扩展券抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500020, ---扩展券x3
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300461] = --九花玉露丸·中抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071, ---九花玉露丸·中x10
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300462] = --经验丹抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, ---双倍经验丹×3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, ---三倍经验丹×1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300463] = --太玄经抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 4900050, ---太玄经*2
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300464] = --真气抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 5940006, ---真气*1w
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300465] = --藏宝图抢购包
			{
				ItemList =
				{
					{
						dwItemEnum = 5602020, --- 蓝色藏宝图x1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5602030, ---紫色藏宝图x1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6300469] = --360福利女神礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, ---双倍经验丹×2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
------------马来礼包需求

			[6309008] = --加赞礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071, ---血池中
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081,---蓝池中
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500010, ---喇叭
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500080, ---副本令·通用×1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3900010, ----1级宝石精华
						dwItemNum = 20,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},





-----------------------------------------8月12日运营礼包------------------------------------------------------
			[6300466] = --满月超级礼包 
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, --- 双倍经验丹×5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500080, ---副本令·通用×1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100290, --- 剑气石×50
						dwItemNum = 50,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3900010, --- 1品宝石精华×100
						dwItemNum = 100,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5910006, --- 5000礼金*1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300467] = --元老专属礼包 
			{
				ItemList =
				{
					{
						dwItemEnum = 5500850, --- 洪武尊者称号卡×1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

			[6300468] = --彩戏礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500070, --- 彩戏绣包×10
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
   			[6300470] = --至尊 VIP礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500040, --- 新秀帖×1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940008, --- 真气丹(10万)×1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5930007, --- 经验丹(500万)×5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400100, --- 1.5倍经验丹×5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			 [6300471] = --举国同乐礼盒
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010, --- 神龙果×8
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500050, --- 武尊残章×8 
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100110, --- 剑魂石×8
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100130, --- 升阶玄晶×8 
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100410, --- 古书注解×8
						dwItemNum = 8,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			 [6300472] = --普天同庆礼盒
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010, --- 神龙果×18
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500050, --- 武尊残章×18 
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100110, --- 剑魂石×18
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100130, --- 升阶玄晶×18 
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100410, --- 古书注解×18
						dwItemNum = 18,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},

	--		--
				 [6300473] = --贵宾回归礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500080, --- 副本令·通用*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400370, --- 连斩延时丹*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, --- 三倍经验丹*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940006, --- 真气丹（1万）*5 
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4902002, --- 石料*5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			 [6300474] = --微信礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, --- 双倍经验丹*2 
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, --- 千纸鹤*8
						dwItemNum = 8,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, --- 九花玉露丸·中*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081, --- 元气通神酒·中*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, --- 扩展券*5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
--
			 [6300475] = --钻石会员
			{
				ItemList =
				{
					{
						dwItemEnum = 5500080, --- 副本令·通用*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940006, --- 真气丹（1万）*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5602030, --- 传世藏宝图*3
						dwItemNum = 3,
						dwBindType = 1,
					},
										{
						dwItemEnum = 5500886, --- 钻石会员特殊卡
						dwItemNum = 1,
						dwBindType = 1,
					},

				},
				EquipList =
					{
					},
			},
			--
			 [6300476] = --江湖小虾米
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, --- 双倍经验丹*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, --- 千纸鹤*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, --- 九花玉露丸·中*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081, --- 元气通神酒·中*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, --- 扩展券*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500320, --- 月光宝盒*2
						dwItemNum = 2,
						dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},
--

			 [6300477] = --侠士礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, --- 双倍经验丹*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, --- 千纸鹤*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, --- 九花玉露丸·中*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081, --- 元气通神酒·中*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500100, --- 武尊断篇·初*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					
				},
				EquipList =
					{
					},
			},
	
--	
			[6300478] = --火爆游戏礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400110, --- 双倍经验丹*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, --- 千纸鹤*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500071, --- 九花玉露丸·中*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500081, --- 元气通神酒·中*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5602030, --- 传世藏宝图*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					
				},
				EquipList =
					{
					},
			},
--
			[6300479] = --火武林高手礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 4901000, --- 棋魂*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, --- 千纸鹤*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, --- 扩展券*5
						dwItemNum = 5,
						dwBindType = 1,
					},							
				},
				EquipList =
					{
					},
			},	
--
			[6300480] = --江湖侠士礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500082, --- 元气通神酒·大*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5805001, --- 威望丹·小*2
						dwItemNum = 2,
						dwBindType = 1,
					},							
				},
				EquipList =
					{
					},
			},	
--
			[6300481] = --自成一派礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900030, --- 3品宝石精华*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, --- 扩展券*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500072, ---九花玉露丸·大*5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 元气通神酒·大*5
						dwItemNum = 5,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},				
	--
			[6300482] = --名震江湖礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500080, --- 副本令·通用*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5602030, --- 传世藏宝图*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940006, ---真气丹（1万）*5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5501134, --- 五星变异怪召唤令*3
						dwItemNum = 3,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},	
--
			[6300483] = --一代宗师礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500080, --- 副本令·通用*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, --- 三倍经验丹*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5805001, ---威望丹·小*5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4900050, --- 太玄经*5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500884, --- >一代宗师称号卡×1
						dwItemNum = 1,
						dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},	
--
			[6300484] = --绝世高手礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5919003, --- 礼金*1888*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500080, --- 副本令·通用*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4900050, ---太玄经*15
						dwItemNum = 15,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400120, --- 三倍经验丹*3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500885, --- >-绝世高手称号卡
						dwItemNum = 1,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},	
			[6300485] = --1 等级 玲珑包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100420, --- 紫钧元*50
						dwItemNum = 50,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809259, --- 古学志·雕版盒*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5501134, ---五星变异怪召唤令*3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},	
						[6300486] = --2 等级 玲珑包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100420, --- 紫钧元*25
						dwItemNum = 25,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809259, --- 古学志·雕版盒*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5501133, ---四星变异怪召唤令*3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},	
			[6300487] = --3 等级 玲珑包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100420, --- 紫钧元*15
						dwItemNum = 15,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809259, --- 古学志·雕版盒*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5501132, ---三星变异怪召唤令*3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},
			
						[6300488] = --1 等级 百战包
			{
				ItemList =
				{
					{
						dwItemEnum = 5950006, --- 强化卷轴 +15*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3900070, ---  7品宝石精华*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809260, ---属性归一符*1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},
			[6300489] = --2等级 百战包
			{
				ItemList =
				{
					{
						dwItemEnum = 5950005, --- 强化卷轴 +14*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3900060, ---  6品宝石精华*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809260, ---属性归一符*1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},
				[6300490] = --3等级 百战包
			{
				ItemList =
				{
					{
						dwItemEnum = 5950004, --- 强化卷轴 +13*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 3900050, ---  5品宝石精华*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809260, ---属性归一符*1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},		
			[6300491] = --1等级 富贵包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910005, --- 礼金盒(5000礼金)*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940006, ---  真气丹(1万)*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920004, --- 钱袋(100万)*20
						dwItemNum = 20,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},
		   [6300492] = --2等级 富贵包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910005, --- 礼金盒(1000礼金)*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940006, ---  真气丹(1万)*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920004, --- 钱袋(100万)*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},
			
			[6300493] = --3等级 富贵包
			{
				ItemList =
				{
					{
						dwItemEnum = 5910005, --- 礼金袋(1000礼金)*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940006, ---  真气丹(1万)*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920004, --- 钱袋(100万)*5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					
				},
				EquipList =
					{
					},
			},
			
			[6300494] = --1等级 万寿包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400140, --- 十倍经验丹*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5930007, ---  经验丹(500万)65级*6 
						dwItemNum = 6,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500310, --- 强化经验丹*6
						dwItemNum = 6,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
				[6300495] = --2等级 万寿包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400130, --- 5倍经验丹*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5930007, ---  经验丹(500万)65级*4 
						dwItemNum = 4,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500310, --- 强化经验丹*4
						dwItemNum = 4,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			[6300496] = --3等级 万寿包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400120, --- 3倍经验丹*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5930007, ---  经验丹(500万)65级*2 
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500310, --- 强化经验丹*2
						dwItemNum = 2,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			[6300497] = --无名
			{
				ItemList =
				{
					{
						dwItemEnum = 5920002, --- 10W
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940005, ---  5000真气
						dwItemNum = 1,
						dwBindType = 1,
					},
					
				},
				EquipList =
					{
					},
			},
			
			[6300502] = --YY土豪礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500887, --- YY土豪称号卡
						dwItemNum = 1,
						dwBindType = 1,
					},
					
				},
				EquipList =
					{
					},
			},
			[6300503] = --世家令礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 4500030, --- 世家令·天
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4500040, --- 世家令·地	
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum =4500050, --- 世家令·玄
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4500060, --- 世家令·黄
						dwItemNum = 1,
						dwBindType = 1,
					},				
				},
				EquipList =
					{
					},
			},
			
			[6300504] = --武尊断篇提升包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500100, --- 武尊断篇·初
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500101, --- 武尊断篇·成	
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500102, --- 武尊断篇·会
						dwItemNum = 1,
						dwBindType = 1,
					},				
				},
				EquipList =
					{
					},
			},
			[6300505] = --武尊断篇狂升包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500103, --- 武尊断篇·纯
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500104, --- 武尊断篇·萃	
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500105, --- 武尊断篇·雄
						dwItemNum = 1,
						dwBindType = 1,
					},				
				},
				EquipList =
					{
					},
			},
			[6300506] = --武尊断篇飙升包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500106, --- 武尊断篇·深
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500107, --- 武尊断篇·极	
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500108, --- 武尊断篇·真
						dwItemNum = 1,
						dwBindType = 1,
					},				
				},
				EquipList =
					{
					},
			},
			
			[6300507] = --8品宝石精华包
			{
				ItemList =
				{
					{
						dwItemEnum = 3900080, --- 8品宝石
						dwItemNum = 3,
						dwBindType = 1,
					},			
				},
				EquipList =
					{
					},
			},
			
			[6300508] = --贵宾VIP礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500040, --- 新秀帖
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4902008, --- 银锄头
						dwItemNum = 3,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5809302, --- 福袋
						dwItemNum = 3,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5940006, --- 真气丹(1万)
						dwItemNum = 3,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5919002, --- 礼金券(888礼金)
						dwItemNum = 2,
						dwBindType = 1,
					},							
				},
				EquipList =
					{
					},
			},
			
			[6300509] = --小木盒
			{
				ItemList =
				{
					{
						dwItemEnum = 4100110, --- 剑魂石
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100290, --- 剑气石
						dwItemNum = 38,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5809348, --- 小宝箱
						dwItemNum = 1,
						dwBindType = 1,
					},								
				},
				EquipList =
					{
					},
			},
				
			[6300510] = --铁箱子
			{
				ItemList =
				{
					{
						dwItemEnum = 4100130, --- 升阶玄晶
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100210, --- 精铁锭
						dwItemNum = 18,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5809349, --- 小箱子
						dwItemNum = 1,
						dwBindType = 1,
					},								
				},
				EquipList =
					{
					},
			},
			
			[6300511] = --聚宝盒
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050, --- 武尊残章
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4900050, --- 太玄经
						dwItemNum = 10,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5809350, --- 玉净瓶
						dwItemNum = 1,
						dwBindType = 1,
					},								
				},
				EquipList =
					{
					},
			},
			
			[6300512] = --宝藏盒
			{
				ItemList =
				{
					{
						dwItemEnum = 9405010, --- 剑魂石
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5809255, --- 剑气石
						dwItemNum = 4,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5809351, --- 小宝箱
						dwItemNum = 1,
						dwBindType = 1,
					},								
				},
				EquipList =
					{
					},
			},
			
			[6300513] = --古书籍
			{
				ItemList =
				{
					{
						dwItemEnum = 4100410, --- 古书注解
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5809293, --- 修行顿悟书
						dwItemNum = 1,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 5809352, --- 修行册
						dwItemNum = 1,
						dwBindType = 1,
					},								
				},
				EquipList =
					{
					},
			},
			[6300514] = --至尊王者礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500892, --- 至尊王者称号卡
						dwItemNum = 1,
						dwBindType = 1,
					},									
				},
				EquipList =
					{
					},
			},
			
			[6300515] = --气壮山河
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071, --- 九花玉露丸·中×2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500081, --- 元气通神酒·中×2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100140, --- 强化石×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100010, --- 千纸鹤×10
						dwItemNum = 10,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300516] = --顶天立地
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071, --- 九花玉露丸·中×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500081, --- 元气通神酒·中×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500020, --- 扩展券×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100430, --- 檀心丹×2
						dwItemNum = 2,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300517] = --义薄云天
			{
				ItemList =
				{
					{
						dwItemEnum = 2500071, --- 九花玉露丸·中×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500081, --- 元气通神酒·中×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500020, --- 扩展券×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500330, --- 签筒×1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100140, --- 强化石×2
						dwItemNum = 2,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300518] = --侠肝义胆
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 元气通神酒·大×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500331, --- 斩魄精元丹×2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100010, --- 千纸鹤×6
						dwItemNum = 6,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500070, --- 彩戏绣包×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500893, --- 高级会员称号卡×1
						dwItemNum = 1,
						dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},
						[6300519] = --举世无双
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 元气通神酒·大×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 3900010, --- 1品宝石精华×25
						dwItemNum = 25,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5920004, --- 钱袋(100万)×1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400100, --- 1.5倍经验丹×3
						dwItemNum = 3,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300520] = --豪气冲天
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 元气通神酒·大×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4902007, --- 金锄头×1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100010, --- 千纸鹤×18
						dwItemNum = 18,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500330, --- 签筒×1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500894, --- 钻石会员称号卡×1
						dwItemNum = 1,
						dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},
			
			[6300521] = --舍我其谁
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 元气通神酒·大×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 3900010, --- 1品宝石精华×50
						dwItemNum = 50,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5920004, --- 钱袋(100万)×2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400100, --- 1.5倍经验丹×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5940007, --- 真气丹(5万)×1
						dwItemNum = 1,
						dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},
			
			[6300522] = -- 威风八面
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大×8
						dwItemNum = 8,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 九花玉露丸·大×8
						dwItemNum = 8,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500070, --- 彩戏绣包×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500330, --- 签筒×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4902007, --- 金锄头×2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500895, --- 至尊会员称号卡×1
						dwItemNum = 1,
						dwBindType = 1,
					},					
				},
				EquipList =
					{
					},
			},
						[6300523] = -- 壮志凌云
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大×8
						dwItemNum = 8,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 元气通神酒·大×8
						dwItemNum = 8,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 3900010, --- 1品宝石精华×100
						dwItemNum = 100,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5920005, --- 钱袋(500万)×1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400120, --- 三倍经验丹×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5940008, --- 真气丹(10万)×1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5501100, --- 金色宝箱×1
						dwItemNum = 1,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300524] = -- 君临天下
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大×18
						dwItemNum = 18,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --- 九花玉露丸·大×18
						dwItemNum = 18,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400130, --- 五倍经验丹×2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500330, --- 签筒×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400370, --- 连斩延时丹×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500320, --- 月光宝盒×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4902007, --- 金锄头×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500896, --- 一统江湖称号卡×1
						dwItemNum = 1,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300525] = -- 闯荡江湖包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500030, --- 恩仇令×5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100010, --- 千纸鹤×3
						dwItemNum = 3,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300526] = -- 闯荡江湖包
			{
				ItemList =
				{
					{
						dwItemEnum = 5809106, --- 名剑天官符 2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400110, --- 双倍经验丹 3
						dwItemNum = 3,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300527] = -- 战姬无双包
			{
				ItemList =
				{
					{
						dwItemEnum = 5809356, --- 礼金福袋1
						dwItemNum = 1,
						dwBindType = 0,
					},	
					{
						dwItemEnum = 4100010, --- 千纸鹤 6
						dwItemNum = 6,
						dwBindType = 0,
					},
					{
						dwItemEnum = 5500010, --- 千里传音5
						dwItemNum = 5,
						dwBindType = 0,
					},					
				},
				EquipList =
					{
					},
			},
			
			[6300528] = -- 战斗无限包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --- 九花玉露丸·大
						dwItemNum = 20,
						dwBindType = 0,
					},	
					{
						dwItemEnum = 2500082, --- 元气通神酒·大
						dwItemNum = 20,
						dwBindType = 0,
					},
					
				},
				EquipList =
					{
					},
			},
			
			[6300529] = -- 威能极限包
			{
				ItemList =
				{
					{
						dwItemEnum = 5809357, --- 强化卷轴福袋 1
						dwItemNum = 1,
						dwBindType = 0,
					},	
					{
						dwItemEnum = 5500080, --- 副本令·通用 3
						dwItemNum = 3,
						dwBindType = 0,
					},
					
				},
				EquipList =
					{
					},
			},
			
			[6300530] = -- 传说秘宝包
			{
				ItemList =
				{
					{
						dwItemEnum = 5809358, --- 宝石惊喜福袋 10
						dwItemNum = 10,
						dwBindType = 0,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300531] = -- 传说秘宝包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400000, --- 药王针·御 10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400010, --- 药王针·疾 10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400110, --- 双倍经验丹5
						dwItemNum = 5,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300532] = -- QR回馈礼
			{
				ItemList =
				{
					{
						dwItemEnum = 4901000, --- 棋魂
						dwItemNum = 10,
						dwBindType = 1,
					},							
				},
				EquipList =
					{
					},
			},
						[6300533] = -- 横扫天下包
			{
				ItemList =
				{
					{
						dwItemEnum = 4500030, --- 世家令·天
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4500040, --- 世家令·地
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4500050, --- 世家令·玄
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4500060, --- 世家令·黄
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5809249, --- 伏虎印
						dwItemNum = 1,
						dwBindType = 1,
					},						
				},
				EquipList =
					{
					},
			},
			
			[6300534] = -- 横扫回馈包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400120, --- 三倍经验丹 5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5950011, --- 洗炼·防御卷轴 1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 9405040, --- 坐骑资质丹 5
						dwItemNum = 5,
						dwBindType = 1,
					},
				
				},
				EquipList =
					{
					},
			},
			
			[6300535] = -- 名冠天下包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100010, --- 千纸鹤 8
						dwItemNum = 8,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500030, --- 恩仇令 15
						dwItemNum = 15,
						dwBindType = 1,
					},	
				
				},
				EquipList =
					{
					},
			},
			
			[6300536] = -- 基地好康包
			{
				ItemList =
				{
					{
						dwItemEnum = 5809104, --- 宝石天官符 2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5809105, --- 坐骑天官符 2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5809106, --- 名剑天官符 2
						dwItemNum = 2,
						dwBindType = 1,
					},
										{
						dwItemEnum = 5809107, --- 宝甲天官符 2
						dwItemNum = 2,
						dwBindType = 1,
					},
				
				},
				EquipList =
					{
					},
			},
			
			[6300537] = -- 战力无限包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500010, --- 千里传音 3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5602010, --- 稀有藏宝图 2
						dwItemNum = 2,
						dwBindType = 1,
					},	
				
				},
				EquipList =
					{
					},
			},
			
			[6300538] = -- 万事大吉礼盒
			{
				ItemList =
				{
					{
						dwItemEnum = 5940006, --- 真气丹(1万) 2
						dwItemNum = 2,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5920004, --- 钱袋(100万) 8	
						dwItemNum = 8,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5919002, --- 礼金券(888礼金) 1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5501100, --- 金色宝箱 1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5930005, --- 经验丹(100万) 5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400100, --- 1.5倍经验丹 3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, --- 三倍经验丹 1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300539] = -- 吉祥如意礼盒
			{
				ItemList =
				{
					{
						dwItemEnum = 5801005, --- 坐骑赐福丹·尊
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5802005, --- 名剑赐福丹·尊
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5803005, --- 宝甲赐福丹·尊
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5804005, --- 实战赐福丹·尊
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5806005, --- 修行赐福丹·尊
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	
			[6300540] = -- 指导员礼包 
			{
				ItemList =
				{
					{
						dwItemEnum = 5930004, --- 经验丹(50万)
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5509999, --- GS身份卡
						dwItemNum = 198,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500010, --- 千里传音
						dwItemNum = 495,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	
			
			[6300541] = -- 基地独享包
			{
				ItemList =
				{
					{
						dwItemEnum = 5500040, --- 新秀帖×1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400110, --- 双倍经验丹×20
						dwItemNum = 20,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5500080, --- 副本令·通用×5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	
			
			[6300542] = -- 稀有圣诞袜
			{
				ItemList =
				{
					{
						dwItemEnum = 5930005, --- 经验丹（100W）*1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5940006, --- 真气丹（1W）*1
						dwItemNum = 1,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2400100, --- 1.5倍经验丹*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400370, --- 连斩延迟丹*1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6300543] = -- 奇珍圣诞袜
			{
				ItemList =
				{
					{
						dwItemEnum = 4100410, --- 古书注解*18
						dwItemNum = 18,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500331, --- 斩魄精元丹*18
						dwItemNum = 18,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100430, --- 檀心丹*24
						dwItemNum = 24,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940008, --- 真气丹（10W）*1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	
			
			[6300544] = -- 传世圣诞袜
			{
				ItemList =
				{
					{
						dwItemEnum = 4100400, --- 云英之玉*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5950030, --- 完美属性卷轴*2
						dwItemNum = 2,
						dwBindType = 1,
					},	
				},
				EquipList =
					{
					},
			},
			[6300545] = -- 白虎礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100140, --- 强化石*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100290, --- 剑气石*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500050, --- 武尊残章*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100210, --- 精铁锭*10
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300546] = -- 朱雀礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100170, --- 悟道残卷*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100430, --- 檀心丹*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 5809368, --- 星轨*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809367, --- 星灵*10
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			[6300547] = -- 青龙礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100442, --- 九转熊蛇丸*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500331, --- 斩魄精元丹*10
						dwItemNum = 10,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 4100440, --- 虎骨壮筋散*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100450, --- 侠客秘传*10
						dwItemNum = 10,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6300548] = -- 真命天子
			{
				ItemList =
				{
					{
						dwItemEnum = 5809559, 
						dwItemNum = 1,
						dwBindType = 1,
					},	
				},
				EquipList =
					{
					},
			},
			[6300549] = -- 霸气十足
			{
				ItemList =
				{
					{
						dwItemEnum = 5809560, 
						dwItemNum = 1,
						dwBindType = 1,
					},	
				},
				EquipList =
					{
					},
			},
			[6300550] = -- 只手遮天
			{
				ItemList =
				{
					{
						dwItemEnum = 5809561, 
						dwItemNum = 1,
						dwBindType = 1,
					},	
				},
				EquipList =
					{
					},
			},
			[6300551] = -- 只手遮天
			{
				ItemList =
				{
					{
						dwItemEnum = 5809562, 
						dwItemNum = 1,
						dwBindType = 1,
					},	
				},
				EquipList =
					{
					},
			},
			[6300552] = -- 名震天下
			{
				ItemList =
				{
					{
						dwItemEnum = 5809563, 
						dwItemNum = 1,
						dwBindType = 1,
					},	
				},
				EquipList =
					{
					},
			},
			[6300553] = -- 万众瞩目
			{
				ItemList =
				{
					{
						dwItemEnum = 5809564, 
						dwItemNum = 1,
						dwBindType = 1,
					},	
				},
				EquipList =
					{
					},
			},
			
			[6300554] = -- 一马当先礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --九花玉露丸·大*3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500082, --元气通神酒·大*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5602030, --传世藏宝图*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940006, --真气丹(1万)×10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500080, --副本令·通用×1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6300555] = -- 马上成功礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400130, --五倍经验丹×3
						dwItemNum = 3,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 2500072, --九花玉露丸·大*18
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500082, --元气通神酒·大*18
						dwItemNum = 18,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5940008, --真气丹(10万)×5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5501134, --五星变异怪召唤令*2
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			
			[6300556] = -- 265G独家通服礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --九花玉露丸·大*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500082, --元气通神酒·大*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920005, --钱袋(500万)*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, --扩展券*10
						dwItemNum = 10,
						dwBindType = 1,
					},
										{
						dwItemEnum = 2400110, --双倍经验丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500030, --闭关要诀*2
						dwItemNum = 2,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
				[6300557] = -- 07073假期独家特权礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --九花玉露丸·大*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500082, --元气通神酒·大*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920005, --钱袋(500万)*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, --扩展券*10
						dwItemNum = 10,
						dwBindType = 1,
					},
										{
						dwItemEnum = 2400110, --双倍经验丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500040, --益元丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
			
			[6300558] = --cwan假期独家特权礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --九花玉露丸·大*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500082, --元气通神酒·大*2
						dwItemNum = 2,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5920005, --钱袋(500万)*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500020, --扩展券*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, --三倍经验丹*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5805001, --威望丹·小*1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
		
			[6300559] = --劳动节钻石礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --九花玉露丸·大*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500082, --元气通神酒·大*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, --三倍经验丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 4100010, --千纸鹤*10
						dwItemNum = 10,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6307051, --礼金袋（1888礼金）*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500898, --‘劳动标兵·金’称号*1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},				
	
			[6300560] = --劳动节黄金礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500072, --九花玉露丸·大*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2500082, --元气通神酒·大*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 2400120, --三倍经验丹*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6307051, --礼金袋(1888礼金)*1
						dwItemNum = 1,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5500899, --“劳动标兵·银”称号*1
						dwItemNum = 1,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},
	------------------------------------------------韩国礼包--------------------------------------------		
			[6304506] = --3倍经验值包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400120, --三倍经验丹*50
						dwItemNum = 50,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6304503, --坐骑礼物*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6304504, --装备礼物*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6304505, --宝石礼物*3
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},		
			
			[6304507] = --5倍经验值包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400130, --五倍经验丹*50
						dwItemNum = 50,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6304503, --坐骑礼物*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6304504, --装备礼物*3
						dwItemNum = 3,
						dwBindType = 1,
					},
					{
						dwItemEnum = 6304505, --宝石礼物*3
						dwItemNum = 3,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},							
		[6304511] = --北斗七星礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 5809367, --星灵
						dwItemNum = 55,
						dwBindType = 1,
					},
					{
						dwItemEnum = 5809368, --星轨
						dwItemNum = 5,
						dwBindType = 1,
					},
				},
				EquipList =
					{
					},
			},	
		[6304514] = --侠客包
			{
				ItemList =
				{
					{
						dwItemEnum = 9405044, --提神丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405045, --聚力丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405046, --固甲丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},
					{
						dwItemEnum = 9405047, --狂袭丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},	
					{
						dwItemEnum = 9405048, --敏身丹*5
						dwItemNum = 5,
						dwBindType = 1,
					},		
					{
						dwItemEnum = 4100170, --悟道残卷*20
						dwItemNum = 20,
						dwBindType = 1,
					},							
				},
				EquipList =
					{
					},
			},	
		[6304515] = --酒葫芦包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100445,	--缨穗*40
						dwItemNum = 40,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 4100448,	--蜂蜡*2
						dwItemNum = 2,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 4100449,	--水玉嵌珠·小*2
						dwItemNum = 2,
						dwBindType = 1,
					},     						
				},
				EquipList =
					{
					},
			},		
		[6304516] = --精炼锤包
			{
				ItemList =
				{
					{
						dwItemEnum = 4902012,	--精炼锤*30
						dwItemNum = 30,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 9405041,	--无极仙元丹·灵*1	
						dwItemNum = 1,
						dwBindType = 1,
					},     				
				},
				EquipList =
					{
					},
			},		
		[6304522] = --10倍经验丹礼包
			{
				ItemList =
				{
					{
						dwItemEnum = 2400140,   --十倍经验丹*50
						dwItemNum = 50,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 6304518,   --特级坐骑礼包*3
						dwItemNum = 3,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 6304520,	--特级装备礼包*3
						dwItemNum = 3,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 6304517,	--特级宝石礼包*3 
						dwItemNum = 3,
						dwBindType = 1,
					},        				
				},
				EquipList =
					{
					},
			},
		[6304525] = --实战包
			{
				ItemList =
				{
					{
						dwItemEnum = 2500050,	--武尊残章*10
						dwItemNum = 10,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 2500051,	--武尊通鉴*20
						dwItemNum = 20,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 4900050,	--太玄经*100 	
						dwItemNum = 100,
						dwBindType = 1,
					},     			
				},
				EquipList =
					{
					},
			},	
		[6304526] = --童姥功包
			{
				ItemList =
				{
					{
						dwItemEnum = 4100442,	--九转熊蛇丸*30
						dwItemNum = 30,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 4100443,	--凝血炼骨丹*10
						dwItemNum = 10,
						dwBindType = 1,
					},     
					{
						dwItemEnum = 5809601, 	--通脉活络散·小*1 	
						dwItemNum = 1,
						dwBindType = 1,
					},    		
				},
				EquipList =
					{
					},
			},			
	},		
----------------------------------------------------------------------------------------------------------------



---在线礼包配置
	OnLineGift =
    {
		[1] =
		{
			Time = 300000,
			dwBindGold = 0,
			ItemList =
		   {
				{
					dwItemEnum = 5500070,
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500120,
					dwItemNum = 4,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
		},
		[2] =
		{
			Time = 480000,
			dwBindGold = 30,
			ItemList =
			{
				{
					dwItemEnum = 5500070,
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500120,
					dwItemNum = 6,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
		},
		[3] =
		{
			Time = 600000,
			dwBindGold = 50,
			ItemList =
			{
				{
					dwItemEnum = 5500070,
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500120,
					dwItemNum = 8,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
		},
		[4] =
		{
			Time = 900000,
			dwBindGold = 80,
			ItemList =
			{
				{
					dwItemEnum = 5500070,
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500120,
					dwItemNum = 10,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
		},
		[5] =
	  {
			Time = 1200000,
			dwBindGold = 120,
			ItemList =
			{
				{
					dwItemEnum = 5500070,
					dwItemNum = 1,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500120,
					dwItemNum = 12,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
		},
		[6] =
		{
			Time = 1800000,
			dwBindGold = 150,
			ItemList =
			{
				{
					dwItemEnum = 5500070,
					dwItemNum = 3,
					dwBindType = 1,
				},
				{
					dwItemEnum = 2500120,
					dwItemNum = 16,
					dwBindType = 1,
				},
			},
			EquipList =
			{

			},
		},

	},
}