﻿--[[KS端副本管理器20:08 2012-8-2	create by qy]]define.DuplMgr_GetIdMsg{	user	= NONE;	DuplId  = 0;}when{user = NONE}DuplMgr_GetIdMsg = checkGSUserwhen{}function DuplMgr_GetIdMsg(user, DuplId)	CDuplMgr:SendDuplId(user, DuplId);end;--剧情副本获取iddefine.DuplMgr_GetGutIdMsg{	user	= NONE;	DuplId  = 0;	LineID = 0;	Info = {};}when{user = NONE}DuplMgr_GetGutIdMsg = checkGSUserwhen{}function DuplMgr_GetGutIdMsg(user, DuplId, LineID, Info)	CDuplMgr:SendGutDuplId(user, DuplId, LineID, Info);end;define.GetRecordFromKsMsg{	Line = 0,}when{}function GetRecordFromKsMsg(Line)	local objLine = CGameLineManager:GetLine(Line)	local recordInfo = CDuplMgr:GetDuplRecordTime();	objLine.OnKSInitRecordMsg{RecordInfo = recordInfo}end;--从ks上获得珍珑的信息define.GetZhenLongFromKsMsg{	Line = 0,}when{}function GetZhenLongFromKsMsg(Line)	local objLine = CGameLineManager:GetLine(Line)	local recordInfo = CDuplMgr:GetZhenLongTime();	objLine.OnInitZLRecordMsg{RecordInfo = recordInfo}end;define.GetZLKingFromKsMsg{	Line = 0,}when{}function GetZLKingFromKsMsg(Line)	local objLine = CGameLineManager:GetLine(Line)	local recordInfo = CDuplMgr:GetZLKing();	objLine.OnInitZLKingMsg{RecordInfo = recordInfo}end;--从ks上获得积分信息define.GetJiFenFromKsMsg{	Line = 0,}when{}function GetJiFenFromKsMsg(Line)	local objLine = CGameLineManager:GetLine(Line)	local recordInfo = CDuplMgr:GetJiFenInfo();	objLine.OnInitJiFenInfoMsg{RecordInfo = recordInfo}end;define.SendRecordToKsMsg{	Line = 0,	DuplId = 0,	RoleId =0,	LifeTime = 0,	RoleName = "",	IconId = 0,}when{}function SendRecordToKsMsg(Line, DuplId, RoleId, LifeTime, RoleName, IconId)	CDuplMgr:ChgRecordInfo(DuplId, RoleId, LifeTime, RoleName, IconId)end;--define.SendZLRecordToKsMsg{	Line = 0,	WaveId = 0,	RoleId =0,	RoleName = "",	LiveTime = 0,	IconId = 0,}when{}function SendZLRecordToKsMsg(Line, WaveId, RoleId, RoleName, LiveTime, IconId)	CDuplMgr:ChgZLRecordInfo(WaveId, RoleId, RoleName, LiveTime, IconId)end;--更新ks积分信息define.SendJiFenToKsMsg{	Line = 0,	DuplId = 0,	RoleId =0,	Score = 0,	RoleName = "",}when{}function SendJiFenToKsMsg(Line, DuplId, RoleId, Score, RoleName)	CDuplMgr:ChgJiFenInfo(DuplId, RoleId, Score, RoleName);end;