


--活动中的文字模板
_G.TextTemplates={
	[1801] = T"新服开启后，总累计充值达指定金额，可领取丰厚奖励" ;
	[1802] = T"开服%s天后，%s排行榜上指定名次的玩家可以领取相应奖励" ;
	[1803] = T"开服%s天后，龙鼎战占领亢龙鼎的世家家主和成员将获得奖励" ;
	[1804] = T"开服%s-%s天内，每天累计充值达指定金额可领取丰厚奖励" ;
	[1805] = T"开服%s-%s天内，总累计充值达指定金额可领取丰厚奖励" ;
	[1806] = T"开服%s-%s天内，每天充值都达到%s元宝，可领取丰厚奖励" ;
	[1807] = T"开服%s-%s天内，消耗指定道具，可兑换丰厚奖励" ;
	
	[11] = T"活动期间，每天累计充值达指定金额可领取丰厚奖励" ;
	[12] = T"活动期间，总累计充值达指定金额可领取丰厚奖励" ;
	[13] = T"活动期间，每天充值都达到%s元宝，可领取丰厚奖励" ;
	[14] = T"活动期间，总累计消费达指定金额可领取丰厚奖励" ;
	[15] = T"活动期间，消耗指定道具，可兑换丰厚奖励" ;
	[16] = T"活动期间，%s达到指定等阶的玩家可领取%s回馈奖励" ;
	[17] = T"活动期间，可限量购买特价道具" ;
	
	[18011] = T"购买VIP礼包成为VIP的玩家" ;
	[18012] = T"累计充值达%s元宝" ;
	[18021] = T"开服%s天后，%s榜第%s名的大侠" ;
	[18022] = T"开服%s天后，%s榜第%s-%s名的大侠" ;
	[18023] = T"开服%s天后，%s榜中名次尾数为1的大侠" ;
	[18031] = T"开服%s天后，占领亢龙鼎的世家%s" ;
	
	[111] = T"每天累计充值达%s元宝" ;
	[121] = T"活动期间总累计充值达%s元宝" ;
	[131] = T"累计1天充值达%s元宝" ;
	[132] = T"累计%s天充值都达%s元宝" ;
	[141] = T"活动期间累计消费达880元宝" ;
	[171] = T"%s<br/>特价：%s元宝" ;
}


