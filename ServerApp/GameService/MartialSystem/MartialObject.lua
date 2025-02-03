--演武对象
--Index靠前的坐标优先使用

_G.CMartialObject = {};
CMemoryDebug:Show("ObjMatial");
function CMartialObject:new(dwID)
	local obj = {};
	
	obj.dwSelfID = dwID or 0;--自己的ID
	obj.dwMyDirValue = 0;--本次演武的朝向
	obj.dwCurMapID = 0;--演武所在的地图
	
	--obj.setCanSeeEntity = {};--演武所能看到的地图格子
	
	for i ,v in pairs(CMartialObject) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end
	CMemoryDebug:AddObject("ObjMatial", obj);
	return obj;
end;

function CMartialObject:Update()
	if self.isNeedReCountValue then
		self:CountMaxValue();
		self.isNeedReCountValue = nil;
	end
end;

---------------------------------------------------------------------------------------------------
--初始化，构造演武的基本信息：包括位置表，朝向等
local arrMartialIndex =
{
	dwID = 1;
	dwDirValue = 2;
	fXPos = 3;
	fYPos = 4;
	dwCurMapID = 5;
	dwSpeedUp = 6;
	setPlayerList = 7;
}
function CMartialObject:Init(dwID,objPlayer,fDirValue)
	self.dwSelfID = dwID;
	
	self.setPosTable = {};--将index索引到具体的坐标，在对象中所有的坐标都是用索引
	self.setPlayerPosTable = {};--当前各个索引中的角色，没有就是0
	self.setRoleAutoFlag = {};--角色的自动吃药状态
	
	self.dwRoleMaxValue = 0;--团练获取加速值的角色ID
	self.dwSpeedUp = 0;--因为参与者本身属性而获取到的加速值
	
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	local vPos = objMapSystem:GetPlayerPos();
	self:CountPos(vPos);
	
	self.vMyPos = {};--演武的基准坐标
	self.vMyPos.x = vPos.x;
	self.vMyPos.y = vPos.y;
	self.dwMyDirValue = fDirValue;
	
	--将演武对象加入到地图格子中
	local objCurMap	= objMapSystem:GetCurMap();
	if not objCurMap then
		_err("can not find map",objCurMap.MapID)
		return
	end
	
	self.dwCurMapID = objCurMap.MapID;
	-- local dwCheckerX,dwCheckerY = CCheckerManager:GetCurChecker(objCurMap,vPos.x,vPos.y);
	-- self.dwCheckerX = dwCheckerX;
	-- self.dwCheckerY = dwCheckerY;
	-- objCurMap.setChecker[dwCheckerX][dwCheckerY]:AddMartial(self);
	-- CCheckerManager:InitCanSeeEntity(objCurMap,self.setCanSeeEntity,dwCheckerX,dwCheckerY);
	
	self.dwLogicID = _CreateMapNode(4,self.dwSelfID,0);
	_InsertNode(objCurMap:GetMapLogicID(),self.dwLogicID,self.vMyPos.x,self.vMyPos.y);
	
	--广播自己的创建消息
	local tbInfo = self:GetInfo();
	
	local tbSendInfo = {};
	for n,v in pairs(tbInfo)do
		local key = arrMartialIndex[n];
		if key then
			tbSendInfo[key] = v;
		end
	end
	self:BroadcastMsg("OnCreateMartialMsg",
	{
		CreateInfo = tbSendInfo;
	});
end;

--删除自己
function CMartialObject:Delete()
	self:BroadcastMsg("OnDeleteMartialMsg",
	{
		MartialID = self.dwSelfID;
	});
	
	local objCurMap = CMapManager:GetMap(self.dwCurMapID);
	if objCurMap then
		--objCurMap.setChecker[self.dwCheckerX][self.dwCheckerY]:DelMartial(self.dwSelfID)
		
		_RemoveNode(objCurMap:GetMapLogicID(),self.dwLogicID);
		_DeleteMapNode(self.dwLogicID);
	end
	
	self.dwSelfID = 0;
	self.dwMyDirValue = 0;
	self.dwCurMapID = 0;
	self.vMyPos = {};
	self.setPosTable = nil;
end;

--
function CMartialObject:GetInfo()
	local tbInfo = {};
	
	tbInfo.dwID = self.dwSelfID;
	tbInfo.dwDirValue = self.dwMyDirValue;
	tbInfo.fXPos = self.vMyPos.x;
	tbInfo.fYPos = self.vMyPos.y;
	tbInfo.dwCurMapID = self.dwCurMapID;
	tbInfo.dwSpeedUp = self.dwSpeedUp;
	
	tbInfo.setPlayerList = {};
	
	for index,roleid in pairs(self.setPlayerPosTable)do
		if roleid ~= 0 then
			tbInfo.setPlayerList[index] = roleid;
		end
	end
	
	return tbInfo;
