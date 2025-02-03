_G.BaiduPlayerConfig = {--百度影音推广配置

	--下载链接
	urlDownLoad = "http://dl.p2sp.baidu.com/BaiduPlayerContent/BaiduPlayerNetSetup_121.exe";
	--求个片
	urlPage = "http://zhidao.baidu.com/browse/1035?lm=0&video=1";
	
	Setup = --安装奖励
	{
		{
			dwItemEnum = 9405010;
			dwItemNumber = 3;
			dwBindType = 1;
		};
		{
			dwItemEnum = 4100140;
			dwItemNumber = 8;
			dwBindType = 1;
		};
		{
			dwItemEnum = 3900010;
			dwItemNumber = 18;
			dwBindType = 1;
		};
		{
			dwItemEnum = 5910003;
			dwItemNumber = 1;
			dwBindType = 1;
		};
		{
			dwItemEnum = 5920003;
			dwItemNumber = 1;
			dwBindType = 1;
		};		
		
	};
	
	Daily = --日常奖励
	{
		{
			dwItemEnum = 2400110;
			dwItemNumber = 1;
			dwBindType = 1;
		};
		{
			dwItemEnum = 5500020;
			dwItemNumber = 1;
			dwBindType = 1;
		};
		{
			dwItemEnum = 5600020;
			dwItemNumber = 1;
			dwBindType = 1;
		};
		{
			dwItemEnum = 4100290;
			dwItemNumber = 5;
			dwBindType = 1;
		};	
		{
			dwItemEnum = 4100210;
			dwItemNumber = 3;
			dwBindType = 1;
		};	
	
	};
	Text = --文本配置(不能改id)
	{
		[1] = T"您未安装百度影音！";
		[2] = T"背包空间不足！";
		[10] = T"领取安装奖励成功！";
		[11] = T"您已领取过安装奖励！";
		[20] = T"领取每日奖励成功！";
		[21] = T"您今日已经领取过每日奖励,请明日再来！";
	};
	
	BtnTxt = --按钮上的文字
	{
		[1] = T"立即下载";
		[2] = T"求个片";
		[3] = T"立即领取";
	};
	
	RecordUrl = --数据监控的网址（不要改）
	{
		--点击游戏界面活动按钮时
		[1] = "http://p2.youxi.bdimg.com/statics/tj.gif?type=in_game_coop&plat=plata&act=baiduplayer_coop&gamename=wj&gameId=508&clickFlag=check_button&userId=%s&rand=%s";
		--点击弹窗中下载按钮时：
		[2] = "http://p2.youxi.bdimg.com/statics/tj.gif?type=in_game_coop&plat=plata&act=baiduplayer_coop&gamename=wj&gameId=508&clickFlag=load_button&userId=%s&rand=%s";
		--安装礼包领取时
		[3] = "http://p2.youxi.bdimg.com/statics/tj.gif?type=in_game_coop&plat=plata&act=baiduplayer_coop&gamename=wj&gameId=508&clickFlag=setup_packs&userId=%s&rand=%s";
		--每日激活奖励领取时
		[4] = "http://p2.youxi.bdimg.com/statics/tj.gif?type=in_game_coop&plat=plata&act=baiduplayer_coop&gamename=wj&gameId=508&clickFlag=activate_award&userId=%s&rand=%s";
		--点击求个片按钮
		[5] = "http://p2.youxi.bdimg.com/statics/tj.gif?type=in_game_coop&plat=plata&act=baiduplayer_coop&gamename=wj&gameId=508&clickFlag=seek_film&userId=%s&rand=%s";
	};
	
}