_G.FestivalStr = {
	szIcon = "DuoRenTouXiang.png";
	szBtn = T"领取";
	szBuy = T"购买";
	CutDown = {
		[0] = T"活动剩余时间:";
		[1] = T"活动剩余时间:";
		[2] = T"活动剩余时间:";
		[3] = T"活动剩余时间:";
		[4] = T"活动剩余时间:";
		[5] = T"活动剩余时间:";
		[6] = T"活动剩余时间:";
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
	
	
	[0] = T"无";
	[1] = T"活动剩余时间:";
	[2] = T"领奖剩余时间:";
	[3] = T"%d天%d时%d分";
	[4] = T"未满足条件";
	[5] = T"已满足条件";
	[6] = 13101610001;--游戏币不足
	[7] = 13101610002;--礼金不足
	[8] = 13101610003;--元宝不足
	[9] = 13101610004;--物品数量不足
	[10] = 13101610005;--背包空间不足
	[11] = 13101610006;--%s活动已开启，您可以通过点击主界面右上角对应的活动按钮查看活动内容
	[12] = 13101610007;--%s活动已结束，后续将推出更精彩的活动，敬请期待
	[13] = T"请选择一个奖励！";
	[14] = T"可购买: %d次";
	[15] = T[[<p align="right">剩余领取次数：%d</p>]];
	[16] = T"<font color='#dcd9d9'>今日累计充值:<font color='#fed904'  size='20'>%d元宝</font>";
	[17] = T"<font color='#dcd9d9'>本中累计充值:<font color='#fed904' size='20'>%d元宝</font>";
	[18] = T"<font color='#dcd9d9'>单笔最大充值:<font color='#fed904' size='20'>%d元宝</font>";
	[19] = T"<font color='#dcd9d9'>开服至今累计充值:<font color='#fed904' size='20'>%d元宝</font>";
	[20] = T"%d 元宝";
	[21] = T"还需充值：%d(本日)";
	[22] = T"还需充值：%d(本周)";
	[23] = T"还需充值：%d(不限时)";
	[24] = T"还需充值：%d(单笔)";
	[25] = T"未满足领取条件";
	[26] = T"点击打开充值页面";
	[27] = T"永久";
	[28] = T"<font color='#dcd9d9'>活动期间已累计充值:<font color='#fed904' size='20'>%d元宝</font>";
	[29] = T"<font color='#dcd9d9'>活动期间已累计消费:<font color='#fed904' size='20'>%d元宝</font>";
	[30] = T"<font color='#dcd9d9'>循环活动</font>";
	
	[10001] =T"<font color='#00FF00'>活动时间内，累计充值达<font color='#FF0000'>指定金额</font>可领取<font color='#FF0000'>江湖绝学</font>和<font color='#FF0000'>充值奖励</font>"; --累计充值活动
	[10002] =T"<font color='#FFFFFF'>购买<font color='#FF0000'>VIP礼包</font>成为<font color='#FF0000'>VIP</font>的玩家可领取<font color='#FF0000'>VIP奖励</font></font>"; --388
    [10003] =T"<font color='#00FF00'>累计充值达<font color='#FF0000'>588</font>元宝可领取<font color='#FF0000'>北冥神功</font>以及<font color='#FF0000'>丰厚充值奖励</font></font>";--588
    [10004] =T"<font color='#FFFF00'>累计充值达<font color='#FF0000'>888</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--888
    [10005] =T"<font color='#FF9900'>累计充值达<font color='#FF0000'>1288</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--1288
    [10006] =T"<font color='#00FFFF'>累计充值达<font color='#FF0000'>1888</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--1888
    [10007] =T"<font color='#0066FF'>累计充值达<font color='#FF0000'>2688</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--2688
    [10008] =T"<font color='#FF00CC'>累计充值达<font color='#FF0000'>3888</font>元宝可领取<font color='#FF0000'>丰厚充值奖励</font></font>";--3888

	[20001] =T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";
    [20002] =T"<font color='#FFFFFF'>活动期间，每天累计充值达<font color='#FF0000'>88</font>元宝可领取一份奖励，每天最多领取1次</font>";
	[20003] =T"<font color='#00FF00'>活动期间，每天累计充值达<font color='#FF0000'>500</font>元宝可领取一份奖励，每天最多领取1次</font>";
    [20004] =T"<font color='#FFFF00'>活动期间，每天累计充值达<font color='#FF0000'>1000</font>元宝可领取一份奖励，每天最多领取1次</font>";
    [20005] =T"<font color='#FF9900'>活动期间，每天累计充值达<font color='#FF0000'>2000</font>元宝可领取一份奖励，每天最多领取2次</font>";
    [20006] =T"<font color='#00FFFF'>活动期间，每天累计充值达<font color='#FF0000'>5000</font>元宝可领取一份奖励，每天最多领取2次</font>";
	[20007] =T"<font color='#0033FF'>活动期间，总共累计充值达<font color='#FF0000'>20000</font>元宝可领取一份奖励，每天最多领取1次</font>";--描述
	[20008] =T"<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20009] =T"<font color='#0033FF'>活动期间，总共累计充值达<font color='#FF0000'>50000</font>元宝可领取一份奖励，每天最多领取1次</font>";--描述
	[20010] =T"<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20011] =T"<font color='#0033FF'>活动期间，总共累计充值达<font color='#FF0000'>100000</font>元宝可领取一份奖励，每天最多领取1次</font>";--描述
	[20012] =T"<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20013] =T"<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20014] =T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20015] =T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20016] =T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20017] =T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	[20018] =T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	
	
