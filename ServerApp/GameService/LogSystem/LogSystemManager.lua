_G.CLogSystemManager = CSingle:new();
CSingleManager:AddSingle(CLogSystemManager);
CSingleManager:RegistCSSingle(CLogSystemManager);


local dwGameID = 48;
local TIME = _time(1,{year=1970,month=1,day=1,hour=0,min=0,sec=0}) + (TimeZone or 0);

function CLogSystemManager:Create()
	local szServerIP = CConfig.Network.strLogService;
	local dwMaxMsgSize = CConfig.LogServiceNetwork.dwMaxMessageLengthFromServer%100000;
	_ls:Connect(szServerIP,dwMaxMsgSize);
	return true;
end

function CLogSystemManager:game_buy( player,balance, itemenum, number, money )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,balance)
	table.insert(param,itemenum)
	table.insert(param,number)
	table.insert(param,money)
	table.insert(param,player:GetLevel())
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	_SendLSMessage(LogMsgType._MSG_LOG_GAME_BUY,param)
end

function CLogSystemManager:game_sell( player,balance, itemenum, number, money )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,balance)
	table.insert(param,itemenum)
	table.insert(param,number)
	table.insert(param,money)
	table.insert(param,player:GetLevel())
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	_SendLSMessage(LogMsgType._MSG_LOG_GAME_SELL,param)
end

function CLogSystemManager:shop_buy( player, itemenum, number, money )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,player:GetSystem('CItemSystem'):GetGoldNum())
	table.insert(param,itemenum)
	table.insert(param,number)
	table.insert(param,money)
	table.insert(param,player:GetLevel())
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	_SendLSMessage(LogMsgType._MSG_LOG_SHOP_BUY,param)
end

function CLogSystemManager:giftmoney_buy( player, itemenum, number, money )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,player:GetSystem('CItemSystem'):GetBindGoldNum())
	table.insert(param,itemenum)
	table.insert(param,number)
	table.insert(param,money)
	table.insert(param,player:GetLevel())
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	_SendLSMessage(LogMsgType._MSG_LOG_GIFTMONEYBUY,param)
end

function CLogSystemManager:item_use( player, itemenum, number, remain, dwType,mode,reason )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,itemenum)
	table.insert(param,number)
	table.insert(param,remain)
	table.insert(param,dwType)
	table.insert(param,player:GetLevel())
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	table.insert(param,mode)
	table.insert(param,reason)
	_SendLSMessage(LogMsgType._MSG_LOG_ITEM_USE,param)
end

function CLogSystemManager:deal( player, dwType, mymoney, mygold, mygood, myhorse, 
	other_player, hismoney, hisgold, hisgood, hishorse, hisroleid )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,dwType)
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	table.insert(param,player:GetLevel())
	table.insert(param,mymoney)
	table.insert(param,mygold)
	local t = ''
	for k,v in pairs (mygood) do
		t = t..'id:'..v:GetInstID()..',goodid:'..v:GetEnumID()..',num:'..v:GetCount()..','
	end
	table.insert(param,t)
	table.insert(param,myhorse)
	table.insert(param,CConfig.Network.dwServerHostID)--sell_sid--获取游戏服务器ID
	if other_player then
		table.insert(param,tostring(other_player:GetRoleID()))
		local _, dwOAID = self:GetMergeInfo(other_player:GetAccountID());
		table.insert(param,tostring(dwOAID))
		table.insert(param,other_player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
		table.insert(param,other_player:GetLevel())
	else
		table.insert(param,tostring(hisroleid))
		table.insert(param,tostring(0))
		table.insert(param,0)
		table.insert(param,0)
	end
	table.insert(param,hismoney)
	table.insert(param,hisgold)
	for k,v in pairs (hisgood) do
		t = t..'id:'..v:GetInstID()..',goodid:'..v:GetEnumID()..',num:'..v:GetCount()..','
	end
	table.insert(param,t)
	table.insert(param,hishorse)
	_SendLSMessage(LogMsgType._MSG_LOG_DEAL,param)
end

function CLogSystemManager:yb_income( player,balance, number, reason )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,number)
	table.insert(param,balance)
	table.insert(param,player:GetLevel())
	table.insert(param,reason)
	_SendLSMessage(LogMsgType._MSG_LOG_YB_INCOME,param)
