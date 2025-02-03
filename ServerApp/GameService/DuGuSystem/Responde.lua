--[[
	[\brief 响应客户端点击事件
	[\author 王凌波
	[\date 2014-5-30
	[响应客户端点击修炼、点击剑套装、点击查看界面三个事件
	[根据处理结果发送消息给客户端
  ]]

local DuGuFunctions = _G.DuGuFunctions;
local tConfig 		= _G.DuGuConfig;

--[[
	[\brief 点击修炼事件
	[响应客户端点击修炼事件，并给客户端发送响应消息
	[\param number nPracticeID 修炼类型id，1是初级修炼，2是中级修炼，3是高级修炼
	[\param number nTimes 玩家请求的修炼次数
  ]]
function CDuGuSystem:OnHitPractice(nPracticeID, nTimes)
	if not self:HasAuthority(self.sAuthority) then 
        return;
    end
	-- 如果已到达最高历练值
	if self.dwEXP >= tConfig.EXPList[tConfig.nMaxLevel] then return; end
	local tThisList 	= tConfig.PracticeList[nPracticeID]; 
	local sTimesFlag 	= "n"..tThisList.sFlag.."Times";  	-- 获取修炼次数的属性名称
	local nUsedTimes 	= self[sTimesFlag] + nTimes; 		-- 总共修炼次数
	local nTimesLimit, nType, nId = tThisList.nTimesLimit, tThisList.nType, tThisList.nId;

	-- 如果次数超限
	if type(nTimesLimit) == "number" and nUsedTimes > nTimesLimit then return end
	local ItemSystem 	= self:GetPlayer():GetSystem("CItemSystem");
	local nAmount 		= tThisList.nNum * nTimes;
	local bIsEnough 	= ItemSystem:IsGoldEnough(nAmount);

	-- 如果是道具
	if nType == 1 then
		bIsEnough = ItemSystem:CheckDelEnumItemInPacketCond(nId, nAmount);
	end

	-- 如果数量不够
	if not bIsEnough then return; end

	-- 扣除道具或元宝
	if nType == 1 then
		ItemSystem:DelEnumItemInPacket(nId, nAmount, false, _G.ItemSysOperType.DuGuJiuJian);
	else
		ItemSystem:CostGold(nAmount, _G.ItemSysOperType.DuGuJiuJian);
	end

	-- 更新历练值、今日已修炼次数，并计算由新历练值造成的影响
	self[sTimesFlag] = nUsedTimes;
	local dwNewEXP 	= self.dwEXP + tThisList.dwPlus * nTimes;
	local bChanged  = self:SetEXP(dwNewEXP);

	-- 更新数据库中的历练值、今日可修炼次数
	self.objDBQuery:Execute("Update", {dwEXP = dwNewEXP, [sTimesFlag] = nUsedTimes});

	-- 向客户端发响应消息
	self:GetPlayer().DuGuJiuJian_ResponsePracticeMsg{
		dwNewEXP = dwNewEXP,
		nPracticeID = nPracticeID,
		nTimes = nUsedTimes};
	if bChanged and DuGuFunctions.PhaseCal(dwNewEXP) >= tConfig.nBroadCastMinPhase
		then self:Broadcast(1) end
end

--[[
	[\brief 点击剑套装事件
	[响应客户端点击剑套装事件，并给客户端发送响应消息
	[\param number nSwordID 玩家点击的剑套装id
  ]]
function CDuGuSystem:OnHitActivate(nSwordID)
	if not self:HasAuthority(self.sAuthority) then 
        return;
    end
	-- 如果修炼阶段（即式）不够
	if DuGuFunctions.PhaseCal(self.dwEXP) < nSwordID then return; end

	-- 如果不是顺序激活
	if nSwordID ~= self.nActSwordId + 1 then return; end

	local ItemSystem 	= self:GetPlayer():GetSystem("CItemSystem");
	local tThisNeed 	= tConfig.SwordNeed[nSwordID];
	local nId, nNum 	= tThisNeed.nId, tThisNeed.nNum;

	local bIsEnough = ItemSystem:CheckDelEnumItemInPacketCond(nId, nNum);
	-- 如果道具不够
	if not bIsEnough then return; end

	-- 扣除道具
	ItemSystem:DelEnumItemInPacket(nId, nNum, false, _G.ItemSysOperType.DuGuJiuJian);

	-- 更新已激活的剑套装，计算由新剑套装值造成的影响
	local bIsActSwordIdChanged = self:SetActSwordId(nSwordID);   

	-- 更新数据库中的剑套装id
	self.objDBQuery:Execute("Update", {nActSwordId = nSwordID});

	-- 向客户端发消息
	self:GetPlayer().DuGuJiuJian_ResponseActivateMsg{nSwordID = nSwordID};

	-- 如果需要广播
	if bIsActSwordIdChanged then self:Broadcast(2); end
end

--[[
	[\brief 点击查看界面事件
	[响应客户端点击查看界面事件，并给客户端发送响应消息
	[\param number dwRoleId 要查看的其他玩家的角色id
  ]]
function CDuGuSystem:OnHitCheckOther(dwRoleId)
	-- 远程调用，参数为：被查看的玩家id、被查看的系统名称、远程调用的方法名、查看者的id
	_G.GSRemoteCall(dwRoleId, "CDuGuSystem", "BeChecked", {self:GetPlayer():GetRoleID()});
end

