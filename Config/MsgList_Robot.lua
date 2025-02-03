_G.MsgList_Robot =
{
	BRSys_BroadCastMsg = {
		[1] = 1;
		[2] = {
			[1] = "CurPer";
		};
	};
	BanditFailInfoMsg = {
		[1] = 2;
		[2] = {
			[1] = "Id";
		};
	};
	BanditGetItemListMsg = {
		[1] = 3;
		[2] = {
			[1] = "ItemId";
			[2] = "ItemList";
		};
	};
	BanditGetSucMsg = {
		[1] = 4;
		[2] = {
		};
	};
	BanditGetTurnMsg = {
		[1] = 5;
		[2] = {
			[1] = "Pos1";
			[2] = "Pos2";
			[3] = "Pos3";
			[4] = "State";
		};
	};
	BroadBuffActionMsg = {
		[1] = 6;
		[2] = {
			[1] = "BuffTbl";
			[2] = "RoleId";
			[3] = "RoleType";
		};
	};
	BroadcastAddBuffActionMsg = {
		[1] = 7;
		[2] = {
			[1] = "ActionId";
			[2] = "PfxId";
			[3] = "RoleId";
			[4] = "RoleType";
		};
	};
	BroadcastDelBuffActionMsg = {
		[1] = 8;
		[2] = {
			[1] = "ActionId";
			[2] = "PfxId";
			[3] = "RoleId";
			[4] = "RoleType";
		};
	};
	ChangeStateMsg = {
		[1] = 9;
		[2] = {
			[1] = "StateID";
		};
	};
	ChgBuffFrenMsg = {
		[1] = 10;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "EntityId";
			[4] = "Frenquency";
			[5] = "Type";
		};
	};
	ClearFbDelInfoMsg = {
		[1] = 11;
		[2] = {
		};
	};
	ClearFbEnterReqMsg = {
		[1] = 12;
		[2] = {
		};
	};
	ClearLockedMsg = {
		[1] = 13;
		[2] = {
		};
	};
	ClearMyTeamPanelMsg = {
		[1] = 14;
		[2] = {
			[1] = "OldTeamMates";
		};
	};
	ClearQuestFbMsg = {
		[1] = 15;
		[2] = {
		};
	};
	ClientShowBuffIconMsg = {
		[1] = 16;
		[2] = {
			[1] = "BuffEntityId";
			[2] = "BuffFren";
			[3] = "BuffFrenFlag";
			[4] = "BuffId";
			[5] = "BuffLevel";
			[6] = "BuffLifeTime";
			[7] = "BuffTroopNum";
			[8] = "BuffValue";
			[9] = "ForeverFlag";
		};
	};
	CltDecodeMsg = {
		[1] = 17;
		[2] = {
			[1] = "Serial";
			[2] = "Type";
			[3] = "Value";
		};
	};
	CltDecodeVipMsg = {
		[1] = 18;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	CltElemMsg = {
		[1] = 19;
		[2] = {
			[1] = "Param";
			[2] = "Type";
		};
	};
	CltFlushBournMsg = {
		[1] = 20;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "Type";
		};
	};
	CltFlushFiveElemInfoMsg = {
		[1] = 21;
		[2] = {
			[1] = "ElemLv";
			[2] = "ElemName";
		};
	};
	CltFlushGiftInfoMsg = {
		[1] = 22;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltFlushGrowupTargetInfoMsg = {
		[1] = 23;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltFlushMallInfoMsg = {
		[1] = 24;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltFlushMissionDailyInfoMsg = {
		[1] = 25;
		[2] = {
			[1] = "SInfo";
			[2] = "Type";
		};
	};
	CltFlushPulseInfoMsg = {
		[1] = 26;
		[2] = {
			[1] = "Opt";
			[2] = "RoleID";
			[3] = "RoleName";
			[4] = "Type";
		};
	};
	CltFlushVipInfoMsg = {
		[1] = 27;
		[2] = {
			[1] = "Flag";
			[2] = "SInfo";
		};
	};
	CltGrowupTargetMsg = {
		[1] = 28;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	CltInitBournInfoMsg = {
		[1] = 29;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltInitFiveElemInfoMsg = {
		[1] = 30;
		[2] = {
			[1] = "Flag";
			[2] = "SInfo";
		};
	};
	CltInitPulseInfoMsg = {
		[1] = 31;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltMallChangeItemPriceMsg = {
		[1] = 32;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltMallFeedBackMsg = {
		[1] = 33;
		[2] = {
			[1] = "Type";
		};
	};
	CltMallUpDownMsg = {
		[1] = 34;
		[2] = {
			[1] = "SInfo";
		};
	};
	CltMissionDailyMsg = {
		[1] = 35;
		[2] = {
			[1] = "Param";
			[2] = "Type";
		};
	};
	CltNpcShopMsg = {
		[1] = 36;
		[2] = {
			[1] = "Item";
			[2] = "Type";
		};
	};
	CltPlayerShopMsg = {
		[1] = 37;
		[2] = {
			[1] = "ParamInfo";
			[2] = "Type";
		};
	};
	CltTradeMsg = {
		[1] = 38;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "Type";
		};
	};
	CltTradingMsg = {
		[1] = 39;
		[2] = {
			[1] = "Item";
			[2] = "Pos";
			[3] = "Type";
		};
	};
	CltUpdateContinueKillMsg = {
		[1] = 40;
		[2] = {
			[1] = "ContinueKillNum";
			[2] = "ContinueKillTime";
		};
	};
	CollectSendAllMsg = {
		[1] = 41;
		[2] = {
			[1] = "Info";
		};
	};
	CollectSendChangeMsg = {
		[1] = 42;
		[2] = {
			[1] = "Info";
		};
	};
	CollectSendResMsg = {
		[1] = 43;
		[2] = {
			[1] = "Info";
		};
	};
	CreateGameSessionRequestMsg = {
		[1] = 44;
		[2] = {
			[1] = "ResultCode";
		};
	};
	DelLockedTblMsg = {
		[1] = 45;
		[2] = {
			[1] = "RoleId";
		};
	};
	DelRoleMsg = {
		[1] = 46;
		[2] = {
			[1] = "RoleID";
		};
	};
	DeleteBuffByClassMsg = {
		[1] = 47;
		[2] = {
			[1] = "ClassId";
		};
	};
	DropClearRoleIdMsg = {
		[1] = 48;
		[2] = {
			[1] = "DwObjId";
		};
	};
	DropDelItemMsg = {
		[1] = 49;
		[2] = {
			[1] = "DwObjId";
		};
	};
	DropGetAddItemsInfoMsg = {
		[1] = 50;
		[2] = {
			[1] = "ItemInfo";
		};
	};
	DropGetAllItemInfoMsg = {
		[1] = 51;
		[2] = {
			[1] = "Add";
			[2] = "Del";
		};
	};
	DropPickErrorInfoMsg = {
		[1] = 52;
		[2] = {
			[1] = "DwErrorType";
			[2] = "ObjId";
		};
	};
	DropShowItemMsg = {
		[1] = 53;
		[2] = {
			[1] = "TbObj";
		};
	};
	EISys_BroadCastMsg = {
		[1] = 54;
		[2] = {
			[1] = "Info";
			[2] = "ItemNetData";
			[3] = "PlayerName";
			[4] = "PlayerRoleID";
			[5] = "Type";
		};
	};
	EISys_OnAddAppendPropValueMsg = {
		[1] = 55;
		[2] = {
			[1] = "NewProp";
			[2] = "OldProp";
			[3] = "Result";
		};
	};
	EISys_OnAddStoneMsg = {
		[1] = 56;
		[2] = {
		};
	};
	EISys_OnAppendPropMsg = {
		[1] = 57;
		[2] = {
			[1] = "AppendProp";
		};
	};
	EISys_OnCloseMsg = {
		[1] = 58;
		[2] = {
		};
	};
	EISys_OnDelStoneMsg = {
		[1] = 59;
		[2] = {
		};
	};
	EISys_OnIntensifyBornPropMsg = {
		[1] = 60;
		[2] = {
			[1] = "NowPer";
			[2] = "Result";
		};
	};
	EISys_OnIntensifyEquipMsg = {
		[1] = 61;
		[2] = {
			[1] = "AfterStrongLevel";
			[2] = "BeforeStrongLevel";
			[3] = "Result";
		};
	};
	EISys_OnLevelUpEquipMsg = {
		[1] = 62;
		[2] = {
			[1] = "Result";
		};
	};
	EISys_OnResetAppendPropTypeMsg = {
		[1] = 63;
		[2] = {
			[1] = "Type";
		};
	};
	EISys_OnUserChoosePropMsg = {
		[1] = 64;
		[2] = {
		};
	};
	EISys_SynTianGuanCiFuMsg = {
		[1] = 65;
		[2] = {
			[1] = "EquipUpGrade";
		};
	};
	ElemChangeNoticeMsg = {
		[1] = 66;
		[2] = {
			[1] = "Name";
			[2] = "Value";
		};
	};
	EnterDuplMsg = {
		[1] = 67;
		[2] = {
			[1] = "DuplID";
			[2] = "Score";
			[3] = "Time";
			[4] = "ZLDuplInfo";
			[5] = "ZLPlanNum";
		};
	};
	EnterGameServiceResultMsg = {
		[1] = 68;
		[2] = {
			[1] = "ResultCode";
		};
	};
	ExecChangeMapMsg = {
		[1] = 69;
		[2] = {
			[1] = "MapInfo";
		};
	};
	ExitDuplMsg = {
		[1] = 70;
		[2] = {
		};
	};
	FestivalConfigMsg = {
		[1] = 71;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalEndFestivalMsg = {
		[1] = 72;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalEndLineMsg = {
		[1] = 73;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalMyRewardMsg = {
		[1] = 74;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	FestivalNowFestivalMsg = {
		[1] = 75;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalRewardLineMsg = {
		[1] = 76;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalRewardResMsg = {
		[1] = 77;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalRewardResetMsg = {
		[1] = 78;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalStartFestivalMsg = {
		[1] = 79;
		[2] = {
			[1] = "Info";
		};
	};
	FestivalStartLineMsg = {
		[1] = 80;
		[2] = {
			[1] = "Info";
		};
	};
	FlyItemIconToPacketMsg = {
		[1] = 81;
		[2] = {
			[1] = "Items";
		};
	};
	FullAward_BroadCastMsg = {
		[1] = 82;
		[2] = {
			[1] = "PlayerName";
			[2] = "PlayerRoleID";
			[3] = "Str";
		};
	};
	GSAllTimeRewardDataMsg = {
		[1] = 83;
		[2] = {
			[1] = "Data";
		};
	};
	GSTimeRewardOperaResMsg = {
		[1] = 84;
		[2] = {
			[1] = "Data";
			[2] = "Res";
			[3] = "Type";
		};
	};
	GambleGetInfoMsg = {
		[1] = 85;
		[2] = {
			[1] = "Info";
			[2] = "Type";
		};
	};
	GambleGetResMsg = {
		[1] = 86;
		[2] = {
			[1] = "Res";
		};
	};
	IsShowLeaveMsg = {
		[1] = 87;
		[2] = {
		};
	};
	ItemUseTimerBeginMsg = {
		[1] = 88;
		[2] = {
			[1] = "ItemID";
			[2] = "Time";
		};
	};
	MarSys_AcceptDivorceResultMsg = {
		[1] = 89;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_AcceptResultMsg = {
		[1] = 90;
		[2] = {
			[1] = "FromRoleID";
			[2] = "FromRoleName";
			[3] = "Reason";
		};
	};
	MarSys_AddLoveResultMsg = {
		[1] = 91;
		[2] = {
			[1] = "AddNum";
		};
	};
	MarSys_AnswerBanquetListMsg = {
		[1] = 92;
		[2] = {
			[1] = "InfoTable";
		};
	};
	MarSys_AnswerMateEquipInfoMsg = {
		[1] = 93;
		[2] = {
			[1] = "AvatarInfoMsg";
			[2] = "EquipInfoMsg";
			[3] = "GuildName";
		};
	};
	MarSys_BeAnnoyMsg = {
		[1] = 94;
		[2] = {
		};
	};
	MarSys_BeCompelDivorceToMsg = {
		[1] = 95;
		[2] = {
		};
	};
	MarSys_BeConferDivorceToMsg = {
		[1] = 96;
		[2] = {
		};
	};
	MarSys_BeProposeToMsg = {
		[1] = 97;
		[2] = {
			[1] = "FromInfo";
		};
	};
	MarSys_BroadCastCongratulationMsg = {
		[1] = 98;
		[2] = {
			[1] = "HusbandName";
			[2] = "HusbandRoleID";
			[3] = "MsgTime";
			[4] = "WifeName";
			[5] = "WifeRoleID";
		};
	};
	MarSys_BroadcastEatActionMsg = {
		[1] = 99;
		[2] = {
			[1] = "ActionID";
			[2] = "RoleID";
		};
	};
	MarSys_BuySuccessMsg = {
		[1] = 100;
		[2] = {
			[1] = "NewItemInstID";
		};
	};
	MarSys_CheckProposeConditionResultMsg = {
		[1] = 101;
		[2] = {
			[1] = "Reason";
			[2] = "ToInfo";
		};
	};
	MarSys_DivorceToResultMsg = {
		[1] = 102;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_EatBanquetResultMsg = {
		[1] = 103;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_GetMarryMoneyAnswerMsg = {
		[1] = 104;
		[2] = {
			[1] = "GuestList";
			[2] = "MateRecv";
		};
	};
	MarSys_GiveMarryMoneyResMsg = {
		[1] = 105;
		[2] = {
		};
	};
	MarSys_HoldMarryBanquetAnswerMsg = {
		[1] = 106;
		[2] = {
			[1] = "Reason";
		};
	};
	MarSys_NoticeKeepsakeBeChangedMsg = {
		[1] = 107;
		[2] = {
		};
	};
	MarSys_ProposeToResultMsg = {
		[1] = 108;
		[2] = {
			[1] = "Reason";
			[2] = "ToRoleID";
			[3] = "ToRoleName";
		};
	};
	MarSys_RecvChatMsg = {
		[1] = 109;
		[2] = {
			[1] = "SendTime";
			[2] = "Text";
		};
	};
	MarSys_SendChatResMsg = {
		[1] = 110;
		[2] = {
			[1] = "SendTime";
			[2] = "Text";
		};
	};
	MarSys_ShowEatMarriageBanquetPanelMsg = {
		[1] = 111;
		[2] = {
			[1] = "BanquetLevel";
			[2] = "EatTimes";
			[3] = "Reason";
			[4] = "SelfEatTimes";
		};
	};
	MarSys_ShowGiveMarryMoneyPanelMsg = {
		[1] = 112;
		[2] = {
			[1] = "BanquetInfo";
			[2] = "Error";
		};
	};
	MarSys_SynChatMsg = {
		[1] = 113;
		[2] = {
			[1] = "ChatInfo";
		};
	};
	MarSys_SynMateIsOnlineMsg = {
		[1] = 114;
		[2] = {
			[1] = "Flag";
		};
	};
	MarSys_SynchronizeMsg = {
		[1] = 115;
		[2] = {
			[1] = "Married";
			[2] = "MarriedTime";
			[3] = "MateName";
			[4] = "MateRoleID";
		};
	};
	MonsterAddMonsterMsg = {
		[1] = 116;
		[2] = {
			[1] = "TbMonster";
		};
	};
	MonsterCompelMoveMsg = {
		[1] = 117;
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
		[1] = 118;
		[2] = {
			[1] = "MonsterId";
			[2] = "MonsterObjId";
		};
	};
	MonsterDeadMsg = {
		[1] = 119;
		[2] = {
			[1] = "DwMonsterObjId";
		};
	};
	MonsterGetMapAllMonsterMsg = {
		[1] = 120;
		[2] = {
			[1] = "Add";
			[2] = "Del";
		};
	};
	MonsterHurtMsg = {
		[1] = 121;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "DwValue";
		};
	};
	MonsterMoveMsg = {
		[1] = 122;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "FDir";
			[3] = "FSpeed";
			[4] = "PosX";
			[5] = "PosY";
		};
	};
	MonsterNoticeMsg = {
		[1] = 123;
		[2] = {
			[1] = "Channel";
			[2] = "Str";
			[3] = "System";
		};
	};
	MonsterOnValueChangeMsg = {
		[1] = 124;
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
		[1] = 125;
		[2] = {
			[1] = "ActCount";
			[2] = "DwActionId";
			[3] = "DwMonsterObjId";
			[4] = "DwRoleId";
			[5] = "ExecTime";
			[6] = "PfxID";
			[7] = "PosX";
			[8] = "PosY";
			[9] = "SkillID";
			[10] = "SzActionName";
		};
	};
	MonsterRemoveMonsterMsg = {
		[1] = 126;
		[2] = {
			[1] = "DwMonsterObjId";
		};
	};
	MonsterRevertMsg = {
		[1] = 127;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "DwValue";
		};
	};
	MonsterSayMsg = {
		[1] = 128;
		[2] = {
			[1] = "ObjId";
			[2] = "Str";
		};
	};
	MonsterSkillActionMsg = {
		[1] = 129;
		[2] = {
			[1] = "ActCount";
			[2] = "Delay";
			[3] = "DwActionId";
			[4] = "DwActionType";
			[5] = "DwMonsterObjId";
			[6] = "DwRoleId";
			[7] = "ExecTime";
			[8] = "PosList";
			[9] = "PosX";
			[10] = "PosY";
			[11] = "SkillID";
		};
	};
	MonsterStopMoveMsg = {
		[1] = 130;
		[2] = {
			[1] = "DwMonsterObjId";
			[2] = "FDir";
			[3] = "PosX";
			[4] = "PosY";
		};
	};
	MonsterSynchroMsg = {
		[1] = 131;
		[2] = {
			[1] = "Batter";
			[2] = "Boss";
			[3] = "Normal";
		};
	};
	MountSys_BroadCastUpGradeMsg = {
		[1] = 132;
		[2] = {
			[1] = "AfterName";
			[2] = "BeforeName";
			[3] = "MountInstID";
			[4] = "PlayerName";
			[5] = "PlayerRoleID";
		};
	};
	MountSys_BroadCastUpQualityMsg = {
		[1] = 133;
		[2] = {
			[1] = "MountInstID";
			[2] = "MountName";
			[3] = "PlayerName";
			[4] = "PlayerRoleID";
			[5] = "Quality";
		};
	};
	MountSys_MountAddExpMsg = {
		[1] = 134;
		[2] = {
			[1] = "Exp";
		};
	};
	MountSys_OnCloseMsg = {
		[1] = 135;
		[2] = {
		};
	};
	MountSys_SynTianGuanCiFuMsg = {
		[1] = 136;
		[2] = {
			[1] = "MountUpGrade";
		};
	};
	MountSys_SynchronizeAllMsg = {
		[1] = 137;
		[2] = {
			[1] = "Info";
		};
	};
	MountSys_SynchronizeByParamMsg = {
		[1] = 138;
		[2] = {
			[1] = "Info";
		};
	};
	MountSys_SynchronizeChartMsg = {
		[1] = 139;
		[2] = {
			[1] = "Info";
		};
	};
	MountSys_SynchronizeDeleteMountMsg = {
		[1] = 140;
		[2] = {
			[1] = "MountInstID";
		};
	};
	MountSys_SynchronizeMountInstMsg = {
		[1] = 141;
		[2] = {
			[1] = "NetData";
		};
	};
	MountSys_UpAptitudeResultMsg = {
		[1] = 142;
		[2] = {
			[1] = "AddValue";
			[2] = "IsSuc";
			[3] = "MountInstID";
			[4] = "Type";
		};
	};
	MountSys_UpGradeResultMsg = {
		[1] = 143;
		[2] = {
			[1] = "IsSuc";
			[2] = "MountInstID";
		};
	};
	MountSys_UpQualityResultMsg = {
		[1] = 144;
		[2] = {
			[1] = "IsSuc";
			[2] = "MountInstID";
		};
	};
	MountSys_UpSkillResultMsg = {
		[1] = 145;
		[2] = {
			[1] = "IsSuc";
			[2] = "MountInstID";
			[3] = "SkillIndex";
		};
	};
	MountSys_ViewOtherResultMsg = {
		[1] = 146;
		[2] = {
			[1] = "IsOK";
			[2] = "MountList";
		};
	};
	MsgExpPresentOpt = {
		[1] = 147;
		[2] = {
			[1] = "Option";
		};
	};
	MsgExpSlotInfoR = {
		[1] = 148;
		[2] = {
			[1] = "Param";
		};
	};
	MsgExpTiquR = {
		[1] = 149;
		[2] = {
			[1] = "Result";
		};
	};
	MsgFriendEvent = {
		[1] = 150;
		[2] = {
			[1] = "Param";
		};
	};
	MsgInviteExp = {
		[1] = 151;
		[2] = {
			[1] = "Param";
		};
	};
	MsgInviteOutOfTime = {
		[1] = 152;
		[2] = {
			[1] = "RoleID";
		};
	};
	MsgInviteSuccess = {
		[1] = 153;
		[2] = {
			[1] = "Param";
		};
	};
	MsgSysInfo = {
		[1] = 154;
		[2] = {
			[1] = "Open";
		};
	};
	NoticeClearCDMsg = {
		[1] = 155;
		[2] = {
			[1] = "CDType";
		};
	};
	NoticeClearContriNumMsg = {
		[1] = 156;
		[2] = {
		};
	};
	NoticeClientClearBuffMsg = {
		[1] = 157;
		[2] = {
		};
	};
	NoticeClientClearMsg = {
		[1] = 158;
		[2] = {
		};
	};
	NoticeClientContriClearMsg = {
		[1] = 159;
		[2] = {
		};
	};
	NoticeClientLeaveFbMsg = {
		[1] = 160;
		[2] = {
			[1] = "CountDownTime";
			[2] = "DuplId";
			[3] = "LeaveFlag";
		};
	};
	NoticeClientShowWndMsg = {
		[1] = 161;
		[2] = {
			[1] = "DuplID";
			[2] = "Name";
		};
	};
	NoticeDuplFailedMsg = {
		[1] = 162;
		[2] = {
		};
	};
	NoticeDuplWinMsg = {
		[1] = 163;
		[2] = {
		};
	};
	NoticeFailedMonsterMsg = {
		[1] = 164;
		[2] = {
			[1] = "MonsterId";
			[2] = "PlanNum";
		};
	};
	NoticeFlyIconMsg = {
		[1] = 165;
		[2] = {
		};
	};
	NoticeShowViewMsg = {
		[1] = 166;
		[2] = {
			[1] = "Result";
		};
	};
	NoticeStopUpdateMsg = {
		[1] = 167;
		[2] = {
			[1] = "Flag";
		};
	};
	NotifyMailOutOfDateMsg = {
		[1] = 168;
		[2] = {
		};
	};
	NpcAddNpcMsg = {
		[1] = 169;
		[2] = {
			[1] = "Info";
		};
	};
	NpcCollectCheckPassMsg = {
		[1] = 170;
		[2] = {
			[1] = "NpcObjId";
			[2] = "PrgTime";
		};
	};
	NpcCollectFailINfoMsg = {
		[1] = 171;
		[2] = {
			[1] = "FailId";
		};
	};
	NpcDelNpcMsg = {
		[1] = 172;
		[2] = {
			[1] = "Info";
		};
	};
	NpcGetMapAllNpcMsg = {
		[1] = 173;
		[2] = {
			[1] = "Info";
		};
	};
	NpcGetTalkPageMsg = {
		[1] = 174;
		[2] = {
			[1] = "DwNpcObjId";
			[2] = "TbTalkPage";
		};
	};
	NpcModiNpcMsg = {
		[1] = 175;
		[2] = {
			[1] = "TbNpcInfo";
		};
	};
	NpcPlayActionMsg = {
		[1] = 176;
		[2] = {
			[1] = "DwActionId";
			[2] = "DwObjId";
		};
	};
	NpcPlayPfxMsg = {
		[1] = 177;
		[2] = {
			[1] = "Last";
			[2] = "PfxId";
			[3] = "PosX";
			[4] = "PosY";
		};
	};
	NpcSetLeaderMsg = {
		[1] = 178;
		[2] = {
			[1] = "Info";
			[2] = "Pos";
		};
	};
	NpcStopPfxMsg = {
		[1] = 179;
		[2] = {
			[1] = "PfxId";
		};
	};
	NpcStoryMsg = {
		[1] = 180;
		[2] = {
			[1] = "StoryID";
		};
	};
	OnAchievementBroadCastMsg = {
		[1] = 181;
		[2] = {
			[1] = "RoleID";
			[2] = "Text";
			[3] = "Time";
		};
	};
	OnAddEvaluateMsg = {
		[1] = 182;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnAddRoleListMsg = {
		[1] = 183;
		[2] = {
			[1] = "List";
		};
	};
	OnAddRoleMsg = {
		[1] = 184;
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
		[1] = 185;
		[2] = {
			[1] = "ResCode";
		};
	};
	OnAddSkillInfoMsg = {
		[1] = 186;
		[2] = {
			[1] = "SkillInfo";
		};
	};
	OnAllHideAchievementMsg = {
		[1] = 187;
		[2] = {
			[1] = "tData";
		};
	};
	OnAuthorityChangeMsg = {
		[1] = 188;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnAuthorityInitMsg = {
		[1] = 189;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnBattleNoticeMsg = {
		[1] = 190;
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
		[1] = 191;
		[2] = {
			[1] = "Msg";
		};
	};
	OnBeSkillUsedMsg = {
		[1] = 192;
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
		[1] = 193;
		[2] = {
			[1] = "LengthTime";
			[2] = "MapID";
		};
	};
	OnCancelAddictedStateMsg = {
		[1] = 194;
		[2] = {
		};
	};
	OnChangeLineRtMsg = {
		[1] = 195;
		[2] = {
			[1] = "NewLineID";
			[2] = "Port";
			[3] = "ResultCode";
			[4] = "Sign";
		};
	};
	OnChangeMapResultMsg = {
		[1] = 196;
		[2] = {
			[1] = "ResultCode";
		};
	};
	OnChangeMartialInfoMsg = {
		[1] = 197;
		[2] = {
			[1] = "Info";
			[2] = "MartialID";
		};
	};
	OnChangeSitFlagMsg = {
		[1] = 198;
		[2] = {
			[1] = "Code";
		};
	};
	OnChangeSpecialFlagMsg = {
		[1] = 199;
		[2] = {
			[1] = "Code";
		};
	};
	OnChartRefreshMsg = {
		[1] = 200;
		[2] = {
		};
	};
	OnChatSystemErrorMsg = {
		[1] = 201;
		[2] = {
			[1] = "Code1";
			[2] = "Code2";
			[3] = "Error";
			[4] = "Name";
		};
	};
	OnCheckAchievementPlayerMsg = {
		[1] = 202;
		[2] = {
			[1] = "Oper";
			[2] = "Result";
			[3] = "RoleID";
		};
	};
	OnChgSkillKnowledgeMsg = {
		[1] = 203;
		[2] = {
			[1] = "SkillID";
			[2] = "Value";
		};
	};
	OnCreateMartialMsg = {
		[1] = 204;
		[2] = {
			[1] = "CreateInfo";
		};
	};
	OnCreateRoleMsg = {
		[1] = 205;
		[2] = {
			[1] = "Info";
		};
	};
	OnCreateRoleRtMsg = {
		[1] = 206;
		[2] = {
			[1] = "ResultCode";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	OnCreateSessionRetMsg = {
		[1] = 207;
		[2] = {
			[1] = "AccountID";
			[2] = "AvoidTime";
			[3] = "AvoidValue";
			[4] = "ClearTime";
			[5] = "ResultCode";
			[6] = "RoleCount";
		};
	};
	OnDaTanMsg = {
		[1] = 208;
		[2] = {
			[1] = "Msg";
		};
	};
	OnDeadBreakComposeMsg = {
		[1] = 209;
		[2] = {
		};
	};
	OnDelRoleListMsg = {
		[1] = 210;
		[2] = {
			[1] = "List";
		};
	};
	OnDelShrtuctInfoMsg = {
		[1] = 211;
		[2] = {
			[1] = "ResCode";
		};
	};
	OnDelSkillInfoMsg = {
		[1] = 212;
		[2] = {
			[1] = "SkillID";
		};
	};
	OnDeleteContactMsg = {
		[1] = 213;
		[2] = {
			[1] = "ID";
		};
	};
	OnDeleteFriendMsg = {
		[1] = 214;
		[2] = {
			[1] = "ID";
		};
	};
	OnDeleteMartialMsg = {
		[1] = 215;
		[2] = {
			[1] = "MartialID";
		};
	};
	OnDeleteTrophyInfoMsg = {
		[1] = 216;
		[2] = {
		};
	};
	OnDoubleParternMsg = {
		[1] = 217;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnDoubleSitInviteMsg = {
		[1] = 218;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnDoubleSitResutlMsg = {
		[1] = 219;
		[2] = {
			[1] = "Code";
			[2] = "RoleID";
		};
	};
	OnEndTimeMsg = {
		[1] = 220;
		[2] = {
			[1] = "ID";
		};
	};
	OnEnterGameResultMsg = {
		[1] = 221;
		[2] = {
			[1] = "GameInfo";
			[2] = "ResultCode";
		};
	};
	OnEnterWarMsg = {
		[1] = 222;
		[2] = {
			[1] = "Length";
			[2] = "WarID";
		};
	};
	OnEquipChangeMsg = {
		[1] = 223;
		[2] = {
			[1] = "EquipInfo";
		};
	};
	OnErrorMsg = {
		[1] = 224;
		[2] = {
			[1] = "Code1";
			[2] = "Code2";
			[3] = "Error";
		};
	};
	OnExecSkillResultMsg = {
		[1] = 225;
		[2] = {
			[1] = "ResultCode";
			[2] = "SkillID";
		};
	};
	OnExitWarMsg = {
		[1] = 226;
		[2] = {
		};
	};
	OnFriendIconNoticeMsg = {
		[1] = 227;
		[2] = {
			[1] = "ID";
		};
	};
	OnFriendSyncMoodMsg = {
		[1] = 228;
		[2] = {
			[1] = "Msg";
		};
	};
	OnFriendSystemErrorMsg = {
		[1] = 229;
		[2] = {
			[1] = "Code1";
			[2] = "Code2";
			[3] = "Error";
		};
	};
	OnFriendSystemIncomeNoticeMsg = {
		[1] = 230;
		[2] = {
			[1] = "ID";
		};
	};
	OnGameLineInfoMsg = {
		[1] = 231;
		[2] = {
			[1] = "InfoSet";
		};
	};
	OnGetAchievementCompareInfoMsg = {
		[1] = 232;
		[2] = {
			[1] = "TabResInfo";
			[2] = "TabResRole";
			[3] = "TabTarInfo";
			[4] = "TabTarRole";
		};
	};
	OnGetAchievementInfoMsg = {
		[1] = 233;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnGetAchievementOtherInfoMsg = {
		[1] = 234;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "TabInfo";
		};
	};
	OnGetAchievementPlayerIDMsg = {
		[1] = 235;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnGetAchievementProgressInfoMsg = {
		[1] = 236;
		[2] = {
			[1] = "AchievementID";
			[2] = "Progress";
		};
	};
	OnGetAchievementStateInfoMsg = {
		[1] = 237;
		[2] = {
			[1] = "AchievementID";
			[2] = "State";
		};
	};
	OnGetAchievementTipInfoMsg = {
		[1] = 238;
		[2] = {
			[1] = "Flag";
		};
	};
	OnGetAmuletBroadCastMsg = {
		[1] = 239;
		[2] = {
			[1] = "AmuletMsg";
			[2] = "LastAmuletEnum";
			[3] = "Name";
			[4] = "RoleID";
			[5] = "Time";
		};
	};
	OnGetAmuletInfoMsg = {
		[1] = 240;
		[2] = {
			[1] = "Result";
		};
	};
	OnGetChartBroadCastMsg = {
		[1] = 241;
		[2] = {
			[1] = "Info";
		};
	};
	OnGetChartEquipMsg = {
		[1] = 242;
		[2] = {
			[1] = "AvatarInfoMsg";
			[2] = "EquipInfoMsg";
			[3] = "RoleID";
		};
	};
	OnGetChartGuildInfoMsg = {
		[1] = 243;
		[2] = {
			[1] = "GuildID";
			[2] = "RoleID";
		};
	};
	OnGetChartListMsg = {
		[1] = 244;
		[2] = {
			[1] = "ChartList";
			[2] = "Type";
		};
	};
	OnGetChartMountInfoMsg = {
		[1] = 245;
		[2] = {
			[1] = "MountInfoMsg";
		};
	};
	OnGetChartTitleMsg = {
		[1] = 246;
		[2] = {
			[1] = "TitleInfo";
		};
	};
	OnGetEvaluateMsg = {
		[1] = 247;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnGetFinishedNoviceGuideListMsg = {
		[1] = 248;
		[2] = {
			[1] = "GuideList";
		};
	};
	OnGetGuildDataMsg = {
		[1] = 249;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnGetGuildInfoMsg = {
		[1] = 250;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnGetGuildListMsg = {
		[1] = 251;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnGetMiniChartMsg = {
		[1] = 252;
		[2] = {
			[1] = "MiniChart";
		};
	};
	OnGuildInitMsg = {
		[1] = 253;
		[2] = {
			[1] = "GuildID";
		};
	};
	OnGuildNoticeMsg = {
		[1] = 254;
		[2] = {
			[1] = "TabInfo";
			[2] = "Type";
		};
	};
	OnGuildSearchPlayerMsg = {
		[1] = 255;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnGuildWndRefreshMsg = {
		[1] = 256;
		[2] = {
			[1] = "Wnd";
		};
	};
	OnHidePlayerMsg = {
		[1] = 257;
		[2] = {
			[1] = "List";
		};
	};
	OnHolderInfoChgMsg = {
		[1] = 258;
		[2] = {
			[1] = "OperateList";
		};
	};
	OnHurtMeMsg = {
		[1] = 259;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleType";
		};
	};
	OnInitDataCenterMsg = {
		[1] = 260;
		[2] = {
			[1] = "Data";
		};
	};
	OnInitEvaluateMsg = {
		[1] = 261;
		[2] = {
			[1] = "Info";
		};
	};
	OnInitViewPfxMsg = {
		[1] = 262;
		[2] = {
			[1] = "PfxList";
			[2] = "RoleID";
		};
	};
	OnInitializeFriendMsg = {
		[1] = 263;
		[2] = {
			[1] = "Friends";
		};
	};
	OnInitializeMsgEndMsg = {
		[1] = 264;
		[2] = {
		};
	};
	OnIntensifyAmuletMsg = {
		[1] = 265;
		[2] = {
			[1] = "Result";
		};
	};
	OnItemOprateMsg = {
		[1] = 266;
		[2] = {
			[1] = "OperateList";
		};
	};
	OnKillEnmityMsg = {
		[1] = 267;
		[2] = {
			[1] = "EnmityName";
		};
	};
	OnLoadAttrInfoMsg = {
		[1] = 268;
		[2] = {
			[1] = "InfoTable";
			[2] = "IsInit";
			[3] = "StrType";
		};
	};
	OnMartialHarvestMsg = {
		[1] = 269;
		[2] = {
			[1] = "HarvestInfo";
		};
	};
	OnMartialPosMsg = {
		[1] = 270;
		[2] = {
			[1] = "FreePosTable";
			[2] = "MartialID";
		};
	};
	OnMartialSplPerMsg = {
		[1] = 271;
		[2] = {
			[1] = "SplPerValue";
		};
	};
	OnMartialTickMsg = {
		[1] = 272;
		[2] = {
			[1] = "TickValue";
		};
	};
	OnMeShowInfoMsg = {
		[1] = 273;
		[2] = {
			[1] = "PlayerInfo";
		};
	};
	OnMoveFailMsg = {
		[1] = 274;
		[2] = {
			[1] = "DirValue";
			[2] = "XPos";
			[3] = "YPos";
		};
	};
	OnMoveResultMsg = {
		[1] = 275;
		[2] = {
			[1] = "ResultCode";
		};
	};
	OnMoveStopResultMsg = {
		[1] = 276;
		[2] = {
			[1] = "ResultCode";
		};
	};
	OnMyKillNumMsg = {
		[1] = 277;
		[2] = {
			[1] = "KillAll";
			[2] = "KillCon";
		};
	};
	OnNoviceGuideCommonEventMsg = {
		[1] = 278;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnNoviceGuideLevelEventMsg = {
		[1] = 279;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnNoviceGuideTaskEventMsg = {
		[1] = 280;
		[2] = {
			[1] = "TabInfo";
		};
	};
	OnOpenFlagChangeMsg = {
		[1] = 281;
		[2] = {
			[1] = "OpenFlag";
			[2] = "SkillID";
		};
	};
	OnOpenHideAchievementMsg = {
		[1] = 282;
		[2] = {
			[1] = "tabData";
		};
	};
	OnOtherBattleScoreInfoMsg = {
		[1] = 283;
		[2] = {
			[1] = "FromType";
			[2] = "RoleID";
			[3] = "ScoreInfo";
		};
	};
	OnPKValueChangeMsg = {
		[1] = 284;
		[2] = {
			[1] = "PKValue";
			[2] = "RoleID";
		};
	};
	OnPackUpCompleteMsg = {
		[1] = 285;
		[2] = {
			[1] = "PosType";
		};
	};
	OnPlayPfxMsg = {
		[1] = 286;
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
		[1] = 287;
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
		[1] = 288;
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
		[1] = 289;
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
		[1] = 290;
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
		[1] = 291;
		[2] = {
			[1] = "DeadFlag";
			[2] = "EnemyID";
			[3] = "EnemyType";
		};
	};
	OnPlayerEquipChangeMsg = {
		[1] = 292;
		[2] = {
			[1] = "ItemEnum";
			[2] = "Level";
			[3] = "ModeID";
			[4] = "RoleID";
			[5] = "Type";
		};
	};
	OnPlayerMountChangeMsg = {
		[1] = 293;
		[2] = {
			[1] = "Info";
		};
	};
	OnPlayerMoveEndMsg = {
		[1] = 294;
		[2] = {
			[1] = "DirValue";
			[2] = "RoleID";
			[3] = "XStop";
			[4] = "YStop";
		};
	};
	OnPlayerMoveToMsg = {
		[1] = 295;
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
		[1] = 296;
		[2] = {
			[1] = "PlayerList";
		};
	};
	OnPlayerSuitChangeMsg = {
		[1] = 297;
		[2] = {
			[1] = "RoleID";
			[2] = "SuitList";
		};
	};
	OnReadMuseTimeMsg = {
		[1] = 298;
		[2] = {
			[1] = "MuseTime";
		};
	};
	OnReadPKInfoMsg = {
		[1] = 299;
		[2] = {
			[1] = "PKMode";
			[2] = "PkValue";
		};
	};
	OnReadRoleResultMsg = {
		[1] = 300;
		[2] = {
			[1] = "Flag";
			[2] = "Num";
			[3] = "ResultCode";
			[4] = "RoleCount";
		};
	};
	OnReadSkillResultMsg = {
		[1] = 301;
		[2] = {
			[1] = "ResultCode";
			[2] = "SkillInfoSet";
		};
	};
	OnReceiveAddictedNoticeMsg = {
		[1] = 302;
		[2] = {
			[1] = "GameTime";
			[2] = "Tips";
		};
	};
	OnReceiveGongGaoMsg = {
		[1] = 303;
		[2] = {
			[1] = "Text";
			[2] = "Time";
		};
	};
	OnReceiveMsg = {
		[1] = 304;
		[2] = {
			[1] = "Msg";
		};
	};
	OnReceiveMsgListMsg = {
		[1] = 305;
		[2] = {
			[1] = "MsgList";
		};
	};
	OnReceiveTrophyInfoMsg = {
		[1] = 306;
		[2] = {
			[1] = "Info";
		};
	};
	OnRequestEnemyIDMsg = {
		[1] = 307;
		[2] = {
			[1] = "Msgs";
			[2] = "RoleID";
		};
	};
	OnRequestEnemyMsg = {
		[1] = 308;
		[2] = {
			[1] = "Msgs";
			[2] = "RoleID";
		};
	};
	OnRequestFriendMsg = {
		[1] = 309;
		[2] = {
			[1] = "Contacts";
			[2] = "Friends";
		};
	};
	OnRequestGetItemMsg = {
		[1] = 310;
		[2] = {
			[1] = "MailID";
		};
	};
	OnRequestGroupItemMsg = {
		[1] = 311;
		[2] = {
			[1] = "ItemGroup";
		};
	};
	OnRequestItemBeginMsg = {
		[1] = 312;
		[2] = {
			[1] = "HolderInfo";
		};
	};
	OnRequestItemEndMsg = {
		[1] = 313;
		[2] = {
		};
	};
	OnRequestMailMsg = {
		[1] = 314;
		[2] = {
			[1] = "Mails";
			[2] = "Notify";
			[3] = "Total";
			[4] = "TotalRead";
		};
	};
	OnRequestPlayerMsg = {
		[1] = 315;
		[2] = {
			[1] = "AvatarMsg";
			[2] = "BournMsg";
			[3] = "ItemMsg";
			[4] = "PropertyMsg";
			[5] = "SuitMsg";
			[6] = "WuXingMsg";
		};
	};
	OnRequestSameEnemyMsg = {
		[1] = 316;
		[2] = {
			[1] = "Msgs";
		};
	};
	OnRequestSearchMsg = {
		[1] = 317;
		[2] = {
			[1] = "Msg";
			[2] = "Page";
		};
	};
	OnRequestSearchNumberMsg = {
		[1] = 318;
		[2] = {
			[1] = "TotalCount";
			[2] = "TotalPage";
		};
	};
	OnRequestSettingMsg = {
		[1] = 319;
		[2] = {
			[1] = "Setting";
		};
	};
	OnRequestWantFriendMsg = {
		[1] = 320;
		[2] = {
			[1] = "Msgs";
		};
	};
	OnRequestWantMarryMsg = {
		[1] = 321;
		[2] = {
			[1] = "Msgs";
			[2] = "Sex";
		};
	};
	OnRoleAddViewPfxMsg = {
		[1] = 322;
		[2] = {
			[1] = "PfxCfg";
			[2] = "RoleID";
			[3] = "RoleType";
		};
	};
	OnRoleAttrChangeMsg = {
		[1] = 323;
		[2] = {
			[1] = "ChangeTable";
			[2] = "StrType";
		};
	};
	OnRoleBattleInfoMsg = {
		[1] = 324;
		[2] = {
			[1] = "ActCount";
			[2] = "ChangeTable";
			[3] = "ExecTime";
			[4] = "RoleID";
			[5] = "SkillID";
		};
	};
	OnRoleExitMartialMsg = {
		[1] = 325;
		[2] = {
			[1] = "Index";
			[2] = "MartialID";
			[3] = "RoleID";
		};
	};
	OnRoleInfoCompleteMsg = {
		[1] = 326;
		[2] = {
			[1] = "RoleCount";
		};
	};
	OnRoleJoinMartialMsg = {
		[1] = 327;
		[2] = {
			[1] = "Index";
			[2] = "MartialID";
			[3] = "RoleID";
		};
	};
	OnRoleLevelUpMsg = {
		[1] = 328;
		[2] = {
			[1] = "NewLevel";
			[2] = "RoleID";
		};
	};
	OnRoleListShowInfoMsg = {
		[1] = 329;
		[2] = {
			[1] = "IsDefRole";
			[2] = "RoleListShowInfo";
		};
	};
	OnRoleRmvViewPfxMsg = {
		[1] = 330;
		[2] = {
			[1] = "PfxCfg";
			[2] = "RoleID";
			[3] = "RoleType";
		};
	};
	OnRoleSkillBeginMsg = {
		[1] = 331;
		[2] = {
			[1] = "ParamList";
			[2] = "RoleID";
			[3] = "SkillID";
		};
	};
	OnSelectLineRtMsg = {
		[1] = 332;
		[2] = {
			[1] = "AccountID";
			[2] = "LineID";
			[3] = "ResultCode";
			[4] = "Sign";
		};
	};
	OnSelectRoleRtMsg = {
		[1] = 333;
		[2] = {
			[1] = "ResultCode";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	OnSelfMartialMsg = {
		[1] = 334;
		[2] = {
			[1] = "MartialID";
			[2] = "SkillID";
		};
	};
	OnServerLoadEndMsg = {
		[1] = 335;
		[2] = {
		};
	};
	OnServerNoticeMsg = {
		[1] = 336;
		[2] = {
			[1] = "WordID";
		};
	};
	OnSetPointModeMsg = {
		[1] = 337;
		[2] = {
			[1] = "Mode";
		};
	};
	OnSettingSystemErrorMsg = {
		[1] = 338;
		[2] = {
			[1] = "Code";
			[2] = "Name";
		};
	};
	OnShortuctInfoMsg = {
		[1] = 339;
		[2] = {
			[1] = "InfoList";
		};
	};
	OnSitHarvestMsg = {
		[1] = 340;
		[2] = {
			[1] = "Rsl";
		};
	};
	OnSpecialFlagChgMsg = {
		[1] = 341;
		[2] = {
			[1] = "Flag";
			[2] = "Length";
		};
	};
	OnStartTimeMsg = {
		[1] = 342;
		[2] = {
			[1] = "ID";
		};
	};
	OnStopPfxMsg = {
		[1] = 343;
		[2] = {
			[1] = "ActionID";
			[2] = "RoleID";
		};
	};
	OnStudySkillResultMsg = {
		[1] = 344;
		[2] = {
			[1] = "ResultCode";
			[2] = "SkillID";
		};
	};
	OnSuitChangeMsg = {
		[1] = 345;
		[2] = {
			[1] = "SuitList";
		};
	};
	OnSyncDataCenterMsg = {
		[1] = 346;
		[2] = {
			[1] = "Data";
		};
	};
	OnTrophyChangeMsg = {
		[1] = 347;
		[2] = {
			[1] = "NewGuildName";
			[2] = "TrophyID";
		};
	};
	OnTrophyHPChgMsg = {
		[1] = 348;
		[2] = {
			[1] = "ChgInfo";
		};
	};
	OnTrophyInitMsg = {
		[1] = 349;
		[2] = {
			[1] = "TrophyList";
		};
	};
	OnTryGuildBuildMsg = {
		[1] = 350;
		[2] = {
			[1] = "Result";
			[2] = "TabInfo";
		};
	};
	OnTryGuildQuitMsg = {
		[1] = 351;
		[2] = {
			[1] = "Result";
		};
	};
	OnTryGuildRemoveMsg = {
		[1] = 352;
		[2] = {
			[1] = "Result";
			[2] = "TabInfo";
		};
	};
	OnUpdateBangPaiMsg = {
		[1] = 353;
		[2] = {
			[1] = "BangPai";
			[2] = "BangPaiID";
			[3] = "RoleID";
		};
	};
	OnUpdateBattleInfoMsg = {
		[1] = 354;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnUpdateContactMsg = {
		[1] = 355;
		[2] = {
			[1] = "Contact";
		};
	};
	OnUpdateFriendMsg = {
		[1] = 356;
		[2] = {
			[1] = "Friend";
		};
	};
	OnUpdateKillAllMsg = {
		[1] = 357;
		[2] = {
			[1] = "KillInfo";
		};
	};
	OnUpdateKillConMsg = {
		[1] = 358;
		[2] = {
			[1] = "KillInfo";
		};
	};
	OnUpdateLevelMsg = {
		[1] = 359;
		[2] = {
			[1] = "Level";
			[2] = "RoleID";
		};
	};
	OnUpdateOnLineMsg = {
		[1] = 360;
		[2] = {
			[1] = "OnLine";
			[2] = "RoleID";
		};
	};
	OnUpdatePosInfoMsg = {
		[1] = 361;
		[2] = {
			[1] = "List";
		};
	};
	OnUpdateRoleInfoMsg = {
		[1] = 362;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnUpdateRoleMoodMsg = {
		[1] = 363;
		[2] = {
			[1] = "Mood";
		};
	};
	OnUpdateScoreListMsg = {
		[1] = 364;
		[2] = {
			[1] = "List";
		};
	};
	OnUpdateSplMemberMsg = {
		[1] = 365;
		[2] = {
			[1] = "List";
		};
	};
	OnUpdateTanWeiMsg = {
		[1] = 366;
		[2] = {
			[1] = "RoleID";
			[2] = "TanWei";
		};
	};
	OnUpdateVIPMsg = {
		[1] = 367;
		[2] = {
			[1] = "RoleID";
			[2] = "VIP";
		};
	};
	OnUpdateWantMarryStateMsg = {
		[1] = 368;
		[2] = {
			[1] = "State";
		};
	};
	OnUpdateYanHuiMsg = {
		[1] = 369;
		[2] = {
			[1] = "RoleID";
			[2] = "YanHui";
		};
	};
	OnUpgradeAmuletMsg = {
		[1] = 370;
		[2] = {
			[1] = "Result";
		};
	};
	OnWarHarvestMsg = {
		[1] = 371;
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
		[1] = 372;
		[2] = {
			[1] = "TimeLength";
			[2] = "WarID";
		};
	};
	OnWarMyScoreMsg = {
		[1] = 373;
		[2] = {
			[1] = "Score";
		};
	};
	OnWarNoticeMsg = {
		[1] = 374;
		[2] = {
			[1] = "NoticeType";
			[2] = "Param";
			[3] = "StringID";
		};
	};
	OnWarStartFlagMsg = {
		[1] = 375;
		[2] = {
			[1] = "Flag";
			[2] = "WarID";
		};
	};
	PlayerShowTextGetAllNearTextMsg = {
		[1] = 376;
		[2] = {
			[1] = "SendInfo";
		};
	};
	PlayerShowTextGetAllTextMsg = {
		[1] = 377;
		[2] = {
			[1] = "LoverText";
			[2] = "RoleId";
			[3] = "Sp";
			[4] = "Talk";
			[5] = "Title";
		};
	};
	PlayerShowTextUpdateLoverMsg = {
		[1] = 378;
		[2] = {
			[1] = "LoverText";
			[2] = "RoleId";
		};
	};
	PlayerShowTextUpdateSpMsg = {
		[1] = 379;
		[2] = {
			[1] = "RoleId";
			[2] = "SP";
		};
	};
	PlayerShowTextUpdateTalkMsg = {
		[1] = 380;
		[2] = {
			[1] = "RoleId";
			[2] = "Talk";
		};
	};
	PlayerShowTextUpdateTitleMsg = {
		[1] = 381;
		[2] = {
			[1] = "RoleId";
			[2] = "Title";
		};
	};
	PlayerStateMsg = {
		[1] = 382;
		[2] = {
			[1] = "ActionID";
			[2] = "Param";
			[3] = "RoleID";
		};
	};
	RepeatTaskUpdateMsg = {
		[1] = 383;
		[2] = {
			[1] = "TaskList";
		};
	};
	ReqShowAwardInfoMsg = {
		[1] = 384;
		[2] = {
			[1] = "DuplId";
			[2] = "LifeTime";
			[3] = "Type";
		};
	};
	ReqShowMsg = {
		[1] = 385;
		[2] = {
		};
	};
	ReqUsePropMsg = {
		[1] = 386;
		[2] = {
			[1] = "DuplId";
		};
	};
	ResDuplRecordInfoMsg = {
		[1] = 387;
		[2] = {
			[1] = "Flag";
			[2] = "RecordInfo";
		};
	};
	ResGetAddiAwardMsg = {
		[1] = 388;
		[2] = {
			[1] = "Flag";
		};
	};
	ResGetPerAwardMsg = {
		[1] = 389;
		[2] = {
		};
	};
	ResSendFbShowMsg = {
		[1] = 390;
		[2] = {
			[1] = "Flag";
			[2] = "JiFenInfo";
			[3] = "RecordInfo";
		};
	};
	ResSendJiFenMsg = {
		[1] = 391;
		[2] = {
			[1] = "DuplId";
			[2] = "EndFlag";
			[3] = "Flag";
			[4] = "RecordInfo";
		};
	};
	RespMonsterTimesMsg = {
		[1] = 392;
		[2] = {
			[1] = "MonsterTimes";
		};
	};
	ResponseBuildMsg = {
		[1] = 393;
		[2] = {
			[1] = "Info";
		};
	};
	ResponseSystemNoticeMsg = {
		[1] = 394;
		[2] = {
			[1] = "Msg";
		};
	};
	ResponseUpResultMsg = {
		[1] = 395;
		[2] = {
			[1] = "Ladder";
			[2] = "Result";
		};
	};
	ResultTimeMsg = {
		[1] = 396;
		[2] = {
			[1] = "ReqTime";
			[2] = "ServerTime";
		};
	};
	ReturnBuffInfoMsg = {
		[1] = 397;
		[2] = {
			[1] = "BuffInfo";
		};
	};
	ReturnFbBasicInfoMsg = {
		[1] = 398;
		[2] = {
			[1] = "EnterTimesTbl";
			[2] = "FailedBoss";
			[3] = "InfoTbl";
			[4] = "OutLineTbl";
			[5] = "RefedBoss";
		};
	};
	ReturnFbRestInfoMsg = {
		[1] = 399;
		[2] = {
			[1] = "DuplEntityId";
			[2] = "DuplID";
			[3] = "Flag";
		};
	};
	ReturnNearByPlayerInfoMsg = {
		[1] = 400;
		[2] = {
			[1] = "PlayerInfo";
		};
	};
	ReturnNearByTeamInfoMsg = {
		[1] = 401;
		[2] = {
			[1] = "TeamInfo";
		};
	};
	ReturnSafeSideInfoMsg = {
		[1] = 402;
		[2] = {
			[1] = "BSafeFlag";
		};
	};
	ReturnStoneComposeInfoMsg = {
		[1] = 403;
		[2] = {
			[1] = "BaoJiTbl";
			[2] = "FailNum";
			[3] = "ItemEnum";
			[4] = "NextEnum";
			[5] = "SuccNum";
		};
	};
	ScriptChangeLookMsg = {
		[1] = 404;
		[2] = {
			[1] = "Look";
		};
	};
	ScriptChatNoticeMsg = {
		[1] = 405;
		[2] = {
			[1] = "Channel";
			[2] = "HideHead";
			[3] = "Param";
			[4] = "Str";
			[5] = "Str2";
			[6] = "System";
		};
	};
	ScriptOnRecvSystemNoticeMsg = {
		[1] = 406;
		[2] = {
			[1] = "Str";
		};
	};
	ScriptServerVerSionReplaceMsg = {
		[1] = 407;
		[2] = {
			[1] = "Info";
		};
	};
	SendAddiValueMsg = {
		[1] = 408;
		[2] = {
			[1] = "AllowGetAward";
			[2] = "CurAddiMoney";
			[3] = "NextAddiPhase";
		};
	};
	SendBXItemInfoMsg = {
		[1] = 409;
		[2] = {
			[1] = "TFlyItem";
		};
	};
	SendBuffLifeTimeMsg = {
		[1] = 410;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "EntityId";
			[4] = "LifeTime";
			[5] = "Type";
		};
	};
	SendBuildAwardStateMsg = {
		[1] = 411;
		[2] = {
			[1] = "CurBuildPlan";
			[2] = "CurBuildValue";
			[3] = "UpdateFlag";
		};
	};
	SendBuildBXMsg = {
		[1] = 412;
		[2] = {
			[1] = "TFlyItem";
		};
	};
	SendBuildCDTimeMsg = {
		[1] = 413;
		[2] = {
			[1] = "LabourCD";
			[2] = "StoneCD";
			[3] = "WoodCD";
		};
	};
	SendContriNumMsg = {
		[1] = 414;
		[2] = {
			[1] = "ConType";
			[2] = "CurBuildPlan";
		};
	};
	SendCurPlanMsg = {
		[1] = 415;
		[2] = {
			[1] = "CurPlan";
		};
	};
	SendDuplExpMsg = {
		[1] = 416;
		[2] = {
			[1] = "ExpInfo";
		};
	};
	SendDuplMonsterMsg = {
		[1] = 417;
		[2] = {
			[1] = "BossInfo";
			[2] = "MonsterInfo";
		};
	};
	SendDuplRecordChgMsg = {
		[1] = 418;
		[2] = {
			[1] = "DuplId";
			[2] = "IconId";
			[3] = "LifeTime";
			[4] = "RoleId";
			[5] = "RoleName";
		};
	};
	SendExchgResMsg = {
		[1] = 419;
		[2] = {
			[1] = "Res";
		};
	};
	SendExpChangeMsg = {
		[1] = 420;
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
		[1] = 421;
		[2] = {
			[1] = "DuplAwardList";
			[2] = "DuplId";
			[3] = "DuplLevel";
		};
	};
	SendJiFenChgMsg = {
		[1] = 422;
		[2] = {
			[1] = "DwDuplId";
			[2] = "EndFlag";
			[3] = "JiFenInfo";
		};
	};
	SendJiFenMsg = {
		[1] = 423;
		[2] = {
			[1] = "Score";
		};
	};
	SendPerValueMsg = {
		[1] = 424;
		[2] = {
			[1] = "AllowGetAward";
			[2] = "CurPerMoney";
			[3] = "NextPerPhase";
		};
	};
	SendPlanFulMsg = {
		[1] = 425;
		[2] = {
			[1] = "PlanLapFulFlag";
		};
	};
	SendPosInfoToClientMsg = {
		[1] = 426;
		[2] = {
			[1] = "Info";
		};
	};
	SendShowTipsMsg = {
		[1] = 427;
		[2] = {
		};
	};
	SendSwordGasMsg = {
		[1] = 428;
		[2] = {
			[1] = "AddSwordGas";
		};
	};
	SendSwordInfoMsg = {
		[1] = 429;
		[2] = {
			[1] = "Ladder";
			[2] = "Level";
			[3] = "SwordGas";
		};
	};
	SetEnteredDuplMsg = {
		[1] = 430;
		[2] = {
			[1] = "DuplId";
			[2] = "EnterMode";
		};
	};
	ShowFbSystemMsg = {
		[1] = 431;
		[2] = {
			[1] = "Msg";
		};
	};
	ShowRequestInfoMsg = {
		[1] = 432;
		[2] = {
			[1] = "JoinTeamId";
			[2] = "Name";
			[3] = "RequestType";
			[4] = "RoleId";
		};
	};
	StoneSys_BroadCastMsg = {
		[1] = 433;
		[2] = {
			[1] = "Flag";
			[2] = "Info";
			[3] = "NextItemEnum";
			[4] = "PlayerName";
			[5] = "PlayerRoleID";
			[6] = "SuccNum";
		};
	};
	StoryScnStartMsg = {
		[1] = 434;
		[2] = {
			[1] = "StoryId";
		};
	};
	StoryStartMsg = {
		[1] = 435;
		[2] = {
			[1] = "StoryId";
		};
	};
	SynChangeCaptainMsg = {
		[1] = 436;
		[2] = {
			[1] = "CaptainInfo";
		};
	};
	SynClearOtherBuffByChgMsg = {
		[1] = 437;
		[2] = {
		};
	};
	SynCreateTeamMsg = {
		[1] = 438;
		[2] = {
			[1] = "Info";
		};
	};
	SynDelEnterTimesMsg = {
		[1] = 439;
		[2] = {
			[1] = "InfoTbl";
		};
	};
	SynDeleteBuffByCengMsg = {
		[1] = 440;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "IsSave";
			[4] = "MinusNum";
		};
	};
	SynDeleteBuffMsg = {
		[1] = 441;
		[2] = {
			[1] = "BuffEntityId";
			[2] = "BuffId";
			[3] = "BuffIsSave";
			[4] = "ClassId";
		};
	};
	SynDeleteTeamMsg = {
		[1] = 442;
		[2] = {
			[1] = "TeamId";
		};
	};
	SynEnterFbInfoMsg = {
		[1] = 443;
		[2] = {
			[1] = "DuplId";
			[2] = "Times";
		};
	};
	SynMemberAddInfoMsg = {
		[1] = 444;
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
		[1] = 445;
		[2] = {
			[1] = "RoleId";
		};
	};
	SynMonsterTimesMsg = {
		[1] = 446;
		[2] = {
			[1] = "Times";
		};
	};
	SynOnBuffDeleteMsg = {
		[1] = 447;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "Deltype";
			[4] = "EntityId";
		};
	};
	SynOneBuffMsg = {
		[1] = 448;
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
		[1] = 449;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "EntityId";
			[4] = "Value";
		};
	};
	SynPlayerBloodToClientMsg = {
		[1] = 450;
		[2] = {
			[1] = "CurrentBlood";
			[2] = "PlayerId";
			[3] = "TotalBlood";
		};
	};
	SynPlayerBuffToClientMsg = {
		[1] = 451;
		[2] = {
			[1] = "BuffId";
			[2] = "PlayerId";
		};
	};
	SynPlayerLevelToClientMsg = {
		[1] = 452;
		[2] = {
			[1] = "HpMax";
			[2] = "Level";
			[3] = "MpMax";
			[4] = "PlayerId";
		};
	};
	SynPlayerMpToClientMsg = {
		[1] = 453;
		[2] = {
			[1] = "CurrentMp";
			[2] = "PlayerId";
			[3] = "TotalMp";
		};
	};
	SynPlayerPosToClientMsg = {
		[1] = 454;
		[2] = {
			[1] = "MapId";
			[2] = "PlayerId";
			[3] = "Posx";
			[4] = "Posy";
		};
	};
	SynTeamEnounceMsg = {
		[1] = 455;
		[2] = {
			[1] = "TeamEnounce";
		};
	};
	SynTgValueMsg = {
		[1] = 456;
		[2] = {
			[1] = "Value";
		};
	};
	TaskAcceptFailInfoMsg = {
		[1] = 457;
		[2] = {
			[1] = "DwInfoType";
			[2] = "DwTaskId";
		};
	};
	TaskAcceptTaskMsg = {
		[1] = 458;
		[2] = {
			[1] = "TbTask";
		};
	};
	TaskCompleteFailInfoMsg = {
		[1] = 459;
		[2] = {
			[1] = "DwInfoType";
			[2] = "DwTaskId";
		};
	};
	TaskCompleteTaskMsg = {
		[1] = 460;
		[2] = {
			[1] = "DwTaskId";
		};
	};
	TaskDoffFailInfoMsg = {
		[1] = 461;
		[2] = {
			[1] = "DwInfoType";
			[2] = "DwTaskId";
			[3] = "TextId";
		};
	};
	TaskDoffTaskMsg = {
		[1] = 462;
		[2] = {
			[1] = "DwTaskId";
		};
	};
	TaskErrorMsg = {
		[1] = 463;
		[2] = {
			[1] = "Id";
		};
	};
	TaskGetAcceptInfoMsg = {
		[1] = 464;
		[2] = {
			[1] = "TaskInfo";
		};
	};
	TaskGetCanAcceptInfoMsg = {
		[1] = 465;
		[2] = {
			[1] = "AddTask";
			[2] = "Daily";
			[3] = "DelTask";
			[4] = "NextMain";
			[5] = "Random";
			[6] = "Weekly";
		};
	};
	TaskGetWeekInfoMsg = {
		[1] = 466;
		[2] = {
			[1] = "Info";
		};
	};
	TaskUpdateTaskMsg = {
		[1] = 467;
		[2] = {
			[1] = "TbTask";
		};
	};
	UpdateAutoSettingMsg = {
		[1] = 468;
		[2] = {
			[1] = "Flag";
			[2] = "Info";
		};
	};
	UpdateBuffPropertyMsg = {
		[1] = 469;
		[2] = {
			[1] = "BuffId";
			[2] = "ClassId";
			[3] = "EntityId";
			[4] = "IsSave";
			[5] = "Value";
		};
	};
};
