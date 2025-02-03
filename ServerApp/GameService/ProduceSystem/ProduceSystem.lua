--[[
文件：ProduceSystem.lua
类名：CProduceSystem
功能说明：技能书合成
备注：
作者：刘炜
版本：
修改者：
]]
_G.CProduceSystem = {};

function CProduceSystem:new()
	local obj = CSystem:new("CProduceSystem");
	
	---
	for i,v in pairs(CProduceSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CProduceSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CProduceSystem Create Cannot get player----");
		return false;
	end;
	
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CProduceSystem Create Cannot get itemsystem----");
		return false;
	end;
end;

--生产
function CProduceSystem:TryProduce(dwProID)
	local objSelf = self:GetPlayer();
	if not objSelf then
		_err("CProduceSystem Create Cannot get player----");
		return false;
	end;
	
	local tbMate = ProduceMaterial[dwProID];
	local tbCond = ProduceCondition[dwProID];
	if not tbMate then
		return;
	end
	if not tbCond then
		return;
	end
	
	if not self:CheckMaterial(tbMate) then
		return;
	end
	if not self:CheckCondition(tbCond) then
		return;
	end
	
	local isSucc = self:CountPercent(tbCond);
	
	local isAllDelSucc,isHaveBind = self:DeleteMaterial(tbMate,isSucc);
	if not isAllDelSucc then
		return;
	end
	
	self:DeleteCondition(tbCond);
	
	if not isSucc then
		objSelf.OnProduceResultMsg{Code = 1};
		--随机返还一个材料
		-- local dwRnd = math.random(#tbMate.material);
		-- local info = tbMate.material[dwRnd];
		-- local addItemList = {};
		-- local tempTable = {
			-- dwItemEnum	= info.item;
			-- dwItemNumber= info.num;
			-- dwBindType	= false;
		-- };
		-- table.insert(addItemList, tempTable);
		-- self.ItemSystem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.SkillBook);
		return;
	end
	
	local dwBind = 0;
	if isHaveBind then
		dwBind = 1;
	end
	-- print("===TryProduce===",isHaveBind,dwBind)
	--添加产品
	local addItemList = {};
	for _, info in pairs(tbMate.make)do
		local tempTable = {
			dwItemEnum	= info.item;
			dwItemNumber= info.num;
			dwBindType	= dwBind;
		};
		table.insert(addItemList, tempTable);
	end
	self.ItemSystem:AddEnumItemListToPacket(addItemList, _G.ItemSysOperType.SkillBook);
	
	objSelf.OnProduceResultMsg{Code = 0};
	
	objSelf:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventProduce);
	
	if tbMate.Notice == 0 then
		return;
	end
	--需要提示
	local dwRnd = math.random(#NoticeWordID);
	local dwWordID = NoticeWordID[dwRnd];
	local szSelfName = objSelf:GetName();
	local szMake = "";
	
	local cfgItem = CGlobalItemManager:GetConfig(tbMate.make[1].item);
	if cfgItem then
		szMake = CGlobalItemManager:GetName(tbMate.make[1].item);
	end
	
	CKernelApp.OnKSWarNoticeMsg
	{
		NoticeType = 5;
		StringID = dwWordID;
		Param = {szSelfName,szMake};
	}
end;

--检测原料
function CProduceSystem:CheckMaterial(tbMate)
	for _,info in pairs(tbMate.material)do
		local isfull = self.ItemSystem:CheckDelEnumItemInPacketCond(info.item,info.num);
		if not isfull then
			return false;
		end
	end
	return true;
end;

--检测其他条件
function CProduceSystem:CheckCondition(tbCond)
	--真气
	local objFiveSys = self:GetPlayer():GetSystem("CFiveElemSystem");
	if not objFiveSys then
		return false;
	end
	
	for name,val in pairs(tbCond.zhenqi)do
		if not objFiveSys:CanChange(name,0-val) then
			return false;
		end
	end
	
	--钱	
	return self.ItemSystem:IsPacketMoneyEnough(tbCond.money);
end;

--扣原料
function CProduceSystem:DeleteMaterial(tbMate,isSucc)
	local isHaveBind = false;
	local isAllDelSucc = false;
	local dwExecIndex = nil;
	if not isSucc then
		dwExecIndex = math.random(#tbMate.material);
	end
	
	for n,info in pairs(tbMate.material)do
		if (not dwExecIndex) or (n ~= dwExecIndex) then
			local isDelSucc,isBind = self.ItemSystem:DelEnumItemInPacket(info.item, info.num, false, _G.ItemSysOperType.SkillBook);
			if isBind then
				isHaveBind = true;
			end
			if isDelSucc then
				isAllDelSucc = true;
			else
				break;
			end
		end
	end
	
	return isAllDelSucc,isHaveBind;
end;

--扣真气等
function CProduceSystem:DeleteCondition(tbCond)
	local objFiveSys = self:GetPlayer():GetSystem("CFiveElemSystem");
	if not objFiveSys then
		return false;
	end
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objFiveSys:GetElemValue()	
	local value = 0;
	for name,val in pairs(tbCond.zhenqi)do
		value = val;
		objFiveSys:ChangeAttr(name,0-val);
	end
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = 0-value};
		[2] = {dwCurrent = uItemWood, dwChange = 0-value};
		[3] = {dwCurrent = uItemWater, dwChange = 0-value};
		[4] = {dwCurrent = uItemFire, dwChange = 0-value};
		[5] = {dwCurrent = uItemEarth, dwChange = 0-value};
	}
	CLogSystemManager:zhenqi(self:GetPlayer(), setData, _G.FiveElemSysOperType.ProduceSystem)	
	if tbCond.money > 0 then
		self.ItemSystem:CostPacketMoney(tbCond.money, _G.ItemSysOperType.SkillBook);
	end
end;

--计算成功率
function CProduceSystem:CountPercent(tbCond)
	local dwRad = math.random(10000);
	
	return dwRad <= tbCond.succ;
end;
