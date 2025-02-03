
---玩家系统对象注册器
_G.CPlayerSystems = {}
function CPlayerSystems:new(objPlayer)
	local obj = CSystemManager:new(objPlayer)
	obj.OnRegSystems = CPlayerSystems.OnRegSystems;
	return obj;
end;


--在这里面注册系统
function CPlayerSystems:OnRegSystems()
	--self:AddSystem(CItemSystem:new());
	self:AddSystem(CFriendSystem:new());--?
	--self:AddSystem(CAvoidAddictedSystem:new()); --?
	--self:AddSystem(CTaskSystem:new());
	--self:AddSystem(CMailSystem:new());
	
	--self:AddSystem(CTianGuanCiFuSystem:new());
	--self:AddSystem(CMarriageSystem:new());
	--self:AddSystem(CMountSystem:new());
	--self:AddSystem(CNoviceSystem:new());
	--self:AddSystem(CAchievementSystem:new());
	--self:AddSystem(CEvaluateSystem:new());
	--self:AddSystem(CAmuletSystem:new());
	--self:AddSystem(CDataCenterSystem:new());
	self:AddSystem(CGuildSystem:new());

	--self:AddSystem(CAutoBattleSystem:new());
	--self:AddSystem(CDuplSystem:new());
	--self:AddSystem(CBuffSystem:new());
	--self:AddSystem(CSkillSystem:new());
	--self:AddSystem(CMuseSystem:new());
	--self:AddSystem(CPKSystem:new());
	--self:AddSystem(CVipSystem:new());
	--self:AddSystem(CPulseSystem:new());
	--self:AddSystem(CMissionDailySystem:new());
	--self:AddSystem(CBournSystem:new());
	--self:AddSystem(CSwordSystem:new());
	--self:AddSystem(CRecordSystem:new());
	--self:AddSystem(CFiveElementSystem:new());
	--self:AddSystem(CGiftSystem:new());
	--self:AddSystem(CMallSystem:new());
	--self:AddSystem(CPlayerShopSystem:new());
	--self:AddSystem(CGrowupTargetSystem:new());
	--self:AddSystem(CChatSystem:new());
	--self:AddSystem(CSettingSystem:new());
	--self:AddSystem(CMartialSystem:new());
	--self:AddSystem(CMapSystem:new());
	--self:AddSystem(CShortcutSystem:new());
	--self:AddSystem(CServerEventSystem:new());
	--self:AddSystem(CCollectSystem:new());
	--self:AddSystem(CNpcConnectionSystem:new());

	--self:AddSystem(CTimeRewardSystem:new());
end;
------------------------------------------------------------
--系统实例管理器
------------------------------------------------------------

 