end

function CLogSystemManager:giftmoney_income( player,balance, number, reason )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,number)
	table.insert(param,balance)
	table.insert(param,player:GetLevel())
	table.insert(param,reason)
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	_SendLSMessage(LogMsgType._MSG_LOG_GIFTMONEYINCOME,param)
end

-- @brief 礼金花费
-- @param object objPlayer 角色对象
-- @param number dwBalance 余额
-- @param number dwNumber 花费数量
-- @param number dwReason 原因
function CLogSystemManager:giftmoney_expend(objPlayer,
        dwBalance,
        dwNumber,
        dwReason)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(dwBalance));
    table.insert(setParam, tostring(dwNumber));
    table.insert(setParam, tonumber(dwReason));
    _SendLSMessage(LogMsgType._MSG_LOG_GIFTMONEYEXPEND, setParam);
end

function CLogSystemManager:item_income( player, itemenum, amount, reason ,mode,remain)
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,itemenum)
	table.insert(param,amount)
	table.insert(param,player:GetLevel())
	table.insert(param,reason)
	table.insert(param,mode)
	table.insert(param,remain)
	_SendLSMessage(LogMsgType._MSG_LOG_ITEM_INCOME,param)
end

-- @brief 登陆日志
-- @param object objPlayer 角色对象
function CLogSystemManager:login(objPlayer)
    if objPlayer == nil then
        return;
    end

    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(objPlayer:GetLevel()));
    table.insert(setParam, tostring(objPlayer:GetIP()));
    table.insert(setParam, tonumber(objPlayer:
        GetSystem("CMapSystem"):GetCurMapForLog().MapID));
    table.insert(setParam, tonumber(0));
	_SendLSMessage(LogMsgType._MSG_LOG_LOGIN, setParam);
end

function CLogSystemManager:logout( player )
	if not player then return; end
	if CConfig.bIsCrossSvr then return end;
	
	local param = self:GetBaseParam(player);
	table.insert(param,player:GetLevel())
	table.insert(param,player:GetIP())
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	table.insert(param,player:GetSystem("CGuildSystem"):GetGuildName() or "")--帮派
	table.insert(param,(math.floor(_now()) - math.floor(player:GetInfo().tmUplineTime))/1000)--新增在线时间 2013-04-17
	table.insert(param,player:GetInfo().szUF)
	_SendLSMessage(LogMsgType._MSG_LOG_LOGOUT,param)
end

function CLogSystemManager:death( player, dwType )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,dwType);
	table.insert(param,player:GetLevel());
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID);
	_SendLSMessage(LogMsgType._MSG_LOG_DEATH,param)
end

function CLogSystemManager:accept_task( player, dwTaskID ,szTaskType)
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,dwTaskID);
	table.insert(param,szTaskType);
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID);
	_SendLSMessage(LogMsgType._MSG_LOG_ACCEPT_TASK,param)
end

function CLogSystemManager:task( player, taskid, result )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,taskid);
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID);
	table.insert(param,result);
	_SendLSMessage(LogMsgType._MSG_LOG_TASK,param)
end

function CLogSystemManager:upgrade( player )
	if not player then return; end
	local param = self:GetBaseParam(player);
    table.insert(param,player:GetInfo().szRoleName);
	table.insert(param,player:GetLevel())
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID)
	_SendLSMessage(LogMsgType._MSG_LOG_UPGRADE,param)
end

function CLogSystemManager:gold(player, number, type, amount)
	if player == nil then 
        return; 
    end
	local param = self:GetBaseParam(player);
	table.insert(param,number);
	table.insert(param,type);
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID);
    table.insert(param,amount);
	_SendLSMessage(LogMsgType._MSG_LOG_GOLD,param);
end

function CLogSystemManager:map( player, frommap, tomap )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,player:GetLevel());
	table.insert(param,frommap);
	table.insert(param,tomap);
	_SendLSMessage(LogMsgType._MSG_LOG_MAP,param)
end

