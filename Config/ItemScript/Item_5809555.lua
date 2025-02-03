local dwItemId = 5809555
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

local BuffList = {50700001,50700002,50700003,50700004,50700005,50700006,50700007,50700012,50700013};

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 0;
	end
	
	local scriptSystem = objPlayer:GetSystem('CScriptSystem');
	if not scriptSystem then
		return 0;
	end
	
	local MapID,Selfx,Selfy = scriptSystem:GetMapPos();	
	--print( "Selfx,Selfy===============================",Selfx,Selfy )
	
	local TargetPlayer,dwTargetID = scriptSystem:IsLockPlayer()
	local TargetSysScript = scriptSystem:GetScriptByRoleID(dwTargetID)
	
	--print( "TargetPlayer======================================",TargetPlayer )
	--print( "TargetSysScript======================================",TargetSysScript )
	if TargetPlayer then	
		local TargetMapID,Targetx,Targety = TargetSysScript:GetMapPos();
		--print( "Targetx,Targety===============================",Targetx,Targety )		
		
		if (Selfx-Targetx)^2 + (Selfy-Targety)^2 < 100 then
			--print( "(Selfx-Targetx)^2 + (Selfy-Targety)^2=========",(Selfx-Targetx)^2 + (Selfy-Targety)^2 )
			local dwRand = math.random(#BuffList);
			--local objBuffSys = TargetPlayer:GetSystem("CBuffSystem");
			--local buff = objBuffSys:GetBuffObj(dwRand);
			-- print( "buff========================",buff )
			-- if not buff then
				objPlayer:GetSystem('CBuffSystem'):AddBuff(50700015,1);
				scriptSystem:AddTargetBuff(BuffList[dwRand]);	
				return false;
			-- else
				-- return 13009100102;
			-- end
		else
			return 3003010004;
		end
	end
	
	return 3003010003;
	
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 