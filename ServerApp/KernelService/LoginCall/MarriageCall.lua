
local function func(objPlayer)
	local Data1 = {};
	local marriageInfo = CMarriageMgr:GetMarriageInfo(objPlayer:GetRoleID());
		local itemEnumId, formerName = CMarriageMgr:GetKeepsakeChangeInfo(objPlayer:GetRoleID());
	if marriageInfo then--����Ƿ��ѻ�
		Data1[1] = true;
		if _G.MarriageSex[objPlayer:GetInfo().dwProf] then
			Data1[2] = marriageInfo.WifeRoleID;     --�����żRoleID
			Data1[3] = marriageInfo.WifeName;       --�����żName
		else
			Data1[2] = marriageInfo.HusbandRoleID;  --�����żRoleID
			Data1[3] = marriageInfo.HusbandName;    --�����żName
		end;
		Data1[4] = marriageInfo.MarriedTime;	    --��ҽ��ʱ��
		Data1[5] = marriageInfo.dwLove;             --�������ܶ�
	else
		Data1[1] = false;
		Data1[2] = 0;
		Data1[3] = "";
		Data1[4] = 0;
		Data1[5] = 0;
	end;
	Data1[10] = itemEnumId;
	Data1[11] = formerName;
	objPlayer:SetLineData("CMarriageSystem_KS", Data1);
end;

CLoginCall:AddCall(func);