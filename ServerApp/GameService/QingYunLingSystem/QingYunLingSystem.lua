--[[
	������
���ߣ��Է�
ʱ�䣺2013-07-30
�������Ʒ������߼�������
]]
_G.CQingYunLingSystem = {};
local cfg = CloudMedalConfig
function CQingYunLingSystem:new()
	local obj = CSystem:new("CQingYunLingSystem");
	obj.objDBQuery = nil;    --��Ӧ�����ݿ����ģ
	for i,v in pairs(CQingYunLingSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CQingYunLingSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.objDBQuery = CQingYunLingSystemDB:new(objDB, self);
	self.tAll = {};	
	self.tLotteryID = {};
	self.nNum = 0;
	self.nCount = 1;
	local info = objPlayer:GetLineData("CQingYunLingSystem")[1][1];

	if info then	
		self:SetMedalInfo(info);
	else
		for k,v in pairs(cfg.YinZhangSX) do
			self.tAll[k] = 0
		end
		self.objDBQuery:InsertData(self:UpdateStr(self:GetAllInfo()))
	end;
	return true;
end;
 --[[
   [ \brief �������е�ѫ����Ϣ
   [ \param table tInfo ������Ϣ
   ]]
function CQingYunLingSystem:SetAllInfo(tInfo)
	local tList = cfg.YinZhangSX;
	local nLadder = math.min(cfg:GetLadder(tInfo),cfg.OpenLadder) 
	for k,v in pairs(tInfo) do
		local dwMax = tList[k][cfg.LadderInfo[nLadder].nLevel].dwExp
		if v >= dwMax then
			tInfo[k] = dwMax;
		end
	end
	local nLadder = cfg:GetLadder(tInfo)
	if cfg:GetLadder(self.tAll) < nLadder and nLadder <= cfg.OpenLadder then
		self:BroadCast(nLadder)
	end
	self.tAll = tInfo
	self:AppendBasicProperty();
end 
--[[
   [ \brief ��ȡ���е�ѫ����Ϣ
   [ \return table ����ѫ�¾���
   ]]
function CQingYunLingSystem:GetAllInfo()
	return self.tAll
end 
--[[
   [ \brief ���õ�ǰҡ��ID�б�
   [ \param table tInfo ������Ϣ
   ]]
function CQingYunLingSystem:SetLotteryID(tInfo)
	for k ,v in pairs(tInfo) do
		self.tLotteryID[k] = v
	end
end 
--[[
   [ \brief ��ȡ��ǰҡ��ID�б�
   [ \return table ��ǰҡ��ID�б�
   ]]
function CQingYunLingSystem:GetLotteryID()
	return self.tLotteryID
end
--[[
   [ \brief ���õ�ǰҡ������
   [ \param number nNum ���Ĵ���
   ]]
function CQingYunLingSystem:SetnNum(nNum)
	self.nNum = nNum
end 
--[[
   [ \brief ��ȡ��ǰҡ������
   [ \return table ��ǰҡ������
   ]]
function CQingYunLingSystem:GetnNum()
	return self.nNum
end
--[[
   [ \brief ���õ�ǰҡ������
   [ \param number nNum ����ҡ������
   ]]
function CQingYunLingSystem:SetnCount(nCount)
	self.nCount = nCount
end 
--[[
   [ \brief ��ȡ��ǰҡ������
   [ \return table ��ǰҡ������
   ]]
function CQingYunLingSystem:GetnCount()
	return self.nCount
end

--�������н׶�
function CQingYunLingSystem:SetMedalInfo(info)		
	-- if not self:HasAuthority("XiaYiXunZhang") then
		-- return;
	-- end;
	local tLotteryID = self:LoadStr(info["dwLotteryID"]);
	if tLotteryID then
		self:SetLotteryID(tLotteryID);
	end	
	local tAll = self:LoadStr(info["dwTotalExp"]);
	if tAll then
		self:SetAllInfo(tAll);
	end
	self:SetnNum(info["dwNum"] or 0);
	self:SetnCount(info["dwCount"] or 1);
end;
 --[[
   [ \brief ���ݿ��ַ���ת��Ϊtable
   [ \param stfing str ���ݿ��ַ���
   [ \return table  t    Ŀ����Ϣ��
   ]]
function CQingYunLingSystem:LoadStr(str)
	if(str == nil) then
		return false;
	end
	local t = {};
	local lastIndex = 0;
	local index = 1;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		t[index] = value;
		index = index + 1;
	end;
	return t;
end
 --[[
   [ \brief ����ǰ��Ϣ��ת��Ϊ�ַ���
   [ \param table tInfo ��ת����
   [ \return string  str   Ŀ���ַ���
   ]]
function CQingYunLingSystem:UpdateStr(tInfo)
	local strResult = ""
	for k , v in pairs(tInfo) do
		strResult =  strResult ..v ..";"
	end
	return strResult
end;
--������Ϸͬ����Ϣ
function CQingYunLingSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self:HasAuthority("qingyunxunzhang") then
		return;
	end;
	objPlayer.QingYunLingInitMsg{Times = self:GetnNum();
								tAll = self:GetAllInfo();
								tLotteryID = self:GetLotteryID();
								nCount = self:GetnCount();
								tShow = {};
								};
end;
--Ȩ�ޱ仯
function CQingYunLingSystem:EventGetAuthority(szAuthName)
	if szAuthName == "qingyunxunzhang" then
		local objPlayer = self:GetPlayer();
		if not objPlayer then
			return;
		end;
		self:AppendBasicProperty();
		objPlayer.QingYunLingInitMsg{Times = self.nNum;tAll = self.tAll;tLotteryID = self.tLotteryID;nCount = self:GetnCount();tShow = {};};
	end
end;

function CQingYunLingSystem:Destroy()
	
end;

function CQingYunLingSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local info = {};
	info.dwLotteryID = self:UpdateStr(self:GetLotteryID());
	info.dwTotalExp  = self:UpdateStr(self:GetAllInfo());
	info.dwNum 		 = self:GetnNum();
	info.dwCount	 = self:GetnCount();
	local tbl = {};
	table.insert(tbl, info);
	objPlayer:SetLineData("CQingYunLingSystem",tbl);
end;
--���ӻ�������
function CQingYunLingSystem:AppendBasicProperty()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local _, tAttr = cfg:GetLevelInfo(self:GetAllInfo())
	local t_attr = _G.SSingleAttrChange:new();
	if tAttr then
		for k,v in pairs(tAttr) do
			t_attr[k] = v
		end
		local skillSystem = objPlayer:GetSystem("CSkillSystem");
		skillSystem:NotifyQingYunLingProperty(t_attr);
	end;
end;
 --[[
   [ \brief ҡ��������
   [ \param number ҡ�����  -- Ϊ 0 ����ȫ��ˢ��
   ]]
function CQingYunLingSystem:OnLottery(nIndex,nCount)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if cfg:IsFull(self:GetAllInfo()) then
		return;
	end
	local itemSystem = objPlayer:GetSystem("CItemSystem")
	local nNum = self:GetnNum()
	if nIndex ~= 0 then
		local nGold = cfg:GetFlushItemInfo(self:GetAllInfo())
		if not itemSystem:IsGoldEnough(nGold) then
			return;
		end
		itemSystem:CostGold(nGold,_G.ItemSysOperType.QungYunLing)
	else
		local tCon = cfg:GetConItemInfo(self:GetAllInfo(),nCount) 
		local b_IsEnough_1, n_Minus_1 = itemSystem:CheckDelEnumItemInPacketCond(tCon.nItemID, tCon.nNum);
		if not b_IsEnough_1 then
			return;
		end;
		itemSystem:DelEnumItemInPacket(tCon.nItemID, tCon.nNum, false, _G.ItemSysOperType.QungYunLing);
	end
	local t = cfg:MakePrize(self:GetAllInfo(),nIndex)
	if not t then
		return 
	end
	self:SetnNum(nNum+1)
	self:SetnCount(nCount)
	self:SetLotteryID(t);
	self.objDBQuery:UpdateLotteryID(self:UpdateStr(self:GetLotteryID()))
	self.objDBQuery:UpdateLotteryNum(self:GetnNum())
	self.objDBQuery:UpdateLotteryCount(self:GetnCount())
	objPlayer.QingYunLingLottoryResultMsg{tPrize = t,nCount = self:GetnCount()};
end;
--ʹ����Ʒ��þ���
-- ����ֵ 1 û��Ȩ�� 2 �Ѿ����� 3�ɹ���Ӿ���
function CQingYunLingSystem:OnUseItemGetExp(nAdd)
	if not self:HasAuthority("qingyunxunzhang") then
		return 1;
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	if cfg:IsFull(self:GetAllInfo()) then
		return 2;
	end
	local tAll = {};
	for k, v in pairs(self:GetAllInfo()) do
		tAll[k] = v 
	end	
	local t = cfg:MakePrize(self:GetAllInfo(),1)
	for k,v in pairs(t) do
		tAll[v] = tAll[v] + nAdd
		break;
	end	

	self:SetAllInfo(tAll);
	self.objDBQuery:UpdateTotalExp(self:UpdateStr(self:GetAllInfo()))
	objPlayer.QingYunLingInitMsg{Times = self.nNum;tAll = self.tAll;tLotteryID = self.tLotteryID;nCount = self:GetnCount();tShow = {t[1],nAdd};};
	return 3;
end
--[[
   [ \brief ҡ��������
   [ \param number ҡ�����  -- Ϊ 0 ����ȫ��ˢ��
   ]]
function CQingYunLingSystem:OnGetPrize()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if CloudMedalConfig:IsFull(self:GetAllInfo()) then
		objPlayer.QingYunLingGetPrizeMsg{bIsGet = false};
		return
	end
	local tAll = {};
	for k, v in pairs(self:GetAllInfo()) do
		tAll[k] = v 
	end
	local tAdd = cfg:GetExpInfo(self:GetLotteryID(),self:GetnCount(),tAll)
	for k,v in pairs (tAdd) do
		tAll[k] = tAll[k] + v
	end
	self:SetAllInfo(tAll)
	self.tLotteryID = {}
	self.objDBQuery:UpdateLotteryID(self:UpdateStr(self:GetLotteryID()))
	self.objDBQuery:UpdateTotalExp(self:UpdateStr(self:GetAllInfo()))
	self.objDBQuery:UpdateLotteryCount(self:GetnCount())
	objPlayer.QingYunLingGetPrizeMsg{bIsGet = true,nCount = self:GetnCount()};
end;

--�鿴�Է�������ѫ��
function CQingYunLingSystem:ViewOtherErrantHonor(fromRoleID)
	local objPlayer = self:GetPlayer(); 
	if not objPlayer then
		return;
	end;
	_G.GSRemoteCall(fromRoleID, "CQingYunLingSystem", "BeViewQingYunLingInfo", {objPlayer:GetRoleID()}, nil);
end;

function CQingYunLingSystem:BeViewQingYunLingInfo(dwRoleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_G.GSRemoteCall(dwRoleId, "CQingYunLingSystem", "ViewQingYunLingResult", {false, {}}, nil);
		return;
	end;
	if not self:HasAuthority("qingyunxunzhang") then
		_G.GSRemoteCall(dwRoleId, "CQingYunLingSystem", "ViewQingYunLingResult", {false,{}}, nil);
		return;
	end;
	
	_G.GSRemoteCall(dwRoleId, "CQingYunLingSystem", "ViewQingYunLingResult", {true, self.tAll}, nil);
end;

--���ز鿴���
function CQingYunLingSystem:ViewQingYunLingResult(isOK, tAll)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player by CQingYunLingSystem:ViewQingYunLingResult");
		return;
	end;
	objPlayer.QingYunLingIsSawByOthersMsg{tAll = tAll;bIsCan = isOK};
end;
--�㲥��Ϣ
function CQingYunLingSystem:BroadCast(nLadder)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("Cannot get player on CErrantHonorSystem:BroadCastErrantHonor");
		return;
	end;
	-- print("==========nLadder========",nLadder)
	--�������
	local sName = objPlayer:GetInfo().szRoleName;
	--���RoleID
	local nRoleID = objPlayer:GetInfo().dwRoleID;
	--ȫ���㲥
	CGameApp.QingYunLingSys_BroadCastMsg{
        sName = sName,
        nRoleID = nRoleID,
		nLadder = nLadder,
		};
end;
