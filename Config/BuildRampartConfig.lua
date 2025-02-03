_G.BuildConfig = {
	["totalContri"] = 35000;  --总的捐献值
	["des"] = "◎ 初始修复度为0，玩家通过捐献<font color='#FF0000'>劳力、木材、石料</font>分别提升<font color='#FF0000'>5、8、10</font>点修复度，材料<font color='#FF0000'>30级以上怪物和怪物攻城活动中都有几率掉落</font><br>◎ 每种材料每天前 <font color='#FF0000'>20</font>次捐献都会获得丰厚的经验奖励<font color='#FF0000'>等级越高经验奖励就越高</font><br>◎ 修复度到达指定<font color='#FF0000'>百分比</font>时，可<font color='#FF0000'>开启宝箱</font>，一定几率开出<font color='#FF0000'>商城道具</font><br>◎ 城墙修复完毕后 ，全服获得<font color='#FF0000'>1小时5倍经验</font> ，<font color='#FF0000'>1小时</font>后修复值<font color='#FF0000'>归0</font>",  --活动描述
	--劳力，木材，石料等tooltips
	["toolTips"] = {
		[1] = "      <font color='#FFFFFF'>捐献劳力    <br><br>每次捐献劳力增加 <font color='#00FF00'>5</font>点<br>城墙修复度，每天前<font color='#00FF00'>20</font><br>次捐献可获得经验奖励<br><br>捐献消耗：<font color='#00FF00'>无</font>  <br>捐献奖励：<font color='#00FF00'>%d</font>经验<br>捐献CD:<font color='#00FF00'>%d</font>分钟<br><br><br> 已捐献次数：<font color='#FF0000'>%d</font>次</font> ",  --劳力图标描述
		[2] = "      <font color='#FFFFFF'>捐献木材    <br><br>每次捐献劳力增加 <font color='#00FF00'>8</font>点<br>城墙修复度，每天前<font color='#00FF00'>20</font><br>次捐献可获得经验奖励<br><br>捐献消耗：<font color='#00FF00'>木材</font><br>材料产出：<font color='#00FF00'>30级以上怪物和<br>          怪物攻城活动中<br>          有几率掉落</font><br>捐献奖励：<font color='#00FF00'>%d</font>经验<br>捐献CD:<font color='#00FF00'>15</font>分钟<br><br><br> 已捐献次数：<font color='#FF0000'>%d</font>次</font> ",  --木材图标描述
		[3] = "      <font color='#FFFFFF'>捐献石料    <br><br>每次捐献劳力增加<font color='#00FF00'>10</font>点<br>城墙修复度，每天前<font color='#00FF00'>20</font><br>次捐献可获得经验奖励<br><br>捐献消耗：<font color='#00FF00'>石料</font><br>材料产出：<font color='#00FF00'>30级以上怪物和<br>          怪物攻城活动中<br>          有几率掉落</font><br>捐献奖励：<font color='#00FF00'>%d</font>经验<br>捐献CD:<font color='#00FF00'>15</font>分钟<br><br><br> 已捐献次数：<font color='#FF0000'>%d</font>次</font> ",  --劳力图标描述
	},
	["LabourPng"] = "ZZCC-ChuiZi.png",  --劳力图片
	["WoodPng"] = "ZZCC-MuCai.png",    --木材图片
	["StonePng"] = "ZZCC-ShiTou.png",   --石料图片
	--消耗道具
	["UseItemTbl"] = {
		[1] = 0,
		[2] = 4902001,
		[3] = 4902002,
	},
	--劳力，木材，石料对应的cd时间，单位分钟
	["CDInfo"] = {     
		[1] = 30,
		[2] = 15,
		[3] = 15,
	};
	--劳力，木材，石料对应的累积cd时间，单位分钟
	["AddCDInfo"] = {     
		[1] = 120,
		[2] = 120,
		[3] = 120,
	};
	
	--劳力，木材，石料清除cd时间，消耗的元宝
	["ClearCostMoney"] = {
		[1] = 3,
		[2] = 1.5,
		[3] = 1.5	
	},
	--劳力，木材，石料的捐献次数上限，0表示不限次数
	["ContriNum"] = {
		[1] = 20,
		[2] = 20,
		[3] = 20,
	},
	--劳力，木材，石料的每次捐献值
	["addContriNum"] = function (types)
		if types == 1 then
			return 5;
		elseif types == 2 then
			return 8;
		elseif types == 3 then
			return 10;
		end
	end;
	--劳力，木材，石料的每次捐献增加的经验，银两，真气
	["addContriAward"] = function (types, level)
		local expValue = 1000;
		local silverValue = 0;
		local zhenqiValue = 0;
		if types == 1 then
			expValue = math.floor(_G.RoleUpLevelConfig[level].dwTaskExpHuan * 0.3);
			silverValue = 0;
			zhenqiValue = 0;
		elseif types == 2 then
			expValue = math.floor(_G.RoleUpLevelConfig[level].dwTaskExpHuan * 0.55);
			
			
			silverValue = 0;
			zhenqiValue = 0;
		elseif types == 3 then
			expValue = math.floor(_G.RoleUpLevelConfig[level].dwTaskExpHuan * 0.9);
			silverValue = 0;
			zhenqiValue = 0;
		end
		return expValue, silverValue, zhenqiValue;
	end;
	--捐献5个阶段的图片， closePng未打开，png打开， mainSize面板中央图片大小， size进度条上图片大小， value:对应百分比， dwDropId为掉落组id
	["pngInfo"] = {
		[1] = {closePng = "Qita_fb_mu_close.png", png = "Qita_fb_mu_open.png", mainSize = 64, size = 32, value = 20, dwDropId = 991003},
		[2] = {closePng = "Qita_fb_yin_close.png", png = "Qita_fb_yin_open.png", mainSize = 64, size = 32, value = 40, dwDropId = 991002},
		[3] = {closePng = "Qita_fb_yin_close.png", png = "Qita_fb_yin_open.png", mainSize = 64, size = 32, value = 60, dwDropId = 991002},
		[4] = {closePng = "Qita_fb_jin_close.png", png = "Qita_fb_jin_open.png", mainSize = 64, size = 32, value = 80, dwDropId = 991001},
		[5] = {closePng = "Qita_fb_jin_close.png", png = "Qita_fb_jin_open.png", mainSize = 64, size = 32, value = 100, dwDropId = 991001},
	};
	--城墙对应的五个阶段的图片
	["RampartPngInfo"] = {	
		[0] = "ChengQiang-00.png",
		[1] = "ChengQiang-01.png",
		[2] = "ChengQiang-02.png",
		[3] = "ChengQiang-03.png",
		[4] = "ChengQiang-04.png",
		[5] = "ChengQiang-05.png",
	},
	--五个阶段对应的百分比
	["rate"] = {
		[1] = 0.2,
		[2] = 0.4,
		[3] = 0.6,
		[4] = 0.8,
		[5] = 1.0,
	},
	--刷新按钮CD时间 单位分钟
	["RefreshTime"] = 0.1; --刷新按钮CD
	--捐献满值后刷新时间 单位小时
	["ClearContri"] = 1;  --捐献满值3小时后清除
	["ContriExp"] = 1;    --5倍经验时长-单位小时
	["defaultPng"] = "Qita_fb_hui_close.png",  --新号默认图片
}
--1为元宝，2为礼金（副本用）
_G.WasteType = 1;
--1为元宝，2为礼金, 3为银两
_G.RampartWasteType = 1;

