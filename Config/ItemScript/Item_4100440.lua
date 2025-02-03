local dwItemId = 4100440  --铁布衫经验药品
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return true;
	end
	local Imp = sysScript:HasAuthority("LronCloth")	
	if not Imp then
		return 13009400101;
	end

	local ctieBuShanSystem = objPlayer:GetSystem('CTieBuShanSystem')
	if not ctieBuShanSystem then
		return 13009400101;
	end
	
	local ClothLevel = ctieBuShanSystem:GetClothLevel()
	--print("LronClothConfig.BasicInfo",#LronClothConfig.BasicInfo);
	if ClothLevel < 100 then
		ctieBuShanSystem:AddProgressValue(5000);
	else 
		return 13009400103;
	end 

	return false;
end
-- -----批量处理脚本
-- --使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
-- function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	-- local objPlayer = objItemSys:GetPlayer();
	-- if not objPlayer then
		-- return nil,0;
	-- end;
	-- local sysScript = objPlayer:GetSystem("CScriptSystem")
	-- if not sysScript then
		-- return true;
	-- end
	-- local Imp = sysScript:HasAuthority("LronCloth")	
	-- if not Imp then
		-- return 13009400101;
	-- end
	
	-- local ctieBuShanSystem = objPlayer:GetSystem('CTieBuShanSystem')
	-- if not ctieBuShanSystem then
		-- return 13009400101;
	-- end
	
	-- local ClothLevel = ctieBuShanSystem:GetClothLevel()
	-- local MaxLevel = 100;
	
	-- if (ClothLevel >= MaxLevel) then
		-- objItemSys:OnError(13009400103);
		-- return false,0
	-- end
	
	-- local lastnum = num;
	-- for i = 1,num do
		-- ClothLevel = ctieBuShanSystem:GetClothLevel()
		-- if(ClothLevel >= MaxLevel) then
			-- lastnum = i;
			-- break;
		-- end
		-- ctieBuShanSystem:AddProgressValue(5000);
	-- end
	-- return true,lastnum;
-- end
-- --使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
-- ----千万  别  返回true!!!!
-- function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	-- local objPlayer = objItemSys:GetPlayer();
	-- if not objPlayer then
		-- return 4000110013;
	-- end;
	-- local ctieBuShanSystem = objPlayer:GetSystem('CTieBuShanSystem')
	-- if not ctieBuShanSystem then
		-- return 13009400101;
	-- end	
	-- ctieBuShanSystem:AddProgressValue(5000*num);	
	
	-- return false;
-- end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )
