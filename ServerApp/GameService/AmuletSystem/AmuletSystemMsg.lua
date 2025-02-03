--[[
功能：宝甲系统消息处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-03-14 
]]

_define()

--客户端熔炼配置存储请求
define.WriteAmuletIntensifyConfigMsg
{
	user = NONE,
	TabInfo = {}
}
when{user = NONE}
WriteAmuletIntensifyConfigMsg = checkUser;
when{}
function WriteAmuletIntensifyConfigMsg(user,TabInfo)
	local objSystem = user:GetSystem("CAmuletSystem");
	objSystem:WriteIntensifyConfig(TabInfo);
end;


--客户端熔炼配置请求
define.AmuletIntensifyConfigMsg
{
	user = NONE,
	TabInfo = {}
}
when{user = NONE}
AmuletIntensifyConfigMsg = checkUser;
when{}
function AmuletIntensifyConfigMsg(user)
	local objSystem = user:GetSystem("CAmuletSystem");
	objSystem:IntensifyConfig();
end;

--客户端熔炼宝甲请求
define.AmuletIntensifyMsg
{
	user = NONE,
	TabInfo = {}
}
when{user = NONE}
AmuletIntensifyMsg = checkUser;
when{}
function AmuletIntensifyMsg(user)
	local objSystem = user:GetSystem("CAmuletSystem");
	objSystem:Intensify();
end;

--客户端升阶宝甲请求
define.AmuletUpgradeMsg
{
	user = NONE,
	TabInfo = {}
}
when{user = NONE}
AmuletUpgradeMsg = checkUser;
when{}
function AmuletUpgradeMsg(user, TabInfo)
	local objSystem = user:GetSystem("CAmuletSystem");
	objSystem:Upgrade(TabInfo);
end;

--客户端牺牲装备请求
define.AmuletSacrificeMsg
{
	user = NONE,
	TabInfo = {}
}
when{user = NONE}
AmuletSacrificeMsg = checkUser;
when{}
function AmuletSacrificeMsg(user, TabInfo)
	local objSystem = user:GetSystem("CAmuletSystem");
	objSystem:Sacrifice(TabInfo);
end;

--客户端一键放入装备请求
define.AmuletOneKeySacrificeMsg
{
	user = NONE,
	TabInfo = {}
}
when{user = NONE}
AmuletOneKeySacrificeMsg = checkUser;
when{}
function AmuletOneKeySacrificeMsg(user, TabInfo)
	local objSystem = user:GetSystem("CAmuletSystem");
	objSystem:OneKeySacrifice(TabInfo);
end;

-- @brief 客户端获取宝甲信息
-- @param dwRoleID number 目标角色id
define.GetAmuletInfoMsg
{
	user = NONE,
    dwRoleID = 0
}
when{user = NONE}
GetAmuletInfoMsg = checkUser;
when{}
function GetAmuletInfoMsg(user, dwRoleID)
    local tSystem = user:GetSystem("CAmuletSystem");
	tSystem:GetAmuletInfo(dwRoleID);
end;

define.AmuletInlayMsg
{
    user = NONE
}
when{user = NONE}
AmuletInlayMsg = checkUser;
when{}
function AmuletInlayMsg(user)
    user:GetSystem("CAmuletSystem"):Inlay();
end;

-- 开始精练
define.AmuletRefineMsg
{
    user = NONE;
	nCount = 0;
}
when{user = NONE}
AmuletRefineMsg = checkUser;
when{}
function AmuletRefineMsg(user,nCount)
   user:GetSystem("CAmuletSystem"):AmuletRefine(nCount);
end;
