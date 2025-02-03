
--[[
--跨服战界面管理总配置
	赵飞
	2014-3-3
--]]
_G.CrossSvrUIConfig = {
	--客户端屏蔽  ShowUIName中界面为战场显示界面名 -- CUIMainPageHeadPic 类名 MainPageHeadPic 控件名
	ShowUIName = { 
		[1] = {"CUIMainPageHeadPic","MainPageHeadPic"};
		[2] = {"CUISmallMap","CUISmallMap"};
		[3] = {"autoWalkInfo","autoWalkInfo"};
		[4] = {"CUIMainPageShrtcut","MainPageShrtcut"};
		[5] = {"CErrorNotice","ErrorNotice"};
		[6] = {"CUIChatSystem","ChatSystem"};
		[7] = {"CUIBtnTip","CUIBtnTip"};
		[8] = {"CUITooltipBase","CUITooltipBase"};
		[9] = {"CIncomeNotice","IncomeNotice"};
		[10] = {"CUIMainPagePlayerTarget","MainPagePlayerTarget"};
		[11] = {"CUIBigMap","CUIBigMap"};                                                                                       
		[12] ={"CUISettingMain","SettingMain"};
		[13] ={"CUISettingSystem","SettingSystem"};
		[14] ={"CUIKeySettingMsg","KeySettingMsg"};
		[15] ={"CUINgSelect","NgSelect"};
		[16] ={"CUIStartLoad","StartLoad"};
		[17] ={"CUIQPro","UIQPro"};
		[18] ={"CUIBigMap","mapNameUI"};
		[19] ={"CUIMainPageMonsterTarget","Boss"};
		[20] ={"CUIMainPageMonsterTarget","Better"};
		[21] ={"CUIMainPageMonsterTarget","Normal"};
		[22] ={"CUIRelive","Relive"};
		[23] ={"CUIMainPageProgressBar","MainPageProgressBar"};
		[24] ={"UICoverOper","CUIShelter"};
		[25] ={"CUIResLoader","CUIResLoader"};
		[26] ={"CUIHpNotice","HPNotice"};
		[27] ={"CUIRideHorse","RideHorse"};
		[28] ={"CSystemNotice","RollMotice"};
		[29] ={"UICoverOper","CrossChangeLineIng"};
	};
	FindStr = "#";
	--进入战场后需要灰掉的控件配置
	--- MainPageHeadPic  -- 界面名   ---------------headPortrait#VIPButton#
	SetBtnDisabled = { 
--[[		MainPageHeadPic = {
							-- "headPortrait#VIPButton#";
							-- "headPortrait#VIPButtonDis#";
							-- };
		MainPageShrtcut = {
							"TanWeiBtn#";
							"btnHangup#";
							"btnRetreat#";
							"btnSit#";   
							"btnMounts#";
							};]]
		CUISmallMap = {
							"BtnChangeLine#";
						    --"panel#BtnAchieve#";                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
							--"panel#BtnSeniority#";
							--"panel#BtnNothing#";
							--"panel#BtnVisible#";
							--"panel#BtnVisible#";
							};
		ChatSystem = {
						-- "chat#zjmUI_button2#";
						-- "chat#zjmUI_button4#";
						-- "chat#zjmUI_button3#";
						-- "chat#SpeakerButton#";
						"chat#speak_button#";
						};
	};
	--进入战场后需要隐藏控件配置
	--- MainPageShrtcut  -- 界面名   ---------------useBar# 控件路径
	SetBtnVisible = { 
		MainPageShrtcut = {
							"useBar#";
							"XiaKeXingAlpha#";
							"XiaKeXing#";
							"TiaoHe#";
							-- "wood_mc#";
							"TanWeiBtn#";
							--"zhujiemianUI_renwuyindao#";
							-- "pbarExp#";
							-- "lbExpInfo#";
		};
		MainPagePlayerTarget = {
							"btnMenu#";
						    "btnShortcutTrade#";
							"btnShortcutFriends#";
							"btnShortcutGroup#";
							"btnShortcutWhisper#";
							"btnShortcutLook#";
							};	
		MainPageHeadPic = {
							"headPortrait#VIPButton#";
							"headPortrait#VIPButtonDis#";
					};
		ChatSystem = {
				"chat#zjmUI_button2#";
				"chat#zjmUI_button4#";
				"chat#zjmUI_button3#";
				"chat#SpeakerButton#";
				};
	};
	ShowUINameEx = { 
		[1] = "WindowNotice";
		[2] = "EquipWearNotice";
	};
};