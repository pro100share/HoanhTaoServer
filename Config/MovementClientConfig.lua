function _G.LoadMovementScrip()

	_G.MovementFunction = 
	{
		-- [1] = function () 
			-- if CDuplSystem:IsDupling() then
				-- CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[6000210039])
			-- else
				-- CUIDuplWnd:OpenWnd()
				-- CUIWeiWang:CloseClick()
			-- end
		-- end,
		[2] = function () 
				CUITaskMainPanel:DoOpen(2)
				CUIWeiWang:CloseClick()
		    end,
		[3] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,5,19"},true)
				CUIWeiWang:CloseClick()
		    end,
		[4] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,5,19"},true)
				CUIWeiWang:CloseClick()
		    end,
		[5] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,-112.6,57.22"},true)
				CUIWeiWang:CloseClick()
		    end,
		[6] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,4,25"},true)
				CUIWeiWang:CloseClick()
		    end,
		[7] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,6.3,13.78"},true)
				CUIWeiWang:CloseClick()
		    end,
		[8] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,5,13"},true)
				CUIWeiWang:CloseClick()
		    end,
		[9] = function () 
			UILotterySystem:DoOpen()
			CUIWeiWang:CloseClick()
		end,
		[10] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,-30.64,-91.60"},true)
				CUIWeiWang:CloseClick()
		end,
		[11] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,3.0,12.60"},true)
				CUIWeiWang:CloseClick()
		end,
		[12] = function () 
			CUIDuplWnd:OpenWnd()
			CUIWeiWang:CloseClick()
		end,
		[13] = function () 
				CTaskSystem:DoTaskLinkClick({param="move,1002,5,13"},true)
				CUIWeiWang:CloseClick()
		end,	
		[14] = function () 
			CrossSevLoginUI:Open()
			CUIWeiWang:CloseClick()
		end,
	}
end



_G.MovementConfig = {

---配置参数说明
-----szDetailDes    活动描述
-----szTime			活动时间
-----szName			活动名称
-----szType			活动类型 全天还是限时
-----bButton        是否显示按钮
-----szButtonText   按钮上显示文字
-----Func           配置打开界面事件CPulse:Open	
-----picMovement    活动的底图
-----picList		活动收益的图片和tips
-----双倍经验	
	[1] =
	{	
	    dwID = 1001,
		szDetailDes = "每日双倍时间内，挂机打怪、演武均可获得双倍收益奖励。<br/><font color='#fed904'>【建议大侠在活动期间保持在线】</font>",
		szTime = "<font color='#DCB857'>周1至周5：</font><br/>中午13:00--14:00 晚上19:00--20:00<br/><font color='#DCB857'>周末：</font>早上9:00--晚上17:00";
		szName = '双倍经验',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() CUIRole:OpenPanel(3) end,
		bButton  = false,
		szButtonText = "",
		picMovement = 'HD_AnNiu_shuangbei_xiao.png',
		picMovement1 = 'HD_AnNiu_shuangbei_da.png',
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '挂机、演武可获得双倍经验'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '演武可获得双倍真气'},
		},
		--开启时提示框配置
		tTipConfig = 
		{
			szHuoDongName = '双倍经验',
			szHongDongTime = "每天：<font color='#31cf32'>13:00~14:00、19:00~20:00</font><br/>每周六、日：<font color='#31cf32'>9:00~19:00",
			szHuoDongText = '活动期间，挂机打怪、演武均可获得双倍收益奖励',
			szStartName = '查看活动',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CUIMissionDailyEx:OnVisiable()",	
			dwLimitLevel = 35,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型作废
			nHideTime = 60*60*1000; -- 活动开始后几分钟消失
		};
	},
