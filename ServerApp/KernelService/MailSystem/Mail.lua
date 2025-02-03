--[[
功能：邮件
作者：周兴团
时间：2012-4-20
]]


_G.CMail = {};
function CMail:new()
	local obj = {}
	obj.sInfo = SMailInfo:new();	--记录物品的具体数据
	obj.sInfo.bRequestToSend = true;
	obj.bRequestToSend = true;		--记录当前的邮件是否需要发送到客户端，初始化都需要发送，发送后这个字段设为nil
	for i,v in pairs(CMail) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
--标记邮件已发送
function CMail:MarkSended()
	self.bRequestToSend = nil;
	self.sInfo.bRequestToSend = nil;
end
--判断邮件是否已经发送
function CMail:IsSended()
	return not self.sInfo.bRequestToSend;--self.bRequestToSend;
end
--获取邮件过期的日期
function CMail:GetLimitedTime()
	return self.sInfo.dwReceiveTime + self.sInfo.dwLifeTime;
end
--获取邮件的ID
function CMail:GetMailID()
	return self.sInfo.dwMailID;
end
--获取邮件的数据信息
function CMail:GetInfo()
	return self.sInfo;
end
--设置邮件的ID，由管理器统一分配ID，	------发送的时候自动填写
function CMail:SetID( IDs )
	self.sInfo.dwMailID = IDs[1]-- or CMailManager:GetNextMailID();
	local dwCount = 0;
	for k,objItem in pairs(self.sInfo.setItems) do
		dwCount = dwCount + 1;
		local id = IDs[dwCount + 1];
		if id then
			--self.sInfo["dwItemID"..dwCount] = id;
			objItem.dwItemID = id;	--物品的新ID
		end
	end
end
--设置发送人信息					
function CMail:SetSender( dwRoleID, strName )
	self.sInfo.dwSender = tonumber(dwRoleID) or 0;
	self.sInfo.strSender = tostring(strName);
end
--设置邮件的接收人信息
function CMail:SetReceiver( dwRoleID, strName )
	self.sInfo.dwReceiver = tonumber(dwRoleID) or 0;
	self.sInfo.strReceiver = tostring(strName);
end
--设置邮件的主题和内容
function CMail:SetContent( strTopic, strContent )
	self.sInfo.strTopic = strTopic;
	self.sInfo.strContent = strContent;
end
--设置邮件的生命时长，单位毫秒
function CMail:SetLifeTime( dwLifeTime )
	self.sInfo.dwLifeTime = dwLifeTime;
end
--设置附件信息，参数：元宝、礼金、银两、物品的对象列表（ SItemMessage 结构）
function CMail:SetAccessory( dwGold, dwBindGold, dwMoney, setItems )
	dwGold = dwGold or 0;
	dwBindGold = dwBindGold or 0;
	dwMoney = dwMoney or 0;
	setItems = setItems or {};
	self.sInfo.dwGold = dwGold;
	self.sInfo.dwBindGold = dwBindGold;
	self.sInfo.dwMoney = dwMoney;
	self.sInfo.setItems = setItems;
	local dwCount = 0;
	--为物品分配新的ID
	for k,objItem in pairs(setItems) do
		dwCount = dwCount + 1;
		local dwID = 0;--CMailManager:GetNextItemID();
		self.sInfo["dwItemID"..dwCount] = json.encode(objItem)--dwID;
		objItem.dwItemID = dwID;	--物品的新ID
		objItem.dwRoleID = 0;		--物品所属邮件的ID
		objItem.dwBornTime = _now();---物品的出生时间以领取的时间为起点
		if dwCount >= 5 then
			break;
		end
	end
end
--获取邮件中物品的数量
function CMail:GetItemCount()
	local dwCount = 0;
	--为物品分配新的ID
	for k,objItem in pairs(self.sInfo.setItems) do
		dwCount = dwCount + 1;
	end
	if dwCount > 5 then
		dwCount = 5;
	end
	return dwCount;
