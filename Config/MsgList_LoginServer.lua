_G.MsgList_LoginServer =
{
	CreateRoleMsg = {
		[1] = 1;
		[2] = {
			[1] = "Face";
			[2] = "Hair";
			[3] = "IncoID";
			[4] = "RoleName";
			[5] = "RoleProf";
			[6] = "RoleSex";
			[7] = "SuitID";
			[8] = "UF";
			[9] = "user";
		};
	};
	CreateSessionMsg = {
		[1] = 2;
		[2] = {
			[1] = "AccountID";
			[2] = "AdultFlag";
			[3] = "FirstLogin";
			[4] = "Index";
			[5] = "Sign";
			[6] = "Time";
			[7] = "UF";
		};
	};
	DeleteRoleInfoMsg = {
		[1] = 3;
		[2] = {
			[1] = "RoleID";
			[2] = "user";
		};
	};
	GetGameLineInfoMsg = {
		[1] = 4;
		[2] = {
			[1] = "user";
		};
	};
	OnKSLoginCheckOverMsg = {
		[1] = 5;
		[2] = {
			[1] = "AccountID";
		};
	};
	OnSelectLineRtMsg = {
		[1] = 6;
		[2] = {
			[1] = "AccountID";
			[2] = "LineID";
			[3] = "ResultCode";
			[4] = "Sing";
		};
	};
	ReadRoleMsg = {
		[1] = 7;
		[2] = {
			[1] = "user";
		};
	};
	RequestTimeMsg = {
		[1] = 8;
		[2] = {
			[1] = "ReqTime";
			[2] = "user";
		};
	};
	SelectGameLineMsg = {
		[1] = 9;
		[2] = {
			[1] = "GameLine";
			[2] = "UF";
			[3] = "user";
		};
	};
	SelectRoleMsg = {
		[1] = 10;
		[2] = {
			[1] = "RoleID";
			[2] = "user";
		};
	};
	UpdateGameLineInfoMsg = {
		[1] = 11;
		[2] = {
			[1] = "InfoSet";
			[2] = "LineNum";
		};
	};
	WriteInfoToDBMsg = {
		[1] = 12;
		[2] = {
			[1] = "OperFlag";
			[2] = "RoleID";
			[3] = "user";
		};
	};
};
