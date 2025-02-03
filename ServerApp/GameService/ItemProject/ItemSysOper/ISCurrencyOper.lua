------------------------------------
------------------------------------
--道具系统内部的接口文件
--author lkj



--更新背包银两数量
function CItemSystem:UpdatePacketMoney(dwValue, szType)
	self:GetPacket():UpdateMoney(dwValue);
    
    if szType then--记录银两收支日志
        if type(szType) ~= "number" then
            _err("CItemSystem:UpdatePacketMoney err!!", szType);
        else
            CLogSystemManager:gold(self:GetPlayer(),
                dwValue,
                szType,
                self:GetAllPacketMoney());
        end;
    end;
    
	self:OperSys(_G.enItemSysUpdOper.ePacketMoney, self:GetAllPacketMoney());
	--事件中心,抛出更新背包银两事件
	self:GetPlayer():GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventUpdateMoney, self:GetAllPacketMoney());
end;

--获取背包中所有银两(包含锁定的)
function CItemSystem:GetAllPacketMoney()
	return self:GetPacket():GetAllMoney();
end;

--获取背包中可用银两(不包括锁定的)
function CItemSystem:GetPacketMoney()
	return self:GetPacket():GetMoney();
end;

--锁定背包银两
function CItemSystem:DoLockPacketMoney(dwValue)
	self:GetPacket():LockMoney(dwValue);
end;

--解锁背包银两
function CItemSystem:DoUnlockPacketMoney(dwValue)
	self:GetPacket():UnlockMoney(dwValue);
end;



--更新仓库银两数量
function CItemSystem:UpdateStorageMoney(dwValue)
	self:GetStorage():UpdateMoney(dwValue);
	self:OperSys(_G.enItemSysUpdOper.eStorageMoney, self:GetStorageMoney());
end;

--获取仓库中的银两
function CItemSystem:GetStorageMoney()
	return self:GetStorage():GetMoney();
end;

--仓库中的银两是否足够
function CItemSystem:IsStorageMoneyEnough(money)
	return self:GetStorageMoney() >= money;
end;

--存款
function CItemSystem:DoSaveMoney(dwMoney)
	self:UpdatePacketMoney(- dwMoney);
	self:UpdateStorageMoney(dwMoney);
end;

--取款
function CItemSystem:DoTakeMoney(dwMoney)
	self:UpdateStorageMoney(- dwMoney);
	self:UpdatePacketMoney(dwMoney);
end;


--更新元宝数量
function CItemSystem:UpdateGold(dwValue, bForbidPlayer)
	self.dwGold = self.dwGold + dwValue;
	--更新元宝数量信息
    if not bForbidPlayer then
        self:GetPlayer():UpdateGold( dwValue );
    else
        _info("====ChargeGold====", self:GetPlayer():GetAccountID(), self.dwGold, dwValue);
    end;
	self:OperSys(_G.enItemSysUpdOper.eGold, self:GetAllGold());
end;

--获取所有元宝数量(包括锁定的)
function CItemSystem:GetAllGold()
	return self.dwGold;
end;

--获取可用元宝数量(不包括锁定的)
function CItemSystem:GetGold()
	return self.dwGold - self.dwLockedGold;
end;

--获取锁定的元宝数量
function CItemSystem:GetLockedGold()
	return self.dwLockedGold;
end;

--锁定玩家的一部分元宝，玩家将不能使用这部分元宝
function CItemSystem:DoLockGold(dwValue)
	self.dwLockedGold = self.dwLockedGold + dwValue;
end;

--解锁玩家的元宝，传入解锁的数量
function CItemSystem:DoUnlockGold(dwValue)
	self.dwLockedGold = self.dwLockedGold - dwValue;
end;


--更新绑定元宝
function CItemSystem:UpdateBindGold(dwValue)
	self.dwBindGold = self.dwBindGold + dwValue;
	self:OperSys(_G.enItemSysUpdOper.eBindGold, self:GetBindGold());
end;

--获取绑定元宝数量
function CItemSystem:GetBindGold()
	return self.dwBindGold;
end;



