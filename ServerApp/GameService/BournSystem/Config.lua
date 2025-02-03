--[[
:序号
id:ID
name:境界名称
itemid:消耗物品ID
itemnumber:消耗物品数量
killmonsterlvleast:击杀怪物等级最低
needactionex:需求实战
needpvpactionex:需求PVP实战
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
_G.BournConfig = 
{
	Num = 9,		--九层境界
	Bourn = 
	{
		[1]={id=1,name='炼形境界',itemid=0,itemnumber=0,killmonsterlvleast=20,needactionex=5,kedu=100,needpvpactionex=0,dwHPMax=50,dwMPMax=80,dwAttack=60,dwDefense=40,dwAttackSpeed=20,dwMoveSpeed=10,dwDuck=100,dwAppendCrit=10,dwAllSkillUpLv=1,icon='jingjie0.png',},
		[2]={id=2,name='练体境界',itemid=0,itemnumber=0,killmonsterlvleast=30,needactionex=10,kedu=100,needpvpactionex=0,dwHPMax=80,dwMPMax=150,dwAttack=100,dwDefense=80,dwAttackSpeed=21,dwMoveSpeed=12,dwDuck=200,dwAppendCrit=30,dwAllSkillUpLv=2,icon='jingjie0.png',},
		[3]={id=3,name='炼骨境界',itemid=0,itemnumber=0,killmonsterlvleast=40,needactionex=15,kedu=100,needpvpactionex=0,dwHPMax=110,dwMPMax=220,dwAttack=140,dwDefense=120,dwAttackSpeed=22,dwMoveSpeed=14,dwDuck=300,dwAppendCrit=50,dwAllSkillUpLv=3,icon='jingjie0.png',},
		[4]={id=4,name='引气境界',itemid=0,itemnumber=0,killmonsterlvleast=50,needactionex=20,kedu=100,needpvpactionex=0,dwHPMax=140,dwMPMax=290,dwAttack=180,dwDefense=160,dwAttackSpeed=23,dwMoveSpeed=16,dwDuck=400,dwAppendCrit=70,dwAllSkillUpLv=4,icon='jingjie0.png',},
		[5]={id=5,name='聚气境界',itemid=0,itemnumber=0,killmonsterlvleast=60,needactionex=25,kedu=100,needpvpactionex=0,dwHPMax=170,dwMPMax=360,dwAttack=220,dwDefense=200,dwAttackSpeed=24,dwMoveSpeed=18,dwDuck=500,dwAppendCrit=90,dwAllSkillUpLv=5,icon='jingjie0.png',},
		[6]={id=6,name='传气境界',itemid=0,itemnumber=0,killmonsterlvleast=70,needactionex=30,kedu=100,needpvpactionex=0,dwHPMax=200,dwMPMax=430,dwAttack=260,dwDefense=240,dwAttackSpeed=25,dwMoveSpeed=20,dwDuck=600,dwAppendCrit=110,dwAllSkillUpLv=6,icon='jingjie0.png',},
		[7]={id=7,name='易穴境界',itemid=0,itemnumber=0,killmonsterlvleast=80,needactionex=35,kedu=100,needpvpactionex=0,dwHPMax=230,dwMPMax=500,dwAttack=300,dwDefense=280,dwAttackSpeed=26,dwMoveSpeed=22,dwDuck=700,dwAppendCrit=130,dwAllSkillUpLv=7,icon='jingjie0.png',},
		[8]={id=8,name='易骨境界',itemid=0,itemnumber=0,killmonsterlvleast=90,needactionex=40,kedu=100,needpvpactionex=0,dwHPMax=260,dwMPMax=570,dwAttack=340,dwDefense=320,dwAttackSpeed=27,dwMoveSpeed=24,dwDuck=800,dwAppendCrit=150,dwAllSkillUpLv=8,icon='jingjie0.png',},
		[9]={id=9,name='易髓境界',itemid=0,itemnumber=0,killmonsterlvleast=100,needactionex=45,kedu=100,needpvpactionex=0,dwHPMax=290,dwMPMax=640,dwAttack=380,dwDefense=360,dwAttackSpeed=28,dwMoveSpeed=26,dwDuck=900,dwAppendCrit=170,dwAllSkillUpLv=9,icon='jingjie0.png',},
	},
}
function _G.BournFormulaPvPExp (dwSourPlayerLv,dwDesPlayerLv)
	return math.abs(dwSourPlayerLv - dwDesPlayerLv);
end