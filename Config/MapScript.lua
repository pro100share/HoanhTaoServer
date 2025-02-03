
local function DoneWithExitDupl(dwMapID,fX,fY,fDir,sysMap,sysDupl)
	if sysDupl:IsNeedChangeLine() then
		sysDupl:Back();
	else
		sysMap:ExecExitDuplXY(dwMapID,fX,fY,fDir);
	end
end;

local function DoneWithDeadDupl(dwMapID,dwPoint,sysMap,sysDupl)
	if sysDupl:IsNeedChangeLine() then
		sysDupl:Back();
	else
		sysMap:ExecTransforMap(dwMapID,dwPoint);
	end
end;

------------------------- 丘山村1001
local map = MapInfoConfig[1001];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	 ------------传送到襄阳城
    if sPoint.dwID == 1 and sPoint.dwType == 1 then
        ----ExecTransfor传送类别:常规-常规、副本-副本|ExecEnterDupl:常规-副本(进副本)|ExecExitDupl:副本-常规(出副本)
	  if not objMapSys:ExecTransforMap(1002,2) then-----XY填写具体坐标(副本ID,地图ID,X坐标,Y坐标,朝向)|Map 填写为mapconfig中配置的具体点(副本ID,地图ID,第几个点)
      --objMapSys:ExecTransforMap(1002,2);-----与上一条择1个填写
		return false;-----不成功反回失败
	  end;

	  -----------传送到1001单人副本，5001地图
    elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8050,1) then
	  --objMapSys:ExecEnterDuplXY();
		return false;-----不成功反回失败
	  end;

	  -----------传送到1001单人副本，5001地图
    elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8051,1) then
	  --objMapSys:ExecEnterDuplXY();
		return false;-----不成功反回失败
	  end;

	  -----------传送到1001单人副本，5001地图
    elseif sPoint.dwID == 7 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8052,1) then
	  --objMapSys:ExecEnterDuplXY();
		return false;-----不成功反回失败
	  end;

	  -----------传送到1001单人副本，8008地图
    elseif sPoint.dwID == 9 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8008,2) then
	  --objMapSys:ExecEnterDuplXY();
		return false;-----不成功反回失败
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1001,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;----最后反回true
end;

------------------------- 襄阳城1002
local map = MapInfoConfig[1002];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	  ---------------传送到丘山村
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1001,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ------------------传送到襄阳野郊
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1003,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;
	  ------------------传送到桃花岛
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1004,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  -----------------丐帮竹林
	elseif sPoint.dwID == 7 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1008,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  -----------------太守府
	elseif sPoint.dwID == 9 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1102,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 襄阳野郊1003
local map = MapInfoConfig[1003];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到襄阳城
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1002,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ------------------传送到大理
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1006,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  ------------------传送到绝情密涧
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1005,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  ------------------传送到绝情密涧
	elseif sPoint.dwID == 7 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1103,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 桃花岛1004
local map = MapInfoConfig[1004];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	  ---------------传送到襄阳城
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1002,6) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  -------------传送到密境
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1104,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 绝情密涧1005
local map = MapInfoConfig[1005];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到襄阳野郊
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1003,6) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到密境
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1105,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 大理1006
local map = MapInfoConfig[1006];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到襄阳野郊
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1003,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到白驼山
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1007,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送密境
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1106,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 白驼山1007
local map = MapInfoConfig[1007];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到大理
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1006,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------密境
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1107,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------昆仑山
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1012,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 终南山1008
local map = MapInfoConfig[1008];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到襄阳城
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1002,8) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到丐帮竹林
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1009,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到华山
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1010,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到密境
	elseif sPoint.dwID == 7 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1108,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 丐帮竹林1009
local map = MapInfoConfig[1009];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到终南山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1008,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到密境
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1109,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------华山1010
local map = MapInfoConfig[1010];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到终南山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1008,6) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到嵩山
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1011,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到密境
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1110,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------嵩山1011
local map = MapInfoConfig[1011];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到华山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1010,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到密境
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1111,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------昆仑山1012
local map = MapInfoConfig[1012];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到白驼山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1007,6) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送黑水遗迹
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1013,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;
	  
	  ---------------传送到密境
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1112,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------黑水遗迹1013
local map = MapInfoConfig[1013];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到昆仑山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1012,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------传送到密境
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1113,2) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;
------------------------- 太守府
local map = MapInfoConfig[1102];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到襄阳
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1002,10) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 野郊BOSS地图
local map = MapInfoConfig[1103];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到野郊
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1003,8) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 桃花岛BOSS地图
local map = MapInfoConfig[1104];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到桃花岛
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1004,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 绝情密涧BOSS地图
local map = MapInfoConfig[1105];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到绝情密涧
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1005,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 大理BOSS地图
local map = MapInfoConfig[1106];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到大理
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1006,6) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

