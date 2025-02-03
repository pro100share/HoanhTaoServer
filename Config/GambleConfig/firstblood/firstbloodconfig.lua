
--第一次 配置

_G.FirstBloodSwitch = true --是否记录（开关）
--[[
	配置说明
	szEventName：触发发往事件中心的事件名
	dwSubParamIndex：需要记录的额外数据所在参数位置（将会以字符串形式保存,如果是表，则用 json.encode 否则 tostring ）
	------------------------------------------------------
	FirstBloodSwitch：全局开关，为 false 则不进行任何记录
	
	--默认记录的数据为：
	dwRoleID		角色id
	dwLevel			角色等级
	dwTaskID		当前正在进行或可进行的主线任务id
	dwGold			元宝
	dwBindGold		礼金
	dwMoney			背包和仓库的游戏币总和
	--
--]]

_G.FirstBloodConfig = {
	[1]={szEventName="EventBranch",dwSubParamIndex=0};--第一次完成支线任务
	[2]={szEventName="EventUpgradeAmulet",dwSubParamIndex=0};--第一次升阶护身宝甲等级
	[3]={szEventName="EventMountUpGrade",dwSubParamIndex=0};--第一次坐骑升阶等级
	[4]={szEventName="EventPulseUp",dwSubParamIndex=0};--第一次升级经脉等级
	[5]={szEventName="EventUpSword",dwSubParamIndex=0};--第一次升阶宝剑等级
	[6]={szEventName="EventBournExp",dwSubParamIndex=0};--第一次增加实战经验等级
	[7]={szEventName="EventBournUp",dwSubParamIndex=0};--第一次升级实战等级
	[8]={szEventName="EventSkillUp",dwSubParamIndex=0};--第一次升级技能等级
	[9]={szEventName="EventStoneSet",dwSubParamIndex=0};--第一镶嵌宝石
	[10]={szEventName="EventComposeStone",dwSubParamIndex=0};--第一合成宝石
	[11]={szEventName="EventVip",dwSubParamIndex=0};--第一次使用VIP
	[12]={szEventName="EventCharge",dwSubParamIndex=0};--第一次充值等级
	[13]={szEventName="EventGoldBuy",dwSubParamIndex=0};--第一次元买购买的物品
	[14]={szEventName="EventBindGoldBuy",dwSubParamIndex=0};--第一次礼金购买的物品
	[15]={szEventName="EventRewardCDKey",dwSubParamIndex=0};--第一次使用CDK领取礼包
	[16]={szEventName="EventAddShop",dwSubParamIndex=0};--第一次摆摊
	[17]={szEventName="EventEnterERG",dwSubParamIndex=0};--第一次进入恶人谷
	[18]={szEventName="EventEnterYZXY",dwSubParamIndex=0};--第一次参加夜战襄阳
	[19]={szEventName="EventCollectSubmit",dwSubParamIndex=0};--第一次使用风物志上交道具
	[20]={szEventName="EventWeiwangGift",dwSubParamIndex=0};--第一次领取威望礼包。每日活跃度那个
	[21]={szEventName="EventBeKilled",dwSubParamIndex=0};--第一次死亡
	[22]={szEventName="EventAchievementReward",dwSubParamIndex=0};--第一次领取成就奖励
	[23]={szEventName="EventProduce",dwSubParamIndex=0};--第一次学习合成技能
	[24]={szEventName="EventLearnXinfa",dwSubParamIndex=0};--第一次开启心法
	[25]={szEventName="EventYanWuDungeon",dwSubParamIndex=0};--第一次进入演武节堂
	[26]={szEventName="EventDaPoDungeon",dwSubParamIndex=0};--第一次进入大破金营
	[27]={szEventName="EventShowWeiDungeon",dwSubParamIndex=0};--第一次进入守卫襄阳
	[28]={szEventName="EventFengHuoDungeon",dwSubParamIndex=0};--第一次进入烽火之路
	[29]={szEventName="EventWuXingDungeon",dwSubParamIndex=0};--第一次进入五行道场
	[30]={szEventName="EventPassYanWuDungeon",dwSubParamIndex=0};--通关演武节堂
	[31]={szEventName="EventPassDaPoDungeon",dwSubParamIndex=0};--通关大破金营
	[32]={szEventName="EventPassShowWeiDungeon",dwSubParamIndex=0};--通关守卫襄阳
	[33]={szEventName="EventPassFengHuoDungeon",dwSubParamIndex=0};--通关入烽火之路
	[34]={szEventName="EventPassWuXingDungeon",dwSubParamIndex=0};--通关五行道场		
	[35]={szEventName="EventResetPoint",dwSubParamIndex=0};--第一次洗点等级
	[36]={szEventName="EventJoinGuild",dwSubParamIndex=0};--第一次加入世家
	[37]={szEventName="EventGuildDonate",dwSubParamIndex=0};--第一次加入世家捐献
	[38]={szEventName="EventGuildEscort",dwSubParamIndex=0};--第一次参与世家押镖
	[39]={szEventName="EventEnterLDZ",dwSubParamIndex=0};--第一次进入龙鼎地图
	[40]={szEventName="EventEnterMZZ",dwSubParamIndex=0};--第一次参与盟主战
	[41]={szEventName="EventKillBossMonster",dwSubParamIndex=0};--第一次杀死世界BOSS  
	[42]={szEventName="EventMuse",dwSubParamIndex=0};--第一次领取闭关经验
	[43]={szEventName="EventGetTargetGift",dwSubParamIndex=0};--第一次领取成长目标
	[44]={szEventName="EventAddFriend",dwSubParamIndex=0};--第一次加好友
	[45]={szEventName="EventPacketExtend",dwSubParamIndex=0};--第一次扩展背包
	[46]={szEventName="EventTrumpet",dwSubParamIndex=0};--第一次使用喇叭
	[47]={szEventName="EventChatLineMsg",dwSubParamIndex=0};--第一次世界喊话
	[48]={szEventName="EventRewardSign",dwSubParamIndex=0};--第一次领取连续签到礼包
	[49]={szEventName="EventNpcShopBuy",dwSubParamIndex=0};--第一次普通商店购买东西
	[50]={szEventName="EventShowShop",dwSubParamIndex=0};--第一次查看摊位
	[51]={szEventName="EventStorageUse",dwSubParamIndex=0};--第一次使用仓库
	[52]={szEventName="EventCompleteWeeklyTask",dwSubParamIndex=0};--第一次跑风云任务
	[53]={szEventName="EventGamble",dwSubParamIndex=0};--第一次摇骰子
	[54]={szEventName="EventBeKilled",dwSubParamIndex=3};--第一次被怪物杀死
	[55]={szEventName="EventBeKilled",dwSubParamIndex=3};--第一次被玩家杀死
	[56]={szEventName="EventPKMode",dwSubParamIndex=0};--第一次切换PK模式
	[57]={szEventName="EventKillPlayer",dwSubParamIndex=0};--第一次杀人
	[58]={szEventName="EventGetMarry",dwSubParamIndex=0};--第一次结婚
	[59]={szEventName="EventMarryDinner",dwSubParamIndex=0};--第一次举办婚礼
	[60]={szEventName="EventAddTeam",dwSubParamIndex=0};--第一次组队
	[61]={szEventName="EventEquipStrong",dwSubParamIndex=0};--第一次使用装备强化
	[62]={szEventName="EventAppendProp",dwSubParamIndex=0};--第一次洗炼装备品质
	[63]={szEventName="EventResetAppendPropType",dwSubParamIndex=0};--第一次洗炼装备类型
	[64]={szEventName="EventAddAppendPropValue",dwSubParamIndex=0};--第一次洗炼装备数值
	[65]={szEventName="EventEquipUpGrade",dwSubParamIndex=0};--第一次洗炼装备升阶
	[66]={szEventName="EventElemBalance",dwSubParamIndex=0};--第一次使用五行调和
	[67]={szEventName="EventRepair",dwSubParamIndex=0};--第一次修理装备
	[68]={szEventName="EventMartial",dwSubParamIndex=0};--第一次演武
	[69]={szEventName="EventTeamMar",dwSubParamIndex=0};--第一次团练
	[70]={szEventName="EventTrade",dwSubParamIndex=0};--第一次玩家交易
	[71]={szEventName="EventSellItem",dwSubParamIndex=0};--第一次普通商店卖出东西
	[72]={szEventName="EventPlayerShopBuy",dwSubParamIndex=0};--第一次摊位购买东西
	[73]={szEventName="EventRequestGuildSign",dwSubParamIndex=0};--第一次领取世家签到福利
	[74]={szEventName="EventDaySign",dwSubParamIndex=0};--第一次签到
	[75]={szEventName="EventRewardLogin",dwSubParamIndex=0};--第一次领连续登陆礼包7天
	[76]={szEventName="EventWuShuang",dwSubParamIndex=0};--第一次使用无双
	[77]={szEventName="EventRequestAchievementCompare",dwSubParamIndex=0};--第一次成就对比
	[78]={szEventName="EventRequestGuildItem",dwSubParamIndex=0};--第一次世家商店兑换道具
	[79]={szEventName="EventRequestChartData",dwSubParamIndex=0};--第一次打开排行榜
	[80]={szEventName="EventDaTan",dwSubParamIndex=0};--第一次使用打探
};
_G.CountNumberSwitch = true 
_G.CountNumberConfig = 
{
	[1] = "EventEnterDungeon"; -- 进入副本次数
	[2] = ""; -- 通关副本次数
	[3] = "EventMarryDinner"; -- 婚宴举办次数
	[4] = "EventGamble"; -- 摇骰子次数
	[5] = ""; -- 完成风云任务总数
	[6] = "EventResetPoint"; -- 洗点次数 
	[7] = ""; -- 挖宝总次数
	[8] = ""; -- 闭关领取次数 单倍
	[9] = ""; -- 闭关领取次数 双倍
	[10] = ""; -- 装备强化总次数
	[11] = "EventAppendProp"; -- 洗炼装备品质总次数
	[12] = "EventResetAppendPropType"; -- 洗炼装备类型总次数
	[13] = "EventAddAppendPropValue"; -- 洗炼装备数值总次数
	[14] = "EventEquipUpGrade"; -- 洗炼装备升阶总次数
	[15] = "EventElemBalance"; -- 使用五行调和总次数
	[16] = "EventPlayerShopSell"; -- 摆摊出售总次数
	[17] = "EventPlayerShopBuy"; -- 摆摊购买总次数
	[18] = "EventGetVipGift"; -- VIP每日奖励领取次数
	[19] = "EventEnterMZZ"; -- 参加盟主战次数
	[20] = "EventEnterYZXY"; -- 参加夜战襄阳次数
	[21] = "EventEnterLDZ"; -- 参加龙鼎战次数次数
	[22] = "EventGuildEscort"; -- 世家运镖次数 
	[23] = "EventRequestGuildSign"; -- 世家福利领取次数 
	[30] = "EventPassYanWuDungeon";--通关演武节堂
	[31] = "EventPassDaPoDungeon";--通关大破金营
	[32] = "EventPassShowWeiDungeon";--通关守卫襄阳
	[33] = "EventPassFengHuoDungeon";--通关入烽火之路
	[34] = "EventPassWuXingDungeon";--通关五行道场	
}