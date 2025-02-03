--[[
	游戏日志系统
	2012-12-18   段磊磊
--]]

_G.CLogSystem = {}
function CLogSystem:new()
	local obj = CSystem:new("CLogSystem");
	for i,v in pairs(CLogSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
----------------------------------------------------------------------------------------------------------------------------------
function CLogSystem:Create(bIsChangeLine)
	--if not bIsChangeLine then end
	if bIsChangeLine == 0 then end
	return true;
end
function CLogSystem:Update(dwInterval)
	return true;
end
function CLogSystem:Destroy()
end
----------------------------------------------------------------------------------------------------------------------------------
--事件中心响应的日志函数
function CLogSystem:EventCompleteTask(dwTaskNum,dwTaskID,szTaskType)
	CLogSystemManager:task( self:GetPlayer(), dwTaskID, szTaskType )
end
function CLogSystem:EventBeKilled(dwTaskNum,dwEnID,szDeathType)
	CLogSystemManager:death( self:GetPlayer(), szDeathType );
end
function CLogSystem:EventAcceptTask(dwTaskNum,dwTaskID,szTaskType)
	CLogSystemManager:accept_task(self:GetPlayer(),dwTaskID,szTaskType)
end
function CLogSystem:EventLevelUp()
	CLogSystemManager:upgrade(self:GetPlayer())
end
--日志函数end

--事件中心
function CLogSystem:OnEventCenter(strEventName , ...)
	if CLogSystemManager[strEventName] and type(CLogSystemManager[strEventName])=='function' then
		CLogSystemManager[strEventName](...)
	end
end