end;

--角色修改加速值
function CMartialObject:ChangeSpeedValue(dwRoleID,dwValue)
	if self.dwSpeedUp == dwValue then
		return;
	end
	
	if dwValue > self.dwSpeedUp then
		self.dwSpeedUp = dwValue;
		self.dwRoleMaxValue = dwRoleID;

		local tbInfo = {};
		tbInfo.dwSpeedUp = dwValue;
		self:BroadcastMsg("OnChangeMartialInfoMsg",
		{
			MartialID = self.dwSelfID;
			Info = tbInfo;
		});
	else
		if dwRoleID == self.dwRoleMaxValue then
			self.isNeedReCountValue = true;
		end
	end
end;

---------------------------------------------------------------------------------------------------
--获取本次参加可用的所有坐标
function CMartialObject:TryJoin()
	if not self.setPosTable then
		return;
	end
	
	local tbFreePosTable = {};
	
	for dwIndex,vPos in pairs(self.setPosTable)do
		if self.setPlayerPosTable[dwIndex] == nil then
			tbFreePosTable[dwIndex] = vPos;
		end
	end
	
	return tbFreePosTable;
end;

function CMartialObject:Enter(dwIndex,dwRoleID)
	if not self.setPosTable then
		return;
	end
	
	self.setPlayerPosTable[dwIndex] = dwRoleID;
	
	--广播消息
	self:BroadcastMsg("OnRoleJoinMartialMsg",
	{
		RoleID = dwRoleID;
		MartialID = self.dwSelfID;
		Index = dwIndex;
	});
end;

function CMartialObject:Exit(dwRoleID)
	if not self.setPosTable then
		return;
	end
	
	local dwIndex = 0;
	for n,v in pairs(self.setPlayerPosTable)do
		if v == dwRoleID then
			dwIndex = n;
			break;
		end
	end
	
	if dwIndex == 0 then
		return;
	end
	
	self.setPlayerPosTable[dwIndex] = nil;
	self.setRoleAutoFlag[dwRoleID] = nil;
	
	--广播消息
	self:BroadcastMsg("OnRoleExitMartialMsg",
	{
		RoleID = dwRoleID;
		MartialID = self.dwSelfID;
		Index = dwIndex;
	});
	
	if self:CheckRole() then
		--如果还有人就要重新计算加速值
		if self.dwRoleMaxValue == dwRoleID then
			self:CountMaxValue();
		end
	end
end;

---------------------------------------------------------------------------------------------------
--计算出本次演武的坐标位置和顺序
function CMartialObject:CountPos(vPos)
	--初始点是第一个点
	self.setPosTable[1] = vPos;
	
	for n,dis in pairs(arrMartialPosDis) do
		local vPosNeed = {};
		vPosNeed.x = vPos.x + dis.x*CMartialConfig.dwPosLenth;
		vPosNeed.y = vPos.y + dis.y*CMartialConfig.dwPosLenth;
		
		self.setPosTable[n+1] = vPosNeed;
	end
end;

--返回当前人数
function CMartialObject:GetRoleNum()
	local dwNum = 0;
	
	for _,v in pairs(self.setPlayerPosTable)do
		if v ~= 0 then
			dwNum = dwNum + 1;
		end
	end
	
	return dwNum;
end;

---------------------------------------------------------------------------------------------------
--检测是否还有成员，如果没有就删除自己
function CMartialObject:CheckRole()
	local isNeed = true;
	
	for n,v in pairs(self.setPlayerPosTable)do
		if v ~= 0 then
			isNeed = false;
			break;
		end
	end
	
	if isNeed then
		CMartialManager:DeleteMartial(self);
		return false;
	end
	
	return true;
end;

---------------------------------------------------------------------------------------------------
--广播函数
function CMartialObject:BroadcastMsgEX(szFuncName,...)
	local objCurMap = CMapManager:GetMap(self.dwCurMapID);
	if not objCurMap then
		_err("can not find map",self.dwCurMapID)
		return
	end
	
	local args={...};
	local setViewPlayer = objCurMap:GetMartialCanSeePlayer(self);
	
	for _,objPlayer in pairs(setViewPlayer)do
		local objMarSys = objPlayer:GetSystem("CMartialSystem");
		if objMarSys and objMarSys[szFuncName] then
			objMarSys[szFuncName](objMarSys,unpack(args));
		end
	end
