--[[
	掉落系统 单个掉落物品
	周长沙
	2012-3-9
--]]
_G.CDrop = {}
CMemoryDebug:Show("ObjDrop");
----------------------------
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end
----------------------------
--新建
function CDrop:new(fPosX,fPosY,dwRoleId,Item,Monster)
	local obj = {}
	obj.Pos = {x=fPosX,y=fPosY}
	obj.dwRoleId = dwRoleId
	obj.Item = Item--Item={dwItemEnum=2100010;dwNum=5;dwQuality=6}
	if ((not obj.Item.dwQuality) or (obj.Item.dwQuality==0)) and CGlobalItemManager:IsEquip(obj.Item.dwItemEnum) then
		obj.Item.dwQuality = DropFunctionConfig:GetDropQuality(obj.Item.dwItemEnum,Monster:GetMonsterType(),Monster.DataInfo.droptype) or 0
	end
	obj.ObjId = nil
	obj.setCanSeeEntity = {}
	for i,v in pairs(CDrop) do
		if type(v) == "function" then
			obj[i] =v;
		end;
	end;
	
	CMemoryDebug:AddObject("ObjDrop", obj);
	return obj
end
--更新
function CDrop:Update(dwDelay)

end
--移除
function CDrop:Remove()

end
----------------------------
--设置物品的对象id
function CDrop:SetObjId(dwId)
	self.ObjId = dwId
	return self.ObjId
end
--获取物品的对象id
function CDrop:GetObjId()
	return self.ObjId
end
--清除物品的玩家信息
function CDrop:ClearRoleId()
	self.dwRoleId = nil
	return self.dwRoleId
end
--获取物品绑定的玩家
function CDrop:GetRoleId()
	return self.dwRoleId
end
--获取物品的位置
function CDrop:GetPos()
	return self.Pos
end
--获取物品的道具信息
function CDrop:GetItem()
	return self.Item
end
--获取物品需要发送的信息
function CDrop:GetSendInfo()
	local tbInfo = {}
	tbInfo.ObjId= self:GetObjId()
	--tbInfo.Pos = self:GetPos()
	--tbInfo.dwRoleId = self:GetRoleId()
	--tbInfo.Item = self:GetItem()
	---------------------------------
	tbInfo[1] = self:GetPos().x
	tbInfo[2] = self:GetPos().y
	tbInfo[3] = self:GetRoleId()
	tbInfo[4] = self:GetItem().dwItemEnum
	tbInfo[5] = self:GetItem().dwNum
	tbInfo[6] = self:GetItem().dwQuality
	tbInfo[7] = self:GetItem().dwStrong
	tbInfo[8] = self:GetItem().dwBindType
	---------------------------------
	return tbInfo
end
---------------------------
--将物品显示到地图
function CDrop:Show(Map)
	if Map then
		self.dwLogicID = _CreateMapNode(3,self:GetObjId(),0);
		_InsertNode(Map:GetMapLogicID(),self.dwLogicID,self:GetPos().x,self:GetPos().y);
		
		-- local setNet = {}
		local szMsgName = "DropShowItemMsg"
		local tParam = {TbObj=self:GetSendInfo()}
		-- local tbPLayers = Map:GetAllPlayer()
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet,tbPlayer.objNet)
		-- end
		
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName, tParam, self.dwLogicID,true);
	end
end
--清除物品的玩家信息
function CDrop:ClearRoleId(Map)
	self.dwRoleId = 0
	if Map then
		-- local setNet = {}
		local szMsgName = "DropClearRoleIdMsg"
		local tParam = {DwObjId=self:GetObjId()}
		-- local tbPLayers = Map:GetAllPlayer()
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet,tbPlayer.objNet)
		-- end
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName, tParam, self.dwLogicID,true);
	end
end
--从地图隐藏物品
function CDrop:Hide(Map)
	if Map then
		--local tbPLayers = Map:GetDroperCanSeePlayer(self)
		-- local setNet = {}
		local szMsgName = "DropDelItemMsg"
		local tParam = {DwObjId=self:GetObjId()}
		-- local tbPLayers = Map:GetAllPlayer()
		-- for dwPos,tbPlayer in pairs(tbPLayers) do
			-- table.insert(setNet,tbPlayer.objNet)
		-- end
		-- group_msg(setNet,szMsgName,tParam)
		
		_mapcallout(szMsgName, tParam, self.dwLogicID,true);
		
		_RemoveNode(Map:GetMapLogicID(),self.dwLogicID);
		_DeleteMapNode(self.dwLogicID);
	end
end

function CDrop:GetLogicID()
	return self.dwLogicID;
end;







