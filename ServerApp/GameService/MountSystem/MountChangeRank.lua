--[[
���ܣ�����ת������
ʱ�䣺 2014-1-13
���ߣ�κ��
]]

----��ת�����辭��
function CMountSystem:ChangeRankAddExp(num,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return;
	end
	local mountInst = self:GetMountInst(self:GetActiveMountID());
	if(not mountInst) then
		return ;
	end
	local rank = #mountInst:GetChangeRank();
	if(rank >= #_G.MountChangeRankConfig.ChangeRankExpInfos) then
		return;
	end
	local b_true ,curnum,curRankExp = self:CheckIsChangeRank(num);
	if(not b_true) then
		return;
	end
	if(not self:CheckConItemInfos(rank,curnum,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)) then
		return;
	end
	---ת�������߼�
	self:ChangeRank(mountInst,rank,curRankExp);
end
----ת�������߼�
function CMountSystem:ChangeRank(mountInst,rank,rankExp)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local rankExpLimit = MountChangeRankConfig:GetMountChangeRankExpLimit(rank+1);
	if(not rankExpLimit) then
		return;
	end
	local curRankExp = mountInst:GetChangeRankExp();
	local addRankExp = curRankExp + rankExp;
	if(addRankExp < rankExpLimit) then
		mountInst:SetChangeRankExp(addRankExp);
	else
		addRankExp = addRankExp - rankExpLimit;
		mountInst:SetChangeRankExp(addRankExp);
		if(#mountInst:GetChangeRank() > 0) then
			self:DelMountEffect(#mountInst:GetChangeRank())
		end
		mountInst:SetChangeRank(mountInst:GetLevel());
		self:AddMountEffect(#mountInst:GetChangeRank());
		-----ת���󽵵ȼ�������
		local minLevel = MountChangeRankConfig:GetMountMinLevel(mountInst:GetGrade(),#mountInst:GetChangeRank(),mountInst:GetLevel())
		mountInst.n_Level = minLevel;
		mountInst.n_Exp = 0;
		local netData = mountInst:GetNetData();
		objPlayer.MountSys_SynchronizeMountInstMsg{NetData = netData};
		CGameApp.BroadCastChangeRankMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetInfo().szRoleName,Rank = #mountInst:GetChangeRank()}
	end
	self:SaveRankDB();
	--self:AddProChangeRankAttr(#mountInst:GetChangeRank());
	self:AttributeChange();
	objPlayer.MountSys_ChangeRankAddExpBackMsg{Rank = #mountInst:GetChangeRank(),RankExp = mountInst:GetChangeRankExp(),AddRankExp = rankExp};
end 

---����Ƿ��ܹ�ת��
function CMountSystem:CheckIsChangeRank(num)
	local mountInst = self:GetMountInst(self:GetActiveMountID());
	if(not mountInst) then
		return false,0;
	end
	local rank = #mountInst:GetChangeRank();
	local level = mountInst:GetLevel();
	local grade = mountInst:GetGrade();
	local conGrade = MountChangeRankConfig:GetMountChangeRankSectionLimit(rank + 1);
	if(not conGrade) then
		return false,0;
	end
	local conLevel = MountChangeRankConfig:GetMountChangeRankLevelLimit(rank + 1);
	if(not conLevel) then
		return false,0;
	end
	if(grade < conGrade) then
		return false,0;
	end
	if(level < conLevel) then
		return false,0;
	end
	local rankExpLimit = MountChangeRankConfig:GetMountChangeRankExpLimit(rank+1);
	if(not rankExpLimit) then
		return;
	end
	local rankExp = mountInst:GetChangeRankExp();
	local curnum = num;
	for i = 1,num do
		rankExp = rankExp +  MountChangeRankConfig:GetMountChangeRankExp(rank+1);
		if(not rankExp) then
			return ;
		end
		if(rankExp >= rankExpLimit) then
			curnum = i;
			break;
		end
	end
	
	return true,curnum,(rankExp-mountInst:GetChangeRankExp());
end
----������Ҫ���ĵ���Ʒ
function CMountSystem:CheckConItemInfos(rank,num,b_IsAutoBuy,b_IsUseGold,b_IsFirstUseBind)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return false;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return false;
	end
	local conInfos = MountChangeRankConfig:GetMountChangeRankConsemInfos(rank+1);
	if(not conInfos) then
		return;
	end
	if(conInfos.ItemNum < 0) then
		return false;
	end
	local b_IsEnough_1, n_Minus_1 = objItemSystem:CheckDelEnumItemInPacketCond(conInfos.ItemID, conInfos.ItemNum*num);
	local packNum = objItemSystem:GetEnumItemNumInPacket(conInfos.ItemID)
	local autoBuyInfo = {};
	if(not b_IsEnough_1) then  ----�����е�������Ʒ��������
		if(not b_IsAutoBuy) then
			return false;
		else------�Զ�������Ʒ
			local t = {};
			t.dwItemEnum 	= conInfos.ItemID;
			t.dwItemNumber 	= n_Minus_1;
			table.insert(autoBuyInfo, t);
		end
	end
	-----�Զ�������Ʒ�����߼�
	--------����Զ������б�Ϊ����ִ���Զ������߼�
	if #autoBuyInfo > 0 then
		local mallSystem = objPlayer:GetSystem("CMallSystem");
		if not mallSystem then
			return false;
		end;
		if b_IsUseGold then
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					return false;
				end;
			end;
		else
			for k, v in pairs(autoBuyInfo) do
				local buySuc = mallSystem:BuyItemByIDBindGold(v.dwItemNumber, v.dwItemEnum)
				if not buySuc then
					return false;
				end;
			end;
		end
		--------��ⱳ�����Ƿ����㹻��Ʒ
		local packNum = objItemSystem:GetEnumItemNumInPacket(conInfos.ItemID)
		if(packNum < conInfos.ItemNum*num) then  ----�����е�������Ʒ��������
			return false;
		end
	end;
	local isSucc = objItemSystem:DelEnumItemInPacket(conInfos.ItemID,conInfos.ItemNum*num,b_IsFirstUseBind, _G.ItemSysOperType.MountChangeRank) 
	if not isSucc then
		return false;
	end
	return true;
end
-----��������ת������
function CMountSystem:AddProChangeRankAttr(rank)
	local t_attr =  _G.SSingleAttrChange:new(); 
	local infos = MountChangeRankConfig:GetMountChangeRankAttrInfos(rank);
	t_attr:AddValue(infos);
	-- self.SkillSystem:NotifyMountUpdate(t_attr,2);
	-- self:AttributeChange();
	return t_attr;
end

-----�������ݿ�
function CMountSystem:SaveRankDB()
	local mountInst = self:GetMountInst(self:GetActiveMountID());
	if mountInst then
		local mountInfo = mountInst:Serialize();
		if not self.objDBQuery:SaveMountInfo(mountInfo) then
			_err("CMountSystem:Save() error!!!");
		end;
	end;
end


----����Ч
function CMountSystem:AddMountEffect(rank)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local dwPfxCfg = 0;
	dwPfxCfg = MountChangeRankConfig:GetMountChangeRankPfx(rank);
	if(dwPfxCfg == 0 or not dwPfxCfg) then
		return;
	end
	dwPfxCfg = 8000100 + dwPfxCfg;
	if(not objPlayer:CheckIsViewPfx(dwPfxCfg)) then
		objPlayer:AddViewPfx(dwPfxCfg);
	end
end
---����Ч
function CMountSystem:DelMountEffect(rank)
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local dwPfxCfg = 0;
	dwPfxCfg = MountChangeRankConfig:GetMountChangeRankPfx(rank);
	if(dwPfxCfg == 0 or not dwPfxCfg) then
		return;
	end
	dwPfxCfg = 8000100 + dwPfxCfg;
	if(objPlayer:CheckIsViewPfx(dwPfxCfg)) then
		objPlayer:RmvViewPfx(dwPfxCfg)
	end
end

---�����ַ��� ת��Ϊ table
function CMountSystem:LoadStr(str)
	if(str == nil) then
		return false;
	end
	local b = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		b[index] = value;
		index = index + 1;
	end;
	return b;
end

---�����ַ���
function CMountSystem:UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end


