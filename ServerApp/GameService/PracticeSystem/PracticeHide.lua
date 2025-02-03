--[[
功能：修行隐藏属性
作者：魏云
时间：2014-01-20
]]

-----升隐藏属性等级
function CPracticeSystem:UpLevelHideAttr()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return;
	end
	local openProg = PracticeHideBaseConfig:GetHideAttrOpenProg();
	local curProg = self:GetPracticeLevel();
	local curProgress = self:GetPracticeProgress();
	if(curProg < openProg and curProgress == BookConfig[curProg].dwValue ) then
		return;
	end
	local curHideLevel = self:GetHideAttrLevel();
	local conInfos = PracticeHideBaseConfig:GetPraHideCons(curHideLevel+1);
	if(not conInfos) then
		return;
	end
	if(conInfos.ItemNum < 0) then
		return ;
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(conInfos.ItemID);
	if(packNum < conInfos.ItemNum) then
		return;
	end
	local isSucc = objItemSystem:DelEnumItemInPacket(conInfos.ItemID,conInfos.ItemNum,true, _G.ItemSysOperType.Practice) 
	if not isSucc then
		return ;
	end
	self:SetHideAttrLevel();
	self:AddPracticeHideProperty();
	objPlayer.PracticeSys_UpLevelHideAttrBackMsg{HideAttrLevel = self:GetHideAttrLevel()};
	self:SaveHideAttrDB();
end
----存入数据库
function CPracticeSystem:SaveHideAttrDB()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	self.objDBQuery:UpdateHideAttrInfo(objPlayer:GetRoleID(),self:GetHideAttrLevel());
end
----加隐藏属性
function CPracticeSystem:AddPracticeHideProperty()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local t_attr =  _G.SSingleAttrChange:new(); 
	local infos = PracticeHideBaseConfig:GetPraHideAttr(self.dwCurHideLevel);
	if(not infos) then
		return;
	end
	t_attr:AddValue(infos);
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	skillSystem:NotifyPracticeProperty(t_attr,2);
end

----获取隐藏属性等级
function CPracticeSystem:GetHideAttrLevel()
	return self.dwCurHideLevel;
end

----设置隐藏属性等级
function CPracticeSystem:SetHideAttrLevel()
	self.dwCurHideLevel = self.dwCurHideLevel + 1;
end

