_G.MovementConfig = {
	--[[[2001] =
	{	
		szDetailDes = 'sdfsdf',
		szDes = '每周四早上8点到晚上8点打怪双倍经验',
		szType = 'exp',
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwWeekDay = 5,
			dwTime = 8*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwWeekDay = 5,
			dwTime = 20*60*60,
		},
		szTimeLimit = '每周四早上8点到晚上8点',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 1,
		dwExpStar = 1,
		dwMoneyStar = 1,
		dwEquipStar = 1,
	},
	[2002] =
	{	
		szDetailDes = 'sdfsdf22',
		szDes = '劳动节早上8点到晚上8点打怪双倍经验',
		szType = 'exp',
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwMonth = 5,
			dwDay = 1,
			dwTime = 8*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwMonth = 5,
			dwDay = 1,
			dwTime = 20*60*60,
		},
		szTimeLimit = '劳动节早上8点到晚上8点',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 1,
		dwExpStar = 2,
		dwMoneyStar = 1,
		dwEquipStar = 1,
	},]]
	[2001] =
	{	
		szDetailDes = '每天中午12点~13点，晚上19点~20点，演武、挂机可获得双倍收益',
		szTimeDes = '',
		szDes = '每日双倍',
		szType = 'exp',
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwTime = 12*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwTime = 20*60*60,
		},
		szTimeLimit = '12:00与19:00',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 1,
		dwExpStar = 3,
		dwMoneyStar = 1,
		dwEquipStar = 1,
		NpcID = 0,
		bFly = 1,
	},
	[2002] =
	{	
		szDetailDes = '全天24小时开放，在野外地图刷新飞贼，击杀飞贼后可获得大量银两奖励',
		szTimeDes = '',
		szDes = '义擒飞贼',
		szType = nil,
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwTime = 1*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwTime = 24*60*60,
		},
		szTimeLimit = '全天24小时',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 1,
		dwExpStar = 1,
		dwMoneyStar = 3,
		dwEquipStar = 1,
		NpcID = 0,
		bFly = 0,
	},
	[2003] =
	{	
		szDetailDes = '击杀BOSS可获得极品装备掉落，还有几率掉落商城道具，请查看每日活动BOSS列表明细',
		szTimeDes = '',
		szDes = '野外BOSS',
		szType = nil,
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwTime = 1*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwTime = 24*60*60,
		},
		szTimeLimit = '全天24小时',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 1,
		dwExpStar = 3,
		dwMoneyStar = 3,
		dwEquipStar = 3,
		NpcID = 0,
		bFly = 0,
	},

	[2004] =
	{	
		szDetailDes = '等级25级可领取风云任务，有丰富的经验奖励和物品奖励，环任务每周日0点刷新',
		szTimeDes = '',
		szDes = '风云任务',
		szType = nil,
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwTime = 1*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwTime = 24*60*60,
		},
		szTimeLimit = '全天24小时',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 25,
		dwExpStar = 3,
		dwMoneyStar = 3,
		dwEquipStar = 2,
		NpcID = 10021100,
		bFly = 0,
	},
	[2005] =
	{	
		szDetailDes = '每周六，周日 9点-19点，演武，挂机可获得双倍收益',
		szTimeDes = '',
		szDes = '每周双倍',
		szType = 'exp',
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwWeekDay = 5,
			dwTime = 9*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwWeekDay = 6,
			dwTime = 19*60*60,
		},
		szTimeLimit = '每周六，日',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 1,
		dwExpStar = 3,
		dwMoneyStar = 1,
		dwEquipStar = 1,
		NpcID = 0,
		bFly = 1,
	},
	[2006] =
	{	
		szDetailDes = '世家战每周三20点开启持续1个小时，在襄阳城活动管理员处进入（13，20），参与活动可获得丰富的经验奖励与真气奖励',
		szTimeDes = '',
		szDes = '世家战',
		szType = nil,
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwWeekDay = 2,
			dwTime = 20*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwWeekDay = 2,
			dwTime = 22*60*60,
		},
		szTimeLimit = '周三，20点',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 25,
		dwExpStar = 3,
		dwMoneyStar = 1,
		dwEquipStar = 1,
		NpcID = 10021098,
		bFly = 1,
	},
	[200601] =
	{	
		szDetailDes = '世家战每周六20点开启持续1个小时，在襄阳城活动管理员处进入（13，20），参与活动可获得丰富的经验奖励与真气奖励',
		szTimeDes = '',
		szDes = '世家战',
		szType = nil,
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwWeekDay = 5,
			dwTime = 20*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwWeekDay = 5,
			dwTime = 22*60*60,
		},
		szTimeLimit = '周六，20点',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 25,
		dwExpStar = 3,
		dwMoneyStar = 1,
		dwEquipStar = 1,
		NpcID = 10021098,
		bFly = 1,
	},
	[2007] =
	{	
		szDetailDes = '恶人谷24小时开放，谷内凶险异常，通过襄阳城活动管理员处进入（-30，-45）',
		szTimeDes = '',
		szDes = '恶人谷',
		szType = nil,
		dwConfigValue = 1,
		dwValue = 0,
		--开启时间 启动
		setStartTime = 
		{
			dwTime = 1*60*60,
		},
		--开启时间 结束
		setEndTime = 
		{
			dwTime = 24*60*60,
		},
		szTimeLimit = '全天24小时',
		dwCountLimit = '无限制',
		dwLevelTop = 100,
		dwLevelDown = 45,
		dwExpStar = 3,
		dwMoneyStar = 1,
		dwEquipStar = 1,
		NpcID = 10021098,
		bFly = 1,
	},
}
------------------------------------------------------------------------------------------------------------------