end
--检查邮件是否过期
function CMail:IsOutOfDate()
	local dwTime = _now();
	return self.sInfo.dwReceiveTime + self.sInfo.dwLifeTime < dwTime;
end
--检查邮件是否是最后一天
function CMail:IsLastDay()
	local dwTime = _now();
	return self.sInfo.dwReceiveTime + self.sInfo.dwLifeTime - dwTime < 24*3600*1000;
end
--设置邮件读的状态
function CMail:SetReadState(dwState)
	self.sInfo.dwReadState = dwState;
end
function CMail:IsRead()
	return self.sInfo.dwReadState ~= 0;
end
--设置物品是否已经领取的状态
function CMail:SetItemState(dwState)
	self.sInfo.dwItemState = dwState;
end
function CMail:IsItemGet()
	return self.sInfo.dwItemState ~= 0;
end
--删除邮件附带的所有物品信息
function CMail:RemoveAllItems()
	for k=1,5 do
		if self.sInfo["dwItemID"..k] ~= "" then
			self:DeleteItem( self.sInfo["dwItemID"..k] );
			self.sInfo["dwItemID"..k] = "";--重置ID
		end
	end
	self.sInfo.setItems = {};--清空列表
end
------------------------------------------------------------------------------------------------------------------------
--内部使用函数
--检查邮件中是否有物品信息，有就从数据库获取物品信息
function CMail:CheckLoadItem()
	for k=1,5 do
		if self.sInfo["dwItemID"..k] ~= "" then
			self:LoadItem( k, self.sInfo["dwItemID"..k] );
		end
	end
end
--检查邮件中是否有物品信息，有就保存到数据库
function CMail:CheckSaveItem( objDB )
	for k,objItem in pairs(self.sInfo.setItems) do
		self:InsertItem( objItem, objDB );
	end
end
--从数据库行信息获取物品数据
function CMail:FillByDBData( Row )
	for k,v in pairs(Row) do
		if self.sInfo[k] then
			self.sInfo[k] = v;
		end
	end
end
--将物品数据写入数据库objSqlCmd 的 Field
function CMail:SetFields( objSqlCmd )
	for k,v in pairs(self.sInfo) do
		if type(v) == "string" or type(v) == "number" then
			objSqlCmd.Fields[k] = v;
		end
	end
end
--从数据库读取一个物品信息
function CMail:LoadItem( index,str )
	self.sInfo.setItems[index] = json.decode(str)
	do return end;
	local selStr = 'select * from "T_Role_Item" where "dwRoleID" = $1 and "dwItemID" = $2';
	local dbres = CPlayerDBQuery:GetDBQuery():execute( selStr, 0, dwItemID );
	dbres = dbres or {};
	local objDBData = CItemDataInDB:new();
	for nIndex,Row in pairs(dbres) do
		local item = SItemMessage:new();
		objDBData:Init( Row );
		objDBData:DBDataToAppData( item );
		table.insert(self.sInfo.setItems, item);
		--self.sInfo.setItems[Row.dwItemID] = item;
		break;
	end
end
--向数据库中插入一个物品信息
function CMail:InsertItem( objItem, objDB )
	do return end;
	--转换物品的数据
	local objDBData = CItemDataInDB:new();
	objDBData:AppDataToDBData( objItem );
	--保存数据，使用Insert命令增加一条数据库的记录
	local objSqlCmd = objDB:MakeRecord('T_Role_Item');
	if objSqlCmd == nil then 
		_info("objSqlCmd == nil by CMail:InsertItem");
		return false;
	end;
	--设置Fields的值
	objDBData:SetFields( objSqlCmd );
	--执行命令
	if not objSqlCmd:execute() then
		_info("Insert Item msg To T_Role_Item Error");
		return false;
	end
	return true;
end
--从数据库删除一个物品信息
function CMail:DeleteItem( dwItemID )
	do return end;
	local selStr = 'delete from "T_Role_Item" where "dwRoleID" = $1 and "dwItemID" = $2';
	CPlayerDBQuery:GetDBQuery():execute( selStr, 0, dwItemID );
end



