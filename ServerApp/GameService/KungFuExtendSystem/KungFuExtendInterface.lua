--[[
	[ \brief 功法扩展系统接口
	[ \author 李中昌
	[ \date 2014-5-26
	[ 处理功法扩展系统接口 
	]]

--[[
	[ \brief 格式化字符串
	[ 把存储扩展次数的表格式化为字符串。
	[ \param table tCount 存储扩展次数的表
	[ \return string 返回格式化字符串
	]]
local function FormatCountStr(tCount)
	local sFormat = "";
	for k , v in pairs(tCount) do
		sFormat = sFormat..k..","..v..";";
	end
	
	return sFormat;
end	
		
--[[
	[ \brief 扩展函数
	[ 执行扩展逻辑
	[ \param number nSysEnum 系统枚举
	[ \param number nOptCount 操作次数
	]]
function CKungFuExtendSystem:Extend(nSysEnum, nOptCount)
	if not self:ExtendCheck(nSysEnum, nOptCount) then
		return;
	end

	self.tCount[nSysEnum] = self.tCount[nSysEnum] + nOptCount;
		
	-- 同步消息
	self:SynCount();

	-- 刷新属性
	self:ChangeAttr();
	
	--广播
	if self.tCount[nSysEnum] == self.tMaxCount[nSysEnum] then
		local level = 0;
		for k, v in pairs(_G.KungFuExtendConfig[nSysEnum].tLevel) do
			if self.tCount[nSysEnum] == v.maxCount then
				level = k;
			end
		end
		local oPlayer = self:GetPlayer();
		CGameApp.KungFuExtendBoardcastMsg
			{
				RoleID = oPlayer:GetRoleID(),
				RoleName = oPlayer:GetInfo().szRoleName,
				SystemEnum = nSysEnum,
				Level = level,
			};
	end
	
	-- 更新数据库
	local tDBInfo = {};
	tDBInfo.tCount = FormatCountStr(self.tCount);
	self.oDBQuery:UpdateCountInfo(tDBInfo);
end

--[[
	[ \brief 得到当前次数 和最高次数
	[ \param number nSysEnum 系统枚举
	[ \return number 返回当前扩展次数
	[ \return number 返回扩展次数上限
	]]
function CKungFuExtendSystem:GetCount(nSysEnum)
	return self.tCount[nSysEnum], self.tMaxCount[nSysEnum];
end
