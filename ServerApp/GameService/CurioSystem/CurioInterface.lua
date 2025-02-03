--[[
    [ \brief 古董系统接口
    [ \author 李中昌
    [ \date 2014-7-16
    [ 处理古董系统接口 
    ]]

-- 古董系统配置文件
local tConfig = _G.CurioConfig;    
    	
--[[
    [ \brief 提交处理函数
    [ 执行提交逻辑
    [ \param table tInfo 提交信息
    ]]
function CCurioSystem:Commit(tInfo)
	if not self:CommitCheck(tInfo) then return; end
	
	self:SynCount();
	self:ChangeAttr();
	
	self.oDBQuery:UpdateCountInfo({tCount =
        self:FormatCountString(self.tCount)});
end

--[[
    [ \brief 得到当前次数
    [ \param number nCurioIndex 古董索引
    [\param number nPartIndex 碎片索引
    [ \return number 返回当前扩展次数
    ]]
function CCurioSystem:GetCount(nCurioIndex, nPartIndex)
	return self.tCount[nCurioIndex][nPartIndex];
end

--[[
    [ \brief 广播函数
    [ \param number nCurioIndex 古董索引
    ]]
function CCurioSystem:Boardcast(nCurioIndex)
    if tConfig:GetGuDongNum(self.tCount, nCurioIndex) >=
        tConfig:GetConfigCount(nCurioIndex) then
        if tConfig:IsFinish(self.tCount) then
            nCurioIndex = -1;
        end            
                
        CGameApp.CurioBoardcastMsg{
            RoleID = self:GetPlayer():GetRoleID(),
            RoleName = self:GetPlayer():GetInfo().szRoleName,
            CurioIndex = nCurioIndex,
        };
    end
end    
