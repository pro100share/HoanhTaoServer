--[[
功能：邮件数据库操作，主要存取玩家邮件信息
类型：
作者：周兴团
时间：2012-4-20
]]
_G.CMailSystemDBQuery = {};
--构造函数
function CMailSystemDBQuery:new( objDB, objMailSys )
	local obj = {};
	obj.objDB = objDB;				--对应的'数据库操作'对象
	obj.objMailSys = objMailSys;	--对应的玩家ItemSystem的对象
	for i, v in pairs(CMailSystemDBQuery) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
--获取自己的ID
function CMailSystemDBQuery:GetRoleID()
	if self.objMailSys then
		return self.objMailSys:GetPlayer():GetRoleID();
	else
		return 0;
	end
end
--加载玩家所有的邮件信息
function CMailSystemDBQuery:LoadMailInfo( setMails, dwRoleID )
	dwRoleID = dwRoleID or self:GetRoleID();
	local selStr = 'select * from "T_Role_Mail" where "dwReceiver" = $1 ';
	local dbres = self.objDB:execute( selStr, dwRoleID );
	dbres = dbres or {};
	--创建Mail对象
	for index,Row in pairs(dbres) do
		local objMail = CMail:new();
		objMail:FillByDBData( Row );
		setMails[objMail:GetMailID()] = objMail;
	end
	if self.objMailSys then
		return self.objMailSys:CheckMail();
	end
	-- 检查邮件的数量，删除多余的邮件
	-- self.objMailSys:CheckMailLimited();
	-- 检查Mail中是否有物品信息
	-- for dwMailID,objMail in pairs(setMails) do
		-- objMail:CheckLoadItem();
	-- end
end
--保存玩家所有的邮件信息
function CMailSystemDBQuery:SaveMailInfo( setMails )
	for dwMailID,objMail in pairs(setMails) do
		self:UpdateMail( objMail );
	end
end
--增加一个邮件信息
function CMailSystemDBQuery:InsertMail( objMail )
	--保存数据，使用Insert命令增加一条数据库的记录
	local objSqlCmd = self.objDB:MakeRecord('T_Role_Mail');
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
	objMail:CheckSaveItem( self.objDB );
	return true;
end
--删除一个邮件
function CMailSystemDBQuery:DeleteMail( dwMailID )
	--local delStr = 'delete from "T_Role_Mail" where "dwMailID" = $1';
	--return self.objDB:execute(delStr, dwMailID);
	local objSqlCmd = self.objDB:CreateDeleteCmd('T_Role_Mail');
	objSqlCmd.Wheres.dwMailID = dwMailID
	objSqlCmd.Wheres.dwReceiver = self:GetRoleID()
	if objSqlCmd == nil then 
		_info("objSqlCmd == nil by CMailSystemDBQuery:DeleteMail");
		return false;
	end;
	--执行命令
	if not objSqlCmd:execute() then
		--_info("CMailSystemDBQuery:DeleteMail Error");
		return false;
	end
	return true;
end
--更新一个邮件
function CMailSystemDBQuery:UpdateMail( objMail )
	--保存数据，使用Update命令更新一条数据库的记录
	local objSqlCmd = self.objDB:CreateUpdateCmd('T_Role_Mail');
	if objSqlCmd == nil then 
		_info("objSqlCmd == nil by CMailSystemDBQuery:UpdateMail");
		return false;
	end;
	objSqlCmd.Wheres.dwMailID = objMail:GetMailID()
	objSqlCmd.Wheres.dwReceiver = objMail:GetInfo().dwReceiver
	--设置Fields的值
	objMail:SetFields( objSqlCmd );
	--执行命令
	if not objSqlCmd:execute() then
		--_info("Update Mail msg To T_Role_Mail Error");
		return false;
	end
	return true;
end
--更新一个邮件的已读状态
function CMailSystemDBQuery:UpdateMailReadState( objMail )
	--保存数据，使用Update命令更新一条数据库的记录
	local objSqlCmd = self.objDB:CreateUpdateCmd('T_Role_Mail');
	if objSqlCmd == nil then 
		_info("objSqlCmd == nil by CMailSystemDBQuery:UpdateMail");
		return false;
	end;
	objSqlCmd.Wheres.dwMailID = objMail:GetMailID()
	objSqlCmd.Wheres.dwReceiver = objMail:GetInfo().dwReceiver
	--设置Fields的值
	objSqlCmd.Fields.dwReadState = objMail:GetInfo().dwReadState;
	--执行命令
	if not objSqlCmd:execute() then
		--_info("Update Mail msg To T_Role_Mail Error");
		return false;
	end
	return true;
end
--加载一个邮件信息
function CMailSystemDBQuery:LoadMail( dwMailID )
	local selStr = 'select * from "T_Role_Mail" where "dwMailID" = $1';
	local dbres = self.objDB:execute(selStr, dwMailID);
	--local objDBData = CItemDataInDB:new();
	local objMail = CMail:new();
	for nIndex,Row in pairs(dbres) do
		objMail:FillByDBData( Row );
		setMails[objMail:GetMailID()] = objMail;
		return objMail;
	end
	return nil;
end











