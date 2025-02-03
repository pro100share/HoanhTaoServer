_G.DuplMsgConfig = {
	[1] = "正常模式",--9000661001
	[2] = "返回模式",--9000661002
}

_G.DuplPersonType = {
	[1] = "单人",--9000661003
	[2] = "组队",--9000661004
}

_G.DuplTimesConfig = {
	["day"] = "日",--9000661005
	["week"] = "周",--9000661006
	["month"] = "月",--9000661007
}

_G.Degree = "次" --9000661008

_G.FbTiShiMsg = {
	[1] = "当前副本生命周期已经结束，请选择其他进入模式", --9000661009
	[2] = "您当前副本生命周期未结束，是否从新开辟副本？", --9000661010
	[3] = "是否使用数据",--9000661011
	[4] = "你不是队长，没有权限开启新的副本",--9000661012
	[5] = "当前副本生命周期即将结束，请勿进入副本",--9000661013
	[6] = "您还有队友在副本中，请再次确认！",--9000661014
	[7] = "队员状态请选择返回模式",--9000661015
	[8] = "请先开启副本，再选择返回模式",--9000661016
	[9] = "队长还没建立副本，请稍后再试",--9000661017
	[10] = "您确定要离开副本吗？",--9000661018
	[11] = "对不起，你不能同时进行多个同类型副本",--9000661019
	[12] = "创建队伍",---9000661020
	[13] = "您当前处在队伍中",--9000661021
	[14] = "要开启新的副本，需结束旧的副本",--9000661022
	[15] = "请先离开队伍，再选择进入单人副本",--9000661023
	[16] = "创立副本",--9000661024
	[17] = "加入副本",--9000661025
	[18] = "您今天可以进入该副本的次数已满",--9000661026
	[19] = "死亡状态下无法进行此操作",--9000661027
	[20] = "战斗状态下无法进行此操作",--9000661028
	[21] = "您确认放弃 %s 副本吗？",--9000661029
	[22] = "您没有队伍，请先组队，再进入副本",--9000661030
	[23] = "队员无权放弃副本，若您需要去新副本，请先离开队伍！", --9000661031
	[24] = "你有正在进行的副本，不能进行换线！",--9000661032
	[25] = "当前场景没有地图",--9000661033
	[26] = "正在等待服务端消息，请勿重复操作！",--9000661034
}

_G.DuplAwardInfo = {
	[0] = "<font color='#d9ccbd'>很遗憾，您挑战<font color='#008000'>%s</font>副本失败了。</font><br/><font color='#d9ccbd'>用时：<font color='#008000'>%02d:%02d:%02d</font></font><br/><font color='#d9ccbd'>请提高自己的能力，下次再接再厉！</font>",     --9000661035
	[1] = "<font color='#d9ccbd'>您成功通关了<font color='#008000'>%s</font>副本</font><br/><font color='#d9ccbd'>用时：<font color='#008000'>%02d:%02d:%02d</font></font><br/><font color='#d9ccbd'><font color='#008000'>道具奖励</font>已通过邮件发送给您，请及时查收！</font><br/>",--9000661036
}

_G.DuplMailMsg = {
	[1] = "副本系统",--9000661037
	[2] = "副本奖励",--9000661038
	[3] = "您成功通关 %s 副本，请及时收取道具奖励，避免不必要损失！",--9000661039
	[4] = "您挑战 %s 副本失利了，希望再接再励！",--9000661040
	[5] = "由于60秒内您没有选择宝箱奖励或背包已满，系统已自动帮您选择宝箱奖励并以邮件的形式发放，请及时收取道具奖励，避免不必要损失！"
}

