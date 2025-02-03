_G.MsgList_AccServer =
{
	DoChargeOperMsg = {
		[1] = 1;
		[2] = {
			[1] = "Account";
			[2] = "Glod";
			[3] = "HostID";
			[4] = "Money";
			[5] = "OrderID";
			[6] = "Sign";
			[7] = "Time";
		};
	};
	DoRegisterAccountMsg = {
		[1] = 2;
		[2] = {
			[1] = "Account";
			[2] = "HostID";
			[3] = "Password";
		};
	};
	GameServerRecordMsg = {
		[1] = 3;
		[2] = {
			[1] = "HostID";
			[2] = "Msg";
			[3] = "Request";
		};
	};
	GameServerRegMsg = {
		[1] = 4;
		[2] = {
			[1] = "ADBConnParam";
			[2] = "GDBConnParam";
			[3] = "HostID";
			[4] = "HostIP";
			[5] = "HostName";
			[6] = "HostPort";
		};
	};
	GetDefineMsg = {
		[1] = 5;
	};
	LoginMsg = {
		[1] = 6;
		[2] = {
			[1] = "Account";
			[2] = "HostID";
			[3] = "Password";
		};
	};
	RecordAccStateInfoMsg = {
		[1] = 7;
		[2] = {
			[1] = "AccID";
			[2] = "HostID";
			[3] = "State";
		};
	};
	RecordGameDataMsg = {
		[1] = 8;
		[2] = {
			[1] = "Param";
			[2] = "Type";
		};
	};
};
