--装备强化系统配置文件
_G.EIStringConfig = {
};
_G.EIStringDis = {
	[1]="装备强化能大幅提升装备的基础能力，当所有装备都到达一定的强化等级后，可激活装备强化套装效果",
	[2]="装备升阶可将装备升级到下阶装备，升阶后可提升装备各项属性<br/>装备强化等级>=10级才可升阶",
	[3]="洗炼品质可以将您的附加属性重新随机生成更多条属性，装备品质到达一定阶段后，可激活套装效果"	,
	[4]="洗炼类型可以改变装备的附加属性类型，属性类型一致的超梦幻装备"	,
	[5]="洗炼数值可以洗炼装备的附加属性数值，为您的装备打造极致属性"	,
};

_G.EICongratulationConfig = 
{
	--等级强化
	Intensify = {
		First	= 0;
		Second	= 10;
		Third	= 15;
	};
	--重置附加属性
	ResetAppendProp = {
		Num	= 6;
	};
	--兵魂
	BornProp = {
		Grade	= 3;--应该是5阶 目前没有。。。就用3阶以作测试吧。
		Percent	= 100;
	};
	--升阶
	LevelUp = {
		Grade	= 3;--应该是5阶 目前没有。。。就用3阶以作测试吧。
	};
	--附加属性类型重置
	ResetAppendPropType = {
		Num = 5;
	};
	--强化附加属性数值
	AddAppendPropValue = {
		Num = 5;
	};
};
--装备强化Avartar配置文件
_G.EISysAvatarConfig = {
	ActTime		= 1;--挥锤动作次数
	NpcLookID	= 900;
	NpcIdelID	= 90001;
	NpcActID	= 90002;
	NpcSucID	= 90003;
	NpcFailID	= 90004;
	Range		= _Vector2.new(800, 800);
	Eye			= _Vector3.new(0,-7.5,1.8);
	Look		= _Vector3.new(0,0,0);
    
    NpcSayInterval  = 6; --Npc说话间隔，即多久说句话，单位 秒
    NpcSayTime      = 3; --Npc说话持续时间，即显示时间，单位 秒
	NpcSucSay	=	--操作成功
	{ 
		[1]="<font color='#00ff00'>您的装备更进一层</font>",
		[2]="<font color='#00ff00'>装备发生了神奇的变化</font>",
	};
	NpcFailSay	=	--操作失败
	{ 
		[1]="<font color='#00ff00'>没关系，再接再厉，好装备是需要磨练的</font>",
		[2]="<font color='#00ff00'>心急吃不了热豆腐</font>",
	};
	NpcIdelSay	=	--休闲对话
	{ 
		[1]="<font color='#00ff00'>好装备是需要精心打造的</font>",
		[2]="<font color='#00ff00'>只有不断的强化装备，才可让他发挥出它应有的威力</font>",
		[3]="<font color='#00ff00'>可以通过副本获得装备打造材料</font>",
		[4]="<font color='#00ff00'>击杀BOSS可是有丰富的材料掉落哦</font>",
	};
	NpcActSay	=	--操作进行中
	{ 
		[1]="<font color='#00ff00'>少侠看好了</font>",
		[2]="<font color='#00ff00'>请耐心等待，不要着急</font>",
	};
}

--装备洗练女Avartar配置文件
_G.EISysMAvatarConfig = {
	ActTime		= 1;--挥锤动作次数
	NpcLookID	= 10021014;
	NpcIdelID	= 1002101401;
	NpcActID	= 1002101490;
	NpcSucID	= 1002101491;
	NpcFailID	= 1002101492;
	Range		= _Vector2.new(800, 800);
	Eye			= _Vector3.new(0,-6.5,1.8);
	Look		= _Vector3.new(0,0,0.2);
    
    NpcSayInterval  = 6; --Npc说话间隔，即多久说句话，单位 秒
    NpcSayTime      = 3; --Npc说话持续时间，即显示时间，单位 秒
	NpcSucSay	=	--操作成功
	{ 
		[1]="<font color='#00ff00'>您的装备更进一层</font>",
		[2]="<font color='#00ff00'>装备发生了神奇的变化</font>",
	};
	NpcFailSay	=	--操作失败
	{ 
		[1]="<font color='#00ff00'>没关系，再接再厉，好装备是需要磨练的</font>",
		[2]="<font color='#00ff00'>心急吃不了热豆腐</font>",
	};
	NpcIdelSay	=	--休闲对话
	{ 
		[1]="<font color='#00ff00'>好装备是需要精心打造的</font>",
		[2]="<font color='#00ff00'>只有不断的强化装备，才可让他发挥出它应有的威力</font>",
		[3]="<font color='#00ff00'>可以通过副本获得装备打造材料</font>",
		[4]="<font color='#00ff00'>击杀BOSS可是有丰富的材料掉落哦</font>",
	};
	NpcActSay	=	--操作进行中
	{ 
		[1]="<font color='#00ff00'>少侠看好了</font>",
		[2]="<font color='#00ff00'>请耐心等待，不要着急</font>",
	};
}

