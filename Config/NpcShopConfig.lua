
_G.NpcShopMsgConfig =
{
	invalid = -1,
	Buy = 1,
	Sell = 2,
	Back = 3,
	---------
	BuySuccess = 4,
	MoneyNotEnough = 5,
	NoPack = 6,
	NotSuccess = 18,
	--
	SellSuccess = 7,
	NotForSell = 8,
	--
	BackSuccess = 9,
	NoPackForBack = 10,
	MoneyNotEnoughForBack = 11,
	
	
	
	--
	SetState = 12,
	
	FixEquip = 13,
	FixEquipFinish = 14,
	FixEquipNoMoney = 15,
	FixEquipNoNeed = 16,
	AlreadySell = 17,
	
	Unlock = 99,
}
--------------------------------------------
--[[
:序号
id:商店ID
type:商店类型:
--物品所属的大类
	enItemParentType.eWeapon 			--武器
	enItemParentType.eDefence 			--防具
	enItemParentType.eDecoration		--饰品
	enItemParentType.eMedicine 			--丹药
	enItemParentType.eSkill				--技能书

	enProfType.eProfType_Sickle			--镰
	enProfType.eProfType_Knife			--刀
	enProfType.eProfType_Sword			--剑
	enProfType.eProfType_Spear			--枪
--]]

_G.NpcShopConfig = 
{
	[10000] = 
	{
		types = enItemParentType.eMedicine,
		Item = {things1=2100010,things2=2200010,things3=2100020,things4=2200020,things5=2100030,things6=2200030,things7=2100040,things8=2200040,things9=2100050,things10=2200050,things11=2100060,things12=2200060}
	},	
	[20000] = 
	{
		types = enItemParentType.eDefence,
		[enProfType.eProfType_Sickle] = {things1=1204010,things2=1224010,things3=1214010,things4=1254010,things5=1234010,things6=1204020,things7=1224020,things8=1214020,things9=1254020,things10=1234020,things11=1204030,things12=1224030,things13=1214030,things14=1254030,things15=1234030,things16=1204040,things17=1224040,things18=1214040,things19=1254040,things20=1234040,},
		[enProfType.eProfType_Knife] = {things1=1202010,things2=1222010,things3=1212010,things4=1252010,things5=1232010,things6=1202020,things7=1222020,things8=1212020,things9=1252020,things10=1232020,things11=1202030,things12=1222030,things13=1212030,things14=1252030,things15=1232030,things16=1202040,things17=1222040,things18=1212040,things19=1252040,things20=1232040,},
		[enProfType.eProfType_Sword] = {things1=1201010,things2=1221010,things3=1211010,things4=1251010,things5=1231010,things6=1201020,things7=1221020,things8=1211020,things9=1251020,things10=1231020,things11=1201030,things12=1221030,things13=1211030,things14=1251030,things15=1231030,things16=1201040,things17=1221040,things18=1211040,things19=1251040,things20=1231040,},
		[enProfType.eProfType_Spear] = {things1=1203010,things2=1223010,things3=1213010,things4=1253010,things5=1233010,things6=1203020,things7=1223020,things8=1213020,things9=1253020,things10=1233020,things11=1203030,things12=1223030,things13=1213030,things14=1253030,things15=1233030,things16=1203040,things17=1223040,things18=1213040,things19=1253040,things20=1233040,},
	},
	[30000]=
	{
	 types=enItemParentType.eWeapon,
	 [enProfType.eProfType_Sickle]={things1=1104010,things2=1104020,things3=1104030,things4=1104040,},
	 [enProfType.eProfType_Knife] = {things1=1102010,things2=1102020,things3=1102030,things4=1102040,},
	 [enProfType.eProfType_Sword] = {things1=1101010,things2=1101020,things3=1101030,things4=1101040,},
	 [enProfType.eProfType_Spear] = {things1=1103010,things2=1103020,things3=1103030,things4=1103040,},
	},
	[40000]=
	{
	 types=enItemParentType.eDecoration,
	 Item = {things1=1400010,things2=1400020,things3=1400030,things4=1410010,things5=1410020,things6=1410030,things7=1420010,things8=1420020,things9=1420030,things10=1430010,things11=1430020,things12=1430030,things13=1440010,things14=1440020,things15=1440030,things16=1600010,things17=1600020,things18=1600030,},
	},
	[50000]=
	{
	types = enItemParentType.eMedicine,
	Item = {things1=5500180,things2=5500190,things3=5500100,things4=5500110,things5=5500030,things6=5600020},
	},
	---坐骑装备商店
	[60000]=
	{
	types = enItemParentType.eDecoration,
	Item= {things1=1700001,things2=1710001,things3=1720001,things4=1730001,things5=1700002,things6=1710002,things7=1720002,things8=1730002,things9=1700003,things10=1710003,things11=1720003,things12=1730003,things13=1700004,things14=1710004,things15=1720004,things16=1730004,},
    },
	---技能书商店
	[70000] = 
	{
		types = enItemParentType.eSkill,
		[enProfType.eProfType_Sickle] = {things1=5151001,things2=5151004,things3=5151003,things4=5151005,things5=5161001,things6=5111013,},--things5=5113001,things6=5113002,things7=5113003,things8=5113004,things9=5113005,things10=5113006,},
		[enProfType.eProfType_Knife] = {things1=5131001,things2=5131004,things3=5131003,things4=5131005,things5=5161001,things6=5111013,},--things5=5113001,things6=5113002,things7=5113003,things8=5113004,things9=5113005,things10=5113006,},
		[enProfType.eProfType_Sword] = {things1=5121001	,things2=5121004,things3=5121003,things4=5121005,things5=5161001,things6=5111013,},--things5=5113001,things6=5113002,things7=5113003,things8=5113004,things9=5113005,things10=5113006,},
		[enProfType.eProfType_Spear] = {things1=5141001,things2=5141004,things3=5141003,things4=5141005,things5=5161001,things6=5111013,},--things5=5113001,things6=5113002,things7=5113003,things8=5113004,things9=5113005,things10=5113006,},
	},
