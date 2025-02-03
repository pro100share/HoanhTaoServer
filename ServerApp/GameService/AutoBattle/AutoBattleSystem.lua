--[[
	自动挂机系统
	曲莹
	2012-03-05
]]
_G.CAutoBattleSystem = {};
function CAutoBattleSystem:new()
	local obj = CSystem:new("CAutoBattleSystem");
	obj.objDBQuery = nil;    --对应的数据库操作模块
	for i,v in pairs(CAutoBattleSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

--系统创建
function CAutoBattleSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("-------Get objDB error ~~ by autobattle");
		return;
	end;
	self.Flag = false;
	self.objDBQuery = CAutoBattleDB:new(objDB, self);
	local dwProf = objPlayer:GetInfo().dwProf;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");	
	self.ReadInfo = objPlayer:GetLineData("CAutoBattleSystem")[1];
	self.Flag = self.ReadInfo.bFlag;
	return true;
end;

--self.ReadInfo赋初值
function CAutoBattleSystem:InitReadInfo(dwProf, skillTbl)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.ReadInfo = {};
	self.ReadInfo.dwRoleID = objPlayer:GetRoleID();
	self.ReadInfo.dwHpRate = AutoMonsterConfig["dwAutoHPPer"] * 100;
	self.ReadInfo.dwHpOrder = AutoMonsterConfig["dwLifeRecoverRule"];
	self.ReadInfo.dwMpRate = AutoMonsterConfig["dwAutoMPPer"] * 100;
	self.ReadInfo.dwMpOrder =  AutoMonsterConfig["dwManaRecoverRule"];
	self.ReadInfo.bUseDoubleExp = false;
	self.ReadInfo.bPickEquip = true;
	self.ReadInfo.bPickMedicine = true;
	self.ReadInfo.bPickGold = true;
	self.ReadInfo.bPickMaterial = true;
	self.ReadInfo.dwProfType = AutoMonsterConfig["dwEquipPickProf"];
	self.ReadInfo.dwEquipLevel = AutoMonsterConfig["dwEquipPickLevel"];
	self.ReadInfo.dwEquipQuality = AutoMonsterConfig["dwEquipPickQuality"];
	self.ReadInfo.dwRange = 0;
	self.ReadInfo.dwGoBackTime = AutoMonsterConfig["dwGoBackCitye"];
	self.ReadInfo.bMonsterChoose = true;
	self.ReadInfo.bAutoAlive = false;
	local skillNum = 1;
	local uiSkillTbl = AutoBattleSkill[dwProf];
	for _, skillId in pairs(uiSkillTbl) do
		local info = skillTbl[skillId];
		if info then
			self.ReadInfo["dwSkill"..skillNum] = skillId;
			skillNum = skillNum + 1;
		end;
		if skillNum >= 7 then
			break;
		end;
	end;
	if skillNum < 7 then
		for i = skillNum, 6 do
			self.ReadInfo["dwSkill"..i] = 0;
		end;
	end;
end;

function CAutoBattleSystem:Update()
end;

function CAutoBattleSystem:Destroy()
end;

--进入场景后同步客户端
function CAutoBattleSystem:OnEnterScene()
	self:SendDataToClient();
end;
--开始换线记录数据
function CAutoBattleSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	self.ReadInfo.bFlag = self.Flag;
	objPlayer:SetLineData("CAutoBattleSystem",self.ReadInfo);
end;
--换线结束获得数据
function CAutoBattleSystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local getInfo = objPlayer:GetLineData("CAutoBattleSystem");
	self.ReadInfo = getInfo[1];
	self:SendDataToClient();
end;

function CAutoBattleSystem:ResetReadInfo()
	if not self.ReadInfo then
		return;
	end;	
	local tbl = {};
	tbl[1] = self.ReadInfo.dwRoleID;
	tbl[2] = self.ReadInfo.dwHpRate;
	tbl[3] = self.ReadInfo.dwHpOrder;
	tbl[4] = self.ReadInfo.dwMpRate;
	tbl[5] = self.ReadInfo.dwMpOrder;
	tbl[6] = self.ReadInfo.bUseDoubleExp;
	tbl[7] = self.ReadInfo.bPickEquip;
	tbl[8] = self.ReadInfo.bPickMedicine;
	tbl[9] = self.ReadInfo.bPickGold;
	tbl[10] = self.ReadInfo.bPickMaterial;
	tbl[11] = self.ReadInfo.dwProfType;
	tbl[12] = self.ReadInfo.dwEquipLevel;
	tbl[13] = self.ReadInfo.dwEquipQuality;
	tbl[14] = self.ReadInfo.dwRange;
	tbl[15] = self.ReadInfo.dwGoBackTime;
	tbl[16] = self.ReadInfo.bMonsterChoose;
	tbl[17] = self.ReadInfo.bAutoAlive;
	tbl[18] = self.ReadInfo.dwSkill1;
	tbl[19] = self.ReadInfo.dwSkill2;
	tbl[20] = self.ReadInfo.dwSkill3;
	tbl[21] = self.ReadInfo.dwSkill4;
	tbl[22] = self.ReadInfo.dwSkill5;
	tbl[23] = self.ReadInfo.dwSkill6;
	tbl[24] = self.ReadInfo.bautoMatic;
	return tbl;
end;

--同步数据到客户端
function CAutoBattleSystem:SendDataToClient()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.Flag then
		local skillSystem = objPlayer:GetSystem("CSkillSystem");
		if skillSystem then
			local skillTbl = skillSystem.setAllSkill;
			local dwProf = objPlayer:GetInfo().dwProf;
			self:InitReadInfo(dwProf, skillTbl);
			local tbl = self:ResetReadInfo();
			objPlayer.UpdateAutoSettingMsg{Flag = false, Info = tbl};   --未存入数据库
			return;
		end;
	end;
	local tbl = self:ResetReadInfo();
	objPlayer.UpdateAutoSettingMsg{Flag = true, Info = tbl};
end;
--传送到指定的位置
function CAutoBattleSystem:ReqChangeBack()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	local mapId = mapSystem:GetPlayerMapPos();
	if MapInfoConfig[mapId].backPos then
		local dwmapId = MapInfoConfig[mapId].backPos[1];
		local posx = MapInfoConfig[mapId].backPos[2];
		local posy = MapInfoConfig[mapId].backPos[3];
		mapSystem:ExecTransforMapXY(dwmapId,posx,posy,0);
	end;
end;

function CAutoBattleSystem:SaveSetting(info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.Flag then
		local dwProf = objPlayer:GetInfo().dwProf;
		local skillSystem = objPlayer:GetSystem("CSkillSystem");
		if not skillSystem then
			return;
		end;
		self.objDBQuery:InitAddAutoData(dwProf, skillSystem.setAllSkill);	
		self.objDBQuery:SetAutoData(info);
		self.Flag = true;
	else
		self.objDBQuery:SetAutoData(info);
	end;
	
	for key, value in pairs(info) do
		self.ReadInfo[key] = value;
	end;
end;

function CAutoBattleSystem:RecoverSettingMsg()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	local skillTbl = skillSystem.setAllSkill;
	local dwProf = objPlayer:GetInfo().dwProf;
	self:InitReadInfo(dwProf, skillTbl)
	self.objDBQuery:RecoverAutoData(dwProf, skillTbl);
end;




