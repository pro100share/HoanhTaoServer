--[[
	--群侠录——侠客组合配置信息
	--时间：2013-12-31
]]


--[[
群侠录-组合槽位配置文件
needItem  镶嵌需要的物品{{卡片,物品}，获得属性}
addAttr  镶嵌后增加的属性

--]]

_G.QunXiaZuHeSlotConfig = {
	[1] = {needItem = {card = {[8700001] = 1},item = {[4100451] = 1},}, addAttr = {dwHPMax = 1000,}},
	[2] = {needItem = {card = {[8700002] = 1},item = {[4100451] = 1},}, addAttr = {dwDefense = 100,}},
	[3] = {needItem = {card = {[8700003] = 1},item = {[4100451] = 1},}, addAttr = {dwFlee = 20,}},
	[4] = {needItem = {card = {[8700004] = 1},item = {[4100451] = 1},}, addAttr = {dwCrit = 28,}},
	[5] = {needItem = {card = {[8700005] = 1},item = {[4100451] = 3},}, addAttr = {dwCritDown = 60,}},
	[6] = {needItem = {card = {[8700006] = 1},item = {[4100451] = 3},}, addAttr = {dwPoJiaValue = 120,}},
	[7] = {needItem = {card = {[8700007] = 1},item = {[4100451] = 3},}, addAttr = {dwHPMax = 2000,}},
	[8] = {needItem = {card = {[8700008] = 1},item = {[4100451] = 3},}, addAttr = {dwPoJiaDiKang = 124,}},
	[9] = {needItem = {card = {[8700009] = 1},item = {[4100451] = 5},}, addAttr = {dwHPMax = 4000,}},
	[10] = {needItem = {card = {[8700010] = 1},item = {[4100451] = 5},}, addAttr = {dwDefense = 400,}},
	[11] = {needItem = {card = {[8700011] = 1},item = {[4100451] = 5},}, addAttr = {dwFlee = 80,}},
	[12] = {needItem = {card = {[8700012] = 1},item = {[4100451] = 5},}, addAttr = {dwCrit = 112,}},
	[13] = {needItem = {card = {[8700013] = 1},item = {[4100451] = 5},}, addAttr = {dwCritDown = 120,}},
	[14] = {needItem = {card = {[8700014] = 1},item = {[4100451] = 5},}, addAttr = {dwPoJiaValue = 240,}},
	[15] = {needItem = {card = {[8700015] = 1},item = {[4100451] = 5},}, addAttr = {dwPoJiaDiKang = 248,}},
	[16] = {needItem = {card = {[8700016] = 1},item = {[4100451] = 5},}, addAttr = {dwAttack = 800,}},
	[17] = {needItem = {card = {[8700017] = 1},item = {[4100451] = 5},}, addAttr = {dwHPMax = 4000,}},
	[18] = {needItem = {card = {[8700018] = 1},item = {[4100451] = 5},}, addAttr = {dwDefense = 400,}},
	[19] = {needItem = {card = {[8700019] = 1},item = {[4100451] = 5},}, addAttr = {dwFlee = 80,}},
	[20] = {needItem = {card = {[8700020] = 1},item = {[4100451] = 5},}, addAttr = {dwCrit = 112,}},
    [21] = {needItem = {card = {[8700021] = 1},item = {[4100451] = 5},}, addAttr = {dwCritDown = 120,}},
	[22] = {needItem = {card = {[8700022] = 1},item = {[4100451] = 5},}, addAttr = {dwPoJiaValue = 240,}},
	[23] = {needItem = {card = {[8700023] = 1},item = {[4100451] = 10},}, addAttr = {dwAttack = 1400,}},
	[24] = {needItem = {card = {[8700024] = 1},item = {[4100451] = 10},}, addAttr = {dwDefense = 700,}},
	[25] = {needItem = {card = {[8700025] = 1},item = {[4100451] = 10},}, addAttr = {dwAttack = 1400,}},
	[26] = {needItem = {card = {[8700026] = 1},item = {[4100451] = 10},}, addAttr = {dwHPMax = 7000,}},
	[27] = {needItem = {card = {[8700027] = 1},item = {[4100451] = 10},}, addAttr = {dwDefense = 700,}},
	[28] = {needItem = {card = {[8700028] = 1},item = {[4100451] = 10},}, addAttr = {dwFlee = 140,}},
	[29] = {needItem = {card = {[8700029] = 1},item = {[4100451] = 10},}, addAttr = {dwCrit = 196,}},
	[34] = {needItem = {card = {[8700034] = 1},item = {[4100451] = 10},}, addAttr = {dwCritDown = 210,}},
	[35] = {needItem = {card = {[8700035] = 1},item = {[4100451] = 10},}, addAttr = {dwPoJiaDiKang = 434,}},
	[36] = {needItem = {card = {[8700036] = 1},item = {[4100451] = 10},}, addAttr = {dwAttack = 1400,}},
	[37] = {needItem = {card = {[8700037] = 1},item = {[4100451] = 10},}, addAttr = {dwCrit = 196,}},
	[38] = {needItem = {card = {[8700038] = 1},item = {[4100451] = 10},}, addAttr = {dwDefense = 700,}},
	[39] = {needItem = {card = {[8700039] = 1},item = {[4100451] = 10},}, addAttr = {dwFlee = 140,}},
	[40] = {needItem = {card = {[8700040] = 1},item = {[4100451] = 10},}, addAttr = {dwCritDown = 210,}},
	[41] = {needItem = {card = {[8700041] = 1},item = {[4100451] = 10},}, addAttr = {dwPoJiaValue = 420,}},
	[45] = {needItem = {card = {[8700045] = 1},item = {[4100451] = 20},}, addAttr = {dwHPMax = 12000,}},
	[46] = {needItem = {card = {[8700046] = 1},item = {[4100451] = 20},}, addAttr = {dwFlee = 240,}},
	[47] = {needItem = {card = {[8700047] = 1},item = {[4100451] = 20},}, addAttr = {dwCrit = 336,}},
	[48] = {needItem = {card = {[8700048] = 1},item = {[4100451] = 20},}, addAttr = {dwCritDown = 360,}},
	[49] = {needItem = {card = {[8700049] = 1},item = {[4100451] = 20},}, addAttr = {dwPoJiaDiKang = 744,}},
	[50] = {needItem = {card = {[8700050] = 1},item = {[4100451] = 20},}, addAttr = {dwAttack = 2400,}},
	[51] = {needItem = {card = {[8700051] = 1},item = {[4100451] = 20},}, addAttr = {dwPoJiaDiKang = 744,}},
	[52] = {needItem = {card = {[8700052] = 1},item = {[4100451] = 20},}, addAttr = {dwAttack = 2400,}},
	[53] = {needItem = {card = {[8700053] = 1},item = {[4100451] = 20},}, addAttr = {dwPoJiaValue = 720,}},
	[55] = {needItem = {card = {[8700055] = 1},item = {[4100451] =1},}, addAttr = {dwDefense =100,}},
	[56] = {needItem = {card = {[8700056] = 1},item = {[4100451] =1},}, addAttr = {dwFlee = 20,}},
	[57] = {needItem = {card = {[8700057] = 1},item = {[4100451] =3},}, addAttr = {dwAttack = 400,}},
	[58] = {needItem = {card = {[8700058] = 1},item = {[4100451] =3},}, addAttr = {dwPoJiaValue = 120,}},
	[59] = {needItem = {card = {[8700059] = 1},item = {[4100451] =5},}, addAttr = {dwAttack = 800,}},
	[60] = {needItem = {card = {[8700060] = 1},item = {[4100451] =5},}, addAttr = {dwHPMax = 4000,}},
	[61] = {needItem = {card = {[8700061] = 1},item = {[4100451] =5},}, addAttr = {dwDefense =400,}},
	[62] = {needItem = {card = {[8700062] = 1},item = {[4100451] =5},}, addAttr = {dwFlee = 80,}},
	[63] = {needItem = {card = {[8700063] = 1},item = {[4100451] =5},}, addAttr = {dwCrit = 112,}},
	[64] = {needItem = {card = {[8700064] = 1},item = {[4100451] =10},}, addAttr = {dwCrit = 196,}},
	[65] = {needItem = {card = {[8700065] = 1},item = {[4100451] =10},}, addAttr = {dwCritDown =210,}},
	[66] = {needItem = {card = {[8700021] = 1},item = {[4100451] =5},}, addAttr = {dwPoJiaValue = 420,}},
	[67] = {needItem = {card = {[8700038] = 1},item = {[4100451] =10},}, addAttr = {dwPoJiaDiKang = 434,}},
	[68] = {needItem = {card = {[8700066] = 1},item = {[4100451] =10},}, addAttr = {dwFlee = 140,}},
	[69] = {needItem = {card = {[8700067] = 1},item = {[4100451] =10},}, addAttr = {dwCritDown =210,}},
	[70] = {needItem = {card = {[8700068] = 1},item = {[4100451] =20},}, addAttr = {dwPoJiaDiKang = 434,}},
	[71] = {needItem = {card = {[8700069] = 1},item = {[4100451] =20},}, addAttr = {dwAttack = 1400,}},
	[72] = {needItem = {card = {[8700070] = 1},item = {[4100451] =20},}, addAttr = {dwHPMax = 7000,}},
	[73] = {needItem = {card = {[8700071] = 1},item = {[4100451] =20},}, addAttr = {dwDefense =1200,}},
	[74] = {needItem = {card = {[8700053] = 1},item = {[4100451] =20},}, addAttr = {dwPoJiaValue = 720,}},
	[75] = {needItem = {card = {[8700072] = 1},item = {[4100451] =20},}, addAttr = {dwCritDown =360,}},
	[76] = {needItem = {card = {[8700044] = 1},item = {[4100451] =20},}, addAttr = {dwPoJiaDiKang = 744,}},
	[77] = {needItem = {card = {[8700040] = 1},item = {[4100451] =10},}, addAttr = {dwAttack = 2400,}},
	[78] = {needItem = {card = {[8700045] = 1},item = {[4100451] =20},}, addAttr = {dwHPMax = 12000,}},
	[79] = {needItem = {card = {[8700047] = 1},item = {[4100451] =20},}, addAttr = {dwDefense =1200,}},
	[80] = {needItem = {card = {[8700049] = 1},item = {[4100451] =20},}, addAttr = {dwFlee = 240,}},
	[81] = {needItem = {card = {[8700052] = 1},item = {[4100451] =20},}, addAttr = {dwCrit = 336,}},
	[82] = {needItem = {card = {[8700073] = 1},item = {[4100451] =20},}, addAttr = {dwCrit = 336,}},
	[83] = {needItem = {card = {[8700074] = 1},item = {[4100451] =20},}, addAttr = {dwHPMax = 12000,}},
	[84] = {needItem = {card = {[8700075] = 1},item = {[4100451] =20},}, addAttr = {dwFlee = 240,}},
	[85] = {needItem = {card = {[8700076] = 1},item = {[4100451] =20},}, addAttr = {dwCritDown =360,}},
	[86] = {needItem = {card = {[8700077] = 1},item = {[4100451] =20},}, addAttr = {dwPoJiaValue = 720,}},
	[87] = {needItem = {card = {[8700078] = 1},item = {[4100451] =20},}, addAttr = {dwDefense =1200,}},
	[88] = {needItem = {card = {[8700079] = 1},item = {[4100451] =30},}, addAttr = {dwAttack = 4200,}},
	[89] = {needItem = {card = {[8700080] = 1},item = {[4100451] =30},}, addAttr = {dwDefense =2100,}},
	[90] = {needItem = {card = {[8700081] = 1},item = {[4100451] =30},}, addAttr = {dwFlee = 420,}},
	[91] = {needItem = {card = {[8700082] = 1},item = {[4100451] =30},}, addAttr = {dwCrit =588,}},	
	
	};


