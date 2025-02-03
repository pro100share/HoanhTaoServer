--宝石合成显示配置
_G.StoneShowConfig = {
	["showList"] = {
		[1] = 3900020,
		[2] = 3900030,
		[3] = 3900040,
		[4] = 3900050,
		[5] = 3900060,
		[6] = 3900070,
		[7] = 3900080,
		[8] = 3900090,
		[9] = 3900100,
	},
	["listPngSize"] = 32,
	["mainPngSize"] = 48,
	["describe"] = "<font color='#cdc6c4'>1.每3个同类宝石可以合成1个高级宝石<br/>2.合成失败返还一个低级宝石<br/>3.合成时有几率爆出极品宝石</font>",
	["getItemDes"] = "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>宝石精华</font>物品描述";
}
--暴击石材料
_G.ComeNonSuchMeterial = {
	[3900020] = {3910010,},    --2级宝石对应的1级极品,   普通宝石精华=====所有上一级极品宝石
	[3900030] = {3910020,},   --3级宝石对应的2级极品
	[3900040] = {3910030,},   --4级宝石对应的3级极品
	[3900050] = {3910040,},   --5级宝石对应的4级极品
	[3900060] = {3910050,},   --6级宝石对应的5级极品
	[3900070] = {3910060,},   --7级宝石对应的6级极品
	[3900080] = {3910070,},   --8级宝石对应的7级极品
    [3900090] = {3910080,},   --9级宝石对应的8级极品
	[3900100] = {3910090,},   --10级宝石对应的9级极品
}

--暴击石
_G.ComeNonSuch = {
	--[3900010] = {3910010,},   --2级宝石对应的2级极品  普通宝石精华======同级极品宝石精华
	[3900020] = {3910020,},   --3级宝石对应的2级极品
	[3900030] = {3910030,},   --4级宝石对应的3级极品
	[3900040] = {3910040,},   --5级宝石对应的4级极品
	[3900050] = {3910050,},   --7级宝石对应的6级极品
	[3900060] = {3910060,},   --6级宝石对应的5级极品
	[3900070] = {3910070,},   --7级宝石对应的6级极品
	[3900080] = {3900080,},   --8级宝石对应的7级极品
    [3900090] = {3910090,},   --9级宝石对应的8级极品
	[3900100] = {3910100,},   --10级宝石对应的9级极品
}
--广播
_G.StoneCongratulationConfig = 
{
	--合成出极品level
	NonsuchLevel = 6;
	--合成出极品level
	NonBaoJiLevel = 6;
	--合成高级宝石level
	HighStoneLevel = 7;
};

--装备强化Avartar配置文件
_G.StoneSysAvatarConfig = {
	ActTime		= 3;--挥锤动作次数
	NpcLookID	= 1109;
	NpcIdelID	= 110901;
	NpcActID	= 110981;
	NpcSucID	= 110982;
	NpcFailID	= 110983;
	NpcHugeID	= 110982;
	Range		= _Vector2.new(800, 800);
	Eye			= _Vector3.new(0,-9,1.8);
	Look		= _Vector3.new(0,0,0);
	NpcSucSay	=	--操作成功
	{ 
		[1]="<font color='#00ff00'>康星，我1成功了，这事你怎么看</font>",
		[2]="<font color='#00ff00'>康星，我2成功了，这事你怎么看</font>",
	};
	NpcFailSay	=	--操作失败
	{ 
		[1]="<font color='#00ff00'>康星，我1失败了，这事你怎么看</font>",
		[2]="<font color='#00ff00'>康星，我2失败了，这事你怎么看</font>",
	};
	NpcIdelSay	=	--休闲对话
	{ 
		[1]="<font color='#00ff00'>康星，我休闲了，这事你怎么看</font>",
		[2]="<font color='#00ff00'>康星，给哥来块切糕</font>",
		[3]="<font color='#00ff00'>康星，你的AE86呢？</font>",
		[4]="<font color='#00ff00'>康星，你案子写完了？</font>",
		[5]="<font color='#00ff00'>康星，偶吧六部style！</font>",
		[6]="<font color='#00ff00'>康星，你典范么？</font>",
	};
	NpcActSay	=	--操作进行中
	{ 
		[1]="<font color='#00ff00'>康星，我1抡锤了，这事你怎么看</font>",
		[2]="<font color='#00ff00'>康星，我2抡锤了，这事你怎么看</font>",
	};
	NpcHugeSay	=	--操作暴击
	{ 
		[1]="<font color='#00ff00'>康星，我1暴击了，这事你怎么看</font>",
		[2]="<font color='#00ff00'>康星，我2暴击了，这事你怎么看</font>",
	};
}
