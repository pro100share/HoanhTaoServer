--[[
功能：帮派系统之召唤令（服务器）
版本：v1.0
作者：魏云
时间：2014-02-19
]]
----------------------------------------------------------------------------------
----使用穿云剑物品召唤世家成员 弹集结宣言对话框
local cfg = GuildCallMemberConfig
local Text = cfg.Text
CGuildPlayerMsg.Src.UseItemCallGuildMember = true
function CGuildPlayerMsg:UseItemCallGuildMember(itemID)
	self.objPlayer:GetSystem("CGuildSystem"):UseItemCallGuildMember(itemID);
end
function CGuildSystem:UseItemCallGuildMember(itemID)
	if not self:CheckUseItemCallGuildMember(itemID) then return end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	self:Msg():NotifyKernel('KSWriteConcentrateDeclaration',objPlayer:GetRoleID());
end
---检查该地图是否正确
function CGuildSystem:CheckMapIsOk(mapID)
	for i = 1,#_G.GuildCallMemberConfig.SceneLoader do
		if(mapID == _G.GuildCallMemberConfig.SceneLoader[i]) then
			return true;
		end
	end
	return false;
end
----ks返回设置世家召唤令信息
function CGuildServerMsg:KSSetInfoByCallItem(Info)
	CGuildSystemManager:SetInfoByUseCallItem(Info);
end
CGuildPlayerMsg.Des.WriteConcentrateDeclaration = true
function CGuildPlayerMsg:WriteConcentrateDeclaration()
	self:NotifyClient('WriteConcentrateDeclaration');
end
CGuildPlayerMsg.Des.CallGuildMemberSuc = true
function CGuildPlayerMsg:CallGuildMemberSuc()
	self:NotifyClient('CallGuildMemberSuc');
end
----开始召唤世家成员
CGuildPlayerMsg.Src.CLStartCallGuildMember = true
function CGuildPlayerMsg:CLStartCallGuildMember(strs,dwGuildID,itemID)
	if not self.objPlayer:GetSystem("CGuildSystem"):IsCanUseItem(dwGuildID) then 
		return 
	end
	if not self.objPlayer:GetSystem("CGuildSystem"):CheckUseItemCallGuildMember(itemID) then return end
	self:NotifyKernel('KSCallGuildMemberSuc',self.objPlayer:GetRoleID());
	local tabInfo = {};
	tabInfo.CurfXPos,tabInfo.CurfYPos = CGuildSystemManager:GetCurPosByUseCallItem(dwGuildID);
	tabInfo.CurMapID = CGuildSystemManager:GetCurMapIDByUseCallItem(dwGuildID);
	tabInfo.RoleName = CGuildSystemManager:GetRoleNameByUseCallItem(dwGuildID);
	tabInfo.RoleID = CGuildSystemManager:GetRoleIDByUseCallItem(dwGuildID);
	tabInfo.Curline = CGuildSystemManager:GetCurLineByUseCallItem(dwGuildID);
	tabInfo.CurTime = CGuildSystemManager:GetUseTimeByUseCallItem(dwGuildID);
	tabInfo.dwGuildID = dwGuildID;
	tabInfo.Strs = strs;
	local itemSys = self.objPlayer:GetSystem("CItemSystem");
	itemSys:DelEnumItemInPacket(_G.GuildCallMemberConfig.ItemID, 1, false, _G.ItemSysOperType.CallGuildMember);
	self:NotifyKernel('GSStartCallGuildMember',tabInfo);
end
function CGuildSystem:CheckUseItemCallGuildMember(itemID)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return false;
	end
	local objItemSys = objPlayer:GetSystem("CItemSystem");
	if not objItemSys then
		return false;
	end
	if(itemID ~= _G.GuildCallMemberConfig.ItemID) then
		return false;
	end
	---判断是否有世家
	if(not self:GetGuildInfo()) then
		sysScript:Notice(Text.IsNoCan4);
		return false;
	end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	---获取玩家所在当前场景
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end
	local CurMapID = objMapSys:GetCurMapID();
	CGuildSystemManager:SetCurMapIDByUseCallItem(CurMapID, self:GetGuildInfo().dwGuildID);
	---判断玩家所在场景是否正确
	local btrue = self:CheckMapIsOk(CurMapID);
	if(not btrue) then
		sysScript:Notice(Text.IsNoCan5);----
		return false;
	end
	---获取玩家坐标点
	local CurfXPos = objMapSys.fXPos;
	local CurfYPos = objMapSys.fYPos;
	CGuildSystemManager:SetCurPosByUseCallItem(CurfXPos,CurfYPos, self:GetGuildInfo().dwGuildID)
	---获取玩家所在线
	local Curline = CKernelApp.dwLineID;
	CGuildSystemManager:SetCurLineByUseCallItem(Curline, self:GetGuildInfo().dwGuildID);
	CGuildSystemManager:SetRoleNameByUseCallItem(objPlayer:GetName(), self:GetGuildInfo().dwGuildID);
	CGuildSystemManager:SetRoleIDByUseCallItem(objPlayer:GetRoleID(), self:GetGuildInfo().dwGuildID);
	return true
