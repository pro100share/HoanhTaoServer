--[[ 	
	珍珑棋局系统
	author lizc
	2014.5.12
--]]

--字符串格式
local function ParseStr(strCount, strStar, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(strStar, ",", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(strStar, nextIndex, lastIndex - 1);
		local index = string.find(str1, "=");
		local bossId = string.sub(str1, 1, index - 1);
		local starLevel = string.sub(str1, index + 1);
		t[tonumber(bossId)] = {starLevel = tonumber(starLevel)};
	end

	lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(strCount, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(strCount, nextIndex, lastIndex - 1);
		local index = string.find(str1, "=");
		local bossId = string.sub(str1, 1, index -1);
		local str2 = string.sub(str1, index + 1);
		local index1 = string.find(str2, ",");
		local curCount = string.sub(str2, 1, index1 - 1);
		local curGoldCount = string.sub(str2, index1 + 1)
		t[tonumber(bossId)].curCount = tonumber(curCount);
		t[tonumber(bossId)].curGoldCount = tonumber(curGoldCount);
	end;
	
	return t;
end;

local function ParseAwardStr(str, t)
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ",", nextIndex)
		if not lastIndex then break end;
		local starLevel = string.sub(str, nextIndex, lastIndex - 1);
		
		t[tonumber(starLevel)] = true;
	end
end

--字符串格式
local function FormatCountStr(t)
	local tempStr = "";
	for bossId, bossInfo in pairs(t) do
		tempStr = tempStr..bossId.."="..bossInfo.curCount..","..bossInfo.curGoldCount..";";
	end;
	return tempStr;
end

local function FormatStarStr(t)
	local tempStr = "";
	for bossId, bossInfo in pairs(t) do
		tempStr = tempStr..bossId.."="..bossInfo.starLevel..",";
	end;
	return tempStr;
end

local function FormatAwardStr(t)
	local tempStr = "";
	for dwStarLevel, _ in pairs(t) do
		tempStr = tempStr..dwStarLevel..",";
	end
	return tempStr;
end

_G.CZhenlongChessSystem = {};

function CZhenlongChessSystem:new()
	local obj = CSystem:new("CZhenlongChessSystem");
	
	--当前总挑战次数
	obj.curTotalCount = 0;
	--当前的挑战进度 (初始化为1 第一个默认可以挑战)
	obj.curProcess = 1;
	--Boss挑战次数表
	obj.setBossCount = {};
	--[[
		--表结构说明
		self.setBossCount = 
		{	--[bossId] = {当前挑战次数, 当前金币挑战次数, 星级}
			[20002001] = {curCount = 0, curGoldCount = 0, starLevel = 0};
			...
		}
	--]]
	
	--记录已经领取的星级奖励
	obj.tabGetAward = {};
	
	--掉血统计
	obj.dwDamageHP = 0;
	--战斗力统计
	obj.dwFightScore = 0;
	
	for i,v in pairs(CZhenlongChessSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CZhenlongChessSystem:Create()
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CZhenlongChessSystem Create Cannot get player");
		return false;
	end;
	
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CZhenlongChessSystem Create Cannot get ItemSystem");
		return false;
	end;
	
	self.DuplSystem = objPlayer:GetSystem("CDuplSystem");
	if not self.DuplSystem then
		_err("CZhenlongChessSystem Create Cannot get CDuplSystem");
		return false;
	end;
	
	--技能系统
	self.SkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not self.SkillSystem then
		_err("CZhenlongChessSystem Create Cannot get SkillSystem");
		return false;
	end;
	
	--初始化DB模块
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CMountSystem Create Cannot get DBQuery");
		return false;
	end;
	
	--最大总挑战次数
	self.maxTotalCount = _G.ZhenlongChessConfig.maxCount;
	
	self.objDBQuery = CZhenlongChessDB:new(objDB, self);

	--读取信息
	local Data	= objPlayer:GetLineData("CZhenlongChessSystem")[1];
	if not Data then
		_err("CZhenlongChessSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
		
	if Data[1] then
		-- print("CZhenlongChessSystem read DBdata");
		self.curTotalCount = Data[1].curTotalCount;
		-- print("self.curTotalCount", self.curTotalCount)
		self.curProcess = Data[1].curProcess;
		ParseStr(Data[1].setBossCount, Data[1].setBossStar, self.setBossCount);
		ParseAwardStr(Data[1].tabGetAward, self.tabGetAward);
		
		if Data[1].setBossCount == "" and Data[1].setBossStar ~= "" then
			for k, v in pairs(self.setBossCount) do
				self.setBossCount[k].curCount = 0;
				self.setBossCount[k].curGoldCount = 0;
			end
			--存数据库
			self:UpdateDB();
		end
	else
		-- print("CZhenlongChessSystem insert DBdata");
		local db_Info = {};
		db_Info.curTotalCount = self.curTotalCount;
		db_Info.curProcess = self.curProcess;
		db_Info.setBossCount = FormatCountStr(self.setBossCount);
		db_Info.setBossStar = FormatStarStr(self.setBossCount);
		db_Info.tabGetAward = FormatAwardStr(self.tabGetAward);
		self.objDBQuery:InsertSysInfo(db_Info);
	end;
	
	return true;
end;

function CZhenlongChessSystem:Destroy()
end;

function CZhenlongChessSystem:Update()
	
end;

function CZhenlongChessSystem:OnEnterScene()
	--同步信息
	self:SyncAll();
end;

--换线开始
function CZhenlongChessSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
		
	local Data = {};
	Data[1] = {};
	Data[1].curTotalCount = self.curTotalCount;
	Data[1].curProcess = self.curProcess;
	Data[1].setBossCount = FormatCountStr(self.setBossCount);
	Data[1].setBossStar = FormatStarStr(self.setBossCount);
	Data[1].tabGetAward = FormatAwardStr(self.tabGetAward);
	objPlayer:SetLineData("CZhenlongChessSystem", Data);
end

--内部调用
-------------------------------------------------------------------------------------------------------------------------------
function CZhenlongChessSystem:SyncAll()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	objPlayer.ZhenlongChessSyncTotalCountMsg{curTotalCount = self.curTotalCount};
	--分包发送 
	self.tSynToClient = {};
	local index = 1;
	local Group = {};
	for bossId, bossInfo in pairs(self.setBossCount) do
		Group[bossId] = bossInfo;
		if index % 10 == 0 then
			objPlayer.ZhenlongChessSyncBossCountMsg{setBossCount = Group};
			Group = {};
			index = 1;
		end;
		index = index + 1;
	end;
	if index > 1 then
		objPlayer.ZhenlongChessSyncBossCountMsg{setBossCount = Group};
	end;

	objPlayer.ZhenlongChessSyncProcessMsg{curProcess = self.curProcess};
	objPlayer.ZhenlongChessSyncAwardMsg{tabGetAward = self.tabGetAward};
end

--同步一个
function CZhenlongChessSystem:SynChallengeCount(dwBossId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	local tabBossCount = {};
	tabBossCount[dwBossId] = self.setBossCount[dwBossId];
	objPlayer.ZhenlongChessSyncBossCountMsg{setBossCount = tabBossCount};
end


function CZhenlongChessSystem:ChallengeCheck(bossIndex, bIsCostGold)
	local objPlayer = self:GetPlayer();
	
	if bossIndex < 1 then return false end;
	
	--如果进度不够
	if bossIndex > self.curProcess then return false end;

	--如果角色在死亡状态则返回
	local stateSystem = objPlayer:GetSystem("CStateSystem");
	if stateSystem then
		local state = stateSystem:GetState();
		if state == enPlayerState.ePS_Dead then return false end;
	end
	
	local bossCfg = _G.ZhenlongChessBossList[bossIndex];
	if not bossCfg then return false end;
	local bossId = bossCfg.bossId;
	local bossInfo = self.setBossCount[bossId];
	
	--如果不花费元宝
	if not bIsCostGold then
		--超过最大挑战次数
		if self.curTotalCount >= self.maxTotalCount then return false end
	
		if bossInfo then
			if bossInfo.curCount >= bossCfg.maxCount then return false end
	
			--self.setBossCount[bossId].curCount = self.setBossCount[bossId].curCount + 1;
		else
			self.setBossCount[bossId] = {curCount = 0, curGoldCount = 0, starLevel = 0};
		end
		
		self.curTotalCount = self.curTotalCount + 1;
		--更新数据库
		self:UpdateDB();
		--同步总次数
		self:GetPlayer().ZhenlongChessSyncTotalCountMsg{curTotalCount = self.curTotalCount};
	else
		--如果花费元宝
		if bossInfo then
			if bossInfo.curGoldCount > bossCfg.goldMaxCount then return false end;
			
			--self.setBossCount[bossId].curGoldCount = self.setBossCount[bossId].curGoldCount + 1;
		else
			self.setBossCount[bossId] = {curCount = 0, curGoldCount = 0, starLevel = 0};
		end
		
		--扣除元宝
		
	end
	
	self.setBossCount[bossId].bIsCostGold = bIsCostGold;
	
	return true, bossId;
end

--更新数据库
function CZhenlongChessSystem:UpdateDB()
	local db_Info = {};
	db_Info.curTotalCount = self.curTotalCount;
	db_Info.curProcess = self.curProcess;
	db_Info.setBossCount = FormatCountStr(self.setBossCount);
	db_Info.setBossStar = FormatStarStr(self.setBossCount);
	self.objDBQuery:UpdateSysInfo(db_Info);
end

--重置掉血 和战斗力统计
function CZhenlongChessSystem:ResetHpAndFightScore()
	self.dwDamageHP = 0;
	self.dwFightScore = self.SkillSystem:CountBattleScoreInfo().dwAllScore;
end

function CZhenlongChessSystem:AddDamageHP(dwDamageValue)
	self.dwDamageHP = self.dwDamageHP + (0 - dwDamageValue);
end
--外部接口
---------------------------------------------------------------------------------------------------------------------------------
function CZhenlongChessSystem:ChallengeBoss(bossIndex, bIsCostGold, bIsBully)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	local bIsCanChallenge, bossId = self:ChallengeCheck(bossIndex, bIsCostGold)
	if not bIsCanChallenge then return end;
	
	--调用刷怪函数
	ZhenlongChessBossList:RefreshMonster(objPlayer, bossId);
	
	--重置掉血 和战斗力统计
	self:ResetHpAndFightScore();
	
	--在怪物脚本里更新 进度  星级
end

--要求获取星级奖励
function CZhenlongChessSystem:ReqStarAward(dwStarLevel)
	local curStarLevel = self:GetTotalStarLevel();
	--星级不够 返回
	if dwStarLevel > curStarLevel then return end;
	
	local awardCfg = _G.ZhenlongChessStarAward[dwStarLevel];
	if not awardCfg then return end;
	
	--已经领取过 返回
	if self.tabGetAward[dwStarLevel] then return end;
	
	--给奖励
	self:SendAward(awardCfg);
	
	--记录已经给过奖励
	self.tabGetAward[dwStarLevel] = true;
	
	--消息
	self:GetPlayer().ZhenlongChessSyncAwardMsg{tabGetAward = self.tabGetAward};
	
	--数据库
	local db_Info = {};
	db_Info.tabGetAward = FormatAwardStr(self.tabGetAward);
	self.objDBQuery:UpdateStarAwardInfo(db_Info);
end

function CZhenlongChessSystem:SendAward(awardCfg)
	local awardItem = {};
	for k, v in pairs(awardCfg.itemTbl) do
		local tItem = {
			dwItemEnum	= k;
			dwItemNumber= v;
		};
		table.insert(awardItem,tItem);
	end;
	
	if self.ItemSystem:IsEnumItemListCanAddToPacket(awardItem) then
		
		self.ItemSystem:AddEnumItemListToPacket(awardItem or {}, _G.ItemSysOperType.ZhenlongChess);
		
		if awardCfg.PassMoney and awardCfg.PassMoney > 0 then
			self.ItemSystem:AddPacketMoney(awardCfg.PassMoney, _G.ItemSysOperType.ZhenlongChess);  --银两
		end;
		
		if awardCfg.Gold and awardCfg.Gold > 0 then
			self.ItemSystem:AddBindGold(awardCfg.Gold, _G.ItemSysOperType.ZhenlongChess);   --礼金
		end;
		
		if awardCfg.Zhenqi then
			local objElemSystem = self:GetPlayer():GetSystem("CFiveElemSystem");
			if objElemSystem then
				--增加真气
				objElemSystem:ChangeAttr("dwMetalValue",awardCfg.Zhenqi)
				objElemSystem:ChangeAttr("dwWoodValue",awardCfg.Zhenqi)
				objElemSystem:ChangeAttr("dwWaterValue",awardCfg.Zhenqi)
				objElemSystem:ChangeAttr("dwFireValue",awardCfg.Zhenqi)
				objElemSystem:ChangeAttr("dwEarthValue",awardCfg.Zhenqi)
			end;
		end;
		if awardCfg.Exp then
			self:GetPlayer():AddExp(awardCfg.Exp);
		end;
	end
end

function CZhenlongChessSystem:Reset()
	--当前总挑战次数
	self.curTotalCount = 0;
	
	--boss挑战次数表
	for bossId, bossInfo in pairs(self.setBossCount) do
		bossInfo.curCount = 0;
		bossInfo.curGoldCount = 0;
	end
	
	--更新数据库
	self:UpdateDB();
	
	--同步信息
	self:SyncAll();
end;