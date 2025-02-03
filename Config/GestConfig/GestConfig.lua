--各章属性表
	--增加属性
	--dwHPMax	--生命max
	--dwMPMax	--内力max
	--dwAttack	--攻击
	--dwDefense --防御
	--dwFlee	--身法
	--dwCrit	--暴击
	--dwMoveSpeed   --移动速
	--dwMonsterAppend  --追加怪物伤害
	--dwBossAppend  --追加Boss伤害
	--dwAddSkillLevel  --无双技能提升等级
	--dwAttackSpeed    攻击速度
	--nFeiBossAppend 对非BOSS怪物的伤害
	
	
local  AttrData = {
	[1] = {dwAttack=1000,dwDefense=500,dwHPMax=5000,dwMPMax=100,dwCrit=40,dwFlee=30, dwMonsterAppend = 5, dwAttackSpeed=0,nFeiBossAppend=0, },	---武尊全章之初篇 属性加成
	[2] = {dwAttack=2000,dwDefense=1000,dwHPMax=10000,dwMPMax=200,dwCrit=80,dwFlee=60, dwMonsterAppend = 10, dwAttackSpeed=0,nFeiBossAppend=0, },	---武尊全章之成篇 属性加成
	[3] = {dwAttack=4000,dwDefense=2000,dwHPMax=20000,dwMPMax=400,dwCrit=160,dwFlee=120, dwMonsterAppend = 15, dwAttackSpeed=0,nFeiBossAppend=0, },	---武尊全章之会篇 属性加成
	[4] = {dwAttack=7000,dwDefense=3500,dwHPMax=35000,dwMPMax=700,dwCrit=280,dwFlee=210, dwMonsterAppend = 20, dwAttackSpeed=10,nFeiBossAppend=0, },	---武尊全章之纯篇 属性加成
	[5] = {dwAttack=11000,dwDefense=5500,dwHPMax=55000,dwMPMax=1100,dwCrit=440,dwFlee=330, dwMonsterAppend = 25, dwAttackSpeed=20,nFeiBossAppend=0, },	---武尊全章之萃篇 属性加成
	[6] = {dwAttack=16000,dwDefense=8000,dwHPMax=80000,dwMPMax=1600,dwCrit=640,dwFlee=480, dwMonsterAppend = 30, dwAttackSpeed=35,nFeiBossAppend=0, },	---武尊全章之雄篇 属性加成
	[7] = {dwAttack=22000,dwDefense=11000,dwHPMax=110000,dwMPMax=2200,dwCrit=880,dwFlee=660, dwMonsterAppend = 35, dwAttackSpeed=50,nFeiBossAppend=0, },	---武尊全章之深篇 属性加成
	[8] = {dwAttack=29000,dwDefense=14500,dwHPMax=145000,dwMPMax=2900,dwCrit=1160,dwFlee=870, dwMonsterAppend = 40, dwAttackSpeed=70,nFeiBossAppend=0, },	---武尊全章之极篇 属性加成
	[9] = {dwAttack=38000,dwDefense=19000,dwHPMax=190000,dwMPMax=3800,dwCrit=1520,dwFlee=1140, dwMonsterAppend = 50, dwAttackSpeed=90,nFeiBossAppend=0, },	---武尊全章之真篇 属性加成
};
--满级后添加属性
local AddAttr = {dwAttack=24000,dwDefense=12000,dwHPMax=120000,dwMPMax=2400,dwCrit=960,dwFlee=720, dwMonsterAppend = 0, dwAttackSpeed=0,nFeiBossAppend=0,};
--valUp每次修复进度
--valMax修复进度上限
local RemitData = {
	[1] = { valUp=100,valMax=500 },---武尊全章之初篇 属性加成
	[2] = { valUp=100,valMax=1000 },---武尊全章之成篇 属性加成
	[3] = { valUp=125,valMax=2000 },---武尊全章之会篇 属性加成
	[4] = { valUp=150,valMax=3500 },---武尊全章之纯篇 属性加成
	[5] = { valUp=200,valMax=5500 },---武尊全章之萃篇 属性加成
	[6] = { valUp=250,valMax=8000 },---武尊全章之雄篇 属性加成
	[7] = { valUp=250,valMax=11000 },---武尊全章之深篇 属性加成
	[8] = { valUp=250,valMax=14500 },---武尊全章之极篇 属性加成
	[9] = { valUp=300,valMax=19000 },---武尊全章之真篇 属性加成
};

