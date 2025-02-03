-- 附加属性翻倍符配置
_G.GameBox360Config = {
	bBox = false;--测试数据
	
	dwIndex = 2241;--刷新编号
	
	Item = {--物品奖励
		{dwItemEnum=4902007;dwItemNumber=1;dwBindType=1};   --金锄头
		{dwItemEnum=5940006;dwItemNumber=5;dwBindType=1};   --真气丹（1万）
		{dwItemEnum=2400120;dwItemNumber=2;dwBindType=1};   --三倍经验丹
		{dwItemEnum=2500072;dwItemNumber=5;dwBindType=1};   --九花玉露丸·大
		{dwItemEnum=2500082;dwItemNumber=5;dwBindType=1};   --元气神通酒·大	
		{dwItemEnum=5919002;dwItemNumber=1;dwBindType=1};   --礼金券（888）·大			
	};
	
	szUrl = "http://s.1360.cn/yxdtfhl";--下载地址
	
	Notice = {--提示
		[1] = "很抱歉，在360游戏大厅登陆游戏方可领取1888元大礼包，点击确定立即下载.";
		[2] = "背包空间不足";
		[3] = "领取成功";
		[4] = "大侠已经领取过了";
		[5] = "领取奖励";
		[6] = "已领取";
	}; 
}