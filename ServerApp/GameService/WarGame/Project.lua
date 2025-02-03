--如果开放主机就加载主机文件否则就不加载
if _G.WarHostFlag == 1 then
	dofile 'GameService/WarGame/WarHost.lua'
else
	dofile 'GameService/WarGame/WarEmptyHost.lua'
end
dofile 'GameService/WarGame/WarJoin.lua'
dofile 'GameService/WarGame/WarSystem.lua'
dofile 'GameService/WarGame/WarObject.lua'
dofile 'GameService/WarGame/WarGameMsg.lua'
