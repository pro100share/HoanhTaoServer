--服务器大事件配置


--事件类型
_G.eSeverEventType = {All = 0,System = 1,Achievement = 2}
--事件类型种数
_G.dwServerEventTypeNum = 2;

_G.ServerEventConfig = 
{
--每页事件条数
	dwPerBarNum = 15,
--系统显示
	szSystemName = '系统',
--开服描述配置
	szStartServer = [[服务器于 <font color='#31cf32'>%s-%s-%s</font> 开启]],
--开服时间格式
	-- szStartTime =[[@ <font color='#31cf32'>%s</font> 时 <font color='#31cf32'>%s</font> 分]],
	
--基本耗时格式
	szCompleteTime =[[<font color='#31cf32'>%s</font> 天 <font color='#31cf32'>%s</font> 时]],
--小于1小时格式
	szLessTime =[[小于1小时]],
	
--系统类大事件描述
	szSystemServerEventDescribe = 
	{
		[1] = '系统大事件1',
		[2] = '额外企鹅王企鹅全文',
	}
}


--隐藏成就大事件描述
_G.AchievementServerEventDescribe = 
{	
	[100300] = {szInfo = [[全服<font color='#31cf32'>第一个世家</font>创立]], szNoiceName = '首个世家'},
	
	[200200] = {szInfo = [[全服第一个<font color='#31cf32'>将好友列表加满</font>的玩家]], szNoiceName = '亲朋满座'},
	
	[300101] = {szInfo = [[全服第一个<font color='#31cf32'>等级达到40</font>的玩家]], szNoiceName = '后起之秀'},
	
	[300103] = {szInfo = [[全服第一个<font color='#31cf32'>等级达到60</font>的玩家]], szNoiceName = '仗剑江湖'},
	
	[300105] = {szInfo = [[全服第一个<font color='#31cf32'>等级达到80</font>的玩家]], szNoiceName = '扬名立万'},
	
	[600106] = {szInfo = [[全服第一个<font color='#31cf32'>连斩达到700连</font>的玩家]], szNoiceName = '七百连斩'},
	
	[700100] = {szInfo = [[打败<font color='#31cf32'>20个</font>玩家]], szNoiceName = '作恶多端'},
	[700101] = {szInfo = [[打败<font color='#31cf32'>200个</font>玩家]], szNoiceName = '黑榜恶人'},
	[700102] = {szInfo = [[打败<font color='#31cf32'>1000个</font>玩家]], szNoiceName = '无恶不作'},
	[700103] = {szInfo = [[打败<font color='#31cf32'>5000个</font>玩家]], szNoiceName = '混世魔王'},
	
	[700200] = {szInfo = [[消耗<font color='#31cf32'>50个</font> <font color='#31cf32'>九花玉露丸·大</font>]], szNoiceName = '无垠生命'},
	[700201] = {szInfo = [[消耗<font color='#31cf32'>200个</font> <font color='#31cf32'>九花玉露丸·大</font>]], szNoiceName = '生命之光'},
	
	[700300] = {szInfo = [[消耗<font color='#31cf32'>50个</font> <font color='#31cf32'>元气通神酒·大</font>]], szNoiceName = '精力充沛'},
	[700301] = {szInfo = [[消耗<font color='#31cf32'>200个</font> <font color='#31cf32'>元气通神酒·大</font>]], szNoiceName = '真气之灵'},
	
	[700500] = {szInfo = [[被怪杀死<font color='#31cf32'>50次</font>]], szNoiceName = '厄运缠身'},
	
	[700600] = {szInfo = [[消耗<font color='#31cf32'>10个 洗点符</font>]], szNoiceName = '完美加点'},
	

	[700701] = {szInfo = [[消耗<font color='#31cf32'>200个 千里传音</font>]], szNoiceName = '噪音声源'},
	[700702] = {szInfo = [[消耗<font color='#31cf32'>3000个 千里传音</font>]], szNoiceName = '海枯石烂'},
	[700703] = {szInfo = [[消耗<font color='#31cf32'>9999个 千里传音</font>]], szNoiceName = '衣食父母'},
	
	[700801] = {szInfo = [[释放无双<font color='#31cf32'>1000次</font>]], szNoiceName = '厄运之灵'},
	
	
	
}
