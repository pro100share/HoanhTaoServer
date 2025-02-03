--[[
:序号
id:ID
name:境界名称
itemid:消耗物品ID
itemnumber:消耗物品数量
killmonsterlvleast:击杀怪物等级最低
needactionex:需求实战
needpvpactionex:需求PVP实战
kedu:境界刷新值
dwHPMax:生命
dwMPMax:内力
dwAttack:攻击
dwDefense:防御
dwAttackSpeed:攻击速度
dwMoveSpeed:移动速度
dwDuck:闪避几率（10000为百分百）
dwAppendCrit:暴击伤害
dwAllSkillUpLv:武功层数
icon:示意图
--]]
_G.enumBournMsg = 
{
	Full = 1,
	One = 2,
	ExpFull = 3,
	AddExp = 4,
	CiFu = 5,
	Success = 101,
	Failed = 102,
}
_G.BournConfig = 
{
	Num = 9,		--九层境界
	Bourn = 
	{
		[1]={id=1,picOnHead = 'jj_1_logo.png',name='jingjie1.png',nametext='初学乍练',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=1,killmonsterlvleast=20,needactionex=4000,needpvpactionex=100,kedu=250,dwHPMax=280,dwMPMax=14,dwAttack=80,dwDefense=40,dwAttackSpeed=0,dwMoveSpeed=0,dwDuck=0,dwAppendCrit=0,dwAllSkillUpLv=0,dwWinPro=5000,dwWinProText='普通',icon='bourn1.png',icongrey='bourngrey1.png',szTips = '击杀21-30级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[2]={id=2,picOnHead = 'jj_2_logo.png',name='jingjie2.png',nametext='略有小成',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=2,killmonsterlvleast=30,needactionex=8000,needpvpactionex=100,kedu=360,dwHPMax=520,dwMPMax=26,dwAttack=120,dwDefense=60,dwAttackSpeed=0,dwMoveSpeed=0,dwDuck=0,dwAppendCrit=0,dwAllSkillUpLv=0,dwWinPro=4000,dwWinProText='普通',icon='bourn2.png',icongrey='bourngrey2.png',szTips = '击杀31-40级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[3]={id=3,picOnHead = 'jj_3_logo.png',name='jingjie3.png',nametext='心领神会',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=3,killmonsterlvleast=40,needactionex=24000,needpvpactionex=100,kedu=795,dwHPMax=1200,dwMPMax=60,dwAttack=300,dwDefense=150,dwAttackSpeed=0,dwMoveSpeed=0,dwDuck=0,dwAppendCrit=0,dwAllSkillUpLv=0,dwWinPro=2000,dwWinProText='困难',icon='bourn3.png',icongrey='bourngrey3.png',szTips = '击杀41-50级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[4]={id=4,picOnHead = 'jj_4_logo.png',name='jingjie4.png',nametext='炉火纯青',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=4,killmonsterlvleast=45,needactionex=72000,needpvpactionex=100,kedu=1090,dwHPMax=2000,dwMPMax=100,dwAttack=500,dwDefense=250,dwAttackSpeed=0,dwMoveSpeed=0,dwDuck=0,dwAppendCrit=0,dwAllSkillUpLv=0,dwWinPro=1500,dwWinProText='困难',icon='bourn4.png',icongrey='bourngrey4.png',szTips = '击杀51-60级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[5]={id=5,picOnHead = 'jj_5_logo.png',name='jingjie5.png',nametext='出类拔萃',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=5,killmonsterlvleast=50,needactionex=162000,needpvpactionex=100,kedu=1510,dwHPMax=3200,dwMPMax=160,dwAttack=800,dwDefense=400,dwAttackSpeed=50,dwMoveSpeed=0,dwDuck=0,dwAppendCrit=0,dwAllSkillUpLv=0,dwWinPro=1000,dwWinProText='困难',icon='bourn5.png',icongrey='bourngrey5.png',szTips = '击杀61-70级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[6]={id=6,picOnHead = 'jj_6_logo.png',name='jingjie6.png',nametext='技压群雄',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=6,killmonsterlvleast=55,needactionex=405000,needpvpactionex=100,kedu=1985,dwHPMax=4800,dwMPMax=240,dwAttack=1200,dwDefense=600,dwAttackSpeed=75,dwMoveSpeed=10,dwDuck=0,dwAppendCrit=0,dwAllSkillUpLv=0,dwWinPro=1000,dwWinProText='困难',icon='bourn6.png',icongrey='bourngrey6.png',szTips = '击杀71-80级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[7]={id=7,picOnHead = 'jj_7_logo.png',name='jingjie7.png',nametext='深不可测',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=8,killmonsterlvleast=60,needactionex=1012500,needpvpactionex=100,kedu=2510,dwHPMax=6000,dwMPMax=300,dwAttack=1500,dwDefense=750,dwAttackSpeed=100,dwMoveSpeed=20,dwDuck=200,dwAppendCrit=0,dwAllSkillUpLv=0,dwWinPro=500,dwWinProText='极难',icon='bourn7.png',icongrey='bourngrey7.png',szTips = '击杀81-90级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[8]={id=8,picOnHead = 'jj_8_logo.png',name='jingjie8.png',nametext='登峰造极',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=10,killmonsterlvleast=65,needactionex=1687500,needpvpactionex=100,kedu=3075,dwHPMax=10000,dwMPMax=500,dwAttack=2500,dwDefense=1250,dwAttackSpeed=125,dwMoveSpeed=30,dwDuck=300,dwAppendCrit=200,dwAllSkillUpLv=0,dwWinPro=500,dwWinProText='极难',icon='bourn8.png',icongrey='bourngrey8.png',szTips = '击杀91-100级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
		[9]={id=9,picOnHead = 'jj_9_logo.png',name='jingjie9.png',nametext='返璞归真',tabItemDes = {szItemDes = '参阅武尊残章，可突破自身实战境界。进入副本均有几率掉落此物品',szTarget = '进入副本',dwMapID =1002,dwPosX =-12,dwPosY =19,},strDescription='',itemid=2500050,itemnumber=10,killmonsterlvleast=70,needactionex=3375000,needpvpactionex=100,kedu=3685,dwHPMax=12000,dwMPMax=600,dwAttack=3000,dwDefense=1500,dwAttackSpeed=150,dwMoveSpeed=40,dwDuck=500,dwAppendCrit=100,dwAllSkillUpLv=3,dwWinPro=500,dwWinProText='极难',icon='bourn9.png',icongrey='bourngrey9.png',szTips = '击杀101-110级等级范围内的怪物掉落物品的概率相同<br>友情提醒：在上述等级范围内寻一个人少怪多的区域挂机乃明智之举'},
	},
	textDes = 
	{
		[1] = {text = "使用<U><font color='#0dab01'>武尊断篇·初</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1004,9,4]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500100},
		[2] = {text = "使用<U><font color='#0dab01'>武尊断篇·成</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1005,3,-4]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500101},
		[3] = {text = "使用<U><font color='#0dab01'>武尊断篇·会</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1006,46,-21]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500102},
		[4] = {text = "使用<U><font color='#0dab01'>武尊断篇·纯</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1007,27,-97]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500103},
		[5] = {text = "使用<U><font color='#0dab01'>武尊断篇·萃</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1008,29,-19]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500104},
		[6] = {text = "使用<U><font color='#0dab01'>武尊断篇·雄</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1009,75,-10]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500105},
		[7] = {text = "使用<U><font color='#0dab01'>武尊断篇·深</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1010,50,50]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500106},
		[8] = {text = "使用<U><font color='#0dab01'>武尊断篇·极</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1011,50,50]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500107},
		[9] = {text = "使用<U><font color='#0dab01'>武尊断篇·真</font></U>是唯一获得实战经验方式，杀怪可获得道具 ".."<U><a href = 'asfunction:hrefevent,CTaskSystem:DoTaskLinkClick({param=[[move,1011,50,50]]},true)'><font color='#0dab01'>立即前往</font></a></U>" ,item = 2500108},
	},
	jingjie_addvalue_data={
	
	 [1]=	{4		,	8},
	 [2]=	{45		,	55},
	 [3]=	{150	,	175},
	 [4]=	{350	,	445},
	 [5]=	{1100	,	1300},
	 [6]=	{2500	,	2800},
	 [7]=	{3200	,	3800},
	 [8]=	{6600	,	7500},
	 [9]=	{7450	,   7850},
	 [10]=	{7450	,   7850},
	 [11]=	{7450	,   7850},
};
	textFullDes = "</p><font color='#f15d27'>实战经验足矣，已可突破自身局限，更上一层境界</p>",
	colorPlace = '#809798',
	dwStartTaskID = 3101,
	----自动购买礼金元宝不足颜色
	text1 ="<font color='#cd0000'>%s</font>",---红色
	text2 ="<font color='#cdc6c4'>%s</font>",---白色
	--悟字显示时间(毫秒)
	dwShowWuTime = 3000,
	--突破失败增加经验
	fGetFailureAddExp = function(dwBournLevel,dwPlayerLevel)
		local dwExp = dwBournLevel + dwPlayerLevel;
		
		return dwExp;
	end;
	
	
}

--境界系统增加技能等级的技能列表
_G.BournAddSkillLevel = 
{
	21001,
	21002,
	21003,
	21004,
	21005,
	21006,
	
	31001,
	31002,
	31003,
	31004,
	31005,
	31006,
	
	41001,
	41002,
	41003,
	41004,
	41005,
	41006,
	
	51001,
	51002,
	51003,
	51004,
	51005,
	51006,
	
	11003,
	11004,
	11007,
	11008,
	11009,
	11011,
	11012,
	11016,
	11017,
	
	12006,
	12008,
	12009,
	12017,
	12011,
	12016,
	
	
	13023,
	13028,
	13025,
	13021,
	13027,	
	
	13026,
	13022,
	13018,
	13024,
	13020,
}