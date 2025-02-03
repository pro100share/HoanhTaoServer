--[[
功能：邮件系统
作者：周兴团
时间：2012-4-20
]]
--对邮件进行排序，按照邮件的接收时间
local function MailSortFunc(a, b)
	return a.sInfo.dwReceiveTime > b.sInfo.dwReceiveTime;
end

_G.CMailSystem = {};
CMailSystem.dwLimited = 5000;	--邮件的上限
function CMailSystem:new()
	local obj = CSystem:new("CMailSystem");
	obj.objDBQuery = nil;--数据库查询对象
	obj.setMails = {};	--邮件列表
	obj.strName = "";	--自己的姓名
	obj.dwRoleID = 0;	--自己的角色ID
	obj.bNotify = false;--记录是否已经通知玩家邮件过期
	for i,v in pairs(CMailSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CMailSystem:Create()
	local objPlayer = self:GetPlayer();
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CMailSystemDBQuery:new( objDB, self );
	--[[
	--加载玩家的邮件列表
	self.objDBQuery:LoadMailInfo( self.setMails );
	--]]
	--从换线中心获取邮件数据
	--从换线机制里面获取数据
	local datalist = objPlayer:GetLineData("CMailSystem") or {};
	for k=1,#datalist do
		for i,mailInfo in pairs(datalist[k]) do
			if type(mailInfo) == "table" then
				local objMail = CMail:new();
				objMail.sInfo = mailInfo;
				self.setMails[objMail:GetMailID()] = objMail;
				--print("Mail-----------",objMail:GetMailID())
			end
		end
	end
	
	self.strName = objPlayer:GetInfo().szRoleName;--自己的姓名
	self.dwRoleID = objPlayer:GetRoleID();	--自己的角色ID
	return true;
end
function CMailSystem:Update(dwInterval)
	
	return true;
end;
function CMailSystem:Destroy()
	--保存玩家的邮件列表
	--[[
	if self.objDBQuery then
		self.objDBQuery:SaveMailInfo( self.setMails );
	end
	--]]
end
--客户端进入游戏登入所有场景之后
function CMailSystem:OnEnterScene()
	
end;

function CMailSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	--将玩家的邮件数据发送到换线中心
	local count = 0;
	local data = {};
	for k,objMail in pairs(self.setMails) do
		count = count + 1;
		table.insert(data, objMail:GetInfo());
		if count >= 1 then
			objPlayer:SetLineData("CMailSystem",data);
			count = 0;
			data = {};
		end
	end
	if #data > 0 then
		objPlayer:SetLineData("CMailSystem",data);
	end
end
-----------------------------------------------------------------------------------------------------------------------------
--系统对外接口

--获取邮件数量信息，发送到客户端
function CMailSystem:GetMailNum()
	local dwCount = 0;
	for dwMailID,objMail in pairs(self.setMails) do
		dwCount = dwCount + 1;
	end
	return dwCount;
end
function CMailSystem:GetMailNotReadNum()
	local dwCount = 0;
	for dwMailID,objMail in pairs(self.setMails) do
		if not objMail:IsRead() then
			dwCount = dwCount + 1;
		end
	end
	return dwCount;
end
function CMailSystem:GetMailReadNum()
	local dwCount = 0;
	for dwMailID,objMail in pairs(self.setMails) do
		if objMail:IsRead() then
			dwCount = dwCount + 1;
		end
	end
	return dwCount;
end
--获取邮件的列表，同时返回已读邮件的数量
function CMailSystem:GetMailList()
	--获取所有邮件到数组中
	local allMail = {};
	local readCount = 0;
	for k,objMail in pairs(self.setMails) do
		if objMail:GetInfo().dwReadState == 1 then--已读
			readCount = readCount + 1;
		end
		table.insert( allMail, objMail );
	end
	--对邮件进行排序
	table.sort( allMail, MailSortFunc );
	return allMail,readCount;
end
--检查是否有邮件过期
function CMailSystem:CheckMailOutOfDate()
	if self.bNotify then
		return;
	end
	self.bNotify = true;
	local bFind = false;
	for k,objMail in pairs(self.setMails) do
		if objMail:IsLastDay() then--已读
			bFind = true;
			break;
		end
	end
	if bFind then
		self:GetPlayer().NotifyMailOutOfDateMsg{};
	end
end
--获取下一批需要发送的邮件
function CMailSystem:GetNextMailsToSend()
	--获取所有邮件到数组中
	local mails = {};
	local allMail,readCount = self:GetMailList();
	for k=1,#allMail do
		local objMail = allMail[k];
		if not objMail:IsSended() then
			objMail:MarkSended();
			table.insert( mails, objMail:GetInfo() );
			if #mails >= 1 then
				break;
			end
		end
	end
	return mails;
end

--获取某一页的邮件信息，按照排序规则--dwShowType 0是全部，1是已读，2是未读
function CMailSystem:RequestMailMsg( dwPage, dwShowType )
	--[[
	--获取所有邮件到数组中
	--local allMail,readCount = self:GetMailList();
	--获取某一页显示的邮件
	-- local mails = {};
	-- local indexBegin = (dwPage-1)*10+1;
	-- local indexEnd = #allMail;
	-- local dwCount = 0;
	-- for k=indexBegin,indexEnd do--每次从Index开始取
		-- local objMail = allMail[k];
		-- if objMail then
			-- table.insert( mails, objMail:GetInfo() );
			-- if dwShowType == 0 then
				-- dwCount = dwCount + 1;
			-- elseif dwShowType == 1 then
				-- if objMail:GetInfo().dwReadState == 1 then
					-- dwCount = dwCount + 1;
				-- end
			-- elseif dwShowType == 2 then
				-- if objMail:GetInfo().dwReadState == 0 then
					-- dwCount = dwCount + 1;
				-- end
			-- end
			-- if dwCount >= 10 then
				-- break;
			-- end
		-- end
	-- end
	--]]
	local mails = self:GetNextMailsToSend();
	local total = self:GetMailNum();
	local readnum = self:GetMailReadNum();
	if #mails == 0 and not self.bNotify then--如果不是第一次发送，并且已经没有可以发送的，那么不执行发送命令
		return;
	end
	self:SynchronizeMailMsg(total, readnum, mails, 0);
	--[[
	--转换成数字key
	for k,smail in pairs(mails) do
		local Items = CItemSystem:KeyNameToNumber( smail.setItems );
		mails[k] = KeyToNumber( smail, MailMsgTable );
		mails[k][20] = Items;
	end
	self:GetPlayer().OnRequestMailMsg{ Total = total, TotalRead = readnum, Mails = mails, Notify = 0 };
	--]]
	self:CheckMailOutOfDate();
end
--修改邮件读标记
function CMailSystem:RequestReadMail( dwMailID )
	if self.setMails[dwMailID] then
		self.setMails[dwMailID]:SetReadState( 1 );
		--保存信息到数据库
		self.objDBQuery:UpdateMailReadState( self.setMails[dwMailID] );
	end
end
--领取物品
function CMailSystem:RequestGetItem( dwMailID )	
	local objMail = self.setMails[dwMailID];
	if not objMail then
		return;
	end;
	if #objMail:GetInfo().setItems <=0 and objMail:GetInfo().dwGold <= 0 and 
		objMail:GetInfo().dwBindGold <= 0 and objMail:GetInfo().dwMoney <= 0 then
		return;
	end
	--更改物品成Item列表
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	local items = {};
	for k,sItemMsg in pairs(objMail:GetInfo().setItems) do
		local objItem = CItem:New(sItemMsg.dwItemEnum);
		if sItemMsg.dwLifeTime == 0 then
			sItemMsg.dwLifeTime = nil
		end
		objItem:FillByItemMessage( sItemMsg );
		objItem:SetBornTime(GetCurTime());---物品的出生时间以领取的时间为起点
		table.insert( items, objItem );
	end
	--判断背包是否已满--客户端已判断
	if not itemSys:IsObjItemListCanAddToPacket(items) then
		return;--提示玩家背包已满
	end
	--领取物品，并添加物品到背包中
	itemSys:AddObjItemListToPacket(items, _G.ItemSysOperType.Mail);
	
	
	if objMail:GetInfo().dwMoney > 0 then
		if itemSys:IsCanAddPacketMoney(objMail:GetInfo().dwMoney) then
			itemSys:AddPacketMoney( objMail:GetInfo().dwMoney, _G.ItemSysOperType.Mail);
			objMail:GetInfo().dwMoney = 0;
		end
	end
	if objMail:GetInfo().dwGold > 0 then
		if itemSys:IsCanAddGold(objMail:GetInfo().dwGold) then
			itemSys:AddGold( objMail:GetInfo().dwGold, _G.ItemSysOperType.Mail);
			objMail:GetInfo().dwGold = 0;
		end
	end
	if objMail:GetInfo().dwBindGold > 0 then
		if itemSys:IsCanAddBindGold(objMail:GetInfo().dwBindGold) then
			itemSys:AddBindGold( objMail:GetInfo().dwBindGold, _G.ItemSysOperType.Mail);
			objMail:GetInfo().dwBindGold = 0;
		end
	end
	--清空邮件物品信息
	objMail:SetItemState( 1 );
	objMail:RemoveAllItems();
	--保存信息到数据库
	self.objDBQuery:UpdateMail( objMail );
	--返回物品领取信息到客户端
	self:GetPlayer().OnRequestGetItemMsg{ MailID = dwMailID };
end
--删除邮件
function CMailSystem:RequestDeleteMails( sMailIDs )
	for k,ID in pairs(sMailIDs) do
		local objMail = self.setMails[ID];
		if objMail then
			self:DeleteMail( ID );--移除邮件信息
		end
	end
end
function CMailSystem:GetRoleID()
	return self.dwRoleID;
end
function CMailSystem:GetRoleName()
	return self.strName;
end
--在线的时候，收到一封邮件
function CMailSystem:ReceiveMail( objMail )
	self.setMails[objMail:GetMailID()] = objMail;
	--检查邮件的数量，删除多余的邮件
	self:CheckMailLimited();
	--将邮件发送到客户端给玩家
	local mails = {};
	objMail:MarkSended();--标记已发送
	table.insert( mails, objMail:GetInfo() );
	local total = self:GetMailNum();
	local readnum = self:GetMailReadNum();
	
	self:SynchronizeMailMsg(total, readnum, mails, 1);
	--[[
	--转换成数字key
	for k,smail in pairs(mails) do
		local Items = CItemSystem:KeyNameToNumber( smail.setItems );
		mails[k] = KeyToNumber( smail, MailMsgTable );
		mails[k][20] = Items;
	end
	self:GetPlayer().OnRequestMailMsg{ Total = total, TotalRead = readnum, Mails = mails, Notify = 1 };
	--]]
end
--发送一封邮件
function CMailSystem:SendMail( objMail )
	objMail:SetSender( self.dwRoleID, self.strName );
	CMailManager:SendMail( objMail );
	--[[
	local sInfo = objMail:GetInfo();
	sInfo.dwReceiveTime = GetCurTime();--设置接收时间
	objMail:SetID();
	objMail:SetSender( self.dwRoleID, self.strName );
	local dwRoleID = sInfo.dwReceiver;
	--保存数据到数据库
	self.objDBQuery:InsertMail( objMail );
	--寻找玩家，如果玩家在线，那么直接通知玩家收到了邮件信息
	if dwRoleID ~=0 then
		local player = self:GetPlayer():GetOtherPlayer(dwRoleID, 3);
		if player then
			local mailSys = player:GetSystem("CMailSystem");
			mailSys:ReceiveMail( objMail );
		end
	end
	--]]
end
--删除一封邮件
function CMailSystem:DeleteMail( dwMailID )
	local objMail = self.setMails[dwMailID];
	if objMail then
		self.setMails[dwMailID] = nil;
		objMail:RemoveAllItems();--先移除物品信息
		self.objDBQuery:DeleteMail( dwMailID );
	end
end
--检查邮件信息：数量、过期邮件、是否加载物品
function CMailSystem:CheckMail()
	self:CheckMailLimited();
	self:CheckMailDate();
	return self:CheckMailItem();
end
--检查邮件的数量，删除多余的邮件
function CMailSystem:CheckMailLimited()
	local dwCount = self:GetMailNum();
	if dwCount <= CMailSystem.dwLimited then
		return;
	end
	local allMail,readCount = self:GetMailList();
	for k=CMailSystem.dwLimited+1,dwCount do
		local objMail = allMail[k];
		self:DeleteMail( objMail:GetMailID() );
	end
end
--检查邮件，是否有过期的，删除过期邮件
function CMailSystem:CheckMailDate()
	for dwMailID,objMail in pairs(self.setMails) do
		if objMail:IsOutOfDate() then
			self:DeleteMail( objMail:GetMailID() );
		end
	end
end
--检查邮件是否需要加载物品信息
function CMailSystem:CheckMailItem()
	for dwMailID,objMail in pairs(self.setMails) do
		objMail:CheckLoadItem();
	end
end


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
--邮件信息的字符串key对应的数字表
local MailMsgTable = {
	dwMailID = 1;		--邮件的ID
	dwSender = 2;		--邮件发送者的ID
	dwReceiver = 3;		--邮件接受者
	strSender = 4;		--邮件发送者姓名
	strReceiver = 5;	--邮件接收者姓名
	strTopic = 6;		--邮件的主题
	strContent = 7;		--邮件的内容
	dwReceiveTime = 8;	--邮件接收的时间
	dwLifeTime = 9;		--邮件的生命周期，单位毫秒
	dwGold = 10;		--携带的元宝
	dwBindGold = 11;	--携带的礼金
	dwMoney = 12;		--携带的银两
	dwItemID1 = 13;		--记录物品信息，没有则为0
	dwItemID2 = 14;		--记录物品信息，没有则为0
	dwItemID3 = 15;		--记录物品信息，没有则为0
	dwItemID4 = 16;		--记录物品信息，没有则为0
	dwItemID5 = 17;		--记录物品信息，没有则为0
	dwItemState = 18;	--记录物品是否已经领取，0是未领取，1是已领取
	dwReadState = 19;	--记录邮件读的状态，0是未读，1是已读
	setItems = 20;		--记录物品具体的数据， SItemMessage 对象
};

local MyItem = {}
function MyItem:GetNetData()
	local data = {};
	
	data[1] = self.dwItemEnum;
	data[2] = 0;				--实例ID
	data[3] = 0;				--所有者的ID
	data[4] = self.dwItemNumber;				--叠加个数
	data[5], data[6] = 0,0;	--位置信息
	data[7] = self.dwBindType;			--0表示未绑定；1表示绑定
	data[8] = GetCurTime();			--出生时间戳
	data[9] = self.dwLifeTime;			-- -1表示无时间限制
	data[10] = self.sDoodle;			--签名
	data[11] = 0;			--耐久度
	data[12] = self.dwStrongLevel;		--强化等级
	data[13] = self.dwTianSheng;			--天生属性
	data[14] = self:GetPropertyNetData();	--装备的附加属性
	
	return data;
end
function MyItem:GetPropertyNetData()
	local data = {};
	for _, v in ipairs(self.setProperty or {}) do
		local tempT = {
			[1]	= v.dwPropertyType;
			[2] = v.dwValue;
		};
		table.insert(data, tempT);
	end;
	return data;
end;


--发送网络消息
function CMailSystem:SynchronizeMailMsg(total, readnum, mails, notify)
	--转换成数字key
	for k,smail in pairs(mails) do
		--local Items = CItemSystem:KeyNameToNumber( smail.setItems );
		local Items = {};
		for n,objItem in pairs(smail.setItems)do
			setmetatable(objItem,{__index=MyItem})
			table.insert(Items,objItem:GetNetData())
		end
		mails[k] = KeyToNumber( smail, MailMsgTable );
		mails[k][13] = {};
		mails[k][20] = Items;
	end
	self:GetPlayer().OnRequestMailMsg{ Total = total, TotalRead = readnum, Mails = mails, Notify = notify };
end


function CMailSystem:SendSetMail( mailMsg, dwRoleID, szName ) ---发送一个设置的邮件
	CMailManager:SendSetMail( mailMsg, dwRoleID, szName )
end


















