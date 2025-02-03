--[[
文件：launch.lua
类名：
功能说明：程序接口部分，主要实现main函数，和更新事件，
备注：
作者：周华杰
版本：
修改者：
]]
--[[
require'clidebug'
_define()

dofile'MyTest/SqlString.lua'
--]] 


_G.NetQueueCount = 200

_G.WarHostFlag = 2; --时间战服务器标志

dofile '../Config/ProjectS.lua'
dofile 'BaseService/Project.lua'	
dofile 'GameService/Project.lua'

_G.initMsgList();

_G.LastUpdateTime = os.now()   
_G.RandomSeedTime = os.now();
_G.dwCollectgarTime = os.now();


_G.RealUpdate = function()
    local nowTime = os.now();
    --e = e or (nowTime - _G.LastUpdateTime);
    local dwInterval = (nowTime - _G.LastUpdateTime);
    _G.LastUpdateTime = nowTime;
    if nowTime > _G.RandomSeedTime then
       math.randomseed(nowTime);
       _G.RandomSeedTime = nowTime + math.random(100, 500);
    end;
    CKernelApp:Update(dwInterval);
    CGameService:Process(dwInterval);
end;

-- _G.Update = function(e)
    -- local ok, err = pcall(_G.RealUpdate);
    -- if not ok then
        -- _err(err);
    -- end;
-- end;

_G.Destroy = function()
    CGameService:Destroy();
end;



CKernelApp:Create()