---风云任务
	[2] =
	{	
	    dwID = 2003,
		szDetailDes = "完成风云任务，可获得<font color='#fed904'>海量经验、真气奖励。</font><br/>每日可完成20环风云任务<br/><font color='#fed904'>每完成8环可获得额外礼金和神龙果奖励</font>",
		szTime = "每天晚上12点会刷新风云任务<br/><font color='#278cf1'>【建议及时完成风云任务避免损失】</font>";
		szName = '风云任务',
		szType = "<font color='#fed904'>全天</font>",
		Func = function() MovementFunction[2]() end,
		bButton  = true,
		szButtonText = "查看任务",
		picMovement = 'HD_AnNiu_fengyun_xiao.png',
		picMovement1 = 'HD_AnNiu_fengyun_da.png',
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '海量经验'},
			[2] = {picPath = 'Qita_money.png',szDes = '大量银两'},
			[3] = {picPath = 'Qita_zhenqi.png',szDes = '大量真气'},
			[4] = {picPath = 'Icon_item_9405010_1.png',szDes = '每完成8环可获得丰厚的礼金和神龙果奖励'},
			
		},
		-- --提示时间配置
		-- Notice = {
			-- nShowTime = 90*60*1000; -- 提前几分钟出现
			-- nType     = 1; 			-- 消失类型
			-- nHideTime = 15*60*1000;-- 活动开始后几分钟消失
		-- };
	},
-----龙鼎战
	[3] =
	{	
	    dwID = 2001,
		szDetailDes = "1.龙鼎战期间只要进入地图每分钟将获得<font color='#fed904'>大量经验以及五行真气奖励</font><br/>2.占领龙鼎的世家成员可在龙鼎战结束后<font color='#fed904'>享受三天专享经验加成</font>",
		szTime = "周2和周5：晚上20:00--21:00<br/><font color='#278cf1'>【世家龙鼎等你来占】</font>";
		szName = '龙鼎战',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[3]() end,
		bButton  = true,
		szButtonText = "立即前往",
		picMovement = 'HD_AnNiu_longding_xiao.png',
		picMovement1 = 'HD_AnNiu_longding_da.png',
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '大量经验'},
			[2] = {picPath = 'Qita_money.png',szDes = '大量银两'},
			[3] = {picPath = 'Qita_zhenqi.png',szDes = '大量真气'},
			[4] = {picPath = 'Qita_lijin.png',szDes = '大量礼金'},
		},
		tTipConfig = 
		{
			szHuoDongName = '龙鼎战',
			szHongDongTime = "周二、周五：<font color='#31cf32'>20:00~21:00</font>",
			szHuoDongText = '争夺龙鼎最多的世家，可获得3天的打怪经验加成，战场中击杀其他世家玩家也可获得丰厚的奖励',
			szStartName = '立即前往',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CTaskSystem:DoTaskLinkClick({param='move,1002,5,19'},true)",
			dwLimitLevel = 35,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 60*60*1000;-- 活动开始后几分钟消失
		};
	},
-- -----恶人谷
	[4] =
	{	
	    dwID = 2006,	
		szDetailDes = "挂机地图，地图中怪物经验高于野外地图，但<font color='#DD4747'>地图中无PK保护，建议大侠谨慎进入</font><br/><font color='#fed904'>【恶人谷，恶人谷，一入此谷，永不受苦】</font>",
		szTime = "<font color='#278cf1'>全天24小时开放</font><br/>一踏三生远常伦，嬉笑怒骂绝痴尘<br/>俯览庙堂纷争处，错漏人间几度春";
		szName = '恶人谷',
		szType = "<font color='#fed904'>全天</font>",
		Func = function() MovementFunction[4]() end,
		bButton  = true,
		szButtonText = "立即前往",
		picMovement = 'HD_AnNiu_erengu_xiao.png',
		picMovement1 = 'HD_AnNiu_erengu_da.png',
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '海量经验：恶人谷中挂机，经验翻倍'},
		},
		-- --提示时间配置
		-- Notice = {
			-- nShowTime = 90*60*1000; -- 提前几分钟出现
			-- nType     = 1; 			-- 消失类型
			-- nHideTime = 15*60*1000;-- 活动开始后几分钟消失
		-- };
	},