function CLogSystemManager:longer( player, dwType, timelong )
	if not player then return; end
	if timelong < 10000 then--挂机时间少于10秒的，不记录在内
		return;
	end
	local param = self:GetBaseParam(player);
	table.insert(param,dwType);
	table.insert(param,GetCurTime(1) - TIME);
	table.insert(param,math.modf(timelong/1000));
	table.insert(param,player:GetLevel());
	table.insert(param,player:GetSystem("CMapSystem"):GetCurMapForLog().MapID);
	_SendLSMessage(LogMsgType._MSG_LOG_LONGER,param)
end

function CLogSystemManager:transcript( player, starttime, timelong, playernum, duplid )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,starttime - TIME);
	table.insert(param,timelong);
	table.insert(param,playernum);
	table.insert(param,player:GetLevel());
	table.insert(param,duplid);
	_SendLSMessage(LogMsgType._MSG_LOG_TRANSCRIPT,param)
end

function CLogSystemManager:yb_expend( player,balance, number, dwType )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,tostring(number));
	table.insert(param,tostring(balance));
	table.insert(param,tostring(player:GetLevel()));
	table.insert(param,tostring(dwType));
	_SendLSMessage(LogMsgType._MSG_LOG_YB_EXPEND,param)
end

--24记录道具的所有行为
function CLogSystemManager:item_log( player, itemid, opid, amount )
	if not player then return; end
	local param = self:GetBaseParam(player);
	table.insert(param,itemid);
	table.insert(param,opid);
	table.insert(param,amount);
	_SendLSMessage(LogMsgType._MSG_LOG_ITEMLOG,param)
end

-- @brief 赐福日志
-- @param object objPlayer 角色对象
-- @param number dwType 记录类型
-- @param number dwGoal 操作目标
-- @param number dwResult 操作结果
-- @param number dwBegin 使用前数值
-- @param number dwEnd 使用后数值
function CLogSystemManager:cifu(objPlayer,
        dwType,
        dwGoal,
        dwResult,
        dwBegin,
        dwEnd)
	if not objPlayer then return; end
	local param = self:GetBaseParam(objPlayer);
	table.insert(param,tonumber(dwType));
	table.insert(param,tonumber(dwGoal));
	table.insert(param,tonumber(dwResult));
	table.insert(param,tonumber(dwBegin));
	table.insert(param,tonumber(dwEnd));
	_SendLSMessage(LogMsgType._MSG_LOG_CIFU,param)
end

-- @brief 邮件日志
-- @param number dwAccountID 账号ID
-- @param number dwRoleID 角色ID
-- @param number dwSender 发送者
-- @param string strTitle 主题
-- @param string strContent 内容
-- @param string strAccessory 附件
-- @param number dwState 邮件状态
--      1-送达
--      2-已读
--      3-已取
--      4-已删
function CLogSystemManager:mail(dwAccountID,
        dwRoleID,
        dwSender,
        strTitle,
        strContent,
        strAccessory,
        dwState)
    local setParam = self:GetBaseParamNoPlayer(dwAccountID, dwRoleID);
    table.insert(setParam, tonumber(dwSender));
    table.insert(setParam, tostring(strTitle));
    table.insert(setParam, tostring(strContent));
    table.insert(setParam, tostring(strAccessory));
    table.insert(setParam, tonumber(dwState));
    _SendLSMessage(LogMsgType._MSG_LOG_MAIL, setParam);
end

-- @brief 技能日志
-- @param object objPlayer 角色对象
-- @param number 技能ID
-- @param number dwSkillLevel 技能等级
function CLogSystemManager:skill(objPlayer, dwSkillID, dwSkillLevel)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(objPlayer:GetLevel()));
    table.insert(setParam, tonumber(dwSkillID));
    table.insert(setParam, tonumber(dwSkillLevel));
    _SendLSMessage(LogMsgType._MSG_LOG_SKILL, setParam);
end

-- @brief 经脉日志
-- @param object objPlayer 角色对象	
-- @param number dwPulseID 经脉ID
-- @param number dwPulseLevel 经脉等级
function CLogSystemManager:pulse(objPlayer, dwPulseID, dwPulseLevel)
    if objPlayer == nil then
        return; 
	end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(objPlayer:GetLevel()));
    table.insert(setParam, tonumber(dwPulseID));
    table.insert(setParam, tonumber(dwPulseLevel));
    _SendLSMessage(LogMsgType._MSG_LOG_PULSE, setParam);
