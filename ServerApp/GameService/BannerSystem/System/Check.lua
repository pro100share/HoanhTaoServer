--[[
	[\brief 战旗系统检测相关方法
	[\author 王凌波
	[\date 2014-7-16
  ]]

-- 战旗配置文件
local tConfig = _G.BannerConfig;
-- 战旗公用函数
local tFunc = _G.BannerFunctions;

--[[
    [\brief 铸造前的检测
    [\param number nCount 批量使用的个数
    [\return boolean 是否允许铸造，true为允许，false为不允许
  ]]
function CBannerSystem:CheckForge(nCount)
    if self.nEXP >= 
            tFunc.GetLevelNeedEXP(#tConfig.LevelList) then -- 如果铸造值超限
        return false;
    elseif self.bBless == true then -- 如果正在赐福
        return false;
    elseif not self:GetPlayer():GetSystem("CItemSystem"):
            CheckDelEnumItemInPacketCond(
                tFunc.GetForgeID(tFunc.GetLevel(self.nEXP, self.bBless)), 
                nCount) then -- 如果所需物品不够
        return false;
    else -- 如果通过以上检测
        return true;
    end
end

--[[
    [\brief 赐福升阶前的材料检测
    [\param boolean bAutoBuy 是否自动购买
    [\param boolean bGold 如果自动购买，使用元宝还是礼金，true元宝，false礼金
    [\return boolean 材料是否足够，true为足够，false为不足够
  ]]
function CBannerSystem:CheckItem(bAutoBuy, bGold)
    local oItemSystem = self:GetPlayer():GetSystem("CItemSystem");
    local nPhase = tFunc.GetPhase(tFunc.GetLevel(self.nEXP, self.bBless));
    local bIsEnough, nDelta = oItemSystem:CheckDelEnumItemInPacketCond(
            tFunc.GetBlessID(nPhase), 
            tFunc.GetBlessNum(nPhase));
    if bIsEnough then -- 如果材料足够
        return true;
    elseif not bAutoBuy then -- 如果材料不够但没选择自动购买
        return false;
    else -- 如果材料不够，选择了自动购买
        if bGold then -- 如果选择用元宝自动购买
            return oItemSystem:IsGoldEnough(nDelta * tFunc.GetGold(nPhase));
        else -- 如果选择用礼金自动购买
            return oItemSystem:IsBindGoldEnough(
                nDelta * tFunc.GetBindGold(nPhase));
        end
    end
end

--[[
    [\brief 赐福升阶前的检测
    [\param boolean bAutoBuy 是否自动购买
    [\param boolean bGold 如果自动购买，使用元宝还是礼金，true元宝，false礼金
    [\return boolean 是否允许赐福升阶，true为允许，false为不允许
  ]]
function CBannerSystem:CheckBless(bAutoBuy, bGold)
    if self.bBless == false then -- 如果赐福关闭
        return false;
    elseif self:GetPlayer():GetSystem("CTianGuanCiFuSystem"):Get_Banner() >= 
            _G.TianGuanCiFuConfig.MaxBannerValue then -- 如果赐福值超限
        return false;
    elseif not self:GetPlayer():GetSystem("CItemSystem"):IsPacketMoneyEnough(
            tFunc.GetMoney(
                tFunc.GetPhase(
                    tFunc.GetLevel(self.nEXP, 
                        self.bBless)))) then -- 如果银两不够
        return false;
    else
        -- 检测材料是否足够
        return self:CheckItem(bAutoBuy, bGold);
    end
end

--[[
    [\brief 插旗前的检测
    [\return number 结果类型：1~5为不允许插旗，6为允许插旗
  ]]
function CBannerSystem:CheckFlag()
    local oPlayer = self:GetPlayer();
    local nLevel = tFunc.GetLevel(self.nEXP, self.bBless);
    if not self.bConsume then -- 如果没勾选战旗消耗
        return 1;
    elseif tFunc.GetPhase(nLevel) < 
            tFunc.GetFlagMinPhase() then -- 如果没到战旗使用阶段
        return 2;
    elseif not oPlayer:GetSystem("CItemSystem"):
            CheckDelEnumItemInPacketCond(
                tFunc.GetUseBannerID(), 
                tFunc.GetUseBannerNum()) then -- 如果所需道具不够
        return 3;
    elseif CBannerManager.tAllBanners[oPlayer:GetRoleID()] then -- 如果已插旗
        return 4;
    elseif _now() <= 
            self.nStartTime + tFunc.GetCoolTime(nLevel) then -- 如果还在冷却
        return 5;
    else
        return 6;
    end
end
