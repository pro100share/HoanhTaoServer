-- PK配置



--PK保护等级
_G.enPKForbidLevel = 25;

--PK保护BUFF
_G.enPKProtectBuffID = 510000;


_G.PKConfig = 
{
	--黄名持续时间，分钟
	dwYellowLength = 1;
	--红名一个值的时间，分钟
	dwRedValueLength = 1;
	
	dwYellowValue = -1;
	
	--红名掉落的钱比例
	fMoney = 0;
	
	--红名死亡耐久减少
	fEndure = 0.1;
	
	--正常死亡掉耐久
	fNowmalEndure = 0.05;
	
	--大于等于这个罪恶值的人，进地图广播
	dwNoticeGuilty = 30;
}

_G.PKBuffConfig = 
{
	--黄名BUFF
	YellowBuff = 510002;
	--红名BUFF
	RedBuff = 510003;
	--PK保护BUFF
	ProtectBuff = 510000;
}

--红名提示框内容
_G.PKTipsConfig = {
	szText_content = "<font color='#00ff00'>您已进入红名状态，期间将受到以下惩罚</font><br />",
	szText_explain1 = "<font color='#00ff00'>2.死亡时装备持久掉落增加10%</font><br />",
	szText_explain2 = "<font color='#00ff00'>3.罪恶值达到30时跨场景系统播放追杀公告</font><br />",
	szText_explain3 = "",
	szText_explain4 = "<font color='#FF0000'>您可以通过系统设置中的显示设置屏蔽</font><br />",
}

--状态图标
_G.PKStateConfig = {
	pkStatePic = "Pk_HuangMing.png",
	redNameStatePic = "Pk_HongMing.png",
	protectStatePic = "Icon_Buff_1009_1.png",
}

--不会改变PK值的地图
_G.CPKValueChangeForbid = 
{
	--龙鼎战
	[8001] = 1;
	[8002] = 1;
	[8003] = 1;
	[8004] = 1;
	[8005] = 1;
	[8006] = 1;
	[8007] = 1;
	[8008] = 1;
	[8009] = 1;
	--恶人谷
	[8050] = 1;
	[8051] = 1;
	[8052] = 1;
	[8053] = 1;
	[8054] = 1;	
	--盟主战
	[8020] = 1;
	--夜战襄阳
	[8060] = 1;
	--青云蜀道
	[8030] = 1;
	--个人押镖
	[8070] = 1;
	--个人押镖
	[8071] = 1;
}