end

-- @brief 真气日志
-- @param object objPlayer 角色对象
-- @param table setData 数据
-- {
    -- 真气类型 = {当前值, 改变值} 
    -- 1 - 5
    -- [1] = {dwCurrent = 0, dwChange = 0};
-- }
-- @param dwType 记录类型
function CLogSystemManager:zhenqi(objPlayer, setData, dwType)
    if objPlayer == nil or setData == nil or dwType == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    for i = 1, 5 do
        local dwCurrent = 0;
        local dwChange = 0;
        if setData[i] then
            dwCurrent = setData[i].dwCurrent;
            dwChange = setData[i].dwChange;
        end
        table.insert(setParam, tonumber(dwCurrent));
        table.insert(setParam, tonumber(dwChange));
    end
    table.insert(setParam, tonumber(dwType));
	_SendLSMessage(LogMsgType._MSG_LOG_ZHENQI, setParam);
end

-- @brief 聊天日志
-- @param object objSPlayer 来源角色对象
-- @param object dwDRoleID 目标角色对象ID
-- @param object strDRoleName 目标角色对象名称
-- @param string strContent 内容
-- @param number dwType 频道
function CLogSystemManager:chat(objSPlayer, dwDRoleID, strDRoleName, strContent , dwType)
    if objSPlayer == nil then
        return;
    end
    local setParam = {};
    table.insert(setParam,tonumber(dwGameID));
    table.insert(setParam,tonumber(CConfig.Network.dwServerHostID));
	local dwOSID, dwOAID = self:GetMergeInfo(objSPlayer:GetAccountID());
    table.insert(setParam,tostring(dwOAID));
    table.insert(setParam,tostring(objSPlayer:GetInfo().szRoleName));
    table.insert(setParam,tonumber(dwType));
	table.insert(setParam,tostring(dwDRoleID));
	table.insert(setParam,tostring(strDRoleName));
    table.insert(setParam,tostring(strContent));
    table.insert(setParam,tonumber(os.utc(1) - TIME));
    table.insert(setParam,tostring(objSPlayer:GetIP()));
    _SendLSMessage(LogMsgType._MSG_LOG_CHAT, setParam);
end

-- @brief 装备修炼日志
-- @param object objPlayer 玩家对象
-- @param number dwSlotPos 修炼槽位置
-- @param number dwLevel 修改等级
-- @param number dwExp 修改获取的经验
-- @param number dwWaste 消耗材料
-- @param number dwType 消耗材料类型(1 - 元宝 2 - 真气)
function CLogSystemManager:equip_build(objPlayer,
        dwSlotPos,
        dwLevel,
        dwExp,
        dwWaste,
        dwType)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(dwSlotPos));
    table.insert(setParam, tonumber(dwLevel));
    table.insert(setParam, tostring(dwExp));
    table.insert(setParam, tonumber(dwWaste));
    table.insert(setParam, tonumber(dwType));
    _SendLSMessage(LogMsgType._MSG_LOG_EQUIP_BUILD, setParam);
end

-- @brief 宝石使用日志
-- @param object objPlayer 角色对象
-- @param number dwItemID 消耗物品ID
-- @param number dwPos 装备位
-- @param number dwLevel 等级
-- @param number dwUseType 使用类型(1 - 铸造 2 - 精魄)
function CLogSystemManager:stone_use(objPlayer,
        dwItemID,
        dwPos,
        dwLevel,
        dwUseType)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(dwItemID));
    table.insert(setParam, tonumber(dwPos));
    table.insert(setParam, tonumber(dwLevel));
    table.insert(setParam, tonumber(dwUseType));
    _SendLSMessage(LogMsgType._MSG_LOG_STONE_USE, setParam);
end

-- @brief 战魂日志
-- @param object objPlayer 角色对象
-- @param number dwType 获得/消耗途径
-- @param number dwID 战魂标识符
-- @param number dwInstID 战魂实例标识符
-- @param number dwExp 经验
-- @param number dwMoney 金钱
-- @param number dwChipNum 当前碎片数量
function CLogSystemManager:soul(objPlayer,
        dwType,
        dwID,
        dwInstID,
        dwExp,
        dwMoney,
        dwChipNum)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(dwType));
    table.insert(setParam, tostring(dwID));
    table.insert(setParam, tostring(dwInstID));
    table.insert(setParam, tostring(dwExp));
    table.insert(setParam, tostring(dwMoney));
    table.insert(setParam, tonumber(dwChipNum));
    _SendLSMessage(LogMsgType._MSG_LOG_SOUL, setParam);
