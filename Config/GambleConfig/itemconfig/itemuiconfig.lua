--注意事项：在处理按钮的回调函数时，赋值给按钮的回调函数是不会调用self参数的，
--也就是说，在处理函数里面只能使用全局的名称，不能用self

--配置需要打开窗口的界面
_G.ItemToOpenWnd = {
};

--特殊物品使用时弹出界面的功能配置，如果返回true，则继续物品的使用流程，否则就打断
--物品enum的索引
_G.ItemUIByEnum = 
{
	[2500030] = function(objItem) CMuseSystem:DoRetreatOper() end;
	[2500180] = function(objItem) CUIFiveElem:OnBalanceClick() end;
	[2300160] = function(objItem) CUIFiveElem:UseStoreItem(objItem:GetInstID()) end;
	[5500010] = function(objItem) CChatSystem:StartTrumpetChat() end;
	[4100080] = function(objItem) CUIEquipIntensify:Open(6) end;  						 ---打开装备洗炼
	[4100110] = function(objItem) CSwordSystem:RequestOpenSword() end;					 ---打开名剑
	[4100120] = function(objItem) CUIEquipIntensify:Open(4) end;						 ---打开装备升阶
	[4100130] = function(objItem) CAmuletSystem:Show() end;						 		 ---打开宝甲升阶 升级玄晶
	--[4902012] = function(objItem) CAmuletSystem:Show() end;						 		 ---打开宝甲升阶 精炼锤
	[4100140] = function(objItem) CUIEquipIntensify:Open(1) end;						 ---打开装备强化
	[4100150] = function(objItem) CUIEquipIntensify:Open(6) end;						 ---打开洗练数值
	[9405010] = function(objItem) CMountSystem:OpenMainUI() end;						 ---打开坐骑界面
	[2500100] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500101] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500102] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500103] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500104] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500105] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500106] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500107] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[2500108] = function(objItem) CUIRole:OpenPanel(2) return true end;					 ---打开实战界面
	[4100290] = function(objItem) CSwordSystem:RequestOpenSword() return true end;		 ---打开名剑界面
	[4100300] = function(objItem) CSwordSystem:RequestOpenSword() return true end;		 ---打开名剑界面
	[4100310] = function(objItem) CSwordSystem:RequestOpenSword() return true end;		 ---打开名剑界面
	[4100320] = function(objItem) CSwordSystem:RequestOpenSword() return true end;		 ---打开名剑界面
	[5500040] = function(objItem) CUIVip:Open() return true end;		 						     ---打开VIP界面
	[5500041] = function(objItem) CUIVip:Open() return true end;		   	                         ---打开VIP界面
	[5500050] = function(objItem) CUIVip:Open() return true end;		                             ---打开VIP界面
	[5500060] = function(objItem) CUIVip:Open() return true end;	                             	 ---打开VIP界面
	[2500050] = function(objItem) CUIRole:OpenPanel(2)  end;		 					 ---打开实战界面
	[2500090] = function(objItem) CUIRole:OpenPanel(1)  end;		 			         ---打开人物界面
	[3900010] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900020] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900030] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900040] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900050] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900060] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900070] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900080] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
    [3900090] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3900100] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910010] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910020] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910030] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910040] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910050] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910060] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910070] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910080] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910090] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[3910100] = function(objItem) CUIRole:OpenPanel(4) end;		  						 ---打开宝石界面
	[2500040] = function(objItem) CUIRole:OpenPanel(3) end;		  						 ---打开经脉界面
	[5500020] = function(objItem) CUIPacket:Show(); CPacket:DoExtend() end;		  		 ---打开背包扩展
	[4100210] = function(objItem) CAmuletSystem:Show() end;		  						 ---打开背包扩展
	[5809274] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809275] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809276] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809277] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809278] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809279] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809280] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809281] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809282] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809283] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809284] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809285] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809286] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809287] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809288] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809289] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809292] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809316] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809317] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809318] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809319] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809320] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	[5809321] = function(objItem) CChestSystem:ShowChestWnd(objItem:GetInstID()) end;	 ---打开宝箱界面
	
	[2500061] = function(objItem) CPulseSystem:RequestOpenDragon(1) end;
	[2500062] = function(objItem) CPulseSystem:RequestOpenDragon(2) end;
	[2500063] = function(objItem) CPulseSystem:RequestOpenDragon(3) end;
	[5501180] = function(objItem) CGuildCallMemberSystem:CheckUseItem(5501180) end;
}
--物品大类+子类的索引
_G.ItemUIByPCType = 
{
	[50001] = function(objItem) 
		local tbCfg = SkillBookToSkill[objItem:GetEnumID()];
		if tbCfg then
			if not CAuthoritySystem:CheckAuthority("Skill") then
				CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice, SysStringConfigInfo[5000240029]);
			else
				CUISkill:SetSelecte(tbCfg.skill_type,tbCfg.skill_id);
			end
		end
	end;
	[50010] = function(objItem)
		local tbCfg = MaterialIndex[objItem:GetEnumID()];
		if tbCfg then
			CProduceSystem:TryOpenUI(tbCfg);
		end
	end;
	[20031] = function(objItem)
		CUIFiveElem:UsePopItem(objItem:GetInstID());
	end;
	[50070] = function(objItem)
		CUIPot:OnVisiable(objItem:GetEnumID());
	end;
	--强化卷轴
	[50095] = function(objItem)
		CUIIntensifyScroll:Open(objItem:GetInstID());
	end;	
	--附加属性翻番卷轴
	[50096] = function(objItem)
		UIPropertyScrollSystem:Open(objItem);
	end;
	--收集
	[80010] = function(objItem)
		CCollectSystem:OnCareItemClick(objItem)
	end;
	--群侠卡片
	[80070] = function(objItem)
		if not CUIQunXiaLuSystem:IsShowFuse() then
			CQunXiaLuSystem:CheckIsCanInsert(objItem);
		end
	end;
}
--物品大类的索引
_G.ItemUIByPType = 
{
	[6] = function(objItem) CUIGift:PackGiftClick(objItem:GetInstID()) end;
	[7] = function(objItem) CItemSystem:CheckItemUseTimer(objItem:GetEnumID(), enItemPosition.eTaskRoom) end;
}

