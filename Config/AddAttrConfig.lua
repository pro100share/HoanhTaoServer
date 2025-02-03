
--增加属性(吃丹)配置
_G.AddAttrConfig = {};

--总次数
_G.AddAttrConfig.TotalTimes = 5000;


--每个类型每天最多次数
_G.AddAttrConfig.OnedayTypeTimes = {
	[1] = 20;
	[2] = 20;
	[3] = 20;
	[4] = 20;
	[5] = 10;
	[6] = 3;
	[7] = 10;
	[8] = 10;
	[9] = 10;
	[10] = 10;
	[11] = 10;
	[12] = 10;
	[13] = 10;
	[14] = 10;
	[15] = 10;
	[16] = 10;
	[17] = 10;
	[18] = 10;
}

--每种属性加成值
--一个丹对应多少值
_G.AddAttrConfig.Key2Value = {
	dwAttack 		= 1;--攻击
	dwDefense 		= 1;--防御
	dwCrit 			= 1;--暴击
	dwFlee 			= 1;--身法
	dwAttackSpeed	= 5;--攻击速度
	dwMoveSpeed		= 5;--移动速度
	dwHitPercent 	= 5;--命中
	dwAppendCrit 	= 0.05;--暴击伤害(百分比)
	dwPoJiaValue 	= 5;--破甲值
	dwDuck 			= 5;--闪避率
	dwCritDown 		= 5;--暴击抵抗
	dwPoJiaDiKang 	= 5;--破甲抵抗
	dwRemitAttack 	= 5;--伤害减免
	dwHPMax			= 1;--生命max
	dwMPMax			= 5;--内力max
}