local dwItemId = 7400015
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local SceneTable = {
	[1001] = { Map_name = "丘山村"},
	[1002] = { Map_name = "襄阳城"},
	[1003] = { Map_name = "襄阳野郊"},
	[1004] = { Map_name = "桃花岛"},
	[1005] = { Map_name = "绝情密涧"},
	[1006] = { Map_name = "大理"},
	[1007] = { Map_name = "白驼山"},
	[1008] = { Map_name = "终南山"},
	[1009] = { Map_name = "丐帮竹林"},
	[1010] = { Map_name = "华山"},
	[1011] = { Map_name = "嵩山"},
	[1012] = { Map_name = "昆仑山"},
	[1013] = { Map_name = "黑水遗迹"},
	[1102] = { Map_name = "太守府"},
	[1103] = { Map_name = "野郊密境"},
	[1104] = { Map_name = "桃花密境"},
	[1105] = { Map_name = "绝情密境"},
	[1106] = { Map_name = "大理密境"},
	[1107] = { Map_name = "白驼密境"},
	[1108] = { Map_name = "终南密境"},
	[1109] = { Map_name = "竹林密境"},
	[1110] = { Map_name = "华山密境"},
	[1111] = { Map_name = "嵩山密境"},
	[1112] = { Map_name = "昆仑密境"},
};

local function GetCurMapName( mapID )
	return SceneTable[mapID].Map_name;
end

--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
	local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")

	local scriptSystem = objPlayer:GetSystem('CScriptSystem');
	if not scriptSystem then
		return nil;
	end	 	

	local objCurMap = sysMap:GetCurMap()				----获取玩家所在地图
	if not objCurMap then
		return nil;
	end
	
	local mgrMonster = objCurMap:GetMonsterMgr()		----获得怪物管理器
	if not mgrMonster then
		return nil;
	end

	local MapID,Selfx,Selfy = scriptSystem:GetMapPos();	
	
	if (MapID == 1001) or (MapID == 1002) or (MapID == 1003) or (MapID == 1004) or (MapID == 1005)
		or (MapID == 1006) or (MapID == 1007) or (MapID == 1008) or (MapID == 1009) or (MapID == 1010)
		 or (MapID == 1011) or (MapID == 1012) or (MapID == 1013) or (MapID == 1102) or (MapID == 1103)
		  or (MapID == 1104) or (MapID == 1105) or (MapID == 1106) or (MapID == 1107) or (MapID == 1108)
		   or (MapID == 1109) or (MapID == 1110) or (MapID == 1111) or (MapID == 1112) then
		
		--如果目标是玩家
		local IsTargetPlayer,dwTargetPlayerID = scriptSystem:IsLockPlayer()	
		--如果目标是怪物
		local IsTargetMonster,dwTargetMonsterID = scriptSystem:IsLockMonster()	

		if IsTargetPlayer then	
			--获得目标玩家的信息
			local TargetSysScript = scriptSystem:GetScriptByRoleID(dwTargetPlayerID)
			local TargetMapID,Targetx,Targety = TargetSysScript:GetMapPos();

			if (Selfx-Targetx)^2 + (Selfy-Targety)^2 < 25 then
				return 2000;
			else
				objItemSys:OnError(4000120054);
				return nil;
			end		
		elseif IsTargetMonster then
			--获得怪物指针
			local objTarMonster = mgrMonster:GetMonsterInfo(dwTargetMonsterID)	
			if not objTarMonster then
				return 4000120051; 
			end			
			
			--获取目标怪物的名字
			local monName = objTarMonster:GetName()	
			local Pos = objTarMonster:GetVectorPos()
			local MonsterX,MonsterY = Pos.x,Pos.y;	
			if (Selfx-MonsterX)^2 + (Selfy-MonsterY)^2 < 25 then
				return 2000;
			else
				objItemSys:OnError(4000120054);
				return nil;
			end				
		else
			objItemSys:OnError(4000120051);
			return nil;
		end		
	else
		objItemSys:OnError(4000120053);
		return nil;
	end
	
	return nil
