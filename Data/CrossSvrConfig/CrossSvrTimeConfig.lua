--���ս�ȸ��������ļ�

_G.CrossSvrHotUpdateConfig = 
{
	[10001] = 
	{
		--���ŵ�ʱ��  CrossSvrLoginConfig���õ�����ҲҪ��
		WeeklyOpenDay = {1};
		--����ʱ��
		CreateTime = -1;
		--��ǰ֪ͨ���ʼʱ��
		NoticeStartTime = "19:50";
		--�������Ŀ�ʼʱ��
		EnterTime = "20:00";
		--�������Ľ���ʱ�� 
		StopEnterTime = "20:40";
		--����ʱ��
		ExitTime = "21:00";
	};
	
}


----------------------------------------------------
-------����Ϊ�ȸ��½ӿڣ���
----------------------------------------------------
_G.CrossSvrHotUpdate = {}

function CrossSvrHotUpdate:Reload()
	local szPath = "../Data/"
	dofile(szPath..'CrossSvrConfig/CrossSvrTimeConfig.lua')
	
	print('CrossSvrHotUpdate:Reload')
	if CCrossSvrManager then
		CCrossSvrManager:HotUpdate();
		CCrossSvrHoldManager:HotUpdate();
	end
end
