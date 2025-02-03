--[[
功能：GM系统
作者：周兴团
时间：2012-4-10
]]

--查找一个表中是否存在某一个值
local TableFind = function( tab, value )
		for k,v in pairs(tab) do
			if v == value then
				return true;
			end
		end
		return false;
	end
--玩家请求开启或者关闭私聊功能
define.RequestGMCommandMsg
{
	user = NONE,
	Args = {};--参数列表
}
when{ user = NONE }
RequestGMCommandMsg = checkUser
when{}
function RequestGMCommandMsg(user, Args)
	local objSys = user:GetSystem("CGMSystem");
	if not objSys then
		--print("RoleID: ", user:GetRoleID(), "RequestGMCommand");
		return; 
	end;
	--print("RoleID: ", user:GetRoleID(), "RequestGMCommand", Args[1]);
	objSys:Execute(Args);
end

_G.CGMSystem = {};

function CGMSystem:new()
	local obj = CSystem:new("CGMSystem");

	for i,v in pairs(CGMSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CGMSystem:Create()
	return true;
end
function CGMSystem:Update(dwInterval)
	if self.setCMDList then
		self.dwCMDCount = self.dwCMDCount + dwInterval;
		if self.dwCMDCount > BeNBCommendConfig.TimeGap then
			self.dwCMDCount = 0;
			local func = self.setCMDList[1];
			table.remove( self.setCMDList, 1 );
			if #self.setCMDList == 0 then
				self.setCMDList = nil;
			end
			if func then
				func();
			end
		end
	end
	return true;
end;
function CGMSystem:Destroy()
	
end
----------------------------------------------------------------------------------------------
--接收GM命令参数，判断id并执行
function CGMSystem:Execute( tabArgs )
	 if (not _G.EnableGMCommand) and (not self:GetPlayer():IsGMAllowed()) then
        print("Role "..self:GetPlayer():GetRoleID().." Request GM ".. tostring(tabArgs[1]) ..",But Not Allowed.@_@");
        return;
	 end
	local id = tabArgs[1];
	if not id then
		_info("CGMSystem:Execute Get Empty Args.");
		return;
	end
	if id == 1 then
		return self:UpdateExp( tabArgs[2] or 50000 );
	elseif id == 2 then
		return self:UpdateMoney( tabArgs[2] or 1, tabArgs[3] or 1000000 );
	elseif id == 3 then
		return self:ClearPack();
	elseif id == 4 then
		return self:FullPulse();
	elseif id == 5 then
		return self:UpdateFightExp( tabArgs[2] or 50000 );
	elseif id == 6 then
		-- return self:FullFiveLevel();
		local objSelf = self:GetPlayer();
		local sysDupl = objSelf:GetSystem("CDuplSystem");
		
		sysDupl:ReqEnterDupl(1085,0,1)
		
		return;
	elseif id == 7 then
		return self:FullZhenQi();
	elseif id == 8 then
		return self:UpdateDefence( tabArgs[2] or 1000 );
	elseif id == 9 then
		return self:UpdateAttack( tabArgs[2] or 1000 );
	elseif id == 10 then
		return self:UpdateHP( tabArgs[2] or 1000 );
	elseif id == 11 then
		return self:UpdateMP( tabArgs[2] or 1000 );
	elseif id == 12 then
		return self:GetItem( tabArgs[2] or 0, tabArgs[3] or 1, tabArgs[4] or 1 );
	elseif id == 13 then
		return self:Move( tabArgs[2] or 0, tabArgs[3] or 0, tabArgs[4] or 0 );
	elseif id == 14 then
		return self:UpdateZQExp( tabArgs[2] or 50000 );
	elseif id == 15 then
		return self:UpdateRank(tabArgs[2]);
	elseif id == 16 then
		return self:AddSkill( tabArgs[2] or 2 );
	elseif id == 17 then
		return self:EquipStrong( tabArgs[2] or 0 );
	elseif id == 18 then
		local addictedSys = self:GetPlayer():GetSystem("CAvoidAddictedSystem");
		return addictedSys:ChangeAddicted();
	elseif id == 19 then
		return self:EquipAppendProperty( tabArgs[2] or 0 );
	elseif id == 20 then
		return self:EquipTianShengFull();
	elseif id == 21 then
		return self:EquipNextLevel();
	elseif id == 22 then
		return self:GetPlayer():GetSystem("CSkillSystem"):ChangeAttr("dwDander", tabArgs[2] or 5000);
	elseif id == 23 then
		return self:UpLevel( tabArgs[2] or 60 );
	elseif id == 24 then
		return self:GetPlayer():GetSystem("CBuffSystem"):DeleteAllBuff();
	elseif id == 25 then
		return self:GetPlayer():GetSystem("CAuthoritySystem"):GetAllAuthority();
	elseif id == 26 then
		return self:GetPlayer():GetSystem("CMissionDailySystem"):AddActivePoint(tabArgs[2] or 100);
	elseif id == 27 then
		return CKernelApp.TGCFMgr_Add_EquipUpGrade_GM_Msg{Value = tabArgs[2]};
	elseif id == 28 then
		return CKernelApp.TGCFMgr_Add_MountUpGrade_GM_Msg{Value = tabArgs[2]};
	elseif id == 29 then
		return CKernelApp.TGCFMgr_Add_JingJieUp_GM_Msg{Value = tabArgs[2]};
	elseif id == 30 then
		return CKernelApp.TGCFMgr_Add_AmuletUpGrade_GM_Msg{Value = tabArgs[2]};
	elseif id == 31 then
		return self:GetPlayer():GetSystem("CTaskSystem"):DoAccept(tabArgs[2],tabArgs[3],tabArgs[4]);
	elseif id == 32 then
		return self:BeNB();
	elseif id == 33 then
		return CReloadManager:ReloadFile(tabArgs[2]);
	elseif id == 34 then
		return self:GetPlayer():GetSystem("CScriptSystem"):AddMonSP(tabArgs[2],tabArgs[3],tabArgs[4],tabArgs[5],tabArgs[6],tabArgs[7],tabArgs[8],tabArgs[9],tabArgs[10])
	elseif id == 35 then
		return CMonsterFun:GMBornMonster()
	elseif id == 36 then
		return CKernelApp.TGCFMgr_Add_SwordUpGrade_GM_Msg{Value = tabArgs[2]};
	elseif id == 37 then
		return self:GetPlayer():GetSystem("CSwordSystem"):SetSwordInfoGM(tabArgs[2] or 7);
	elseif id == 38 then
		return CMailManager:SendConfigMail( tabArgs[2] or 900050001, self:GetPlayer():GetRoleID(), self:GetPlayer():GetInfo().szRoleName );
	elseif id == 39 then
		return self:GetPlayer():GetSystem("CTaskSystem"):DoGMClear();
	elseif id == 40 then
		return self:GetPlayer():GetSystem("CTaskSystem"):DoComplete(tabArgs[2],tabArgs[3],tabArgs[4]);
	elseif id == 41 then
		if tabArgs[2] then
			local objSkl = self:GetPlayer():GetSystem("CSkillSystem").setAllSkill[tabArgs[2]];
			if objSkl then
				objSkl:AddSkillKnowValue(99999999)
			end
		else
			return self:GetPlayer():GetSystem("CSkillSystem"):SkillKnowledgeMax();
		end
	elseif id == 42 then
		return self:AddSpeed(tabArgs[2] or 0);
	elseif id == 43 then
		return self:GetPlayer():GetSystem("CScriptSystem"):FlyTo(tabArgs[2])
	elseif id == 51 then
		return CGuildServerMsg:NotifyKernel("AppointLeader",tabArgs[2],tabArgs[3])
	elseif id == 52 then
		local sysDupl = self:GetPlayer():GetSystem("CDuplSystem")
		if sysDupl then
			sysDupl:TryExitCurDupl()
		end
	elseif id == 53 then
		self:AddChartRole();
	end
end--变得更加NB
function CGMSystem:BeNB()
	if self.dwCMDCount then
		return;--当前在线拒绝重复执行命令
	end
	--执行第一波命令，其他命令按照时间顺序，在Update中执行
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	itemSys:GM_ExtendPacket();
	self.dwCMDCount = BeNBCommendConfig.TimeGap;
	self.setCMDList = {};
	local dwProf = self:GetPlayer():GetInfo().dwProf;
	for k=1, BeNBCommendConfig.WaveCount do
		local func = function()
			--local dwTime = os.now();
			--print("===LiuBuZuiNiuBi===", dwTime);
			local cmdlist = BeNBCommendConfig[k];
			for i,cmd in pairs(cmdlist) do
				if cmd[1] == 0 or cmd[1] == dwProf then--不区分职业
					local args = {};
					for j=2,#cmd do
						table.insert( args, cmd[j] );
					end
					self:Execute( args );
				end
			end
			--print("===LiuBuZuiNiuBi===", os.now(), os.now() - dwTime);
		end
		table.insert(self.setCMDList, func);
	end
end
--将玩家升到某一个等级
function CGMSystem:UpLevel( dwLevel )
	----print("Role "..self:GetPlayer():GetRoleID(), "GM UpLevel:", dwLevel);
	if dwLevel <= 0 or dwLevel <= self:GetPlayer():GetLevel() then
		return;
	end
	local maxLevel = RoleUpLevelConfig.dwMaxLevel or 60;
	if dwLevel > maxLevel then
		dwLevel = maxLevel;
	end
	dwLevel = math.modf(dwLevel);
	local dwexp = RoleUpLevelConfig[dwLevel].dwExp;
	local currExp = self:GetPlayer().sRoleInfo.dwExp;
	dwexp = dwexp - currExp;
	return self:GetPlayer():AddExp(dwexp);
end
--当前穿戴的装备升级到下一级
function CGMSystem:EquipNextLevel()
	--print("Role "..self:GetPlayer():GetRoleID(), "GM EquipNextLevel:", dwQuality );
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	itemSys:GM_EquipUpGrade();
end
--装备的天生属性全满
function CGMSystem:EquipTianShengFull()
	--print("Role "..self:GetPlayer():GetRoleID(), "GM EquipAppendProperty:", dwQuality );
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	itemSys:GM_EquipTianSheng(_G.IntensifyBornPropConfig.MaxIntensifyValue);
end
--装备添加附加属性条数
function CGMSystem:EquipAppendProperty( dwQuality )
	if dwQuality < 0 then
		dwQuality = 0;
	end
	if dwQuality > 3 then
		dwQuality = 3;
	end
	-- if dwQuality > 4 then
		-- dwQuality = 4;
	-- end
	--print("Role "..self:GetPlayer():GetRoleID(), "GM EquipAppendProperty:", dwQuality );
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	itemSys:GM_EquipQuality(dwQuality);
end
--强化装备到某个等级
function CGMSystem:EquipStrong( dwLevel )
	if dwLevel < 0 then
		dwLevel = 0;
	end
	if dwLevel > 15 then
		dwLevel = 15;
	end
	----print("Role "..self:GetPlayer():GetRoleID(), "GM EquipStrong:", dwLevel );
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	itemSys:GM_EquipStrong(dwLevel);
end
--提升经验
function CGMSystem:UpdateExp( dwValue )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM UpdateExp:", dwValue);
	return self:GetPlayer():AddExp(dwValue);
end
--提升金钱
function CGMSystem:UpdateMoney( dwType, dwValue )
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	if dwType == 1 then
		if dwValue > 0 then
			return itemSys:AddPacketMoney(dwValue, _G.ItemSysOperType.GM);
		else--cost应该传入正数参数
			return itemSys:CostPacketMoney(- dwValue, _G.ItemSysOperType.GM);
		end;
	elseif dwType == 2 then
		if dwValue > 0 then
			return itemSys:AddBindGold(dwValue, _G.ItemSysOperType.GM);
		else--cost应该传入正数参数
			return itemSys:CostBindGold(- dwValue, _G.ItemSysOperType.GM);
		end;
	elseif dwType == 3 then
		if dwValue > 0 then
			return itemSys:AddGold(dwValue, _G.ItemSysOperType.GM);
		else--cost应该传入正数参数
			return itemSys:CostGold(- dwValue, _G.ItemSysOperType.GM);
		end;
	end
end
--清空背包
function CGMSystem:ClearPack()
	--print("Role "..self:GetPlayer():GetRoleID(), "GM ClearPack");
	--local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	--itemSys:ClearPacket();--"deletebygm"
end
--冲脉全满
function CGMSystem:FullPulse()
	--print("Role "..self:GetPlayer():GetRoleID(), "GM FullPulse");
	return self:GetPlayer():GetSystem('CPulseSystem'):GMFinishPulse();
end
--增加实战经验
function CGMSystem:UpdateFightExp( dwValue )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM UpdateFightExp:", dwValue);
	return self:GetPlayer():GetSystem('CBournSystem'):AddBournExp(dwValue);
end
--五行等级全满
function CGMSystem:FullFiveLevel()
	--print("Role "..self:GetPlayer():GetRoleID(), "GM FullFiveLevel");
	return self:GetPlayer():GetSystem('CFiveElemSystem'):GMFinishElem();
end
--五行真气全满
function CGMSystem:FullZhenQi()
	--print("Role "..self:GetPlayer():GetRoleID(), "GM FullZhenQi");
	return self:GetPlayer():GetSystem('CFiveElemSystem'):GMFullElem();
end
--防御提升
function CGMSystem:UpdateDefence( dwValue )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM UpdateDefence:", dwValue);
	--return self:GetPlayer():GetSystem("CSkillSystem"):ChangeAttr("dwDefense",dwValue);
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyGMCommand("UpdateDefence",{dwDefense=dwValue},false)
end
--攻击提升
function CGMSystem:UpdateAttack( dwValue )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM UpdateAttack:", dwValue);
	--return self:GetPlayer():GetSystem("CSkillSystem"):ChangeAttr("dwAttack",dwValue);
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyGMCommand("UpdateAttack",{dwAttack=dwValue},false)
end
--增加HP
function CGMSystem:UpdateHP( dwValue )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM UpdateHP:", dwValue);
	return self:GetPlayer():GetSystem("CSkillSystem"):ChgHP(dwValue,false,-1,0);
end
--增加MP
function CGMSystem:UpdateMP( dwValue )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM UpdateMP:", dwValue);
	return self:GetPlayer():GetSystem("CSkillSystem"):ChgMP(dwValue,false,-1,0);
end
--获得物品
function CGMSystem:GetItem( dwItemEnum, dwNumber, dwPosition )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM GetItem:", dwItemEnum, dwNumber );
	local itemSys = self:GetPlayer():GetSystem("CItemSystem");
	local posSet = {
		[1] = enItemPosition.ePacket;
		[2] = enItemPosition.eStorage;
		[7] = enItemPosition.eTaskRoom;
		[8] = enItemPosition.eAmulet;
	};
	dwPosition = posSet[dwPosition] or 1;
	if dwPosition ~= enItemPosition.ePacket then _err() return end;
	local tabAddPackList = {};
	table.insert(tabAddPackList,{dwItemEnum=dwItemEnum,dwItemNumber=dwNumber})
	return itemSys:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.GM);
end
--移动坐标
function CGMSystem:Move( dwMapID, x, y )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM Move:", dwMapID, x, y );
	return self:GetPlayer():GetSystem("CMapSystem"):ExecTransforMapXY(dwMapID,x,y,nil);
end
--坐骑的经验
function CGMSystem:UpdateZQExp( dwValue )
	--print("Role "..self:GetPlayer():GetRoleID(), "GM UpdateZQExp:", dwValue );
	return self:GetPlayer():GetSystem("CMountSystem"):AddExp_GM(dwValue);
end
--更新排行榜
function CGMSystem:UpdateRank(nID)
	return CChartManager:UpdateChartData(nID);--更新排行榜
end
--添加技能
function CGMSystem:AddSkill(dwSkillID)
	return self:GetPlayer():GetSystem("CSkillSystem"):DoAddSkill(dwSkillID);
end
--设置速度
function CGMSystem:AddSpeed(dwValue)
	self:GetPlayer():GetSystem("CSkillSystem"):NotifyGMCommand("UpdateAttack",{dwMoveSpeed=dwValue},false)
end
--增加排行榜角色
function CGMSystem:AddChartRole()
	self:GetPlayer():GetSystem("CChartSystem"):NotifyChartData();
end