local dwItemId = 7100178
local ItemScriptObj = {}
setmetatable(ItemScriptObj, {__index = CItemScript});



--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
function ItemScriptObj:CheckForUse(objItemSys, objItem,sysScript)
 local dwNowTime = _now()
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	-- objItem.dwLastUseTime = objItem.dwLastUseTime or 0
	-- if dwNowTime - objItem.dwLastUseTime < 3000 then
			-- sysTask:Error(999914)
			-- return nil
	-- end
	-- objItem.dwLastUseTime = dwNowTime	
	local objPlayer = objItemSys:GetPlayer()
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local dwMapId,Pos = sysMap.dwCurMapID,sysMap:GetPlayerPos()
	if dwMapId ~= 1002 then sysTask:Error(999911) return nil end;
	if math.sqrt((Pos.x+4)^2+(Pos.y-19)^2) > 5 then  sysTask:Error(999911) return nil end; 

 return 3000
end


ItemScriptObj.TxtDeploy = {
	{[1] = 10024,[2] = 10012,[3] = enChartType.ePower};
	{[1] = 10001,[2] = 10012,[3] = enChartType.eLevel};
	{[1] = 10002,[2] = 10015,[3] = enChartType.eWeath};
	{[1] = 10011,[2] = 10022,[3] = enChartType.eMount};
	{[1] = 10003,[2] = 10016,[3] = enChartType.eCombo};
	{[1] = 10004,[2] = 10017,[3] = enChartType.ePulse};
	--{[1] = 10001,[2] = 10012,[3] = enChartType.eElement};
	{[1] = 10005,[2] = 10006,[3] = enChartType.eKiller};
	{[1] = 10007,[2] = 10012,[3] = enChartType.eAchievement};
	{[1] = 10008,[2] = 10012,[3] = enChartType.eBoss};
	{[1] = 10009,[2] = 10012,[3] = enChartType.eAmulet};
	{[1] = 10026,[2] = 10012,[3] = enChartType.eSword};
	{[1] = 10010,[2] = 10012,[3] = enChartType.eBourn};
};
--随机榜单
function ItemScriptObj:Select()
	local dwRand = math.random(#ItemScriptObj.TxtDeploy);
	return dwRand;
end
----使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem,sysScript)
	local str = ""
	local objPlayer = objItemSys:GetPlayer()
	if (objPlayer) then
		local sysTask = objPlayer:GetSystem("CTaskSystem")
		sysTask:OnUseItem(dwItemId)
	end
	local data = ItemScriptObj.TxtDeploy[ItemScriptObj:Select()]
	local Mc = sysScript:GetChartInfo(data[3])[1]
	if not Mc then 
		str = NpcStringConfigInfo[10023]
	else
		str = NpcStringConfigInfo[data[1]]..[[<font color="#95E8A9">]]..Mc..[[</font>]]..NpcStringConfigInfo[data[2]]
	end
	sysScript:SayInWorld(str)
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 