--处理技能书弹出技能学习窗口的配置文件；
_G.SkillBookToSkill = {
---------------------------------类型一-------------------------
	--剑影凝光
	[5121001] = {	---key是技能书的配置ID
		skill_type = 1;		--技能的类型
		skill_id = 21001;	--技能的ID
	};
	--剑羽惊寰
	[5121004] = {	
		skill_type = 1;		
		skill_id = 21004;	
	};
	--寒锋刺骨
	[5121002] = {	
		skill_type = 1;		
		skill_id = 21002;	
	};	
	--寒霜剑气
	[5121003] = {	
		skill_type = 1;		
		skill_id = 21003;	
	};	
	--人剑合一
	[5121005] = {	
		skill_type = 1;		
		skill_id = 21005;	
	};	
	--力劈重山
	[5131001] = {	
		skill_type = 1;		
		skill_id = 31001;	
	};	
	--快刀乱麻
	[5131004] = {	
		skill_type = 1;		
		skill_id = 31004;	
	};	
	--一刀两断
	[5131002] = {	
		skill_type = 1;		
		skill_id = 31002;	
	};	
	--天雷坠地
	[5131003] = {	
		skill_type = 1;		
		skill_id = 31003;	
	};	
	--烈火腾云	
	[5131005] = {	
		skill_type = 1;		
		skill_id = 31005;	
	};		
	--流星追月
	[5141001] = {	
		skill_type = 1;		
		skill_id = 41001;	
	};		
	--赤霞旋影
	[5141004] = {	
		skill_type = 1;		
		skill_id = 41004;	
	};	
	--	白虹贯日
	[5141002] = {	
		skill_type = 1;	
		skill_id = 41002;	
	};	
	--回光幻电
	[5141003] = {	
		skill_type = 1;		
		skill_id = 41003;	
	};	
	--骤雨青荷
	[5141005] = {	
		skill_type = 1;		
		skill_id = 41005;	
	};	
	--雀舌蚀体
	[5151001] = {	
		skill_type = 1;		
		skill_id = 51001;	
	};	
	--浮香魅影
	[5151004] = {	
		skill_type = 1;		
		skill_id = 51004;	
	};	
	--刃野荆生
	[5151002] = {	
		skill_type = 1;		
		skill_id = 51002;
	};		
	--修罗刺魂
	[5151003] = {	
		skill_type = 1;		
		skill_id = 51003;
	};
	--幽冥鬼爪
	[5151005] = {	
		skill_type = 1;		
		skill_id = 51005;
	};
	--无双
	[5161001] = {	
		skill_type = 1;		
		skill_id = 61001;
	};
	--滑步
	[5111013] = {	
		skill_type = 1;		
		skill_id = 11013;	
	};
	--冷锋荡玄
	[5121006] = {	
		skill_type = 1;		
		skill_id = 21006;	
	};
	--斩天震地
	[5131006] = {	
		skill_type = 1;		
		skill_id = 31006;	
	};
	--飞瀑千波
	[5141006] = {	
		skill_type = 1;		
		skill_id = 41006;	
	};
	--天香煞光
	[5151006] = {	
		skill_type = 1;		
		skill_id = 51006;	
	};
------------------------类型2-------------------------		
	--狮子吼
	[5111003] = {	
		skill_type = 2;		
		skill_id = 11003;
	};
	--蛤蟆功
	[5111004] = {	
		skill_type = 2;		
		skill_id = 11004;
	};
	--六脉神剑
	[5111007] = {	
		skill_type = 2;		
		skill_id = 11007;
	};
	--吸星大法
	[5111008] = {	
		skill_type = 2;		
		skill_id = 11008;
	};
	--降龙十八掌
	[5111009] = {	
		skill_type = 2;		
		skill_id = 11009;
	};
	--化骨绵掌
	[5111011] = {	
		skill_type = 2;		
		skill_id = 11011;
	};
	--一阳指
	[5111012] = {	
		skill_type = 2;		
		skill_id = 11012;
	};
	--弹指神通
	[5111017] = {	
		skill_type = 2;		
		skill_id = 11017;
	};
	--金钟罩（绝招）
	[5111016] = {	
		skill_type = 2;	
		skill_id = 11016;	
	};

	--固若金汤
	[5113021] = {	
		skill_type = 2;		
		skill_id = 13021;	
	};
	--醍醐灌顶
	[5113023] = {	
		skill_type = 2;		
		skill_id = 13023;	
	};
	--静影沉璧
	[5113025] = {	
		skill_type = 2;		
		skill_id = 13025;	
	};
	--青莲秘箓
	[5113027] = {	
		skill_type = 2;		
		skill_id = 13027;	
	};
	--菩提心经
	[5113028] = {	
		skill_type = 2;		
		skill_id = 13028;	
	};
------------------------类型3-------------------------	
	--苍寒诀
	[5112006] = {	
		skill_type = 3;		
		skill_id = 12006;	
	--狂澜势
	};
	[5112007] = {	
		skill_type = 3;
		skill_id = 12007;
	};
	--朝天阙
	[5112008] = {	
		skill_type = 3;		
		skill_id = 12008;	
	};
	--蛊刃
	[5112009] = {	
		skill_type = 3;		
		skill_id = 12009;	
	};
	--五毒奇经
	[5112010] = {	
		skill_type = 3;		
		skill_id = 12010;	
	};
	--七杀心经
	[5112011] = {	
		skill_type = 3;		
		skill_id = 12011;	
	};
	--画地为牢废弃
	[5112012] = {	
		skill_type = 3;		
		skill_id = 12012;	
	};
	--紫霞神功
	[5112013] = {	
		skill_type = 3;		
		skill_id = 12013;	
	};
	--玄冥神掌
	[5112014] = {	
		skill_type = 3;		
		skill_id = 12014;	
	};
	--无相神功
	[5112015] = {	
		skill_type = 3;		
		skill_id = 12015;	
	};
	--吸血
	[5112016] = {	
		skill_type = 3;		
		skill_id = 12016;	
	};
	--太极神功
	[5112002] = {	
		skill_type = 3;		
		skill_id = 12002;
	};
	--凌波微步
	[5112003] = {	
		skill_type = 3;		
		skill_id = 12003;	
	};
	--九阴真经
	[5112004] = {	
		skill_type = 3;		
		skill_id = 12004;	
	};

	--画地为牢
	[5112017] = {	
		skill_type = 3;		
		skill_id = 12017;
	};
	
	--青莲秘箓
	[5113001] = {	
		skill_type = 3;		
		skill_id = 13001;	
	};
	--天元心法
	[5113002] = {	
		skill_type = 3;		
		skill_id = 13002;	
	};
	--龙象般若功
	[5113003] = {	
		skill_type = 3;		
		skill_id = 13003;	
	};
	--玄功要诀
	[5113004] = {	
		skill_type = 3;		
		skill_id = 13004;	
	};
	--云龙三折
	[5113005] = {	
		skill_type = 3;		
		skill_id = 13005;	
	};
	--天魔解体
	[5113006] = {	
		skill_type = 3;		
		skill_id = 13006;	
	};
	--降龙伏象功
	[5113008] = {	
		skill_type = 3;		
		skill_id = 13008;	
	};
	--菩提心经
	[5113009] = {	
		skill_type = 3;		
		skill_id = 13009;	
	};
	--天山童姥功
	[5113010] = {	
		skill_type = 3;		
		skill_id = 13010;	
	};
	--金刚不坏体
	[5113011] = {	
		skill_type = 3;		
		skill_id = 13011;	
	};
	--洗髓经
	[5113012] = {	
		skill_type = 3;		
		skill_id = 13012;	
	};
	--易筋经
	[5113013] = {	
		skill_type = 3;		
		skill_id = 13013;	
	};
	--少阳神功
	[5113014] = {	
		skill_type = 3;		
		skill_id = 13014;	
	};
	--阿罗汉神功
	[5113015] = {	
		skill_type = 3;		
		skill_id = 13015;	
	};
	--金钟罩
	[5113016] = {	
		skill_type = 3;		
		skill_id = 13016;	
	};
	--苦行禅功
	[5113017] = {	
		skill_type = 3;		
		skill_id = 13017;	
	};
	--铁布衫
	[5113007] = {	
		skill_type = 3;		
		skill_id = 13007;	
	};
	--万象昏阴
	[5113018] = {	
		skill_type = 3;		
		skill_id = 13018;	
	};
	
	--持续消耗
	[5113019] = {	
		skill_type = 3;		
		skill_id = 13019;	
	};
	
	--怒震威神
	[5113020] = {	
		skill_type = 3;		
		skill_id = 13020;	
	};

	--不动明王体
	[5113022] = {	
		skill_type = 3;		
		skill_id = 13022;	
	};
	--浮云无定
	[5113024] = {	
		skill_type = 3;		
		skill_id = 13024;	
	};
	--蹑云步
	[5113026] = {	
		skill_type = 3;		
		skill_id = 13026;	
	};
---------------------------类型1--------------------

	
	
};

