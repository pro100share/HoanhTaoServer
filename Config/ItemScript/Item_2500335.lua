local dwItemId = 2500335
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--ʹ����Ʒ
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	
	local bUse = false;
	local dwError = 0;
	--Ѫ
	local corssSys = objPlayer:GetSystem("CCrossSvrSystem");
	local dwHonor = corssSys:GetCrossHonor();
	dwHonor = dwHonor + 50;
	
	if corssSys:SetCrossHonor(dwHonor) then
		bUse = true;
	else
		dwError = 13009300023;
	end;
	
	if not bUse then return dwError end;
end

-----��������ű�
--ʹ�ü��(nil���޷�ʹ�ã�0��ֱ��ʹ�ã�����������ʱ��(��λ������))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local lastnum = num;
	return true,lastnum;
end
--ʹ����Ʒ(nil or false:��Ҫɾ��;	��������:��ɾ��;  0Ϊû��ԭ�򣬾��ǲ�ɾ;  >0Ϊ������ʾ)
----ǧ��  ��  ����true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local corssSys = objItemSys:GetPlayer():GetSystem("CCrossSvrSystem");
	local bUse = false;
	local dwError = 0;
	local dwHonor = corssSys:GetCrossHonor() + 50 * num;
	
	if corssSys:SetCrossHonor(dwHonor) then
		bUse = true;
	else
		dwError = 13009300023;
	end;
	
	if not bUse then return dwError end;
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )

	
