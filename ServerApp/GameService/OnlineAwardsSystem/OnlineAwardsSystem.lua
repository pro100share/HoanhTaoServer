--[[
	--���ܣ��������ϵͳ��
	--���ߣ�κ��
	--ʱ�䣺2013-11-29
--]]

_G.COnlineAwardsSystem = {}

function COnlineAwardsSystem:new()
	local obj = CSystem:new("COnlineAwardsSystem");
	obj.objDBQuery = nil;--���ݿ��ѯ����
	obj.RoleID = 0;
	obj.UsedNum = 0;   -----����ʹ�ô���
	obj.AwardIndexs = {0,0,0,0,0,0,0,0}; ----��������
	obj.AwardTypes = {0,0,0,0,0,0,0,0};  ----��������
	obj.AwardStates = {0,0,0,0,0,0,0,0}; ----����״̬ 0 ��û�н�����1 �ǿ���ȡ������2 ���������
	for i,v in pairs(COnlineAwardsSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end


function COnlineAwardsSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	if(not objDB ) then
		_info("objDB is null by COnlineAwardsSystem:Create")
		return false;
	end
	-- �������ݿ����
	self.objDBQuery = COnlineAwardsSystemDB:new(objDB,self);
	self.tabInfo = {}; ---��ҡ���������Ϣ
	self.SSATime = 0;  ----ҡ��ʱ��� 
	self.InterTime = 0; ---������ʱ�䣬 ���ʱ��
	self.bChangeLine = false;
	---�����ݿ��ж�ȡ����
	local Data = objPlayer:GetLineData("COnlineAwardsSystem") or {};
	if(#Data <= 0) then
		return;
	end
	if(#Data[1] > 0) then
		self.RoleID = Data[1][1].dwRoleID
		self.UsedNum = Data[1][1].dwUsedNum;
		self.AwardIndexs = self:LoadStr(Data[1][1].dwAwardIndexs);
		self.AwardTypes = self:LoadStr(Data[1][1].dwAwardTypes);
		self.AwardStates = self:LoadStr(Data[1][1].dwAwardStates);
		if(Data[1][1].dwSSATime ~= nil) then
			self.SSATime = Data[1][1].dwSSATime;
		end
		self.InterTime = Data[1][1].dwInterTime;
	end
	return true
end
---������ϴ���
function COnlineAwardsSystem:OnDead(dwEnemyType,dwEnemyID)
	self:DealBreakPro();
end;
--������
function COnlineAwardsSystem:DealBreakPro()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	objPlayer.OnlineAwardsDeadBreakComposeMsg{};
end;
function COnlineAwardsSystem:OnChangeLineBegin(dwNewLineID)
	self:DealBreakPro();
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local Data = {}
	Data[1] = {};
	Data[1].dwRoleID = self.RoleID;
	Data[1].dwUsedNum = self.UsedNum;
	Data[1].dwAwardIndexs = self:UpdateStr(self.AwardIndexs);
	Data[1].dwAwardTypes = self:UpdateStr(self.AwardTypes);
	Data[1].dwAwardStates = self:UpdateStr(self.AwardStates);
	Data[1].dwSSATime = self.SSATime;
	Data[1].dwInterTime = self.InterTime;
	self.bChangeLine = true;
	--�������ύ����������
	objPlayer:SetLineData("COnlineAwardsSystem",Data);
end
--���߽����������
function COnlineAwardsSystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local Data = objPlayer:GetLineData("COnlineAwardsSystem") or {};
	if(#Data <= 0) then
		self:OpenShakeAward();
		return;
	end
	if(#Data[1] > 0) then
		self.RoleID = Data[1][1].dwRoleID
		self.UsedNum = Data[1][1].dwUsedNum;
		self.AwardIndexs = self:LoadStr(Data[1][1].dwAwardIndexs);
		self.AwardTypes = self:LoadStr(Data[1][1].dwAwardTypes);
		self.AwardStates = self:LoadStr(Data[1][1].dwAwardStates);
		if(Data[1][1].dwSSATime ~= nil) then
			self.SSATime = Data[1][1].dwSSATime;
		end
		self.InterTime = Data[1][1].dwInterTime;
	end
	self:ChangLineGetAwardItem()
end;
function COnlineAwardsSystem:Destroy()
	if(not self.bChangeLine ) then
		self:OffLineGetAwardItem() ----���߻�ȡҡ������
		self.bChangeLine = false;
	end
	self.InterTime = self.InterTime + (GetCurTime() - self.SSATime);
	self:SaveDB();
end;
function COnlineAwardsSystem:Update(dwInterval)
	return true;
end
function COnlineAwardsSystem:OnEnterScene()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	self.SSATime = GetCurTime();
	self:SynchronizeToClient();
end

function COnlineAwardsSystem:SynchronizeToClient()
	local objPlayer = self:GetPlayer();
	if(not objPlayer) then
		return;
	end
	local interTime = 0;
	interTime = self.InterTime;
	-- print("=============interTime================",interTime)
	---ͬ���ͻ���
	objPlayer.SynchronizeToClientMsg{UsedNum = self.UsedNum,AwardIndexs = self.AwardIndexs,AwardTypes = self.AwardTypes,InterTime = interTime};
	self:OpenShakeAward();
end
---��Ҵ�ҡ������
function COnlineAwardsSystem:OpenShakeAward()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(self.UsedNum >= _G.OnlineAwardsConfig.MaxNum) then
		return;
	end
	local tabTypes = _G.OnlineAwardsConfig.GetRanderShakeAwardTypes(self.UsedNum)
	local tabInfo = _G.OnlineAwardsConfig.GetRanderShakeAwardIndexList(tabTypes)
	self.tabInfo = tabInfo;
	local interTime = 0;
	interTime = self.InterTime;
	_info("==========OpenShakeAward==================",self.UsedNum)
	objPlayer.OpenShakeAwardMsg{ParmaInfo = tabInfo,InterTime = interTime};
end
---��ҿ�ʼҡ��
function COnlineAwardsSystem:StartShakeAward()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	if(self.UsedNum >= _G.OnlineAwardsConfig.MaxNum) then
		return;
	end
	local onLineTime = 0;
	local curTime = _now();
	onLineTime = curTime - self.SSATime + self.InterTime;
	local canUseNum = math.floor((onLineTime)/_G.OnlineAwardsConfig.GetShakeTimeGap(self.UsedNum+1));
	if(canUseNum <= 0) then
		return;
	end
	self.InterTime = 0;
	self.UsedNum = self.UsedNum + 1;
	local tabInfo = _G.OnlineAwardsConfig.GetRanderShakeAwardInfo(self.tabInfo)
	self.AwardTypes[self.UsedNum] = tabInfo.Type;
	self.AwardIndexs[self.UsedNum] = tabInfo.Index;
	self.AwardStates[self.UsedNum] = 1;
	self:SaveDB();
	objPlayer.StartShakeAwardSuccessMsg{ParmaInfo = tabInfo};
end
----���߻�ȡ����
function COnlineAwardsSystem:ChangLineGetAwardItem()
	local b_true = self:GetShakeAwardsToMail()
	if(not b_true) then
		self:OpenShakeAward()
	end
end
----ǿ�ؽ����ȡ����
function COnlineAwardsSystem:CloseUiGetShakeAwards()
	self:GetShakeAwardsToMail()
end
function COnlineAwardsSystem:OffLineGetAwardItem()
	local b_true = self:GetShakeAwardsToMail()
	if(not b_true) then
		self:OpenShakeAward()
	end
end
---��һ�ȡ�������͵�����
function COnlineAwardsSystem:GetShakeAwardsToMail()
	local index = self.AwardStates[self.UsedNum];
	if(index ~= 1) then
		return false;
	end
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return false;
	end
	local nType =self.AwardTypes[self.UsedNum];
	local nIndex =self.AwardIndexs[self.UsedNum];
	---������
	---�ʼ����͸���ҽ�����Ʒ
	local mailSys = objPlayer:GetSystem("CMailSystem");
	if(not mailSys) then
		return;
	end
	local awardInfo = {AwardItemID = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemId,AwardItemNum = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemNum,AwardItemBindType = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemType}
	local mailMsg = _G.OnlineAwardsConfig.SetMaiInfo(awardInfo)
	if(not mailMsg) then
		return false;
	end
	mailSys:SendSetMail( mailMsg, objPlayer:GetRoleID(), objPlayer:GetName() ) ---����һ�����õ��ʼ�
	if(_G.OnlineAwardsConfig.ItemInfos[nType][nIndex].isBroadCast) then
		CGameApp.BroadCastGetShakeAwardsMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),AwardInfo = {Type = nType,Index = nIndex}}
	end
	self.AwardStates[self.UsedNum] = 2;
	self:SaveDB();
	objPlayer.RequestGetShakeAwardsSuccessMsg{UsedNum = self.UsedNum}
	self.SSATime = _now();
	self:OpenShakeAward();
	return true;
end
---��һ�ȡ����
function COnlineAwardsSystem:GetShakeAwards()
	local index = self.AwardStates[self.UsedNum];
	if(index ~= 1) then
		return ;
	end
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	local objItemSystem = objPlayer:GetSystem("CItemSystem");
	if( not objItemSystem ) then
		return ;
	end
	local nType =self.AwardTypes[self.UsedNum];
	local nIndex =self.AwardIndexs[self.UsedNum];
	local setAddItemList = {};
	table.insert(setAddItemList, {
               dwItemEnum = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemId;
               dwItemNumber =_G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemNum;
               dwBindType = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemType;
               dwLifeTime = -1;
           });
	if( not objItemSystem:IsEnumItemListCanAddToPacket(setAddItemList) ) then
		---������
		---�ʼ����͸���ҽ�����Ʒ
		local mailSys = objPlayer:GetSystem("CMailSystem");
		if(not mailSys) then
			return;
		end
		local awardInfo = {AwardItemID = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemId,AwardItemNum = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemNum,AwardItemBindType = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemType}
		local mailMsg = _G.OnlineAwardsConfig.SetMaiInfo(awardInfo)
		if(not mailMsg) then
			return;
		end
		mailSys:SendSetMail( mailMsg, objPlayer:GetRoleID(), objPlayer:GetName() ) ---����һ�����õ��ʼ�
	else
		local tabAddPackList = {};
		table.insert(tabAddPackList,{dwItemEnum=_G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemId,dwItemNumber=_G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemNum,dwBindType = _G.OnlineAwardsConfig.ItemInfos[nType][nIndex].itemType})
		objItemSystem:AddEnumItemListToPacket(tabAddPackList, _G.ItemSysOperType.OnlineAward);
	end
	if(_G.OnlineAwardsConfig.ItemInfos[nType][nIndex].isBroadCast) then
		CGameApp.BroadCastGetShakeAwardsMsg{RoleID = objPlayer:GetRoleID(),RoleName = objPlayer:GetName(),AwardInfo = {Type = nType,Index = nIndex}}
	end
	self.AwardStates[self.UsedNum] = 2;
	self:SaveDB();
	objPlayer.RequestGetShakeAwardsSuccessMsg{UsedNum = self.UsedNum}
	self.SSATime = _now();
	self:OpenShakeAward();
end
---�������ݿ�
function COnlineAwardsSystem:SaveDB()
	if(self.RoleID <= 0) then
		self.objDBQuery:InsertOnlineAwardsInfo()
		self.RoleID = self:GetPlayer():GetRoleID()
	else
		self.objDBQuery:UpdateOnlineAwardsInfo()
	end
end
-----��ʱ��������
function COnlineAwardsSystem:ClearOnlineAwardsInfo()
	local objPlayer = self:GetPlayer()
	if(not objPlayer) then
		return;
	end
	self.UsedNum = 0;
	self.AwardIndexs = {0,0,0,0,0,0,0,0};
	self.AwardTypes = {0,0,0,0,0,0,0,0};
	self.AwardStates = {0,0,0,0,0,0,0,0};
	local interTime = 0;
	self.InterTime = 0;
	objPlayer.SynchronizeToClientMsg{UsedNum = self.UsedNum,AwardIndexs = self.AwardIndexs,AwardTypes = self.AwardTypes,InterTime = interTime};
	self:OpenShakeAward();
end
---�����ַ��� ת��Ϊ table
function COnlineAwardsSystem:LoadStr(str)
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
function COnlineAwardsSystem:UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		strResult =  strResult..str[i]..";"
	end
	return strResult
end;

