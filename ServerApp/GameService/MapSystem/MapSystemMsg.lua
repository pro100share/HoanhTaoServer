--[[
功能：地图系统消息处理
作者：周华杰
时间：2011-12-22
]]
--------------------------------------------------------------------------
--玩家选择游戏线路
define.SelectGameLineMsg
{
	user = NONE,
	GameLine = 0,
}
when{ user = NONE }
SelectGameLineMsg = checkUser
when{ }
function SelectGameLineMsg(user,GameLine)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:SelectGameLine(GameLine);
end; 

--获取线路信息
define.GetGameLineInfoMsg
{
	user = NONE,
	GameLine = 0, --需要的线路id，如果为0默认返回所有的线路
}
when{ user = NONE }
GetGameLineInfoMsg = checkUser
when{ }
function GetGameLineInfoMsg(user,GameLine)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:GetGameLineInfo(GameLine);
end;

--------------------------------------------------------------------
--玩家进入游戏
define.EnterGameMsg
{
	user = NONE, 
}
when{ user = NONE }
EnterGameMsg = checkUser
when{ }
function EnterGameMsg(user) 
    local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end; 
	mapSystem:EnterGame();
end


--玩家切换地图,toMapID由服务器端决定
define.ChangeMapRequestMsg
{
	user = NONE, 
}
when{ user = NONE }
ChangeMapRequestMsg = checkUser
when{ }
--quying chg 2012-04-21
function ChangeMapRequestMsg(user)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:ChangeMapRequest();
end
--玩家切换地图（大地图）
define.MapAskForChangeMapMsg
{
	user = NONE;
	MapId = 0;
	Vip = 0;
}
when{ user = NONE }
MapAskForChangeMapMsg = checkUser
when{ }
function MapAskForChangeMapMsg(user,MapId,Vip)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:MapAskForChangeMap(MapId,Vip);
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
define.SetMePosMsg
{
	user = NONE, 
	XPos = 0,
	YPos = 0,
}
when{ user = NONE }
SetMePosMsg = checkUser
when{ }
function SetMePosMsg(user,XPos,YPos)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:UpdatePos(XPos,YPos)
	-- mapSystem.fXPos = XPos;
	-- mapSystem.fYPos = YPos;
end
--------------------------------------------------------------------------------------------
--玩家请求当前地图上的玩家信息
define.ReadRoleRequestMsg
{
	user = NONE, 
	RoleID = 0,
}
when{ user = NONE }
ReadRoleRequestMsg = checkUser
when{ }
function ReadRoleRequestMsg(user,RoleID)
   local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:ReadRoleRequest(RoleID);
end

define.DoEnterSceneMsg
{
	user = NONE,
	InitGame=0,
}
when{ user = NONE }
DoEnterSceneMsg = checkUser
when{ }
function DoEnterSceneMsg(user,InitGame)
   local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:DoEnterScene(InitGame);
end

--移动请求
define.MoveToRequestMsg
{
	user = NONE; 
	XSrc = 0;
	YSrc = 0;
	XDis = 0;
	YDis = 0;
	SpeedB = 0;
	SpeedA = 0;
	SpeedP = 0;
	UseCanTo = false;
}
when{ user = NONE }
MoveToRequestMsg = checkUser
when{ }
function MoveToRequestMsg(user,XSrc,YSrc,XDis,YDis,SpeedB,SpeedA,SpeedP,UseCanTo) 
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	SpeedB = SpeedB/137;
	SpeedA = SpeedA/139;
	SpeedP = SpeedP/127;
	mapSystem:MoveToRequest(XSrc,YSrc,XDis,YDis,UseCanTo,SpeedB,SpeedA,SpeedP);
end

--停止移动
define.MoveStopRequestMsg
{
	user = NONE; 
	XStop = 0;
	YStop = 0;
	DirValue = 0; 
}
when{ user = NONE }
MoveStopRequestMsg = checkUser
when{ }
function MoveStopRequestMsg( user,XStop,YStop,DirValue )
    local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:MoveStopRequest(XStop,YStop,DirValue);
end;

--玩家切换游戏线路
define.ChgMapStateMsg
{
	user = NONE,
	OpenFlag = false;
}
when{ user = NONE }
ChgMapStateMsg = checkUser
when{ }
function ChgMapStateMsg(user,OpenFlag)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	mapSystem:ChgMapState(OpenFlag);
end; 

--角色退出地图倒计时时间到了
define.OnCountDownOverMsg
{
	user = NONE,
}
when{ user = NONE }
OnCountDownOverMsg = checkUser
when{ }
function OnCountDownOverMsg(user)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	
	local objMap = mapSystem:GetCurMap();
	if objMap then
		objMap:CountDownOver(user);
	end
end;

--客户端重新申请创建角色
define.OnRequestRoleInfoMsg
{
	user = NONE;
	RoleID = 0;
}
when{ user = NONE }
OnRequestRoleInfoMsg = checkUser
when{ }
function OnRequestRoleInfoMsg(user,RoleID)
	-- print("===OnRequestRoleInfoMsg=")
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	
	mapSystem:RequestCreateRole(RoleID)
end;


define.ClientSpeedCheckMsg
{
	user = NONE;
	SpeedB = 0;
	SpeedA = 0;
	SpeedP = 0;
}
when{ user = NONE }
ClientSpeedCheckMsg = checkUser
when{ }
function ClientSpeedCheckMsg(user,SpeedB,SpeedA,SpeedP)
	local mapSystem = user:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	
	mapSystem:SpeedCheckAgain(SpeedB,SpeedA,SpeedP);
end;

