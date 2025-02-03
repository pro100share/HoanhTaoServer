
---玩家系统对象注册器
_G.CPlayerSystems = {}
function CPlayerSystems:new(objPlayer)
	local obj = CSystemManager:new(objPlayer)
	if CConfig.bIsCrossSvr then		
		obj.CrossOnRegSystems = CPlayerSystems.CrossOnRegSystems;
	else
		obj.OnRegSystems = CPlayerSystems.OnRegSystems;
	end;
	return obj;
	
end;


--在这里面注册系统
function CPlayerSystems:OnRegSystems() 
	--宠物系统
	self:AddSystem(CPetSystem:new())
	self:AddSystem(CTaskSystem:new(),eInterval._1min);--任务
	self:AddSystem(CRefreshSystem:new());
	self:AddSystem(CAuthoritySystem:new());
	self:AddSystem(CBattleSystem:new());  
	self:AddSystem(CNPCSystem:new());
	self:AddSystem(CBuffSystem:new(),eInterval._10min);
	self:AddSystem(CDuplSystem:new(), eInterval._1sec);
	self:AddSystem(CMapSystem:new(),eInterval._100ms);
	self:AddSystem(CSkillSystem:new());
	self:AddSystem(CItemSystem:new());

	self:AddSystem(CTianGuanCiFuSystem:new());

	self:AddSystem(CSettingSystem:new());	--设置系统系统

	self:AddSystem(CVipSystem:new(),eInterval._1min);	--vip系統

	self:AddSystem(CAmuletSystem:new());	
	self:AddSystem(CEquipIntensifySystem:new());----装备强化系统
	self:AddSystem(CMonsterSystem:new());
	self:AddSystem(CFiveElemSystem:new(),eInterval._1sec);
	self:AddSystem(CBournSystem:new());
	self:AddSystem(CMuseSystem:new());

	self:AddSystem(CNpcShopSystem:new());	--NPC商店
	self:AddSystem(CStoneSystem:new());
	self:AddSystem(CTradeSystem:new(),eInterval._1sec);
	self:AddSystem(CPKSystem:new());
	self:AddSystem(CPlayerShopSystem:new());
	
	self:AddSystem(CShortcutSystem:new());
	self:AddSystem(CTeamSystem:new(),eInterval._10sec);
	self:AddSystem(CGiftSystem:new());
	self:AddSystem(CMarriageSystem:new(), eInterval._1min);
	self:AddSystem(CStateSystem:new());
	self:AddSystem(CMallSystem:new());
	
	self:AddSystem(CDropSystem:new());
	self:AddSystem(CChatSystem:new(),eInterval._1sec);
	self:AddSystem(CPlayerEventCenterSystem:new());
	self:AddSystem(CGrowupTargetSystem:new()); 
	self:AddSystem(CBanditSystem:new());
	self:AddSystem(CNoviceSystem:new()); 
	self:AddSystem(CChartSystem:new(),eInterval._10min);
	self:AddSystem(CTitleSystem:new());
	self:AddSystem(CEvaluateSystem:new());
	self:AddSystem(CAchievementSystem:new());
	
	self:AddSystem(CDataCenterSystem:new());
	self:AddSystem(CGuildSystem:new(),eInterval._10min);
	self:AddSystem(CContinueKillSystem:new(),eInterval._1sec);
	self:AddSystem(CMissionDailySystem:new(),eInterval._1min);
	self:AddSystem(PlayerShowTextSystem:new());
	self:AddSystem(CGMSystem:new(),eInterval._1sec);
	
	self:AddSystem(CMountSystem:new(),eInterval._1min);--坐骑系统
	self:AddSystem(CStorySystem:new());
	self:AddSystem(CFriendSystem:new());
	self:AddSystem(CMailSystem:new());
	self:AddSystem(CAvoidAddictedSystem:new());
	self:AddSystem(CPotSystem:new());
	
	self:AddSystem(CScriptSystem:new(),eInterval._10min);
	self:AddSystem(CIncomeRecordSystem:new());
	self:AddSystem(CAutoBattleSystem:new());
	
	self:AddSystem(CMartialSystem:new());
	self:AddSystem(CWarSystem:new());
	
	self:AddSystem(CNoticeSystem:new());
	self:AddSystem(CRewardCodeSystem:new());
	self:AddSystem(CSwordSystem:new(),eInterval._10min);
	self:AddSystem(CProduceSystem:new());
	
	self:AddSystem(CServerEventSystem:new());--服务器大事件

	self:AddSystem(CAllianceLeaderSystem:new());

	self:AddSystem(CLogSystem:new());--日志 2012-12-28段磊磊

	self:AddSystem(CGambleSystem:new());

	--self:AddSystem(CNpcConnectionSystem:new());--江湖人脉
	
	self:AddSystem(CCollectSystem:new());
	
	--self:AddSystem(CActiveSystem:new());--活动系统
	
	self:AddSystem(CTimeRewardSystem:new(),eInterval._1min);
	self:AddSystem(CExchangeSystem:new());

	self:AddSystem(CFirstBloodSystem:new());
	self:AddSystem(CBuildRampartSystem:new(),eInterval._1min);
	self:AddSystem(CFullAwardSys:new());
	
	self:AddSystem(CFestivalSystem:new(),eInterval._100ms);
	--每日在线时间领奖系统
	self:AddSystem(COnlineGiftSystem:new());
	
	self:AddSystem(CBaiduSystem:new());
	
	self:AddSystem(CBaiduBanditSystem:new());
	
	self:AddSystem(CPulseSystem:new());
	
	--商业化礼包领取记录系统
	self:AddSystem(CCommercialGiftSys:new());
	--商业化活动系统
	self:AddSystem(CCommercialActSystem:new());
	
	--炼制丹药系统
	self:AddSystem(CRefineMaterialSystem:new());
	self:AddSystem(CErrantSystem:new());
	--装备修炼
	self:AddSystem(CEquipBuildSystem:new());
	
	self:AddSystem(CSoulSystem:new());

	--宝箱系统
	self:AddSystem(CChestSystem:new());
	---疯狂的锄头系统
	self:AddSystem(CFrenzyHoeSystem:new());

	---百度影音推广系统
	self:AddSystem(CBaiduPlayerSystem:new());
	--修行系统
	self:AddSystem(CPracticeSystem:new());
	--装备分解
	self:AddSystem(CEquipDecomposeSystem:new());


	--功法系统
	self:AddSystem(CKungFuSystem:new());

	--抽奖系统
	self:AddSystem(CLotterySystem:new());
	---个人押镖系统
	self:AddSystem(CEscortSystem:new());
	--杀人如麻系统
	self:AddSystem(CMegaKillSystem:new());