end

-- @brief 威望任务日志
-- @param object objPlayer 角色对象
-- @param number dwID 任务标识符
function CLogSystemManager:weiwang(objPlayer, dwID)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(dwID));
    _SendLSMessage(LogMsgType._MSG_LOG_WEIWANG, setParam);
end

-- @brief 血魔功日志
-- @param object objPlayer 角色对象
-- @param number dwType 操作类型
-- @param number dwChangeNum 改变精血数量
-- @param number dwCurrentNum 当前精血数量
-- @param number dwRoleID 目标角色标识符
function CLogSystemManager:megakill(objPlayer,
        dwType,
        dwChangeNum,
        dwCurrentNum,
        dwRoleID)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(dwType));
    table.insert(setParam, tostring(dwChangeNum));
    table.insert(setParam, tostring(dwCurrentNum));
    table.insert(setParam, tostring(dwRoleID));
    _SendLSMessage(LogMsgType._MSG_LOG_MEGAKILL, setParam);
end

-- @brief 伴侣日志
-- @param number dwBridegroomID 新郎角色标识符
-- @param number dwBrideID 新娘角色标识符
-- @param number dwTokenID 信物标识符
-- @param number dwIntimateDegree 亲密度
-- @param number bWedding 是否举办婚礼
-- @param number dwWeddingType 婚礼类型
-- @param number dwAcquireMoney 获得的礼金
-- @param numbert bDivorce 是否离婚
-- @param number dwApplyRoleID 离婚申请人角色标识符
function CLogSystemManager:marriage(dwBridegroomID,
        dwBrideID,
        dwTokenID,
        dwIntimateDegree,
        bWedding,
        dwWeddingType,
        dwAcquireMoney,
        bDivorce,
        dwApplyRoleID)
    local setParam = self:GetBaseParamNoPlayer(0, 0);
    table.insert(setParam, tostring(dwBridegroomID));
    table.insert(setParam, tostring(dwBrideID));
    table.insert(setParam, tostring(dwTokenID));
    table.insert(setParam, tostring(dwIntimateDegree));
    table.insert(setParam, tonumber(bWedding));
    table.insert(setParam, tonumber(dwWeddingType));
    table.insert(setParam, tostring(dwAcquireMoney));
    table.insert(setParam, tonumber(bDivorce));
    table.insert(setParam, tostring(dwApplyRoleID));
    _SendLSMessage(LogMsgType._MSG_LOG_MARRIAGE, setParam);
end

-- @brief 签到日志
-- @param object objPlayer 角色对象
function CLogSystemManager:sign(objPlayer)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    _SendLSMessage(LogMsgType._MSG_LOG_SIGN, setParam);
end

-- @brief 战场日志
-- @param number dwType 类型
-- @param table setResult 结果
function CLogSystemManager:war(dwType, setResult)
    local setParam = self:GetBaseParamNoPlayer(0, 0);
    table.insert(setParam, tonumber(dwType));
    table.insert(setParam, tostring(json.encode(setResult)));
    _SendLSMessage(LogMsgType._MSG_LOG_WAR, setParam);
end

-- @brief 战斗力日志
-- @param object objPlayer 角色对象
-- @param table setBattle 战斗力信息(分项)
function CLogSystemManager:battle(objPlayer, setBattle)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(json.encode({
        [1] = setBattle.dwLevelScore;
        [2] = setBattle.dwPulseScore;
        [3] = setBattle.dwBournScore;
        [4] = setBattle.dwSkillScore;
        [5] = setBattle.dwMountScore;
        [6] = setBattle.dwEquipScore;
        [7] = setBattle.dwSwordScore;
        [8] = setBattle.dwAmuletScore;
        [9] = setBattle.dwGuildScore;
        [10] = setBattle.dwStoneScore;
        [11] = setBattle.dwCollectScore;
    })));
    _SendLSMessage(LogMsgType._MSG_LOG_BATTLE, setParam);