_G.EISysSuccessStr = {
	SuccessStr = function(nSuccessRate)
		if nSuccessRate >= 10000 then	
			return "必成";
		elseif nSuccessRate >= 8000 then
			return "容易";
		elseif nSuccessRate >= 4000 then
			return "一般";
		elseif nSuccessRate >= 2000 then
			return "较难";
		else
			return "很难";
		end;
	end;
};
--卷轴的类型枚举
_G.ScrollTypeEnum = {
	--强化卷轴
	Strong = 1,
	--属性洗练卷轴
	WashType = 2,
	--极值洗练卷轴
	WashValue = 3,
};
----【强化装备配置文件】
_G.EquipIntensifyConfig = 
{
	--是否可以用礼金购买
	CanBuyItemByBindGold = true;
	--可以强化的装备佩戴位置集合，对应Item.tItemCfg.dwWearPos
	CanIntensifyTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 21, 22, 23, 24};
	--装备最大强化等级
	MaxIntensifyLevel 	= 15;
	--自动强化到几星选项
	AutoIntensifyTo		= "%d级";
	--强化石配置ID
	QHStoneId			= 4100140;
	StoneDescStr		= "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>强化石</font>物品描述";
	--幸运石配置ID
	XYStoneId			= 4100070;
	--保底石配置ID
	BDStoneId			= 4100100;
	--强化失败惩罚掉一级等级
	FailedDownOne		= 5;
	--强化失败惩罚直接掉到当前等级
	FailedDownTo		= 10;
	--强化失败加经验
	AddExp	= function(itemInst, playerLevel)
		local nExp 	= playerLevel * (playerLevel*(5+playerLevel/20))*0.1
		return math.floor(nExp);
	end;
	
	--强化成功率公式
	----itemInst		装备实例
	----num		使用幸运石数量
	QiangHuaPro = 
	{
	10000 ,
	9000 ,
	8000 ,
	7000 ,
	7000 ,
	7000 ,
	7000 ,
	6500 ,
	5500 ,
	5000 ,
	6000 ,
	5000 ,
	5000 ,
	4000 ,
	2000, 
	},
	
	SuccessRate = function(itemInst, num, dwTianGuanCiFu)
        dwTianGuanCiFu = dwTianGuanCiFu or 0;
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		--local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		--local BaoShiPro = 300			--宝石提示成功率

		local strongLevel = itemInst:GetStrongLevel();
				
		local ZhuFuMoney = dwTianGuanCiFu
		local rate = EquipIntensifyConfig.QiangHuaPro[strongLevel + 1];
		--装备祝福最小值（改值随着强化装备阶进行变化）
		local ZhuFuMin = 80 + itemInst:GetLevel()*35
		
		if strongLevel + 1  > 13 then
			if ZhuFuMoney < ZhuFuMin then
				rate = math.floor(rate/2)
			else
				rate = rate + math.floor((ZhuFuMoney-ZhuFuMin+40)/10) * 1000
			end
		end
		return math.floor(rate);
	end;
	QiangHuaMoney = 
	{
		2000,
		3000,
		5000,
		10000,
		20000,
		40000,
		80000,
	},
	


	--强化消耗银两 = （当前强化等级 + 1） * 装备阶数 * 500
	NeedMoney = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		local strongLevel = itemInst:GetStrongLevel();
		
	
		return math.floor((EquipIntensifyConfig.QiangHuaMoney[itemLevel]  * ( 1 + strongLevel * (0.2 + ( strongLevel - 1 ) * 0.015 ))) / 1000 ) * 1000;
	end;
	QiangHuaItemJiChu = 
	{
		1,
		2,
		3,
		4,
		6,
		8,
		10,
	},
	
	QiangHuaItemDengJi = 
	{
		0,
		0,
		0,
		0,
		0,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		3,
		3,
		4,
	},
	
	
	--强化消耗强化石数量
	
	NeedQHStoneNum = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		local strongLevel = itemInst:GetStrongLevel();
		--消耗数量
		
		return math.floor(EquipIntensifyConfig.QiangHuaItemJiChu[itemLevel] + EquipIntensifyConfig.QiangHuaItemDengJi[strongLevel + 1]);
	end;
	
	--强化消耗保底石数量

	NeedBDStoneNum = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		--local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		local strongLevel = itemInst:GetStrongLevel();
		
		return  math.floor(strongLevel * 0.3 + 1);
	end;
	--强化卷轴
	AppointLevel = {
		[5950001] = 10;
		[5950002] = 11;
		[5950003] = 12;
		[5950004] = 13;
		[5950005] = 14;
		[5950006] = 15;
	},
	
	--[[--卷轴类型对应的函数表
	ScrollTypeFuncTab = {
		--强化卷轴
		[5950001]		= function(objEquipIntensifySystem, user, EquipID, ItemID) return objEquipIntensifySystem:AppointLevel(user, EquipID, ItemID) 	end;
		[5950002]		= function(objEquipIntensifySystem, user, EquipID, ItemID) return objEquipIntensifySystem:AppointLevel(user, EquipID, ItemID) 	end;
		[5950003]		= function(objEquipIntensifySystem, user, EquipID, ItemID) return objEquipIntensifySystem:AppointLevel(user, EquipID, ItemID) 	end;
		[5950004]		= function(objEquipIntensifySystem, user, EquipID, ItemID) return objEquipIntensifySystem:AppointLevel(user, EquipID, ItemID) 	end;
		[5950005]		= function(objEquipIntensifySystem, user, EquipID, ItemID) return objEquipIntensifySystem:AppointLevel(user, EquipID, ItemID) 	end;
		[5950006]		= function(objEquipIntensifySystem, user, EquipID, ItemID) return objEquipIntensifySystem:AppointLevel(user, EquipID, ItemID) 	end;
		--属性洗练卷轴
		[5950010]		= function(objEquipIntensifySystem, user, EquipID, ItemID) return objEquipIntensifySystem:WashPropType(user, EquipID, ItemID) 	end;
	},--]]
	
	--卷轴枚举ID对应的卷轴类型表
	ScrollEnumIDToType = {
		--强化卷轴
		[5950001]		= ScrollTypeEnum.Strong;
		[5950002]		= ScrollTypeEnum.Strong;
		[5950003]		= ScrollTypeEnum.Strong;
		[5950004]		= ScrollTypeEnum.Strong;
		[5950005]		= ScrollTypeEnum.Strong;
		[5950006]		= ScrollTypeEnum.Strong;
		--属性洗练卷轴
		[5950010]		= ScrollTypeEnum.WashType;
		[5950011]		= ScrollTypeEnum.WashType;
		[5950012]		= ScrollTypeEnum.WashType;
		[5950013]		= ScrollTypeEnum.WashType;
		[5950014]		= ScrollTypeEnum.WashType;
		[5950015]		= ScrollTypeEnum.WashType;
		--极值洗练卷轴
		[5950020]		= ScrollTypeEnum.WashValue;
	},
};
----【强化装备天生属性配置文件】
_G.IntensifyBornPropConfig = 
{
	CanBuyItemByBindGold = true;
	--可以强化的装备佩戴位置集合，对应Item.tItemCfg.dwWearPos
	CanIntensifyTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,21, 22, 23, 24};
	--装备最大强化值0-1000000
	MaxIntensifyValue 	= 1000000;
	--强化石配置ID
	QHStoneId			= 4100060;
	StoneDescStr		= "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>强化石</font>物品描述";
	--幸运石配置ID
	XYStoneId			= 4100070;
	--强化成功率公式 = 0.9 / 装备强化等级 + 幸运石 * 0.05
	----num为使用幸运石数量
	SuccessRate = function(itemInst, num)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		local rate = (4000 - (itemLevel - 1) * 500) + (num * 1000 - (itemLevel - 1) * 100);
		
		return math.floor(rate);
	end;
	--强化消耗银两 = 装备阶数 * 200
	NeedMoney = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		local money = 500
		
		if itemLevel > 1 then
			money = 1000 + (itemLevel-1) * (1000 + (itemLevel - 2)*500)
		end
		return math.floor(money);
	end;
	--强化消耗强化石数量
	NeedQHStoneNum = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		return math.floor(itemLevel);
	end;
	--每次强化增加数值（1-100万)
	AddBornPropValue = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		return math.random( math.floor(1/(itemLevel*2+3)*1000000) , math.floor(1/(itemLevel*2+5)*1000000));
	end;
};
----【装备升阶配置文件】
_G.LevelUpEquipConfig = 
{
	CanBuyItemByBindGold = true;
	--可以强化的装备佩戴位置集合，对应Item.tItemCfg.dwWearPos
	CanIntensifyTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,21, 22, 23, 24};
	--升阶石配置ID
	SJStoneId			= 4100120;
	StoneDescStr		= "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>升阶玄铁</font>物品描述";
	--冰星石配置ID
	BXStoneId			= 4100100;
	--封魂石配置ID
	FHStoneId			= 4100090;
	--强化成功率公式 = 0.6/ 装备阶数
	----client
	C_SuccessRate = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		--local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		--local strongLevel = itemInst:GetStrongLevel();
		
		local rate = 500;
		
		return math.floor(rate);
	end;
	----server
	n_EquipUp_Pro = {
		[1 ]=5000,
		[2 ]=4000,
		[3 ]=2000,
		[4 ]=1000,
		[5 ]=500,
		[6 ]=500,
		[7 ]=300,
	};
	
	n_EquipUp_nTGCFValue = {
		[1 ]={20,25},
		[2 ]={30,45},
		[3 ]={80,110},
		[4 ]={130,180},
		[5 ]={345,370},
		[6 ]={475,485},
		[7 ]={490,515},
	};
	S_SuccessRate = function(itemInst, nTGCFValue)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		--local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		--local strongLevel = itemInst:GetStrongLevel();

		local canshu = itemInst:GetLevel();
		local ZF_Value_Floor = LevelUpEquipConfig.n_EquipUp_nTGCFValue[canshu][1]
		local ZF_Value_up = LevelUpEquipConfig.n_EquipUp_nTGCFValue[canshu][2]
		local rate = LevelUpEquipConfig.n_EquipUp_Pro[canshu];	

		
		if nTGCFValue < ZF_Value_Floor then
			rate = 1
		end
		
		if nTGCFValue >= ZF_Value_up then
			rate = 10000
		end
		
	
		return rate;
	end;
	
	
	--装备升阶银两消耗		
	n_EquipUp_NeedMoney = {
		[1 ]=10000,
		[2 ]=20000,
		[3 ]=40000,
		[4 ]=60000,
		[5 ]=100000,
		[6 ]=200000,
		[7 ]=300000,
	};
	NeedMoney = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		--local strongLevel = itemInst:GetStrongLevel();
		
		return LevelUpEquipConfig.n_EquipUp_NeedMoney[itemLevel];
	end;
	
	
	
	--装备升阶消耗升阶石数量	
	n_EquipUp_NeedSJStoneNum = {
		[1 ]=2,
		[2 ]=3,
		[3 ]=4,
		[4 ]=5,
		[5 ]=6,
		[6 ]=8,
		[7 ]=10,
	};	
	NeedSJStoneNum = function(itemInst)	
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		--local strongLevel = itemInst:GetStrongLevel();
		
		return LevelUpEquipConfig.n_EquipUp_NeedSJStoneNum[itemLevel];
	end;
	
	
	
	--强化消耗冰星石数量
	NeedBXStoneNum = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		--local strongLevel = itemInst:GetStrongLevel();
		
		return math.floor(itemLevel);
	end;
	--强化消耗封魂石数量
	NeedFHStoneNum = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		--装备当前强化等级
		--local strongLevel = itemInst:GetStrongLevel();
		
		return math.floor(itemLevel);
	end;
	--限制装备升阶要求的强化等级
	StrongLevel = 10;
};

