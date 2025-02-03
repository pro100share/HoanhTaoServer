--[[
�ļ���BaseService/PlayerManager.lua
������CPlayerManager
����˵�����������ϵ�������ҵĹ�����
��ע��
���ߣ��ܻ���
�汾��v1.0
�޸��ߣ�
]]


_G.CPlayerManager = {}
local szDBName = "T_Server_Info"
function CPlayerManager:Create()
	local minRoleID = CConfig.RoleDB.dwDBRoleMaxCount * CConfig.Network.dwServerHostID;
    local maxRoleID = minRoleID + CConfig.RoleDB.dwDBRoleMaxCount;
    
    local dwMaxRoleID;
	local resInfo = CPlayerDBQuery:execute('select max("dwRoleID") from "T_Role_Info" where "dwRoleID" > $1 and "dwRoleID" < $2', minRoleID, maxRoleID);
	if resInfo and resInfo[1].max then
        dwMaxRoleID = resInfo[1].max;
    else
		dwMaxRoleID = minRoleID + 1;
	end;
	self.dwCurRoleID = dwMaxRoleID;
	self.dwStartTime = 0;
		
	local selStr = [[select * from "]]..szDBName..[[" where "dwServerHostID" = $1;]];
	local Info = CPlayerDBQuery:execute(selStr,CConfig.Network.dwServerHostID);
	if Info then
		self.dwStartTime = Info[1].dwStartTime;
	end
    self.setAllPlayer = {};
    self.dwAccountCount = 0;
    
    return true;
end; 

--����һ�����
function CPlayerManager:CreatePlayer(dwAccountID, dwAdultFlag)
	local dwGold, bIsGM = CLoginService:GetGoldByAccountID(dwAccountID);
--	print("bIsGMbIsGMbIsGM",bIsGM);
	if dwGold < 0 then
		_err('dwGold < 0 error:',dwAccountID);
		return nil;
	end;
	local objPlayer = CPlayer:new(dwAccountID, CPlayerDBQuery, dwAdultFlag, dwGold, bIsGM);
	if objPlayer == nil then
	    _info('Create Player Obj Error');
		return nil;
	end;
	return objPlayer;
end;

 
function CPlayerManager:GetCurRoleID()
	self.dwCurRoleID = self.dwCurRoleID + 1;
	return self.dwCurRoleID;
end;

--���һ�����
function CPlayerManager:AddPlayer(objPlayer, IP,UF) 
	-- print('addplayer uf =',UF)
	if not objPlayer:Create(IP,UF) then
		_info('Player Do Create Func Error');
		return nil;
	end;
	self.setAllPlayer[objPlayer:GetAccountID()] = objPlayer;
    self.dwAccountCount = self.dwAccountCount + 1;
    --print("===dwAccountCount====", self.dwAccountCount);
	return objPlayer;
end;

--ɾ��һ����ң��������
function CPlayerManager:DelPlayer(dwAccountID)
    self.setAllPlayer[dwAccountID] = nil;
    self.dwAccountCount = self.dwAccountCount - 1;
    --print("===dwAccountCount====", self.dwAccountCount);
end;


function CPlayerManager:GetPlayer(dwAccountID)
	return self.setAllPlayer[dwAccountID];
end;