------------------------- 白驼山BOSS地图
local map = MapInfoConfig[1107];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到白驼山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1007,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------终南山BOSS地图
local map = MapInfoConfig[1108];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到终南山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1008,8) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------丐帮竹林BOSS地图
local map = MapInfoConfig[1109];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到丐帮竹林
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1009,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------华山密境BOSS地图
local map = MapInfoConfig[1110];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到华山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1010,6) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------嵩山密境BOSS地图
local map = MapInfoConfig[1111];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到嵩山
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1011,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;

-------------------------昆仑密境BOSS地图
local map = MapInfoConfig[1112];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到昆仑
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1012,6) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;
-------------------------黑水密境BOSS地图
local map = MapInfoConfig[1113];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	  ---------------传送到黑水
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(1013,4) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
			return false;
	  end;

	end;
    return true;
end;
----------------------------------------------------------------------------------------------------------
-------------------------剧情副本01
local map = MapInfoConfig[5001];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1001,-48.75,-7.54,4.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1001,-48.75,-7.54,4.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1001,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1001,99,objMapSys,sysDupl);
	end;
    return true;
end;

-------------------------剧情副本02
local map = MapInfoConfig[5002];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;	
	
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1003,20,-25,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
		DoneWithExitDupl(1003,20,-25,5.5,objMapSys,sysDupl)
	-- end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1003,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1003,99,objMapSys,sysDupl);
	end;
    return true;
end;

-------------------------剧情副本03
local map = MapInfoConfig[5003];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;	
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1004,38.77,40.05,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;

		DoneWithExitDupl(1004,38.77,40.05,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1004,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1004,99,objMapSys,sysDupl);
	end;
    return true;
end;

-------------------------野郊剧情副本02----
local map = MapInfoConfig[5079];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;		

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1003,17.28,-31.02,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  -- return false;
	-- end;
		DoneWithExitDupl(1003,17.28,-31.02,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(1003,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1003,99,objMapSys,sysDupl);
	end;
    return true;
end;

-------------------------剧情副本04
local map = MapInfoConfig[5081];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1003,1.70,-94.39,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1003,1.70,-94.39,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1005,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1005,99,objMapSys,sysDupl);
	end;
    return true;
end;
-------------------------剧情副本05
local map = MapInfoConfig[5082];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1006,4.99,19.88,4.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1006,4.99,19.88,4.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1006,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1006,99,objMapSys,sysDupl);
	end;
    return true;
end;
-------------------------剧情副本06
local map = MapInfoConfig[5083];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1007,-34.49,45.43,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1007,-34.49,45.43,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1007,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1007,99,objMapSys,sysDupl);
	end;
    return true;
end;
-------------------------清音洞，支线任务
local map = MapInfoConfig[5084];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1004,30.05,4.70,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1004,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;
----------------------------------------------------------------------------------------------------------
-------------------------异乡人营地 剧情副本02

local map = MapInfoConfig[5085];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;	
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		-- if duplSystem:GetDuplType() and duplSystem:GetDuplType()== 0 then
			-- duplSystem:Back();
		-- else
			-- if not objMapSys:ExecExitDuplXY(1001,32.74,-18.06,4.5) then
			-- --if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				-- return false;
			-- end
		-- end;
		DoneWithExitDupl(1001,32.74,-18.06,4.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1001,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1001,99,objMapSys,sysDupl)
	end;
    return true;
end;
----------------------------------------------------------------------------------------------------------
-------------------------桃花岛 剧情副本02
local map = MapInfoConfig[5086];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1004,0.70,-98.82,4.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1004,0.70,-98.82,4.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1004,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1004,99,objMapSys,sysDupl)
	end;
    return true;
