local dwItemId = 2500120
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

function ItemScriptObj:CheckForUse(objItemSys, objItem, sysScript)
	if objItemSys:GetBindGold() + 10 > _G.InitConfig.dwMaxMoney then
		return false;
	end
	return 0;
end;

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local weight =
	{
		[1] = {[1] = 4500},
		[2] = {[1] = 4500},
		[3] = {[1] = 125},
		[4] = {[1] = 125},
		[5] = {[1] = 125},
		[6] = {[1] = 125},
		[7] = {[1] = 125},
		[8] = {[1] = 125},
		[9] = {[1] = 125},
		[10] = {[1] = 125},
	}
	--计算权重
	local sum = 0;
	for store = 1,#weight do
		sum = weight[store][1] + sum
		weight[store][2] = sum
	end
	local casual = math.random(sum);
	local dwRand = 0;
	for SS = 1,#weight do
		if (casual <= weight[SS][2]) then
			dwRand = SS;
			break
		end
	end
	objItemSys:AddBindGold(dwRand, _G.ItemSysOperType.Used);
	return false
end

-----批量处理脚本
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForMassUse(objItemSys, objItem,scripSys,num)

	if objItemSys:GetBindGold() + 10 > _G.InitConfig.dwMaxMoney then
		return false,0;
	end
	return true,num;

end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseMassItem(objItemSys, objItem, sysScript,num)
	print( "num===============================",num )
	
	local weight =
	{
		[1] = {[1] = 4500},	
		[2] = {[1] = 4500},
		[3] = {[1] = 125},
		[4] = {[1] = 125},
		[5] = {[1] = 125},
		[6] = {[1] = 125},
		[7] = {[1] = 125},
		[8] = {[1] = 125},
		[9] = {[1] = 125},
		[10] = {[1] = 125},
	}
	
	local curGold = objItemSys:GetBindGold();
	-- print( "curGold============================",curGold )
	local maxGold = _G.InitConfig.dwMaxMoney;	
	local lastnum = num;
	
	for i = 1,num do
		-- print( "i===============================",i )
		--计算权重
		local sum = 0;
		for store = 1,#weight do
			sum = weight[store][1] + sum
			weight[store][2] = sum
		end
		local casual = math.random(sum);			
		local dwRand = 0;
		for SS = 1,#weight do
			if (casual <= weight[SS][2]) then
				dwRand = SS;
				break
			end
		end
		-- print( "dwRand=====================",dwRand )
		
		-- curGold = curGold + dwRand;
		-- print( "dwRand=====================",dwRand )
		-- if(curGold < maxGold) then
			-- -- objItemSys:AddBindGold(dwRand, _G.ItemSysOperType.Used);
			-- lastnum = i;
			-- return false;
		-- else
			-- curGold = maxGold;
			-- -- lastnum = i
			-- break;
		-- end	
		
		objItemSys:AddBindGold(dwRand, _G.ItemSysOperType.Used);
		
	end

	return false;	
	
end
-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 