
_G.ExpPresentConfig = 
{
	--祝贺事件过期时间
	dwTimeOut = 120000; --单位毫秒
	--系统开放等级
	dwMinLvl = 5;
	--每日剩余次数上限
	dwTimeRemainMax = 10;
	--祝福者获得的经验倍数(等级*dwExpValueSelf)
	dwExpValueSelf = 10;
	--受祝福者获得的经验倍数(等级*dwExpValueSelf)
	dwExpValueOther = 10;
	--经验槽上限要求是连续的数组
	tbExpSlotMax = 
	{
		[1] = {dwLvl = 6, dwMax = 5000},
		[2] = {dwLvl = 8, dwMax = 11000},
		[3] = {dwLvl = 13, dwMax = 14000},
		-- [4] = {dwLvl = 12, dwMax = 2000},
		-- [5] = {dwLvl = 14, dwMax = 3000},
		-- [6] = {dwLvl = 50, dwMax = 5000},
	};
	--文字配置
	tbExpTipStr = 
	{
		[1] = "经验提取功能需要等级%d才可开启!",
		[2] = "您需要达到%d级,才可以提取经验!",
		[3] = "恭喜您的好友%s升级了!来%s一下吧!",
		[4] = "恭喜您的好友%s结婚了!来%s一下吧!",
		[5] = "收到%s的祝贺!",
		[6] = "无经验可提取!",
		[7] = "您的等级不够!",
		[8] = "经验提取成功!",
		[9] = "收到%d点祝福反馈经验",
		[10] = "好友已收到您的祝福",
		[11] = "很抱歉,祝福已过期!",
	}
}