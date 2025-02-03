---------- [[ 360奖励 ]] ----------
--Player在KS上的状态
_G.PlayerStateInKS = 
{
	PSK_LIS_CREATE	=	1;--Login通知创建角色，通知GS，没有收到GS返回
	PSK_GS_RETURN	=	2;--收到GS返回
	PSK_GS_GAMING	=	3;--在GS中游戏
	PSK_CHANGE_LINE	=	4;--换线中
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

---------- [[ 360奖励 ]] ----------

---------- [[ 360红钻 ]] ----------
-- 360红钻信息请求消息
define.PlayerGet360RedJewelMsg
{
    -- 帐号ID
    AccountID = 0;
}
when{}
function PlayerGet360RedJewelMsg(AccountID)
    if CPlayerManager:GetPlayer(AccountID) == nil then
        return;
    end
    --_sendWebRequest(2,{accid = AccountID});
end

-- @brief 获取到特权信息回调函数处理
-- @param number accountid 帐号ID(带区服)
-- @param string level 特权等级
-- @param number nResult 结果值
local function rewardCBFunc(accountid, level, nResult)
	local player = CPlayerManager:GetPlayer(accountid);
	if player then
		player.CommercialGiftResultMsg{Level = level, Result = nResult};
	end;
end;


-- @brief 获取到红钻信息回调函数处理
-- @param number dwAccountID 帐号ID(带区服)
-- @param number dwErrorNo 错误编号
-- @param string strErrMsg 错误信息
-- @param number dwLevel 等级
-- @param string strType 类型
-- @param number dwIsActive 是否激活
-- @param number dwGrowth 成长值
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
	if dwType == 1 then--特权
		rewardCBFunc(args.accid, args.level, args.nResCode);
	elseif dwType == 2 then--红钻
		--RedjewelCBFunc(args.nResCode, args.accid, args.errno, args.errstr, args.level, args.strtype, args.bact, args.growth);
	end;
end;
---------- [[ 360红钻 ]] ----------
