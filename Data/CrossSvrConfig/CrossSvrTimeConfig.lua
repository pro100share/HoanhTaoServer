--跨服战热更新配置文件

_G.CrossSvrHotUpdateConfig = 
{
	[10001] = 
	{
		--开放的时间  CrossSvrLoginConfig配置的文字也要改
		WeeklyOpenDay = {1};
		--创建时间
		CreateTime = -1;
		--提前通知活动开始时间
		NoticeStartTime = "19:50";
		--允许进入的开始时间
		EnterTime = "20:00";
		--允许进入的结束时间 
		StopEnterTime = "20:40";
		--结束时间
		ExitTime = "21:00";
	};
	
}


----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
_G.CrossSvrHotUpdate = {}

function CrossSvrHotUpdate:Reload()
	local szPath = "../Data/"
	dofile(szPath..'CrossSvrConfig/CrossSvrTimeConfig.lua')
	
	print('CrossSvrHotUpdate:Reload')
	if CCrossSvrManager then
		CCrossSvrManager:HotUpdate();
		CCrossSvrHoldManager:HotUpdate();
	end
end
