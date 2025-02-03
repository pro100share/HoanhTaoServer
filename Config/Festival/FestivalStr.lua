


--活动中的文字模板
_G.TextTemplates={
	[1801] = "新服开启后，总累计充值达指定金额，可领取丰厚奖励" ;
	[1802] = "开服%s天后，%s排行榜上指定名次的玩家可以领取相应奖励" ;
	[1803] = "开服%s天后，龙鼎战占领亢龙鼎的世家家主和成员将获得奖励" ;
	[1804] = "开服%s-%s天内，每天累计充值达指定金额可领取丰厚奖励" ;
	[1805] = "开服%s-%s天内，总累计充值达指定金额可领取丰厚奖励" ;
	[1806] = "开服%s-%s天内，每天充值都达到%s元宝，可领取丰厚奖励" ;
	[1807] = "开服%s-%s天内，消耗指定道具，可兑换丰厚奖励" ;
	
	[11] = "活动期间，每天累计充值达指定金额可领取丰厚奖励" ;
	[12] = "活动期间，总累计充值达指定金额可领取丰厚奖励" ;
	[13] = "活动期间，每天充值都达到%s元宝，可领取丰厚奖励" ;
	[14] = "活动期间，总累计消费达指定金额可领取丰厚奖励" ;
	[15] = "活动期间，消耗指定道具，可兑换丰厚奖励" ;
	[16] = "活动期间，%s达到指定等阶的玩家可领取%s回馈奖励" ;
	[17] = "活动期间，可限量购买特价道具" ;
	
	[18011] = "购买VIP礼包成为VIP的玩家" ;
	[18012] = "累计充值达%s元宝" ;
	[18021] = "开服%s天后，%s榜第%s名的大侠" ;
	[18022] = "开服%s天后，%s榜第%s-%s名的大侠" ;
	[18023] = "开服%s天后，%s榜中名次尾数为1的大侠" ;
	[18031] = "开服%s天后，占领亢龙鼎的世家%s" ;
	
	[111] = "每天累计充值达%s元宝" ;
	[121] = "活动期间总累计充值达%s元宝" ;
	[131] = "累计1天充值达%s元宝" ;
	[132] = "累计%s天充值都达%s元宝" ;
	[141] = "活动期间累计消费达880元宝" ;
	[171] = "%s<br/>特价：%s元宝" ;
}


