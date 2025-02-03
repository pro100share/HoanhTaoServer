--[[
���ܣ���Ϸ��·������������
���ߣ��ܻ���
ʱ�䣺2012-03-05
]]

_G.CGameLineManager = {
    setAllGameLine = {};
	LineNum = 0;
} ;
--��һ�ȡ��·��Ϣ
function CGameLineManager:GetGameLineInfo(objPlayer)
	--��ȡ����ǰ�������ϵ�������· 
	--quying chg 2013-04-09   ��·����
	local sortId = 0; --0:��С����
	local num = 0;
	for _, info in pairs(self.setAllGameLine) do
		num = num + info[3];
	end;
	local startDay = math.ceil((_now() - CPlayerManager.dwStartTime) / (1000 * 60 * 24 * 60))
	sortId = _G.SelectLineSort.sortId(startDay, num);
	if sortId == 0 then
		table.sort(self.setAllGameLine, function(a, b) return a[3] < b[3] end);
	elseif sortId == 1 then
		table.sort(self.setAllGameLine, function(a, b) return a[3] > b[3] end);
	end;
	objPlayer.OnGameLineInfoMsg{InfoSet = self.setAllGameLine};
end;


--����ѡ����·����Ϣ 
function CGameLineManager:SelectGameLine(objPlayer, dwGameLineID, UF)  
	if objPlayer.bSelectLining then
		return;
	end;
	objPlayer.bSelectLining = true;
	local dwTimeStamp   = _now(); 
	local szSign = ("themgai1"..tostring(dwTimeStamp)):md5();
	objPlayer.szCheckSign = szSign;       --����������֤����֤�� 
	
	if UF=="" then
		UF = nil
	end
	
	local objInfo = objPlayer.sRoleInfo;
	objInfo.szIP = objPlayer:GetIP()
	objInfo.szUF = UF or objPlayer:GetUF()
	
	objPlayer.dwNewFlag = objInfo.dwNewRoleFlag;
		
	CKSApp.OnRoleLoginMsg
	{
		AccountID   = objPlayer:GetAccountID();
		LineID      = dwGameLineID;
		AdultFlag   = objPlayer.dwAdultFlag;
		RoleInfo    = objInfo;
	}
end; 


define.UpdateGameLineInfoMsg
{
    InfoSet = {};
	LineNum = 0;
}
when{}
function UpdateGameLineInfoMsg(InfoSet, LineNum)
    CGameLineManager.setAllGameLine = InfoSet;
	CGameLineManager.LineNum = LineNum;
end;  