end

-- @brief 好友日志
-- @param object objPlayer 角色对象
-- @param number dwFriendRoleID 好友角色标识符
-- @param number dwType 操作类型
function CLogSystemManager:friend(objPlayer, dwFriendRoleID, dwType)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(dwFriendRoleID));
	table.insert(setParam, tonumber(dwType));
    _SendLSMessage(LogMsgType._MSG_LOG_FRIEND, setParam);
end

-- @brief 副本日志
-- @param object objPlayer 角色对象
-- @param number dwGroupID 分组标识符
-- @param number dwType 副本类型
-- @param number dwResult 结果
function CLogSystemManager:dupl(objPlayer, dwGroupID, dwType, dwResult)
    if objPlayer == nil then
        return;
    end
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(dwGroupID));
    table.insert(setParam, tonumber(dwType));
    table.insert(setParam, tonumber(dwResult));
    _SendLSMessage(LogMsgType._MSG_LOG_DUPL, setParam);
end

-- @brief 世家日志
-- @param number dwRoleID 角色标识符
-- @param number dwGuildID 世家标识符
-- @param string strGuildName 世家名称
-- @param number dwType 操作类型
-- @param table setData 操作数据
function CLogSystemManager:guild(dwRoleID,
        dwGuildID,
        strGuildName,
        dwType,
        setData)
    local setParam = {};
    table.insert(setParam, tonumber(dwGameID));
    table.insert(setParam, tonumber(CConfig.Network.dwServerHostID));
    table.insert(setParam, tonumber(CConfig.Network.szDeptID));
    table.insert(setParam, tostring(dwRoleID));
    table.insert(setParam, tostring(os.utc(1) - TIME));
    table.insert(setParam, tostring(dwGuildID));
    table.insert(setParam, tostring(strGuildName));
    table.insert(setParam, tonumber(dwType));
    table.insert(setParam, tostring(json.encode(setData)));
    _SendLSMessage(LogMsgType._MSG_LOG_GUILD, setParam);
end

-- @brief 北斗星阵日志
-- @param object objPlayer 角色对象
-- @param number dwID 星脉标识符
-- @param number dwLevel 等级
-- @param number dwExp 经验
-- @param number dwType 操作类型
function CLogSystemManager:matrix_method(objPlayer, 
        dwID,
        dwLevel,
        dwExp,
        dwType)
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tonumber(dwID));
    table.insert(setParam, tonumber(dwLevel));
    table.insert(setParam, tostring(dwExp));
    table.insert(setParam, tonumber(dwType));
    _SendLSMessage(LogMsgType._MSG_LOG_MATRIX_METHOD, setParam);
end

-- @brief 棋魂日志
-- @param object objPlayer 角色对象
-- @param table setConsume 消耗
-- @param table setGain 获得
function CLogSystemManager:qihun(objPlayer, setConsume, setGain)
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(json.encode(setConsume)));
    table.insert(setParam, tostring(json.encode(setGain)));
    _SendLSMessage(LogMsgType._MSG_LOG_QIHUN, setParam);
end

-- @brief 角色信息日志
-- @param object objPlayer 角色对象
function CLogSystemManager:info(objPlayer)
    if objPlayer == nil then
        return;
    end

    local setInfo = {
        [1] = objPlayer:GetLevel();
        [2] = objPlayer:GetSystem("CMountSystem"):GetMaxMountGrade();
        [3] = objPlayer:GetSystem("CSwordSystem"):GetSwordLadder();
        [4] = objPlayer:GetSystem("CAmuletSystem"):GetLevel();
        [5] = objPlayer:GetSystem("CBournSystem"):GetBournLv();
        [6] = objPlayer:GetSystem("CPracticeSystem"):GetPracticeLevel();
        [7] = objPlayer:GetSystem("CMegaKillSystem"):GetLevelVal();
        [8] = objPlayer:GetSystem("CKungFuSystem"):GetKungfuLevel(1);
        [9] = {
            [1] = objPlayer:GetSystem("CTieBuShanSystem"):GetClothLevel();
            [2] = objPlayer:GetSystem("CTieBuShanSystem"):GetSuitLevel();
        };
        [10] = objPlayer:GetSystem("CMatrixMethodSystem"):
            GetAllStarAveragegLevel();
    };

    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(json.encode(setInfo)));
	_SendLSMessage(LogMsgType._MSG_LOG_INFO, setParam);