[1000]= T"<font color='#FF0000'>开服<font color='#FF0000'>3天</font>后第一次龙鼎战占据<font color='#FF0000'>亢龙鼎</font>的世家，<font color='#FF0000'>家主</font>和<font color='#FF0000'>世家成员</font>将获得奖励";--规则
[1001]= T"开服<font color='#FF0000'>7天</font>内,购买并成为<font color='#FF0000'>VIP</font>的玩家，可领取<font color='#FF0000'>VIP回馈奖励</font>";--规则
[1002]= T"<font color='#00FF00'>活动时间内，累计充值达<font color='#FF0000'>指定金额</font>可领取<font color='#FF0000'>江湖绝学</font>和<font color='#FF0000'>充值奖励</font>";--规则
[2000]= T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2001]= T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2002]= T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2003]= T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2004]= T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2005]= T"<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2006]= T"<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2007]= T"<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2008]= T"<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2009]= T"<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2010]= T"<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2011]= T"<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2012]= T"<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2013]= T"<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2014]= T"<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2015]= T"<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2016]= T"<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2017]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2018]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2019]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2020]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2021]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2022]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2023]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2024]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2025]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2026]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2027]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2028]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2029]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2030]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2031]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2032]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2033]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2034]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2035]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2036]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2037]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2038]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2039]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2040]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2041]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2042]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2043]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2044]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2045]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2046]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2047]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2048]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2049]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2050]= T"<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2051]= T"<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2052]= T"<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2053]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2054]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2055]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2056]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2057]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2058]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2059]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2060]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2061]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2062]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2063]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[2064]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每天累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3000]= T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3001]= T"<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3002]= T"<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3003]= T"<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3004]= T"<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3005]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3006]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3007]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3008]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3009]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3010]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3011]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3012]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3013]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3014]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3015]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3016]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3017]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3018]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3019]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[3020]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，累计充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4000]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4001]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4002]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4003]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4004]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4005]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4006]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4007]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4008]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4009]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4010]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4011]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4012]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4013]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4014]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4015]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4016]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4017]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4018]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4019]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4020]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4021]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4022]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4023]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4024]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4025]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4026]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4027]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4028]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4029]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4030]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4031]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4032]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4033]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4034]= T"<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4035]= T"<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4036]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4037]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4038]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4039]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4040]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4041]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4042]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4043]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4044]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4045]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4046]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[4047]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，每次消费达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[5000]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5001]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5002]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5003]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5004]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5005]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5006]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5007]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5008]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5009]= T"<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5010]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5011]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[5012]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，<font color='#00FF00'>消耗<font color='#FF0000'>指定的元宝、银两、道具</font>可以在<font color='#FF0000'>奖励兑换</font>界面内兑换</font><font color='#FF0000'>相应的奖励</font></font>";--规则
[6000]= T"<font color='#00FF00'>开服<font color='#FF0000'>1到5天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6001]= T"<font color='#00FF00'>开服<font color='#FF0000'>6到8天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6002]= T"<font color='#00FF00'>开服<font color='#FF0000'>9到11天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6003]= T"<font color='#00FF00'>开服<font color='#FF0000'>12到14天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6004]= T"<font color='#00FF00'>开服<font color='#FF0000'>15到17天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6005]= T"<font color='#00FF00'>开服<font color='#FF0000'>18到20天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6006]= T"<font color='#00FF00'>开服<font color='#FF0000'>21到23天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6007]= T"<font color='#00FF00'>开服<font color='#FF0000'>24到26天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6008]= T"<font color='#00FF00'>开服<font color='#FF0000'>27到29天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6009]= T"<font color='#00FF00'>开服<font color='#FF0000'>30到32天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6010]= T"<font color='#00FF00'>开服<font color='#FF0000'>33到35天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6011]= T"<font color='#00FF00'>开服<font color='#FF0000'>36到38天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6012]= T"<font color='#00FF00'>开服<font color='#FF0000'>39到41天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6013]= T"<font color='#00FF00'>开服<font color='#FF0000'>42到44天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6014]= T"<font color='#00FF00'>开服<font color='#FF0000'>45到47天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6015]= T"<font color='#00FF00'>开服<font color='#FF0000'>48到50天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6016]= T"<font color='#00FF00'>开服<font color='#FF0000'>51到53天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6017]= T"<font color='#00FF00'>开服<font color='#FF0000'>54到56天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6018]= T"<font color='#00FF00'>开服<font color='#FF0000'>57到59天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6019]= T"<font color='#00FF00'>开服<font color='#FF0000'>60到62天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
[6020]= T"<font color='#00FF00'>开服<font color='#FF0000'>63到65天</font>内，累计每天充值达<font color='#FF0000'>一定金额</font>可领取<font color='#FF0000'>充值奖励</font>，请及时领取奖励以免造成不必要的损失</font>";--规则
	



[100001]= T"世家家主奖励";--描述
[100002]= T"世家成员奖励";--描述
[100003]= T"使用<font color='##00FF00'>新秀帖</font>成为VIP";--描述
[100004]= T"使用<font color='##00FF00'>少侠帖</font>成为VIP";--描述
[100005]= T"使用<font color='##00FF00'>贵宾贴</font>成为VIP";--描述
[100006]= T"<font color='#FFFFFF'>购买<font color='#FF0000'>VIP礼包</font>成为<font color='#FF0000'>VIP</font>的玩家可领取</font>";--描述
[100007]= T"<font color='#00FF00'>累计充值达<font color='#FF0000'>888</font>元宝可领取</font>";--描述
[100008]= T"<font color='#FFFF00'>累计充值达<font color='#FF0000'>1888</font>元宝可领取</font>";--描述
[100009]= T"<font color='#FF9900'>累计充值达<font color='#FF0000'>3888</font>元宝可领取</font>";--描述
[100010]= T"<font color='#00FFFF'>累计充值达<font color='#FF0000'>5888</font>元宝可领取</font>";--描述
[100011]= T"<font color='#0066FF'>累计充值达<font color='#FF0000'>8888</font>元宝可领取</font>";--描述
[100012]= T"<font color='#FF00CC'>累计充值达<font color='#FF0000'>18888</font>元宝可领取</font>";--描述
[100013]= T"<font color='#FF00CC'>累计充值达<font color='#FF0000'>50000</font>元宝可领取</font>";--描述
[100014]= T"<font color='#FF00CC'>累计充值达<font color='#FF0000'>100000</font>元宝可领取</font>";--描述
[200001]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200002]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200003]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200004]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200005]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200006]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200007]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200008]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200009]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200010]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200011]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200012]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200013]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200014]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200015]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200016]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200017]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200018]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200019]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200020]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200021]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200022]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200023]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200024]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200025]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200026]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200027]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200028]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200029]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>88</font>元宝可领取</font>";--描述
[200030]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200031]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200032]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200033]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200034]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200035]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>999</font>元宝可领取</font>";--描述
[200036]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200037]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200038]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200039]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200040]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200041]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200042]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200043]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200044]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200045]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200046]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200047]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200048]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200049]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200050]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200051]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200052]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200053]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200054]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200055]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200056]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200057]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200058]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200059]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200060]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200061]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200062]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200063]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200064]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200065]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200066]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200067]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200068]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200069]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200070]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200071]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200072]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200073]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200074]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200075]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200076]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200077]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200078]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200079]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200080]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200081]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200082]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200083]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200084]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200085]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200086]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200087]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200088]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200089]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200090]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200091]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200092]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200093]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200094]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200095]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200096]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200097]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200098]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200099]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200100]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200101]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200102]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200103]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200104]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200105]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200106]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200107]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200108]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200109]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200110]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200111]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200112]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200113]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200114]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200115]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200116]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200117]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200118]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200119]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200120]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200121]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200122]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200123]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200124]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200125]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200126]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200127]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200128]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200129]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200130]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200131]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200132]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200133]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200134]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200135]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200136]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200137]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200138]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200139]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200140]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200141]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200142]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200143]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200144]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200145]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200146]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200147]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200148]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200149]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200150]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200151]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200152]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200153]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200154]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200155]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200156]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200157]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200158]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200159]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200160]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200161]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200162]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200163]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200164]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200165]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200166]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200167]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200168]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200169]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200170]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200171]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200172]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200173]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200174]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200175]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200176]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200177]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200178]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200179]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200180]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200181]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200182]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200183]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200184]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200185]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200186]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200187]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200188]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200189]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200190]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200191]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200192]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200193]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200194]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200195]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200196]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200197]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200198]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200199]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200200]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200201]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200202]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200203]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200204]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200205]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200206]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200207]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200208]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200209]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200210]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200211]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200212]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200213]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200214]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200215]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200216]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200217]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200218]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200219]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200220]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200221]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200222]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200223]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200224]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200225]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200226]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200227]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200228]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200229]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200230]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200231]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200232]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200233]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200234]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200235]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200236]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200237]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200238]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200239]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200240]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200241]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200242]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200243]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200244]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200245]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200246]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200247]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200248]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200249]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200250]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200251]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200252]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200253]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200254]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200255]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200256]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200257]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200258]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200259]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200260]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200261]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200262]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200263]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200264]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200265]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200266]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200267]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200268]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200269]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200270]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200271]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200272]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200273]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200274]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200275]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200276]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200277]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200278]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200279]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200280]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200281]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200282]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200283]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200284]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200285]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200286]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200287]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200288]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200289]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200290]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200291]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200292]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200293]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200294]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200295]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200296]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200297]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200298]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200299]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200300]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200301]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200302]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200303]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200304]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200305]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200306]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200307]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200308]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200309]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200310]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200311]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200312]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200313]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200314]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200315]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200316]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200317]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200318]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200319]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200320]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200321]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200322]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200323]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200324]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200325]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200326]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200327]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200328]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200329]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200330]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200331]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200332]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200333]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200334]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200335]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200336]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200337]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200338]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200339]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200340]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200341]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200342]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200343]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200344]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200345]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200346]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200347]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200348]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200349]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200350]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200351]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200352]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200353]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200354]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200355]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200356]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200357]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200358]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200359]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200360]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200361]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200362]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200363]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200364]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200365]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200366]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200367]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200368]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200369]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200370]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200371]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200372]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200373]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200374]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200375]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200376]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200377]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200378]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200379]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200380]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200381]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200382]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200383]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200384]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200385]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200386]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200387]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200388]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200389]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200390]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200391]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200392]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200393]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200394]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200395]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200396]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200397]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200398]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200399]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200400]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200401]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200402]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200403]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200404]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200405]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200406]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200407]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200408]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200409]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200410]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200411]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200412]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200413]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200414]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200415]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200416]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200417]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200418]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200419]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200420]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200421]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200422]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200423]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200424]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200425]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200426]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200427]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200428]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200429]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200430]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200431]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200432]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200433]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200434]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200435]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200436]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200437]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200438]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200439]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200440]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200441]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200442]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200443]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200444]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200445]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200446]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200447]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200448]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[200449]= T"<font color='#FFFFFF'>每天累计充值达<font color='#FF0000'>880</font>元宝可领取</font>";--描述
[200450]= T"<font color='#00FF00'>每天累计充值达<font color='#FF0000'>1000</font>元宝可领取</font>";--描述
[200451]= T"<font color='#FFFF00'>每天累计充值达<font color='#FF0000'>2000</font>元宝可领取</font>";--描述
[200452]= T"<font color='#FF9900'>每天累计充值达<font color='#FF0000'>3000</font>元宝可领取</font>";--描述
[200453]= T"<font color='#00FFFF'>每天累计充值达<font color='#FF0000'>5000</font>元宝可领取</font>";--描述
[200454]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>10000</font>元宝可领取</font>";--描述
[200455]= T"<font color='#0033FF'>每天累计充值达<font color='#FF0000'>30000</font>元宝可领取</font>";--描述
[300001]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300002]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300003]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300004]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300005]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300006]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300007]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300008]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300009]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300010]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300011]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300012]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300013]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300014]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300015]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300016]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300017]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300018]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300019]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300020]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300021]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300022]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300023]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300024]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300025]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300026]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300027]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300028]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300029]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300030]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300031]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300032]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300033]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300034]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300035]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300036]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300037]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300038]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300039]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300040]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300041]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300042]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300043]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300044]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300045]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300046]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300047]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300048]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300049]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300050]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300051]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300052]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300053]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300054]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300055]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300056]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300057]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300058]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300059]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300060]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300061]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300062]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300063]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300064]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300065]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300066]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300067]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300068]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300069]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300070]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300071]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300072]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300073]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300074]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300075]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300076]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300077]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300078]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300079]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300080]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300081]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300082]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300083]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300084]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300085]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300086]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300087]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300088]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300089]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300090]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300091]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300092]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300093]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300094]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300095]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300096]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300097]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300098]= T"<font color='#FFFF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300099]= T"<font color='#FF9900'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300100]= T"<font color='#00FFFF'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[300101]= T"<font color='#FFFFFF'>活动期间，累计充值达<font color='#FF0000'>10000</font>元宝</font>";--描述
[300102]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>20000</font>元宝</font>";--描述
[300103]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>30000</font>元宝</font>";--描述
[300104]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>50000</font>元宝</font>";--描述
[300105]= T"<font color='#00FF00'>活动期间，累计充值达<font color='#FF0000'>100000</font>元宝</font>";--描述
[400001]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400002]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400003]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400004]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400005]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400006]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400007]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400008]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400009]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400010]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400011]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400012]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400013]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400014]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400015]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400016]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400017]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400018]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400019]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400020]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400021]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400022]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400023]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400024]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400025]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400026]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400027]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400028]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400029]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400030]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400031]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400032]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400033]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400034]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400035]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400036]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400037]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400038]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400039]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400040]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400041]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400042]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400043]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400044]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400045]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400046]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400047]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400048]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400049]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400050]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400051]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400052]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400053]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400054]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400055]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400056]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400057]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400058]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400059]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400060]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400061]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400062]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400063]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400064]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400065]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400066]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400067]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400068]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400069]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400070]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400071]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400072]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400073]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400074]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400075]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400076]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400077]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400078]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400079]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400080]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400081]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400082]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400083]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400084]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400085]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400086]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400087]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400088]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400089]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400090]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400091]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400092]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400093]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400094]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[400095]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>1000</font>元宝</font>";--描述
[400096]= T"<font color='#FFFFFF'>活动期间，累计消费达<font color='#FF0000'>5000</font>元宝</font>";--描述
[500001]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×3</font></font>";--描述
[500002]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>3品宝石精华×3</font></font>";--描述
[500003]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×4</font></font>";--描述
[500004]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>3品宝石精华×3</font></font>";--描述
[500005]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×3</font></font>";--描述
[500006]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>4品宝石精华×3</font></font>";--描述
[500007]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>100万银两+棋魂×4</font></font>";--描述
[500008]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>4品宝石精华×3</font></font>";--描述
[500009]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>限VIP兑换 500万银两+棋魂×10</font></font>";--描述
[500010]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500011]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500012]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>限VIP兑换 500万银两+棋魂×10</font></font>";--描述
[500013]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500014]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500015]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>限VIP兑换 500万银两+棋魂×10</font></font>";--描述
[500016]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[500017]= T"<font color='#00FF00'>兑换消耗：<font color='#FF0000'>5品宝石精华×3</font></font>";--描述
[600001]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述  <font color='#FFFFFF'>累计1天充值达<font color='#FF0000'>880</font>元宝</font>
[600002]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600003]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600004]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>4天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600005]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>5天</font>充值达<font color='#FF0000'size='18'>880</font>元宝</font>";--描述
[600006]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述  --<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>
[600007]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600008]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600009]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600010]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600011]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600012]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600013]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600014]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600015]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600016]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600017]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600018]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600019]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600020]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600021]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600022]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600023]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600024]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600025]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600026]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600027]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600028]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600029]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600030]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600031]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600032]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600033]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600034]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600035]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600036]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600037]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600038]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600039]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600040]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600041]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600042]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600043]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600044]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600045]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600046]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600047]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600048]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600049]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600050]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600051]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600052]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600053]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600054]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600055]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600056]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600057]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600058]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600059]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600060]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600061]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600062]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600063]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>1天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600064]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>2天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
[600065]= T"<font color='#FFFFFF'>累计<font color='#FDF445'size='18'>3天</font>充值达<font color='#FF0000'size='18'>2000</font>元宝</font>";--描述
	
	
}