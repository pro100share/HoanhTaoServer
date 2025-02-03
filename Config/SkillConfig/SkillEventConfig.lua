--技能追加效果的配置

--怪物免疫buff表
_G.MonsterImmuneConfig =
{
	--monsterID = {buffID,  buffID, buffID...}
	[80202099] = {71006,71002,92000,92001},
	[91] = {71006,71002,92000,92001},
	[92] = {71006,71002,92000,92001},
	[93] = {71006,71002,92000,92001},
	[94] = {71006,71002,92000,92001},
	[95] = {71006,71002,92000,92001},
	[96] = {71006,71002,92000,92001},
	[97] = {71006,71002,92000,92001},
	[98] = {71006,71002,92000,92001},
	[99] = {71006,71002,92000,92001},
};




--事件类型的抵抗技能ID
local EventResistSkill = 
{
	--万象昏阴
	[1] = 13018,
	--持续消耗
	[2] = 13019,
	--蹑云步
	[3] = 13026,
	--不动明王体
	[4] = 13022,
	--固若金汤
	[5] = 13021,
	--醍醐灌顶
	[6] = 13023,
	--浮云无定
	[7] = 13024,
	--静影沉璧
	[8] = 13025,
	--怒震威神
	[9] = 13020,
	--青莲秘箓
	[10] = 13027,
	--菩提心经
	[11] = 13028,
	--自身BUFF
	[20] = 0;
	--减益但不执行抵抗体系
	[30] = 0;
}

local Immunity = {
	--沉默
	[9] = {61003};
};
--BUFF免疫
local function SkillImmunity(objPlayer,dwEventType)
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	--检测不到配置就返回
	if not (Immunity[dwEventType]) then
		return false
	end
	if (objBufSys) then
		for _ , n in pairs(Immunity[dwEventType]) do
			if objBufSys:GetBuffObj(n) ~= nil then
				return true
			end
		end
	end
end


--事件效果：添加buff
local function SkillEvent_AddBuff(objMain,dwBuffID,dwLevel,dwTime)
	local dwType = objMain:GetObjType();
	if dwType == enEntType.eEntType_Player then
		local buffSystem = objMain:GetSystem("CBuffSystem");
		buffSystem:AddBuff(dwBuffID,dwLevel,objUser,dwTime);
	
	elseif dwType == enEntType.eEntType_Monster then
		if MonsterImmuneConfig[monsterEnumID] then
			local monsterEnumID = objMain:GetID();
			for k, v in pairs(MonsterImmuneConfig[monsterEnumID]) do
				if v == dwBuffID then return end;
			end
		end
				
		local sysMonsterBuff = objMain:GetSystem("CMonsterBuffSystem");
		sysMonsterBuff:AddBuff(dwBuffID,dwLevel,objUser,dwTime);
	elseif dwType == enEntType.eEntType_Pet then
		--宠物没有buff系统
		return
	end
end;