end

-- @brief BOSS击杀日志
-- @param object objPlayer 角色对象
-- @param number dwBossID BOSS编号
function CLogSystemManager:boss_kill(objPlayer, dwBossID)
    local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(dwBossID));
    _SendLSMessage(LogMsgType._MSG_LOG_BOSS_KILL, setParam);
end

--换线日志
function CLogSystemManager:change_line(objPlayer,dwType,dwGold)
	 local setParam = self:GetBaseParam(objPlayer);
    table.insert(setParam, tostring(dwType));
	table.insert(setParam, tostring(dwGold));
	_SendLSMessage(LogMsgType._MSG_LOG_CHANGE_LINE, setParam);
end



function CLogSystemManager:GetBaseParam(player)
	local param = {}
	if not player then return; end
	local dwAccountID = tonumber(player:GetAccountID());
	param[1] = dwGameID; --gameid
	param[2] = CConfig.Network.dwServerHostID; --serverid
	local dwOSID, dwOAID = self:GetMergeInfo(dwAccountID);
	param[3] = dwOSID;
	param[4] = tostring(dwOAID);
	param[5] = CConfig.Network.szDeptID; --deptid
	param[6] = tostring(player:GetRoleID()); --roleid
	param[7] = ''; --md5
	param[8] = tostring(os.utc(1) - TIME); --time
	return param;
end

function CLogSystemManager:GetMergeInfo(dwAccountID)
	if CConfig.Network.bIsNotMerge then
		return 0, dwAccountID;
	else
		return dwAccountID % 10000, math.floor(tonumber(dwAccountID) / 10000);
	end
end

function CLogSystemManager:GetBaseParamNoPlayer(dwAccountID, dwRoleID)
	local param = {}
	param[1] = dwGameID; --gameid
	param[2] = CConfig.Network.dwServerHostID; --serverid
    local dwOSID = 0;
    local dwOAID = 0;
    if dwAccountID ~= 0 then
        dwOSID, dwOAID = self:GetMergeInfo(dwAccountID);
    end
	param[3] = dwOSID;
	param[4] = tostring(dwOAID);
	param[5] = CConfig.Network.szDeptID; --deptid
	param[6] = tostring(dwRoleID); --roleid
	param[7] = ''; --md5
	param[8] = tostring(os.utc(1) - TIME); --time
	return param;
end

function CLogSystemManager:SendToKS(ParamInfo)
	CKernelApp.KSBackStageDataMsg{ParamInfo = ParamInfo}
end

function CLogSystemManager:GetData(Param)
	local op = Param.op
	if self[op] then
		self[op](self,Param)
	end
end

function CLogSystemManager:chat_ban(Param)
	local ParamInfo = {};
	ParamInfo.http_id = Param.http_id;
	ParamInfo.result = 0;
	local objPlayer = nil
	if Param.role_name and Param.role_name ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleName(tostring(Param.role_name))
	end
	if Param.role_id and Param.role_id ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(Param.role_id))
	end
	if objPlayer then
		local sysChat = objPlayer:GetSystem("CChatSystem")
		local dwBanStart = (tonumber(Param.start) or GetCurTime())/1000
		local dwBanTime = (tonumber(Param.last) or 0)/1000
		sysChat:BanSpeak( math.floor(dwBanStart), math.floor(dwBanTime) )
		ParamInfo.result = 1;
	end
	self:SendToKS(ParamInfo);
end

function CLogSystemManager:map_jump(Param)
	local ParamInfo = {};
	ParamInfo.http_id = Param.http_id;
	ParamInfo.result = 0;
	local objPlayer = nil
	if Param.role_name and Param.role_name ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleName(tostring(Param.role_name))
	end
	if Param.role_id and Param.role_id ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(Param.role_id))
	end
	if objPlayer then
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		local dwMap = tonumber(Param.map) or 1002
		local dwX = tonumber(Param.x) or 0
		local dwY = tonumber(Param.y) or 0
		sysScript:ChangeMapPos(dwMap,dwX,dwY,0)
		ParamInfo.result = 1;
	end
	self:SendToKS(ParamInfo);