_G.ItemIconFlyTime = {
	dwFlyDisXGap = 30;	--连续飞行图标时图标的像素间隔
	dwFlyDisYGap = 0;	--
	dwTime = 1.2;--单位是秒
	dwFlyGap = 0.5;	--飞出的图标的时间间隔
};

--保存可以存放所有物品的Slot标记，背包仓库，计算方法：大类ID*1000 + 子类ID
_G.setItemFlags = {
	1010,1020,1021,1022,1023,1024,1025,1040,1041,1042,1043,1044,1045,1050,1060,1070,1071,1072,1073,
	2010,2020,2030,2031,2040,2050,
	3010,3011,3020,3021,3030,3031,3040,3041,3050,3051,3090,3091,
	4010,4020,4050,4090,
	5001,5010,5020,5050,5051,5060,5070,5080,5091,5092,5093,5094,5095,5096,
	6010,6020,6030,6050,
	7010,7020,7030,7040,
	8010,8020,8070,
	9010,9020,9030,9040,9050,9060,9070,
};
--保存可以存放装备的Slot标记，装备面板，计算方法：大类ID*1000 + 子类ID
_G.setEquipFlags = {
	1010,1020,
	1021,1022,1023,1024,1025,
	1040,1041,1042,1043,1044,1045,
	1050,
	1060,
	1070,1071,1072,1073,
};
--按照结婚信物或者物品的配置ID来屏蔽玩家的穿装和脱装功能
_G.setForbidEquipsWear = {
	1600010,1600020,1600030,1600040,1600050,
	1600060,1600070,1600080,1600090,1600100,
	1600110,1600120,1600130,1600140,1600150,
	1600160,1600170,1600180,1600190,1600200,
	1600210,1600220,1600230,1600240,1600250,
	1600260,1600270,
};
--保存可以存放宝石的Slot标记，计算方法：大类ID*1000 + 子类ID
_G.setAllStones = {
	3010,3011,3020,3021,3030,3031,3040,3041,3050,3051,3090,3091,
};
--保存可以存放所有物品的Slot标记；背包和仓库，计算方法：大类ID*1000 + 子类ID
_G.setAllFlags = {
	1010,1020,1021,1022,1023,1024,1025,1040,1041,1042,1043,1044,1045,1050,1060,1070,1071,1072,1073,
	2010,2020,2030,2031,2040,2050,
	3010,3011,3020,3021,3030,3031,3040,3041,3050,3051,3090,3091,
	4010,4020,4050,4090,
	5001,5010,5020,5050,5060,5070,5080,5091,5092,5093,5094,5095,5096,
	6010,6020,6030,6050,
	7010,7020,7030,7040,
	8010,8020,
	9010,9020,9030,9040,9050,9060,9070,
	99,
};
--快捷栏可以存放的物品的标记
_G.setShrtcutFlags = {
    2010,2020,2030,2031,2040,2050,99,
};
--1, 武器可以存放的物品的标记
_G.setWeaponFlags = 
{
1010,
};
--2, 衣服可以存放的物品的标记
_G.setClothFlags = 
{
1020,
};
--3, 鞋子可以存放的物品的标记
_G.setShoesFlags = 
{
1021,
};
--4, 手套可以存放的物品的标记
_G.setGlovesFlags = 
{
1022,
};
--5, 腰带可以存放的物品的标记
_G.setBeltFlags = 
{
1023,
};
--6, 头饰可以存放的物品的标记
_G.setHeadFlags = 
{
1045,
};
--7, 护腿可以存放的物品的标记
_G.setLegFlags = 
{
1025,
};
--8, 披风可以存放的物品的标记
_G.setCloakFlags = 
{
1044,
};
--9, 项链可以存放的物品的标记
_G.setNecklaceFlags = 
{
1040,
};
--10, 戒指可以存放的物品的标记
_G.setRingFlags = 
{
1041,
};
--11, 手镯可以存放的物品的标记
_G.setBraceletFlags = 
{
1042,
};
--12, 腰坠可以存放的物品的标记
_G.setPendantFlags = 
{
1043,
};
--13, 护身宝甲可以存放的物品的标记
_G.setAmuletFlags = 
{
1050,
};
--14, 情侣信物可以存放的物品的标记
_G.setKeepsakeFlags = 
{
1060,
};
--15, 坐骑可以存放的物品的标记，----至少写一个0
_G.setHorseFlags = 
{
0,
};