end;
----------------------------------------------------------------------------------------------------------
-------------------------大理剧情副本02
local map = MapInfoConfig[5087];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1006,59.64,95.47,4.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1006,59.64,95.47,4.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1006,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1006,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------白驼山剧情副本 02
local map = MapInfoConfig[5088];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1007,74.13,44.96,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1007,74.13,44.96,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1007,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1007,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------白驼山剧情副本 03
local map = MapInfoConfig[5089];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1007,83.51,-40.98,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1007,83.51,-40.98,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1007,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1007,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------白驼山剧情副本 04
local map = MapInfoConfig[5090];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1007,-49,63,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1007,-49,63,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1007,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1007,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------终南山剧情副本 01 重阳殿内
local map = MapInfoConfig[5091];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1008,72.29,1.01,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1008,72.29,1.01,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1008,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1008,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------终南山剧情副本 02 古墓石室
local map = MapInfoConfig[5092];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1008,-13,75,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1008,-13,75,5.5,objMapSys,sysDupl)
		-----------去甬道
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5093,1) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1008,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1008,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------终南山剧情副本 03 墓中甬道
local map = MapInfoConfig[5093];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图
	if sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5094,1) then
			return false;
		end;

		-----------回去
	elseif sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5092,3) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1008,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1008,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------终南山剧情副本 04 寒玉冰室
local map = MapInfoConfig[5094];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 4 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1008,-13,75,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1008,-13,75,5.5,objMapSys,sysDupl)
		-----------回去
	elseif sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5093,3) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1008,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1008,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------绝情密涧剧情副本 谷中正院
local map = MapInfoConfig[5095];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1003,1.70,-94.39,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1003,1.70,-94.39,5.5,objMapSys,sysDupl)
		-----------去藏兵密室
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5096,1) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1005,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1005,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------绝情密涧剧情副本 藏兵密室
local map = MapInfoConfig[5096];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 88 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,0,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,0,5.5,objMapSys,sysDupl)
		-----------去谷中正院
	elseif sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5095,3) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1005,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1005,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------丐帮竹林剧情副本01 比武擂台----
local map = MapInfoConfig[5097];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1009,-11,-63,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1002,2) then
	  -- return false;
	-- end;
		DoneWithExitDupl(1009,-11,-63,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(1009,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1009,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------丐帮竹林剧情副本02 碧林深处----
local map = MapInfoConfig[5098];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1009,-81.56,13.84,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1002,2) then
	  -- return false;
	-- end;
		DoneWithExitDupl(1009,-81.56,13.84,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(1009,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1009,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------丐帮竹林剧情副本03 碧林深处----
local map = MapInfoConfig[5099];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1009,-26,80,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1002,2) then
	  -- return false;
	-- end;
		DoneWithExitDupl(1009,-26,80,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(1009,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1009,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------华山剧情副本 01
local map = MapInfoConfig[5100];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1010,30,-110,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1010,30,-110,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1010,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1010,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------华山剧情副本 02 无名洞
local map = MapInfoConfig[5101];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1010,13,105,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1010,13,105,5.5,objMapSys,sysDupl)
		-----------去甬道
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5102,1) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1010,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1010,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------华山剧情副本 02 清音洞
local map = MapInfoConfig[5102];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图
	if sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5103,1) then
			return false;
		end;

		-----------回去
	elseif sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5101,4) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1010,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1010,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------华山剧情副本 02 无名洞夜
local map = MapInfoConfig[5103];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 4 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1010,13,105,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1010,13,105,5.5,objMapSys,sysDupl)
		-----------回去
	elseif sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5102,3) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1010,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1010,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------嵩山剧情副本01  藏经阁 第1层
local map = MapInfoConfig[5104];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1011,25,83,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1011,25,83,5.5,objMapSys,sysDupl)
		-----------去下图
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5105,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1011,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1011,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------嵩山剧情副本01  藏经阁 第2层
local map = MapInfoConfig[5105];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5104,3) then
			return false;
		end;

		-----------去下图
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5106,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1011,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1011,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------嵩山剧情副本01  藏经阁 第3层
local map = MapInfoConfig[5106];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5105,3) then
				return false;
		end;

		-----------去下图
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5107,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1011,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1011,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------嵩山剧情副本01  藏经阁 第4层
local map = MapInfoConfig[5107];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5106,3) then
			return false;
		end;

		-----------离开
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1011,25,83,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
	  -- return false;
	-- end;
		DoneWithExitDupl(1011,25,83,5.5,objMapSys,sysDupl)

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1011,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1011,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------嵩山剧情副本02  达摩洞 第1层
local map = MapInfoConfig[5108];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1011,-7,-107,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1011,-7,-107,5.5,objMapSys,sysDupl)
		-----------去下图
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
	  if not objMapSys:ExecTransforMap(5109,1) then
	  return false;
	end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1011,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1011,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------嵩山剧情副本02  达摩洞 第2层