--记录玩家登陆天数
	self:AddSystem(CLoginDaysSystem:new());    
    --附加属性翻倍符系统
    self:AddSystem(CPropertyScrollSystem:new());
	---名剑注灵系统
	self:AddSystem(CSwordFoundrySystem:new());

    -- 360红钻
    self:AddSystem(C360RedJewelSystem:new());
	----阵法系统
	self:AddSystem(CMatrixMethodSystem:new());

	--联运平台礼包系统
	self:AddSystem(CUnionPlatGiftSystem:new());
	--棋魂系统
	self:AddSystem(CQihunSystem:new());
	--侠义勋章
	self:AddSystem(CErrantHonorSystem:new());
	
	--经验整合系统
	self:AddSystem(CExpIntegrateSystem:new())
	
	--尤物志系统
	self:AddSystem(CYouWuZhiSystem:new());
	--盾牌系统,盾牌系统与铁布衫系统有调用关系,位置不能变
	self:AddSystem(CShieldSystem:new());
	--功法-铁布衫
	self:AddSystem(CTieBuShanSystem:new());

	----聚灵珠系统
	self:AddSystem(CCollectJewelSystem:new());
	---在线礼包
	self:AddSystem(COnlineAwardsSystem:new());
	--群侠挑战系统
	self:AddSystem(CChallengeQunXiaSystem:new());
    --武侠令
	self:AddSystem(CWuXiaLingSystem:new());
	----聚灵珠等级版
	self:AddSystem(CCollectJewelLevelSystem:new());
	---童姥功
	self:AddSystem(CPractiseSkillSystem:new());
    -- 实战隐藏属性
    self:AddSystem(CBournHideAttrSystem:new());

	---酒葫芦
	self:AddSystem(CGourdSystem:new());
	--增加属性系统(吃丹)
	self:AddSystem(CAddAttrSystem:new());
	--群侠录卡片收集
	self:AddSystem(CQunXiaLuSystem:new());

	--元宵灯会
	self:AddSystem(CLanternSystemSystem:new());
	self:AddSystem(CKoreaAvoidAddictedSystem:new(),eInterval._1min);
	--跨服战场
	self:AddSystem(CCrossSvrSystem:new());
	--360游戏盒子
	self:AddSystem(C360GameBoxSystem:new());
	self:AddSystem(CGestSystem:new());
	--时装系统
	self:AddSystem(CFashionDressSystem:new(), eInterval._1sec);
	--青云令
	self:AddSystem(CQingYunLingSystem:new());
	--圣火令系统
	self:AddSystem(CShengHuoLingSystem:new());
	--珍珑棋局系统
	self:AddSystem(CZhenlongChessSystem:new());
	--战斗力提升
	self:AddSystem(CBattleScoreUpSystem:new());
	--独孤九剑系统
	self:AddSystem(CDuGuSystem:new());
	-- 排行榜奖励
	self:AddSystem(CChartAwardSystem:new());
	--暗器系统
	self:AddSystem(CHiddenWeaponSystem:new());
	--功法扩展系统
	self:AddSystem(CKungFuExtendSystem:new());
	--战骑诀
	self:AddSystem(CZhanQiJueSystem:new());
	-- 通天塔系统
	self:AddSystem(CTongTianTowerSystem:new());
	-- 修炼金身
	self:AddSystem(CGoldenBodySystem:new(), _G.GoldenBodyConfig.nPracticeTime);
	--华山论剑系统
	self:AddSystem(CTalkSwordSystem:new(),eInterval._1sec);
	--英雄令
	self:AddSystem(CHeroTokenSystem:new());
    -- 古董系统
    self:AddSystem(CCurioSystem:new());
	--战旗系统
	self:AddSystem(CBannerSystem:new());
    -- 资源回收系统
    self:AddSystem(CRecyclingSystem:new());
