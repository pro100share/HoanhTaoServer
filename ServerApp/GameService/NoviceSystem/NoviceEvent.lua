--事件管理器
_G.CNoviceEventManager = {}

function CNoviceEventManager:new(objSys)
	local obj = {}
	setmetatable(obj,{ __index = CNoviceEventManager })
	obj.objSys = objSys
	obj.tabEventClassList = {}
	table.insert(obj.tabEventClassList,CNoviceCommonEvent)
	table.insert(obj.tabEventClassList,CNoviceTaskEvent)
	table.insert(obj.tabEventClassList,CNoviceLevelEvent)
	return obj
end

--生成事件
function CNoviceEventManager:CreateEvent(dwGuideId,dwEventId)
	local eType,tabInfo = self:LoadEventInfo(dwEventId)
	if not tabInfo then return end
	tabInfo.dwGuideId = dwGuideId
	for k,v in pairs(self.tabEventClassList) do
		if v.eType == eType then
			local objEvent = v:new(self.objSys,tabInfo)
			objEvent:Register()
		end
	end
end

--读取事件
function CNoviceEventManager:LoadEventInfo(dwEventId)
	for eType,tabList in pairs(NoviceGuideEventConfig) do
		local tabInfo = tabList[dwEventId]
		if tabInfo then
			local tabEvent = {}
			for k,v in pairs(tabInfo) do
				tabEvent[k] = v
			end
			tabEvent.dwEventId = dwEventId
			return eType,tabEvent
		end
	end
end;
-----------------------------------------------------------------------------
--扩展管理器基类
_G.CNoviceBaseEvent = {}
function CNoviceBaseEvent:new(objSys,tabInfo)
	local obj = {}
	setmetatable(obj,{ __index = self })
	obj.tabData = tabInfo
	obj.objSys = objSys
	return obj
end
--注册
function CNoviceBaseEvent:Register()
end
--通知
function CNoviceBaseEvent:Notify(...)
end
--检查
function CNoviceBaseEvent:Check(...)
end
-----------------------------------------------------------------------------
--普通事件管理
_G.CNoviceCommonEvent = setmetatable({},{__index = CNoviceBaseEvent})
CNoviceCommonEvent.eType = enNoviceGuideEventType.eCommon
--注册
function CNoviceCommonEvent:Register()
	local szEvent = self.tabData.strEventName
	self.objSys:Register(szEvent,self)
end
--通知
function CNoviceCommonEvent:Notify(...)
	self.objSys:GetPlayer().OnNoviceGuideCommonEventMsg { TabInfo = self.tabData }
end
--检查
function CNoviceCommonEvent:Check(...)
	return true
end
-----------------------------------------------------------------------------
--任务事件管理
_G.CNoviceTaskEvent = setmetatable({},{__index = CNoviceBaseEvent})
CNoviceTaskEvent.eType = enNoviceGuideEventType.eTask
--注册
function CNoviceTaskEvent:Register()
	local temp = {}
	temp[1] = 'EventAcceptTask'
	temp[2] = 'EventDoneTask'
	temp[3] = 'EventCompleteTask'
	temp[4] = 'EventArriveTask'
	local szEvent = temp[self.tabData.dwTaskState]
	self.objSys:Register(szEvent,self)
end
--通知
function CNoviceTaskEvent:Notify(...)
	self.objSys:GetPlayer().OnNoviceGuideTaskEventMsg { TabInfo = self.tabData }
end
--检查
function CNoviceTaskEvent:Check(...)
	local argv = {...}
	if self.tabData.dwTaskId == argv[2] then
		return true
	end
end
-----------------------------------------------------------------------------
--升级事件管理
_G.CNoviceLevelEvent = setmetatable({},{__index = CNoviceBaseEvent})
CNoviceLevelEvent.eType = enNoviceGuideEventType.eLevel
--注册
function CNoviceLevelEvent:Register()
	self.objSys:Register('EventLevelUp',self)
end
--通知
function CNoviceLevelEvent:Notify(...)
	local argv = {...}
	local tabInfo = { dwLevel = argv[2] }
	self.objSys:GetPlayer().OnNoviceGuideLevelEventMsg { TabInfo = tabInfo }
end
--检查
function CNoviceLevelEvent:Check(...)
	local argv = {...}
	if self.tabData.dwLevel <= argv[2] then
		return true
	end
end
