
--群侠类型
_G.QunXiaTypeEnum = 
{
	NPC 	= 1;
	Monster	= 2;
};

--挑战群侠配置文件
_G.QunXiaListConfig = 
{
	--[人物Id] =={头像图片,未激活图片,名字,称谓,最大挑战次数,群侠类型,进入副本Id,需要威望等级,挑战需要消耗材料,挑战成功奖励物品{物品Id(礼包)=奖励物品类型（对应QunXiaAwardList）}}
	[20002001] = {szFile="qxtz_lulu_1.png",grayFile="qxtz_lulu_0.png",Name="卢鹭",Title="童叟无欺",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6001, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002002] = {szFile="qxtz_xiaowei_1.png",grayFile="qxtz_xiaowei_0.png",Name="晓薇",Title="人小鬼大",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6002, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002003] = {szFile="qxtz_liuyu_1.png",grayFile="qxtz_liuyu_0.png",Name="刘雨",Title="辣姑子",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6003, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002004] = {szFile="qxtz_nanxiaoyun_1.png",grayFile="qxtz_nanxiaoyun_0.png",Name="南筱芸",Title="精算盘",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6004, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002005] = {szFile="qxtz_genan_1.png",grayFile="qxtz_genan_0.png",Name="戈楠",Title="老实人",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6005, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002006] = {szFile="qxtz_yangfeng_1.png",grayFile="qxtz_yangfeng_0.png",Name="杨锋",Title="铁奴",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6006, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002007] = {szFile="qxtz_zhangbo_1.png",grayFile="qxtz_zhangbo_0.png",Name="章博",Title="无所不知",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6007, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002008] = {szFile="qxtz_zhoujingheng_1.png",grayFile="qxtz_zhoujingheng_0.png",Name="周静恒",Title="巧手娇娃",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6008, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002009] = {szFile="qxtz_ouyaqi_1.png",grayFile="qxtz_ouyaqi_0.png",Name="欧雅琪",Title="药到命除",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6009, needPrestigeLevel = 1, needItem = {},awardItem = {[5500450] = 1,},},
	[20002010] = {szFile="qxtz_guangping_1.png",grayFile="qxtz_guangping_0.png",Name="广平禅师",Title="苦乐行者",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6010, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 2,},},
	[20002011] = {szFile="qxtz_cuiming_1.png",grayFile="qxtz_cuiming_0.png",Name="崔命",Title="断魂刀",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6011, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 2,},},
	[20002012] = {szFile="qxtz_renlieshan_1.png",grayFile="qxtz_renlieshan_0.png",Name="任烈山",Title="青面鬼",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6012, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 2,},},
	[20002013] = {szFile="qxtz_gongbeihua_1.png",grayFile="qxtz_gongbeihua_0.png",Name="宫北烨",Title="白面书生",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6013, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 2,},},
	[20002014] = {szFile="qxtz_liyingqiu_1.png",grayFile="qxtz_liyingqiu_0.png",Name="李颖秋",Title="妙舞娘子",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6014, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 2,},},
	[20002015] = {szFile="qxtz_shagu_1.png",grayFile="qxtz_shagu_0.png",Name="傻姑",Title="只过三招",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6015, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 2,},},
	[20002016] = {szFile="qxtz_tangsanmei_1.png",grayFile="qxtz_tangsanmei_0.png",Name="唐三妹",Title="暴雨梨花",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6016, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 1,},},
	[20002017] = {szFile="qxtz_qulinger_1.png",grayFile="qxtz_qulinger_0.png",Name="曲灵儿",Title="夺命清音",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6017, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 1,},},
	[20002018] = {szFile="qxtz_zhaxiduoji_1.png",grayFile="qxtz_zhaxiduoji_0.png",Name="扎西多吉",Title="铁棒喇嘛",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6018, needPrestigeLevel = 2, needItem = {},awardItem = {[5500450] = 1,},},
	[20002019] = {szFile="qxtz_yeshang_1.png",grayFile="qxtz_yeshang_0.png",Name="叶殇",Title="巨斧",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6019, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002020] = {szFile="qxtz_yantian_1.png",grayFile="qxtz_yantian_0.png",Name="阎天",Title="不是人",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6020, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002021] = {szFile="qxtz_dufengming_1.png",grayFile="qxtz_dufengming_0.png",Name="杜凤鸣",Title="人剑合一",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6021, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002022] = {szFile="qxtz_meiyoucai_1.png",grayFile="qxtz_meiyoucai_0.png",Name="梅有财",Title="阴阳妖师",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6022, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002023] = {szFile="qxtz_juese_1.png",grayFile="qxtz_juese_0.png",Name="绝色师太",Title="不观自在",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6023, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002024] = {szFile="qxtz_limochou_1.png",grayFile="qxtz_limochou_0.png",Name="李莫愁",Title="赤练仙子",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6024, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002025] = {szFile="qxtz_kai_1.png",grayFile="qxtz_kai_0.png",Name="岑凯",Title="玉探花",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6025, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002026] = {szFile="qxtz_pangyuan_1.png",grayFile="qxtz_pangyuan_0.png",Name="庞塬",Title="武疯子",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6026, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002027] = {szFile="qxtz_dai_1.png",grayFile="qxtz_dai_0.png",Name="黛绮丝",Title="紫衫龙王",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6027, needPrestigeLevel = 3, needItem = {},awardItem = {[5500450] = 1,},},
	[20002028] = {szFile="qxtz_xiexun_1.png",grayFile="qxtz_xiexun_0.png",Name="谢逊",Title="金毛狮王",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6028, needPrestigeLevel = 4, needItem = {},awardItem = {[5500450] = 1,},},
	[20002029] = {szFile="qxtz_yangguo_1.png",grayFile="qxtz_yangguo_0.png",Name="杨过",Title="西狂",maxChallengeCount = 3, qunXiaType = _G.QunXiaTypeEnum.Monster, duplID = 6029, needPrestigeLevel = 4, needItem = {},awardItem = {[5500450] = 1,},},

};

_G.QunXiaBroadConfig = 
{
	DuplIDList = 
	{
		6001,
		6002,
		6003,
		6004,
		6005,
		6006,
		6007,
		6008,
		6009,
		6010,
		6011,
		6012,
		6013,
		6014,
		6015,
	};
	
	IsNeedBoradCast = function(dwDuplID)
		for k, v in pairs(_G.QunXiaBroadConfig.DuplIDList) do 
			if v == dwDuplID then return true end;
		end
		return false;
	end
};

--挑战群侠奖励物品
_G.QunXiaAwardList = {
	[1] = {
		4902009,3900050,5809334,5809335,2500069,5809365,5809367,4100420,4100400,5950001,5950002,5950003,5950030,5809524,5500081,4100450,5500450
	};
	[2] = {
	    5809367,4100420,4100400,5500081,4100430,4100450,4100410,2500331,5950030,5950001,5950002,5950003,5809365,5809524,9701013,9701014,5500450
	};
	[3] = {
	};
	[4] = {
	};
	[5] = {
	};
};