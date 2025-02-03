--聊天系统配置文件

--敏感符号表
_G.SensitiveCharacters = {
	"%,", "%.", "%(", "%)", "%%", "%+", "%-", "%*", "%?", "%[", "%^", "%$","% ","%/",'"',"\\",'"',"　","\r","\n","\b","\f","\t","\\","'","&","=","：","；",

};

--聊天信息保存的结构，也用于消息从服务端发送到客户端
_G.SChatMessage = {};
function SChatMessage:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--记录消息发送发送者的ID
	obj.dwMessageID = 0;	--记录消息的ID，ID属于发送者
	obj.strSender = "";		--记录消息发送者的名称
	obj.dwSendVip = 0;			--0不是VIP，1是VIP
	obj.strSendTo = "";		--记录消息发送的对象，如果SendToID是0，服务端则使用这个值进行搜索
	obj.dwSendTo = 0;		--记录消息接受者的ID
	obj.dwRecvVip = 0;			--0不是VIP，1是VIP
	obj.dwTime = 0;			--记录消息发送的时间，以服务器时间为准
	obj.dwChannel = 0;		--消息发送的频道
	obj.strText = "";		--消息的字符串
	obj.Items = {};			--保存传送的物品列表，key是dwItemID，value是SItemMessage对象，数据库中并不保存这个信息
	obj.Mounts = {};		--保存传送的坐骑列表，key是dwID，value是坐骑名字和颜色
	obj.Booth = {};			--保存传送的摊位列表，key是dwRoleID，value是名字
	return obj;
end
--系统公告保存的信息结构
_G.SSystemNotice = {};
function SSystemNotice:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--记录消息发送发送者的ID
	obj.strSender = "";		--记录消息发送者的名称
	obj.dwSendVip = 0;			--0不是VIP，1是VIP
	obj.dwChannel = 7;		--所属频道
	obj.dwMessageID = 0;	--通知的ID
	obj.strText = "";		--通知信息
	obj.htmlText = nil;		--超链接文字和回调函数的表1是text，2是function
	obj.dwTime = 0;			--收到通知的时间
	return obj;
end
--网络传输结构，用于从客户端发送消息到服务端
_G.SChatMessageNet = {};
function SChatMessageNet:new( t )
	local obj = t or {};
	obj.strSender = "";		--记录消息发送者的名称
	obj.strSendTo = "";		--记录消息发送的对象，如果SendToID是0，服务端则使用这个值进行搜索
	obj.dwSendTo = 0;		--记录消息接受者的ID
	obj.dwChannel = 0;		--消息发送的频道
	obj.strText = "";		--消息的字符串
	obj.Items = {};			--保存传送的物品列表，key是dwItemID，value是dwItemID，需要在服务端替换成具体的物品信息
	return obj;
end
--申请向服务端发送一条私聊，因为私聊的
--聊天频道的定义
_G.enChatChannel = {
	eAll = 0,				--综合频道
	eNearby = 1,			--附近
	ePrivate = 2,			--私聊
	eTeam = 3,				--队伍
	eFaction = 4,			--帮派
	eLine = 5,				--同一条线，世界频道
	eTrumpet = 6,			--喇叭，全服接收
	eNotice = 7,			--系统通知
	eGongGao = 8,			--公告
};

--聊天消耗银币
_G.enChatCost = 
{
	[5] = 
	{
		dwMoney = 0;
		dwMP = 1000;--这里是百分比值，计算时会除以10000，例如，100就是1%，
	};
	
	[1] = 
	{
		dwMoney = 0;
		dwMP = 500;--这里是百分比值，计算时会除以10000，例如，100就是1%，
	};
}

--聊天频道权限
_G.ChannelAuthority = 
{
	[enChatChannel.eLine] = "LTShiJie";
	[enChatChannel.eTrumpet] = "LaBaHanHua";	
}

