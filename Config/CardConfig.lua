--血条的位置

_G.CUICardConfig = 
{
	width = 0.4;---血条宽跟高
	hight = 0.04;
	HpImg ="Hp-2.png"; --血条
	BarImg1 ="Hp-1.png"; --霸体值条
	BarImg2 ="Hp-3.png"; --霸体值条
	BarImgByBarMax = false;   --霸体值上限控制霸体值条图片控制变量 false为不开启 （慎用）
	BarMaxList = {			--小于 [1]  值为 BarImg1 大于为BarImg2
			[1] = 1000;   --霸体值上限控制霸体值颜色
	};
	BarBackImg = "hpBar_background.png"; --霸体值底图
	--npc的名称
	[999] = 
	{
		x = 0;
		y = 0.30;
		z = -0.12;--称号与名字的高度差
		_z = 0.42;--任务图片与名字的高度差
		name_size = 0.095;  --名字大小
		name_textcolor = 0xFF53C353;--名字颜色   0xFFA9CE9E  0xFFBFDF57
		name_edgeColor = 0xFF000000;--名字边框颜色   0xAF928E54   0x00BFDF57
		_name_textcolor = 0xFF00FF00;--名字颜色(鼠标指向时)
		_name_edgeColor = 0xFF000000;--名字边框颜色(鼠标指向时)
		title_size = 0.085;	--称号大小
		title_textcolor = 0xFF53C353;--称号颜色  0xEFFFFF00
		title_edgeColor = 0xFF000000;--称号边框颜色   0x00BFDF57
		_title_textcolor = 0xFF00FF00;--称号颜色(鼠标指向时)
		_title_edgeColor = 0xff000000;--称号边框颜色(鼠标指向时)
		------------------
		say_size = 0.105;--说话大小
		say_textcolor = 0xfffdee05;--说话颜色  0xEFFFFF00
		say_edgeColor = 0xFF000000;--说话边框颜色   0x00BFDF57
		--_say_textcolor = 0xFFffffff;--说话颜色(鼠标指向时)
		--_say_edgeColor = 0xff00ff00;--说话边框颜色(鼠标指向时)
	};
	--掉落的名称
	[0] =
	{
		x = 0;
		y = 0;
		z = 1.05;	--名字高度
		size = 0.080;  --掉落名字大小
		edgeColor = 0xFF000000;--名字边框颜色
	};
	--怪物的血条相对于名字的位置
	[1] = 
	{
		x = 0;
		y = 0.10;
		z = 0.05;--血条与名字的高度差
		_y = -0.0002;--血条和底板的位置差
		---------------------------------------
		size = 0.085;  --怪物名字大小
		textcolor = 0xFFFFEFEF;--怪物名字颜色
		edgeColor = 0xFF000000;--怪物名字边框颜色
		_textcolor = 0xFFFF4545;--怪物名字颜色(鼠标指向时)
		_edgeColor = 0xFF000000;--怪物名字边框颜色(鼠标指向时)
		----------------------------------------
		say_size = 0.090;--说话大小
		say_textcolor = 0xfffdee05;--说话颜色  0xEFFFFF00
		say_edgeColor = 0xFF000000;--说话边框颜色   0x00BFDF57
		_say_textcolor = 0xFFFFE384;--说话颜色(鼠标指向时)
		_say_edgeColor = 0xFF000000;--说话边框颜色(鼠标指向时)
	};	
	--人的血条和名字的位置
	[2] = 
	{
		--名字的位置和颜色
		name =
		{
			--镰
			[1] = 
			{
				x = 0;
				y = -0.05;
				z = 1.4;
			};
			--刀
			[2] = 
			{
				x = 0;
				y = 0.20;
				z = 1.90;
			};
			--剑
			[3] = 
			{
				x = 0;
				y = 0.20;
				z = 1.90;  --2.75
			};
			--枪
			[4] = 
			{
				x = 0;
				y = 0;
				z = 1.7;	--1.63
			};
			size = 0.100;
			self_textcolor = 0xFF1E90FF;--自己名字颜色/字体0xFF228B22
			other_textcolor = 0xFFE3CF57;--别人名字颜色/字体
			self_edgeColor = 0xFF000000;--自己名字颜色/边框 0xFF000000
			other_edgeColor = 0xFF000000;--别人名字颜色/边框
			guilty_textcolor = 0xFF1E90FF;--PK后名字颜色/字体--自己
			guilty_edgecolor = 0xFFB22222;--PK后名字颜色/边框--自己
			guilty_textcolor_other = 0xFFffff00;--PK后名字颜色/字体--别人
			guilty_edgecolor_other = 0xFFE3170D;--PK后名字颜色/边框--别人
			-------------------------------------------------
			lover_textcolor = 0xFFFF99CC;--伴侣名字颜色/字体
			lover_edgeColor = 0x99000000;--伴侣名字颜色/边框
			lover_size = 0.100;
			title_textcolor = 0xffff9912;--称号名字颜色/字体
			title_edgeColor = 0x99000000;--称号名字颜色/边框
			title_size = 0.100;--称号文字大小
			--size = 0.140;
			--称号的宽高
			title_imgwidth = 0.9;--名号宽度
			title_imgheight = 0.195;--名号高度
			title_imgsize = 0.27;--名号上提高度
			talk_textcolor = 0xffffffff;--说话颜色/字体
			talk_edgeColor = 0x99000000;--说话颜色/边框
			talk_size = 0.105;
			----
			title_txdy = 0.13;--相对名字提升高度
			title_imgdy = 0.6;--图片相对文字
			title_imgsize2 = 0.17;--图片对图片
		};
		--血条相对于名字的位置
		card = 
		{
			x = 0;
			y = 0.035;
			z = 0.015;
			_y = -0.001;
		};
		--说话相对于名字的位置
		say =
		{
			x = 0;
			y = 0;
			z = 2;
		},
		--非骑乘时VIP标志相对于名字的位置
		VipLogoCoordinate = 
		{
			x = -0.32,
			y = 0.01,
			z = 0.05,
			w = 0.102,
			h = 0.06,
		};
		---非骑乘时境界LOGO
		BournCoordinate = 
		{
			x = -0.34,
			y = 0.06,--0.025
			z = -0.05,
			w = 0.2,
			h = 0.2,
		};
		--非骑乘时冲脉倒计时相对于名字的位置
		PulseCountCoordinate = 
		{
			w = 0.1,
			h = 0.125,
			x = 0.05,
			y = -0.3,
			z = 0.28,
		};
		--非骑乘时玩家状态标志相对名字的位置
		StateCoordinate = 
		{
			x = 0.3,
			y = 0.01,
			z = -0.09,
			
			w = 0.25,
			h = 0.25,
		};
		--非骑乘时玩家360红钻标志相对名字的位置
		RedJewelCoordinate = 
		{
			x = -0.48,
			y = 0.06,
			z = -0.05,
			
			w = 0.06,
			h = 0.04,
		};
		--非骑乘时玩家实战隐藏属性相对名字的位置
		BournHideAttrCoordinate = 
		{
			x = -0.34,
			y = 0.06,--0.025
			z = -0.05,
			w = 0.15,
			h = 0.15,
		};
		--骑乘时玩家武尊全章相对名字的位置
		GestAttrCoordinate = 
		{
			x = -0.34,
			y = 0.06,--0.025
			z = -0.05,
			w = 0.2,
			h = 0.2,
		};
	};
	--骑乘时人的血条和名字的位置
	[3] = 
	{
		--名字的位置和颜色
		name =
		{
			--镰
			[1] = 
			{
				x = 0;
				y = 0.90;
				z = 3.00;   --1.55
			};
			--刀
			[2] = 
			{
				x = 0;
				y = 0.90;
				z = 2.90; 
			};
			--剑
			[3] = 
			{
				x = 0;
				y = 0.80;
				z = 2.90; 
			};
			--枪
			[4] = 
			{
				x = 0;
				y = 0.90;
				z = 2.84; 
			};
			size = 0.095;
			self_textcolor = 0xFF1E90FF;--自己名字颜色/字体
			other_textcolor = 0xFFE3CF57;--别人名字颜色/字体
			self_edgeColor = 0xFF000000;--自己名字颜色/边框
			other_edgeColor = 0xFF000000;--别人名字颜色/边框
			guilty_textcolor = 0xFF1E90FF;--PK后名字颜色/字体--自己
			guilty_edgecolor = 0xFFB22222;--PK后名字颜色/边框--自己
			guilty_textcolor_other = 0xFFffff00;--PK后名字颜色/字体--别人
			guilty_edgecolor_other = 0xFFE3170D;--PK后名字颜色/边框--别人
			-------------------------------------------------
			lover_textcolor = 0xFFFF99CC;--伴侣名字颜色/字体
			lover_edgeColor = 0x99000000;--伴侣名字颜色/边框
			lover_size = 0.095;	
			title_textcolor = 0xffff9912;--称号名字颜色/字体
			title_edgeColor = 0x99000000;--称号名字颜色/边框
			title_imgsize = 0.24;--名号上提高度
			title_size = 0.095;--称号文字大小
			--名号的宽高
			title_imgwidth = 0.9;--名号宽度
			title_imgheight = 0.195;--名号高度
			talk_textcolor = 0xffffffff;--说话颜色/字体
			talk_edgeColor = 0x99000000;--说话颜色/边框
			talk_size = 0.100;
			----
			title_txdy = 0.13;--相对名字提升高度
			title_imgdy = 0.6;--图片相对文字
			title_imgsize2 = 0.15;--图片对图片
		};
		--骑乘时血条相对于名字的位置
		card = 
		{
			x = 0;
			y = 0.01;
			z = -0.01;
			_y = -0.0001;
		};
		--说话相对于名字的位置
		say =
		{
			x = 0;
			y = 0;
			z = 2;
		},
		--骑乘时VIP标志相对于名字的位置
		VipLogoCoordinate = 
		{
			x = -0.32,
			y = 0,
			z = 0.05,
			w = 0.102,
			h = 0.06,
		};
		--骑乘时境界标志相对于名字的位置
		BournCoordinate = 
		{
			x = -0.32,
			y = -0.050,--0.025
			z = -0.09,
			w = 0.16,
			h = 0.16,
		};
		--骑乘时冲脉倒计时相对于名字的位置
		PulseCountCoordinate = 
		{
			w = 0.1,
			h = 0.125,
			x = 0.05,
			y = -0.3,
			z = 0.28,
		};
		--骑乘时玩家状态标志相对名字的位置
		StateCoordinate = 
		{
			x = 0.3,
			y = 0.01,
			z = -0.09,
			
			w = 0.2,
			h = 0.2,
		};
		--骑乘时玩家360红钻标志相对名字的位置
		RedJewelCoordinate = 
		{
			x = -0.46,
			y = -0.05,
			z = -0.09,
			
			w = 0.12,
			h = 0.08,
		};
		--骑乘时玩家实战隐藏属性相对名字的位置
		BournHideAttrCoordinate = 
		{
			x = -0.32,
			y = -0.050,--0.025
			z = -0.09,
			w = 0.15,
			h = 0.15,
		};		
		--骑乘时玩家武尊全章相对名字的位置
		GestAttrCoordinate = 
		{
			x = -0.32,
			y = -0.050,--0.025
			z = -0.09,
			w = 0.15,
			h = 0.15,
		};
	};
	--骑乘时人的血条和名字的位置
	[120901] = 
	{
		--名字的位置和颜色
		name =
		{
			--镰
			[1] = 
			{
				x = 0;
				y = 0.90;
				z = 3.60;   --1.55
			};
			--刀
			[2] = 
			{
				x = 0;
				y = 0.90;
				z = 3.50; 
			};
			--剑
			[3] = 
			{
				x = 0;
				y = 0.80;
				z = 3.50; 
			};
			--枪
			[4] = 
			{
				x = 0;
				y = 0.90;
				z = 3.74; 
			};
			size = 0.095;
			self_textcolor = 0xFF1E90FF;--自己名字颜色/字体
			other_textcolor = 0xFFE3CF57;--别人名字颜色/字体
			self_edgeColor = 0xFF000000;--自己名字颜色/边框
			other_edgeColor = 0xFF000000;--别人名字颜色/边框
			guilty_textcolor = 0xFF1E90FF;--PK后名字颜色/字体--自己
			guilty_edgecolor = 0xFFB22222;--PK后名字颜色/边框--自己
			guilty_textcolor_other = 0xFFffff00;--PK后名字颜色/字体--别人
			guilty_edgecolor_other = 0xFFE3170D;--PK后名字颜色/边框--别人
			-------------------------------------------------
			lover_textcolor = 0xFFFF99CC;--伴侣名字颜色/字体
			lover_edgeColor = 0x99000000;--伴侣名字颜色/边框
			lover_size = 0.095;	
			title_textcolor = 0xffff9912;--称号名字颜色/字体
			title_edgeColor = 0x99000000;--称号名字颜色/边框
			title_imgsize = 0.24;--名号上提高度
			title_size = 0.095;--称号文字大小
			--名号的宽高
			title_imgwidth = 0.9;--名号宽度
			title_imgheight = 0.195;--名号高度
			talk_textcolor = 0xffffffff;--说话颜色/字体
			talk_edgeColor = 0x99000000;--说话颜色/边框
			talk_size = 0.100;
			----
			title_txdy = 0.13;--相对名字提升高度
			title_imgdy = 0.6;--图片相对文字
			title_imgsize2 = 0.15;--图片对图片
		};
		--骑乘时血条相对于名字的位置
		card = 
		{
			x = 0;
			y = 0.01;
			z = -0.01;
			_y = -0.0001;
		};
		--说话相对于名字的位置
		say =
		{
			x = 0;
			y = 0;
			z = 2;
		},
		--骑乘时VIP标志相对于名字的位置
		VipLogoCoordinate = 
		{
			x = -0.32,
			y = 0,
			z = 0.05,
			w = 0.102,
			h = 0.06,
		};
		--骑乘时境界标志相对于名字的位置
		BournCoordinate = 
		{
			x = -0.32,
			y = -0.050,--0.025
			z = -0.09,
			w = 0.16,
			h = 0.16,
		};
		--骑乘时冲脉倒计时相对于名字的位置
		PulseCountCoordinate = 
		{
			w = 0.1,
			h = 0.125,
			x = 0.05,
			y = -0.3,
			z = 0.28,
		};
		--骑乘时玩家状态标志相对名字的位置
		StateCoordinate = 
		{
			x = 0.3,
			y = 0.01,
			z = -0.09,
			
			w = 0.2,
			h = 0.2,
		};
		--骑乘时玩家360红钻标志相对名字的位置
		RedJewelCoordinate = 
		{
			x = -0.46,
			y = -0.05,
			z = -0.09,
			
			w = 0.12,
			h = 0.08,
		};
		--骑乘时玩家实战隐藏属性相对名字的位置
		BournHideAttrCoordinate = 
		{
			x = -0.32,
			y = -0.050,--0.025
			z = -0.09,
			w = 0.15,
			h = 0.15,
		};		
		--骑乘时玩家武尊全章相对名字的位置
		GestAttrCoordinate = 
		{
			x = -0.32,
			y = -0.050,--0.025
			z = -0.09,
			w = 0.15,
			h = 0.15,
		};
	};
};
-------------‘C’键界面 角色镜头
_G.UIRoleCamara =
{
	--镰
	[1] = 
	{
		CamaraPos = _Vector3.new(0,-4,1);
		LookPos = _Vector3.new(0.1,0,0.9);
		VPort = _Vector2.new(500,500);
	},
	--刀
	[2] = 
	{
		CamaraPos = _Vector3.new(0,-5,1);
		LookPos = _Vector3.new(0.13,0,1.2);
		VPort = _Vector2.new(500,500);
	},
	--剑
	[3] = 
	{
		CamaraPos = _Vector3.new(0,-5.3,1);
		LookPos = _Vector3.new(0.15,0,1.25);
		VPort = _Vector2.new(500,500);
	},
	--枪
	[4] = 
	{
		CamaraPos = _Vector3.new(0,-4.8,1);
		LookPos = _Vector3.new(0.16,0,1.2);
		VPort = _Vector2.new(500,500);
	},
	SkyLight = 
	{
		color = 0xff555555,
		power = 1,
	},
	AmbientLight = 
	{
		color = 0xd9ccbdff,
	},
};