--[[
群侠录  组合配置文件
 setSlot 槽位集合
 setCard 槽位对应的卡片集合
 name 组合名称
completeAttr  完成属性

--]]
_G.QunXiaLuCombination = {
	[1] = {setSlot = {1,2,3,4, },setCard = {8700001,8700002,8700003,8700004,}, name = "黄河四鬼", completeAttr = {dwAttack = 300,}},
	[2] = {setSlot = {5,6, },setCard = {8700005,8700006,}, name = "玄冥二老", completeAttr = {dwPoJiaValue = 180,}},
	[3] = {setSlot = {7,8,},setCard = {8700007,8700008,}, name = "黑风双煞", completeAttr = {dwDefense = 300,}},
	[4] = {setSlot = {9,10,11,12,13,14,15,},setCard = {8700009,8700010,8700011,8700012,8700013,8700014,8700015,}, name = "江南七怪", completeAttr = {dwHPMax = 6000,}},
	[5] = {setSlot = {16,17,18,19,20,21,22,},setCard = {8700016,8700017,8700018,8700019,8700020,8700021,8700022,}, name = "武当七侠", completeAttr = {dwPoJiaDiKang = 372,}},
	[6] = {setSlot = {23,24,25,26,27,28,29,},setCard = {8700023,8700024,8700025,8700026,8700027,8700028,8700029,}, name = "全真七子", completeAttr = {dwCrit = 294,}},
	[7] = {setSlot = {34,35,36,37,},setCard = {8700034,8700035,8700036,8700037,}, name = "四大法王", completeAttr = {dwPoJiaValue = 630,}},
	[8] = {setSlot = {38,39,},setCard = {8700038,8700039,}, name = "逍遥二使", completeAttr = {dwCrit = 294,}},
	[9] = {setSlot = {40,41,},setCard = {8700040,8700041,}, name = "鸳鸯双飞", completeAttr = {dwAttack = 2100,}},
	[10] = {setSlot = {45,46,},setCard = {8700045,8700046,}, name = "神雕侠侣", completeAttr = {dwDefense = 1800,}},
	[11] = {setSlot = {47,48,},setCard = {8700047,8700048,}, name = "侠之大者", completeAttr = {dwAttack = 3600,}},
	[12] = {setSlot = {49,50,51,52,53,},setCard = {8700049,8700050,8700051,8700052,8700053,}, name = "五绝", completeAttr = {dwHPMax = 18000,}},
	[13] = {setSlot = {55,56,},setCard = {8700055,8700056,}, name = "不三不四", completeAttr = {dwHPMax = 2000,}},
	[14] = {setSlot = {57,58,},setCard = {8700057,8700058,}, name = "黑白双剑", completeAttr = {dwDefense = 400,}},
	[15] = {setSlot = {59,60,61,62,63,},setCard = {8700059,8700060,8700061,8700062,8700063,}, name = "明教五散人", completeAttr = {dwCritDown = 240,}},
	[16] = {setSlot = {64,65,66,67,},setCard = {8700064,8700065,8700021,8700038,}, name = "终成眷属", completeAttr = {dwFlee = 240,}},
	[17] = {setSlot = {68,69,70,71,72,},setCard = {8700066,8700067,8700068,8700069,8700070,}, name = "江山美人", completeAttr = {dwPoJiaValue = 840,}},
	[18] = {setSlot = {73,74,},setCard = {8700071,8700053,}, name = "相忘江湖", completeAttr = {dwCrit = 672,}},
	[19] = {setSlot = {75,76,},setCard = {8700072,8700044,}, name = "九阴九阳", completeAttr = {dwAttack = 4800,}},
	[20] = {setSlot = {77,78,79,80,81,},setCard = {8700040,8700045,8700047,8700049,8700052,}, name = "新五绝", completeAttr = {dwPoJiaDiKang = 1488,}},
    [21] = {setSlot = {82,83,84,85,86,87,},setCard = {8700073,8700074,8700075,8700076,8700077,8700078,}, name = "桃谷六仙", completeAttr = {dwAttack = 4800,}},
    [22] = {setSlot = {88,89,90,91,},setCard = {8700079,8700080,8700081,8700082,}, name = "四大恶人", completeAttr = {dwHPMax = 42000,}},	
};