----挖宝
	[5] =
	{	
	    dwID = 2007,	
		szDetailDes = "使用藏宝图可获得商城道具,品质越好的藏宝图奖励越高<br/><font color='#fed904'>有几率挖出世界BOSS【建议悄悄干掉】</font>",
		szTime = "每日可挖宝10次，VIP可享一键寻宝<br/><font color='#278cf1'>每天晚上12点刷新藏宝图次数，建议及时挖取避免损失</font>";
		szName = '地图寻宝',
		szType = "<font color='#fed904'>全天</font>",
		Func = function() MovementFunction[5]() end,
		bButton  = true,
		szButtonText = "前往购买",
		picMovement = 'HD_AnNiu_xunbao_xiao.png',
		picMovement1 = 'HD_AnNiu_xunbao_da.png',		
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '大量经验'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '大量真气'},
			[3] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具'},
		},
		-- --提示时间配置
		-- Notice = {
			-- nShowTime = 90*60*1000; -- 提前几分钟出现
			-- nType     = 1; 			-- 消失类型
			-- nHideTime = 15*60*1000;-- 活动开始后几分钟消失
		-- };
	},
----盟主战
	[6] =
	{	
	    dwID = 3001,	
		szDetailDes = "江湖至尊，唯有盟主！号令出，莫敢不从！<br/><font color='#fed904'>【盟主战期间只要进入地图，每分钟即可获得大量经验和真气奖励】</font>",
		szTime = "每周6，晚上20:00--21:00<br/><font color='#278cf1'>【生平孤独，但求一败】--独孤求败</font>";
		szName = '盟主战',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[3]() end,
		bButton  = true,
		szButtonText = "立即前往",
		picMovement = 'HD_AnNiu_mengzhu_xiao.png',
		picMovement1 = 'HD_AnNiu_mengzhu_da.png',	
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '海量经验'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '海量真气'},
			[3] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具'},
			[4] = {picPath = 'Icon_item_4500060_1.png',szDes = '盟主令特权1周'},
		},
		tTipConfig = 
		{
			szHuoDongName = '盟主战',
			szHongDongTime = "每周六：<font color='#31cf32'>20:00~21:00</font>",
			szHuoDongText = '争夺盟主成功的玩家，可获得一周的盟主特权。参与盟主战的玩家，在战场中可获得大量的经验，真气奖励',
			szStartName = '立即前往',
			dwLimitLevel = 35,
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CTaskSystem:DoTaskLinkClick({param='move,1002,5,19'},true)",
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 60*60*1000;-- 活动开始后几分钟消失
		};
	},
----夜战襄阳
	[7] =
	{	
	    dwID = 4001,	
		szDetailDes = "一样的襄阳城，不一样的夜！<br/>城内高手云集，杀机四伏！<br/><font color='#fed904'>【夜晚的襄阳城很凶险】</font>",
		szTime = "每天：晚上19:30--19:50<br/><font color='#278cf1'>【人为财死，鸟为食亡，江湖凶险】</font>";
		szName = '夜战襄阳',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[3]() end,
		bButton  = true,
		szButtonText = "立即前往",
		picMovement = 'HD_AnNiu_yezhan_xiao.png',
		picMovement1 = 'HD_AnNiu_yezhan_da.png',	
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '海量经验'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '海量真气'},
			[3] = {picPath = 'Qita_lijin.png',szDes = '大量礼金'},
			[4] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具'},
		},
		tTipConfig = 
		{
			szHuoDongName = '夜战襄阳',
			szHongDongTime = "每天：<font color='#31cf32'>19:30~19:50</font>",
			szHuoDongText = '一样的襄阳城，不一样的夜，夜晚的襄阳会发生什么呢？等你来发掘！',
			szStartName = '立即前往',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun = "CTaskSystem:DoTaskLinkClick({param='move,1002,5,19'},true)",		
			dwLimitLevel = 35,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 20*60*1000;-- 活动开始后几分钟消失
		};	
	},