--事件效果：强制移动
local function SkillEvent_CompelMove(objCenter,objMover,dwLength,tbSkillExecInfo)
	--计算双方的坐标点
	local tbCenterPos = {};
	local tbMoverPos = {};
	
	local objMap = nil;
	
	local dwCenterType = objCenter:GetObjType();
	if dwCenterType == enEntType.eEntType_Player then
		local _,px,py = objCenter:GetSystem("CMapSystem"):GetPlayerMapPos();
		tbCenterPos.x = px;
		tbCenterPos.y = py;
	elseif dwCenterType == enEntType.eEntType_Monster then
		local _,x,y = objCenter:GetPos();
		tbCenterPos.x = x;
		tbCenterPos.y = y;
	elseif dwCenterType == enEntType.eEntType_Pet then
		local petPos = objCenter:GetPetPos()
		tbCenterPos.x = petPos.x;
		tbCenterPos.y = petPos.y;
	end
	
	local dwMoverType = objMover:GetObjType();
	if dwMoverType == enEntType.eEntType_Player then
		local objMapSys = objMover:GetSystem("CMapSystem");
		local _,px,py = objMapSys:GetPlayerMapPos();
		tbMoverPos.x = px;
		tbMoverPos.y = py;
		
		objMap = objMapSys:GetCurMap();
	elseif dwMoverType == enEntType.eEntType_Monster then
		local _,x,y = objMover:GetPos();
		tbMoverPos.x = x;
		tbMoverPos.y = y;
		
		objMap = objMover:GetMap();
	elseif dwMoverType == enEntType.eEntType_Pet then
		local petPos = objMover:GetPetPos();
		tbMoverPos.x = petPos.x;
		tbMoverPos.y = petPos.y;
		
		objMap = objMover:GetCurMap();
	end
	
	if not objMap then
		return;
	end
	
	--计算终点坐标点
	local vecDis = Vector2.new(tbMoverPos.x-tbCenterPos.x,tbMoverPos.y-tbCenterPos.y);
	vecDis:normalize();
	local vecPosLast = 
	{
		x = tbMoverPos.x + vecDis.x*dwLength,
		y = tbMoverPos.y + vecDis.y*dwLength,
	};
	
	local tb = objMap:GetPath(tbMoverPos,vecPosLast);
	if not tb then
		return;
	end
	
	vecPosLast = tb[2];
	
	local vecList = {};
	table.insert(vecList,vecPosLast);
	
	
	if dwMoverType == enEntType.eEntType_Player then
		local objSklSystem = objMover:GetSystem("CSkillSystem");
		if objSklSystem:GetInfo().dwHP > 0 then
			local dwOne,dwSec,dwThr = unpack(tbSkillExecInfo);
			objSklSystem:BroadcastSkillMsg(true,"OnPlaySkillMoveEffectMsg",
			{
				ActionID = 6,
				StartType = 4,
				StartID = objMover:GetRoleID(),
				PosList = vecList,
				Delay = 200,
				Index = 1,
				ShadowID = 0,
				SkillID = dwOne,
				ExecTime = dwSec,
				ActCount = dwThr,
			})
		end
		
		local buffSystem = objMover:GetSystem("CBuffSystem");
		if buffSystem then
			buffSystem:AddBuff(999999,1,objCenter);
		end
	elseif dwMoverType == enEntType.eEntType_Monster then
		--判断怪物是否可以被击退
		if objMover.DataInfo.shift == 1 then
			return;
		end
		if objMover.DataInfo.dwNoTurn == 1 then
			return;
		end
		
		if not objMover:IsDead() then
			objMover:CompelMove(7,200,objCenter:GetRoleID(),vecList,unpack(tbSkillExecInfo));
		end
	elseif dwMoverType == enEntType.eEntType_Pet then
		if not objMover:IsDead() then
			objMover:CompelMove(7,200,objCenter:GetRoleID(),vecList,unpack(tbSkillExecInfo));
		end
	end
end;

