--[[
	���ܣ�Ѫħ����չ
	���ߣ��Է�
	ʱ�䣺2014-5-19
]]
local cfg = MegaKillAptitudeConfig
 --[[
   [ \brief ��ʼ����
   [ \param number nCount ��������
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
   [ \brief ��ȡ����ֵ
   [ \return number ����ֵ
   ]]
function CMegaKillSystem:GetAptitude()
   return self.dwAptitude or 0;
end

 --[[
   [ \brief �޸ľ���ֵ
   [ \param number nValue ����ֵ
   ]]
function CMegaKillSystem:SetAptitude(nValue)
   self.dwAptitude = nValue;
end

 --[[
   [ \breif ɾ����Ʒ
   [ \param table setData ��Ʒ��Ϣ
   ]]
function CMegaKillSystem:DeleteItem(setData)
    self:GetPlayer():GetSystem("CItemSystem"):DelEnumItemInPacket(
        setData[1],
        setData[2],
        false,
        _G.ItemSysOperType.MegaKill);
end

 --[[
   [ \brief �Ƿ�������ֵ
   ]]
function CMegaKillSystem:IsFull()
   return cfg.GetMaxDegree(self.dwLevel) <= self.dwAptitude;
end

 --[[
   [ \brief ��������
   [ \param number nValue ����ֵ
   [ \param table attrInfo ������Ϣ
   ]]
function CMegaKillSystem:GetAddAptitudeAttr(dwAptitude)
	local attrInfo = cfg.GetProperty(dwAptitude)
	return attrInfo;
end

 --[[
   [ \brief �ܷ�ɾ����Ʒ
   [ \param table setData ��Ʒ��Ϣ
   [ \return boolean �Ƿ�
   ]]
function CMegaKillSystem:IsCanDeleteItem(setData)
    if self:GetPlayer():GetSystem("CItemSystem"):
        CheckDelEnumItemInPacketCond(setData[1], setData[2]) then
        return true;
    end   
    return false;
end

 --[[
   [ \brief �ܷ�ɾ����Ʒ
   [ \param table setData ��Ʒ��Ϣ
   [ \return boolean �Ƿ�
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








