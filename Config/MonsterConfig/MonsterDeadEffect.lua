--怪物死亡击飞的配置

_G.MonsterDeadEffect = 
{
	dwRand = 500;--击飞的概率，最大10000
	
	dwLength = 3.5;--击飞距离
	dwFlyTime = 150;--飞行时间
	dwActionID = 10;--击飞的动作
}

--怪物被击时身上的光
_G.MonsterHurtEffect = 
{
	--普通怪
	[0] =
	{
		dwColor = 0x33FF0000;--被击时身上的颜色
		dwTime = 50;--持续时间
	};
	--精英怪
	[1] =
	{
		dwColor = 0x33FF0000;--被击时身上的颜色
		dwTime = 40;--持续时间
	};
	--BOSS
	[2] =
	{
		dwColor = 0x33FF0000;--被击时身上的颜色
		dwTime = 30;--持续时间
	};
	
	
}


--怪物归属相关配置
_G.MonsterOwnerType = 
{
	None = 0;--没有
	Guild = 1;--归属世家
	RoleSingle = 2;--归属个人，个人PK模式
	RoleTeam = 3;--归属个人，组队PK模式
}

