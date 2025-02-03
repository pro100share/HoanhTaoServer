--界面特效配置
_G.UIEffectConfig = {
	--坐骑资质提升
	zq_zz_up = {szName="zq_zz_up";szSwfName="zq_zz_up.swf";};
	--剧情进行中
	episodeing = {szName="episodeing";szSwfName="episodeing.swf";};
	---宝石合成成功
	gem_hc_win = {szName="gem_hc_win";szSwfName="TextMovieSystem.swf";AddPfx="zb_qh_win_wz";param="合成成功";Panel="UIRoleBase";PanelPos={x=120,y=220}};
	--护身宝甲熔炼
	hsbj_refine = {szName="hsbj_refine";szSwfName="hsbj_refine_win.swf";};
    --任务达成
	rw_dc = {szName="rw_dc";szSwfName="MuBiaoDaCheng.swf";AddPfx="Tx_ui_rw_mbdc_01";param="0";};
    --接受任务
	rw_js = {szName="rw_js";szSwfName="JieShouRenWu.swf";AddPfx="Tx_ui_rw_jsrw_01";param="0";};
    --完成任务
	rw_wc = {szName="rw_wc";szSwfName="WanChengRenWu.swf";AddPfx="Tx_ui_rw_wcrw_01";param="0";};
    --斩杀BOSS
	boss_js = {szName="boss_js";szSwfName="ZhanShaBoss.swf";AddPfx="Tx_ui_BoSS_zhansha_01";param="0";};
	--护身宝甲升级
	hsbj_sj_wenzi = {szName="hsbj_sj_wenzi";szSwfName="hsbj_refine_win.swf";};
	---人物升级
	level_up ={szName="level_up";szSwfName="TextMovieSystem.swf";AddPfx="level_up_wz";param="恭喜您升到";};
	---学习技能
	learn_skill = {szName="learn_skill";szSwfName="TextMovieSystem.swf";AddPfx="learn_skill_wz";param="领悟新武学";Panel="Skill";PanelPos={x=200,y=120}};
	---经脉打通
	jm_dt_win = {szName="jm_dt_win";szSwfName="TextMovieSystem.swf";AddPfx="jm_dt_win_wz";param="经脉打通";Panel="UIRoleBase";PanelPos={x=250,y=100}};
	---经脉贯通
	jm_quantong = {szName="jm_quantong";szSwfName="TextMovieSystem.swf";AddPfx="jm_quantong_wz";param="经脉贯通";Panel="UIRoleBase";PanelPos={x=250,y=100}};	
	---突破境界
	jj_tp_win = {szName="jj_tp_win";szSwfName="TextMovieSystem.swf";AddPfx="jj_tp_win_wz";param="恭喜您踏入";Panel="UIRoleBase";PanelPos={x=100,y=50}};
	---成为VIP特效
	become_vip = {szName="become_vip";szSwfName="TextMovieSystem.swf";AddPfx="become_vip_wz";param="恭喜您成为VIP";};	
	---坐骑升级
	zq_lv_up = {szName="zq_lv_up";szSwfName="TextMovieSystem.swf";AddPfx="zq_lv_up_wz";param="恭喜坐骑升到";};
    ---护身宝甲升阶特效
	ui_hsbj_up_win = {szName="ui_hsbj_up_win";szSwfName="TextMovieSystem.swf";AddPfx="ui_hsbj_up_win_wz";param="宝甲";Panel="AmuletWnd";PanelPos={x=80,y=1}};
	---世家创建
	collective_found_win = {szName="collective_found_win";szSwfName="TextMovieSystem.swf";AddPfx="collective_found_win_wz";param="世家创建成功";Panel="GuildMainWnd";PanelPos={x=400,y=200}};
	--装备强化特效 
	zb_qh_win =  {szName="zb_qh_win";szSwfName="TextMovieSystem.swf";AddPfx="zb_qh_win_wz";param="强化成功";Panel="EquipIntensify";PanelPos={x=127,y=400}};
	---装备升阶
	zb_up_win = {szName="zb_up_win";szSwfName="TextMovieSystem.swf";AddPfx="zb_up_win_wz";param="升阶成功";Panel="EquipIntensify";PanelPos={x=127,y=220}};
	---名剑升阶
	mj_up_win = {szName="mj_up_win";szSwfName="TextMovieSystem.swf";AddPfx="mj_up_win_wz";param="名剑";Panel="UISwordBase";PanelPos={x=80,y=60}};
	---获得礼金
	lj_huode_01={szName="lj_huode_01";szSwfName="TextMovieSystem.swf";AddPfx="lj_huode_01_wz";param="礼金";Panel="Packet";PanelPos={x=100,y=400}};
	---坐骑升阶
	zq_sj_win = {szName="zq_sj_win";szSwfName="TextMovieSystem.swf";AddPfx="zq_sj_win_wz";param="升阶成功";Panel="UIMountBack";PanelPos={x=100,y=50}};
   	---装备洗炼
	zb_lz_win = {szName="zb_lz_win";szSwfName="TextMovieSystem.swf";AddPfx="zb_lz_win_wz";param="洗炼成功";Panel="EquipIntensify";PanelPos={x=150,y=220}};
	---获得经验
	jy_huode_01={szName="jy_huode_01";szSwfName="TextMovieSystem.swf";param="经验";Panel="buildRam";PanelPos={x=400,y=400}};
    ---挑战失败
	fb_tz_shibai_01 = {szName="fb_tz_shibai_01";szSwfName="TextMovieSystem.swf";param="挑战失败";};
	fb_tz_chenggong_01 ={szName="fb_tz_chenggong_01";szSwfName="TextMovieSystem.swf";param="挑战成功";};
	---副本积分
	fb_tg_jifen_01={szName="fb_tg_jifen_01";szSwfName="TextMovieSystem.swf";param="当前积分";};
	---答题结果
	fb_tg_dati_01={szName="fb_tg_jdati_01";szSwfName="TextMovieSystem.swf";param="问答题";Panel="DaTiUI";PanelPos={x=100,y=300}};
   	---炼制成功
	ld_lz_win = {szName="ld_lz_win";szSwfName="TextMovieSystem.swf";AddPfx="zb_lz_win_wz";param="炼制成功";Panel="CUIRefiningMedicine";PanelPos={x=150,y=160}};
	---装备修炼
	zb_xl_01={szName="zb_xl_01";szSwfName="TextMovieSystem.swf";param="装备洗练";Panel="UIRoleBase";PanelPos={x=190,y=360}};
	---铸造成功
	bs_zz_win = {szName="bs_zz_win";szSwfName="TextMovieSystem.swf";AddPfx="zq_sj_win_wz";param="铸造成功";Panel="CUIStoneFoundry";PanelPos={x=75,y=85}};
    ---修行 获得修行值
	xiuxing_huode_01={szName="xiuxing_huode_01";szSwfName="TextMovieSystem.swf";param="领悟";Panel="CUIPracticeSystem";PanelPos={x=180,y=295}};
    ---修行 顿悟
	xiuxing_dunwu_01={szName="xiuxing_dunwu_01";szSwfName="TextMovieSystem.swf";param="顿悟";Panel="CUIPracticeSystem";PanelPos={x=180,y=265}};
    ---修行 大悟
	xiuxing_dawu_01={szName="xiuxing_dawu_01";szSwfName="TextMovieSystem.swf";param="大悟";Panel="CUIPracticeSystem";PanelPos={x=180,y=235}};
    ---修行 领悟成功跳字
	xiuxing_LingWuChengGong={szName="xiuxing_LingWuChengGong";szSwfName="TextMovieSystem.swf";param="领悟成功";Panel="CUIPracticeSystem";PanelPos={x=160-25,y=185}};
	---易筋经领悟成功跳字
	yijinjing_LingWuChengGong={szName="yijinjing_LingWuChengGong";szSwfName="TextMovieSystem.swf";AddPfx="TX_ui_Refine_lingwuchenggong";param="领悟成功";Panel="CUIKungFuSystem";PanelPos={x=210,y=135}};
    ---血魔功
	gf_xmg_win = {szName="gf_xmg_win";szSwfName="TextMovieSystem.swf";param="血魔功属性";Panel="CUIKungFuSystem";PanelPos={x=320,y=180}};
	gf_xmg_win_01 = {szName="gf_xmg_win_01";szSwfName="TextMovieSystem.swf";param="血魔功数字蓝";Panel="CUIKungFuSystem";PanelPos={x=380,y=190}};
	gf_xmg_win_02 = {szName="gf_xmg_win_02";szSwfName="TextMovieSystem.swf";param="血魔功数字绿";Panel="CUIKungFuSystem";PanelPos={x=380,y=190}};
	gf_xmg_win_03 = {szName="gf_xmg_win_03";szSwfName="TextMovieSystem.swf";param="血魔功数字黄";Panel="CUIKungFuSystem";PanelPos={x=380,y=190}};
	gf_xmg_win_04 = {szName="gf_xmg_win_04";szSwfName="TextMovieSystem.swf";param="血魔功数字橙";Panel="CUIKungFuSystem";PanelPos={x=380,y=190}};
	gf_xmg_win_05 = {szName="gf_xmg_win_05";szSwfName="TextMovieSystem.swf";param="血魔功数字红";Panel="CUIKungFuSystem";PanelPos={x=380,y=190}};
	--逆天炼制（属性翻倍）
	shuxingfanbei_nitianlianzhi={szName="shuxingfanbei_nitianlianzhi";szSwfName="TextMovieSystem.swf";AddPfx="zb_lz_win_wz";param="属性升阶";Panel="UIPropertyScrollSystem";PanelPos={x=92,y=136}};
	--逆天炼制（属性翻倍）
	shuxingfanbei_lianzhichenggong = {szName="ld_lz_win";szSwfName="TextMovieSystem.swf";AddPfx="zb_lz_win_wz";param="炼制成功";Panel="UIPropertyScrollSystem";PanelPos={x=92,y=136}};
	---注灵
	--ui_mj_zl = {szName="ui_mj_zl";szSwfName="TextMovieSystem.swf";param="名剑注灵跳字熟练度";Panel="UISwordBase";PanelPos={x=0,y=0}};	
	ui_mj_zl_1={szName="ui_mj_zl_1";szSwfName="TextMovieSystem.swf";param="注灵黄";Panel="UISwordBase";PanelPos={x=380,y=300}};
	ui_mj_zl_2={szName="ui_mj_zl_2";szSwfName="TextMovieSystem.swf";param="注灵绿";Panel="UISwordBase";PanelPos={x=380,y=300}};
    ---阵法-北斗七星 星斗经验（小）1
	zhenfa_xdjy_11={szName="zhenfa_xdjy_11";szSwfName="TextMovieSystem.swf";param="星斗经验1";Panel="CUIKungFuSystem";PanelPos={x=250-100,y=340-20}};
    ---阵法-北斗七星 星斗经验（中）1
	zhenfa_xdjy_12={szName="zhenfa_xdjy_12";szSwfName="TextMovieSystem.swf";param="星斗经验2";Panel="CUIKungFuSystem";PanelPos={x=250-100,y=340-20}};
    ---阵法-北斗七星 星斗经验（大）1
	zhenfa_xdjy_13={szName="zhenfa_xdjy_13";szSwfName="TextMovieSystem.swf";param="星斗经验3";Panel="CUIKungFuSystem";PanelPos={x=250-100,y=340-20}};
    ---阵法-北斗七星 星斗经验（小）2
	zhenfa_xdjy_21={szName="zhenfa_xdjy_21";szSwfName="TextMovieSystem.swf";param="星斗经验1";Panel="CUIKungFuSystem";PanelPos={x=330-100,y=250-20}};
    ---阵法-北斗七星 星斗经验（中）2
	zhenfa_xdjy_22={szName="zhenfa_xdjy_22";szSwfName="TextMovieSystem.swf";param="星斗经验2";Panel="CUIKungFuSystem";PanelPos={x=330-100,y=250-20}};
    ---阵法-北斗七星 星斗经验（大）2
	zhenfa_xdjy_23={szName="zhenfa_xdjy_23";szSwfName="TextMovieSystem.swf";param="星斗经验3";Panel="CUIKungFuSystem";PanelPos={x=330-100,y=250-20}};
    ---阵法-北斗七星 星斗经验（小）3
	zhenfa_xdjy_31={szName="zhenfa_xdjy_31";szSwfName="TextMovieSystem.swf";param="星斗经验1";Panel="CUIKungFuSystem";PanelPos={x=450-100,y=215-20}};
    ---阵法-北斗七星 星斗经验（中）3
	zhenfa_xdjy_32={szName="zhenfa_xdjy_32";szSwfName="TextMovieSystem.swf";param="星斗经验2";Panel="CUIKungFuSystem";PanelPos={x=450-100,y=215-20}};
    ---阵法-北斗七星 星斗经验（大）3
	zhenfa_xdjy_33={szName="zhenfa_xdjy_33";szSwfName="TextMovieSystem.swf";param="星斗经验3";Panel="CUIKungFuSystem";PanelPos={x=450-100,y=215-20}};
    ---阵法-北斗七星 星斗经验（小）4
	zhenfa_xdjy_41={szName="zhenfa_xdjy_41";szSwfName="TextMovieSystem.swf";param="星斗经验1";Panel="CUIKungFuSystem";PanelPos={x=545-100,y=280-20}};
    ---阵法-北斗七星 星斗经验（中）4
	zhenfa_xdjy_42={szName="zhenfa_xdjy_42";szSwfName="TextMovieSystem.swf";param="星斗经验2";Panel="CUIKungFuSystem";PanelPos={x=545-100,y=280-20}};
    ---阵法-北斗七星 星斗经验（大）4
	zhenfa_xdjy_43={szName="zhenfa_xdjy_43";szSwfName="TextMovieSystem.swf";param="星斗经验3";Panel="CUIKungFuSystem";PanelPos={x=545-100,y=280-20}};
    ---阵法-北斗七星 星斗经验（小）5
	zhenfa_xdjy_51={szName="zhenfa_xdjy_51";szSwfName="TextMovieSystem.swf";param="星斗经验1";Panel="CUIKungFuSystem";PanelPos={x=607-100,y=370-20}};
    ---阵法-北斗七星 星斗经验（中）5
	zhenfa_xdjy_52={szName="zhenfa_xdjy_52";szSwfName="TextMovieSystem.swf";param="星斗经验2";Panel="CUIKungFuSystem";PanelPos={x=607-100,y=370-20}};
    ---阵法-北斗七星 星斗经验（大）5
	zhenfa_xdjy_53={szName="zhenfa_xdjy_53";szSwfName="TextMovieSystem.swf";param="星斗经验3";Panel="CUIKungFuSystem";PanelPos={x=607-100,y=370-20}};
    ---阵法-北斗七星 星斗经验（小）6
	zhenfa_xdjy_61={szName="zhenfa_xdjy_61";szSwfName="TextMovieSystem.swf";param="星斗经验1";Panel="CUIKungFuSystem";PanelPos={x=727-100,y=330-20}};
    ---阵法-北斗七星 星斗经验（中）6
	zhenfa_xdjy_62={szName="zhenfa_xdjy_62";szSwfName="TextMovieSystem.swf";param="星斗经验2";Panel="CUIKungFuSystem";PanelPos={x=727-100,y=330-20}};
    ---阵法-北斗七星 星斗经验（大）6
	zhenfa_xdjy_63={szName="zhenfa_xdjy_63";szSwfName="TextMovieSystem.swf";param="星斗经验3";Panel="CUIKungFuSystem";PanelPos={x=727-100,y=330-20}};
    ---阵法-北斗七星 星斗经验（小）7
	zhenfa_xdjy_71={szName="zhenfa_xdjy_71";szSwfName="TextMovieSystem.swf";param="星斗经验1";Panel="CUIKungFuSystem";PanelPos={x=740-100,y=210-20}};
    ---阵法-北斗七星 星斗经验（中）7
	zhenfa_xdjy_72={szName="zhenfa_xdjy_72";szSwfName="TextMovieSystem.swf";param="星斗经验2";Panel="CUIKungFuSystem";PanelPos={x=740-100,y=210-20}};
    ---阵法-北斗七星 星斗经验（大）7
	zhenfa_xdjy_73={szName="zhenfa_xdjy_73";szSwfName="TextMovieSystem.swf";param="星斗经验3";Panel="CUIKungFuSystem";PanelPos={x=740-100,y=210-20}};
	---阵法-星斗升级成功跳字特效
	zhenfa_xdjy_14={szName="zhenfa_xdjy_14";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIPetWash";PanelPos={x=180,y=235}};		---阵法-星斗升级成功跳字特效
	zhenfa_xdjy_24={szName="zhenfa_xdjy_24";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};		
	zhenfa_xdjy_34={szName="zhenfa_xdjy_34";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};		
	zhenfa_xdjy_44={szName="zhenfa_xdjy_44";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};		
	zhenfa_xdjy_54={szName="zhenfa_xdjy_54";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};		
	zhenfa_xdjy_64={szName="zhenfa_xdjy_64";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};		
	zhenfa_xdjy_74={szName="zhenfa_xdjy_74";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};		
	zhenfa_xdjy_84={szName="zhenfa_xdjy_84";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};		
	zhenfa_xdjy_94={szName="zhenfa_xdjy_94";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=180,y=235}};
	--侠义勋章-升星成功弹字特效
	xiayixunzhang_upstar_win = {szName="xiayixunzhang_upstar_win";szSwfName="TextMovieSystem.swf";param="升星成功";Panel="UIErrantHonorSystem";PanelPos={x=110,y=180}};
	--功法-铁布衫 修炼经验
	gongfa_tbs_01={szName="gongfa_tbs_01";szSwfName="TextMovieSystem.swf";param="修炼经验";Panel="CUIKungFuSystem";PanelPos={x=280,y=380}};
	--功法-铁布衫  套装升级特效
	gongfa_tbs_02={szName="gongfa_tbs_02";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=320,y=250}};
	--功法-铁布衫  修炼升级特效
	gongfa_tbs_leveup_01={szName="gongfa_tbs_leveup_01";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=330,y=385}};
	--功法-童姥功 修为值跳字1
	gongfa_tlg_01={szName="gongfa_tlg_01";szSwfName="TextMovieSystem.swf";param="修为值1";Panel="CUIKungFuSystem";PanelPos={x=570,y=380}};
	--功法-童姥功 修为值跳字2
	gongfa_tlg_02={szName="gongfa_tlg_02";szSwfName="TextMovieSystem.swf";param="修为值2";Panel="CUIKungFuSystem";PanelPos={x=570,y=380}};
	--功法-童姥功  修炼升级跳字
	gongfa_tlg_leveup_01={szName="gongfa_tlg_leveup_01";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=330,y=385}};
	--功法-童姥功  修炼阶段升级跳字
	gongfa_tlg_leveup_02={szName="gongfa_tlg_leveup_02";szSwfName="TextMovieSystem.swf";param="阶段提升";Panel="CUIKungFuSystem";PanelPos={x=330,y=385}};
	--功法-童姥功  套装1升级跳字
	gongfa_tlg_suitleveup_01={szName="gongfa_tlg_suitleveup_01";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=440,y=50}};
	--功法-童姥功  套装2升级跳字
	gongfa_tlg_suitleveup_02={szName="gongfa_tlg_suitleveup_02";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=365,y=130}};
	--功法-童姥功  套装3升级跳字
	gongfa_tlg_suitleveup_03={szName="gongfa_tlg_suitleveup_03";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=500,y=130}};
	--功法-童姥功  套装4升级跳字
	gongfa_tlg_suitleveup_04={szName="gongfa_tlg_suitleveup_04";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=530,y=250}};
	--功法-童姥功  套装5升级跳字
	gongfa_tlg_suitleveup_05={szName="gongfa_tlg_suitleveup_05";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=450,y=235}};
	--功法-童姥功  套装6升级跳字
	gongfa_tlg_suitleveup_06={szName="gongfa_tlg_suitleveup_06";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=355,y=230}};
	--功法-童姥功  套装7升级跳字
	gongfa_tlg_suitleveup_07={szName="gongfa_tlg_suitleveup_07";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=450,y=290}};
	--群侠卡片-组合收集完整弹字特效
	qunxialu_collected_win = {szName="qunxialu_collected_win";szSwfName="TextMovieSystem.swf";param="收集完整";Panel="CUIQunXiaLuSystem";PanelPos={x=340,y=200}};
    --群侠卡片-融合成功弹字特效
	qunxialu_ronghe_win = {szName="qunxialu_ronghe_win";szSwfName="TextMovieSystem.swf";param="融合成功";Panel="CUIQunXiaLuSystem";PanelPos={x=220,y=200}};
	--酒葫芦 成长值跳字1
	jiuhulu_cz_01={szName="jiuhulu_cz_01";szSwfName="TextMovieSystem.swf";param="成长值1";Panel="UIGourd";PanelPos={x=500,y=155}};
	--酒葫芦 成长值跳字2
	jiuhulu_cz_02={szName="jiuhulu_cz_02";szSwfName="TextMovieSystem.swf";param="成长值3";Panel="UIGourd";PanelPos={x=500,y=155}};
	--酒葫芦 成长值跳字3
	jiuhulu_cz_03={szName="jiuhulu_cz_03";szSwfName="TextMovieSystem.swf";param="成长值2";Panel="UIGourd";PanelPos={x=500,y=155}};
	--酒葫芦 阶段升级跳字
	jiuhulu_levelup_01={szName="jiuhulu_levelup_01";szSwfName="TextMovieSystem.swf";param="阶段提升";Panel="UIGourd";PanelPos={x=130,y=130}};
	--酒葫芦 升级跳字
	jiuhulu_levelup_02={szName="jiuhulu_levelup_02";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="UIGourd";PanelPos={x=460,y=110}};
	--坐骑转生 转生经验
	Mount_Change_01={szName="Mount_Change_01";szSwfName="TextMovieSystem.swf";param="装备洗练";Panel="UIMountBack";PanelPos={x=200,y=385}};
	--坐骑转生 转生成功
	Mount_Change_02={szName="Mount_Change_02";szSwfName="TextMovieSystem.swf";param="转生成功";Panel="UIMountBack";PanelPos={x=165,y=385}};
	---侠客洗练 跳字1
	xkxl_tiaoz_neili={szName="xkxl_tiaoz_neili";szSwfName="TextMovieSystem.swf";param="青色内力";Panel="CUIPetWash";PanelPos={x=180,y=235}};
	---侠客洗练 跳字2
	xkxl_tiaoz_gongji={szName="xkxl_tiaoz_gongji";szSwfName="TextMovieSystem.swf";param="青色攻击";Panel="CUIPetWash";PanelPos={x=180,y=235}};
	---侠客洗练 跳字3
	xkxl_tiaoz_fangyu={szName="xkxl_tiaoz_fangyu";szSwfName="TextMovieSystem.swf";param="青色防御";Panel="CUIPetWash";PanelPos={x=180,y=235}};
	---侠客洗练 跳字4
	xkxl_tiaoz_baoji={szName="xkxl_tiaoz_baoji";szSwfName="TextMovieSystem.swf";param="青色身法";Panel="CUIPetWash";PanelPos={x=180,y=235}};
	---侠客洗练 跳字5
	xkxl_tiaoz_shenfa={szName="xkxl_tiaoz_shenfa";szSwfName="TextMovieSystem.swf";param="青色暴击";Panel="CUIPetWash";PanelPos={x=180,y=235}};
	---侠客洗练 升级跳字
	xkxl_tiaoz__shengji={szName="xkxl_tiaoz__shengji";szSwfName="TextMovieSystem.swf";param="阶段提升";Panel="CUIPetWash";PanelPos={x=230,y=235}};
    ---武尊全章领悟成功跳字
	WZQZ_ChengGong={szName="WZQZ_ChengGong";szSwfName="TextMovieSystem.swf";AddPfx="TX_ui_Refine_lingwuchenggong";param="领悟成功";Panel="CGestPanel";PanelPos={x=210,y=135}};
	---时装化身升阶
	shizhuang_huashen_01={szName="shizhuang_huashen_01";szSwfName="TextMovieSystem.swf";param="经验";Panel="UIFashionBgUI";PanelPos={x=400,y=400}};
	--暗器 修炼值跳字
	anqi_xl_01={szName="anqi_xl_01";szSwfName="TextMovieSystem.swf";param="修炼值";Panel="CHiddenWeaponUI";PanelPos={x=155,y=355}};
	--暗器 阶段提升跳字
	anqi_levelup_01={szName="anqi_levelup_01";szSwfName="TextMovieSystem.swf";param="阶段提升";Panel="CHiddenWeaponUI";PanelPos={x=130,y=130}};
	--暗器 升级跳字
	anqi_levelup_02={szName="anqi_levelup_02";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CHiddenWeaponUI";PanelPos={x=60,y=355}};
	--功法-独孤九剑 修炼经验
	gongfa_dugujiujian_01={szName="gongfa_dugujiujian_01";szSwfName="TextMovieSystem.swf";param="修炼经验";Panel="CUIKungFuSystem";PanelPos={x=560,y=380}};
	--功法-独孤九剑  修炼升级跳字
	gongfa_dugujiujian_leveup_01={szName="gongfa_dugujiujian_leveup_01";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CUIKungFuSystem";PanelPos={x=330,y=385}};
	--功法-独孤九剑  修炼阶段升级跳字
	gongfa_dugujiujian_leveup_02={szName="gongfa_dugujiujian_leveup_02";szSwfName="TextMovieSystem.swf";param="阶段提升";Panel="CUIKungFuSystem";PanelPos={x=330,y=385}};
	--功法-独孤九剑  套装1激活跳字
	gongfa_dugujiujian_suitleveup_01={szName="gongfa_dugujiujian_suitleveup_01";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=210,y=115}};
	--功法-独孤九剑  套装2激活跳字
	gongfa_dugujiujian_suitleveup_02={szName="gongfa_dugujiujian_suitleveup_02";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=250,y=180}};
	--功法-独孤九剑  套装3激活跳字
	gongfa_dugujiujian_suitleveup_03={szName="gongfa_dugujiujian_suitleveup_03";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=315,y=169}};
	--功法-独孤九剑  套装4激活跳字
	gongfa_dugujiujian_suitleveup_04={szName="gongfa_dugujiujian_suitleveup_04";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=380,y=160}};
	--功法-独孤九剑  套装5激活跳字
	gongfa_dugujiujian_suitleveup_05={szName="gongfa_dugujiujian_suitleveup_05";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=420,y=150}};
	--功法-独孤九剑  套装6激活跳字
	gongfa_dugujiujian_suitleveup_06={szName="gongfa_dugujiujian_suitleveup_06";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=465,y=160}};
	--功法-独孤九剑  套装7激活跳字
	gongfa_dugujiujian_suitleveup_07={szName="gongfa_dugujiujian_suitleveup_07";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=525,y=170}};
	--功法-独孤九剑  套装6激活跳字
	gongfa_dugujiujian_suitleveup_08={szName="gongfa_dugujiujian_suitleveup_08";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=595,y=170}};
	--功法-独孤九剑  套装7激活跳字
	gongfa_dugujiujian_suitleveup_09={szName="gongfa_dugujiujian_suitleveup_09";szSwfName="TextMovieSystem.swf";param="激活";Panel="CUIKungFuSystem";PanelPos={x=675,y=150}};
	---青云勋章 获得稀有勋章跳字
	qyxx_xiyou__huode={szName="qyxx_xiyou__huode";szSwfName="TextMovieSystem.swf";param="获得稀有勋章";Panel="UICloudMedal";PanelPos={x=410,y=235}};
	---青云勋章 获得奇珍勋章跳字
	qyxx_qizhen__huode={szName="qyxx_qizhen__huode";szSwfName="TextMovieSystem.swf";param="获得奇珍勋章";Panel="UICloudMedal";PanelPos={x=410,y=235}};
	---青云勋章 获得秘宝勋章跳字
	qyxx_mibao__huode={szName="qyxx_mibao__huode";szSwfName="TextMovieSystem.swf";param="获得秘宝勋章";Panel="UICloudMedal";PanelPos={x=410,y=235}};
	--战骑诀  修炼普通跳字
	zuoqi_zhanqijue_putongxiulian={szName="zuoqi_zhanqijue_putongxiulian";szSwfName="TextMovieSystem.swf";param="经验";Panel="CUIKungFuSystem";PanelPos={x=330,y=385}};
	--战骑诀  修炼暴击跳字
	zuoqi_zhanqijue_baojixiulian={szName="zuoqi_zhanqijue_baojixiulian";szSwfName="TextMovieSystem.swf";param="青色暴击";Panel="CUIKungFuSystem";PanelPos={x=330,y=385}};
	--法宝 铸造值跳字
	fabao_xl_01={szName="fabao_xl_01";szSwfName="TextMovieSystem.swf";param="铸造值";Panel="CShieldMainUI";PanelPos={x=500,y=155}};
	--法宝 阶段提升跳字
	fabao_levelup_01={szName="fabao_levelup_01";szSwfName="TextMovieSystem.swf";param="阶段提升";Panel="CShieldMainUI";PanelPos={x=400,y=160}};
	--法宝 升级跳字
	fabao_levelup_02={szName="fabao_levelup_02";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="CShieldMainUI";PanelPos={x=390,y=140}};
	--金身  修炼普通跳字
	jinshen__putongxiulian={szName="jinshen__putongxiulian";szSwfName="TextMovieSystem.swf";param="金身经验";Panel="UIRoleBase";PanelPos={x=145,y=355}};
	--金身  修炼暴击跳字
	jinshen__baojixiulian={szName="jinshen__baojixiulian";szSwfName="TextMovieSystem.swf";param="金身暴击";Panel="UIRoleBase";PanelPos={x=155,y=355}};
	---青云勋章 获得真武勋章跳字
	qyxx_zhenwu__huode={szName="qyxx_zhenwu__huode";szSwfName="TextMovieSystem.swf";param="获得真武勋章";Panel="UICloudMedal";PanelPos={x=410,y=235}};
	---青云勋章 获得神威勋章跳字
	qyxx_shenwei__huode={szName="qyxx_shenwei__huode";szSwfName="TextMovieSystem.swf";param="获得神威勋章";Panel="UICloudMedal";PanelPos={x=410,y=235}};
    --战旗 铸造值跳字
	zhanqi_xl_01={szName="zhanqi_xl_01";szSwfName="TextMovieSystem.swf";param="铸造值";Panel="BannerUI";PanelPos={x=150,y=400}};
	--战旗 阶段提升跳字
	zhanqi_levelup_01={szName="zhanqi_levelup_01";szSwfName="TextMovieSystem.swf";param="阶段提升";Panel="BannerUI";PanelPos={x=220,y=350}};
	--战旗 升级跳字
	zhanqi_levelup_02={szName="zhanqi_levelup_02";szSwfName="TextMovieSystem.swf";param="星斗升级";Panel="BannerUI";PanelPos={x=160,y=260}};

	--界面3D特效
	--技能可升级特效
	ui_skill_sj_01 =
	{
		szName = "ui_skill_sj_01";
		PfxID = 91;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-51,y=-50};
		Backcolor = 0x004d8b9f,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_02 =
	{
		szName = "ui_skill_sj_02";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_03=
	{
		szName = "ui_skill_sj_03";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_04=
	{
		szName = "ui_skill_sj_04";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	

	ui_skill_sj_05=
	{
		szName = "ui_skill_sj_05";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_06=
	{
		szName = "ui_skill_sj_06";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_07=
	{
		szName = "ui_skill_sj_07";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_08=
	{
		szName = "ui_skill_sj_08";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_09=
	{
		szName = "ui_skill_sj_09";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_10=
	{
		szName = "ui_skill_sj_10";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_11=
	{
		szName = "ui_skill_sj_11";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_12=
	{
		szName = "ui_skill_sj_12";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_13=
	{
		szName = "ui_skill_sj_13";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_14=
	{
		szName = "ui_skill_sj_14";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_15=
	{
		szName = "ui_skill_sj_15";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_16=
	{
		szName = "ui_skill_sj_16";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_17=
	{
		szName = "ui_skill_sj_17";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_18=
	{
		szName = "ui_skill_sj_18";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_19=
	{
		szName = "ui_skill_sj_19";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_20=
	{
		szName = "ui_skill_sj_20";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_21=
	{
		szName = "ui_skill_sj_21";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_22=
	{
		szName = "ui_skill_sj_22";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_23=
	{
		szName = "ui_skill_sj_23";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_sj_24=
	{
		szName = "ui_skill_sj_24";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	--技能可学习特效
	ui_skill_xx_01=
	{
		szName = "ui_skill_xx_01";
		PfxID = 91;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-51,y=-50};
		Backcolor = 0x004d8b9f,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_02=
	{
		szName = "ui_skill_xx_02";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_03=
	{
		szName = "ui_skill_xx_03";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_04=
	{
		szName = "ui_skill_xx_04";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	

	ui_skill_xx_05=
	{
		szName = "ui_skill_xx_05";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_06=
	{
		szName = "ui_skill_xx_06";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_07=
	{
		szName = "ui_skill_xx_07";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_08=
	{
		szName = "ui_skill_xx_08";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_09=
	{
		szName = "ui_skill_xx_09";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_10=
	{
		szName = "ui_skill_xx_10";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_11=
	{
		szName = "ui_skill_xx_11";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_12=
	{
		szName = "ui_skill_xx_12";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_13=
	{
		szName = "ui_skill_xx_13";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_14=
	{
		szName = "ui_skill_xx_14";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_15=
	{
		szName = "ui_skill_xx_15";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_16=
	{
		szName = "ui_skill_xx_16";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_17=
	{
		szName = "ui_skill_xx_17";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_18=
	{
		szName = "ui_skill_xx_18";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_19=
	{
		szName = "ui_skill_xx_19";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_20=
	{
		szName = "ui_skill_xx_20";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_21=
	{
		szName = "ui_skill_xx_21";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_22=
	{
		szName = "ui_skill_xx_22";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_23=
	{
		szName = "ui_skill_xx_23";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	ui_skill_xx_24=
	{
		szName = "ui_skill_xx_24";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-75,y=-100};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};	
	
	---闭关底图特效
	ui_bg_bg_01= 
	{
		szName = "ui_bg_bg_01";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,7,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-15,y=-35};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};
	ui_bg_bg_02= 
	{
		szName = "ui_bg_bg_02";
		PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-15,y=-35};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};
	ui_bg_bg_03= 
	{
		szName = "ui_bg_bg_03";
        PfxID = 88;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-15,y=-35};
		Backcolor = 0x00252c35,
		Last = 0;
		bMouse = false;
	};
	---获得礼金
	lj_huode_01_wz = 
	{
		szName = "lj_huode_01_wz";
		PfxID = 87;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-150,y=-110};
		Backcolor = 0x00725f3d,
		Last = 3400;
		bMouse = false;
	};		
	
	
	--名剑升阶
	mj_up_win_wz = 
	{
		szName = "mj_up_win_wz";
		PfxID = 86;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,25,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-90,y=-120};
		Backcolor = 0x00ff6825,
		Last = 5000;
		bMouse = false;
	};	
	--人物升级特效
	level_up_wz = 
	{
		szName = "level_up_wz";
		PfxID = 20;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0x00ff6825,
		Last = 4000;
		bMouse = false;
	};
    ---任务条件达成特效
	-- rw_dc = 
	-- {
		-- szName = "rw_dc";
		-- dwPfxID = 21;
		-- Look = _Vector3.new(0,0,-5);
		-- Eye = _Vector3.new(10,50,0);
		-- Size = _Vector2.new(600,600);
		-- Pos = {x=1,y=1};
		-- Backcolor = 0,
		-- Last = 3400;
		-- bMouse = false;
	-- };	
	--技能学习
	learn_skill_wz = 
	{
		szName = "learn_skill_wz";
		PfxID = 22;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,20,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-170,y=-105};
		Backcolor = 0x00ff6825,
		Last = 5000;
		bMouse = false;
	};	
	--兵魂强化成功特效
	zb_bhup = 
	{
		szName = "zb_bhup";
		PfxID = 26;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 4000;
		bMouse = false;
	};	
	--装备强化特效 
	zb_qh_win_wz = 
	{
		szName = "zb_qh_win_wz";
		PfxID = 27;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,55,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-85,y=-100};
		Backcolor = 0x006b6039,
		Last = 5000;
		bMouse = false;
	};	
	---装备升阶
	zb_up_win_wz = 
	{
		szName = "zb_up_win_wz";
		PfxID = 27;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,55,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-85,y=-100};
		Backcolor = 0x006b6039,
		Last = 5000;
		bMouse = false;
	};	
	---装备洗炼类型
	zb_lz_win_wz = 
	{
		szName = "zb_lz_win_wz";
		PfxID = 29;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,55,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-120,y=-95};
		Backcolor = 0x006f412f,
		Last = 4000;
		bMouse = false;
	};	
	---装备洗炼品质
	zb_reset_win = 
	{
		szName = "zb_reset_win";
		PfxID = 30;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 4000;
		bMouse = false;
	};	
	---装备洗炼数值
	zb_szup = 
	{
		szName = "zb_szup";
		PfxID = 31;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 4000;
		bMouse = false;
	};	
	---坐骑技能提升
	zq_skill_up = 
	{
		szName = "zq_skill_up";
		dwPfxID = 32;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};	
	---坐骑技能学习
	zq_add_skill = 
	{
		szName = "zq_add_skill";
		dwPfxID = 33;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Last = 3400;
		bMouse = false;
	};	

	-- ---坐骑升级
	zq_lv_up_wz = 
	{
		szName = "zq_lv_up_wz";
		PfxID = 65;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,300);
		Pos = {x=-50,y=-25};
		Backcolor = 0x00564536,
		Last = 3400;
		bMouse = false;
	};
	---坐骑品质提升
	zq_pz_up = 
	{
		szName = "zq_pz_up";
		dwPfxID = 34;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---坐骑升阶
	zq_sj_win_wz = 
	{
		szName = "zq_sj_win_wz";
		PfxID = 35;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,20,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-170,y=-105};
		Backcolor = 0x00ff6825,
		Last = 5000;
		bMouse = false;
	};
	--鼠标点击任务追踪
	--[[task_link_click = 
	{
		szName = "task_link_click";
		dwPfxID = 24;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,55,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Last = 0;
		bMouse = false;
	};]]
	---鼠标点击任务追踪
	task_link_click = 
	{
		szName = "task_link_click";
		dwPfxID = 36;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 1000;
		bMouse = true;
	};
	-- ---成为VIP特效
	become_vip_wz = 
	{
		szName = "become_vip_wz";
		PfxID = 37;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,300);
		Pos = {x=-145,y=-80};
		Backcolor = 0x00534b31,
		Last = 3400;
		bMouse = false;
	};
	---护身宝甲升阶特效
	hsbj_up_win = 
	{
		szName = "hsbj_up_win";
		PfxID = 82;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-162,y=-74};
		Backcolor = 0,
		Last = 40000;
		bMouse = false;
	};
	---经脉打通特效
	jm_dt_win_wz = 
	{
		szName = "jm_dt_win_wz";
		PfxID = 39;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,55,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-85,y=-100};
		Backcolor = 0x006b6039,
		Last = 5000;
		bMouse = false;
	};
	---境界突破特效
	jj_tp_win_wz = 
	{
		szName = "jj_tp_win_wz";
		PfxID = 40;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,300);
		Pos = {x=-150,y=-83};
		Backcolor = 0x006f362c,
		Last = 5000;
		bMouse = false;
	};
	---世家创建特效
	collective_found_win_wz = 
	{
		szName = "collective_found_win_wz";
		PfxID = 41;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,300);
		Pos = {x=-180,y=-85};
		Backcolor = 0x00735439,
		Last = 3400;
		bMouse = false;
	};
	---世家升级特效
	ui_sj_sj = 
	{
		szName = "ui_sj_sj";
		dwPfxID = 63;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,50,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---世家图腾升级1阶特效
	TX_ui_guild_levelup_01 = 
	{
		szName = "TX_ui_guild_levelup_01";
		PfxID = 133;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-182,y=-160};
		Backcolor = 0x0000ffa2,
		Last = 0;
		bMouse = false;
	};
	---世家图腾升级2阶特效
    TX_ui_guild_levelup_02 = 
	{
		szName = "TX_ui_guild_levelup_02";
		PfxID = 134;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-182,y=-160};
		Backcolor = 0x00ecfdff,
		Last = 0;
		bMouse = false;
	};
	---世家图腾升级3阶特效
	TX_ui_guild_levelup_03 = 
	{
		szName = "TX_ui_guild_levelup_03";
		PfxID = 135;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-182,y=-160};
		Backcolor = 0x00ff1313,
		Last = 0;
		bMouse = false;
	};
	---世家图腾升级4阶特效
	TX_ui_guild_levelup_04 = 
	{
		szName = "TX_ui_guild_levelup_04";
		PfxID = 136;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-182,y=-160};
		Backcolor = 0x0000fffc,
		Last = 0;
		bMouse = false;
	};
	---世家图腾升级5阶特效
    TX_ui_guild_levelup_05 = 
	{
		szName = "TX_ui_guild_levelup_05";
		PfxID = 137;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-182,y=-160};
		Backcolor = 0x006600ff,
		Last = 0;
		bMouse = false;
	};
	---五行火等级提升特效
	h_lv_up = 
	{
		szName = "h_lv_up";
		dwPfxID = 42;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---五行金等级提升特效
	j_lv_up = 
	{
		szName = "j_lv_up";
		dwPfxID = 43;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---五行木等级提升特效
	m_lv_up = 
	{
		szName = "m_lv_up";
		dwPfxID = 44;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---五行水等级提升特效
	s_lv_up = 
	{
		szName = "s_lv_up";
		dwPfxID = 45;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---五行土等级提升特效
	t_lv_up = 
	{
		szName = "t_lv_up";
		dwPfxID = 46;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---五行丹田等级提升特效
	dt_lv_up = 
	{
		szName = "dt_lv_up";
		dwPfxID = 64;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---经脉贯通特效
	jm_quantong_wz = 
	{
		szName = "jm_quantong_wz";
		dwPfxID = 47;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,55,0);
		Size = _Vector2.new(1024,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---坐骑防御资质提升
	zq_fyzzup = 
	{
		szName = "zq_fyzzup";
		dwPfxID = 48;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---坐骑根骨资质提升
	zq_ggzzup = 
	{
		szName = "zq_ggzzup";
		dwPfxID = 49;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---坐骑攻击资质提升
	zq_gjzzup = 
	{
		szName = "zq_gjzzup";
		dwPfxID = 50;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---坐骑技巧资质提升
	zq_jqzzup = 
	{
		szName = "zq_jqzzup";
		dwPfxID = 51;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---每日活动签到成功
	hd_qdcg = 
	{
		szName = "hd_qdcg";
		dwPfxID = 52;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,40,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---煞元
	lz_nq_hq01= 
	{
		szName = "lz_nq_hq01";
		PfxID = 55;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(35,65);
		Pos = {x=0.5,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	lz_nq_hq02= 
	{
		szName = "lz_nq_hq02";
		PfxID = 55;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(35,65);
		Pos = {x=3,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	lz_nq_hq03= 
	{
		szName = "lz_nq_hq03";
		PfxID = 55;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(35,65);
		Pos = {x=3,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	lz_nq_hq04= 
	{
		szName = "lz_nq_hq04";
		PfxID = 55;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(35,65);
		Pos = {x=3,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	lz_nq_hq05= 
	{
		szName = "lz_nq_hq05";
		PfxID = 55;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(35,65);
		Pos = {x=3,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---五行界面疾蓄特效
	wx_jx_jd1_dwMetal = 
	{
		szName = "wx_jx_jd1_dwMetal";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-60};
		Backcolor = 0,
		Last = 2000;
		bMouse = false;
	};

	wx_jx_jd1_dwWood = 
	{
		szName = "wx_jx_jd1_dwWood";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};

	wx_jx_jd1_dwWater = 
	{
		szName = "wx_jx_jd1_dwWater";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};

	wx_jx_jd1_dwFire = 
	{
		szName = "wx_jx_jd1_dwFire";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};

	wx_jx_jd1_dwEarth = 
	{
		szName = "wx_jx_jd1_dwEarth";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=1,y=1};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};

	wx_jx_jd2_dwMetal = 
	{
		szName = "wx_jx_jd2_dwMetal";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};

	wx_jx_jd2_dwWood = 
	{
		szName = "wx_jx_jd2_dwWood";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	
	wx_jx_jd2_dwWater = 
	{
		szName = "wx_jx_jd2_dwWater";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};

	wx_jx_jd2_dwFire = 
	{
		szName = "wx_jx_jd2_dwFire";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	
	wx_jx_jd2_dwEarth = 
	{
		szName = "wx_jx_jd2_dwEarth";
		PfxID = 56;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};


	---境界突破成功特效
	jj_tp_cg = 
	{
		szName = "jj_tp_cg";
		PfxID = 58;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 2500;
		bMouse = false;
	};
	---宝甲熔炼成功特效
	bj_rl_cg_02 = 
	{
		szName = "bj_rl_cg_02";
		PfxID = 60;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(210,210);
		Pos = {x=-10,y=-14};
		Backcolor = 0,
		Last = 2500;
		bMouse = false;
	};
	---宝甲熔炼失败特效
	bj_rl_sb_01 = 
	{
		szName ="bj_rl_sb_01";
		PfxID = 74;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-40,y=-147};
		Backcolor = 0,
		Last = 15000;
		bMouse = false;
	};
	-- ---护身宝甲升阶特效
	ui_hsbj_up_win_wz = 
	{
		szName = "ui_hsbj_up_win_wz";
		PfxID = 38;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(10,25,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-140,y=-130};
		Backcolor = 0x00ff6825,
		Last = 5000;
		bMouse = false;
	};
	---境界突破失败特效
	TX_ui_jj_tp_sb = 
	{
		szName = "TX_ui_jj_tp_sb";
		PfxID = 61;
		Look = _Vector3.new(0,0,-5);
		Eye = _Vector3.new(0,15,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-300,y=-210};
		Backcolor = 0,
		Last = 2500;
		bMouse = false;
	};

	---聊天喇叭特效
	TX_ui_lt_lb_hh = 
	{
		szName = "TX_ui_lt_lb_hh";
		PfxID = 62;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.2,0);
		Size = _Vector2.new(370,71);
		Pos = {x=-30,y=-10};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---经脉界面特效
	jm_jm_yz = 
	{
		szName = "jm_jm_yz";
		PfxID = 66;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(323,401);
		Pos = {x=2,y=-5};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};

	---排行榜鲜花特效
	ui_phb_songhua = 
	{
		szName = "ui_phb_songhua";
		PfxID = 67;
		Look = _Vector3.new(0,0,10);
		Eye = _Vector3.new(0,20,0);
		Size = _Vector2.new(240,290);
		Pos = {x=-19,y=-5};
		Backcolor = 0,
		Last = 3500;
		bMouse = false;
	};
	---排行榜鸡蛋特效
	ui_phb_jidan = 
	{
		szName = "ui_phb_jidan";
		PfxID = 68;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,20,0);
		Size = _Vector2.new(240,290);
		Pos = {x=-19,y=-5};
		Backcolor = 0,
		Last = 3500;
		bMouse = false;
	};
	---排行榜特效框
   TX_ui_phb_kuang = 
	    {
		szName = "TX_ui_phb_kuang";
		PfxID = 94;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,9,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-68,y=-120};
		Backcolor = 0x00cdad3c,
		Last = 0;
		bMouse = false;
	};	
	---系统功能开放1
	Tx_ui_xt_kf_01 = 
	{
		szName = "Tx_ui_xt_kf_01";
		PfxID = 70;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-1,y=-5};
		Backcolor = 0,
		Last = 3500;
		bMouse = false;
	};
	---系统功能开放2
	Tx_ui_xt_kf_02 = 
	{
		szName = "Tx_ui_xt_kf_02";
		PfxID = 71;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,20,0);
		Size = _Vector2.new(240,290);
		Pos = {x=-19,y=-5};
		Backcolor = 0,
		Last = 3500;
		bMouse = false;
	};
	---系统功能开放3
	Tx_ui_xt_kf_03 = 
	{
		szName = "Tx_ui_xt_kf_03";
		PfxID = 72;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(150,150);
		Pos = {x=-60,y=-60};
		Backcolor = 0,
		Last = 3500;
		bMouse = false;
	};

	---坐骑升阶界面特效
	Tx_ui_zqui_sj_01 = 
	{
		szName = "Tx_ui_zqui_sj_01";
		PfxID = 73;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-110,y=-130};
		Backcolor = 0,
		Last = 3500;
		bMouse = false;
	};

	---坐骑升阶失败天官赐福特效
	Tx_ui_zqui_sj_02 = 
	{
		szName = "Tx_ui_zqui_sj_02";
		PfxID = 74;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-40,y=-147};
		Backcolor = 0,
		Last = 15000;
		bMouse = false;
	};

	---系统功能引导流光
	Tx_ui_gnyd_lg_01 = 
	{
		szName = "Tx_ui_gnyd_lg_01";
		PfxID = 55;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.3,0);
		Size = _Vector2.new(60,60);
		Pos = {x=0.5,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---技能合成成功光效
	Tx_ui_jnhc_cg_01 = 
	{
		szName = "Tx_ui_jnhc_cg_01";
		PfxID = 75;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-50,y=-50};
		Backcolor = 0x00ff6825,
		Last = 0;
		bMouse = false;
	};
	---礼花
	Tx_ui_xt_lh_01 = 
	{
		szName = "Tx_ui_xt_lh_01";
		dwPfxID = 70;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=0.5,y=0.5};
		Backcolor = 0x00ff6825,
		Last = 3400;
		bMouse = false;
	};
	---强化成功物品框表现特效
	Tx_ui_qh_cg_01 = 
	{
		szName = "Tx_ui_qh_cg_01";
		PfxID = 79;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-57,y=-70};
		Backcolor = 0x00ff4a03,
		Last = 1000;
		bMouse = false;
	};
	---宝石合成成功物品框表现特效
	Tx_ui_bs_cg_01 = 
	{
		szName = "Tx_ui_bs_cg_01";
		PfxID = 79;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-57,y=-70};
		Backcolor = 0x00ff4a03,
		Last = 3400;
		bMouse = false;
	};
	---强化过程进度条表现特效
	Tx_ui_qh_jd_01 = 
	{
		szName = "Tx_ui_qh_jd_01";
		PfxID = 80;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.3,0);
		Size = _Vector2.new(100,60);
		Pos = {x=1,y=-4};
		Backcolor = 0x00ff3203,
		Last = 0;
		bMouse = false;
	};

	---结婚成功特效
	Tx_ui_zjmjh_cg_01 = 
	{
		szName = "Tx_ui_zjmjh_cg_01";
		dwPfxID = 69;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,30,0);
		Size = _Vector2.new(0,0);
		Pos = {x=1,y=-500};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	
	
	
	
	-- ---结婚成功特效
	-- Tx_ui_zjmjh_cg_01 = 
	-- {
		-- szName = "Tx_ui_zjmjh_cg_01";
		-- dwPfxID = 69;
		-- Look = _Vector3.new(0,0,0);
		-- Eye = _Vector3.new(0,1.3,0);
		-- Size = _Vector2.new(800,800);
		-- Pos = {x=1,y=-4};
		-- Backcolor = 0,
		-- Last = 0;
		-- bMouse = false;
	-- };

	---经脉顿悟激活
	Tx_ui_jmdw_jh_01 = 
	{
		szName = "Tx_ui_jmdw_jh_01";
		PfxID = 81;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(105,105);
		Pos = {x=70,y=11};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---接受任务
	Tx_ui_rw_jsrw_01 = 
	{
		szName = "Tx_ui_rw_jsrw_01";
		PfxID = 23;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(500,100);
		Pos = {x=270,y=-20};
		Backcolor = 0x00594e2a,
		Last = 0;
		bMouse = false;
	};
	---任务目标达成
	Tx_ui_rw_mbdc_01 = 
	{
		szName = "Tx_ui_rw_mbdc_01";
		PfxID = 23;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(500,100);
		Pos = {x=270,y=-20};
		Backcolor = 0x00594e2a,
		Last = 0;
		bMouse = false;
	};
	---任务完成
	Tx_ui_rw_wcrw_01 = 
	{
		szName = "Tx_ui_rw_wcrw_01";
		PfxID = 23;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(500,100);
		Pos = {x=270,y=-20};
		Backcolor = 0x00594e2a,
		Last = 0;
		bMouse = false;
	};
	---BOSS斩杀
	Tx_ui_BoSS_zhansha_01 = 
	{
		szName = "Tx_ui_BoSS_zhansha_01";
		PfxID = 24;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(400,300);
		Pos = {x=70,y=55};
		Backcolor = 0x00d23a16,
		Last = 0;
		bMouse = false;
	};
	---名剑升阶
	Tx_ui_MingJian_ShengJie_01 = 
	{
		szName = "Tx_ui_MingJian_ShengJie_01";
		PfxID = 85;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-140,y=-170};
		Backcolor = 0x00211a21,
		Last = 3500;
		bMouse = false;
	};
	---名剑升阶失败
	Tx_ui_MingJian_ShengJieShiBai_01 = 
	{
		szName = "Tx_ui_MingJian_ShengJieShiBai_01";
		PfxID = 74;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-40,y=-147};
		Backcolor = 0,
		Last = 15000;
		bMouse = false;
	};
	---经脉打通按钮光效
	Tx_ui_JMbtton_cg_01 = 
	{
		szName = "Tx_ui_JMbtton_cg_01";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	Tx_ui_JMbtton_cg_02 = 
	{
		szName = "Tx_ui_JMbtton_cg_02";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	Tx_ui_JMbtton_cg_03 = 
	{
		szName = "Tx_ui_JMbtton_cg_03";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	Tx_ui_JMbtton_cg_04 = 
	{
		szName = "Tx_ui_JMbtton_cg_04";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	Tx_ui_JMbtton_cg_05 = 
	{
		szName = "Tx_ui_JMbtton_cg_05";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	Tx_ui_JMbtton_cg_06 = 
	{
		szName = "Tx_ui_JMbtton_cg_06";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	Tx_ui_JMbtton_cg_07 = 
	{
		szName = "Tx_ui_JMbtton_cg_07";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	Tx_ui_JMbtton_cg_08 = 
	{
		szName = "Tx_ui_JMbtton_cg_08";
		PfxID = 84;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-25,y=-31};
		Backcolor = 0,
		Last = 3400;
		bMouse = false;
	};
	---经脉顿悟
	jm_dw_sb01= 
	{
		szName = "jm_dw_sb01";
		PfxID = 55;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(35,65);
		Pos = {x=0.5,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---内功特效01 取消内功选择特效
	ng_bg_01= 
	{
		szName = "ng_bg_01";
		PfxID = 101;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.5,0);
		Size = _Vector2.new(150,150);
		Pos = {x=-75,y=-75};
		Backcolor = 0x0041849a,
		Last = 0;
		bMouse = false;
	};
	---内功特效02 选中内功特效
	ng_bg_02= 
	{
		szName = "ng_bg_02";
		PfxID = 102;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.5,0);
		Size = _Vector2.new(150,150);
		Pos = {x=-75,y=-75};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---内功特效03 内功界面背景特效
	ng_bg_03= 
	{
		szName = "ng_bg_03";
		PfxID = 103;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(280,300);
		Pos = {x=-40,y=-60};
		Backcolor = 0x00715b28,
		Last = 0;
		bMouse = false;
	};
	---内功特效04 内功界面当前选中内功环绕特效
	ng_bg_04= 
	{
		szName = "ng_bg_04";
		PfxID = 112;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.2,0);
		Size = _Vector2.new(70,70);
		Pos = {x=-89,y=-87};
		Backcolor = 0x007a5e39,
		Last = 0;
		bMouse = false;
	};
	---摇骰子全”字图片上特效
	sz_kuang_01= 
	{
		szName = "sz_kuang_01";
		PfxID = 109;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(40,40);
		Pos = {x=16,y=16};
		Backcolor = 0x0034565f,
		Last = 0;
		bMouse = false;
	};
	---摇骰子区域飞到“本次获得真气”特效
	sz_kuang_02= 
	{
		szName = "sz_kuang_02";
		PfxID = 104;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(400,280);
		Pos = {x=-465,y=-380};
		Backcolor = 0x0037321f,
		Last = 0;
		bMouse = false;
	};
	sz_kuang_03= 
	{
		szName = "sz_kuang_03";
		PfxID = 105;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(400,280);
		Pos = {x=-465,y=-380};
		Backcolor = 0x0020301b,
		Last = 0;
		bMouse = false;
	};
	sz_kuang_04= 
	{
		szName = "sz_kuang_04";
		PfxID = 106;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(400,280);
		Pos = {x=-465,y=-380};
		Backcolor = 0x001b2930,
		Last = 0;
		bMouse = false;
	};
	sz_kuang_05= 
	{
		szName = "sz_kuang_05";
		PfxID = 107;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(400,280);
		Pos = {x=-465,y=-380};
		Backcolor = 0x0030241b,
		Last = 0;
		bMouse = false;
	};
	sz_kuang_06= 
	{
		szName = "sz_kuang_06";
		PfxID = 108;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(400,280);
		Pos = {x=-465,y=-380};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---冲脉过程中特效
	Tx_ui_JMbtton_gc_01= 
	{
		szName = "Tx_ui_JMbtton_gc_01";
		PfxID = 110;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(35,65);
		Pos = {x=0.5,y=1.6};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---冲脉失败飞行特效
	Tx_ui_JMbtton_sb_01= 
	{
		szName = "Tx_ui_JMbtton_gc_01";
		PfxID = 111;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(35,65);
		Pos = {x=0.5,y=1.6};
		Backcolor = 0x0041758d,
		Last = 0;
		bMouse = false;
	};
	---藏宝图1 
	Tx_ui_wabao_01= 
	{
		szName = "Tx_ui_wabao_01";
		PfxID = 113;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.7,0);
		Size = _Vector2.new(60,130);
		Pos = {x=20,y=-57};
		Backcolor = 0x00105493,
		Last = 0;
		bMouse = false;
	};
	---藏宝图2
	Tx_ui_wabao_02= 
	{
		szName = "Tx_ui_wabao_02";
		PfxID = 114;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.7,0);
		Size = _Vector2.new(60,130);
		Pos = {x=20,y=-62};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
	};
	---副本奖励
	TX_ui_fb_yanhua= 
	{
		szName = "TX_ui_fb_yanhua";
		PfxID = 118;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(240,290);
		Pos = {x=1,y=1};
		Backcolor = 0x00ff6825,
		Last = 3400;
		bMouse = false;
	};
	---众志成城宝箱特效
	TX_ui_zzcc_baoxiang= 
	{
		szName = "TX_ui_zzcc_baoxiang";
		PfxID = 123;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(240,290);
		Pos = {x=1,y=1};
		Backcolor = 0x00ff6825,
		Last = 3400;
		bMouse = false;
	};
	---众志成城进度条特效
	TX_ui_zzcc_jindutiao= 
	{
		szName = "TX_ui_zzcc_jindutiao";
		PfxID = 124;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,16,0);
		Size = _Vector2.new(1000,1000);
		Pos = {x=-378,y=-355};
		Backcolor = 0x00ff6825,
		Last = 3600000;
		bMouse = false;
	};
	---众志成城烟花特效
	TX_ui_zzcc_yanhua= 
	{
		szName = "TX_ui_zzcc_yanhua";
		PfxID = 125;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(500,500);
		Pos = {x=1,y=1};
		Backcolor = 0x00ff6825,
		Last = 15000;
		bMouse = false;
	};
	--龙鼎战排行榜特效
	ui_LongDingZhan_one = 
		{
		szName = "ui_LongDingZhan_one";
		PfxID = 125;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(500,500);
		Pos = {x=1,y=1};
		Backcolor = 0x00ff6825,
		Last = 15000;
		bMouse = false;
	};
	--龙鼎战特效01
	longdingzhan_01 = 
		{
		szName = "longdingzhan_01";
		PfxID = 127;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,22,0);
		Size = _Vector2.new(300,300);
		Pos = {x=5,y=5};
		Backcolor = 0x00ff6825,
		Last = 15000;
		bMouse = false;
	};
	--龙鼎战特效02
	longdingzhan_02 = 
		{
		szName = "longdingzhan_02";
		PfxID = 128;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,22,0);
		Size = _Vector2.new(300,300);
		Pos = {x=5,y=5};
		Backcolor = 0x00ff6825,
		Last = 15000;
		bMouse = false;
	};
		--强化卷轴01
	TX_ui_qianghuajuanzhou_01 = 
		{
		szName = "TX_ui_qianghuajuanzhou_01";
		PfxID = 129;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-175,y=-199};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
		};	
			--强化卷轴02
	TX_ui_qianghuajuanzhou_02 = 
		{
		szName = "TX_ui_qianghuajuanzhou_02";
		PfxID = 130;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-3,y=26};
		Backcolor = 0x00876f3b,
		Last = 0;
		bMouse = false;
	};
	--强化卷轴03
		TX_ui_qianghuajuanzhou_03 = 
		{
		szName = "TX_ui_qianghuajuanzhou_03";
		PfxID = 148;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-120};
		Backcolor = 0,
		Last = 0;
		bMouse = false;
         };
	--闭关灌注
	biguan_guanzhu_01 = 
		{
		szName = "biguan_guanzhu_01";
		PfxID = 131;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-118,y=-160};
		Backcolor = 0x004a3f6a,
		Last = 0;
		bMouse = false;
	};
	--闭关进度
	biguan_jindu_01 = 
		{
		szName = "biguan_jindu_01";
		PfxID = 132;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-265,y=-140};
		Backcolor = 0x00698388,
		Last = 0;
		bMouse = false;
	};
	--风物志 第二篇
	TX_ui_shouji02_lianjie_01=
	    {
		szName = "TX_ui_shouji02_lianjie_01";
		PfxID = 138;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-127,y=-127};
		Backcolor = 0x00ffba00,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_shouji02_lianjie_02=
	    {
		szName = "TX_ui_shouji02_lianjie_02";
		PfxID = 139;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-120,y=-126};
		Backcolor = 0X0042ff00,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_shouji02_lianjie_03=
	    {
		szName = "TX_ui_shouji02_lianjie_03";
		PfxID = 140;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-127,y=-127};
		Backcolor = 0x00000cff,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_shouji02_lianjie_04=
	    {
		szName = "TX_ui_shouji02_lianjie_04";
		PfxID = 141;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-127,y=-127};
		Backcolor = 0x005a00ff,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_shouji02_lianjie_05=
	    {
		szName = "TX_ui_shouji02_lianjie_05";
		PfxID = 142;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-123,y=-127};
		Backcolor = 0x00e400ff,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_shouji02_lianjie_06=
	    {
		szName = "TX_ui_shouji02_lianjie_06";
		PfxID = 143;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-127,y=-127};
		Backcolor = 0x00ff002a,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_shouji02_huanrao_01 =
	    {
		szName = "TX_ui_shouji02_huanrao_01";
		PfxID = 144;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,7.6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-120};
		Backcolor = 0x0000b4ff,
		Last = 0;
		bMouse = false;
	};  
	TX_ui_shouji02_teshu_01 = 
	    {
		szName = "TX_ui_shouji02_teshu_01";
		PfxID = 147;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-151,y=-150};
		Backcolor = 0x00ff5400,
		Last = 0;
		bMouse = false;
	}; 
	--装备修炼特效
	TX_ui_EquiRefine_Refine = 
		{
		szName = "TX_ui_EquiRefine_Refine";
		PfxID = 150;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-201,y=-200};
		Backcolor = 0x0049364f,
		Last = 0;
		bMouse = false;
	};
	TX_ui_EquipRefine_LevelUp = 
	    {
		szName = "TX_ui_EquipRefine_LevelUp";
		PfxID = 151;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-151,y=-140};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	}; 
    --修行成功领悟书籍特效
	TX_ui_Refine_lingwuchenggong = 
	    {
		szName = "TX_ui_Refine_lingwuchenggong";
		PfxID = 152;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-82,y=-140};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	}; 
   TX_ui_Stone_zhuzaokuang_01 = 
	    {
		szName = "TX_ui_Stone_zhuzaokuang_01";
		PfxID = 153;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x003c505a,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_zhuzaokuang_02 = 
	    {
		szName = "TX_ui_Stone_zhuzaokuang_02";
		PfxID = 155;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x007b6988,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_zhuzaokuang_03 = 
	    {
		szName = "TX_ui_Stone_zhuzaokuang_03";
		PfxID = 100020;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x007b6988,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_zhuzaokuang_04 = 
	    {
		szName = "TX_ui_Stone_zhuzaokuang_04";
		PfxID = 100066;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x007b6988,
		Last = 0;
		bMouse = false;
	};
	TX_ui_Stone_zhuzaokuang_05 = 
	    {
		szName = "TX_ui_Stone_zhuzaokuang_05";
		PfxID = 100067;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x00ff8000,
		Last = 0;
		bMouse = false;
	};
	TX_ui_Stone_zhuzaokuang_06 = 
	    {
		szName = "TX_ui_Stone_zhuzaokuang_06";
		PfxID = 100068;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x00ff3333,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_zhuzaochenggong_01 = 
	    {
		szName = "TX_ui_Stone_zhuzaochenggong_01";
		PfxID = 154;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-225,y=-123};
		Backcolor = 0x00aa7443,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_jindutiao_01 = 
	    {
		szName = "TX_ui_Stone_jindutiao_01";
		PfxID = 159;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.7,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-226,y=-127.7};
		Backcolor = 0x004f4f4f,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_jindutiao_02 = 
	    {
		szName = "TX_ui_Stone_jindutiao_02";
		PfxID = 160;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.7,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-226,y=-127.7};
		Backcolor = 0x003b89aa,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_jindutiao_03 = 
	    {
		szName = "TX_ui_Stone_jindutiao_03";
		PfxID = 161;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.7,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-226,y=-127.7};
		Backcolor = 0x008943aa,
		Last = 0;
		bMouse = false;
	}; 
-----疯狂的锄头
	TX_ui_ChuTou_WaBaoChengGong01 = 
	    {
		szName = "TX_ui_ChuTou_WaBaoChengGong01";
		PfxID = 163;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-151,y=-140};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	}; 

-----装备分解
	TX_ui_Zhuangbei_fenjie01 = 
	    {
		szName = "TX_ui_Zhuangbei_fenjie01";
		PfxID = 163;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-151,y=-140};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};

-----宝甲嵌甲 被镶嵌的槽位播放特效_小槽用的
	TX_ui_bj_qj_cg_01 = 
	    {
		szName = "TX_ui_bj_qj_cg_01";
		PfxID = 167;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-171,y=-170};
		Backcolor = 0x00a36736,
		Last = 1000;
		bMouse = false;
	}; 
-----宝甲嵌甲 激活槽位和连接线的永久特效_小槽用的
	TX_ui_bj_qj_jh_01= 
	    {
		szName = "TX_ui_bj_qj_jh_01";
		PfxID = 168;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-171,y=-170};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	}; 
-----宝甲嵌甲 被镶嵌的槽位播放特效_大槽用的
	TX_ui_bj_qj_cg_02 = 
	    {
		szName = "TX_ui_bj_qj_cg_02";
		PfxID = 169;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-132,y=-134};
		Backcolor = 0x00a36736,
		Last = 1000;
		bMouse = false;
	}; 
-----宝甲嵌甲 激活槽位和连接线的永久特效_大槽用的
	TX_ui_bj_qj_jh_02 = 
	    {
		szName = "TX_ui_bj_qj_jh_02";
		PfxID = 170;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-132,y=-134};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	}; 
    --易筋经领悟成功特效
	TX_ui_Refine_lingwuchenggong = 
	    {
		szName = "TX_ui_Refine_lingwuchenggong";
		PfxID = 171;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-100,y=-150};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	}; 
	--个人押镖
	TX_ui_convoy_xuanzhong_01 =
	    {
		szName = "TX_ui_convoy_xuanzhong_01";
		PfxID = 164;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.4,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-19,y=-48.3};
		Backcolor =  0x00ffffff,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_propertyscroll_shuxingjinjie =
	    {
		szName = "TX_ui_propertyscroll_shuxingqianghua";
		PfxID = 173;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-50,y=-230};
		Backcolor =  0x00774917,
		Last = 0;
		bMouse = false;
		}; 
	TX_ui_propertyscroll_shuxingqianghua =
	    {
		szName = "TX_ui_propertyscroll_shuxingjinjie";
		PfxID = 172;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-127,y=-125};
		Backcolor =  0x003a2708,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_propertyscroll_baoji =
	    {
		szName = "TX_ui_propertyscroll_baoji";
		PfxID = 174;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-165,y=-150};
		Backcolor =  0x003a2708,
		Last = 0;
		bMouse = false;
	}; 

	---名剑注灵特效激活符文特效
	TX_ui_zl_zhulingtexiao =
	{
		szName = "TX_ui_zl_zhulingtexiao";
		PfxID=175;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-170,y=-160};
		Backcolor = 0x00a36736,
		Last = 5000;
		bMouse = false;
	};
	---名剑注灵特效圆点闪光
	TX_UI_zhulingyuandian =
	{
		szName = "TX_UI_zhulingyuandian";
		PfxID=176;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-187,y=-187};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
		---名剑注灵特效剑灵特效1
	TX_UI_zhulingjian1 =
	{
		szName = "TX_UI_zhulingjian1";
		PfxID=177;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
	---名剑注灵特效剑灵特效2
	TX_UI_zhulingjian2 =
	{
		szName = "TX_UI_zhulingjian2";
		PfxID=178;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
	---名剑注灵特效剑灵特效3
	TX_UI_zhulingjian3 =
	{
		szName = "TX_UI_zhulingjian3";
		PfxID=179;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
	---名剑注灵特效剑灵特效4
	TX_UI_zhulingjian4 =
	{
		szName = "TX_UI_zhulingjian4";
		PfxID=180;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
		---名剑注灵特效剑灵特效5
	TX_UI_zhulingjian5 =
	{
		szName = "TX_UI_zhulingjian5";
		PfxID=181;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
			---名剑注灵特效剑灵特效6
	TX_UI_zhulingjian6 =
	{
		szName = "TX_UI_zhulingjian6";
		PfxID=182;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
	---名剑注灵特效剑灵特效7
	TX_UI_zhulingjian7 =
	{
		szName = "TX_UI_zhulingjian7";
		PfxID=183;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
	---名剑注灵特效剑灵特效8
	TX_UI_zhulingjian8 =
	{
		szName = "TX_UI_zhulingjian8";
		PfxID=184;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
		---名剑注灵特效剑灵特效9
	TX_UI_zhulingjian9 =
	{
		szName = "TX_UI_zhulingjian9";
		PfxID=185;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-176,y=-80};
		Backcolor = 0x00a36736,
		Last = 0;
		bMouse = false;
	};
	TX_ui_cq_dianji =
	{
		szName = "TX_ui_cq_dianji";
		PfxID=186;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.1,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-152,y=-149};
		Backcolor = 0x007d5715,
		Last = 0;
		bMouse = false;
	};
	--阵法-北斗七星阵 星斗1级特效
	TX_ui_zf_xdtx_01 =
	    {
		szName = "TX_ui_zf_xdtx_01";
		PfxID = 100001;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.9,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-110};
		Backcolor =  0x003e42d3,
		Last = 0;
		bMouse = false;
	}; 
	--阵法-北斗七星阵 星斗2级特效
	TX_ui_zf_xdtx_02 =
	    {
		szName = "TX_ui_zf_xdtx_02";
		PfxID = 100002;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.9,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-110};
		Backcolor =  0x00533ed3,
		Last = 0;
		bMouse = false;
	}; 
	--阵法-北斗七星阵 星斗3级特效
	TX_ui_zf_xdtx_03 =
	    {
		szName = "TX_ui_zf_xdtx_03";
		PfxID = 100003;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.9,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-110};
		Backcolor =  0x00613ed3,
		Last = 0;
		bMouse = false;
	}; 
	--阵法-北斗七星阵 摇到3颗同样星斗时播放的特效
	TX_ui_zf_xdtx_tyxd =
	    {
		szName = "TX_ui_zf_xdtx_tyxd";
		PfxID = 100004;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-30,y=-88};
		Backcolor =  0x004d5ad3,
		Last = 0;
		bMouse = false;
	}; 
	--阵法-北斗七星阵 摘星换斗按钮特效
	TX_ui_zf_zxhd =
	    {
		szName = "TX_ui_zf_zxhd";
		PfxID = 100005;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-114,y=-106.3};
		Backcolor =  0x0063a9df,
		Last = 0;
		bMouse = false;
	}; 
	--阵法-北斗七星阵 星斗升级特效
	TX_ui_zf_levelup =
	    {
		szName = "TX_ui_zf_levelup";
		PfxID = 100006;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-19,y=-48.3};
		Backcolor =  0x0063a9df,
		Last = 0;
		bMouse = false;
	}; 
	
-----宠物升级技能特效
	ui_skill_sj_02 = 
	    {
		szName = "ui_skill_sj_02";
		PfxID = 188;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-51,y=-50};
		Backcolor = 0x004d8b9f,
		Last = 3000;
		bMouse = false;
	};
-----宠物领悟技能特效
	Tx_Ui_lingwujinengtexiao = 
	    {
		szName = "Tx_Ui_lingwujinengtexiao";
		PfxID = 187;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-35,y=-34};
		Backcolor = 0x004d8b9f,
		Last = 3000;
		bMouse = false;
	};	
----宠物名器升级特效
	TX_ui_jianghu_mingqiup01 =
	{
		szName = "TX_ui_jianghu_mingqiup01";
		PfxID = 163;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-151,y=-140};
		Backcolor = 0x00a36736,
		Last = 3000;
		bMouse = false;
	}; 
	--侠义勋章升阶特效
	TX_ui_xiayixunzhang_uplv =
	    {
		szName = "TX_ui_xiayixunzhang_uplv";
		PfxID = 100007;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-86,y=-78};
		Backcolor =  0x008b6916,
		Last = 0;
		bMouse = false;
	}; 
	--侠义勋章升星特效
	TX_ui_xiayixunzhang_upstar =
	    {
		szName = "TX_ui_xiayixunzhang_upstar";
		PfxID = 100008;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-142,y=-138.3};
		Backcolor =  0x008b6916,
		Last = 0;
		bMouse = false;
	}; 
	--宠物指教按钮特效
	TX_ui_zj_zhijiaoanniu =
	    {
		szName = "TX_ui_zj_zhijiaoanniu";
		PfxID = 100009;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-114,y=-125.2};
		Backcolor =  0x00e28e34,
		Last = 0;
		bMouse = false;
	}; 
	--宠物指教特效
	TX_ui_zj_zhijiaowancheng =
	    {
		szName = "TX_ui_zj_zhijiaowancheng";
		PfxID = 100010;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,7.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=12,y=-75.3};
		Backcolor =  0x008b5b16,
		Last = 0;
		bMouse = false;
	}; 
	--聚灵珠未聚灵状态
	TX_ui_julingzhu_weijuling =
	    {
		szName = "TX_ui_julingzhu_weijuling";
		PfxID = 100011;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-27,y=18.3};
		Backcolor =  0x00ffffff,
		Last = 0;
		bMouse = false;
	}; 
	--聚灵珠未聚灵指向状态
	TX_ui_julingzhu_weijulingxuanzhong =
	    {
		szName = "TX_ui_julingzhu_weijulingxuanzhong";
		PfxID = 100012;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-27,y=18.3};
		Backcolor =  0x001c61a2,
		Last = 0;
		bMouse = false;
	}; 
	--聚灵珠聚灵状态
	TX_ui_julingzhu_julingzhong =
	    {
		szName = "TX_ui_julingzhu_julingzhong";
		PfxID = 100013;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-27,y=18.3};
		Backcolor =  0x001c61a2,
		Last = 0;
		bMouse = false;
	}; 
	--聚灵珠聚灵完成状态1
	TX_ui_julingzhu_julingwancheng =
	    {
		szName = "TX_ui_julingzhu_julingwancheng";
		PfxID = 100014;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-80,y=-110};
		Backcolor =  0x0081591a,
		Last = 0;
		bMouse = false;
	};
	--聚灵珠聚灵完成状态2
	TX_ui_julingzhu_julingwancheng2 =
	    {
		szName = "TX_ui_julingzhu_julingwancheng2";
		PfxID = 100072;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-28,y=30};
		Backcolor =  0x0081591a,
		Last = 0;
		bMouse = false;
	};
	--聚灵珠注灵/收获特效
	Tx_Ui_julingzhu_zhuling =
	    {
		szName = "Tx_Ui_julingzhu_zhuling";
		PfxID = 100073;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-91,y=-82};
		Backcolor =  0x0081591a,
		Last = 0;
		bMouse = false;
	};
	--侠客传功
	TX_ui_xiakechuangonganniu01 =
	    {
		szName = "TX_ui_xiakechuangonganniu01";
		PfxID = 10011;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-90,y=-93};
		Backcolor =  0x0078dffd,
		Last = 0;
		bMouse = false;
	};	
	--侠客传功
	TX_ui_xiakechuangonganniu02 =
	    {
		szName = "TX_ui_xiakechuangonganniu02";
		PfxID = 10012;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-90,y=-93};
		Backcolor =  0x0081591a,
		Last = 0;
		bMouse = false;
	};	
		--侠客传功
	TX_ui_xiakechuangonganniu03 =
	    {
		szName = "TX_ui_xiakechuangonganniu03";
		PfxID = 10013;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-90,y=-93};
		Backcolor =  0x00fd7878,
		Last = 0;
		bMouse = false;
	};	
	TX_ui_qxtz_tiaozhan =
	    {
		szName = "TX_ui_qxtz_tiaozhan";
		PfxID = 10009;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.4,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-165,y=-150};
		Backcolor =  0x008b5316,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_qxtz_xuanzekuang =
	    {
		szName = "TX_ui_qxtz_xuanzekuang";
		PfxID = 10010;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-165,y=-150};
		Backcolor =  0x00aa7923,
		Last = 0;
		bMouse = false;
	}; 
	--功法-铁布衫 套装升级特效 
	TX_ui_tbs_levelup =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100015;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
    --功法-铁布衫 套装1级特效	
	TX_ui_tbs_dj_01 =
	    {
		szName = "TX_ui_tbs_dj_01";
		PfxID = 100016;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
    --功法-铁布衫 套装2级特效
	TX_ui_tbs_dj_02 =
	    {
		szName = "TX_ui_tbs_dj_02";
		PfxID = 100017;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-铁布衫 套装3级特效
	TX_ui_tbs_dj_03 =
	    {
		szName = "TX_ui_tbs_dj_03";
		PfxID = 100018;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-铁布衫 套装按钮鼠标移入特效
	TX_ui_tbs_tz =
	    {
		szName = "TX_ui_tbs_tz";
		PfxID = 100019;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-142,y=-138.3};
		Backcolor =  0x008b6916,
		Last = 0;
		bMouse = false;
	}; 		
		--背包自动使用  道具框特效
	TX_ui_zidong_01 = 
	    {
		szName = "TX_ui_zidong_01";
		PfxID = 153;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x00f8d843,
		Last = 0;
		bMouse = false;
	}; 
	
		--名剑技能流血，未激活时
	MJ_tx_sk_00 =
	    {
		szName = "MJ_tx_sk_00";
		PfxID = 110001;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.2,0);
		Size = _Vector2.new(65,65);
		Pos = {x=-14,y=-15};
		Backcolor =  0x00f8d843,
		Last = 0;
		bMouse = false;
	};

	--名剑技能流血，激活时
	MJ_tx_sk_01 =
	    {
		szName = "MJ_tx_sk_01";
		PfxID = 110002;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.2,0);
		Size = _Vector2.new(65,65);
		Pos = {x=-14,y=-15};
		Backcolor =  0x00bf1a1a,
		Last = 0;
		bMouse = false;
	}; 

	--功法-童姥功 套装升级特效 
	TX_ui_tlg_tz_levelup =
	    {
		szName = "TX_ui_tlg_tz_levelup";
		PfxID = 100021;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 套装1特效 
	TX_ui_tlg_tz_01 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100022;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 套装2特效 
	TX_ui_tlg_tz_02 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100023;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a97d20,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 套装3特效 
	TX_ui_tlg_tz_03 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100024;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x0020a97a,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 套装4特效  
	TX_ui_tlg_tz_04 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100025;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x001a8aa6,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 套装5特效 
	TX_ui_tlg_tz_05 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100026;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00691aa6,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 套装6特效 
	TX_ui_tlg_tz_06 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100027;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a21832,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 套装7特效 
	TX_ui_tlg_tz_07 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100028;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x008da218,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 六和八荒按钮特效 
	Tx_ui_tlg_lhbh =
	    {
		szName = "Tx_ui_tlg_lhbh";
		PfxID = 100029;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 人物1级显示特效
	TX_ui_tlg_rw_01 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100030;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-300,y=400.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 人物2级显示特效
	TX_ui_tlg_rw_02 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100031;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-300,y=400.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 人物3级显示特效 
	TX_ui_tlg_rw_03 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100032;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-300,y=400.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 人物4级显示特效 
	TX_ui_tlg_rw_04 =
	    {
		szName = "TX_ui_tbs_levelup";
		PfxID = 100033;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-300,y=400.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-童姥功 进度条增长特效 
	TX_ui_tlg_jdt =
	    {
		szName = "TX_ui_tlg_zengzhang";
		PfxID = 100034;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 

--实战隐字按钮出生时
	Tx_ui_shizhan_01 =
	    {
		szName = "Tx_ui_shizhan_01";
		PfxID = 110003;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,30,0);
		Size = _Vector2.new(600,600);
		Pos = {x=-250,y=-270};
		Backcolor =  0x0081801a,
		Last = 0;
		bMouse = false;
	};

	--实战隐字按钮常驻特效
	Tx_ui_shizhan_02 =
	    {
		szName = "Tx_ui_shizhan_02";
		PfxID = 110004;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);   --中间表示摄像头远近，即z轴
		Size = _Vector2.new(300,300); --表示特效窗口大小
		Pos = {x=-113,y=-117};
		Backcolor =  0x00937b1c,
		Last = 0;
		bMouse = false;
		};
	--实战隐字按钮常驻特效
	Tx_ui_soulefface =
	{
		szName = "Tx_ui_soulefface";
		PfxID = 100038;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);   --中间表示摄像头远近，即z轴
		Size = _Vector2.new(300,300); --表示特效窗口大小
		Pos = {x=-113,y=-117};
		Backcolor =  0x00937b1c,
		Last = 0;
		bMouse = false;
	};
	--宝甲精炼  火星四溅
	TX_ui_baojiajinglian_01 =
	    {
		szName = "TX_ui_baojiajinglian_01";
		PfxID = 1100060;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.2,0);   --中间表示摄像头远近，即z轴
		Size = _Vector2.new(300,300); --表示特效窗口大小
		Pos = {x=-113,y=-135};
		Backcolor =  0x00937b1c,
		Last = 0;
		bMouse = false;
		};
	--侠客资质进度条刷新	
	TX_ui_xiakezizhi_jindutiaoshuaxin =
	{
		szName = "TX_ui_xiakezizhi_jindutiaoshuaxin";
		PfxID = 100039;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,25,0);   --中间表示摄像头远近，即z轴
		Size = _Vector2.new(300,300); --表示特效窗口大小
		Pos = {x=-102,y=-143};
		Backcolor =  0x00856e1e,
		Last = 2000;
		bMouse = false;
	};
	--侠客资质暴击
	TX_ui_xiakezizhi_baoji =
	{
		szName = "TX_ui_xiakezizhi_baoji";
		PfxID = 100040;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);   --中间表示摄像头远近，即z轴
		Size = _Vector2.new(300,300); --表示特效窗口大小
		Pos = {x=-113,y=-117};
		Backcolor =  0x003a2708,
		Last = 2000;
		bMouse = false;
	};

	--卡片-卡片镶嵌特效
	TX_ui_kp_xiangqian =
	    {
		szName = "TX_ui_kp_xiangqian";
		PfxID = 100035;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-100,y=-87.3};
		Backcolor =  0x00936318,
		Last = 2000;
		bMouse = false;
	}; 	

	--卡片-卡片融合特效
	TX_ui_kp_ronghe =
	    {
		szName = "TX_ui_kp_ronghe";
		PfxID = 100036;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(900,900);
		Pos = {x=-60,y=-105};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 		
	
	--卡片-卡片融合成功特效
	TX_ui_kp_ronghesucceed =
	    {
		szName = "TX_ui_kp_ronghesucceed";
		PfxID = 100037;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效1
	TX_ui_jiuhulu_dj_01 =
	    {
		szName = "TX_ui_jiuhulu_dj_01";
		PfxID = 100041;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-65.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效2 
	TX_ui_jiuhulu_dj_02 =
	    {
		szName = "TX_ui_jiuhulu_dj_02";
		PfxID = 100042;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-65.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效3
	TX_ui_jiuhulu_dj_03 =
	    {
		szName = "TX_ui_jiuhulu_dj_03";
		PfxID = 100043;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-65.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效4
	TX_ui_jiuhulu_dj_04 =
	    {
		szName = "TX_ui_jiuhulu_dj_04";
		PfxID = 100044;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-65.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效5
	TX_ui_jiuhulu_dj_05 =
	    {
		szName = "TX_ui_jiuhulu_dj_05";
		PfxID = 100045;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-65.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效6
	TX_ui_jiuhulu_dj_06 =
	    {
		szName = "TX_ui_jiuhulu_dj_06";
		PfxID = 100046;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效7 
	TX_ui_jiuhulu_dj_07 =
	    {
		szName = "TX_ui_jiuhulu_dj_07";
		PfxID = 100047;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效8
	TX_ui_jiuhulu_dj_08 =
	    {
		szName = "TX_ui_jiuhulu_dj_08";
		PfxID = 100048;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效9
	TX_ui_jiuhulu_dj_09 =
	    {
		szName = "TX_ui_jiuhulu_dj_09";
		PfxID = 100049;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效10 
	TX_ui_jiuhulu_dj_10 =
	    {
		szName = "TX_ui_jiuhulu_dj_10";
		PfxID = 100050;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效11
	TX_ui_jiuhulu_dj_11 =
	    {
		szName = "TX_ui_jiuhulu_dj_11";
		PfxID = 100051;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效12
	TX_ui_jiuhulu_dj_12 =
	    {
		szName = "TX_ui_jiuhulu_dj_12";
		PfxID = 100052;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效13 
	TX_ui_jiuhulu_dj_13 =
	    {
		szName = "TX_ui_jiuhulu_dj_13";
		PfxID = 100053;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效14
	TX_ui_jiuhulu_dj_14 =
	    {
		szName = "TX_ui_jiuhulu_dj_14";
		PfxID = 100054;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦界面等级特效15
	TX_ui_jiuhulu_dj_15 =
	    {
		szName = "TX_ui_jiuhulu_dj_15";
		PfxID = 100055;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.7,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦 提交按钮特效
	TX_ui_jiuhulu_tj =
	    {
		szName = "TX_ui_jiuhulu_tj";
		PfxID = 100056;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,10,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦 翻倍道具特效框
	TX_ui_jiuhulu_fbk =
	    {
		szName = "TX_ui_jiuhulu_fbk";
		PfxID = 100057;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦 进度条增长特效
	TX_ui_jiuhulu_jdt =
	    {
		szName = "TX_ui_jiuhulu_jdt";
		PfxID = 100058;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 2000;
		bMouse = false;
	}; 
	--酒葫芦 升阶图标播放的瞬时特效
	TX_ui_jiuhulu_sj_levelup_01 =
	    {
		szName = "TX_ui_jiuhulu_sj_levelup_01";
		PfxID = 100059;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x002564bb,
		Last = 0;
		bMouse = false;
	}; 
	--酒葫芦 升阶特效
	TX_ui_jiuhulu_sj_levelup_02 =
	    {
		szName = "TX_ui_jiuhulu_sj_levelup_02";
		PfxID = 100060;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(50,50);
		Pos = {x=-15,y=-19};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 	
	--侠客属性 属性提升
	TX_ui_zz_shuxingtisheng =
	    {
		szName = "TX_ui_zz_shuxingtisheng";
		PfxID = 100061;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(50,50);
		Pos = {x=-15,y=-19};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 	
	--侠客属性 提升层次
	TX_ui_zz_tishengcengci =
	    {
		szName = "TX_ui_zz_tishengcengci";
		PfxID = 100062;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.3,0);
		Size = _Vector2.new(800,800);
		Pos = {x=-197,y=-241};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 	
	--侠客属性 提升属性
	TX_ui_zz_tishengshuxing =
	    {
		szName = "TX_ui_zz_tishengshuxing";
		PfxID = 100063;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.3,0);
		Size = _Vector2.new(800,800);
		Pos = {x=-197,y=-241};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 	
	--侠客属性 光晕
	TX_ui_zz_guangyun =
	    {
		szName = "TX_ui_zz_guangyun";
		PfxID = 100064;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.73,0);
		Size = _Vector2.new(800,800);
		Pos = {x=-197,y=-268};
		Backcolor =  0x00a3891f,
		Last = 0;
		bMouse = false;
	}; 	
	--侠客属性 远古符文
	TX_ui_zz_yuangufuwen =
	    {
		szName = "TX_ui_zz_yuangufuwen";
		PfxID = 100065;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.2,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-60,y=-60};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	};
	
	--青云勋章刷新特效
	Tx_Ui_qyxz_shuaxin =
	    {
		szName = "Tx_Ui_qyxz_shuaxin";
		PfxID = 100077;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.4,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-22,y=-23};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	};
	--青云勋章相同特效
	Tx_Ui_qyxz_xiangtong =
	    {
		szName = "Tx_Ui_qyxz_xiangtong";
		PfxID = 100078;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.3,0);
		Size = _Vector2.new(100,100);
		Pos = {x=-22,y=-23};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	};
	--珍珑棋局相同特效
	Tx_Ui_boostouxiang =
	    {
		szName = "Tx_Ui_boostouxiang";
		PfxID = 100084;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-90,y=-90};
		Backcolor =  0x00aa7923,
		Last = 0;
		bMouse = false;
	};	


	--时装升阶
	Tx_Ui_sz_sj =
	    {
		szName = "Tx_Ui_sz_sj";
		PfxID = 100075;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,12.5,0);
		Size = _Vector2.new(400,400);
		Pos = {x=-62,y=-180};
		Backcolor =  0x009c6c20,
		Last = 0;
		bMouse = false;
	};

	--时装升阶
	Tx_Ui_sz_gy =
	    {
		szName = "Tx_Ui_sz_gy";
		PfxID = 100076;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.2,0);
		Size = _Vector2.new(200,200);
		Pos = {x=38,y=0};
		Backcolor =  0x007eb2ff,
		Last = 0;
		bMouse = false;
	};
		--名剑铸造
	Tx_Ui_mingjian_zhuzao =
	    {
		szName = "Tx_Ui_mingjian_zhuzao";
		PfxID = 100074;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2.2,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-70,y=-95};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	};
		--战力提升 增加瞬时特效
	TX_ui_zhandoulitisheng =
	    {
		szName = "TX_ui_zhandoulitisheng";
		PfxID = 189;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.2,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-70,y=-70};
		Backcolor =  0x00ad2b21,
		Last = 0;
		bMouse = false;
	};
		--噬血按钮 特效
	Tx_Ui_xuemogong_shixie =
	    {
		szName = "Tx_Ui_xuemogong_shixie";
		PfxID = 100079;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-71.5,y=-82.5};
		Backcolor =  0x00ad2b21,
		Last = 0;
		bMouse = false;
	};
		--噬血进度条增长 特效
	Tx_Ui_xuemogong_jindutiao1 =
	    {
		szName = "Tx_Ui_xuemogong_jindutiao1";
		PfxID = 100080;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-22.5,y=-95};
		Backcolor =  0x00ad2b21,
		Last = 0;
		bMouse = false;
	};
		--噬血进度条永久 特效
	Tx_Ui_xuemogong_jindutiao2 =
	    {
		szName = "Tx_Ui_xuemogong_jindutiao2";
		PfxID = 100081;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,25,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-35,y=-90};
		Backcolor =  0x00ad2b21,
		Last = 0;
		bMouse = false;
	};
	--暗器 修炼进度条增长特效
	TX_ui_anqi_zengzhang =
	    {
		szName = "TX_ui_anqi_zengzhang";
		PfxID = 100082;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 2000;
		bMouse = false;
	}; 
	--暗器升阶特效
	Tx_ui_anqi_ShengJie_01 =
	    {
		szName = "Tx_ui_anqi_ShengJie_01";
		PfxID = 100083;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-140,y=-170};
		Backcolor = 0x00211a21,
		Last = 3500;
		bMouse = false;
	};
	--功法-独孤九剑 套装升级特效 
	TX_ui_dugujiujian_tz_levelup =
	    {
		szName = "TX_ui_dugujiujian_tz_levelup";
		PfxID = 100085;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装1特效 
	TX_ui_dugujiujian_tz_01 =
	    {
		szName = "TX_ui_dugujiujian_tz_01";
		PfxID = 100086;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-104,y=-75.5};
		Backcolor =  0x00a9a120,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装2特效 
	TX_ui_dugujiujian_tz_02 =
	    {
		szName = "TX_ui_dugujiujian_tz_02";
		PfxID = 100087;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-45,y=-180};
		Backcolor =  0x00a97d20,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装3特效 
	TX_ui_dugujiujian_tz_03 =
	    {
		szName = "TX_ui_dugujiujian_tz_03";
		PfxID = 100088;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-132,y=-169};
		Backcolor =  0x0020a97a,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装4特效  
	TX_ui_dugujiujian_tz_04 =
	    {
		szName = "TX_ui_dugujiujian_tz_04";
		PfxID = 100090;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-128,y=-80};
		Backcolor =  0x001a8aa6,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装5特效 
	TX_ui_dugujiujian_tz_05 =
	    {
		szName = "TX_ui_dugujiujian_tz_05";
		PfxID = 100091;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-112,y=-145};
		Backcolor =  0x00691aa6,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装6特效 
	TX_ui_dugujiujian_tz_06 =
	    {
		szName = "TX_ui_dugujiujian_tz_06";
		PfxID = 100089;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-127,y=-102};
		Backcolor =  0x00a21832,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装7特效 
	TX_ui_dugujiujian_tz_07 =
	    {
		szName = "TX_ui_dugujiujian_tz_07";
		PfxID = 100092;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-127,y=-112};
		Backcolor =  0x008da218,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装8特效 
	TX_ui_dugujiujian_tz_08 =
	    {
		szName = "TX_ui_dugujiujian_tz_08";
		PfxID = 100093;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-27.3};
		Backcolor =  0x00a21832,
		Last = 0;
		bMouse = false;
	}; 
	--功法-独孤九剑 套装9特效 
	TX_ui_dugujiujian_tz_09 =
	    {
		szName = "TX_ui_dugujiujian_tz_09";
		PfxID = 100094;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,2,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-165,y=-27.3};
		Backcolor =  0x008da218,
		Last = 0;
		bMouse = false;
	};
	--功法-独孤九剑 进度条增长特效 
	TX_ui_dugujiujian_jdt =
	    {
		szName = "TX_ui_dugujiujian_jdt";
		PfxID = 100095;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-145,y=-113};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	}; 	
	--通天塔挑战按钮 特效
	Tx_Ui_TongTianTa_tiaozhan =
	    {
		szName = "Tx_Ui_TongTianTa_tiaozhan";
		PfxID = 10009;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,11,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-100,y=-110};
		Backcolor =  0x008b5316,
		Last = 0;
		bMouse = false;
	};	 
	--通天塔通关01层数 特效
	TX_ui_ta_01 =
	    {
		szName = "TX_ui_ta_01";
		PfxID = 100107;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,7,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-100.5};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};	
	--通天塔通关02层数 特效
	TX_ui_ta_02 =
	    {
		szName = "TX_ui_ta_02";
		PfxID = 100108;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,7.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-105.5};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};		
	--通天塔通关03层数 特效
	TX_ui_ta_03 =
	    {
		szName = "TX_ui_ta_03";
		PfxID = 100109;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-107};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};	
	--通天塔通关04层数 特效
	TX_ui_ta_04 =
	    {
		szName = "TX_ui_ta_04";
		PfxID = 100110;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-101};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};		
	--通天塔通关05层数 特效
	TX_ui_ta_05 =
	    {
		szName = "TX_ui_ta_05";
		PfxID = 100111;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,9,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-105};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};	
	--通天塔通关06层数 特效
	TX_ui_ta_06 =
	    {
		szName = "TX_ui_ta_06";
		PfxID = 100112;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,9.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-104};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};	
	--通天塔通关07层数 特效
	TX_ui_ta_07 =
	    {
		szName = "TX_ui_ta_07";
		PfxID = 100113;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,10,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-102,y=-104};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};	
	--通天塔通关08层数 特效
	TX_ui_ta_08 =
	    {
		szName = "TX_ui_ta_08";
		PfxID = 100114;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,10.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-103};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};	
	--通天塔通关09层数 特效
	TX_ui_ta_09 =
	    {
		szName = "TX_ui_ta_09";
		PfxID = 100115;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,11,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-100.5,y=-102};
		Backcolor =  0x00f4492d,
		Last = 0;
		bMouse = false;
	};			
	--伐脉按钮 特效 
	Tx_Ui_yijinjing_famai =
	    {
		szName = "Tx_Ui_yijinjing_famai";
		PfxID = 100096;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-72,y=-80.5};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--伐脉进度条增长 特效 
	Tx_Ui_yijinjing_jindutiao1 =
	    {
		szName = "Tx_Ui_yijinjing_jindutiao1";
		PfxID = 100097;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-20,y=-95};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	};
	--伐脉进度条永久 特效 
	Tx_Ui_yijinjing_jindutiao2 =
	    {
		szName = "Tx_Ui_yijinjing_jindutiao2";
		PfxID = 100098;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,23,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-25,y=-87.8};
		Backcolor =  0x00ff8a00,
		Last = 0;
		bMouse = false;
	};
	--玄宫按钮 特效 
	Tx_Ui_beidouqixingzhen_xuangong =
	    {
		szName = "Tx_Ui_beidouqixingzhen_xuangong";
		PfxID = 100099;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-70.8,y=-80.2};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--玄宫进度条增长 特效 
	Tx_Ui_beidouqixingzhen_jindutiao1 =
	    {
		szName = "Tx_Ui_beidouqixingzhen_jindutiao1";
		PfxID = 100100;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-25,y=-94};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	};
	--玄宫进度条永久 特效 
	Tx_Ui_beidouqixingzhen_jindutiao2 =
	    {
		szName = "Tx_Ui_beidouqixingzhen_jindutiao2";
		PfxID = 100101;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,28,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-35,y=-92};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--炼体按钮 特效 
	Tx_Ui_tiebushan_lianti =
	    {
		szName = "Tx_Ui_tiebushan_lianti";
		PfxID = 100102;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-65.5,y=-84};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--炼体进度条增长 特效 
	Tx_Ui_tiebushan_jindutiao1 =
	    {
		szName = "Tx_Ui_tiebushan_jindutiao1";
		PfxID = 100103;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-30,y=-94};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--炼体进度条永久 特效 
	Tx_Ui_tiebushan_jindutiao2 =
	    {
		szName = "Tx_Ui_tiebushan_jindutiao2";
		PfxID = 100104;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,26,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-34,y=-90};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
		--青云勋章按钮变换 特效 
	Tx_Ui_qyxz_anniubianhuan =
	    {
		szName = "Tx_Ui_qyxz_anniubianhuan";
		PfxID = 100105;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-98,y=-99};
		Backcolor =  0x00936318,
		Last = 0;
		bMouse = false;
	};
	--战骑诀 白色烟雾特效特效 
	TX_ui_Stone_jindutiao_hui =
	    {
		szName = "TX_ui_Stone_jindutiao_hui";
		PfxID = 100116;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-115,y=-120};
		Backcolor =  0x004f4f4f,
		Last = 0;
		bMouse = false;
	};
	--战骑诀 红色火焰特效特效 
	Tx_Ui_qizhanjue_huo =
	    {
		szName = "Tx_Ui_qizhanjue_huo";
		PfxID = 100117;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-114,y=-105};
		Backcolor =  0x00f05835,
		Last = 0;
		bMouse = false;
	};	
	--战骑诀进度条特效
	Tx_Ui_qizhanjue_jindutiao =
	    {
		szName = "Tx_Ui_qizhanjue_jindutiao";
		PfxID = 100118;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-250,y=-144};
		Backcolor =  0x00ad2b21,
		Last = 2000;
		bMouse = false;
	};
	--法宝升阶特效
	Tx_ui_fabao_ShengJie_01 =
	    {
		szName = "Tx_ui_fabao_ShengJie_01";
		PfxID = 100119;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-140,y=-170};
		Backcolor = 0x00211a21,
		Last = 3500;
		bMouse = false;
	};
	--还童按钮 特效 
	Tx_Ui_tonglaogong_huantong =
	    {
		szName = "Tx_Ui_tonglaogong_huantong";
		PfxID = 100120;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-68,y=-83};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--还童进度条增长 特效 
	Tx_Ui_tonglaogong_jindutiao1 =
	    {
		szName = "Tx_Ui_tonglaogong_jindutiao1";
		PfxID = 100121;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-20,y=-94};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--还童进度条永久 特效 
	Tx_Ui_tonglaogong_jindutiao2 =
	    {
		szName = "Tx_Ui_tonglaogong_jindutiao2";
		PfxID = 100122;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,28,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-28,y=-90};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--金身人影 特效 
	Tx_ui_jinsheng_01 =
	    {
		szName = "Tx_ui_jinsheng_01";
		PfxID = 100123;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1.5,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-225,y=-200};
		Backcolor =  0x00f75a2d,
		Last = 0;
		bMouse = false;
	};	
	--金身 白色烟雾特效特效 
	TX_ui_jinshen_hui =
	    {
		szName = "TX_ui_jinshen_hui";
		PfxID = 100124;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-120};
		Backcolor =  0x004f4f4f,
		Last = 0;
		bMouse = false;
	};
	--金身 红色火焰特效特效 
	Tx_Ui_jinshen_huo =
	    {
		szName = "Tx_Ui_jinshen_huo";
		PfxID = 100125;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-115};
		Backcolor =  0x00f05835,
		Last = 0;
		bMouse = false;
	};	
	--英雄令系列项集齐    特效 
	Tx_Ui_yingxiongling_jiqi =
	    {
		szName = "Tx_Ui_yingxiongling_jiqi";
		PfxID = 100126;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-100};
		Backcolor =  0x00f05835,
		Last = 0;
		bMouse = false;
	};
	--英雄令镶嵌永久    特效 
	Tx_Ui_yingxiongling_xiangqian =
	    {
		szName = "Tx_Ui_yingxiongling_xiangqian";
		PfxID = 100127;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3.9,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-103.5,y=-103};
		Backcolor =  0x00ff8040,
		Last = 0;
		bMouse = false;
	};
	--战旗 修炼进度条增长特效
	TX_ui_zhanqi_zengzhang =
	    {
		szName = "TX_ui_zhanqi_zengzhang";
		PfxID = 100128;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x00a9a120,
		Last = 2000;
		bMouse = false;
	}; 
	--战旗升阶特效
	Tx_ui_zhanqi_ShengJie_01 =
	    {
		szName = "Tx_ui_zhanqi_ShengJie_01";
		PfxID = 100129;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(500,500);
		Pos = {x=-140,y=-170};
		Backcolor = 0x00211a21,
		Last = 3500;
		bMouse = false;
	};
	--战旗 升阶图标播放的瞬时特效
	TX_ui_zhanqi_sj_levelup_01 =
	    {
		szName = "TX_ui_zhanqi_sj_levelup_01";
		PfxID = 100130;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,1,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-72,y=-87.3};
		Backcolor =  0x002564bb,
		Last = 0;
		bMouse = false;
	}; 
	TX_ui_Stone_zhuzaokuang_07 = 
	    {
		szName = "TX_ui_Stone_zhuzaokuang_07";
		PfxID = 100131;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,8.55,0);
		Size = _Vector2.new(500,300);
		Pos = {x=-232,y=-132};
		Backcolor = 0x00ff3333,
		Last = 0;
		bMouse = false;
	}; 
	--拜关公 祁拜瞬时特效 
	Tx_ui_baiguangong_qibai =
	    {
		szName = "Tx_ui_baiguangong_qibai";
		PfxID = 100126;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-100};
		Backcolor =  0x00f05835,
		Last = 0;
		bMouse = false;
	};	
	--拜关公 进度条永久特效 
	TX_ui_baiguangong_jindutiao_01 =
	    {
		szName = "TX_ui_baiguangong_jindutiao_01";
		PfxID = 100125;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,6.5,0);
		Size = _Vector2.new(300,300);
		Pos = {x=-120,y=-115};
		Backcolor =  0x00f05835,
		Last = 0;
		bMouse = false;
	};
	--炮制按钮 特效 
	Tx_Ui_jiuhulu_paozhi =
	    {
		szName = "Tx_Ui_jiuhulu_paozhi";
		PfxID = 100134;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-65,y=-86};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--炮制进度条增长 特效
	Tx_Ui_jiuhulu_jindutiao1 =
	    {
		szName = "Tx_Ui_jiuhulu_jindutiao1";
		PfxID = 100135;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-12,y=-86};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--淬毒按钮 特效 
	Tx_Ui_jiuhulu_cuidu =
	    {
		szName = "Tx_Ui_jiuhulu_cuidu";
		PfxID = 100096;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-51,y=-46};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--淬毒进度条增长 特效
	Tx_Ui_jiuhulu_cuidu1 =
	    {
		szName = "Tx_Ui_jiuhulu_cuidu1";
		PfxID = 100135;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(200,200);
		Pos = {x=20,y=-48};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--精织按钮 特效 
	Tx_Ui_jiuhulu_jingzhi =
	    {
		szName = "Tx_Ui_jiuhulu_jingzhi";
		PfxID = 100134;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-60,y=-60};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--精织进度条增长 特效
	Tx_Ui_jiuhulu_jingzhi1 =
	    {
		szName = "Tx_Ui_jiuhulu_jingzhi1";
		PfxID = 100135;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4.5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=2,y=-60};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--祭炼按钮 特效 
	Tx_Ui_jiuhulu_jilian =
	    {
		szName = "Tx_Ui_jiuhulu_jilian";
		PfxID = 100134;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-34,y=-49};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--祭炼进度条增长 特效
	Tx_Ui_jiuhulu_jilian1 =
	    {
		szName = "Tx_Ui_jiuhulu_jilian1";
		PfxID = 100135;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(200,200);
		Pos = {x=10,y=-50};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--苦修按钮 特效 
	Tx_Ui_jiuhulu_kuxiu =
	    {
		szName = "Tx_Ui_jiuhulu_kuxiu";
		PfxID = 100134;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-49,y=-51};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--苦修进度条增长 特效
	Tx_Ui_jiuhulu_kuxiu1 =
	    {
		szName = "Tx_Ui_jiuhulu_kuxiu1";
		PfxID = 100135;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,4,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-7,y=-63};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
	--精工按钮 特效 
	Tx_Ui_jiuhulu_jinggong =
	    {
		szName = "Tx_Ui_jiuhulu_jinggong";
		PfxID = 100134;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,5,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-65,y=-86};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};	
	--精工进度条增长 特效
	Tx_Ui_jiuhulu_jinggong1 =
	    {
		szName = "Tx_Ui_jiuhulu_jinggong1";
		PfxID = 100135;
		Look = _Vector3.new(0,0,0);
		Eye = _Vector3.new(0,3,0);
		Size = _Vector2.new(200,200);
		Pos = {x=-12,y=-86};
		Backcolor =  0x00ffe600,
		Last = 0;
		bMouse = false;
	};
}
