--[[
    [ \brief �Ŷ�ϵͳ�ӿ�
    [ \author ���в�
    [ \date 2014-7-16
    [ ����Ŷ�ϵͳ�ӿ� 
    ]]

-- �Ŷ�ϵͳ�����ļ�
local tConfig = _G.CurioConfig;    
    	
--[[
    [ \brief �ύ������
    [ ִ���ύ�߼�
    [ \param table tInfo �ύ��Ϣ
    ]]
function CCurioSystem:Commit(tInfo)
	if not self:CommitCheck(tInfo) then return; end
	
	self:SynCount();
	self:ChangeAttr();
	
	self.oDBQuery:UpdateCountInfo({tCount =
        self:FormatCountString(self.tCount)});
end

--[[
    [ \brief �õ���ǰ����
    [ \param number nCurioIndex �Ŷ�����
    [\param number nPartIndex ��Ƭ����
    [ \return number ���ص�ǰ��չ����
    ]]
function CCurioSystem:GetCount(nCurioIndex, nPartIndex)
	return self.tCount[nCurioIndex][nPartIndex];
end

--[[
    [ \brief �㲥����
    [ \param number nCurioIndex �Ŷ�����
    ]]
function CCurioSystem:Boardcast(nCurioIndex)
    if tConfig:GetGuDongNum(self.tCount, nCurioIndex) >=
        tConfig:GetConfigCount(nCurioIndex) then
        if tConfig:IsFinish(self.tCount) then
            nCurioIndex = -1;
        end            
                
        CGameApp.CurioBoardcastMsg{
            RoleID = self:GetPlayer():GetRoleID(),
            RoleName = self:GetPlayer():GetInfo().szRoleName,
            CurioIndex = nCurioIndex,
        };
    end
end    
