--[[
���ܣ����ȸ���
���ߣ�κ��
ʱ�䣺2013-10-29
--]]

_G.MatrixMethodConfig = {
	--�Ƿ����ع�
	bOpen = false;
	freeMaxNum = 10;  ----����������˴���
	------һ��δ�������޸�---------
	starAddExpNum = {1,3,5,10}; ----������Ǻ�ӵı���
	conItemNumPre = 100; ---������Ʒ�ٷֱ� �磺80%
	conGoldNum = 100;    ---����Ԫ���İٷֱ� �磺80%
}

----------------------------------------------------
-------����Ϊ�ȸ��½ӿڣ���
----------------------------------------------------
function MatrixMethodConfig:Reload()
	local szPath = "../Data/"
	dofile(szPath..'MatrixMethod/MatrixMethodConfig.lua')
end