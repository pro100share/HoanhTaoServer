local dwItemId = 2500230
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	--等级上限
	local Level = RoleUpLevelConfig.dwMaxLevel
	--当前等级
	local Lev = objPlayer:GetLevel();
	
	if (Lev < Level) then
		objPlayer:AddExp(5000)
		return false
	end
	
	if(objPlayer.sRoleInfo.dwExp < _G.RoleUpLevelConfig[Level+1].dwExp) then
		objPlayer:AddExp(5000)
		return false
	end		
	
	return 4001370003;
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return nil,0;
	end;
	local Level = RoleUpLevelConfig.dwMaxLevel
	local Lev = objPlayer:GetLevel();
	local maxExp = objPlayer:GetInfo().dwExp;
	local lastnum = num;
	local lastExp = RoleUpLevelConfig[Level].dwExp;
	local curLastExp = RoleUpLevelConfig[Level+1].dwExp - RoleUpLevelConfig[Level].dwExp;
	local curExp = maxExp - lastExp
	if ((Lev == Level) and (curExp == curLastExp)) then
		objItemSys:OnError(4001370003);
		return false,0
	end
	for i = 1,num do
		curExp = curExp + 5000;
		if curExp > curLastExp then
			curExp = curLastExp
			lastnum = i;
			break;
		end
	end
	return true,lastnum;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	local objPlayer = objItemSys:GetPlayer();
	if not objPlayer then
		return 4000110013;
	end;
	objPlayer:AddExp(5000*num);
	return false;
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 