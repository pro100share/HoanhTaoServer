--[[
功能：邮件系统单件管理器
作者：周兴团
时间：2012-4-20
]]

_G.CMailManager = CSingle:new();
CSingleManager:AddSingle(CMailManager);
CMailManager.dwMailSequence = 0;--邮件的ID序列
CMailManager.dwItemSequence = 0;--邮件的物品ID序列
CMailManager.setMailQueue = {};--等待发送的邮件列表

function CMailManager:Create()
	--self:GetItemSequence();
	--self:GetMailSequence();
	
	
	
end
function CMailManager:Update(dwInterval)
	return true;
end;
function CMailManager:Destroy()
end;
--初始化的时候，从数据库获取物品列表里的最大ID值，dwRoleID=0
function CMailManager:GetItemSequence()
	-- local selStr = 'select max("dwItemID") from "T_Role_Item" where "dwRoleID" = $1 LIMIT 1';
	-- local dbres = CPlayerDBQuery:GetDBQuery():execute( selStr, 0 );
	-- dbres = dbres or {};
	-- for nIndex,Row in pairs(dbres) do
		-- self.dwItemSequence = Row.max or 0;
		-- break;
	-- end
end
function CMailManager:GetNextItemID()
	self.dwItemSequence = self.dwItemSequence + 1;
	return self.dwItemSequence;
end
function CMailManager:GetMailSequence()
	local selStr = 'select max("dwMailID") from "T_Role_Mail" LIMIT 1';
	local dbres = CPlayerDBQuery:GetDBQuery():execute( selStr );
	dbres = dbres or {};
	for nIndex,Row in pairs(dbres) do
		self.dwMailSequence = Row.max or 0;
		break;
	end
end
function CMailManager:GetNextMailID()
	self.dwMailSequence = self.dwMailSequence + 1;
	return self.dwMailSequence;
end
--发送一封配置表的邮件，只需要传入邮件的配置ID，和邮件接收人，szName可以为空
function CMailManager:SendConfigMail( dwConfigID, dwRoleID, szName )
	local mailMsg = AutoMailSendConfig[dwConfigID];
	if not mailMsg then
		return;
	end
	local mail = CMail:new();
	mail:SetSender( mailMsg.sender_id, mailMsg.sender );
	mail:SetReceiver( dwRoleID, szName or "" );
	mail:SetContent( mailMsg.topic, mailMsg.content );
	mail:SetLifeTime( mailMsg.lifetime );
	local itemset = self:ParseMailConfigItem( mailMsg );
	mail:SetAccessory( mailMsg.gold, mailMsg.bindgold, mailMsg.money or 0, itemset );
	CMailManager:SendMail( mail );
end

function CMailManager:SendSetMail( mailMsg, dwRoleID, szName )
	if not mailMsg then
		return;
	end
	local mail = CMail:new();
	mail:SetSender( mailMsg.sender_id, mailMsg.sender );
	mail:SetReceiver( dwRoleID, szName or "" );
	mail:SetContent( mailMsg.topic, mailMsg.content );
	mail:SetLifeTime( mailMsg.lifetime );
	local itemset = self:ParseMailConfigItem( mailMsg );
	mail:SetAccessory( mailMsg.gold, mailMsg.bindgold, mailMsg.money or 0, itemset );
	CMailManager:SendMail( mail );
end

function CMailManager:ParseMailConfigItem( mailMsg )
	local itemset = {};
	if mailMsg.equip then
		for dwItemEnum,eq in pairs(mailMsg.equip) do
			local item = SItemMessage:new();
			item.dwItemEnum = dwItemEnum;
			item.dwItemNumber = 1;
			item.dwLifeTime = -1;
			item.setProperty = eq.setProperty;
			item.setStrongInfo.dwLevel = eq.dwStrong;
			item.dwTianSheng = eq.dwBingHun;
			item.dwBindType = eq.bind;
			table.insert( itemset, item );
		end
	end
	if mailMsg.item then
		for dwItemEnum,itemMsg in pairs(mailMsg.item) do
			local item = SItemMessage:new();
			item.dwItemEnum = dwItemEnum;
			item.dwItemNumber = itemMsg.num;
			item.dwLifeTime = -1;
			item.dwBindType = itemMsg.bind;
			table.insert( itemset, item );
		end
	end
	return itemset;
end

--发送一封邮件，邮件先进入队列，等到KS返回邮件和物品的ID之后再发送
function CMailManager:SendMail( objMail )
	CKernelApp.GSSendMailMsg{MailMsg=objMail.sInfo}
	do return end;
	--[[
	table.insert(self.setMailQueue, objMail);
	--向KS获取ID信息
	local itemCount = objMail:GetItemCount();
	local dwLine = CKernelApp.dwLineID;
	CKernelApp.GSRequestMailIDMsg{ Line=dwLine, Param=itemCount };
	--]]
end
--接收到KS的ID信息，发送邮件
function CMailManager:DoSendMail( Param )
	if #self.setMailQueue == 0 then
		return;
	end
	local objMail = self.setMailQueue[1];
	table.remove(self.setMailQueue, 1);
	local sInfo = objMail:GetInfo();
	sInfo.dwReceiveTime = GetCurTime();--设置接收时间
	objMail:SetID( Param );
	self:InsertMail( objMail );
	--寻找玩家，如果玩家在线，那么直接通知玩家收到了邮件信息
	local player = nil;
	if sInfo.dwReceiver ~= 0 then
		player = CMapManager:GetPlayer(sInfo.dwReceiver);
	end
	if player then
		local mailSys = player:GetSystem("CMailSystem"); --CFriendManager:GetSystem( sInfo.dwReceiver, "CMailSystem" );
		if mailSys then
			mailSys:ReceiveMail( objMail );
		end
	end