----怪物攻城
	[8] =
	{	
	    dwID = 5001,	
		szDetailDes = "活动期间，将有各路敌人每隔10分钟对【一线】襄阳城发起1次袭击，共4次。敌人的战力将随袭击波数的增加逐渐变强。<br/><font color='#fed904'>【注意，敌方会派出绝顶高手参战】</font>",
		szTime = "<font color='#DCB857'>每周1，周3，周6：</font>晚上21:10开始<br/><font color='#278cf1'>【 每隔10分钟刷一波 共刷新4次】</font>";
		szName = '怪物攻城',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[3]() end,
		bButton  = false,
		szButtonText = "立即前往",
		picMovement = 'HD_AnNiu_guaiwugongcheng_xiao.png',
		picMovement1 = 'HD_AnNiu_guaiwugongcheng_da.png',	
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '海量经验'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '海量真气'},
			[3] = {picPath = 'Qita_money.png',szDes = '大量银两'},			
			[4] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具'},
		},
		tTipConfig = 
		{
			szHuoDongName = '怪物攻城',
			szHongDongTime = "每周1，周3，周6：<font color='#31cf32'>晚上21:10开始</font>",
			szHuoDongText = '活动期间，将有各路敌人每隔10分钟对【一线】襄阳城发起1次袭击，共4次。敌人的战力将随袭击波数的增加逐渐变强。',
			szStartName = '查看活动',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CUIMissionDailyEx:OnVisiable()",		
			dwLimitLevel = 40,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 50*60*1000;-- 活动开始后几分钟消失
		};	
	},
	
