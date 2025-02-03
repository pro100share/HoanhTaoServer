--2012.6.8
--作者：段磊磊
--开罐子系统
_G.CPotSystem = {}
function CPotSystem:new()
	local obj = CSystem:new("CPotSystem");
	--时间戳
	obj.dwTimeStamp = 0;
	obj.dwDropId = -1;
	for i,v in pairs(CPotSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CPotSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	return true;
end

function CPotSystem:Update(dwInterval)
	return true
end

function CPotSystem:Destroy()

end;

function CPotSystem:OnEnterScene()

end;

--更新信息到客户端
function CPotSystem:UpdateInfoToClient(objPlayer,nFlag)
	local sInfo = {};
end;
function CPotSystem:DecodeMsg(Type,Info)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local itemSys = objPlayer:GetSystem('CItemSystem')
	local info = {}
	if Type == PotMsgConfig.Open then
		if not itemSys:IsPacketSlotEnoughFor(1) then
			objPlayer.CltPotMsg{Type = PotMsgConfig.NoPacket,Info = info}
			return 
		end
		local dwCounts1, _, _ = itemSys:GetEnumItemNumInPacket(Info[2]);
		if dwCounts1 >= PotConfig.PotNeedItemNum[Info[1]] then
			local dwCounts2, _, _ = itemSys:GetEnumItemNumInPacket(Info[1]);
			if dwCounts2 >= 1 then
				local dwRandow = math.random(1,100)
				local playerLv = objPlayer:GetLevel()
				local StepConfigK  = -1
				for k,v in pairs (PotConfig.StepConfig[Info[1]]) do
					if playerLv >= v.dwLevelBottom and playerLv <= v.dwLevelTop then
						StepConfigK = k
						break
					end
				end
				local dwDropId = -1
				for k,v in pairs (PotConfig.StepConfig[Info[1]][StepConfigK].Group) do
					if dwRandow >= v.dwPerValueBottom and dwRandow <= v.dwPerValueTop then
						dwDropId = v.dwGroupNum
						break
					end
				end
				self.dwDropId  = dwDropId
				info = CDropControl:DoAllGet(dwDropId)
				objPlayer.CltPotMsg{Type = PotMsgConfig.OpenSure,Info = info}
			else
				info.dwItemEnum = Info[1]
				objPlayer.CltPotMsg{Type = PotMsgConfig.NoPot,Info = info}
			end
		else
			info.dwItemEnum = Info[2]
			objPlayer.CltPotMsg{Type = PotMsgConfig.NoHammer,Info = info}
		end		
	elseif Type == PotMsgConfig.Complete or PotMsgConfig.Interrupt then
		local dwCounts1, _, _ = itemSys:GetEnumItemNumInPacket(Info[2]);
		local dwCounts2, _, _ = itemSys:GetEnumItemNumInPacket(Info[1]);
 		if dwCounts1 >= PotConfig.PotNeedItemNum[Info[1]] and
			dwCounts2 >= 1 then
			local itemInfo = CDropControl:DoDrop(self.dwDropId)
			local setProperty = CGlobalItemManager:GetPropertyByQuality(itemInfo[1].dwItemEnum, itemInfo[1].dwQuality)
			local tabAddList = {}

			tabAddList[1] = {}
			tabAddList[1].dwItemEnum	= itemInfo[1].dwItemEnum
			tabAddList[1].dwItemNumber	= itemInfo[1].dwNum
			tabAddList[1].dwStrongLevel	= itemInfo[1].dwStrong
			tabAddList[1].setProperty	= setProperty
			
			tabAddList[2] = {}
			tabAddList[2].dwItemEnum	= Info[2]
			tabAddList[2].dwItemNumber	= 1
			if itemSys:IsEnumItemListCanAddToPacket(tabAddList) == true then
				itemSys:DelEnumItemInPacket(Info[1], 1, false, _G.ItemSysOperType.Pot)
				itemSys:DelEnumItemInPacket(Info[2], PotConfig.PotNeedItemNum[Info[1]], false, _G.ItemSysOperType.Pot)
				itemSys:AddEnumItemListToPacket(tabAddList, _G.ItemSysOperType.Pot)
				info = itemInfo
				objPlayer.CltPotMsg{Type = PotMsgConfig.GetSuccess,Info = info}
			else
				objPlayer.CltPotMsg{Type = PotMsgConfig.NoPack,Info = info}
			end
		else
			
		end
	end
end

----------------------------------------------------------