_G.GestBasicConfig = 
{    
	--武尊全章
	[1] = {
		name = "武尊全章之初篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 3}, {dwEnumId = 2500100, dwNum = 10},{dwEnumId = 2500101, dwNum = 5}},
		--领悟消耗真气以及物品
		--dwEnumId = 0 没有物品消耗
		RealizeNeed = { nZhenqi=50000 , dwEnumId =0 ,dwNum = 1};
		
		--需开启某实战
		BournLevel = 6,   --开启深
		--当前等级修复总值
		BuildValue = RemitData[1].valMax;
		--每次修复进度
		Value = RemitData[1].valUp;
		--下一等级
		nextLevel = 2,
		--领悟成功率
		SuccessRate = 9000;
		--武尊全章显示头像配置
		ShowText = 27;
	},
		--武尊全章
	[2] = {
		name = "武尊全章之成篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 5}, {dwEnumId = 2500100, dwNum = 5},{dwEnumId = 2500101, dwNum = 10},{dwEnumId = 2500102, dwNum = 5}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi=50000 , dwEnumId =0 ,dwNum = 1};
		--需开启某实战
		BournLevel = 6,
		--当前等级修复总值
		BuildValue = RemitData[2].valMax;
		--下一等级
		nextLevel = 3,
		--领悟成功率
		SuccessRate = 8000;
		--武尊全章显示头像配置
		ShowText = 28;
	},
	[3] = {
		name = "武尊全章之会篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 8}, {dwEnumId = 2500101, dwNum = 5},{dwEnumId = 2500102, dwNum = 15},{dwEnumId = 2500103, dwNum = 10}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi=50000 , dwEnumId =2500051 ,dwNum = 1};
		--需开启某实战
		BournLevel = 6,
		--当前等级修复总值
		BuildValue = RemitData[3].valMax;
		--下一等级
		nextLevel = 4,
		--领悟成功率
		SuccessRate = 7000;
		--武尊全章显示头像配置
		ShowText = 29;
	},
	[4] = {
		name = "武尊全章之纯篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 12}, {dwEnumId = 2500102, dwNum = 5},{dwEnumId = 2500103, dwNum = 15},{dwEnumId = 2500104, dwNum = 10}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi=50000 , dwEnumId =2500051 ,dwNum = 1};
		--需开启某实战
		BournLevel = 6,
		--当前等级修复总值
		BuildValue = RemitData[4].valMax;
		--下一等级
		nextLevel = 5,
		--领悟成功率
		SuccessRate = 6000	;
		--武尊全章显示头像配置
		ShowText = 30;
	},
	[5] = {
		name = "武尊全章之萃篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 16}, {dwEnumId = 2500103, dwNum = 10},{dwEnumId = 2500104, dwNum = 20},{dwEnumId = 2500105, dwNum = 15}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi=80000 , dwEnumId =2500051 ,dwNum = 2};
		--需开启某实战
		BournLevel = 6,
		--当前等级修复总值
		BuildValue = RemitData[5].valMax;
		--下一等级
		nextLevel = 6,
		--领悟成功率
		SuccessRate = 5000;
		--武尊全章显示头像配置
		ShowText = 31;
	},
	[6] = {
		name = "武尊全章之雄篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 20}, {dwEnumId = 2500104, dwNum = 10},{dwEnumId = 2500105, dwNum = 20},{dwEnumId = 2500106, dwNum = 15}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi=80000 , dwEnumId =2500051 ,dwNum = 2};
		--需开启某实战
		BournLevel = 6,
		--当前等级修复总值
		BuildValue = RemitData[6].valMax;
		--下一等级
		nextLevel = 7,
		--领悟成功率
		SuccessRate = 4000;
		--武尊全章显示头像配置
		ShowText = 32;
	},
	[7] = {
		name = "武尊全章之深篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 30}, {dwEnumId = 2500105, dwNum = 15},{dwEnumId = 2500106, dwNum = 25},{dwEnumId = 2500107, dwNum = 20}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi=100000 , dwEnumId =2500051 ,dwNum = 3};
		--需开启某实战
		BournLevel = 7,
		--当前等级修复总值
		BuildValue = RemitData[7].valMax;
		--下一等级
		nextLevel = 8,
		--领悟成功率
		SuccessRate = 3000;
		--武尊全章显示头像配置
		ShowText = 33;
	},
	[8] = {
		name = "武尊全章之极篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 40}, {dwEnumId = 2500106, dwNum = 15},{dwEnumId = 2500107, dwNum = 25},{dwEnumId = 2500108, dwNum = 20}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi=100000 , dwEnumId =2500051 ,dwNum = 3};
		--需开启某实战
		BournLevel = 8,
		--当前等级修复总值
		BuildValue = RemitData[8].valMax;
		--下一等级
		nextLevel = 9,
		--领悟成功率
		SuccessRate = 2500;
		--武尊全章显示头像配置
		ShowText = 34;
	},
	[9] = {
		name = "武尊全章之真篇",   --名称
		--修复消耗道具
		ReBuildMaterial = {{dwEnumId = 2500050, dwNum = 60},{dwEnumId = 2500105, dwNum = 5},{dwEnumId = 2500106, dwNum = 10},{dwEnumId = 2500107, dwNum = 20},{dwEnumId = 2500108, dwNum = 30}},
		--领悟消耗真气以及物品
		RealizeNeed = { nZhenqi = 150000 , dwEnumId = 2500051 ,dwNum = 5};
		--需开启某实战
		BournLevel = 9,
		--当前等级修复总值
		BuildValue = RemitData[9].valMax;
		--下一等级
		nextLevel = 0,
		--领悟成功率
		SuccessRate = 2000;
		--武尊全章显示头像配置
		ShowText = 35;
	},
}
--实战达到实战深等级开启全章
_G.GestAuthorityLevel = 6;


