--[[
功能：系统设置系统
作者：周兴团
时间：2012-5-18
]]

--客户端初始化获取系统设置信息
define.RequestSettingMsg
{
	user = NONE,
}
when{ user = NONE }
RequestSettingMsg = checkUser
when{}
function RequestSettingMsg(user)
	local objSys = user:GetSystem("CSettingSystem");
	if not objSys then
		-- print("RoleID: ", user:GetRoleID(), "RequestSettingMsg");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestSettingMsg" );
	objSys:RequestSettingMsg();
end
--客户端请求更改系统设置
define.RequestChangeSettingMsg
{
	user = NONE,
	Setting = {};	--设置表
}
when{ user = NONE }
RequestChangeSettingMsg = checkUser
when{}
function RequestChangeSettingMsg(user, Setting)
	if not CConfig.bIsCrossSvr then	
		local objSys = user:GetSystem("CSettingSystem");
		if not objSys then
			-- print("RoleID: ", user:GetRoleID(), "RequestChangeSetting", Setting);
			return; 
		end;
		--print("RoleID: ", user:GetRoleID(), "RequestChangeSetting", Setting );
		objSys:RequestChangeSetting(Setting);
	end
end

_G.CSettingSystem = {};

function CSettingSystem:new()
	local obj = CSystem:new("CSettingSystem");
	obj.sInfo = SSettingInfo:new();
	obj.objDB = nil;
	for i,v in pairs(CSettingSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CSettingSystem:Create()
	local objPlayer = self:GetPlayer();
	
	self.objDB = objPlayer:GetDBQuery();
	--从换线中心获取数据
	local datalist = objPlayer:GetLineData("CSettingSystem")
	self.sInfo = datalist[1].sInfo;
	--table.print(self.sInfo)
	-- self.sInfo.dwAutoMartial = 0;    --模拟从数据库接收自动演武数据
	return true;
end
function CSettingSystem:Destroy()
	--保存玩家的系统设置
	self:SaveSetting();
end
function CSettingSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	--将数据设置到换线中心
	objPlayer:SetLineData("CSettingSystem", { sInfo = self.sInfo });
	
end
--客户端进入游戏登入所有场景之后
function CSettingSystem:OnEnterScene()
	
end;
---创建一条新的系统设置
function CSettingSystem:InsertSetting()
	self.sInfo.dwRoleID = self:GetPlayer():GetAccountID(); --GetRoleID();
	--保存数据，使用Insert命令增加一条数据库的记录
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Setting');
	if not SqlCmd then 
		_info("SqlCmd == nil by CSettingSystem:InsertSetting");
		return false;
	end;
	--设置Fields的值
	for k,v in pairs(self.sInfo) do
		SqlCmd.Fields[k] = v;
	end
	--执行命令
	SqlCmd:execute()
end
--保存系统设置
function CSettingSystem:SaveSetting()
	if not self.objDB then
		return;
	end
	--保存数据，使用Update命令更新一条数据库的记录
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Setting');
	--设置Wheres的值
	SqlCmd.Wheres.dwRoleID = self.sInfo.dwRoleID;
	--设置Fields的值
	for k,v in pairs(self.sInfo) do
		SqlCmd.Fields[k] = v;
	end
	--执行命令
	SqlCmd:execute()
end
--更新系统设置
function CSettingSystem:UpdateSetting( setUpdateColumn )
	if not self.objDB then
		return;
	end
	--保存数据，使用Update命令更新一条数据库的记录
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Setting');
	--设置Wheres的值
	SqlCmd.Wheres.dwRoleID = self.sInfo.dwRoleID;
	--设置Fields的值
	if not setUpdateColumn then
		for k,v in pairs(self.sInfo) do
			SqlCmd.Fields[k] = v;
		end
	else
		for k,name in pairs(setUpdateColumn) do
			if self.sInfo[name] then
				SqlCmd.Fields[name] = self.sInfo[name];
			end
		end
	end
	--执行命令
	SqlCmd:execute()
end
-----------------------------------------------------------------------------------------------------------------------------
--系统对外接口
--获取系统设置
function CSettingSystem:RequestSettingMsg()
	self:SynchronizeSettingMsg( self.sInfo );
end
--更改系统设置
function CSettingSystem:RequestChangeSetting(Setting)
	local setUpdateColumn = {};
	local isNeed = false;
	for k,v in pairs(Setting) do
		self.sInfo[k] = v;
		table.insert(setUpdateColumn, k);
		isNeed = true;
	end
	-- print("Update Setting===============")
	-- for k,v in pairs(self.sInfo) do
		-- print("self.sInfo", k,v)
	-- end
	if isNeed then
		self:UpdateSetting( setUpdateColumn );
	end
end
--系统设置的参数对应表
local SettingMsgTable = {
	dwRoleID = 1;			--玩家的角色ID
	dwOthersModel = 2;	--隐藏显示周围玩家模型
	dwRoleLight = 3;		--关闭开启角色高清效果（引擎角色打光）
	dwRoleShadow = 4;		--关闭开启角色阴影效果（引擎角色阴影）--开启所有阴影
	dwEnvShadow = 5;		--关闭场景阴影效果，场景高清效果
	dwOthersShadow = 6;		--周围玩家的阴影--角色阴影
	dwMonsterShadow = 7;	--周围怪物的阴影--关闭所有阴影
	dwBGMOpen = 8;		--背景音乐开启关闭
	dwBGMVolume = 9;		--背景音乐音量大小，0~100
	dwSFXOpen = 10;		--游戏音效声音开启关闭
	dwSFXVolume = 11;		--游戏音效声音大小
	dwIncomeTips = 12;		--隐藏/显示玩家收益提示界面
	dwOthersBlood = 13;	--其他玩家的血条
	dwMyBlood = 14;		--自己的血条
	dwOthersName = 15;		--周围玩家头顶的姓名
	dwOthersPopText = 16;	--隐藏其他玩家头顶跳字信息
	dwBeAddedNotice = 17;	--拒绝弹出被加为好友提示图标
	dwAcceptPrivate = 18;	--拒绝接收私聊信息
	dwAcceptTeam = 19;		--发起方无法向接收方发送组队邀请消息
	dwAcceptFaction = 20;	--发起方无法向接收方发送世家邀请消息
	dwAcceptTrade = 21;	--发起方无法向接收方发送交易消息
	dwAcceptProposal = 22;	--发起方无法向接收方发送求婚消息
	dwSkillShake = 23;		--屏蔽技能震屏效果
	dwFloodLight = 24;--开启（1）或关闭（0）全屏泛光
	dwWeather = 25;	--默认关闭天气
	dwOthersPopTextCnd = 26;--隐藏显示他人的头顶跳字，除了夫妻队友以外的
	dwMonsterName = 27;		--隐藏显示怪物名字
	dwMonsterBlood = 28;	--隐藏显示怪物血条
	dwMyPopText = 29;		--隐藏显示自己头顶的跳字
	dwHurtNotice = 30;	--显示被击提示
	dwAutoMartial = 31;  --自动演武
	dwRedNotice = 32;	--红名提示
};
--同步玩家设置信息
function CSettingSystem:SynchronizeSettingMsg( setting )
	local tset = {};
	for name,value in pairs(setting) do
		if SettingMsgTable[name] then
			tset[ SettingMsgTable[name] ] = value;
		else
			tset[ name ] = value;
		end
	end
	self:GetPlayer().OnRequestSettingMsg{ Setting = tset; };
end
--同步错误消息
function CSettingSystem:OnError( dwCode, szName )
	--print("CSettingSystem:OnError", dwCode, szName)
	self:GetPlayer().OnSettingSystemErrorMsg{ Code = dwCode, Name = szName };
end
--获取系统设置信息
function CSettingSystem:GetSetting()
	return self.sInfo;
end
--是否显示其他玩家的弹字
function CSettingSystem:ShowOthersPopText()
	return self.sInfo.dwOthersPopText == 1;
end
--获取指定ID的玩家的CSettingSystem，玩家不在线则返回nil，可以用于判断玩家是否在线
function CSettingSystem:GetOtherSettingSys(dwRoleID)
	if dwRoleID == 0 then
		return nil;
	end
	local player = self:GetPlayer():GetOtherPlayer(dwRoleID, 3);
	if not player then
		return nil;
	end
	return player:GetSystem("CSettingSystem");
end
--自己是否可以向某人发起组队邀请信息
function CSettingSystem:CanSendTeamInviteTo( dwRoleID )
	local otherSys = self:GetOtherSettingSys(dwRoleID);
	if not otherSys then
		return false;
	end
	if otherSys:GetSetting().dwAcceptTeam == 0 then
		local szName = otherSys:GetPlayer():GetInfo().szRoleName;
		self:OnError( 13000410001, szName );
		return false;
	end
	return true;
end
--自己是否可以接收组队邀请信息，返回false的时候，错误提示ID: 12000410001
function CSettingSystem:CanReceiveTeamInvite()
	if self:GetSetting().dwAcceptTeam == 0 then
		return false;
	end
	return true;
end
--自己是否可以向某人发起世家邀请信息
function CSettingSystem:CanSendFactionInviteTo( dwRoleID )
	local otherSys = self:GetOtherSettingSys(dwRoleID);
	if not otherSys then
		return false;
	end
	if otherSys:GetSetting().dwAcceptFaction == 0 then
		local szName = otherSys:GetPlayer():GetInfo().szRoleName;
		self:OnError( 13000410002, szName );
		return false;
	end
	return true;
end
--自己是否可以接收世家邀请信息，返回false的时候，错误提示ID: 12000410002
function CSettingSystem:CanReceiveFactionInvite()
	if self:GetSetting().dwAcceptFaction == 0 then
		return false;
	end
	return true;
end
--自己是否可以向某人发起交易信息
function CSettingSystem:CanSendTradeInviteTo( dwRoleID )
	local otherSys = self:GetOtherSettingSys(dwRoleID);
	if not otherSys then
		return false;
	end
	if otherSys:GetSetting().dwAcceptTrade == 0 then
		local szName = otherSys:GetPlayer():GetInfo().szRoleName;
		self:OnError( 13000410003, szName );
		return false;
	end
	return true;
end
--自己是否可以接收交易信息，返回false的时候，错误提示ID: 12000410003
function CSettingSystem:CanReceiveTradeInvite()
	if self:GetSetting().dwAcceptTrade == 0 then
		return false;
	end
	return true;
end
--自己是否可以向某人发起求婚信息
function CSettingSystem:CanSendProposalInviteTo( dwRoleID )
	local otherSys = self:GetOtherSettingSys(dwRoleID);
	if not otherSys then
		return false;
	end
	if otherSys:GetSetting().dwAcceptProposal == 0 then
		local szName = otherSys:GetPlayer():GetInfo().szRoleName;
		self:OnError( 13000410004, szName );
		return false;
	end
	return true;
end
--自己是否可以接收求婚信息，返回false的时候，错误提示ID: 12000410004
function CSettingSystem:CanReceiveProposalInvite()
	if self:GetSetting().dwAcceptProposal == 0 then
		return false;
	end
	return true;
end
--自己是否拒绝弹出被加为好友提示图标
function CSettingSystem:CanPopBeAddedFriend()
	return self:GetSetting().dwBeAddedNotice == 1;
end
--自己是否拒绝接收私聊信息
function CSettingSystem:CanAcceptPrivateChat()
	return self:GetSetting().dwAcceptPrivate == 1;
end










