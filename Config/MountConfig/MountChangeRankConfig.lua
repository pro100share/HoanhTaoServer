
--[[
功能：坐骑转生配置文件
时间：2014-1-13
]]
----坐骑转生配置表
_G.MountChangeRankConfig = {
	----条件限制信息
	ConLimitInfos = {
		[1] = {minSectionLimit = 2,levelLimit = 60,expLimit = 10000},
		[2] = {minSectionLimit = 2,levelLimit = 65,expLimit = 15000},
		[3] = {minSectionLimit = 2,levelLimit = 70,expLimit = 25000},
		[4] = {minSectionLimit = 2,levelLimit = 75,expLimit = 45000},
		[5] = {minSectionLimit = 2,levelLimit = 80,expLimit = 85000},
		[6] = {minSectionLimit = 2,levelLimit = 85,expLimit = 165000},
		[7] = {minSectionLimit = 2,levelLimit = 90,expLimit = 365000},
		[8] = {minSectionLimit = 2,levelLimit = 100,expLimit = 965000},
		[9] = {minSectionLimit = 2,levelLimit = 110,expLimit = 2765000},
		[10] = {minSectionLimit = 2,levelLimit = 120,expLimit = 5465000},		
	},
	----转生后信息
	ChangeRankInfos = {
		[1]={dwAttack=2000,dwDefense=1200,dwFlee=120,dwCrit=100,dwHPMax=12000,dwMoveSpeed=0,dwMPMax=300,medItemLimit=80,},
		[2]={dwAttack=4000,dwDefense=2400,dwFlee=240,dwCrit=200,dwHPMax=24000,dwMoveSpeed=0,dwMPMax=600,medItemLimit=110,},
		[3]={dwAttack=6000,dwDefense=3600,dwFlee=360,dwCrit=300,dwHPMax=36000,dwMoveSpeed=0,dwMPMax=900,medItemLimit=150,},
		[4]={dwAttack=9000,dwDefense=5400,dwFlee=540,dwCrit=450,dwHPMax=54000,dwMoveSpeed=0,dwMPMax=1350,medItemLimit=200,},
		[5]={dwAttack=13000,dwDefense=7800,dwFlee=780,dwCrit=650,dwHPMax=78000,dwMoveSpeed=0,dwMPMax=1950,medItemLimit=260,},
		[6]={dwAttack=19000,dwDefense=11400,dwFlee=1140,dwCrit=950,dwHPMax=114000,dwMoveSpeed=0,dwMPMax=2850,medItemLimit=330,},
		[7]={dwAttack=27000,dwDefense=16200,dwFlee=1620,dwCrit=1350,dwHPMax=162000,dwMoveSpeed=0,dwMPMax=4050,medItemLimit=410,},
		[8]={dwAttack=37000,dwDefense=22200,dwFlee=2220,dwCrit=1850,dwHPMax=222000,dwMoveSpeed=0,dwMPMax=5550,medItemLimit=500,},
		[9]={dwAttack=49000,dwDefense=29400,dwFlee=2940,dwCrit=2450,dwHPMax=294000,dwMoveSpeed=0,dwMPMax=7350,medItemLimit=600,},
		[10]={dwAttack=67000,dwDefense=40200,dwFlee=4020,dwCrit=3350,dwHPMax=402000,dwMoveSpeed=0,dwMPMax=10050,medItemLimit=720,},		
	},
	--差值表（显示用）(如果不降级 这里全部填写0)
	chazhi = {
		[8]={dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMoveSpeed=0,dwMPMax=0,},
		[9]={dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMoveSpeed=0,dwMPMax=0,},
		[10]={dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMoveSpeed=0,dwMPMax=0,},
		[11]={dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMoveSpeed=0,dwMPMax=0,},
		[12]={dwAttack=0,dwDefense=0,dwFlee=0,dwCrit=0,dwHPMax=0,dwMoveSpeed=0,dwMPMax=0,},
	},
	
	----消耗信息
	ConsumeInfos = {
		[1] = {ItemID = 9405052,ItemNum = 1,},
		[2] = {ItemID = 9405052,ItemNum = 1,},
		[3] = {ItemID = 9405052,ItemNum = 2,},
		[4] = {ItemID = 9405052,ItemNum = 2,},
		[5] = {ItemID = 9405052,ItemNum = 3,},
		[6] = {ItemID = 9405052,ItemNum = 3,},
		[7] = {ItemID = 9405052,ItemNum = 4,},
		[8] = {ItemID = 9405052,ItemNum = 4,},
		[9] = {ItemID = 9405052,ItemNum = 5,},
		[10] = {ItemID = 9405052,ItemNum = 6,},		
	},
	Text = {
		StrLevel 	= "%d转"; 
		StrFull  	= "已满转";
		IsEnough	= "<font color='#FFFFFF'>%s</font>";								--物品充足
		IsNoEnough	= "<font color='#FF0000'>%s</font>";	--物品不足
		Describe 	= "获得方式：<br/><font color='#FFFFFF'>1.官方活动</font>";  -- 自动购买界面说明
		Rule 	    = "玩法说明<br/><font size='13'>1.坐骑转生需要坐骑达到一定的等级，转生后会获得属性加成<br/>2.转生后，坐骑的装备使用限制等级为当前坐骑的最高等级<br/>3.坐骑转生后可提高坐骑资质丹的服用上限，当坐骑转生次数达到3转、6转、9转可获得专属炫酷的转生特效</font>";    -- 规则说明
		IsNoCan1	= "请检查包裹内是否拥有足够的数量坐骑转生丹";           --物品不足	
		IsNoCan2	= "元宝不足";           --物品不足	
		IsNoCan3	= "礼金不足";           --物品不足	
		IsNoCan4	= "当前坐骑等级不满足转生条件";           --坐骑级别不足	
		IsNoCan5	= "坐骑转生需要坐骑升至八阶白虎开放";           --为满足坐骑转生的条件不能打开界面提示	
		IsNoCan6	= "当前坐骑已转生到最高境界";           --坐骑满转提示	
		StrNum      = "转生%d次";
		StrAttr     = "%d转加成";
		szProgressText = "坐骑%d次转生提升吃丹上限%d颗";
		szLevelText = "坐骑转生次数:%s次<br/>";
		starbroadcast = "恭喜玩家%s大侠成功将坐骑转生到%s转境界，战力更上一层楼！";
		IWantStr    = "我也试试!";
	},
	dwNum = 10;  --一键转生次数
	-----转生值配置表
	ChangeRankExpInfos = {
		[1] = 100,
		[2] = 100,
		[3] = 150,
		[4] = 150,
		[5] = 200,
		[6] = 200,
		[7] = 300,
		[8] = 300,
		[9] = 500,
		[10] = 700,		
	},
	PfxConfig = {
		[3] = 1,
		[6] = 2,
		[9] = 3,
	},
	--自动功能标志位
	IsAutoBuyflg = false;
};
---获取几转品阶限制 index 为第几转
function MountChangeRankConfig:GetMountChangeRankSectionLimit(index)
	if(not _G.MountChangeRankConfig.ConLimitInfos[index]) then
		return nil;
	end
	return _G.MountChangeRankConfig.ConLimitInfos[index].minSectionLimit;
