--[[
    [ \brief 资源回收系统文件
    [ \author 李中昌
    [ \date 2014-8-5
    [ 处理资源回收系统逻辑
    ]]

--[[
    [ \brief 解析字符串
    [ \param string sFormat 格式化的字符串
    [ \param table tCount 活动剩余次数表
    [ \return table 活动剩余次数表
    ]]        
local function ParseString(sFormat, tCount)
    for sID, sCount in string.gfind(sFormat, "(%d+),(-?%d+);") do
        tCount[tonumber(sID)] = tonumber(sCount)
    end
    return tCount;
end

    
-- 系统对象
_G.CRecyclingSystem = {};

-- 配置表	
local tConfig = _G.RecyclingConfig;

--[[
    [ \brief 创建系统对象
    [ \return object 返回系统对象
    ]]
function CRecyclingSystem:new()
	local obj = CSystem:new("CRecyclingSystem");
	
	for i,v in pairs(CRecyclingSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	
	return obj;
end

--[[
    [ \brief 系统初始化
    [ 处理进入游戏的系统信息初始化，换线数据的处理
    [ \param number bIsChangeLine 0:登陆, 1:换线, 2:进入跨服战
    [ \return Boolean false表示初始化失败, true表示初始化成功
    ]]
function CRecyclingSystem:Create(bIsChangeLine)
	local oPlayer = self:GetPlayer();
    
	local oDB = oPlayer:GetDBQuery();
	if not oDB then
		_err("CRecyclingSystem Create Cannot get DBQuery");
		return false;
	end
	self.oDBQuery = CRecyclingSystemDB:new(oDB, self);

    -- 所有系统的剩余次数表
    self.tCount = {};
	local tData	= oPlayer:GetLineData("CRecyclingSystem")[1];
	if not tData then
		_err("CRecyclingSystem Create CanNot GetLineData!!!");
		tData = {}
	end
		
	if tData[1] then
		ParseString(tData[1].tCount, self.tCount);
	else
        if self:HasAuthority("Recycling") then
            self.oDBQuery:InsertInfo(
                {tCount = tConfig.FormatString(self.tCount)}
            );
        end
	end
	
	return true;
end

--权限变化
function CRecyclingSystem:EventGetAuthority(szAuthName)
    if szAuthName == "Recycling" then
       self.oDBQuery:InsertInfo({tCount = tConfig.FormatString(self.tCount)});
    end
end

--[[
    [ \brief 进入游戏场景回调函数
    ]]
function CRecyclingSystem:OnEnterScene()
    self:SynchronizeAll();
end

--[[
    [ \brief 换线前函数
    [ 换线之前整理数据
    ]]
function CRecyclingSystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData(
        "CRecyclingSystem",
        {[1] = {tCount = tConfig.FormatString(self.tCount)}}
    );
end

--[[ 
    [ \brief 同步系统所有信息的函数
    [ 向客户端同步系统所有信息
    ]]
function CRecyclingSystem:SynchronizeAll()
	self:GetPlayer().RecyclingSystemUpdateMsg{
        ActivityStatus = self.tCount;
    };
end

--[[
    [ \brief 更新数据库函数
    ]]
function CRecyclingSystem:UpdateDB()
	self.oDBQuery:UpdateInfo({tCount = tConfig.FormatString(self.tCount)});
end