_G.FestivalStr = {
	szIcon = "DuoRenTouXiang.png";
	szBtn = "领取";
	szBuy = "购买";
	CutDown = {
		[0] = "活动剩余时间:";
		[1] = "活动剩余时间:";
		[2] = "活动剩余时间:";
		[3] = "活动剩余时间:";
		[4] = "活动剩余时间:";
		[5] = "活动剩余时间:";
		[6] = "活动剩余时间:";
	};
	Mount = {--坐骑回馈 阶数与模型 对应配置  --别配123
		[4] = 90402;
		[5] = 90503;
		[6] = 90603;
		[7] = 90701;
		[8] = 90801;
		[9] = 90901;
		[10] = 100901;
	};
	Bourn = {--实战回馈 图片配置
		[1] = 'bourn_1.png';-- 'bourn1.png'
		[2] = 'bourn_2.png';
		[3] = 'bourn_3.png';
		[4] = 'bourn_4.png';
		[5] = 'bourn_5.png';
		[6] = 'bourn_6.png';
		[7] = 'bourn_7.png';
		[8] = 'bourn_8.png';
		[9] = 'bourn_9.png';
	};
	
	
	[0] = "无";
	[1] = "活动剩余时间:";
	[2] = "领奖剩余时间:";
	[3] = "%d天%d时%d分";
	[4] = "未满足条件";
	[5] = "已满足条件";
	[6] = 13101610001;--游戏币不足
	[7] = 13101610002;--礼金不足
	[8] = 13101610003;--元宝不足
	[9] = 13101610004;--物品数量不足
	[10] = 13101610005;--背包空间不足
	[11] = 13101610006;--%s活动已开启，您可以通过点击主界面右上角对应的活动按钮查看活动内容
	[12] = 13101610007;--%s活动已结束，后续将推出更精彩的活动，敬请期待
	[13] = "请选择一个奖励！";
	[14] = "可购买: %d次";
	[15] = [[<p align="right">剩余领取次数：%d</p>]];
	[16] = "<font color='#dcd9d9'>今日累计充值:<font color='#fed904'  size='20'>%d元宝</font>";
	[17] = "<font color='#dcd9d9'>本中累计充值:<font color='#fed904' size='20'>%d元宝</font>";
	[18] = "<font color='#dcd9d9'>单笔最大充值:<font color='#fed904' size='20'>%d元宝</font>";
	[19] = "<font color='#dcd9d9'>开服至今累计充值:<font color='#fed904' size='20'>%d元宝</font>";
	[20] = "%d 元宝";
	[21] = "还需充值：%d(本日)";
	[22] = "还需充值：%d(本周)";
	[23] = "还需充值：%d(不限时)";
	[24] = "还需充值：%d(单笔)";
	[25] = "未满足领取条件";
	[26] = "点击打开充值页面";
	[27] = "永久";
	[28] = "<font color='#dcd9d9'>活动期间已累计充值:<font color='#fed904' size='20'>%d元宝</font>";
	[29] = "<font color='#dcd9d9'>活动期间已累计消费:<font color='#fed904' size='20'>%d元宝</font>";
	[30] = "<font color='#dcd9d9'>循环活动</font>";
	
	[10001] ="<font color='#00FF00'>活动时间内，累计充值达<font color='#FF0000'>指定金额</font>可领取<font color='#FF0000'>江湖绝学</font>和<font color='#FF0000'>充值奖励</font>"; --累计充值活动
	[10002] ="<font color='#FFFFFF'>购买<font color='#FF0000'>VIP礼包</font>成为<font color='#FF0000'>VIP</font>的玩家可领取<font color='#FF0000'>VIP奖励</font></font>"; --388
    [10003] ="<font color='#00FF00'>累计充值达<font color='#FF0000'>588</font>元宝可领取<font color='#FF0000'>北冥神功</font>以及<font color='#FF0000'>丰厚充值奖励</font></font>";--588
    [10004] ="<font color='#FFFF00'>累计充值达<font color='#FF0000'>888</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--888
    [10005] ="<font color='#FF9900'>累计充值达<font color='#FF0000'>1288</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--1288
    [10006] ="<font color='#00FFFF'>累计充值达<font color='#FF0000'>1888</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--1888
    [10007] ="<font color='#0066FF'>累计充值达<font color='#FF0000'>2688</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--2688
    [10008] ="<font color='#FF00CC'>累计充值达<font color='#FF0000'>3888</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--3888

	[20001] ="<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";
    [20002] ="<font color='#FFFFFF'>活动期间，每天累计充值达<font color='#FF0000'>88</font>元宝可领取一份奖励，每天最多领取1次</font>";
	[20003] ="<font color='#00FF00'>活动期间，每天累计充值达<font color='#FF0000'>500</font>元宝可领取一份奖励，每天最多领取1次</font>";
    [20004] ="<font color='#FFFF00'>活动期间，每天累计充值达<font color='#FF0000'>1000</font>元宝可领取一份奖励，每天最多领取1次</font>";
    [20005] ="<font color='#FF9900'>活动期间，每天累计充值达<font color='#FF0000'>2000</font>元宝可领取一份奖励，每天最多领取2次</font>";
    [20006] ="<font color='#00FFFF'>活动期间，每天累计充值达<font color='#FF0000'>5000</font>元宝可领取一份奖励，每天最多领取2次</font>";
	[20007] ="<font color='#0033FF'>活动期间，总共累计充值达<font color='#FF0000'>20000</font>元宝可领取一份奖励，每天最多领取1次</font>";--描述
	[20008] ="<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20009] ="<font color='#0033FF'>活动期间，总共累计充值达<font color='#FF0000'>50000</font>元宝可领取一份奖励，每天最多领取1次</font>";--描述
	[20010] ="<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20011] ="<font color='#0033FF'>活动期间，总共累计充值达<font color='#FF0000'>100000</font>元宝可领取一份奖励，每天最多领取1次</font>";--描述
	[20012] ="<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20013] ="<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20014] ="<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20015] ="<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20016] ="<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20017] ="<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20018] ="<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	
	
