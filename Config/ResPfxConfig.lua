_G.ResPfxConfig =
{
-------------------------------标配、示例----------------------------
   --[ID] = { ----------标准配置，下面参数，如果没有则直接不填  或者值填nil，减少服务器判断时间，提高效率
	    --delay=2500,		--特效延迟时间
		--bBind = true; --设置特效不追尾     true:不追     false:追
		--pfxName = "TX_liandao_juesedenglu.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		--MoveStop =nil,--技能结束偏移
		--MoveTime = nil,		--技能偏移时间
		--ScalingStart = nil, --放缩
		--ScalingStop = nil,
		--ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		--RotationStop = nil,
		--RotationTime = nil, 
	--};
	---■■■■0号ID不要用，其他地方有需要0
	----------------------传送阵通用光效01
	[1] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_chuansongzhen01.pfx",
		MoveStart=_Vector3.new(-1,0,0),--特效起始偏移
		MoveStop =_Vector3.new(0,math.pi/2,0),--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};

	----------------------传送阵通用光效02
	[2] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_Qita_Csz.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	---------------------选中光效---可攻击（红色）
	[3] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_QiTa_XuanZhong_Kgj_001.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	---------------------4号特效不能用，有BUG，注释掉！！
	--[4] = { 
	    --delay=nil,		--特效延迟时间
		--pfxName = ".pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		--MoveStop =nil,--技能结束偏移
		--MoveTime = nil,		--技能偏移时间
		--ScalingStart = nil, --放缩
		--ScalingStop = nil,
		--ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		--RotationStop = nil,
		--RotationTime = nil, 
	--};
	
	---------------------选中光效---不可攻击（玩家-蓝色）
	[5] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_QiTa_XuanZhong_Bkgj_003.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		--MoveStop =nil,--技能结束偏移
		--MoveTime = nil,		--技能偏移时间
		--ScalingStart = nil, --放缩
		--ScalingStop = nil,
		--ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		--RotationStop = nil,
		--RotationTime = nil, 
	};
	
	---------------------选中光效---不可攻击（绿色）
	[6] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_QiTa_XuanZhong_Bkgj_001.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	---------------------上马特效
	[8] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_mashu01.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	---------------------下马特效
	[9] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_mashu02.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	-------------天气特效-■■■ delay=特效延迟时间,bBind=特效不追尾
	---------------------天气特效--下雨
	[10] = {delay=nil,bBind = false;pfxName = "TianQi_yu.pfx",};
	---------------------天气特效--下雪
	[11] = {delay=nil,bBind = false;pfxName = "TianQi_xue.pfx",};
	---------------------天气特效--下沙
	[12] = {delay=nil,bBind = true;pfxName = "TianQi_fengsha.pfx",ignoreRot = true;};
	---------------------天气特效--花瓣
	[13] = {delay=nil,bBind = false;pfxName = "TianQi_huaban.pfx",};
	-------------天气特效-▲▲▲
	
	-------------界面特效-■■■ delay=特效延迟时间,bBind=特效不追尾
	------------------UI界面_升级
	[20] = {delay=nil,bBind = true;pfxName = "TX_ui_level_up.pfx",};
	------------------达成任务条件
	[21] = {delay=nil,bBind = true;pfxName = "TX_ui_rw_dc.pfx",};
	-------------------技能学习特效
	[22] = {delay=nil,bBind = true;pfxName = "TX_ui_skillstudy.pfx",};
	-------------------接到任务
	[23] = {delay=nil,bBind = true;pfxName = "TX_ui_rw_js.pfx",};
	-------------------杀死BOSS
	[24] = {delay=nil,bBind = true;pfxName = "TX_ui_boss_js.pfx",};
	-------------------完成任务
	[25] = {delay=nil,bBind = true;pfxName = "TX_ui_rw_wc.pfx",};
	-------------------装备兵魂强化
	[26] = {delay=nil,bBind = true;pfxName = "TX_ui_zb_bhup.pfx",};
	-------------------装备强化
	[27] = {delay=nil,bBind = true;pfxName = "TX_ui_zb_qhup.pfx",};
	-------------------装备升阶
	[28] = {delay=nil,bBind = true;pfxName = "TX_ui_zb_up.pfx",};
	-------------------装备洗炼类型
	[29] = {delay=nil,bBind = true;pfxName = "TX_ui_zb_lxup.pfx",};
	-------------------装备洗炼品质
	[30] = {delay=nil,bBind = true;pfxName = "TX_ui_zb_pzup.pfx",};
	-------------------装备洗炼数值
	[31] = {delay=nil,bBind = true;pfxName = "TX_ui_zb_szup.pfx",};
	-------------------坐骑技能提升
	[32] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_skillup.pfx",};
	-------------------坐骑技能学习
	[33] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_skillstudy.pfx",};
	-------------------坐骑品质提升
	[34] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_pzup.pfx",};
	-------------------坐骑升阶
	[35] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_up.pfx",};
	-------------------鼠标点击
	[36] = {delay=nil,bBind = true;pfxName = "TX_ui_rw_sbdj.pfx",};
	-------------------成为VIP
	[37] = {delay=nil,bBind = false;pfxName = "TX_ui_vip_cw.pfx",};
	-------------------护身宝甲升阶
	[38] = {delay=nil,bBind = true;pfxName = "TX_ui_bj_up.pfx",};
	-------------------经脉打通
	[39] = {delay=nil,bBind = true;pfxName = "TX_ui_jm_datong.pfx",};
	-------------------境界突破
	[40] = {delay=nil,bBind = true;pfxName = "TX_ui_jj_tupo.pfx",};
	-------------------世家创建
	[41] = {delay=nil,bBind = false;pfxName = "TX_ui_sj_cj.pfx",};
	-------------------五行提升（火）
	[42] = {delay=nil,bBind = true;pfxName = "TX_ui_wx_huoup.pfx",};
	-------------------五行提升（金）
	[43] = {delay=nil,bBind = true;pfxName = "TX_ui_wx_jinup.pfx",};
	-------------------五行提升（木）
	[44] = {delay=nil,bBind = true;pfxName = "TX_ui_wx_muup.pfx",};
	-------------------五行提升（水）
	[45] = {delay=nil,bBind = true;pfxName = "TX_ui_wx_shuiup.pfx",};
	-------------------五行提升（土）
	[46] = {delay=nil,bBind = true;pfxName = "TX_ui_wx_tuup.pfx",};
	-------------------经脉全通
	[47] = {delay=nil,bBind = false;pfxName = "TX_ui_jm_quantong.pfx",};
	-------------------防御资质提升
	[48] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_fyzzup.pfx",};
	-------------------根骨资质提升
	[49] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_ggzzup.pfx",};
	-------------------攻击资质提升
	[50] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_gjzzup.pfx",};
	-------------------技巧资质提升
	[51] = {delay=nil,bBind = true;pfxName = "TX_ui_zq_jqzzup.pfx",};
	-------------------签到成功
	[52] = {delay=nil,bBind = true;pfxName = "TX_ui_hd_qdcg.pfx",};
	-------------------系统功能开放
	[53] = {delay=nil,bBind = false;pfxName = "TX_ui_gn_kf.pfx",};
	-------------------测试用
	[54] = {delay=nil,bBind = false;pfxName = "TX_ui_gn_ts.pfx",};
	-------------------煞元
	[55] = {delay=nil,bBind = false;pfxName = "TX_ui_lz_nq_hq.pfx",};
	-------------------五行特效
	[56] = {delay=nil,bBind = false;pfxName = "TX_ui_wx_jx_jd.pfx",};
	-------------------坐骑升阶界面特效
	[57] = {delay=nil,bBind = false;pfxName = "TX_ui_zq_sj_sx.pfx",};
	-------------------护身宝甲熔炼 --进度条
	[58] = {delay=nil,bBind = false;pfxName = "TX_ui_jj_tp_cg.pfx",};
	-------------------护身宝甲熔炼01 --正方形
	[59] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_rl_cg_01.pfx",};
	-------------------护身宝甲熔炼02 --集聚
	[60] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_rl_cg_02.pfx",};
	-------------------境界突破失败特效
	[61] = {delay=nil,bBind = false;pfxName = "TX_ui_jj_tp_sb.pfx",};
	-------------------聊天喇叭特效
	[62] = {delay=nil,bBind = false;pfxName = "TX_ui_lt_lb_hh.pfx",};
	-------------------世家升级
	[63] = {delay=nil,bBind = true;pfxName = "TX_ui_sj_sj.pfx",};
	-------------------丹田等级提升
	[64] = {delay=nil,bBind = true;pfxName = "TX_ui_wx_dtup.pfx",};
	-------------------坐骑升级
	[65] = {delay=nil,bBind = false;pfxName = "TX_ui_zq_levelup.pfx",};
	-------------------经脉
	[66] = {delay=nil,bBind = false;pfxName = "TX_ui_jm_jm_yz.pfx",};
	-------------------排行榜送鲜花
	[67] = {delay=nil,bBind = false;pfxName = "tx_ui_phb_songhua.pfx",};
	-------------------排行榜砸鸡蛋
	[68] = {delay=nil,bBind = false;pfxName = "tx_ui_phb_jidan.pfx",};
	-------------------结婚特效
	[69] = {delay=nil,bBind = false;pfxName = "tx_ui_jiehuntx.pfx",};
	-------------------系统开放UI01
	[70] = {delay=nil,bBind = false;pfxName = "Tx_ui_xt_kf_01.pfx",};
	-------------------系统开放UI02
	[71] = {delay=nil,bBind = false;pfxName = "Tx_ui_xt_kf_02.pfx",};
	-------------------系统开放UI03
	[72] = {delay=nil,bBind = false;pfxName = "Tx_ui_xt_kf_03.pfx",};
	-------------------坐骑升阶01
	[73] = {delay=nil,bBind = false;pfxName = "Tx_ui_zqui_sj_01.pfx",};
	-------------------坐骑升阶02
	[74] = {delay=nil,bBind = false;pfxName = "Tx_ui_zqui_sj_02.pfx",};
	-------------------技能合成
	[75] = {delay=nil,bBind = false;pfxName = "Tx_ui_jnhc_cg_01.pfx",};
	-------------------世家战 复仇01
	[76] = {delay=nil,bBind = false;pfxName = "Tx_ui_sjz_fuchou01.pfx",};
	-------------------世家战 复仇02
	[77] = {delay=nil,bBind = false;pfxName = "Tx_ui_sjz_fuchou02.pfx",MoveStart=_Vector3.new(0,0,4.5),};
	-------------------世家战 鼎的所有权更换UI
	[78] = {delay=nil,bBind = false;pfxName = "Tx_ui_sjz_genghuan.pfx",};
	-------------------装备强化 Npc UI特效   锻造成功
	[79] = {delay=nil,bBind = false;pfxName = "Tx_ui_qh_cg_01.pfx",};
	-------------------装备强化 Npc UI特效   进度条表现
	[80] = {delay=nil,bBind = false;pfxName = "Tx_ui_qh_jd_01.pfx",};
	-------------------装经脉顿悟
	[81] = {delay=nil,bBind = false;pfxName = "Tx_ui_jmdw_jh_01.pfx",};
	-------------------护身宝甲升阶 圆圈特效
	[82] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_up_quan.pfx",};
	-------------------宝甲熔炼成功特效
	[83] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_rl_cg_02.pfx",};
	-------------------经脉打通  按钮特效
	[84] = {delay=nil,bBind = false;pfxName = "Tx_ui_JMbtton_cg_01.pfx",};
	-------------------名剑升阶 UI
	[85] = {delay=nil,bBind = false;pfxName = "Tx_ui_MingJian_ShengJie_01.pfx",};
	-------------------名剑升阶 跳字
	[86] = {delay=nil,bBind = false;pfxName = "TX_ui_up_win.pfx",};
	-------------------获得礼金 跳字
	[87] = {delay=nil,bBind = false;pfxName = "lj_huode_01.pfx",};
	-------------------闭关界面底图特效 01
	[88] = {delay=nil,bBind = false;pfxName = "ui_bg_bg_01.pfx",};
	-------------------闭关界面底图特效 02
	[89] = {delay=nil,bBind = false;pfxName = "ui_bg_bg_02.pfx",};
	-------------------闭关界面底图特效 03
	[90] = {delay=nil,bBind = false;pfxName = "ui_bg_bg_03.pfx",};
	-------------------技能升级特效
	[91] = {delay=nil,bBind = false;pfxName = "ui_skill_sj_01.pfx",};
	-------------------学习技能特效
	[92] = {delay=nil,bBind = false;pfxName = "ui_skill_xx_01.pfx",};
	-------------------骰子
	[93] = {delay=nil,bBind = false;pfxName = "Tx_sz_kuang_01.pfx",};
	------------------排行榜特效框 
	[94] = {delay=nil,bBind = false;pfxName = "TX_ui_phb_kuang.pfx",};	
	-------------------内功 特效01
	[101] = {delay=nil,bBind = false;pfxName = "Tx_ng_bg_01.pfx",};
	-------------------内功 特效02
	[102] = {delay=nil,bBind = false;pfxName = "Tx_ng_bg_02.pfx",};
	-------------------内功 特效03
	[103] = {delay=nil,bBind = false;pfxName = "Tx_ng_bg_03.pfx",};
	-------------------骰子 金
	[104] = {delay=nil,bBind = false;pfxName = "Tx_shaizi_jin.pfx",};
	-------------------骰子 木
	[105] = {delay=nil,bBind = false;pfxName = "Tx_shaizi_mu.pfx",};
	-------------------骰子 水
	[106] = {delay=nil,bBind = false;pfxName = "Tx_shaizi_shui.pfx",};
	-------------------骰子 火
	[107] = {delay=nil,bBind = false;pfxName = "Tx_shaizi_huo.pfx",};
	-------------------骰子 土
	[108] = {delay=nil,bBind = false;pfxName = "Tx_shaizi_tu.pfx",};
	-------------------骰子 环绕特效
	[109] = {delay=nil,bBind = false;pfxName = "Tx_sz_kuang_01.pfx",};
	-------------------冲脉过程中特效
	[110] = {delay=nil,bBind = false;pfxName = "Tx_ui_JMbtton_cg_01.pfx",};
	-------------------冲脉失败飞行特效
	[111] = {delay=nil,bBind = false;pfxName = "Tx_ui_JMbtton_sb_01.pfx",};	
	-------------------内功 特效03
	[112] = {delay=nil,bBind = false;pfxName = "Tx_ng_bg_04.pfx",};
	-------------------挖宝 特效01
	[113] = {delay=nil,bBind = false;pfxName = "Tx_ui_wabao_01.pfx",};
	-------------------挖宝 特效02
	[114] = {delay=nil,bBind = false;pfxName = "Tx_ui_wabao_02.pfx",};
	-------------------风物志 主页签按钮选中特效
	[115] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji_Zhuyeqian.pfx",};
	-------------------风物志 属性总加成按钮特效
	[116] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji_Shuxingjiacheng.pfx",};
	-------------------风物志 列表按钮被选中特效
	[117] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji_Liebiaoxuanzhong.pfx",};
	-------------------副本 成功界面 烟花特效
	[118] = {delay=nil,bBind = false;pfxName = "Tx_ui_xt_kf_01.pfx",};
	-------------------盟主战复仇
	[119] = {delay=nil,bBind = false;pfxName = "TX_mengzhuzhan_fuchou.pfx",};
	-------------------夜战襄阳 玩家斗笠
	[120] = {delay=nil,bBind = false;pfxName = "TX_Yezhanxiangyang_douli.pfx",MoveStart=_Vector3.new(0,0,-0.175),};
	-------------------盟主战 圈01
	[121] = {delay=nil,bBind = false;pfxName = "pfx_XYC_mengzhu_01.pfx",};
	-------------------盟主战 圈02
	[122] = {delay=nil,bBind = false;pfxName = "pfx_XYC_mengzhu_02.pfx",};
	------------------众志成城
	[123] = {delay=nil,bBind = false;pfxName = "TX_ui_zzcc_baoxiang.pfx",};
	------------------众志成城 进度条
	[124] = {delay=nil,bBind = false;pfxName = "TX_ui_zzcc_jindutiao.pfx",};
	------------------众志成城 -- 烟花
	[125] = {delay=nil,bBind = false;pfxName = "Tx_ui_xt_kf_01.pfx",};
	------------------首充特效
	[126] = {delay=nil,bBind = false;pfxName = "TX_ui_Chongzhi_Frist.pfx",};
	------------------龙鼎战特效01
	[127] = {delay=nil,bBind = false;pfxName = "TX_ui_longdingzhan_01.pfx",};
	------------------龙鼎战特效02
	[128] = {delay=nil,bBind = false;pfxName = "TX_ui_longdingzhan_02.pfx",};
	------------------强化卷轴特效01
	[129] = {delay=nil,bBind = false;pfxName = "TX_ui_qianghuajuanzhou_01.pfx",};
	------------------龙强化卷轴特效02
	[130] = {delay=nil,bBind = false;pfxName = "TX_ui_qianghuajuanzhou_02.pfx",};
	------------------闭关  灌注特效
	[131] = {delay=nil,bBind = false;pfxName = "TX_ui_biguan_guanzhu.pfx",};
	------------------闭关 进度增长特效
	[132] = {delay=nil,bBind = false;pfxName = "TX_ui_biguan_zengzhang.pfx",};
	------------------闭关  灌注特效
	[131] = {delay=nil,bBind = false;pfxName = "TX_ui_biguan_guanzhu.pfx",};
	------------------闭关 进度增长特效
	[132] = {delay=nil,bBind = false;pfxName = "TX_ui_biguan_zengzhang.pfx",};
	------------------世家图腾升级   1阶
	[133] = {delay=nil,bBind = false;pfxName = "TX_ui_guild_levelup_01.pfx",};
	------------------世家图腾升级   2阶
	[134] = {delay=nil,bBind = false;pfxName = "TX_ui_guild_levelup_02.pfx",};
	------------------世家图腾升级   3阶
	[135] = {delay=nil,bBind = false;pfxName = "TX_ui_guild_levelup_03.pfx",};
	------------------世家图腾升级   4阶
	[136] = {delay=nil,bBind = false;pfxName = "TX_ui_guild_levelup_04.pfx",};
	------------------世家图腾升级   5阶
	[137] = {delay=nil,bBind = false;pfxName = "TX_ui_guild_levelup_05.pfx",};
	------------------风物志 第二篇  连接特效 01
	[138] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_lianjie_01.pfx",};
	------------------风物志 第二篇  连接特效 02
	[139] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_lianjie_02.pfx",};
	------------------风物志 第二篇  连接特效 03
	[140] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_lianjie_03.pfx",};
	------------------风物志 第二篇  连接特效 04
	[141] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_lianjie_04.pfx",};
	------------------风物志 第二篇  连接特效 05
	[142] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_lianjie_05.pfx",};
	------------------风物志 第二篇  连接特效 06
	[143] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_lianjie_06.pfx",};
	------------------风物志 第二篇  道具图标环绕特效
	[144] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_huanrao_01.pfx",};
	------------------风物志 第二篇  道具图标选择特效
	[145] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_xuanze_01.pfx",};
	------------------风物志 第二篇  道具框选中特效
	[146] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_xuanzhong_01.pfx",};
	------------------风物志 第二篇  特殊属性图标特效
	[147] = {delay=nil,bBind = false;pfxName = "TX_ui_shouji02_teshu_01.pfx",};
	------------------龙强化卷轴特效03
	[148] = {delay=nil,bBind = true;pfxName = "TX_ui_qianghuajuanzhou_03.pfx",};
	------------------炼丹 炼制成功
	[149] = {delay=nil,bBind = true;pfxName = "TX_ui_liandan_lianzhichenggong.pfx",};
	------------------装备修炼 修炼特效
	[150] = {delay=nil,bBind = true;pfxName = "TX_ui_EquiRefine_Refine.pfx",};
	------------------装备修炼 升级特效
	[151] = {delay=nil,bBind = false;pfxName = "TX_ui_EquipRefine_LevelUp.pfx",};
	------------------成功领悟书籍时播放特效
	[152] = {delay=nil,bBind = true;pfxName = "TX_ui_Refine_lingwuchenggong.pfx",};
	------------------宝石铸造特效框 01
	[153] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_zhuzaokuang_01.pfx",};
	------------------宝石铸造成功时播放的特效
	[154] = {delay=nil,bBind = true;pfxName = "TX_ui_Stone_zhuzaochenggong_01.pfx",};
	------------------宝石铸造特效框 02
	[155] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_zhuzaokuang_02.pfx",};
	------------------修行 修行值
	[156] = {delay=nil,bBind = true;pfxName = "TX_ui_Refine_point.pfx",};
	------------------修行 顿悟
	[157] = {delay=nil,bBind = true;pfxName = "TX_ui_Refine_dunwu.pfx",};
	------------------修行 大悟
	[158] = {delay=nil,bBind = true;pfxName = "TX_ui_Refine_dawu.pfx",};
	------------------宝石精魄进度条特效（灰）
	[159] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_jindutiao_hui.pfx",};
	------------------宝石精魄进度条特效1（蓝）
	[160] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_jindutiao_lan.pfx",};
	------------------宝石精魄进度条特效2（紫）
	[161] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_jindutiao_zi.pfx",};
	------------------宝石铸造   铸造成功跳字
	[162] = {delay=nil,bBind = true;pfxName = "TX_ui_Stone_zhuzaochenggong_tiaozi.pfx",};
	------------------疯狂的锄头 挖宝成功
	[163] = {delay=nil,bBind = false;pfxName = "TX_ui_EquipRefine_LevelUp.pfx",};
	------------------个人押镖  镖车图标选中特效
	[164] = {delay=nil,bBind = false;pfxName = "TX_ui_convoy_xuanzhong_01.pfx",};
	------------------无双大佛
	[165] = {delay=nil,bBind = false;pfxName = "TX_sk_WuShuang_004.pfx",};
	------------------滑步特效
	[166] = {delay=nil,bBind = false;pfxName = "Tx_sk_TongYong_11013_001.pfx",};
		------------------宝甲嵌甲 被镶嵌的槽位播放特效_小槽用的
	[167] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_qj_cg_01.pfx",};
		------------------宝甲嵌甲 激活槽位和连接线特效_小槽用的
	[168] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_qj_jh_01.pfx",};
		------------------宝甲嵌甲 被镶嵌的槽位播放特效_大槽用的
	[169] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_qj_cg_02.pfx",};
		------------------宝甲嵌甲 激活槽位和连接线特效_大槽用的
	[170] = {delay=nil,bBind = false;pfxName = "TX_ui_bj_qj_jh_02.pfx",};	
		------------------易筋经     领悟成功跳字
	[171] = {delay=nil,bBind = true;pfxName = "TX_ui_Refine_lingwuchenggong.pfx",};
	------------------附加属性强化成功特效
	[172] = {delay=nil,bBind = false;pfxName = "TX_ui_propertyscroll_shuxingqianghua.pfx",};
	------------------附加属性升阶特效
	[173] = {delay=nil,bBind = false;pfxName = "TX_ui_propertyscroll_shuxingjinjie.pfx",};
	------------------附加属性暴击特效
	[174] = {delay=nil,bBind = true;pfxName = "TX_ui_propertyscroll_baoji.pfx",};

		------------------宝剑 注灵特效
	[175] = {delay=nil,bBind = false;pfxName = "TX_ui_zl_zhulingtexiao.pfx",};
		------------------宝剑 注灵圆点特效
	[176] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingyuandian.pfx",};
		------------------宝剑 注灵剑特效1
	[177] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian1.pfx",};
		------------------宝剑 注灵剑特效2
	[178] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian2.pfx",};
		------------------宝剑 注灵剑特效3
	[179] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian3.pfx",};
		------------------宝剑 注灵剑特效4
	[180] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian4.pfx",};
		------------------宝剑 注灵剑特效5
	[181] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian5.pfx",};
		------------------宝剑 注灵剑特效6
	[182] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian6.pfx",};
		------------------宝剑 注灵剑特效7
	[183] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian7.pfx",};
		------------------宝剑 注灵剑特效8
	[184] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian8.pfx",};
		------------------宝剑 注灵剑特效9
	[185] = {delay=nil,bBind = false;pfxName = "TX_UI_zhulingjian9.pfx",};
			------------------猜棋 翻棋特效
	[186] = {delay=nil,bBind = false;pfxName = "TX_ui_cq_dianji.pfx",};
	------------------宠物领悟技能特效
	[187] = {delay=nil,bBind = false;pfxName = "Tx_Ui_lingwujinengtexiao.pfx",};
	------------------宠物升级技能特效
	[188] = {delay=nil,bBind = false;pfxName = "ui_skill_sj_02.pfx",};
	------------------战斗力界面瞬时特效
	[189] = {delay=nil,bBind = true;pfxName = "TX_ui_zhandoulitisheng.pfx",};	
	------------------阵法-北斗七星 星斗1级特效
	[100001] = {delay=nil,bBind = false;pfxName = "TX_ui_zf_xdtx_01.pfx",};
	------------------阵法-北斗七星 星斗2级特效
	[100002] = {delay=nil,bBind = false;pfxName = "TX_ui_zf_xdtx_03.pfx",};	
	------------------阵法-北斗七星 星斗3级特效
	[100003] = {delay=nil,bBind = false;pfxName = "TX_ui_zf_xdtx_03.pfx",};
	------------------阵法-北斗七星 摇到3颗同样星斗时播放的特效
	[100004] = {delay=nil,bBind = false;pfxName = "TX_ui_zf_xdtx_tyxd.pfx",};
	------------------阵法-北斗七星 摘星换斗按钮特效
	[100005] = {delay=nil,bBind = false;pfxName = "TX_ui_zf_zxhd.pfx",};
	------------------阵法-北斗七星 星斗升级特效
	[100006] = {delay=nil,bBind = false;pfxName = "TX_ui_zf_levelup.pfx",};		
	--[] = {delay=nil,bBind = false;pfxName = "TX_ui_zl_zhulingtexiao.pfx",};	
	-----------------侠义勋章升阶特效
	[100007] = {delay=nil,bBind = false;pfxName = "TX_ui_xiayixunzhang_uplv.pfx",};
	------------------侠义勋章升星特效
	[100008] = {delay=nil,bBind = false;pfxName = "TX_ui_xiayixunzhang_upstar.pfx",};
	------------------宠物指教按钮特效
	[100009] = {delay=nil,bBind = false;pfxName = "TX_ui_zj_zhijiaoanniu.pfx",};
	------------------宠物指教特效
	[100010] = {delay=nil,bBind = false;pfxName = "TX_ui_zj_zhijiaowancheng.pfx",};	
	------------------聚灵珠未聚灵状态
	[100011] = {delay=nil,bBind = false;pfxName = "TX_ui_julingzhu_weijuling.pfx",};	
	------------------聚灵珠未聚灵指向状态
	[100012] = {delay=nil,bBind = false;pfxName = "TX_ui_julingzhu_weijulingxuanzhong.pfx",};	
	------------------聚灵珠聚灵状态
	[100013] = {delay=nil,bBind = false;pfxName = "TX_ui_julingzhu_julingzhong.pfx",};	
	------------------聚灵珠聚灵完成状态
	[100014] = {delay=nil,bBind = false;pfxName = "TX_ui_julingzhu_julingwancheng.pfx",};
	------------------功法-铁布衫 套装升级特效
	[100015] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_levelup.pfx",};
	------------------功法-铁布衫 套装1级特效
	[100016] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_01.pfx",};
	------------------功法-铁布衫 套装2级特效
	[100017] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_02.pfx",};	
	------------------功法-铁布衫 套装3级特效
	[100018] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_03.pfx",};
	------------------功法-铁布衫 套装按钮鼠标移入特效
	[100019] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_tz.pfx",};			
	------------------宝石铸造特效框 03
	[100020] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_zhuzaokuang_03.pfx",};

	------------------群侠挑战 挑战按钮特效
	[10009] = {delay=nil,bBind = false;pfxName = "TX_ui_qxtz_tiaozhan.pfx",};	
	------------------群侠挑战  选择框特效
	[10010] = {delay=nil,bBind = false;pfxName = "TX_ui_qxtz_xuanzekuang.pfx",};	
	------------------江湖侠客  侠客传功按钮轮廓光晕
	[10011] = {delay=nil,bBind = false;pfxName = "TX_ui_xiakechuangonganniu.pfx",};	
	------------------江湖侠客  侠客传功按钮轮廓光晕
	[10012] = {delay=nil,bBind = false;pfxName = "TX_ui_xiakechuangonganniu.pfx",};	
	------------------江湖侠客  侠客传功按钮轮廓光晕
	[10013] = {delay=nil,bBind = false;pfxName = "TX_ui_xiakechuangonganniu.pfx",};	
	------------------功法-童姥功 套装升级特效
	[100021] = {delay=nil,bBind = false;pfxName = "TX_ui_tlg_Suitlevelup.pfx",};
	------------------功法-童姥功 套装1特效
	[100022] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_01.pfx",};
	------------------功法-童姥功 套装2特效
	[100023] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_02.pfx",};	
	------------------功法-童姥功 套装3特效
	[100024] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_01.pfx",};
	------------------功法-童姥功 套装4特效
	[100025] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_02.pfx",};
	------------------功法-童姥功 套装5特效
	[100026] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_01.pfx",};
	------------------功法-童姥功 套装6特效
	[100027] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_02.pfx",};
	------------------功法-童姥功 套装7特效
	[100028] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_01.pfx",};
	------------------功法-童姥功 六和八荒按钮特效
	[100029] = {delay=nil,bBind = false;pfxName = "Tx_ui_tlg_lhbh.pfx",};
	------------------功法-童姥功 人物1级显示特效
	[100030] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_01.pfx",};
	------------------功法-童姥功 人物2级显示特效
	[100031] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_02.pfx",};	
	------------------功法-童姥功 人物3级显示特效
	[100032] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_01.pfx",};
	------------------功法-童姥功 人物4级显示特效
	[100033] = {delay=nil,bBind = false;pfxName = "TX_ui_tbs_dj_02.pfx",};
	------------------功法-童姥功 进度条增长特效
	[100034] = {delay=nil,bBind = false;pfxName = "TX_ui_tlg_zengzhang.pfx",};
	------------------卡片-镶嵌特效
	[100035] = {delay=nil,bBind = false;pfxName = "TX_ui_kp_xiangqian.pfx",};
	------------------卡片-融合特效
	[100036] = {delay=nil,bBind = false;pfxName = "TX_ui_kp_ronghe.pfx",};
	------------------卡片-融合成功特效
	[100037] = {delay=nil,bBind = false;pfxName = "TX_ui_kp_ronghesucceed.pfx",};
	------------------战魂套装特效
	[100038] = {delay=nil,bBind = false;pfxName = "Tx_ui_soulefface.pfx",};
	------------------侠客资质进度条刷新
	[100039] = {delay=nil,bBind = false;pfxName = "TX_ui_xiakezizhi_jindutiaoshuaxin.pfx",};
	------------------侠客资质暴击特效
	[100040] = {delay=nil,bBind = true;pfxName = "TX_ui_xiakezizhi_baoji.pfx",};
	------------------卡片-镶嵌特效
	[100035] = {delay=nil,bBind = false;pfxName = "TX_ui_kp_xiangqian.pfx",};
	------------------卡片-融合特效
	[100036] = {delay=nil,bBind = false;pfxName = "TX_ui_kp_ronghe.pfx",};
	------------------卡片-融合成功特效
	[100037] = {delay=nil,bBind = false;pfxName = "TX_ui_kp_ronghesucceed.pfx",};
	------------------酒葫芦界面等级特效1
	[100041] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_001.pfx",};
	------------------酒葫芦界面等级特效2
	[100042] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_002.pfx",};	
	------------------酒葫芦界面等级特效3
	[100043] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_003.pfx",};
	------------------酒葫芦界面等级特效4
	[100044] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_004.pfx",};
	------------------酒葫芦界面等级特效5
	[100045] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦界面等级特效6
	[100046] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_006.pfx",};	
	------------------酒葫芦界面等级特效7
	[100047] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_007.pfx",};
	------------------酒葫芦界面等级特效8
	[100048] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_008.pfx",};
	------------------酒葫芦界面等级特效9
	[100049] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦界面等级特效10
	[100050] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦界面等级特效11
	[100051] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦界面等级特效12
	[100052] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦界面等级特效13
	[100053] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦界面等级特效14
	[100054] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦界面等级特效15
	[100055] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Jiuhulu_005.pfx",};
	------------------酒葫芦 提交按钮特效
	[100056] = {delay=nil,bBind = false;pfxName = "Tx_ui_jiuhulu_tj.pfx",};	
	------------------酒葫芦 翻倍道具特效框
	[100057] = {delay=nil,bBind = false;pfxName = "tx_ui_jiuhulu_fbk.pfx",};
	------------------酒葫芦 进度条增长特效
	[100058] = {delay=nil,bBind = false;pfxName = "TX_ui_tlg_zengzhang.pfx",};
	------------------酒葫芦 升阶图标播放的瞬时特效
	[100059] = {delay=nil,bBind = false;pfxName = "Tx_ui_jiuhulu_sj_levelup_01.pfx",};
	------------------酒葫芦 升阶特效
	[100060] = {delay=nil,bBind = false;pfxName = "Tx_ui_jiuhulu_sj_levelup_02.pfx",};
	------------------侠客属性 属性提升
	[100061] = {delay=nil,bBind = false;pfxName = "TX_ui_zz_shuxingtisheng.pfx",};
	------------------侠客属性 提升层次
	[100062] = {delay=nil,bBind = false;pfxName = "TX_ui_zz_tishengcengci.pfx",};
	------------------侠客属性 提升属性
	[100063] = {delay=nil,bBind = false;pfxName = "TX_ui_zz_tishengshuxing.pfx",};
	------------------侠客属性 光晕
	[100064] = {delay=nil,bBind = false;pfxName = "TX_ui_zz_guangyun.pfx",};
	------------------侠客属性 远古符文
	[100065] = {delay=nil,bBind = false;pfxName = "TX_ui_zz_yuangufuwen.pfx",};
	------------------宝石铸造特效框 04
	[100066] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_zhuzaokuang_04.pfx",};
	------------------宝石铸造特效框 05
	[100067] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_zhuzaokuang_05.pfx",};
	------------------宝石铸造特效框 06
	[100068] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_zhuzaokuang_06.pfx",};
	------------------屠龙刀 主界面模型特效

	[100069] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_tulongdao.pfx",};
	------------------屠龙刀 佩戴模型特效
	[100070] = {delay=nil,bBind = false;pfxName = "Tx_sk_ZhuJue_tulongdao.pfx",};
	------------------屠龙刀 标记特效
    [100071] = {delay=nil,bBind = false;pfxName = "Tx_kfz_biaoji_01.pfx",};

	------------------聚灵珠聚灵完成状态
	[100072] = {delay=nil,bBind = false;pfxName = "TX_ui_julingzhu_julingwancheng2.pfx",};
	------------------聚灵珠注灵/收获特效
	[100073] = {delay=nil,bBind = false;pfxName = "Tx_Ui_julingzhu_zhuling.pfx",};

	------------------名剑铸造
	[100074] = {delay=nil,bBind = false;pfxName = "Tx_Ui_mingjian_zhuzao.pfx",};
	------------------时装升阶
	[100075] = {delay=nil,bBind = false;pfxName = "Tx_Ui_sz_sj.pfx",};
	------------------时装化身丹光晕
	[100076] = {delay=nil,bBind = false;pfxName = "Tx_Ui_sz_gy.pfx",};
	------到190就会有冲突了---------
	------------------青云勋章刷新特效
	[100077] = {delay=nil,bBind = false;pfxName = "Tx_Ui_qyxz_shuaxin.pfx",};
	------------------青云勋章相同特效
	[100078] = {delay=nil,bBind = false;pfxName = "Tx_Ui_qyxz_xiangtong.pfx",};
	------------------暗器 修炼进度条增长特效
	[100082] = {delay=nil,bBind = false;pfxName = "TX_ui_anqi_zengzhang.pfx",};	
	-------------------暗器升阶特效
	[100083] = {delay=nil,bBind = false;pfxName = "Tx_ui_anqi_ShengJie_01.pfx",};
	------------------噬血按钮 特效
	[100079] = {delay=nil,bBind = false;pfxName = "Tx_Ui_xuemogong_shixie.pfx",};
	------------------噬血进度条增长 特效
	[100080] = {delay=nil,bBind = false;pfxName = "Tx_Ui_xuemogong_jindutiao1.pfx",};
	------------------噬血进度条永久 特效
	[100081] = {delay=nil,bBind = false;pfxName = "Tx_Ui_xuemogong_jindutiao2.pfx",};	
	------------------珍珑棋局  选择框特效
	[100084] = {delay=nil,bBind = false;pfxName = "Tx_Ui_boostouxiang.pfx",};
	------------------功法-独孤九剑 套装升级特效
	[100085] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_Suitlevelup.pfx",};
	------------------功法-独孤九剑 套装1特效
	[100086] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_01.pfx",};
	------------------功法-独孤九剑 套装2特效
	[100087] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_02.pfx",};	
	------------------功法-独孤九剑 套装3特效
	[100088] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_03.pfx",};
	------------------功法-独孤九剑 套装4特效
	[100089] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_04.pfx",};
	------------------功法-独孤九剑 套装5特效
	[100090] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_05.pfx",};
	------------------功法-独孤九剑 套装6特效
	[100091] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_06.pfx",};
	------------------功法-独孤九剑 套装7特效
	[100092] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_07.pfx",};
	------------------功法-独孤九剑 套装8特效
	[100093] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_08.pfx",};
	------------------功法-独孤九剑 套装9特效
	[100094] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_dj_09.pfx",};
	------------------功法-独孤九剑 进度条增长特效
	[100095] = {delay=nil,bBind = false;pfxName = "TX_ui_dugujiujian_zengzhang.pfx",};	
	------------------伐脉按钮 特效
	[100096] = {delay=nil,bBind = false;pfxName = "Tx_Ui_yijinjing_famai.pfx",};
	------------------伐脉进度条增长 特效
	[100097] = {delay=nil,bBind = false;pfxName = "Tx_Ui_yijinjing_jindutiao1.pfx",};
	------------------伐脉进度条永久 特效
	[100098] = {delay=nil,bBind = false;pfxName = "Tx_Ui_yijinjing_jindutiao2.pfx",};
	------------------玄宫按钮 特效
	[100099] = {delay=nil,bBind = false;pfxName = "Tx_Ui_beidouqixingzhen_xuangong.pfx",};
	------------------玄宫进度条增长 特效
	[100100] = {delay=nil,bBind = false;pfxName = "Tx_Ui_beidouqixingzhen_jindutiao1.pfx",};
	------------------玄宫进度条永久 特效
	[100101] = {delay=nil,bBind = false;pfxName = "Tx_Ui_beidouqixingzhen_jindutiao2.pfx",};
	------------------炼体按钮 特效
	[100102] = {delay=nil,bBind = false;pfxName = "Tx_Ui_tiebushan_lianti.pfx",};
	------------------炼体进度条增长 特效
	[100103] = {delay=nil,bBind = false;pfxName = "Tx_Ui_tiebushan_jindutiao1.pfx",};
	------------------炼体进度条永久 特效
	[100104] = {delay=nil,bBind = false;pfxName = "Tx_Ui_tiebushan_jindutiao2.pfx",};
	------------------青云勋章按钮变换 特效
	[100105] = {delay=nil,bBind = false;pfxName = "Tx_Ui_qyxz_anniubianhuan.pfx",};
	------------------通天塔挑战按钮 特效
	[100106] = {delay=nil,bBind = false;pfxName = "Tx_Ui_TongTianTa_tiaozhan.pfx",};	
	------------------通天塔通关01层数特效
	[100107] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_01.pfx",};	
	------------------通天塔通关02层数特效
	[100108] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_02.pfx",};
	------------------通天塔通关03层数特效
	[100109] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_03.pfx",};
	------------------通天塔通关04层数特效
	[100110] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_04.pfx",};
	------------------通天塔通关05层数特效
	[100111] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_05.pfx",};
	------------------通天塔通关06层数特效
	[100112] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_06.pfx",};
	------------------通天塔通关07层数特效
	[100113] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_07.pfx",};
	------------------通天塔通关08层数特效
	[100114] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_08.pfx",};	
	------------------通天塔通关09层数特效
	[100115] = {delay=nil,bBind = false;pfxName = "TX_ui_ta_09.pfx",};		
	------------------战骑诀内丹白色烟雾特效特效
	[100116] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_jindutiao_hui.pfx",};	
	------------------战骑诀内丹红色火焰特效特效
	[100117] = {delay=nil,bBind = false;pfxName = "Tx_Ui_qizhanjue_huo.pfx",};	
	------------------战骑诀进度条特效特效
	[100118] = {delay=nil,bBind = false;pfxName = "Tx_Ui_qizhanjue_jindutiao.pfx",};
	-------------------法宝升阶特效
	[100119] = {delay=nil,bBind = false;pfxName = "Tx_ui_fabao_ShengJie_01.pfx",};	
	------------------还童按钮 特效
	[100120] = {delay=nil,bBind = false;pfxName = "Tx_Ui_tonglaogong_huantong.pfx",};
	------------------还童进度条增长 特效
	[100121] = {delay=nil,bBind = false;pfxName = "Tx_Ui_tonglaogong_jindutiao1.pfx",};
	------------------还童进度条永久 特效
	[100122] = {delay=nil,bBind = false;pfxName = "Tx_Ui_tonglaogong_jindutiao2.pfx",};
	------------------金身人影 特效
	[100123] = {delay=nil,bBind = false;pfxName = "Tx_ui_jinsheng_01.pfx",};	
	------------------金身内丹白色烟雾特效特效
	[100124] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_jindutiao_hui.pfx",};	
	------------------金身内丹红色火焰特效特效
	[100125] = {delay=nil,bBind = false;pfxName = "Tx_Ui_qizhanjue_huo.pfx",};	
	------------------英雄令系列项集齐   特效
	[100126] = {delay=nil,bBind = false;pfxName = "Tx_Ui_yingxiongling_jiqi.pfx",};	
	------------------英雄令镶嵌永久   特效
	[100127] = {delay=nil,bBind = false;pfxName = "Tx_Ui_yingxiongling_xiangqian.pfx",};
	------------------战旗 修炼进度条增长特效
	[100128] = {delay=nil,bBind = false;pfxName = "TX_ui_zhanqi_zengzhang.pfx",};	
	-------------------战旗升阶特效
	[100129] = {delay=nil,bBind = false;pfxName = "Tx_ui_zhanqi_ShengJie_01.pfx",};
	------------------战旗 升阶图标播放的瞬时特效
	[100130] = {delay=nil,bBind = false;pfxName = "Tx_ui_zhanqi_sj_levelup_01.pfx",};
	------------------宝石铸造特效框 06
	[100131] = {delay=nil,bBind = false;pfxName = "TX_ui_Stone_zhuzaokuang_07.pfx",};
	------------------拜关公 祁拜瞬时特效
	[100132] = {delay=nil,bBind = false;pfxName = "Tx_ui_baiguangong_qibai.pfx",};
	------------------拜关公 进度条永久特效
	[100133] = {delay=nil,bBind = false;pfxName = "TX_ui_baiguangong_jindutiao_01.pfx",};	
	------------------炮制按钮 特效
	[100134] = {delay=nil,bBind = false;pfxName = "Tx_Ui_jiuhulu_paozhi.pfx",};
	------------------炮制进度条增长 特效
	[100135] = {delay=nil,bBind = false;pfxName = "Tx_Ui_jiuhulu_jindutiao1.pfx",};	
	
	
	
	-------------界面特效-▲▲▲
	-------------采集特效-■■■ delay=特效延迟时间,bBind=特效不追尾
	---------------------采集NPC围绕特效---信号弹
	[95] = {delay=nil,bBind = false;pfxName = "pfx_xinhaodan.pfx",};
	---------------------采集NPC围绕特效---大粮草堆
	[96] = {delay=nil,bBind = false;pfxName = "pfx_ranshao.pfx",};
	---------------------采集NPC围绕特效---大粮草堆
	[97] = {delay=nil,bBind = true;pfxName = "pfx_XYYJ_WJW_liangcang.pfx",};
	---------------------采集NPC围绕特效---小粮草堆
	[98] = {delay=nil,bBind = true;pfxName = "pfx_NPC_caodui.pfx",};
	---------------------采集NPC围绕特效
	[99] = {delay=nil,bBind = true;pfxName = "pfx_yaocai03.pfx",};
	-------------采集特效-▲▲▲
	
	---------------------飞行特效
	[100] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_Buff_jyzj_chixu.pfx",
		--MoveStart=_Vector3.new(0,2.8,0),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		--RotationStart = _Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	----------采集NPC围绕特效
	[191] = {delay=nil,bBind = false;pfxName = "pfx_cj_jian.pfx",};--剑
	[192] = {delay=nil,bBind = false;pfxName = "pfx_cj_dao.pfx",};--刀
	[193] = {delay=nil,bBind = false;pfxName = "pfx_cj_lian.pfx",};--镰
	[194] = {delay=nil,bBind = false;pfxName = "pfx_cj_qiang.pfx",};--枪
	---------------------宝剑系统UI特效
	----1阶
	[2010] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_001.pfx",};---自身UI
	[2019] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_001_01.pfx",};---背景UI
	----2阶
	[2020] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_002.pfx",};---自身UI
	[2029] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_002_01.pfx",};---背景UI
	----3阶
	[2030] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_003.pfx",};---自身UI
	[2039] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_003_01.pfx",};---背景UI
	----4阶
	[2040] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_004.pfx",};---自身UI
	[2049] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_004_01.pfx",};---背景UI
	----5阶
	[2050] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_005.pfx",};---自身UI
	[2051] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_005_01.pfx",};---自身UI
	[2059] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_005_01.pfx",};---背景UI
	----6阶
	[2060] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_006.pfx",};---自身UI
	[2069] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_006_01.pfx",};---背景UI
	----7阶
	[2070] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_007.pfx",};---自身UI
	[2078] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_007_01.pfx",};---自身UI
	[2079] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_007_02.pfx",};---背景UI
	----8阶
	[2080] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_008.pfx",};---自身UI
	[2088] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_008_01.pfx",};---自身UI
	[2089] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_008_02.pfx",};---背景UI
	----9阶
	[2090] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_009.pfx",};---自身UI
	[2099] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_009_02.pfx",};---背景UI
    ----10阶
	[2100] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_010.pfx",};---自身UI
	[2109] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_010_02.pfx",};---背景UI
	----11阶
	[2110] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_011.pfx",};---自身UI
	[2119] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_011_02.pfx",};---背景UI
	----12阶
	[2120] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_012.pfx",};---自身UI
	[2129] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojian_012_02.pfx",};---背景UI	
	---------------------宝甲系统UI特效
	----1阶
	[2510] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_001.pfx",};
	----2阶
	[2520] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_002.pfx",};
	----3阶
	[2530] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_003.pfx",};
	----4阶
	[2540] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_004.pfx",};
	----5阶
	[2550] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_005.pfx",};
	----6阶
	[2560] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_006.pfx",};
	----7阶
	[2570] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_007.pfx",};
	----8阶
	[2580] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_008.pfx",};
	----9阶
	[2590] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_009.pfx",};
	----10阶
	[2600] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_010.pfx",};
	----11阶
	[2610] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_011.pfx",};
	----12阶
	[2620] = {delay=nil,bBind = false;pfxName = "Tx_Ui_Equip_Baojia_012.pfx",};	
	---------------------变异怪物特效
	[901] = {delay=nil,bBind = false;pfxName = "Tx_Qita_Bianyi_01.pfx",};---	一星
	[902] = {delay=nil,bBind = false;pfxName = "Tx_Qita_Bianyi_02.pfx",};---	二星
	[903] = {delay=nil,bBind = false;pfxName = "Tx_Qita_Bianyi_03.pfx",};---	三星
	[904] = {delay=nil,bBind = false;pfxName = "Tx_Qita_Bianyi_04.pfx",};---	四星
	[905] = {delay=nil,bBind = false;pfxName = "Tx_Qita_Bianyi_05.pfx",};---	五星
	
	[999] = {delay=nil,bBind = false;pfxName = "HuoDong_mzz_guanghuan.pfx",MoveStart=_Vector3.new(0,0,0),};---	盟主令牌
	-------------传送阵地图文字-■■■ delay=特效延迟时间,bBind=特效不追尾
	---丘山村
	[1001] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_Qita_Qyc.pfx",
		MoveStart=_Vector3.new(0,0,1),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	---襄阳城
	[1002] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Xyc.pfx",MoveStart=_Vector3.new(0,0,1),};
	---襄阳野郊
	[1003] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Xyyj.pfx",MoveStart=_Vector3.new(0,0,1),};
	---桃花岛
	[1004] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Thd.pfx",MoveStart=_Vector3.new(0,0,1),};
	---绝情密涧
	[1005] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Jqmj.pfx",MoveStart=_Vector3.new(0,0,1),};
	---大理
	[1006] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Dl.pfx",MoveStart=_Vector3.new(0,0,1),};
	---白驼山
	[1007] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Bts.pfx",MoveStart=_Vector3.new(0,0,1),};
	---终南山
	[1008] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Zns.pfx",MoveStart=_Vector3.new(0,0,1),};
	---丐帮竹林
	[1009] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Gbzl.pfx",MoveStart=_Vector3.new(0,0,1),};
	---华山
	[1010] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Hs.pfx",MoveStart=_Vector3.new(0,0,1),};
	---嵩山
	[1011] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Ss.pfx",MoveStart=_Vector3.new(0,0,1),};
	---昆仑山
	[1012] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Kls.pfx",MoveStart=_Vector3.new(0,0,1),};
	---黑水遗迹
	[1013] = { delay=nil,bBind = true;pfxName = "Tx_Qita_heishuiyiji.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	
	---离开
	[1100] = { delay=nil,bBind = true;pfxName = "Tx_Qita_lk.pfx",MoveStart=_Vector3.new(0,0,1),};
	---上一层
	[1101] = { delay=nil,bBind = true;pfxName = "Tx_Qita_shangyc.pfx",MoveStart=_Vector3.new(0,0,1),};
	---下一层
	[1102] = { delay=nil,bBind = true;pfxName = "Tx_Qita_xiayc.pfx",MoveStart=_Vector3.new(0,0,1),};
	---密境
	[1103] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Mj.pfx",MoveStart=_Vector3.new(0,0,1),};
	---世家战
	[1104] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Sjz.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---失守
	[1105] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Shishou.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---上路密道
	[1106] = { delay=nil,bBind = true;pfxName = "Tx_Qita_slmd.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---下路密道
	[1107] = { delay=nil,bBind = true;pfxName = "Tx_Qita_xlmd.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---左路密道
	[1108] = { delay=nil,bBind = true;pfxName = "Tx_Qita_zlmd.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---右路密道
	[1109] = { delay=nil,bBind = true;pfxName = "Tx_Qita_ylmd.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---太守府
	[1999] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Tsf.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---2号传送阵
	[2000] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Csz_01.pfx",};
	
	---世家战 龙岭迷窟01
	[8001] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk01.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟02
	[8002] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk02.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟03
	[8003] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk03.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟04
	[8004] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk04.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟05
	[8005] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk05.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟06
	[8006] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk06.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟07
	[8007] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk07.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟08
	[8008] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk08.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	---世家战 龙岭迷窟09
	[8009] = { delay=nil,bBind = true;pfxName = "Tx_Qita_Llmk09.pfx",MoveStart=_Vector3.new(0,0,1.5),};
	
	-------------传送阵地图文字-▲▲▲
	
	---技能 BUFF 各类特效
	[50000] = { ----------晕眩效果
	    delay=nil,
		bBind = true,
		pfxName = "BUFF_yunxuan.pfx",
		--MoveStart=_Vector3.new(0,0,0),--特效起始偏移
	};
	[50001] = { ----------毒效果 '毒'字
	    delay=nil,
		bBind = true;
		pfxName = "buff_du.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50002] = { ----------减速冰冻 '冰'字
	    delay=nil,
		bBind = true,
		pfxName = "buff_bing.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50003] = { ----------定身效果的 '定'字
	    delay=nil,
		bBind = true,
		pfxName = "buff_ding.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50004] = { ----------破甲效果的 '破'字
	    delay=nil,
		bBind = true,
		pfxName = "Buff_po.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50005] = { ----------破甲效果的 '晕眩'字
	    delay=nil,
		bBind = true,
		pfxName = "buff_xuanyun.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50006] = { ----------破甲效果的 '卸甲'字
	    delay=nil,
		bBind = true,
		pfxName = "buff_xiejia.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50007] = { ----------破甲效果的 '化劲'字
	    delay=nil,
		bBind = true,
		pfxName = "Buff_huajing.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50008] = { ----------破甲效果的 '缓慢'字
	    delay=nil,
		bBind = true,
		pfxName = "Buff_huanman.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50009] = { ----------破甲效果的 '内伤'字
	    delay=nil,
		bBind = true,
		pfxName = "buff_neishang.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50010] = { ----------持续失血
	    delay=nil,
		bBind = true,
		pfxName = "buff_jianhp.pfx",
		MoveStart=_Vector3.new(0,0,0),--特效起始偏移
	};
	[50011] = { ----------减身法
	    delay=nil,
		bBind = true,
		pfxName = "buff_jianshenfa.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50012] = { ----------减暴击
	    delay=nil,
		bBind = true,
		pfxName = "buff_jianbaoji.pfx",
		MoveStart=_Vector3.new(0,0,1.5),--特效起始偏移
	};
	[50013] = { ----------群侠范围buff
	    delay=nil,
		bBind = true,
		pfxName = "MON_PuTongQingNianDuShuRen_JiNeng01.pfx",
		MoveStart=_Vector3.new(0,0,0),--特效起始偏移
	};
	------------------媒体特效
	[59000] = {delay=nil,bBind = false;pfxName = "buff_meiti_17173.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---17173
	[59001] = {delay=nil,bBind = false;pfxName = "buff_meiti_360.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---360 金玉满堂
	[59002] = {delay=nil,bBind = false;pfxName = "buff_meiti_weishirongyao.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---360 卫士荣耀
	[59003] = {delay=nil,bBind = false;pfxName = "buff_meiti_weishirongyao.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---360 卫士荣耀
	[59004] = {delay=nil,bBind = false;pfxName = "buff_meiti_wodingwangvip.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---我顶网Vip
	[59005] = {delay=nil,bBind = false;pfxName = "buff_meiti_hongwuzunzhe.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---洪武尊者
	[59006] = {delay=nil,bBind = false;pfxName = "buff_meiti_zuanshihuiyuan.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---钻石会员
	[59007] = {delay=nil,bBind = false;pfxName = "buff_meiti_guangquan_jinse.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---光圈 金色
	[59008] = {delay=nil,bBind = false;pfxName = "buff_meiti_guangquan_zise.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---光圈 紫色
	
	[59009] = {delay=nil,bBind = false;pfxName = "buff_meiti_zonghengqiankun.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---纵横乾坤
	[59010] = {delay=nil,bBind = false;pfxName = "buff_meiti_zhengushuojin.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---震古烁今
	
	[59011] = {delay=nil,bBind = false;pfxName = "buff_meiti_xinlingshenhui.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---心领神会
	[59012] = {delay=nil,bBind = false;pfxName = "buff_meiti_xiaoaojianghu.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---笑傲江湖
	[59013] = {delay=nil,bBind = false;pfxName = "buff_meiti_wulinzhizun.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---武林至尊
	[59014] = {delay=nil,bBind = false;pfxName = "buff_meiti_weiwoduzun.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---唯我独尊
	[59015] = {delay=nil,bBind = false;pfxName = "buff_meiti_wanrengufeng.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---万人古风
	[59016] = {delay=nil,bBind = false;pfxName = "buff_meiti_tianrenheyi.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---天人合一
	[59017] = {delay=nil,bBind = false;pfxName = "buff_meiti_taishanbeidou.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---泰山北斗
	[59018] = {delay=nil,bBind = false;pfxName = "buff_meiti_suoxiangpimi.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---所向披靡
	[59019] = {delay=nil,bBind = false;pfxName = "buff_meiti_shengonggaishi.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---神功盖世
	[59020] = {delay=nil,bBind = false;pfxName = "buff_meiti_ronghuiguantong.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---融会贯通
	
	[59021] = {delay=nil,bBind = false;pfxName = "buff_meiti_pinitianxia.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---睥睨天下
	[59022] = {delay=nil,bBind = false;pfxName = "buff_meiti_mingzhenhuanyu.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---名震寰宇
	[59023] = {delay=nil,bBind = false;pfxName = "buff_meiti_mingdongtianxia.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---名动天下
	[59024] = {delay=nil,bBind = false;pfxName = "buff_meiti_luhuochunqing.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---炉火纯青
	[59025] = {delay=nil,bBind = false;pfxName = "buff_meiti_lueyouxiaocheng.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---略有小成
	[59026] = {delay=nil,bBind = false;pfxName = "buff_meiti_liangleichadao.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---两肋插刀
	[59027] = {delay=nil,bBind = false;pfxName = "buff_meiti_kuangshiqicai.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---旷世奇才
	[59028] = {delay=nil,bBind = false;pfxName = "buff_meiti_juedaitianjiao.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---绝代天骄
	[59029] = {delay=nil,bBind = false;pfxName = "buff_meiti_jingshihaisu.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---惊世骇俗
	[59030] = {delay=nil,bBind = false;pfxName = "buff_meiti_hengsaotianxia.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---横扫天下
	
	[59031] = {delay=nil,bBind = false;pfxName = "buff_meiti_hanyoudishou.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---罕有敌手
	[59032] = {delay=nil,bBind = false;pfxName = "buff_meiti_gaoshenmoce.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---高深莫测
	[59033] = {delay=nil,bBind = false;pfxName = "buff_meiti_fengchenyinxia.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---风尘饮下
	[59034] = {delay=nil,bBind = false;pfxName = "buff_meiti_fanpuguizhen.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---返璞归真
	[59035] = {delay=nil,bBind = false;pfxName = "buff_meiti_duguqiubai.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---独孤求败
	[59036] = {delay=nil,bBind = false;pfxName = "buff_meiti_dengfengzaoji.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---登峰造极
	[59037] = {delay=nil,bBind = false;pfxName = "buff_meiti_chushenruhua.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---出神入化
	[59038] = {delay=nil,bBind = false;pfxName = "buff_meiti_chuleibacui.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---出类拔萃
	[59039] = {delay=nil,bBind = false;pfxName = "buff_meiti_chukuimenjing.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---初窥门径
	[59040] = {delay=nil,bBind = false;pfxName = "buff_meiti_aoshiqunxiong.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---傲视群雄
	[59041] = {delay=nil,bBind = false;pfxName = "Tx_chenghao_01.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---称号光圈	
	[59042] = {delay=nil,bBind = false;pfxName = "Tx_chenghao_02.pfx",MoveStart=_Vector3.new(0,0,0.2),ignoreRot = true};---金色光圈	
	----------------坐骑特效
	--------马
	[70000] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Ma03_01.pfx",};
	[70001] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Ma03_02.pfx",};
	
	[71000] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Ma01_01.pfx",}; ---1阶 无 特效的 马
	[71001] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Ma02_01.pfx",};	---2阶 无 特效的 马
	[71002] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Ma03_01.pfx",};	---3阶 无 特效的 马
	[71003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Ma03_02.pfx",};	---3阶 有 特效的 马
	--犀牛
	[70010] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Xiniu_01.pfx",};
	[70011] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Xiniu_02.pfx",};
	
	[71010] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Xiniu01_01.pfx",};---1阶 无 特效的 犀牛
	[71011] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Xiniu02_01.pfx",};---2阶 无 特效的 犀牛
	[71012] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Xiniu03_01.pfx",};---3阶 无 特效的 犀牛
	[71013] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Xiniu03_02.pfx",};---3阶 有 特效的 犀牛
	--大象
	[70020] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Xiang_01.pfx",};
	[70021] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Xiang_02.pfx",};
	[70022] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Xiang_03.pfx",};
	
	[71020] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Xiang01_01.pfx",};---1阶 无 特效的 大象
	[71021] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Xiang02_01.pfx",};---2阶 无 特效的 大象
	[71022] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Xiang03_01.pfx",};---3阶 无 特效的 大象
	[71023] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Xiang03_02.pfx",};---3阶 有 特效的 大象
	--豹子
	[70030] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Bao03_01.pfx",};
	[70031] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Bao03_02.pfx",};
	
	[71030] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Bao01_01.pfx",};---1阶 无 特效的 豹子
	[71031] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Bao02_01.pfx",};---2阶 无 特效的 豹子
	[71032] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Bao03_01.pfx",};---3阶 无 特效的 豹子
	[71033] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Bao03_02.pfx",};---3阶 有 特效的 豹子
	--野猪
	[70040] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Zhu_01.pfx",};
	[70041] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Zhu_02.pfx",};
	[70042] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Zhu_03.pfx",};
	
	[71040] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Zhu04_01.pfx",};---4阶 无 特效的 野猪
	[71041] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Zhu04_02.pfx",};---4阶 有 特效的 野猪
	--蝎子
	[70050] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Xiezi_01.pfx",};
	[70051] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Xiezi_02.pfx",};
	[70052] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Xiezi_03.pfx",};
	[70053] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Xiezi_04.pfx",};
	[70054] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Xiezi_05.pfx",};
	
	[71050] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Xiezi05_01.pfx",};---5阶 无 特效的 蝎子
	[71051] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Xiezi05_02.pfx",};---5阶 有 特效的 蝎子
	--乌龟
	[70060] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_01.pfx",};
	[70061] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_02.pfx",};
	[70062] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_03.pfx",};
	[70063] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_04.pfx",};
	[70064] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_06.pfx",};
	[70065] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_06.pfx",};
	[70066] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_06.pfx",};
	[70067] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_06.pfx",};
	[70068] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_06.pfx",};
	[70069] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_06.pfx",};
	[71069] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_EGui06_05.pfx",};--ID借用下面的UI规则

	[71060] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_EGui06_01.pfx",};---6阶 无 特效的 乌龟
	[71061] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_EGui06_02.pfx",};---6阶 有 特效的 乌龟
	--白虎
	[70070] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu07_01.pfx",};
	[70071] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Baihu07_02.pfx",};
	[70072] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu07_02.pfx",};
	[70073] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu07_03.pfx",};
	[70074] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu07_04.pfx",};
	[70075] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Baihu07_05.pfx",};
	
	[71070] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Baihu07_01.pfx",};---7阶 无 特效的 白虎
	[71071] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Baihu07_02.pfx",};---7阶 有 特效的 白虎
	--白虎转生特效
	[7301001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu01_01.pfx",};
	[7301002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu01_02.pfx",};
	[7301003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu01_03.pfx",};
	[7301004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu01_04.pfx",};
	[7301005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu01_05.pfx",};
	[7301006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu01_06.pfx",};
	[7301007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu01_07.pfx",};
	
	[7302001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu02_01.pfx",};
	[7302002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu02_02.pfx",};
	[7302003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu02_03.pfx",};
	[7302004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu02_04.pfx",};
	[7302005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu02_05.pfx",};
	[7302006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu02_06.pfx",};
	[7302007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu02_07.pfx",};
	
	[7303001]= {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu03_01.pfx",};
	[7303002]= {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu03_02.pfx",};
	[7303003]= {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu03_03.pfx",};
	[7303004]= {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu03_04.pfx",};
	[7303005]= {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu03_05.pfx",};
	[7303006]= {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu03_06.pfx",};
	[7303007]= {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Baihu03_07.pfx",};
	
	
	--朱雀
	[70080] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_01.pfx",};
	[70081] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_04.pfx",};
	[70082] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_03.pfx",};
	[70083] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_05.pfx",};
	[70084] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Fhuang08_06.pfx",};
	[70085] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_02.pfx",};
	[70086] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_09.pfx",};
	[70087] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_08.pfx",};
	[70088] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang08_07.pfx",};
	
	[71080] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_UI_Fhuang08_01.pfx",};---8阶 无 特效的 朱雀
	[71081] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Fhuang08_02.pfx",};---8阶 有 特效的 朱雀
	--朱雀转生特效
	[7401001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_01.pfx",};
	[7401002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_02.pfx",};
	[7401003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_03.pfx",};
	[7401004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_04.pfx",};
	[7401005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_05.pfx",};
	[7401006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_06.pfx",};
	[7401007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_07.pfx",};
	[7401008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_08.pfx",};
	[7401009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_09.pfx",};
	[7401010] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang09_10.pfx",};
	
	[7402001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_01.pfx",};
	[7402002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_02.pfx",};
	[7402003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_03.pfx",};
	[7402004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_04.pfx",};
	[7402005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_05.pfx",};
	[7402006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_06.pfx",};
	[7402007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_07.pfx",};
	[7402008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_08.pfx",};
	[7402009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_09.pfx",};
	[7402010] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang10_10.pfx",};
	
	[7403001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_01.pfx",};
	[7403002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_02.pfx",};
	[7403003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_03.pfx",};
	[7403004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_04.pfx",};
	[7403005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_05.pfx",};
	[7403006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_06.pfx",};
	[7403007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_07.pfx",};
	[7403008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_08.pfx",};
	[7403009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_09.pfx",};
	[7403010] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Fhuang11_10.pfx",};
	
	--青龙
	--[70090] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_01.pfx",};
	    ---因为青龙使用特效很多，故ID单独特例
	[70901] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_01.pfx",};
	[70902] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_02.pfx",};
	[70903] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_01.pfx",};
	[70904] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_03.pfx",};
	[70905] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_03.pfx",};
	--[70906] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_04.pfx",};
	[70907] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_05.pfx",};
	[70908] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_06.pfx",};
	[70909] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70910] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70911] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70912] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70913] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70914] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70915] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70916] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70917] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70918] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70919] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70920] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70921] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70922] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70923] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70924] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70925] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_07.pfx",};
	[70926] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_11.pfx",};
	[70927] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_11.pfx",};
	[70928] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_11.pfx",};
	[70929] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_QingLong09_12.pfx",};
	[70930] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70931] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70932] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70933] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70934] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70935] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70936] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70937] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70938] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70939] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70940] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70941] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70942] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70943] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70944] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	[70945] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong09_13.pfx",};
	
	[70950] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Jinlong_01.pfx",};
	[70951] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Jinlong_02.pfx",};
	[70952] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Jinlong10_11.pfx",};
	[70953] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Jinlong10_12.pfx",};
	[70954] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Jinlong10_13.pfx",};
	[70955] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Jinlong_03.pfx",};
	
	[71090] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_QingLong09_01.pfx",};
	
	--青龙转生特效
	[7501001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_01.pfx",};
	[7501002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_02.pfx",};
	[7501003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_03.pfx",};
	[7501004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_05.pfx",};
	[7501005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_06.pfx",};
	[7501006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_07.pfx",};
	[7501007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_11.pfx",};
	[7501008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_12.pfx",};
	[7501009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong01_13.pfx",};
	
	[7502001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_01.pfx",};
	[7502002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_02.pfx",};
	[7502003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_03.pfx",};
	[7502004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_05.pfx",};
	[7502005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_06.pfx",};
	[7502006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_07.pfx",};
	[7502007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_11.pfx",};
	[7502008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_12.pfx",};
	[7502009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong02_13.pfx",};
	
	[7503001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_01.pfx",};
	[7503002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_02.pfx",};
	[7503003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_03.pfx",};
	[7503004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_05.pfx",};
	[7503005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_06.pfx",};
	[7503006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_07.pfx",};
	[7503007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_11.pfx",};
	[7503008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_12.pfx",};
	[7503009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_QingLong03_13.pfx",};
	
	
	--狼
	[70100] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Lang05_01.pfx",};
	[70101] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Lang05_03.pfx",};
	[70102] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Lang05_04.pfx",};
	[70103] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Lang05_04.pfx",};
	[70104] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Lang05_02.pfx",};
	[70105] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Lang05_06.pfx",};
	[70106] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Lang05_07.pfx",};
	[70107] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Lang05_08.pfx",};
	[70108] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Lang05_09.pfx",};
	[70109] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Lang05_10.pfx",};

	[71100] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_UI_Lang05_01.pfx",};
	--麒麟
	[72101] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_01.pfx",};
	[72102] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_02.pfx",};
	[72103] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_03.pfx",};
	[72104] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_04.pfx",};
	[72105] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_05.pfx",};
	[72106] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_06.pfx",};
	[72107] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_07.pfx",};
	[72108] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_08.pfx",};
	[72109] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_09.pfx",};
	[72110] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_10.pfx",};
	[72111] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_11.pfx",};
	[72112] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_12.pfx",};
	[72113] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_13.pfx",};
	[72114] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_14.pfx",};
	[72115] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_15.pfx",};
	[72116] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_16.pfx",};
	[72117] = {delay=nil,bBind = true,pfxName = "Tx_Zuoqi_Qilin_17.pfx",};
	
	--麒麟转生特效
	[7601001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_01.pfx",};
	[7601002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_02.pfx",};
	[7601003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_03.pfx",};
	[7601004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_04.pfx",};
	[7601005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_05.pfx",};
	[7601006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_06.pfx",};
	[7601007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_07.pfx",};
	[7601008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_08.pfx",};
	[7601009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_09.pfx",};
	[7601010] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_10.pfx",};
	[7601011] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_11.pfx",};
	[7601012] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_12.pfx",};
	[7601013] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_13.pfx",};
	[7601014] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_14.pfx",};
	[7601015] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_15.pfx",};
	[7601016] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_16.pfx",};
	[7601017] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin02_17.pfx",};
	
	[7602001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_01.pfx",};
	[7602002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_02.pfx",};
	[7602003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_03.pfx",};
	[7602004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_04.pfx",};
	[7602005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_05.pfx",};
	[7602006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_06.pfx",};
	[7602007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_07.pfx",};
	[7602008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_08.pfx",};
	[7602009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_09.pfx",};
	[7602010] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_10.pfx",};
	[7602011] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_11.pfx",};
	[7602012] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_12.pfx",};
	[7602013] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_13.pfx",};
	[7602014] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_14.pfx",};
	[7602015] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_15.pfx",};
	[7602016] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_16.pfx",};
	[7602017] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin03_17.pfx",};
	
	[7603001] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_01.pfx",};
	[7603002] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_02.pfx",};
	[7603003] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_03.pfx",};
	[7603004] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_04.pfx",};
	[7603005] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_05.pfx",};
	[7603006] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_06.pfx",};
	[7603007] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_07.pfx",};
	[7603008] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_08.pfx",};
	[7603009] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_09.pfx",};
	[7603010] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_10.pfx",};
	[7603011] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_11.pfx",};
	[7603012] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_12.pfx",};
	[7603013] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_13.pfx",};
	[7603014] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_14.pfx",};
	[7603015] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_15.pfx",};
	[7603016] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_16.pfx",};
	[7603017] = {delay=nil,bBind = false,pfxName = "Tx_Zuoqi_Qilin04_17.pfx",};
	
	-------------装备强化特效-■■■ delay=特效延迟时间,bBind=特效不追尾
	----镰刀防具-手-强5
	[80101] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_001.pfx",};
	----镰刀防具-脚-强5
	[80102] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----镰刀防具-衣-强5
	[80103] = {delay=nil,bBind = false;pfxName = "Tx_lian_fangju_001.pfx",};
	----镰刀防具-手-强10
	[80111] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_001.pfx",};
	----镰刀防具-脚-强10
	[80112] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----镰刀防具-衣-强10
	[80113] = {delay=nil,bBind = false;pfxName = "Tx_lian_fangju_002.pfx",};
	----镰刀防具-手-强15
	[80121] = {delay=nil,bBind = false;pfxName = "Tx_sk_dao_zhuangbei_shou.pfx",};
	----镰刀防具-脚-强15
	[80122] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----镰刀防具-衣-强15
	[80123] = {delay=nil,bBind = false;pfxName = "Tx_lian_fangju_003.pfx",};
--------
	----剑防具-手-强5
	[80201] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_001.pfx",};
	----剑防具-脚-强5
	[80202] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----剑防具-衣-强5
	[80203] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----剑防具-手-强10
	[80211] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_002.pfx",};
	----剑防具-脚-强10
	[80212] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----剑防具-衣-强10
	[80213] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_002.pfx",};

	----剑防具-手-强15
	[80221] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_003.pfx",};
	----剑防具-脚-强15
	[80222] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----剑防具-衣-强15
	[80223] = {delay=nil,bBind = false;pfxName = "Tx_jian_fangju_003.pfx",};
-----
	----刀防具-手-强5
	[80301] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_001.pfx",};
	----刀防具-脚-强5
	[80302] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----刀防具-衣-强5
	[80303] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----刀防具-手-强10
	[80311] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_001.pfx",};
	----刀防具-脚-强10
	[80312] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----刀防具-衣-强10
	[80313] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----刀防具-手-强15
	[80321] = {delay=nil,bBind = false;pfxName = "Tx_sk_dao_zhuangbei_shou.pfx",};
	----刀防具-脚-强15
	[80322] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----刀防具-衣-强15
	[80323] = {delay=nil,bBind = false;pfxName = "Tx_sk_dao_zhuangbei_yifu.pfx",};
-----
	----枪防具-手-强5
	[80401] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_001.pfx",};
	----枪防具-脚-强5
	[80402] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----枪防具-衣-强5
	[80403] = {delay=nil,bBind = false;pfxName = "Tx_qiang_fangju_001.pfx",};
	----枪防具-手-强10
	[80411] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_shou_001.pfx",};
	----枪防具-脚-强10
	[80412] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----枪防具-衣-强10
	[80413] = {delay=nil,bBind = false;pfxName = "Tx_qiang_fangju_002.pfx",};
	----枪防具-手-强15
	[80421] = {delay=nil,bBind = false;pfxName = "Tx_sk_dao_zhuangbei_shou.pfx",};
	----枪防具-脚-强15
	[80422] = {delay=nil,bBind = false;pfxName = "TX_jian_fangju_001.pfx",};
	----枪防具-衣-强15
	[80423] = {delay=nil,bBind = false;pfxName = "Tx_qiang_fangju_003.pfx",};
--------------武器
	----镰刀武器-01
	[81001] = {delay=nil,bBind = true;pfxName = "Tx_Lian_Wuqi_001.pfx", };
	----镰刀武器-02
	[81005] = {delay=nil,bBind = false;pfxName = "Tx_Lian_Wuqi_002.pfx",};
	----镰刀武器-03
	[81010] = {delay=nil,bBind = false;pfxName = "Tx_Lian_Wuqi_003.pfx",};
	------------------------------------------
	----剑武器-01
	[82001] = {delay=nil,bBind = true;pfxName = "Tx_Jian_Wuqi_001.pfx",};
	----剑武器-02
	[82005] = {delay=nil,bBind = false;pfxName = "Tx_Jian_Wuqi_002.pfx",};
	----剑武器-03
	[82010] = {delay=nil,bBind = false;pfxName = "Tx_Jian_Wuqi_003.pfx",};
	
	----剑武器-80-01
	[82801] = {delay=nil,bBind = true;pfxName = "Tx_Jian_Wuqi_004_01.pfx",};
	----剑武器-80-02
	[82805] = {delay=nil,bBind = false;pfxName = "Tx_Jian_Wuqi_004_02.pfx",};
	----剑武器-80-03
	[82810] = {delay=nil,bBind = false;pfxName = "Tx_Jian_Wuqi_004_03.pfx",};
	------------------------------------------
	----刀武器-01
	[83001] = {delay=nil,bBind = true;pfxName = "Tx_Dao_wuqi_001.pfx",};
	----刀武器-02
	[83005] = {delay=nil,bBind = false;pfxName = "Tx_Dao_wuqi_002.pfx",};
	----刀武器-03
	[83010] = {delay=nil,bBind = false;pfxName = "Tx_Dao_wuqi_003.pfx",};
	------------------------------------------
	----枪武器-01
	[84001] = {delay=nil,bBind = true;pfxName = "Tx_Qiang_wuqi_001.pfx",};
	----枪武器-02
	[84005] = {delay=nil,bBind = false;pfxName = "Tx_Qiang_Wuqi_002.pfx",};
	----枪武器-03
	[84010] = {delay=nil,bBind = false;pfxName = "Tx_Qiang_Wuqi_003.pfx",};
	-------------装备强化特效-▲▲▲
	
	------------------------游戏操作光效
	--点地面
	[90001] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "dianji.pfx",
		MoveStart=_Vector3.new(0,0,-0.4),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	--[[
	--点到人物
	[90002] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "xuanzhong_you.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	--点怪
	[90003] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "xuanzhongmubiao_di.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	-]]
	--升级
	[90004] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "levelup_01.pfx",
	};
	--打坐
	[90005] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_Qita_Ddz.pfx",
	};
	--双修
	[90006] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_Qita_Sdz.pfx",
	};
	--经脉正在突破中
	[90007] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "jingmaitupo_01.pfx",
	};
	-- --完成任务
	-- [90008] = { 
	    -- delay=nil,		--特效延迟时间
		-- bBind = true;  --特效不追尾
		-- pfxName = "renwuwancheng.pfx",
		-- MoveStart=nil,--特效起始偏移
		-- MoveStop =nil,--技能结束偏移
		-- MoveTime = nil,		--技能偏移时间
		-- ScalingStart = nil, --放缩
		-- ScalingStop = nil,
		-- ScalingTime = nil,		
		-- RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		-- RotationStop = nil,
		-- RotationTime = nil, 
	-- };
	--回血
	[90009] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "huihong.pfx",
	};
	--回蓝
	[90010] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "huilan.pfx",
	};
	--顿悟
	[90011] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_YanWu_DunWu.pfx",
	};
	--演武光效01  黑色
	[90012] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_Yanwu_01.pfx",
	};
	--演武光效02  白色
	[90013] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_Yanwu_02.pfx",
	};
	--演武光效03  脚下光圈
	[90014] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_Yanwu_03.pfx",
	};
	--领悟技能  左手书本
	[90015] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_Lingwu_01.pfx",
		MoveStart=_Vector3.new(0,0.06,0)
	};
	--领悟技能  右手光点
	[90016] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_sk_Lingwu_02.pfx",
	};
	--------------------------境界光效
	--境界
	[90100] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "jingjie_01.pfx",
	};
	
	--------------------------经脉光效
	--经脉1
	--[91001] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaidatong_01.pfx",
	--};
	--经脉2
	--[91002] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaidatong_02.pfx",
	--};
	--经脉3
	--[91003] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaitongchang_03.pfx",
	--};
	--经脉4
	--[91004] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaitongchang_04.pfx",
	--};
	--经脉5
	--[91005] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaitongchang_05.pfx",
	--};
	--经脉6
	--[91006] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaitongchang_06.pfx",
	--};
	--经脉7
	--[91007] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaitongchang_07.pfx",
	--};
	--经脉8
	--[91008] = { 
	    --delay=nil,		--特效延迟时间
		--bBind = true;  --特效不追尾
		--pfxName = "jingmaitongchang_08.pfx",
	--};
	--经脉打通01
	[91098] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "jingmaidatong_01.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	--经脉打通02
	[91099] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "jingmaidatong_02.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
--//////////////////////【战斗光效】/////////////////////////
	[1000] = { ----------背击光效
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_beiji.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,1.25),-----------------版署通过后用新光效，记得注释这行
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
--//////////////////////【宝剑被击】/////////////////////////
	[10001] = { ----------宝剑光效
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_Shouji_BaoJian_01.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,0.75),--特效起始偏移
	};
	---宝剑技能   冰封
	[11000] = { ----------宝剑光效
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_Baojian_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,0.75),--特效起始偏移
	};
	---保甲技能   效果触发
	[12000] = { ----------宝剑光效
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_Shouji_BaoJia_01.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		--MoveStart=_Vector3.new(0,0,0),--特效起始偏移
	};
--//////////////////////【技能/被击光效  --怪物打人】/////////////////////////
---------------怪物技能，角色身上放的
	[40000] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Mon_Tx_sk_Huangyaoshi_04.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,-2.5),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[40001] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Mon_Tx_sk_TianYuan_02.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,-3),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[40002] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Mon_Tx_sk_KeZhenE_02.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,-2),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[40003] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Mon_Tx_sk_YiDengDaShi_05.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,-2),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[40004] = {  --- 黄蓉 技能01  玩家身上播放
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Mon_tx_sk_huangrong_01_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0.1,-0.5),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[40005] = {  --- 杨过，打出去的效果
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Mon_tx_sk_YangGuo_01_003.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,-1),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[40006] = {  --- 新欧阳锋，受攻击，玩家身上播
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Mon_Tx_sk_XinOuyangfeng_02.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,-1),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
--//////////////////////【技能/被击光效  --人打怪物】/////////////////////////
	-----剑被击特效
	[200000] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_beiji.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,0.5),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[210010] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_beiji_21001_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,0.5),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[210040] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_beiji_21004_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,0.5),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[21005] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_Jian_21005_002.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	------------刀被击通用
	[300000] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_beiji_dao.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,0.5),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[310010] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_beiji_31001_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=_Vector3.new(0,0,0.5),--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[31005] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_Dao_31005_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	------------枪被击通用
	[400000] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_beiji_qiang.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[410010] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_beiji_41001_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};

	[41005] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_Qiang_41005_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	------------镰刀被击通用
	[500000] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_beiji_liandao.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[51001] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_lian_51001_002.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
	};
		
	[510010] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_beiji_51001_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[51005] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_lian_51005_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
		MoveStart=nil,--特效起始偏移
		MoveStop =nil,--技能结束偏移
		MoveTime = nil,		--技能偏移时间
		ScalingStart = nil, --放缩
		ScalingStop = nil,
		ScalingTime = nil,		
		RotationStart = nil,--_Vector3.new(math.pi/2,0,0),--分别代表绕,x,y,z旋转的角度
		RotationStop = nil,
		RotationTime = nil, 
	};
	
	[60002] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_fuqi_002.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
	};
	[60004] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Tx_sk_fuqi_011.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
	};
	--------------------------无双
	[61001] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_WuShuang_001.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
	};
	[61002] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_WuShuang_002.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
	};
	[61003] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_WuShuang_003.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
	};
	[61004] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_WuShuang_L_003.pfx",--pfxName = "TX_sk_51005_1_001.pfx",
	};
	---金钟罩，头顶小钟
	[61010] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_TongYong_11016_002.pfx",
	};
	---易筋经 持续BUFF
	[61011] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "TX_sk_TongYong_11018_002.pfx",
	};
	
	---无色禅师自BUFF特效
	[61012] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Mon_tx_sk_WuSeChanShi_JiNeng_002_01.pfx",
	};
	
		---武尊全章-无双buff1红色
	[61013] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_wuzun_wushuang_01.pfx",
	};
	
		---武尊全章-无双buff2金色
	[61014] = { 
	    delay=nil,		--特效延迟时间
		bBind = false;  --特效不追尾
		pfxName = "Tx_wuzun_wushuang_02.pfx",
	};
	---广平禅师自BUFF特效
	[61015] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "Mon_Tx_sk_GuangPingChanShi_JiNeng01.pfx",
	};	
	---催命BUFF特效
	[61016] = { 
	    delay=nil,		--特效延迟时间
		bBind = true;  --特效不追尾
		pfxName = "MON_Tx_WuDuJiaoTanZi_JiNeng_001.pfx",
	};		
	-----------------------------------------------------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------------------------------------
	------------------------副本定制特效 | 副本 id + 001
	[5030001] = {delay=nil,bBind = false;pfxName = "Fuben_dz_5030001.pfx",};----珍珑棋局 石像消失
	[5050001] = {delay=nil,bBind = false;pfxName = "Fuben_dz_5050001.pfx",};----五行道场 元素飞过
	[5071001] = {delay=nil,bBind = false;pfxName = "Fuben_dz_5071001.pfx",};----演武节堂 开门飞速效果
	[5073001] = {delay=nil,bBind = false;pfxName = "Fuben_dz_5073_bagua.pfx",};----八卦 随机事件
	[5073002] = {delay=nil,bBind = false;pfxName = "Fuben_dz_5073_pozhan.pfx",MoveStart=_Vector3.new(0,0,2.7),};----破绽
	[5073003] = {delay=nil,bBind = false;pfxName = "Fuben_dz_5073_zhenyan.pfx",MoveStart=_Vector3.new(0,0,2.7),};----阵眼
	----------------------模型常态特效 | 怪物 mnlookid + 001
	---烟花
	[770001] = {delay=nil,bBind = false;pfxName = "Tx_YanHua_HuoShuYinHua.pfx",};----烟花
	[780001] = {delay=nil,bBind = false;pfxName = "Tx_YanHua_LiuGuangFeiWu.pfx",};----烟花
	[790001] = {delay=nil,bBind = false;pfxName = "Tx_YanHua_YueGuangPuHua.pfx",};----烟花
	[800001] = {delay=nil,bBind = false;pfxName = "Tx_YanHua_WoXinYongHeng.pfx",};----烟花
	[810001] = {delay=nil,bBind = false;pfxName = "Tx_YanHua_TianChangDiJiu.pfx",};----烟花
	---花灯
	[820001] = {delay=nil,bBind = false;pfxName = "Tx_HuaDeng_01.pfx",};----花灯
	[830001] = {delay=nil,bBind = false;pfxName = "Tx_HuaDeng_02.pfx",};----花灯
	[840001] = {delay=nil,bBind = false;pfxName = "Tx_HuaDeng_03.pfx",};----花灯
	---火锅
	[850001] = {delay=nil,bBind = false;pfxName = "A_NPC_Huoguo.pfx",};----火锅
	--花灯04
	[860001] = {delay=nil,bBind = false;pfxName = "Tx_HuaDeng_04.pfx",};----花灯04

	[870001] = {delay=nil,bBind = false;pfxName = "Tx_NPC_tulongdao.pfx",};----屠龙刀
	--盟主令
	[10110001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_MengZhuLing_01.pfx",};----八卦 随机事件
	--宝箱
	[11200001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_Baoxiang_guanghuan_01.pfx",};--木宝箱
	[11210001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_Baoxiang_guanghuan_02.pfx",};--银宝箱
	[11220001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_Baoxiang_guanghuan_03.pfx",};--金宝箱
	--天外陨石
	[11300001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_Zs_Tianwaiyunshi_01.pfx",};
	--欧阳锋 双手拿火球
	[100710070001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_Ouyangfeng_01.pfx",};
	--陆仁毅 打坐 特效
	[100110223001] = {delay=nil,bBind = false;pfxName = "Tx_Qita_Ddz.pfx",MoveStart=_Vector3.new(0,-0.4,0),};
	[100110223002] = {delay=nil,bBind = false;pfxName = "Tx_Yanwu_02.pfx",};--陆仁毅舞拳特效
	[100110223003] = {delay=nil,bBind = false;pfxName = "Tx_Yanwu_01.pfx",};--陆仁毅舞拳特效
	--一灯大师 背后光圈
	[100610010001] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_YiDengDaShi_01.pfx",};
	--霍都 刀柄特效
	[100920060001] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_HuoDu_01.pfx",};
	--金军将领 肩甲
	[100320060001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_JinJunJiangLing_01.pfx",};
	--五行圣兽 背后元素球
	[505020110001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_WuXingShengShou_01.pfx",};
	--天元  背后眼睛 一闪一闪
	[101120060001] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_TianYuan_01.pfx",};
	[101120060002] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_TianYuan_02.pfx",};
	[101120060003] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_TianYuan_03.pfx",};
	--异乡人头领
	[100120040001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_YiXiangRenShouLing_01.pfx",};
	--郭靖
	[100410040001] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_GuoJing_01.pfx",};
	[100410040002] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_GuoJing_02.pfx",};
	--沙匪头领
	[100720030001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_ShaFeiTouLing_01.pfx",};
	[100720030002] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_ShaFeiTouLing_02.pfx",};
	--五毒教巫祝
	[100620060001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_WuDuJiaoWuZhu_01.pfx",};
	[100620060002] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_WuDuJiaoWuZhu_02.pfx",};
	--金轮法王
	[100820050001] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_JinLunFaWang_01.pfx",};
	--蚩萝伊
	[503020070001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_ChiLuoYi_01.pfx",}; --武器
	[503020070002] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_ChiLuoYi_02.pfx",}; --鼓面
	--紫杉龙王
	[100710060001] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_DaiQiSi_01.pfx",};
	[100710060002] = {delay=nil,bBind = true;pfxName = "Mon_Tx_zs_DaiQiSi_02.pfx",};
	--冥蟾巫师
	[503020140001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_MingChanWuShi_01.pfx",};
	--年兽
	[507520010001] = {delay=nil,bBind = false;pfxName = "A_Nianshou_01.pfx",};
	[507520010002] = {delay=nil,bBind = false;pfxName = "A_Nianshou_02.pfx",};
	[507520010003] = {delay=nil,bBind = false;pfxName = "A_Nianshou_03.pfx",};
	[507520010004] = {delay=nil,bBind = false;pfxName = "A_Nianshou_04.pfx",};
	[507520010005] = {delay=nil,bBind = false;pfxName = "A_Nianshou_05.pfx",};
	[507520010006] = {delay=nil,bBind = false;pfxName = "A_Nianshou_06.pfx",};
	[507520010007] = {delay=nil,bBind = false;pfxName = "A_Nianshou_07.pfx",};
	[507520010008] = {delay=nil,bBind = false;pfxName = "A_Nianshou_08.pfx",};
	[507520010009] = {delay=nil,bBind = false;pfxName = "A_Nianshou_09.pfx",};
	[507520010010] = {delay=nil,bBind = false;pfxName = "A_Nianshou_10.pfx",};
	[507520010011] = {delay=nil,bBind = false;pfxName = "A_Nianshou_11.pfx",};
	[507520010012] = {delay=nil,bBind = false;pfxName = "A_Nianshou_12.pfx",};
	[507520010013] = {delay=nil,bBind = false;pfxName = "A_Nianshou_13.pfx",};
	[507520010014] = {delay=nil,bBind = false;pfxName = "A_Nianshou_14.pfx",};
	--小龙女
	[503020630001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_XiaoLongNv_01.pfx",};
	[503020630002] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_XiaoLongNv_02.pfx",};
	--飞贼
	[100220990001] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_Feizei_01.pfx",};
	[100220990002] = {delay=nil,bBind = false;pfxName = "Mon_Tx_zs_Feizei_02.pfx",};
	--天罡里的四圣兽
	[11600001] = {delay=nil,bBind = false;pfxName = "Mon_tx_sk_scn_wugui_01.pfx",};----乌龟
	[11610001] = {delay=nil,bBind = false;pfxName = "Mon_tx_sk_scn_baihu_01.pfx",};----白虎
	[11620001] = {delay=nil,bBind = false;pfxName = "Mon_tx_sk_scn_zhuque_01.pfx",};----朱雀
	[11630001] = {delay=nil,bBind = false;pfxName = "Mon_tx_sk_scn_qinglong_01.pfx",};----青龙
    ----阵法-北斗七星 套装特效
	[6000101] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan01.pfx",};
	[6000102] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan02.pfx",};
	[6000103] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan03.pfx",};
	[6000104] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan04.pfx",};
	[6000105] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan05.pfx",};
	[6000106] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan06.pfx",};
	[6000107] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan07.pfx",};
	[6000108] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan08.pfx",};
	[6000109] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan09.pfx",};
	[6000110] = {delay=nil,bBind = false;pfxName = "Tx_ui_renwuquan10.pfx",};
	----功法-铁布衫 升级特效（人物模型上播放）
	[7000100] = {delay=nil,bBind = false;pfxName = "Tx_ui_tbs_100.pfx",};
	----圣诞树
	[10120001] = {delay=nil,bBind = false;pfxName = "pfx_shengdanshu.pfx",};
	----运营活动【8阶】特效 技能流血
	[110001] = {delay=nil,bBind = false;pfxName = "MJ_tx_sk_00.pfx",};		--名剑技能流血，未激活时
	[110002] = {delay=nil,bBind = false;pfxName = "MJ_tx_sk_01.pfx",};	--名剑技能流血，激活时
	----运营活动，实战隐藏属性
	[110003] = {delay=nil,bBind = false;pfxName = "Tx_ui_shizhan_01.pfx",};		--实战隐藏按钮属性出生
	[110004] = {delay=nil,bBind = false;pfxName = "Tx_ui_shizhan_02.pfx",};	----实战隐字按钮常驻
	[110005] = {delay=nil,bBind = false;pfxName = "TX_ui_zidong_01.pfx",}; --自动使用功能--背包扩展
	----宝甲精炼  火星四溅
	[1100060] = {delay=nil,bBind = false;pfxName = "TX_ui_baojiajinglian_01.pfx",}; --精炼锤敲打完成
    ----功法-童姥功 人物套装特效
	[7000101] = {delay=nil,bBind = false;pfxName = "TX_tlg_tz_01.pfx",};
	[7000102] = {delay=nil,bBind = false;pfxName = "TX_tlg_tz_02.pfx",};
	[7000103] = {delay=nil,bBind = false;pfxName = "TX_tlg_tz_03.pfx",};
	[7000104] = {delay=nil,bBind = false;pfxName = "TX_tlg_tz_04.pfx",};
	----酒葫芦 5阶葫芦挂在4个角色模型上的特效
	[7000105] = {delay=nil,bBind = false;pfxName = "Mon_Tx_sk_Jiuhulu_dao.pfx",};
	[7000106] = {delay=nil,bBind = false;pfxName = "Mon_Tx_sk_Jiuhulu_dao.pfx",};
	[7000107] = {delay=nil,bBind = false;pfxName = "Mon_Tx_sk_Jiuhulu_dao.pfx",};
	[7000108] = {delay=nil,bBind = false;pfxName = "Mon_Tx_sk_Jiuhulu_liandao.pfx",};
-----------------------------------------------------------------------------------------------------------------------------------------------
	------------------------活动定制特效 
	--烟花·冲天炮
	[110006]	=	{delay=nil,bBind = false;pfxName = "Tx_YanHua_ChongTianPao.pfx",};
	--烟花·彩蝶飞
	[110007]	=	{delay=nil,bBind = false;pfxName = "Tx_YanHua_CaiDieFei.pfx",};	
	--烟花·钻地鼠
	[110008]	=	{delay=nil,bBind = false;pfxName = "Tx_YanHua_ZuanDiShu.pfx",};	
	
	----------------此后人物身上挂的特效都以7000开头吧---------------------
	--穿云箭
	[110009] = {delay=nil,bBind = false;pfxName = "Tx_NPC_chuanyunjian.pfx",};	
	------------暗器技能特效
	[110010] = {delay=nil,bBind = false;pfxName = "TX_sk_anqi_pozu_suohou.pfx",};	
    [110011] = {delay=nil,bBind = false;pfxName = "TX_sk_anqi_shixin.pfx",};
    [110012] = {delay=nil,bBind = false;pfxName = "TX_sk_anqi_gewan.pfx",};	
    [110013] = {delay=nil,bBind = false;pfxName = "TX_sk_anqi_juhun.pfx",};		
}





