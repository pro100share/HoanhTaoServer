-- 跨服战服务器接收到客户端连接
_G.OnAcceptByCrossServiceServer = function (szIP, nNetID)
    CCrossSvrMgr:SendCrossServiceServerInfo(nNetID);
end

-- 跨服战服务器接收到客户端断开连接
_G.OnCloseByCrossServiceServer = function (nNetID)
end

-- 游戏服务器接收到连接跨服战服务器
_G.OnConnectByCrossServiceClient = function ()
    CCrossSvrMgr:SendGameServiceServerInfo();
end

-- 游戏服务器接收到断开连接跨服战服务器
_G.OnCloseByCrossServiceClient = function ()
end