--事件效果：强制移动
local function SkillEvent_MoveToSelf(objCenter,objMover,tbSkillExecInfo)
	--计算双方的坐标点
	local tbCenterPos = {};
	local tbMoverPos = {};
	
	local objMap = nil;
	
	local dwCenterType = objCenter:GetObjType();
	if dwCenterType == enEntType.eEntType_Player then
		local _,px,py = objCenter:GetSystem("CMapSystem"):GetPlayerMapPos();
		tbCenterPos.x = px;
		tbCenterPos.y = py;
	elseif dwCenterType == enEntType.eEntType_Monster then
		local _,x,y = objCenter:GetPos();
		tbCenterPos.x = x;
		tbCenterPos.y = y;
	elseif dwCenterType == enEntType.eEntType_Pet then
		local petPos = objCenter:GetPetPos();
		tbCenterPos.x = petPos.x;
		tbCenterPos.y = petPos.y;
	end
	
	local dwMoverType = objMover:GetObjType();
	if dwMoverType == enEntType.eEntType_Player then
		local objMapSys = objMover:GetSystem("CMapSystem");
		local _,px,py = objMapSys:GetPlayerMapPos();
		tbMoverPos.x = px;
		tbMoverPos.y = py;
		
		objMap = objMapSys:GetCurMap();
	elseif dwMoverType == enEntType.eEntType_Monster then
		local _,x,y = objMover:GetPos();
		tbMoverPos.x = x;
		tbMoverPos.y = y;
		
		objMap = objMover:GetMap();
	elseif dwMoverType == enEntType.eEntType_Pet then
		local petPos = objMover:GetPetPos()
		tbMoverPos.x = petPos.x;
		tbMoverPos.y = petPos.y;
		
		objMap = objMover:GetCurMap();
	end
	
	if not objMap then
		return;
	end
	
	--计算终点坐标点
	-- local vecDis = Vector2.new(tbMoverPos.x-tbCenterPos.x,tbMoverPos.y-tbCenterPos.y);
	-- vecDis:normalize();
	local vecPosLast = 
	{
		x = tbCenterPos.x,
		y = tbCenterPos.y,
	};
	
	local tb = objMap:GetPath(tbMoverPos,vecPosLast);
	if not tb then
		return;
	end
	
	vecPosLast = tb[2];
	
	local vecList = {};
	table.insert(vecList,vecPosLast);
	
	
	if dwMoverType == enEntType.eEntType_Player then
		local objSklSystem = objMover:GetSystem("CSkillSystem");
		if objSklSystem:GetInfo().dwHP > 0 then
			local dwOne,dwSec,dwThr = unpack(tbSkillExecInfo);
			objSklSystem:BroadcastSkillMsg(true,"OnPlaySkillMoveEffectMsg",
			{
				ActionID = 6,
				StartType = 4,
				StartID = objMover:GetRoleID(),
				PosList = vecList,
				Delay = 200,
				Index = 1,
				ShadowID = 0,
				SkillID = dwOne,
				ExecTime = dwSec,
				ActCount = dwThr,
			})
		end
		
		local buffSystem = objMover:GetSystem("CBuffSystem");
		if buffSystem then
			buffSystem:AddBuff(999999,1,objCenter);
		end
	elseif dwMoverType == enEntType.eEntType_Monster then
		--判断怪物是否可以被击退
		if objMover.DataInfo.shift == 1 then
			return;
		end
		if objMover.DataInfo.dwNoTurn == 1 then
			return;
		end
		
		if not objMover:IsDead() then
			objMover:CompelMove(7,200,objCenter:GetRoleID(),vecList,unpack(tbSkillExecInfo));
		end
	elseif dwMoverType == enEntType.eEntType_Pet then
		if not objMover:IsDead() then
			objMover:CompelMove(7,200,objCenter:GetRoleID(),vecList,unpack(tbSkillExecInfo));
		end
	end
end;

_G.SkillEventFunc = {};

--取得攻击方的事件命中系数
function SkillEventFunc.GetSkillEventHitValue(objMain,dwSkillID,dwSkillLevel)
	local dwVal = 0;
	--角色等级
	local dwRoleLevel = objMain:GetLevel();
	--怪物ID，如果是怪物
	local dwMonsterID = 0;
	local dwMonsterType = 0;
	--基础命中值
	local dwBaseValue = 0;
	if SkillConfig[dwSkillID] then
		dwBaseValue = SkillConfig[dwSkillID].dwEventRatio;
	end
	
	if (dwSkillID == 61001) then
		dwSkillLevel = dwSkillLevel*250
	end
	--判定事件
	local dwType = objMain:GetObjType();
	if dwType == enEntType.eEntType_Player then
		dwVal = (dwSkillLevel * 200) + dwBaseValue;
	elseif dwType == enEntType.eEntType_Monster then
		dwMonsterID = objMain:GetID();
		dwMonsterType = objMain:GetMonsterType();
		local Append = 0.5;
		if (dwMonsterType == 0) then
			Append = 0.3;
		elseif (dwMonsterType == 1) then
			Append = 0.5;
		elseif (dwMonsterType == 2) then
			Append = 0.8;
		end
		--拿到怪物等级 
		local Lev = objMain:GetLevel();
		dwVal = ((Lev * 200) * Append) + dwBaseValue;
	elseif dwType == enEntType.eEntType_Pet then
		dwVal = dwSkillLevel * 200 * (1 + (dwBaseValue/10000));
	end
	return dwVal;
end;

