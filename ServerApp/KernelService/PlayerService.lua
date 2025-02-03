---------- [[ 360���� ]] ----------
--Player��KS�ϵ�״̬
_G.PlayerStateInKS = 
{
	PSK_LIS_CREATE	=	1;--Login֪ͨ������ɫ��֪ͨGS��û���յ�GS����
	PSK_GS_RETURN	=	2;--�յ�GS����
	PSK_GS_GAMING	=	3;--��GS����Ϸ
	PSK_CHANGE_LINE	=	4;--������
};

-- _initWebTransSvr(_G.Gift360ServerAddr or "");


define.PlayerGet360RewardMsg
{
	AccountID = 0;
	Level = 0;
}
when{}
function PlayerGet360RewardMsg(AccountID, Level) 
	local player = CPlayerManager:GetPlayer(AccountID); 
	if not player then 
		-- print("PlayerGet360RewardMsg not player",AccountID);
		return ;
	end;
	--_sendWebRequest(1,{accid = AccountID, level = Level});
end;

---------- [[ 360���� ]] ----------

---------- [[ 360���� ]] ----------
-- 360������Ϣ������Ϣ
define.PlayerGet360RedJewelMsg
{
    -- �ʺ�ID
    AccountID = 0;
}
when{}
function PlayerGet360RedJewelMsg(AccountID)
    if CPlayerManager:GetPlayer(AccountID) == nil then
        return;
    end
    --_sendWebRequest(2,{accid = AccountID});
end

-- @brief ��ȡ����Ȩ��Ϣ�ص���������
-- @param number accountid �ʺ�ID(������)
-- @param string level ��Ȩ�ȼ�
-- @param number nResult ���ֵ
local function rewardCBFunc(accountid, level, nResult)
	local player = CPlayerManager:GetPlayer(accountid);
	if player then
		player.CommercialGiftResultMsg{Level = level, Result = nResult};
	end;
end;


-- @brief ��ȡ��������Ϣ�ص���������
-- @param number dwAccountID �ʺ�ID(������)
-- @param number dwErrorNo ������
-- @param string strErrMsg ������Ϣ
-- @param number dwLevel �ȼ�
-- @param string strType ����
-- @param number dwIsActive �Ƿ񼤻�
-- @param number dwGrowth �ɳ�ֵ
local function RedjewelCBFunc(nResCode, dwAccountID, dwErrorNo, strErrMsg, dwLevel, strType, dwIsActive, dwGrowth)
    local objPlayer = CPlayerManager:GetPlayer(dwAccountID);
    if objPlayer == nil then
        return;
    end
    if dwErrorNo == 0 then
        objPlayer.objLine.Receive360RedJewelMsg {
			AccountID = dwAccountID;
            Level = dwLevel;
            Type = strType;
            IsActive = dwIsActive;
            Growth = dwGrowth;
        };
    end
end

function _G.OnWebTransCBFunc(dwType, args)
	if dwType == 1 then--��Ȩ
		rewardCBFunc(args.accid, args.level, args.nResCode);
	elseif dwType == 2 then--����
		--RedjewelCBFunc(args.nResCode, args.accid, args.errno, args.errstr, args.level, args.strtype, args.bact, args.growth);
	end;
end;
---------- [[ 360���� ]] ----------
