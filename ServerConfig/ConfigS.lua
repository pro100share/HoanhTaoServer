_unpack("ServerApp.dat");
_G.LOGFILELV = 'info'
_G.LOGCONSOLELV = 'DEBUG'
_G.LOGFILE = true
_G.LOGCONSOLE = true

_G.CConfig = {}
_G.CConfig.bPrintMsgList = true;

CConfig.szDBIP = "127.0.0.1:5432";
CConfig.szDBUser = "postgres";
CConfig.szDBPwd = "HoanhTaoThienHa@@";

CConfig.szAdmDBIP =  "127.0.0.1:5432";
CConfig.szAdmDBUser = "postgres";
CConfig.szAdmDBPwd = "HoanhTaoThienHa@@"; 

CConfig.bIsCrossSvr = false;        --�Ƿ���ս������
CConfig.bConnectCrossSvr = true;    --�Ƿ����ӿ��ս������

--����˿�
CConfig.Network = {}; 
CConfig.Network.dwServerHostID			= dwServerHostID; 							--��Ϸ������������id 
CConfig.Network.dwAccServiceIP          = dwAccServiceIP;  				--GM������IP
CConfig.Network.bConnectDataCenter		= bConnectDataCenter;			--�������ĵ�ַ
CConfig.Network.bConnectAs				= bConnectAs;					--�Ƿ�����as

CConfig.Network.strKernelService		= tostring((dwServerHostID*10)+1);					--���ķ�����
CConfig.Network.strProxyService			= tostring((dwServerHostID*10)+2);					--���������
CConfig.Network.strDataService			= tostring((dwServerHostID*10)+3);					--���ݷ�����
CConfig.Network.strLogService			= tostring((dwServerHostID*10)+4);					--��̨��־������
CConfig.Network.strPrintService			= tostring((dwServerHostID*10)+5);					--������־������
CConfig.Network.strTransService			= tostring((dwServerHostID*10)+6);					--ת��������
CConfig.Network.strLsProxyService		= tostring((dwServerHostID*10)+7);					--��¼�������ת��
CConfig.Network.strCrossServiceServer   = dwCrossServiceServerIP; --���������

CConfig.Network.szDeptID				= 1;						--ƽ̨ID
CConfig.Network.szDataCenterIP			= "127.0.0.1:8080";				--��������ID
CConfig.Network.szDataCenterSubAddr		= "/DataService/postapi";	--�������ĵ�ַ
CConfig.Network.szDataCenterPage		= "htm"						--��������ҳ��
CConfig.Network.szLogFilePath			= "../Log/data";			--������־Ŀ¼

CConfig.Network.nTimezone				= 7 * 60 * 60;				--ʱ��(��)

CConfig.Network.dwClientForbidTime		= 1 * 60 * 60 * 1000;			--�쳣���ֹ����ʱ��

CConfig.ProxyServiceNetwork = {
        nPlayerInLoginNum						= 1000;
        nPlayerInGameNum						= 1000;
        
        dwMaxConnectionFromClient               = 3500;
        dwMaxMessageLengthFromClient            = 2 * 1024;
        dwMaxBufferSizeFromClient               = 10 * 1024;
        
        dwMaxConnectionFromServer               = 20;
        dwMaxMessageLengthFromServer            = 4096 * 100000 + 4096;
        dwMaxBufferSizeFromServer               = 10 * 100000 + 10;
        
        dwGSProxyCount							= 3;
        dwProxyServicePortC						= 8000 + ((toint(dwServerHostID)-1) * 3);
};

CConfig.KernelServiceNetwork =
{
        dwMaxConnectionFromGameService          = 20;
        dwMaxMessageLengthFromGameService       = 4096 * 100000 + 4096;
        dwMaxBufferSizeFromGameService          = 10 * 100000 + 10;
};

CConfig.DataServiceNetwork =
{
        dwMaxConnectionFromGameService          = 20;
        dwMaxMessageLengthFromGameService       = 512 * 100000 + 2048;
        dwMaxBufferSizeFromGameService          = 10 * 100000 + 10;
};

CConfig.LogServiceNetwork = {
        dwMaxConnectionFromServer               = 20;
        dwMaxMessageLengthFromServer            = 1024 * 100000 + 1024;
        dwMaxBufferSizeFromServer               = 10 * 100000 + 10;
        
        dwMaxMessageLengthFromDataCenter        = 1024 * 4;
        dwMaxBufferSizeFromDataCenter           = 1024 * 120;
}

CConfig.CrossServiceNetwork = {
        dwPort                                  = 8081;
        dwMaxConn                               = 1;
        dwMaxMsgLen                             = 1024 * 4 + 1;
        dwMaxBuffSize                           = 1024 * 120;
};

--�˺����ݿ�
CConfig.AccountDB =
{
	ConnParam = {
		szConnectStr = CConfig.szDBIP;
		szUser=CConfig.szDBUser;
		szPwd= CConfig.szDBPwd;
		szDBName="acc1";
	};
	bTestServerDB = true;
};
--��ɫ���ݿ�
CConfig.RoleDB =
{
	ConnParam = {
		szConnectStr = CConfig.szDBIP;
		szUser = CConfig.szDBUser;
		szPwd= CConfig.szDBPwd;
		szDBName="game1";
	};
	dwDBRoleMaxCount = 10000000;
	dwSyncInterval = 10000;
};
--�������ݿ�
CConfig.szCogPath="../terrain/";
