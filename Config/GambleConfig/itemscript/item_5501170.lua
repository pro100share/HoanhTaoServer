local dwItemId = 5501170
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	local RName = objPlayer:GetName()
	local scriptSystem = objPlayer:GetSystem('CScriptSystem');
	if not scriptSystem then
		return 0;
	end	
	local MapID,x,y = scriptSystem:GetMapPos();		
	if MapID ~= 8090 then
		return 13009200011;
	end	
		
	local t = WarAddition[10070].Base
	if t.MarkTimes == 0 then
		
		local sysMap = objPlayer:GetSystem("CMapSystem")
		local objCurMap = sysMap:GetCurMap()				----获取玩家所在地图
		if not objCurMap then
			return 0;
		end
		
		local mgrMonster = objCurMap:GetMonsterMgr()		----获得怪物管理器
		if not mgrMonster then
			return 0;
		end
			
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		if not sysScript then
			return 0;
		end

		local a = sysScript:GetItemNum(5501170);
		
		if a then 
			CScriptManager:MapNotice(objCurMap,string.format(SysStringConfigInfo[13009200013],RName,x,y))
			
			--计算石破天的战斗ID
			local dwTime = CTimeRewardManager:GetServerStartTime()
			local dwNow = GetCurTime()
			local dwDis = dwNow-dwTime
			local tempFightID = 0
			local Day = math.ceil(dwDis/(1000*60*60*24))
			-- print( "Day=======================",Day )
			if dwDis <= 0 then
				return;
			end	
			tempFightID = WarAddition[10070]:GetMonFightID(3,1,Day)

			mgrMonster:DelayAdd(50760020,tempFightID,50760020,50760020,50760020,x,y,dwObjId,10)
			t.MarkTimes = 1
			return false;
		end
	end	
	
	return 13009200012;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 