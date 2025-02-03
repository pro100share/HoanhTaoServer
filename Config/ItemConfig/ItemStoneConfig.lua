--宝石的增加信息列表

--key :dwItemEnum
-------------因为计算使用的是装备那里的函数，所以列名称必须一样
--dwPower ：镶嵌于兵甲上，可提高自身攻击力。力
--dwDefence ：镶嵌于兵甲上，可提高自身防御力。力
--dwBaoJi ：镶嵌于兵甲上，可提高暴击几率。
--dwShenFa ：镶嵌于兵甲上，可提高自身身法。身法+
--dwAttackSpeed ：镶嵌于兵甲上，可提高自身攻击力。速度
--dwMoveSpeed ：增加移动速度
--dwHPLimited ：增加生命值上限
--dwMPLimited ：增加内力上限
--dwSubDamage ：伤害减免
--dwStoneType : 宝石类型

--宝石类型
_G.StoneTypeEnum = {
    PuTong  = 0;    --普通
    JiPin   = 1;    --极品
};

_G.StoneBaseData = 
{
		[3100010]={dwItemEnum=3100010,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+2',dwPower=0,dwDefence=0,dwBaoJi=2,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200010]={dwItemEnum=3200010,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+3',dwPower=0,dwDefence=3,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300010]={dwItemEnum=3300010,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+5',dwPower=5,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400010]={dwItemEnum=3400010,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+3',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=3,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500010]={dwItemEnum=3500010,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+15',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=15,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100020]={dwItemEnum=3100020,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+4',dwPower=0,dwDefence=0,dwBaoJi=4,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200020]={dwItemEnum=3200020,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+8',dwPower=0,dwDefence=8,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300020]={dwItemEnum=3300020,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+12',dwPower=12,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400020]={dwItemEnum=3400020,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+6',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=6,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500020]={dwItemEnum=3500020,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+36',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=36,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100030]={dwItemEnum=3100030,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+7',dwPower=0,dwDefence=0,dwBaoJi=7,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200030]={dwItemEnum=3200030,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+14',dwPower=0,dwDefence=14,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300030]={dwItemEnum=3300030,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+22',dwPower=22,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400030]={dwItemEnum=3400030,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+11',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=11,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500030]={dwItemEnum=3500030,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+66',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=66,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100040]={dwItemEnum=3100040,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+11',dwPower=0,dwDefence=0,dwBaoJi=11,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200040]={dwItemEnum=3200040,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+22',dwPower=0,dwDefence=22,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300040]={dwItemEnum=3300040,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+36',dwPower=36,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400040]={dwItemEnum=3400040,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+17',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=17,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500040]={dwItemEnum=3500040,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+108',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=108,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100050]={dwItemEnum=3100050,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+18',dwPower=0,dwDefence=0,dwBaoJi=18,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200050]={dwItemEnum=3200050,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+35',dwPower=0,dwDefence=35,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300050]={dwItemEnum=3300050,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+58',dwPower=58,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400050]={dwItemEnum=3400050,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+27',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=27,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500050]={dwItemEnum=3500050,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+174',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=174,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100060]={dwItemEnum=3100060,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+39',dwPower=0,dwDefence=0,dwBaoJi=39,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200060]={dwItemEnum=3200060,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+77',dwPower=0,dwDefence=77,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300060]={dwItemEnum=3300060,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+128',dwPower=128,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400060]={dwItemEnum=3400060,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+58',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=58,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500060]={dwItemEnum=3500060,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+384',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=384,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100070]={dwItemEnum=3100070,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+60',dwPower=0,dwDefence=0,dwBaoJi=60,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200070]={dwItemEnum=3200070,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+120',dwPower=0,dwDefence=120,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300070]={dwItemEnum=3300070,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+200',dwPower=200,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400070]={dwItemEnum=3400070,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+90',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=90,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500070]={dwItemEnum=3500070,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+600',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=600,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100080]={dwItemEnum=3100080,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+96',dwPower=0,dwDefence=0,dwBaoJi=96,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200080]={dwItemEnum=3200080,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+192',dwPower=0,dwDefence=192,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300080]={dwItemEnum=3300080,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+320',dwPower=320,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400080]={dwItemEnum=3400080,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+144',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=144,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500080]={dwItemEnum=3500080,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+960',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=960,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100090]={dwItemEnum=3100090,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+135',dwPower=0,dwDefence=0,dwBaoJi=135,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200090]={dwItemEnum=3200090,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+270',dwPower=0,dwDefence=270,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300090]={dwItemEnum=3300090,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+450',dwPower=450,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400090]={dwItemEnum=3400090,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+203',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=203,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500090]={dwItemEnum=3500090,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+1350',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=1350,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100100]={dwItemEnum=3100100,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+180',dwPower=0,dwDefence=0,dwBaoJi=180,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200100]={dwItemEnum=3200100,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+360',dwPower=0,dwDefence=360,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300100]={dwItemEnum=3300100,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+600',dwPower=600,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400100]={dwItemEnum=3400100,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+270,',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=270,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500100]={dwItemEnum=3500100,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+1800',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=1800,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100110]={dwItemEnum=3100110,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+270',dwPower=0,dwDefence=0,dwBaoJi=270,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200110]={dwItemEnum=3200110,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+485',dwPower=0,dwDefence=485,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300110]={dwItemEnum=3300110,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+770',dwPower=770,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400110]={dwItemEnum=3400110,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+350,',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=350,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500110]={dwItemEnum=3500110,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+2350',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=2350,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3100120]={dwItemEnum=3100120,strName='紫翡翠',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+435',dwPower=0,dwDefence=0,dwBaoJi=435,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3200120]={dwItemEnum=3200120,strName='蓝宝石',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+625',dwPower=0,dwDefence=625,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3300120]={dwItemEnum=3300120,strName='火琉璃',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+970',dwPower=970,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3400120]={dwItemEnum=3400120,strName='金珍珠',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+455,',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=455,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
		[3500120]={dwItemEnum=3500120,strName='绿水晶',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+2900',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=2900,dwMPLimited=0,dwSubDamage=0,dwStoneType = 0,},
			
		[3110010]={dwItemEnum=3110010,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+3',dwPower=0,dwDefence=0,dwBaoJi=3,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3210010]={dwItemEnum=3210010,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+5',dwPower=0,dwDefence=5,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3310010]={dwItemEnum=3310010,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+8',dwPower=8,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3410010]={dwItemEnum=3410010,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+5',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=5,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3510010]={dwItemEnum=3510010,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+23',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=23,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3110020]={dwItemEnum=3110020,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+6',dwPower=0,dwDefence=0,dwBaoJi=6,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3210020]={dwItemEnum=3210020,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+12',dwPower=0,dwDefence=12,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3310020]={dwItemEnum=3310020,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+18',dwPower=18,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3410020]={dwItemEnum=3410020,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+9',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=9,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3510020]={dwItemEnum=3510020,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+54',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=54,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3110030]={dwItemEnum=3110030,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+11',dwPower=0,dwDefence=0,dwBaoJi=11,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3210030]={dwItemEnum=3210030,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+21',dwPower=0,dwDefence=21,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3310030]={dwItemEnum=3310030,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+33',dwPower=33,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3410030]={dwItemEnum=3410030,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+17',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=17,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3510030]={dwItemEnum=3510030,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+99',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=99,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3110040]={dwItemEnum=3110040,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+17',dwPower=0,dwDefence=0,dwBaoJi=17,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3210040]={dwItemEnum=3210040,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+33',dwPower=0,dwDefence=33,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3310040]={dwItemEnum=3310040,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+54',dwPower=54,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3410040]={dwItemEnum=3410040,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+26',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=26,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3510040]={dwItemEnum=3510040,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+162',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=162,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3110050]={dwItemEnum=3110050,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+27',dwPower=0,dwDefence=0,dwBaoJi=27,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3210050]={dwItemEnum=3210050,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+53',dwPower=0,dwDefence=53,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3310050]={dwItemEnum=3310050,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+87',dwPower=87,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3410050]={dwItemEnum=3410050,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+41',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=41,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3510050]={dwItemEnum=3510050,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+261',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=261,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3110060]={dwItemEnum=3110060,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+59',dwPower=0,dwDefence=0,dwBaoJi=59,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3210060]={dwItemEnum=3210060,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+116',dwPower=0,dwDefence=116,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3310060]={dwItemEnum=3310060,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+192',dwPower=192,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3410060]={dwItemEnum=3410060,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+87',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=87,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3510060]={dwItemEnum=3510060,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+576',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=576,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3110070]={dwItemEnum=3110070,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+90',dwPower=0,dwDefence=0,dwBaoJi=90,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3210070]={dwItemEnum=3210070,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+180',dwPower=0,dwDefence=180,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3310070]={dwItemEnum=3310070,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+300',dwPower=300,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3410070]={dwItemEnum=3410070,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+135',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=135,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3510070]={dwItemEnum=3510070,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+900',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=900,dwMPLimited=0,dwSubDamage=0,dwStoneType = 1,},
		[3110080]={dwItemEnum=3110080,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+144',dwPower=0,dwDefence=0,dwBaoJi=144,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3210080]={dwItemEnum=3210080,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+288',dwPower=0,dwDefence=288,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3310080]={dwItemEnum=3310080,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+480',dwPower=480,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3410080]={dwItemEnum=3410080,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+216',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=216,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3510080]={dwItemEnum=3510080,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+1440',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=1440,dwMPLimited=0,dwSubDamage=0,},
		[3110090]={dwItemEnum=3110090,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+203',dwPower=0,dwDefence=0,dwBaoJi=203,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3210090]={dwItemEnum=3210090,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+405',dwPower=0,dwDefence=405,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3310090]={dwItemEnum=3310090,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+675',dwPower=675,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3410090]={dwItemEnum=3410090,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+305',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=305,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3510090]={dwItemEnum=3510090,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+2025',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=2025,dwMPLimited=0,dwSubDamage=0,},
		[3110100]={dwItemEnum=3110100,strName='紫翡翠(极品)',strEffectDescription='镶嵌于兵甲上，可提高暴击几率。暴击+270',dwPower=0,dwDefence=0,dwBaoJi=270,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3210100]={dwItemEnum=3210100,strName='蓝宝石(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身防御力。防御+540',dwPower=0,dwDefence=540,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3310100]={dwItemEnum=3310100,strName='火琉璃(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身攻击力。攻击+900',dwPower=900,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3410100]={dwItemEnum=3410100,strName='金珍珠(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身身法。身法+405',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=405,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=0,dwMPLimited=0,dwSubDamage=0,},
		[3510100]={dwItemEnum=3510100,strName='绿水晶(极品)',strEffectDescription='镶嵌于兵甲上，可提高自身生命上限。生命+2700',dwPower=0,dwDefence=0,dwBaoJi=0,dwShenFa=0,dwAttackSpeed=0,dwMoveSpeed=0,dwHPLimited=2700,dwMPLimited=0,dwSubDamage=0,},
		
		};

        
----物品佩戴的位置
-- _G.enItemWearPos = {
	-- eWeapon		= 1,			--武器
	-- eCloth		= 2,			--衣服
	-- eLeg		    = 3,			--护腿
	-- eGloves		= 4,			--护手
	-- eBelt		= 5,			--腰带
	-- eHead		= 6,			--头饰
	-- eShoes		= 7,			--鞋子
	-- eCloak		= 8,			--披风
	-- eNecklace	= 9,			--项链
	-- eRing		= 10,			--戒指
	-- eBracelet	= 11,			--手镯
	-- ePendant	    = 12,			--腰坠
-- };
--精华(JH)对应(TO)石头(ST)

--火琉璃	攻击	武器
--火琉璃	攻击	手镯
--火琉璃	攻击	蹄铁
--蓝宝石	防御	衣服
--蓝宝石	防御	护手
--蓝宝石	防御	鞍具
--金珍珠	身法	鞋子
--金珍珠	身法	腰带
--金珍珠	身法	蹬具
--紫翡翠	暴击	头饰
--紫翡翠	暴击	戒指
--紫翡翠	暴击	缰绳
--绿水晶	生命	项链
--绿水晶	生命	腰坠
--绿水晶	生命	护腿
--绿水晶	生命	披风

_G.JHToST = {
--------------攻击---------------------------
    --武器
    [_G.enItemWearPos.eWeapon] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310100;
		};
    	[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310120;
		};
	};
	
	--手镯
    [_G.enItemWearPos.eBracelet] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310100;
		};
        [11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310120;
		};
	};
	
		--蹄铁
    [_G.enItemWearPos.eMount4] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310100;
		};
    	[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3300120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3310120;
		};   
   };
	
	-------------防御--------------------------------------------------------	
			--衣服
    [_G.enItemWearPos.eCloth] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210100;
		};
        [11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210120;
		};
	};
	
		--护手
    [_G.enItemWearPos.eGloves] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210100;
		};
       	[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210120;
		};
   };
		
		--鞍具
    [_G.enItemWearPos.eMount1] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210100;
		};
    	[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3200120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3210120;
		};  
  };
	
	
	--------------------------------------身法---------------------------------------------------------------------
	---鞋子 
		[_G.enItemWearPos.eShoes] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410100;
		};
    	[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410120;
		};   
   };
	
	---腰带 
		[_G.enItemWearPos.eBelt] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410100;
		};
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410120;
		};
    };

	---蹬具 
		[_G.enItemWearPos.eMount3] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410100;
		};
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3400120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3410120;
		};
    };
	-------------------------暴击-----------------------------
		--头饰
		[_G.enItemWearPos.eHead] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110100;
		};
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110120;
		};
    };
	
		--戒指
		[_G.enItemWearPos.eRing] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110100;
		};
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110120;
		};
    };
		--缰绳
		[_G.enItemWearPos.eMount2] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110100;
		};
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3100120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3110120;
		};
    };
	
	------------------------生命----------------------------
	--项链	
		 [_G.enItemWearPos.eNecklace] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510100;
		};
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510120;
		};
    };
	-----腰坠
	
		[_G.enItemWearPos.ePendant] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510100;
        };
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510120;
		};
	};

		---护腿
		[_G.enItemWearPos.eLeg] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510100;
        };
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510120;
		};
	};
		---披风
		[_G.enItemWearPos.eCloak] = {
		[1] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500010;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510010;
		};
		[2] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500020;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510020;
		};
		[3] = {
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500030;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510030;
		};
		[4] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500040;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510040;
		};
		[5] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500050;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510050;
		};
		[6] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500060;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510060;
		};
		[7] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500070;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510070;
		};
		[8] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500080;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510080;
		};
		[9] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500090;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510090;
		};
		[10] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500100;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510100;
        };
		[11] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500110;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510110;
		};
		[12] = {--等阶
			--普通
			[_G.StoneTypeEnum.PuTong]   = 3500120;
			--极品
			[_G.StoneTypeEnum.JiPin]  = 3510120;
		};
	};
};
--石头(ST)对应(To)精华(JH)
----等阶*10 + 石头类型
_G.STToJH = 
{	
	[10] = 3900010;--1阶普通宝石精华
    [11] = 3910010;--1阶极品宝石精华
    [20] = 3900020;--2阶普通宝石精华
    [21] = 3910020;--2阶极品宝石精华
    [30] = 3900030;--3阶普通宝石精华
    [31] = 3910030;--3阶极品宝石精华
    [40] = 3900040;--4阶普通宝石精华
    [41] = 3910040;--4阶极品宝石精华
    [50] = 3900050;--5阶普通宝石精华
    [51] = 3910050;--5阶极品宝石精华
    [60] = 3900060;--6阶普通宝石精华
    [61] = 3910060;--6阶极品宝石精华
    [70] = 3900070;--7阶普通宝石精华
    [71] = 3910070;--7阶极品宝石精华
    [80] = 3900080;--8阶普通宝石精华
    [81] = 3910080;--8阶极品宝石精华
    [90] = 3900090;--9阶普通宝石精华
    [91] = 3910090;--9阶极品宝石精华
    [100] = 3900100;--10阶普通宝石精华
    [101] = 3910100;--10阶极品宝石精华
    [110] = 3900110;--11阶普通宝石精华
    [111] = 3910110;--11阶极品宝石精华
	[120] = 3900120;--12阶普通宝石精华
    [121] = 3910120;--12阶极品宝石精华
};

