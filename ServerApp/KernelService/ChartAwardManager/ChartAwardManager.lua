--[[
   [ \brief 排行榜奖励管理器
   [ \author 赵旭
   [ \date 2014-05-05
   ]]

-- 系统对象
_G.CChartAwardManager = CSingle:new();
CSingleManager:AddSingle(CChartAwardManager);

--[[
   [ \brief 系统创建
   [ \return boolean 是否成功
   ]]
function CChartAwardManager:Create()
    self.oDB = CChartAwardDB:Create(CPlayerDBQuery:GetDBQuery());
	return true;
end

--[[
   [ \brief 离线领取奖励
   [ \param number nChartID 排行榜编号
   [ \param table tChartList 排行榜数据
   ]]
function CChartAwardManager:ChartAwardOfflineGetImpl(nChartID, tChartList)
    if not _G.ChartAwardConfig:IsHaveAward(nChartID) then
        return;
    end

    local tReceivedRoleList = self.oDB:QueryReceiveds(nChartID);
    local tNotReceivedRoleList = {};
    for k, v in pairs(tChartList) do
        if not tReceivedRoleList[v.dwRoleID] then
            tNotReceivedRoleList[v.dwRoleID] = v;
        end
    end

    for k, v in pairs(tNotReceivedRoleList) do
        local oItems = {};
        for _k, _v in pairs(_G.ChartAwardConfig:GetAwardItem(
                nChartID, v.dwNumber)) do
            local oItem = SItemMessage:new();
            oItem.dwItemEnum = _v.ItemEnumID;
            oItem.dwItemNumber = _v.ItemNumber;
            oItem.dwLifeTime = _v.LifeTime;
            oItem.dwBindType = _v.BindType; 
            table.insert(oItems, oItem);
        end
        if next(oItems) then
            local tMailConfig = _G.ChartAwardConfig.MailAward;
            local oMail = CMail:new();
            oMail:SetSender(tMailConfig.SenderRoleID, 
                tMailConfig.SenderRoleName);
            oMail:SetReceiver(k, v.szRoleName);
            oMail:SetContent(tMailConfig.Topic, tMailConfig.Content);
            oMail:SetLifeTime(tMailConfig.LifeTime);
            oMail:SetAccessory(0, 0, 0, oItems);
            CMailManager:SendMail(oMail);

            _debug("chart award send mail success!", k);
        end
    end

    self.oDB:DeleteReceiveds(nChartID);
end

