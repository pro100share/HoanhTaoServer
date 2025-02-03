----------------------------------------------------------------------------------------
_G.DB_OPERATOR_SELECT = 1
_G.DB_OPERATOR_INSERT = 2
_G.DB_OPERATOR_UPDATE = 4
_G.DB_OPERATOR_DELETE = 8

local LOGDBSTATISTIC = false
local LogDbStatisticLogPath = nil
local sqlLog = LOGDBSTATISTIC and assert(io.open( LogDbStatisticLogPath , 'a')) or nil
----------------------------------------------------------------------------------------
_G.CSqlCommand = {}
function CSqlCommand:new(szTable,objDB,dwOper)
	local obj = {};
	obj.szTable = szTable;
	obj.dwOper = dwOper;
	obj.objDB = objDB;
	obj.Fields = {};
	obj.Wheres = {};
	setmetatable(obj,{ __index = CSqlCommand });
	return obj;
end
function CSqlCommand:execute()
	local szSql,tbValues;
	if not self.dwOper then
		return
	elseif self.dwOper == DB_OPERATOR_SELECT then
		szSql,tbValues = self:ParseSelectCmd();
		return self.objDB:execute_sync(szSql,unpack(tbValues));
	elseif self.dwOper == DB_OPERATOR_INSERT then
		szSql,tbValues = self:ParseInsertCmd();
		return self.objDB:execute_async(szSql,unpack(tbValues));
	elseif self.dwOper == DB_OPERATOR_UPDATE then
		szSql,tbValues = self:ParseUpdateCmd();
		return self.objDB:execute_async(szSql,unpack(tbValues));
	elseif self.dwOper == DB_OPERATOR_DELETE then
		szSql,tbValues = self:ParseDeleteCmd();
		return self.objDB:execute_async(szSql,unpack(tbValues));
	end
end;
function CSqlCommand:ParseSelectCmd()
	local tbValues = {};
	local dwValues = 1;
	local szSql = string.format('SELECT * FROM "%s" ',self.szTable);
	if pairs(self.Wheres)(self.Wheres) then
		local szWheres = " WHERE ";
		for i,v in pairs(self.Wheres) do
			szWheres = szWheres..'"'..i..'" = $'..dwValues..' AND ';
			dwValues = dwValues + 1;
			table.insert(tbValues,v);
		end
		szWheres = string.sub(szWheres,1,-5);
		szSql = szSql..szWheres;
	end
	return szSql,tbValues;
end;
function CSqlCommand:ParseInsertCmd() 
	local szFields = "";
	local szValues = "";
	local tbValues = {};
	local dwValues = 1;
	for i,v in pairs(self.Fields) do
	    szFields = szFields..'"'..i..'",';
		szValues = szValues..'$'..dwValues..',';
		dwValues = dwValues + 1;
		table.insert(tbValues,v);
	end;
	for i,v in pairs(self.Wheres) do
	    szFields = szFields..'"'..i..'",';
		szValues = szValues..'$'..dwValues..',';
		dwValues = dwValues + 1;
		table.insert(tbValues,v);
	end;
	szFields = string.sub(szFields,1,string.len(szFields)-1);
	szValues = string.sub(szValues,1,string.len(szValues)-1);
	local szSql = 'INSERT INTO "%s" (%s) VALUES(%s);';
	szSql = string.format(szSql,self.szTable,szFields,szValues);
	return szSql,tbValues;
end;
function CSqlCommand:ParseUpdateCmd()
	local szFields = " SET ";
	local tbValues = {};
	local dwValues = 1;
	for i,v in pairs(self.Fields) do
	    szFields = szFields..'"'..i..'" = $'..dwValues..',';
		dwValues = dwValues + 1;
		table.insert(tbValues,v);
	end
	szFields = string.sub(szFields,1,-2);
	local szSql = string.format('UPDATE "%s" ',self.szTable);
	szSql = szSql..szFields;
	if pairs(self.Wheres)(self.Wheres) then
		local szWheres = " WHERE ";
		for i,v in pairs(self.Wheres) do
			szWheres = szWheres..'"'..i..'" = $'..dwValues..' AND ';
			dwValues = dwValues + 1;
			table.insert(tbValues,v);
		end
		szWheres = string.sub(szWheres,1,-5);
		szSql = szSql..szWheres;
	end
	return szSql,tbValues;
end;
function CSqlCommand:ParseDeleteCmd()
	local tbValues = {};
	local dwValues = 1;
	local szSql = string.format('DELETE FROM "%s" ',self.szTable)
	if pairs(self.Wheres)(self.Wheres) then
		local szWheres = " WHERE ";
		for i,v in pairs(self.Wheres) do
			szWheres = szWheres..'"'..i..'" = $'..dwValues..' AND ';
			dwValues = dwValues + 1;
			table.insert(tbValues,v);
		end
		szWheres = string.sub(szWheres,1,-5);
		szSql = szSql..szWheres;
	end
	return szSql,tbValues;
end;
----------------------------------------------------------------------------------------
_G.CSql = {}
function CSql:Connect(tbParam)
	self.tbParam = tbParam;
	local objDB = _sql(
		tbParam.szConnectStr,
		tbParam.szUser,
		tbParam.szPwd,
		120,
		{ database = tbParam.szDBName }
	);
	if not objDB then
		_info("new Sql Error");
		return false;
	end;
	local obj = setmetatable({ objDB = objDB },{ __index = CSql });
	LogDbStatisticLogPath = '../Log/logs/'.."[SQL "..CTimeFormat:todate(_now(1),"%04d-%02d-%02d").."].log"
	sqlLog = LOGDBSTATISTIC and assert(io.open( LogDbStatisticLogPath , 'a')) or nil
	return obj;
end;
function CSql:execute(szSql,...)
	return self:execute_sync(szSql,...);
end;
function CSql:execute_sync(szSql,...)
	self:Valid()
	local tbValues = {...}
	local res,_log = pcall(function() return self.objDB:run(szSql,unpack(tbValues))end)
	if not res then
		if sqlLog then
			sqlLog:write('['..CTimeFormat:todate(_now(1), fmt, quick)..' UTC] ')
			sqlLog:write(szSql..":".._log)
			sqlLog:write('\n')
		else
			print(szSql,_log)
		end
	end
	return res and _log;
end;
function CSql:execute_async(szSql,...)
	self:Valid()
	local tbValues = {...}
	local res,_log = pcall(function() return self.objDB:async(szSql,unpack(tbValues))end)
	if not res then
		if sqlLog then
			sqlLog:write('['..CTimeFormat:todate(_now(1), fmt, quick)..' UTC] ')
			sqlLog:write(szSql..":".._log)
			sqlLog:write('\n')
		else
			print(szSql,_log)
		end
	end
	return res and _log;
end;
function CSql:Valid()
	while self.objDB:closed() do
		local tbParam = self.tbParam
		self.objDB = _sql(
			tbParam.szConnectStr,
			tbParam.szUser,
			tbParam.szPwd,
			120,
			{ database = tbParam.szDBName }
		);
	end
end
function CSql:CreateSelectCmd(szTable)
	return CSqlCommand:new(szTable,self,DB_OPERATOR_SELECT);
end;
function CSql:CreateInsertCmd(szTable)
	return CSqlCommand:new(szTable,self,DB_OPERATOR_INSERT);
end;
function CSql:CreateUpdateCmd(szTable)
	return CSqlCommand:new(szTable,self,DB_OPERATOR_UPDATE);
end;
function CSql:CreateDeleteCmd(szTable)
	return CSqlCommand:new(szTable,self,DB_OPERATOR_DELETE);
end;
----------------------------------------------------------------------------------------