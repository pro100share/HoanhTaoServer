--[[
   [\brief 战旗系统脚本文件
   [\author 原志勇
   [\date 2014-7-25
  ]]

-- 脚本文件对象
_G.BannerScript = {};
-- 定义配置文件
local tConfig = _G.BannerConfig;

-- 战旗buff表
local tBannerBuff = {
        [15] = 120000;
        [20] = 120001;
        [25] = 120002;
        [30] = 120003;
        [35] = 120004;
};

--[[
   [\brief 添加战旗buff
   [\param object oPlayer 玩家对象
   [\param number nMaxLv buff最大等级
  ]]
function BannerScript:AddBuff(oPlayer, nMaxLv)
    local oScriptSystem = oPlayer:GetSystem("CScriptSystem");
    local nBuffId, tTempLv = self:GetBuffIdAndTemp(nMaxLv);
    for i, _ in pairs(tTempLv) do
        oScriptSystem:DelBuff(tBannerBuff[tTempLv[i]]);
    end
    if not oScriptSystem:CheckBUff(nBuffId) then
        oScriptSystem:AddBuff(nBuffId, nMaxLv);
    else
        -- 如果有该buff就不添加
    end
end

--[[
   [\brief 获取战旗 buffid, buff等级表
   [\param number nMaxLv buff最大等级
   [\return buffid, buff等级表
  ]]
function BannerScript:GetBuffIdAndTemp(nMaxLv)
    local tTempLv = {};
    for nLevel, _ in pairs(tBannerBuff) do
        if nMaxLv > nLevel then
            table.insert(tTempLv, nLevel);
        else
            -- 小于当前战旗最大等级的不插入表中
        end
    end
    
    local nMaxValue = math.max(unpack(tTempLv));
    
    for i, v in pairs(tTempLv) do
        if nMaxValue == v then
            table.remove(tTempLv, i);
        else
            -- 移除表中当前战旗最大等级
        end
    end
    return tBannerBuff[nMaxValue], tTempLv;
end

--[[
   [\brief 删除战旗buff
   [\param object oPlayer 玩家对象
  ]]
function BannerScript:DelBuff(oPlayer)
    -- 如果玩家已经下线
    if not oPlayer then 
        return;
    end
    
    local oScriptSystem = oPlayer:GetSystem("CScriptSystem");
    for _, buffId in pairs(tBannerBuff) do
        if oScriptSystem:CheckBUff(buffId) then
            oScriptSystem:DelBuff(buffId);
        else
            -- 如果没有该buff就不操作
        end
    end
end
