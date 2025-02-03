--[[
说明：跨服战击杀榜
作者：赵旭
时间: 2014-03-10
]] 

-- 系统对象
_G.CCSKillChartSystemManager = CSingle:new();
CSingleManager:RegistCSSingle(CCSKillChartSystemManager, true);

-- 排行榜列表(key - 名次; value - 成员信息)
CCSKillChartSystemManager.setChartList = {};
-- 索引列表(key - 角色编号; value - 成员信息)
-- {Data = setMember;dwChartListPos = 0;}
CCSKillChartSystemManager.setIndexList = {};
-- 最后一名角色编号
CCSKillChartSystemManager.dwLastRoleID = 0;

-- 最大人数
CCSKillChartSystemManager.dwMaxUser = 30;
-- 同步间隔次数
CCSKillChartSystemManager.dwInterval = 0;

--[[
   [ \brief 系统对象构造
   [ \return object 对象
   ]]
function CCSKillChartSystemManager:new()
    local obj = CSystem:new("CCSKillChartSystemManager");
    obj.nState = 0;
    for i,v in pairs(CCSKillChartSystemManager) do
        if type(v) == "function" then
            obj[i] = v;
        end;
    end;
    return obj;
end

--[[
   [ \brief 系统创建
   [ \return boolean 是否成功
   ]]
function CCSKillChartSystemManager:Create()
    self.setChartList = {};
    self.setIndexList = {};
    self.dwLastRoleID = 0;
    self.dwMaxUser = 30;
    self.dwInterval = 0;
	return true;
end

--[[
   [ \brief 系统更新
   [ \param number dwInterval 时间间隔
   [ \return boolean 是否成功
   ]]
function CCSKillChartSystemManager:Update(dwInterval)
    self:Synchronize();
    return true;
end

--[[
   [ \brief 系统销毁
   [ \return boolean 是否成功
   ]]
function CCSKillChartSystemManager:Destroy()
	return true;
end

--[[
   [ \brief 触发器
   [ 当*主要*影响因素改变时调用改变排行榜数据
   [ \param object objPlayer 角色对象
   ]]
function CCSKillChartSystemManager:Trigger(objPlayer)
    if self.setIndexList[objPlayer:GetRoleID()] then
        if self.dwLastRoleID == objPlayer:GetRoleID() then
            self:FindLastMember();
        end
        return;
    end
    if #self.setChartList < self.dwMaxUser then
        self:AddMember(objPlayer);
    else
        if self:CompareMember(
                self:BuildMember(objPlayer),
                self.setIndexList[self.dwLastRoleID].Data) > 0 then
            self:RemoveMember(objPlayer);
        end
    end
    self:FindLastMember();
end

--[[
   [ \breif 查找成员名次
   [ \param number dwRoleID 角色编号
   [ \return number 名次
   ]]
function CCSKillChartSystemManager:FindMemberRank(dwRoleID)
    if not self.setIndexList[dwRoleID] then
        return 0;
    end
    local dwRank = 1;
    local setMember = self.setIndexList[dwRoleID].Data;
    for k, v in pairs(self.setIndexList) do
        if self:CompareMember(v.Data, setMember) > 0 then
            dwRank = dwRank + 1;
        end
    end
    return dwRank;
end

--[[
   [ \brief 查找最后一名成员并索引
   ]]
function CCSKillChartSystemManager:FindLastMember()
    local dwLastRoleID = 0;
    if self.dwLastRoleID == 0 then
        dwLastRoleID = next(self.setIndexList);
    else
        dwLastRoleID = self.dwLastRoleID;
    end
    for k, v in pairs(self.setIndexList) do
        if self:CompareMember(
                v.Data, self.setIndexList[dwLastRoleID].Data) < 0 then
            dwLastRoleID = k;
        end
    end
    self.dwLastRoleID = dwLastRoleID;
end

--[[
   [ \breif 增加最后一名成员
   [ 当列表不满时调用
   [ 向成员列表中增加一个成员
   [ \param object objPlayer 角色对象
   ]]
function CCSKillChartSystemManager:AddMember(objPlayer)
   local setMember = self:BuildMember(objPlayer);
   local dwChartListPos = #self.setChartList + 1;
   self.setChartList[dwChartListPos] = setMember;
   self.setIndexList[objPlayer:GetRoleID()] = {
       Data = setMember;
       dwChartListPos = dwChartListPos;
   };
   self.dwLastRoleID = 0;
end

--[[
   [ \brief 构建成员信息
   [ \param object objPlayer 角色对象
   [ \return table 信息表
   ]]
function CCSKillChartSystemManager:BuildMember(objPlayer)
   return {
       objCrossObj = objPlayer:GetSystem("CCrossSvrSystem"):GetCrossObj();
       dwRoleID = objPlayer:GetRoleID();
   };
end

--[[
   [ \breif 移除最后一名成员
   [ 当列表满时调用
   [ 移除*最后一名*成员并且增加一个新成员
   [ \param object objPlayer 角色对象
   ]]
function CCSKillChartSystemManager:RemoveMember(objPlayer)
    local setMemberInfo = self.setIndexList[self.dwLastRoleID];
    self.setIndexList[self.dwLastRoleID] = nil;
    table.remove(self.setChartList, setMemberInfo.dwChartListPos);
    self.dwLastRoleID = 0;
end

--[[
   [ \brief 名次比较
   [ \param object objLeft 比较对象左
   [ \param object objRight 比较对象右
   [ \return number 小于0表示左小于右; 等于0表示相等; 大于0表示左大于右;
   ]]
function CCSKillChartSystemManager:CompareMember(objLeft, objRight)
    if objLeft.dwRoleID == objRight.dwRoleID then
        return 0;
    end
    -- 获取比较数据
    local _objLeft = self:GetMemberData(objLeft);
    local _objRight = self:GetMemberData(objRight);
    -- 是否获得屠龙刀
    if _objLeft.bIsTLDHolder then
        return 1;
    elseif _objLeft.bIsTLDHolder then
        return -1;
    end
    -- 荣誉值比较
    if _objLeft.dwHonorValue > _objRight.dwHonorValue then
        return 1;
    elseif _objLeft.dwHonorValue < _objRight.dwHonorValue then
        return -1;
    end
    -- 击杀数比较
    if _objLeft.setFightInfo.dwKillTotal > 
            _objRight.setFightInfo.dwKillTotal then
        return 1;
    elseif _objLeft.setFightInfo.dwKillTotal <
            _objRight.setFightInfo.dwKillTotal then
        return -1;
    end
    -- 连斩数比较
    if _objLeft.setFightInfo.dwKillCombo > 
            _objRight.setFightInfo.dwKillCombo then
        return 1;
    elseif _objLeft.setFightInfo.dwKillCombo < 
            _objRight.setFightInfo.dwKillCombo then
        return -1;
    end
    return 0;
end

--[[
   [ \breif 获取成员数据
   [ \param table setMember 成员
   [ \return table 数据集合
   ]]
function CCSKillChartSystemManager:GetMemberData(setMember)
    return{
        setFightInfo =
            setMember.objCrossObj:GetRoleFightInfo(setMember.dwRoleID);
        dwHonorValue =
            setMember.objCrossObj:GetHonorById(setMember.dwRoleID);
        bIsTLDHolder =
            (setMember.objCrossObj:GetItemRoleID() == setMember.dwRoleID);
    };
end

--[[
   [ \brief 同步信息到客户端
   ]]
function CCSKillChartSystemManager:Synchronize()
    if self.dwInterval == 3000 then
        for dwRoleID, objPlayer in pairs(CPlayerManager.setAllPlayer) do
            self:SendChartList(objPlayer);
        end
        self.dwInterval = 0;
    else
        self.dwInterval = self.dwInterval + 1;
    end
end

--[[
   [ \brief 发送信息到角色
   [ 强制发送时使用，例如玩家登陆
   [ \param object objPlayer 角色对象
   ]]
function CCSKillChartSystemManager:SendChartList(objPlayer)
    local setList = {};
    for k, v in pairs(self.setChartList) do
        local setMemberData = self:GetMemberData(v);
        setList[k] = {
            dwRoleID = setMemberData.setFightInfo.dwRoleID;
            szRoleName = setMemberData.setFightInfo.szRoleName;
            dwKillTotal = setMemberData.setFightInfo.dwKillTotal;
            dwKillCombo = setMemberData.setFightInfo.dwKillCombo;
            dwHonor = setMemberData.dwHonorValue;
            bIsTLDHolder = setMemberData.bIsTLDHolder;
        };
    end
    objPlayer.SyncKillChartListMsg{
        List = setList;
    };
end
