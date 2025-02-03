--[[
	[\brief：战斗力提升     
	[\author：沈祺
	[\date：2014-04-22
	[在原战斗力评分基础之上，拆分战斗力
	[按系统划分战斗力评分
	[上线同步客户端
	[有属性的提升由客户端主动请求战斗力
	]]

--系统对象
_G.CBattleScoreUpSystem = {};
--战斗力提升系统数据 结构k = 类型 ,v = 对应类型的战斗力分数
CBattleScoreUpSystem.tScoreMap = nil;
--组织数据结构，将配表中的数据转换为 k = 小系统名称 v = 大系统类型
CBattleScoreUpSystem.tData = nil;

--系统配置表
local tConfig = _G.BattleScoreUpConfig;

--[[
	[\brief 系统初始化函数
	[初始化数据结构
    [\return object 系统对象
	]]
function CBattleScoreUpSystem:new()
	local obj = CSystem:new("CBattleScoreUpSystem");
	for i,v in pairs(CBattleScoreUpSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end;
	return obj;
end

--[[
	[\brief Create函数
	[初始化转换后的配表数据
	]]
function CBattleScoreUpSystem:Create()
	self:InitData();
	self:Init();
end

--[[
	[\brief 配变信息转换
	[配变信息转换 k = 小系统名称 v = 大系统类型
	]]
function CBattleScoreUpSystem:InitData()
	if not self.tData then
		self.tData = {}
	end
	for i,v in pairs(tConfig.ScoretType) do
		for index,sSysName in pairs(v) do
			self.tData[sSysName] = i;
		end
	end
end

--[[
	[\brief 计算战斗力
	[计算该use的总战斗力
	]]
function CBattleScoreUpSystem:Init()
	local oPlayer = self:GetPlayer();
	if not self.tScoreMap then
		self.tScoreMap = {};
	end

	local tScroe = {};
	for i,v in pairs(self.tData) do
		local nScore = 0;
		nScore = nScore + self:GetScoreAdvBySysName(oPlayer,i);--增量值
		nScore = nScore + self:GetScorePerBySysName(oPlayer,i);--百分比

		nScore = math.modf(nScore);	--剔除小数点
		tScroe[v] = (tScroe[v] or 0) + nScore;
	end
	--技能战斗力整合
	tScroe[3] = self:IntegrationsScore(oPlayer, 3, tScroe[3] or 0);
	--江湖
	tScroe[4] = self:IntegrationsScore(oPlayer, 4, tScroe[4] or 0);
	--名剑系统战斗力整合
	--tScroe[8] = self:IntegrationsScore(oPlayer, 8, tScroe[8] or 0);
	--实战战斗力整合
	tScroe[12] = self:IntegrationsScore(oPlayer, 12, tScroe[12] or 0);
	--宝石战斗力整合
	tScroe[13] = self:IntegrationsScore(oPlayer, 13, tScroe[13] or 0);
	self.tScoreMap = tScroe;
	--初始化时,人物属性战斗力必须在最后计算要不其他战斗力不存在
	self.tScoreMap[2] = tScroe[2] + self:AddPlayerScore(oPlayer);
	self.tScoreMap[2] = math.modf(tScroe[2]);	--剔除小数点
end

--[[
	[\brief 同步给客户端玩家战斗力
	[同步给客户端玩家战斗力
	]]
function CBattleScoreUpSystem:SendBattleScoreAll()
	self:Init();
	self:UpdateAll(self.tScoreMap, 0, self:GetPlayer():GetProf());
end

--[[
	[\brief 发送战斗力提升协议
	[发送战斗力提升协议
	[\param table tScoreMap 计算后的战斗力tab (k=[大系统类型]v=战斗力分数)
	[\param number nRoleID 本玩家或其他玩家的playerId
	[\param number nProf 本玩家或其他玩家的职业id
	]]
function CBattleScoreUpSystem:UpdateAll(tScoreMap, nRoleID, nProf)
	if not tScoreMap then
		_err("Table is nil by CBattleScoreUpSystem:UpdateAll");
		return;
	end
	self:GetPlayer().BSUA_BattleScoreUpAllMsg{
												tAllScore = tScoreMap,
												roleID = nRoleID,
												dwDressID = nProf
											};
end

--[[
	[\brief 通过装备表中配置的属性战斗力评分逐个属性计算战斗力
	[通过装备表中配置的属性战斗力评分逐个属性计算战斗力
	[\param table tTable 当前属性结构 (k=[属性索引]v=[属性值])
	[\return number nValue 通过装备表计算战斗力分数
	]]
function CBattleScoreUpSystem:GetScoreByTable(tTable)
	local nValue = 0;
	for k,v in pairs (tTable) do
		if EquipGradeConfig[k] then
			nValue = nValue + EquipGradeConfig[k]*v;
		end
	end
	return nValue;
end

--[[
	[\brief 根据系统名获得相应大系统战斗力的增量值
	[根据系统名获得相应大系统战斗力的增量值
	[\param object oPlayer 玩家角色
	[\param String sSystemName 系统名称
	[\return number 获得对应大系统战斗力分数
	]]
function CBattleScoreUpSystem:GetScoreAdvBySysName(oPlayer, sSystemName)
	local oSkillSystem = oPlayer:GetSystem("CSkillSystem");
	if not oSkillSystem then
		return;
	end
	local oLastInfo = SSingleAttrChange:new();
	--过滤表中客户端配的信息
	if not oSkillSystem.objAdvAttrInfo[sSystemName] then
		return 0;
	end
	for index,oAttr in pairs(oSkillSystem.objAdvAttrInfo[sSystemName])do
		oAttr:CountAttrValue(oLastInfo);
	end

	return self:GetScoreByTable(oLastInfo);
end

--[[
	[\brief 根据系统名获得相应大系统战斗力的百分比
	[根据系统名获得相应大系统战斗力的百分比
	[\param object oPlayer 玩家角色 
	[\param String sSystemName 系统名称 
	[\return number 通过属性结构计算出来的战斗力分数
	]]
function CBattleScoreUpSystem:GetScorePerBySysName(oPlayer, sSystemName)
	local oSkillSystem = oPlayer:GetSystem("CSkillSystem");
	if not oSkillSystem then
		return;
	end
	--过滤表中客户端配的信息
	if not oSkillSystem.objPerAttrInfo[sSystemName] then
		return 0;
	end
	local oLastInfo = SSingleAttrChange:new();
	for index,attr in pairs(oSkillSystem.objPerAttrInfo[sSystemName])do
		attr:CountAttrValue(oLastInfo);
	end

	return self:GetScoreByTable(oLastInfo);
end

--[[
	[\brief 单独系统战斗力计算的增量值
	[单独系统战斗力计算的增量值
	[\param String sSystemName 系统名称
	[\return number 单独系统增量值战斗力分数
	]]
function CBattleScoreUpSystem:ScoreUpAdvByOneSys(sSystemName)
	--遍历战斗力提升表,同步更新的战斗力
	for k,sysTab in pairs(tConfig.ScoretType) do
		for index,sysName in pairs(sysTab) do
			if sysName == sSystemName then
				--计算单个类型战斗力
				return self:GetScoreAdvBySysName(self:GetPlayer(),sysName);
			end
		end
	end
	return 0;
end

--[[
	[\brief 单独系统战斗力计算的百分比
	[单独系统战斗力计算的增量值
	[\param String sSystemName 系统名称
	[\return number 单独系统百分比战斗力分数
	]]
function CBattleScoreUpSystem:ScoreUpPerByOneSys(sSystemName)
	--遍历战斗力提升表,同步更新的战斗力
	for k,tType in pairs(tConfig.ScoretType) do
		for index,sSysName in pairs(tType) do
			if sSysName == sSystemName then
				--计算单个类型战斗力
				return self:GetScorePerBySysName(self:GetPlayer(),sSysName);
			end
		end
	end
	return 0;
end

--[[
	[\brief 剔除或合并战斗力
	[因之前战斗力系统部分战斗力混一起这里做拆分合并
	[\param object oPlayer 玩家角色
	[\param number nType 大系统类型
	[\param number nScore 未拆分或合并的战斗力分数
	[\return number nScore 战斗力分数
	]]
function CBattleScoreUpSystem:IntegrationsScore(oPlayer, nType, nScore)
	if not oPlayer then
		return 0;
	end

	--技能战斗力
	if nType == 3 then
		local oSkillSystem = oPlayer:GetSystem("CSkillSystem");
		if not oSkillSystem then
			return 0;
		end
		local nSkillEx = G_GetSkillCorVawlue(oSkillSystem:CountAllSkillLevel());
		nScore = nScore + nSkillEx;
		return nScore or 0;
	end

	--江湖
	if nType == 4 then
		local sysPet = self:GetPlayer():GetSystem('CPetSystem');
		for id,objPet in pairs(sysPet.setPetList)do
			local tbBattleInfo = objPet:GetBattleInfo();
			nScore = nScore + self:GetScoreByTable(tbBattleInfo);
		end
		return nScore or 0;
	end
	
	--名剑系统战斗力
	if nType == 8 then
		local sysSword = self:GetPlayer():GetSystem('CSwordSystem');
		local sysSwordFoundry = self:GetPlayer():GetSystem('CSwordFoundrySystem');
		nScore = nScore + sysSword:GetMarkValueStr() + sysSwordFoundry:GetMarkValueStr();
		return nScore or 0;
	end
	
	--实战的武尊全章战斗力
	if nType == 12 then
		local sysBourn = self:GetPlayer():GetSystem('CBournSystem');
		nScore = nScore + sysBourn:GetFightValue();
		return nScore or 0;
	end

	--宝石战斗力
	if nType == 13 then
		local objItemSys = self:GetPlayer():GetSystem("CItemSystem");
		nScore = nScore + objItemSys:GetAllStoneScore();
		return nScore or 0;
	end

	return 0;
end

-----------人物属性---------------
--[[
	[\brief 计算人物属性和等级属性加成战斗力
	[通过总战斗力-其他系统战斗力获得人物战斗力
	[\param object oPlayer 玩家角色
	[\return number nScore  人物属性战斗力分数
	]]
function CBattleScoreUpSystem:AddPlayerScore(oPlayer)
	if not oPlayer then
		return;
	end
	if not oPlayer:GetSystem("CSkillSystem") then
		return ;
	end
	local oInfo = oPlayer:GetSystem("CSkillSystem"):CountBattleScoreInfo();
	local nCurScore = 0;
	--宠物的战斗力不计算在人物属性战斗力内
	for i,v in pairs(self.tScoreMap) do
		if i ~= 4 then
			nCurScore = nCurScore + v;
		end
	end
	local nScore = oInfo.dwAllScore - nCurScore;
	return nScore;
end

--[[
	[\brief 查看其他玩家战斗力
	[查看其他玩家战斗力
	[\param number nRoleID 被查询的玩家id
	]]
function CBattleScoreUpSystem:ViewOtherPlayer(nRoleID)
	local nPlayerID = 0;
	if nRoleID == 0 then
		self:Init();
		self:UpdateAll(	self.tScoreMap,
						self:GetPlayer():GetRoleID(),
						self:GetPlayer():GetProf());
		return;
	else
		nPlayerID = nRoleID;
	end

	_G.GSRemoteCall(nPlayerID,
					"CBattleScoreUpSystem",
					"BeViewBattleScore",
					{self:GetPlayer():GetRoleID()});
end

--[[
	[\brief 查看其他玩家战斗力成功
	[查看其他玩家战斗力成功
	[\param number nFromRoleID 主动查询的玩家id
	]]
function CBattleScoreUpSystem:BeViewBattleScore(nFromRoleID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CBattleScoreUpSystem:BeViewBattleScore");
		return;
	end
	_G.GSRemoteCall(nFromRoleID,
					"CBattleScoreUpSystem",
					"UpdateAll",
					{
						self.tScoreMap,
						objPlayer:GetRoleID(),
						self:GetPlayer():GetProf()
					},
					nil);
end