-------------排行榜界面 角色镜头
_G.UIChartRoleCamara =
{
	--镰
	[1] = 
	{
		CamaraPos = _Vector3.new(-1.2,-4,1);
		LookPos = _Vector3.new(-0.9,0,0);
		VPort = _Vector2.new(500,500);
	},
	--刀
	[2] = 
	{
		CamaraPos = _Vector3.new(-1.2,-6,1);
		LookPos = _Vector3.new(-1.2,0,0);
		VPort = _Vector2.new(500,500);
	},
	--剑
	[3] = 
	{
		CamaraPos = _Vector3.new(-1.2,-5.5,1);
		LookPos = _Vector3.new(-1.1,0,0.1);
		VPort = _Vector2.new(500,500);
	},
	--枪
	[4] = 
	{
		CamaraPos = _Vector3.new(-1.2,-5.2,1);
		LookPos = _Vector3.new(-1.1,0,0);
		VPort = _Vector2.new(500,500);
	},
};

_G.UIRoleSelect =---角色选择界面 名字
{
	--镰
	[1] = 
	{
		x = 0,
		y = 0,
		z = 0.4,
		fSize = 0.3;--字体大小
		textColor = 0xFF1E90FF;---字体颜色
		edgeColor = 0x50000000;---边框颜色
	},
	--刀
	[2] = 
	{
		x = 0,
		y = 0,
		z = 2.2,
		fSize = 0.3;
		textColor = 0xFF1E90FF;
		edgeColor = 0x50000000;
	},
	--剑
	[3] = 
	{
		x = 0,
		y = 0,
		z = 2.5,
		fSize = 0.3;
		textColor = 0xFF1E90FF;
		edgeColor = 0x50000000;
	},
	--枪
	[4] = 
	{
		x = 0,
		y = 0,
		z = 1.8,
		fSize = 0.3;
		textColor = 0xFF1E90FF;
		edgeColor = 0x50000000;
	},
};
--界面模型光效配置
_G.UIDrawBoardConfig = 
{	
-----NPC模型光
	UINpc = 
	{
		SkyLight = 
		{
			color = 0xFFE8DAB2,
			power = 0.85,
		},
		AmbientLight = 
		{
			color = 0xd996B6C0,
		},
	};
	UIShop = 
	{
		SkyLight = 
		{
			color = 0xFFF8E7B7,
			power = 0.9,
		},
		AmbientLight = 
		{
			color = 0xd9B49DB1,
		},
	};
-----宝剑模型光
	UISword = 
	{
		SkyLight = 
		{
			color = 0xFFF8E7B7,
			power = 1,
		},
		AmbientLight = 
		{
			color = 0xd9B49DB1,
		},
	};
-----葫芦模型光
	UIGourd = 
	{
		SkyLight = 
		{
			color = 0xFFF8E7B7,
			power = 1,
		},
		AmbientLight = 
		{
			color = 0xd9B49DB1,
		},
	};
-----暗器模型光
	HiddenWeaponUI = 
	{
		SkyLight = 
		{
			color = 0xFFF8E7B7,
			power = 1,
		},
		AmbientLight = 
		{
			color = 0xd9B49DB1,
		},
	};
	
-----盾牌模型光
	CShieldMainUI = 
	{
		SkyLight = 
		{
			color = 0xFFF8E7B7,
			power = 1,
		},
		AmbientLight = 
		{
			color = 0xd9B49DB1,
		},
	};
-----角色模型光
	UIRole = 
	{
		SkyLight = 
		{
			color = 0xFFF8E7B7,
			power = 0.72,
		},
		AmbientLight = 
		{
			color = 0xd9B49DB1,
		},
	};
---怪物模型光
	UIMonster = 
	{
		SkyLight = 
		{
			color = 0xFFE8DAB2,
			power = 0.86,
		},
		AmbientLight = 
		{
			color = 0xd996B6C0,
		},
	};
};