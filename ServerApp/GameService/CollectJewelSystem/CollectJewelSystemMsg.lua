--[[
	--���ܣ�������ϵͳ��Ϣ
	--���ߣ�κ��
	--ʱ�䣺2013-11-22
--]]

--�������������
define.RequestOpenCollectJewelMsg
{
	user = NONE,
	CollJewType = 0;
};
when {user = NONE}
RequestOpenCollectJewelMsg = checkUser;
when{}
function RequestOpenCollectJewelMsg(user,CollJewType)
	local collJewSys = user:GetSystem("CCollectJewelSystem");
	if not collJewSys then
		return;
	end;
	collJewSys:OpenCollectJewel(CollJewType);
end

-----���ע��
define.RequestStartCollectJewelMsg
{
	user = NONE,
	CollJewType = 0;
};
when {user = NONE}
RequestStartCollectJewelMsg = checkUser;
when{}
function RequestStartCollectJewelMsg(user,CollJewType)
	local collJewSys = user:GetSystem("CCollectJewelSystem");
	if not collJewSys then
		return;
	end;
	collJewSys:StartCollectJewel(CollJewType);
end

----����ջ�
define.GetCollectJewelAwardMsg
{
	user = NONE,
	CollJewType = 0;
};
when {user = NONE}
GetCollectJewelAwardMsg = checkUser;
when{}
function GetCollectJewelAwardMsg(user,CollJewType)
	local collJewSys = user:GetSystem("CCollectJewelSystem");
	if not collJewSys then
		return;
	end;
	collJewSys:GetCollectJewelAward(CollJewType);
end

----��ȡ�ջ����㲥
define.BroadCastGetCollectJewelAwardMsg
{
	RoleID	= 0,
	RoleName= "",
	CollJewType = 0,
	AwardInfo = {};
};
when{}
function BroadCastGetCollectJewelAwardMsg(RoleID,RoleName,CollJewType,AwardInfo)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastGetCollectJewelAwardMsg", {RoleID = RoleID,RoleName = RoleName,CollJewType = CollJewType,AwardInfo = AwardInfo});	
end

-----reset ע�����
define.KSClearCollectJewelInfoMsg
{
	
};
when{}
function KSClearCollectJewelInfoMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("CCollectJewelSystem");
		if not sys then
			return;
		end;
		sys:ClearCollectJewelInfo(true); 
	end
end

----ϵͳ��������
define.KSStartCollectJewelMsg
{

};
when{}
function KSStartCollectJewelMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("CCollectJewelSystem");
		if not sys then
			return;
		end;
		sys:StartAllCollectJewel(); 
	end
end
