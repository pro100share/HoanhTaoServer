﻿local value = {10,15,25};
_G.QihunConfig =
{
	--每日重置时间
	ResetTime = "00:00";
	--文字描述
	Explanation = "1.点击棋局中的棋子，进行选棋<br>2.每次选棋需要消耗<font color='#f81818'>棋魂</font>或<font color='#f81818'>元宝</font><br>3.选棋后可获得对应奖励<br>4.每轮可选棋3次，选棋次数越多花费越高<br>5.点击起手式后，花费元宝重新开启下轮棋局，奖励也会随机分配";
	--剩余选棋次数
	LastTimes = "本轮剩余选棋次数:%d";
	--剩余棋魂数量
	HaveQihunNum = "棋魂数量:%d";
	--本日重置次数
	LastRandTimes = "点击起手式后将花费%d元宝重置所有棋子及奖励";
	
	Tips1 = "选择棋子需消耗%d个棋魂";
	Tips2 = "需要%d个棋魂，棋魂数量不足，选择棋子需要消耗%d个棋魂与%d元宝";
	Tips3 = "需要%d个棋魂，棋魂数量不足，选择棋子需要消耗%d元宝";
	Tips4 = "选棋次数不足，请点击起手式重置棋局";
	
	BroadCastStr = "%s人品大爆发翻棋子获得了%s。";
	
	MailText1 = "系统邮件";
	MailText2 = "猜棋系统";
	MailText3 = "恭喜你获得了%s * %d，请查收奖励";

	--每轮选择次数
	dwSelectTimes = 3;
	--每天重置轮数
	dwRandomTimes = 9000;
	--重置一次花费元宝
	----当日第几次重置
	RandomCost = function(times)
		if times <= 20 then
			return 2 * times;
		elseif times >= 21 then
			return 5 * times;
		end;
	end;
	--棋魂ID
	dwEnumID = 4901000;
	--一枚棋魂对应元宝价格
	dwExchange = 3;
	--翻棋消耗棋魂个数
	----times 本轮第几次翻棋

	CostQihunNum = function(times)
		return value[times];
	end;
	--奖励库
	--[[
		[1]道具ID
		[2]是否绑定
		[3]道具个数
		[4]奖励随机权重1
		[5]奖励随机权重2
		[6]是否播放信息流
	]]
	tAwards = {
		{[1] = 9405010, [2] = 1 , [3] = 2, [4] = 1300, [5] = 270, [6] = false};
		{[1] = 2500050, [2] = 1 , [3] = 2, [4] = 1300, [5] = 270, [6] = false};
		{[1] = 4100130, [2] = 1 , [3] = 2, [4] = 1300, [5] = 270, [6] = false};
		{[1] = 4100110, [2] = 1 , [3] = 2, [4] = 1300, [5] = 270, [6] = false};
		{[1] = 4100430, [2] = 1 , [3] = 2, [4] = 1300, [5] = 270, [6] = false};
		{[1] = 4100410, [2] = 1 , [3] = 2, [4] = 1300, [5] = 265, [6] = false};
		{[1] = 2500331, [2] = 1 , [3] = 2, [4] = 1300, [5] = 265, [6] = false};
		{[1] = 9405010, [2] = 1 , [3] = 3, [4] = 1900, [5] = 450, [6] = false};
		{[1] = 2500050, [2] = 1 , [3] = 3, [4] = 1900, [5] = 450, [6] = false};
		{[1] = 4100130, [2] = 1 , [3] = 3, [4] = 1900, [5] = 450, [6] = false};
		{[1] = 4100110, [2] = 1 , [3] = 3, [4] = 1900, [5] = 450, [6] = false};
		{[1] = 4100430, [2] = 1 , [3] = 3, [4] = 1900, [5] = 450, [6] = false};
		{[1] = 4100410, [2] = 1 , [3] = 3, [4] = 1900, [5] = 450, [6] = false};
		{[1] = 2500331, [2] = 1 , [3] = 3, [4] = 1900, [5] = 450, [6] = false};
		{[1] = 5809365, [2] = 1 , [3] = 1, [4] = 335, [5] = 70, [6] = true};
		{[1] = 5809366, [2] = 1 , [3] = 1, [4] = 315, [5] = 60, [6] = true};
		{[1] = 5809463, [2] = 1 , [3] = 1, [4] = 750, [5] = 115, [6] = true};
		{[1] = 5809466, [2] = 1 , [3] = 1, [4] = 750, [5] = 115, [6] = true};
		{[1] = 5809469, [2] = 1 , [3] = 1, [4] = 750, [5] = 115, [6] = true};
		{[1] = 5809472, [2] = 1 , [3] = 1, [4] = 750, [5] = 115, [6] = true};
		{[1] = 5809475, [2] = 1 , [3] = 1, [4] = 750, [5] = 115, [6] = true};
		{[1] = 5809478, [2] = 1 , [3] = 1, [4] = 750, [5] = 115, [6] = true};
		{[1] = 5809481, [2] = 1 , [3] = 1, [4] = 750, [5] = 115, [6] = true};
		{[1] = 5809487, [2] = 1 , [3] = 1, [4] = 350, [5] = 70, [6] = true};
		{[1] = 5809488, [2] = 1 , [3] = 1, [4] = 350, [5] = 70, [6] = true};
		{[1] = 5809489, [2] = 1 , [3] = 1, [4] = 350, [5] = 70, [6] = true};
		{[1] = 5809490, [2] = 1 , [3] = 1, [4] = 350, [5] = 70, [6] = true};
		{[1] = 5809491, [2] = 1 , [3] = 1, [4] = 350, [5] = 70, [6] = true};
		{[1] = 5809492, [2] = 1 , [3] = 1, [4] = 350, [5] = 70, [6] = true};
		{[1] = 5809493, [2] = 1 , [3] = 1, [4] = 350, [5] = 70, [6] = true};
		{[1] = 5809342, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 5809343, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 5809344, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 5809345, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 5809346, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 5809347, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 5809334, [2] = 1 , [3] = 1, [4] = 1050, [5] = 300, [6] = false};
		{[1] = 5809335, [2] = 1 , [3] = 1, [4] = 800, [5] = 250, [6] = false};
		{[1] = 5809336, [2] = 1 , [3] = 1, [4] = 550, [5] = 200, [6] = false};
		{[1] = 4100420, [2] = 1 , [3] = 6, [4] = 400, [5] = 120, [6] = true};
		{[1] = 4100400, [2] = 1 , [3] = 1, [4] = 400, [5] = 120, [6] = true};
		{[1] = 3900070, [2] = 1 , [3] = 1, [4] = 325, [5] = 105, [6] = true};
		{[1] = 3900080, [2] = 1 , [3] = 1, [4] = 305, [5] = 11, [6] = true};
		{[1] = 5950030, [2] = 1 , [3] = 1, [4] = 450, [5] = 135, [6] = false};
		{[1] = 5950031, [2] = 1 , [3] = 1, [4] = 350, [5] = 115, [6] = false};
		{[1] = 5950032, [2] = 1 , [3] = 1, [4] = 325, [5] = 110, [6] = true};
		{[1] = 5950033, [2] = 1 , [3] = 1, [4] = 315, [5] = 40, [6] = true};
		{[1] = 5950034, [2] = 1 , [3] = 1, [4] = 305, [5] = 20, [6] = true};
		{[1] = 4902008, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 4902007, [2] = 1 , [3] = 1, [4] = 550, [5] = 160, [6] = true};
		{[1] = 5809302, [2] = 1 , [3] = 1, [4] = 1300, [5] = 350, [6] = false};
		{[1] = 5807001, [2] = 1 , [3] = 1, [4] = 550, [5] = 160, [6] = false};
		{[1] = 5807002, [2] = 1 , [3] = 1, [4] = 400, [5] = 125, [6] = false};
		{[1] = 5807003, [2] = 1 , [3] = 1, [4] = 350, [5] = 110, [6] = false};
		{[1] = 9405040, [2] = 1 , [3] = 3, [4] = 1300, [5] = 400, [6] = true};
		{[1] = 5501135, [2] = 1 , [3] = 1, [4] = 1300, [5] = 400, [6] = false};
		{[1] = 5950001, [2] = 1 , [3] = 1, [4] = 1050, [5] = 250, [6] = false};
		{[1] = 5950002, [2] = 1 , [3] = 1, [4] = 800, [5] = 200, [6] = false};
		{[1] = 5950003, [2] = 1 , [3] = 1, [4] = 800, [5] = 200, [6] = false};
		{[1] = 5950004, [2] = 1 , [3] = 1, [4] = 800, [5] = 200, [6] = false};
		{[1] = 5950005, [2] = 1 , [3] = 1, [4] = 450, [5] = 130, [6] = false};
		{[1] = 5950006, [2] = 1 , [3] = 1, [4] = 325, [5] = 105, [6] = true};
		{[1] = 2500310, [2] = 1 , [3] = 1, [4] = 800, [5] = 200, [6] = false};
		{[1] = 5809252, [2] = 1 , [3] = 1, [4] = 800, [5] = 200, [6] = true};
		{[1] = 5930007, [2] = 1 , [3] = 3, [4] = 1800, [5] = 400, [6] = true};
		{[1] = 2400120, [2] = 1 , [3] = 1, [4] = 1300, [5] = 300, [6] = false};
		{[1] = 2400130, [2] = 1 , [3] = 1, [4] = 800, [5] = 200, [6] = false};
		{[1] = 2400140, [2] = 1 , [3] = 1, [4] = 550, [5] = 150, [6] = true};
		{[1] = 2500010, [2] = 1 , [3] = 1, [4] = 305, [5] = 1, [6] = true};
		{[1] = 5805002, [2] = 1 , [3] = 1, [4] = 1050, [5] = 300, [6] = false};
		{[1] = 5940006, [2] = 1 , [3] = 2, [4] = 2800, [5] = 500, [6] = true};
		{[1] = 5920005, [2] = 1 , [3] = 1, [4] = 2800, [5] = 500, [6] = false};
		{[1] = 2500073, [2] = 1 , [3] = 1, [4] = 1800, [5] = 300, [6] = false};
		{[1] = 2500083, [2] = 1 , [3] = 1, [4] = 1800, [5] = 300, [6] = false};
		{[1] = 5809254, [2] = 1 , [3] = 1, [4] = 495, [5] = 108, [6] = false};
	};
};
