_G.MsgList_DBServer =
{
	CheckExecIsFinishMsg = {
		[1] = 1;
		[2] = {
			[1] = "AccID";
			[2] = "AppID";
			[3] = "MaxID";
		};
	};
	CmdIdentifyMsg = {
		[1] = 2;
		[2] = {
			[1] = "Cmd";
			[2] = "CmdID";
		};
	};
	CmdRequestMsg = {
		[1] = 3;
		[2] = {
			[1] = "AccID";
			[2] = "Arg";
			[3] = "CmdID";
		};
	};
	GetDefineMsg = {
		[1] = 4;
	};
	RegDBProxyMsg = {
		[1] = 5;
		[2] = {
			[1] = "AppID";
			[2] = "ConnectParam";
		};
	};
};