[1000]= "<font color='#FF0000'>开服<font color='#FF0000'>3天</font>后第一次龙鼎战占据<font color='#FF0000'>亢龙鼎</font>的世家，<font color='#FF0000'>家主</font>和<font color='#FF0000'>世家成员</font>将获得奖励";--规则
[1001]= "开服<font color='#FF0000'>7天</font>内,购买并成为<font color='#FF0000'>VIP</font>的玩家，可领取<font color='#FF0000'>VIP回馈奖励</font>";--规则
[1002]= "<font color='#00FF00'>活动时间内，累计充值达<font color='#FF0000'>指定金额</font>可领取<font color='#FF0000'>江湖绝学</font>和<font color='#FF0000'>充值奖励</font>";--规则
[2000]= "<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2001]= "<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2002]= "<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2003]= "<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2004]= "<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2005]= "<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2006]= "<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2007]= "<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2008]= "<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2009]= "<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2010]= "<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2011]= "<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2012]= "<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2013]= "<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2014]= "<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2015]= "<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2016]= "<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2017]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2018]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2019]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2020]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2021]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2022]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2023]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2024]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2025]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2026]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2027]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2028]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2029]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2030]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2031]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2032]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2033]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2034]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2035]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2036]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2037]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2038]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2039]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2040]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2041]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2042]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2043]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2044]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2045]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2046]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2047]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2048]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2049]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2050]= "<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2051]= "<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2052]= "<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2053]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2054]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2055]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2056]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2057]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2058]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2059]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2060]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2061]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2062]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2063]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2064]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3000]= "<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3001]= "<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3002]= "<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3003]= "<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3004]= "<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3005]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3006]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3007]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3008]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3009]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3010]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3011]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3012]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3013]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3014]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3015]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3016]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3017]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3018]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3019]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3020]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4000]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4001]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4002]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4003]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4004]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4005]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4006]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4007]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4008]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4009]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4010]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4011]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4012]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4013]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4014]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4015]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4016]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4017]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4018]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4019]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4020]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4021]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4022]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4023]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4024]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4025]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4026]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4027]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4028]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4029]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4030]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4031]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4032]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4033]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4034]= "<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4035]= "<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4036]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4037]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4038]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4039]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4040]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4041]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4042]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4043]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4044]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4045]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4046]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4047]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[5000]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5001]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5002]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5003]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5004]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5005]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5006]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5007]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5008]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5009]= "<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5010]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5011]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5012]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[6000]= "<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6001]= "<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6002]= "<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6003]= "<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6004]= "<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6005]= "<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6006]= "<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6007]= "<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6008]= "<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6009]= "<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6010]= "<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6011]= "<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6012]= "<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6013]= "<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6014]= "<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6015]= "<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6016]= "<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6017]= "<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6018]= "<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6019]= "<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6020]= "<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	



