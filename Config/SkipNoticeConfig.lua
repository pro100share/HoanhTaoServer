_G.SkipNoticeConfig = 
{
	--血的跳字间隔
	NormalTick = 100,
	--属性的跳字间隔
	AttrTick = 200,
	--血跳字的最大数量
	MaxNum = 25,
	
	--自己掉血的配置，躲闪在这里面
	[1] = 1003,
	[2] = 1003,--暴击
	--自己加血
	[3] = 1004,
	[4] = 1004,--暴击
	--敌人掉血，躲闪在这里面
	[5] = 1005,
	[6] = 1008,--暴击
	--敌人加血
	[7] = 1004,
	[8] = 1004,--暴击
	--属性改变
	[9] = 1006,--加
	[10] = 1009,--减
	--真气获取
	[11] = 1012,
	--经验获取
	[12] = 1010,
	--杀意获取
	[13] = 1011,
	--自己掉蓝
	[14] = 1013,
	--自己加蓝
	[15] = 1004,
	--敌人掉蓝
	[16] = 1013,
	--敌人加蓝
	[17] = 1006,
	--宝剑伤害
	[18] = 1017,
	--血魔功伤害
	[19] = 1018,
};

--需要显示跳字提示的属性，数值大的靠前
_G.SkipAttrName = 
{
	dwAttack = 100;--攻击
	dwDefense = 98;--防御
	dwFlee = 97;--身法
	dwCrit = 99;--暴击
	dwHPMax= 101;--生命max
	dwMPMax= 96;--内力max
	dwMoveSpeed= 94;--移动速度
	dwAttackSpeed= 95;--攻击速度
	-- dwIgnoreDefense= 0;--忽视防御
	-- dwAppendAttack = 0;--追加伤害
	-- dwRemitAttack = 0;--伤害减免
	-- dwBounceAttack= 0;--伤害反弹
	-- dwAbsorbHP= 0;--生命吸取
	-- dwAbsorbMP = 0;--内力吸取
	-- dwHitPercent = 0;--命中
	-- dwDuck = 0;--闪避率
	-- dwAppendCrit = 0;--暴击伤害（百分比）
	-- dwAllSkillUpLv = 0; --武功层数
	-- dwPKForbid = 0;--PK保护
	-- dwDander = 0;--怒气增加
};