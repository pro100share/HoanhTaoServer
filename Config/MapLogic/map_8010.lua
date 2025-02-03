local dwMapID = 8010;
local MapLogic = {};
----------------------------------------------------------------------------
--
local dwStandLengthMax = 40000;

local function GetRandTableValue(tb)
	local dwMax = 0;
	
	for k,v in pairs(tb)do
		dwMax = dwMax + 1000;
	end
	
	local dwRand = math.random(dwMax);
	dwMax = 0;
	
	for k,v in pairs(tb)do
		dwMax = dwMax + 1000;
		if dwRand < dwMax then
			return k,v;
		end
	end
	
	return nil,nil
end;

-- function MapLogic:Update(objMap)
	-- if objMap:GetAllPlayerNum() == 0 then
		-- return;
	-- end
-- end;

function MapLogic:EventPlayerEnter(objMap,objPlayer)
	objMap:NoticeCountDown(objPlayer,dwStandLengthMax);
end;

function MapLogic:EventPlayerCountDown(objMap,objPlayer)
	local tbRandMap = WarConfig[10001].EnterMapSet;
	
	local dwMap,tbPoint = GetRandTableValue(tbRandMap);
	if not tbPoint then
		return;
	end
	
	local _,dwPointIndex = GetRandTableValue(tbPoint);
	
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if objMapSys then
		objMapSys:ExecTransforMap(dwMap,dwPointIndex)
	end
end;

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------