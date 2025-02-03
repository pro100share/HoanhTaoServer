--物品系统的枚举类型，保存所有的枚举

--每一页的格子数上限
_G.enSlotNumPerPage = 36;

_G.ItemSystemSlotNumConfig = {
    buyBack = 6,    --回购
    oldKpsk = 2,    --旧信物
    onSell  = 10,   --摊位
    task    = 50,   --任务物品
    amulet  = 16,   --护身宝甲熔炼空间
	decompose = 10,	--装备分解容器空间
};

--道具系统各种操作类型，记录日志使用
_G.ItemSysOperType = {
    Used        = 1,    --使用(删除/获得)
    Destroy     = 2,    --手动销毁
    TaskReward  = 3,    --任务奖励
    PickUp      = 4,    --拾取
    BuyNpc      = 5,    --从NPC购买(获得道具或消耗金钱)
    SellNpc     = 6,    --卖给NPC(失去道具或获得金钱)
    BuyMall     = 7,    --从商城购买(获得道具或消耗元宝/礼金)
    Trade       = 8,    --交易(获得或失去道具/金钱)
    Present     = 9,    --礼包给予
    Mail        = 10,   --邮件(寄出或收取)
    SystemReward= 11,   --系统奖励
    QiangHua    = 12,   --强化装备使用
    Mount       = 13,   --强化坐骑使用
    Amulet      = 14,   --强化护身宝甲使用
    Sword       = 15,   --强化宝剑使用
    GM          = 16,   --GM操作
    AchiReward  = 17,   --成就奖励
    FuBenReward = 18,   --副本奖励
    TaskDel     = 19,   --上交任务删除
    GrowUpReward= 20,   --成长目标奖励
    EscortReward= 21,   --押镖奖励
    Banquet     = 22,   --婚宴(失去或获得)
    PlayerShop  = 23,   --摆摊
    ChatCost    = 24,   --聊天
    Donate      = 25,   --世家捐献
    CreateGuild = 26,   --世家创建
    Divorce     = 27,   --离婚
    BuyKeepsake = 28,   --购买结婚信物
    Marriage    = 29,   --结婚
    NpcConn     = 30,   --江湖人脉
    SkillBook   = 31,   --技能书合成
    SkillUp     = 32,   --技能升级
    Gamble      = 33,   --摇骰子
    TransMap    = 34,   --地图传送
    Bandit      = 35,   --摇奖
    FiveElem    = 36,   --五行
    Treasure    = 37,   --藏宝图
    MissionDaily= 38,   --每日活动
    Pot         = 39,   --开罐子
    EnchaseStone= 40,   --镶嵌宝石
    CombStone   = 41,   --宝石合成
    VipReward   = 42,   --Vip奖励
    Bourn       = 43,   --境界
    Friend      = 44,   --好友
    Muse        = 45,   --闭关
    Pulse       = 46,   --冲脉
    Collect     = 47,   --收集
	Exchange    = 48,   --兑换
	ElemBalance = 49,   --五行调和
	EnterZLCost = 50,   --进入珍珑
	ContributeAward = 51, --捐献
	Festival = 52,		--节日活动
	FullAddiAward = 53, --累积充值奖励
	FullPerAward = 54, --单次充值奖励
	WarHarvest = 55, --战场奖励
	BaiduPrize = 56, --百度的领奖
	OnlineGift = 57, --在线时间抽奖
	Examination = 58, --答题
	CommercialAct = 59, --商业化活动奖励
	RefineMaterial = 60,  --炼丹系统
	Errant = 61,     --侠客行奖励
	EquipBuild = 62, --装备修炼
	RedLost = 63,	--红名掉钱
	Chest = 64,      --宝箱系统
	TimeReward = 65, --补签
	BaiduPlayer = 66,--百度影音推广
	Practice = 67, --修行系统
	EquipDecompose = 68,--装备分解
	GuildSkill = 69, --世家技能
	KungFuStudy = 70, --领悟功法 -易筋经
	RefEscortQuality = 71, --刷新个人镖车品质
	BuyEscort = 72, --购买镖车
	EscortAward = 73,  --个人押镖奖励
	Wage = 74,--工资
	Signin = 75,--签到
	Login = 76,--登陆
	MegaKill = 77, --杀人如麻系统
	SoulHunt = 78,	--狩猎战魂
	ChangeHuntIndex = 79,--狩猎战魂召唤
	SoulSell = 80,--出售战魂
	SoulPacketExtand = 81,--战魂背包扩展
    PropertyScroll = 82 ,--附加属性翻倍符
	SwordFoundry = 83,---名剑注灵
	MatrixMethod = 84,---阵法系统
	UnionPlatGift = 85, --联运平台礼包
	Lottery = 86,	--抽签
	Qihun = 87, --棋魂
	KnowPet = 88, --结交宠物
	PetInstruct = 89, --宠物指教
	PetEquip = 90,	--宠物装备
	CollectJewel = 91,  --聚灵
	OnlineAward = 92, ---在线礼包
	ChallengeQunXiaSystem = 93,--挑战群侠系统
	TieBuShan = 94; --铁布衫
	UpSuit = 95; --升级铁布衫套装
	PetImpart = 96,	  --宠物指教
	CompleteDupl = 97,--副本一键完成消耗
	CompleteDuplAward = 98,  --副本一键完成奖励
	CompleteDuplUsed = 99, --副本一键完成消耗道具
	CollectJewelLevel = 100, ----聚灵等级版
	PractiseSkill = 101, ----童姥功
	PetBourn = 102,	--宠物境界
	BournHideAttr = 103, --实战隐藏属性
	GuildKickLeader = 104,--世家弹劾家主
	SoulSuitActive = 105,--激活战魂套装
	QunXiaLu = 106,	--群侠录 卡片收集
	PetAptitude = 107;    --宠物资质
	Gourd = 108, ----酒葫芦
	MountChangeRank = 109, ------坐骑转生
	PetWash = 110, --宠物洗练
	CSHonorShop = 111,	--跨服战 荣誉商城
	CSBuyNpc = 112, 	--跨服战 内部商店
	Cross = 113,   --跨服战场
	Gest = 114,   --武尊全章
	CallGuildMember = 115, --世家召唤
	FashionDress = 116,	 --时装功能
	ShengHuoLing = 117,  --圣火令
    ChartAward = 118,  --排行榜奖励
	HiddenWeapon = 119,		--暗器系统
	ZhenlongChess = 120,  --新珍珑棋局副本
	DuGuJiuJian = 121,  --独孤九剑
	KungFuExtend = 122, --功法扩展
	QungYunLing = 123, --功法扩展
    ZhanQiJue = 124, --战骑诀
	Shield = 125,		--盾牌系统
	TongTianTower = 126, -- 通天塔
	GoldenBody = 127,	-- 修炼金身
	TalkSword = 128, --华山论剑
    HeroToken = 129, --英雄令
    Banner = 130,  -- 战旗
    Recycling = 131, -- 资源回收
    isLocked = 132, -- 被锁定删除
};

