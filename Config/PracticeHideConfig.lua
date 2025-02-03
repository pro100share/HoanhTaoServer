--[[
功能：修行隐藏属性配置文件
时间：2014-01-20
]]

_G.PracticeHideBaseConfig = {
	AttrInfos = {
		[1] = {dwAttack=1000,dwDefense=500,dwHPMax=5000,dwMPMax=100},
		[2] = {dwAttack=2000,dwDefense=1000,dwHPMax=10000,dwMPMax=200},
		[3] = {dwAttack=3000,dwDefense=1500,dwHPMax=15000,dwMPMax=300},
		[4] = {dwAttack=5000,dwDefense=2500,dwHPMax=25000,dwMPMax=500},
		[5] = {dwAttack=7000,dwDefense=3500,dwHPMax=35000,dwMPMax=700},
		[6] = {dwAttack=10000,dwDefense=5000,dwHPMax=50000,dwMPMax=1000},
		[7] = {dwAttack=13000,dwDefense=6500,dwHPMax=65000,dwMPMax=1300},
		[8] = {dwAttack=17000,dwDefense=8500,dwHPMax=85000,dwMPMax=1700},
		[9] = {dwAttack=22000,dwDefense=11000,dwHPMax=110000,dwMPMax=2200},
		[10] = {dwAttack=28000,dwDefense=14000,dwHPMax=140000,dwMPMax=2800},
	},

	ConInfos = {
		[1] = {ItemID = 5806006 ,ItemNum = 50 },
		[2] = {ItemID = 5806006 ,ItemNum = 80 },
		[3] = {ItemID = 5806006 ,ItemNum = 120 },
		[4] = {ItemID = 5806006 ,ItemNum = 180 },
		[5] = {ItemID = 5806006 ,ItemNum = 260 },
		[6] = {ItemID = 5806006 ,ItemNum = 360 },
		[7] = {ItemID = 5806006 ,ItemNum = 480 },
		[8] = {ItemID = 5806006 ,ItemNum = 620 },
		[9] = {ItemID = 5806006 ,ItemNum = 780 },
		[10] = {ItemID = 5806006 ,ItemNum = 980 },
	},
	----开放阶段
	OpenProgress = 12;
	Shunxu = {"dwHPMax";"dwMPMax";"dwAttack";"dwDefense";}; --属性顺序显示
	ProperyName 	= { 																--TIPS属性字符串
				dwHPMax 		= "生命 + %d";
				dwMPMax 		= "内力 + %d";
				dwAttack 		= "攻击 + %d"; 
                dwDefense 		= "防御 + %d";
                
			};
	Text = 
			{
				LabelTips1 = "<font color='#FF6100'>当前属性加成</font>";
				LabelTips2 = "<font color='#DCDCDC'>下级激活需要服用%s（%s）</font><br><font color='#FF6100'>下级属性加成</font>";
				LabelTips3 = "<font color='#FF6100'>当前属性加成（已满级）</font>";
				LabelTips4 = "未激活"; --被查看属性未激活
				IsNoCan1  = "隐藏修行属性已满级"; -- 隐藏属性已满级
				IsNoCan2  = "需领悟第十二册后才能开放此功能"; -- 需激活第十二册后才能点击此功能
				IsNoCan3  = "物品不足"; -- 物品不足
				Label     = "<font color='#00FF00'>隐藏修行属性（%s）</font>";
				IsEnough		= "<font color='#FFFFFF'>%s</font>";								--物品充足
				IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足
			};
}

-----获取等级隐藏属性 level 为等级
function PracticeHideBaseConfig:GetPraHideAttr(level)
	if(not PracticeHideBaseConfig.AttrInfos[level]) then
		return nil;
	end
	return PracticeHideBaseConfig.AttrInfos[level];
end
----获取等级消耗
function PracticeHideBaseConfig:GetPraHideCons(level)
	if(not PracticeHideBaseConfig.ConInfos[level]) then
		return nil;
	end
	return PracticeHideBaseConfig.ConInfos[level];
end
----获取开放隐藏属性阶段
function PracticeHideBaseConfig:GetHideAttrOpenProg()
	return PracticeHideBaseConfig.OpenProgress;
end