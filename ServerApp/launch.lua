--[[
文件：launch.lua
类名：
功能说明：程序接口部分，主要实现main函数，和更新事件，
备注：
作者：周华杰
版本：
修改者：
]]

dofile 'base.lua'
dofile 'json.lua'
dofile '../Config/ProjectS.lua'
dofile '../Data/Include.lua'

_G.KoreaAvoidAddicted = (SERVERVERSION==106); --是否启用韩版防沉迷

_define();
_setLogNetID(CConfig.Network.strPrintService);
_G.NONE = {}

_G.MsgProto = {
    MSG_CLIENT = 0,
    MSG_ROBOT = 1,
    MSG_GSERVER = 2,
    MSG_KSERVER = 3,
    MSG_LSERVER = 4,
    MSG_END = 5
};

function _G._mycallout(obj)
	if getmetatable(obj) then
        return;
    end;
    setmetatable(obj, {
        __index = function(obj, func)
            if type(func) =='string' and func:byte(1) >= 65 and func:byte(1) <= 91 then
                return function(arg)
                    if obj.objNet then
                        _callout(obj.objNet, func, arg); 
                    elseif obj.objLineNet then
                        arg._aid = obj:GetAccountID();
                        _callout(obj.objLineNet, func, arg);
                    else
                        -- print("---------------");
                    end;
                end;
            end;
        end;
    });
end;

local function GetStrByParam(...)
	local cnt = select('#',...)
	local args={...}
	local err=''
	for i=1,cnt do
		err = err..'	'..tostring(args[i])
	end
	err = err=='' and 'nil' or err; 
	return err;
end;

local setStartName = 
{
	ls="LogServer.lua";
    lis="LoginServer.lua";
	ks="KernelServer.lua";
    ps="ProxyServer.lua";
	ds="DataServer.lua";
    gs="GameServer.lua";
    ws="WarServer.lua";
    dus="DuplServer.lua";
}

dofile 'MsgListDefine.lua'; 
local szParam = os.info[2] or "gs";
local szFile = setStartName[szParam]; 

_G.PrintMsgToFile = "";
if szParam:lead("lis") then
    _G.PrintMsgToFile = "MsgList_LoginServer";
elseif szParam:lead("ks") then
    _G.PrintMsgToFile = "MsgList_KernelServer";
else
    _G.PrintMsgToFile = "MsgList_GameServer";
end;

if szFile then
	dofile(szFile);
end;