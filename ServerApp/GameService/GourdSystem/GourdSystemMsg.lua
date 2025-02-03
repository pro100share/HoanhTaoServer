
--[[
	时间：2014-1-2
	功能：酒葫芦消息类
	作者：魏云
--]]

-----提交物品获取熟练度
define.RequestHandInItemMsg
{
	user = NONE,
	Index = 0,
};
when {user = NONE}
RequestHandInItemMsg = checkUser;
when{}
function RequestHandInItemMsg(user,Index)
	local Sys = user:GetSystem("CGourdSystem");
	if not Sys then
		return;
	end;
	Sys:HandInItem(Index);
end

---热更新
define.Gourd_KSGourdHotUpdateMsg
{
};
when{}
function Gourd_KSGourdHotUpdateMsg()
	UpdateGourdConfig:Reload()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
		local Sys = user:GetSystem("CGourdSystem");
		if not Sys then
			return;
		end;
		Sys:GourdHotUpdate();
	end
end

----清热更新
define.Gourd_KSClearHotUpdateInfoMsg
{
	
};
when{}
function Gourd_KSClearHotUpdateInfoMsg()
	if(_G.UpdateGourdCofig) then
		_G.UpdateGourdCofig.bOpen = false;
	end
end

----清随机倍数
define.Gourd_KSClearAddTimesInfoMsg
{
	
};
when{}
function Gourd_KSClearAddTimesInfoMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
		local Sys = user:GetSystem("CGourdSystem");
		if not Sys then
			return;
		end;
		Sys:ClearAddTimesInfo();
	end
end

--查看对方葫芦信息
define.ViewOtherGourdMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
ViewOtherGourdMsg = checkUser
when{ }
function ViewOtherGourdMsg(user, RoleID)
	local sys = user:GetSystem("CGourdSystem");
	if not sys then
		return;
	end;
	sys:ViewOtherGourd(RoleID);
end

----广播
define.GourdBroadCastAddLevelMsg
{
	RoleID	= 0,
	RoleName= "",
	Level = 0,
}
when{}
function GourdBroadCastAddLevelMsg(RoleID,RoleName,Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltGourdBroadCastAddLevelMsg", {RoleID = RoleID,RoleName = RoleName,Level = Level});	
end

----佩戴葫芦
define.AdornGourdMsg
{
	user = NONE,
	Level = 0,
}
when{ user = NONE }
AdornGourdMsg = checkUser
when{ }
function AdornGourdMsg(user,Level)
	local sys = user:GetSystem("CGourdSystem");
	if not sys then
		return;
	end;
	sys:AdornGourd(Level);
end

