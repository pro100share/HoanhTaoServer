_G.MsgList_KernelServer =
{
	ACCChangeMallMsg = {
		[1] = 1;
		[2] = {
			[1] = "ParamMsg";
		};
	};
	ACCChangeMovementMsg = {
		[1] = 2;
		[2] = {
			[1] = "ParamMsg";
		};
	};
	ACCSendBanSpeakMsg = {
		[1] = 3;
		[2] = {
			[1] = "BanMsg";
		};
	};
	ACCSendLockRoleMsg = {
		[1] = 4;
		[2] = {
			[1] = "LockMsg";
		};
	};
	ACCSendMailMsg = {
		[1] = 5;
		[2] = {
			[1] = "MailMsg";
		};
	};
	ACCSendNoticeMsg = {
		[1] = 6;
		[2] = {
			[1] = "Notice";
		};
	};
	ACCUpdateMovementMsg = {
		[1] = 7;
		[2] = {
			[1] = "ParamMsg";
		};
	};
	AHeadGetSwordMsg = {
		[1] = 8;
		[2] = {
			[1] = "CrossId";
			[2] = "HoldAccountId";
			[3] = "HoldId";
			[4] = "HoldName";
		};
	};
	AddPlayerResultMsg = {
		[1] = 9;
		[2] = {
			[1] = "AccountID";
			[2] = "IsChangeLine";
			[3] = "ResultCode";
		};
	};
	ChangeLineRequestMsg = {
		[1] = 10;
		[2] = {
			[1] = "ChangeLineParam";
			[2] = "NewGameLine";
			[3] = "user";
		};
	};
	ClearHoldInfoToKsMsg = {
		[1] = 11;
		[2] = {
			[1] = "CrossId";
		};
	};
	CreatePlayerSystemMsg = {
		[1] = 12;
		[2] = {
			[1] = "AccountID";
			[2] = "IsChangeLine";
		};
	};
	CrossCreatePlayerSystemMsg = {
		[1] = 13;
		[2] = {
			[1] = "AccountID";
			[2] = "IsChangeLine";
		};
	};
	DT_GSCallKS_AddPointMsg = {
		[1] = 14;
		[2] = {
			[1] = "Point";
			[2] = "RoleID";
		};
	};
	DT_GSCallKS_GetPlayerInfoMsg = {
		[1] = 15;
		[2] = {
			[1] = "LineID";
			[2] = "RoleID";
		};
	};
	DT_GSCallKS_MakeUpMsg = {
		[1] = 16;
		[2] = {
			[1] = "LineID";
			[2] = "RoleID";
		};
	};
	DelPlayerMsg = {
		[1] = 17;
		[2] = {
			[1] = "AccountID";
			[2] = "CheckStr";
			[3] = "Reason";
		};
	};
	DuplMgr_GetGutIdMsg = {
		[1] = 18;
		[2] = {
			[1] = "DuplId";
			[2] = "Info";
			[3] = "LineID";
			[4] = "user";
		};
	};
	DuplMgr_GetIdMsg = {
		[1] = 19;
		[2] = {
			[1] = "DuplId";
			[2] = "user";
		};
	};
	FrenzyHoe_GSCheckAwardItemIdIsInSqlMsg = {
		[1] = 20;
		[2] = {
			[1] = "Param";
			[2] = "RoleID";
		};
	};
	FrenzyHoe_GSGetFrenzyHoeItemInfoMsg = {
		[1] = 21;
		[2] = {
			[1] = "RoleID";
		};
	};
	FrenzyHoe_GSUpdateFrenzyHoeItemInfoMsg = {
		[1] = 22;
		[2] = {
			[1] = "ParamInfo";
		};
	};
	GKSearchPrivatePlayerByNameMsg = {
		[1] = 23;
		[2] = {
			[1] = "LineID";
			[2] = "Name";
			[3] = "RoleID";
		};
	};
	GSAskForFestivalInfoMsg = {
		[1] = 24;
		[2] = {
		};
	};
	GSBroadCastSourceMsg = {
		[1] = 25;
		[2] = {
			[1] = "RoleID";
			[2] = "Source";
		};
	};
	GSCancelWantMarryMsg = {
		[1] = 26;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSCheckForLoginMsg = {
		[1] = 27;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSFindRoleIDMsg = {
		[1] = 28;
		[2] = {
			[1] = "CashID";
			[2] = "FromRoleID";
			[3] = "RoleName";
		};
	};
	GSPlayerDataChangeMsg = {
		[1] = 29;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSPlayerEnemyChangeMsg = {
		[1] = 30;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSPlayerLogoutMsg = {
		[1] = 31;
		[2] = {
			[1] = "OnLine";
			[2] = "RoleId";
			[3] = "user";
		};
	};
	GSReConnectRequestMsg = {
		[1] = 32;
		[2] = {
			[1] = "LineID";
			[2] = "Sign";
			[3] = "Time";
			[4] = "WarFlag";
		};
	};
	GSRegPlayerDataMsg = {
		[1] = 33;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRegRequestMsg = {
		[1] = 34;
		[2] = {
			[1] = "Sign";
			[2] = "Time";
			[3] = "WarFlag";
		};
	};
	GSRemoteCallMsg = {
		[1] = 35;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRemoteCallResultMsg = {
		[1] = 36;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRequestAddPlayerMsg = {
		[1] = 37;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRequestBanquetMsg = {
		[1] = 38;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRequestDeletePlayerMsg = {
		[1] = 39;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRequestMailIDMsg = {
		[1] = 40;
		[2] = {
			[1] = "Line";
			[2] = "Param";
			[3] = "user";
		};
	};
	GSRequestModifyWantMarryMsg = {
		[1] = 41;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRequestPlatformMsg = {
		[1] = 42;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRequestSearchFriendMsg = {
		[1] = 43;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSRequestSearchPageMsg = {
		[1] = 44;
		[2] = {
			[1] = "Param";
			[2] = "user";
		};
	};
	GSSendLeaderShowTextMsg = {
		[1] = 45;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
			[3] = "Type";
		};
	};
	GSSendMailMsg = {
		[1] = 46;
		[2] = {
			[1] = "MailMsg";
			[2] = "user";
		};
	};
	GSSendMailOnIDMsg = {
		[1] = 47;
		[2] = {
			[1] = "dwMailID";
			[2] = "dwRoleID";
			[3] = "szName";
			[4] = "user";
		};
	};
	GetBuildPlanKsMsg = {
		[1] = 48;
		[2] = {
			[1] = "Line";
		};
	};
	GetCrossHoldInfoMsg = {
		[1] = 49;
		[2] = {
		};
	};
	GetCrossMemberInfoMsg = {
		[1] = 50;
		[2] = {
			[1] = "AccID";
			[2] = "LineId";
			[3] = "RoleId";
		};
	};
	GetJiFenFromKsMsg = {
		[1] = 51;
		[2] = {
			[1] = "Line";
		};
	};
	GetRecordFromKsMsg = {
		[1] = 52;
		[2] = {
			[1] = "Line";
		};
	};
	GetZLKingFromKsMsg = {
		[1] = 53;
		[2] = {
			[1] = "Line";
		};
	};
	GetZhenLongFromKsMsg = {
		[1] = 54;
		[2] = {
			[1] = "Line";
		};
	};
	GsAskMergeServerTimeMsg = {
		[1] = 55;
		[2] = {
			[1] = "LineID";
		};
	};
	GuildPlayerMsg = {
		[1] = 56;
		[2] = {
			[1] = "Cmd";
			[2] = "Info";
			[3] = "SrcID";
		};
	};
	GuildServerMsg = {
		[1] = 57;
		[2] = {
			[1] = "Cmd";
			[2] = "Info";
		};
	};
	KSAddEvaluateMsg = {
		[1] = 58;
		[2] = {
			[1] = "RoleID";
			[2] = "Type";
		};
	};
	KSAddHideAchievementMsg = {
		[1] = 59;
		[2] = {
			[1] = "AchievementID";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	KSAddSeverEventDataMsg = {
		[1] = 60;
		[2] = {
			[1] = "Data";
			[2] = "ResID";
		};
	};
	KSBackStageDataMsg = {
		[1] = 61;
		[2] = {
			[1] = "ParamInfo";
		};
	};
	KSGetAchievementPlayerIDMsg = {
		[1] = 62;
		[2] = {
			[1] = "RoleID";
			[2] = "RoleName";
			[3] = "user";
		};
	};
	KSGetEvaluateMsg = {
		[1] = 63;
		[2] = {
			[1] = "SrcID";
			[2] = "TarID";
		};
	};
	KSGuildDeletePlayerMsg = {
		[1] = 64;
		[2] = {
			[1] = "RoleID";
		};
	};
	KSIncomeAskMsg = {
		[1] = 65;
		[2] = {
			[1] = "RoleID";
			[2] = "user";
		};
	};
	KSIncomeRcvMsg = {
		[1] = 66;
		[2] = {
			[1] = "Data";
			[2] = "RoleID";
			[3] = "user";
		};
	};
	KSInitChartListMsg = {
		[1] = 67;
		[2] = {
			[1] = "Line";
		};
	};
	KSInitHideAchievementListMsg = {
		[1] = 68;
		[2] = {
			[1] = "LineID";
		};
	};
	KSMedalNoticeMsg = {
		[1] = 69;
		[2] = {
			[1] = "ButtonIndex";
			[2] = "RoleID";
			[3] = "RoleName";
		};
	};
	KSRequestSeverEventDataMsg = {
		[1] = 70;
		[2] = {
			[1] = "Data";
			[2] = "ResID";
		};
	};
	KSRewardCodeAskForCheckMsg = {
		[1] = 71;
		[2] = {
			[1] = "Info";
			[2] = "user";
		};
	};
	KSRewardCodeAskForGetMsg = {
		[1] = 72;
		[2] = {
			[1] = "Info";
			[2] = "user";
		};
	};
	KSUpdateChartDataMsg = {
		[1] = 73;
		[2] = {
			[1] = "Data";
			[2] = "Role";
		};
	};
	KSUpdateChartListMsg = {
		[1] = 74;
		[2] = {
			[1] = "ID";
		};
	};
	KServPlayerShopListMsg = {
		[1] = 75;
		[2] = {
			[1] = "ShopList";
		};
	};
	KServPlayerShopSingleMsg = {
		[1] = 76;
		[2] = {
			[1] = "ParamInfo";
			[2] = "RoleID";
			[3] = "Type";
		};
	};
	MarBanMgr_AddBanquetMsg = {
		[1] = 77;
		[2] = {
			[1] = "BNew";
			[2] = "BanquetInfo";
		};
	};
	MarBanMgr_BanquetFinishMsg = {
		[1] = 78;
		[2] = {
			[1] = "BanquetID";
		};
	};
	MarBanMgr_BanquetStartMsg = {
		[1] = 79;
		[2] = {
			[1] = "BanquetID";
			[2] = "Cancel";
		};
	};
	MarBanMgr_CancelOrderBanquetMsg = {
		[1] = 80;
		[2] = {
			[1] = "HusbandRoleID";
			[2] = "user";
		};
	};
	MarBanMgr_GetMarryMoneyRequestMsg = {
		[1] = 81;
		[2] = {
			[1] = "IsMale";
			[2] = "RoleID";
			[3] = "user";
		};
	};
	MarBanMgr_OrderBanquetMsg = {
		[1] = 82;
		[2] = {
			[1] = "HusbandRoleID";
			[2] = "user";
		};
	};
	MarBanMgr_QueryBanquetListMsg = {
		[1] = 83;
		[2] = {
			[1] = "LineID";
		};
	};
	MarBanMgr_RecordGiveMarryMoneyMsg = {
		[1] = 84;
		[2] = {
			[1] = "BInsert";
			[2] = "BanquetID";
			[3] = "GiftMoney";
			[4] = "GuestLevel";
			[5] = "GuestName";
			[6] = "GuestRoleID";
		};
	};
	MarBanMgr_RequestBanquetListMsg = {
		[1] = 85;
		[2] = {
			[1] = "user";
		};
	};
	MarBanMgr_RequestGiveMarryMoneyMsg = {
		[1] = 86;
		[2] = {
			[1] = "Money";
			[2] = "ToBanquetID";
			[3] = "user";
		};
	};
	MarBanMgr_RequestGiveMarryMoneyToMsg = {
		[1] = 87;
		[2] = {
			[1] = "RoleID";
			[2] = "user";
		};
	};
	MarBanMgr_SureGetMarryMoneyMsg = {
		[1] = 88;
		[2] = {
			[1] = "BanquetList";
			[2] = "IsMale";
			[3] = "RoleID";
		};
	};
	MarMgr_ChangeKeepsakeMsg = {
		[1] = 89;
		[2] = {
			[1] = "ItemEnumID";
			[2] = "RoleID";
		};
	};
	MarMgr_DelChatMsg = {
		[1] = 90;
		[2] = {
			[1] = "RoleID";
			[2] = "Time";
		};
	};
	MarMgr_DivorceRegisterMsg = {
		[1] = 91;
		[2] = {
			[1] = "Compel";
			[2] = "RoleID";
		};
	};
	MarMgr_MarryRegisterMsg = {
		[1] = 92;
		[2] = {
			[1] = "HusbandName";
			[2] = "HusbandRoleID";
			[3] = "Love";
			[4] = "MarriedTime";
			[5] = "WifeName";
			[6] = "WifeRoleID";
		};
	};
	MarMgr_SendChatMsg = {
		[1] = 93;
		[2] = {
			[1] = "Msg";
			[2] = "RoleID";
			[3] = "Time";
		};
	};
	MarMgr_UpdateLoveMsg = {
		[1] = 94;
		[2] = {
			[1] = "Love";
			[2] = "RoleID";
		};
	};
	OnCrossServiceServerInfoMsg = {
		[1] = 95;
		[2] = {
			[1] = "UserPort";
		};
	};
	OnExpInteMaxlLevelMsg = {
		[1] = 96;
		[2] = {
			[1] = "MaxLevel";
		};
	};
	OnGSAllianceLeaderEnterGameMsg = {
		[1] = 97;
		[2] = {
		};
	};
	OnGSAskForAllianceLeaderMsg = {
		[1] = 98;
		[2] = {
			[1] = "user";
		};
	};
	OnGSAskForAllianceWarEndMsg = {
		[1] = 99;
		[2] = {
			[1] = "MateRoleID";
			[2] = "RoleID";
			[3] = "user";
		};
	};
	OnGSAskForLeaderGetPageMsg = {
		[1] = 100;
		[2] = {
			[1] = "Index";
		};
	};
	OnGSAskForLeaderSearchMsg = {
		[1] = 101;
		[2] = {
			[1] = "Name";
		};
	};
	OnGSAskForServerTimeInfoMsg = {
		[1] = 102;
		[2] = {
			[1] = "LineID";
		};
	};
	OnGSAskForSetAllianceInfoMsg = {
		[1] = 103;
		[2] = {
			[1] = "RoleName";
			[2] = "Type";
			[3] = "user";
		};
	};
	OnGSChatLineMsg = {
		[1] = 104;
		[2] = {
			[1] = "ChatMsg";
			[2] = "LineID";
		};
	};
	OnGSGuildChatRequestMsg = {
		[1] = 105;
		[2] = {
			[1] = "ChatMsg";
			[2] = "GuildID";
		};
	};
	OnGSReConnectRoleInfoMsg = {
		[1] = 106;
		[2] = {
			[1] = "RoleInfoList";
		};
	};
	OnGSTrumpetMsg = {
		[1] = 107;
		[2] = {
			[1] = "ChatMsg";
			[2] = "LineID";
		};
	};
	OnGameServiceServerInfoMsg = {
		[1] = 108;
		[2] = {
			[1] = "ServerID";
		};
	};
	OnKSCreateCrossMsg = {
		[1] = 109;
		[2] = {
			[1] = "BEnter";
			[2] = "CrossId";
			[3] = "ToLineId";
			[4] = "Type";
		};
	};
	OnKSCreateWarMsg = {
		[1] = 110;
		[2] = {
			[1] = "LineID";
			[2] = "WarID";
		};
	};
	OnKSDelCrossInfoMsg = {
		[1] = 111;
		[2] = {
			[1] = "CrossId";
			[2] = "ToLineId";
		};
	};
	OnKSDeleteWarMsg = {
		[1] = 112;
		[2] = {
			[1] = "LineID";
			[2] = "WarID";
		};
	};
	OnKSRequestGuildActiveMsg = {
		[1] = 113;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnKSRequestGuildApplyListMsg = {
		[1] = 114;
		[2] = {
			[1] = "GuildID";
			[2] = "RoleID";
		};
	};
	OnKSRequestGuildDonateListMsg = {
		[1] = 115;
		[2] = {
			[1] = "GuildID";
			[2] = "RoleID";
		};
	};
	OnKSRequestGuildEscortMsg = {
		[1] = 116;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnKSRequestGuildInfoListMsg = {
		[1] = 117;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnKSRequestGuildLogListMsg = {
		[1] = 118;
		[2] = {
			[1] = "GuildID";
			[2] = "RoleID";
		};
	};
	OnKSRequestGuildMarketMsg = {
		[1] = 119;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnKSRequestGuildMemberListMsg = {
		[1] = 120;
		[2] = {
			[1] = "GuildID";
			[2] = "RoleID";
		};
	};
	OnKSRequestGuildResourceMsg = {
		[1] = 121;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnKSRequestGuildSearchListMsg = {
		[1] = 122;
		[2] = {
			[1] = "Info";
			[2] = "RoleID";
		};
	};
	OnKSRequestGuildTrophyMsg = {
		[1] = 123;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnKSRequestGuildViewMsg = {
		[1] = 124;
		[2] = {
			[1] = "GuildID";
			[2] = "SrcID";
			[3] = "TarID";
		};
	};
	OnKSRequestWarLineMsg = {
		[1] = 125;
		[2] = {
			[1] = "LineID";
			[2] = "RoleID";
			[3] = "WarID";
		};
	};
	OnKSWarInitMsg = {
		[1] = 126;
		[2] = {
			[1] = "WarList";
		};
	};
	OnKSWarNoticeMsg = {
		[1] = 127;
		[2] = {
			[1] = "NoticeType";
			[2] = "Param";
			[3] = "StringID";
		};
	};
	OnKsReqCrossLineInfoMsg = {
		[1] = 128;
		[2] = {
			[1] = "AccID";
			[2] = "FromLineID";
			[3] = "RoleID";
		};
	};
	OnKsRequestCrossMsg = {
		[1] = 129;
		[2] = {
			[1] = "AccID";
			[2] = "CrossId";
			[3] = "FromLineID";
			[4] = "PlatId";
			[5] = "RoleID";
			[6] = "ServerId";
			[7] = "ToLineId";
		};
	};
	OnLotteryRealBuyTicketMsg = {
		[1] = 130;
		[2] = {
			[1] = "BuySucess";
			[2] = "RoleID";
			[3] = "TicketIndex";
		};
	};
	OnLotteryTryBuyTicketMsg = {
		[1] = 131;
		[2] = {
			[1] = "RoleID";
			[2] = "TicketIndex";
		};
	};
	OnReqExpIntegrateMsg = {
		[1] = 132;
		[2] = {
			[1] = "LineID";
		};
	};
	OnRequestLotteryInfoMsg = {
		[1] = 133;
		[2] = {
			[1] = "LineID";
		};
	};
	OnRequestMallInfoMsg = {
		[1] = 134;
		[2] = {
			[1] = "LineID";
		};
	};
	OnRequestTongTianTowerChartMsg = {
		[1] = 135;
		[2] = {
			[1] = "LineID";
		};
	};
	OnRequestZhenlongStarMsg = {
		[1] = 136;
		[2] = {
			[1] = "LineID";
		};
	};
	OnTryBuyItemMsg = {
		[1] = 137;
		[2] = {
			[1] = "MallID";
			[2] = "RoleID";
		};
	};
	OnTryChooseLuckDraMsg = {
		[1] = 138;
		[2] = {
			[1] = "RoleID";
		};
	};
	OnZhenlongStarChgMsg = {
		[1] = 139;
		[2] = {
			[1] = "PlayerInfo";
		};
	};
	PlayerChargeACCMsg = {
		[1] = 140;
		[2] = {
			[1] = "AccountID";
			[2] = "Balance";
			[3] = "Gold";
			[4] = "Money";
		};
	};
	PlayerGet360RedJewelMsg = {
		[1] = 141;
		[2] = {
			[1] = "AccountID";
		};
	};
	PlayerGet360RewardMsg = {
		[1] = 142;
		[2] = {
			[1] = "AccountID";
			[2] = "Level";
		};
	};
	ProcessTransMsg = {
		[1] = 143;
		[2] = {
			[1] = "Arg";
			[2] = "Name";
			[3] = "RID";
			[4] = "TaskID";
		};
	};
	ReceiveCrossDataMsg = {
		[1] = 144;
		[2] = {
			[1] = "AccountId";
			[2] = "Data";
			[3] = "RoleId";
			[4] = "SystemName";
		};
	};
	RequestBattleMsg = {
		[1] = 145;
		[2] = {
			[1] = "PlayerInfo";
		};
	};
	RequestPlayerInfoMsg = {
		[1] = 146;
		[2] = {
			[1] = "RoleID";
		};
	};
	ScriptAskForUrlMsg = {
		[1] = 147;
		[2] = {
			[1] = "LineID";
		};
	};
	ScriptChatNoticeMsg = {
		[1] = 148;
		[2] = {
			[1] = "Channel";
			[2] = "HideHead";
			[3] = "Param";
			[4] = "Str";
			[5] = "Str2";
			[6] = "System";
		};
	};
	SendBuildToKsMsg = {
		[1] = 149;
		[2] = {
			[1] = "ChgValue";
			[2] = "Line";
		};
	};
	SendCrossInfoMsg = {
		[1] = 150;
		[2] = {
			[1] = "AccountID";
			[2] = "EnterFlag";
			[3] = "RoleId";
		};
	};
	SendCrossNumMsg = {
		[1] = 151;
		[2] = {
			[1] = "CrossId";
			[2] = "LineId";
			[3] = "PlayerNum";
		};
	};
	SendCrossOverMsg = {
		[1] = 152;
		[2] = {
			[1] = "AccId";
			[2] = "Exp";
			[3] = "Honor";
			[4] = "RoleId";
		};
	};
	SendCrossStartMsg = {
		[1] = 153;
		[2] = {
			[1] = "CrossId";
			[2] = "MsgId";
		};
	};
	SendDataCrossOutLineMsg = {
		[1] = 154;
		[2] = {
			[1] = "AccID";
			[2] = "Info";
			[3] = "RoleId";
		};
	};
	SendExitCrossMsg = {
		[1] = 155;
		[2] = {
			[1] = "AccID";
			[2] = "Flag";
			[3] = "Info";
			[4] = "RoleId";
		};
	};
	SendHoldDataToKsMsg = {
		[1] = 156;
		[2] = {
			[1] = "CrossId";
			[2] = "HoldId";
			[3] = "HoldName";
			[4] = "OverFlag";
		};
	};
	SendJiFenToKsMsg = {
		[1] = 157;
		[2] = {
			[1] = "DuplId";
			[2] = "Line";
			[3] = "RoleId";
			[4] = "RoleName";
			[5] = "Score";
		};
	};
	SendMaxConToKsMsg = {
		[1] = 158;
		[2] = {
			[1] = "ContributeValue";
			[2] = "IconId";
			[3] = "Line";
			[4] = "RoleId";
			[5] = "RoleName";
		};
	};
	SendRecordToKsMsg = {
		[1] = 159;
		[2] = {
			[1] = "DuplId";
			[2] = "IconId";
			[3] = "LifeTime";
			[4] = "Line";
			[5] = "RoleId";
			[6] = "RoleName";
		};
	};
	SendZLRecordToKsMsg = {
		[1] = 160;
		[2] = {
			[1] = "IconId";
			[2] = "Line";
			[3] = "LiveTime";
			[4] = "RoleId";
			[5] = "RoleName";
			[6] = "WaveId";
		};
	};
	SetKsFullVersionMsg = {
		[1] = 161;
		[2] = {
			[1] = "Line";
			[2] = "VersionId";
		};
	};
	TGCFMgr_Add_AmuletUpGrade_GM_Msg = {
		[1] = 162;
		[2] = {
			[1] = "Value";
		};
	};
	TGCFMgr_Add_EquipUpGrade_GM_Msg = {
		[1] = 163;
		[2] = {
			[1] = "Value";
		};
	};
	TGCFMgr_Add_JingJieUp_GM_Msg = {
		[1] = 164;
		[2] = {
			[1] = "Value";
		};
	};
	TGCFMgr_Add_MountUpGrade_GM_Msg = {
		[1] = 165;
		[2] = {
			[1] = "Value";
		};
	};
	TGCFMgr_Add_SwordUpGrade_GM_Msg = {
		[1] = 166;
		[2] = {
			[1] = "Value";
		};
	};
	TGCFMgr_SynchFlag_Msg = {
		[1] = 167;
		[2] = {
			[1] = "Flag";
		};
	};
	TongTianTowerUpdateChartMsg = {
		[1] = 168;
		[2] = {
			[1] = "tChart";
		};
	};
	UpdateBuyEscortIDMsg = {
		[1] = 169;
		[2] = {
			[1] = "LineID";
		};
	};
	UpdatePlayerAddictedInfoMsg = {
		[1] = 170;
		[2] = {
			[1] = "Addicted";
			[2] = "RoleID";
		};
	};
	UpdatePlayerGoldInfoMsg = {
		[1] = 171;
		[2] = {
			[1] = "Gold";
			[2] = "RoleID";
		};
	};
	UpdateRoleExpMsg = {
		[1] = 172;
		[2] = {
			[1] = "Exp";
			[2] = "Level";
			[3] = "user";
		};
	};
	UpdateRoleInfoMsg = {
		[1] = 173;
		[2] = {
			[1] = "RoleInfo";
			[2] = "user";
		};
	};
};
