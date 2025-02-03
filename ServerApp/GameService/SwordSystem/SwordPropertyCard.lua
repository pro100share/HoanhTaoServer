--[[
	宝剑系统之特殊属性卡片
	魏云
	2013-12-10
]]


-----使用名剑特殊属性卡片道具
function CSwordSystem:UsePropertyCardItem(itemID)
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return 1;
	end
	if(self.useCardState ~= 0) then
		return 2;
	end
	local swordObj = self.SwordObj;
	if(itemID ~= swordObj:GetPropertyCardItemID()) then
		return 3;
	end
	self.useCardState = 1;
	self:SavePropertyCardState(self.useCardState);
	objPlayer.SynUsePropertyCardStateMsg{UseCardState = self.useCardState};
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return;
	end
	sysScript:Notice(1300081004)
end

-----激活名剑特殊属性卡片技能
function CSwordSystem:ActivatePropertyCardSkill()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(self.useCardState ~= 1) then
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return;
	end
	local swordObj = self.SwordObj;
	local conInfo = swordObj:GetActProCardConInfo();
	if(conInfo.itemNum < 1) then
		return ;
	end
	local packNum = objItemSystem:GetEnumItemNumInPacket(conInfo.itemID)
	if(packNum < conInfo.itemNum) then
		return;
	end
	local isSucc = objItemSystem:DelEnumItemInPacket(conInfo.itemID,conInfo.itemNum,true, _G.ItemSysOperType.Sword) 
	if(not isSucc) then
		return;
	end
	self.useCardState = 2;
	self:SavePropertyCardState(self.useCardState);
	self:AppendSwordProperty();
	objPlayer.SynUsePropertyCardStateMsg{UseCardState = self.useCardState};
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if(not sysScript) then
		return;
	end
	sysScript:Notice(1300081003)
end

-----特殊属性卡片状态存入数据库
function CSwordSystem:SavePropertyCardState(state)
	self.objDBQuery:UpdateSwordPropertyState(state);
end

----增加特殊属性卡片属性加成
function CSwordSystem:GetAddPropertyCardAttr()
	if(self.useCardState ~= 2) then
		local attr = _G.SSingleAttrChange:new();
		return attr;
	end
	local swordObj = self.SwordObj;
	local attrInfo = swordObj:GetAddProCardAttr()
	return attrInfo;
end

----获取特殊属性卡片评分
function CSwordSystem:GetCardMarkValueStr()
	if(self.useCardState ~= 2) then
		return 0;
	end
	local swordObj = self.SwordObj;
	local cardMarkValue = swordObj:GetCardMarkValue()
	return cardMarkValue;
end

----获取卡片状态
function CSwordSystem:GetPropertyCardState()
	return self.useCardState;
end