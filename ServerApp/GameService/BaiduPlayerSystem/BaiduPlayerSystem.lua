
--[[
	�ٶ�Ӱ���ƹ�ϵͳ
	�ܳ�ɳ
	2013-9-7
--]]

_G.CBaiduPlayerSystem = {};
local cfg = BaiduPlayerConfig
local szType = ItemSysOperType.BaiduPlayer;
-------------------------------------------------------------------
function CBaiduPlayerSystem:new()
	local obj = CSystem:new("CBaiduPlayerSystem");
	obj.Data = {}
	for i,v in pairs(CBaiduPlayerSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CBaiduPlayerSystem:Create()
	self.objPlayer = self:GetPlayer();
	if not self.objPlayer then
		return false;
	end;
	
	local lineData = self.objPlayer:GetLineData("CBaiduPlayerSystem")[1];
	
	self.Data.dwGetOnceTime = 0
	self.Data.dwGetDailyTime = 0
	
	if lineData then
		self.Data.dwGetOnceTime = lineData.dwGetOnceTime or 0
		self.Data.dwGetDailyTime = lineData.dwGetDailyTime or 0
	end
	
	self.m_ObjDB = self.objPlayer:GetDBQuery();
	if not self.m_ObjDB then
		return false;
	end;
	
	return true;
end;

function CBaiduPlayerSystem:Destroy()

end;

function CBaiduPlayerSystem:OnChangeLineBegin()
	local lineData = self.Data;
	self.objPlayer:SetLineData("CBaiduPlayerSystem", lineData);
end;

function CBaiduPlayerSystem:OnEnterScene()
	self:SendInfo()
end
------------------------------------------------------------------------------------------
--����ܷ���ȡ��װ����
function CBaiduPlayerSystem:CheckOnceReward()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return false end;
	local sysItem = objPlayer:GetSystem("CItemSystem")
	
	if self.Data.dwGetOnceTime > 0 then
		self:SendRes(11)
		return false;
	end
	
	local setAddList = cfg.Setup  
	
	if not sysItem:IsEnumItemListCanAddToPacket(setAddList) then
		self:SendRes(2)
		return false
	end
	
	return true
end
--����ܷ���ȡÿ�ս���
function CBaiduPlayerSystem:CheckDailyReward()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return false end;
	local sysItem = objPlayer:GetSystem("CItemSystem")
	
	if CTimeFormat:isToday(self.Data.dwGetDailyTime) then
		self:SendRes(21)
		return false;
	end
	
	local setAddList = cfg.Daily  
	
	if not sysItem:IsEnumItemListCanAddToPacket(setAddList) then
		self:SendRes(2)
		return false
	end
	
	return true
end
------------------------------------------------------------------------------------------
--����װ����
function CBaiduPlayerSystem:GiveOnceReward()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysItem = objPlayer:GetSystem("CItemSystem")
	self.Data.dwGetOnceTime = _now()
	
	local setAddList = cfg.Setup
	if sysItem:AddEnumItemListToPacket(setAddList, szType) then
		self:DBUpdate()
	end
	self:SendRes(10)
end
--��ÿ�ս���
function CBaiduPlayerSystem:GiveDailyReward()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	local sysItem = objPlayer:GetSystem("CItemSystem")
	self.Data.dwGetDailyTime = _now()
	
	local setAddList = cfg.Daily
	if sysItem:AddEnumItemListToPacket(setAddList, szType) then
		self:DBUpdate()
	end
	self:SendRes(20)
end
------------------------------------------------------------------------------------------
--�յ���ȡ��װ��������
function CBaiduPlayerSystem:OnRecvAskForOnceReward()
	if self:CheckOnceReward() then
		self:GiveOnceReward()
	end
end
--�յ���ȡÿ�ս�������
function CBaiduPlayerSystem:OnRecvAskForDailyReward()
	if self:CheckDailyReward() then
		self:GiveDailyReward()
	end
end
-------------------------------------------------------------------------------------------
--���Ͳ�������
function CBaiduPlayerSystem:SendRes(dwRes)
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	objPlayer.BaiduPlayerResMsg{Res=dwRes}
end
--������ȡ��Ϣ
function CBaiduPlayerSystem:SendInfo()
	local objPlayer = self:GetPlayer()
	if not objPlayer then return end;
	
	local Info = {}
	Info[1] = self.Data.dwGetOnceTime--�ϴ���ȡ��װ����ʱ��
	Info[2] = self.Data.dwGetDailyTime--�ϴ���ȡÿ�ս���ʱ��
	
	objPlayer.BaiduPlayerInfoMsg{Info=Info}
end
-------------------------------------------------------------------------------------------
--���ݿ����
function CBaiduPlayerSystem:DBUpdate()
	self.m_ObjDB = self.m_ObjDB or self.objPlayer:GetDBQuery();
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_BaiduPlayer");
	
	SqlCmd.Fields.dwGetOnceTime	= self.Data.dwGetOnceTime
	SqlCmd.Fields.dwGetDailyTime = self.Data.dwGetDailyTime
	
	SqlCmd.Wheres.dwRoleID	= self.objPlayer:GetRoleID();
	SqlCmd:execute();
end





