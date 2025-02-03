--[[
    [ \brief 古董系统文件
    [ \author 李中昌
    [ \date 2014-7-16
    [ 处理古董系统逻辑
    ]]

-- 系统对象
_G.CCurioSystem = {};

-- 古董系统配置文件
local tConfig = _G.CurioConfig;

--[[
	[ \brief 所有古董提交次数字符串解析
	[ 解析数据库中所有古董提交次数的字符串。
	[ \param stirng sParse 数据库字符串
	[ \param table tCount 解析后存储状态的表
	]]
local function ParseCountString(sParse, tCount)
    for sCounts in string.gfind(sParse, "(.-;)") do
        local tTemp = nil;
        for sCount in string.gfind(sCounts, "(%d+)[,;]") do
            tTemp = tTemp or {};
            table.insert(tTemp, tonumber(sCount));
        end
        table.insert(tCount, tTemp);
    end
end

--[[
    [ \brief 创建系统对象
    [ \return object 返回古董系统对象
    ]]
function CCurioSystem:new()
	local obj = CSystem:new("CCurioSystem");
	for i,v in pairs(CCurioSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	
	return obj;
end

--[[
    [ \brief 系统初始化
    [ \return Boolean false表示初始化失败, true表示初始化成功
    ]]
function CCurioSystem:Create()
	self.oDBQuery = CCurioSystemDB:new(self:GetPlayer():GetDBQuery(), self);

	-- 保存所有古董的提交次数
	self.tCount = {};

	local tData	= self:GetPlayer():GetLineData("CCurioSystem")[1];
	if not tData then
		_err("CCurioSystem Create CanNot GetLineData!!!");
		tData = {}
	end
		
	if tData[1] then
		ParseCountString(tData[1].tCount, self.tCount);
		self:ParseConfig();
		self:ChangeAttr();
	else
		self:CountInitialize();
	
		self.oDBQuery:InsertCountInfo({tCount =
        self:FormatCountString(self.tCount)});
	end
	
	return true;
end

--[[
    [ \brief 判断数据库和配置文件的差异
    [ 如果配置文件新增了配置 则重新写入数据库
    ]]
function CCurioSystem:ParseConfig()
	local bIsNewConfig = false;
	for nIndex, tInfo in pairs(tConfig.tCurioList) do
		if type(nIndex) == "number" then
			if not self.tCount[nIndex] then
				self:CountSingleInitialize(nIndex, tInfo);
				bIsNewConfig = true;
			end
		end
	end
	if bIsNewConfig then
		self.oDBQuery:UpdateCountInfo(
            {tCount = self:FormatCountString(self.tCount)});
	end
end

--[[
	[ \brief 格式化字符串
	[ 把存储扩展次数的表格式化为字符串。
	[ \param table tCount 存储扩展次数的表
	[ \return string 返回格式化字符串
	]]
function CCurioSystem:FormatCountString(tCount)
	local sFormat = "";
	for nCurioIndex, v in ipairs(tCount) do
        for nPartIndex, nCount in ipairs(v) do
            sFormat = sFormat..nCount..",";
        end
        sFormat = sFormat..";";
	end
	
	return sFormat;
end	

--[[
    [ \brief 换线前函数
    ]]
function CCurioSystem:OnChangeLineBegin()
	self:GetPlayer():SetLineData(
        "CCurioSystem",
        {[1] = {tCount = self:FormatCountString(self.tCount)}}
    );
end

--[[
    [ \brief 系统次数初始化函数
    [ 把所有古董提交次数初始化为0次
    ]]
function CCurioSystem:CountInitialize()
	for k, v in pairs(tConfig.tCurioList) do
		if type(k) == "number" then
			self:CountSingleInitialize(k, v);
		end
	end
end

--[[
    [ \brief 系统次数初始化函数
    [ 把单个古董提交次数初始化为0次
    [ \param number nIndex 古董索引
    [ \param table tInfo 古董配置
    ]]
function CCurioSystem:CountSingleInitialize(nIndex, tInfo)
    if not self.tCount[nIndex] then self.tCount[nIndex] = {} end
    
    for k, v in pairs(tInfo.tPart) do
        self.tCount[nIndex][k] = 0;
    end
end

--[[
    [ \brief 同步扩展次数的函数
    ]]
function CCurioSystem:SynCount()
	self:GetPlayer().CurioAllInfoMsg{tCount = self.tCount};
end

--[[
    [ \brief 属性处理函数
    [ 计算系统给人物增加的属性并加到技能系统
    ]]
function CCurioSystem:ChangeAttr()
    self:GetPlayer():GetSystem("CSkillSystem"):NotifyCurioUpdate(
        tConfig:GetAllAttr(self.tCount));
end

--[[
    [ \brief 提交检查
    [ \param table tInfo 提交信息
    [\return boolean 是否提交成功
    ]]
function CCurioSystem:CommitCheck(tInfo)
    if not self:HasAuthority("Collect") then return false end
   
	local oSystemItem = self:GetPlayer():GetSystem("CItemSystem");
	local bIsSuccess = false;
	for k, v in pairs(tInfo) do
        if v.dwNum <= 0 then break; end
        local nNeed, nIndex = tConfig:GetItemNeedNum(
            v.dwSeries,
            self.tCount,
            oSystemItem:GetItem(v.dwInstID):GetEnumID()
        );
        
        if nNeed < 0 then
            self:GetPlayer():GetSystem("CScriptSystem"):Notice(13001510002);
            break;
        end
        
        if v.dwNum > nNeed then v.dwNum = nNeed; end
       
        if oSystemItem:DelItemNumber(
            v.dwInstID,
            v.dwNum,
            _G.ItemSysOperType.Collect) then
            self.tCount[v.dwSeries][nIndex] = 
                self.tCount[v.dwSeries][nIndex] + v.dwNum;
                
            bIsSuccess = true;
            self:Boardcast(v.dwSeries);
        end 
	end
    return bIsSuccess;
end
