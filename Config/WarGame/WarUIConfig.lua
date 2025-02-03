--战场的UI相关配置
--不同的战场需要显示不同的UI

_G.WarUIConfig =
{
	[10001] = 
	{
		"CUIWarMain";
		"CUIWarTrophy";
		"CUIWarSortBtn";
	};
	[10010] = 
	{
		"CUIWarLeader";
	};
	[10020] = 
	{
		"CUIWarScore";
	};
	[10040] = 
	{
		"CUIWarQingYunShuDao";
	};
	[10030] = 
	{
		"CUIWarTimePrize";
	};
	[10050] = 
	{
		"CUIEscortExitWnd";
	};
	[10051] = 
	{
		"CUIEscortExitWnd";
	};
	[10060] = 
	{
		"CUIWarShow";
	};
}

_G.WarForbidUI = 
{
	[10001] = 
	{
		--任务
		"CUITaskInformation";
		--变强
		"CMainTipSystem";
	};
	[10010] = 
	{
		--任务
		"CUITaskInformation";
		--变强
		"CMainTipSystem";
	};
	[10020] = 
	{
		--任务
		"CUITaskInformation";
		--变强
		"CMainTipSystem";
	};
	[10030] = 
	{
		--变强
		"CMainTipSystem";
	};	
	[10040] = 
	{
		--任务
		"CUITaskInformation";
		--变强
		"CMainTipSystem";
	};	
	[10060] = 
	{
		--任务
		"CUITaskInformation";
		--变强
		"CMainTipSystem";
	};	
}


--战场结束需要显示结束界面的战场
_G.WarEndShow = 
{
	[10001] = 1,
	[10010] = 1,
	[10020] = 1,
	[10030] = 1,
	[10040] = 1,
}


_G.TimePrize = 
{
	[8] = {
		dwItemEnum = 4100410;
		dwNumber = 1;
	};
	[20] = {
		dwItemEnum = 4100410;
		dwNumber = 1;
	};
}


