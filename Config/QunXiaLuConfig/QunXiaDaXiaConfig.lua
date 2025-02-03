--[[
	--群侠录——大侠录配置信息
	--时间：2013-12-31
]]


--[[
群侠录-大侠录槽位配置文件
needItem  镶嵌需要的物品{{卡片,物品}，获得属性}
addAttr  镶嵌后增加的属性
--]]
_G.QunXiaDaXiaSlotConfig = {
	[30] = {needItem = {card = {[8700030] = 1},item = {[4100451] = 5},}, addAttr = {dwFlee = 50,}},
	[31] = {needItem = {card = {[8700031] = 1},item = {[4100451] = 5},}, addAttr = {dwDefense = 250,}},
	[32] = {needItem = {card = {[8700032] = 1},item = {[4100451] = 5},}, addAttr = {dwAttack = 500,}},
	[33] = {needItem = {card = {[8700033] = 1},item = {[4100451] = 5},}, addAttr = {dwHPMax = 2500,}},
	[34] = {needItem = {card = {[8700034] = 1},item = {[4100451] = 10},}, addAttr = {dwFlee = 60,}},
	[35] = {needItem = {card = {[8700035] = 1},item = {[4100451] = 10},}, addAttr = {dwDefense = 300,}},
	[36] = {needItem = {card = {[8700036] = 1},item = {[4100451] = 10},}, addAttr = {dwAttack = 600,}},
	[37] = {needItem = {card = {[8700037] = 1},item = {[4100451] = 10},}, addAttr = {dwHPMax = 3000,}},
	[38] = {needItem = {card = {[8700038] = 1},item = {[4100451] = 10},}, addAttr = {dwFlee = 80,}},
	[39] = {needItem = {card = {[8700039] = 1},item = {[4100451] = 10},}, addAttr = {dwHPMax = 4000,}},
	[40] = {needItem = {card = {[8700040] = 1},item = {[4100451] = 10},}, addAttr = {dwCrit = 110,}},
	--[41] = {needItem = {card = {[8700041] = 1},item = {[4100451] = 1},}, addAttr = {dwDefense = 20,}},
	[42] = {needItem = {card = {[8700042] = 1},item = {[4100451] = 20},}, addAttr = {dwDefense = 400,}},
	[43] = {needItem = {card = {[8700043] = 1},item = {[4100451] = 20},}, addAttr = {dwAttack = 1100,}},
	[44] = {needItem = {card = {[8700044] = 1},item = {[4100451] = 20},}, addAttr = {dwHPMax = 10000,}},
	[45] = {needItem = {card = {[8700045] = 1},item = {[4100451] = 20},}, addAttr = {dwDefense = 750,}},
	[46] = {needItem = {card = {[8700046] = 1},item = {[4100451] = 20},}, addAttr = {dwDefense = 550,}},
	[47] = {needItem = {card = {[8700047] = 1},item = {[4100451] = 20},}, addAttr = {dwAttack = 2000,}},
	[48] = {needItem = {card = {[8700048] = 1},item = {[4100451] = 20},}, addAttr = {dwAttack = 1500,}},
	[49] = {needItem = {card = {[8700049] = 1},item = {[4100451] = 20},}, addAttr = {dwDefense = 1000,}},
	[50] = {needItem = {card = {[8700050] = 1},item = {[4100451] = 20},}, addAttr = {dwHPMax = 7500,}},
	[51] = {needItem = {card = {[8700051] = 1},item = {[4100451] = 20},}, addAttr = {dwAttack = 800,}},
	[52] = {needItem = {card = {[8700052] = 1},item = {[4100451] = 20},}, addAttr = {dwHPMax = 5500,}},
	[53] = {needItem = {card = {[8700053] = 1},item = {[4100451] = 20},}, addAttr = {dwCrit = 150,}},
	[54] = {needItem = {card = {[8700054] = 1},item = {[4100451] = 20},}, addAttr = {dwCrit = 200,}},
	[55] = {needItem = {card = {[8700070] = 1},item = {[4100451] = 20},}, addAttr = {dwCrit = 260,}},
	[56] = {needItem = {card = {[8700071] = 1},item = {[4100451] = 20},}, addAttr = {dwDefense = 1300,}},
	[57] = {needItem = {card = {[8700068] = 1},item = {[4100451] = 20},}, addAttr = {dwAttack = 2600,}},
	[58] = {needItem = {card = {[8700072] = 1},item = {[4100451] = 20},}, addAttr = {dwHPMax = 13000,}},
};

--[[
群侠录  大侠录配置文件
setSlot 槽位集合
--]]
_G.QunXiaLuDaXia = {
	[1] = {setSlot = {30,34,38,40,53,54,55,},setCard = {8700030,8700034,8700038,8700040,8700053,8700054,8700070},},
	[2] = {setSlot = {31,35,42,46,45,49,56,},setCard = {8700031,8700035,8700042,8700046,8700045,8700049,8700071},},
	[3] = {setSlot = {32,36,51,43,48,47,57,},setCard = {8700032,8700036,8700051,8700043,8700048,8700047,8700068},},
	[4] = {setSlot = {33,37,39,52,50,44,58,},setCard = {8700033,8700037,8700039,8700052,8700050,8700044,8700072},},
};


--获取属性
-- @param number dwSlotIndex 槽位索引
-- @return table 属性表 (K - Config/SkillDefine.lua中SSingleAttrChange名字)
function QunXiaDaXiaSlotConfig:GetProperty(dwSlotIndex)
	local setConfig = QunXiaDaXiaSlotConfig[dwSlotIndex].addAttr;
    local tempAttrInfo = SSingleAttrChange:new();
	for k,v in pairs(setConfig) do
		tempAttrInfo[k] = v;
	end
	
	return tempAttrInfo;
end

--大侠录文本相关
_G.QunXiaLuDaXia.Data = {
	--卡片标题
	szTitle = "<font color='%s'>%s</font>";
	--镶嵌获得属性格式
	szAddAttr = "<font color='%s'>%s：+%d </font>";
	--属性加成字体颜色
	addAttrColor = {
		[1] = "#D9CCBD"; --未激活
		[2] = "#DCB857"; --已激活
	};
	--进度条提示
	szProgress = "%d/%d";
	--广播消息
	szBroadCast = "恭喜玩家%s经过坚持不懈的努力最终完成大侠录所有侠士的收集。";
	--相邻卡片还未镶嵌提示
	szPreNotInsert = "您前一个群侠卡片还尚未镶嵌！";
};