end;

function CMartialObject:BroadcastMsg(szMsgName,tbParam)
	local objCurMap = CMapManager:GetMap(self.dwCurMapID);
	if not objCurMap then
		_err("can not find map",self.dwCurMapID)
		return
	end
	
	local setViewPlayer = objCurMap:GetAllPlayer();
	
	local tbNet = {}
	for _,objPlayer in pairs(setViewPlayer)do
		table.insert(tbNet,objPlayer.objNet);
	end
	
	_groupcallout(tbNet, szMsgName, tbParam);
	
	-- _mapcallout(szMsgName, tbParam, self.dwLogicID,true);
end

---------------------------------------------------------------------------------------------------
--演武团队的收益计算参数
function CMartialObject:GetTickCountInfo()
	local tbInfo = {};
	
	tbInfo.dwRoleNum = self:GetRoleNum();
	tbInfo.dwSpeedUp = self.dwSpeedUp;
	
	return tbInfo;
end;

--
function CMartialObject:IsHaveRole(dwRoleID)
	if (not dwRoleID) or (dwRoleID == 0) then
		return false;
	end
	
	for _,v in pairs(self.setPlayerPosTable)do
		if v == dwRoleID then
			return true;
		end
	end
	
	return false;
end;

--收到客户端的自动吃药通知
function CMartialObject:NoticeAutoReady(dwRoleID,dwFlag)
	self.setRoleAutoFlag[dwRoleID] = dwFlag;
	
	--如果当前没有加速，且角色切换到自动，就对这个角色尝试自动吃药
	if self.dwSpeedUp == 0 and dwFlag == 1 then
		local objPlayer = CMapManager:GetPlayer(dwRoleID);
		local dwItemEnum = CMartialConfig.setTeamUpItem[dwFlag];
		if objPlayer then
			local objItemSys = objPlayer:GetSystem("CItemSystem");
			if objItemSys then
				return objItemSys:UseEnumItemInPacket(dwItemEnum);
			end
		end
	end
end;

--遍历角色，得出谁需要吃药
function CMartialObject:CountRoleAutoUse()
	local tbCanUse = {};
	for id,flg in pairs(self.setRoleAutoFlag)do
		if flg > 0 then
			local objPlayer = CMapManager:GetPlayer(id);
			if objPlayer then
				local objItemSys = objPlayer:GetSystem("CItemSystem");
				local dwCounts = objItemSys:GetEnumItemNumInPacket(CMartialConfig.setTeamUpItem[self.setRoleAutoFlag[id]])
				if objItemSys and dwCounts > 0 then
					table.insert(tbCanUse,id);
				end
			end
		end
	end
	
	local dwNum = #tbCanUse;
	if dwNum <= 0 then
		return;
	end
	
	local dwRnd = math.random(dwNum);
	
	local dwRndRoleID = tbCanUse[dwRnd];
	local dwItemEnum = CMartialConfig.setTeamUpItem[self.setRoleAutoFlag[dwRndRoleID]];
	local objUsed = CMapManager:GetPlayer(dwRndRoleID);
	if objUsed then
		local objItemSys = objUsed:GetSystem("CItemSystem");
		if objItemSys then
			return objItemSys:UseEnumItemInPacket(dwItemEnum);
		end
	end
end;

--遍历所有当前角色，计算出当前的加速值
function CMartialObject:CountMaxValue()
	local dwMax = 0;
	local dwRoleMaxValue = 0;
	for _,id in pairs(self.setPlayerPosTable)do
		local objPlayer = CMapManager:GetPlayer(id);
		if objPlayer then
			local dwValue = objPlayer:GetSystem("CSkillSystem"):GetInfo().dwMartialUp;
			if dwValue > dwMax then
				dwMax = dwValue;
				dwRoleMaxValue = id;
			end
		end
	end
	
	self.dwSpeedUp = dwMax;
	self.dwRoleMaxValue = dwRoleMaxValue;
	
	local tbInfo = {};
	tbInfo.dwSpeedUp = dwMax;
	self:BroadcastMsg("OnChangeMartialInfoMsg",
	{
		MartialID = self.dwSelfID;
		Info = tbInfo;
	});
	
	--只有调用这个的时候才会是减少加速值，所以在这里判断
	if self.dwSpeedUp == 0 then
		self:CountRoleAutoUse();
	end
end;

function CMartialObject:GetLogicID()
	return self.dwLogicID;
end;

function CMartialObject:IsRoleInPos(dwIndex)
	return self.setPlayerPosTable[dwIndex] ~= nil;
end;