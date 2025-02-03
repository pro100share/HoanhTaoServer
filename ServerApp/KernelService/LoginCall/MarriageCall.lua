
local function func(objPlayer)
	local Data1 = {};
	local marriageInfo = CMarriageMgr:GetMarriageInfo(objPlayer:GetRoleID());
		local itemEnumId, formerName = CMarriageMgr:GetKeepsakeChangeInfo(objPlayer:GetRoleID());
	if marriageInfo then--玩家是否已婚
		Data1[1] = true;
		if _G.MarriageSex[objPlayer:GetInfo().dwProf] then
			Data1[2] = marriageInfo.WifeRoleID;     --玩家配偶RoleID
			Data1[3] = marriageInfo.WifeName;       --玩家配偶Name
		else
			Data1[2] = marriageInfo.HusbandRoleID;  --玩家配偶RoleID
			Data1[3] = marriageInfo.HusbandName;    --玩家配偶Name
		end;
		Data1[4] = marriageInfo.MarriedTime;	    --玩家结婚时间
		Data1[5] = marriageInfo.dwLove;             --伴侣亲密度
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