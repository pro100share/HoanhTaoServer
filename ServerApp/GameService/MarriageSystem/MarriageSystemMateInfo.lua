
--判断伴侣是否在线
function CMarriageSystem:CheckMateIsOnline()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:CheckMateIsOnline()");
		return;
	end;
	--通知伴侣在线
	local cbk = function(_, result, _)
		self:CheckMateIsOnlineCbk(result);
	end;
	_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "BeNoticeMateOnline", nil, cbk);
end;
function CMarriageSystem:CheckMateIsOnlineCbk(result)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if result == 0 then
		self.MateIsOnline = true;
		objPlayer.MarSys_SynMateIsOnlineMsg{Flag = self.MateIsOnline};
	end;
end;
--伴侣上线通知自己
function CMarriageSystem:BeNoticeMateOnline()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:BeNoticeMateOnline()");
		return;
	end;
	self.MateIsOnline = true;
	objPlayer.MarSys_SynMateIsOnlineMsg{Flag = self.MateIsOnline, Notice = true};
end;
--伴侣下线通知自己
function CMarriageSystem:BeNoticeMateOffline()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:BeNoticeMateOffline()");
		return;
	end;
	self.MateIsOnline = false;
	objPlayer.MarSys_SynMateIsOnlineMsg{Flag = self.MateIsOnline, Notice = true};
	
	objPlayer:GetSystem("CSkillSystem"):ExecSkillEvent("EventMarriOffline");
end;
--------
--获得伴侣装备信息
function CMarriageSystem:RequestMateEquipInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:RequestMateEquipInfo()");
		return;
	end;
	if not self.Married then return end;
	if not self.MateIsOnline then return end;
	local nowTime = GetCurTime();
	if self.LookMateCD > nowTime then return end;
	self.LookMateCD = nowTime + 60000;
	_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "BeRequestMateEquipInfo", nil, nil);
end;
local SAMsgTable = {
	szRoleName		= 1;		--玩家名字
	dwSex			= 2;		--玩家性别
	dwFace			= 3;		--玩家脸型
	dwHair			= 4;		--玩家发型
	dwProf 			= 5;		--玩家职业
	dwIncoID		= 6;		--头像ID
	dwDress			= 7;		--衣服
	dwHand			= 8;		--护手
	dwShoe			= 9;		--鞋子
	dwArms			= 10;		--武器开始的时候没有武器
	dwHorseID       = 11;		--坐骑为空
	dwDefDress		= 12;		--衣服
	dwDefHand		= 13;		--护手
	dwDefShoe		= 14;		--鞋子
	dwDefHair		= 15;		--头部
	dwDefFace		= 16;		--脸型
	--lw：增加装备的强化等级
	dwDressLevel	= 17;			--衣服强化等级
	dwHandLevel		= 18;			--护手强化等级
	dwShoeLevel		= 19;			--鞋子强化等级
	dwArmsLevel		= 20;			--武器强化等级
	setSuitPfx 		= 21;
	setActSuitList	= 22;
	dwDefIncoID		= 23;
};
local KeyToNumber = function( sMsg, msgTable )
	--拷贝已知数字key的数据到新表中
	local info = {};
	for name,value in pairs(sMsg) do
		if msgTable[name] then
			info[ msgTable[name] ] = value;
		else--防止出现未知数据没有拷贝过去的情况
			info[name] = value;
		end
	end
	return info;
end
--被请求查看装备
function CMarriageSystem:BeRequestMateEquipInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:BeRequestMateEquipInfo()");
		return;
	end;
	local equipInfoMsg = self.ItemSystem:GetAllEquipsNetData();
	local stoneInfoMsg = self.ItemSystem:GetStoneNetData();
	--avatar信息
	local avatarInfoMsg = SPlayerAvatarViewMsg:new();
	avatarInfoMsg.dwLevel = 0;
	avatarInfoMsg.setModelList = {};
	local selfInfo = objPlayer:GetInfo();
	selfInfo.setModelList = objPlayer.setModelList;
	for k,v in pairs(avatarInfoMsg) do
		avatarInfoMsg[k] = selfInfo[k];
	end;
	--avatarInfoMsg.setSuitPfx = objPlayer:GetSystem("CItemSystem"):GetSuitPfxInfo();
	--转换成数字key
	avatarInfoMsg = KeyToNumber( avatarInfoMsg, SAMsgTable );
	--帮派名
	local guildSys = objPlayer:GetSystem("CGuildSystem");
	if not guildSys then _err("get guildSys err!!!"); return; end;
	local s_GuildName = guildSys:GetGuildName();
	local n_Prof	= selfInfo.dwProf;
	_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "RequestMateEquipInfoCbk", {equipInfoMsg, stoneInfoMsg, avatarInfoMsg, s_GuildName, n_Prof}, nil);
end;
--查看伴侣装备回调
function CMarriageSystem:RequestMateEquipInfoCbk(equipInfoMsg, stoneInfoMsg, avatarInfoMsg, s_GuildName, n_Prof)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:RequestMateEquipInfoCbk()");
		return;
	end;
	objPlayer.MarSys_AnswerMateEquipInfoMsg{EquipInfoMsg = equipInfoMsg, AvatarInfoMsg = avatarInfoMsg, GuildName = s_GuildName, Prof = n_Prof};
	objPlayer.MarSys_AnswerMateStoneInfoMsg{StoneInfoMsg = stoneInfoMsg};
end;
--------
--震伴侣一下
function CMarriageSystem:AnnoyMate()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:AnnoyMate()");
		return;
	end;
	if not self.Married then return end;
	if not self.MateIsOnline then return end;
	local nowTime = GetCurTime();
	if self.AnnoyCD > nowTime then return end;
	_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "BeAnnoy", nil, nil);
	self.AnnoyCD = nowTime + _G.MarriageConfig.AnnoyCD;
end;
--被震了一下
function CMarriageSystem:BeAnnoy()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("can not find player by CMarriageSystem:BeAnnoy()");
		return;
	end;
	if not self.Married then return end;
	objPlayer.MarSys_BeAnnoyMsg{};
end;