end

function CLogSystemManager:add_exp(Param)
	local ParamInfo = {};
	ParamInfo.http_id = Param.http_id;
	ParamInfo.result = 0;
	local objPlayer = nil
	if Param.role_name and Param.role_name ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleName(tostring(Param.role_name))
	end
	if Param.role_id and Param.role_id ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(Param.role_id))
	end
	if objPlayer then
		local dwExp = tonumber(Param.exp) or 0
		objPlayer:AddExp(dwExp)
		ParamInfo.result = 1;
	end
	self:SendToKS(ParamInfo);
end

function CLogSystemManager:del_item(Param)
	local ParamInfo = {};
	ParamInfo.http_id = Param.http_id;
	ParamInfo.result = 0;
	local objPlayer = nil
	if Param.role_name and Param.role_name ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleName(tostring(Param.role_name))
	end
	if Param.role_id and Param.role_id ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(Param.role_id))
	end
	if objPlayer then
		local sysItem = objPlayer:GetSystem("CItemSystem")
		local dwInstID = tonumber(Param.inst_id)
		local res = sysItem:DelObjItem(dwInstID, _G.ItemSysOperType.GM);
		if res then
			ParamInfo.result = 1;
		end
	end
	self:SendToKS(ParamInfo);
end

function CLogSystemManager:get_pos(Param)
	local ParamInfo = {};
	ParamInfo.http_id = Param.http_id;
	ParamInfo.result = 0;
	local objPlayer = nil
	if Param.role_name and Param.role_name ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleName(tostring(Param.role_name))
	end
	if Param.role_id and Param.role_id ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(Param.role_id))
	end
	if objPlayer then
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		local dwMapId,fPosX,fPosY = sysScript:GetMapPos()
		ParamInfo.result = 1;
		ParamInfo.info = {
			dwMapId = dwMapId,
			fPosX = fPosX,
			fPosY = fPosY
		}
	end
	self:SendToKS(ParamInfo);
end

function CLogSystemManager:map_role(Param)
	local dwLineID = tonumber(Param.line_id);
	local dwMapID = tonumber(Param.map_id);
	
	local ParamInfo = Param;
	ParamInfo.role_id = {};
	
	ParamInfo.op = ParamInfo._op;
	ParamInfo._op = nil;
	ParamInfo.line_id = nil;
	ParamInfo.map_id = nil;
	
	if dwMapID ~= 0 then
		local objMap = CMapManager:GetMap(dwMapID);
		if objMap then
			for id,objPlayer in pairs(objMap.setAllPlayer)do
				table.insert(ParamInfo.role_id,id);
			end
		end;
	else
		for id,objPlayer in pairs(CMapManager.setAllPlayer)do
			table.insert(ParamInfo.role_id,id);
		end
	end
	
	self:SendToKS(ParamInfo);
end;

function CLogSystemManager:get_prop(Param)
	local ParamInfo = Param;
	ParamInfo.info = {
			dwAtk = 0,		--攻击
			dwDef = 0,		--防御
			dwCri = 0,		--暴击
			dwFle = 0,		--身法
			dwASD = 0,		--攻击速度
			dwSpd = 0,		--移动速度
		};
	
	local objPlayer = nil
	if Param.role_name and Param.role_name ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleName(tostring(Param.role_name))
	end
	if Param.role_id and Param.role_id ~= "" then
		objPlayer = CPlayerManager:GetPlayerByRoleID(tonumber(Param.role_id))
	end
	if objPlayer then
		local sklSystem = objPlayer:GetSystem("CSkillSystem")
		local tbInfo = sklSystem:GetInfo();
		
		ParamInfo.info.dwAtk = tbInfo.dwAttack;
		ParamInfo.info.dwDef = tbInfo.dwDefense;
		ParamInfo.info.dwCri = tbInfo.dwCrit;
		ParamInfo.info.dwFle = tbInfo.dwFlee;
		ParamInfo.info.dwASD = tbInfo.dwAttackSpeed;
		ParamInfo.info.dwSpd = tbInfo.dwMoveSpeed;  
	end
	
	self:SendToKS(ParamInfo);
end;
