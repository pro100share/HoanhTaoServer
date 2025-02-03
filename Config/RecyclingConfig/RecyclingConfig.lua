--[[
    [ \brief 回收系统配置文件
    [ \author 路广华,李中昌
    [ \date 2014-7-31
  ]]
  
-- 定义全局配置变量
_G.RecyclingConfig = {};

-- 副本的GS更新函数
local function DuplGSUpdate(self, oPlayer)
    if oPlayer:GetSystem("CDuplSystem").DuplEnterTimeInfo[self.duplID] then
        return self.MaxCount - 
            oPlayer:GetSystem("CDuplSystem").
                DuplEnterTimeInfo[self.duplID];
    else
        return self.MaxCount;
    end        
end

-- 副本的KS更新函数
local function DuplKSUpdate(self, tCount)
    for nRoleID, _ in pairs(tCount) do 
        tCount[nRoleID][self.ID] = self.MaxCount;
    end
    
    local tSqlResult = CPlayerDBQuery:GetDBQuery():execute(
        [[SELECT * FROM "T_Dupl_Info" WHERE "dwDuplId" = $1;]],
        self.duplID
    );
    if not tSqlResult then return; end
    
    for _, v in pairs(tSqlResult) do
        if not tCount[v.dwRoleId] then return end
        
        local _, _, sHour, sMinute = string.find(
            _G.ClearTime,
            "(%d*):(%d*)"
        );
        local todayFlushTime = CTimeFormat:GetTodayThisTimeMsec(
            tonumber(sHour),
            tonumber(sMinute)
        );
        if _now() < todayFlushTime then
            todayFlushTime = todayFlushTime - 86400000;--24 * 60 * 60 * 1000;
        end;
        local dwTimes = self.MaxCount
        if todayFlushTime - v.dwDateTimes <= 86400000 then
            dwTimes = dwTimes - v.dwTimes;
        end
        tCount[v.dwRoleId][self.ID] = dwTimes;
    end
end;         

_G.RecyclingConfig.RefreshTime = "05:58";

-- 文字说明
RecyclingConfig.Text = {
    NotMoney1 = "您的银两不足";
    NotMoney2 = "您的礼金不足";
    NotMoney3 = "您的元宝不足";
    LastNumber = "已追回：%d/%d";
    Description = "<p>使用<font color='#DCB857'>银两追回</font>可追回昨日<font color='#DCB857'>%d%%</font>的资源，使用<font color='#17b4ed'>元宝追回</font>可追回昨日<font color='#17b4ed'>%d%%</font>的资源</p>" ..
        "<p>使用<font color='#DCB857'>一键追回</font>可追回昨日未完成<font color='#DCB857'>%d%%</font>的资源，使用<font color='#17b4ed'>完美追回</font>可追回昨日未完成<font color='#17b4ed'>%d%%</font>的资源</p>";
    GetByMoney1 = "使用%d银两追回%d%%的资源";
    GetByMoney2 = "使用%d礼金追回%d%%的资源";
    GetByMoney3 = "使用%d元宝追回%d%%的资源";
    GetResours = "您将获得以下资源：";
    NoResours = "昨日资源已全部追回";
    ValueUnit = "万";
};

-- 奖励的枚举
RecyclingConfig.PicList = {
    Gas = 1;
    Money = 2;
    Exp = 3;
    BindMoney = 4;
    Reputation = 5;
};

-- 奖励显示的顺序
RecyclingConfig.Order = {
    [1] = RecyclingConfig.PicList.Gas;
    [2] = RecyclingConfig.PicList.Money;
    [3] = RecyclingConfig.PicList.Exp;
    [4] = RecyclingConfig.PicList.BindMoney;
    [5] = RecyclingConfig.PicList.Reputation;
};

-- 资源追回的数量
RecyclingConfig.Percent = {
    TheMore = 70;
    ThePerfect = 100;
};

-- 钱的类型
RecyclingConfig.MoneyType = {
    Money = 1;  -- 1 银两；2 礼金
    Gold = 3;
};

-- 各个活动的奖励
RecyclingConfig.Resources = {
    [1] = {
            ID = 1;
            Icon = "img://zyzh_lwt_01.png";
            Name = "";							--老顽童
            Resources = {
                [RecyclingConfig.PicList.Gas] = 12000; 

            };
            Money = {
                [1] = 70000;
                [2] = 0;
                [3] = 10;
            };
            -- 活动最大次数
            MaxCount = 3;
            -- 更新次数的函数 (Gs调用, 主要是从内存中读取信息计算剩余次数)
            GSUpdate = function(self, oPlayer)
                return oPlayer:GetSystem("CGambleSystem"):GetGambleTime();
            end;            
            -- 更新次数的函数 (ks调用,主要是操作数据库)
            KSUpdate = function(self, tCount)
                for nRoleID, _ in pairs(tCount) do 
                    tCount[nRoleID][self.ID] = self.MaxCount;
                end
                
                local tSqlResult = CPlayerDBQuery:GetDBQuery():execute([[
                    SELECT * FROM "T_Role_Refresh" WHERE "dwDataID" = 801;]]);
                if tSqlResult then
                    for _, v in pairs(tSqlResult) do
                        if not tCount[v.dwRoleID] then tCount[v.dwRoleID] = {}; end
                        tCount[v.dwRoleID][self.ID] = v.dwValue;
                    end
                end
            end;
    };
    [2] = {
            ID = 2;
            Icon = "img://zyzh_fyrw_01.png";
            Name = "";							--风云任务
            Resources = {
                [RecyclingConfig.PicList.Gas] = 1; 
                [RecyclingConfig.PicList.Exp] = 1; 
                [RecyclingConfig.PicList.Money] = 1;
                [RecyclingConfig.PicList.Reputation] = 1;
            };
            Money = {
                [1] = 20000;
                [2] = 0;
                [3] = 10;
            };
            MaxCount = 20;
            GSUpdate = function(self, oPlayer)
                return self.MaxCount -
                    oPlayer:GetSystem("CTaskSystem").dwDailyLoop;
            end;
            KSUpdate = function(self, tCount)
                for nRoleID, _ in pairs(tCount) do 
                    tCount[nRoleID][self.ID] = self.MaxCount;
                end
                
                local tSqlResult = CPlayerDBQuery:GetDBQuery():execute([[
                    SELECT * FROM "T_Role_Task_Ex";]]);
                if tSqlResult then
                    for _, v in pairs(tSqlResult) do 
                        if not tCount[v.dwRoleID] then tCount[v.dwRoleID] = {}; end
                        
                        -- 如果不是今天则今日的环数置为0
                        if not CTimeFormat:isToday(v.dwUpdateTime) then
                            v.dwDailyLoop = 0;
                        end
                        
                        tCount[v.dwRoleID][self.ID] = self.MaxCount - v.dwDailyLoop;
                    end
                end
            end;         
    };
    [3] = {
            ID = 3;
            Icon = "img://zyzh_cfz_01.png";
            Name = "";								--岑夫子
            Resources = {
                [RecyclingConfig.PicList.Gas] = 1; 
                [RecyclingConfig.PicList.Money] = 1; 
                [RecyclingConfig.PicList.Exp] = 1; 
            };
            Money = {
                [1] = 30000;
                [2] = 0;
                [3] = 5;
            };
            MaxCount = 40;
            GSUpdate = function(self, oPlayer)
                if CExaminationMgr:GetAnswerCount(oPlayer:GetRoleID()) then
                    return self.MaxCount - 
                        CExaminationMgr:GetAnswerCount(oPlayer:GetRoleID());
                else
                    return self.MaxCount;
                end
            end;
            KSUpdate = function(self, tCount)
                for nRoleID, _ in pairs(tCount) do 
                    tCount[nRoleID][self.ID] = self.MaxCount;
                end
                
                CExaminationMgr:CalculateCount(tCount, self.MaxCount, self.ID);
            end;         
    };
    [4] = {
            ID = 4;
            Icon = "img://zyzh_ywjt_01.png";
            Name = "";								--演武节堂
            Resources = {
                [RecyclingConfig.PicList.Gas] = 2500; 
                [RecyclingConfig.PicList.Exp] = 1; 
                [RecyclingConfig.PicList.Money] = 100000;
            };
            Money = {
                [1] = 200000;
                [2] = 0;
                [3] = 10;
            };
            MaxCount = 1;
            duplID = 1009;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };
    [5] = {
            ID = 5;
            Icon = "img://zyzh_dply_01.png";
            Name = ""; 								--大破联营
            Resources = {
                [RecyclingConfig.PicList.Money] = 150000; 
                [RecyclingConfig.PicList.Exp] = 1; 
                [RecyclingConfig.PicList.Gas] = 3000;
            };
            Money = {
                [1] = 300000;
                [2] = 0;
                [3] = 15;
            };
            MaxCount = 1;
            duplID = 1003;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };
    [6] = {
            ID = 6;    
            Icon = "img://zyzh_qmyj_01.png";
            Name = ""; 								--绮梦幽静
            Resources = {
                [RecyclingConfig.PicList.Gas] = 2500; 
                [RecyclingConfig.PicList.Exp] = 1; 			
            };
            Money = {
                [1] = 200000;
                [2] = 0;
                [3] = 20;
            };
            MaxCount = 1;
            duplID = 1012;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };
    [7] = {
            ID = 7;
            Icon = "img://zyzh_fhzl_01.png";
            Name = ""; 								--烽火辎路
             Resources = {
                [RecyclingConfig.PicList.Gas] = 2500; 
                [RecyclingConfig.PicList.Money] = 100000; 
                [RecyclingConfig.PicList.Exp] = 1;
            };
            Money = {
                [1] = 200000;
                [2] = 0;
                [3] = 10;
            };
            MaxCount = 1;
            duplID = 1008;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };
    [8] = {
            ID = 8;
            Icon = "img://zyzh_wxdc_01.png";
            Name = ""; 								--五行道场
            Resources = {
                [RecyclingConfig.PicList.Gas] = 3000; 
                [RecyclingConfig.PicList.Money] = 120000; 
                [RecyclingConfig.PicList.Exp] = 1; 
            };
            Money = {
                [1] = 240000;
                [2] = 0;
                [3] = 12;
            };
            MaxCount = 1;
            duplID = 1006;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };
    [9] = {
            ID = 9;
            Icon = "img://zyzh_swxy_01.png";
            Name = ""; 								--守卫襄阳
            Resources = {
                [RecyclingConfig.PicList.Exp] = 1; 
                [RecyclingConfig.PicList.BindMoney] = 300;
				[RecyclingConfig.PicList.Gas] = 4000;
                [RecyclingConfig.PicList.Money] = 200000;				
            };
            Money = {
                [1] = 400000;
                [2] = 0;
                [3] = 20;
            };
            MaxCount = 1;
            duplID = 1010;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };
    [10] = {
            ID = 10;
            Icon = "img://zyzh_smmf_01.png";
            Name = ""; 								--十面埋伏
            Resources = {
                [RecyclingConfig.PicList.Exp] = 1; 
				[RecyclingConfig.PicList.Gas] = 3000;			
            };
            Money = {
                [1] = 200000;
                [2] = 0;
                [3] = 20;
            };
            MaxCount = 1;
            duplID = 1011;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };	
    [11] = {
            ID = 11;
            Icon = "img://zyzh_whcl_01.png";
            Name = ""; 								--卧虎藏龙
            Resources = {
                [RecyclingConfig.PicList.Exp] = 1; 
				[RecyclingConfig.PicList.Gas] = 5000;
                [RecyclingConfig.PicList.Money] = 300000;				
            };
            Money = {
                [1] = 600000;
                [2] = 0;
                [3] = 20;
            };
            MaxCount = 1;
            duplID = 1013;
            GSUpdate = DuplGSUpdate;
            KSUpdate = DuplKSUpdate;
    };		
};

-- 资源的图标
RecyclingConfig.Picture = {
            [RecyclingConfig.PicList.Exp] = {
                Pic = 'Qita_exp.png';
                Gray = 'Qita_exp_0.png';
                Des = '经验:';
            };
            [RecyclingConfig.PicList.Gas] = {
                Pic = 'Qita_zhenqi.png';
                Gray = 'Qita_zhenqi_0.png';
                Des = '真气:';
            };
            [RecyclingConfig.PicList.BindMoney] = {
                Pic = 'Qita_lijin.png';
                Gray = 'Qita_lijin_0.png';
                Des = '礼金:';
            };         
            [RecyclingConfig.PicList.Money] = {
                Pic = 'Qita_money.png';
                Gray = 'Qita_money_0.png';
                Des = '银两:';
            };
            [RecyclingConfig.PicList.Reputation] = {
                Pic = 'Qita_shengwang.png';
                Gray = 'Qita_shengwang.png';
                Des = '风云声望:';
            };
};

-- 各项活动ID表
RecyclingConfig.ActivityID = {
    -- 所有
    [1] = {
        [1] = 1;
        [2] = 2;
        [3] = 3;
        [4] = 4;
        [5] = 5;
        [6] = 6;
        [7] = 7;
        [8] = 8;
        [9] = 9;
        [10] = 10;		
        [11] = 11;		
    };
    -- 活动ID表
    [2] = {
        [1] = 1;
        [2] = 3;
    };
    -- 副本ID表
    [3] = {
        [1] = 4;
        [2] = 5;
        [3] = 6;
        [4] = 7;		
        [5] = 8;		
        [6] = 9;
        [7] = 10;	
        [8] = 11;		
    };
    -- 风云任务
    [4] = {
        [1] = 2;	
    };
};

-- 开通的标签名称
RecyclingConfig.IndexName = {
    [1] = "全部";
    [2] = "活动";
    [3] = "副本";
    [4] = "每日任务";
};

-- 格式化字符串
_G.RecyclingConfig.FormatString = function(tCount)
    local sFormat = "";
    for k, v in pairs(tCount) do
        sFormat = sFormat..k..","..v..";"
    end
    return sFormat;
end
