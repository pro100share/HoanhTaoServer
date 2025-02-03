
--[[
���ܣ����ĳ�ͷϵͳ�����ࣨ��������
���ߣ�κ��
ʱ�䣺2013-9-4
--]]



--------------------------------
_G.CFrenzyHoeSystemManager = CSingle:new();
--���뵥�������
CSingleManager:AddSingle(CFrenzyHoeSystemManager,true);
--------------------------------
--------------------------------
--��ʼ��
function CFrenzyHoeSystemManager:Create()
	self.dataList = {};    -----���ݿ�list��
	self.dataList[1] = {}; ----�ڱ��¼��б�
	self.dataList[2] = {};
	self.dataList[3] = {}; ----�ڱ������б� ���20��������
end

function CFrenzyHoeSystemManager:UpdateData(Data)
	if(#Data[1][1] ~= 0) then
		for k,v in pairs (Data[1][1]) do  -----�ڱ��¼���
			self.dataList[1][k] = {}
			self.dataList[1][k].dwRoleId = v.dwRoleId
			self.dataList[1][k].dwAwardItemId = v.dwAwardItemId
			self.dataList[1][k].szRoleName = v.szRoleName
	 	end
			
	end
	if(#Data[1][3] ~= 0) then
		for k,v in pairs (Data[1][3]) do  -----�ڱ����ű�
			self.dataList[3][k] = {}
			self.dataList[3][k].dwTime = v.dwTime
			self.dataList[3][k].dwRoleId = v.dwRoleId
			self.dataList[3][k].dwAwardItemId = v.dwAwardItemId
			self.dataList[3][k].szRoleName = v.szRoleName
			self.dataList[3][k].dwHoeItemId = v.dwHoeItemId
			self.dataList[3][k].dwHour = v.dwHour
			self.dataList[3][k].dwMinute = v.dwMinute
			self.dataList[3][k].dwSec = v.dwSec	
	 	end
		self:SortBroadCast()
	end
end

----�����ڱ��¼��ڴ���Ϣ
function CFrenzyHoeSystemManager:UpdateDigEvent(ParamInfo)
	local dwHas = false
	for k,v in pairs(self.dataList[1]) do
		if(v.dwAwardItemId == ParamInfo.dwAwardItemId) then
			v.dwRoleId = ParamInfo.dwRoleId;
			v.dwAwardItemId = ParamInfo.dwAwardItemId;
			v.szRoleName = ParamInfo.szRoleName;
			dwHas = true
			break
		end
	end
	if(not dwHas) then
		local digEventInfo = {
			dwRoleId = ParamInfo.dwRoleId;
			dwAwardItemId = ParamInfo.dwAwardItemId;
			szRoleName = ParamInfo.szRoleName;
		}
		table.insert(self.dataList[1],digEventInfo)
	end
end

function CFrenzyHoeSystemManager:UpdateBroadCastInfo(ParamInfo)
	local maxnum = #self.dataList[3]
	if(maxnum >= TreasureMaxNum) then
		for i = (TreasureMaxNum-1), 1 ,-1 do
			self.dataList[3][i+1] =self.dataList[3][i]
		end
		self.dataList[3][1] = ParamInfo;
		
	else
		for i = maxnum,1,-1 do
			self.dataList[3][i+1] = self.dataList[3][i]
		end
		self.dataList[3][1] = ParamInfo;
	end
end

function CFrenzyHoeSystemManager:SortBroadCast()
	local tempInfo = {}
	for i = 1,#self.dataList[3] do
		for j = #self.dataList[3]-1,i,-1 do
			if(self.dataList[3][j+1].dwTime >= self.dataList[3][j].dwTime ) then
				tempInfo = self.dataList[3][j+1];
				self.dataList[3][j+1] = self.dataList[3][j];
				self.dataList[3][j] = tempInfo;
			end
		end
	end
end