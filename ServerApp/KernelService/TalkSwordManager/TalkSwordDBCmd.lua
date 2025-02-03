--[[
    [ \brief 离线战斗
    [ \author 沈祺
    [ \date 2014-07-3
    [ 玩家可以与离线角色进行战斗
    [ 战斗已战斗力高低分胜负
    [ 内含类似排行榜功能
    [ \数据库操作命令
    ]]

--临时配置表缓存
local tConfig = _G.TalkSwordConfig;
--临时脚本缓存
local tScript = _G.TalkSwordScript;

--[[
    [ \brief DB，SQL语句声明
    ]]
function CTalkSwordManager:DBCmdInit()
    --榜单DB操作
    self.RankDB = {
        DBCmdRead = [[  
                        SELECT * 
                        FROM "T_TalkSwordRank"
                    ]];

        DBCmdInsert = [[
                        INSERT INTO "T_TalkSwordRank" 
                        VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9);
                      ]];

        DBCmdUpdate = [[
                        UPDATE "T_TalkSwordRank" 
                        SET "nRoleID"=$2,"sPlayerName"=$3,"nAttack"=$4,
                            "nIconID"=$5,"nContinuousKill"=$6,
                            "nProfessionID"=$7,"nIsRobot"=$8,"nLevel"=$9 
                        WHERE "nRankID" = $1;
                      ]];
    };
    --奖励榜单DB操作
    self.RewardRankDB = {
        DBCmdRead = [[
                        SELECT * 
                        FROM "T_TalkSwordRewardRank"
                    ]];

        DBCmdInsert = [[
                        INSERT INTO "T_TalkSwordRewardRank" 
                        VALUES($1,$2);
                      ]];

        DBCmdUpdate = [[
                        UPDATE "T_TalkSwordRewardRank" 
                        SET "nRankID"=$2 
                        WHERE "nRoleID" = $1;
                      ]];
    };
    --保存战报,有可能玩家不在线所有要在这里写数据库,可以被打的玩家必然有DB
    self.ReportDB = {
        DBCmdRead = [[
                        SELECT * 
                        FROM "T_Role_TalkSword"
                        WHERE "nRoleID" = $1 
                    ]];

        DBCmdUpdate = [[
                        UPDATE "T_Role_TalkSword" 
                        SET "tReport"=$2
                        WHERE "nRoleID" = $1;
                      ]];
    };
    --定时清空
    self.RoleTalkSword = {
        DBCmdRead = [[
                        SELECT * 
                        FROM "T_Role_TalkSword"
                    ]];

        DBCmdRewardState = [[
                                UPDATE "T_Role_TalkSword" 
                                SET "nRewardState"=$1
                            ]];

        DBCmdClean = [[
                        UPDATE "T_Role_TalkSword" 
                        SET "nChallengeUse"=$1,"nChallengeAdd"=$2, 
                            "nAttackAdd"=$3
                     ]];
    };
end

--[[
    [ \brief DB读取排行榜单
    [ 返回值如果nil证明数据库是空需要创建机器人排行榜
    [ \return table tRank 返回排行榜对象
    ]]
function CTalkSwordManager:InitRankDB()
    local tDBInfo = self.objDB:execute(self.RankDB.DBCmdRead);
    if not tDBInfo then
        return self.tRank;
    end
    for nRank,tPlayerInfo in ipairs(tDBInfo) do
        self.tRank[tPlayerInfo.nRankID] = {};
        self.tRank[tPlayerInfo.nRankID].nRoleID = tPlayerInfo.nRoleID;
        self.tRank[tPlayerInfo.nRankID].sPlayerName = tPlayerInfo.sPlayerName;
        self.tRank[tPlayerInfo.nRankID].nAttack = tPlayerInfo.nAttack;
        self.tRank[tPlayerInfo.nRankID].nIsRobot = tPlayerInfo.nIsRobot;
        self.tRank[tPlayerInfo.nRankID].nIconID = tPlayerInfo.nIconID;
        self.tRank[tPlayerInfo.nRankID].nContinuousKill = 
                                                tPlayerInfo.nContinuousKill;
        self.tRank[tPlayerInfo.nRankID].nProfessionID = 
                                                    tPlayerInfo.nProfessionID;
        self.tRank[tPlayerInfo.nRankID].nLevel = tPlayerInfo.nLevel;
    end
    return self.tRank;
end

--[[
    [ \brief DB读取奖励榜单
    ]]
function CTalkSwordManager:InitRankRewardDB()
    local tDBInfo = self.objDB:execute(self.RewardRankDB.DBCmdRead);
    if not tDBInfo then
        return;
    end
    for i,tRankReward in ipairs(tDBInfo) do
        self.tRankReward[tRankReward.nRoleID] = tRankReward.nRankID;
    end
end

--[[
    [ \brief 写入战报数据
    [ \param table tNewReport 新的战报
    [ \param number nRoleID 需要写入战报的玩家
    ]]
function CTalkSwordManager:UpdateReportDB(tNewReport, nRoleID)
    local tDBInfo = self.objDB:execute(self.ReportDB.DBCmdRead,nRoleID);
    local lastIndex = 0;
    local sText = {};
    if tDBInfo then 
        while #tDBInfo ~= 0 do
            if string.len(tDBInfo[1].tReport) == 0 then
                break;
            end
            local nextIndex = lastIndex + 1;
            lastIndex = string.find(tDBInfo[1].tReport,";",nextIndex);
            if not lastIndex then
                break;
            end
            local strcut = string.sub(tDBInfo[1].tReport, nextIndex, 
                                                                    lastIndex);
            table.insert(sText,strcut);
        end
    end
    table.insert(sText,1,self:MakeStringByTable({tNewReport}));
    --只保存5条数据
    if #sText > tConfig.SRecordLimit then
        table.remove(sText);
    end
    local sReport = "";
    for i,v in ipairs(sText) do
        if type(v) ~= "table" then
            sReport = sReport..v;
        end
    end
    self.objDB:execute(self.ReportDB.DBCmdUpdate,nRoleID,sReport);
end

--[[
    [ \brief 保存玩家基础信息
    [ \param number nRank 需要保存的玩家排名
    ]]
function CTalkSwordManager:SaveBaseInfoDB(nRank)
    --更新挑战者数据
    self.objDB:execute(self.RankDB.DBCmdUpdate,nRank,
                        self.tRank[nRank].nRoleID,
                        self.tRank[nRank].sPlayerName,
                        self.tRank[nRank].nAttack,
                        self.tRank[nRank].nIconID,
                        self.tRank[nRank].nContinuousKill,
                        self.tRank[nRank].nProfessionID,
                        self.tRank[nRank].nIsRobot,
                        self.tRank[nRank].nLevel);
end
