--[[
	功能：血魔功扩展
	作者：赵飞
	时间：2014-5-19
]]
local cfg = MegaKillAptitudeConfig
 --[[
   [ \brief 开始精练
   [ \param number nCount 精炼次数
   ]]
function CMegaKillSystem:MegaKillRefine(nCount)
	local nBefore = self:GetAptitude()
    local setConsume = cfg.GetConsume(nBefore + 1);
	local Max = cfg.GetMaxDegree(self.dwLevel) 
	if Max < (nBefore + nCount) then
		nCount = Max - nBefore
	end
    local setParam = {
        dwItemID = setConsume.dwItemID;
        dwNum = setConsume.dwNum * nCount;
        dwLevel = self.dwLevel;
		nCount = nCount
    };
    local dwErrorCode = cfg.CanDo(self, setParam);
    if dwErrorCode == 0 then
        cfg.Do(self, setParam);
		self:OnMegaKill_BroadCastAptitudeMsg(nBefore)
		self.objDBQuery:UpdateAptitude(self:GetAptitude());
		self:Calculate();
    end
    self.objPlayer.MegaKill_RefineMsg{
	ErrorCode = dwErrorCode,dwAptitude = self:GetAptitude()};
end

 --[[
   [ \brief 获取精练值
   [ \return number 精练值
   ]]
function CMegaKillSystem:GetAptitude()
   return self.dwAptitude or 0;
end

 --[[
   [ \brief 修改精练值
   [ \param number nValue 精炼值
   ]]
function CMegaKillSystem:SetAptitude(nValue)
   self.dwAptitude = nValue;
end

 --[[
   [ \breif 删除物品
   [ \param table setData 物品信息
   ]]
function CMegaKillSystem:DeleteItem(setData)
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        setData[1],
        setData[2],
        false,
        _G.ItemSysOperType.MegaKill);
end

 --[[
   [ \brief 是否满精练值
   ]]
function CMegaKillSystem:IsFull()
   return cfg.GetMaxDegree(self.dwLevel) <= self.dwAptitude;
end

 --[[
   [ \brief 铸造属性
   [ \param number nValue 精炼值
   [ \param table attrInfo 属性信息
   ]]
function CMegaKillSystem:GetAddAptitudeAttr(dwAptitude)
	local attrInfo = cfg.GetProperty(dwAptitude)
	return attrInfo;
end

 --[[
   [ \brief 能否删除物品
   [ \param table setData 物品信息
   [ \return boolean 是否
   ]]
function CMegaKillSystem:IsCanDeleteItem(setData)
    if self:GetPlayer():GetSystem("CItemSystem"):
        CheckDelEnumItemInPacketCond(setData[1], setData[2]) then
        return true;
    end   
    return false;
end

 --[[
   [ \brief 能否删除物品
   [ \param table setData 物品信息
   [ \return boolean 是否
   ]]
function CMegaKillSystem:OnMegaKill_BroadCastAptitudeMsg(nBefore)
	local nNow = self:GetAptitude()
	if cfg.GetLevel(nNow) > cfg.GetLevel(nBefore) then
	-- print("=============OnMegaKill_BroadCastAptitudeMsg===============",cfg.GetLevel(nBefore),cfg.GetLevel(nNow))
	CGameApp.MegaKill_BroadCastAptitudeMsg{
			PlayerRoleID = self.objPlayer:GetRoleID(),
			PlayerName = self.objPlayer:GetName(),
			dwAptitude = self:GetAptitude(),
		};
	end
end








