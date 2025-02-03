----------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------宝石铸造功能逻辑------------ by weiyun ------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------


function CStoneSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if(not objDB ) then
		_info("objDB is null by CStoneSystem:Create")
		return false
	end
	-- 创建数据库对象
	self.objDBQuery = CPlayerStoneSystemDBOper:new(objDB,self);
	
	self.foundInfo = {}  -----宝石铸造信息
	self.foundData = {}
	for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do 
		self.foundInfo[dwWearPos] = 0
	end
	
	local Data = objPlayer:GetLineData("CStoneSystem") or {};
	self.foundData = Data[1]
	if(Data[1].strType == nil) then
		for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do 
			self.foundInfo[dwWearPos] = 0
		end
	else
		self.foundInfo = self:LoadStr(Data[1].strType);
	end
	
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if not objItemSystem then
		_err("cannot find objItemSystem by CStoneSystem:Create");
		return;
	end	

	for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do 
		objItemSystem:SetWearPosFoundryStoneNum(dwWearPos,self.foundInfo[dwWearPos])
		objItemSystem:InitWearPosFoundryStone(dwWearPos)
	end
	
	self.StoneZQDiscount = 1;
end


---换线开始

function CStoneSystem:OnChangeLineBegin(dwNewLineID)
	self:DealBreakPro();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	--将数据提交到换线中心
	self.foundData.strType = self:UpdateStr(self.foundInfo)
	objPlayer:SetLineData("CStoneSystem", self.foundData);
	
end

----玩家上线 同步宝石铸造信息
function CStoneSystem:OnEnterScene()
	self:SynchronizeToClient();
end
--同步宝石铸造信息
function CStoneSystem:SynchronizeToClient()
	local player =  self:GetPlayer();
	if not player then
		_info("player is null by SynchronizeToClient");
		return false;
	end;
    local dwRoleID = player:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by SynchronizeToClient");
		return false;
	end;
	--同步宝石铸造信息
	local holderInfo = {};
	holderInfo =self.foundInfo
	player.SynchronizeFounderInfoToClientMsg{Info = holderInfo};