end
--------------------------------------------------------------------------------------------------------
--内部使用函数
--保存一封邮件到数据库
function CMailManager:InsertMail( objMail )
	do return end;
	local objDB = CPlayerDBQuery:GetDBQuery();
	--保存数据，使用Insert命令增加一条数据库的记录
	if not objDB then return end;
	local objSqlCmd = objDB:MakeRecord('T_Role_Mail');
	if objSqlCmd == nil then 
		_info("objSqlCmd == nil by CMailSystemDBQuery:InsertMail");
		return false;
	end;
	--设置Fields的值
	objMail:SetFields( objSqlCmd );
	--执行命令
	if not objSqlCmd:execute() then
		_info("Insert Item msg To T_Role_Mail Error");
		return false;
	end
	--检查物品是否有物品信息，保存物品信息
	objMail:CheckSaveItem( objDB );
	return true;
end

--接收到运营平台发送邮件的请求，解析参数，然后发送
--mailMsg 的具体信息详见与运营的接口文档
function CMailManager:ParseAndSendMail( mailMsg )
	--print("Recv Mail Msg==================");
	-- for k,v in pairs(mailMsg) do
		-- print(k,v)
	-- end
	local IDs = {};
	if type(mailMsg.role) == "number" then
		table.insert(IDs, mailMsg.role)
	else
		local param = Split( mailMsg.role, "," );
		for k,p in pairs(param) do
			local num = tonumber(p);
			if num  then
				table.insert(IDs, num);
			end
		end
	end
	for k,id in pairs(IDs) do
		local mail = CMail:new();
		mail:SetSender( mailMsg.sender_id, mailMsg.sender );
		mail:SetReceiver( id, "" );
		mail:SetContent( mailMsg.topic, mailMsg.content );
		local lifetime = mailMsg.lifetime or 10*24*3600;
		mail:SetLifeTime( lifetime * 1000 );--传递过来的时间是秒数
		local itemset = self:ParseMailItem( mailMsg );
		mail:SetAccessory( mailMsg.gold, mailMsg.bindgold, mailMsg.money, itemset );
		CMailManager:SendMail( mail );
	end
	--print("Recv Mail Msg==================");
end
--解析字符串
local function Split(str, mark)
	mark = mark or ",";
	local setStr = {};
	local marklen = string.len(mark);
	local slength = string.len(str);
	local index = 0
	local start = 1
	while true do
	    index = string.find(str, mark, start)   -- find 'next' 返回 i 和 j 
	    if index == nil then break end
		local s = string.sub(str, start, index-1)
	    table.insert(setStr, s)
		start = index + marklen;
	end
	if start <= slength then
		local s = string.sub(str, start, slength)
	    table.insert(setStr, s)
	end
	return setStr;
end
--解析出邮件携带的物品信息
function CMailManager:ParseMailItem( mailMsg )
	local itemset = {};
	for k=1,5 do
		local itemstr = mailMsg["item_"..k];
		if itemstr then
			--解析出item字段
			local param = Split( itemstr, "," );
			local paramMsg = {};
			local checkid = false;
			--解析出字段的参数
			for i,p in pairs(param) do
				local pp = Split( p, ":" );
				if pp[2] ~= "" then
					table.insert( paramMsg, pp );
				end
				if pp[1] == "id" and pp[2] ~= "" then
					checkid = true;
				end
			end
			--根据字段的参数设置item的值
			if #paramMsg > 0 and checkid then
				local item = SItemMessage:new();
				item.dwItemNumber = 1;
				item.dwLifeTime = -1;
				for j,pp in pairs(paramMsg) do
					if pp[1] == "id" then
						item.dwItemEnum = tonumber(pp[2]) or 0;
					elseif pp[1] == "num" then
						item.dwItemNumber = tonumber(pp[2]) or 1;
					elseif pp[1] == "bindtype" then
						item.dwBindType = tonumber(pp[2]) or 0;
					elseif pp[1] == "strong" then
						item.setStrongInfo.dwLevel = tonumber(pp[2]) or 0;
					elseif pp[1] == "binghun" then
						item.dwTianSheng = tonumber(pp[2]) or 0;
					elseif pp[1] == "enchase" then
						table.insert(item.setStoneInfo, tonumber(pp[2]) or 0);
					elseif pp[1] == "append" then
						local pmsg = { 
							dwPropertyType = tonumber(pp[2]) or 0;
							dwValue = tonumber(pp[3]) or 0;--这里的数值需要换算成百分比
						};
						table.insert( item.setProperty, pmsg );
					end
				end
				--对property附加属性的数值重新换算成0~100W百分比，因为运营传过来的数值是真正的数值
				if CGlobalItemManager:IsEquip(item.dwItemEnum) then
					local tPropCfg = EquipAppendConfig[CGlobalItemManager:GetPropertyID(item.dwItemEnum)];
					for k,pmsg in pairs(item.setProperty) do
						local strMaxName = PropertyTypeToMinMax[pmsg.dwPropertyType][2];
						if strMaxName then
							local dwMax = tPropCfg[strMaxName];
							if pmsg.dwValue > dwMax then
								pmsg.dwValue = 1000000;
							else
								pmsg.dwValue = (pmsg.dwValue/dwMax)*1000000;
							end
						end
					end
					item.dwItemNumber = 9900;
				end
				table.insert( itemset, item );
			end
		end
	end
	return itemset;
end




