local dwItemId = 9405053  --坐骑经验丹5000000
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
		return 0;
	end
	local ChackSys = sysScript:HasAuthority("Mount")	
	if not ChackSys then
		objItemSys:OnError(9000210008);
		return 0;
	end
	
	local dwCurLevel = objPlayer:GetLevel();
	
	local cmountSystem = objPlayer:GetSystem('CMountSystem')
	if not cmountSystem then
		objItemSys:OnError(9000210008);
		return 0;
	end
	
	--获得当前坐骑对象
	local mountInst = cmountSystem:GetMountInst(cmountSystem.n_ActiveMountID);
	if not mountInst then
		return 0;
	end 
	--获得当前坐骑的ID
	local MountID = mountInst:GetEnumID()	

	--获得当前坐骑的最大等级
	local dwMountMaxLv = _G.CMountTable[MountID].maxLevel
	--获得当前坐骑的最小等级
	local dwMountMinLv = _G.CMountTable[MountID].minLevel		
	
	--获得当前坐骑的等级
	local mountCurLv = mountInst:GetLevel()
	if(mountCurLv  >= dwMountMaxLv) or ( mountCurLv >= dwCurLevel )then
		objItemSys:OnError(7000160074);
		return 0;
	end
	
	local chack = cmountSystem:UseItemAddExp(5000000)
	if chack then
		return 0; 
	end
	
	return false;
end


-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return false,0
	end
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local ChackSys = sysScript:HasAuthority("Mount")	
	if not ChackSys then
		return false,9000210008;
	end
	local cmountSystem = objPlayer:GetSystem('CMountSystem')
	if not cmountSystem then
		return false,9000210008;
	end
	
	local dwCurLevel = objPlayer:GetLevel();
	
	--获得当前坐骑对象
	local mountInst = cmountSystem:GetMountInst(cmountSystem.n_ActiveMountID);
	if not mountInst then
		return 0;
	end 
	--获得当前坐骑的ID
	local MountID = mountInst:GetEnumID()	

	--获得当前坐骑的最大等级
	local dwMountMaxLv = _G.CMountTable[MountID].maxLevel
	--获得当前坐骑的最小等级
	local dwMountMinLv = _G.CMountTable[MountID].minLevel		
	
	--获得当前坐骑的等级
	local mountCurLv = mountInst:GetLevel()
	
	if(mountCurLv  >= dwMountMaxLv) or ( mountCurLv >= dwCurLevel )then
		return false,7000160074
	end
	
	-- --获得当前坐骑升满所需经验
	-- local MaxExp = 0;
	-- for k = mountCurLv,(dwMountMaxLv-1) do
		-- MaxExp = MaxExp + _G.MountUpLevelNeedExp[k];
	-- end
	
	--获得当前坐骑经验
	local curLvMountExp = mountInst:GetExp();	
	local k = mountCurLv
	local lastnum = num;
	for i = 1,num do
		curLvMountExp = curLvMountExp + 5000000;
		-- print("=====curLvMountExp==11===========",curLvMountExp)
		-- print("=====i==11===========",i)
		-- print( "k==============",k )
		for j = k, dwMountMaxLv do
			k = j;
			if curLvMountExp >= _G.MountUpLevelNeedExp[j] then
				curLvMountExp = curLvMountExp - _G.MountUpLevelNeedExp[j];
				-- print( "i==============",i )
				if(j+1 >= dwMountMaxLv) or (j+1 >=  dwCurLevel) then
					lastnum = i
					return true,lastnum;
				end
			else
				break;
			end
		end
	end
	
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then 
		return 0;
	end
	local cmountSystem = objPlayer:GetSystem('CMountSystem')
	if not cmountSystem then
		return 0;
	end
	local chack = cmountSystem:UseItemAddExp(5000000*num)
	if chack then
		return 0;
	end
	
	return false
end

-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )





 
 