--[[
���ܣ��ƺ�«�ȸ���
���ߣ�κ��
ʱ�䣺2014-4-2
--]]

_G.UpdateGourdConfig = {
	--�Ƿ����ع�
	bOpen = false;
	Info = {
		[1] = {ItemID = 5910001;Limit = 1000;AddExp = 100};	
		[2] = {ItemID = 5910002;Limit = 10;AddExp = 20};	
		[3] = {ItemID = 5910003;Limit = 10;AddExp = 40};
		[4] = {ItemID = 5910004;Limit = 10;AddExp = 80};
	}
	
}
----------------------------------------------------
-------����Ϊ�ȸ��½ӿڣ���
----------------------------------------------------
function UpdateGourdConfig:Reload()
	local szPath = "../Data/"
	dofile(szPath..'Gourd/GourdConfig.lua')
end