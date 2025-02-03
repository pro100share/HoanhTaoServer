--[[
���ܣ�����ϵͳ֮�ٻ����������
�汾��v1.0
���ߣ�κ��
ʱ�䣺2014-02-19
]]
----------------------------------------------------------------------------------
----ʹ�ô��ƽ���Ʒ�ٻ����ҳ�Ա ���������ԶԻ���
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
---���õ�ͼ�Ƿ���ȷ
function CGuildSystem:CheckMapIsOk(mapID)
	for i = 1,#_G.GuildCallMemberConfig.SceneLoader do
		if(mapID == _G.GuildCallMemberConfig.SceneLoader[i]) then
			return true;
		end
	end
	return false;
end
----ks�������������ٻ�����Ϣ
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
----��ʼ�ٻ����ҳ�Ա
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
	---�ж��Ƿ�������
	if(not self:GetGuildInfo()) then
		sysScript:Notice(Text.IsNoCan4);
		return false;
	end
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	---��ȡ������ڵ�ǰ����
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end
	local CurMapID = objMapSys:GetCurMapID();
	CGuildSystemManager:SetCurMapIDByUseCallItem(CurMapID, self:GetGuildInfo().dwGuildID);
	---�ж�������ڳ����Ƿ���ȷ
	local btrue = self:CheckMapIsOk(CurMapID);
	if(not btrue) then
		sysScript:Notice(Text.IsNoCan5);----
		return false;
	end
	---��ȡ��������
	local CurfXPos = objMapSys.fXPos;
	local CurfYPos = objMapSys.fYPos;
	CGuildSystemManager:SetCurPosByUseCallItem(CurfXPos,CurfYPos, self:GetGuildInfo().dwGuildID)
	---��ȡ���������
	local Curline = CKernelApp.dwLineID;
	CGuildSystemManager:SetCurLineByUseCallItem(Curline, self:GetGuildInfo().dwGuildID);
	CGuildSystemManager:SetRoleNameByUseCallItem(objPlayer:GetName(), self:GetGuildInfo().dwGuildID);
	CGuildSystemManager:SetRoleIDByUseCallItem(objPlayer:GetRoleID(), self:GetGuildInfo().dwGuildID);
	return true
end
--�Ƿ���ʹ�ñ���
function CGuildSystem:IsCanUseItem(dwGuildID)
	local objPlayer = self:GetPlayer();
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return 11;
	end
	---�ж�ʱ�䵽��û��
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
----�����ͽ���
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
	---����
	CGameApp.CallMemberBroadCastMsg{PlayerName	= objPlayer:GetName(),PlayerRoleID=objPlayer:GetRoleID(),GuildName = self.objPlayer:GetSystem('CGuildSystem'):GetGuildName()};
end
---�����͹���
CGuildPlayerMsg.Src.CLCallGuildMemberLogic = true
function CGuildPlayerMsg:CLCallGuildMemberLogic()
	---��ȡ������ڵ�ǰ����
	local objMapSys = self.objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end
	local curMapID = objMapSys:GetCurMapID();
	---��ȡ���������
	local Curline = CKernelApp.dwLineID;
	local objGuildSystem = self.objPlayer:GetSystem('CGuildSystem')
	if(not objGuildSystem) then
		return;
	end
	local dwGuildId = objGuildSystem:GetGuildInfo().dwGuildID;
	local callLine = CGuildSystemManager:GetCurLineByUseCallItem(dwGuildId);
	if(Curline ~= callLine) then
		---����
		self:NotifyClient("CallGuildFail", callLine,false);
		return;
		-- objGuildSystem:ChangeLineByUseGuildCallItem(callLine);
		-- CGuildSystemManager:AddChangeLinePlayerID(self.objPlayer:GetRoleID());
	end
	---����
	objGuildSystem:SendUseGuildCallItemPos(false);
	self:NotifyClient("CallGuildFail", callLine,true);
	if(CGuildSystemManager:GetUseTimeByUseCallItem(dwGuildId) ~= 0) then
		self:NotifyKernel('GSCompleteCallGuildMember',CGuildSystemManager:GetRoleIDByUseCallItem(dwGuildId));
	end
end
----ȡ���ٻ�
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

---����ٻ�
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
---����
function CGuildSystem:ChangeLineByUseGuildCallItem(callLine)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	objPlayer:ClientChangeLineReq(callLine);
end
---����
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
	---�ж��Ƿ��ǻ������
	local roleID = self:GetPlayer():GetRoleID();
	if(bchangeline) then
		local btrue = CGuildSystemManager:CheckPlayerIsChangeLine(roleID);
		if(not btrue) then
			return;
		end
		CGuildSystemManager:DelChangeLinePlayerID(roleID)
	end
	---�����߼�
	local tabInfo = {};
	tabInfo.fXPos,tabInfo.fYPos = CGuildSystemManager:GetCurPosByUseCallItem(dwGuildId);
	tabInfo.dwNewMapID = CGuildSystemManager:GetCurMapIDByUseCallItem(dwGuildId);
	objMapSys:ExecTransforMapToPoint(tabInfo);
end
