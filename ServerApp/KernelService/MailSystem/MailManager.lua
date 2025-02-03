--[[
功能：邮件系统单件管理器
作者：周兴团
时间：2012-7-10
]]
_G.SItemMessage = {};
function SItemMessage:new( oobj )
	local obj = oobj or {};
	--obj.dwItemID = 0;			--记录物品的ID
	--obj.dwRoleID = 0;			--记录物品所属角色的ID
	--obj.dwHolder = 0;			--代码约定的物品位置信息，仓库、背包等
	--obj.dwSlot = 0;				--物品所属仓库或背包的分页数--物品在背包中当前页的顺序，左右、上下数	
	obj.dwItemEnum = 0;			--代码约定的具体物品的枚举，物品类型
	obj.dwItemNumber = 0;		--物品的数量，从1到最大值（代码约定）
	obj.dwBindType = 0;			--代码约定的物品绑定类型
	obj.setProperty = {};		--物品的附加属性Type和value，格式：{ [1] = { dwPropertyType, dwValue }  }
	obj.dwStrongLevel = 0;
	obj.dwTianSheng = 0;		--天生属性信息
	--obj.dwBornTime = 0;			--物品出生的时间
	obj.dwLifeTime = 0;			--物品生命的最大时间
	obj.sDoodle	= "";
	return obj;
end
define.GSRequestMailIDMsg
{
	user = NONE;
	Line = 0;	--线的ID
	Param = 0;	--物品的数量
}
when{}
function GSRequestMailIDMsg(user,Line,Param)
	CMailManager:HandleRequest( Line, Param );
end

--添加
define.GSSendMailOnIDMsg
{
	user = NONE;
	dwMailID = 0;	--邮件ID
	dwRoleID = 0;	--收件人
	szName = '';	--邮件名(可以空)
}
when{}
function GSSendMailOnIDMsg(user,dwMailID,dwRoleID,szName)
	CMailManager:SendConfigMailNow( dwMailID, dwRoleID, szName )
end

define.GSSendMailMsg
{
	user = NONE;
	MailMsg = {}
}
when{}
function GSSendMailMsg(user,MailMsg)
	local objMail = CMail:new();
	objMail.sInfo = MailMsg;
	CMailManager:SendMail( objMail )
end




_G.CMailManager = CSingle:new();
CSingleManager:AddSingle(CMailManager,true);
CMailManager.dwMailSequence = 0;--邮件的ID序列
CMailManager.dwItemSequence = 0;--邮件的物品ID序列
CMailManager.ttMailWaitList = {}


function CMailManager:Create()
	self:GetItemSequence();
	self:GetMailSequence();
end
function CMailManager:Update(dwInterval)
	if self.ttMailWaitList[1] then
		local objMail = self.ttMailWaitList[1][1]
		local dwTime = self.ttMailWaitList[1][2]
		if _now() - dwTime > 30000 then
			table.remove(self.ttMailWaitList,1)
			self:SendMailNow( objMail );
		end
	end
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

--处理GS获取ID的请求
function CMailManager:HandleRequest( dwLine, dwCount )
	local objLine = CGameLineManager:GetLine(dwLine);
	if objLine then
		local p = {};
		table.insert( p, self:GetNextMailID() );
		for k=1,dwCount do
			table.insert( p, self:GetNextItemID() );
		end
		objLine.KSOnSendBackMailIDMsg{ Param=p };
	end
end

--发送一封配置表的邮件，只需要传入邮件的配置ID，和邮件接收人，szName可以为空
function CMailManager:SendConfigMail( dwConfigID, dwRoleID, szName, bSendNow )
	self:SendConfigMailNow( dwConfigID, dwRoleID, szName );
end

--发送一封邮件，邮件先进入队列，等到KS返回邮件和物品的ID之后再发送
function CMailManager:SendMail( objMail )
	table.insert(self.ttMailWaitList,{objMail,_now()})
end

--发送一封配置表的邮件，只需要传入邮件的配置ID，和邮件接收人，szName可以为空
function CMailManager:SendConfigMailNow( dwConfigID, dwRoleID, szName )
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
	CMailManager:SendMailNow( mail );
end
--
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
function CMailManager:SendMailNow( objMail )
	local Param = {};
	local dwCount = objMail:GetItemCount();
	table.insert( Param, self:GetNextMailID() );
	for k=1,dwCount do
		table.insert( Param, self:GetNextItemID() );
	end
	self:DoSendMail( objMail, Param );
end
--发送邮件
function CMailManager:DoSendMail( objMail, Param )
	local sInfo = objMail:GetInfo();
	sInfo.dwReceiveTime = _now();--设置接收时间
	objMail:SetID( Param );
	self:InsertMail( objMail );
	local objPlayer = CPlayerManager:GetPlayerByRoleID( objMail:GetInfo().dwReceiver );
	if objPlayer then
		objPlayer.KSNoticeMailMsg{MailMsg=objMail.sInfo}
	end
end
--------------------------------------------------------------------------------------------------------
--内部使用函数
--保存一封邮件到数据库
function CMailManager:InsertMail( objMail )
	local objDB = CPlayerDBQuery:GetDBQuery();
	--保存数据，使用Insert命令增加一条数据库的记录
	local SqlCmd = objDB:CreateInsertCmd('T_Role_Mail');
	if SqlCmd == nil then 
		_info("SqlCmd == nil by CMailSystemDBQuery:InsertMail");
		return false;
	end;
	--设置Fields的值
	objMail:SetFields( SqlCmd );
	--执行命令
	if not SqlCmd:execute() then
		_info("Insert Item msg To T_Role_Mail Error");
		return false;
	end
	--检查物品是否有物品信息，保存物品信息
	objMail:CheckSaveItem( objDB );
	return true;
end


