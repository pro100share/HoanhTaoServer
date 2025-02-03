--[[
   [ \brief 登出保护
   [ \author 赵旭
   [ \date 2014-09-11
   ]]

-- 宿主持有者
local CHostHandler = _G.CPlayerManager;
-- 数据库持有者
local CDBHandler = _G.CPlayerDBQuery;

-- 执行间隔
local nInterval = 0;

-- 队列类
local CQueue = {};

--[[
   [ \brief 创建队列对象
   [ \return object 队列对象
   ]]
function CQueue:New()
    local object = {};
    object.first = 0;   -- 首指针
    object.last = 0;    -- 尾指针
    for k, v in pairs(CQueue) do
        object[k] = v;
    end
    return object;
end

--[[
   [ \brief 压入成员
   [ \param any member 成员(不能为假)
   ]]
function CQueue:Push(member)
    _assert(member)
    self.last = self.last + 1;
    self[self.last] = member;
end

--[[
   [ \brief 弹出成员
   [ \return any 成员*nil表示为空*
   ]]
function CQueue:Pop()
    local member = self[self.first + 1];
    if member then
        self.first = self.first + 1;
        self[self.first] = nil;
    end
    return member;
end

--[[
   [ \brief 查看首成员
   [ \return any 成员*nil表示为空*
   ]]
function CQueue:Front()
    return self[self.first + 1];
end

--[[
   [ \brief 查看尾成员
   [ \return any 成员*nil表示为空*
   ]]
function CQueue:Back()
    return self[self.last];
end

--[[
   [ \brief 是否为空
   [ \return boolean 是否
   ]]
function CQueue:IsEmpty()
    return self.first == self.last;
end

-- 登出队列类
local CLogoutQueue = {};

--[[
   [ \brief 创建对象
   [ \return object 对象
   ]]
function CLogoutQueue:New()
    local object = {};
    object.oQueue = CQueue:New();   -- 账号编号队列
    object.tMap = {};               -- 账号编号集合
    for k, v in pairs(CLogoutQueue) do
        object[k] = v;
    end
    return object;
end

--[[
   [ \brief 压入成员
   [ \param number nAccountID 账号编号
   [ \param function fProcess 处理函数
   ]]
function CLogoutQueue:Push(nAccountID, fProcess)
    self.oQueue:Push(nAccountID);
    self.tMap[nAccountID] = {nAccountID, os.now(), fProcess};
end

--[[
   [ \brief 弹出成员
   [ \return table 成员{账号编号, 加入时间, 处理函数}*nil表示为空*
   ]]
function CLogoutQueue:Pop()
    local nAccountID = self.oQueue:Pop();
    local tResult = nil;
    if nAccountID then
        tResult = self.tMap[nAccountID];
        self.tMap[nAccountID] = nil;
    end
    return tResult;
end

--[[
   [ \brief 查看首成员
   [ \return table 成员*nil表示为空*
   ]]
function CLogoutQueue:Front()
    return self.tMap[self.oQueue:Front()];
end

--[[
   [ \brief 查看尾元素
   [ \return table 成员*nil表示为空*
   ]]
function CLogoutQueue:Back()
    return self.tMap[self.oQueue:Back()];
end

--[[
   [ \brief 是否为空
   [ \return boolean 是否
   ]]
function CLogoutQueue:IsEmpty()
    return self.oQueue:IsEmpty();
end

--[[
   [ \brief 查询成员
   [ \param number nAccountID 账号编号
   [ \reutrn table 成员*nil表示未找到
   ]]
function CLogoutQueue:Find(nAccountID)
    return self.tMap[nAccountID];
end

--[[
   [ \brief 真空成员
   [ 使用该方法后成员暂时未删除，处于无效状态。
   [ \param number nAccountID 账号编号
   ]]
function CLogoutQueue:Vacuum(nAccountID)
    if self.tMap[nAccountID] then
        self.tMap[nAccountID][2] = 0;
    end
end

--[[
   [ \brief 是否无效
   [ \param table tMember 成员
   [ \return boolean 是否
   ]]
function CLogoutQueue:IsInvalid(tMember)
    return tMember[2] == 0;
end

--[[
   [ \brief 创建登入保护
   ]]
function CHostHandler:CreateLoginGuard()
    self.oLogoutQueue = CLogoutQueue:New();
end

--[[
   [ \brief 销毁登入保护
   ]]
function CHostHandler:DestroyLoginGuard()
    self.oLogoutQueue = nil;
end

--[[
   [ \brief 检查是否已经完全登出
   [ 数据库是否保存完成
   [ \param number nAccountID 账号编号
   [ \return boolean 是否
   ]]
function CHostHandler:CheckLogout(nAccountID)
    if CDBHandler:GetLogoutSign(nAccountID) then
        local tWait = self:GetLogoutQueue():Find(nAccountID);
        if tWait then
            self:GetLogoutQueue():Vacuum(nAccountID);
        end
        return true;
    else
        return false;
    end
end

--[[
   [ \brief 获取等待登出队列
   [ \return object 登出队列
   ]]
function CHostHandler:GetLogoutQueue()
    _assert(self.oLogoutQueue);
    return self.oLogoutQueue;
end

--[[
   [ \brief 设置等待登出队列
   [ \param object oLogoutQueue 登出队列
   ]]
function CHostHandler:SetLogoutQueue(oLogoutQueue)
    self.oLogoutQueue = oLogoutQueue;
end

--[[
   [ \brief 等待登出
   [ \param number nAccountID 账号编号
   [ \param function fHandler 执行处理回调
   ]]
function CHostHandler:WaitLogout(nAccountID, fHandler)
    if self:GetLogoutQueue():Find(nAccountID) then
        -- 玩家还没有完成登出且再次尝试登录
    else
        self:GetLogoutQueue():Push(nAccountID, fHandler);
    end
end

--[[
   [ \brief 监视登出状态
   ]]
function CHostHandler:SeeLogout()
    local oLogoutQueue = self:GetLogoutQueue();
    local tWait = nil;
    while not self:GetLogoutQueue():IsEmpty() do
        tWait = oLogoutQueue:Front();
        if oLogoutQueue:IsInvalid(tWait) then
            oLogoutQueue:Pop();
            tWait = nil;
        else
            break;
        end
    end

    if not tWait then
        return;
    end

    local nTime = os.now();
    if nTime - nInterval >= 3000 then
        local bLogout = false;
        if CDBHandler:GetLogoutSign(tWait[1]) then
            bLogout = true;
        else
            if nTime - tWait[2] >= 15000 then
                bLogout = true;
                CDBHandler:SetLogoutSign(tWait[1], true);
                _err("Logout timeout", tWait[1]);
            end
        end
        if bLogout then
            oLogoutQueue:Pop();
            tWait[3]();
        else
            nInterval = nTime;
        end
    end
end

