local dwItemId = 4100514
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil;
	end;
	
	local GoldenBodysys = objPlayer:GetSystem("CGoldenBodySystem");
	local AddAttrSystem = objPlayer:GetSystem("CAddAttrSystem");
	local MaxValue = _G.GoldenBodyConfig.nMaxPractice;
	local AddValue = _G.GoldenBodyConfig.nAddPractice2;
	local NowValue = GoldenBodysys:GetPractice();
	
	if NowValue >= MaxValue then
		sysScript:Notice(13009800003);
		return 0;
	end
	
	if AddAttrSystem:IsCanAddType(6) then
		GoldenBodysys:SetPractice(NowValue + AddValue);
		AddAttrSystem:AddType(6);
	else
		sysScript:Notice(400010001);
		return 0;
	end
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 