_unpack("ServerApp.dat");
_G.szDBServerIP 			= "127.0.0.1";	--数据库所在服务器的ip
_G.dwServerHostID			= 1; 					--游戏服务器的主机id
_G.dwAccServiceIP           = '127.0.0.1:2223';  	--GM服务器IP
_G.bConnectDataCenter		= 0;					--数据中心地址
_G.bConnectAs				= 0;					--是否连接as
_G.dwCrossServiceServerIP   =  "127.0.0.1";
dofile '../ServerConfig/ConfigS.lua';