--判断物品是否可以放入快捷栏的配置表
_G.ShortuctUseItemEnum = 
{
2100010,
2100020,
2100030,
2100040,
2100050,
2200010,
2200020,
2200030,
2200040,
2200050,
};

--物品的显示类型列表：大类enItemParentType
_G.AllTypes = { [1]=1,[2]=2,[3]=3,[4]=4,[5]=5,[6]=6,[7]=7,[8]=8,[9]=9, };
_G.EquipTypes = { [1]=1,};
_G.MedicineTypes = { [2]=2, };
_G.MaterialTypes = { [3]=3,[4]=4,[5]=5,[6]=6,[8]=8,[9]=9,};
_G.TaskTypes = { [7]=7,};
--Slot所属的UI面板
_G.enSlotHolder = 
{
	ePacket = 1,		--背包
	eStorage = 2,		--仓库
	eAvatar = 3,		--人物装备面板
	eShortcut = 4,		--快捷菜单
	eTrade = 5,			--交易
	ePlayerView = 6,	--查看玩家属性界面
	eStoneEnchase = 7,	--宝石镶嵌界面
	eMountEquip	= 8,	--坐骑装备界面
};
_G.enShowMode = {
	eAll = 1,			--显示全部物品
	eEquip = 2,			--显示装备
	eDrug = 3,			--显示药品
	eTask = 4,			--显示任务
	eMaterial = 5,		--显示材料
};
--背包和仓库显示模式到显示类型的定义
_G.ModeToTypes = {
	[enShowMode.eAll] = _G.AllTypes,
	[enShowMode.eEquip] = _G.EquipTypes,
	[enShowMode.eDrug] = _G.MedicineTypes,
	[enShowMode.eMaterial] = _G.MaterialTypes,
	[enShowMode.eTask] = _G.TaskTypes,
};
--右键抢占背包中使用物品的优先级；数字越大，优先级越高
_G.enRClickPriority =
{
	eAvatar = 2,		--人物的装备面板
	
	eMountEquip = 4,	--坐骑装备面板
	eEquipDecompose = 5,		--装备分解面板
	eStorage = 10,		--仓库的面板
	
	eTrade = 20,
	ePlayerShop = 21,	--自己的摊位界面
	eNpcShop  = 22,		--Npc商店	
	eStoneCompose = 30, --宝石合成
	eStoneEnchase = 31, --宝石镶嵌
	eAmuletIntensify = 45,--宝甲熔炼界面
	eEquipIntensify = 50, --装备强化界面
	ePropertyScrollSystem = 51, --附加属性翻番
	eAutoUseSystem = 52, --自动使用
	eProposeTo = 99, --求婚界面，生命诚可贵，爱情价更高，优先级第一。
};

