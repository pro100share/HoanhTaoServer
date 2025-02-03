-- 炼丹系统

_G.CRefineMaterialSystem = {};

function CRefineMaterialSystem:new()
	local obj = CSystem:new("CRefineMaterialSystem");
	---
	for i,v in pairs(CRefineMaterialSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CRefineMaterialSystem:Create()
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CRefineMaterialSystem Create Cannot get player");
		return false;
	end;
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CMountSystem Create Cannot get ItemSystem");
		return false;
	end;
	
	return true;
end;

function CRefineMaterialSystem:Destroy()
end;

function CRefineMaterialSystem:Update()
	
end;

function CRefineMaterialSystem:OnEnterScene()
	
end;

--换线开始
function CRefineMaterialSystem:OnChangeLineBegin()
	self:DealBreakPro();
end
--死亡处理
function CRefineMaterialSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--处理打断合成
function CRefineMaterialSystem:DealBreakPro()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.OnDeadBreakRefineMsg{};
end;

---------------------------------------------------------------------------------------------------------------------------------

-- 制作丹药
function CRefineMaterialSystem:OnMake(itemID, itemCount)
	if itemCount < 0 then
		return 
	end
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CRefineMaterialSystem Make Cannot get player");
		return false;
	end
	
	local itemConfig = _G.RefineMaterialConfig[itemID];
	local needMaterials = itemConfig.material;
	
	--判断炼制材料是否足够
	for _, material in pairs(needMaterials) do
		local isEnough, _ = self.ItemSystem:CheckDelEnumItemInPacketCond(material.item, material.num * itemCount);
		if not isEnough then
			return false;
		end;
	end
	
	-- 根据成功率炼丹，失败时根据权重返回材料
	local successNum, failNum = 0, 0;
	local successPro = 0;
	local backTable = {};
	
	for i = 1, itemCount do
		successPro = math.random(1, 10000);
		--失败时 失败计数加1，返还材料
		if successPro > itemConfig.successRate then
			failNum = failNum + 1;
			for i = 1, itemConfig.backKindCount do
				local backItemId, isBind = _G.RefineMaterialConfig.BackMaterial(itemID);
				if not backTable[backItemId] then
					backTable[backItemId] = {Num = 0, IsBind = isBind};
				end
				backTable[backItemId].Num = backTable[backItemId].Num + 1;
			end
		else
			successNum = successNum + 1;
		end
	end;
	
	local setAddList = {};
	
	if successNum > 0 then 
	
		local tempTabel = {
			dwItemEnum	= itemID;
			dwItemNumber= successNum;
		};
		table.insert(setAddList, tempTabel);
	end
	
	for i,v in pairs(backTable) do
		local tempTabel = {
			dwItemEnum	= i;
			dwItemNumber = v.Num;
			dwBindType = v.IsBind == 1 and _G.enItemBindType.eYes or _G.enItemBindType.eNo;
		};
		table.insert(setAddList, tempTabel);
	end
	
	-- 如果背包有足够空间就增加丹药  否则不进行操作
	if self.ItemSystem:IsEnumItemListCanAddToPacket(setAddList) then
		--删除材料
		local isBind, bindRes;
		for _, material in pairs(needMaterials) do
			_, isBind = self.ItemSystem:DelEnumItemInPacket(material.item, material.num * itemCount, false, _G.ItemSysOperType.RefineMaterial);
			if isBind then bindRes = true end;
		end
		
		for _,v in pairs(setAddList) do
			if v.dwItemEnum == itemID then
				v.dwBindType = bindRes and _G.enItemBindType.eYes or _G.enItemBindType.eNo;
				break;
			end 
		end
		
		--增加丹药和返还材料
		self.ItemSystem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.RefineMaterial);
		--是否需要广播
		if itemConfig.Notice and itemConfig.Notice ~= 0 then
			--[[local info = {}
			objPlayer.CltDecodeVipMsg{Type = VipMsgConfig.BeVip,Info = info}
			--]]
			CGameApp.ServRefineSuccessCastMsg{roleID = objPlayer:GetRoleID(),roleName = objPlayer:GetName(),itemID = itemID};
		end 
		--[[local backItemStr = "";
		for itemID, v in pairs(backTable) do
			backItemStr = backItemStr .. itemID .. "," .. v.Num .. ";";
		end;--]]
		objPlayer.ReturnRefineMaterialInfoMsg{ItemEnum = itemID, SuccNum = successNum, FailNum = failNum, BackItem = backTable};
	end
end;