


--检测亲密度增加条件
function CMarriageSystem:CheckLoveAddCond()
	local objPlayer = self:GetPlayer();
	if self:IsMarried() then
		local mate = objPlayer:GetOtherPlayer(self.MateRoleID, 2);
		if mate and objPlayer:GetSystem("CTeamSystem"):IsMateInTeam(self.MateRoleID) then
			self.dwAddLoveTime = GetCurTime(1) + _G.MarriageConfig.AddLoveCD;
            self:InSameMap();
			mate:GetSystem("CMarriageSystem"):InSameMap();
		else
			if self.bSameMap then
                self:NotInSameMap();
				_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "NotInSameMap", nil, nil);
			end;
		end;
	end;
end;

--和伴侣在同地图同队伍中
function CMarriageSystem:InSameMap()
	self.bSameMap = true;
end;
--和伴侣在不同队伍或不同地图中
function CMarriageSystem:NotInSameMap()
	self.bSameMap = nil;
	self.dwAddLoveTime = nil;
end;


--增加亲密度
function CMarriageSystem:AddLove(dwValue, bDB)
	self.dwLove = self.dwLove + dwValue;
	if bDB then--向KS发送更新消息
        CKernelApp.MarMgr_UpdateLoveMsg{RoleID = self.MateRoleID, Love = self.dwLove};
	end;
	self:GetPlayer().MarSys_SynchLoveMsg{Love = self.dwLove};
end;

--赠送礼品增加亲密度
function CMarriageSystem:ClientAddLove(dwNum)
    local objPlayer = self:GetPlayer();
    dwNum = math.floor(dwNum);
	if dwNum <= 0 then return end;
    if not self.Married then return end;
	local _, _, dwHaveNum = self.ItemSystem:GetEnumItemNumInPacket(_G.MarriageConfig.AddLoveItemID);
	if dwHaveNum < dwNum then return end;
    
    --删除
    self.ItemSystem:DelEnumItemInPacket(_G.MarriageConfig.AddLoveItemID, dwNum, true, _G.ItemSysOperType.Marriage);
    --发邮件
    local Items = {};
    local item = SItemMessage:new();
    item.dwItemEnum = _G.MarriageConfig.AddLoveItemID;
    item.dwItemNumber = dwNum;
    item.dwLifeTime = -1;
    item.dwBindType = _G.enItemBindType.eYes; 
    table.insert( Items, item );
    local mail = CMail:new();
	mail:SetSender(-9999, "伴侣系统");
	mail:SetReceiver(self.MateRoleID, self.MateName);
	mail:SetLifeTime(SMailInfo.life*24*3600*1000);
	mail:SetAccessory(0, 0, 0, Items);
	
    local addLoveNum = objPlayer:GetSystem("CRefreshSystem"):GetData(0901);
    local realAddLoveNum = (dwNum > addLoveNum) and addLoveNum or dwNum;
    local dwAddValue = realAddLoveNum * _G.MarriageConfig.AddLoveOnce;
    local msg = string.format( _G.SysStringConfigInfo[6001160042], objPlayer:GetName(), dwNum, dwAddValue);
    if realAddLoveNum > 0 then
        self:AddLove(dwAddValue, true);
        _G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "AddLove", {dwAddValue}, nil);
        objPlayer:GetSystem("CRefreshSystem"):SetData(0901, addLoveNum - realAddLoveNum);
        objPlayer.MarSys_AddLoveResultMsg{AddNum = addLoveNum - realAddLoveNum};
    end;
  
    mail:SetContent("Love", msg);
    CMailManager:SendMail(mail);
end;