--自动挂机可以存放的物品的标记
_G.setAutoBattleFlags = {
    99,
};

--背包和仓库扩展所需的扩展符定义
_G.ExtendConfig = 
{
	--PacketEnum = 5500020;
	--PacketNumber = { [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 5 };
	[enItemPosition.ePacket] = {
		--背包扩展所需的扩展符配置ID
		Enum = 5500020;
		--扩展背包所需扩展符数量
		Number = { [1] = 1, [2] = 2, [3] = 5, [4] = 15, [5] = 60 };
	},
	[enItemPosition.eStorage] = {
		--仓库扩展所需的扩展符配置ID
		Enum = 5500084;
		--扩展仓库所需扩展符数量
		Number = { [1] = 1, [2] = 2, [3] = 5, [4] = 15, [5] = 60 };
	},
};
	local consume = {
			[1]=1,
			[2]=1,
			[3]=2,
			[4]=2,
			[5]=4,
			[6]=4,
			[7]=6,
			[8]=6,
			[9]=8,
			[10]=8,
			[11]=10,
			[12]=10,
			[13]=15,
			[14]=15,
			[15]=20,
			[16]=20,
			[17]=25,
			[18]=25,
			[19]=30,
			[20]=40,
			[21]=50,
			[22]=60,
			[23]=70,
			[24]=80,
			[25]=90,
			---背包6到8页
			[26]=100,
			[27]=120,
			[28]=140,
			[29]=160,
			[30]=180,
			[31]=200,
			[32]=220,
			[33]=240,
			[34]=260,
			[35]=290,
			[36]=320,
			[37]=350,
			[38]=380,
			[39]=410,
			[40]=440,
			[41]=470,
			[42]=500,
			[43]=530,
		};
local storage_consume = {
	[1]= {
		[1] = {[1] = 5500020, [2] = 1},
		[2] = {[1] = 5500020, [2] = 1},
		[3] = {[1] = 5500020, [2] = 1},
		[4] = {[1] = 5500020, [2] = 1},
		[5] = {[1] = 5500020, [2] = 1},
		[6] = {[1] = 5500020, [2] = 1},
		[7] = {[1] = 5500020, [2] = 2},
		[8] = {[1] = 5500020, [2] = 2},
		[9] = {[1] = 5500020, [2] = 4},
		[10] = {[1] = 5500020, [2] = 4},
		[11] = {[1] = 5500020, [2] = 6},
		[12] = {[1] = 5500020, [2] = 6},
		[13] = {[1] = 5500020, [2] = 8},
		[14] = {[1] = 5500020, [2] = 8},
		[15] = {[1] = 5500020, [2] = 10},
		[16] = {[1] = 5500020, [2] = 10},
		[17] = {[1] = 5500020, [2] = 15},
		[18] = {[1] = 5500020, [2] = 15},
		[19] = {[1] = 5500020, [2] = 20},
		[20] = {[1] = 5500020, [2] = 20},
		[21] = {[1] = 5500020, [2] = 25},
		[22] = {[1] = 5500020, [2] = 25},
		[23] = {[1] = 5500020, [2] = 30},
		[24] = {[1] = 5500020, [2] = 40},
		[25] = {[1] = 5500020, [2] = 50},
		[26] = {[1] = 5500020, [2] = 60},
		[27] = {[1] = 5500020, [2] = 70},
		[28] = {[1] = 5500020, [2] = 80},
		[29] = {[1] = 5500020, [2] = 90},
		[30] = {[1] = 5500020, [2] = 100},
		[31] = {[1] = 5500020, [2] = 120},
		[32] = {[1] = 5500020, [2] = 140},
		[33] = {[1] = 5500020, [2] = 160},
		[34] = {[1] = 5500020, [2] = 180},
		[35] = {[1] = 5500020, [2] = 200},
		[36] = {[1] = 5500020, [2] = 220},
		[37] = {[1] = 5500020, [2] = 240},
		[38] = {[1] = 5500020, [2] = 260},
		[39] = {[1] = 5500020, [2] = 290},
		[40] = {[1] = 5500020, [2] = 320},
		[41] = {[1] = 5500020, [2] = 350},
		[42] = {[1] = 5500020, [2] = 380},
		[43] = {[1] = 5500020, [2] = 410},
		[44] = {[1] = 5500020, [2] = 440},
		[45] = {[1] = 5500020, [2] = 470},
		[46] = {[1] = 5500020, [2] = 500},
		[47] = {[1] = 5500020, [2] = 530},

		[48] = {[1] = 5500084, [2] = 1},   --仓储空间2的第一个扩展道具
	},
	[2]= {
		[1] = {[1] = 5500084, [2] = 2},
		[2] = {[1] = 5500084, [2] = 3},
		[3] = {[1] = 5500084, [2] = 4},
		[4] = {[1] = 5500084, [2] = 5},
		[5] = {[1] = 5500084, [2] = 7},
		[6] = {[1] = 5500084, [2] = 9},
		[7] = {[1] = 5500084, [2] = 11},
		[8] = {[1] = 5500084, [2] = 13},
		[9] = {[1] = 5500084, [2] = 15},
		[10] = {[1] = 5500084, [2] = 18},
		[11] = {[1] = 5500084, [2] = 21},
		[12] = {[1] = 5500084, [2] = 24},
		[13] = {[1] = 5500084, [2] = 27},
		[14] = {[1] = 5500084, [2] = 30},
		[15] = {[1] = 5500084, [2] = 34},
		[16] = {[1] = 5500084, [2] = 38},
		[17] = {[1] = 5500084, [2] = 42},
		[18] = {[1] = 5500084, [2] = 46},
		[19] = {[1] = 5500084, [2] = 50},
		[20] = {[1] = 5500084, [2] = 55},
		[21] = {[1] = 5500084, [2] = 60},
		[22] = {[1] = 5500084, [2] = 65},
		[23] = {[1] = 5500084, [2] = 70},
		[24] = {[1] = 5500084, [2] = 75},
		[25] = {[1] = 5500084, [2] = 81},
		[26] = {[1] = 5500084, [2] = 87},
		[27] = {[1] = 5500084, [2] = 93},
		[28] = {[1] = 5500084, [2] = 99},
		[29] = {[1] = 5500084, [2] = 105},
		[30] = {[1] = 5500084, [2] = 113},
		[31] = {[1] = 5500084, [2] = 121},
		[32] = {[1] = 5500084, [2] = 129},
		[33] = {[1] = 5500084, [2] = 137},
		[34] = {[1] = 5500084, [2] = 145},
		[35] = {[1] = 5500084, [2] = 155},
		[36] = {[1] = 5500084, [2] = 165},
		[37] = {[1] = 5500084, [2] = 175},
		[38] = {[1] = 5500084, [2] = 185},
		[39] = {[1] = 5500084, [2] = 195},
		[40] = {[1] = 5500084, [2] = 207},
		[41] = {[1] = 5500084, [2] = 219},
		[42] = {[1] = 5500084, [2] = 231},
		[43] = {[1] = 5500084, [2] = 243},
		[44] = {[1] = 5500084, [2] = 255},
		[45] = {[1] = 5500084, [2] = 267},
		[46] = {[1] = 5500084, [2] = 279},
		[47] = {[1] = 5500084, [2] = 291},
		[48] = {[1] = 5500084, [2] = 1},  --仓储空间3的第一个仓储格消耗道具
	},
	[3]= {
		[1] = {[1] = 5500084, [2] = 2},
		[2] = {[1] = 5500084, [2] = 3},
		[3] = {[1] = 5500084, [2] = 4},
		[4] = {[1] = 5500084, [2] = 5},
		[5] = {[1] = 5500084, [2] = 7},
		[6] = {[1] = 5500084, [2] = 9},
		[7] = {[1] = 5500084, [2] = 11},
		[8] = {[1] = 5500084, [2] = 13},
		[9] = {[1] = 5500084, [2] = 15},
		[10] = {[1] = 5500084, [2] = 18},
		[11] = {[1] = 5500084, [2] = 21},
		[12] = {[1] = 5500084, [2] = 24},
		[13] = {[1] = 5500084, [2] = 27},
		[14] = {[1] = 5500084, [2] = 30},
		[15] = {[1] = 5500084, [2] = 34},
		[16] = {[1] = 5500084, [2] = 38},
		[17] = {[1] = 5500084, [2] = 42},
		[18] = {[1] = 5500084, [2] = 46},
		[19] = {[1] = 5500084, [2] = 50},
		[20] = {[1] = 5500084, [2] = 55},
		[21] = {[1] = 5500084, [2] = 60},
		[22] = {[1] = 5500084, [2] = 65},
		[23] = {[1] = 5500084, [2] = 70},
		[24] = {[1] = 5500084, [2] = 75},
		[25] = {[1] = 5500084, [2] = 81},
		[26] = {[1] = 5500084, [2] = 87},
		[27] = {[1] = 5500084, [2] = 93},
		[28] = {[1] = 5500084, [2] = 99},
		[29] = {[1] = 5500084, [2] = 105},
		[30] = {[1] = 5500084, [2] = 113},
		[31] = {[1] = 5500084, [2] = 121},
		[32] = {[1] = 5500084, [2] = 129},
		[33] = {[1] = 5500084, [2] = 137},
		[34] = {[1] = 5500084, [2] = 145},
		[35] = {[1] = 5500084, [2] = 155},
		[36] = {[1] = 5500084, [2] = 165},
		[37] = {[1] = 5500084, [2] = 175},
		[38] = {[1] = 5500084, [2] = 185},
		[39] = {[1] = 5500084, [2] = 195},
		[40] = {[1] = 5500084, [2] = 207},
		[41] = {[1] = 5500084, [2] = 219},
		[42] = {[1] = 5500084, [2] = 231},
		[43] = {[1] = 5500084, [2] = 243},
		[44] = {[1] = 5500084, [2] = 255},
		[45] = {[1] = 5500084, [2] = 267},
		[46] = {[1] = 5500084, [2] = 279},
		[47] = {[1] = 5500084, [2] = 291},
		[48] = {[1] = 5500084, [2] = 1},    --仓储空间4的第一个格
	},
	[4]= {
		[1] = {[1] = 5500084, [2] = 2},
		[2] = {[1] = 5500084, [2] = 3},
		[3] = {[1] = 5500084, [2] = 4},
		[4] = {[1] = 5500084, [2] = 5},
		[5] = {[1] = 5500084, [2] = 7},
		[6] = {[1] = 5500084, [2] = 9},
		[7] = {[1] = 5500084, [2] = 11},
		[8] = {[1] = 5500084, [2] = 13},
		[9] = {[1] = 5500084, [2] = 15},
		[10] = {[1] = 5500084, [2] = 18},
		[11] = {[1] = 5500084, [2] = 21},
		[12] = {[1] = 5500084, [2] = 24},
		[13] = {[1] = 5500084, [2] = 27},
		[14] = {[1] = 5500084, [2] = 30},
		[15] = {[1] = 5500084, [2] = 34},
		[16] = {[1] = 5500084, [2] = 38},
		[17] = {[1] = 5500084, [2] = 42},
		[18] = {[1] = 5500084, [2] = 46},
		[19] = {[1] = 5500084, [2] = 50},
		[20] = {[1] = 5500084, [2] = 55},
		[21] = {[1] = 5500084, [2] = 60},
		[22] = {[1] = 5500084, [2] = 65},
		[23] = {[1] = 5500084, [2] = 70},
		[24] = {[1] = 5500084, [2] = 75},
		[25] = {[1] = 5500084, [2] = 81},
		[26] = {[1] = 5500084, [2] = 87},
		[27] = {[1] = 5500084, [2] = 93},
		[28] = {[1] = 5500084, [2] = 99},
		[29] = {[1] = 5500084, [2] = 105},
		[30] = {[1] = 5500084, [2] = 113},
		[31] = {[1] = 5500084, [2] = 121},
		[32] = {[1] = 5500084, [2] = 129},
		[33] = {[1] = 5500084, [2] = 137},
		[34] = {[1] = 5500084, [2] = 145},
		[35] = {[1] = 5500084, [2] = 155},
		[36] = {[1] = 5500084, [2] = 165},
		[37] = {[1] = 5500084, [2] = 175},
		[38] = {[1] = 5500084, [2] = 185},
		[39] = {[1] = 5500084, [2] = 195},
		[40] = {[1] = 5500084, [2] = 207},
		[41] = {[1] = 5500084, [2] = 219},
		[42] = {[1] = 5500084, [2] = 231},
		[43] = {[1] = 5500084, [2] = 243},
		[44] = {[1] = 5500084, [2] = 255},
		[45] = {[1] = 5500084, [2] = 267},
		[46] = {[1] = 5500084, [2] = 279},
		[47] = {[1] = 5500084, [2] = 291},
		[48] = {[1] = 5500084, [2] = 1},
	},
};
--_G.enItemPosition.ePacket	--背包
--_G.enItemPosition.eStorage--仓库
function _G.G_CountExtendUsed(dwNowMax,dwType)	
	if dwType == _G.enItemPosition.ePacket then--背包
		--当前第几行
		local dwLine = dwNowMax / InitConfig.dwPacketExtendOnceNum;
		local dwExLine = dwLine - 4;
		if dwExLine >43 then
			dwExLine = 43
		end
		return 5500020, consume[dwExLine];
	else--_G.enItemPosition.eStorage--仓库
		local dwNumber = dwNowMax / InitConfig.dwMaxStorageSlotNum;
		--当前是第几个仓库
		local dwWhich = math.ceil(dwNumber);
		--当前是第几行
		local dwLine = 1;
		if (math.floor(dwNumber) == dwNumber) then--整除,当前仓库满行
			dwLine = InitConfig.dwMaxStorageSlotNum / InitConfig.dwStorageExtendOnceNum;
		else
			dwLine = (dwNowMax % InitConfig.dwMaxStorageSlotNum) / InitConfig.dwStorageExtendOnceNum;
		end;
		local con = storage_consume[dwWhich][dwLine];
		return con[1], con[2];
	end;
end;

	
_G.HolderExtendConfig = 
{
	strRed = "<font color='#FF0000'>";
	strGreen = "<font color='#00FF00'>";
	
	[enItemPosition.ePacket] = 
	{
		strFirst = T"%s激活背包需要在背包中有%d个%s</font>";
		strSecond = T"1.击杀野外BOSS获得<br/>2.参与线上活动获得<br/>3.商城购买获得";
		strThird = T"请问您是要激活背包吗？";
		
	};
	[enItemPosition.eStorage] = 
	{
		strFirst = T"%s激活需要背包中有%d个%s</font>";
		strSecond = T"1.击杀野外BOSS获得<br/>2.参与线上活动获得<br/>3.商城购买获得";
		strThird = T"请问您是要激活仓库吗？";
		
	};
	[enItemPosition.eStorage+999] = 
	{
		strFirst = T"%s激活需要背包中有%d个%s</font>";
		strSecond = T"1.官方活动";
		strThird = T"请问您是要激活仓库吗？";
		
		
		isHideBuyClick = true;  --隐藏按钮
	};
}














