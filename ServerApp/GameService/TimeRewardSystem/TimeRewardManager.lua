--[[
功能：在线奖励 系统 管理器（服务器）
作者：周长沙
时间：2013-4-7
]]
---------------------------------------
_G.CTimeRewardManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CTimeRewardManager,true);

CTimeRewardManager.Info = {}

CAlarmClock:AddTask({dwTime = "00:05"}, CAlarmTaskCycleType.eDay, 1, 0,
		function() CTimeRewardManager:OnOneDayEnd() end, {}
	)
--->Base
--初始化
function CTimeRewardManager:Create()
	self:SendAskForServerInfo()
	return true
end
--更新
function CTimeRewardManager:Update()
	return true	
end
--销毁
function CTimeRewardManager:Destroy()
	return true
end

function CTimeRewardManager:OnOneDayEnd()
	for _,objPlayer in pairs(CPlayerManager.setAllPlayerByRoleID) do
		local sys = objPlayer:GetSystem("CTimeRewardSystem")
		sys:OnOneDayEnd()
	end
end
---------------------------------------------
---> Func
--获得服务器开启时间
function CTimeRewardManager:GetServerStartTime()
	return self.Info.dwStartTime or GetCurTime()
end
---------------------------------------------
---> Recv
--KS-->服务器信息
function CTimeRewardManager:OnRecvServerInfo(Info)
	self.Info = Info or {}
	CCommercialActManager:InitCommercialAct()
	CMovementSystemMgr:CreateAllMovement()
end
---------------------------------------------
--->Send
--请求服务器信息-->KS
function CTimeRewardManager:SendAskForServerInfo()
	CKernelApp.OnGSAskForServerTimeInfoMsg{LineID = CKernelApp.dwLineID}
end



























