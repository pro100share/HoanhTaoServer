--[[
	--���ܣ�������ȼ�ϵͳ��Ϣ
	--���ߣ�κ��
	--ʱ�䣺2013-12-13
--]]

--�������������
define.RequestOpenCollectJewelLevelMsg
{
	user = NONE,
	CollJewType = 0;
};
when {user = NONE}
RequestOpenCollectJewelLevelMsg = checkUser;
when{}
function RequestOpenCollectJewelLevelMsg(user,CollJewType)
	local collJewSys = user:GetSystem("CCollectJewelLevelSystem");
	if not collJewSys then
		return;
	end;
	collJewSys:OpenCollectJewel(CollJewType);
end


----����ջ�
define.GetCollectJewelLevelAwardMsg
{
	user = NONE,
	CollJewType = 0;
	Level = 0;
};
when {user = NONE}
GetCollectJewelLevelAwardMsg = checkUser;
when{}
function GetCollectJewelLevelAwardMsg(user,CollJewType,Level)
	local collJewSys = user:GetSystem("CCollectJewelLevelSystem");
	if not collJewSys then
		return;
	end;
	collJewSys:GetCollectJewelAward(CollJewType,Level);
end
