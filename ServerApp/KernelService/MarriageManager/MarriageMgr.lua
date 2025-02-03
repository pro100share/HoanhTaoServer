﻿--[[功能：全局婚姻管理器类型：继承于CSingle类，用来管理玩家婚姻关系版本：	v1.0	01-21-2013	create by lkj]]_G.CMarriageMgr = CSingle:new();CSingleManager:AddSingle(CMarriageMgr);--createfunction CMarriageMgr:Create()    self:ReadMarriageInfo();    self:ReadKeepsakeChangeInfo();    	return true;end;--updatefunction CMarriageMgr:Update(dwInterval)	return true;end;--destroyfunction CMarriageMgr:Destroy()end;------------------------------------------------------------------------------------------------local MarriageInfo = {}function MarriageInfo:New(HusbandRoleID, WifeRoleID, MarriedTime, HusbandName, WifeName, dwLove)    local info = {        HusbandRoleID   = HusbandRoleID,        WifeRoleID      = WifeRoleID,        MarriedTime     = MarriedTime,        HusbandName     = HusbandName,        WifeName        = WifeName,        dwLove          = dwLove    };    return info;end;--从数据库中读出婚姻信息function CMarriageMgr:ReadMarriageInfo()	local res = CPlayerDBQuery:GetDBQuery():execute('select * from "T_Role_Marriage"');    self.m_tMarriageInfo        = {};    self.m_tRoleToMarriageID    = {};    self.m_nMarriageID          = 0;    if res then        for k, v in ipairs(res) do            self.m_tMarriageInfo[k] = MarriageInfo:New(                v.HusbandRoleID,                v.WifeRoleID,                v.MarriedTime,                v.HusbandName,                v.WifeName,                v.dwLove            );            self.m_nMarriageID                          = k;            self.m_tRoleToMarriageID[v.HusbandRoleID]   = k;            self.m_tRoleToMarriageID[v.WifeRoleID]      = k;        end;    end;end;local KeepsakeChangeInfo = {};function KeepsakeChangeInfo:New(dwItemEnumID, sFormerName)    local obj = {        ItemEnumID  = dwItemEnumID,        FormerName  = sFormerName    };    return obj;end;--从数据库中读出信物更改信息function CMarriageMgr:ReadKeepsakeChangeInfo()    local res = CPlayerDBQuery:GetDBQuery():execute('select * from "T_Role_MarriageChange"');    self.m_tRoleToKeepsakeChange = {};    if res then        for k, v in ipairs(res) do            self.m_tRoleToKeepsakeChange[v.RoleID] = KeepsakeChangeInfo:New(v.ItemEnumID, v.sFormerName);        end;    end;end;--获取下一个婚姻IDfunction CMarriageMgr:GetNextMarriageID()    self.m_nMarriageID = self.m_nMarriageID + 1;    return self.m_nMarriageID;end;--获取婚姻信息function CMarriageMgr:GetMarriageInfo(RoleID)    local marryID = self.m_tRoleToMarriageID[RoleID];    if marryID then        return self.m_tMarriageInfo[marryID];    end;end;--获取信物更改信息function CMarriageMgr:GetKeepsakeChangeInfo(RoleID)    local info = self.m_tRoleToKeepsakeChange[RoleID];    if info then        self.m_tRoleToKeepsakeChange[RoleID] = nil;        --删除数据库信息        local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateDeleteCmd("T_Role_MarriageChange");        if not SqlCmd then            _err("SqlCmd == nil by CMarriageMgr:GetKeepsakeChangeInfo");            return;        end;		SqlCmd.Wheres.RoleID = RoleID;        if not SqlCmd:execute() then            _err("Delete T_Role_MarriageChange from DB Error");            return;        end;        return info.ItemEnumID, info.FormerName;    end;end;--结婚登记function CMarriageMgr:MarryRegister(HusbandRoleID, WifeRoleID, MarriedTime, HusbandName, WifeName, Love)    --记录缓存    local marryID = self:GetNextMarriageID();    local marriageInfo = MarriageInfo:New(        HusbandRoleID,        WifeRoleID,        MarriedTime,        HusbandName,        WifeName,        Love    );    self.m_tMarriageInfo[marryID]           = marriageInfo;    self.m_tRoleToMarriageID[HusbandRoleID] = marryID;    self.m_tRoleToMarriageID[WifeRoleID]    = marryID;    --记录数据库    local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateInsertCmd("T_Role_Marriage");    if SqlCmd == nil then         _err("SqlCmd == nil by CMarriageMgr:MarryRegister");        return;    end;    SqlCmd.Fields.HusbandRoleID = marriageInfo.HusbandRoleID;    SqlCmd.Fields.WifeRoleID    = marriageInfo.WifeRoleID;    SqlCmd.Fields.MarriedTime   = marriageInfo.MarriedTime;    SqlCmd.Fields.HusbandName   = marriageInfo.HusbandName;    SqlCmd.Fields.WifeName      = marriageInfo.WifeName;    SqlCmd.Fields.dwLove        = marriageInfo.dwLove;    if not SqlCmd:execute() then        _err("Insert T_Role_MarriageChange To DB Error");        return;    end;end;--离婚登记function CMarriageMgr:DivorceRegister(RoleID, bCompel)    local marryID = self.m_tRoleToMarriageID[RoleID];    if not marryID then        _err("marriageInfo nil !!!", RoleID);        return;    end;    local marriageInfo = self.m_tMarriageInfo[marryID];        --删除缓存    self.m_tMarriageInfo[marryID]                           = nil;    self.m_tRoleToMarriageID[marriageInfo.WifeRoleID]       = nil;    self.m_tRoleToMarriageID[marriageInfo.HusbandRoleID]    = nil;    --删除数据库结婚信息    local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateDeleteCmd("T_Role_Marriage");    if not SqlCmd then        _err("SqlCmd == nil by CMarriageMgr:DivorceRegister");        return;    end;	SqlCmd.Wheres.HusbandRoleID = marriageInfo.HusbandRoleID;    if not SqlCmd:execute() then        _err("Delete T_Role_Marriage from DB Error");        return;    end;    --停止婚宴	CMarriageBanquetMgr:Divorce(RoleID);    --删除悄悄话    self:DelChat(marriageInfo.HusbandRoleID, 0);    self:DelChat(marriageInfo.WifeRoleID, 0);        --通知对方    local NoticeRoleID, FormerName;    if marriageInfo.HusbandRoleID == RoleID then        NoticeRoleID    = marriageInfo.WifeRoleID;        FormerName      = marriageInfo.HusbandName;    else        NoticeRoleID    = marriageInfo.HusbandRoleID;        FormerName      = marriageInfo.WifeName;    end;    --查看玩家是否在线    local objPlayer = CPlayerManager:GetPlayerByRoleID(NoticeRoleID);    if objPlayer and objPlayer.objLine then--在线        objPlayer.MarMgr_DivorceMsg{Compel = bCompel};    else--离线        local info = self.m_tRoleToKeepsakeChange[NoticeRoleID];        if info then            --更新缓存            info.ItemEnumID = 0;            info.FormerName = FormerName;            --更新数据库            local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateUpdateCmd("T_Role_MarriageChange");            if SqlCmd == nil then                 _err("SqlCmd == nil by CMarriageMgr:ChangeKeepsake");                return;            end;			SqlCmd.Wheres.RoleID		= NoticeRoleID;            SqlCmd.Fields.ItemEnumID	= 0;            SqlCmd.Fields.sFormerName   = FormerName;            if not SqlCmd:execute() then                _err("Update T_Role_MarriageChange To DB Error");                return;            end        else            --插入缓存            self.m_tRoleToKeepsakeChange[NoticeRoleID] = KeepsakeChangeInfo:New(0, FormerName);            --插入数据库            local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateInsertCmd("T_Role_MarriageChange");            if SqlCmd == nil then                 _err("SqlCmd == nil by CMarriageMgr:ChangeKeepsake");                return;            end;             SqlCmd.Fields.RoleID       	= NoticeRoleID;            SqlCmd.Fields.ItemEnumID	= 0;            SqlCmd.Fields.sFormerName   = FormerName;            if not SqlCmd:execute() then                _err("Insert T_Role_MarriageChange To DB Error");                return;            end;        end;    end;end;--玩家更新亲密度function CMarriageMgr:UpdateLove(RoleID, Love)    local marriageInfo = self:GetMarriageInfo(RoleID);    if marriageInfo then		marriageInfo.dwLove = Love;        local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateUpdateCmd("T_Role_Marriage");        if not SqlCmd then            _err("SqlCmd == nil by CMarriageMgr:UpdateLove");            return;        end;		SqlCmd.Wheres.HusbandRoleID = marriageInfo.HusbandRoleID;        SqlCmd.Fields.dwLove = Love;        if not SqlCmd:execute() then            _err("Update T_Role_Marriage To DB Error");            return;        end;    else        _err("err RoleID!!!:", RoleID);    end;end;--插入玩家夫妻聊天记录function CMarriageMgr:SendChat(RoleID, Msg, Time)	local marriageInfo = self:GetMarriageInfo(RoleID);    if marriageInfo then        local Record_1 = CPlayerDBQuery:GetDBQuery():CreateInsertCmd("T_Role_MarriageChatList");        if Record_1 == nil then             _err("SqlCmd == nil by CMarriageMgr:SendChat");            return;        end;        local dwSendRoleID         if marriageInfo.HusbandRoleID == RoleID then            dwSendRoleID = marriageInfo.WifeRoleID;        else            dwSendRoleID = marriageInfo.HusbandRoleID;        end;        Record_1.Fields.n_RoleID	= dwSendRoleID;        Record_1.Fields.n_Time		= Time;	        Record_1.Fields.b_Recv		= false;	        Record_1.Fields.s_MsgText	= Msg;	        if not Record_1:execute() then            _err("Insert T_Role_MarriageChatList To DB Error");            return;        end;                local Record_2 = CPlayerDBQuery:GetDBQuery():CreateInsertCmd("T_Role_MarriageChatList");        if Record_2 == nil then             _err("SqlCmd == nil by CMarriageMgr:SendChat");            return;        end;         Record_2.Fields.n_RoleID	= RoleID;        Record_2.Fields.n_Time		= Time;	        Record_2.Fields.b_Recv		= true;	        Record_2.Fields.s_MsgText	= Msg;	        if not Record_2:execute() then            _err("Insert T_Role_MarriageChatList To DB Error");            return;        end;    else        _err("err RoleID!!!:", RoleID);    end;end;--删除悄悄话消息function CMarriageMgr:DelChat(RoleID, Time)    if Time > 0 then--删除一条指定消息        local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateDeleteCmd("T_Role_MarriageChatList");        if not SqlCmd then            _err("SqlCmd == nil by CMarriageMgr:DelChat");            return;        end;		SqlCmd.Wheres.n_RoleID = RoleID;        SqlCmd.Wheres.n_Time = Time;        if not SqlCmd:execute() then            _err("Delete T_Role_MarriageChatList from DB Error");            return;        end;	else--删除全部        local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateDeleteCmd("T_Role_MarriageChatList");        if not SqlCmd then            _err("SqlCmd == nil by CMarriageMgr:DelChat");            return;        end;		SqlCmd.Wheres.n_RoleID = RoleID;        if not SqlCmd:execute() then            _err("Delete T_Role_MarriageChatList from DB Error");            return;        end;    end;end;--结婚信物更改记录function CMarriageMgr:ChangeKeepsake(RoleID, ItemEnumID)    --查看玩家是否在线    local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID);    if objPlayer and objPlayer.objLine then--在线        objPlayer.MarMgr_KeepsakeChangeMsg{ItemEnumID = ItemEnumID};    else--离线        local info = self.m_tRoleToKeepsakeChange[RoleID];        if info then            --更新缓存            info.ItemEnumID = ItemEnumID;            --更新数据库            local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateUpdateCmd("T_Role_MarriageChange");            if SqlCmd == nil then                 _err("SqlCmd == nil by CMarriageMgr:ChangeKeepsake");                return;            end;			SqlCmd.Wheres.RoleID		= RoleID;            SqlCmd.Fields.ItemEnumID	= ItemEnumID;            if not SqlCmd:execute() then                _err("Update T_Role_MarriageChange To DB Error");                return;            end        else            --插入缓存            self.m_tRoleToKeepsakeChange[RoleID] = KeepsakeChangeInfo:New(ItemEnumID, "");            --插入数据库            local SqlCmd = CPlayerDBQuery:GetDBQuery():CreateInsertCmd("T_Role_MarriageChange");            if SqlCmd == nil then                 _err("SqlCmd == nil by CMarriageMgr:ChangeKeepsake");                return;            end;             SqlCmd.Fields.RoleID       	= RoleID;            SqlCmd.Fields.ItemEnumID	= ItemEnumID;            if not SqlCmd:execute() then                _err("Insert T_Role_MarriageChange To DB Error");                return;            end;        end;    end;end;