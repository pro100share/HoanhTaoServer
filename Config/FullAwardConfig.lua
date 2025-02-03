--[[
	充值奖励配置表
	--单次充值奖励
	--累积充值奖励
]]
_G.FullAwardPlanStr = "已充值：%s元宝"; 

_G.IWantGet = "我要领取";

--充值奖励类型表
_G.FullTypeConfig = {
	AddiFull = 1,
	PerFull = 2,
};

--充值奖励女Avartar配置文件
_G.FullSysMAvatarConfig = {
	ActTime		= 1;--挥锤动作次数
	NpcLookID	= 10021051;
	NpcIdelID	= 1002105101;
	
	NpcOpenID	= {
		[0] = 1002105102,
		[188] = 1002105102,
		-- [150] = 1001100093,
		-- [200] = 1001100093,
	};
	NpcGetID	= 1002105102;
	
	Range		= _Vector2.new(1024, 1800);
	Eye			= _Vector3.new(-0.1,-11,1.8);
	Look		= _Vector3.new(-0.3,-1.4,0);
    
    NpcSayInterval  = 8; --Npc说话间隔，即多久说句话，单位 秒
    NpcSayTime      = 5; --Npc说话持续时间，即显示时间，单位 秒
	
	NpcOpenSay = { --打开界面
		[1]="Hi,首充活动开始啦，活动期间<font color='#FDF445'>充值188元宝</font>，即可获得丰厚礼品奖励",
	};
	
	NpcGetAwardSay	=	--领取奖励
	{ 
		[1]="<font color='#00ff00'>没关系，再接再厉，好装备是需要磨练的</font>",
		[2]="<font color='#00ff00'>心急吃不了热豆腐</font>",
	};
	
	NpcIdelSay	=	--休闲对话
	{ 
		[1]="价值1000元宝的<font color='#00ff00'>6条满攻击附加属性，强化+10武器(40级)</font>，可让您轻松挑战江湖群雄",
		[2]="<font color='#00ff00'>幻灵丹</font>，极品丹药，升级必备！",
        [3]="价值888元宝的<font color='#00ff00'>真气丹10万</font>，可让您能力更上一层笑傲江湖",
		[4]="<font color='#00ff00'>银两100万</font>，让您不再为钱财烦恼",
        [5]="<font color='#00ff00'>三倍经验药</font>，可让您打怪获得三倍经验效果，轻松升级",
		[6]="<font color='#00ff00'>闭关要诀</font>，可让您获得双倍闭关收益，轻松升到40级",
	};
};