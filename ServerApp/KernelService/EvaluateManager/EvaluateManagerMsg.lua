﻿--[[功能：评价系统消息处理（服务器）版本：v1.0作者：郭肇义时间：2012-04-05]]_define()--客户端获取评价define.KSGetEvaluateMsg{	SrcID = 0,	TarID = 0,}when{}function KSGetEvaluateMsg(SrcID,TarID)	local tabInfo = CEvaluateManager:GetEvaluate(TarID)	local objPlayer = CGameLineManager:GetPlayer(SrcID)	if not objPlayer then return end	objPlayer.OnKSGetEvaluateMsg{ RoleID = TarID,Info = tabInfo }end;--客户端添加评价define.KSAddEvaluateMsg{	RoleID = 0,	Type = 0,}when{}function KSAddEvaluateMsg(RoleID,Type)	CEvaluateManager:AddEvaluate(RoleID,Type)end;