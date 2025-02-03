
--商业化活动类型
_G.CommercialActType = {
	--单日前一小时充值
	OneDayOneHourCharge = 1;
	--时间段内累计充值固定金额天数
	ChargeMoneyDaysNum = 2;
};

--商业化活动时间类型
_G.CommercialActTimeType = {
	Absolutely = 1; --绝对时间
	Relatively = 2; --相对时间
};

--商业化活动奖励类型
_G.CommercialActRewardType = {
	Condition = 1;	--领取条件
	Money = 2;		--金钱
	BindGold = 3;	--礼金
	Gold = 4;		--元宝
	Elem = 5;		--真气
	Exp	= 6;		--经验
	Item = 7;		--道具
};

--商业化活动字符串配置
_G.CommercialActStringConfig = {
	[1] = '活动剩余时间:%02d天%02d小时%02d分%02d秒',
	[2] = "<font color='#dcd9d9'>第一笔充值，一小时内充值金额:</font><font color='#fed904' size='20'>%s元宝</font>",
	[3] = "<font color='#4daeed'>每天第一次充值后1小时内，累计充值达到以下<font color='#fed904' size='18'>任意金额</font>，即可获得<font color='#fed904' size='18'>丰厚限时大礼</font>",
	[4] = "<font color='#dcd9d9'>每天充值<font color='#fed904' size='18'>任意元宝</font>，可领取以下奖品</font>",
	[5] = "<font color='#dcd9d9'>每天第一次充值后1小时内，累计充值达到<font color='#fed904' size='18'>%s元宝</font>，可领取以下奖品</font>",

	[11] = "<font color='#DCB857' size='16'>奖励一：</font>",
	[12] = "<font color='#DCB857' size='16'>奖励二：</font>",
	[13] = "<font color='#DCB857' size='16'>奖励三：</font>",
	[14] = "<font color='#DCB857' size='16'>奖励四：</font>",
	[15] = "<font color='#DCB857' size='16'>奖励五：</font>",
	[16] = "<font color='#DCB857' size='16'>奖励六：</font>",
	[17] = "<font color='#DCB857' size='16'>奖励七：</font>",
	[18] = "<font color='#DCB857' size='16'>奖励八：</font>",
	[19] = "<font color='#DCB857' size='16'>奖励九：</font>",
	[20] = "<font color='#DCB857' size='16'>奖励十：</font>",
	[21] = "<font color='#DCB857' size='16'>奖励十一：</font>",
	[22] = "<font color='#DCB857' size='16'>奖励十二：</font>",
	[23] = "<font color='#DCB857' size='16'>奖励十三：</font>",
	[24] = "<font color='#DCB857' size='16'>奖励十四：</font>",
	[25] = "<font color='#DCB857' size='16'>奖励十五：</font>",
}