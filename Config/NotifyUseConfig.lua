
--提示玩家使用贵重物品的配置
--ID在 NoticeIconConfig 中
_G.NotifyUseSystemConfig = {
	FlyIcon = 20;		--飞出来的图标
	WuXingIcon = 21;		--五行的图标信息
	TaskIcon = 22;		--任务的图标信息
	AchieveIcon = 23;	--成就的图标信息
	--NotifyTime = 3600*1000;	--提示的时间间隔，单位毫秒
	NotifyTime = {
		{ 1,  19, 1800*1000 },
		{ 20, 200, 3600*1000 },
	};
	ButtonName = { "查看", "使用" };
	WuXingTips = "当前<font color='#FF0000'> 五行真气 </font>已满，请及时使用，避免浪费！";
	TaskTips = "您有任务<font color='#FF0000'> %s </font>未完成！";
	AchieveTips = "您当前有<font color='#FF0000'> 成就奖励 </font>未领取！";
	ItemTips = "您有 <font color='#00FF00'>%d</font> 个 <font color='#FF0000'>%s</font> 未使用！";
	ItemEnum = {--需要提示的物品的配置ID
		5500040,5500050,5500060,2500070,2500071,2500072,2500080,2500081,2500082,2300010,2300020,2300030,2300040,2300050,2300110,2300120,2300130,2300140,2300150,2300230,2400110,2400120,5500640,
	};
};
