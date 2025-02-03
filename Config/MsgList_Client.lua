_G.MsgList_Client =
{
	ActiveHideAttrSucMsg = {
		[1] = 1;
		[2] = {
			[1] = "ActiveLevel";
			[2] = "ResultType";
		};
	};
	AmuletInlayMsg = {
		[1] = 2;
		[2] = {
			[1] = "dwAmuletInlayLevel";
			[2] = "dwErrorCode";
		};
	};
	AmuletRefineMsg = {
		[1] = 3;
		[2] = {
			[1] = "ErrorCode";
		};
	};
	AmuletSys_SynTianGuanCiFuMsg = {
		[1] = 4;
		[2] = {
			[1] = "RestTime";
		};
	};
	BRSys_BroadCastMsg = {
		[1] = 5;
		[2] = {
			[1] = "CurPer";
		};
	};
	BSUA_BattleScoreUpAllMsg = {
		[1] = 6;
		[2] = {
			[1] = "dwDressID";
			[2] = "roleID";
			[3] = "tAllScore";
		};
	};
	BSU_BattleScoreUpOnceMsg = {
		[1] = 7;
		[2] = {
			[1] = "key";
			[2] = "score";
		};
	};
	BaiduPlayerInfoMsg = {
		[1] = 8;
		[2] = {
			[1] = "Info";
		};
	};
	BaiduPlayerResMsg = {
		[1] = 9;
		[2] = {
			[1] = "Res";
		};
	};
	BanditFailInfoMsg = {
		[1] = 10;
		[2] = {
			[1] = "Id";
		};
	};
	BanditGetItemListMsg = {
		[1] = 11;
		[2] = {
			[1] = "ItemId";
			[2] = "ItemList";
		};
	};
	BanditGetSucMsg = {
		[1] = 12;
		[2] = {
		};
	};
	BanditGetTurnMsg = {
		[1] = 13;
		[2] = {
			[1] = "Pos1";
			[2] = "Pos2";
			[3] = "Pos3";
			[4] = "State";
		};
	};
	Banner_BroadcastPhaseMsg = {
		[1] = 14;
		[2] = {
			[1] = "nPhase";
			[2] = "nRoleID";
			[3] = "sName";
		};
	};
	Banner_DefenseChangeMsg = {
		[1] = 15;
		[2] = {
			[1] = "nDefense";
		};
	};
	Banner_RespondChangeConsumeMsg = {
		[1] = 16;
		[2] = {
			[1] = "bConsume";
		};
	};
	Banner_RespondFlagMsg = {
		[1] = 17;
		[2] = {
			[1] = "nLeftTime";
		};
	};
	Banner_RespondForgeMsg = {
		[1] = 18;
		[2] = {
			[1] = "bBless";
			[2] = "nEXP";
		};
	};
	Banner_RespondLookMsg = {
		[1] = 19;
		[2] = {
			[1] = "nLook";
		};
	};
	Banner_RespondUpPhaseMsg = {
		[1] = 20;
		[2] = {
			[1] = "bBless";
			[2] = "nBlessEXP";
		};
	};
	Banner_RespondViewOtherMsg = {
		[1] = 21;
		[2] = {
			[1] = "bAuthority";
			[2] = "bBless";
			[3] = "nCount";
			[4] = "nDefense";
			[5] = "nEXP";
		};
	};
	Banner_SynchronizeMsg = {
		[1] = 22;
		[2] = {
			[1] = "bBless";
			[2] = "bConsume";
			[3] = "nBlessEXP";
			[4] = "nEXP";
			[5] = "nLeftTime";
			[6] = "nLook";
		};
	};
	BeInjectMsg = {
		[1] = 23;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "Time";
		};
	};
	BroadBuffActionMsg = {
		[1] = 24;
		[2] = {
			[1] = "BuffTbl";
			[2] = "RoleId";
			[3] = "RoleType";
		};
	};
	BroadCastUseSpecialPortraitMsg = {
		[1] = 25;
		[2] = {
			[1] = "HeadState";
			[2] = "RoleID";
		};
	};
	BroadcastAddBuffActionMsg = {
		[1] = 26;
		[2] = {
			[1] = "ActionId";
			[2] = "PfxId";
			[3] = "RoleId";
			[4] = "RoleType";
		};
	};
	BroadcastDelBuffActionMsg = {
		[1] = 27;
		[2] = {
			[1] = "ActionId";
			[2] = "PfxId";
			[3] = "RoleId";
			[4] = "RoleType";
		};
	};
	CSCltNpcShopMsg = {
		[1] = 28;
		[2] = {
			[1] = "Type";
		};
	};
	CallMemberBroadCastMsg = {
		[1] = 29;
		[2] = {
			[1] = "GuildName";
			[2] = "PlayerName";
			[3] = "PlayerRoleID";
		};
	};
	ChallengeOthersResultMsg = {
		[1] = 30;
		[2] = {
			[1] = "Info";
		};
	};
	ChangeSpecialGourdMsg = {
		[1] = 31;
		[2] = {
			[1] = "AdornState";
		};
	};
	ChangeSpecialPortraitMsg = {
		[1] = 32;
		[2] = {
			[1] = "HeadState";
		};
	};
	ChangeStateMsg = {
		[1] = 33;
		[2] = {
			[1] = "StateID";
		};
	};
	ChartAwardResultMsg = {
		[1] = 34;
		[2] = {
			[1] = "ErrorCode";
			[2] = "ID";
		};
	};
	ChartAwardSyncReceivedsMsg = {
		[1] = 35;
		[2] = {
			[1] = "IDs";
		};
	};
	ChgBuffFrenMsg = {
		[1] = 36;
		[2] = {
			[1] = "BuffId";
			[2] = "CDFlag";
			[3] = "ClassId";
			[4] = "EntityId";
			[5] = "Frenquency";
			[6] = "Type";
		};
	};
	ClearAwardFlagMsg = {
		[1] = 37;
		[2] = {
		};
	};
	ClearCDCostMsg = {
		[1] = 38;
		[2] = {
		};
	};
	ClearFbDelInfoMsg = {
		[1] = 39;
		[2] = {
		};
	};
	ClearFbEnterReqMsg = {
		[1] = 40;
		[2] = {
		};
	};
	ClearLockedMsg = {
		[1] = 41;
		[2] = {
		};
	};
	ClearMyTeamPanelMsg = {
		[1] = 42;
		[2] = {
			[1] = "OldTeamMates";
		};
	};
	ClientShowBuffIconMsg = {
		[1] = 43;
		[2] = {
			[1] = "BuffEntityId";
			[2] = "BuffFren";
			[3] = "BuffFrenFlag";
			[4] = "BuffId";
			[5] = "BuffLevel";
			[6] = "BuffLifeTime";
			[7] = "BuffTroopNum";
			[8] = "BuffValue";
			[9] = "CDFlag";
			[10] = "ForeverFlag";
		};
	};
	CltBroadCastActiveSucMsg = {
		[1] = 44;
		[2] = {
			[1] = "ActiveLevel";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltBroadCastAddLevelMsg = {
		[1] = 45;
		[2] = {
			[1] = "Level";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltBroadCastChangeRankMsg = {
		[1] = 46;
		[2] = {
			[1] = "Rank";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltBroadCastExChangeSucMsg = {
		[1] = 47;
		[2] = {
			[1] = "GetLevel";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltBroadCastGetCollectJewelAwardMsg = {
		[1] = 48;
		[2] = {
			[1] = "AwardInfo";
			[2] = "CollJewType";
			[3] = "RoleID";
			[4] = "RoleName";
		};
	};
	CltBroadCastGetShakeAwardsMsg = {
		[1] = 49;
		[2] = {
			[1] = "AwardInfo";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltBroadCastSuitStarOpenMsg = {
		[1] = 50;
		[2] = {
			[1] = "Level";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltCMatrixMethodSystemHideMsg = {
		[1] = 51;
		[2] = {
			[1] = "HideLevel";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltCMatrixMethodSystemStarMsg = {
		[1] = 52;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "StarIndex";
			[4] = "StarLevel";
		};
	};
	CltCMatrixMethodSystemSuitMsg = {
		[1] = 53;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "SuitLevel";
		};
	};
	CltDecodeMsg = {
		[1] = 54;
		[2] = {
			[1] = "Param";
		};
	};
	CltDecodeRefineMsg = {
		[1] = 55;
		[2] = {
			[1] = "ItemID";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltDecodeVipMsg = {
		[1] = 56;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	CltElemMsg = {
		[1] = 57;
		[2] = {
			[1] = "Param";
			[2] = "Type";
		};
	};
	CltFlushBournMsg = {
		[1] = 58;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	CltFlushFiveElemInfoMsg = {
		[1] = 59;
		[2] = {
			[1] = "ElemLv";
			[2] = "ElemName";
		};
	};
	CltFlushGiftInfoMsg = {
		[1] = 60;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltFlushGrowupTargetInfoMsg = {
		[1] = 61;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltFlushMissionDailyInfoMsg = {
		[1] = 62;
		[2] = {
			[1] = "Flag";
			[2] = "SInfo";
			[3] = "Type";
		};
	};
	CltFlushPulseInfoMsg = {
		[1] = 63;
		[2] = {
			[1] = "Opt";
			[2] = "RoleID";
			[3] = "RoleName";
			[4] = "Type";
		};
	};
	CltFlushVipInfoMsg = {
		[1] = 64;
		[2] = {
			[1] = "Flag";
			[2] = "SInfo";
		};
	};
	CltGourdBroadCastAddLevelMsg = {
		[1] = 65;
		[2] = {
			[1] = "Level";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltGrowupTargetMsg = {
		[1] = 66;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	CltInitBournInfoMsg = {
		[1] = 67;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltInitFiveElemInfoMsg = {
		[1] = 68;
		[2] = {
			[1] = "Flag";
			[2] = "SInfo";
		};
	};
	CltInitPulseInfoMsg = {
		[1] = 69;
		[2] = {
			[1] = "DraPul";
			[2] = "SInfo";
			[3] = "Type";
		};
	};
	CltLotteryDrawMsg = {
		[1] = 70;
		[2] = {
		};
	};
	CltLotteryRemainTicketMsg = {
		[1] = 71;
		[2] = {
		};
	};
	CltLotteryTicketChangeMsg = {
		[1] = 72;
		[2] = {
			[1] = "DrawCount";
			[2] = "Index";
			[3] = "RoleID";
			[4] = "SelectedCount";
		};
	};
	CltMallChangeItemPriceMsg = {
		[1] = 73;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltMallFeedBackMsg = {
		[1] = 74;
		[2] = {
			[1] = "Type";
		};
	};
	CltMallUpDownMsg = {
		[1] = 75;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltMissionDailyMsg = {
		[1] = 76;
		[2] = {
			[1] = "Param";
			[2] = "Type";
		};
	};
	CltNpcShopMsg = {
		[1] = 77;
		[2] = {
			[1] = "Item";
			[2] = "Type";
		};
	};
	CltOpenDraPulseCastMsg = {
		[1] = 78;
		[2] = {
			[1] = "DarPul";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CltPlayerShopMsg = {
		[1] = 79;
		[2] = {
			[1] = "ParamInfo";
			[2] = "Type";
		};
	};
	CltPotMsg = {
		[1] = 80;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	CltStudyKungFuSucessCastMsg = {
		[1] = 81;
		[2] = {
			[1] = "CastType";
			[2] = "KungFuID";
			[3] = "RoleID";
			[4] = "RoleName";
			[5] = "ZhaoshiID";
		};
	};
	CltTradeMsg = {
		[1] = 82;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "Type";
		};
	};
	CltTradingMsg = {
		[1] = 83;
		[2] = {
			[1] = "Item";
			[2] = "Pos";
			[3] = "Type";
		};
	};
	CltUpBournMsg = {
		[1] = 84;
		[2] = {
			[1] = "BournLv";
		};
	};
	CltUpdateContinueKillMsg = {
		[1] = 85;
		[2] = {
			[1] = "ContinueKillNum";
			[2] = "ContinueKillTime";
		};
	};
	CntIncomeRcvMsg = {
		[1] = 86;
		[2] = {
			[1] = "Data";
		};
	};
	CollectJewelLevelSynMsg = {
		[1] = 87;
		[2] = {
			[1] = "CollectJewelLevel";
			[2] = "CollectJewelState";
		};
	};
	CollectJewelSynchronizeToClientMsg = {
		[1] = 88;
		[2] = {
			[1] = "InjectJewelCanUseNum";
			[2] = "InjectJewelCanUseTotalNum";
			[3] = "InjectJewelProcess";
			[4] = "InjectJewelState";
			[5] = "InjectJewelUseNum";
			[6] = "InjectJewelUseTotalNum";
		};
	};
	CollectSendAllMsg = {
		[1] = 89;
		[2] = {
			[1] = "Info";
		};
	};
	CollectSendChangeMsg = {
		[1] = 90;
		[2] = {
			[1] = "Info";
		};
	};
	CollectSendResMsg = {
		[1] = 91;
		[2] = {
			[1] = "Info";
		};
	};
	CollectStunnerMsg = {
		[1] = 92;
		[2] = {
			[1] = "Info";
		};
	};
	CollectStunnerSendResMsg = {
		[1] = 93;
		[2] = {
			[1] = "Info";
		};
	};
	CommercialActInfoMsg = {
		[1] = 94;
		[2] = {
			[1] = "ActID";
			[2] = "Info";
		};
	};
	CommercialActRewardInfoMsg = {
		[1] = 95;
		[2] = {
			[1] = "RewardInfo";
			[2] = "StageInfo";
		};
	};
	CommercialGiftGetRewardResultMsg = {
		[1] = 96;
		[2] = {
			[1] = "Code";
		};
	};
	CreateGameSessionRequestMsg = {
		[1] = 97;
		[2] = {
			[1] = "ResultCode";
		};
	};
	CrossSvrNoticeMsg = {
		[1] = 98;
		[2] = {
			[1] = "Data";
		};
	};
	CurioAllInfoMsg = {
		[1] = 99;
		[2] = {
			[1] = "tCount";
		};
	};
	CurioBoardcastMsg = {
		[1] = 100;
		[2] = {
			[1] = "CurioIndex";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	CurioCommitRetMsg = {
		[1] = 101;
		[2] = {
			[1] = "Count";
			[2] = "CurioIndex";
			[3] = "PartIndex";
		};
	};
	DT_AnswerBackMsg = {
		[1] = 102;
		[2] = {
			[1] = "Point";
		};
	};
	DT_BroadCastMsg = {
		[1] = 103;
		[2] = {
		};
	};
	DT_MakeUpMsg = {
		[1] = 104;
		[2] = {
			[1] = "Result";
		};
	};
	DT_NoticeEndMsg = {
		[1] = 105;
		[2] = {
		};
	};
	DT_NoticeStartMsg = {
		[1] = 106;
		[2] = {
			[1] = "Countdown";
			[2] = "Point";
			[3] = "RankTable";
			[4] = "Right";
			[5] = "State";
			[6] = "Wrong";
		};
	};
	DT_RefreshQuestionMsg = {
		[1] = 107;
		[2] = {
			[1] = "ID";
			[2] = "Index";
		};
	};
	DT_RefreshRankMsg = {
		[1] = 108;
		[2] = {
			[1] = "RankTable";
		};
	};
	DelLockedTblMsg = {
		[1] = 109;
		[2] = {
			[1] = "RoleId";
		};
	};
	DelRoleMsg = {
		[1] = 110;
		[2] = {
			[1] = "RoleID";
		};
	};
	DeleteBuffByClassMsg = {
		[1] = 111;
		[2] = {
			[1] = "ClassId";
		};
	};
	DropClearRoleIdMsg = {
		[1] = 112;
		[2] = {
			[1] = "DwObjId";
		};
	};
	DropDelItemMsg = {
		[1] = 113;
		[2] = {
			[1] = "DwObjId";
		};
	};
	DropGetAddItemsInfoMsg = {
		[1] = 114;
		[2] = {
			[1] = "ItemInfo";
		};
	};
	DropGetAllItemInfoMsg = {
		[1] = 115;
		[2] = {
			[1] = "Add";
			[2] = "Del";
		};
	};
	DropPickErrorInfoMsg = {
		[1] = 116;
		[2] = {
			[1] = "DwErrorType";
			[2] = "ObjId";
		};
	};
	DropShowItemMsg = {
		[1] = 117;
		[2] = {
			[1] = "TbObj";
		};
	};
	DuGuJiuJian_BroadcastPhaseMsg = {
		[1] = 118;
		[2] = {
			[1] = "dwRoleId";
			[2] = "nPhase";
			[3] = "sName";
		};
	};
	DuGuJiuJian_BroadcastSwordMsg = {
		[1] = 119;
		[2] = {
			[1] = "dwRoleId";
			[2] = "nActSwordId";
			[3] = "sName";
		};
	};
	DuGuJiuJian_ResponseActivateMsg = {
		[1] = 120;
		[2] = {
			[1] = "nSwordID";
		};
	};
	DuGuJiuJian_ResponseCheckOtherMsg = {
		[1] = 121;
		[2] = {
			[1] = "bHasAuthority";
			[2] = "dwEXP";
			[3] = "nActSwordId";
		};
	};
	DuGuJiuJian_ResponsePracticeMsg = {
		[1] = 122;
		[2] = {
			[1] = "dwNewEXP";
			[2] = "nPracticeID";
			[3] = "nTimes";
		};
	};
	DuGuJiuJian_SynchronizeMsg = {
		[1] = 123;
		[2] = {
			[1] = "dwEXP";
			[2] = "nActSwordId";
			[3] = "tTimes";
		};
	};
	EISys_AppointLevelSucMsg = {
		[1] = 124;
		[2] = {
		};
	};
	EISys_BroadCastMsg = {
		[1] = 125;
		[2] = {
			[1] = "Info";
			[2] = "ItemNetData";
			[3] = "PlayerName";
			[4] = "PlayerRoleID";
			[5] = "Type";
		};
	};
	EISys_OnAddAppendPropValueMsg = {
		[1] = 126;
		[2] = {
			[1] = "NewProp";
			[2] = "OldProp";
			[3] = "Result";
		};
	};
	EISys_OnAppendPropMsg = {
		[1] = 127;
		[2] = {
			[1] = "AppendProp";
		};
	};
	EISys_OnCloseMsg = {
		[1] = 128;
		[2] = {
		};
	};
	EISys_OnIntensifyBornPropMsg = {
		[1] = 129;
		[2] = {
			[1] = "NowPer";
			[2] = "Result";
		};
	};
	EISys_OnIntensifyEquipMsg = {
		[1] = 130;
		[2] = {
			[1] = "AddExp";
			[2] = "AfterStrongLevel";
			[3] = "BeforeStrongLevel";
			[4] = "Result";
		};
	};
	EISys_OnLevelUpEquipMsg = {
		[1] = 131;
		[2] = {
			[1] = "Result";
		};
	};
	EISys_OnResetAppendPropTypeMsg = {
		[1] = 132;
		[2] = {
			[1] = "Type";
		};
	};
	EISys_OnUserChoosePropMsg = {
		[1] = 133;
		[2] = {
		};
	};
	EISys_ScrollBroadCastMsg = {
		[1] = 134;
		[2] = {
			[1] = "ItemNetData";
			[2] = "PlayerName";
			[3] = "PlayerRoleID";
			[4] = "ScrollID";
		};
	};
	EISys_SynTianGuanCiFuMsg = {
		[1] = 135;
		[2] = {
			[1] = "EquipUpGrade";
		};
	};
	EISys_WashPropScrollRetMsg = {
		[1] = 136;
		[2] = {
			[1] = "IsSuccess";
		};
	};
	ElemChangeNoticeMsg = {
		[1] = 137;
		[2] = {
			[1] = "Name";
			[2] = "Value";
		};
	};
	EmpriseOrderViewOtherResultMsg = {
		[1] = 138;
		[2] = {
			[1] = "GetLevel";
		};
	};
	EnterDuplMsg = {
		[1] = 139;
		[2] = {
			[1] = "DuplID";
			[2] = "Score";
			[3] = "Time";
			[4] = "ZLDuplInfo";
			[5] = "ZLPlanNum";
		};
	};
	EnterDuplSetTimeMsg = {
		[1] = 140;
		[2] = {
			[1] = "DuplModel";
			[2] = "Time";
		};
	};
	EnterGameServiceResultMsg = {
		[1] = 141;
		[2] = {
			[1] = "ResultCode";
		};
	};
	EquipBuildSys_BroadCastMsg = {
		[1] = 142;
		[2] = {
			[1] = "Level";
			[2] = "PlayerName";
			[3] = "PlayerRoleID";
			[4] = "SlotPos";
		};
	};
	EquipBuildSys_ViewOtherResultMsg = {
		[1] = 143;
		[2] = {
			[1] = "EquipBuildInfo";
			[2] = "IsOK";
		};
	};
	EquipDecomposeEndMsg = {
		[1] = 144;
		[2] = {
			[1] = "ResultList";
		};
	};
	ErrantHonorBroadCastMsg = {
		[1] = 145;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	ErrantSys_BroadCastMsg = {
		[1] = 146;
		[2] = {
			[1] = "MapId";
			[2] = "MonsterId";
			[3] = "PlayerName";
			[4] = "PlayerRoleID";
			[5] = "Type";
		};
	};
	EscortRefSys_BroadCastMsg = {
		[1] = 147;
		[2] = {
			[1] = "NewQuality";
			[2] = "PlayerName";
			[3] = "PlayerRoleID";
		};
	};
	EscortSys_BroadCastMsg = {
		[1] = 148;
		[2] = {
			[1] = "AttrTbl";
			[2] = "StringId";
		};
	};
	EscortSys_StartBroadCastMsg = {
		[1] = 149;
		[2] = {
		};
	};
	ExchangeOrderSucMsg = {
		[1] = 150;
		[2] = {
			[1] = "GetLevel";
			[2] = "ResultType";
		};
	};
	ExecChangeMapMsg = {
		[1] = 151;
		[2] = {
			[1] = "MapInfo";
		};
	};
	ExitDuplMsg = {
		[1] = 152;
		[2] = {
		};
	};
	FashionDressBoxNumMsg = {
		[1] = 153;
		[2] = {
			[1] = "nBoxNum";
		};
	};
	FashionDressBuyBoardcastMsg = {
		[1] = 154;
		[2] = {
			[1] = "DressId";
			[2] = "RoleId";
			[3] = "RoleName";
		};
	};
	FashionDressHuaShenDanBoardcastMsg = {
		[1] = 155;
		[2] = {
			[1] = "Level";
			[2] = "RoleId";
			[3] = "RoleName";
		};
	};
	FashionDressInBoxListMsg = {
		[1] = 156;
		[2] = {
			[1] = "tInBox";
		};
	};
	FashionDressOperRetMsg = {
		[1] = 157;
		[2] = {
			[1] = "Dress";
			[2] = "OperType";
		};
	};
	FashionDressSyncAllMsg = {
		[1] = 158;
		[2] = {
			[1] = "CurExp";
			[2] = "SetDress";
			[3] = "SetEquip";
		};
	};
	FashionDressSyncEquipMsg = {
		[1] = 159;
		[2] = {
			[1] = "SetEquip";
		};
	};
	FashionDressSyncExpMsg = {
		[1] = 160;
		[2] = {
			[1] = "BaseExp";
			[2] = "Count";
			[3] = "CurExp";
			[4] = "Mul";
		};
	};
	FashionDressSys_ViewOtherResultMsg = {
		[1] = 161;
		[2] = {
			[1] = "dwCurExp";
			[2] = "dwProf";
			[3] = "setEquipDress";
		};
	};
	FestivalClearMsg = {
		[1] = 162;
		[2] = {
		};
	};
	FestivalConfigMsg = {
		[1] = 163;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalEndFestivalMsg = {
		[1] = 164;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalEndLineMsg = {
		[1] = 165;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalMyRewardMsg = {
		[1] = 166;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	FestivalNowFestivalMsg = {
		[1] = 167;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalRewardLineMsg = {
		[1] = 168;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalRewardResMsg = {
		[1] = 169;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalRewardResetMsg = {
		[1] = 170;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalStartFestivalMsg = {
		[1] = 171;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalStartLineMsg = {
		[1] = 172;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalSyncConfigMsg = {
		[1] = 173;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalSyncListMsg = {
		[1] = 174;
		[2] = {
			[1] = "List";
		};
	};
	FlushBattleScoreMsg = {
		[1] = 175;
		[2] = {
		};
	};
	FlyItemIconToPacketMsg = {
		[1] = 176;
		[2] = {
			[1] = "Items";
		};
	};
	FrenzyHoe_DigTreasureAwardListMsg = {
		[1] = 177;
		[2] = {
			[1] = "ParamList";
		};
	};
	FrenzyHoe_DigTreasureFailMsg = {
		[1] = 178;
		[2] = {
		};
	};
	FrenzyHoe_ExchangeHoeSuccMsg = {
		[1] = 179;
		[2] = {
			[1] = "FrendNum";
		};
	};
	FrenzyHoe_GetTreasureAwardSuccMsg = {
		[1] = 180;
		[2] = {
		};
	};
	FrenzyHoe_OnDeadBreakComposeMsg = {
		[1] = 181;
		[2] = {
		};
	};
	FrenzyHoe_SynchronizeBroadCastInfoMsg = {
		[1] = 182;
		[2] = {
			[1] = "IsOnLine";
			[2] = "ParamInfo";
		};
	};
	FrenzyHoe_SynchronizeDigAwardMsg = {
		[1] = 183;
		[2] = {
			[1] = "AwardItemId";
			[2] = "AwardItemNum";
		};
	};
	FrenzyHoe_SynchronizeEventInfoMsg = {
		[1] = 184;
		[2] = {
			[1] = "ParamInfo";
		};
	};
	FrenzyHoe_SynchronizeHoeFrendNumMsg = {
		[1] = 185;
		[2] = {
			[1] = "FrendNum";
		};
	};
	FrenzyHoe_ZeroClearFriendNumMsg = {
		[1] = 186;
		[2] = {
		};
	};
	FullAward_BroadCastMsg = {
		[1] = 187;
		[2] = {
			[1] = "PlayerName";
			[2] = "PlayerRoleID";
			[3] = "Str";
		};
	};
	GSAllTimeRewardDataMsg = {
		[1] = 188;
		[2] = {
			[1] = "Data";
		};
	};
	GSTimeRewardOperaResMsg = {
		[1] = 189;
		[2] = {
			[1] = "Data";
			[2] = "Res";
			[3] = "Type";
		};
	};
	GambleGetInfoMsg = {
		[1] = 190;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	GambleGetResMsg = {
		[1] = 191;
		[2] = {
			[1] = "Res";
		};
	};
	GestSys_ViewOtherResultMsg = {
		[1] = 192;
		[2] = {
			[1] = "IsOK";
			[2] = "tInfo";
		};
	};
	GetCollectJewelAwardSuccessMsg = {
		[1] = 193;
		[2] = {
			[1] = "CollJewType";
			[2] = "CurInjectJewelProcess";
			[3] = "CurInjectJewelState";
			[4] = "CurInjectJewelUseNum";
		};
	};
	GetErrantAwardMsg = {
		[1] = 194;
		[2] = {
			[1] = "ErrantAwardStr";
		};
	};
	GetRewardResultMsg = {
		[1] = 195;
		[2] = {
			[1] = "ItemIndex";
			[2] = "ResultType";
		};
	};
	GetUnionRewardResultMsg = {
		[1] = 196;
		[2] = {
			[1] = "ItemIndex";
			[2] = "ResultType";
		};
	};
	GoldenBodyBoardcastMsg = {
		[1] = 197;
		[2] = {
			[1] = "Grade";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	GoldenBodyCiFuUpdateMsg = {
		[1] = 198;
		[2] = {
			[1] = "RestTime";
			[2] = "Value";
		};
	};
	GoldenBodyExpUpdateMsg = {
		[1] = 199;
		[2] = {
			[1] = "Exp";
			[2] = "bIsCrit";
		};
	};
	GoldenBodyPracticeUpdateMsg = {
		[1] = 200;
		[2] = {
			[1] = "Practice";
		};
	};
	GourdHandInItemInfoMsg = {
		[1] = 201;
		[2] = {
			[1] = "ChangeValue";
			[2] = "Infos";
			[3] = "Type";
		};
	};
	GourdSynchronizeToClientMsg = {
		[1] = 202;
		[2] = {
			[1] = "Infos";
		};
	};
	GuildPlayerMsg = {
		[1] = 203;
		[2] = {
			[1] = "Cmd";
			[2] = "Info";
		};
	};
	HW_AllNoticeMsg = {
		[1] = 204;
		[2] = {
			[1] = "level";
			[2] = "playerId";
			[3] = "playerName";
		};
	};
	HW_HiddenWeapon_TGCFMsg = {
		[1] = 205;
		[2] = {
			[1] = "Value";
		};
	};
	HW_OpenToCloseMsg = {
		[1] = 206;
		[2] = {
			[1] = "isOpen";
		};
	};
	HW_UpdateOtherValueMsg = {
		[1] = 207;
		[2] = {
			[1] = "level";
			[2] = "nCount";
			[3] = "value";
		};
	};
	HW_UpdateValueMsg = {
		[1] = 208;
		[2] = {
			[1] = "level";
			[2] = "value";
		};
	};
	HavePlaherReplaceMsg = {
		[1] = 209;
		[2] = {
			[1] = "ResultCode";
		};
	};
	HeroToken_BroadcastSeriesMsg = {
		[1] = 210;
		[2] = {
			[1] = "nRoleID";
			[2] = "nSeriesIndex";
			[3] = "sName";
		};
	};
	HeroToken_EnbedSuccessMsg = {
		[1] = 211;
		[2] = {
			[1] = "nSeriesIndex";
			[2] = "nTokenIndex";
		};
	};
	HeroToken_RespondCheckOtherMsg = {
		[1] = 212;
		[2] = {
			[1] = "bAuthority";
			[2] = "sEnbeded";
		};
	};
	HeroToken_SynchronizeMsg = {
		[1] = 213;
		[2] = {
			[1] = "sEnbeded";
		};
	};
	HideAttrViewOtherResultMsg = {
		[1] = 214;
		[2] = {
			[1] = "ActiveLevel";
		};
	};
	InitCommercialActListMsg = {
		[1] = 215;
		[2] = {
			[1] = "List";
		};
	};
	InitErrantMonsterMsg = {
		[1] = 216;
		[2] = {
			[1] = "EndFlag";
			[2] = "MapId";
			[3] = "MonsterInfo";
		};
	};
	IsShowLeaveMsg = {
		[1] = 217;
		[2] = {
		};
	};
	ItemUseTimerBeginMsg = {
		[1] = 218;
		[2] = {
			[1] = "ItemID";
			[2] = "Time";
		};
	};
	KnowPetFailMsg = {
		[1] = 219;
		[2] = {
			[1] = "PetID";
		};
	};
	KungFuExtendBoardcastMsg = {
		[1] = 220;
		[2] = {
			[1] = "Level";
			[2] = "RoleID";
			[3] = "RoleName";
			[4] = "SystemEnum";
		};
	};
	KungFuSys_StudyResultMsg = {
		[1] = 221;
		[2] = {
			[1] = "IsSuc";
			[2] = "StudyKungFuID";
			[3] = "StudyZhaoshiID";
		};
	};
	KungFuSys_SynStudyProcessMsg = {
		[1] = 222;
		[2] = {
			[1] = "StudyProcess";
		};
	};
	KungFuSys_SynTianGuanCiFuMsg = {
		[1] = 223;
		[2] = {
			[1] = "KungFuStudy";
			[2] = "RestTime";
		};
	};
	KungFuSys_ViewOtherResultMsg = {
		[1] = 224;
		[2] = {
			[1] = "IsOK";
			[2] = "StudyProcess";
			[3] = "tCount";
		};
	};
	MallBuyResultMsg = {
		[1] = 225;
		[2] = {
			[1] = "Code";
			[2] = "MallID";
			[3] = "Number";
		};
	};
	MallLimitListMsg = {
		[1] = 226;
		[2] = {
			[1] = "List";
			[2] = "NextLength";
		};
	};
	MarSys_AcceptDivorceResultMsg = {
		[1] = 227;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_AcceptResultMsg = {
		[1] = 228;
		[2] = {
			[1] = "FromRoleID";
			[2] = "FromRoleName";
			[3] = "Reason";
		};
	};
	MarSys_AddLoveResultMsg = {
		[1] = 229;
		[2] = {
			[1] = "AddNum";
		};
	};
	MarSys_AnswerBanquetListMsg = {
		[1] = 230;
		[2] = {
			[1] = "InfoTable";
		};
	};
	MarSys_AnswerMateEquipInfoMsg = {
		[1] = 231;
		[2] = {
			[1] = "AvatarInfoMsg";
			[2] = "EquipInfoMsg";
			[3] = "GuildName";
			[4] = "Prof";
		};
	};
	MarSys_AnswerMateStoneInfoMsg = {
		[1] = 232;
		[2] = {
			[1] = "StoneInfoMsg";
		};
	};
	MarSys_BeAnnoyMsg = {
		[1] = 233;
		[2] = {
		};
	};
	MarSys_BeCompelDivorceToMsg = {
		[1] = 234;
		[2] = {
			[1] = "FormerName";
		};
	};
	MarSys_BeConferDivorceToMsg = {
		[1] = 235;
		[2] = {
		};
	};
	MarSys_BeProposeToMsg = {
		[1] = 236;
		[2] = {
			[1] = "FromInfo";
		};
	};
	MarSys_BroadCastCongratulationMsg = {
		[1] = 237;
		[2] = {
			[1] = "HusbandName";
			[2] = "HusbandRoleID";
			[3] = "MsgTime";
			[4] = "WifeName";
			[5] = "WifeRoleID";
		};
	};
	MarSys_BroadcastEatActionMsg = {
		[1] = 238;
		[2] = {
			[1] = "ActionID";
			[2] = "RoleID";
		};
	};
	MarSys_BuySuccessMsg = {
		[1] = 239;
		[2] = {
			[1] = "NewItemInstID";
		};
	};
	MarSys_CheckProposeConditionResultMsg = {
		[1] = 240;
		[2] = {
			[1] = "Reason";
			[2] = "ToInfo";
		};
	};
	MarSys_DivorceToResultMsg = {
		[1] = 241;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_EatBanquetResultMsg = {
		[1] = 242;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_GetMarryMoneyAnswerMsg = {
		[1] = 243;
		[2] = {
			[1] = "GuestList";
			[2] = "MateRecv";
		};
	};
	MarSys_GiveMarryMoneyResMsg = {
		[1] = 244;
		[2] = {
		};
	};
	MarSys_HoldMarryBanquetAnswerMsg = {
		[1] = 245;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_MarryBanquetOverMsg = {
		[1] = 246;
		[2] = {
		};
	};
	MarSys_NoticeKeepsakeBeChangedMsg = {
		[1] = 247;
		[2] = {
		};
	};
	MarSys_ProposeToResultMsg = {
		[1] = 248;
		[2] = {
			[1] = "IsSuc";
			[2] = "Reason";
			[3] = "ToRoleID";
			[4] = "ToRoleName";
		};
	};
	MarSys_RecvChatMsg = {
		[1] = 249;
		[2] = {
			[1] = "SendTime";
			[2] = "Text";
		};
	};
	MarSys_SendChatResMsg = {
		[1] = 250;
		[2] = {
			[1] = "SendTime";
			[2] = "Text";
		};
	};
	MarSys_ShowEatMarriageBanquetPanelMsg = {
		[1] = 251;
		[2] = {
			[1] = "BanquetLevel";
			[2] = "EatTimes";
			[3] = "Reason";
			[4] = "SelfEatTimes";
		};
	};
	MarSys_ShowGiveMarryMoneyPanelMsg = {
		[1] = 252;
		[2] = {
			[1] = "BanquetInfo";
			[2] = "Error";
		};
	};
	MarSys_SynChatMsg = {
		[1] = 253;
		[2] = {
			[1] = "ChatInfo";
		};
	};
	MarSys_SynMateIsOnlineMsg = {
		[1] = 254;
		[2] = {
			[1] = "Flag";
			[2] = "Notice";
		};
	};
	MarSys_SynchLoveMsg = {
		[1] = 255;
		[2] = {
			[1] = "Love";
		};
	};
	MarSys_SynchronizeMsg = {
		[1] = 256;
		[2] = {
			[1] = "Love";
			[2] = "Married";
			[3] = "MarriedTime";
			[4] = "MateName";
			[5] = "MateRoleID";
		};
	};
	MegaKill_BroadCastAptitudeMsg = {
		[1] = 257;
		[2] = {
			[1] = "PlayerName";
			[2] = "PlayerRoleID";
			[3] = "dwAptitude";
		};
	};
	MegaKill_BroadCastLevelMsg = {
		[1] = 258;
		[2] = {
			[1] = "Level";
			[2] = "PlayerName";
			[3] = "PlayerRoleID";
		};
	};
	MegaKill_BroadCastQualityMsg = {
		[1] = 259;
		[2] = {
			[1] = "PlayerName";
			[2] = "PlayerRoleID";
			[3] = "Quality";
			[4] = "Type";
		};
	};
	MegaKill_RandomAttrResultMsg = {
		[1] = 260;
		[2] = {
			[1] = "Quality";
			[2] = "Type";
			[3] = "Value";
		};
	};
	MegaKill_RefineMsg = {
		[1] = 261;
		[2] = {
			[1] = "ErrorCode";
			[2] = "dwAptitude";
		};
	};
	MegaKill_SynchronizeMsg = {
		[1] = 262;
		[2] = {
			[1] = "Attrs";
			[2] = "BuyNum";
			[3] = "Level";
			[4] = "RandomNum";
			[5] = "SoulNum";
			[6] = "dwAptitude";
		};
	};
	MegaKill_TGCFMsg = {
		[1] = 263;
		[2] = {
			[1] = "Value";
		};
	};
	MegaKill_UplevelResultMsg = {
		[1] = 264;
		[2] = {
			[1] = "IsSuc";
		};
	};
	MegaKill_ViewOtherResultMsg = {
		[1] = 265;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
			[3] = "Suc";
		};
	};
	MonsterAddMonsterMsg = {
		[1] = 266;
		[2] = {
			[1] = "TbMonster";
		};
	};
	MonsterChangeNameMsg = {
		[1] = 267;
		[2] = {
			[1] = "NewName";
			[2] = "ObjID";
		};
	};
	MonsterChangeOwnerMsg = {
		[1] = 268;
		[2] = {
			[1] = "ObjID";
			[2] = "OwnerID";
			[3] = "OwnerType";
		};
	};
	MonsterCompelMoveMsg = {
		[1] = 269;
		[2] = {
			[1] = "ActCount";
			[2] = "Delay";
			[3] = "DwActionId";
			[4] = "DwMonsterObjId";
			[5] = "DwRoleId";
			[6] = "ExecTime";
			[7] = "PosList";
			[8] = "SkillID";
		};
	};
	MonsterDeadEndMsg = {
		[1] = 270;
		[2] = {
			[1] = "MonsterId";
			[2] = "MonsterObjId";
		};
	};
	MonsterDeadMsg = {
		[1] = 271;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "EnemyID";
		};
	};
	MonsterGetMapAllMonsterMsg = {
		[1] = 272;
		[2] = {
			[1] = "Add";
			[2] = "Del";
		};
	};
	MonsterHurtMsg = {
		[1] = 273;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "DwValue";
		};
	};
	MonsterMoveMsg = {
		[1] = 274;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "FDir";
			[3] = "FSpeed";
			[4] = "PosX";
			[5] = "PosY";
		};
	};
	MonsterNoticeMsg = {
		[1] = 275;
		[2] = {
			[1] = "Channel";
			[2] = "FunId";
			[3] = "FunStr";
			[4] = "Str";
			[5] = "System";
		};
	};
	MonsterOnValueChangeMsg = {
		[1] = 276;
		[2] = {
			[1] = "ActCount";
			[2] = "ExecTime";
			[3] = "HPMax";
			[4] = "Hp";
			[5] = "MPMax";
			[6] = "Mp";
			[7] = "ObjMonId";
			[8] = "SkillID";
		};
	};
	MonsterPlayActionMsg = {
		[1] = 277;
		[2] = {
			[1] = "ActCount";
			[2] = "DwActionId";
			[3] = "DwEnemyType";
			[4] = "DwMonsterObjId";
			[5] = "DwRoleId";
			[6] = "ExecTime";
			[7] = "PfxID";
			[8] = "PosX";
			[9] = "PosY";
			[10] = "SkillID";
			[11] = "SzActionName";
		};
	};
	MonsterRemoveMonsterMsg = {
		[1] = 278;
		[2] = {
			[1] = "DwMonsterObjId";
		};
	};
	MonsterRevertMsg = {
		[1] = 279;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "DwValue";
		};
	};
	MonsterSayMsg = {
		[1] = 280;
		[2] = {
			[1] = "ObjId";
			[2] = "Str";
		};
	};
	MonsterSkillActionMsg = {
		[1] = 281;
		[2] = {
			[1] = "ActCount";
			[2] = "Delay";
			[3] = "DwActionId";
			[4] = "DwActionType";
			[5] = "DwEnemyType";
			[6] = "DwMonsterObjId";
			[7] = "DwRoleId";
			[8] = "ExecTime";
			[9] = "PosList";
			[10] = "PosX";
			[11] = "PosY";
			[12] = "SkillID";
		};
	};
	MonsterStopMoveMsg = {
		[1] = 282;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "FDir";
			[3] = "PosX";
			[4] = "PosY";
		};
	};
	MonsterSynchroMsg = {
		[1] = 283;
		[2] = {
			[1] = "Batter";
			[2] = "Boss";
			[3] = "Normal";
		};
	};
	MountSys_BroadCastUpGradeMsg = {
		[1] = 284;
		[2] = {
			[1] = "AfterName";
			[2] = "AfterQuality";
			[3] = "BeforeName";
			[4] = "BeforeQuality";
			[5] = "MountInstID";
			[6] = "PlayerName";
			[7] = "PlayerRoleID";
		};
	};
	MountSys_ChangeRankAddExpBackMsg = {
		[1] = 285;
		[2] = {
			[1] = "AddRankExp";
			[2] = "Rank";
			[3] = "RankExp";
		};
	};
	MountSys_MountAddExpMsg = {
		[1] = 286;
		[2] = {
			[1] = "Exp";
		};
	};
	MountSys_OnCloseMsg = {
		[1] = 287;
		[2] = {
		};
	};
	MountSys_SetEnumIDMsg = {
		[1] = 288;
		[2] = {
			[1] = "EnumID";
			[2] = "MountInstID";
		};
	};
	MountSys_SynTianGuanCiFuMsg = {
		[1] = 289;
		[2] = {
			[1] = "MountUpGrade";
			[2] = "RestTime";
		};
	};
	MountSys_SynchronizeActiveMsg = {
		[1] = 290;
		[2] = {
			[1] = "ActiveMountID";
		};
	};
	MountSys_SynchronizeAllMsg = {
		[1] = 291;
		[2] = {
			[1] = "Info";
		};
	};
	MountSys_SynchronizeChartMsg = {
		[1] = 292;
		[2] = {
			[1] = "Info";
		};
	};
	MountSys_SynchronizeEquipMsg = {
		[1] = 293;
		[2] = {
			[1] = "EquipID";
			[2] = "EquipPos";
			[3] = "MountInstID";
		};
	};
	MountSys_SynchronizeMountInstMsg = {
		[1] = 294;
		[2] = {
			[1] = "NetData";
		};
	};
	MountSys_SynchronizeRideStateMsg = {
		[1] = 295;
		[2] = {
			[1] = "RideState";
		};
	};
	MountSys_UpGradeResultMsg = {
		[1] = 296;
		[2] = {
			[1] = "AddExp";
			[2] = "IsSuc";
			[3] = "MountInstID";
		};
	};
	MountSys_ViewOtherFailMsg = {
		[1] = 297;
		[2] = {
			[1] = "IsOK";
		};
	};
	MountSys_ViewOtherResultMsg = {
		[1] = 298;
		[2] = {
			[1] = "IsOK";
			[2] = "MountList";
			[3] = "Prof";
		};
	};
	MsgExpPresentOpt = {
		[1] = 299;
		[2] = {
			[1] = "Option";
		};
	};
	MsgExpSlotInfoR = {
		[1] = 300;
		[2] = {
			[1] = "Param";
		};
	};
	MsgExpTiquR = {
		[1] = 301;
		[2] = {
			[1] = "Result";
		};
	};
	MsgFriendEvent = {
		[1] = 302;
		[2] = {
			[1] = "Param";
		};
	};
	MsgInviteExp = {
		[1] = 303;
		[2] = {
			[1] = "Param";
		};
	};
	MsgInviteOutOfTime = {
		[1] = 304;
		[2] = {
			[1] = "RoleID";
		};
	};
	MsgInviteSuccess = {
		[1] = 305;
		[2] = {
			[1] = "Param";
		};
	};
	MsgSysInfo = {
		[1] = 306;
		[2] = {
			[1] = "Open";
		};
	};
	NoticeClearCDMsg = {
		[1] = 307;
		[2] = {
			[1] = "CDType";
		};
	};
	NoticeClearContriNumMsg = {
		[1] = 308;
		[2] = {
		};
	};
	NoticeClientClearBuffMsg = {
		[1] = 309;
		[2] = {
		};
	};
	NoticeClientClearMsg = {
		[1] = 310;
		[2] = {
		};
	};
	NoticeClientContriClearMsg = {
		[1] = 311;
		[2] = {
		};
	};
	NoticeClientLeaveFbMsg = {
		[1] = 312;
		[2] = {
			[1] = "CountDownTime";
			[2] = "DuplId";
			[3] = "LeaveFlag";
		};
	};
	NoticeClientShowWndMsg = {
		[1] = 313;
		[2] = {
			[1] = "DuplID";
			[2] = "EnterMode";
			[3] = "Name";
		};
	};
	NoticeDuplFailedMsg = {
		[1] = 314;
		[2] = {
		};
	};
	NoticeDuplWinMsg = {
		[1] = 315;
		[2] = {
		};
	};
	NoticeFailedMonsterMsg = {
		[1] = 316;
		[2] = {
			[1] = "MonsterId";
			[2] = "PlanNum";
		};
	};
	NoticeFlyIconMsg = {
		[1] = 317;
		[2] = {
		};
	};
	NoticePlayerComeBackMsg = {
		[1] = 318;
		[2] = {
			[1] = "Items";
		};
	};
	NoticeShowViewMsg = {
		[1] = 319;
		[2] = {
			[1] = "Result";
		};
	};
	NoticeSystemNoticeIDMsg = {
		[1] = 320;
		[2] = {
			[1] = "Id";
			[2] = "Type";
		};
	};
	NoticeSystemNoticeStrMsg = {
		[1] = 321;
		[2] = {
			[1] = "Str";
			[2] = "Type";
		};
	};
	NotifyEscortInfoMsg = {
		[1] = 322;
		[2] = {
			[1] = "DwQuality";
			[2] = "EscortId";
			[3] = "EscortNum";
			[4] = "Info";
			[5] = "NextRefTime";
			[6] = "RefQualityNum";
			[7] = "ShellEscortNum";
			[8] = "Type";
		};
	};
	NotifyMailOutOfDateMsg = {
		[1] = 323;
		[2] = {
		};
	};
	NpcAddNpcMsg = {
		[1] = 324;
		[2] = {
			[1] = "Info";
		};
	};
	NpcCollectCheckPassMsg = {
		[1] = 325;
		[2] = {
			[1] = "NpcObjId";
			[2] = "PrgTime";
		};
	};
	NpcDelNpcMsg = {
		[1] = 326;
		[2] = {
			[1] = "Info";
		};
	};
	NpcGetMapAllNpcMsg = {
		[1] = 327;
		[2] = {
			[1] = "Info";
		};
	};
	NpcGetTalkPageMsg = {
		[1] = 328;
		[2] = {
			[1] = "DwNpcObjId";
			[2] = "TbTalkPage";
		};
	};
	NpcModiNpcMsg = {
		[1] = 329;
		[2] = {
			[1] = "TbNpcInfo";
		};
	};
	NpcPlayActionMsg = {
		[1] = 330;
		[2] = {
			[1] = "DwActionId";
			[2] = "DwObjId";
		};
	};
	NpcPlayPfxMsg = {
		[1] = 331;
		[2] = {
			[1] = "Last";
			[2] = "PfxId";
			[3] = "PosX";
			[4] = "PosY";
		};
	};
	NpcSetLeaderMsg = {
		[1] = 332;
		[2] = {
			[1] = "Info";
			[2] = "Pos";
		};
	};
	NpcStopPfxMsg = {
		[1] = 333;
		[2] = {
			[1] = "PfxId";
		};
	};
	NpcStoryMsg = {
		[1] = 334;
		[2] = {
			[1] = "StoryID";
		};
	};
	OnAchievementBroadCastMsg = {
		[1] = 335;
		[2] = {
			[1] = "RoleID";
			[2] = "Text";
			[3] = "Time";
		};
	};
	OnAchievementNoticeMsg = {
		[1] = 336;
		[2] = {
			[1] = "StringID";
			[2] = "Type";
		};
	};
	OnActiveMedalMsg = {
		[1] = 337;
		[2] = {
			[1] = "ChgList";
		};
	};
	OnAddEvaluateMsg = {
		[1] = 338;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnAddRoleMsg = {
		[1] = 339;
		[2] = {
			[1] = "BattleInfo";
			[2] = "Info";
			[3] = "PKValue";
			[4] = "PosInfo";
			[5] = "PulseInfo";
			[6] = "VipInfo";
		};
	};
	OnAddShrtuctInfoMsg = {
		[1] = 340;
		[2] = {
			[1] = "ResCode";
		};
	};
	OnAddSkillInfoMsg = {
		[1] = 341;
		[2] = {
			[1] = "SkillInfo";
		};
	};
	OnAddTitleMsg = {
		[1] = 342;
		[2] = {
			[1] = "Title";
		};
	};
	OnAllHideAchievementMsg = {
		[1] = 343;
		[2] = {
			[1] = "tData";
		};
	};
	OnAllianceLeaderEnterGameMsg = {
		[1] = 344;
		[2] = {
			[1] = "Name";
		};
	};
	OnAllianceLeaderEnterMapMsg = {
		[1] = 345;
		[2] = {
			[1] = "Name";
			[2] = "Type";
		};
	};
	OnAllianceLeaderSearchPageMsg = {
		[1] = 346;
		[2] = {
			[1] = "Page";
		};
	};
	OnAmuletIntensifyConfigMsg = {
		[1] = 347;
		[2] = {
			[1] = "Result";
		};
	};
	OnAmuletIntensifyMsg = {
		[1] = 348;
		[2] = {
			[1] = "Result";
		};
	};
	OnAmuletUpgradeMsg = {
		[1] = 349;
		[2] = {
			[1] = "Result";
		};
	};
	OnAuthorityChangeMsg = {
		[1] = 350;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnAuthorityInitMsg = {
		[1] = 351;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnBackForgatherMsg = {
		[1] = 352;
		[2] = {
			[1] = "Result";
		};
	};
	OnBackInfoMsg = {
		[1] = 353;
		[2] = {
			[1] = "Info";
		};
	};
	OnBackTeachingMsg = {
		[1] = 354;
		[2] = {
			[1] = "Result";
		};
	};
	OnBattleNoticeMsg = {
		[1] = 355;
		[2] = {
			[1] = "ActCount";
			[2] = "Crit";
			[3] = "ExecTime";
			[4] = "NoticeType";
			[5] = "RoleID";
			[6] = "RoleType";
			[7] = "SkillID";
			[8] = "UserID";
			[9] = "UserType";
			[10] = "Value";
		};
	};
	OnBeAddedFriendMsg = {
		[1] = 356;
		[2] = {
			[1] = "Msg";
		};
	};
	OnBeLookedNoticeMsg = {
		[1] = 357;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
		};
	};
	OnBeSkillUsedMsg = {
		[1] = 358;
		[2] = {
			[1] = "ActCount";
			[2] = "ActionInfo";
			[3] = "BattleInfo";
			[4] = "ExecTime";
			[5] = "RoleID";
			[6] = "RoleType";
			[7] = "SkillID";
			[8] = "SkipInfo";
		};
	};
	OnBeginCountDownMsg = {
		[1] = 359;
		[2] = {
			[1] = "LengthTime";
			[2] = "MapID";
		};
	};
	OnBuyLuckDrawResultMsg = {
		[1] = 360;
		[2] = {
			[1] = "Code";
		};
	};
	OnCSSvrTimeMsg = {
		[1] = 361;
		[2] = {
			[1] = "DelayTime";
			[2] = "TotalTime";
		};
	};
	OnCancelAddictedStateMsg = {
		[1] = 362;
		[2] = {
		};
	};
	OnChangeIncoIDMsg = {
		[1] = 363;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnChangeLineRtMsg = {
		[1] = 364;
		[2] = {
			[1] = "NewLineID";
			[2] = "ResultCode";
			[3] = "Sign";
		};
	};
	OnChangeMapResultMsg = {
		[1] = 365;
		[2] = {
			[1] = "ResultCode";
		};
	};
	OnChangeMartialInfoMsg = {
		[1] = 366;
		[2] = {
			[1] = "Info";
			[2] = "MartialID";
		};
	};
	OnChangeSitFlagMsg = {
		[1] = 367;
		[2] = {
			[1] = "Code";
		};
	};
	OnChangeSpecialFlagMsg = {
		[1] = 368;
		[2] = {
			[1] = "Code";
		};
	};
	OnChangeTeamIncoIDMsg = {
		[1] = 369;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnChartRefreshMsg = {
		[1] = 370;
		[2] = {
		};
	};
	OnChatSystemErrorMsg = {
		[1] = 371;
		[2] = {
			[1] = "Code1";
			[2] = "Code2";
			[3] = "Error";
			[4] = "Name";
		};
	};
	OnChgSkillKnowledgeMsg = {
		[1] = 372;
		[2] = {
			[1] = "SkillID";
			[2] = "Value";
		};
	};
	OnClearAllInfoMsg = {
		[1] = 373;
		[2] = {
		};
	};
	OnCreateMartialMsg = {
		[1] = 374;
		[2] = {
			[1] = "CreateInfo";
		};
	};
	OnCreateRoleMsg = {
		[1] = 375;
		[2] = {
			[1] = "Info";
		};
	};
	OnCreateRoleRtMsg = {
		[1] = 376;
		[2] = {
			[1] = "ResultCode";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	OnCreateSessionRetMsg = {
		[1] = 377;
		[2] = {
			[1] = "AccountID";
			[2] = "AvoidTime";
			[3] = "AvoidValue";
			[4] = "ClearTime";
			[5] = "ResultCode";
			[6] = "RoleCount";
		};
	};
	OnCrossHolderEnterMapMsg = {
		[1] = 378;
		[2] = {
			[1] = "Name";
			[2] = "Type";
		};
	};
	OnCrossItemPosChgMsg = {
		[1] = 379;
		[2] = {
			[1] = "tInfo";
		};
	};
	OnCrossItemStateChgMsg = {
		[1] = 380;
		[2] = {
			[1] = "State";
		};
	};
	OnCrossMyKillNumMsg = {
		[1] = 381;
		[2] = {
			[1] = "KillAll";
			[2] = "KillCon";
			[3] = "OwnerHonor";
		};
	};
	OnDaTanMsg = {
		[1] = 382;
		[2] = {
			[1] = "Msg";
		};
	};
	OnDataMsg = {
		[1] = 383;
		[2] = {
			[1] = "tInfo";
		};
	};
	OnDeadBreakComposeMsg = {
		[1] = 384;
		[2] = {
		};
	};
	OnDeadBreakKungFuMsg = {
		[1] = 385;
		[2] = {
		};
	};
	OnDeadBreakRefineMsg = {
		[1] = 386;
		[2] = {
		};
	};
	OnDelShrtuctInfoMsg = {
		[1] = 387;
		[2] = {
			[1] = "ResCode";
		};
	};
	OnDelSkillInfoMsg = {
		[1] = 388;
		[2] = {
			[1] = "SkillID";
		};
	};
	OnDelTitleMsg = {
		[1] = 389;
		[2] = {
			[1] = "Title";
		};
	};
	OnDeleteContactMsg = {
		[1] = 390;
		[2] = {
			[1] = "ID";
		};
	};
	OnDeleteFriendMsg = {
		[1] = 391;
		[2] = {
			[1] = "ID";
		};
	};
	OnDeleteMartialMsg = {
		[1] = 392;
		[2] = {
			[1] = "MartialID";
		};
	};
	OnDeleteTrophyInfoMsg = {
		[1] = 393;
		[2] = {
		};
	};
	OnDoubleParternMsg = {
		[1] = 394;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnDoubleSitInviteMsg = {
		[1] = 395;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnDoubleSitResutlMsg = {
		[1] = 396;
		[2] = {
			[1] = "Code";
			[2] = "RoleID";
		};
	};
	OnDrawOnlineGiftMsg = {
		[1] = 397;
		[2] = {
			[1] = "Reward";
		};
	};
	OnEndTimeMsg = {
		[1] = 398;
		[2] = {
			[1] = "ID";
		};
	};
	OnEnterGameResultMsg = {
		[1] = 399;
		[2] = {
			[1] = "GameInfo";
			[2] = "ResultCode";
		};
	};
	OnEnterWarMsg = {
		[1] = 400;
		[2] = {
			[1] = "MyHaveLength";
			[2] = "WarID";
			[3] = "WarLastLength";
		};
	};
	OnEquipChangeMsg = {
		[1] = 401;
		[2] = {
			[1] = "EquipInfo";
		};
	};
	OnErrorMsg = {
		[1] = 402;
		[2] = {
			[1] = "Code1";
			[2] = "Code2";
			[3] = "Error";
		};
	};
	OnExecPetSkillResultMsg = {
		[1] = 403;
		[2] = {
			[1] = "ResultCode";
			[2] = "SkillID";
		};
	};
	OnExecSkillResultMsg = {
		[1] = 404;
		[2] = {
			[1] = "ResultCode";
			[2] = "SkillID";
		};
	};
	OnExitWarMsg = {
		[1] = 405;
		[2] = {
			[1] = "WarEnd";
		};
	};
	OnFriendIconNoticeMsg = {
		[1] = 406;
		[2] = {
			[1] = "ID";
		};
	};
	OnFriendSyncMoodMsg = {
		[1] = 407;
		[2] = {
			[1] = "Msg";
		};
	};
	OnFriendSystemErrorMsg = {
		[1] = 408;
		[2] = {
			[1] = "Code1";
			[2] = "Code2";
			[3] = "Error";
		};
	};
	OnFriendSystemIncomeNoticeMsg = {
		[1] = 409;
		[2] = {
			[1] = "ID";
		};
	};
	OnGameLineInfoMsg = {
		[1] = 410;
		[2] = {
			[1] = "InfoSet";
		};
	};
	OnGetAchievementCompareInfoMsg = {
		[1] = 411;
		[2] = {
			[1] = "ContentInfo";
			[2] = "SelfChartNumber";
			[3] = "TitleInfo";
		};
	};
	OnGetAchievementInfoMsg = {
		[1] = 412;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnGetAchievementOtherInfoMsg = {
		[1] = 413;
		[2] = {
			[1] = "TabInfo";
			[2] = "TabRole";
		};
	};
	OnGetAchievementPlayerIDMsg = {
		[1] = 414;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnGetAchievementProgressInfoMsg = {
		[1] = 415;
		[2] = {
			[1] = "AchievementID";
			[2] = "Progress";
		};
	};
	OnGetAchievementStateInfoMsg = {
		[1] = 416;
		[2] = {
			[1] = "AchievementID";
			[2] = "tAchievement";
		};
	};
	OnGetAchievementTipInfoMsg = {
		[1] = 417;
		[2] = {
			[1] = "Flag";
		};
	};
	OnGetAmuletBroadCastMsg = {
		[1] = 418;
		[2] = {
			[1] = "Level";
			[2] = "Name";
			[3] = "Rank";
			[4] = "RoleID";
			[5] = "Time";
		};
	};
	OnGetAmuletInfoMsg = {
		[1] = 419;
		[2] = {
			[1] = "bHavePower";
			[2] = "dwAmuletInlayLevel";
			[3] = "dwAptitude";
			[4] = "dwGiftValue";
			[5] = "dwGrowthValue";
			[6] = "dwLevel";
			[7] = "dwRank";
			[8] = "dwRink";
			[9] = "dwRoleID";
		};
	};
	OnGetChartBroadCastMsg = {
		[1] = 420;
		[2] = {
			[1] = "Info";
		};
	};
	OnGetChartEquipInfoMsg = {
		[1] = 421;
		[2] = {
			[1] = "AvatarInfoMsg";
			[2] = "EquipInfoMsg";
			[3] = "RoleID";
		};
	};
	OnGetChartHeadMsg = {
		[1] = 422;
		[2] = {
			[1] = "Chart";
			[2] = "Type";
		};
	};
	OnGetChartListMsg = {
		[1] = 423;
		[2] = {
			[1] = "Chart";
			[2] = "Length";
			[3] = "Type";
		};
	};
	OnGetChartMountInfoMsg = {
		[1] = 424;
		[2] = {
			[1] = "MountInfoMsg";
			[2] = "RoleID";
		};
	};
	OnGetChartRoleMsg = {
		[1] = 425;
		[2] = {
			[1] = "Chart";
			[2] = "RoleID";
		};
	};
	OnGetChartStoneInfoMsg = {
		[1] = 426;
		[2] = {
			[1] = "RoleID";
			[2] = "StoneInfoMsg";
		};
	};
	OnGetEvaluateMsg = {
		[1] = 427;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnGetFinishedNoviceGuideListMsg = {
		[1] = 428;
		[2] = {
			[1] = "GuideList";
		};
	};
	OnGetResultMsg = {
		[1] = 429;
		[2] = {
			[1] = "Code";
			[2] = "Type";
		};
	};
	OnGetServerEventDataMsg = {
		[1] = 430;
		[2] = {
			[1] = "eSeverEventType";
			[2] = "tabData";
		};
	};
	OnGetStarRankingMsg = {
		[1] = 431;
		[2] = {
			[1] = "Chart";
			[2] = "Page";
		};
	};
	OnHidePlayerMsg = {
		[1] = 432;
		[2] = {
			[1] = "List";
		};
	};
	OnHideTitleMsg = {
		[1] = 433;
		[2] = {
			[1] = "Title";
		};
	};
	OnHolderInfoChgMsg = {
		[1] = 434;
		[2] = {
			[1] = "OperateList";
		};
	};
	OnHurtMeMsg = {
		[1] = 435;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleType";
		};
	};
	OnHurtMyPetMsg = {
		[1] = 436;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleType";
		};
	};
	OnInitDataCenterMsg = {
		[1] = 437;
		[2] = {
			[1] = "Data";
		};
	};
	OnInitEvaluateMsg = {
		[1] = 438;
		[2] = {
			[1] = "Info";
		};
	};
	OnInitMedalInfoMsg = {
		[1] = 439;
		[2] = {
			[1] = "List";
			[2] = "PlusPoint";
		};
	};
	OnInitOnlineGiftMsg = {
		[1] = 440;
		[2] = {
			[1] = "Online";
			[2] = "Reward";
		};
	};
	OnInitTitleMsg = {
		[1] = 441;
		[2] = {
			[1] = "Info";
		};
	};
	OnInitViewModelMsg = {
		[1] = 442;
		[2] = {
			[1] = "ModelList";
			[2] = "RoleID";
			[3] = "RoleType";
		};
	};
	OnInitViewPfxMsg = {
		[1] = 443;
		[2] = {
			[1] = "PfxList";
			[2] = "RoleID";
		};
	};
	OnInitializeFriendMsg = {
		[1] = 444;
		[2] = {
			[1] = "Friends";
		};
	};
	OnInitializeMsgEndMsg = {
		[1] = 445;
		[2] = {
		};
	};
	OnInjectResultMsg = {
		[1] = 446;
		[2] = {
			[1] = "SuccFlag";
			[2] = "Value";
		};
	};
	OnItemOprateMsg = {
		[1] = 447;
		[2] = {
			[1] = "OperateList";
		};
	};
	OnItemUseResultMsg = {
		[1] = 448;
		[2] = {
			[1] = "Code";
			[2] = "ItemID";
		};
	};
	OnKillEnmityMsg = {
		[1] = 449;
		[2] = {
			[1] = "EnmityName";
		};
	};
	OnLoadAttrInfoMsg = {
		[1] = 450;
		[2] = {
			[1] = "InfoTable";
			[2] = "IsInit";
			[3] = "StrType";
		};
	};
	OnLoadErrantHonorAllMsg = {
		[1] = 451;
		[2] = {
			[1] = "BFlag";
			[2] = "ErrantNum";
			[3] = "Info";
		};
	};
	OnLoadLuckDrawListMsg = {
		[1] = 452;
		[2] = {
			[1] = "List";
		};
	};
	OnMartialHarvestMsg = {
		[1] = 453;
		[2] = {
			[1] = "HarvestInfo";
		};
	};
	OnMartialPosMsg = {
		[1] = 454;
		[2] = {
			[1] = "FreePosTable";
			[2] = "MartialID";
		};
	};
	OnMartialSplPerMsg = {
		[1] = 455;
		[2] = {
			[1] = "SplPerValue";
		};
	};
	OnMartialTickMsg = {
		[1] = 456;
		[2] = {
			[1] = "TickValue";
		};
	};
	OnMeShowInfoMsg = {
		[1] = 457;
		[2] = {
			[1] = "PlayerInfo";
		};
	};
	OnMountChangeMsg = {
		[1] = 458;
		[2] = {
			[1] = "ModelID";
		};
	};
	OnMoveFailMsg = {
		[1] = 459;
		[2] = {
			[1] = "DirValue";
			[2] = "XPos";
			[3] = "YPos";
		};
	};
	OnMoveResultMsg = {
		[1] = 460;
		[2] = {
			[1] = "ResultCode";
		};
	};
	OnMoveStopResultMsg = {
		[1] = 461;
		[2] = {
			[1] = "ResultCode";
		};
	};
	OnMyInjectInfoMsg = {
		[1] = 462;
		[2] = {
			[1] = "BeInjectCount";
			[2] = "GiftCount";
			[3] = "LogList";
		};
	};
	OnMyKillNumMsg = {
		[1] = 463;
		[2] = {
			[1] = "KillAll";
			[2] = "KillCon";
		};
	};
	OnNoviceGuideCommonEventMsg = {
		[1] = 464;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnNoviceGuideLevelEventMsg = {
		[1] = 465;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnNoviceGuideTaskEventMsg = {
		[1] = 466;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnOpenDragonResultMsg = {
		[1] = 467;
		[2] = {
			[1] = "Code";
		};
	};
	OnOpenFlagChangeMsg = {
		[1] = 468;
		[2] = {
			[1] = "Init";
			[2] = "OpenFlag";
			[3] = "SkillID";
		};
	};
	OnOpenHideAchievementMsg = {
		[1] = 469;
		[2] = {
			[1] = "tabData";
		};
	};
	OnOpenTreasrueMapMsg = {
		[1] = 470;
		[2] = {
			[1] = "dwInstID";
			[2] = "dwOnDayUseNum";
			[3] = "szDoodle";
		};
	};
	OnOtherBattleScoreInfoMsg = {
		[1] = 471;
		[2] = {
			[1] = "FromType";
			[2] = "RoleID";
			[3] = "ScoreInfo";
		};
	};
	OnPKValueChangeMsg = {
		[1] = 472;
		[2] = {
			[1] = "PKValue";
			[2] = "RoleID";
		};
	};
	OnPackUpCompleteMsg = {
		[1] = 473;
		[2] = {
			[1] = "Error";
			[2] = "PosType";
		};
	};
	OnPacketUpdateMsg = {
		[1] = 474;
		[2] = {
			[1] = "Result";
		};
	};
	OnPetBattleNoticeMsg = {
		[1] = 475;
		[2] = {
			[1] = "ActCount";
			[2] = "Crit";
			[3] = "ExecTime";
			[4] = "NoticeType";
			[5] = "RoleID";
			[6] = "RoleType";
			[7] = "SkillID";
			[8] = "UserID";
			[9] = "UserType";
			[10] = "Value";
		};
	};
	OnPetBeSkillUsedMsg = {
		[1] = 476;
		[2] = {
			[1] = "ActCount";
			[2] = "ActionInfo";
			[3] = "BattleInfo";
			[4] = "ExecTime";
			[5] = "RoleID";
			[6] = "RoleType";
			[7] = "SkillID";
			[8] = "SkipInfo";
		};
	};
	OnPetBournChangeLineMsg = {
		[1] = 477;
		[2] = {
		};
	};
	OnPetSkillBeginMsg = {
		[1] = 478;
		[2] = {
			[1] = "DirValue";
			[2] = "ParamList";
			[3] = "RoleID";
			[4] = "SkillID";
		};
	};
	OnPlayPfxMsg = {
		[1] = 479;
		[2] = {
			[1] = "ActCount";
			[2] = "ActionID";
			[3] = "BindPos";
			[4] = "ExecTime";
			[5] = "RoleID";
			[6] = "SkillID";
		};
	};
	OnPlaySkillMoveEffectMsg = {
		[1] = 480;
		[2] = {
			[1] = "ActCount";
			[2] = "ActionID";
			[3] = "Delay";
			[4] = "ExecTime";
			[5] = "Index";
			[6] = "PosList";
			[7] = "ShadowID";
			[8] = "SkillID";
			[9] = "StartID";
			[10] = "StartType";
		};
	};
	OnPlaySkillPursueActionMsg = {
		[1] = 481;
		[2] = {
			[1] = "ActCount";
			[2] = "ActionID";
			[3] = "Delay";
			[4] = "ExecTime";
			[5] = "Index";
			[6] = "ShadowID";
			[7] = "SkillID";
			[8] = "StartID";
			[9] = "StartType";
			[10] = "TargetList";
		};
	};
	OnPlaySkillRoleActionMsg = {
		[1] = 482;
		[2] = {
			[1] = "ActCount";
			[2] = "ActionID";
			[3] = "ExecTime";
			[4] = "Index";
			[5] = "RoleID";
			[6] = "RoleType";
			[7] = "ShadowID";
			[8] = "SkillID";
		};
	};
	OnPlaySkillTargetActionMsg = {
		[1] = 483;
		[2] = {
			[1] = "ActCount";
			[2] = "ActionID";
			[3] = "Delay";
			[4] = "ExecTime";
			[5] = "Index";
			[6] = "PosList";
			[7] = "ShadowID";
			[8] = "SkillID";
			[9] = "StartID";
			[10] = "StartType";
		};
	};
	OnPlayerDeadMsg = {
		[1] = 484;
		[2] = {
			[1] = "DeadFlag";
			[2] = "EnemyID";
			[3] = "EnemyType";
		};
	};
	OnPlayerEquipChangeMsg = {
		[1] = 485;
		[2] = {
			[1] = "ItemEnum";
			[2] = "Level";
			[3] = "ModeID";
			[4] = "RoleID";
			[5] = "Type";
		};
	};
	OnPlayerMountChangeMsg = {
		[1] = 486;
		[2] = {
			[1] = "Info";
		};
	};
	OnPlayerMoveEndMsg = {
		[1] = 487;
		[2] = {
			[1] = "DirValue";
			[2] = "RoleID";
			[3] = "XStop";
			[4] = "YStop";
		};
	};
	OnPlayerMoveToMsg = {
		[1] = 488;
		[2] = {
			[1] = "RoleID";
			[2] = "Speed";
			[3] = "UseCanTo";
			[4] = "XDis";
			[5] = "XSrc";
			[6] = "YDis";
			[7] = "YSrc";
		};
	};
	OnPlayerSitListMsg = {
		[1] = 489;
		[2] = {
			[1] = "PlayerList";
		};
	};
	OnPlayerSuitChangeMsg = {
		[1] = 490;
		[2] = {
			[1] = "RoleID";
			[2] = "SuitList";
		};
	};
	OnPlusPointChangeMsg = {
		[1] = 491;
		[2] = {
			[1] = "PlusPoint";
		};
	};
	OnPrizeStateMsg = {
		[1] = 492;
		[2] = {
			[1] = "Reward";
		};
	};
	OnProduceResultMsg = {
		[1] = 493;
		[2] = {
			[1] = "Code";
		};
	};
	OnReadMuseTimeMsg = {
		[1] = 494;
		[2] = {
			[1] = "AddInjectCount";
			[2] = "MuseTime";
		};
	};
	OnReadPKInfoMsg = {
		[1] = 495;
		[2] = {
			[1] = "PKMode";
			[2] = "PkValue";
		};
	};
	OnReadRoleResultMsg = {
		[1] = 496;
		[2] = {
			[1] = "Flag";
			[2] = "Num";
			[3] = "ResultCode";
			[4] = "RoleCount";
		};
	};
	OnReadSkillResultMsg = {
		[1] = 497;
		[2] = {
			[1] = "ResultCode";
			[2] = "SkillInfoSet";
		};
	};
	OnRecSearchPlayerByNameErrorMsg = {
		[1] = 498;
		[2] = {
			[1] = "Name";
		};
	};
	OnRecSearchPlayerByNameListMsg = {
		[1] = 499;
		[2] = {
			[1] = "paramInfo";
		};
	};
	OnReceiveAddictedNoticeMsg = {
		[1] = 500;
		[2] = {
			[1] = "AdultFlag";
			[2] = "GameTime";
			[3] = "Tips";
		};
	};
	OnReceiveCommercialGiftDataMsg = {
		[1] = 501;
		[2] = {
			[1] = "Data";
		};
	};
	OnReceiveGongGaoMsg = {
		[1] = 502;
		[2] = {
			[1] = "Text";
			[2] = "Time";
		};
	};
	OnReceiveGuildActiveMsg = {
		[1] = 503;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildApplyListMsg = {
		[1] = 504;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildDonateListMsg = {
		[1] = 505;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildEscortMsg = {
		[1] = 506;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildInfoListMsg = {
		[1] = 507;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildLogListMsg = {
		[1] = 508;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildMarketMsg = {
		[1] = 509;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildMemberListMsg = {
		[1] = 510;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildResourceMsg = {
		[1] = 511;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildSearchListMsg = {
		[1] = 512;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildTrophyMsg = {
		[1] = 513;
		[2] = {
			[1] = "Info";
		};
	};
	OnReceiveGuildViewMsg = {
		[1] = 514;
		[2] = {
			[1] = "GuildID";
			[2] = "Info";
			[3] = "RoleID";
		};
	};
	OnReceiveKAddictedNoticeMsg = {
		[1] = 515;
		[2] = {
			[1] = "Tips";
		};
	};
	OnReceiveMsg = {
		[1] = 516;
		[2] = {
			[1] = "Msg";
		};
	};
	OnReceiveMsgListMsg = {
		[1] = 517;
		[2] = {
			[1] = "MsgList";
		};
	};
	OnRecvLeaderInfoMsg = {
		[1] = 518;
		[2] = {
			[1] = "Info";
		};
	};
	OnRecvLeaderSetMsg = {
		[1] = 519;
		[2] = {
			[1] = "Before";
			[2] = "Name";
			[3] = "Type";
		};
	};
	OnRecvLeaderSetResMsg = {
		[1] = 520;
		[2] = {
			[1] = "Res";
		};
	};
	OnRefreshLuckDrawResultMsg = {
		[1] = 521;
		[2] = {
			[1] = "Code";
		};
	};
	OnRefreshNumberMsg = {
		[1] = 522;
		[2] = {
			[1] = "Number";
		};
	};
	OnRequestEnemyIDMsg = {
		[1] = 523;
		[2] = {
			[1] = "Msgs";
			[2] = "RoleID";
		};
	};
	OnRequestEnemyMsg = {
		[1] = 524;
		[2] = {
			[1] = "Msgs";
			[2] = "RoleID";
		};
	};
	OnRequestFriendMsg = {
		[1] = 525;
		[2] = {
			[1] = "Contacts";
			[2] = "Friends";
		};
	};
	OnRequestGetItemMsg = {
		[1] = 526;
		[2] = {
			[1] = "MailID";
		};
	};
	OnRequestGroupItemMsg = {
		[1] = 527;
		[2] = {
			[1] = "ItemGroup";
		};
	};
	OnRequestItemBeginMsg = {
		[1] = 528;
		[2] = {
			[1] = "HolderInfo";
		};
	};
	OnRequestItemEndMsg = {
		[1] = 529;
		[2] = {
		};
	};
	OnRequestMailMsg = {
		[1] = 530;
		[2] = {
			[1] = "Mails";
			[2] = "Notify";
			[3] = "Total";
			[4] = "TotalRead";
		};
	};
	OnRequestPlayerMsg = {
		[1] = 531;
		[2] = {
			[1] = "PlayerData";
		};
	};
	OnRequestPlayerStoneMsg = {
		[1] = 532;
		[2] = {
			[1] = "RoleID";
			[2] = "StoneInfo";
		};
	};
	OnRequestPlayerZhanMsg = {
		[1] = 533;
		[2] = {
			[1] = "dwProf";
			[2] = "dwRoleID";
			[3] = "zhanMsg";
		};
	};
	OnRequestSameEnemyMsg = {
		[1] = 534;
		[2] = {
			[1] = "Msgs";
		};
	};
	OnRequestSearchMsg = {
		[1] = 535;
		[2] = {
			[1] = "Msg";
			[2] = "Page";
		};
	};
	OnRequestSearchNumberMsg = {
		[1] = 536;
		[2] = {
			[1] = "TotalCount";
			[2] = "TotalPage";
		};
	};
	OnRequestSettingMsg = {
		[1] = 537;
		[2] = {
			[1] = "Setting";
		};
	};
	OnRequestWantFriendMsg = {
		[1] = 538;
		[2] = {
			[1] = "Msgs";
		};
	};
	OnRequestWantMarryMsg = {
		[1] = 539;
		[2] = {
			[1] = "Msgs";
			[2] = "Sex";
		};
	};
	OnResetOnlineGiftMsg = {
		[1] = 540;
		[2] = {
		};
	};
	OnRoleAddViewModelMsg = {
		[1] = 541;
		[2] = {
			[1] = "ModelCfg";
			[2] = "RoleID";
			[3] = "RoleType";
		};
	};
	OnRoleAddViewPfxMsg = {
		[1] = 542;
		[2] = {
			[1] = "PfxCfg";
			[2] = "RoleID";
			[3] = "RoleType";
		};
	};
	OnRoleAttrChangeMsg = {
		[1] = 543;
		[2] = {
			[1] = "ChangeTable";
			[2] = "StrType";
		};
	};
	OnRoleBattleInfoMsg = {
		[1] = 544;
		[2] = {
			[1] = "ActCount";
			[2] = "ChangeTable";
			[3] = "ExecTime";
			[4] = "RoleID";
			[5] = "SkillID";
		};
	};
	OnRoleCompleteButtonMsg = {
		[1] = 545;
		[2] = {
			[1] = "ButtonIndex";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	OnRoleExitMartialMsg = {
		[1] = 546;
		[2] = {
			[1] = "Index";
			[2] = "MartialID";
			[3] = "RoleID";
		};
	};
	OnRoleInfoCompleteMsg = {
		[1] = 547;
		[2] = {
			[1] = "RoleCount";
		};
	};
	OnRoleJoinMartialMsg = {
		[1] = 548;
		[2] = {
			[1] = "Index";
			[2] = "MartialID";
			[3] = "RoleID";
		};
	};
	OnRoleLevelUpMsg = {
		[1] = 549;
		[2] = {
			[1] = "NewLevel";
			[2] = "RoleID";
		};
	};
	OnRoleListShowInfoMsg = {
		[1] = 550;
		[2] = {
			[1] = "IsDefRole";
			[2] = "RoleListShowInfo";
		};
	};
	OnRoleMuseInfoMsg = {
		[1] = 551;
		[2] = {
			[1] = "AddInjectCount";
			[2] = "InjectCount";
			[3] = "MuseTime";
			[4] = "RoleID";
		};
	};
	OnRoleRmvViewModelMsg = {
		[1] = 552;
		[2] = {
			[1] = "ModelCfg";
			[2] = "RoleID";
			[3] = "RoleType";
		};
	};
	OnRoleRmvViewPfxMsg = {
		[1] = 553;
		[2] = {
			[1] = "PfxCfg";
			[2] = "RoleID";
			[3] = "RoleType";
		};
	};
	OnRoleSkillBeginMsg = {
		[1] = 554;
		[2] = {
			[1] = "ParamList";
			[2] = "RoleID";
			[3] = "SkillID";
		};
	};
	OnRoleSoulInfoMsg = {
		[1] = 555;
		[2] = {
			[1] = "Code";
			[2] = "IsEnd";
			[3] = "RoleID";
			[4] = "SoulList";
		};
	};
	OnSelectLineRtMsg = {
		[1] = 556;
		[2] = {
			[1] = "AccountID";
			[2] = "LineID";
			[3] = "ResultCode";
			[4] = "Sign";
		};
	};
	OnSelectRoleRtMsg = {
		[1] = 557;
		[2] = {
			[1] = "ResultCode";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	OnSelfMartialMsg = {
		[1] = 558;
		[2] = {
			[1] = "MartialID";
			[2] = "SkillID";
		};
	};
	OnServerLoadEndMsg = {
		[1] = 559;
		[2] = {
		};
	};
	OnServerNoticeMsg = {
		[1] = 560;
		[2] = {
			[1] = "WordID";
		};
	};
	OnSetPointModeMsg = {
		[1] = 561;
		[2] = {
			[1] = "Mode";
		};
	};
	OnSettingSystemErrorMsg = {
		[1] = 562;
		[2] = {
			[1] = "Code";
			[2] = "Name";
		};
	};
	OnShortuctInfoMsg = {
		[1] = 563;
		[2] = {
			[1] = "InfoList";
		};
	};
	OnShowTitleMsg = {
		[1] = 564;
		[2] = {
			[1] = "Title";
		};
	};
	OnSitHarvestMsg = {
		[1] = 565;
		[2] = {
			[1] = "Rsl";
		};
	};
	OnSkillAddChangeMsg = {
		[1] = 566;
		[2] = {
			[1] = "SkillList";
		};
	};
	OnSkillAddInitMsg = {
		[1] = 567;
		[2] = {
			[1] = "List";
		};
	};
	OnSoulAutoResultMsg = {
		[1] = 568;
		[2] = {
			[1] = "Code";
			[2] = "HolderType";
			[3] = "IsPickAll";
			[4] = "NewPosInfo";
		};
	};
	OnSoulBreakResultMsg = {
		[1] = 569;
		[2] = {
			[1] = "ChipNumber";
			[2] = "Code";
			[3] = "SoulIDList";
		};
	};
	OnSoulBuyResultMsg = {
		[1] = 570;
		[2] = {
			[1] = "ChipNumber";
			[2] = "Code";
			[3] = "SoulObject";
		};
	};
	OnSoulChangeIndexResultMsg = {
		[1] = 571;
		[2] = {
			[1] = "ChangeIndexCount";
			[2] = "Code";
			[3] = "NewIndex";
		};
	};
	OnSoulEatAllResultMsg = {
		[1] = 572;
		[2] = {
			[1] = "Code";
			[2] = "SoulDlete";
			[3] = "SoulExp";
		};
	};
	OnSoulEatResultMsg = {
		[1] = 573;
		[2] = {
			[1] = "Code";
			[2] = "NewExp";
			[3] = "NewHolder";
			[4] = "NewPos";
			[5] = "SoulChange";
			[6] = "SoulDelete";
		};
	};
	OnSoulHuntResultMsg = {
		[1] = 574;
		[2] = {
			[1] = "Code";
			[2] = "HuntIndex";
			[3] = "SoulObject";
		};
	};
	OnSoulMoveResultMsg = {
		[1] = 575;
		[2] = {
			[1] = "Code";
			[2] = "IsPickAll";
			[3] = "SoulMoveList";
		};
	};
	OnSoulObjectInitMsg = {
		[1] = 576;
		[2] = {
			[1] = "IsEnd";
			[2] = "SoulList";
		};
	};
	OnSoulPacketExtendMsg = {
		[1] = 577;
		[2] = {
			[1] = "Code";
			[2] = "PacketNumber";
		};
	};
	OnSoulSellResultMsg = {
		[1] = 578;
		[2] = {
			[1] = "Code";
			[2] = "SoulList";
		};
	};
	OnSoulSystemInitMsg = {
		[1] = 579;
		[2] = {
			[1] = "ActiveList";
			[2] = "ChangeIndexCount";
			[3] = "ChipNumber";
			[4] = "HuntClickIndex";
			[5] = "PacketNumber";
		};
	};
	OnSpecialFlagChgMsg = {
		[1] = 580;
		[2] = {
			[1] = "Flag";
			[2] = "Length";
		};
	};
	OnSpeedSendMsg = {
		[1] = 581;
		[2] = {
		};
	};
	OnStartTimeMsg = {
		[1] = 582;
		[2] = {
			[1] = "ID";
			[2] = "nTime";
		};
	};
	OnStopPfxMsg = {
		[1] = 583;
		[2] = {
			[1] = "ActionID";
			[2] = "RoleID";
		};
	};
	OnStudySkillResultMsg = {
		[1] = 584;
		[2] = {
			[1] = "LevelUpFlag";
			[2] = "ResultCode";
			[3] = "SkillID";
		};
	};
	OnSucceedAddServerEventMsg = {
		[1] = 585;
		[2] = {
			[1] = "Result";
		};
	};
	OnSuitChangeMsg = {
		[1] = 586;
		[2] = {
			[1] = "SuitList";
		};
	};
	OnSulSuitActiveResultMsg = {
		[1] = 587;
		[2] = {
			[1] = "Code";
			[2] = "Rank";
			[3] = "SuitIDList";
		};
	};
	OnSynCMatrixMethodCurFreeNumMsg = {
		[1] = 588;
		[2] = {
			[1] = "FreeNum";
		};
	};
	OnSynCMatrixMethodDataMsg = {
		[1] = 589;
		[2] = {
			[1] = "ConGoldNum";
			[2] = "ConItemNum";
			[3] = "FreeNum";
			[4] = "StarAddExpNum";
		};
	};
	OnSynCMatrixMethodSuitStarSystemMsg = {
		[1] = 590;
		[2] = {
			[1] = "RoleID";
			[2] = "SuitStar";
			[3] = "tCount";
		};
	};
	OnSynCMatrixMethodSystemMsg = {
		[1] = 591;
		[2] = {
			[1] = "HideStar";
			[2] = "OrdinaryStar";
			[3] = "RoleID";
		};
	};
	OnSynCMatrixMethodSystemSelectedMsg = {
		[1] = 592;
		[2] = {
			[1] = "IsAllSame";
			[2] = "SelectStar";
		};
	};
	OnSynFrenzyHoeDataMsg = {
		[1] = 593;
		[2] = {
			[1] = "Infos";
		};
	};
	OnSynGourdSysHasAutMsg = {
		[1] = 594;
		[2] = {
			[1] = "Param";
		};
	};
	OnSynGourdSystemOtherViewMsg = {
		[1] = 595;
		[2] = {
			[1] = "MendLevel";
			[2] = "RoleID";
			[3] = "nCount";
		};
	};
	OnSynGourdViewItemInfoMsg = {
		[1] = 596;
		[2] = {
			[1] = "Infos";
		};
	};
	OnSynMatrixMethodSysHasAutMsg = {
		[1] = 597;
		[2] = {
			[1] = "Param";
		};
	};
	OnSynMatrixMethodUsedItemMsg = {
		[1] = 598;
		[2] = {
			[1] = "EffectIndex";
			[2] = "StarIndex";
			[3] = "StarTotalExp";
		};
	};
	OnSynPractiseSkillSysHasAutMsg = {
		[1] = 599;
		[2] = {
			[1] = "Param";
		};
	};
	OnSyncDataCenterMsg = {
		[1] = 600;
		[2] = {
			[1] = "Data";
		};
	};
	OnSyncItemMsg = {
		[1] = 601;
		[2] = {
			[1] = "tUpdateList";
		};
	};
	OnSyncLotteryCurDrwaMsg = {
		[1] = 602;
		[2] = {
			[1] = "SetCurDrawInfo";
		};
	};
	OnSyncLotteryLastDrawMsg = {
		[1] = 603;
		[2] = {
			[1] = "SetLastDrawInfo";
		};
	};
	OnSyncLotteryTicketMsg = {
		[1] = 604;
		[2] = {
			[1] = "SetTikcetList";
		};
	};
	OnTitleBroadcastMsg = {
		[1] = 605;
		[2] = {
			[1] = "Name";
			[2] = "Title";
		};
	};
	OnTreasrueMapBroadMsg = {
		[1] = 606;
		[2] = {
			[1] = "Time";
			[2] = "dwRoleID";
			[3] = "szRoleName";
			[4] = "tNoticeItems";
		};
	};
	OnTreasrueMapOnDayUseNumMsg = {
		[1] = 607;
		[2] = {
			[1] = "dwOnDayUseNum";
		};
	};
	OnTreasrueMapRewardMsg = {
		[1] = 608;
		[2] = {
			[1] = "dwElement";
			[2] = "dwExp";
			[3] = "tItems";
		};
	};
	OnTrophyChangeMsg = {
		[1] = 609;
		[2] = {
			[1] = "NewGuildName";
			[2] = "TrophyID";
		};
	};
	OnTrophyHPChgMsg = {
		[1] = 610;
		[2] = {
			[1] = "ChgInfo";
		};
	};
	OnTrophyInitMsg = {
		[1] = 611;
		[2] = {
			[1] = "TrophyList";
		};
	};
	OnUpdateAllTeamScoreMsg = {
		[1] = 612;
		[2] = {
			[1] = "BOver";
			[2] = "Pos";
			[3] = "Score";
			[4] = "TeamId";
		};
	};
	OnUpdateBangPaiMsg = {
		[1] = 613;
		[2] = {
			[1] = "BangPai";
			[2] = "BangPaiID";
			[3] = "RoleID";
		};
	};
	OnUpdateBattleInfoMsg = {
		[1] = 614;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnUpdateContactMsg = {
		[1] = 615;
		[2] = {
			[1] = "Contact";
		};
	};
	OnUpdateEnemyCountMsg = {
		[1] = 616;
		[2] = {
			[1] = "Enemy";
			[2] = "RoleID";
		};
	};
	OnUpdateFriendMsg = {
		[1] = 617;
		[2] = {
			[1] = "Friend";
		};
	};
	OnUpdateKillAllMsg = {
		[1] = 618;
		[2] = {
			[1] = "KillInfo";
		};
	};
	OnUpdateKillConMsg = {
		[1] = 619;
		[2] = {
			[1] = "KillInfo";
		};
	};
	OnUpdateLevelMsg = {
		[1] = 620;
		[2] = {
			[1] = "Level";
			[2] = "RoleID";
		};
	};
	OnUpdateOnLineMsg = {
		[1] = 621;
		[2] = {
			[1] = "OnLine";
			[2] = "RoleID";
		};
	};
	OnUpdateRoleInfoMsg = {
		[1] = 622;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnUpdateRoleMoodMsg = {
		[1] = 623;
		[2] = {
			[1] = "Mood";
		};
	};
	OnUpdateScoreListMsg = {
		[1] = 624;
		[2] = {
			[1] = "List";
		};
	};
	OnUpdateServerEventDataMsg = {
		[1] = 625;
		[2] = {
			[1] = "Result";
		};
	};
	OnUpdateSplMemberMsg = {
		[1] = 626;
		[2] = {
			[1] = "List";
		};
	};
	OnUpdateTanWeiMsg = {
		[1] = 627;
		[2] = {
			[1] = "RoleID";
			[2] = "TanWei";
		};
	};
	OnUpdateVIPMsg = {
		[1] = 628;
		[2] = {
			[1] = "RoleID";
			[2] = "VIP";
		};
	};
	OnUpdateWantMarryStateMsg = {
		[1] = 629;
		[2] = {
			[1] = "Message";
			[2] = "State";
		};
	};
	OnUpdateWarTeamScoreMsg = {
		[1] = 630;
		[2] = {
			[1] = "BOver";
			[2] = "Info";
			[3] = "Pos";
			[4] = "Score";
		};
	};
	OnUpdateYanHuiMsg = {
		[1] = 631;
		[2] = {
			[1] = "RoleID";
			[2] = "YanHui";
		};
	};
	OnWarHarvestMsg = {
		[1] = 632;
		[2] = {
			[1] = "Exp";
			[2] = "Huo";
			[3] = "IsInit";
			[4] = "IsKill";
			[5] = "Jin";
			[6] = "Mu";
			[7] = "Shui";
			[8] = "Tu";
		};
	};
	OnWarLastTimeMsg = {
		[1] = 633;
		[2] = {
			[1] = "TimeLength";
			[2] = "WarID";
		};
	};
	OnWarMyScoreMsg = {
		[1] = 634;
		[2] = {
			[1] = "Score";
		};
	};
	OnWarNoticeMsg = {
		[1] = 635;
		[2] = {
			[1] = "NoticeType";
			[2] = "Param";
			[3] = "StringID";
		};
	};
	OnWarStartFlagMsg = {
		[1] = 636;
		[2] = {
			[1] = "Flag";
			[2] = "WarID";
		};
	};
	OnWarSystemNoticeMsg = {
		[1] = 637;
		[2] = {
			[1] = "Param";
			[2] = "RoleID";
			[3] = "StringID";
		};
	};
	OnWillStartTimeMsg = {
		[1] = 638;
		[2] = {
			[1] = "ID";
			[2] = "nTime";
		};
	};
	OnlineAwardsDeadBreakComposeMsg = {
		[1] = 639;
		[2] = {
		};
	};
	OpenCollectJewelSuccessMsg = {
		[1] = 640;
		[2] = {
			[1] = "CollJewType";
		};
	};
	OpenShakeAwardMsg = {
		[1] = 641;
		[2] = {
			[1] = "InterTime";
			[2] = "ParmaInfo";
		};
	};
	PetAttrChangeMsg = {
		[1] = 642;
		[2] = {
			[1] = "ChgInfo";
			[2] = "PetID";
			[3] = "Type";
		};
	};
	PetBournAddExpMsg = {
		[1] = 643;
		[2] = {
			[1] = "BournExp";
			[2] = "PetID";
		};
	};
	PetBournBoradcastMsg = {
		[1] = 644;
		[2] = {
			[1] = "BournExp";
			[2] = "RoleID";
		};
	};
	PetBournExpMulMsg = {
		[1] = 645;
		[2] = {
			[1] = "ExpMul";
		};
	};
	PetCompelMoveMsg = {
		[1] = 646;
		[2] = {
			[1] = "ActCount";
			[2] = "Delay";
			[3] = "DwActionId";
			[4] = "DwPetRoleId";
			[5] = "DwRoleId";
			[6] = "ExecTime";
			[7] = "PosList";
			[8] = "SkillID";
		};
	};
	PetDeadMsg = {
		[1] = 647;
		[2] = {
			[1] = "EnemyID";
			[2] = "EnemyType";
			[3] = "PetID";
			[4] = "RoleID";
		};
	};
	PetEquipLevelUpMsg = {
		[1] = 648;
		[2] = {
			[1] = "IsSucess";
			[2] = "PetID";
			[3] = "equipLevel";
		};
	};
	PetEquipUpGradeMsg = {
		[1] = 649;
		[2] = {
			[1] = "CurLevel";
			[2] = "EquipType";
			[3] = "PetId";
			[4] = "RoleId";
			[5] = "RoleName";
		};
	};
	PetMapGetAllMsg = {
		[1] = 650;
		[2] = {
			[1] = "Add";
			[2] = "Del";
		};
	};
	PetMapHPChangeMsg = {
		[1] = 651;
		[2] = {
			[1] = "Crit";
			[2] = "CurLevel";
			[3] = "EnemyID";
			[4] = "EnemyType";
			[5] = "HP";
			[6] = "HPMax";
			[7] = "RoleID";
		};
	};
	PetMoveStopMsg = {
		[1] = 652;
		[2] = {
			[1] = "DirValue";
			[2] = "RoleID";
			[3] = "XStop";
			[4] = "YStop";
		};
	};
	PetMoveToMsg = {
		[1] = 653;
		[2] = {
			[1] = "RoleID";
			[2] = "Speed";
			[3] = "XDis";
			[4] = "XSrc";
			[5] = "YDis";
			[6] = "YSrc";
		};
	};
	PetOpenSkillPosMsg = {
		[1] = 654;
		[2] = {
			[1] = "PetEnumID";
			[2] = "PetSkillPosOpenList";
		};
	};
	PetSkill_AddPetSkillByAddPetMsg = {
		[1] = 655;
		[2] = {
			[1] = "SkillID";
			[2] = "SkillLevel";
		};
	};
	PetSkill_BroadCastMsg = {
		[1] = 656;
		[2] = {
			[1] = "PetEnumID";
			[2] = "PetSkillID";
			[3] = "PlayerName";
			[4] = "PlayerRoleID";
		};
	};
	PetSys_BroadCastMsg = {
		[1] = 657;
		[2] = {
			[1] = "PetId";
			[2] = "PlayerName";
			[3] = "PlayerRoleID";
		};
	};
	PetSys_ChangeExpMsg = {
		[1] = 658;
		[2] = {
			[1] = "PetExp";
			[2] = "PetId";
			[3] = "PetLevel";
		};
	};
	PetSys_ViewOtherResultMsg = {
		[1] = 659;
		[2] = {
			[1] = "IsOK";
			[2] = "PetInfo";
		};
	};
	PetWashBoardcastMsg = {
		[1] = 660;
		[2] = {
			[1] = "PetId";
			[2] = "RoleId";
			[3] = "RoleName";
			[4] = "SetAttr";
			[5] = "WashLevel";
		};
	};
	PetWashInfoChangeMsg = {
		[1] = 661;
		[2] = {
			[1] = "PetID";
			[2] = "SetAttr";
			[3] = "SetWashCount";
		};
	};
	PlayerShowTextGetAllNearTextMsg = {
		[1] = 662;
		[2] = {
			[1] = "SendInfo";
		};
	};
	PlayerShowTextGetAllTextMsg = {
		[1] = 663;
		[2] = {
			[1] = "LoverText";
			[2] = "RoleId";
			[3] = "Sp";
			[4] = "Talk";
			[5] = "Title";
		};
	};
	PlayerShowTextUpdateLoverMsg = {
		[1] = 664;
		[2] = {
			[1] = "LoverText";
			[2] = "RoleId";
		};
	};
	PlayerShowTextUpdateSpMsg = {
		[1] = 665;
		[2] = {
			[1] = "RoleId";
			[2] = "SP";
		};
	};
	PlayerShowTextUpdateTalkMsg = {
		[1] = 666;
		[2] = {
			[1] = "RoleId";
			[2] = "Talk";
		};
	};
	PlayerShowTextUpdateTitleMsg = {
		[1] = 667;
		[2] = {
			[1] = "RoleId";
			[2] = "Title";
		};
	};
	PlayerStateMsg = {
		[1] = 668;
		[2] = {
			[1] = "ActionID";
			[2] = "Param";
			[3] = "RoleID";
		};
	};
	PracticeSys_BroadCastMsg = {
		[1] = 669;
		[2] = {
			[1] = "CurLevel";
			[2] = "PlayerName";
			[3] = "PlayerRoleID";
		};
	};
	PracticeSys_UpLevelHideAttrBackMsg = {
		[1] = 670;
		[2] = {
			[1] = "HideAttrLevel";
		};
	};
	PractiseSkillOtherSynMsg = {
		[1] = 671;
		[2] = {
			[1] = "HeadState";
			[2] = "MendValue";
			[3] = "PractiseLevel";
			[4] = "StarLevel";
			[5] = "tCount";
		};
	};
	PractiseSkillSynMsg = {
		[1] = 672;
		[2] = {
			[1] = "HeadState";
			[2] = "MendValue";
			[3] = "PractiseLevel";
			[4] = "StarLevel";
		};
	};
	PropertyScrollBroadCastMsg = {
		[1] = 673;
		[2] = {
			[1] = "IsLuck";
			[2] = "ItemNetData";
			[3] = "RoleID";
			[4] = "RoleName";
		};
	};
	PropertyScrollDisposeMsg = {
		[1] = 674;
		[2] = {
			[1] = "EquipID";
			[2] = "ErrorCode";
			[3] = "IsLuck";
		};
	};
	Qihun_BroadCastMsg = {
		[1] = 675;
		[2] = {
			[1] = "Index";
			[2] = "Name";
			[3] = "RoleID";
		};
	};
	Qihun_SynchronizeAwardsMsg = {
		[1] = 676;
		[2] = {
			[1] = "Awards";
			[2] = "Selects";
			[3] = "Times";
		};
	};
	Qihun_SynchronizeMsg = {
		[1] = 677;
		[2] = {
			[1] = "Awards";
			[2] = "Selects";
			[3] = "Times";
		};
	};
	Qihun_SynchronizeSelectsMsg = {
		[1] = 678;
		[2] = {
			[1] = "AwardType";
			[2] = "Index";
			[3] = "Selects";
		};
	};
	QingYunLingBroadCastMsg = {
		[1] = 679;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "nLadder";
		};
	};
	QingYunLingGetPrizeMsg = {
		[1] = 680;
		[2] = {
			[1] = "bIsGet";
			[2] = "nCount";
		};
	};
	QingYunLingInitMsg = {
		[1] = 681;
		[2] = {
			[1] = "Times";
			[2] = "nCount";
			[3] = "tAll";
			[4] = "tLotteryID";
			[5] = "tShow";
		};
	};
	QingYunLingIsSawByOthersMsg = {
		[1] = 682;
		[2] = {
			[1] = "bIsCan";
			[2] = "tAll";
		};
	};
	QingYunLingLottoryResultMsg = {
		[1] = 683;
		[2] = {
			[1] = "nCount";
			[2] = "tPrize";
		};
	};
	QunXiaExitDuplSuccMsg = {
		[1] = 684;
		[2] = {
		};
	};
	QunXiaLuDaXiaCompeleteMsg = {
		[1] = 685;
		[2] = {
			[1] = "RoleId";
			[2] = "RoleName";
		};
	};
	QunXiaLuFuseBroadcastMsg = {
		[1] = 686;
		[2] = {
			[1] = "CardID";
			[2] = "RoleId";
			[3] = "RoleName";
		};
	};
	QunXiaLuFuseResultMsg = {
		[1] = 687;
		[2] = {
			[1] = "FaliItem";
			[2] = "IsSuccess";
			[3] = "SuccessItem";
		};
	};
	QunXiaLuGroupCompeleteMsg = {
		[1] = 688;
		[2] = {
			[1] = "GroupIndex";
			[2] = "RoleId";
			[3] = "RoleName";
		};
	};
	QunXiaLuHotelRefleshCardMsg = {
		[1] = 689;
		[2] = {
			[1] = "CardId";
			[2] = "RoleId";
			[3] = "RoleName";
		};
	};
	QunXiaSuccessMsg = {
		[1] = 690;
		[2] = {
			[1] = "QunXiaID";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	QunXialuDaXiaSlotChangeMsg = {
		[1] = 691;
		[2] = {
			[1] = "DaXiaIndex";
			[2] = "SlotIndex";
		};
	};
	QunXialuGroupSlotChangeMsg = {
		[1] = 692;
		[2] = {
			[1] = "GroupIndex";
			[2] = "SlotIndex";
		};
	};
	ReFreshMyselfInfoMsg = {
		[1] = 693;
		[2] = {
			[1] = "BaseInfo";
		};
	};
	ReFreshNewRcordInfoMsg = {
		[1] = 694;
		[2] = {
			[1] = "NewRcord";
		};
	};
	ReFreshOthersInfoMsg = {
		[1] = 695;
		[2] = {
			[1] = "ChallengeRoleInfo";
		};
	};
	ReSendEnterCrossMsg = {
		[1] = 696;
		[2] = {
			[1] = "EnterFlag";
		};
	};
	ReSendExpDataMsg = {
		[1] = 697;
		[2] = {
			[1] = "Exp";
			[2] = "Honor";
		};
	};
	Receive360RedJewelMsg = {
		[1] = 698;
		[2] = {
			[1] = "AccountID";
			[2] = "Growth";
			[3] = "IsActive";
			[4] = "Level";
			[5] = "Type";
		};
	};
	ReceivePlayerPracitceInfoMsg = {
		[1] = 699;
		[2] = {
			[1] = "CurActiveLevel";
			[2] = "CurHideAttrLevel";
			[3] = "CurProgress";
			[4] = "IsOK";
			[5] = "nCount";
		};
	};
	RecyclingSystemUpdateMsg = {
		[1] = 700;
		[2] = {
			[1] = "ActivityStatus";
		};
	};
	RepeatTaskUpdateMsg = {
		[1] = 701;
		[2] = {
			[1] = "TaskList";
		};
	};
	ReqShowAwardInfoMsg = {
		[1] = 702;
		[2] = {
			[1] = "DuplId";
			[2] = "LifeTime";
			[3] = "Type";
		};
	};
	ReqShowMsg = {
		[1] = 703;
		[2] = {
		};
	};
	ReqUsePropMsg = {
		[1] = 704;
		[2] = {
			[1] = "DuplId";
		};
	};
	RequestGetShakeAwardsSuccessMsg = {
		[1] = 705;
		[2] = {
			[1] = "UsedNum";
		};
	};
	RequestPetLearnSkillMsg = {
		[1] = 706;
		[2] = {
			[1] = "ErrorCode";
			[2] = "ParamInfo";
		};
	};
	RequestPetSkillAddLockMsg = {
		[1] = 707;
		[2] = {
			[1] = "ErrorCode";
			[2] = "PetEnumID";
			[3] = "SkillPos";
		};
	};
	RequestPetSkillDelLockMsg = {
		[1] = 708;
		[2] = {
			[1] = "ErrorCode";
			[2] = "PetEnumID";
			[3] = "SkillPos";
		};
	};
	RequestPetSkillLevelUpMsg = {
		[1] = 709;
		[2] = {
			[1] = "ErrorCode";
			[2] = "SkillID";
			[3] = "SkillLevel";
		};
	};
	ResDuplRecordInfoMsg = {
		[1] = 710;
		[2] = {
			[1] = "Flag";
			[2] = "RecordInfo";
		};
	};
	ResGetAddiAwardMsg = {
		[1] = 711;
		[2] = {
			[1] = "Flag";
		};
	};
	ResGetPerAwardMsg = {
		[1] = 712;
		[2] = {
		};
	};
	ResSendFbShowMsg = {
		[1] = 713;
		[2] = {
			[1] = "Flag";
			[2] = "JiFenInfo";
			[3] = "RecordInfo";
		};
	};
	ResSendJiFenMsg = {
		[1] = 714;
		[2] = {
			[1] = "DuplId";
			[2] = "EndFlag";
			[3] = "Flag";
			[4] = "JiFenInfo";
		};
	};
	ResetEquipBuildNumMsg = {
		[1] = 715;
		[2] = {
		};
	};
	ResetPetDayInfoMsg = {
		[1] = 716;
		[2] = {
		};
	};
	ResetPracticeMsg = {
		[1] = 717;
		[2] = {
		};
	};
	RespMonsterTimesMsg = {
		[1] = 718;
		[2] = {
			[1] = "MonsterTimes";
		};
	};
	ResponseBuildMsg = {
		[1] = 719;
		[2] = {
			[1] = "Info";
		};
	};
	ResponseReqCrossFailMsg = {
		[1] = 720;
		[2] = {
			[1] = "ResCode";
		};
	};
	ResponseSystemNoticeMsg = {
		[1] = 721;
		[2] = {
			[1] = "ErrorType";
			[2] = "Msg";
			[3] = "Types";
		};
	};
	ResponseUpResultMsg = {
		[1] = 722;
		[2] = {
			[1] = "Flag";
			[2] = "Ladder";
			[3] = "PaiMing";
			[4] = "Result";
		};
	};
	ResultTimeMsg = {
		[1] = 723;
		[2] = {
			[1] = "ReqTime";
			[2] = "ServerTime";
		};
	};
	ResultUseItemOpenDraPulMsg = {
		[1] = 724;
		[2] = {
			[1] = "DraPul";
		};
	};
	ReturnBuffInfoMsg = {
		[1] = 725;
		[2] = {
			[1] = "BuffInfo";
		};
	};
	ReturnDelTimeMsg = {
		[1] = 726;
		[2] = {
			[1] = "Flag";
			[2] = "RoleId";
			[3] = "Times";
		};
	};
	ReturnErrantHonorResMsg = {
		[1] = 727;
		[2] = {
			[1] = "CurActiveLevel";
			[2] = "CurStar";
			[3] = "IsOK";
		};
	};
	ReturnFbBasicInfoMsg = {
		[1] = 728;
		[2] = {
			[1] = "EnterTimesTbl";
			[2] = "FailedBoss";
			[3] = "InfoTbl";
			[4] = "OutLineTbl";
			[5] = "RefedBoss";
		};
	};
	ReturnFbRestInfoMsg = {
		[1] = 729;
		[2] = {
			[1] = "DuplEntityId";
			[2] = "DuplID";
			[3] = "Flag";
		};
	};
	ReturnMountEatZZGMsg = {
		[1] = 730;
		[2] = {
		};
	};
	ReturnNearByPlayerInfoMsg = {
		[1] = 731;
		[2] = {
			[1] = "EndFlag";
			[2] = "PlayerInfo";
		};
	};
	ReturnNearByTeamInfoMsg = {
		[1] = 732;
		[2] = {
			[1] = "EndFlag";
			[2] = "TeamInfo";
		};
	};
	ReturnPinMsg = {
		[1] = 733;
		[2] = {
			[1] = "Flag";
			[2] = "RoleId";
		};
	};
	ReturnRefineMaterialInfoMsg = {
		[1] = 734;
		[2] = {
			[1] = "BackItem";
			[2] = "FailNum";
			[3] = "ItemEnum";
			[4] = "SuccNum";
		};
	};
	ReturnSafeSideInfoMsg = {
		[1] = 735;
		[2] = {
			[1] = "BSafeFlag";
		};
	};
	ReturnStoneComposeInfoMsg = {
		[1] = 736;
		[2] = {
			[1] = "BaoJiTbl";
			[2] = "FailNum";
			[3] = "ItemEnum";
			[4] = "NextEnum";
			[5] = "SuccNum";
		};
	};
	ReturnZLBossMsg = {
		[1] = 737;
		[2] = {
			[1] = "DuplId";
			[2] = "FailedBoss";
			[3] = "RefedBoss";
		};
	};
	RewardCodeOnResMsg = {
		[1] = 738;
		[2] = {
			[1] = "Res";
		};
	};
	ScriptChangeLookMsg = {
		[1] = 739;
		[2] = {
			[1] = "Look";
		};
	};
	ScriptChatNoticeMsg = {
		[1] = 740;
		[2] = {
			[1] = "Channel";
			[2] = "HideHead";
			[3] = "Param";
			[4] = "Str";
			[5] = "Str2";
			[6] = "System";
		};
	};
	ScriptDoClientFunMsg = {
		[1] = 741;
		[2] = {
			[1] = "FunID";
			[2] = "Param";
		};
	};
	ScriptOnChargeMsg = {
		[1] = 742;
		[2] = {
			[1] = "Info";
		};
	};
	ScriptOnRecvSystemNoticeMsg = {
		[1] = 743;
		[2] = {
			[1] = "Str";
		};
	};
	ScriptServerVerSionReplaceMsg = {
		[1] = 744;
		[2] = {
			[1] = "Info";
		};
	};
	ScriptTipNoticeMsg = {
		[1] = 745;
		[2] = {
			[1] = "Link";
			[2] = "Str";
		};
	};
	SearchPrivatePlayerByNameTotalPageMsg = {
		[1] = 746;
		[2] = {
			[1] = "maxpagenum";
		};
	};
	SendAddAptitudeInfoMsg = {
		[1] = 747;
		[2] = {
			[1] = "AddAptitudeValue";
			[2] = "CritType";
			[3] = "DwType";
		};
	};
	SendAddExpByItemMsg = {
		[1] = 748;
		[2] = {
			[1] = "AddExp";
			[2] = "SlotPos";
			[3] = "Type";
		};
	};
	SendAddExpByZQMsg = {
		[1] = 749;
		[2] = {
			[1] = "AddExp";
			[2] = "BlessValue";
			[3] = "CritType";
			[4] = "Num";
			[5] = "SlotPos";
		};
	};
	SendAddPracticeMsg = {
		[1] = 750;
		[2] = {
			[1] = "AddPracticeValue";
			[2] = "CritType";
		};
	};
	SendAddiValueMsg = {
		[1] = 751;
		[2] = {
			[1] = "AllowGetAward";
			[2] = "CurAddiMoney";
			[3] = "NextAddiPhase";
		};
	};
	SendAutoJoinFailMsg = {
		[1] = 752;
		[2] = {
		};
	};
	SendBXItemInfoMsg = {
		[1] = 753;
		[2] = {
			[1] = "TFlyItem";
		};
	};
	SendBuffLifeTimeMsg = {
		[1] = 754;
		[2] = {
			[1] = "BuffId";
			[2] = "BuffType";
			[3] = "ClassId";
			[4] = "EntityId";
			[5] = "LifeTime";
		};
	};
	SendBuildAwardStateMsg = {
		[1] = 755;
		[2] = {
			[1] = "CurBuildPlan";
			[2] = "CurBuildValue";
			[3] = "UpdateFlag";
		};
	};
	SendBuildBXMsg = {
		[1] = 756;
		[2] = {
			[1] = "TFlyItem";
		};
	};
	SendBuildCDTimeMsg = {
		[1] = 757;
		[2] = {
			[1] = "ExpFlag";
			[2] = "LabourCD";
			[3] = "StoneCD";
			[4] = "WoodCD";
		};
	};
	SendCangLongContinueMsg = {
		[1] = 758;
		[2] = {
		};
	};
	SendChestAwardInfoMsg = {
		[1] = 759;
		[2] = {
			[1] = "AwardList";
		};
	};
	SendClearBuffMsg = {
		[1] = 760;
		[2] = {
			[1] = "ClearFlag";
		};
	};
	SendContriNumMsg = {
		[1] = 761;
		[2] = {
			[1] = "AddExp";
			[2] = "ConType";
			[3] = "CurBuildPlan";
		};
	};
	SendContringMsg = {
		[1] = 762;
		[2] = {
		};
	};
	SendCrossLineInfoMsg = {
		[1] = 763;
		[2] = {
			[1] = "Info";
			[2] = "LineId";
		};
	};
	SendCrossOverAwardMsg = {
		[1] = 764;
		[2] = {
			[1] = "Exp";
			[2] = "HoldId";
			[3] = "Honor";
			[4] = "KillNum";
			[5] = "Rank";
		};
	};
	SendCurPlanMsg = {
		[1] = 765;
		[2] = {
			[1] = "ContributeInfo";
			[2] = "CurPlan";
		};
	};
	SendDuplExpMsg = {
		[1] = 766;
		[2] = {
			[1] = "ExpInfo";
		};
	};
	SendDuplMonsterMsg = {
		[1] = 767;
		[2] = {
			[1] = "BossInfo";
			[2] = "MonsterInfo";
		};
	};
	SendDuplRecordChgMsg = {
		[1] = 768;
		[2] = {
			[1] = "DuplId";
			[2] = "IconId";
			[3] = "LifeTime";
			[4] = "RoleId";
			[5] = "RoleName";
		};
	};
	SendEquipInfoMsg = {
		[1] = 769;
		[2] = {
			[1] = "BlessValue";
			[2] = "EquipBuildNum";
			[3] = "EquipInfo";
			[4] = "SuitLevel";
		};
	};
	SendEquipSuitChgMsg = {
		[1] = 770;
		[2] = {
			[1] = "EquipSuitLevel";
		};
	};
	SendErrantAwardMsg = {
		[1] = 771;
		[2] = {
			[1] = "BFlag";
			[2] = "Phase";
		};
	};
	SendErrantHonorValueMsg = {
		[1] = 772;
		[2] = {
			[1] = "ErrantNum";
		};
	};
	SendEscortMsg = {
		[1] = 773;
		[2] = {
			[1] = "AttrTbl";
			[2] = "StringID";
		};
	};
	SendEscortResMsg = {
		[1] = 774;
		[2] = {
			[1] = "DwQuality";
			[2] = "DwType";
			[3] = "Res";
			[4] = "ShellEscort";
		};
	};
	SendExchgResMsg = {
		[1] = 775;
		[2] = {
			[1] = "Res";
		};
	};
	SendExpChangeMsg = {
		[1] = 776;
		[2] = {
			[1] = "Exp";
			[2] = "Flag";
			[3] = "Level";
			[4] = "LevelCurExp";
			[5] = "LevelMaxExp";
			[6] = "MovementExp";
		};
	};
	SendFbOtherAwardMsg = {
		[1] = 777;
		[2] = {
			[1] = "DuplAwardLevel";
			[2] = "DuplAwardList";
			[3] = "DuplId";
			[4] = "DuplLevel";
		};
	};
	SendForbidInfoMsg = {
		[1] = 778;
		[2] = {
			[1] = "ForbidValue";
		};
	};
	SendFullConfigMsg = {
		[1] = 779;
		[2] = {
			[1] = "FullAwardConfig";
			[2] = "FullAwardInfo";
		};
	};
	SendGestInfoMsg = {
		[1] = 780;
		[2] = {
			[1] = "GestLevel";
			[2] = "GestMode";
			[3] = "GestProgress";
			[4] = "RealizeLevel";
		};
	};
	SendGestModeMsg = {
		[1] = 781;
		[2] = {
			[1] = "GestMode";
		};
	};
	SendHitedBossChgMsg = {
		[1] = 782;
		[2] = {
			[1] = "WaveId";
		};
	};
	SendHoldInfoToClientMsg = {
		[1] = 783;
		[2] = {
			[1] = "BroadFlag";
			[2] = "HoldInfo";
			[3] = "OverFlag";
		};
	};
	SendJiFenChgMsg = {
		[1] = 784;
		[2] = {
			[1] = "DwDuplId";
			[2] = "EndFlag";
			[3] = "JiFenInfo";
		};
	};
	SendJiFenMsg = {
		[1] = 785;
		[2] = {
			[1] = "Score";
		};
	};
	SendKickPlayerOutWarMsg = {
		[1] = 786;
		[2] = {
		};
	};
	SendLostEscortMsg = {
		[1] = 787;
		[2] = {
		};
	};
	SendMonsterInfoChgMsg = {
		[1] = 788;
		[2] = {
			[1] = "MapId";
			[2] = "MonsterId";
			[3] = "Value";
		};
	};
	SendNoticeMsg = {
		[1] = 789;
		[2] = {
			[1] = "Msg";
		};
	};
	SendPerValueMsg = {
		[1] = 790;
		[2] = {
			[1] = "AllowGetAward";
			[2] = "CurPerMoney";
			[3] = "NextPerPhase";
		};
	};
	SendPetAptitudeInfoMsg = {
		[1] = 791;
		[2] = {
			[1] = "PetAptitudeInfo";
		};
	};
	SendPetImpartInfoMsg = {
		[1] = 792;
		[2] = {
			[1] = "AllImpart";
			[2] = "DayImpart";
			[3] = "PetId";
		};
	};
	SendPetInstructInfoMsg = {
		[1] = 793;
		[2] = {
			[1] = "Consult";
			[2] = "DayConsult";
			[3] = "PetId";
		};
	};
	SendPetLevelChgMsg = {
		[1] = 794;
		[2] = {
			[1] = "Exp";
			[2] = "Level";
			[3] = "PetId";
		};
	};
	SendPetStateChgMsg = {
		[1] = 795;
		[2] = {
			[1] = "PetId";
			[2] = "State";
		};
	};
	SendPlanFulMsg = {
		[1] = 796;
		[2] = {
			[1] = "PlanLapFulFlag";
		};
	};
	SendPlayerCrossHonorMsg = {
		[1] = 797;
		[2] = {
			[1] = "HonorValue";
		};
	};
	SendPosInfoToClientMsg = {
		[1] = 798;
		[2] = {
			[1] = "Info";
		};
	};
	SendPracticeInfoMsg = {
		[1] = 799;
		[2] = {
			[1] = "CurActiveLevel";
			[2] = "CurHideAttrLevel";
			[3] = "CurProgress";
		};
	};
	SendQunXiaFailAwardMsg = {
		[1] = 800;
		[2] = {
			[1] = "DuplId";
		};
	};
	SendRealizeGestResultMsg = {
		[1] = 801;
		[2] = {
			[1] = "RealizeLevel";
			[2] = "Result";
		};
	};
	SendRebuildValueMsg = {
		[1] = 802;
		[2] = {
			[1] = "GestProgress";
		};
	};
	SendRunEscortMsg = {
		[1] = 803;
		[2] = {
			[1] = "RunFlag";
		};
	};
	SendSuitLevelMsg = {
		[1] = 804;
		[2] = {
			[1] = "Level";
		};
	};
	SendSwordFoundryInfoMsg = {
		[1] = 805;
		[2] = {
			[1] = "Info";
		};
	};
	SendSwordFoundryMarkValueMsg = {
		[1] = 806;
		[2] = {
			[1] = "Value";
		};
	};
	SendSwordGasMsg = {
		[1] = 807;
		[2] = {
			[1] = "AddSwordGas";
			[2] = "PaiMing";
			[3] = "RestTime";
		};
	};
	SendSwordInfoMsg = {
		[1] = 808;
		[2] = {
			[1] = "Ladder";
			[2] = "Level";
			[3] = "PaiMing";
			[4] = "SwordGas";
			[5] = "dwAptitude";
		};
	};
	SendTieBuShanInfoMsg = {
		[1] = 809;
		[2] = {
			[1] = "ForbidValue";
			[2] = "SuitLevel";
			[3] = "TieBuShanExp";
			[4] = "TieBuShanLevel";
		};
	};
	SendTieBuShanUpMsg = {
		[1] = 810;
		[2] = {
			[1] = "TieBuShanExp";
			[2] = "TieBuShanLevel";
		};
	};
	SendTollGateMsg = {
		[1] = 811;
		[2] = {
			[1] = "TollNum";
			[2] = "bIsShow";
		};
	};
	SendWarTeamScoreMsg = {
		[1] = 812;
		[2] = {
			[1] = "Pos";
			[2] = "Score";
		};
	};
	SendZLBossPlanMsg = {
		[1] = 813;
		[2] = {
		};
	};
	SendZLInfoMsg = {
		[1] = 814;
		[2] = {
			[1] = "HitBossInfo";
			[2] = "ZLKingInfo";
		};
	};
	SetEnteredDuplMsg = {
		[1] = 815;
		[2] = {
			[1] = "DuplId";
			[2] = "EnterMode";
		};
	};
	SetSwordFoundryValueSuccMsg = {
		[1] = 816;
		[2] = {
			[1] = "Info";
		};
	};
	ShengHuoLingStateChgMsg = {
		[1] = 817;
		[2] = {
			[1] = "GroupIndex";
			[2] = "Level";
			[3] = "SlotIndex";
		};
	};
	ShengHuoLingSuitBoardcastMsg = {
		[1] = 818;
		[2] = {
			[1] = "GroupIndex";
			[2] = "Level";
			[3] = "RoleId";
			[4] = "RoleName";
		};
	};
	ShengHuoLingSys_ViewOtherResultMsg = {
		[1] = 819;
		[2] = {
			[1] = "IsOK";
			[2] = "setState";
		};
	};
	ShieldAllNoticeMsg = {
		[1] = 820;
		[2] = {
			[1] = "nExp";
			[2] = "playerId";
			[3] = "playerName";
		};
	};
	ShieldLookSyncExpMsg = {
		[1] = 821;
		[2] = {
			[1] = "bAuthority";
			[2] = "nCount";
			[3] = "nExp";
		};
	};
	ShieldSyncExpMsg = {
		[1] = 822;
		[2] = {
			[1] = "bUse";
			[2] = "nExp";
			[3] = "tCount";
		};
	};
	ShowFbSystemMsg = {
		[1] = 823;
		[2] = {
			[1] = "Msg";
		};
	};
	ShowRequestInfoMsg = {
		[1] = 824;
		[2] = {
			[1] = "JoinTeamId";
			[2] = "Name";
			[3] = "RequestType";
			[4] = "RoleId";
		};
	};
	StartCollectJewelSuccessMsg = {
		[1] = 825;
		[2] = {
			[1] = "CollJewType";
			[2] = "CurCollJewNum";
			[3] = "CurCollJewTotalNum";
			[4] = "CurInjectJewelProcess";
			[5] = "IsSys";
		};
	};
	StartShakeAwardSuccessMsg = {
		[1] = 826;
		[2] = {
			[1] = "ParmaInfo";
		};
	};
	StoneSys_BroadCastMsg = {
		[1] = 827;
		[2] = {
			[1] = "Flag";
			[2] = "Info";
			[3] = "NextItemEnum";
			[4] = "PlayerName";
			[5] = "PlayerRoleID";
			[6] = "SuccNum";
		};
	};
	StoneSys_BroadFoundryCastMsg = {
		[1] = 828;
		[2] = {
			[1] = "FoundryNum";
			[2] = "PlayerID";
			[3] = "PlayerName";
			[4] = "WearPos";
		};
	};
	StoneSys_OnAddStoneMsg = {
		[1] = 829;
		[2] = {
		};
	};
	StoneSys_OnDelStoneMsg = {
		[1] = 830;
		[2] = {
		};
	};
	StoneSys_OnStoneFoundryMsg = {
		[1] = 831;
		[2] = {
			[1] = "Info";
		};
	};
	StoneSys_SendStoneExTotalPowerMsg = {
		[1] = 832;
		[2] = {
			[1] = "dwTotalValue";
		};
	};
	StoneSys_ViewOtherResultMsg = {
		[1] = 833;
		[2] = {
			[1] = "FoundryInfo";
			[2] = "IsOK";
		};
	};
	StoryScnStartMsg = {
		[1] = 834;
		[2] = {
			[1] = "StoryId";
		};
	};
	StoryStartMsg = {
		[1] = 835;
		[2] = {
			[1] = "StoryId";
		};
	};
	SwitchNetMsg = {
		[1] = 836;
		[2] = {
			[1] = "IPAddr";
			[2] = "SzSign";
			[3] = "ToLineId";
		};
	};
	SwordFoundryBroadCastMsg = {
		[1] = 837;
		[2] = {
			[1] = "PlayerID";
			[2] = "PlayerName";
			[3] = "StartNum";
		};
	};
	SwordRefineMsg = {
		[1] = 838;
		[2] = {
			[1] = "ErrorCode";
			[2] = "dwAptitude";
		};
	};
	SwordSys_ViewOtherResultMsg = {
		[1] = 839;
		[2] = {
			[1] = "IsOK";
			[2] = "SwordAttr";
		};
	};
	Syn360GameBoxInfoMsg = {
		[1] = 840;
		[2] = {
			[1] = "Res";
		};
	};
	SynActiveHideAttrInfoMsg = {
		[1] = 841;
		[2] = {
			[1] = "ActiveLevel";
		};
	};
	SynBaiduHSLJRewardMsg = {
		[1] = 842;
		[2] = {
			[1] = "Reward";
		};
	};
	SynChallengeCountMsg = {
		[1] = 843;
		[2] = {
			[1] = "CurTotalCount";
			[2] = "MaxTotalCount";
			[3] = "SetQunXiaCount";
		};
	};
	SynChangeCaptainMsg = {
		[1] = 844;
		[2] = {
			[1] = "CaptainInfo";
		};
	};
	SynClearOtherBuffByChgMsg = {
		[1] = 845;
		[2] = {
		};
	};
	SynCreateTeamMsg = {
		[1] = 846;
		[2] = {
			[1] = "Info";
		};
	};
	SynDelEnterTimesMsg = {
		[1] = 847;
		[2] = {
			[1] = "InfoTbl";
		};
	};
	SynDeleteBuffByCengMsg = {
		[1] = 848;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "IsSave";
			[4] = "MinusNum";
		};
	};
	SynDeleteBuffMsg = {
		[1] = 849;
		[2] = {
			[1] = "BuffEntityId";
			[2] = "BuffId";
			[3] = "BuffIsSave";
			[4] = "ClassId";
		};
	};
	SynDeleteTeamMsg = {
		[1] = 850;
		[2] = {
			[1] = "TeamId";
		};
	};
	SynEnterFbInfoMsg = {
		[1] = 851;
		[2] = {
			[1] = "DuplId";
			[2] = "Times";
		};
	};
	SynEscortPosMsg = {
		[1] = 852;
		[2] = {
			[1] = "Hp";
			[2] = "MapId";
			[3] = "MaxHp";
			[4] = "Posx";
			[5] = "Posy";
			[6] = "Quality";
			[7] = "RestTime";
			[8] = "Type";
		};
	};
	SynExpInteMaxLevelMsg = {
		[1] = 853;
		[2] = {
			[1] = "WorldMaxlLevel";
		};
	};
	SynGetEmpriseOrderInfoMsg = {
		[1] = 854;
		[2] = {
			[1] = "GetLevel";
		};
	};
	SynGetRewardInfoMsg = {
		[1] = 855;
		[2] = {
			[1] = "GetInfoTable";
		};
	};
	SynHotelLastTimeMsg = {
		[1] = 856;
		[2] = {
			[1] = "LastTime";
		};
	};
	SynMemberAddInfoMsg = {
		[1] = 857;
		[2] = {
			[1] = "CaptainFlag";
			[2] = "CaptainId";
			[3] = "Level";
			[4] = "MapId";
			[5] = "Name";
			[6] = "Posx";
			[7] = "Posy";
			[8] = "Prof";
			[9] = "RoleId";
			[10] = "TeamId";
		};
	};
	SynMemberDeleteInfoMsg = {
		[1] = 858;
		[2] = {
			[1] = "RoleId";
		};
	};
	SynMonsterTimesMsg = {
		[1] = 859;
		[2] = {
			[1] = "Times";
		};
	};
	SynOnBuffDeleteMsg = {
		[1] = 860;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "Deltype";
			[4] = "EntityId";
		};
	};
	SynOneBuffMsg = {
		[1] = 861;
		[2] = {
			[1] = "BuffEntityId";
			[2] = "BuffId";
			[3] = "BuffLevel";
			[4] = "BuffLifeTime";
			[5] = "BuffTroopNum";
			[6] = "BuffValue";
			[7] = "ForeverFlag";
		};
	};
	SynOneBuffValueMsg = {
		[1] = 862;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "EntityId";
			[4] = "Value";
		};
	};
	SynPetBournInfoMsg = {
		[1] = 863;
		[2] = {
			[1] = "AllPetBournInfo";
		};
	};
	SynPetEquipInfoMsg = {
		[1] = 864;
		[2] = {
			[1] = "AllPetEquipInfo";
		};
	};
	SynPetWashInfoMsg = {
		[1] = 865;
		[2] = {
			[1] = "SetAttr";
			[2] = "SetWashCount";
		};
	};
	SynPlayerBloodToClientMsg = {
		[1] = 866;
		[2] = {
			[1] = "CurrentBlood";
			[2] = "PlayerId";
			[3] = "TotalBlood";
		};
	};
	SynPlayerBuffToClientMsg = {
		[1] = 867;
		[2] = {
			[1] = "BuffId";
			[2] = "PlayerId";
		};
	};
	SynPlayerLevelToClientMsg = {
		[1] = 868;
		[2] = {
			[1] = "HpMax";
			[2] = "Level";
			[3] = "MpMax";
			[4] = "PlayerId";
		};
	};
	SynPlayerMpToClientMsg = {
		[1] = 869;
		[2] = {
			[1] = "CurrentMp";
			[2] = "PlayerId";
			[3] = "TotalMp";
		};
	};
	SynPlayerPosToClientMsg = {
		[1] = 870;
		[2] = {
			[1] = "MapCfgId";
			[2] = "MapId";
			[3] = "PlayerId";
			[4] = "Posx";
			[5] = "Posy";
		};
	};
	SynQunXiaLuDaXiaSlotMsg = {
		[1] = 871;
		[2] = {
			[1] = "setSlotState";
		};
	};
	SynQunXiaLuGroupSlotMsg = {
		[1] = 872;
		[2] = {
			[1] = "setSlotState";
		};
	};
	SynQunXiaLuHotelCardMsg = {
		[1] = 873;
		[2] = {
			[1] = "SetCard";
		};
	};
	SynQunXiaLuHotelCountMsg = {
		[1] = 874;
		[2] = {
			[1] = "GoldCount";
			[2] = "PrestigeCount";
		};
	};
	SynTeamEnounceMsg = {
		[1] = 875;
		[2] = {
			[1] = "TeamEnounce";
		};
	};
	SynTeamModeMsg = {
		[1] = 876;
		[2] = {
			[1] = "TeamMode";
		};
	};
	SynTgValueMsg = {
		[1] = 877;
		[2] = {
			[1] = "RestTime";
			[2] = "Value";
		};
	};
	SynUnionGetRewardInfoMsg = {
		[1] = 878;
		[2] = {
			[1] = "GetInfoTable";
		};
	};
	SynUnionPlatGiftCfgMsg = {
		[1] = 879;
		[2] = {
			[1] = "GiftCfg";
		};
	};
	SynUsePropertyCardStateMsg = {
		[1] = 880;
		[2] = {
			[1] = "UseCardState";
		};
	};
	SyncGoldenBodyAllMsg = {
		[1] = 881;
		[2] = {
			[1] = "CiFu";
			[2] = "Exp";
			[3] = "Practice";
		};
	};
	SyncKillChartListMsg = {
		[1] = 882;
		[2] = {
			[1] = "List";
		};
	};
	SyncKungFuExtendCountMsg = {
		[1] = 883;
		[2] = {
			[1] = "tCount";
		};
	};
	SyncShengHuoLingSetStateMsg = {
		[1] = 884;
		[2] = {
			[1] = "SetState";
		};
	};
	SyncTongTianTowerAllMsg = {
		[1] = 885;
		[2] = {
			[1] = "Info";
		};
	};
	SyncTongTianTowerChartMsg = {
		[1] = 886;
		[2] = {
			[1] = "Chart";
		};
	};
	SyncZhenlongChessPlayerInfoMsg = {
		[1] = 887;
		[2] = {
			[1] = "PlayerInfo";
		};
	};
	SynchronizeCurPetToClientMsg = {
		[1] = 888;
		[2] = {
			[1] = "BaseInfo";
			[2] = "PetSkillInfo";
		};
	};
	SynchronizeDevelopInfoToClientMsg = {
		[1] = 889;
		[2] = {
			[1] = "BOver";
			[2] = "BaseInfo";
			[3] = "BattleInfo";
			[4] = "PetId";
		};
	};
	SynchronizeFPerToClientMsg = {
		[1] = 890;
		[2] = {
			[1] = "Fper";
			[2] = "PetId";
		};
	};
	SynchronizeFounderInfoToClientMsg = {
		[1] = 891;
		[2] = {
			[1] = "Info";
		};
	};
	SynchronizeSkillInfoToClientMsg = {
		[1] = 892;
		[2] = {
			[1] = "BaseInfo";
			[2] = "PetSkillInfo";
		};
	};
	SynchronizeToClientMsg = {
		[1] = 893;
		[2] = {
			[1] = "AwardIndexs";
			[2] = "AwardTypes";
			[3] = "InterTime";
			[4] = "UsedNum";
		};
	};
	TalkSwordAddAttackMsg = {
		[1] = 894;
		[2] = {
			[1] = "Counts";
		};
	};
	TalkSwordAddChallengeCountsMsg = {
		[1] = 895;
		[2] = {
			[1] = "Counts";
		};
	};
	TalkSwordGetPrizeMsg = {
		[1] = 896;
		[2] = {
			[1] = "RewardRank";
			[2] = "RewardState";
		};
	};
	TalkSwordInitMsg = {
		[1] = 897;
		[2] = {
			[1] = "BaseInfo";
			[2] = "ChallengeList";
			[3] = "PrizeInfo";
			[4] = "RecordInfo";
		};
	};
	TalkSwordKillNoticeMsg = {
		[1] = 898;
		[2] = {
			[1] = "NoticeInfo";
		};
	};
	TalkSwordRankNoticeMsg = {
		[1] = 899;
		[2] = {
			[1] = "NoticeInfo";
		};
	};
	TalkSwordReduceCoolingTimeMsg = {
		[1] = 900;
		[2] = {
			[1] = "Success";
		};
	};
	TaskAcceptFailInfoMsg = {
		[1] = 901;
		[2] = {
			[1] = "DwInfoType";
			[2] = "DwTaskId";
		};
	};
	TaskAcceptTaskMsg = {
		[1] = 902;
		[2] = {
			[1] = "TbTask";
		};
	};
	TaskCompleteFailInfoMsg = {
		[1] = 903;
		[2] = {
			[1] = "DwInfoType";
			[2] = "DwTaskId";
		};
	};
	TaskCompleteTaskMsg = {
		[1] = 904;
		[2] = {
			[1] = "DwTaskId";
		};
	};
	TaskDoCmdMsg = {
		[1] = 905;
		[2] = {
			[1] = "Cmd";
		};
	};
	TaskDoffFailInfoMsg = {
		[1] = 906;
		[2] = {
			[1] = "DwInfoType";
			[2] = "DwTaskId";
			[3] = "TextId";
		};
	};
	TaskDoffTaskMsg = {
		[1] = 907;
		[2] = {
			[1] = "DwTaskId";
		};
	};
	TaskErrorMsg = {
		[1] = 908;
		[2] = {
			[1] = "Id";
		};
	};
	TaskGetAcceptInfoMsg = {
		[1] = 909;
		[2] = {
			[1] = "TaskInfo";
		};
	};
	TaskGetCanAcceptInfoMsg = {
		[1] = 910;
		[2] = {
			[1] = "AddTask";
			[2] = "Daily";
			[3] = "DelTask";
			[4] = "NextMain";
			[5] = "Random";
			[6] = "Weekly";
		};
	};
	TaskGetChongFuMsg = {
		[1] = 911;
		[2] = {
			[1] = "ChongFu";
			[2] = "HuoDong";
		};
	};
	TaskGetWeekInfoMsg = {
		[1] = 912;
		[2] = {
			[1] = "Info";
		};
	};
	TaskMaxQualityBroadcastMsg = {
		[1] = 913;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
		};
	};
	TaskUpdateTaskMsg = {
		[1] = 914;
		[2] = {
			[1] = "TbTask";
		};
	};
	TaskWeekCompleteAllMsg = {
		[1] = 915;
		[2] = {
			[1] = "Info";
		};
	};
	TicketBuyResultMsg = {
		[1] = 916;
		[2] = {
			[1] = "Code";
			[2] = "TicketIndex";
		};
	};
	TieBuShanBroadCastMsg = {
		[1] = 917;
		[2] = {
			[1] = "PlayerName";
			[2] = "PlayerRoleID";
			[3] = "TieBuShanLevel";
		};
	};
	TieBuShanSuitBroadCastMsg = {
		[1] = 918;
		[2] = {
			[1] = "PlayerName";
			[2] = "PlayerRoleID";
			[3] = "SuitLevel";
		};
	};
	TieBuShanSys_ViewOtherMsg = {
		[1] = 919;
		[2] = {
			[1] = "Info";
			[2] = "IsOK";
		};
	};
	TongTianTowerBoardcastMsg = {
		[1] = 920;
		[2] = {
			[1] = "Layer";
			[2] = "RoleID";
			[3] = "RoleName";
			[4] = "Type";
		};
	};
	UpdateAutoSettingMsg = {
		[1] = 921;
		[2] = {
			[1] = "Flag";
			[2] = "Info";
		};
	};
	UpdateBuffPropertyMsg = {
		[1] = 922;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "EntityId";
			[4] = "IsSave";
			[5] = "Value";
		};
	};
	UpdatePractiseLevelMsg = {
		[1] = 923;
		[2] = {
			[1] = "ChangeMendValue";
			[2] = "MendValue";
			[3] = "PractiseLevel";
			[4] = "UseItem";
		};
	};
	UpdateSuitStarLevelMsg = {
		[1] = 924;
		[2] = {
			[1] = "StarLevel";
		};
	};
	UseItemAddCanUseNumMsg = {
		[1] = 925;
		[2] = {
			[1] = "CollJewType";
			[2] = "InjectJewelCanUseNum";
		};
	};
	UseItemAddCanUseTotalNumMsg = {
		[1] = 926;
		[2] = {
			[1] = "InjectJewelCanUseTotalNum";
		};
	};
	ViewPetAptitudeInfoMsg = {
		[1] = 927;
		[2] = {
			[1] = "BournLevel";
			[2] = "IsOK";
			[3] = "PetAptitude";
		};
	};
	WarXiaKeDeadListMsg = {
		[1] = 928;
		[2] = {
			[1] = "DeadList";
		};
	};
	ZhanQiJue_BroadcastPhaseMsg = {
		[1] = 929;
		[2] = {
			[1] = "dwRoleId";
			[2] = "nPhase";
			[3] = "sName";
		};
	};
	ZhanQiJue_RespondBlessMsg = {
		[1] = 930;
		[2] = {
			[1] = "bSuccess";
			[2] = "nBlessEXP";
			[3] = "nDelta";
		};
	};
	ZhanQiJue_RespondCheckOtherMsg = {
		[1] = 931;
		[2] = {
			[1] = "nDanIndex";
		};
	};
	ZhanQiJue_RespondPracticeMsg = {
		[1] = 932;
		[2] = {
			[1] = "bBless";
			[2] = "nDeltaBonus";
			[3] = "nDeltaEXP";
			[4] = "nEXP";
		};
	};
	ZhanQiJue_SynchronizeMsg = {
		[1] = 933;
		[2] = {
			[1] = "bBless";
			[2] = "nBlessEXP";
			[3] = "nEXP";
		};
	};
	ZhenlongChessOpenUIMsg = {
		[1] = 934;
		[2] = {
		};
	};
	ZhenlongChessSyncAwardMsg = {
		[1] = 935;
		[2] = {
			[1] = "tabGetAward";
		};
	};
	ZhenlongChessSyncBossCountMsg = {
		[1] = 936;
		[2] = {
			[1] = "setBossCount";
		};
	};
	ZhenlongChessSyncProcessMsg = {
		[1] = 937;
		[2] = {
			[1] = "curProcess";
		};
	};
	ZhenlongChessSyncTotalCountMsg = {
		[1] = 938;
		[2] = {
			[1] = "curTotalCount";
		};
	};
};
