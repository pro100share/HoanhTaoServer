--离线角色数据，提供给排行榜用

_G.COfflineInfoManager = CSingle:new();
CSingleManager:AddSingle(COfflineInfoManager);

_G.SOfflineRoleInfo = {};
function SOfflineRoleInfo:new()
	local obj = {};
	obj.dwRoleID = 0;
	obj.dwIncoID = 0;
	obj.dwDefIncoID = 0;
	obj.szName = "";
	obj.dwLevel = 0;
	
	obj.GetIncoID = function()
		local dwIncoID = obj.dwIncoID;
	
		if dwIncoID == 0 then
			dwIncoID = obj.dwDefIncoID;
		end
		
		return dwIncoID;
	end;
	
	return obj;
end;

COfflineInfoManager.setRoleInfoList = {};

function COfflineInfoManager:Create()
	local objDB = CPlayerDBQuery:GetDBQuery()
	if not objDB then
		_err("COfflineInfoManager Create Cannot get DBQuery");
		return false;
	end;
	
	self.objDBQuery = COfflineInfoDB:Create(objDB);
	
end;

function COfflineInfoManager:Update(e)
	
end;

function COfflineInfoManager:Destroy()
	
end;

-------------------------------------------------------------------------------
function COfflineInfoManager:DoneWithLogin(dwRoleID)
	self.setRoleInfoList[dwRoleID] = nil;
end;

function COfflineInfoManager:GetRoleInfo(dwRoleID)
	if not self.setRoleInfoList[dwRoleID] then
		self.setRoleInfoList[dwRoleID] = self.objDBQuery:ReadRoleInfo(dwRoleID);
	end
	return self.setRoleInfoList[dwRoleID];
end;
