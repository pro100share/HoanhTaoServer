_G.FrenzyHoeConfig = {
	--�Ƿ����
	bOpen = false;
	-- ItemFrenzyHoeExchangeConfig = {
		-- [1] = {
		-- ID = 1,
		-- FriendNum = 12,            -----�Ѻö���
		-- ExchangeItemId = 4902009,   -----�ɶһ���ͷ����Ʒid
		-- ItemNum = 1,               -----�ɶһ���Ʒ������
		-- BindType = 0,
		-- String ="�ں�..." ,
		-- },
	-- }
}

----------------------------------------------------
-------����Ϊ�ȸ��½ӿڣ���
----------------------------------------------------
function FrenzyHoeConfig:Reload()
	local szPath = "../Data/"
	dofile(szPath..'FrenzyHoe/FrenzyHoeConfig.lua')
end