----世家押镖
	[9] =
	{	
	    dwID = 6001,	
		szDetailDes = "家主发起押镖后，有10分钟的时间为成员报名时间。押镖开始时，请召集世家成员到襄阳城牛冲天处集合，准备押镖<br/><font color='#fed904'>【注意保护镖车。小心其他世家劫镖】</font>",
		szTime = "<font color='#278cf1'>【只有家主才能发起，每天一次】</font>";
		szName = '世家押镖',
		szType = "<font color='#fed904'>全天</font>",
		Func = function() MovementFunction[3]() end,
		bButton  = false,
		szButtonText = "立即前往",
		picMovement = 'HD_AnNiu_yabiao_xiao.png',
		picMovement1 = 'HD_AnNiu_yabiao_da.png',	
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '海量经验'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '海量真气'},
			[3] = {picPath = 'Qita_lijin.png',szDes = '大量礼金'},			
			[4] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具及世家贡献'},
		},
		-- --提示时间配置
		-- Notice = {
			-- nShowTime = 90*60*1000; -- 提前几分钟出现
			-- nType     = 1; 			-- 消失类型
			-- nHideTime = 15*60*1000;-- 活动开始后几分钟消失
		-- };
	},
	----流星雨
	[10] =
	{	
		dwID = 6001,	
		szDetailDes = "活动期间，在襄阳城二线都会出现流星雨，一时间城内尽是陨石碎片<br/><font color='#fed904'>【何居奇正在向各路豪杰收集此物】</font>",
		szTime = "每天16:30-17:00<br/><font color='#278cf1'>【活动地点：襄阳城二线】</font>";
		szName = '流星雨',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[6]() end,
		bButton  = false,
		szButtonText = "前往兑换",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_xinghuo_xiao.png',
		picMovement1 = 'HD_AnNiu_xinghuo_da.png',		
		picList = 
		{
			[1] = {picPath = 'Icon_item_4100100_1.png',szDes = "天外陨石<br/><font color='#fed904'>使用可随机获得强化石、陨石碎片、3万银两、8万银两、20万银两\n陨石碎片（可在襄阳城何居奇处兑换稀有道具）</font>"},

		},
		tTipConfig = 
		{
			szHuoDongName = '流星雨',
			szHongDongTime = "每天16:30-17:00<br/>【活动地点：襄阳城二线】</font>",
			szHuoDongText = '活动期间，在襄阳城二线都会出现流星雨，一时间城内尽是陨石碎片。何居奇正在向各路豪杰收集此物</font>',
			szStartName = '查看活动',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CUIMissionDailyEx:OnVisiable()",
			dwLimitLevel = 10,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 30*60*1000;-- 活动开始后几分钟消失
		};
	},
	
	----商城抢购
	[11] =
	{	
		dwID = 9001,	
		szDetailDes = "好消息，新的一轮抢购开始啦！商城大量珍贵道具 折扣大甩卖<br/><font color='#fed904'>【商城限量抢购，手快先得】</font>",
		szTime = "刷新时间：每天0点和中午12点<br/><font color='#278cf1'>【请注意刷新时间，勿错过抢购良机】</font>";
		szName = '商城抢购',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[7]() end,
		bButton  = false,
		szButtonText = "立即前往",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_qianggou_da.png',
		picMovement1 = 'HD_AnNiu_qianggou_xiao.png',		
		picList = 
		{
			[1] ={picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具，限量抢购'},

		},
		tTipConfig = 
		{
			szHuoDongName = '商城抢购',
			szHongDongTime = "刷新时间：每天0点和中午12点<br/><font color='#278cf1'>【请勿错过抢购良机】</font>",
			szHuoDongText = "好消息，新的一轮<font color='#fed904' size='18'>抢购</font>开始啦！商城大量<font color='#e082da' size='18'>珍贵</font>道具 <font color='#FF0000' size='18'>折扣</font>大甩卖</font>",
			szStartName = '参加活动',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CMallLimit:OpenMallLimitUI()",
			dwLimitLevel = 20,
		},
	},
	----岑夫子
	[12] =
	{	
		dwID = 8001,
		szDetailDes = "擢机智，论贤愚，格致玄虚皆不拘，古今中外收眼底，一卷百家题。<br/><font color='#fed904'>【速度影响积分，正解决定收益】</font>",
		szTime = "每天19点开启<br/><font color='#278cf1'>【共40道题目，每道题目最高积分为3分】</font><br/><font color='#DD4747'>注：角色等级40级才可以答题哦！</font>";
		szName = '岑夫子',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[7]() end,
		bButton  = false,
		szButtonText = "立即前往",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_cenfuzi_xiao.png',
		picMovement1 = 'HD_AnNiu_cenfuzi_da.png',		
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '海量经验'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '海量真气'},
			[3] = {picPath = 'Qita_money.png',szDes = '海量银两'},

		},
		tTipConfig = 
		{
			szHuoDongName = '岑夫子',
			szHongDongTime = "每天19点开启<br/><font color='#278cf1'>【共40道题目，每题最高3分】</font>",
			szHuoDongText = '擢机智，论贤愚，格致玄虚皆不拘，古今中外收眼底，一卷百家题。</font>',
			szStartName = '开始答题',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CUIDaTi:Show()",
			dwLimitLevel = 40,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 29*60*1000;-- 活动开始后几分钟消失
		};
	},
	----戏说天下
	[13] =
	{	
		dwID = 7001,	
		szDetailDes = "风声雨声说书声，声声入耳；家事国事天下事，事事关心。<br/><font color='#fed904'>【活动期间只要进入地图即可获得大量经验及真气奖励，还有许多随机事件等你发现】</font>",
		szTime = "每天12:00-12:30<br/><font color='#278cf1'>【活动NPC：襄阳城叶锦溪】</font>";
		szName = '戏说天下',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[7]() end,
		bButton  = true,
		szButtonText = "立即前往",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_xishuotianxia_xiao.png',
		picMovement1 = 'HD_AnNiu_xishuotianxia_da.png',		
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '巨额真气！！'},
			[3] = {picPath = 'Icon_item_4100410_1.png',szDes = '古书注解：修行领悟必须之物'},

		},
		tTipConfig = 
		{
			szHuoDongName = '戏说天下',
			szHongDongTime = "每天12:00-12:30<br/><font color='#278cf1'>【活动NPC：襄阳城叶锦溪】</font>",
			szHuoDongText = "活动期间只要进入地图即可获得<font color='#fed904' size='18'>大量经验及真气奖励</font>，还有<font color='#fed904' size='18'>许多随机事件</font>等你发现</font>",
			szStartName = '立即前往',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CTaskSystem:DoTaskLinkClick({param='move,1002,6.3,13.78'},true)",
			dwLimitLevel = 30,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 30*60*1000;-- 活动开始后几分钟消失
		};
	},
	----青云蜀道
	[14] =
	{	
		dwID = 10001,	
		szDetailDes = "活动开启后占领塑像、击杀玩家、挑战BOSS可获积分奖励<br/><font color='#fed904'>【积分排名前三的队伍可获得丰厚奖励】</font>",
		szTime = "每周一、周四<br/>晚上：20:00-20:30<br/><font color='#278cf1'>【活动NPC：襄阳城叶锦溪】</font>";
		szName = '青云蜀道',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[8]() end,
		bButton  = true,
		szButtonText = "立即前往",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_qingyushudao_xiao.png',
		picMovement1 = 'HD_AnNiu_qingyushudao_da.png',		
		picList = 
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '巨额真气！！'},
			[3] = {picPath = 'Qita_lijin.png',szDes = '大量礼金'},	
			[4] = {picPath = 'Icon_item_4900106_1.png',szDes = '青云碎片'},	

		},
		tTipConfig = 
		{
			szHuoDongName = '青云蜀道',
			szHongDongTime = "每周一、周四 20:00-20:30<br/><font color='#278cf1'>【活动NPC：襄阳城叶锦溪】</font>",
			szHuoDongText = "活动开启后<font color='#fed904' size='18'>占领塑像、击杀玩家、挑战BOSS</font>可获积分奖励，积分排名前三的队伍可获得<font color='#fed904' size='18'>丰厚奖励</font>",
			szStartName = '立即前往',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CTaskSystem:DoTaskLinkClick({param='move,1002,5,13'},true)",
			dwLimitLevel = 30,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 30*60*1000;-- 活动开始后几分钟消失
		};
	},
	----抽签
	[15] =
	{	
		dwID = 0,	
		szDetailDes = "贫庶富贵天注定，时来运转未可知。<br/><font color='#fed904'>【购买签数即可获赠神谕福袋，中奖者将有机会获得大量经验、真气、礼金奖励，还有丰富的珍贵道具！惊喜多多，乐在其中！】</font>",
		szTime = "<font color='#278cf1'>全天24小时开放</font><br/>";
		szName = '抽签',
		szType = "<font color='#fed904'>全天</font>",
		Func = function()  MovementFunction[9]() end,
		bButton  = true,
		szButtonText = "立即参与",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_chouqian_xiao.png',
		picMovement1 = 'HD_AnNiu_chouqian_da.png',	
		dwLimitLevel = 30,
		picList =
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '巨额真气！！'},
			[3] = {picPath = 'Qita_lijin.png',szDes = '大量礼金'},	
			[4] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具'},

		},
	},
	----行镖天下
	[16] =
	{	
		dwID = 11001,	
		szDetailDes = "通过襄阳城牛冲天进入行镖地图，成功将镖车押运到目的地即可获得丰厚的奖励，运镖过程中小心其他玩家杀人劫取押运镖车。<br/><font color='#fed904'>【江湖险恶，镖镖惊心！】</font>",
		szTime = "每日15:00-16:00<br/><font color='#278cf1'>【活动NPC：襄阳城牛冲天】</font>";
		szName = '行镖江湖',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function()  MovementFunction[10]() end,
		bButton  = true,
		szButtonText = "立即前往",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_xingbiaojianghu_xiao.png',
		picMovement1 = 'HD_AnNiu_xingbiaojianghu_da.png',	
		dwLimitLevel = 45,
		picList =
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '巨额真气！！'},
			[3] = {picPath = 'Qita_lijin.png',szDes = '大量礼金'},	
			[4] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量商城道具'},

		},
		tTipConfig = 
		{
			szHuoDongName = '行镖江湖',
			szHongDongTime = "每日15:00-16:00<br/><font color='#278cf1'>【活动NPC：襄阳城牛冲天】</font>",
			szHuoDongText = "通过襄阳城牛冲天进入行镖地图，成功将镖车押运到目的地即可获得丰厚的奖励，运镖过程中小心其他玩家杀人劫取押运镖车。",
			szStartName = '立即前往',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CTaskSystem:DoTaskLinkClick({param='move,1002,-30.64,-91.60'},true)",
			dwLimitLevel = 45,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 60*60*1000;-- 活动开始后几分钟消失
		};
	},
	----桃花迷阵
	[17] =
	{	
		dwID = 12001,	
		szDetailDes = "寻寻觅觅，进进出出，来来去去匆匆。四通八达岔口，尽是似曾相识。笑天下英雄无数，这地界，几人得出？<br/><font color='#fed904'>【只要成功破阵，皆有不菲收益】</font>",
		szTime = "每日17:30-18:00<br/><font color='#278cf1'>50级可进入，【活动NPC：襄阳城叶锦溪】</font>";
		szName = '桃花迷阵',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function() MovementFunction[8]() end,
		bButton  = true,
		szButtonText = "立即前往",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_taohuamizhen_xiao.png',
		picMovement1 = 'HD_AnNiu_taohuamizhen_da.png',	
		dwLimitLevel = 50,
		picList =
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			[2] = {picPath = 'Qita_zhenqi.png',szDes = '巨额真气！！'},
			[3] = {picPath = 'Qita_money.png',szDes = '巨额银两！！'},

		},
		tTipConfig = 
		{
			szHuoDongName = '桃花迷阵',
			szHongDongTime = "每日17:30-18:00<br/><font color='#278cf1'>【活动NPC：襄阳城叶锦溪】</font>",
			szHuoDongText = "只要破阵成功即可获得高额奖励，排名前三的侠士更将获得巨额经验、真气、银两奖励！",
			szStartName = '立即前往',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CTaskSystem:DoTaskLinkClick({param='move,1002,5,13'},true)",
			dwLimitLevel = 50,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 30*60*1000;-- 活动开始后几分钟消失
		};
	},
	--小猪快跑
	[18] =
	{	
		dwID = 0,	
		szDetailDes = "陨石天降，砸坏猪圈，惊呆众猪群；群猪四蹿，或逃或奔，愁煞养猪人。急寻江湖侠士，擒猪入圈，自有厚赠。<br/><font color='#fed904'>【赶猪进圈，巨额经验就在眼前】</font>",
		szTime = "<font color='#278cf1'>全天24小时开放</font><br/><font color='#DD4747'>注：45级以上的侠士方可参与。猪群数量庞大，请组队参与活动！</font>";
		szName = '小猪快跑',
		szType = "<font color='#fed904'>全天</font>",
		Func = function()  MovementFunction[12]() end,
		bButton  = true,
		szButtonText = "立即参与",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_xiaozhukuaipao_xiao.png',
		picMovement1 = 'HD_AnNiu_xiaozhukuaipao_da.png',	
		dwLimitLevel = 45,
		picList =
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			--[2] = {picPath = 'Qita_zhenqi.png',szDes = '巨额真气！！'},
			--[1] = {picPath = 'Qita_money.png',szDes = '巨额银两！！'},
    
		},
		-- --提示时间配置
		-- Notice = {
			-- nShowTime = 90*60*1000; -- 提前几分钟出现
			-- nType     = 1; 			-- 消失类型
			-- nHideTime = 15*60*1000;-- 活动开始后几分钟消失
		-- };
	},
	--跨服战-群雄争霸
	[19] =
	{	
		dwID = 13002,	
		szDetailDes = "冰火孤岛，宝刀现身，至尊谁属，跨服来战！重利高悬，勇者何在！<br/><font color='#fed904'>【武林至尊，宝刀屠龙；号令天下，谁与争锋！】</font>",
		szTime = "每周一20:00-21:00<br/><font color='#278cf1'>65级且战斗力达10W便可进入，【活动按钮：跨服战场】</font><br/><font color='#DD4747'>武林至尊，宝刀屠龙；号令天下，谁与争锋！</font>";
		szName = '群雄争霸',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function()  MovementFunction[14]() end,
		bButton  = true,
		szButtonText = "立即参战",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_qxzb_xiao.png',
		picMovement1 = 'HD_AnNiu_qxzb_da.png',	
		dwLimitLevel = 65,
		picList =
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			[2] = {picPath = 'rongyu.png',szDes = '巨额荣誉！！'},
			[3] = {picPath = 'TuLongDao.png',szDes = '争夺屠龙宝刀！！'},    
		},
		tTipConfig = 
		{
			szHuoDongName = '群雄争霸',
			szHongDongTime = "每周一20:00-21:00<br/><font color='#278cf1'>【活动按钮：跨服战场】</font>",
			szHuoDongText = "武林至尊，宝刀屠龙；号令天下，谁与争锋！",
			szStartName = '立即参战',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CrossSevLoginUI:Open()",
			dwLimitLevel = 65,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 60*60*1000;-- 活动开始后几分钟消失
		};
	},
	-- --侠客岛
	[20] =
	{	
		dwID = 13001,	
		szDetailDes = "铁牌一枚，赏善罚恶，问江湖豪杰，谁敢接令？热粥一碗，恶名妙用，邀武林英雄，分而食之。十年之期已到，侠客岛重现于世，你，可敢同去？<br/><font color='#fed904'>【登上侠客岛，好处少不了】</font>",
		szTime = "每日13:00-13:40<br/><font color='#278cf1'>50级可进入，【活动NPC：襄阳城叶锦溪】</font><br/><font color='#DD4747'>注：必须单枪匹马来，丰厚的奖励等你拿</font>";
		-- szTime = "<font color='#278cf1'>每日18:00-18:40</font><br/><font color='#DD4747'>注：50级以上的侠士方可参与。【活动NPC：襄阳城叶锦溪】</font>";
		szName = '侠客岛',
		szType = "<font color='#278cf1'>限时</font>",
		Func = function()  MovementFunction[13]() end,
		bButton  = true,
		szButtonText = "立即前往",
		--szFormatFun = "return CTreasrueMapSystem:GetOnDayUseNum()",
		szFormatWan = 0,
		picMovement = 'HD_AnNiu_xiakedao_xiao.png',
		picMovement1 = 'HD_AnNiu_xiakedao_da.png',	
		dwLimitLevel = 50,
		picList =
		{
			[1] = {picPath = 'Qita_exp.png',szDes = '巨额经验！！'},
			--[2] = {picPath = 'Qita_zhenqi.png',szDes = '巨额真气！！'},
			[2] = {picPath = 'Qita_money.png',szDes = '巨额银两！！'},
			[3] = {picPath = 'Icon_item_5500460_1.png',szDes = '大量珍贵道具'},    
		},
		tTipConfig = 
		{
			szHuoDongName = '侠客岛',
			szHongDongTime = "每日13:00-13:40<br/><font color='#278cf1'>【活动NPC：襄阳城叶锦溪】</font>",
			szHuoDongText = "单枪匹马来，杀BOSS、抢宝箱，丰厚的奖励等你拿!",
			szStartName = '立即前往',
			--ok按钮 链接 (可不填，不填则打开活动界面)
			szStartFun ="CTaskSystem:DoTaskLinkClick({param='move,1002,5,13'},true)",
			dwLimitLevel = 50,
		},
		--提示时间配置
		Notice = {
			nShowTime = 15*60*1000; -- 提前几分钟出现
			nType     = 1; 			-- 消失类型
			nHideTime = 40*60*1000;-- 活动开始后几分钟消失
		};
	},
}

function MovementConfig:GetNoticeInfo(nID)
	for k,v in ipairs(MovementConfig) do
		if v.dwID == nID then
			return v.Notice,k;
		end
	end
	return nil,nil;
end
------------------------------------------------------------------------------------------------------------------