local map = MapInfoConfig[5109];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5108,3) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1011,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1011,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本01  白猿洞
local map = MapInfoConfig[5110];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1012,-51,-23,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1012,-51,-23,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本02  长生阁外山道
local map = MapInfoConfig[5111];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1012,-32,83,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1012,-32,83,5.5,objMapSys,sysDupl)
		-----------去下图
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5112,1) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本02  长生阁正厅
local map = MapInfoConfig[5112];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5111,4) then
			return false;
		end;

		-----------去下图
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5113,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本02  长生阁走廊
local map = MapInfoConfig[5113];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5112,4) then
				return false;
		end;

		-----------去下图
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5114,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本03  长生阁房间
local map = MapInfoConfig[5114];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5113,4) then
			return false;
		end;

		-----------去下图
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5115,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本02  长生阁暗廊
local map = MapInfoConfig[5115];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5114,4) then
			return false;
		end;

		-----------去下图
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5116,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本02  长生阁暗牢
local map = MapInfoConfig[5116];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5115,4) then
			return false;
		end;

		-----------离开
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1012,-32,83,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
	  -- return false;
	-- end;

		DoneWithExitDupl(1012,-32,83,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------昆仑山剧情副本03  篝火盛会
local map = MapInfoConfig[5117];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1012,33,-126,4.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1012,33,-126,4.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1012,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------黑水遗迹剧情副本01  旧城废墟
local map = MapInfoConfig[5118];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1012,33,-126,4.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1013,73,31,4.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1013,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------黑水遗迹剧情副本02  黑将军府1层
local map = MapInfoConfig[5119];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1012,33,-126,4.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1013,45,-59,4.5,objMapSys,sysDupl);
		
		-----------去下图
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5120,1) then
			return false;
		end;		
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1013,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------黑水遗迹剧情副本02  黑将军府2层
local map = MapInfoConfig[5120];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5119,4) then
				return false;
		end;

		-----------去下图
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5121,1) then
			return false;
		end;


	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1013,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------黑水遗迹剧情副本02  黑将军府3层
local map = MapInfoConfig[5121];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not objMapSys then
		return false;
	end;

		-----------回上层
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5120,4) then
			return false;
		end;

		-- -----------离开
	-- elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  -- -- if not objMapSys:ExecExitDuplXY(1012,-32,83,5.5) then
	  -- -- --if not objMapSys:ExecExitDupl(1004,99) then
	  -- -- return false;
	-- -- end;

		--DoneWithExitDupl(1013,45,-59,4.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1012,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1013,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------黑水遗迹剧情副本03 枯井
local map = MapInfoConfig[5122];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;	
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1004,38.77,40.05,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;

		DoneWithExitDupl(1013,102,-105,5.5,objMapSys,sysDupl)
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1004,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1013,99,objMapSys,sysDupl);
	end;
    return true;
end;

----------------------------
---------------------------------------------------------------------------------
-- -------------------------群侠副本01
-- local map = MapInfoConfig[6001];
-- function map:TransMapEvent(sPoint,objPlayer)
	-- local objMapSys = objPlayer:GetSystem("CMapSystem");
	-- if not objMapSys then
		-- return false;
	-- end;

		-- -----------离开副本
	-- if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- -- if not objMapSys:ExecExitDuplXY(1001,-48.75,-7.54,4.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- -- return false;
	-- -- end;
		-- DoneWithExitDupl(1001,-48.75,-7.54,4.5,objMapSys,sysDupl);
	  -- ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- -- if not objMapSys:ExecTransforMap(1001,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- -- return false;
	  -- -- end;
		-- DoneWithDeadDupl(1001,99,objMapSys,sysDupl)
	-- end;
    -- return true;
-- end;
---------------------------------------------------------------------------------
-------------------------副本1003---大破金营5004（1/13）张图
local map = MapInfoConfig[5004];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去第2张图-右营5005
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5005,1) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;
	
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5005（2/13）张图
local map = MapInfoConfig[5005];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5006
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5006,1) then
			return false;
		end;

		-----------回去-左营5004
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5004,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5006（3/13）张图
local map = MapInfoConfig[5006];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5007
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5007,1) then
			return false;
		end;

		-----------回去-左营5005
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5005,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
			--if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5007（4/13）张图
