--权限系统配置
--szAuthority: 权限名
--bDefault: 默认值
--dwStringID: 提示ID
--szIcon: 提示图标
--szPos: 飞行终点
--szDefaultPos: 默认飞行终点
--fnPre: 准备函数回调
_G.AuthorityConfig = {
	--结婚
	{ szAuthority = 'Marry', bDefault = false, dwStringID = 9000210007, szIcon = 'gn_kf_BanLv.png', dwTipID = 4001060001, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnMarry", szDefaultPos = "", fnPre = function()  end },
	--世家
	{ szAuthority = 'Guild', bDefault = false, dwStringID = 9000210006 , szIcon = 'gn_kf_ShiJia.png', dwTipID = 4001060002, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGuild", szDefaultPos = "", fnPre = function() end },
	--坐骑
	{ szAuthority = 'Mount', bDefault = false, dwStringID = 9000210008, szIcon = 'gn_kf_ZhuoQi.png', dwTipID = 4001060003, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnMounts", szDefaultPos = "", fnPre = function() end  },
	--坐骑升阶
	{ szAuthority = 'MountUp', bDefault = false, dwStringID = 9000210024 ,},
	---坐骑能力强化
	{ szAuthority = 'MountStrengThen', bDefault = false, dwStringID = 9000210025 , },
	---坐骑技能
	{ szAuthority = 'MountSkill', bDefault = false, dwStringID = 9000210026 , },
	---查看对方坐骑
	{ szAuthority = 'LookMount', bDefault = false, dwStringID = nil ,},
	--经脉
	{ szAuthority = 'Pulse', bDefault = false, dwStringID = 9000210009 , szIcon = 'gn_kf_JingMai.png', dwTipID = 4001060004, szPos = "/CntUI/contentHolder/UIRoleBase/contentHolder/rwsxUI_button_jm_static", szDefaultPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRoleInfo", fnPre = function() CUIRole:OpenPanel(3) end },
	--五行
	{ szAuthority = 'Element', bDefault = false, dwStringID = 9000210010 ,},
	--技能
	{ szAuthority = 'Skill', bDefault = false, dwStringID = 9000210038, szIcon = 'gn_kf_JiNeng.png', dwTipID = 4001060005, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnSkill", szDefaultPos = "", fnPre = function() end  },
	--PK
	{ szAuthority = 'PK', bDefault = false, dwStringID = 9000210001 , },
	--人物
	{ szAuthority = 'Role', bDefault = true, dwStringID = nil ,},
	--包裹
	{ szAuthority = 'Pack', bDefault = true, dwStringID = nil, },
	--任务
	{ szAuthority = 'Task', bDefault = true, dwStringID = nil ,},
	--组队
	{ szAuthority = 'Team', bDefault = false, dwStringID = 9000210033 , szIcon = 'gn_kf_DuiWu.png', dwTipID = 4001060006, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnTeam", szDefaultPos = "", fnPre = function() end },
	--境界
	{ szAuthority = 'Bourn', bDefault = false, dwStringID = 9000210002, szIcon = 'gn_kf_JingJie.png', dwTipID = 4001060007, szPos = "/CntUI/contentHolder/UIRoleBase/contentHolder/rwsxUI_button_jj_static", szDefaultPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRoleInfo", fnPre = function()  CUIRole:OpenPanel(2)  end  },
	--商城
	{ szAuthority = 'Mall', bDefault = false, dwStringID = 9000210030, szIcon = 'gn_kf_ShangCheng.png', dwTipID = 4001060015, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnShop", szDefaultPos = "", fnPre = function() end },
	--VIP
	{ szAuthority = 'VIP', bDefault = false, dwStringID = 9000210031 ,},
	--宝甲
	{ szAuthority = 'Amulet', bDefault = false, dwStringID = 9000210011 , szIcon = 'gn_kf_BaoJia.png', dwTipID = 4001060008, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGroup1", szDefaultPos = "", fnPre = function() end },
	--成长
	{ szAuthority = 'Growth', bDefault = false, dwStringID = nil,szIcon = 'gn_kf_MuBiao.png', dwTipID = 4001060037, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/GrowupBtn", szDefaultPos = "", fnPre = function() end },
	--交友
	{ szAuthority = 'Friend', bDefault = false, dwStringID = 9000210029 , szIcon = 'gn_kf_HaoYou.png', dwTipID = 4001060009, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnFriend", szDefaultPos = "", fnPre = function() end },
	--排行
	{ szAuthority = 'Chart', bDefault = false, dwStringID = 9000210012, szIcon = 'gn_kf_PaiHang.png', dwTipID = 4001060010, szPos = "/btmUI/contentHolder/CUISmallMap/contentHolder/panel/BtnSeniority", szDefaultPos = "", fnPre = function() end  },
	--每日活动
	{ szAuthority = 'Daily', bDefault = false, dwStringID = 9000210020 , szIcon = 'gn_kf_HuoDong.png', dwTipID = 4001060011, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/DailyBtn", szDefaultPos = "", fnPre = function() end },
	--装备强化
	{ szAuthority = 'EquipIntensify', bDefault = false, dwStringID = 9000210013, szIcon = 'gn_kf_LianZhi.png', dwTipID = 4001060012, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRefine", szDefaultPos = "", fnPre = function() end  },	
	--装备升阶
	{ szAuthority = 'EquipUpgrade', bDefault = false, dwStringID = 9000210013 , szIcon = 'gn_kf_LianZhi.png', dwTipID = 4001060012, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRefine", szDefaultPos = "", fnPre = function() end },
	--装备兵魂强化
	{ szAuthority = 'EquipAddBorn', bDefault = false, dwStringID = 9000210013 , szIcon = 'gn_kf_LianZhi.png', dwTipID = 4001060012, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRefine", szDefaultPos = "", fnPre = function() end },
	--装备附加属性数值强化
	{ szAuthority = 'PropIntensify', bDefault = false, dwStringID = 9000210013 , szIcon = 'gn_kf_LianZhi.png', dwTipID = 4001060012, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRefine", szDefaultPos = "", fnPre = function() end },
	--装备附加属性炼制
	{ szAuthority = 'PropResetType', bDefault = false, dwStringID = 9000210013, szIcon = 'gn_kf_LianZhi.png', dwTipID = 4001060012, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRefine", szDefaultPos = "", fnPre = function() end  },
	--装备附加属性重置
	{ szAuthority = 'PropResetAll', bDefault = false, dwStringID = 9000210013 , szIcon = 'gn_kf_LianZhi.png', dwTipID = 4001060012, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRefine", szDefaultPos = "", fnPre = function() end },
	--宝石合成
	{ szAuthority = 'StoneCompose', bDefault = false, dwStringID = 9000210019 , szIcon = 'gn_kf_BaoShi.png', dwTipID = 4001060012, szPos = "/CntUI/contentHolder/UIRoleBase/contentHolder/rwsxUI_button_bs_static", szDefaultPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRoleInfo", fnPre = function() CUIRole:OpenPanel(4) end },
 --摆摊
	{ szAuthority = 'CUIPlayerShop', bDefault = false, dwStringID = 9000210021,}, 
 --摆摊列表
	{ szAuthority = 'CUIPlayerShopList', bDefault = false, dwStringID = 9000210021, }, 
 --结婚平台
	{ szAuthority = 'FriendMarry', bDefault = false, dwStringID = 9000210027, }, 
 --仇人平台
	{ szAuthority = 'FriendEnemy', bDefault = false, dwStringID = nil,}, 
 --时间礼包
	{ szAuthority = 'OnLineGift', bDefault = false, dwStringID = nil, }, 
 --首充按钮
	{ szAuthority = 'UIFirstPayMoney', bDefault = false, dwStringID = nil, }, 
 --五行调和
	{ szAuthority = 'UIElemBalance', bDefault = false, dwStringID = 9000210028, }, 
 --武林宝典
	{ szAuthority = 'GuideBookBtn', bDefault = false, dwStringID = nil,}, 
 --领取奖励
	{ szAuthority = 'ShowBtn', bDefault = false, dwStringID = nil, }, 
----宝剑
	{ szAuthority = 'Sword', bDefault = false, dwStringID = 9000210037, szIcon = 'gn_kf_MingJian.png', dwTipID = 4001060014, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGroup1", szDefaultPos = "", fnPre = function() end }, 
----任务支线
	{ szAuthority = 'Branch', bDefault = false, dwStringID = nil, szIcon = 'gn_kf_RenWu.png', dwTipID = 4001060016, szPos = "/CntUI/contentHolder/CUITaskMainPanel/contentHolder/btn_Branch", szDefaultPos = "/btmUI/contentHolder/zhujiemianUI_renwuyindao/contentHolder/rwzzUI_title", fnPre = function() CUITaskMainPanel:DoOpen(1,2) end }, 
----任务周环
	{ szAuthority = 'Weekly', bDefault = false, dwStringID = 9000210032, szIcon = 'gn_kf_RenWu.png', dwTipID = 4001060017, szPos = "/CntUI/contentHolder/CUITaskMainPanel/contentHolder/btn_Loop", szDefaultPos = "/btmUI/contentHolder/zhujiemianUI_renwuyindao/contentHolder/rwzzUI_title", fnPre = function() CUITaskMainPanel:DoOpen(2) end }, 
----变强
	--{ szAuthority = 'ChangeStrong', bDefault = false, dwStringID = nil,}, 
----名人系统
	{ szAuthority = 'NpcConnectionSystem', bDefault = false, dwStringID = 9000210034 , szIcon = 'gn_kf_JiangHu.png', dwTipID = 4001060036, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnJiangHu", szDefaultPos = "", fnPre = function() end },
----收集系统
	{ szAuthority = 'Collect', bDefault = false, dwStringID = 13001510004 , szIcon = 'gn_kf_FengWuZhi.png', dwTipID = 4001060035, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnShouJi", szDefaultPos = "", fnPre = function() end },
----威望系统
	{ szAuthority = 'WeiWang', bDefault = false, dwStringID = 9000210035,  szIcon = 'gn_kf_WeiWang.png', dwTipID = 4001060034,szPos = "/btmUI/contentHolder/MainPageHeadPic/contentHolder/headPortrait/MuBiaoBtn", szDefaultPos = "", fnPre = function() end}, 
----变强
	{ szAuthority = 'MainTip', bDefault = false, dwStringID = nil,szIcon = 'gn_kf_BianQiang.png', dwTipID = 4001060033, szPos = "/btmUI/contentHolder/MainTipWnd/contentHolder/TaskBtn", szDefaultPos = "", fnPre = function() end }, 
----摇骰子
	{ szAuthority = 'ShaiZi', bDefault = false, dwStringID = 13001350016,szIcon = 'gn_kf_ShaiZi.png', dwTipID = 4001060032, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/YaoJiangBtn", szDefaultPos = "", fnPre = function() end }, 
----副本
	{ szAuthority = 'FuBen', bDefault = false, dwStringID = 9000210036,szIcon = 'gn_kf_FuBen1.png', dwTipID = 4001060031, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/FuBenBtn", szDefaultPos = "", fnPre = function() end }, 
----龙争虎斗
	{ szAuthority = 'LongDou', bDefault = false, dwStringID = nil,szIcon = 'gn_kf_ShiJiaZhan.png', dwTipID = 4001060030, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/ShiJiaZhanBtn", szDefaultPos = "", fnPre = function() end }, 
----珍珑棋局
	{ szAuthority = 'ZhenLong', bDefault = false, dwStringID = nil,szIcon = 'gn_kf_ZhenLong.png', dwTipID = 4001060038, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/ZhenLongBtn", szDefaultPos = "", fnPre = function() end }, 
 --五行调和
	{ szAuthority = 'WuXingTiaoHe', bDefault = false, dwStringID = 9000210040, }, 
	--7天登陆
	{ szAuthority = 'DengLu', bDefault = false, dwStringID = nil,szIcon = 'gn_kf_DengLuJiangLi.png', dwTipID = 4001060039, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/DengLuLJ_button", szDefaultPos = "", fnPre = function() end },
----众志成城
	{ szAuthority = 'ChengQiang', bDefault = false, dwStringID = nil,szIcon = 'gn_kf_zzcc1.png', dwTipID = 4001060040, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/ChengQiangbth", szDefaultPos = "", fnPre = function() end },
--称号
	{ szAuthority = 'ChengHao', bDefault = false, dwStringID = nil, szIcon = 'gn_kf_ChenHao.png', dwTipID = 3000760001, szPos = "/CntUI/contentHolder/UIRoleBase/contentHolder/rwsxUI_button_ch_static", szDefaultPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRoleInfo", fnPre = function()  CUIRole:OpenPanel(5)  end  },
--首充
	{ szAuthority = 'ShouChong', bDefault = false, dwStringID = nil, },
--随身药店，随身仓库开放等级
	{ szAuthority = 'BianJieShop', bDefault = false, dwStringID = 9000210042, },
--答题活动开放等级
	{ szAuthority = 'CenFuZi', bDefault = false, dwStringID = 9000210042, },
----修行
--	{ szAuthority = 'XiuXing', bDefault = false, dwStringID = 9000210044, szIcon = 'gn_kf_XiuXing.png', dwTipID = 4001060044, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnXiuXing", szDefaultPos = "", fnPre = function() end }, 

----侠客行
	{ szAuthority = 'XiaKeXing', bDefault = false, dwStringID = 13008000000,szIcon = 'gn_kf_XiaKeXing.png', dwTipID = 4001060041, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/XiaKeXing", szDefaultPos = "", fnPre = function() end }, 
----修行
	{ szAuthority = 'XiuXing', bDefault = false, dwStringID = 9000210044, szIcon = 'gn_kf_XiuXing.png', dwTipID = 4001060044, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGroup1", szDefaultPos = "", fnPre = function() end }, 
--世界喊话权限
	{ szAuthority = 'LTShiJie', bDefault = false, dwStringID = 9000210043, },	
----装备修炼
	{ szAuthority = 'ZhuangBeiXiuLian', bDefault = false, dwStringID = nil,szIcon = 'gn_kf_XiuLian.png', dwTipID = 4001060042, szPos = "/CntUI/contentHolder/UIRoleBase/contentHolder/rwsxUI_button_xl_static", szDefaultPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRoleInfo", fnPre = function() CUIRole:OpenPanel(6) end }, 
--装备分解权限
	{ szAuthority = 'EquipDecompose', bDefault = false, dwStringID = 9000210045, },	
--喇叭喊话权限检测
	{ szAuthority = 'LaBaHanHua', bDefault = false, dwStringID = 9000210046, },	
----功法系统
	{ szAuthority = 'GongFa', bDefault = false, dwStringID = 13008000001,szIcon = 'gn_kf_GongFa.png',dwTipID = 4001060045, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGongFadis", szDefaultPos = "", fnPre = function() end },
--抽签系统	
	{ szAuthority = 'Lottery', bDefault = false, dwStringID = nil, szIcon = 'gn_kf_chouqian.png', dwTipID = 13001810001, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/ChouQian_button", szDefaultPos = "", fnPre = function() UILotterySystem:DoOpen() end },
--血魔功
	{ szAuthority = 'XueMoGong',bDefault = false, dwStringID = 13001710001,},
--易筋经
	{ szAuthority = 'YiJinJing',bDefault = false, dwStringID = 13001710002,},	
--童姥功
	{ szAuthority = 'PractiseSkill',bDefault = false, dwStringID = 13009400201,szIcon = 'gn_kf_tlg.png',dwTipID = 13009400202, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGongFadis", szDefaultPos = "", fnPre = function() end },	
--铁布衫
	{ szAuthority = 'LronCloth',bDefault = false, dwStringID = 13009400101,szIcon = 'gn_kf_tbs.png',dwTipID = 13009400102, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGongFadis", szDefaultPos = "", fnPre = function() end },	
--阵法
	{ szAuthority = 'MatrixMethod',bDefault = false, dwStringID = 13008000003,szIcon = 'gn_kf_bdqx.png',dwTipID = 4001060046, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGongFadis", szDefaultPos = "", fnPre = function() end },
--侠义勋章
	{ szAuthority = 'XiaYiXunZhang', bDefault = false, dwStringID = 13009200101,},	
--棋魂系统
	{ szAuthority = 'Qihun', bDefault = false, dwStringID = 13002100012, szIcon = 'gn_kf_caiqi.png', dwTipID = 13002100014, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/qihunbutn", szDefaultPos = "", fnPre = function() UILotterySystem:DoOpen() end },	
--聚灵珠
	{ szAuthority = 'JuLingZhu',bDefault = false, dwStringID = 1300051001,},
--在线礼包
	{ szAuthority = 'OnlineAwards', bDefault = false, dwStringID = 1300071001,szIcon = 'gn_kf_zaixianlibao.png',dwTipID = 1300071002, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/zaixianbutn", szDefaultPos = "", fnPre = function() end },	
--群侠挑战
	{ szAuthority = 'QunXia',bDefault = false, dwStringID = 13009100104,szIcon = 'gn_kf_qxtz.png',dwTipID = 13009100103, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/DailyBtn", szDefaultPos = "", fnPre = function() end },
--威望勋章
	{ szAuthority = 'WeiWangXunZhang', bDefault = false, dwStringID = 13009300102,},	
--聚灵珠聚灵
	{ szAuthority = 'JuLingZhuJuLing',bDefault = false, dwStringID = 1300051001,},
--聚灵珠升级
	{ szAuthority = 'JuLingZhuDengJi',bDefault = false, dwStringID = 1300051001,},
--酒葫芦
	{ szAuthority = 'Gourd',bDefault = false, dwStringID = 13009600001,szIcon = 'gn_mq_hulu.png',dwTipID = 13009600002, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGroup1", szDefaultPos = "", fnPre = function() end },	
--疯狂的锄头
	{ szAuthority = 'fengkuangchutou',bDefault = false, dwStringID = 13001210017,},
--群侠录系统
	{ szAuthority = 'QunXiaLu',bDefault = false, dwStringID = 13009700002,szIcon = 'QunXiaLu.png',dwTipID = 13009700001, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/qunxialu", szDefaultPos = "", fnPre = function() end },
--群侠录系统——风云客栈
	{ szAuthority = 'QunXiaLuFengYun',bDefault = false, dwStringID = 13009700002,},
--群侠录系统——群侠组合
	{ szAuthority = 'QunXiaLuZuHe',bDefault = false, dwStringID = 13009700002,},
--群侠录系统——融合
	{ szAuthority = 'QunXiaLuRongHe',bDefault = false, dwStringID = 13009700002,},
--群侠录系统——大侠录
	{ szAuthority = 'QunXiaLuDaXiaLu',bDefault = false, dwStringID = 13009700002,},
--跨服战-群雄争霸
	{ szAuthority = 'QunXiongZhengBa',bDefault = false, dwStringID = 13009300011,szIcon = 'gn_zc_qxzb.png',dwTipID = 13009300012, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/KuaFuBtn", szDefaultPos = "", fnPre = function() end},
--青云勋章
	{ szAuthority = 'qingyunxunzhang',bDefault = false, dwStringID = 13009300025,},
--时装
	{ szAuthority = 'huashendan',bDefault = false, dwStringID = 13009300022,szIcon = 'huanshen.png',dwTipID = 13009300024, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/FashionBtn", szDefaultPos = "", fnPre = function() end },
--战斗力
	{ szAuthority = 'ZhanDouLi',bDefault = true, dwStringID = nil,},
--圣火令
	{ szAuthority = 'ShengHuoLing',bDefault = false, dwStringID = 13009300030,szIcon = 'gn_kf_ShengHuoLing.png',dwTipID = 13009300031, szPos = "/CntUI/contentHolder/UIRoleBase/contentHolder/rwsxUI_button_jj_static", szDefaultPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRoleInfo", fnPre = function() end },
--暗器
	{ szAuthority = 'HiddenWeapon',bDefault = false, dwStringID = 13009400001,szIcon = 'gn_mq_anqi.png',dwTipID = 13009400002, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGroup1", szDefaultPos = "", fnPre = function() end },	
--独孤九剑
	{ szAuthority = 'DuGuJiuJian',bDefault = false, dwStringID = 13009500007,szIcon = 'gn_kf_dugujiujian.png',dwTipID = 13009500006, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGongFadis", szDefaultPos = "", fnPre = function() end },
--通天塔
	{ szAuthority = 'TongTianTa',bDefault = false, dwStringID = 14000100001,szIcon = 'gn_kf_tongtianta.png',dwTipID = 14000100004, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/tongtianta_butn", szDefaultPos = "", fnPre = function() end },
--战骑诀
	{ szAuthority = 'ZhanQiJue',bDefault = false, dwStringID = 13009900001,szIcon = 'gn_kf_ZhanQiJue.png',dwTipID = 13009900002, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnMounts", szDefaultPos = "", fnPre = function() end },
--护身法宝
	{ szAuthority = 'Shield',bDefault = false, dwStringID = 14000200001,szIcon = 'gn_mq_FaBao.png',dwTipID = 14000200002, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGroup1", szDefaultPos = "", fnPre = function() end },	
--金身
	{ szAuthority = 'GoldenBody',bDefault = false, dwStringID = 13009800001,szIcon = 'gn_kf_jinshen.png',dwTipID = 13009800008, szPos = "/CntUI/contentHolder/UIRoleBase/contentHolder/rwsxUI_button_jm_static", szDefaultPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnRoleInfo", fnPre = function() end },	
--英雄令
	{ szAuthority = 'HeroToken',bDefault = false, dwStringID = 14000800001,szIcon = 'gn_kf_yingxiongling.png',dwTipID = 14000800002, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/yingxiongling_butn", szDefaultPos = "", fnPre = function() end },	
--华山论剑
	{ szAuthority = 'CTalkSwordSystem',bDefault = false, dwStringID = 14000000001,szIcon = 'gn_kf_huashanlunjian.png',dwTipID = 14000000004, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/huashanlunjian_btn", szDefaultPos = "", fnPre = function() end },
--资源回收
	{ szAuthority = 'Recycling',bDefault = false, dwStringID = 14000900001,szIcon = 'gn_kf_ziyuanzhuihui.png',dwTipID = 14000900002, szPos = "/btmUI/contentHolder/TopMainUI/contentHolder/ziyuanhuishou_butn", szDefaultPos = "", fnPre = function() end },
--战旗
	{ szAuthority = 'Banner',bDefault = false, dwStringID = 14000500001,szIcon = 'gn_mq_zhanqi.png',dwTipID = 14000500002, szPos = "/btmUI/contentHolder/MainPageShrtcut/contentHolder/useBar/btnGroup1", szDefaultPos = "", fnPre = function() end },	

}
	

--特效配置
--szBGEffect 背景特效名
--szFlyEffect 飞行特效名
--szEndEffect 终点特效名
--dwTime 终点特效播放时间
_G.AuthorityEffectConfig = {
	szBGEffect = 'Tx_ui_xt_kf_01',
	--szFlyEffect = 'Tx_ui_xt_kf_02',
	szEndEffect = 'Tx_ui_xt_kf_03',
	dwTime = 1,
}

--事件配置
_G.AuthorityEventConfig = {}

--人物等级
--dwLevel: 人物等级
--szAuthority: 开放权限
_G.AuthorityEventConfig['EventLevelUp'] =
{
	[1] = { dwLevel = 1000, szAuthority = 'Element'},
	--[2] = { dwLevel = 21, szAuthority = 'EquipIntensify'},
	--[3] = { dwLevel = 13, szAuthority = 'Mount'},	
	[4] = { dwLevel = 1, szAuthority = 'MountStrengThen'},
	[5] = { dwLevel = 1000, szAuthority = 'MountSkill'},	
	--[6] = { dwLevel = 8, szAuthority = 'Pulse'},			
	[7] = { dwLevel = 20, szAuthority = 'PK'},
	--[8] = { dwLevel = 24, szAuthority = 'Bourn'},
	[9] = { dwLevel = 34, szAuthority = 'Marry'},	
   [10] = { dwLevel = 26, szAuthority = 'Chart'},	
   [11] = { dwLevel = 35, szAuthority = 'Daily'},	
   [12] = { dwLevel = 30, szAuthority = 'CUIPlayerShop'},		
   [13] = { dwLevel = 1, szAuthority = 'CUIPlayerShopList'},	
   [14] = { dwLevel = 25, szAuthority = 'Guild'},	
   [15] = { dwLevel = 1000, szAuthority = 'PropResetAll'},	
   [16] = { dwLevel = 56, szAuthority = 'Amulet'},	
   -- [17] = { dwLevel = 1, szAuthority = 'PropResetType'},
   -- [18] = { dwLevel = 1, szAuthority = 'EquipUpgrade'},
   -- [19] = { dwLevel = 1, szAuthority = 'EquipAddBorn'},
   -- [20] = { dwLevel = 1, szAuthority = 'PropIntensify'},
   [21] = { dwLevel = 41, szAuthority = 'StoneCompose'},
   [22] = { dwLevel = 1, szAuthority = 'FriendMarry'},
   [23] = { dwLevel = 1, szAuthority = 'FriendEnemy'},
   [24] = { dwLevel = 1000, szAuthority = 'OnLineGift'},
   [25] = { dwLevel = 1, szAuthority = 'LookMount'},
   [26] = { dwLevel = 1000, szAuthority = 'UIFirstPayMoney'},  
   [27] = { dwLevel = 30, szAuthority = 'UIElemBalance'},  
   [28] = { dwLevel = 1000, szAuthority = 'GuideBookBtn'},  
   [29] = { dwLevel = 1, szAuthority = 'ShowBtn'},  
   [30] = { dwLevel = 44, szAuthority = 'Sword'},  
  -- [31] = { dwLevel = 4, szAuthority = 'Skill'},  
  -- [32] = { dwLevel = 11, szAuthority = 'Friend'},  
  -- [33] = { dwLevel = 13, szAuthority = 'Team'},  
   --[34] = { dwLevel = 19, szAuthority = 'Mall'},  
   [35] = { dwLevel = 1, szAuthority = 'Branch'},  
   [36] = { dwLevel = 10, szAuthority = 'VIP'},  
   --[37] = { dwLevel = 24, szAuthority = 'Growth'},  
   --[38] = { dwLevel = 13, szAuthority = 'ChangeStrong'},  
 --  [39] = { dwLevel = 1000, szAuthority = 'NpcConnectionSystem'},  --40,临时修改
   [40] = { dwLevel = 31, szAuthority = 'Collect'},  --30，临时修改
   [41] = { dwLevel = 42, szAuthority = 'WeiWang'},  
   --[42] = { dwLevel = 18, szAuthority = 'MainTip'},  
   [43] = { dwLevel = 47, szAuthority = 'ShaiZi'}, 
  -- [44] = { dwLevel = 27, szAuthority = 'Weekly'}, 
   [45] = { dwLevel = 30, szAuthority = 'FuBen'}, 
   [46] = { dwLevel = 1, szAuthority = 'LongDou'}, 
   [47] = { dwLevel = 37, szAuthority = 'ZhenLong'}, 
   [48] = { dwLevel = 40, szAuthority = 'WuXingTiaoHe'}, 
   [49] = { dwLevel = 10, szAuthority = 'DengLu'},
   [50] = { dwLevel = 43, szAuthority = 'ChengQiang'},
   [51] = { dwLevel = 1, szAuthority = 'ChengHao'},
   [52] = { dwLevel = 1, szAuthority = 'ShouChong'},
   [53] = { dwLevel = 25, szAuthority = 'BianJieShop'},
   [54] = { dwLevel = 40, szAuthority = 'CenFuZi'},
   [55] = { dwLevel = 13, szAuthority = 'XiaKeXing'},
  -- [56] = { dwLevel = 50, szAuthority = 'XiuXing'},

  -- [56] = { dwLevel = 27, szAuthority = 'LTShiJie'},
   [57] = { dwLevel = 38, szAuthority = 'ZhuangBeiXiuLian'},
   [58] = { dwLevel = 48, szAuthority = 'XiuXing'},
   [59] = { dwLevel = 1, szAuthority = 'EquipDecompose'},
   [60] = { dwLevel = 20, szAuthority = 'LaBaHanHua'},
   [61] = { dwLevel = 50, szAuthority = "GongFa"},
   [62] = { dwLevel = 45, szAuthority = 'Lottery'},
   [63] = { dwLevel = 50, szAuthority = 'XueMoGong'},
   [64] = { dwLevel = 62, szAuthority = 'YiJinJing'},
   [65] = { dwLevel = 65, szAuthority = 'MatrixMethod'},
   [66] = { dwLevel = 37, szAuthority = 'Qihun'},
   [67] = { dwLevel = 1, szAuthority = 'JuLingZhu'},
   [68] = { dwLevel = 5, szAuthority = 'OnlineAwards'},
   [69] = { dwLevel = 60, szAuthority = 'QunXia'},
   [70] = { dwLevel = 70, szAuthority = 'LronCloth'},  
   [71] = { dwLevel = 42, szAuthority = 'WeiWangXunZhang'},
   [72] = { dwLevel = 1, szAuthority = "JuLingZhuJuLing"},
   [73] = { dwLevel = 1, szAuthority = 'JuLingZhuDengJi'},
   [74] = { dwLevel = 75, szAuthority = 'PractiseSkill'},
   [75] = { dwLevel = 20, szAuthority = 'fengkuangchutou'},
   [76] = { dwLevel = 68, szAuthority = 'QunXiaLu'},
   [77] = { dwLevel = 68, szAuthority = 'QunXiaLuFengYun'},
   [78] = { dwLevel = 68, szAuthority = 'QunXiaLuZuHe'},
   [79] = { dwLevel = 68, szAuthority = 'QunXiaLuRongHe'},
   [80] = { dwLevel = 68, szAuthority = 'QunXiaLuDaXiaLu'},
   [81] = { dwLevel = 78, szAuthority = 'Gourd'},
   [82] = { dwLevel = 70, szAuthority = 'QunXiongZhengBa'},
   [83] = { dwLevel = 36, szAuthority = 'huashendan'},
   [84] = { dwLevel = 1, szAuthority = 'ZhanDouLi'},	
   [85] = { dwLevel = 33, szAuthority = 'qingyunxunzhang'},
   [86] = { dwLevel = 30, szAuthority = 'ShengHuoLing'},
   [87] = { dwLevel = 65, szAuthority = 'HiddenWeapon'},
   [88] = { dwLevel = 77, szAuthority = 'DuGuJiuJian'},
   [89] = { dwLevel = 80, szAuthority = 'TongTianTa'},
   [90] = { dwLevel = 76, szAuthority = 'ZhanQiJue'},   
   [91] = { dwLevel = 71, szAuthority = 'Shield'},
   [92] = { dwLevel = 80, szAuthority = 'GoldenBody'}, 
   [93] = { dwLevel = 85, szAuthority = 'HeroToken'},   
   [94] = { dwLevel = 69, szAuthority = 'CTalkSwordSystem'},   
   [95] = { dwLevel = 82, szAuthority = 'Banner'},
   [96] = { dwLevel = 48, szAuthority = 'Recycling'}, 
}

--接受任务
--dwTaskID: 任务ID
--szAuthority: 开放权限
_G.AuthorityEventConfig['EventAcceptTask'] =
{
	--{ dwTaskID = 1020, szAuthority = 'Element'},
	--{ dwTaskID = 2006, szAuthority = 'EquipIntensify'},	
    { dwTaskID = 1023, szAuthority = 'Pulse' },
	{ dwTaskID = 2043, szAuthority = 'EquipIntensify' }	,
	{ dwTaskID = 2043, szAuthority = 'PropIntensify' }	,
	{ dwTaskID = 2043, szAuthority = 'EquipUpgrade' }	,
	{ dwTaskID = 2043, szAuthority = 'PropResetType' }	,
--	{ dwTaskID = 2043, szAuthority = 'PropResetAll' }	,	
	{ dwTaskID = 2011, szAuthority = 'Team' }	,
	{ dwTaskID = 2009, szAuthority = 'Friend' }	,
	{ dwTaskID = 1007, szAuthority = 'Skill' }	,		
	--{ dwTaskID = 3042, szAuthority = 'Branch' }	,
	{ dwTaskID = 3007, szAuthority = 'Bourn' }	,
 { dwTaskID = 2140, szAuthority = 'NpcConnectionSystem' },		
	
}

--完成任务
--dwTaskID: 任务ID
--szAuthority: 开放权限
_G.AuthorityEventConfig['EventCompleteTask'] =
{
	--{ dwTaskID = 2038, szAuthority = 'Mount' },
	--{ dwTaskID = 3101, szAuthority = 'Bourn' },
	--{ dwTaskID = 2043, szAuthority = 'EquipIntensify'},
	{ dwTaskID = 2038, szAuthority = 'Mount' }	,
	{ dwTaskID = 2019, szAuthority = 'MainTip'}	,
	{ dwTaskID = 1014, szAuthority = 'Mall' },
	{ dwTaskID = 3013, szAuthority = 'Weekly' }	,
	{ dwTaskID = 2036, szAuthority = 'Growth' }	,
	{ dwTaskID = 2034, szAuthority = 'LTShiJie' },
	{ dwTaskID = 3013, szAuthority = 'XiaYiXunZhang' }	,
--	{ dwTaskID = 3023, szAuthority = 'Chart' }	,
	--{ dwTaskID = 4035, szAuthority = 'WeiWang' }	,
	--{ dwTaskID = 3025, szAuthority = 'Weekly' }	,
}

--权限消息定义
_G.AuthorityParseTable = function(tabData,tabFormat)
	local tabTemp = {}
	for oldkey,value in pairs(tabData) do
		local newkey = tabFormat[oldkey]
		if newkey then
			tabTemp[newkey] = value
		end
	end
	return tabTemp
end

_G.AuthorityMsgStN = {}
for k,v in pairs(AuthorityConfig) do
	AuthorityMsgStN[v.szAuthority] = k
end
_G.AuthorityMsgNtS = {}
for k,v in pairs(AuthorityConfig) do
	AuthorityMsgNtS[k] = v.szAuthority
end
