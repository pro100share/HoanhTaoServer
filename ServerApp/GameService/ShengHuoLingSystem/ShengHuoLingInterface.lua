--[[
	[ \brief ʥ����ϵͳ�ӿ�
	[ \author ���в�
	[ \date 2014-5-26
	[ ����ʥ����ϵͳ�ӿ� 
	]]

--[[
	[ \brief ��ʽ���ַ���
	[ �Ѵ洢��Ƭ״̬�ı��ʽ��Ϊ�ַ�����
	[ \param table tState �洢��Ƭ״̬�ı�
	[ \return string ���ظ�ʽ���ַ���
	]]
local function FormatStateStr(tState)
	local sFormat = "";
	for k , v in pairs(tState) do
		sFormat = sFormat..k.."=";
		for _, nState in pairs(v) do 
			sFormat = sFormat..nState..","
		end
		sFormat = sFormat..";"
	end
	
	return sFormat;
end	
		
--[[
	[ \brief ǿ������
	[ ִ��ǿ���߼�,�����������ߣ�������Ƭ�ȼ���������������
	[ \param number nGroupIndex ��Ƭ������
	[ \param number nSlotIndex ��Ƭ��λ����
	]]
function CShengHuoLingSystem:Strength(nGroupIndex, nSlotIndex)
	if not self:StrengthCheck(nGroupIndex, nSlotIndex) then
		return;
	end
	
	local nPreLevel = ShengHuoLingConfig.GetSuitLevel(self.tState, nGroupIndex);
	self.tState[nGroupIndex][nSlotIndex] =
		self.tState[nGroupIndex][nSlotIndex] + 1;
	local nCurLevel = ShengHuoLingConfig.GetSuitLevel(self.tState, nGroupIndex);
	
	-- ͬ����Ϣ
	local oPlayer = self:GetPlayer();
	
	oPlayer.ShengHuoLingStateChgMsg{GroupIndex = nGroupIndex,
		SlotIndex = nSlotIndex, Level = self.tState[nGroupIndex][nSlotIndex]};
	
	-- ˢ������
	self:ChangeAttr();
	
	-- ��װ�㲥���
	if nCurLevel > nPreLevel then
		for k, v in pairs(ShengHuoLingConfig.BoardcastLevel) do
			if v == nCurLevel then
				CGameApp.ShengHuoLingSuitBoardcastMsg
				{
					RoleId = oPlayer:GetRoleID(),
					RoleName = oPlayer:GetInfo().szRoleName,
					GroupIndex = nGroupIndex,
					Level = nCurLevel
				};
				break
			end
		end
	end
	
	-- �������ݿ�
	local tDBInfo = {};
	tDBInfo.szSetState = FormatStateStr(self.tState);
	self.oDBQuery:UpdateStateInfo(tDBInfo);
end


--[[
[ \brief �鿴��Ϣ�Ĵ�����
[ \param number nRoleID ���鿴�����ID
]]
function CShengHuoLingSystem:ViewOtherProcess(nRoleID)
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("Cannot get player by CShengHuoLingSystem:ViewOtherMountList");
		return;
	end
	local cbk = function(_, result, _)
		if result == -1 then
			self:ViewResult(false);
		end
	end
	_G.GSRemoteCall(nRoleID, "CShengHuoLingSystem", "BeViewProcess",
		{oPlayer:GetRoleID()}, cbk);
end

--[[
[ \brief ���Ͳ鿴���
[ \param boolean bIsOk �Ƿ�鿴�ɹ�
[\param table tState ���в�λ��״̬
]]
function CShengHuoLingSystem:ViewResult(bIsOk, tState)
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("Cannot get player by CShengHuoLingSystem:ViewResult");
		return;
	end
	oPlayer.ShengHuoLingSys_ViewOtherResultMsg{IsOK = bIsOk, setState = tState};
end

--[[
[ \brief ���鿴�Ĵ���
[ \param number nFromRoleID �鿴�˵�
]]
function CShengHuoLingSystem:BeViewProcess(nFromRoleID)
	-- ����Լ��Ƿ���Ȩ��
	if self:HasAuthority('ShengHuoLing') then
		_G.GSRemoteCall(nFromRoleID, "CShengHuoLingSystem", "ViewResult",
			{true, self.tState}, nil);
	else
		_G.GSRemoteCall(nFromRoleID, "CShengHuoLingSystem", "ViewResult",
			{false, {}}, nil);
	end
	
end

--[[
[ \brief �鿴ʧ�ܵĴ���
[ \param boolean bIsOk �Ƿ�鿴�ɹ�
]]
function CShengHuoLingSystem:ViewFailResult(bIsOk)
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("Cannot get player by CShengHuoLingSystem:ViewFailResult");
		return;
	end
	oPlayer.ShengHuoLingSys_ViewOtherResultMsg{IsOK = bIsOk};
end