local map = MapInfoConfig[5007];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5008
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5008,1) then
			return false;
		end;

		-----------回去-左营5006
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5006,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5008（5/13）张图
local map = MapInfoConfig[5008];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5009
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5009,1) then
			return false;
		end;

		-----------回去-左营5007
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5007,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5)then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5009（6/13）张图
local map = MapInfoConfig[5009];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5010
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5010,1) then
			return false;
		end;

		-----------回去-左营5008
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5008,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5010（7/13）张图
local map = MapInfoConfig[5010];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5011
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5011,1) then
			return false;
		end;

		-----------回去-左营5009
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5009,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5011（8/13）张图
local map = MapInfoConfig[5011];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5012
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5012,1) then
			return false;
		end;

		-----------回去-左营5010
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5010,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5012（9/13）张图
local map = MapInfoConfig[5012];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5013
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5013,1) then
			return false;
		end;

		-----------回去-左营5011
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5011,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5013（10/13）张图
local map = MapInfoConfig[5013];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5014
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5014,1) then
			return false;
		end;

		-----------回去-左营5012
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5012,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5014（11/13）张图
local map = MapInfoConfig[5014];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5015
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5015,1) then
			return false;
		end;

		-----------回去-左营5013
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5013,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5015（12/13）张图
local map = MapInfoConfig[5015];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5016
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5016,1) then
			return false;
		end;

		-----------回去-左营5014
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5014,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------副本1003---大破金营5016（13/13）张图
local map = MapInfoConfig[5016];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去下图-右营5017
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5017,1) then
			return false;
		end;

		-----------回去-左营5015
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --objMapSys:ExecTransforMapXY(1002,5003,-34,-25,5.5);
		if not objMapSys:ExecTransforMap(5015,5) then
			return false;
		end;

		-----------离开副本
	elseif sPoint.dwID == 4 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------5020---夫妻副本
local map = MapInfoConfig[5020];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

-------------------------副本1004---珍珑棋局
local map = MapInfoConfig[5030];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

-------------------------通天塔---第一层5040（1/9）张图
local map = MapInfoConfig[5040];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 2 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第二层5041
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5041,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5040,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第二层5041（2/9）张图
local map = MapInfoConfig[5041];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 3 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第三层5042
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5042,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5041,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第三层5042（3/9）张图
local map = MapInfoConfig[5042];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 4 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第四层5043
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5043,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5042,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第四层5043（4/9）张图
local map = MapInfoConfig[5043];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 5 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第五层5044
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5044,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5043,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第五层5044（5/9）张图
local map = MapInfoConfig[5044];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 6 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第六层5045
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5045,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5044,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第六层5045（6/9）张图
local map = MapInfoConfig[5045];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 7 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第七层5046
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5046,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5045,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第七层5046（7/9）张图
local map = MapInfoConfig[5046];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 8 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第八层5047
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5047,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5046,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第八层5047（8/9）张图
local map = MapInfoConfig[5047];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	--失败限制传送
	if objPlayer:GetSystem("CTongTianTowerSystem"):GetCurLayer() < 9 then
		objPlayer:GetSystem('CScriptSystem'):Notice(SysStringConfigInfo[14000100005]);
		return false;
	end
	
		-----------去下图-第九层5048
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5048,1) then
			return false;
		end;

	  ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5047,99) then
			-- return false;
		-- end;

	end;
    return true;
end;

-------------------------通天塔---第三层5048（9/9）张图
local map = MapInfoConfig[5048];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	
	  ---------------复活点
	-- if sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecExitDupl(5048,99) then
			-- return false;
		-- end;

	--end;
    return true;
end;

-------------------------副本1006---五行道场
local map = MapInfoConfig[5050];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

-------------------------副本1007---TD
local map = MapInfoConfig[5060];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;
-------------------------劫物资车
local map = MapInfoConfig[5070];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;
-------------------------演武节堂
local map = MapInfoConfig[5071];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;
-------------------------守卫襄阳
local map = MapInfoConfig[5072];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;
	  -----------------上路密道
	elseif sPoint.dwID == 6 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,7) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;
	  -----------------上路密道
	elseif sPoint.dwID == 8 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,9) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  -----------------下路密道
	elseif sPoint.dwID == 10 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,11) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;
	  -----------------下路密道
	elseif sPoint.dwID == 12 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,13) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  -----------------左路密道
	elseif sPoint.dwID == 14 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,15) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;
	  -----------------左路密道
	elseif sPoint.dwID == 16 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,17) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  -----------------右路密道
	elseif sPoint.dwID == 18 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,19) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;
	  -----------------右路密道
	elseif sPoint.dwID == 20 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(5072,21) then
	    --objMapSys:ExecTransforMapXY(1001,-25,-25,5.5);
		return false;
	   end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

