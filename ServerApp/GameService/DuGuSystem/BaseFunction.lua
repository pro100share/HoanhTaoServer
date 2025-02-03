--[[
	[\brief 系统需要的基本函数
	[\author 王凌波
	[\date 2014-5-30
	[实现了各个基本功能，供系统其它模块调用
  ]]

local DuGuFunctions = _G.DuGuFunctions;

--[[
	[\brief 同步信息到客户端
	[向客户端同步历练值、激活的剑套装id
  ]]
function CDuGuSystem:Synchronize()
	self:GetPlayer().DuGuJiuJian_SynchronizeMsg{
		dwEXP 		= self.dwEXP,
		nActSwordId = self.nActSwordId,
		tTimes 		= {	[1] = self.nPrimaryTimes,
						[2] = self.nIntermediateTimes,
						[3] = self.nAdvancedTimes,}};
end	

function CDuGuSystem:DealBreakPro()
	-- TODO，
	--这个要处理吗
end

--[[
	[\brief 增加属性
	[分别计算由历练值和剑套装增加的属性
	[\param number dwEXP 历练值
	[\param number nActSwordId 剑套装
  ]]
function CDuGuSystem:AddAttribute()
	local tAttribute 	= _G.SSingleAttrChange:new();
	-- 增加由历练值dwEXP所加成的属性
	local tIncrease = DuGuFunctions.IncreaseCal(self.dwEXP);
	for k, v in pairs(tIncrease) do
		tAttribute[k] = tAttribute[k] + v;
	end
	-- 增加由剑套装所加成的属性
	local tSwordIncrease = DuGuFunctions.SwordIncreaseCal(self.nActSwordId);
	for k, v in pairs(tSwordIncrease) do
		tAttribute[k] = tAttribute[k] + v;
	end
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyDuGuUpdate(tAttribute);
end

--[[
	[\brief 向客户端广播
	[当到达新阶段或激活新的剑套装时，向客户端广播
	[\param number nType 1表示到达新阶段，2表示激活新剑套装
  ]]
function CDuGuSystem:Broadcast(nType)
	-- 准备要广播的数据
	local objPlayer = self:GetPlayer();
	local dwRoleId, sName, nPhase, nActSwordId = 
		objPlayer:GetRoleID(), 
		objPlayer:GetName(), 
		DuGuFunctions.PhaseCal(self.dwEXP), 
		self.nActSwordId;
	-- 参数准备
	local sMsgName, tInfo;
	if nType == 1 then
		sMsgName = "DuGuJiuJian_BroadcastPhaseMsg";
		tInfo = {dwRoleId = dwRoleId, sName = sName, nPhase = nPhase,}
	else
		sMsgName = "DuGuJiuJian_BroadcastSwordMsg";
		tInfo = {dwRoleId = dwRoleId, sName = sName, nActSwordId = nActSwordId,}
	end
    -- 获取全部玩家
	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		setNet[#setNet+1] = objPlayer.objNet;
	end
	_groupcallout(setNet, sMsgName, tInfo);
end

--[[
	[\brief 被其他玩家查看信息
	[\param number dwFromRoleId 查看者的角色id
  ]]
function CDuGuSystem:BeChecked(dwFromRoleId) 
	local bHasAuthority = self:HasAuthority(self.sAuthority);
	_G.GSRemoteCall(dwFromRoleId, "CDuGuSystem", "GetCheckResult", 
		{bHasAuthority, self.dwEXP, self.nActSwordId});
end

--[[
	[\brief 获取查看结果
	[\param boolean bOtherHasAuthority true表示被查看者有本系统权限，false表示无权限
  	[\param number dwOtherEXP 被查看者的历练值，如果无权限返回nil
  	[\param number nOtherActSwordId 被查看者激活的剑套装的id，如果无权限返回nil
  ]]													--Todo 缩短参数命令 bOtherHasAuthority 变为 bHasAuthority或bAuthority
													--dwOtherEXP 变为 nExp
													--nOtherActSwordId 变为 nActSowrdID   -- ID 即为缩写 应该都大写
function CDuGuSystem:GetCheckResult(bAuthority, dwOtherEXP, nOtherActSwordId)
	local objPlayer = self:GetPlayer();
	if bAuthority then                    --Todo 此判断没有实际意义
		objPlayer.DuGuJiuJian_ResponseCheckOtherMsg{
			bHasAuthority 	= bAuthority,
			dwEXP 			= dwOtherEXP, 
			nActSwordId 	= nOtherActSwordId,};
	else
		objPlayer.DuGuJiuJian_ResponseCheckOtherMsg{bHasAuthority = bAuthority};
	end
end

--[[
	[\brief 定时将数据库中修炼次数清零
  ]]
function CDuGuSystem:ResetPracticeTimes() 
	-- 检查权限
	if not self:HasAuthority(self.sAuthority) then
		return;
	end
	-- 更新系统属性
	self.nPrimaryTimes 		= 0;
	self.nIntermediateTimes = 0;
	self.nAdvancedTimes 	= 0;
	-- 同步到客户端
	self:Synchronize();
end
