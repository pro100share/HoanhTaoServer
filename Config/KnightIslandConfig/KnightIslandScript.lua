--[[
   [ \brief 侠客岛倒计时接口函数
   [ \author 路广华
   [ \date 2014-07-22
   [ 用于该系统客户端及服务器数据相关配置
   ]]

--[[
   [ \brief 通过ID获取编号
   [ \param number nID 人物ID
   [ \return number 人物编号
   ]]
function KnightIslandConfig:GetIndexByID(nID)
	if nID == 50760017 or nID == 50760018 then
		return 4;
	else
		for k, v in ipairs(self.BossShowID) do
			if v == nID then
				return k;
			else
				-- 进行下次循环
			end
		end
	end

	return 0;
end

--[[
   [ \brief 数值是否在表中
   [ \param table tTab 表
   [ \param number nValue 值
   [ \return bool 是否在表中
   ]]
function KnightIslandConfig:TableFind(tTab, nValue)
	for k, v in pairs(tTab) do
		if v == nValue then
			return true;
		else
			-- 进行下次循环
		end
	end
    
	return false;
end