---------------------------------小猪快跑
local map = MapInfoConfig[5074];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;
-------------------------恶人谷01
local map = MapInfoConfig[8050];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		--if not objMapSys:ExecTransforMap(1001,4) then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;

-------------------------恶人谷02
local map = MapInfoConfig[8051];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		--if not objMapSys:ExecTransforMap(1001,4) then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;

-------------------------恶人谷03
local map = MapInfoConfig[8052];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --if not objMapSys:ExecTransforMap(1001,4) then
	  -- if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
		-- return false;
	-- end;
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;

-------------------------恶人谷04
local map = MapInfoConfig[8053];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --if not objMapSys:ExecTransforMap(1001,4) then
	  -- if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
		-- return false;
	-- end;
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;

-------------------------恶人谷05
local map = MapInfoConfig[8054];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  --if not objMapSys:ExecTransforMap(1001,4) then
	  -- if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
		-- return false;
	-- end;
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;


-------------------------帮派战01
local map = MapInfoConfig[8008];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去2层
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(8001,2) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
			return false;
		end;

		-----------去4层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		if not objMapSys:ExecTransforMap(8007,2) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
			if not objMapSys:ExecTransforMap(8010,2) then
			--if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
				return false;
			end;

	end;
    return true;
end;

-------------------------帮派战02
local map = MapInfoConfig[8001];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去1层
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8008,4) then
		  --if not objMapSys:ExecExitDupl(1004,99) then
			return false;
		end;

		-----------去3层
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8002,4) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
		  return false;
		end;

		-----------去5层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8009,2) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
		  return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
			if not objMapSys:ExecTransforMap(8010,99) then
			--if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
				return false;
		  end;

	end;
    return true;
end;

-------------------------帮派战03
local map = MapInfoConfig[8002];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去2层
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8001,4) then
		  --if not objMapSys:ExecExitDupl(1004,99) then
			return false;
		end;

		-----------去6层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8003,2) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
			if not objMapSys:ExecTransforMap(8010,2) then
			--if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
				return false;
			end;

	end;
    return true;
end;

-------------------------帮派战04
local map = MapInfoConfig[8007];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去1层
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8008,6) then
		  --if not objMapSys:ExecExitDupl(1004,99) then
			return false;
		end;

		-----------去5层
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8009,4) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
		  return false;
		end;

		-----------去7层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
		  if not objMapSys:ExecTransforMap(8006,4) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
		  return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(8010,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

-------------------------帮派战05
local map = MapInfoConfig[8009];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去2层
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8001,6) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

		-----------去4层
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8007,4) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

		-----------去6层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8003,4) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

		-----------去8层
	elseif sPoint.dwID == 7 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8005,2) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(8010,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

-------------------------帮派战06
local map = MapInfoConfig[8003];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去3层
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8002,6) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

		-----------去5层
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8009,6) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

		-----------去9层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8004,4) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(8010,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

-------------------------帮派战07
local map = MapInfoConfig[8006];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去4层
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8007,6) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

		-----------去8层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8005,4) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
			if not objMapSys:ExecTransforMap(8010,2) then
			--if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
				return false;
			end;

	end;
    return true;
end;

-------------------------帮派战08
local map = MapInfoConfig[8005];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去5层
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8009,8) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

		-----------去7层
	elseif sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8006,6) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

		-----------去9层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8004,6) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(8010,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
	  end;

	end;
    return true;
end;

-------------------------帮派战09
local map = MapInfoConfig[8004];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------去6层
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8003,6) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

		-----------去8层
	elseif sPoint.dwID == 5 and sPoint.dwType == 1 then
	  if not objMapSys:ExecTransforMap(8005,6) then
	  --if not objMapSys:ExecExitDupl(1002,2) then
	  return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
			if not objMapSys:ExecTransforMap(8010,2) then
			--if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
				return false;
			end;

	end;
    return true;
