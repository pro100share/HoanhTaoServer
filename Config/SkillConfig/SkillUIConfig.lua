--技能面板链接配置
_G.SkillUIConfig = {
	--剑
	[enProfType.eProfType_Sword] ={
		--招式
		[1] = {
			21001,
			21004,
			21003,
			21005,
			21006,
		},
		--内功
		[2] = {
			11003,
			11007,
			11008,
			11009,
			11017,
			11016,
		},
		--心法
		[3] = {
			12006,
			12008,
			12009,
			12017,
			12011,
			12016,
		},
		--基础
		[4] = {

		},

	},
	--刀
	[enProfType.eProfType_Knife] ={
		--招式
		[1] = {
			31001,
			31004,
			31003,
			31005,
			31006,
		},
		--内功
		[2] = {
			11003,
			11007,
			11008,
			11009,
			11017,
			11016,
		},
		--心法
		[3] = {
			12006,
			12008,
			12009,
			12017,
			12011,
			12016,
		},
		--基础
		[4] = {
			
		},
	},
	--枪
	[enProfType.eProfType_Spear] ={
		--招式
		[1] = {
			41001,
			41004,
			41003,
			41005,
			41006,
		},
		--内功
		[2] = {
			11003,
			11007,
			11008,
			11009,
			11017,
			11016,
		},
		--心法
		[3] = {
			12006,
			12008,
			12009,
			12017,
			12011,
			12016,
		},
		--基础
		[4] = {

		},
	},
	--镰刀
	[enProfType.eProfType_Sickle] ={
		--招式
		[1] = {	
			51001,
			51004,
			51003,
			51005,
			51006,
		},
		--内功
		[2] = {
			11003,
			11007,
			11008,
			11009,
			11017,
			11016,
		},
		--心法
		[3] = {
			12006,
			12008,
			12009,
			12017,
			12011,
			12016,
		},
		--基础
		[4] = {

		},
	},
	
	--江湖绝学
	[99] = {
		--镰职业
		[1] = {
			--招式下列
			[1] = {
				51000,
				11002,
				11013,
				61001,
				},
			--内功下列
			[2] = {
				13023,
				13028,
				13025,
				13021,
				13027,
				},
			--心法下列
			[3] = {
				13026,
				13022,
				13018,
				13024,
				13020,
				},
			--基础下列
			[4] = {
				},
		};
		
		--刀职业
		[2] = {
			--招式下列
			[1] = {
				31000,
				11002,
				11013,
				61001,
				},
			--内功下列
			[2] = {
				13023,
				13028,
				13025,
				13021,
				13027,
				},
			--心法下列
			[3] = {
				13026,
				13022,
				13018,
				13024,
				13020,
				},
			--基础下列
			[4] = {
				},
		};
		
		--剑
		[3] = {
			--招式下列
			[1] = {
				21000,
				11002,
				11013,
				61001,
				},
			--内功下列
			[2] = {
				13023,
				13028,
				13025,
				13021,
				13027,
				},
			--心法下列
			[3] = {
				13026,
				13022,
				13018,
				13024,
				13020,
				},
			--基础下列
			[4] = {
				},
		};
		
		--枪职业
		[4] = {
				--招式下列
			[1] = {
				41000,
				11002,
				11013,
				61001,
				},
			--内功下列
			[2] = {
				13023,
				13028,
				13025,
				13021,
				13027,
				},
			--心法下列
			[3] = {
				13026,
				13022,
				13018,
				13024,
				13020,
				},
			--基础下列
			[4] = {
				},
		};
	},
}

--技能ID对应的分页
_G.SkillIDToPage = {};
local function CountSkillPage()
	for a,tb1 in pairs(SkillUIConfig)do
		if a == 99 then
			for n,tb2 in pairs(tb1)do
				for idx,tb3 in pairs(tb2)do
					for _,skl in pairs(tb3)do
						SkillIDToPage[skl] = idx;
					end
				end
			end
		else
			for idx,tb2 in pairs(tb1)do
				for _,skl in pairs(tb2)do
					SkillIDToPage[skl] = idx;
				end
			end
		end
	end