--聊天的时间间隔设置
_G.ChannelLimited = {
	InputLimited = 72;---聊天输入框的长度限制
	dwTrumpetTime = 2000;--喇叭显示的时间，在有很多喇叭等待显示的时候使用
	dwTrumpetLastTime = 120*1000;---如果没有其它喇叭，那么喇叭消息延长的时间
	LimitedChatTime = 5*1000;--禁言时间
	LineLimited = 20;--世界频道发言等级限制
	--附近频道
	[enChatChannel.eNearby] = {
		GapTime = 0.6*1000, MaxNum = 2;--发言间隔，间隔内最多发言次数
	};
	--私聊频道
	[enChatChannel.ePrivate] = {
		GapTime = 0.6*1000, MaxNum = 2;--发言间隔，间隔内最多发言次数
	};
	--队伍
	[enChatChannel.eTeam] = {
		GapTime = 0.6*1000, MaxNum = 2;--发言间隔，间隔内最多发言次数
	};
	--世家
	[enChatChannel.eFaction] = {
		GapTime = 2*1000, MaxNum = 2;--发言间隔，间隔内最多发言次数
	};
	--世界
	[enChatChannel.eLine] = {
		GapTime = 4*1000, MaxNum = 2;--发言间隔，间隔内最多发言次数
	};
		
	funcTrumpetTime = function(dwTrumpetNumber)
		if dwTrumpetNumber < 3  then
		    return 2000
		elseif dwTrumpetNumber < 6 then
		    return 1000
		elseif dwTrumpetNumber < 9 then
		    return 500
		else 
            return 50
		end;
	end;
};
--聊天频道对应的字体、颜色、大小信息；客户端消息最大保存的量
_G.ChatTextConfig = { 
	NameColor = "#95e8a9";--显示玩家名字的颜色
	ItemColor = "#2ff326";--显示物品链接的颜色------------废弃
	GongGaoColor = "#31cf32";--显示公告链接的颜色
	ErrorColor = "#eadc7b";--错误提示的颜色#7FFF00
	ForText = "对";	---
	YouText = "<font color='#dcd9d9'>你</font>"; ---
	SayText = "<font color='#dcd9d9'>：</font>";
	
--	SayText = "：";---
	[enChatChannel.eNearby] = { Name = "附近";
		Face = "黑体,宋体", Size = 14, Color = "#d9ccbd",--白色
		HeadColor = 0xd9ccbd, HeadEdgeColor = 0xd9ccbd, HeadSize = 0.5,
		ChatTextHead = "#d9ccbd";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
	[enChatChannel.ePrivate] = { Name = "私聊";
		Face = "黑体,宋体", Size = 14, Color = "#e082da",--紫色
		HeadColor = 0xe082da, HeadEdgeColor = 0xe082da, HeadSize = 0.5,
		ChatTextHead = "#e082da";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
	[enChatChannel.eTeam] = { Name = "队伍";
		Face = "黑体,宋体", Size = 14, Color = "#278cf1",--浅蓝色
		HeadColor = 0x278cf1, HeadEdgeColor = 0x278cf1, HeadSize = 0.5,
		ChatTextHead = "#278cf1";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
	[enChatChannel.eFaction] = { Name = "世家";
		Face = "黑体,宋体", Size = 14, Color = "#ff8273",--浅绿色
		HeadColor = 0xff8273, HeadEdgeColor = 0xff8273, HeadSize = 0.5,
		ChatTextHead = "#ff8273";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
	[enChatChannel.eLine] = { Name = "世界";
		Face = "黑体,宋体", Size = 14, Color = "#fed904",--黄色
		HeadColor = 0xfed904, HeadEdgeColor = 0xfed904, HeadSize = 0.5,
		ChatTextHead = "#fed904";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
	[enChatChannel.eTrumpet] = { Name = "喇叭";
		Face = "黑体,宋体", Size = 14, Color = "#DA70D6",--橙色
		HeadColor = 0xDA70D6, HeadEdgeColor = 0xDA70D6, HeadSize = 0.5,
		ChatTextHead = "#DA70D6";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
	[enChatChannel.eNotice] = {  Name = "系统";--系统字体和颜色
		Face = "黑体,宋体", Size = 14, Color = "#D41111",--红色
		HeadColor = 0xD41111, HeadEdgeColor = 0xD41111, HeadSize = 0.5,
		ChatTextHead = "#D41111";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
	[enChatChannel.eGongGao] = {  Name = "公告";--公告字体和颜色
		Face = "黑体,宋体", Size = 14, Color = "#CC0000",--红色
		HeadColor = 0xCC0000, HeadEdgeColor = 0xCC0000, HeadSize = 0.5,
		ChatTextHead = "#CC0000";--聊天头部文字显示的颜色
		Limited = 50;--客户端保存聊天数量限制
	};
};

--聊天的特殊人员标志
_G.ChatSplMem = 
{
	GM = 1;
	Teacher = 2;
};

--特殊人员聊天前置
_G.ChatSplMemberText = 
{
	[ChatSplMem.GM] = 
	{
		SplFlag = "<font color='#FF0000'>[GM]</font>";--特殊服务人员的名字标志
		-- SplPrivateColor = "'#dcd9d9'";--特殊服务人员私聊的颜色
		-- SplTrumpetColor = "'#dcd9d9'";--特殊服务人员喇叭的颜色
		isNeedTrumpet = false;
	};
	[ChatSplMem.Teacher] = 
	{
		SplFlag = "<font color='#FF0000'>[指导员]</font>";--特殊服务人员的名字标志
		-- SplPrivateColor = "'#dcd9d9'";--特殊服务人员私聊的颜色
		-- SplTrumpetColor = "'#dcd9d9'";--特殊服务人员喇叭的颜色
		isNeedTrumpet = true;
	};
}

--GM命令的类型，cmd可以修改命令的名称；id对应的是功能，后台使用，请勿修改。
_G.GMCommand = 
{
	{ cmd = "addexp", 			id = 1 };	--提升经验值格式（记得参数之间加空格）：@addexp 9999999
	{ cmd = "addmoney", 		id = 2 };	--提升金钱，格式：@upmoney 9999999
	{ cmd = "qkbb",		id = 3 };	--清空背包：@clearpack --只有一个字符串为参数的不需要空格
	{ cmd = "fulljm",		id = 4 };	--冲脉全满：@fulljinai
	{ cmd = "addszexp",		id = 5 };	--增加实战经验：@upfightexp 9999999
	{ cmd = "fullwxlevel",	id = 6 };	--五行等级全满：@fullfivelevel 往下的格式类似
	{ cmd = "fullzhenqi",		id = 7 };	--五行真气全满：@fullzhenqi 
	{ cmd = "addfangyu",			id = 8 };	--防御提升：@updef 999999999
	{ cmd = "addgongji",		id = 9 };	--攻击提升：@upatk 9999999
	{ cmd = "addhp",			id = 10 };	--HP扣除或增加：@uphp 99999 --对于数字，可以使用正负值来操作
	{ cmd = "addmp",			id = 11 };	--操作MP：@upmp 99999
	{ cmd = "additem",		id = 12 };	--获得物品：@getitem （物品配置ID）123456 （物品数量）1 （物品存放的空间：1背包、2仓库、7任务、8护身宝甲熔炼炉）1
	{ cmd = "move",			id = 13 };	--移动坐标：@move （地图ID）1 （X坐标）200 （Y坐标）100
	{ cmd = "zqexp",		id = 14 };	--坐骑的经验
	{ cmd = "uprank",		id = 15 };	--更新排行榜
	{ cmd = "addskill",		id = 16 };	--添加技能： @addskill 2（技能ID）
	{ cmd = "zbqh",		id = 17 };	--将当前身上穿的装备强化到level： @equipstrong 10（强化等级0~15）
	{ cmd = "fcm",		id = 18 };	--更改当前防沉迷的状态 @addicted  
	{ cmd = "zbpz",		id = 19 };	--设置当前身上穿的装备的品质 @equipappend 0~4 （普通，绿色，蓝色，紫色，金色）
	{ cmd = "zbts",		id = 20 };	--当前身上穿的装备的天生全满 @equiptiansheng   
	{ cmd = "zbsj",		id = 21 };	--当前身上穿的装备升级到下一级 @equipnextlevel   ，保留所有特性：附加属性和强化
	{ cmd = "addnuqi",		id = 22 };	--增加玩家的怒气 @addnuqi  99999
	{ cmd = "upLevel",		id = 23 };	--将玩家升到某一个等级 @uplevel  0~60
	{ cmd = "deletebuff",		id = 24 };	--清空身上的所有Buff @deletebuff 
	{ cmd = "syqx",		id = 25 };	--获得所有被限制的操作的权限 @allpermit 
	{ cmd = "addactive",		id = 26 };	--增加玩家的活跃度 @addactive 200
	-- { cmd = "addtianguancifu_equip",	id = 27 };		--增加天官赐福值——装备升阶	@cmd  value(1-10000)
	-- { cmd = "addtianguancifu_mount",		id = 28 };	--增加天官赐福值——坐骑升阶	@cmd  value(1-10000)
	-- { cmd = "addtianguancifu_jingjie",		id = 29 };	--增加天官赐福值——境界升级	@cmd  value(1-10000)
	-- { cmd = "addtianguancifu_amulet",		id = 30 };	--增加天官赐福值——护身宝甲升阶	@cmd  value(1-10000)
	{ cmd = "addtask",						id = 31 };	--接受任务
	{ cmd = "liubuzuiniubi",						id = 32 };	--让你变得更加nb
	{ cmd = "ReloadFile",		id = 33 };
	{ cmd = "JG",			id = 34};--加怪(dwMonsterId,dwFightId,dwAIId,dwDropId,dwX,dwY)
	{ cmd = "SBOSS",		id = 35};--刷boss
	-- { cmd = "addtianguancifu_sword",		id = 36 };	--增加天官赐福值——宝剑升阶	@cmd  value(1-10000)
	{ cmd = "addswl",	id = 37 };	--增加宝剑等阶	@cmd  value(1-7)
	{ cmd = "sendmail", 	id = 38 }; --发送一封已经配置好的邮件 @cmd value（邮件ID）
	{ cmd = "clstask",		id = 39 }; --清空所有任务
	{ cmd = "comtask",		id = 40 }; --清空所有任务
	{ cmd = "sldmax",		id = 41 }; --所有技能熟练度满
	{ cmd = "addsudu",		id = 42 }; --设置速度
	{ cmd = "appointleader",	id = 51 }; --任命世家家主 @appointleader 世家ID 角色ID
	{ cmd = "adrank", id = 53 }; -- 增加排行榜角色
};
--变得更加NB的配置文件
_G.BeNBCommendConfig = {
	TimeGap = 1000; --每一波命令的时间间隔，单位毫秒
	--PackExtend = 5;--扩展背包
	WaveCount = 4;--命令的波数
	--第一波命令
	--命令的第1个参数是职业ID，0代表不区分职业，1234各自代表其它职业   1是枪 2是刀 3是剑 4是镰刀
	--命令的第2个参数是上面GMCommand配置的程序内部使用ID
	--命令的第3个参数往后是GM所需的参数
	[1] = {
		{ 0, 23, 99 };	---等级
		{ 0, 2, 1, 999999999 };	--银两
		{ 0, 2, 3, 50000000 };	--元宝
		{ 0, 12, 2500070, 20 };	--HP药水
		{ 0, 12, 2500080, 20 };	--MP药水
		{ 0, 22, 50000 };--怒气
		{ 0, 12, 5500080, 20 };--副本令
		{ 0, 12, 5500060, 10 };--VIP
		
		--{ 0, 6 };--五行满级
		--{ 0, 7 };--五行全满
		{ 0, 12, 2300000, 50 };--真气丹
		
		{ 1, 12, 9404000, 1 };--坐骑
		{ 2, 12, 9402000, 1 };
		{ 3, 12, 9401000, 1 };
		{ 4, 12, 9403000, 1 };
		
		--帮派资源
		{ 0, 12, 4500030, 99 };
		{ 0, 12, 4500040, 99 };
		{ 0, 12, 4500050, 99 };
		{ 0, 12, 4500060, 99 };
		
		--绝学
		{ 0, 12, 5111003, 1 };
		{ 0, 12, 5111007, 1 };
		{ 0, 12, 5111008, 1 };
		{ 0, 12, 5111009, 1 };
		{ 0, 12, 5111017, 1 };
		{ 0, 12, 5111016, 1 };

		
	};
	--第二波命令，增加的技能，通用技能
	[2] = {
		--[[
		{0,16,13001};	--添加技能
		{0,16,13002};	--添加技能
		{0,16,13003};	--添加技能
		{0,16,13004};	--添加技能
		{0,16,13005};	--添加技能
		{0,16,13006};	--添加技能
		-- {0,16,11003};
		-- {0,16,11004};
		-- {0,16,11007};
		-- {0,16,11008};
		-- {0,16,11009};
		-- {0,16,11011};
		-- {0,16,11012};
		 {0,16,11013};
		-- {0,16,11016};
		-- {0,16,11017};
		{0,16,12002};
		{0,16,12003};
		{0,16,12004};
		{0,16,12005};
		{0,16,13007};
		{0,16,61001};
		{0,16,12006};
		{0,16,12008};
		{0,16,12009};
		{0,16,12016};
		{0,16,13001};
		{0,16,13002};
		{0,16,13003};
		{0,16,13004};
		{0,16,13005};
		{0,16,13006};
		{0,16,13007};
		--]]
	};
	--第三波命令，增加的装备，需要区分角色来添加；如果觉得一波的物品太多，那就复制出新的一波来发送
	[3] = {
		--这里的1234对应职业，一次类推往下添加
		-- {0,12,1400010,1};
		-- {0,12,1400020,1};
		-- {0,12,1400030,1};
		-- {0,12,1400040,1};
		-- {0,12,1400050,1};
		-- {0,12,1410010,1};
		-- {0,12,1410020,1};
		-- {0,12,1410030,1};
		-- {0,12,1410040,1};
		-- {0,12,1410050,1};
		-- {0,12,1420010,1};
		-- {0,12,1420020,1};
		-- {0,12,1420030,1};
		-- {0,12,1420040,1};
		-- {0,12,1420050,1};
		-- {0,12,1430010,1};
		-- {0,12,1430020,1};
		-- {0,12,1430030,1};
		-- {0,12,1430040,1};
		-- {0,12,1430050,1};
		-- {0,12,1440010,1};
		-- {0,12,1440020,1};
		-- {0,12,1440030,1};
		-- {0,12,1440040,1};
		-- {0,12,1440050,1};
		-- {0,12,1450010,1};
		-- {0,12,1450020,1};
		-- {0,12,1450030,1};
		-- {0,12,1450040,1};
		-- {0,12,1450050,1};

		{1,12,1104010,1};
		-- {1,12,1104020,1};
		-- {1,12,1104030,1};
		-- {1,12,1104040,1};
		-- {1,12,1104050,1};
		-- {1,12,1204010,1};
		-- {1,12,1204020,1};
		-- {1,12,1204030,1};
		-- {1,12,1204040,1};
		-- {1,12,1204050,1};
		-- {1,12,1224010,1};
		-- {1,12,1224020,1};
		-- {1,12,1224030,1};
		-- {1,12,1224040,1};
		-- {1,12,1224050,1};
		-- {1,12,1214010,1};
		-- {1,12,1214020,1};
		-- {1,12,1214030,1};
		-- {1,12,1214040,1};
		-- {1,12,1214050,1};
		-- {1,12,1234040,1};
		-- {1,12,1234050,1};
		-- {1,12,1254040,1};
		-- {1,12,1254050,1};
		
		{2,12,1102010,1};
		-- {2,12,1102020,1};
		-- {2,12,1102030,1};
		-- {2,12,1102040,1};
		-- --{2,12,1102050,1};
		-- {2,12,1202010,1};
		-- {2,12,1202020,1};
		-- {2,12,1202030,1};
		-- {2,12,1202040,1};
		-- {2,12,1202050,1};
		-- {2,12,1222010,1};
		-- {2,12,1222020,1};
		-- {2,12,1222030,1};
		-- {2,12,1222040,1};
		-- {2,12,1222050,1};
		-- {2,12,1212010,1};
		-- {2,12,1212020,1};
		-- {2,12,1212030,1};
		-- {2,12,1212040,1};
		-- {2,12,1212050,1};
		-- {2,12,1232040,1};
		-- {2,12,1232050,1};
		-- {2,12,1252040,1};
		-- {2,12,1252050,1};
		
		{3,12,1101010,1};
		-- {3,12,1101020,1};
		-- {3,12,1101030,1};
		-- {3,12,1101040,1};
		-- --{3,12,1101050,1};
		-- {3,12,1201010,1};
		-- {3,12,1201020,1};
		-- {3,12,1201030,1};
		-- {3,12,1201040,1};
		-- {3,12,1201050,1};
		-- {3,12,1221010,1};
		-- {3,12,1221020,1};
		-- {3,12,1221030,1};
		-- {3,12,1221040,1};
		-- {3,12,1221050,1};
		-- {3,12,1211010,1};
		-- {3,12,1211020,1};
		-- {3,12,1211030,1};
		-- {3,12,1211040,1};
		-- {3,12,1211050,1};
		-- {3,12,1231040,1};
		-- {3,12,1231050,1};
		-- {3,12,1251040,1};
		-- {3,12,1251050,1};
		
		{4,12,1103010,1};
		-- {4,12,1103020,1};
		-- {4,12,1103030,1};
		-- {4,12,1103040,1};
		-- --{4,12,1103050,1};
		-- {4,12,1203010,1};
		-- {4,12,1203020,1};
		-- {4,12,1203030,1};
		-- {4,12,1203040,1};
		-- {4,12,1203050,1};
		-- {4,12,1223010,1};
		-- {4,12,1223020,1};
		-- {4,12,1223030,1};
		-- {4,12,1223040,1};
		-- {4,12,1223050,1};
		-- {4,12,1213010,1};
		-- {4,12,1213020,1};
		-- {4,12,1213030,1};
		-- {4,12,1213040,1};
		-- {4,12,1213050,1};
		-- {4,12,1233040,1};
		-- {4,12,1233050,1};
		-- {4,12,1253040,1};
		-- {4,12,1253050,1};
	};
	--第四波命令，增加的技能，特定技能
	[4] = {
		{1,16,51001};
		{1,16,51004};
		{1,16,51002};
		{1,16,51003};
		{1,16,51005};
		
		{2,16,31001};
		{2,16,31004};
		{2,16,31002};
		{2,16,31003};
		{2,16,31005};
		
		{3,16,21001};
		{3,16,21004};
		{3,16,21002};
		{3,16,21003};
		{3,16,21005};
		
		{4,16,41001};
		{4,16,41004};
		{4,16,41002};
		{4,16,41003};
		{4,16,41005};
		
		--内功
		{ 0, 16, 12006};
		{ 0, 16, 12008};
		{ 0, 16, 12009};
		{ 0, 16, 12017};
		{ 0, 16, 12011};
		{ 0, 16, 12016};
		--抵抗
		{ 0, 16, 13018};
		{ 0, 16, 13020};
		{ 0, 16, 13021};
		{ 0, 16, 13022};
		{ 0, 16, 13023};
		{ 0, 16, 13024};
		{ 0, 16, 13025};
		{ 0, 16, 13026};
		--特殊技能
		{ 0, 16, 61001};
		{ 0, 16, 11013};

	};
};



_G.ChatEmoticon = 
{
		{
			{icon_url="img://lt_bq_01.gif",des ="#a1#" ,width="32"},
			{icon_url="img://lt_bq_02.gif",des ="#a2#" ,width="32"},
			{icon_url="img://lt_bq_03.gif",des ="#a3#" ,width="32"},
			{icon_url="img://lt_bq_04.gif",des ="#a4#" ,width="32"},
			{icon_url="img://lt_bq_05.gif",des ="#a5#" ,width="32"},
			{icon_url="img://lt_bq_06.gif",des ="#a6#" ,width="32"},
			{icon_url="img://lt_bq_07.gif",des ="#a7#" ,width="32"},
			{icon_url="img://lt_bq_08.gif",des ="#a8#" ,width="32"},

		},
		{
			{icon_url="img://lt_bq_09.gif",des ="#b1#" ,width="32"},
			{icon_url="img://lt_bq_10.gif",des ="#b2#" ,width="32"},
			{icon_url="img://lt_bq_11.gif",des ="#b3#" ,width="32"},
			{icon_url="img://lt_bq_12.gif",des ="#b4#" ,width="32"},
			{icon_url="img://lt_bq_13.gif",des ="#b5#" ,width="32"},
			{icon_url="img://lt_bq_14.gif",des ="#b6#",width="32"},
			{icon_url="img://lt_bq_15.gif",des ="#b7#" ,width="32"},
			{icon_url="img://lt_bq_16.gif",des ="#b8#" ,width="32"},

		},
		{
			{icon_url="img://lt_bq_17.gif",des ="#c1#" ,width="32"},
			{icon_url="img://lt_bq_18.gif",des ="#c2#" ,width="32"},
			{icon_url="img://lt_bq_19.gif",des ="#c3#" ,width="32"},
			{icon_url="img://lt_bq_20.gif",des ="#c4#" ,width="32"},
			{icon_url="img://lt_bq_21.gif",des ="#c5#" ,width="32"},
			{icon_url="img://lt_bq_22.gif",des ="#c6#" ,width="32"},
			{icon_url="img://lt_bq_23.gif",des ="#c7#" ,width="32"},
			{icon_url="img://lt_bq_24.gif",des ="#c8#" ,width="32"},

		},
		{
			{icon_url="img://lt_bq_25.gif",des ="#d1#" ,width="32"},
			{icon_url="img://lt_bq_26.gif",des ="#d2#" ,width="32"},
			{icon_url="img://lt_bq_27.gif",des ="#d3#" ,width="32"},
			{icon_url="img://lt_bq_28.gif",des ="#d4#" ,width="32"},
			{icon_url="img://lt_bq_29.gif",des ="#d5#" ,width="32"},
			{icon_url="img://lt_bq_30.gif",des ="#d6#" ,width="32"},
			{icon_url="img://lt_bq_31.gif",des ="#d7#" ,width="32"},
			{icon_url="img://lt_bq_32.gif",des ="#d8#" ,width="32"},

		},
		{
			{icon_url="img://lt_bq_33.gif",des ="#e1#" ,width="32"},
			{icon_url="img://lt_bq_34.gif",des ="#e2#" ,width="32"},

		},

}


------
--超链接接口中要到的结构
_G.LinkDataInfo = {};
function LinkDataInfo:new()
	local obj = {};
	obj.strLinkWord = "";--超链接字符串
	obj.strLinkColor = nil;--超链接字的颜色
	obj.funcClick = function()  end;--执行函数
	
	return obj;
end;

_G.enLinkType = 
{
	RoleTip = 0;--角色菜单
	ItemTip = 1;--物品tip
	UnKnow = 2;
	Vip = 3;--VIP界面
	Mount = 4;--坐骑界面
	PlayerSHop = 5;--摆摊界面
	Alliance = 6;--盟主查看界面
}