_G.GestDataConfig = {
     
    Text={ 	
			Textfig       ="修复材料不足";   --武尊  修复材料不足
			ZhenqiTextfig ="所需所有真气不足";  --所需所有真气不足
			NoSuc         ="领悟未成功";  --领悟未成功
			TipsAttr      = "已加成属性";--已加成属性
			Tips          = "达【深不可测】境界后开启";--达【深不可测】境界后开启
			zhenqi        = "所需每种真气:%s";
			SuccRate      = "成   功   率:%s";
			IsNoCan1      = "领悟物品不足"; --领悟物品不足
			IsNoCan2      = "实战境界不足，实战境界要≥武尊全章境界才能修复。";
			IsEnough		= "<font color='#FFFFFF'>%s</font>";								--物品充足
			IsNoEnough		= "<font color='#FF0000'>%s</font>";	--物品不足
			MaxTips       = "<p><font size='16' color='#C56925'>至尊属性加成：</p>";
		};
	---------------------------------------------
	--武尊全章等级dwGestLevel
	
	--返回每章的加成属性
	AddProperty = function(dwGestLevel)
	--用到上面【AttrData】数据库
		return {AttrData[dwgestlevel]};
	end;
	
	--返回修复增加值
	AddProgress = function(dwGestLevel, dwGestProgress)  --武尊全章等级,进度
		return RemitData[dwGestLevel].valUp;
	end;
	
	--武尊全章增加战斗力
	AddFigthValue = function(dwLevel, dwGestLevel)  --人物等级及武尊全章等级
		local dwRsl=0
		dwRsl=dwRsl+(AttrData[dwGestLevel].dwHPMax or 0)*EquipGradeConfig.dwHPMax
		dwRsl=dwRsl+(AttrData[dwGestLevel].dwMPMax or 0)*EquipGradeConfig.dwMPMax
		dwRsl=dwRsl+(AttrData[dwGestLevel].dwAttack or 0)*EquipGradeConfig.dwAttack
		dwRsl=dwRsl+(AttrData[dwGestLevel].dwDefense or 0)*EquipGradeConfig.dwDefense
		dwRsl=dwRsl+(AttrData[dwGestLevel].dwFlee or 0)*EquipGradeConfig.dwFlee
		dwRsl=dwRsl+(AttrData[dwGestLevel].dwCrit or 0)*EquipGradeConfig.dwCrit
		return math.floor(dwRsl/5)*5;
	end;

--[[
   [ \brief 获取属性进度值 ,跟属性总进度值
   [ \param nLevel  	当前等级
   [ \param nSerRepair   服务器传进来的修复进度 
   [ \return table 返回属性表   以及属性总表
   ]]
	GetPropertyProgress = function(nLevel,nSerRepair)
		local tProgress = {};
		local nMin = 0;
		local tMin = {};
		local tAdd = nil;
		if nLevel > 1 then
			nMin = RemitData[nLevel-1].valMax
			tMin = AttrData[nLevel-1]
		end
		local nPer  = (nSerRepair - nMin)/ (RemitData[nLevel].valMax - nMin)
		local tAll = AttrData[nLevel]
		for k, v in pairs(tAll) do
			local nAdd = tMin[k] or 0
			tProgress[k] = math.floor(nPer * (v - nAdd))+ nAdd			
			if "dwMonsterAppend" == k then
				tProgress[k] = string.format("%.2f",nPer * (v - nAdd)+ nAdd)	
			end
		end
		local nMax = GestBasicConfig[#GestBasicConfig].BuildValue
		if nSerRepair == nMax then
			tAdd = AddAttr
		end
		return tProgress,tAll,tAdd;
	end
	
}
-- 属性名文本映射
local setNameToString = 
{	
	dwAttack = " 攻    击:";
	dwDefense=" 防    御:",
	dwHPMax=" 生命上限:",
	dwMPMax=" 内力上限:",
	dwCrit=" 暴    击:",
	dwFlee=" 身    法:",
	--dwMoveSpeed = "移动速度", 
	dwAddSkillLevel = "无双等级",
	dwMonsterAppend =" 怪物伤害:", 
	dwBossAppend = "boss伤害",
	dwAttackSpeed = " 攻击速度:",
	nFeiBossAppend = "对非BOSS怪物的伤害",
	
};

local GetPropertyText = function (dwID)
    local setText = {};
    for k, v in pairs(AttrData[dwID]) do
		if v > 0 then
			setText[k] = setNameToString[k] or ""
		end
    end
    return setText;
end

_G.GestDesConfig = {
    ["tabname"] = {
        [1] = "img://qz_bt_chu.png",
        [2] = "img://qz_bt_cheng.png",
        [3] = "img://qz_bt_hui.png",
		[4] = "img://qz_bt_chun.png",
		[5] = "img://qz_bt_cui.png",
		[6] = "img://qz_bt_xiong.png",
		[7] = "img://qz_bt_shen.png",
		[8] = "img://qz_bt_ji.png",
		[9] = "img://qz_bt_zhen.png",		
    },
	["history"] = {
		[1] = "</p>武尊全章之初篇所载出自街头斗殴技巧，经地痞混混口口相传，简单粗暴，不失实用，但其中多有阴险猥琐的招数，故少为正道之士所用。</p>",
		[2] = "</p>武尊全章之成篇所载出自山林搏击之术，经绿林好汉总结演化，威猛刚强，大开大阖，不过缺陷明显，不堪大器。</p>",
		[3] = "</p>武尊全章之会篇所载出自行伍操练之法，经军中将士整理辑录，朴实无华，只取要害，但颇为死板，尚欠变通，难归上乘之属。</p>",
		[4] = "</p>武尊全章之纯篇所载出自江湖对战套路，经各门各派去芜存菁，于招式套路一道，已无可出其右者。</p>",
		[5] = "</p>武尊全章之萃篇所载出自无名氏之手，实为其一生功法之精髓，但流传隐秘，唯有机缘匪浅之人，方能得见。</p>",
		[6] = "</p>武尊全章之雄篇所载据传乃是黄裳作《九阴真经》时，未录之遗稿，虽比《九阴真经》正篇有不及之处，仍是武林中人梦寐以求的典籍，但得一观，此生无憾。</p>",
		[7] = "</p>武尊全章之深篇乃从少林流出，不知究竟何人所作，若为普通人所得，不过可以强身健体，但若落入得道之人手中，便见字字珠玑，句句切中要害，研而习之，必有脱胎换骨之感。</p>",
		[8] = "</p>武尊全章之极篇所载出自大内秘藏宝册，登峰造极的修为早已不桎梏于招式，而在于“悟”，此篇正是为你指明“悟”的方向。</p>",
		[9] = "</p>武尊全章之真篇只存在于江湖传说之中，当今世上无人得窥究竟，然而那些领悟了真篇绝学后得以名垂青史的绝世高人，却无时不在提醒着，真篇……绝不仅仅只是个传说。</p>",
		},
    ["property"] = {
        [1] = GetPropertyText(1);
        [2] = GetPropertyText(2);
        [3] = GetPropertyText(3);
		[4] = GetPropertyText(4);
        [5] = GetPropertyText(5);
        [6] = GetPropertyText(6);
		[7] = GetPropertyText(7);
        [8] = GetPropertyText(8);
        [9] = GetPropertyText(9);
		-- [10] = GetPropertyText(10);
		-- [11] = GetPropertyText(11);
    },
	--图标显示配置
	["tabicon"] ={
		[1] = "img://qz_01_logo.png";
		[2] = "img://qz_02_logo.png";
		[3] = "img://qz_03_logo.png";
		[4] = "img://qz_04_logo.png";
		[5] = "img://qz_05_logo.png";
		[6] = "img://qz_06_logo.png";
		[7] = "img://qz_07_logo.png";
		[8] = "img://qz_08_logo.png";
		[9] = "img://qz_09_logo.png";
	};
	--至尊属性TIPS颜色
	strAttr = {
		dwAttack = "<font color='#FFFF00'>攻    击:+%d";
		dwDefense="<font color='#FFFF00'>防    御:+%d",
		dwHPMax="<font color='#FFFF00'>生命上限:+%d",
		dwMPMax="<font color='#FFFF00'>内力上限:+%d",
		dwCrit="<font color='#FFFF00'>暴    击:+%d",
		dwFlee="<font color='#FFFF00'>身    法:+%d",
		dwAddSkillLevel = "<font color='#FFFF00'>无双等级:+%d",
		dwMonsterAppend ="<font color='#FFFF00'>怪物伤害:+%d", 
		dwBossAppend = "<font color='#FFFF00'>boss伤害:+%d",
		dwAttackSpeed = "<font color='#FFFF00'>攻击速度:+%d",
		nFeiBossAppend = "<font color='#FFFF00'>对非BOSS怪物的伤害:+%d",
	};
	--属性显示顺序
	ShunXu = {"dwHPMax";"dwMPMax","dwAttack","dwDefense","dwCrit","dwFlee","dwMonsterAppend","dwAttackSpeed",};
    GetShuXingName = function (objSystem, dwID)
        if objSystem:bIsLingWu(dwID) then
            return "精华属性(已领悟)";
        else
            return "精华属性(未领悟)";
        end
    end;
    GetProgressBarValue = function (objSystem, dwID)
        return {
            [1] = 10;
            [2] = 100;
        };
    end
	
}

-- 运功配置
_G.GestYunGongLingWuConfig = {
    -- 人物动作编号
    dwPlayerActionID = 11;
    -- 进度时间
    dwProgressBarTime = 7500;
    -- 停止时处理编号
    dwEffectConfigID = 100;
};

-- 特效配置
_G.GestPfxConfig = {
	-- 特效编号
    dwPfxID = 61013;
	dwJInID = 61014;
	-- 特效播放位置
    strPlace = "FeetPoint";
};



