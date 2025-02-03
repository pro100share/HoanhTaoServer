--请求增加宠物资质
define.ReqAddAptitudeMsg
{
	user = NONE,
	DwType = 0,
	DwPetId = 0,
}
when{ user = NONE }
ReqAddAptitudeMsg = checkUser
when{ }
function ReqAddAptitudeMsg(user, DwType, DwPetId)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	-- print ("111111111111111")
	-- print ("222222222222222")
	petSystem.petAptitude:AddPetAptitudeValue(DwType, DwPetId);
end; 

--查看指定宠物资质
define.ViewPetAptitudeMsg
{
	user = NONE,
	RoleID = 0, 
	PetId = 0,
}
when{ user = NONE }
ViewPetAptitudeMsg = checkUser
when{ }
function ViewPetAptitudeMsg(user, RoleID, PetId)
	local petSystem = user:GetSystem("CPetSystem");
	if not petSystem then
		return;
	end;
	petSystem:ViewOtherPetAptitude(RoleID, PetId);
end; 