----------------------------------------------------------------------------
_G.DB_OPERATOR_NONE			= 0
_G.DB_OPERATOR_REGISTER		= 1
_G.DB_OPERATOR_UNREGISTER	= 2
_G.DB_OPERATOR_REGSVR 		= 3
_G.DB_OPERATOR_CHESVR       = 4
_G.DB_OPERATOR_SELECT		= 5
_G.DB_OPERATOR_INSERT		= 8
_G.DB_OPERATOR_UPDATE		= 16
_G.DB_OPERATOR_DELETE		= 32
----------------------------------------------------------------------------

_G.CPlayerDBQuery = {}
_G.CPlayerDBCallBack = {}
function _G.OnDBResult(dwAccountID,nOper,nResCode)
	if nOper == DB_OPERATOR_UNREGISTER then
		CPlayerDBQuery:OnDelAccount(dwAccountID);
	else
		-- print("OnDBResult DB_OPERATOR_REGISTER Error");
	end;
end;
function CPlayerDBQuery:Create()
	return true;
end
function CPlayerDBQuery:AddAccount(dwAccountID,nIsChangeLine) 
	_SendDBCommand({dwAccountID,DB_OPERATOR_REGISTER,nIsChangeLine});
end

function CPlayerDBQuery:DelAccount(dwAccountID,funFinish,nIsChangeLine)
	_info("Account("..dwAccountID..') Write DB Begin',funFinish);
	CPlayerManager:AddSavingAccount(dwAccountID);
	CPlayerDBCallBack[tostring(dwAccountID)] = funFinish; 
	_SendDBCommand({dwAccountID,DB_OPERATOR_UNREGISTER,nIsChangeLine});
end
function CPlayerDBQuery:OnDelAccount(dwAccountID)
	_info("Account("..dwAccountID..') Write DB End');
	local funFinish = CPlayerDBCallBack[tostring(dwAccountID)];
	if funFinish then
		-- print("~~~~~~~~~funFinish Begin~~~~~~~~~~");
        local ok, err = pcall(funFinish);
        if not ok then  _err(err) end;
		-- print("~~~~~~~~~funFinish end~~~~~~~~~~");
	else
		-- print("~~~~~~~~~funFinish Error~~~~~~~~~~");
    end;
	CPlayerDBCallBack[tostring(dwAccountID)] = nil;
	CPlayerManager:DelSavingAccount(dwAccountID);
end
function CPlayerDBQuery:NotifySqlCmd(tbSqlCmd)
	_SendDBCommand(tbSqlCmd);
end
------------------------------------adapter---------------------------------
function CPlayerDBQuery:GetDBQuery()
	return { execute = function() end };
end
----------------------------------------------------------------------------
_G.CPlayerDBCache = {}
function CPlayerDBCache:new(dwAccountID)
	local obj = {};
	obj.dwAccountID = dwAccountID;
	setmetatable(obj,{ __index = CPlayerDBCache });
	return obj;
end
function CPlayerDBCache:CreateInsertCmd(szTable)
	return CPlayerDBSqlCmd:new(self.dwAccountID,DB_OPERATOR_INSERT,szTable);
end
function CPlayerDBCache:CreateUpdateCmd(szTable)
	return CPlayerDBSqlCmd:new(self.dwAccountID,DB_OPERATOR_UPDATE,szTable);
end
function CPlayerDBCache:CreateDeleteCmd(szTable)
	return CPlayerDBSqlCmd:new(self.dwAccountID,DB_OPERATOR_DELETE,szTable);
end
----------------------------------------------------------------------------
_G.CPlayerDBSqlCmd = {}
function CPlayerDBSqlCmd:new(dwAccountID,dwOper,szTable)
	local obj = {
		dwAccountID = dwAccountID,
		dwOper = dwOper,
		szTable = szTable,
	};
	obj.Fields = {};
	obj.Wheres = {};
	setmetatable(obj,{ __index = CPlayerDBSqlCmd });
	return obj;
end
function CPlayerDBSqlCmd:execute()
	local tb = {}
	if not self.dwAccountID then
		_err('DBError','command does not have account id!!!')
		return
	end
	tb[1] = self.dwAccountID
	if not self.dwOper then
		_err('DBError','command does not have operator!!!')
		return
	end
	tb[2] = self.dwOper
	if not self.szTable then
		_err('DBError','command does not have table name!!!')
		return
	end
	local dwTable = DBConfig.TableStN[self.szTable]
	if dwTable then
		tb[3] = dwTable
	else
		_err('DBError','table('..self.szTable..') does not exist!!!')
		return
	end
	local tbIndex = {}
	for k,v in pairs(DBConfig.IndexStN[self.szTable]) do
		local val = self.Wheres[k]
		if val == nil then val = self.Fields[k] end
		if val ~= nil then
			table.insert(tbIndex,{v,val})
		else
			_err('DBError','command does not have prime key('..k..')!!!')
			return
		end
	end
	tb[4] = tbIndex
	local tbField = {}
	for k,v in pairs(DBConfig.FieldStN[self.szTable]) do
		local val = self.Fields[k]
		if val == nil then val = self.Wheres[k] end
		if val ~= nil then
			table.insert(tbField,{v,val})
		end
	end
	tb[5] = tbField
	
	if self.dwOper == DB_OPERATOR_UPDATE and #tbField == 0 then
		_err('DBError','update command does not have field!!!')
		return
	end
	if self.dwOper == DB_OPERATOR_DELETE and #tbField ~= 0 then
		_err('DBError','delete command has field!!!')
		return
	end

	CPlayerDBQuery:NotifySqlCmd(tb)
end
----------------------------------------------------------------------------