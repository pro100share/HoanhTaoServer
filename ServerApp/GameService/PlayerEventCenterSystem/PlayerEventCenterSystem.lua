--2012.3.19
--作者：段磊磊
--玩家事件中心系统，接收各类事件行为，转发到需要的系统中去
_G.CPlayerEventCenterSystem = {}
-----------------------------------
function CPlayerEventCenterSystem:new()
	local obj = CSystem:new("CPlayerEventCenterSystem");
	obj.SDataInfo = {}
	obj.SDataInfo.dwKillMonsterNum = 0 		--杀怪数量
	obj.SDataInfo.dwKillPlayerNum = 0 		--杀玩家数量
	obj.SDataInfo.dwLevel = 1 				--等级
	obj.SDataInfo.dwEquipStrongNum = 0 		--强化装备次数
	obj.SDataInfo.dwStoneSetNum = 0 		--宝石镶嵌次数
	obj.SDataInfo.dwMarryDinnerNum = 0		--举行婚宴次数
	obj.SDataInfo.dwAddFriendNum = 0 		--添加好友次数
	obj.SDataInfo.dwDoubleMonkNum = 0 		--双修次数
	obj.SDataInfo.dwMarryNum = 0 			--结婚次数
	obj.SDataInfo.dwUseWeaponNum = 0 		--使用武器次数
	obj.SDataInfo.dwUseJpWeaponNum = 0 		--使用珍品武器次数
	obj.SDataInfo.dwSendExpNum = 0 			--经验赠送次数
	obj.SDataInfo.dwTaskNum = 0 			--完成任务次数
	obj.SDataInfo.dwContinueKillNum = 0		--连斩次数

	for i,v in pairs(CPlayerEventCenterSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CPlayerEventCenterSystem:DoEvent(szParam,...)
--	print('szParam =',szParam)
--	print('enumPlayerEventType[szParam] =',enumPlayerEventType[szParam])
	if not enumPlayerEventType[szParam] then
		_info('no this event'..szParam..' ,please check param')
		return
	end
	for k,System in ipairs (self.objSysMgr.setSystemSque) do
		if System['OnEventCenter'] and type(System['OnEventCenter']) == "function" then
			System:OnEventCenter(szParam,...)
		end
		if System[szParam] and type(System[szParam]) == "function" then
			System[szParam](System,...);
		end;
	end
end
function CPlayerEventCenterSystem:Create()
	return true;
end

function CPlayerEventCenterSystem:Update(dwInterval)	
	return true
end

function CPlayerEventCenterSystem:Destroy()
	return true
end;

function CPlayerEventCenterSystem:OnEnterScene()
	return true
end;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- --数据库类
-- _G.CPlayerEventCenterDBOper = {};
-- function CPlayerEventCenterDBOper:new(objDB,objUser)
    -- local obj = {};
	-- obj.objDBQuery = objDB;
	-- obj.objUser = objUser;   --对应的玩家
	-- for i, v in pairs(CPlayerEventCenterDBOper) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;
	-- return obj;
-- end;

-- function CPlayerEventCenterDBOper:SaveInfo()

	-- if not self.objDBQuery then
		-- _info("self.objDBQuery is null by CPlayerEventCenterDBOper");
		-- return false;
	-- end;
	-- if not self.objUser then
		-- _info("self.objUser is null by CPlayerEventCenterDBOper");
		-- return false;
	-- end;
	
	-- local objPlayer = self.objUser:GetPlayer();
	-- if not objPlayer then
		-- _info("objPlayer is null by CPlayerEventCenterDBOper");
		-- return false;
	-- end;
    -- local dwRoleID = objPlayer:GetRoleID();
	-- if dwRoleID == 0 then
		-- _info("dwRoleID == 0 by CPlayerEventCenterDBOper");
		-- return false;
	-- end;
	
	-- local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_EventCenter');

	-- SqlCmd.Wheres.dwRoleID = dwRoleID
	-- for k,v in pairs (self.objUser.SDataInfo) do
		-- SqlCmd.Fields[k] = v
	-- end
	
	-- SqlCmd:execute()
	-- return true;
-- end
-- function CPlayerEventCenterDBOper:AddInfo(dwRoleID)

	-- local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_EventCenter');
	-- SqlCmd.Fields.dwRoleID				= dwRoleID;			
	-- for k,v in pairs (self.objUser.SDataInfo) do
		-- SqlCmd.Fields[k] = 0
	-- end
	
	-- SqlCmd:execute()
	-- return true;
-- end

----------------------------------------------------------