end;
-------------------------世家战 调整区
local map = MapInfoConfig[8010];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------进入战场
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		local A = 8008
		local dwRand = math.random(10000);
			if (dwRand < 2500) then
				A = 8002
			elseif(dwRand > 2500 and dwRand < 5000) then
				A = 8006
			elseif(dwRand > 5000 and dwRand < 7500) then
				A = 8004
			end
			if not objMapSys:ExecTransforMap(A,2) then
			--if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
				return false;
			end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(8010,99) then
	    --if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
			return false;
		end;

	end;
    return true;
end;
-------------------------盟主战
local map = MapInfoConfig[8020];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 1 and sPoint.dwType == 1 then
		--if not objMapSys:ExecTransforMap(1001,4) then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end;
	---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		local A = 11
		local dwRand = math.random(10000);
		if (dwRand < 2500) then
			A = 12
		elseif(dwRand > 2500 and dwRand < 5000) then
			A = 13
		elseif(dwRand > 5000 and dwRand < 7500) then
			A = 14
		end

		if not objMapSys:ExecTransforMap(8020,A) then
			return false;


		end;

	end;
    return true;
end;
-------------------------盟主战备战区
local map = MapInfoConfig[8021];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
		  return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;
-------------------------风云客栈
local map = MapInfoConfig[8025];
function map:TransMapEvent(sPoint,objPlayer)
	-- local objMapSys = objPlayer:GetSystem("CMapSystem");
	-- if not objMapSys then
		-- return false;
	-- end;

		-- -----------离开副本
	-- if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;

	  -- ---------------复活点
	-- elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    -- --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;

	-- end;
    -- return true;
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		--if not objMapSys:ExecTransforMap(1001,4) then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;
-------------------------青云蜀道
local map = MapInfoConfig[8030];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
		  --if not objMapSys:ExecExitDupl(1004,99) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(8031,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;
-------------------------青云蜀道备战区
local map = MapInfoConfig[8031];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
		  return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(8031,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;
-------------------------夜战襄阳
local map = MapInfoConfig[8060];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end

	elseif sPoint.dwID == 20 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
	  -- --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		local A = 1
		local dwRand = math.random(10000);
		if (dwRand < 1000) then
			A = 2
		elseif(dwRand > 1000 and dwRand < 2000) then
			A = 3
		elseif(dwRand > 2000 and dwRand < 3000) then
			A = 4
		elseif(dwRand > 3000 and dwRand < 4000) then
			A = 5
		elseif(dwRand > 4000 and dwRand < 5000) then
			A = 6
		elseif(dwRand > 5000 and dwRand < 6000) then
			A = 7
		elseif(dwRand > 6000 and dwRand < 7000) then
			A = 8
		elseif(dwRand > 7000 and dwRand < 8000) then
			A = 9
		elseif(dwRand > 8000 and dwRand < 9000) then
			A = 10
		end

		if not objMapSys:ExecTransforMap(8060,A) then
			return false;

		end;

	end;
    return true;
end;
-------------------------个人押镖 低级
local map = MapInfoConfig[8070];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		--if not objMapSys:ExecTransforMap(1001,4) then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,-31,-98,5.5) then
				return false;
			end
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;
-------------------------个人押镖 高级
local map = MapInfoConfig[8071];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		--if not objMapSys:ExecTransforMap(1001,4) then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,-31,-98,5.5) then
				return false;
			end
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;
end;
-------------------------桃林迷阵01
local map = MapInfoConfig[8080];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	local MapId = 8080;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end

	if (sPoint.dwType == 1 ) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵02
local map = MapInfoConfig[8081];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local MapId = 8081;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end

	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false;
		end
	end
    return true;
end;
-------------------------桃林迷阵03
local map = MapInfoConfig[8082];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	local MapId = 8082;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end
	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵04
local map = MapInfoConfig[8083];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

	local MapId = 8083;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end
	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵05
local map = MapInfoConfig[8084];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local MapId = 8084;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end
	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵06
local map = MapInfoConfig[8085];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local MapId = 8085;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end
	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵07
local map = MapInfoConfig[8086];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local MapId = 8086;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end
	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵08
local map = MapInfoConfig[8087];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local MapId = 8087;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end
	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵09
