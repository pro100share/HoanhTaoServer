
_G.SortQueueConfig = {
	dwEnterInterval = 100; --	 进入游戏的时间间隔
	dwEnterSvrInterval = 490; --	 进入游戏的时间间隔 --服务器端
	dwEnterSvrWaitTime = 35000; --	排队成功后的等待时间
	dwMsgListCount = 5; --发送消息时候，每一次的量
	dwMsgListInterval = 0.1;--发送消息时候的时间间隔
}


--消息类型
_G.S_C_MsgType =
{
    NORMAL              = 0, --转发消息
    HEARTBEATC          = 1, --心跳C
    HEARTBEATS          = 2, --心跳S
    LOGINREQUEST        = 3, --登录请求
    LOGINRESULT         = 4, --登录结果
    REGISTREQUEST       = 5, --注册请求
    REGISTRESULT        = 6, --注册结果
    ENTERQUEUEREQUEST   = 7, --进入队列请求
    ENTERQUEUERESULT    = 8, --进入队列结果
    CANENTERGAME        = 9, --可以进入游戏
    ENTERGAME           = 10, --进入游戏请求
    RECONNECT           = 11, --客户端重连
    CLOSECLIENT         = 12, --断开客户端
    FORBIDCLIENT        = 13, --禁止客户端
	SERVERFULL          = 22, --服务器已满
    ENTERCSQUEUEREQUEST = 25, --进入跨服战服务器请求
};



