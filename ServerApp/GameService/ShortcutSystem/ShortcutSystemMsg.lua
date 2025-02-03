--[[
功能：地图系统消息处理
作者：周华杰
时间：2011-12-22
]]

--请求自己的快捷信息
define.ReadShortuctInfoMsg
{
	user = NONE, 
}
when{ user = NONE }
ReadShortuctInfoMsg = checkUser
when{ }
function ReadShortuctInfoMsg(user)
    local shorSystem = user:GetSystem("CShortcutSystem");
	if not shorSystem then
		return;
	end;
	shorSystem:ReadShortuctInfo();
end


--删除一个快捷信息
define.SendDelShortuctInfoMsg
{
	user = NONE, 
	ShortuctID = 0,
}
when{ user = NONE }
SendDelShortuctInfoMsg = checkUser
when{ }
function SendDelShortuctInfoMsg(user,ShortuctID)
	if not CConfig.bIsCrossSvr then
		 local shorSystem = user:GetSystem("CShortcutSystem");
		if not shorSystem then
			return;
		end;
		shorSystem:SendDelShortuctInfo(ShortuctID);
	end;
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
define.SendAddShortuctInfoMsg
{
	user = NONE, 
	Info = {};
}
when{ user = NONE }
SendAddShortuctInfoMsg = checkUser
when{ }
function SendAddShortuctInfoMsg(user,Info)
	 local shorSystem = user:GetSystem("CShortcutSystem");
	if not shorSystem then
		return;
	end;
	shorSystem:SendAddShortuctInfo(Info);
end
--------------------------------------------------------------------------------------------