--取得防御方的事件抵抗系数
function SkillEventFunc.GetSkillEventResistValue(objMain,dwEventType)
	local dwVal = 0;
	
	--角色等级
	-- local dwRoleLevel = objMain:GetLevel();
	--怪物ID，如果是怪物
	local dwMonsterID = 0;
	local dwMonsterType = 0;
	--抵抗技能的等级，如果是人
	local dwResistLevel = 0;
	
	local dwType = objMain:GetObjType();
	if dwType == enEntType.eEntType_Player then
		--免疫
		if (SkillImmunity(objMain,dwEventType)) then
			return 1000000
		end
		local dwSkillID = EventResistSkill[dwEventType];
		if dwSkillID then
			local objSkill = objMain:GetSystem("CSkillSystem").setAllSkill[dwSkillID];
			if objSkill then
				dwResistLevel = objSkill:GetLevel();
			end
		end
		--如果对象为玩家   玩家等级+技能等级
		dwVal = dwResistLevel * 200;
	elseif dwType == enEntType.eEntType_Monster then
		dwMonsterID = objMain:GetID();
		--怪物是否免疫
		local Immune = MonsterDataConfig[dwMonsterID].Immune
		if (Immune == 1) then
			return 1000000
		end
		
		dwMonsterType = objMain:GetMonsterType();
		--如果对象为怪物  怪物等级*怪物类型
		local Lev = objMain:GetLevel();
		local Append = 0.3;
		if (dwMonsterType == 0) then
			Append = 0.3;
		elseif (dwMonsterType == 1) then
			Append = 0.5;
		elseif (dwMonsterType == 2) then
			Append = 0.8;
		end
		dwVal = Lev * 200 * Append;
	elseif dwType == enEntType.eEntType_Pet then
		-- local dwSkillID = EventResistSkill[dwEventType];
		-- if dwSkillID then
			-- local objSkill = objMain:GetSystem("CPetSystem"):GetPetSikllSystem():GetPetSkillObj(objMain:GetEnumID(),dwSkillID);
			-- if objSkill then
				-- dwResistLevel = objSkill:GetLevel();
			-- end
		-- end
		
		local Append = 0.5;
		
		local dwRoleLevel = objMain:GetLevel();
		
		--如果对象为玩家   玩家等级+技能等级
		dwVal = dwRoleLevel * 200 * Append;
	end
	return dwVal;
end;

--通过命中值和抵抗值，计算本次事件是否命中
function SkillEventFunc.IsSkillEventHit(dwHitValue,dwResistValue)
	if (dwResistValue == 0) then
		return true
	end
	local Result =  1000 + (dwHitValue - dwResistValue);

	local dwRand = math.random(10000);
	if (Result >= dwRand) then
		return true;
	end
	return false;
end;

local EventTypeToExecType = 
{
	[1] = 1,
	[2] = 1,
	[3] = 1,
	[4] = 1,
	[5] = 2,
	[6] = 1,
	[7] = 1,
	[8] = 3,
	[9] = 1,
	[10] = 1,
	[11] = 1,
	[20] = 1,
	[30] = 1,
}

--事件执行
function SkillEventFunc.ExecSkillEvent(objAtt,objDef,dwEventType,dwEventP1,dwEventP2,dwEventP3,tbSkillExecInfo)
	local dwExecType = EventTypeToExecType[dwEventType];
	if not dwExecType then
		print("====error event type====",dwEventType)
		return;
	end
	if dwExecType == 1 then
		local tbBuffCfg = BuffBasicInfo[dwEventP1];
		if tbBuffCfg then
			if tbBuffCfg.dwVariety == 1 then
				SkillEvent_AddBuff(objAtt,dwEventP1,dwEventP2,dwEventP3);
			elseif tbBuffCfg.dwVariety == 2 then
				SkillEvent_AddBuff(objDef,dwEventP1,dwEventP2,dwEventP3);
			end
		end
	elseif dwExecType == 2 then
		SkillEvent_CompelMove(objAtt,objDef,dwEventP2,tbSkillExecInfo);
	elseif dwExecType == 3 then
		SkillEvent_MoveToSelf(objAtt,objDef,tbSkillExecInfo);

	end
end;