_G.DuplOtherAward = {
	["money"] = {png = "Qita_money.png", x = 32, y = 32, pos = 4},
	["gold"] = {png = "Qita_lijin.png", x = 32, y = 32, pos = 2},
	["zhenqi"] = {png = "Qita_zhenqi.png", x = 32, y = 32, pos = 3},
	["exps"] = {png = "Qita_exp.png", x = 32, y = 32, pos = 1},
	["wanmei"] = {png = "pingfen-01.png", x = 183, y = 98, pos = 0},
	["youxiu"] = {png = "pingfen-02.png", x = 183, y = 98, pos = 0},
	["putong"] = {png = "pingfen-03.png", x = 183, y = 98, pos = 0},
	["wanbai"] = {png = "pingfen-04.png", x = 183, y = 98, pos = 0},
	["goldBaoXiang"] = {png = "Qita_fb_jin_close.png", x = 64, y = 64, pos = 0},
	["silverBaoXiang"] = {png = "Qita_fb_yin_close.png", x = 64, y = 64, pos = 0},
	["copperBaoXiang"] = {png = "Qita_fb_mu_close.png", x = 64, y = 64, pos = 0},
	["shadowPng"] = {png = "Qita_fb_close.png", x = 64, y = 64, pos = 0},
	["fastPng"] = {png = "strong_full.png", x = 20, y = 20, pos = 0},
	["fastHeadPng"] = {png = "phb_kqtx_01.png", x = 20, y = 20, pos = 0},
	["goldBaoXiangOpen"] = {png = "Qita_fb_jin_open.png", x = 64, y = 64, pos = 0},
	["silverBaoXiangOpen"] = {png = "Qita_fb_yin_open.png", x = 64, y = 64, pos = 0},
	["copperBaoXiangOpen"] = {png = "Qita_fb_mu_open.png", x = 64, y = 64, pos = 0},
}

_G.ClearTime = "23:58";--9000661041

--也可以根据副本类型分个组
_G.DuplAwardGrade = {
	[1] = 0.2,
	[2] = 0.6,
}

--生成奖励组
_G.DuplAwardGroup = {
	[1] = {Gold = 3, Silver = 1, Copper = 1},
	[2] = {Gold = 2, Silver = 1, Copper = 2},
	[3] = {Gold = 1, Silver = 2, Copper = 2},
	[4] = {Gold = 0, Silver = 2, Copper = 3},
}

--死亡次数
_G.DuplDeadGrade = {
	[1] = 0,   --毫发无伤
	[2] = 10,   --略有伤亡（死伤惨重）
}

_G.AwardTypeTbl = {
	Gold = 1,
	Silver = 2,
	Copper = 3,
}
_G.ContinueBtn = "继续";



--金银宝箱显示的物品
_G.BXDropId = {
	[1] = 991001,  --金
	[2] = 991002,  --银
	[3] = 991003,  --木
}
--消耗元宝
_G.WasteGold = 10;

--根据副本积分奖励礼金
_G.DuplScoreAwardBase = 10;   --1积分对应

--卧虎藏龙——车轮战奖励金钱
_G.GetTollGateMoney = function(dwTollGateNum, bWinFlag)
	if bWinFlag == true then
		if dwTollGateNum == 0 then
			return 0;
		elseif dwTollGateNum == 1 then
			return 1000;
		elseif dwTollGateNum == 2 then
			return 3000;
		elseif dwTollGateNum == 3 then
			return 6000;
		elseif dwTollGateNum == 4 then
			return 10000;
		elseif dwTollGateNum == 5 then
			return 15000;
		elseif dwTollGateNum == 6 then
			return 21000;
		elseif dwTollGateNum == 7 then
			return 28000;
		elseif dwTollGateNum == 8 then
			return 36000;
		elseif dwTollGateNum == 9 then
			return 45000;
		elseif dwTollGateNum == 10 then
			return 55000;
		end
	else
		if dwTollGateNum == 0 then
			return 0;
		elseif dwTollGateNum == 1 then
			return 1000*0.5;
		elseif dwTollGateNum == 2 then
			return 3000*0.5;
		elseif dwTollGateNum == 3 then
			return 6000*0.5;
		elseif dwTollGateNum == 4 then
			return 10000*0.5;
		elseif dwTollGateNum == 5 then
			return 15000*0.5;
		elseif dwTollGateNum == 6 then
			return 21000*0.5;
		elseif dwTollGateNum == 7 then
			return 28000*0.5;
		elseif dwTollGateNum == 8 then
			return 36000*0.5;
		elseif dwTollGateNum == 9 then
			return 45000*0.5;
		end
	end
	
	
	return 0;
end;

--副本boss刷新间隔
_G.RefreshBossTime = 60;	--继续倒计时
_G.RefreshTime = 10;	--玩家休息倒计时