----【重置装备附加属性配置文件】
_G.AppendPropConfig = 
{
	CanBuyItemByBindGold = false;
	[enPropertyType.eAttackPower] = "攻击+";
	[enPropertyType.eDefence] 	= "防御+";
	[enPropertyType.eShenFa] 	= "身法+";
	[enPropertyType.eBaoJi] 	= "暴击+";
	[enPropertyType.eHPLimited] = "生命+";
	[enPropertyType.eMPLimited] = "内力+";
	--可以强化的装备佩戴位置集合，对应Item.tItemCfg.dwWearPos
	CanIntensifyTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,21, 22, 23, 24};
	--重置石配置ID
	CZStoneId			= 4100080;
	StoneDescStr		= "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>亮银砂</font>物品描述";
	--重置消耗银两 =  装备阶数 * 200
	NeedMoney = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		return 1000+(itemLevel-1)*(2000 +(itemLevel-2) *500);
	end;
	--重置消耗重置石数量
	NeedCZStoneNum = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		local number = 1
		if itemLevel >3 then
			number = itemLevel - 2
		end
		return number;
	end;
	--重置附加属性出现几条条数权值
	PropNumProbability = {
		[1] = 1380,
		[2] = 1780,
		[3] = 2580,
		[4] = 2620,
		[5] = 1480,
		[6] = 150,
	};
	--出现何种类型属性权值
	PropTypeProbability = {
		[1] = 100,
		[2] = 100,
		[3] = 100,
		[4] = 100,
		[5] = 100,
		[6] = 100,
	};
	--出现何种类型权值衰减度
	PropTypeAttenuation = function(appearTime)
		return appearTime == 0 and 1 or (1- (0.18 * appearTime));
	end;
	--重置后初始百分比加成区间
	PropValueInit = {
		dwMin = 40000,
		dwMax = 70000,
	};
};
----【重置装备附加属性类型配置文件】
_G.ResetAppendPropTypeConfig = 
{
	CanBuyItemByBindGold = false;
	--可以强化的装备佩戴位置集合，对应Item.tItemCfg.dwWearPos
	CanIntensifyTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,21, 22, 23, 24};
	--类型对应文字
	Type = {
		[enPropertyType.eAttackPower]= "攻击";
		[enPropertyType.eDefence] 	= "防御";
		[enPropertyType.eShenFa] 	= "身法";
		[enPropertyType.eBaoJi] 	= "暴击";
		[enPropertyType.eHPLimited] = "生命";
		[enPropertyType.eMPLimited] = "内力";
	};
	--重置石配置ID
	CZStoneId			= 4100080;
	StoneDescStr		= "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>亮银砂</font>物品描述";
	--重置消耗银两 =  装备阶数 * 200
	NeedMoney = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		return math.floor(1000+(itemLevel-1)*(1500 +(itemLevel-2) *1000));
	end;
	--重置消耗重置石数量
	NeedCZStoneNum = function(itemInst)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		local number = 1
		if itemLevel > 2 then
			number = itemLevel - 1
		end
		return math.floor(number);
	end;
	--属性洗炼卷轴配置 （洗炼类型）
	WashAppendPropTypeScroll = {
		--攻击卷轴ID
		[5950010] = {
			--成功率
			successRate = 10000,
			--会出现的附加属性集合
			-- setAppendPropText = {[1] = "攻击", [2] = "防御"},
			setAppendProp = {enPropertyType.eAttackPower};
			
			setAppendPropForClient = {[1] = "攻击"},
			--根据装备品质来给装备洗属性
			[enQualityType.eNormal] = {},
			[enQualityType.eGreen]	= {enPropertyType.eAttackPower, enPropertyType.eAttackPower, enPropertyType.eAttackPower,},
			[enQualityType.eBlue]	= {enPropertyType.eAttackPower, enPropertyType.eAttackPower, enPropertyType.eAttackPower,enPropertyType.eAttackPower, enPropertyType.eAttackPower,},
			[enQualityType.ePink]	= {enPropertyType.eAttackPower, enPropertyType.eAttackPower, enPropertyType.eAttackPower,enPropertyType.eAttackPower, enPropertyType.eAttackPower,enPropertyType.eAttackPower,},
			[enQualityType.eGold]	= {enPropertyType.eAttackPower, enPropertyType.eAttackPower, enPropertyType.eAttackPower,enPropertyType.eAttackPower, enPropertyType.eAttackPower,enPropertyType.eAttackPower
									  ,enPropertyType.eAttackPower,enPropertyType.eAttackPower,enPropertyType.eAttackPower,enPropertyType.eAttackPower},
		},

		--防御卷轴ID
		[5950011] = {
			--成功率
			successRate = 10000,
			--会出现的附加属性集合
			-- setAppendPropText = {[1] = "攻击", [2] = "防御"},
			setAppendProp = {enPropertyType.eDefence};
			
			setAppendPropForClient = {[1] = "防御"},
			--根据装备品质来给装备洗属性
			[enQualityType.eNormal] = {},
			[enQualityType.eGreen]	= {enPropertyType.eDefence, enPropertyType.eDefence, enPropertyType.eDefence,},
			[enQualityType.eBlue]	= {enPropertyType.eDefence, enPropertyType.eDefence, enPropertyType.eDefence,enPropertyType.eDefence, enPropertyType.eDefence,},
			[enQualityType.ePink]	= {enPropertyType.eDefence, enPropertyType.eDefence, enPropertyType.eDefence,enPropertyType.eDefence, enPropertyType.eDefence,enPropertyType.eDefence,},
			[enQualityType.eGold]	= {enPropertyType.eDefence, enPropertyType.eDefence, enPropertyType.eDefence,enPropertyType.eDefence, enPropertyType.eDefence,enPropertyType.eDefence
									  ,enPropertyType.eDefence,enPropertyType.eDefence,enPropertyType.eDefence,enPropertyType.eDefence},
		},
		
		--生命卷轴ID
		[5950012] = {
			--成功率
			successRate = 10000,
			--会出现的附加属性集合
			-- setAppendPropText = {[1] = "攻击", [2] = "防御"},
			setAppendProp = {enPropertyType.eHPLimited};
			
			setAppendPropForClient = {[1] = "生命"},
			--根据装备品质来给装备洗属性
			[enQualityType.eNormal] = {},
			[enQualityType.eGreen]	= {enPropertyType.eHPLimited, enPropertyType.eHPLimited, enPropertyType.eHPLimited,},
			[enQualityType.eBlue]	= {enPropertyType.eHPLimited, enPropertyType.eHPLimited, enPropertyType.eHPLimited,enPropertyType.eHPLimited, enPropertyType.eHPLimited,},
			[enQualityType.ePink]	= {enPropertyType.eHPLimited, enPropertyType.eHPLimited, enPropertyType.eHPLimited,enPropertyType.eHPLimited, enPropertyType.eHPLimited,enPropertyType.eHPLimited,},
			[enQualityType.eGold]	= {enPropertyType.eHPLimited, enPropertyType.eHPLimited, enPropertyType.eHPLimited,enPropertyType.eHPLimited, enPropertyType.eHPLimited,enPropertyType.eHPLimited
									  ,enPropertyType.eHPLimited,enPropertyType.eHPLimited,enPropertyType.eHPLimited,enPropertyType.eHPLimited},
									 
		
		},
		--内力卷轴ID
		[5950013] = {
			successRate = 10000,
			--会出现的附加属性集合
			-- setAppendPropText = {[1] = "攻击", [2] = "防御"},
			setAppendProp = {enPropertyType.eMPLimited};
			
			setAppendPropForClient = {[1] = "内力"},
			--根据装备品质来给装备洗属性
			[enQualityType.eNormal] = {},
			[enQualityType.eGreen]	= {enPropertyType.eMPLimited, enPropertyType.eMPLimited, enPropertyType.eMPLimited,},
			[enQualityType.eBlue]	= {enPropertyType.eMPLimited, enPropertyType.eMPLimited, enPropertyType.eMPLimited,enPropertyType.eMPLimited, enPropertyType.eMPLimited,},
			[enQualityType.ePink]	= {enPropertyType.eMPLimited, enPropertyType.eMPLimited, enPropertyType.eMPLimited,enPropertyType.eMPLimited, enPropertyType.eMPLimited,enPropertyType.eMPLimited,},
			[enQualityType.eGold]	= {enPropertyType.eMPLimited, enPropertyType.eMPLimited, enPropertyType.eMPLimited,enPropertyType.eMPLimited, enPropertyType.eMPLimited,enPropertyType.eMPLimited
									  ,enPropertyType.eMPLimited,enPropertyType.eMPLimited,enPropertyType.eMPLimited,enPropertyType.eMPLimited},
		
		},
		
		--身法卷轴ID
		[5950014] = {
			--成功率
			successRate = 10000,
			--会出现的附加属性集合
			-- setAppendPropText = {[1] = "攻击", [2] = "防御"},
			setAppendProp = {enPropertyType.eShenFa};
			
			setAppendPropForClient = {[1] = "身法"},
			--根据装备品质来给装备洗属性
			[enQualityType.eNormal] = {},
			[enQualityType.eGreen]	= {enPropertyType.eShenFa, enPropertyType.eShenFa, enPropertyType.eShenFa,},
			[enQualityType.eBlue]	= {enPropertyType.eShenFa, enPropertyType.eShenFa, enPropertyType.eShenFa,enPropertyType.eShenFa, enPropertyType.eShenFa,},
			[enQualityType.ePink]	= {enPropertyType.eShenFa, enPropertyType.eShenFa, enPropertyType.eShenFa,enPropertyType.eShenFa, enPropertyType.eShenFa,enPropertyType.eShenFa,},
			[enQualityType.eGold]	= {enPropertyType.eShenFa, enPropertyType.eShenFa, enPropertyType.eShenFa,enPropertyType.eShenFa, enPropertyType.eShenFa,enPropertyType.eShenFa
									  ,enPropertyType.eShenFa,enPropertyType.eShenFa,enPropertyType.eShenFa,enPropertyType.eShenFa},
		},
		--暴击卷轴ID
		[5950015] = {
			--成功率
			successRate = 10000,
			--会出现的附加属性集合
			-- setAppendPropText = {[1] = "攻击", [2] = "防御"},
			setAppendProp = {enPropertyType.eBaoJi};
			
			setAppendPropForClient = {[1] = "暴击"},
			--根据装备品质来给装备洗属性
			[enQualityType.eNormal] = {},
			[enQualityType.eGreen]	= {enPropertyType.eBaoJi, enPropertyType.eBaoJi, enPropertyType.eBaoJi,},
			[enQualityType.eBlue]	= {enPropertyType.eBaoJi, enPropertyType.eBaoJi, enPropertyType.eBaoJi,enPropertyType.eBaoJi, enPropertyType.eBaoJi,},
			[enQualityType.ePink]	= {enPropertyType.eBaoJi, enPropertyType.eBaoJi, enPropertyType.eBaoJi,enPropertyType.eBaoJi, enPropertyType.eBaoJi,enPropertyType.eBaoJi,},
			[enQualityType.eGold]	= {enPropertyType.eBaoJi, enPropertyType.eBaoJi, enPropertyType.eBaoJi,enPropertyType.eBaoJi, enPropertyType.eBaoJi,enPropertyType.eBaoJi
									  ,enPropertyType.eBaoJi,enPropertyType.eBaoJi,enPropertyType.eBaoJi,enPropertyType.eBaoJi},
		},
			
	};
	--极值属性洗炼卷轴
	WashAppendPropValueScroll = {
		[5950020] = {
			--成功率
			successRate = 10000,
			--客户端广播需要的
			notice = "极致属性";
		},
	};
	
};
----【增加装备附加属性数值配置文件】
_G.AddAppendPropValueConfig = 
{
	CanBuyItemByBindGold = false;
	--可以强化的装备佩戴位置集合，对应Item.tItemCfg.dwWearPos
	CanIntensifyTable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ,21, 22, 23, 24};
	--强化石配置ID
	QHStoneId			= 4100080;
	StoneDescStr		= "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>亮银砂</font>物品描述";
	--幸运石配置ID
	XYStoneId			= 4100070;
	--增加属性最大百分比（极致满值）
	MaxAppendPropValue 	= 1000000;
	
	--附加属性失败加经验
	AddExp	= function(itemInst, playerLevel)
		local nExp 	= playerLevel * (playerLevel*(5+playerLevel/20))*0.1
		return math.floor(nExp);
	end;
	
	
	 --附加属性每次进化装备增长率	
	NumData={
	[1] 		=0.3;
	[2] 		=0.2;
	[3] 		=0.14;
	[4] 		=0.12;
	[5] 		=0.11;
	[6] 		=0.1;
	[7] 	    =0.1;
	};
	

	
	--【加属性最小值百分比】
	----propNum为装备属性条数
	----num为使用幸运石数量
	MinAddPropValue = function(itemInst, propNum, num)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		local a =AddAppendPropValueConfig.NumData[itemLevel]
		--print("aaaaaaaaaa=	",a)
		
		return  math.floor(a*1000000);
	end;
	
	
	
	--【增加属性最大值百分比】
	----propNum为装备属性条数
	----num为使用幸运石数量
	MaxAddPropValue = function(itemInst, propNum, num)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
				local b =AddAppendPropValueConfig.NumData[itemLevel]
		--print("bbbbbbbbbbbb=	",b)
		return  math.floor(b*1000000);
	end;
	
	--【强化装备附加属性的成功率公式 】
	----propNum为装备属性条数
	----num为使用幸运石数量
	
	SuccessRate = function(itemInst, propNum, num)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		--local itemLevel = itemInst:GetLevel();
		
		local pro = 0
		
		if propNum == 1 then
			pro = 2000
		elseif propNum == 2 then
			pro = 2000
		elseif propNum == 3 then
			pro = 2000		
		elseif propNum == 4 then
			pro = 2000			
		elseif propNum == 5 then
			pro = 2000
		elseif propNum == 6 then
			pro = 2000	
		end
		
		pro = pro + num * 300
		
		if pro < 1 then 
			pro = 1
		end;
			--print("pro	=	",pro)
		
		return math.floor(pro);
	end;
	
	--重置消耗银两 =  装备阶数 * 200
	----propNum为属性条数
	
		MoneyData={
	[1] 		=1000;
	[2] 		=2000;
	[3] 		=4000;
	[4] 		=7500;
	[5] 		=12500;
	[6] 		=25000;
	[7] 	    =50000;
	};
	NeedMoney = function(itemInst, propNum)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		
		local c =AddAppendPropValueConfig.MoneyData[itemLevel]
		
		--print("ccccccccc	=	",c)
		return math.floor(c);
	end;
	--重置消耗强化石数量
	----propNum为属性条数
	
	
	
	NeedQHStoneNum = function(itemInst, propNum)
		--装备穿戴位置
		--local position = itemInst:GetWearPos();
		--装备阶数
		local itemLevel = itemInst:GetLevel();
		
		
		-- local propNum  = propNum:GetLevel();
	


	    --阶加成
		local num = 1
		if itemLevel >3 then
			num =itemLevel -1
		end
		
		--条数加成
		local pro = 0		
		if propNum == 1 then
			pro = 1
		elseif propNum == 2 then
			pro = 1
		elseif propNum == 3 then
			pro = 1		
		elseif propNum == 4 then
			pro = 2			
		elseif propNum == 5 then
			pro = 2
		elseif propNum == 6 then
			pro = 3	
		end
		
		
		--数量= 阶+品质
		local number= pro + num
		--print("1111111111",pro);
		--print("2222222222",num);
		--print("333333333",number);
		
		return math.floor(number);
	end;
};
----【宝石镶嵌配置文件】
_G.StoneAddConfig = 
{
	--等号前面为装备子类
	--等号后面为允许镶嵌宝石子类
	--没写就全部允许
	[10] = {[30]=30};
	[20] = {[20]=20};
	[21] = {[20]=20};
	[22] = {[20]=20};
	[23] = {[20]=20};
	[25] = {[20]=20};
	[40] = {[10]=10, [50]=50,[40]=40};
	[41] = {[10]=10, [50]=50,[40]=40};
	[42] = {[10]=10, [50]=50,[40]=40};
	[43] = {[10]=10, [50]=50,[40]=40};
	[44] = {[10]=10, [50]=50,[40]=40};
	[45] = {[10]=10, [50]=50,[40]=40};
};