end;
--玩家系统
--玩家系统--玩家系统--玩家系统
--玩家系统
--玩家系统
function CPlayerSystems:CrossOnRegSystems()
	self:AddSystem(CAuthoritySystem:new());
	self:AddSystem(CBattleSystem:new());  
	self:AddSystem(CNPCSystem:new());
	self:AddSystem(CMapSystem:new(),eInterval._100ms);
	self:AddSystem(CCrossSvrSystem:new(),eInterval._1sec);
	self:AddSystem(CSkillSystem:new());
	self:AddSystem(CItemSystem:new());
	self:AddSystem(CBuffSystem:new(),eInterval._10min);
	self:AddSystem(CStateSystem:new());
	self:AddSystem(CCSNpcShopSystem:new());
	self:AddSystem(CKungFuSystem:new());
	self:AddSystem(CTieBuShanSystem:new());
	self:AddSystem(CGourdSystem:new());
	self:AddSystem(CSwordSystem:new(),eInterval._10min);
	self:AddSystem(CMatrixMethodSystem:new());
	self:AddSystem(CDropSystem:new());
	self:AddSystem(CPractiseSkillSystem:new());
	self:AddSystem(CScriptSystem:new(),eInterval._10min);
	self:AddSystem(CMonsterSystem:new());
	self:AddSystem(CPKSystem:new());
	self:AddSystem(CAmuletSystem:new());
	self:AddSystem(CMountSystem:new(),eInterval._1min);--坐骑系统
	self:AddSystem(CPlayerEventCenterSystem:new());
	self:AddSystem(CChatSystem:new(),eInterval._1sec);
	self:AddSystem(CGMSystem:new(),eInterval._1sec);
	self:AddSystem(CIncomeRecordSystem:new());
	self:AddSystem(CShortcutSystem:new());
	self:AddSystem(CNoticeSystem:new());
	self:AddSystem(CBattleScoreUpSystem:new());
	self:AddSystem(CHiddenWeaponSystem:new());
	self:AddSystem(CShieldSystem:new());
end;
------------------------------------------------------------
--系统实例管理器
------------------------------------------------------------

 
