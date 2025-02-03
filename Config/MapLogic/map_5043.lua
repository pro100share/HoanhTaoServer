local dwMapID = 5043;
local MapLogic = {};
----------------------------------------------------------------------------
--进入
function MapLogic:EventPlayerEnter(map,objPlayer)
	local TongTianTaSys = objPlayer:GetSystem("CTongTianTowerSystem");
	TongTianTaSys.time = _now();
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	local mgrMonster = map:GetMonsterMgr();		----获得怪物管理器
	if not sysScript:CheckBUff(50720000) then
		sysScript:AddBuff(50720000);
	end
	local pos1 = {
			{x = 5, y = -1},
			{x = -8, y = -1},
			{x = 4, y = -4},
			{x = -6, y = -4},
		};
	local pos2 = {
			{x = 3, y = 3},
			{x = -6, y = 3},
			{x = -1, y = -6},
			{x = -1, y = 5},
		};
		
	local D1 = function()
		map:GetDropMgr():RemoveAll();
		MapLogic:RemoveMon(map);
		
		--播动画 刷怪
		sysScript:Story(5040003);
		mgrMonster:DelayAdd(51000012, 51000012, 51000001, 51000012, 100210010, -1, 13, dwObjId, 2500);
		for i = 1, #pos1 do
			mgrMonster:DelayAdd(51000011, 51000011, 51000001, 101300, 100710100, pos1[i].x, pos1[i].y, dwObjId, 2000);
		end
		
		for i = 1, #pos2 do
			mgrMonster:DelayAdd(51000010, 51000010, 51000001, 101300, 100710080, pos2[i].x, pos2[i].y, dwObjId, 2000);
		end
	end
	map:AddTimeEvent(2000,D1);
end
----------------------------------------------------------------------------
function MapLogic:RemoveMon(map)
	local mgrMonster = map:GetMonsterMgr();		----获得怪物管理器
	local monster = {51000010, 51000011, 51000012};
	for i = 1, #monster do
		local mon = mgrMonster:GetMonsterById(monster[i]);
		if #mon > 0 then
			for _, v in pairs(mon) do
				mgrMonster:Remove(v:GetRoleID());
			end
		end
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------