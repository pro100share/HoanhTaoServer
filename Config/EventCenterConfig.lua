--事件类型
_G.enumPlayerEventType = 
{
	EventKillMonster				= 'EventKillMonster',		--杀怪 参数2: 次数 参数3：怪物ID 参数4：怪物类型
	EventKillBossMonster			= 'EventKillBossMonster',	--杀boss怪
	EventKillVariationMonster		= 'EventKillVariationMonster',--击杀变异怪物（数量，怪物id，怪物类型，怪物等级） 
	EventKillPlayer					= 'EventKillPlayer',		--杀玩家
	EventBeKilledByMonster			= 'EventBeKilledByMonster',	--被怪杀	已经取消，统一到EventBeKilled中
	EventBeKilledByPlayer			= 'EventBeKilledByPlayer',	--被玩家杀	已经取消，统一到EventBeKilled中
	EventBeKilled					= 'EventBeKilled',			--玩家死亡	参数3：杀死这个人的对象ID，如果是自杀则是0  参数4：1--被人杀，2--被怪杀，3--自杀
	EventKillBossOn5030				= 'EventKillBossOn5030',	--珍珑棋局击杀一个boss
	
	EventGetAuthority				= 'EventGetAuthority',		--获得权限 参数2: 权限名
	
	EventLevelUp					= 'EventLevelUp',		--升级 参数2: 升级数 参数3: 升级后等级
	
	EventUseItem					= 'EventUseItem',		--使用道具 参数2：道具ID
	EventUpdateMoney				= 'EventUpdateMoney',	--银两变化 参数2：银两数
	EventEquipSuit					= 'EventEquipSuit',		--达成套装 参数2：套装ID
	
	EventEquipStrong				= 'EventEquipStrong',	--强化装备，参数2为强化后装备星数
	EventEquipFullBornProp			= 'EventEquipFullBornProp',--满兵魂事件
	EventEquipUpGrade				= 'EventEquipUpGrade',	--升阶装备，参数2为升阶后阶数
	
	EventIntensifyBornProp          = 'EventIntensifyBornProp',  --强化天生属性
	EventIntensifyEquip             = 'EventIntensifyEquip',     --强化装备
	EventLevelUpEquip               = 'EventLevelUpEquip',       --装备升阶
	EventAppendProp                 = 'EventAppendProp',         --重置附加属性（品質）
	EventResetAppendPropType        = 'EventResetAppendPropType',  --重置装备附加属性类型
	EventAddAppendPropValue         = 'EventAddAppendPropValue',   --装备附加属性数值
	
	EventStoneSet					= 'EventStoneSet',		--宝石镶嵌，参数2为装备上已镶嵌的宝石数
	
	EventAchievementComplete		= 'EventAchievementComplete',	--成就达成 参数2: 完成数量 参数3: 成就ID
	EventAchievementReward			= 'EventAchievementReward',		--成就奖励 参数2: 完成数量 参数3: 成就ID 参数4:成就点数 参数5:总点数
	
	EventMarryDinner				= 'EventMarryDinner',	--举行婚宴
	EventEatMarryBanquet			= 'EventEatMarryBanquet',--吃婚宴事件
	EventAddFriend					= 'EventAddFriend',		--添加好友
	EventDoubleMonk					= 'EventDoubleMonk',	--双修
	EventGetMarry					= 'EventGetMarry',		--结婚
	EventSendExp					= 'EventSendExp',		--赠送经验
	
	EventCompleteTask				= 'EventCompleteTask',	--完成任务
	EventAcceptTask					= 'EventAcceptTask',	--接受任务
	EventDoffTask					= 'EventDoffTask',		--放弃任务
	EventArriveTask					= 'EventArriveTask',	--到达任务地点
	EventDoneTask					= 'EventDoneTask',		--满足完成条件
	EventCompleteDailyTask			= 'EventCompleteDailyTask',--完成一个日环
	EventCompleteWeeklyTask			= 'EventCompleteWeeklyTask',--完成一个周环
	
	EventUseWeapon					= 'EventUseWeapon',		--使用武器
	EventUseJpWeapon				= 'EventUseJpWeapon',	--使用精品武器
	EventContinueKill				= 'EventContinueKill',	--连斩
	
	EventDrop						= 'EventDrop',			--掉落
	EventDropTaskItem				= 'EventDropTaskItem',	--掉落任务道具
	
	EventAddTeam                    = 'EventAddTeam',       --组队
	
	EventIntenAmulet				= 'EventIntenAmulet',	--熔炼护身宝甲 参数2 等级 参数3 成长
	EventUpgradeAmulet				= 'EventUpgradeAmulet',	--升阶护身宝甲 参数2 阶级 参数3 等级 参数4 成长 参数5 赐福
	
	EventSit						= 'EventSit',			--打坐
	EventPVP						= 'EventPVP',			--攻击玩家
	
	EventComposeStone				= 'EventComposeStone',	--宝石合成
	EventStoryStart					= 'EventStoryStart',	--开始一个剧情
	EventStoryFinish				= 'EventStoryFinish',	--完成一个剧情
	EventNpcCollect					= 'EventNpcCollect',	--完成一次采集
	
	EventOnLineTime					= 'EventOnLineTime',	--在线时间
	
	EventDungeonBegin				= 'EventDungeonBegin',   --副本活动开始，参数2：活动ID
	EventChangeLine					= 'EventChangeLine',     --换线，参数2：新线
	EventDaySign					= 'EventDaySign',     	 --q签到
	EventEnterDungeon				= 'EventEnterDungeon',	 --进入副本，参数2：活动ID
	
	--
	EventYanWuDungeon               = 'EventYanWuDungeon',      --进入演武
	EventDaPoDungeon                = 'EventDaPoDungeon',       --进入大破金营
	EventShowWeiDungeon             = 'EventShowWeiDungeon',    --进入守卫襄阳
	EventFengHuoDungeon             = 'EventFengHuoDungeon',    --进入烽火之路
	EventWuXingDungeon              = 'EventWuXingDungeon',     --进入五行道场
	EventWohuDungeon             	= 'EventWohuDungeon',     	--进入卧虎藏龙
	
	
	EventPassYanWuDungeon           = 'EventPassYanWuDungeon',      --通关演武
	EventPassDaPoDungeon            = 'EventPassDaPoDungeon',       --通关大破金营
	EventPassShowWeiDungeon         = 'EventPassShowWeiDungeon',    --通关守卫襄阳
	EventPassFengHuoDungeon         = 'EventPassFengHuoDungeon',    --通关烽火之路
	EventPassWuXingDungeon          = 'EventPassWuXingDungeon',     --通关五行道场
	EventPassWohuDungeon          	= 'EventPassWohuDungeon',    	--通关卧虎藏龙
	
	EventBumpPulse					= 'EventBumpPulse',		 --冲通一条脉
	EventElementUp					= 'EventElementUp',	 	 --五行升级，参数2：nil,参数3:五行类别
	EventVipLastTime				= 'EventVipLastTime',	 --VIP持续时间 ,参数3：VIP持续天数
	
	EventDantianUp					= 'EventDantianUp',		 --丹田升级
	EventSkillUp					= 'EventSkillUp',		 --技能升级
	EventLearnXinfa					= 'EventLearnXinfa',	 --学习心法
	
	EventPulseUp					= 'EventPulseUp',		 --经脉升级-总升级数
	EventPulseUp1					= 'EventPulseUp1',		 --经脉升级-阳维脉
	EventPulseUp2					= 'EventPulseUp2',		 --经脉升级-阴维脉
	EventPulseUp3					= 'EventPulseUp3',		 --经脉升级-阳跷脉
	EventPulseUp4					= 'EventPulseUp4',		 --经脉升级-阴跷脉
	EventPulseUp5					= 'EventPulseUp5',		 --经脉升级-带  脉
	EventPulseUp6					= 'EventPulseUp6',		 --经脉升级-冲  脉
	EventPulseUp7					= 'EventPulseUp7',		 --经脉升级-任  脉
	EventPulseUp8					= 'EventPulseUp8',		 --经脉升级-督  脉
	
	EventElemCombo    				= 'EventElemCombo',		 --五行套装
	EventBournUp 					= 'EventBournUp',		 --境界升级
	
	EventMountActivate				= 'EventMountActivate',	--激活坐骑事件
	EventMountUpGrade				= 'EventMountUpGrade',	--坐骑升阶事件，参数2为升阶后等阶
	EventMountUpLevel				= 'EventMountUpLevel',	--激活坐骑升级事件，参数2为升级后等级
	EventGetNewMount				= 'EventGetNewMount',	--获得新坐骑事件，参数2为当前拥有坐骑数
	EventMountUpQuality				= 'EventMountUpQuality',--坐骑品质提升事件，参数2为坐骑品质提升后的品质
	EventMountUpAptitude			= 'EventMountUpAptitude',--坐骑资质提升事件，参数2为坐骑提升哪项资质，参数3为提升后资质值（参数2 ：1为攻击资质，2为防御资质，3为根骨资质，4为技巧资质）
	EventMountUpSkill				= 'EventMountUpSkill',	--坐骑技能升级事件，参数2为坐骑升级哪个技能，参数3为升级后技能等级
	
	EventBuyShopItem			 	= 'EventBuyShopItem',		--买东西事件
	EventSellItem				    = 'EventSellItem',		--卖东西事件
	
	EventExpPresent					= 'EventExpPresent',	--向别人赠送经验，参数2 赠送次数dwTimeSended
	
	EventSetPoint					= 'EventSetPoint',		--人物属性加点
	EventResetPoint					= 'EventResetPoint',	--洗点
	
	EventJoinGuild					= 'EventJoinGuild',		--加入公会
	EventQuitGuild					= 'EventQuitGuild',		--退出公会
	EventGuildDonate				= 'EventGuildDonate',	--公会捐献 参数2 增加贡献
	EventGuildCombat				= 'EventGuildCombat',	--公会战结束
	EventGuildEscort				= 'EventGuildEscort',	--开始押镖
	
	EventChartUpdate				= 'EventChartUpdate',	--排行榜更新（榜内） 参数2 排行榜类型 参数3 名次
	EventChartRefresh				= 'EventChartRefresh',	--排行榜更新（全局）
	
	EventUseSkill					= 'EventUseSkill',		--使用技能 参数2 技能id
	
	EventTaoHuaMiZhen					= 'EventTaoHuaMiZhen',		--桃花迷阵通关
	
	EventCharge						= 'EventCharge',		--充值
	
	EventBeKilledBySelf				= 'EventBeKilledBySelf',	--自杀
	EventAddActivePoint				= 'EventAddActivePoint',	--增加活跃度
	
	EventTotalStrong				= 'EventTotalStrong',	--装备强化总数达到一定数量的时候，抛出事件，参数2为强化总数量

	EventUpSword				    = 'EventUpSword',       --名剑升阶
	
	EventCostBindGold				= 'EventCostBindGold',  --礼金消费 参数2 value
	
	EventAddSeverEventComplete		= 'EventAddSeverEvent',	--大事件添加成功 参数2 为添加的数据
	
	EventRefreshData				= 'EventRefreshData',	--定时系统抛出事件 参数2 数据ID  参数3 数据值
	
	NpcConnectionForgather			= 'NpcConnectionForgather',	--江湖人脉系统抛出结交事件 参数2 Npc编号
	
	NpcConnectionTeaching			= 'NpcConnectionTeaching',	--江湖人脉系统抛出指教事件 参数2 Npc编号  参数3 当前指教次数
	
	TreasrueMapUse					= 'TreasrueMapUse',	--藏宝图抛出使用事件 参数2 1次
	
	EventAddFiveElem				= 'EventAddFiveElem',	--五行真气某个增加 参数2 value
	
	EventChatLineMsg				= 'EventChatLineMsg',--世界喊话
	
	EventChargeRecord				= 'EventChargeRecord',--充值记录
	
	EventChargeRecordSig			= 'EventChargeRecordSig',--单笔充值最大值提升
	
	EventStudyKungFu				= 'EventStudyKungFu',  --学习功法 参数2为学习进度

	EventDefenseChange				= 'EventDefenseChange',  --玩家防御属性变化
	
	
	
	
---------------------------------------------------------------------------------dll system frist blood
	EventShowShop = 'EventShowShop', --第一次查看摊位
	EventAddShop = 'EventAddShop', --第一次摆摊
	EventGetTargetGift = 'EventGetTargetGift',--第一次领取成长目标奖励
	EventWeiwangGift = 'EventWeiwangGift',--第一次领取威望奖励
	EventNpcShopBuy = 'EventNpcShopBuy',--第一次商店购买
	--EventSellItem	 = 'EventSellItem',		--卖东西事件--第一次普通商店卖出东西
	--EventPulseUp	= 'EventPulseUp',		 --经脉升级
	EventVip = 'EventVip',--第一次使用VIP
	EventElemBalance = 'EventElemBalance', --第一次使用五行调和
	EventPlayerShopBuy = 'EventPlayerShopBuy', --第一次摊位购买东西
	EventTrade = 'EventTrade', --第一次玩家交易 
	EventGoldBuy = 'EventGoldBuy', --第一次元宝买购买的物品
	EventBindGoldBuy = 'EventBindGoldBuy', --第一次礼金买购买的物品
	EventBournExp 	= 'EventBournExp',		 --境界升级--第一次增加实战经验等级
	--EventBournUp 	= 'EventBournUp',		 --境界升级
	--EventPlayerShopBuy = 'EventPlayerShopBuy' --摊位购买
	EventPlayerShopSell = 'EventPlayerShopSell', --摊位出售
	EventGetVipGift = 'EventGetVipGift', --领取VIP物品
	----------------------------------------------------------------------------------dll add end
	EventRequestChartData = 'EventRequestChartData', --第一次使用排行榜
	EventRequestGuildItem = 'EventRequestGuildItem', --第一次使用世家商店
	EventRequestGuildSign = 'EventRequestGuildSign', --第一次使用世家签到
	EventRequestAchievementCompare = 'EventRequestAchievementCompare', --第一次使用成就比较

	
	EventEnterYZXY = 'EventEnterYZXY',--第一次参加夜战襄阳
	EventEnterMZZ = 'EventEnterMZZ',--第一次参与盟主战
	EventEnterLDZ = 'EventEnterLDZ',--第一次进入龙鼎地图
	EventEnterERG = 'EventEnterERG',--第一次进入恶人谷
	
	EventPacketExtend = 'EventPacketExtend',--第一次扩展背包
	EventStorageUse = 'EventStorageUse',--第一次使用仓库
	EventRepair = 'EventRepair',--第一次修理装备
	EventMuse = 'EventMuse',--第一次领取闭关经验
	EventPKMode = 'EventPKMode',--第一次切换PK模式
	EventTrumpet = 'EventTrumpet',--第一次使用喇叭
	EventWuShuang = 'EventWuShuang',--第一次使用无双
	EventProduce = 'EventProduce',--第一次学习合成技能
	
	EventMartial = 'EventMartial',--第一次演武
	EventTeamMar = 'EventTeamMar',--第一次团练
	------------------------------------------------------------------------zcs add
	EventGamble = "EventGamble";--摇骰子
	EventBranch = "EventBranch";--完成支线
	EventCollectSubmit = "EventCollectSubmit";--风云志 上交物品
	EventRewardCDKey = "EventRewardCDKey";--cd key 领礼包
	EventRewardLogin = "EventRewardLogin";--领连续登陆礼包
	EventRewardSign = "EventRewardSign";--领签到奖励
	------------------------------------------------------------------------zcs end
	
	-- 好友
	EventDaTan = "EventDaTan";	-- 打探事件
	
	--众志成城捐献次数
	EventBuildTotalNum = "EventBuildTotalNum",   --众志成城总次数
	EventBuildLabourNum = "EventBuildLabourNum",   --众志成城劳力次数
	EventBuildWoodNum = "EventBuildWoodNum",   --众志成城木材次数
	EventBuildStoneNum = "EventBuildStoneNum",   --众志成城石料次数
	
	--装备修炼
	EventEquipBuild = "EventEquipBuild",
	
	--岑夫子
	EventAnswerRight = "EventAnswerRight", --答对
	EventAnswerWrong = "EventAnswerWrong", --答错
	EventAnswer = "EventAnswer";--答题
	
	EventInject = "EventInject";--真气灌注
	EventPassFuQiDungeon="EventPassFuQiDungeon",--通关夫妻
	EventPassMaiFuDungeon="EventPassMaiFuDungeon",--通关十面埋伏
	
	EventKillStoneMonster = "EventKillStoneMonster";--杀死陨石怪
	EventKillNStoneMonster = "EventKillNStoneMonster";--杀死常规活动陨石怪
	EventKillFStoneMonster = "EventKillFStoneMonster";--杀死流星雨陨石怪
	
	EventGetMicroReward = "EventGetMicroReward";--领取微端奖励
	
	EventBeginRunEscort = "EventBeginRunEscort",   --个人押镖出镖
	EventEscortAward = "EventEscortAward",   --个人押镖成功交镖
	EventEnterMap8025 = "EventEnterMap8025",   --风云客栈 戏说天下
	
	EventNone = "EventNone",		--不会被触发的事件
	
	EventPetUseSkill				= 'EventPetUseSkill',   --宠物使用技能 参数2 技能id

	EventPetOutBattle = "EventPetOutBattle";--宠物召出
}
