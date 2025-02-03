--[[
	[\brief 接口方法
	[\author 王凌波
	[\date 2014-6-19
	[供系统外部调用
  ]]

-- 战骑诀配置表
local tConfig = _G.ZhanQiJueConfig;

--[[
    [\brief 设置修炼值
    [\param number nNewEXP 新的修炼值
  ]]
function CZhanQiJueSystem:SetEXP(nNewEXP)
    local nMaxEXP = tConfig.DanList[#tConfig.DanList].nMaxEXP;
    self.nEXP = (nNewEXP > nMaxEXP) and nMaxEXP or nNewEXP;
    self:AddAttribute();
end
