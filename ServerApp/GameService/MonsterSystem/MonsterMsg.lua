--------------------------------
--[[
服务器 Monster
消息处理
周长沙
2012-1-31
--]]
--------------------------------

_define()
---------------------------------------------------------
--发送地图Monster信息
define.MonsterGetMapMonsterMsg
{
	user = NONE,
}

when{ user = NONE }
MonsterGetMapMonsterMsg = checkUser
when{}
function MonsterGetMapMonsterMsg(user)
	local sysMonster = user:GetSystem("CMonsterSystem");
	if sysMonster then
		sysMonster:Clear()
		sysMonster:SendMapMonsterInfo()
	end
end

--检查是否有这只怪（容错）
define.MonsterCheckSingleMonsterMsg
{
	user = NONE,
	ObjID = 0;
}

when{ user = NONE }
MonsterCheckSingleMonsterMsg = checkUser
when{}
function MonsterCheckSingleMonsterMsg(user,ObjID)
	local sysMonster = user:GetSystem("CMonsterSystem");
	if sysMonster then
		sysMonster:CheckSingleMonster(ObjID)
	end
end
----------------------------------------------------------
--鼠标移入事件（临时用）
define.MonsterOnMouseOverMsg
{
	user = NONE;
	DwMonsterObjId = 0;
}
when{ user = NONE }
MonsterOnMouseOverMsg = checkUser

when{}
function MonsterOnMouseOverMsg(user,DwMonsterObjId)
end
-----------------------------------------------------------
--测试用
define.MonsterOnKeyTestMsg
{
	user = NONE;
	ID = 0;
}
when{ user = NONE }
MonsterOnKeyTestMsg = checkUser

when{}
function MonsterOnKeyTestMsg(user,ID)
	local sysMap = user:GetSystem("CMapSystem")
	local Map = sysMap:GetCurMap();
	local mgrMon = Map.objMonMgr
	local dwObjID = ID
	-- print("-----------Monster Check Start-------------")
	-- print("Monster ObjID:",dwObjID)
	if dwObjID ~=nil then
		local objMon = mgrMon:GetMonsterInfo(dwObjID)
		if objMon then
			-- print("Monster Found!")
			-- print("Monster ID:",objMon.dwMonsterId)
			-- print("Monster LogicID:",objMon:GetLogicID())
			-- print("Monster Pos:",objMon:GetPos())
			-- print("Monster IsMoving:",objMon:IsMoving())
			-- print("Monster AIState:",objMon:GetAIState())
			-- print("Monster IsDead:",objMon:IsDead())
			-- print("Monster Speed:",objMon:GetSystem("CMonsterMoveSystem").fSpeed)
			
			-- print("Player Pos:",sysMap:GetPlayerPos().x,sysMap:GetPlayerPos().y)
			local _,mx,my = objMon:GetPos()
			local pp = sysMap:GetPlayerPos()
			local dis = (pp.x-mx)^2+(pp.y-my)^2
			-- print("Dis:",math.sqrt(dis))
		else
			-- print("Monster Not Exist!")
		end
	else
		-- print("Send a nil ObjID!")
	end
	-- print("-----------Monster Check End-------------")
end