local map = MapInfoConfig[8088];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local MapId = 8088;
	--获取正确数据
	local objWarSystem = objPlayer:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local Data = objWar.location[MapId]
	-----------离开副本
	---------------复活点
	if sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(MapId,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;
	end
	if (sPoint.dwType == 1) then
		if not WarAddition[10060]:Convey(objMapSys,sPoint.dwID,Data,MapId) then
			return false
		end
	end
    return true;
end;
-------------------------桃林迷阵10
local map = MapInfoConfig[8089];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 3 and sPoint.dwType == 1 then
		  if not objMapSys:ExecExitDuplXY(1002,6.11,15.77,5.5) then
		  --if not objMapSys:ExecExitDupl(1002,2) then
		  return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecExitDupl(8089,2) then
	    --if not objMapSys:ExecTransforMapXY(5002,-2.68,-25.16,5.5) then
			return false;
		end;

	end;
    return true;
end;

-------------------------侠客岛
local map = MapInfoConfig[8090];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local objWarSys = objPlayer:GetSystem("CWarSystem");
	if not objWarSys then
		return false;
	end;
	
	-----------离开副本
	if sPoint.dwID == 6 and sPoint.dwType == 1 then
		--if not objMapSys:ExecTransforMap(1001,4) then
		if objWarSys.dwCurWarID ~= 0 then
			objWarSys:Back();
		else
			if not objMapSys:ExecTransforMapXY(1002,6.11,15.77,5.5) then
				return false;
			end
		end;

	---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if objWarSys.dwCurWarID ~= 0 then
			-- objWarSys:Back();
			objMapSys:ExecTransforMap(8090,99)
		else
			if not objMapSys:ExecTransforMap(1002,99) then
			--if not objMapSys:ExecTransforMapXY(1002,-29.06,-48.56,5.5) then
				return false;
			end
		end;

	end;
    return true;	
end;


---------------------------------------------------------------------------------
-------------------------群侠副本01
local map = MapInfoConfig[6001];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then				--当前地图点
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then			--目标地图点
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	  -- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本02
local map = MapInfoConfig[6002];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本03
local map = MapInfoConfig[6003];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本04
local map = MapInfoConfig[6004];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本05
local map = MapInfoConfig[6005];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本06
local map = MapInfoConfig[6006];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本07
local map = MapInfoConfig[6007];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
	print( "---------------------------22222---------------------2222222-------------------------" )
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本08
local map = MapInfoConfig[6008];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本09
local map = MapInfoConfig[6009];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;
-------------------------群侠副本10
local map = MapInfoConfig[6010];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;
	local sysDupl = objPlayer:GetSystem("CDuplSystem");
	if not sysDupl then
		return false;
	end;
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  -- if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		-- return false;
	-- end;
		DoneWithExitDupl(1002,0,20,5.5,objMapSys,sysDupl);
	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		-- if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			-- return false;
	  -- end;
		DoneWithDeadDupl(1002,99,objMapSys,sysDupl)
	end;
    return true;
end;

-------------------------跨服战场
local map = MapInfoConfig[9999];
function map:TransMapEvent(sPoint,objPlayer, dwPointId)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	local sysScript = objPlayer:GetSystem("CScriptSystem");
	if not objMapSys then
		return false;
	end;
	print("map:TransMapEvent(sPoint,objPlayer)")
		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
		if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
		--if not objMapSys:ExecExitDupl(1004,99) then
			return false;
		end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		print("-------------dsfsdfsdfsfsdsf-------", dwPointId);
		if dwPointId then
			if not objMapSys:ExecTransforMap(9999,dwPointId) then
			--if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
				print("map:TransMapEvent(sPoint,objPlayer) err")
				return false;
			end;
		else
			if not objMapSys:ExecTransforMap(9999,99) then
			--if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
				print("map:TransMapEvent(sPoint,objPlayer) err")
				return false;
			end;
		end;
	end;
    return true;
end;

-------------------------卧虎藏龙
local map = MapInfoConfig[5075];
function map:TransMapEvent(sPoint,objPlayer)
	local objMapSys = objPlayer:GetSystem("CMapSystem");
	if not objMapSys then
		return false;
	end;

		-----------离开副本
	if sPoint.dwID == 2 and sPoint.dwType == 1 then
	  if not objMapSys:ExecExitDuplXY(1002,0,20,5.5) then
	  --if not objMapSys:ExecExitDupl(1004,99) then
		return false;
	end;

	  ---------------复活点
	elseif sPoint.dwID == 99 and sPoint.dwType == 4 then
		if not objMapSys:ExecTransforMap(1002,99) then
	    --if not objMapSys:ExecTransforMapXY(5001,-2.68,-25.16,5.5) then
			return false;
		end;
	end;
    return true;
end;
