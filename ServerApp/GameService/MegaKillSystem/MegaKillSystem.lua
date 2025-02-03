

local function EncodeStr(t)
	local str = "";
	for k, v in pairs(t) do
		str = str .. k .. "," .. v .. ";";
	end;
	return str;
end;


_G.CMegaKillSystem = {};

function CMegaKillSystem:new()
	local obj = CSystem:new("CMegaKillSystem");
	self.objDBQuery = nil
	for i, v in pairs(CMegaKillSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CMegaKillSystem:Create(bChangeLine)
	self.objPlayer = self:GetPlayer();
	if not self.objPlayer then
		_err("CMegaKillSystem Create Cannot get player");
		return false;
	end;
	self.objDB = self.objPlayer:GetDBQuery();
	if not self.objDB then
		_err("CMegaKillSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CMegaKillSystemExDB:new(self.objDB, self);
	local Data	= self.objPlayer:GetLineData("CMegaKillSystem");
	if not Data then
		_err("CMegaKillSystem Create CanNot GetLineData!!!");
		return false;
	end;
	local data = Data[1];
	self.dwSoulNum	= data[1];
	self.dwRandomNum= data[2];
	self.dwBuyNum 	= data[3];
	self.dwLevel 	= data[4];
	self.tAttrs 	= data[5];
	self.tKillRecord= data[6];
	self.nKillNum	= data[7];
	self:SetAptitude(data[8]);

	self:Calculate();
	self:SetSkill();
	
	return true;
end;

function CMegaKillSystem:Update()
	
end;

function CMegaKillSystem:Destroy()
    
end;

--获取当前玩家境界等级
function CMegaKillSystem:GetLevelVal()
    if not self.dwLevel then
		self.dwLevel = 0;
	end
	
	return self.dwLevel;
end;
--获取当前玩家魂魄值
function CMegaKillSystem:GetSoulNum()
    if not self.dwSoulNum then
		self.dwSoulNum = 0;
	end
	
	return self.dwSoulNum;
end;
--增加玩家魂魄值
function CMegaKillSystem:AddSoulNum(value)
    self.dwSoulNum = (self.dwSoulNum or 0) + value;
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_MegaKill");
	SqlCmd.Wheres.dwRoleID = self.objPlayer:GetRoleID();
	SqlCmd.Fields.dwSoulNum = self.dwSoulNum;
	SqlCmd:execute();
	
	self:Synchronize();
	
	--记录日志
	CLogSystemManager:megakill(self.objPlayer,
        2,
        value,
        self.dwSoulNum,
        0);
end;

--增加玩家当天的血炼次数,dwValue增加几次
function CMegaKillSystem:AddRandomNum(dwValue)
	if not self.dwRandomNum then return false end;
	if dwValue <= 0 then _err("Config Error!!!") return false end;
	if (self.dwRandomNum + dwValue) > _G.MegaKillConfig.RandomNum then return false end;
	self.dwRandomNum = self.dwRandomNum + dwValue;
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_MegaKill");
	SqlCmd.Wheres.dwRoleID = self.objPlayer:GetRoleID();
	SqlCmd.Fields.dwRandomNum = self.dwRandomNum;
	SqlCmd:execute();
	
	self:Synchronize();
	return true;
end;


function CMegaKillSystem:OnEnterScene()
	self:Synchronize();
	self:SynTianGuanCiFu();
end;

function CMegaKillSystem:Synchronize()
	self.objPlayer.MegaKill_SynchronizeMsg
	{
		SoulNum = self.dwSoulNum;	--魂魄值
		RandomNum = self.dwRandomNum;--本日血炼次数
		BuyNum = self.dwBuyNum;		--本日购买次数
		Level = self.dwLevel;		--境界等阶
		Attrs = self.tAttrs;		--加成属性表
		dwAptitude = self:GetAptitude(); --精炼次数
	}
end;

function CMegaKillSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	local data = {};
	data[1] = self.dwSoulNum;
	data[2] = self.dwRandomNum;
	data[3] = self.dwBuyNum;
	data[4] = self.dwLevel;
	data[5] = self.tAttrs;
	data[6] = self.tKillRecord;
	data[7] = self.nKillNum;
	data[8] = self:GetAptitude();
	objPlayer:SetLineData("CMegaKillSystem", data);
end

function CMegaKillSystem:OnChangeLineEnd()
end;

function CMegaKillSystem:Calculate()
	local attr = {};

	for k, v in pairs(self.tAttrs) do
		attr[_G.MegaKillConfig.TypeDef[k][1]] = v ;
	end;
	local AptitudeAttr = self:GetAddAptitudeAttr(self.dwAptitude or 0);
	for k,v in pairs(AptitudeAttr) do
		attr[k] = (attr[k] or 0) + v
	end
	self.objPlayer:GetSystem("CSkillSystem"):NotifyMegaKill(attr, false);
end;

function CMegaKillSystem:Reset()
	self.dwRandomNum = _G.MegaKillConfig.RandomNum;
	self.dwBuyNum = 0;
	self.tKillRecord = {};
	self.nKillNum = 0;
	
	self:Synchronize();
end;

function CMegaKillSystem:EventKillPlayer(Param1, Param2)
	--权限检查
	if not self:HasAuthority("XueMoGong") then return end;
	local loser = CPlayerManager:GetPlayerByRoleID(Param2);
	if not loser then _info("cannot find loser") return end;
	local addValue = _G.MegaKillConfig.GetAddSoulNum(self.nKillNum, self.objPlayer:GetLevel(), loser:GetLevel(), self.objPlayer:GetSystem("CVipSystem"):IsVip());
	if addValue <= 0 then return end;
	if (self.tKillRecord[Param2]) and (self.tKillRecord[Param2] >= _G.MegaKillConfig.KillOneMaxTimes) then return end;
	self.tKillRecord[Param2] = (self.tKillRecord[Param2] or 0) + 1;
	self.nKillNum = self.nKillNum + 1;
	self.dwSoulNum = self.dwSoulNum + addValue;
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_MegaKill");
	SqlCmd.Wheres.dwRoleID = self.objPlayer:GetRoleID();
	SqlCmd.Fields.dwSoulNum = self.dwSoulNum;
	SqlCmd.Fields.strKillRecord = EncodeStr(self.tKillRecord);
	SqlCmd:execute();
	
	self:Synchronize();
	
	--记录日志
	CLogSystemManager:megakill(self.objPlayer,
        1,
        addValue,
        self.dwSoulNum,
        Param2);
end;


function CMegaKillSystem:RandomAttr(forbidTable, useGold)
	--权限检查
	if not self:HasAuthority("XueMoGong") then return end;
	
	local goldCost = 0;
	local soulCost = _G.MegaKillConfig.GetRandomOnceCost(_G.MegaKillConfig.RandomNum - self.dwRandomNum, self.dwLevel);
	if self.dwSoulNum < soulCost then print("CMegaKillSystem Error! do not have enough soul") return end;
	
	local itemSystem = self.objPlayer:GetSystem("CItemSystem");
	if not itemSystem then _info("CMegaKillSystem Error! cannot get itemSystem") return end;
	for i = 1, #forbidTable do
		goldCost = goldCost + _G.MegaKillConfig.GetForbidTypeCost(i, self.dwLevel);
	end;
	
	local vipSystem = self.objPlayer:GetSystem("CVipSystem");
	if not vipSystem then _info("CMegaKillSystem Error! cannot get vipSystem") return end;
	local appendNum = vipSystem:IsVip() and _G.MegaKillConfig.VipNum or 0;
	if (self.dwRandomNum + appendNum) <= 0 then
		if not useGold then print("CMegaKillSystem Error! do not useGold") return end;
		goldCost = goldCost + _G.MegaKillConfig.GetBuyOnceCost(self.dwBuyNum);
	end;
	
	if goldCost > 0 then
		if not itemSystem:CostGold(goldCost, _G.ItemSysOperType.MegaKill) then print("CMegaKillSystem Error! do not have enough gold") return end;
	end;
	
	if (self.dwRandomNum + appendNum) > 0 then
		self.dwRandomNum = self.dwRandomNum - 1;
	else
		self.dwBuyNum = self.dwBuyNum + 1;
	end;
	
	self.dwSoulNum = self.dwSoulNum - soulCost;
	
	local addAttr = _G.MegaKillConfig.GetRandomAttr(forbidTable, self.dwLevel);
	if addAttr.error then
		_info("CMegaKillSystem Error! get random attr error");
		return;
	end;
	
	self.tAttrs[addAttr.type] = (self.tAttrs[addAttr.type] or 0) + addAttr.value;
	local maxValue = _G.MegaKillConfig.jingjie[self.dwLevel].Attr[addAttr.type];
	self.tAttrs[addAttr.type] = (self.tAttrs[addAttr.type] > maxValue) and (maxValue) or (self.tAttrs[addAttr.type]);
	
	self:Calculate();
	
	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_MegaKill");
	SqlCmd.Wheres.dwRoleID = self.objPlayer:GetRoleID();
	SqlCmd.Fields.dwSoulNum = self.dwSoulNum;
	SqlCmd.Fields.dwBuyNum = self.dwBuyNum;
	SqlCmd.Fields.dwRandomNum = self.dwRandomNum;
	SqlCmd.Fields.strAttrs = EncodeStr(self.tAttrs);
	SqlCmd:execute();
	
	--client
	self:Synchronize();
	self.objPlayer.MegaKill_RandomAttrResultMsg{
		Type = addAttr.index,
		Value = addAttr.value,
		Quality = addAttr.quality
	};
	if addAttr.quality >= _G.MegaKillConfig.BroadCastQuality then
		CGameApp.MegaKill_BroadCastQualityMsg{
			PlayerRoleID = self.objPlayer:GetRoleID(),
			PlayerName = self.objPlayer:GetName(),
			Quality = addAttr.quality,
			Type = addAttr.type
		}
	end;
	
	--记录日志
	CLogSystemManager:megakill(self.objPlayer,
        3,
        -soulCost,
        self.dwSoulNum,
        0);
end;

function CMegaKillSystem:Uplevel(bAutoBuy)
	--权限检查
	if not self:HasAuthority("XueMoGong") then return end;
	
	if not _G.MegaKillConfig.jingjie[self.dwLevel+1] then print("CMegaKillSystem Error! do not have next level") return end;
	
	for dwType, dwMax in pairs(_G.MegaKillConfig.jingjie[self.dwLevel].Attr) do
		if (not self.tAttrs[dwType]) or (self.tAttrs[dwType] < dwMax) then print("CMegaKillSystem Error! not all max") return end;
	end;
	
	local itemSystem = self.objPlayer:GetSystem("CItemSystem");
	if not itemSystem then _info("CMegaKillSystem Error! cannot get itemsystem") return end;
	local material = _G.MegaKillConfig.jingjie[self.dwLevel].costMaterial;
	if (material.money) and (material.money > 0) then
		if not itemSystem:IsGoldEnough(material.money) then print("CMegaKillSystem Error! donot have enough money") return end;
	end;
	if material.itemEnumId and material.itemCount then
		local bIsEnough, nMinus = itemSystem:CheckDelEnumItemInPacketCond(material.itemEnumId, material.itemCount);
		local autoBuyInfo = {};
		if not bIsEnough then
			if not bAutoBuy then print("CMegaKillSystem Error! donot have enough item") return end;
			local mallSystem = self.objPlayer:GetSystem("CMallSystem");
			if not mallSystem then _info("CMegaKillSystem Error! cannot get mallsystem") return end;
			local buySuc = mallSystem:BuyItemByIDGold(nMinus, material.itemEnumId)
			if not buySuc then print("CMegaKillSystem Error! donot have enough gold") return end;
			bIsEnough, nMinus = itemSystem:CheckDelEnumItemInPacketCond(material.itemEnumId, material.itemCount);
			if not bIsEnough then print("CMegaKillSystem Error! after autobuy still donot have enough item") return end;
		end;
	end;
	if (material.money) and (material.money > 0) then
		itemSystem:CostPacketMoney(material.money, _G.ItemSysOperType.MegaKill);
	end;
	if material.itemEnumId and material.itemCount then
		itemSystem:DelEnumItemInPacket(material.itemEnumId, material.itemCount, false, _G.ItemSysOperType.MegaKill);
	end;
	
	local isSuc = false;
	local TianGuanCiFuSystem = self.objPlayer:GetSystem("CTianGuanCiFuSystem");
	isSuc = TianGuanCiFuSystem:IsMegaKillMax();
	if not isSuc then
		local n_SuccessRate	= _G.MegaKillConfig.GetUplevelRate(self.dwLevel, TianGuanCiFuSystem:Get_MegaKill());
		if math.random(1, 10000) <= n_SuccessRate then
			isSuc = true;
		end;
	end;
	if isSuc then
		self.dwLevel = self.dwLevel + 1;

		local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_MegaKill");
		SqlCmd.Wheres.dwRoleID = self.objPlayer:GetRoleID();
		SqlCmd.Fields.dwLevel = self.dwLevel;
		SqlCmd:execute();
		
		self:SetSkill();
		self:Synchronize();
		-----------------
		--日志记录
		local dwBegin = TianGuanCiFuSystem:Get_MegaKill();
		local dwEnd = 0;
		CLogSystemManager:cifu(self.objPlayer, 7, self.dwLevel, 1, dwBegin, dwEnd);
		-----------------
		TianGuanCiFuSystem:Set_MegaKill(0);
	
		if self.dwLevel > _G.MegaKillConfig.BroadCastLevel then -->_G.UpGradeConfig.BroadCastLevel
			CGameApp.MegaKill_BroadCastLevelMsg{
				PlayerRoleID = self.objPlayer:GetRoleID(),
				PlayerName = self.objPlayer:GetName(),
				Level = self.dwLevel
			};
		end;
		-- self.objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventMegaKill,1, mountInst:GetGrade());
	else
		TianGuanCiFuSystem:Add_MegaKill(self.dwLevel);
	end;
	self.objPlayer.MegaKill_UplevelResultMsg{IsSuc = isSuc};
end;

--成功 返回true
--失败 返回false
function CMegaKillSystem:SetLevel(dwLevel)
	--权限检查
	if not self:HasAuthority("XueMoGong") then return false end;
	
	if type(dwLevel) ~= "number" then return false end;
	if dwLevel <= self.dwLevel then return false end;
	if not _G.MegaKillConfig.jingjie[dwLevel] then return false end;

	for i = self.dwLevel+1, dwLevel do
		self.dwLevel = self.dwLevel + 1;
		self:SetSkill();
	end;
	
	for dwType, dwMax in pairs(_G.MegaKillConfig.jingjie[self.dwLevel-1].Attr) do
		self.tAttrs[dwType] = dwMax;
	end;
	
	self:Calculate();

	local SqlCmd = self.objDB:CreateUpdateCmd("T_Role_MegaKill");
	SqlCmd.Wheres.dwRoleID = self.objPlayer:GetRoleID();
	SqlCmd.Fields.dwLevel = self.dwLevel;
	SqlCmd.Fields.strAttrs = EncodeStr(self.tAttrs);
	SqlCmd:execute();
	
	self:Synchronize();
	
	if self.dwLevel > _G.MegaKillConfig.BroadCastLevel then
		CGameApp.MegaKill_BroadCastLevelMsg{
			PlayerRoleID = self.objPlayer:GetRoleID(),
			PlayerName = self.objPlayer:GetName(),
			Level = self.dwLevel
		};
	end;
	return true;
end;

function CMegaKillSystem:SynTianGuanCiFu(bBaoji)
	local value = self.objPlayer:GetSystem("CTianGuanCiFuSystem"):Get_MegaKill();
	self.objPlayer.MegaKill_TGCFMsg{Value = value};
end;

function CMegaKillSystem:SetSkill()
	local skillSystem = self.objPlayer:GetSystem("CSkillSystem");
		
	local dwSkillID, dwPer = _G.MegaKillConfig.GetEffectInfo(self.dwLevel);
	if dwSkillID and skillSystem then
		skillSystem:SetSkillParam(dwSkillID,1,dwPer);
	end;
	local dwSkillID2, dwSkillLevel = _G.MegaKillConfig.GetSkillInfo(self.dwLevel);
	if dwSkillID2 and skillSystem then
		skillSystem:DoAddSkill(dwSkillID2);
		skillSystem:ChangeSkill(dwSkillID2, dwSkillLevel);
	end;
end;

function CMegaKillSystem:ViewOther(roleid)
	local function callback(_, result, _)
		if result == -1 then
			self:ViewOtherResult(roleid, 1);
		end;
	end;
	_G.GSRemoteCall(roleid, "CMegaKillSystem", "BeView", {self:GetPlayer():GetRoleID()}, callback);
end;

function CMegaKillSystem:BeView(viewroleid)
	if not self:HasAuthority("XueMoGong") then
		_G.GSRemoteCall(viewroleid, "CMegaKillSystem", "ViewOtherResult", {self:GetPlayer():GetRoleID(), 2});
		return;
	end;
	local info = {};
	info[1] = self:GetLevelVal();
	info[2] = self.tAttrs;
	info[3] = self:GetAptitude()
	_G.GSRemoteCall(viewroleid, "CMegaKillSystem", "ViewOtherResult", {self:GetPlayer():GetRoleID(), 3, info});
end;

function CMegaKillSystem:ViewOtherResult(roleid, suc, info)
	self:GetPlayer().MegaKill_ViewOtherResultMsg
	{
		RoleID	= roleid,
		Suc		= suc,
		Info	= info
	}
end;


define.MegaKill_RandomAttrMsg
{
	user = NONE,
	ForbidTable = {},
	UseGold = false
}
when{user = NONE}
MegaKill_RandomAttrMsg = checkUser
when{}
function MegaKill_RandomAttrMsg(user, ForbidTable, UseGold)
	if user then
		local megaKillSystem = user:GetSystem("CMegaKillSystem");
		if megaKillSystem then
			megaKillSystem:RandomAttr(ForbidTable, UseGold);
		end;
	end;
end;

define.MegaKill_UplevelMsg
{
	user = NONE,
	AutoBuy = false
}
when{user = NONE}
MegaKill_UplevelMsg = checkUser
when{}
function MegaKill_UplevelMsg(user, AutoBuy)
	if user then
		local megaKillSystem = user:GetSystem("CMegaKillSystem");
		if megaKillSystem then
			megaKillSystem:Uplevel(AutoBuy);
		end;
	end;
end;


define.MegaKill_ViewOtherMsg
{
	user = NONE,
	PlayerRoleID = -1
}
when{user = NONE}
MegaKill_ViewOtherMsg = checkUser
when{}
function MegaKill_ViewOtherMsg(user, PlayerRoleID)
	if user then
		local megaKillSystem = user:GetSystem("CMegaKillSystem");
		if megaKillSystem then
			megaKillSystem:ViewOther(PlayerRoleID);
		end;
	end;
end;


define.MegaKill_BroadCastLevelMsg
{
	PlayerRoleID = 0,
	PlayerName = "",
	Level = 0
}
when{}
function MegaKill_BroadCastLevelMsg(PlayerRoleID, PlayerName, Level)
	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end; 
    _groupcallout(setNet, "MegaKill_BroadCastLevelMsg", {
		PlayerRoleID	= PlayerRoleID,	
		PlayerName      = PlayerName, 
		Level     		= Level
	});
end;

define.MegaKill_BroadCastQualityMsg
{
	PlayerRoleID = 0,
	PlayerName = "",
	Quality = 0,
	Type = 0
}
when{}
function MegaKill_BroadCastQualityMsg(PlayerRoleID, PlayerName, Quality, Type)
	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end; 
    _groupcallout(setNet, "MegaKill_BroadCastQualityMsg", {
		PlayerRoleID	= PlayerRoleID,	
		PlayerName      = PlayerName, 
		Quality     	= Quality,
		Type			= Type
	});
end;

-- 开始精练
define.MegaKill_RefineMsg
{
    user = NONE;
	nCount = 1;
}
when{user = NONE}
MegaKill_RefineMsg = checkUser;
when{}
function MegaKill_RefineMsg(user,nCount)
   user:GetSystem("CMegaKillSystem"):MegaKillRefine(nCount);
end;




