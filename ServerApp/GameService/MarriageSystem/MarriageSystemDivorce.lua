----------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------离婚相关----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
--离婚鸟
function CMarriageSystem:Divorce(forbitClient)
    local objPlayer = self:GetPlayer();
    
    --拿下结婚信物
	----只保留一个旧信物，所以先删除之前的未取回信物
	local oldoldItemTable = self.ItemSystem:GetAllIDInKsRoom();
	for i=1, #oldoldItemTable do
		self.ItemSystem:DelObjItem(oldoldItemTable[i], _G.ItemSysOperType.Divorce);
	end;
	----得到旧的求婚信物ID
	local oldItemInstID = self.ItemSystem:GetKeepSakeID();
	----将旧的求婚信物脱下并放入结婚信物容器，以供玩家取回
	self.ItemSystem:MoveItemToKeepSake(oldItemInstID);
	--清除结婚技能
	local oldItemInst = self.ItemSystem:GetItem(oldItemInstID);
	local skillSystem = objPlayer:GetSystem("CSkillSystem");
	if skillSystem then
		--四个被动
		skillSystem:DoDelSkill(_G.MarriageConfig.Marriage_SkillID1);
		skillSystem:DoDelSkill(_G.MarriageConfig.Marriage_SkillID2);
		skillSystem:DoDelSkill(_G.MarriageConfig.Marriage_SkillID3);
		skillSystem:DoDelSkill(_G.MarriageConfig.Marriage_SkillID4);
		--俩主动
		skillSystem:DoDelSkill(_G.MarriageConfig.Goods_SkillID1);
		skillSystem:DoDelSkill(_G.MarriageConfig.Goods_SkillID2);
	end;
    
	--有旧信物未领取
	self.HasKeepSakeNotTake = true;
    
    if self.bSameMap then
		self.bSameMap = nil;
		self.dwAddLoveTime = nil;
	end;
    
        
	--清除自己的婚姻信息
	self.Married 	= false;
	self.MateRoleID = 0;
	self.MateName 	= "";
	self.MarriedTime= 0;
	self.dwLove		= 0;
    --同步客户端婚姻信息
    if not forbitClient then
        self:SynMarriageInfo();
    end;
end;

--客户端发送协议离婚请求
function CMarriageSystem:ConferDivorceTo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:ConferDivorceTo");
		return;
	end;
	if not self:IsMarried() then return end;
	local cbk = function(_, result, _)
		if result == -1 then
			objPlayer.MarSys_DivorceToResultMsg{Reason = _G.MarriageError.eMateNotOnline};
		end;
	end;
	_G.GSRemoteCall(self.MateRoleID, "CMarriageSystem", "BeConferDivorceTo", nil, cbk);
end;

--客户端发送强制离婚请求
function CMarriageSystem:CompelDivorceTo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:CompelDivorceTo");
		return;
	end;
	if not self:IsMarried() then return end;
    
	--花钱直接离婚，说明神马爱情在金钱面前都是浮云~
	if not self.ItemSystem:IsPacketMoneyEnough(_G.MarriageConfig.CompelDivorceNeedMoney) then
		objPlayer.MarSys_DivorceToResultMsg{Reason = _G.MarriageError.eMoneyNotEnough};
		return;
	end;
	self.ItemSystem:CostPacketMoney(_G.MarriageConfig.CompelDivorceNeedMoney, _G.ItemSysOperType.Divorce);
	
	--离婚登记
    CKernelApp.MarMgr_DivorceRegisterMsg{RoleID = objPlayer:GetRoleID(), Compel = true};
	
    --离婚
	self:Divorce();
    
	--通知自己离婚完成
	objPlayer.MarSys_DivorceToResultMsg{Reason = _G.MarriageError.eDivorceComplete};
end;

--离婚请求被接受
function CMarriageSystem:DivorceAccepted()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:BeConferDivorceTo");
		return;
	end;
	
    self:Divorce();
    
	--通知客户端
	objPlayer.MarSys_DivorceToResultMsg{Reason = _G.MarriageError.eDivorceAccepted};
end;

--离婚请求被拒绝
function CMarriageSystem:DivorceRefused()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_info("error can not get player by CMarriageSystem:DivorceRefused");
		return;
	end;
	objPlayer.MarSys_DivorceToResultMsg{Reason = _G.MarriageError.eDivorceRefused};
end;



