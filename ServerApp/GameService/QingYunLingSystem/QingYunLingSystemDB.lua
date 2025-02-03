--[[
	侠义勋章系统
	曲莹
	2013-07-30
]]--

_G.CQingYunLingSystemDB = {}
function CQingYunLingSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CQingYunLingSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CQingYunLingSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CQingYunLingSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CQingYunLingSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CQingYunLingSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CQingYunLingSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
--插入数据
function CQingYunLingSystemDB:InsertData(sTotalExp)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Role_QingYunLing');
	SqlCmd.Fields.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwLotteryID = "";    --抽奖ID
	SqlCmd.Fields.dwTotalExp = sTotalExp;   --等级
	SqlCmd.Fields.dwNum = 0;   		--次数
	SqlCmd.Fields.dwCount = 1;   		--次数
	SqlCmd:execute();
end;

function CQingYunLingSystemDB:UpdateTotalExp(sTotalExp)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_QingYunLing')
	SqlCmd.Wheres.dwRoleID = dwRoleID;	
	SqlCmd.Fields.dwTotalExp = sTotalExp;
	SqlCmd:execute();
end;

function CQingYunLingSystemDB:UpdateLotteryID(sLotteryID)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_QingYunLing')
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwLotteryID = sLotteryID;
	SqlCmd:execute();
end;
function CQingYunLingSystemDB:UpdateLotteryNum(nNum)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_QingYunLing')
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwNum = nNum;
	SqlCmd:execute();
end;
function CQingYunLingSystemDB:UpdateLotteryCount(nCount)
	local flag, dwRoleID = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_QingYunLing')
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwCount = nCount;
	SqlCmd:execute();
end;
