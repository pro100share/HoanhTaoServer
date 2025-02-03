local dwItemId = 7400012
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
	local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()

	local scriptSystem = objPlayer:GetSystem('CScriptSystem');
	if not scriptSystem then
		return nil;
	end	 	
	
	return 2000
end

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local objCurMap = sysMap:GetCurMap()				----获取玩家所在地图
	if not objCurMap then
		return 0;
	end

	local mgrNpc = objCurMap:GetNpcMgr()
	if not mgrNpc then
		return 0;
	end
	
	local scriptSystem = objPlayer:GetSystem('CScriptSystem');
	if not scriptSystem then
		return nil;
	end	
	
	local MapID,Selfx,Selfy = scriptSystem:GetMapPos();	
	
	local waste = {};
	
	--烟花爆竹
	local fire_x = Selfx + 1;
	local fire_y = Selfy + 1;	
	local Data = mgrNpc:Add(10021125,fire_x,fire_y,5.5);   
	table.insert(waste,Data)
	
	local DelNPC = function()
		if objCurMap then
			for k,n in pairs(waste) do
				mgrNpc:Remove(n)
				n = nil;
			end
		end
	end	
	objCurMap:AddTimeEvent( 7*1000, DelNPC)
	
	return false;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )



 