end
--是否能使用保护
function CGuildSystem:IsCanUseItem(dwGuildID)
	local objPlayer = self:GetPlayer();
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return 11;
	end
	---判断时间到了没有
	local curTime = _now();
	local UseTime = CGuildSystemManager:GetUseTimeByUseCallItem(dwGuildID)
	if(UseTime ~= 0 and UseTime ) then
		if(curTime - UseTime < _G.GuildCallMemberConfig.Timepiece) then 
			sysScript:Notice(Text.IsNoCan3);--
			return false;
		end
	end
	CGuildSystemManager:SetUseTimeByUseCallItem(dwGuildID,curTime);
	return true
end
----弹传送界面
CGuildPlayerMsg.Des.KSCallGuildMemberInterface = true
function CGuildPlayerMsg:KSCallGuildMemberInterface(tabInfo)
	local objPlayer = self.objPlayer;
	if(not objPlayer) then
		return;
	end
	if(self.objPlayer:GetRoleID() ~= CGuildSystemManager:GetRoleIDByUseCallItem(tabInfo.dwGuildID)) then
		self:NotifyClient('CallGuildMemberInterface',tabInfo);
	end
end
CGuildPlayerMsg.Des.CallMemberBroadCastMsg = true
function CGuildPlayerMsg:CallMemberBroadCastMsg()
	local objPlayer = self.objPlayer;
	if(not objPlayer) then
		return;
	end
	---公告
	CGameApp.CallMemberBroadCastMsg{PlayerName	= objPlayer:GetName(),PlayerRoleID=objPlayer:GetRoleID(),GuildName = self.objPlayer:GetSystem('CGuildSystem'):GetGuildName()};
end
---处理传送功能
CGuildPlayerMsg.Src.CLCallGuildMemberLogic = true
function CGuildPlayerMsg:CLCallGuildMemberLogic()
	---获取玩家所在当前场景
	local objMapSys = self.objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end
	local curMapID = objMapSys:GetCurMapID();
	---获取玩家所在线
	local Curline = CKernelApp.dwLineID;
	local objGuildSystem = self.objPlayer:GetSystem('CGuildSystem')
	if(not objGuildSystem) then
		return;
	end
	local dwGuildId = objGuildSystem:GetGuildInfo().dwGuildID;
	local callLine = CGuildSystemManager:GetCurLineByUseCallItem(dwGuildId);
	if(Curline ~= callLine) then
		---换线
		self:NotifyClient("CallGuildFail", callLine,false);
		return;
		-- objGuildSystem:ChangeLineByUseGuildCallItem(callLine);
		-- CGuildSystemManager:AddChangeLinePlayerID(self.objPlayer:GetRoleID());
	end
	---传送
	objGuildSystem:SendUseGuildCallItemPos(false);
	self:NotifyClient("CallGuildFail", callLine,true);
	if(CGuildSystemManager:GetUseTimeByUseCallItem(dwGuildId) ~= 0) then
		self:NotifyKernel('GSCompleteCallGuildMember',CGuildSystemManager:GetRoleIDByUseCallItem(dwGuildId));
	end
end
----取消召唤
CGuildPlayerMsg.Src.CLCloseCallGuildMember = true
function CGuildPlayerMsg:CLCloseCallGuildMember()
	local Info = {};
	Info.CurfXPos = 0;
	Info.CurfYPos= 0;
	Info.Curline= 0;
	Info.CurMapID= 0;
	Info.CurTime= 0;
	Info.RoleName= "";
	Info.RoleID= 0;
	CGuildSystemManager:SetInfoByUseCallItem(Info);
end

---完成召唤
function CGuildServerMsg:KSCompleteCallGuildMember()
	local Info = {};
	Info.CurfXPos = 0;
	Info.CurfYPos= 0;
	Info.Curline= 0;
	Info.CurMapID= 0;
	Info.CurTime= 0;
	Info.RoleName= "";
	Info.RoleID= 0;
	CGuildSystemManager:SetInfoByUseCallItem(Info);
end
---换线
function CGuildSystem:ChangeLineByUseGuildCallItem(callLine)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	objPlayer:ClientChangeLineReq(callLine);
end
---传送
function CGuildSystem:SendUseGuildCallItemPos(bchangeline)
	local objMapSys = self:GetPlayer():GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end
	local objGuildSystem = self:GetPlayer():GetSystem('CGuildSystem')
	if(not objGuildSystem) then
		return;
	end
	if not objGuildSystem:GetGuildInfo() then
		return;
	end;
	local dwGuildId = objGuildSystem:GetGuildInfo().dwGuildID;
	---判断是否是换线玩家
	local roleID = self:GetPlayer():GetRoleID();
	if(bchangeline) then
		local btrue = CGuildSystemManager:CheckPlayerIsChangeLine(roleID);
		if(not btrue) then
			return;
		end
		CGuildSystemManager:DelChangeLinePlayerID(roleID)
	end
	---传送逻辑
	local tabInfo = {};
	tabInfo.fXPos,tabInfo.fYPos = CGuildSystemManager:GetCurPosByUseCallItem(dwGuildId);
	tabInfo.dwNewMapID = CGuildSystemManager:GetCurMapIDByUseCallItem(dwGuildId);
	objMapSys:ExecTransforMapToPoint(tabInfo);
end
