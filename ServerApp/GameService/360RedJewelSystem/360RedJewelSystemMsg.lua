--[[
˵����360����ϵͳ��Ϣ
���ߣ�����
]] 

-- 360������Ϣ
define.Receive360RedJewelMsg
{
    -- �û�����
    user = NONE;
	-- �ʺ�ID
	AccountID = 0;
    -- �ȼ�
    Level = 0;
    -- ����
    Type = "";
    -- �Ƿ���Ч
    IsActive = 0;
    -- �ɳ�ֵ
    Growth = 0;
}
when{}
function Receive360RedJewelMsg(user, AccountID, Level, Type, IsActive, Growth)
	--[[
	local objPlayer = CPlayerManager:GetPlayer(AccountID);
	if objPlayer == nil then
		return;
	end
	objPlayer:GetSystem("C360RedJewelSystem"):Receive360RedJewel({
        dwLevel = Level;
        strType = Type;
        dwIsActive = IsActive;
        dwGrowth = Growth;
    });
	--]]
end

-- 360���꽱����ȡ
define.Get360RedJewelRewardMsg
{
    -- �û�����
    user = NONE;
    -- ������Ŀ����
    ItemIndex = 0;
}
when{ user = NONE }
Get360RedJewelRewardMsg = checkUser;
when{}
function Get360RedJewelRewardMsg(user, ItemIndex)
    --user:GetSystem("C360RedJewelSystem"):Get360RedJewelReward(ItemIndex);
end