--位置图片配置
_G.StonePanelPosPic = {
	[1] = "zb_bj_wq.png";
	[2] = "zb_bj_yf.png";
	[3] = "zb_bj_kz.png"; 
	[4] = "zb_bj_hw.png";
	[5] = "zb_bj_yd.png"; 
	[6] = "zb_bj_ts.png";
	[7] = "zb_bj_xz.png";
	[8] = "zb_bj_pf.png";
	[9] = "zb_bj_xl.png";
	[10] = "zb_bj_jz.png";
	[11] = "zb_bj_sz.png";
	[12] = "zb_bj_yz.png";
	[21] = "zb_bj_aj.png";
	[23] = "zb_bj_dj.png";
	[22] = "zb_bj_js.png";
	[24] = "zb_bj_tt.png";
}
--dwPower ：镶嵌于兵甲上，可提高自身攻击力。力
--dwDefence ：镶嵌于兵甲上，可提高自身防御力。力
--dwBaoJi ：镶嵌于兵甲上，可提高暴击几率。
--dwShenFa ：镶嵌于兵甲上，可提高自身身法。身法+
--dwAttackSpeed ：镶嵌于兵甲上，可提高自身攻击力。速度
--dwMoveSpeed ：增加移动速度
--dwHPLimited ：增加生命值上限
--dwMPLimited ：增加内力上限
_G.StonePanelText = {
	szLevel = " %s品";
	szNum = "已镶嵌(%d/5）";
	sztext = "%s  %s + %d";
	szGray = "<font color='#f15d27'>未激活</font>";
	Value = {
		dwPower = "攻击";
		dwDefence = "防御";
		dwBaoJi = "暴击";
		dwShenFa = "身法";
		dwAttackSpeed = "攻击速度";
		dwMoveSpeed = "移动速度";
		dwHPLimited = "生命";
		dwMPLimited = "内力";
	};
	szNone = "宝石最高品级为：<font color='#31cf32'>12品</font><br/><font color='#31cf32'>可以通过宝石合成，合成更高级的宝石</font>";
	szPick = {
		[1] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>攻击+970</font>";
		[2] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>防御+625</font>";
		[3] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>生命+2900</font>";
		[4] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>防御+625</font>";
		[5] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>身法+455</font>";
		[6] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>暴击+435</font>";
		[7] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>身法+455</font>";
		[8] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>生命+2900</font>";
		[9] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>生命+2900</font>";
		[10] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>暴击+435</font>";
		[11] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>攻击+970</font>";
		[12] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>生命+2900</font>";
		[21] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>防御+625</font>";
		[23] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>身法+455</font>";
		[22] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>暴击+435</font>";
		[24] = "宝石最高品级为：<font color='#31cf32'>12品</font><br/>属性加成：<font color='#31cf32'>攻击+970</font>";
	};
}

_G.StonePosTypeInfoCfg = {
	[1] = 3300120;
	[2] = 3200120;
	[3] = 3500120;
	[4] = 3400120;
	[5] = 3100120;
}