--获取属性
-- attrType 属性类型 1 镶嵌增加属性 ， 2代表完成属性
-- @param number dwSlotIndex 槽位索引(组合索引)
-- @return table 属性表 (K - Config/SkillDefine.lua中SSingleAttrChange名字)
function QunXiaZuHeSlotConfig:GetProperty(attrType, dwSlotIndex)
	local setConfig = QunXiaZuHeSlotConfig[dwSlotIndex].addAttr;
	if attrType == 2 then
		setConfig = QunXiaLuCombination[dwSlotIndex].completeAttr;
	end

    local tempAttrInfo = SSingleAttrChange:new();
	for k,v in pairs(setConfig) do
		tempAttrInfo[k] = v;
	end
	
	return tempAttrInfo;
end

--群侠-组合文本相关配置
_G.QunXiaLuCombination.Data = {
	--组合单页显示个数
	onePageNum = 8;
	--组合显示格式
	ComCellMode = "<font >%s(%d/%d)</font>";
	--组合按钮提示
	szCombinationBtTips = {
		[1] = "<font color='#87CEEB'>%s</font><font color='#FFFFFF'>   进度:%d/%d</font><br/>";
		[2] = "<font color='#6BDD65'>当前激活属性:</font><br/>";
		[3] = "<font color='#D9671B'>%s：</font> <font color='#D9CCBD'>%d/%d</font><br/>";
	};
	--卡片标题
	szTitle = "<font color='%s'>%s</font>";
	--镶嵌获得属性格式
	szAddAttr = "<font color='%s'>%s：+%d </font>";
	--镶嵌按钮文本
	szInsertBt = {
		[1] = "镶嵌";
		[2] = "已镶嵌";
	};
	--完成镶嵌额外属性字体颜色
	CompletAttrColor = {
		[1] = "#D9CCBD"; --激活前
		[2] = "#DCB857"; --激活后
	};
	--镶嵌界面材料充足和不足时颜色
	InsertStateColor = {
		[1] = "#00FF00"; --充足
		[2] = "#FF0000"; --不足
	};
	--镶嵌卡片获得属性字体颜色
	InsertAddAttrColor = {
		[1] = "#D9CCBD"; --激活前
		[2] = "#DCB857"; --激活后
	};
	--完成镶嵌额外属性显示格式
	szCompletAttrMode = "<font color='%s'>%s：+%d </font>";
	--镶嵌标题
	szInsertTitle = "<font color='#FFFFFF'>%s</font>";
	--消耗卡片比例
	szCostCardPercent = "<font color='%s'>%d/%d</font>";
	--消耗材料名称
	szCostMatrName = "<font color='%s'>%sX%d</font>";
	--消耗材料不足提示
	szNotEnoughtMatr = "<font color='#FFFFFF'>%s数量不足，无法镶嵌。</font>";
	--消耗卡片不足提示
	szNotEnoughtCard = "<font color='#FFFFFF'>所需的%s群侠名卡数量不足！</font>";
	--有可镶嵌的槽位提示
	szCanInsertTips = {
		[1] = "<font color='#FFFFFF'>当前有可镶嵌的槽位，您是否镶嵌</font>";
		[2] = "镶嵌";
	};
	--广播消息
	szBroadCast = "恭喜玩家%s完成群侠组合<font color='#FF6100'>%s</font>的收集";
};

--用于客户端挑战群侠组合的显示位置
_G.QunXiaLuCombination.PosIndex = {
	--此处上次你没有合并过去
	[1] = 1,
	[2] = 13,
	[3] = 2,
	[4] = 3,
	[5] = 14,
	[6] = 4,
	[7] = 5,
	[8] = 15,
	[9] = 6,
	[10] = 7,
	[11] = 8,
	[12] = 9,
	[13] = 16,
	[14] = 17,
	[15] = 10,
	[16] = 11,
	[17] = 12,
	[18] = 18,
	[19] = 19,
	[20] = 20,
	[21] = 21,
	[22] = 22,	
};

function QunXiaLuCombination:Index2Pos(dwIndex)
	for k, v in pairs(self.PosIndex) do
		if v == dwIndex then
			return k;
		end
	end
	return
end