--戏说天下	
	[80000] = 
	{
		types = enItemParentType.eMedicine,
		Item = {things1=7100179,things2=7100180,things3=7100181,things4=7100182,things5=7100183,things6=7100184,things7=7100185,things8=7100186}
	},	
--元宵灯会
	[90000] = 
	{
		types = enItemParentType.eMedicine,
		Item = {things1=7400001,things2=7400002,things3=7400003}
	},			
	}
	
--Npc商店价格表
_G.NpcShopItemPriceConfig = 
{ 
		
		[5161001]=5000000;
		[2100010]=25;
		[2100020]=100;
		[2100030]=190;
		[2100040]=380;	
		[2100050]=750;	
		[2100060]=1600;		
		[2200010]=25;	
		[2200020]=100;			
		[2200030]=190;
		[2200040]=380;
		[2200050]=750;
		[2200060]=1600;
		[7100179]=500000;
		[7100180]=500000;
		[7100181]=500000;
		[7100182]=500000;
		[7100183]=500000;
		[7100184]=500000;
		[7100185]=500000;
		[7100186]=500000;
		[5500180]=50000;
		[5500190]=100000;
		[5121001]=50000;
		[5121004]=50000;
		[5121003]=50000;
		[5121005]=1000000;
		[5131001]=50000;
		[5131004]=50000;
		[5131003]=50000;
		[5131005]=1000000;
		[5141001]=50000;
		[5141004]=50000;
		[5141003]=50000;
		[5141005]=1000000;
		[5151001]=50000;
		[5151004]=50000;
		[5151003]=50000;
		[5151005]=1000000;
		[5111013]=20000;
		[5500100]=10000;
		[5500110]=10000;
		[5500030]=500000;		
		[5600020]=200000;	
		[1101010]=120;
		[1101020]=400;
		[1101030]=2500;
		[1101040]=8000;
		[1102010]=120;
		[1102020]=400;
		[1102030]=2500;
		[1102040]=8000;
		[1103010]=120;
		[1103020]=400;
		[1103030]=2500;
		[1103040]=8000;
		[1104010]=120;
		[1104020]=400;
		[1104030]=2500;
		[1104040]=8000;
		[1201010]=120;
		[1201020]=400;
		[1201030]=2500;
		[1201040]=8000;
		[1202010]=120;
		[1202020]=400;
		[1202030]=2500;
		[1202040]=8000;
		[1203010]=120;
		[1203020]=400;
		[1203030]=2500;
		[1203040]=8000;
		[1204010]=120;
		[1204020]=400;
		[1204030]=2500;
		[1204040]=8000;
		[1221010]=120;
		[1221020]=400;
		[1221030]=2500;
		[1221040]=8000;
		[1222010]=120;
		[1222020]=400;
		[1222030]=2500;
		[1222040]=8000;
		[1223010]=120;
		[1223020]=400;
		[1223030]=2500;
		[1223040]=8000;
		[1224010]=120;
		[1224020]=400;
		[1224030]=2500;
		[1224040]=8000;
		[1211010]=120;
		[1211020]=400;
		[1211030]=2500;
		[1211040]=8000;
		[1212010]=120;
		[1212020]=400;
		[1212030]=2500;
		[1212040]=8000;
		[1213010]=120;
		[1213020]=400;
		[1213030]=2500;
		[1213040]=8000;
		[1214010]=120;
		[1214020]=400;
		[1214030]=2500;
		[1214040]=8000;
		[1251010]=120;
		[1251020]=400;
		[1251030]=2500;
		[1251040]=8000;
		[1252010]=120;
		[1252020]=400;
		[1252030]=2500;
		[1252040]=8000;
		[1253010]=120;
		[1253020]=400;
		[1253030]=2500;
		[1253040]=8000;
		[1254010]=120;
		[1254020]=400;
		[1254030]=2500;
		[1254040]=8000;
		[1231010]=120;
		[1231020]=400;
		[1231030]=2500;
		[1231040]=8000;
		[1232010]=120;
		[1232020]=400;
		[1232030]=2500;
		[1232040]=8000;
		[1233010]=120;
		[1233020]=400;
		[1233030]=2500;
		[1233040]=8000;
		[1234010]=120;
		[1234020]=400;
		[1234030]=2500;
		[1234040]=8000;
		[1400010]=120;
		[1400020]=400;
		[1400030]=2500;
		[1400040]=8000;
		[1410010]=120;
		[1410020]=400;
		[1410030]=2500;
		[1410040]=8000;
		[1420010]=120;
		[1420020]=400;
		[1420030]=2500;
		[1420040]=8000;
		[1430010]=120;
		[1430020]=400;
		[1430030]=2500;
		[1430040]=8000;
		[1440010]=120;
		[1440020]=400;
		[1440030]=2500;
		[1440040]=8000;
		[1700001]=120;
		[1700002]=400;
		[1700003]=2500;
		[1700004]=8000;
		[1710001]=120;
		[1710002]=400;
		[1710003]=2500;
		[1710004]=8000;
		[1720001]=120;
		[1720002]=400;
		[1720003]=2500;
		[1720004]=8000;
		[1730001]=120;
		[1730002]=400;
		[1730003]=2500;
		[1730004]=8000;

}
