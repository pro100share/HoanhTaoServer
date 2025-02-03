dofile '../Config/ProjectS.lua'
-- local szAddress		= CConfig.RoleDB.ConnParam.szConnectStr;
-- local szUser		= CConfig.RoleDB.ConnParam.szUser;
-- local szPassword	= CConfig.RoleDB.ConnParam.szPwd;
-- local szDatabase	= CConfig.RoleDB.ConnParam.szDBName;
-- _dsvr:ConnectDB(szAddress, szUser, szPassword, szDatabase);

-- local dwInterval	= CConfig.RoleDB.dwSyncInterval;
-- _dsvr:SetInterval(dwInterval);

-- local tTable		= DBConfig.TableNtS;
-- local tIndex		= DBConfig.IndexNtS;
-- local tField		= DBConfig.FieldNtS;
-- _dsvr:SetTable(tTable, tIndex, tField);

-- local szAddress		= CConfig.Network.strDataService;
-- local dwCount		= CConfig.DataServiceNetwork.dwMaxConnectionFromGameService;
-- local dwLength		= CConfig.DataServiceNetwork.dwMaxMessageLengthFromGameService/100000;
-- local dwSize		= CConfig.DataServiceNetwork.dwMaxBufferSizeFromGameService;
-- _dsvr:ListenNet(szAddress, dwCount, dwLength, dwSize);
  
local DataConfig = { 
	szDBAddress		= CConfig.RoleDB.ConnParam.szConnectStr;
	szDBUser		= CConfig.RoleDB.ConnParam.szUser;
	szDBPwd			= CConfig.RoleDB.ConnParam.szPwd;
	szDBName		= CConfig.RoleDB.ConnParam.szDBName;

	dwInterval		= CConfig.RoleDB.dwSyncInterval; 
	dwThCount		= 2;
	tTable			= DBConfig.TableNtS;
	tIndex			= DBConfig.IndexNtS;
	tField			= DBConfig.FieldNtS; 

	szAddress		= CConfig.Network.strDataService;
	dwCount			= CConfig.DataServiceNetwork.dwMaxConnectionFromGameService;
	dwLength		= CConfig.DataServiceNetwork.dwMaxMessageLengthFromGameService/100000;
	dwSize			= CConfig.DataServiceNetwork.dwMaxBufferSizeFromGameService;
}  
local function MakeConfig() 
	return DataConfig;
end; 
return MakeConfig();



