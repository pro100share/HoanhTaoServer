--[[
	[ \brief ������չϵͳ�ӿ�
	[ \author ���в�
	[ \date 2014-5-26
	[ ��������չϵͳ�ӿ� 
	]]

--[[
	[ \brief ��ʽ���ַ���
	[ �Ѵ洢��չ�����ı��ʽ��Ϊ�ַ�����
	[ \param table tCount �洢��չ�����ı�
	[ \return string ���ظ�ʽ���ַ���
	]]
local function FormatCountStr(tCount)
	local sFormat = "";
	for k , v in pairs(tCount) do
		sFormat = sFormat..k..","..v..";";
	end
	
	return sFormat;
end	
		
--[[
	[ \brief ��չ����
	[ ִ����չ�߼�
	[ \param number nSysEnum ϵͳö��
	[ \param number nOptCount ��������
	]]
function CKungFuExtendSystem:Extend(nSysEnum, nOptCount)
	if not self:ExtendCheck(nSysEnum, nOptCount) then
		return;
	end

	self.tCount[nSysEnum] = self.tCount[nSysEnum] + nOptCount;
		
	-- ͬ����Ϣ
	self:SynCount();

	-- ˢ������
	self:ChangeAttr();
	
	--�㲥
	if self.tCount[nSysEnum] == self.tMaxCount[nSysEnum] then
		local level = 0;
		for k, v in pairs(_G.KungFuExtendConfig[nSysEnum].tLevel) do
			if self.tCount[nSysEnum] == v.maxCount then
				level = k;
			end
		end
		local oPlayer = self:GetPlayer();
		CGameApp.KungFuExtendBoardcastMsg
			{
				RoleID = oPlayer:GetRoleID(),
				RoleName = oPlayer:GetInfo().szRoleName,
				SystemEnum = nSysEnum,
				Level = level,
			};
	end
	
	-- �������ݿ�
	local tDBInfo = {};
	tDBInfo.tCount = FormatCountStr(self.tCount);
	self.oDBQuery:UpdateCountInfo(tDBInfo);
end

--[[
	[ \brief �õ���ǰ���� ����ߴ���
	[ \param number nSysEnum ϵͳö��
	[ \return number ���ص�ǰ��չ����
	[ \return number ������չ��������
	]]
function CKungFuExtendSystem:GetCount(nSysEnum)
	return self.tCount[nSysEnum], self.tMaxCount[nSysEnum];
end
