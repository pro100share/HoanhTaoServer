------------------------------------
------------------------------------
--道具系统数据库操作
--author lkj

_G.CItemSystemDB = {};

function CItemSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CItemSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

--检查系统数据库模块有效性
function CItemSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CItemSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CItemSystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CItemSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CItemSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
---------------------------------------------------------------------
--------------------------玩家道具系统信息相关-----------------------
---------------------------------------------------------------------
local OperSysKeyToStr = {
	[_G.enItemSysUpdOper.eBindGold]			= "dwBindGold";
	[_G.enItemSysUpdOper.eGold	]			= "dwGold";
	[_G.enItemSysUpdOper.ePacketSlotNum]	= "dwPacketSlotNum";
	[_G.enItemSysUpdOper.eStorageSlotNum]	= "dwStorageSlotNum";
	[_G.enItemSysUpdOper.ePacketMoney]		= "dwPacketMoney";
	[_G.enItemSysUpdOper.eStorageMoney]		= "dwStorageMoney";	
	[_G.enItemSysUpdOper.eNextItemID]		= "dwNextItemID";
};
--更新玩家道具系统信息
function CItemSystemDB:UpdateItemSysInfo(operT)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CItemSystemDB:UpdateItemSysInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_ItemSystem");
	SqlCmd.Wheres.dwRoleID = RoleID;
    local bOK = false;
	for k, v in pairs(operT) do
        if k ~= _G.enItemSysUpdOper.eGold then
            bOK = true;
            SqlCmd.Fields[OperSysKeyToStr[k]] = v;
        end;
	end;
	if bOK then
        SqlCmd:execute();
    end;
    
	return true;
end;

--插入新道具
function CItemSystemDB:InsertNewItem(objItem)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CItemSystemDB:InsertNewItem");
		return false;
	end;
	
	if objItem:IsEquip() then
		local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_Item_Equip");
		SqlCmd.Fields.dwItemID			= objItem:GetInstID();
		SqlCmd.Fields.dwRoleID       	= RoleID;
		SqlCmd.Fields.dwPosSlot			= objItem:GetDBPosInfo();
		SqlCmd.Fields.dwItemEnum		= objItem:GetEnumID();
		SqlCmd.Fields.dwItemNumber		= objItem:GetCount();
		SqlCmd.Fields.dwBindType		= objItem:GetBindType();
		SqlCmd.Fields.dwBornTime		= objItem:GetBornTime();
		SqlCmd.Fields.dwLifeTime		= objItem:GetLifeTime();
		SqlCmd.Fields.strDoodle			= objItem:GetDoodle();
		SqlCmd.Fields.strPropertyInfo	= objItem:GetDBProperty();
		SqlCmd.Fields.dwStrongLevel		= objItem:GetStrongLevel();
		SqlCmd.Fields.dwTianSheng		= objItem:GetTianSheng();
		SqlCmd.Fields.dwEndure			= objItem:GetEndure();
		
		SqlCmd:execute()
		return true;
	else
		local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_Item_Normal");
		SqlCmd.Fields.dwItemID			= objItem:GetInstID();
		SqlCmd.Fields.dwRoleID       	= RoleID;
		SqlCmd.Fields.dwPosSlot			= objItem:GetDBPosInfo();
		SqlCmd.Fields.dwItemEnum		= objItem:GetEnumID();
		SqlCmd.Fields.dwItemNumber		= objItem:GetCount();
		SqlCmd.Fields.dwBindType		= objItem:GetBindType();
		SqlCmd.Fields.dwBornTime		= objItem:GetBornTime();
		SqlCmd.Fields.dwLifeTime		= objItem:GetLifeTime();
		SqlCmd.Fields.strDoodle			= objItem:GetDoodle();
		
		SqlCmd:execute()
		return true;
	end;
end;


--删除道具
function CItemSystemDB:DeleteItem(objItem)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CItemSystemDB:DeleteItem");
		return false;
	end;
	
	if objItem:IsEquip() then
		local SqlCmd = self.m_ObjDB:CreateDeleteCmd("T_Role_Item_Equip");
		SqlCmd.Wheres.dwRoleID = RoleID;
		SqlCmd.Wheres.dwItemID = objItem:GetInstID();
		SqlCmd:execute();
		return true;
	else
		local SqlCmd = self.m_ObjDB:CreateDeleteCmd("T_Role_Item_Normal");
		SqlCmd.Wheres.dwRoleID = RoleID;
		SqlCmd.Wheres.dwItemID = objItem:GetInstID();
		SqlCmd:execute();
		return true;
	end;
end;

local OperItemKeyToStr = {
	[_G.enItemUpdOper.eBind]	= "dwBindType";
	[_G.enItemUpdOper.ePosn]	= "dwPosSlot";
	[_G.enItemUpdOper.eStLv]	= "dwStrongLevel";
	[_G.enItemUpdOper.eProp]	= "strPropertyInfo";
	[_G.enItemUpdOper.eTias]	= "dwTianSheng";
	[_G.enItemUpdOper.eDooe]	= "strDoodle";
	[_G.enItemUpdOper.eEdre]	= "dwEndure";
	[98]						= "dwItemEnum";
	[99]						= "dwItemNumber";
};
--更新道具
function CItemSystemDB:UpdateItem(UpdTable)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CItemSystemDB:UpdateItem");
		return false;
	end;
	
	for objItem, operT in pairs(UpdTable) do
		if objItem:IsEquip() then
			local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_Item_Equip");
			SqlCmd.Wheres.dwRoleID = RoleID;
			SqlCmd.Wheres.dwItemID = objItem:GetInstID();
			
			for k, v in pairs(operT) do
				SqlCmd.Fields[OperItemKeyToStr[k]] = v;
			end;
			
			SqlCmd:execute()
		else
			local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_Item_Normal");
			SqlCmd.Wheres.dwRoleID = RoleID;
			SqlCmd.Wheres.dwItemID = objItem:GetInstID();
			for k, v in pairs(operT) do
				SqlCmd.Fields[OperItemKeyToStr[k]] = v;
			end;
			SqlCmd:execute()
		end;
	end;
	return true;
end;