end

local function FreeCracker(Selfx,Selfy,Targetx,Targety,selfName,targeName,mgrNpc,MapID,objCurMap,mgrMonster,objPlayer)
	if (Selfx-Targetx)^2 + (Selfy-Targety)^2 < 25 then
		local waste = {};
		--烟花爆竹
		local fire_x = (Selfx + Targetx)/2;
		local fire_y = (Selfy + Targety)/2;
		local Data = mgrNpc:Add(10021128,fire_x,fire_y,5.5);     
		local mapName = GetCurMapName(MapID);
		CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[4000120052],selfName,mapName,targeName,selfName,targeName,mapName,fire_y,fire_y,selfName),1,true)
		table.insert(waste,Data)
		
		local DelNPC = function()
			if objCurMap then
				for k,n in pairs(waste) do
					mgrNpc:Remove(n)
					n = nil;
				end
			end
		end	
		objCurMap:AddTimeEvent( 120*1000, DelNPC)
		
		-- 几率出BOSS
		local dwRand = math.random(10000)
		if dwRand <= 3000 then
			local boss_x = (Selfx + Targetx)/2;
			local boss_y = (Selfy + Targety)/2;		
			local dwMyLevel = objPlayer:GetLevel();
			mgrMonster:Add(50750002,(61000+dwMyLevel),50750002,30000010,507520010,boss_x,boss_y,dwDelay)
			CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[4000120055],selfName,mapName,Selfx,Selfy),1,true)
		end
	else
		return 4000120054;
	end
end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	-- local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	-- local objCurMap = CMapManager:GetMap(dwMapId);
	local objCurMap = sysMap:GetCurMap()				----获取玩家所在地图
	if not objCurMap then
		return 0;
	end
	
	local mgrMonster = objCurMap:GetMonsterMgr()		----获得怪物管理器
	if not mgrMonster then
		return 0;
	end
	

	local mgrNpc = objCurMap:GetNpcMgr()
	if not mgrNpc then
		return 0;
	end
	
	local scriptSystem = objPlayer:GetSystem('CScriptSystem');
	if not scriptSystem then
		return 0;
	end
	
	--获得玩家自己的信息
	local selfName = objPlayer:GetName()	
	local MapID,Selfx,Selfy = scriptSystem:GetMapPos();	
	
	
	--如果目标是玩家
	local IsTargetPlayer,dwTargetPlayerID = scriptSystem:IsLockPlayer()	
	--如果目标是怪物
	local IsTargetMonster,dwTargetMonsterID = scriptSystem:IsLockMonster()	
	
	if IsTargetPlayer then	
		--获得目标玩家指针
		local objTarPlayer  = CPlayerManager:GetPlayerByRoleID(dwTargetPlayerID)
		if not objTarPlayer then
			return 4000120051;
		end	
		--获得目标玩家的信息
		local TargetSysScript = scriptSystem:GetScriptByRoleID(dwTargetPlayerID)
		local TargetMapID,Targetx,Targety = TargetSysScript:GetMapPos();
		local targeName = objTarPlayer:GetName()	
		--释放烟花
		FreeCracker(Selfx,Selfy,Targetx,Targety,selfName,targeName,mgrNpc,MapID,objCurMap,mgrMonster,objPlayer)
	elseif IsTargetMonster then
		--获得怪物指针
		local objTarMonster = mgrMonster:GetMonsterInfo(dwTargetMonsterID)	
		if not objTarMonster then
			return 4000120051; 
		end				
		--获取目标怪物的名字
		local monName = objTarMonster:GetName()	
		local Pos = objTarMonster:GetVectorPos()
		local MonsterX,MonsterY = Pos.x,Pos.y;	
		--释放烟花
		FreeCracker(Selfx,Selfy,MonsterX,MonsterY,selfName,monName,mgrNpc,MapID,objCurMap,mgrMonster,objPlayer)		
	else
		objItemSys:OnError(4000120051);
		return 0;	
	end
	
	return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )



 