--道具系统操作枚举类型
_G.enItemSysOper = {
	eAdd = 1;	--增加
	eUpd = 2;	--更改
	eDel = 3;	--删除
	eSys = 4;	--系统
};

--道具系统物品更新操作枚举类型
_G.enItemUpdOper = {
	eAdd	= 1; --数量增加
	eDel	= 2; --数量减少
	eBind	= 3; --绑定类型更改
	ePosn	= 4; --位置更改
	eStLv	= 5; --强化等级更改
	eProp	= 6; --附加属性更改
	eTias	= 7; --天生属性更改
	eDooe	= 8; --涂鸦更改
	eUpgd	= 9; --升阶
	eEdre	= 10;--耐久度
};

--道具系统系统操作枚举类型
_G.enItemSysUpdOper = {
	eBindGold		= 1;
	eGold			= 2;
	ePacketSlotNum	= 3;
	eStorageSlotNum	= 4;
	ePacketMoney	= 5;
	eStorageMoney	= 6;
	eNextItemID		= 7;
};

--物品佩戴的位置
_G.enItemWearPos = {
	eWeapon		= 1,			--武器
	eCloth		= 2,			--衣服
	eLeg		= 3,			--护腿
	eGloves		= 4,			--护手
	eBelt		= 5,			--腰带
	eHead		= 6,			--头饰
	eShoes		= 7,			--鞋子
	eCloak		= 8,			--披风
	eNecklace	= 9,			--项链
	eRing		= 10,			--戒指
	eBracelet	= 11,			--手镯
	ePendant	= 12,			--腰坠
	eAmulet		= 13,			--护身宝甲
	eKeepsake	= 14,			--情侣信物
	eSpecial1	= 15,			--特殊位置1
	eSpecial2	= 16,			--特殊位置2
	eSpecial3	= 17,			--特殊位置3
	eSpecial4	= 18,			--特殊位置4
	eSpecial5	= 19,			--特殊位置5
    eSpecial6   = 20,           --特殊位置6
    eMount1     = 21,           --坐骑装备鞍具
    eMount2     = 22,           --坐骑装备缰绳
    eMount3     = 23,           --坐骑装备蹬具
    eMount4     = 24,           --坐骑装备蹄铁
};
--人物属性枚举
_G.enPropertyType = {
	eAttackPower = 1,		--攻击力
	eDefence = 2,			--防御
	eShenFa = 3,			--身法
	eBaoJi = 4,				--暴击
	eHPLimited = 5,			--加生命值上限
	eMPLimited = 6,			--加蓝上限
	eSubDamage = 7,			--伤害减免
	eAttackSpeed = 8,		--攻击速度
	eMoveSpeed = 9,			--移动速度
};
--物品数据库的操作类型，操作的优先级从低到高，只能使用高优先级的操作代替低优先级的操作
_G.enDBOperation = {
	eNone = 0,				--无操作
	eUpdate = 1,			--更新操作
	eInsert = 2,			--插入操作
	eDelete = 3,			--删除操作
};
--物品所在的位置Position
_G.enItemPosition = {
	ePacket = 1,			--背包里
	eStorage = 2,			--仓库里
	ePutOn = 3,				--玩家身上穿的
	eStore = 4,				--在NPC商店里面的
	eBooth = 5,				--玩家摆摊所在的地方
	eKeepsake = 6,			--玩家旧信物所在的地方
	eTaskRoom = 7,			--玩家存放任务物品的空间
	eAmulet = 8,			--玩家存放护身宝甲熔炼炉的空间
	eHorseEquip = 9,		--玩家坐骑装备存放的地方
	eStone	= 10,			--玩家镶嵌石头
	eDecompose = 11,		--装备分解容器
};
--物品销毁类型
_G.enItemDestroyType = {
	eDestroy = 1,			--可以销毁
	eDestroyByWarn = 2,		--提示后确定是否销毁
	eProtected = 3,			--不可以销毁
};
--物品绑定类型
_G.enItemBindType = {
	eNo = 0,				--未绑定
	eYes = 1,				--已绑定
};
--物品出售类型
_G.enItemSellType = {
	eYes = 0,				--可以出售
	eNo = 1,				--不可以出售
};
--物品的性别要求
_G.enItemSexType = {
	eNone = 0,				--性别无要求
	eMale = 1,				--需要男性才能佩戴
	eFemale = 2,			--需要女性才能佩戴
};
--物品所属的大类
_G.enItemParentType = {
	eWeapon = 1,			--武器--2.24新ID规则：装备
	eDefence = 2,			--防具--2.24新ID规则：丹药
	eDecoration = 3,		--饰品--2.24新ID规则：宝石
	eMedicine = 4,			--丹药--2.24新ID规则：材料
	eMaterial = 5,			--材料--2.24新ID规则：其他
	eTaskItem = 6,			--任务物品--2.24新ID规则：礼包
	eSundryGoods = 7,		--杂货--2.24新ID规则：任务
	eSkill = 8,				--技能书，2012-07-30 add by dll
	--eHorseDefence = 18,		--坐骑防具
	--eYongBingDefence = 19,	--佣兵防具
	--eYongBingWeapon = 20,	--佣兵武器
	--eMarket = 21,			--商城物品
	--eSkillBooks = 22,		--技能书
	--eHorse = 23,			--坐骑
};
--武器子类，使用角色的分类枚举enProfType
--[[_G.enItemWeaponType = {
	eSword = 1,				--剑
	eBlade = 2,				--刀
	eReaphook = 3,			--镰刀
	eSpear = 4,				--枪，长矛
};--]]
--防具子类-----2.24新ID规则：装备子类
_G.enItemDefenceType = {
	eCloth = 10,				--衣服--2.24新ID规则：武器
	eShoes = 20,				--鞋子--2.24新ID规则：衣服
	eHand = 21,				--护手--2.24新ID规则：鞋子
	eCestus = 22,			--腰带--2.24新ID规则：护手
	eHead = 23,				--头饰--2.24新ID规则：腰带
	eLeg = 24,				--护腿--2.24新ID规则：头饰
	aa = 25, 
	ab = 40,
	ac = 41,
	ad = 42,
	ae = 43,
	af = 44,
	ag = 50,
	ah = 60,
	ai = 70,
};
--饰品子类------2.24新ID规则：丹药子类
_G.enDecorationType = {
	eNecklace = 10,			--项链
	eRing = 20,				--戒指
	eBracelet = 30,			--手镯
	ePendant = 40,			--腰坠
	eAmulet = 50,			--护身宝甲
	--eKeepsake = 6,			--情侣信物
	--eSpecial = 7,			--特殊（城主饰品）
	--eCloak = 8,				--披风
};
--宝石
_G.enMedicineType = {
	eAddHP = 10,				--恢复HP
	eAddMP = 20,				--恢复MP
	eAddWuXing = 30,			--增加真气
	eXiDian = 40,			--洗点
	eAddState = 50,			--增加状态
};
--材料
_G.enMaterialType = {
	eOthers = 10,			--其它
	ba = 20,			--其它
	bb = 50,			--其它
};
--其他 
_G.enTaskItemType = {
	eMainLine = 10,			--主线
	eLatral = 20,			--支线
	--eCircleTask = 3,		--环任务
	--eActivity = 4,			--活动
};
--礼包
_G.enChandleryType = {
	eGift = 10,				--礼包
	eBackTown = 20,			--回城类
	eOthers = 30,			--其它
	bc = 50,
};
--任务
_G.enHorseDefenceType = {
	eSaddle = 10,			--马鞍
	eHalter = 20,			--缰绳
	eStirrup = 30,			--马蹬
	eTiTie = 40,				--蹄铁
};
--商城子类
--_G.enMarketType = {
--	eUsual = 1,				--常用类
--	eMedicine = 2,			--药品类
--	eHorse = 3,				--坐骑类
--	eEquip = 4,				--装备类
--	eDiamond = 5,			--宝石类
--	eActivity = 6,			--活动类
--	eBindGold = 7,			--绑定元宝类
--};
--技能书
--_G.enSkillBooksType = {
--	eAvatar = 1,			--人物技能书
--	eHorse = 2,				--坐骑技能书
--};

-------------------------------------------------------------------------------
--net传输专用变量名和index的索引定义
_G.ItemKey2Index = 
{
	dwItemID = 1;
	dwRoleID = 2;
	
	dwItemEnum = 3;
	dwCount = 4;
	dwBindFlag = 5;
	dwBornTime = 6;
	dwLifeTime = 7;
	strDoodle = 8;
	dwPosition = 9;
	
	setProperty = 10;
	setStoneInfo = 11;
	dwStrongLevel = 12;
	dwTianSheng = 13;
	--dwQuality = 13; --考虑到品质可以在客户端直接用附加属性计算，所以就不用传
	
	dwPackSlot = 100;			--背包的当前可用格子
	dwPackMoney = 101;			--背包中携带的银两数
	dwGold = 102;					--背包中携带的元宝数
	dwBindGold = 103;				--背包中携带的绑定元宝数
	dwStorageSlot = 104;		--仓库的当前可用格子
	dwStorageMoney = 105;			--仓库中携带的银两数
}

_G.ItemIndex2Key = {};

function _G.FuncItemIndexKeyChange()
	for n,v in pairs(ItemKey2Index)do
		ItemIndex2Key[v] = n;
	end
end;
FuncItemIndexKeyChange();
