end;
---宝石铸造
function CStoneSystem:FoundStone(Slot)
	if(Slot < _G.enItemWearPos.eWeapon or Slot > _G.enItemWearPos.eMount4) then
		_info("client is error slot",Slot)
		return
	end
	local player = self:GetPlayer();
	if(not player) then
	_err("cannot find objPlayer by CStoneSystem:FoundStone");
		return;
	end
	local objItemSystem = player:GetSystem("CItemSystem");
	if not objItemSystem then
		_err("cannot find objItemSystem by CStoneSystem:FoundStone");
		return;
	end
	local dwRoleID = player:GetRoleID()
	local num = 0----铸造的孔数
	num = self.foundInfo[Slot] + 1
	if(num > #ItemFoundryConfig.Value) then ----铸造已达顶级
		_info("FoundStone(Slot) is max")
		return ;
	end
	local consumedwEnumID = ItemFoundryConfig.dwID ----铸造消耗的物品id
	if(consumedwEnumID == nil) then
		_info("ItemFoundryConfig consumedwEnumID is error",consumedwEnumID)
		return;
	end
	local counsumedwEnumNum = ItemFoundryConfig.Value[num].Num
	if(counsumedwEnumNum < 0) then
		_info("ItemFoundryConfig counsumedwEnumNum is error ",counsumedwEnumNum)
		return;
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(consumedwEnumID)
	if(packNum < counsumedwEnumNum) then  ----背包中的消耗物品数量不够
		return;
	end
	--删除宝石铸造材料
	local isSucc = objItemSystem:DelEnumItemInPacket(consumedwEnumID,counsumedwEnumNum,false, _G.ItemSysOperType.Used) 
	if not isSucc then
		return;
	end
	local successRate = ItemFoundryConfig.Value[num].SuccessRate 
	local rander = math.random(1,10000)----铸造成功率 为10000分之几
	local resultFoundInfo = {
	Slot = 0,
	foundrynum = 0,
	isSucc = false,
	}
	resultFoundInfo.Slot = Slot
	if(rander > successRate) then
		resultFoundInfo.isSucc = false
		resultFoundInfo.foundrynum = num -1
		player.StoneSys_OnStoneFoundryMsg{Info = resultFoundInfo} ----铸造失败
	else
		self.objDBQuery:UpdateFoundryStoneInfo(Slot,num)
		self.foundInfo[Slot] = num
		resultFoundInfo.foundrynum = num
		resultFoundInfo.isSucc = true
		player.StoneSys_OnStoneFoundryMsg{Info = resultFoundInfo} ---铸造成功
		objItemSystem:SetWearPosFoundryStoneNum(Slot,num)
		objItemSystem:SetWearPosFoundryStoneAttr(Slot)
		if(num == #ItemFoundryConfig.Value)then  ------到等级发一个公告
			self:BroadCastFoundryMsg( Slot ,num)
		end
		CLogSystemManager:stone_use(player,consumedwEnumID,Slot,num,1)  ----铸造log
	end
	return;
end

----宝石铸造广播
function CStoneSystem:BroadCastFoundryMsg( dwWearPos,num )
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CStoneSystem:BroadCastMsg");
		return;
	end;
	--玩家姓名
	local s_PlayerName = objPlayer:GetInfo().szRoleName;
	--全服广播
	CGameApp.StoneSys_BroadFoundryCastMsg{
		PlayerID = objPlayer:GetRoleID(),
        PlayerName = s_PlayerName,
        WearPos = dwWearPos,
		FoundryNum = num
		};
end;


---加载字符串 转换为 table
function CStoneSystem:LoadStr(str)
	local b = {};
	for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do 
		b[dwWearPos] = 0
	end
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		b[index] = value;
		index = index + 1;
	end;
	return b;
end

---更新字符串
function CStoneSystem:UpdateStr(str,pos,num)
	if(pos ~= nil) then
		str[pos] = num;
	end
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end;


function CStoneSystem:ViewOtherFoundry(fromRoleID)

	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CStoneSystem", "ViewOtherFoundryInfo", {objPlayer:GetRoleID()}, nil);

end

function CStoneSystem:ViewOtherFoundryInfo(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CStoneSystem", "ViewResult", {false, {6000410027}}, nil);
		return;
	end;
	_G.GSRemoteCall(dwRoleId, "CStoneSystem", "ViewResult", {true, self.foundInfo}, nil);
end;

--返回查看结果
function CStoneSystem:ViewResult(isOK, info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CStoneSystem:ViewResult");
		return;
	end;
	objPlayer.StoneSys_ViewOtherResultMsg{IsOK = isOK, FoundryInfo = info};
end;




--数据库类
-----------------------------------------------------
-----------------------------------------------------
_G.CPlayerStoneSystemDBOper = {};
function CPlayerStoneSystemDBOper:new(objDB,objUser)
	
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CPlayerStoneSystemDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end


----更新宝石铸造信息
function CPlayerStoneSystemDBOper:UpdateFoundryStoneInfo(dwPos,dwNum)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CPlayerStoneSystemDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPlayerStoneSystemDBOper");
		return false;
	end;
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPlayerStoneSystemDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPlayerStoneSystemDBOper");
		return false;
	end;
	local isFoundry = false
	for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do 
		if(self.objUser.foundInfo[dwWearPos] > 0) then
			isFoundry = true
		end
	end
	if(isFoundry)  then---之前铸造过
		local SqlCmd1 = self.objDBQuery:CreateUpdateCmd('T_Role_FoundryStone');
		SqlCmd1.Wheres.dwRoleID	= dwRoleID;
		SqlCmd1.Fields.strType = self.objUser:UpdateStr(self.objUser.foundInfo,dwPos,dwNum)
		SqlCmd1:execute()
	else                                          ---之前没有铸造过
		local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_FoundryStone');
		SqlCmd.Wheres.dwRoleID = dwRoleID;
		SqlCmd.Fields.strType = ""
		for dwWearPos=_G.enItemWearPos.eWeapon, _G.enItemWearPos.eMount4 do 
			if(dwWearPos == dwPos) then
				SqlCmd.Fields.strType = SqlCmd.Fields.strType..dwNum..";";
			else
				local tempnum = 0
				SqlCmd.Fields.strType = SqlCmd.Fields.strType..tempnum..";";
			end
		end
		SqlCmd:execute()
	end
end