end
----获取几转等级限制 index为第几转
function MountChangeRankConfig:GetMountChangeRankLevelLimit(index)
	if(not _G.MountChangeRankConfig.ConLimitInfos[index]) then
		return nil;
	end
	return _G.MountChangeRankConfig.ConLimitInfos[index].levelLimit;
end
----获取几转最大exp上限 index为第几转
function MountChangeRankConfig:GetMountChangeRankExpLimit(index)
	if(not _G.MountChangeRankConfig.ConLimitInfos[index]) then
		return nil;
	end
	return _G.MountChangeRankConfig.ConLimitInfos[index].expLimit;
end
----获取几转属性加成  index 为第几转
function MountChangeRankConfig:GetMountChangeRankAttrInfos(index)
	return _G.MountChangeRankConfig.ChangeRankInfos[index];
end
----获取几转最大吃资质丹上限 index为第几转
function MountChangeRankConfig:GetMountChangeRankMedItemLimit(index)
	if(not _G.MountChangeRankConfig.ChangeRankInfos[index]) then
		return nil;
	end
	return _G.MountChangeRankConfig.ChangeRankInfos[index].medItemLimit;
end
----获取几转消耗 index为第几转
function MountChangeRankConfig:GetMountChangeRankConsemInfos(index)
	if index >= #self.ConsumeInfos then
		index = #self.ConsumeInfos
	end
	return _G.MountChangeRankConfig.ConsumeInfos[index];
end
----获取一次的转生值
function MountChangeRankConfig:GetMountChangeRankExp(index)
    local crit = math.random(1,10000);
    local Exp  =  _G.MountChangeRankConfig.ChangeRankExpInfos[index]
 if  crit >= 9000 then
     Exp = Exp *8
 elseif crit >= 6000 then
     Exp = Exp * 2
 else 
    Exp = Exp *1
 end
	return Exp;
end
----获取一次的转生值 index为第几转
function MountChangeRankConfig:GetMountChangeRankPfx(index)
	local dwPfx = 0;
	local sy = 0;
	for k,v in pairs(_G.MountChangeRankConfig.PfxConfig) do
		if(index == k) then
			dwPfx = v;
			break
		elseif(index > k and sy < k) then
			dwPfx = v;
			sy = k
		end
	end
	return dwPfx;
end
----界面开启条件   dwGrade 当前坐骑阶数
function MountChangeRankConfig:CanOpenMountChange(dwGrade)
    if dwGrade >= 8 then 
		return true
	end
	return false
end
----获取当前坐骑转生降到的等级   dwGrade 当前坐骑阶数,dwRank 当前转数,dwLevel当前等级
function MountChangeRankConfig:GetMountMinLevel(dwGrade,dwRank,dwLevel)
	return dwLevel
end