[100001]= "世家家主奖励";--描述
[100002]= "世家成员奖励";--描述
[100003]= "使用<font color='##00FF00'>新秀帖</font>成为VIP";--描述
[100004]= "使用<font color='##00FF00'>少侠帖</font>成为VIP";--描述
[100005]= "使用<font color='##00FF00'>贵宾贴</font>成为VIP";--描述
[100006]= "<font color='#FFFFFF'>购买<font color='#FF0000'>VIP礼包</font>成为<font color='#FF0000'>VIP</font>的玩家可领取</font>";--描述
[100007]= "<font color='#00FF00'>累计充值达<font color='#FF0000'>888</font>元宝可领取</font>";--描述
[100008]= "<font color='#FFFF00'>累计充值达<font color='#FF0000'>1888</font>元宝可领取</font>";--描述
[100009]= "<font color='#FF9900'>累计充值达<font color='#FF0000'>3888</font>元宝可领取</font>";--描述
[100010]= "<font color='#00FFFF'>累计充值达<font color='#FF0000'>5888</font>元宝可领取</font>";--描述
[100011]= "<font color='#0066FF'>累计充值达<font color='#FF0000'>8888</font>元宝可领取</font>";--描述
[100012]= "<font color='#FF00CC'>累计充值达<font color='#FF0000'>18888</font>元宝可领取</font>";--描述
[100013]= "<font color='#FF00CC'>累计充值达<font color='#FF0000'>50000</font>元宝可领取</font>";--描述
[100014]= "<font color='#FF00CC'>累计充值达<font color='#FF0000'>100000</font>元宝可领取</font>";--描述
[200001]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200002]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200003]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200004]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200005]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200006]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200007]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200008]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200009]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200010]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200011]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200012]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200013]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200014]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200015]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200016]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200017]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200018]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200019]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200020]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200021]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200022]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200023]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200024]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200025]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200026]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200027]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200028]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200029]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200030]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200031]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200032]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200033]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200034]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200035]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200036]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200037]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200038]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200039]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200040]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200041]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200042]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200043]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200044]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200045]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200046]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200047]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200048]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200049]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200050]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200051]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200052]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200053]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200054]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200055]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200056]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200057]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200058]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200059]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200060]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200061]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200062]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200063]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200064]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200065]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200066]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200067]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200068]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200069]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200070]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200071]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200072]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200073]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200074]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200075]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200076]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200077]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200078]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200079]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200080]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200081]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200082]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200083]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200084]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200085]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200086]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200087]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200088]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200089]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200090]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200091]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200092]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200093]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200094]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200095]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200096]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200097]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200098]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200099]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200100]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200101]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200102]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200103]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200104]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200105]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200106]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200107]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200108]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200109]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200110]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200111]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200112]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200113]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200114]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200115]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200116]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200117]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200118]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200119]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200120]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200121]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200122]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200123]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200124]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200125]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200126]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200127]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200128]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200129]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200130]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200131]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200132]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200133]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200134]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200135]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200136]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200137]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200138]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200139]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200140]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200141]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200142]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200143]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200144]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200145]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200146]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200147]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200148]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200149]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200150]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200151]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200152]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200153]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200154]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200155]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200156]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200157]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200158]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200159]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200160]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200161]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200162]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200163]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200164]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200165]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200166]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200167]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200168]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200169]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200170]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200171]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200172]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200173]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200174]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200175]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200176]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200177]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200178]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200179]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200180]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200181]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200182]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200183]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200184]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200185]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200186]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200187]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200188]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200189]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200190]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200191]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200192]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200193]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200194]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200195]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200196]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200197]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200198]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200199]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200200]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200201]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200202]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200203]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200204]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200205]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200206]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200207]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200208]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200209]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200210]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200211]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200212]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200213]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200214]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200215]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200216]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200217]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200218]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200219]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200220]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200221]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200222]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200223]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200224]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200225]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200226]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200227]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200228]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200229]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200230]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200231]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200232]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200233]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200234]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200235]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200236]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200237]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200238]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200239]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200240]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200241]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200242]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200243]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200244]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200245]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200246]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200247]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200248]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200249]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200250]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200251]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200252]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200253]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200254]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200255]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200256]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200257]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200258]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200259]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200260]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200261]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200262]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200263]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200264]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200265]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200266]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200267]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200268]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200269]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200270]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200271]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200272]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200273]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200274]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200275]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200276]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200277]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200278]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200279]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200280]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200281]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200282]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200283]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200284]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200285]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200286]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200287]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200288]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200289]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200290]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200291]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200292]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200293]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200294]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200295]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200296]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200297]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200298]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200299]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200300]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200301]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200302]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200303]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200304]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200305]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200306]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200307]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200308]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200309]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200310]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200311]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200312]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200313]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200314]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200315]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200316]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200317]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200318]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200319]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200320]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200321]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200322]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200323]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200324]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200325]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200326]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200327]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200328]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200329]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200330]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200331]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200332]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200333]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200334]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200335]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200336]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200337]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200338]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200339]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200340]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200341]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200342]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200343]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200344]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200345]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200346]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200347]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200348]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200349]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200350]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200351]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200352]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200353]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200354]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200355]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200356]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200357]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200358]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200359]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200360]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200361]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200362]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200363]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200364]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200365]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200366]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200367]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200368]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200369]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200370]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200371]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200372]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200373]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200374]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200375]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200376]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200377]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200378]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200379]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200380]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200381]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200382]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200383]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200384]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200385]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200386]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200387]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200388]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200389]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200390]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200391]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200392]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200393]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200394]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200395]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200396]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200397]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200398]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200399]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200400]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200401]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200402]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200403]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200404]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200405]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200406]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200407]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200408]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200409]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200410]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200411]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200412]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200413]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200414]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200415]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200416]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200417]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200418]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200419]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200420]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200421]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200422]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200423]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200424]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200425]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200426]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200427]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200428]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200429]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200430]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200431]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200432]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200433]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200434]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200435]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200436]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200437]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200438]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200439]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200440]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200441]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200442]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200443]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200444]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200445]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200446]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200447]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200448]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200449]= "<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200450]= "<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200451]= "<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200452]= "<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200453]= "<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200454]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200455]= "<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[300001]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300002]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300003]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300004]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300005]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300006]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300007]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300008]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300009]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300010]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300011]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300012]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300013]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300014]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300015]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300016]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300017]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300018]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300019]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300020]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300021]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300022]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300023]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300024]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300025]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300026]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300027]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300028]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300029]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300030]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300031]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300032]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300033]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300034]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300035]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300036]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300037]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300038]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300039]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300040]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300041]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300042]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300043]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300044]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300045]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300046]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300047]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300048]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300049]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300050]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300051]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300052]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300053]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300054]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300055]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300056]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300057]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300058]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300059]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300060]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300061]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300062]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300063]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300064]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300065]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300066]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300067]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300068]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300069]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300070]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300071]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300072]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300073]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300074]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300075]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300076]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300077]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300078]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300079]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300080]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300081]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300082]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300083]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300084]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300085]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300086]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300087]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300088]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300089]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300090]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300091]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300092]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300093]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300094]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300095]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300096]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300097]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300098]= "<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300099]= "<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300100]= "<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300101]= "<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300102]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300103]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300104]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300105]= "<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[400001]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400002]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400003]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400004]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400005]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400006]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400007]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400008]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400009]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400010]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400011]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400012]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400013]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400014]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400015]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400016]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400017]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400018]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400019]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400020]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400021]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400022]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400023]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400024]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400025]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400026]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400027]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400028]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400029]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400030]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400031]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400032]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400033]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400034]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400035]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400036]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400037]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400038]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400039]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400040]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400041]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400042]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400043]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400044]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400045]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400046]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400047]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400048]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400049]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400050]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400051]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400052]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400053]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400054]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400055]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400056]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400057]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400058]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400059]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400060]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400061]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400062]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400063]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400064]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400065]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400066]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400067]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400068]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400069]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400070]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400071]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400072]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400073]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400074]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400075]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400076]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400077]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400078]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400079]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400080]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400081]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400082]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400083]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400084]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400085]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400086]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400087]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400088]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400089]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400090]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400091]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400092]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400093]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400094]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400095]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400096]= "<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[500001]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×3</font></font>";--描述
[500002]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>3品宝石精华×3</font></font>";--描述
[500003]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×4</font></font>";--描述
[500004]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>3品宝石精华×3</font></font>";--描述
[500005]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×3</font></font>";--描述
[500006]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>4品宝石精华×3</font></font>";--描述
[500007]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×4</font></font>";--描述
[500008]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>4品宝石精华×3</font></font>";--描述
[500009]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>限VIP兑换 500万银两+棋魂×10</font></font>";--描述
[500010]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500011]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500012]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>限VIP兑换 500万银两+棋魂×10</font></font>";--描述
[500013]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500014]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500015]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>限VIP兑换 500万银两+棋魂×10</font></font>";--描述
[500016]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500017]= "<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[600001]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述  <font color='#FFFFFF'>累计1天充值达<font color='#FF0000'>880</font>元宝</font>
[600002]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600003]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600004]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>4天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600005]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>5天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600006]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述  --<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>
[600007]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600008]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600009]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600010]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600011]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600012]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600013]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600014]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600015]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600016]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600017]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600018]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600019]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600020]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600021]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600022]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600023]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600024]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600025]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600026]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600027]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600028]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600029]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600030]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600031]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600032]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600033]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600034]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600035]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600036]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600037]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600038]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600039]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600040]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600041]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600042]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600043]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600044]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600045]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600046]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600047]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600048]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600049]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600050]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600051]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600052]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600053]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600054]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600055]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600056]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600057]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600058]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600059]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600060]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600061]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600062]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600063]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600064]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600065]= "<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
	
	
}