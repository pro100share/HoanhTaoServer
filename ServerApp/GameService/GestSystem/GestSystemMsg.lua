--�����޸�����ȫ��
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

--������������ȫ��
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

--���������ʾ����ȫ��ͷ��
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

--����鿴Ŀ������ȫ��
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