--战斗力提升系统
_G.BattleScoreUpConfig = {
	ScoretType =
	{
		--计算装备战斗力分数,装备11件,装备强化,装备升阶,装备洗练,装备修炼,装备修炼套装效果,3个套装效果,情侣信物
		[1]  = {
			"Equip";
			"EquipBuild";
			};
		--计算角色战斗力分数,3个套装效果,人物属性点,称号,vip系统,人物升级,江湖威望,任务章节加成,侠客行,Buff状态,五行真气系统,盟主,炼丹系统,威望勋章
		--人物属性下表不要改变
		[2]  = {
			--todo shenqi 圣火令系统未完成
			"Title";
			"Vip";
			"WeiWang";
			"Task";
			"Errant";
			"ErrantHonor";
			"Buff";
			"Five";
			"Leader";
			"ExpIntegrate";
			"WuXiaLing";
			};
		--技能,世家属性加成,技能层数,技能称号,ps世家属性就是帮派,情侣技能
		[3]  = {
			"Skill";
			"SkillTitle";
			};
		--江湖战斗力分数,侠客加成
		[4]  = {
			--"PetInstruct";
			--"PetStateProperty";
			--"RenMai";	--宠物指教
			};
		--功法战斗力分数,血魔功,易筋经,北斗七星,童姥功,铁布衫
		[5]  = {
			"KungFu";
			"MegaKill";
			"MatrixMethod";
			"PractiseSkill";
			"TieBuShan";
            "DuGuJiuJian";
			};
		--坐骑战斗力分数,坐骑装备,坐骑战魂,坐骑进阶,坐骑资质,坐骑转生,坐骑装备强化,战魂套装
		[6]  = {
			"Mount";
			"Soul";
			"ZhanQiJue";
			};
		--宝甲战斗力分数,宝甲升阶,宝甲御神,宝甲精炼
		[7]  = {
			"Amulet";
			};
		--名剑战斗力分数,名剑升阶,名剑注灵
		[8]  = {
			"Sword";
			};
		--修行战斗力分数,修行
		[9]  = {
			"Practice";
			};
		--酒葫芦,酒葫芦
		[10] = {
			"Gourd";
			};
		--经脉,冲脉,经脉龙脉,4个经脉效果
		[11] = {
			"Pulse";
			};
		--实战,实战升阶,实战隐藏属性
		[12] = {
			--"Bourn";
			--"Gest";
			--"BournHideAttr";
			};
		--宝石,宝石镶嵌,宝石套装效果,宝石锻造,宝石精魄
		[13] = {
			--"Stone";
			--"StoneSuit";
			};
		--风物志,山河志,古物志,尤物志,收集功能
		[14] = {
			--todo shenqi 山河志,古物志
			"YouWuZhi";
			"Collect";
			};
		--群侠录,群侠组合,大侠录
		[15] = {
			--todo shenqi 大侠录
			"QunXiaLu";
			};
		--时装,时装
		[16] = {
			"FashionDress";
			};
		--世家,世家属性加成,世家技能,世家战神录,世家称谓
		[17] = {
			"Guild";
			};
		--成就,成就,就成徽章
		[18] = {
			"Achievement";
		};
		--暗器
		[19] = {
			"HiddenWeapon";
		};
		--法宝
		[20] = {
			"Shield";
		};
	};
	-- 文本
    Text = {
		paixuTips = T"<font color='#FFFF00'>点击可切换排序模式</font>";--界面按钮排序tips
		starTips1 =T"战斗力+ %s";--星的tips
		starTips2 =T"战斗力+ %s(江湖侠客战斗力与人物战斗力无关）";--特殊tips
		strMsg	  = T"玩家%s大侠行侠仗义，日";--错误信息
		Advance  =T"提升";--提升
		NotOpen  =T"未开启";--未开启
		Rule = T"<font color='#FFFF00'>点击可查看自身战斗力明细</font>";

	};
	---客户端  ， 图片名称 ，权限 ，OpenPanel打开权限相应的面板
	BattleScore =
	{
		-- [1]装备 [2]角色 [3]技能 [4]江湖 [5]功法 [6]坐骑 [7]宝甲 [8]名剑 [9]修行 [10]酒葫芦
		-- [11]经脉 [12]实战 [13]宝石 [14]风物志 [15]群侠录 [16]时装 [17]世家 [18]成就

		--装备
		[1]  = {
			Img  = "img://gn_kf_LianZhi.png";
			szAuthority = "EquipIntensify";
			fnPre = function() CUIEquipIntensify:Open() end ;
		};
		--角色
		[2]  = {
			Img  = "img://gn_kf_RWSX.png";
			szAuthority = "Role";
			fnPre = function() CUIRole:OpenPanel(1) end ;
		};
		--技能
		[3]  = {
			Img  = "img://gn_kf_JiNeng.png";
			szAuthority = "Skill";
			fnPre = function() CUISkill:OnOpen() end ;
		};
		--江湖
		[4]  = {
           Img  = "img://gn_kf_JiangHu.png";
			szAuthority = "NpcConnectionSystem";
			fnPre = function() CMainPageSystem:DoJiangHuOper() end ;
		};
		--功法
		[5]  = {
           Img  = "img://gn_kf_GongFa.png";
			szAuthority = "GongFa";
			fnPre = function() CMainPageSystem:DoGongFaOper() end ;
		};
		--坐骑
		[6]  = {
           Img  = "img://gn_kf_ZhuoQi.png";
			szAuthority = "Mount";
			fnPre = function() CUIMountPanel:OpenPanel() end ;
		};
		--宝甲
		[7]  = {
           Img  = "img://gn_kf_BaoJia.png";
			szAuthority = "Amulet";
			fnPre = function() CMainPageSystem:DoAmuletOper() end ;
		};
		--名剑
		[8]  = {
           Img  = "img://gn_kf_MingJian.png";
			szAuthority = "Sword";
			fnPre = function() CMainPageSystem:DoSwordOper() end ;	
		};
		--修行
		[9]  = {
           Img  = "img://gn_kf_XiuXing.png";
			szAuthority = "XiuXing";
			fnPre = function() CMainPageSystem:DoXiuXingOper() end ;	
		};
		--酒葫芦
		[10] = {
           Img  = "img://gn_mq_hulu.png";
			szAuthority = "Gourd";
			fnPre = function() UIGourd:DoBtn() end ;
		};
		--经脉
		[11] = {
           Img  = "img://gn_kf_JingMai.png";
			szAuthority = "Pulse";
			fnPre = function() CUIRole:OpenPanel(3) end ;		
		};
		--实战
		[12] = {
           Img  = "img://gn_kf_JingJie.png";
			szAuthority = "Bourn";
			fnPre = function() CUIRole:OpenPanel(2) end ;
		};
		--宝石
		[13] = {
           Img  = "img://gn_kf_BaoShi.png";
			szAuthority = "StoneCompose";
			fnPre = function() CUIRole:OpenPanel(4) end ;
		};
		--风物志
		[14] = {
           Img  = "img://gn_kf_FengWuZhi.png";
			szAuthority = "Collect";
			fnPre = function() CMainPageSystem:DoShouJiOper() end ;
		};
		--群侠录
		[15] = {
           Img  = "img://gn_kf_Qunxialu.png";
			szAuthority = "QunXiaLu";
			fnPre = function() CQunXiaLuSystem:OnClickHref_Lodge() end ;
		};
		--时装
		[16] = {
           Img  = "img://huanshen.png";
			szAuthority = "huashendan";
			fnPre = function() UIFashionBgUI:DoOpen() end ;
		};
		--世家
		[17] = {
           Img  = "img://gn_kf_ShiJia.png";
			szAuthority = "Guild";
			fnPre = function() CGuildSystem:DoGuildOper() end ;
		};
		--成就
		[18] = {
           Img  = "img://gn_kf_Chengjiu.png";
			szAuthority = "";
			fnPre = function() CUIAchievementWnd:OnOpen() end ;
		};
		--暗器
		[19] = {
           Img  = "img://gn_mq_anqi.png";
			szAuthority = "";
			fnPre = function() CHiddenWeaponUI:Open() end ;
		};
		--法宝
		[20] = {
           Img  = "img://gn_mq_FaBao.png";
			szAuthority = "";
			fnPre = function() CShieldMainUI:Open() end ;
		};
	};

	-- 战斗力评分数值
	NumForStar = 
		{
			[1] = 2000;
			[2] = 4000;
			[3] = 6000;	
			[4] = 8000;
			[5] = 10000;	
			[6] = 20000;
			[7] = 40000;
			[8] = 60000;
			[9] = 80000;	
			[10] = 100000;
			[11] = 200000;	
			[12] = 400000;
			[13] = 600000;
			[14] = 800000;
			[15] = 1000000;	
			[16] = 2000000;
			[17] = 4000000;	
			[18] = 6000000;
			[19] = 8000000;	
			[20] = 10000000;
		};
	--最大星个数
	MaxStarNum = 20;
	-- 显示星星的函数实现方法
	GetXingNum = function ( K,nBattleNum )
		--遍历NumForStar 
		if nBattleNum == 0 then 
			return 0;
		end;
		for k, v in ipairs(BattleScoreUpConfig.NumForStar) do	
		--判断传过来 nBattleNum 是否大于 V
			if nBattleNum < v then
				return k;
			end
		end;
	--返回最大星数
		return BattleScoreUpConfig.MaxStarNum;
	end;



};

_G.BattleUIConfig =
{
	[enProfType.eProfType_Sword] = "img://Icon_zhandouli_jian.png";
	[enProfType.eProfType_Knife] = "img://Icon_zhandouli_dao.png";
	[enProfType.eProfType_Spear] = "img://Icon_zhandouli_qiang.png";
	[enProfType.eProfType_Sickle] = "img://Icon_zhandouli_lian.png";
}
