--[[
文件：launch.lua
类名：
功能说明：程序接口部分，主要实现main函数，和更新事件，
备注：
作者：周华杰
版本：
修改者：
]]

dofile '../Config/ProjectS.lua' 
dofile 'BaseService/Project.lua'	
dofile 'KernelService/Project.lua'

_G.initMsgList();


_G.LastUpdateTime = _now()   
_G.RandomSeedTime = _now();
_G.dwCollectgarTime = _now();

_G.RealUpdate = function()
    local nowTime = _now();
    --e = e or (nowTime - _G.LastUpdateTime);
    local dwInterval = (nowTime - _G.LastUpdateTime);
    _G.LastUpdateTime = nowTime;
    if nowTime > _G.RandomSeedTime then
        math.randomseed(nowTime);
        _G.RandomSeedTime = nowTime + math.random(100, 500);
    end;
    CKernelService:Update(dwInterval);
end;

-- _G.Update = function(e)
    -- local ok, err = pcall(_G.RealUpdate);
    -- if not ok then
        -- _err(err);
    -- end;
-- end;

_G.Destroy = function()
    CKernelService:Destroy();
end;






_info'Start KernelService Begin';
if not CKernelService:Create() then
    _info'Start KernelService Fail';
    return;
end;
_info 'Start KernelService Success';


-- _ksvr:onUpdate(_G.Update);
_startupdate("RealUpdate");

_ksvr:onDestroy(_G.Destroy);