end;
CountSkillPage();

_G.SkillUIIconConfig = {
	--剑
	[enProfType.eProfType_Sword] ={
		[1] = "ui_skill_jian01.png";
		[2] = "ui_skill_jian02.png";
		[3] = "ui_skill_jian03.png";
		[4] = "ui_skill_jian04.png";
		[5] = "ui_skill_jian04.png";
		[6] = "ui_skill_jian04.png";
	};
	--刀
	[enProfType.eProfType_Knife] ={
		[1] = "ui_skill_dao01.png";
		[2] = "ui_skill_dao02.png";
		[3] = "ui_skill_dao03.png";
		[4] = "ui_skill_dao04.png";
		[5] = "ui_skill_dao04.png";
		[6] = "ui_skill_dao04.png";		
	};
	--枪
	[enProfType.eProfType_Spear] ={
		[1] = "ui_skill_qiang01.png";
		[2] = "ui_skill_qiang02.png";
		[3] = "ui_skill_qiang03.png";
		[4] = "ui_skill_qiang04.png";
		[5] = "ui_skill_qiang04.png";
		[6] = "ui_skill_qiang04.png";
	};
	--镰
	[enProfType.eProfType_Sickle] ={
		[1] = "ui_skill_lian01.png";
		[2] = "ui_skill_lian02.png";
		[3] = "ui_skill_lian03.png";
		[4] = "ui_skill_lian04.png";
		[5] = "ui_skill_lian04.png";
		[6] = "ui_skill_lian04.png";
	};
}
--其他
_G.SkillUIStringConfig =
{
	[1] = [[<font color="#FFCC66">%s</font>]];--技能名称
	[2] = [[<font color="#FFFFFF">层数：</font><font color="#00CC33">%s</font>]];--技能等级
	[3] = "<font color='#FE0000'>未学习</font>";
	[4] = [[<font color="#FFFFFF">%s</font>]];--修炼进度，进度条（%）
	
	[5] = [[<p align='left'><font size = '14' color="#FFFFFF">武学类型：</font><font size = '14' color="#FF9933">%s</font></p>]];
	[6] = [[<p align='left' ><font color="#FFFFFF">冷却时间：</font><font color="#00CC33">%s</font></p>]];
	[7] = [[<p align='left'><font color="#FFFFFF">内力消耗：</font><font color="#00CC33">%s</font></p>]];
	
	[8] = [[<p align='left'><font color="#FFFFFF">武器需求：</font><font color="#D2D1CD">%s</font></p>]];
	[9] = [[<p align='left'><font color="#FFFFFF">技能距离：</font><font color="#D2D1CD">%s</font></p>]];
	[10] = [[<p align='left'><font color="#FFFFFF">技能范围：</font><font color="#D2D1CD">%s</font></p>]];
	--------------------------------------------------------------------------
	[11] = [[<p align='left'><font color="#FFFFFF">技能说明：</font><font color="#FF9933">%s</font></p>]];
	[12] = [[<p align='left'><font color="#FFFFFF">当前效果：</font><font color="#F0DC79">%s</font></p>]];
	[13] = [[<p align='left'><font color="#FFFFFF">下级效果：</font><font color="#D2D1CD">%s</font></p>]];
	[14] = [[<p align='left'><font color="#FFFFFF">武学渊源：</font><font color="#FFFFFF">%s</font></p>]];
	[15] = [[<p align='left'><font color="#FFFFFF">升级需求：</font><font color="#D2D1CD">%s</font></p>]];
	[16] = [[<p align='left'><font color="#FFFFFF">升级消耗：</font><font color="#D2D1CD">%s</font></p>]];
	[17] = [[级]];
	[18] = "学习技能";
	[19] = "提升层数";
	[20] = [[<font color="#FFFFFF">武学层数：</font><font color="#D2D1CD">%s</font>]];
	[21] = [[<font color="#FFFFFF">武学数量：</font><font color="#D2D1CD">%s</font>]];
	[22] = [[]];
	[23] = [[</font><font color="#00CC33">(+%s)</font>]];--附加层数
	[24] = [[<p align='left'><font color="#FFFFFF">修炼进度：</font><font color="#FFFFFF">%s</font><tab/><tab/><tab/>%s</p>]];--修炼进度（悬浮框）
	[25] = [[需要武器]];--需要武器
	[26] = [[<p align='left'><font color="#eeff00">%s</font></p>]];--当前效果每行文字颜色
	[27] = [[<p align='left'><font color="#eeff00">%s</font></p>]];--下级效果每行文字颜色
	[28] = [[<p align='left'><font color="#FFFFFF">%s</font></p>]];--武学渊源文字颜色
	[29] = [[%s%%]];--修炼进度（未满）
	[30] = [[<font color="#00ff00">%s%%</font>]];--修炼进度（已满） 
	[31] = [[<font color="#00ff00">不可提升</font>]];--修炼进度（满级） 
	[32] = [[学习需求:%s]];
	[33] = [[升级需求：%s]];
	
	[34] = [[名剑等级：%s]];
	[35] = [[名剑伤害：%s]];
	[36] = [[最多攻击目标数量：%s]];
	[37] = [[触发几率：%s]];
	[38] = [[能力说明：<br/>%s]];
	
	[39] = [[宝甲等级：%s]];
	[40] = [[抵挡名剑伤害：%s]];
	
	[41] = [[<font color="#FFFFFF">学习等级：</font><font color="#FE0000">%d 级</font>]];--技能学习等级红
	[42] = [[<font color="#FFFFFF">学习等级：</font><font color="#FFFFFF">%d 级</font>]];--技能学习等级白

	-------------功法 易筋经技能TIPS
	[43] = [[<font color="#FFFFFF">技能说明: </font><br /><font color="#FF9933">%s</font>]]; --功法技能描述
	[44] = [[<font color="#FFFFFF">激活条件: </font><font color="#4daeed">领悟%s</font><br />]];--功法技能学习状态
	[45] = [[<font color="#FFFFFF">当前已领悟：</font><font color="#FFFF00">%s</font>]];
	[46] = [[<font color="#FFFFFF">武学类型：</font><font color="#FFFF00">%s</font>]];
	[47] = [[<font color="#FFFFFF">技能效果：</font><br /><font color="#FF9933">%s</font>]];
	[48] = [[<font color="#FFFFFF">激活条件: </font><font color="#4daeed">%s</font><br />]];--功法技能学习状态
	-------------暗器 技能TIPS
	[49] = [[暗器等级：%s]];
	-------------法宝
	[50] = [[法宝等级：%s]];
	[51] = [[抵挡暗器伤害：%s]];
	-------------战旗 技能TIPS
	[52] = [[战旗等级：%s]];
	--------------------------------------------------------------------------
	SkillType = {
		[1] = [[招式（主动使用）]];
		[2] = [[内功（开启生效）]];
		[3] = [[心法（被动生效）]];
	};
	CoolDown = {
		Hour = [[%s小时%s分%s秒]];
		Min = [[%s分%s秒]];
		Sec = [[%s秒]];
	};
	Cost = {
		[1] = [[<p align='left'><font color="#FFBA00">%s消耗：</font><font color="#D2D1CD">%s</font></p>]];
		[2] = [[生命]];
		[3] = [[内力]];
		[4] = [[金]];
		[5] = [[木]];
		[6] = [[水]];
		[7] = [[火]];
		[8] = [[土]];
		[9] = [[煞元]];
		[10] = [[物品]];
	};
	Sword = {
		[0] = [[无需求]];
		[1] = [[镰]];
		[2] = [[刀]];
		[3] = [[剑]];
		[4] = [[枪]];
	};
	Range = {
		[0] = [[无需目标]];
		[1] = [[近程]];
		[2] = [[远程]];
	};
	RangeType = {
		[1] = [[单体]];
		[2] = [[群体性]];
		[5] = [[单体]];
	};
	Color = {
		[1] = [[#ffffff]];--满足
		[2] = [[#ff0000]];--不满足
	};
	TitleIcon = {
		[1] = "skill_ui_loli.png";
		[2] = "skill_ui_Dao.png";
		[3] = "skill_ui_Jian.png";
		[4] = "skill_ui_Qiang.png";
	}
}

--技能界面
_G.SkillUIPanelStringConfig =
{
	[1] = [[<font color="#c56925">%s</font>]];--技能名称
	[2] = [[<font color="#dcb857">层数：</font><font color="#00CC33">%s</font>]];--技能等级
	[3] = "<font color='#cd0000'>未学习</font>";
	[4] = [[<font color="#d9ccbd">%s</font>]];--修炼进度，进度条（%）
	
	[5] = [[<p align='left'><font color="#dcb857">武学类型：</font><font color="#d9ccbd">%s</font></p>]];
	[6] = [[<p align='left'><font color="#dcb857">冷却时间：</font><font color="#d9ccbd">%s</font></p>]];
	[7] = [[<p align='left'><font color="#dcb857">内力消耗：</font><font color="#d9ccbd">%s</font></p>]];
	
	[8] = [[<p align='left'><font color="#dcb857">武器需求：</font><font color="#d9ccbd">%s</font></p>]];
	[9] = [[<p align='left'><font color="#dcb857">技能距离：</font><font color="#d9ccbd">%s</font></p>]];
	[10] = [[<p align='left'><font color="#dcb857">技能范围：</font><font color="#d9ccbd">%s</font></p>]];
	--------------------------------------------------------------------------
	[11] = [[<p align='left'><font color="#dcb857">技能说明：</font><font color="#d9ccbd">%s</font></p>]];
	[12] = [[<p align='left'><font color="#dcb857">当前效果：</font><font color="#d9ccbd">%s</font></p>]];
	[13] = [[<p align='left'><font color="#dcb857">下级效果：</font><font color="#d9ccbd">%s</font></p>]];
	[14] = [[<p align='left'><font color="#dcb857">武学渊源：</font><font color="#d9ccbd">%s</font></p>]];
	[15] = [[<p align='left'><font color="#dcb857">升级需求：</font><font color="#d9ccbd">%s</font></p>]];
	[16] = [[<p align='left'><font color="#dcb857">升级消耗：</font><font color="#d9ccbd">%s</font></p>]];
	[17] = [[级]];
	[18] = "学习技能";
	[19] = "提升层数";
	[20] = [[<font color="#dcb857">武学层数：</font><font color="#d9ccbd">%s</font>]];
	[21] = [[<font color="#dcb857">武学数量：</font><font color="#d9ccbd">%d/%d</font>]];
	[22] = [[]];
	[23] = [[</font><font color="#0dab01">(+%s)</font>]];--附加层数
	[24] = [[<p align='left'><font color="#dcb857">修炼进度：</font><font color="#d9ccbd">%s</font><tab/><tab/><tab/>%s</p>]];--修炼进度（悬浮框）
	[25] = [[    需要武器]];--需要武器
	[26] = [[<p align='left'><font color="#dcb857">%s</font></p>]];--当前效果每行文字颜色
	[27] = [[<p align='left'><font color="#dcb857">%s</font></p>]];--下级效果每行文字颜色
	[28] = [[<p align='left'><font color="#dcb857">%s</font></p>]];--武学渊源文字颜色
	[29] = [[%s%%]];--修炼进度（未满）
	[30] = [[<font color="#00ff00">%s%%</font>]];--修炼进度（已满） 
	[31] = [[<font color="#00ff00">不可提升</font>]];--修炼进度（满级） 
	[32] = [[学习需求:%s]];
	[33] = [[升级需求：%s]];
	[34] = [[<font color="#cd0000">未领悟</font>]];
	[35] = [[<font color="#00cd00">可领悟</font>]];
	[36] = [[<font color="#0dab01">+%s]];--技能等级加成
	--------------------------------------------------------------------------
	SkillLevel = {
		[1] = "%d";
	};
	SkillType = {
		[1] = [[招式<font color="#0dab01">（主动使用）</font>]];
		[2] = [[内功<font color="#0dab01">（开启生效）</font>]];
		[3] = [[心法<font color="#0dab01">（被动生效）</font>]];
	};
	CoolDown = {
		Hour = [[%s小时%s分%s秒]];
		Min = [[%s分%s秒]];
		Sec = [[%s秒]];
	};
	Cost = {
		[1] = [[<p align='left'><font color="#dcb857">%s消耗：</font><font color="#D2D1CD">%s</font></p>]];
		[2] = [[生命]];
		[3] = [[内力]];
		[4] = [[金]];
		[5] = [[木]];
		[6] = [[水]];
		[7] = [[火]];
		[8] = [[土]];
		[9] = [[煞元]];
		[10] = [[物品]];
	};
	Sword = {
		[0] = [[无需求]];
		[1] = [[镰]];
		[2] = [[刀]];
		[3] = [[剑]];
		[4] = [[枪]];
	};
	Range = {
		[0] = [[无需目标]];
		[1] = [[近程]];
		[2] = [[远程]];
	};
	RangeType = {
		[1] = [[单体]];
		[2] = [[群体性]];
		[5] = [[单体]];
	};
	Color = {
		[1] = [[#d9ccbd]];--满足
		[2] = [[#cd0000]];--不满足
	};
	TitleIcon = {
		[1] = "skill_ui_loli.png";
		[2] = "skill_ui_Dao.png";
		[3] = "skill_ui_Jian.png";
		[4] = "skill_ui_Qiang.png";
	};
	Cengshu = {
		[0] = "【一重】";
		[1] = "【二重】";
		[2] = "【三重】";
		[3] = "【四重】";
		[4] = "【五重】";
		[5] = "【六重】";
		[6] = "【七重】";
		[7] = "【八重】";
		[8] = "【九重】";
		[9] = "【十重】";
		[10] = "【十一重】";
		[11] = "【十二重】";
		[12] = "【十三重】";
		[13] = "【十四重】";
		[14] = "【十五重】";
	};
}

--所有结婚技能
_G.SkillByMarry = 
{
	60000,
	60001,
	60002,
	60003,
	60004,
	60005,
	61003,
	
}

--内功按钮的弹出
_G.ShortcutSkillList = 
{
	[enProfType.eProfType_Sword] ={12016,12006,12008,12009,12017,12011};
	[enProfType.eProfType_Knife] ={12016,12006,12008,12009,12017,12011};
	[enProfType.eProfType_Sickle] ={12016,12006,12008,12009,12017,12011};
	[enProfType.eProfType_Spear] ={12016,12006,12008,12009,12017,12011};
}


--职业专属技能
_G.SkillOwnerProf = 
{
	[21001] = enProfType.eProfType_Sword;
	[21002] = enProfType.eProfType_Sword;
	[21003] = enProfType.eProfType_Sword;
	[21004] = enProfType.eProfType_Sword;
	[21005] = enProfType.eProfType_Sword;
	[21006] = enProfType.eProfType_Sword;
	
	[31001] = enProfType.eProfType_Knife;
	[31002] = enProfType.eProfType_Knife;
	[31003] = enProfType.eProfType_Knife;
	[31004] = enProfType.eProfType_Knife;
	[31005] = enProfType.eProfType_Knife;
	[31006] = enProfType.eProfType_Knife;
	
	[41001] = enProfType.eProfType_Spear;
	[41002] = enProfType.eProfType_Spear;
	[41003] = enProfType.eProfType_Spear;
	[41004] = enProfType.eProfType_Spear;
	[41005] = enProfType.eProfType_Spear;
	[41006] = enProfType.eProfType_Spear;
	
	[51001] = enProfType.eProfType_Sickle;
	[51002] = enProfType.eProfType_Sickle;
	[51003] = enProfType.eProfType_Sickle;
	[51004] = enProfType.eProfType_Sickle;
	[51005] = enProfType.eProfType_Sickle;
	[51006] = enProfType.eProfType_Sickle;
	
}
