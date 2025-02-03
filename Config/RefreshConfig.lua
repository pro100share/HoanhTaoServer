
--dwValue:更新数值
--szUpdate:更新时间
--bNoUpdate:不更新
_G.RefreshConfig = {
	[0101] = { dwValue = 50, szUpdate = "06:30" },--宝甲失败增加经验
	[0102] = { dwValue = 50, szUpdate = "06:30" },--名剑失败增加经验
	[0103] = { dwValue = 50, szUpdate = "06:30" },--坐骑失败增加经验
	[0104] = { dwValue = 50, szUpdate = "06:30" },--装备强化失败增加经验
	[0105] = { dwValue = 50, szUpdate = "06:30" },--实战境界失败增加经验
	[0106] = { dwValue = 50, szUpdate = "06:30" },--洗炼数值失败增加经验
	
	[0201] = { dwValue = 0, szUpdate = "06:00" },--天官赐福刷新
	
	[0301] = { dwValue = 0, szUpdate = "00:00" },--威望任务刷新
	
	[0401] = { dwValue = 0, szUpdate = "00:00" },--每日奖励刷新
	
	[0501] = { dwValue = 0, szUpdate = "00:00" },--副本进入刷新
	
	[0601] = { dwValue = 0, szUpdate = "00:00" },--风云任务刷新
	
	[0701] = { dwValue = 0, szUpdate = "00:00" },--VIP奖励刷新
	
	[0801] = { dwValue = 3, szUpdate = "00:10" },--赌博次数刷新
	[0802] = { dwValue = 3, szUpdate = "00:10" },--改运次数刷新
	[0803] = { dwValue = 0, szUpdate = "00:10" },--赌博结果刷新
	
	[0901] = { dwValue = 15, szUpdate = "00:20" },--伴侣送礼刷新
	
	[1001] = { dwValue = 10, szUpdate = "00:30" },--挖宝次数刷新
	
	[1101] = { dwValue = 0, szUpdate = "00:00" },--评价次数刷新
	
	[2101] = { dwValue = 0, szUpdate = "00:00" },--免费修改索引次数的刷新
	
	[2102] = { dwValue = 0, szUpdate = "00:00" },--商城折扣抽奖的刷新次数
	
	[2222] = { dwValue = 0, szUpdate = "00:00", bNoUpdate=true },--元宵灯会
	[2223] = { dwValue = 0, szUpdate = "00:00", bNoUpdate=true },--元宵灯会领奖状态
	
	[2231] = { dwValue = 0, szUpdate = "00:00" },--重复/侠义任务 每日次数
	[2232] = { dwValue = 0, szUpdate = "00:00" },--活动 任务 每日次数
	
	[2241] = { dwValue = 0, szUpdate = "00:00", bNoUpdate=true },--360游戏盒子
}
