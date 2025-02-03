--[[
˵����360����ϵͳ���ݿ�
���ߣ�����
]] 

-- ϵͳ����
_G.C360RedJewelSystemDB = {};

-- @brief ���캯��
-- @param object objDB ���ݿ����
-- @param object objSys ����ϵͳ����
-- @return object ϵͳ����
function C360RedJewelSystemDB:new(objDB, objSys)
	local obj = {}
	obj.objDB = objDB;
	obj.objSys = objSys;
	for i, v in pairs(C360RedJewelSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

-- @brief �������ȡ����
-- @param number dwAccountID �ʺ�ID
-- @param number dwItemIndex ����������
function C360RedJewelSystemDB:InsertReward(dwAccountID, dwItemIndex)
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_360RedJewel');
	SqlCmd.Fields.dwItemIndex = dwItemIndex;
	SqlCmd.Wheres.dwAccountID = dwAccountID;
	SqlCmd:execute()
end
