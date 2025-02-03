--��ҵ���ϵͳ
_G.CCommercialActSystem = {};
function CCommercialActSystem:new(objPlayer)
	local obj = CSystem:new("CCommercialActSystem");
	
	for i, v in pairs(CCommercialActSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

--create
function CCommercialActSystem:Create(bChangeLine)
	--ÿ��ϵͳ����ʱ����ҽӵ��Լ��Ĺ�����player����
	self.objPlayer = self:GetPlayer();
	if not self.objPlayer then
		_err("CCommercialActSystem Create Cannot get player");
		return false;
	end;
	--��ʼ��DBģ��
	self.objDB = self.objPlayer:GetDBQuery();
	if not self.objDB then
		_err("CCommercialActSystem Create Cannot get DBQuery");
		return false;
	end;
	
	--��ȡ��Ϣ
	local Data	= self.objPlayer:GetLineData("CCommercialActSystem");
	if not Data then
		_err("CCommercialActSystem Create CanNot GetLineData!!!");
		return false;
	end
	self.tGetRewardInfo = Data[1];
	
	return true;
end;
--OnEnterScene
function CCommercialActSystem:OnEnterScene()
	self:InitCommercialActList();
	self:CalculateAct();
end;

--���߿�ʼ
function CCommercialActSystem:OnChangeLineBegin()
	self.objPlayer:SetLineData("CCommercialActSystem", self.tGetRewardInfo);
end;

function CCommercialActSystem:OnEventCenter(szEventName)
	if szEventName == 'EventCharge' then
		self:CalculateAct();
	end
end

function CCommercialActSystem:OnOneDayOver()
	self:CalculateAct();
end;

function CCommercialActSystem:InitCommercialActList()
	self.objPlayer.InitCommercialActListMsg{List = CCommercialActManager:GetCommercialActIDList()};
end;

function CCommercialActSystem:GetRewardRecord(nActID, nDays, nIndex)
	if self.tGetRewardInfo[nActID] and self.tGetRewardInfo[nActID][nDays] then
		return self.tGetRewardInfo[nActID][nDays][nIndex] or 0;
	end;
	return 0;
end;

function CCommercialActSystem:CalculateAct()
	CCommercialActManager:CalculateAct(self.objPlayer)
end;

--�콱��¼���ݿ�
function CCommercialActSystem:RecordDB(nActID, nDays, nIndex)
	local bNew = true;
	if self.tGetRewardInfo[nActID] and self.tGetRewardInfo[nActID][nDays]
		and self.tGetRewardInfo[nActID][nDays][nIndex] then
			bNew = false;
	else
		self.tGetRewardInfo[nActID] = self.tGetRewardInfo[nActID] or {};
		self.tGetRewardInfo[nActID][nDays] = self.tGetRewardInfo[nActID][nDays] or {};
		self.tGetRewardInfo[nActID][nDays][nIndex] = 0;
	end;
	self.tGetRewardInfo[nActID][nDays][nIndex] = self.tGetRewardInfo[nActID][nDays][nIndex] + 1;
	if bNew then
		local SqlCmd = self.objDB:CreateInsertCmd("T_Account_CommercialAct");
		SqlCmd.Fields.dwAccountID       = self.objPlayer:GetAccountID();
		SqlCmd.Fields.dwActID			= nActID;
		SqlCmd.Fields.dwDays			= nDays;
		SqlCmd.Fields.dwIndex			= nIndex;
		SqlCmd.Fields.dwGetTimes		= self.tGetRewardInfo[nActID][nDays][nIndex];
		SqlCmd:execute()
	else
		local SqlCmd = self.objDB:CreateUpdateCmd("T_Account_CommercialAct");
		SqlCmd.Wheres.dwAccountID 		= self.objPlayer:GetAccountID();
		SqlCmd.Wheres.dwActID 			= nActID;
		SqlCmd.Wheres.dwDays			= nDays;
		SqlCmd.Wheres.dwIndex			= nIndex;
		
		SqlCmd.Fields.dwGetTimes		= self.tGetRewardInfo[nActID][nDays][nIndex];
		SqlCmd:execute()
	end;
end;

function CCommercialActSystem:GetActInfo(nActID)
	CCommercialActManager:PlayerGetActInfo(nActID, self.objPlayer);
end;

--��Ҫ�콱
function CCommercialActSystem:GetReward(nActID, nIndex)
	CCommercialActManager:PlayerGetReward(nActID, nIndex, self.objPlayer);
end;

define.CommercialActGetActInfoMsg
{
	user = NONE,
	ActID = 0,
}
when{user = NONE}
CommercialActGetActInfoMsg = checkUser
when{}
function CommercialActGetActInfoMsg(user, ActID)
	if user then
		local commercialActSys = user:GetSystem("CCommercialActSystem");
		if commercialActSys then
			commercialActSys:GetActInfo(ActID);
		end;
	end;
end;

define.CommercialActGetRewardMsg
{
	user = NONE,
	ActID = 0,
	Index = 0,
}
when{user = NONE}
CommercialActGetRewardMsg = checkUser
when{}
function CommercialActGetRewardMsg(user, ActID, Index)
	if user then
		local commercialActSys = user:GetSystem("CCommercialActSystem");
		if commercialActSys then
			commercialActSys:GetReward(ActID, Index);
		end;
	end;
end;
