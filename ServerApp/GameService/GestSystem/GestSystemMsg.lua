--请求修复武尊全章
define.RequestRebuildGestMsg
{
	user = NONE,
}
when{ user = NONE }
RequestRebuildGestMsg = checkUser
when{ }
function RequestRebuildGestMsg(user)
	local gestSystem = user:GetSystem("CGestSystem");
	if not gestSystem then
		return;
	end;
	-- print("=============1===================")
	gestSystem:RebuildGest();
end; 

--请求领悟武尊全章
define.RequestRealizeGestMsg
{
	user = NONE,
}
when{ user = NONE }
RequestRealizeGestMsg = checkUser
when{ }
function RequestRealizeGestMsg(user)
	local gestSystem = user:GetSystem("CGestSystem");
	if not gestSystem then
		return;
	end;
	gestSystem:RealizeGest();
end; 

--请求更新显示武尊全章头像
define.RequestShowGestHeadMsg
{
	user = NONE,
	Pos = 0,
}
when{ user = NONE }
RequestShowGestHeadMsg = checkUser
when{ }
function RequestShowGestHeadMsg(user, Pos)
	local gestSystem = user:GetSystem("CGestSystem");
	if not gestSystem then
		return;
	end;
	gestSystem:ShowGestHead(Pos);
end; 

--请求查看目标武尊全章
define.RequestOhterGestMsg
{
	user = NONE,
	RoleID = 0,
}
when{ user = NONE }
RequestOhterGestMsg = checkUser
when{ }
function RequestOhterGestMsg(user, RoleID)
	local gestSystem = user:GetSystem("CGestSystem");
	if not gestSystem then
		return;
	end;
	gestSystem:ViewOtherGest(RoleID);
end; 