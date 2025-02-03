--[[
˵�����������Է�������Ϣ
���ߣ�����
ʱ��: 2013-10-14
]] 

-- ��Ϣ����
_G.PropertyScrollMessage = {
    -- ��Կ
    dwSecretKey = 777;
};

-- ���ӷ�����
define.PropertyScrollDisposeMsg
{
    -- �û�����
    user = NONE;
	-- ������װ����ʶ��
	EquipID = 0;
    -- ���ĵ��߱�ʶ��
    ItemID = 0;
}
when{ user = NONE }
PropertyScrollDisposeMsg = checkUser;
when{}
function PropertyScrollDisposeMsg(user, EquipID, ItemID)
	user:GetSystem("CPropertyScrollSystem"):PropertyScrollDispose({
        dwEquipID = EquipID;
        dwItemID = ItemID;
    });
end

-- ���ӷ������㲥
define.PropertyScrollBroadCastMsg
{
    -- ��Կ
    SecretKey = 0;
    -- ��ɫ��ʶ��
    RoleID = 0;
    -- ��ɫ����
    RoleName = "";
    -- �Ƿ�����
    IsLuck = false;
	-- Ŀ��װ����ʶ��
    ItemNetData = {};
}
when{}
function PropertyScrollBroadCastMsg(SecretKey,
        RoleID,
        RoleName,
        IsLuck,
		ItemNetData)
    if SecretKey ~= PropertyScrollMessage.dwSecretKey then
        return;
    end

	local setNet = {};
	for i, objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end
	_groupcallout(setNet,
        "PropertyScrollBroadCastMsg", { 
            RoleID = RoleID;
            RoleName = RoleName;
            IsLuck = IsLuck;
			ItemNetData = ItemNetData;
        });	
end
