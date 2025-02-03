--[[
	[ \brief 圣火令系统接口
	[ \author 李中昌
	[ \date 2014-5-26
	[ 处理圣火令系统接口 
	]]

--[[
	[ \brief 格式化字符串
	[ 把存储卡片状态的表格式化为字符串。
	[ \param table tState 存储卡片状态的表
	[ \return string 返回格式化字符串
	]]
local function FormatStateStr(tState)
	local sFormat = "";
	for k , v in pairs(tState) do
		sFormat = sFormat..k.."=";
		for _, nState in pairs(v) do 
			sFormat = sFormat..nState..","
		end
		sFormat = sFormat..";"
	end
	
	return sFormat;
end	
		
--[[
	[ \brief 强化函数
	[ 执行强化逻辑,消耗银两道具，提升卡片等级，增加人物属性
	[ \param number nGroupIndex 卡片组索引
	[ \param number nSlotIndex 卡片槽位索引
	]]
function CShengHuoLingSystem:Strength(nGroupIndex, nSlotIndex)
	if not self:StrengthCheck(nGroupIndex, nSlotIndex) then
		return;
	end
	
	local nPreLevel = ShengHuoLingConfig.GetSuitLevel(self.tState, nGroupIndex);
	self.tState[nGroupIndex][nSlotIndex] =
		self.tState[nGroupIndex][nSlotIndex] + 1;
	local nCurLevel = ShengHuoLingConfig.GetSuitLevel(self.tState, nGroupIndex);
	
	-- 同步消息
	local oPlayer = self:GetPlayer();
	
	oPlayer.ShengHuoLingStateChgMsg{GroupIndex = nGroupIndex,
		SlotIndex = nSlotIndex, Level = self.tState[nGroupIndex][nSlotIndex]};
	
	-- 刷新属性
	self:ChangeAttr();
	
	-- 套装广播检查
	if nCurLevel > nPreLevel then
		for k, v in pairs(ShengHuoLingConfig.BoardcastLevel) do
			if v == nCurLevel then
				CGameApp.ShengHuoLingSuitBoardcastMsg
				{
					RoleId = oPlayer:GetRoleID(),
					RoleName = oPlayer:GetInfo().szRoleName,
					GroupIndex = nGroupIndex,
					Level = nCurLevel
				};
				break
			end
		end
	end
	
	-- 更新数据库
	local tDBInfo = {};
	tDBInfo.szSetState = FormatStateStr(self.tState);
	self.oDBQuery:UpdateStateInfo(tDBInfo);
end


--[[
[ \brief 查看消息的处理函数
[ \param number nRoleID 被查看的玩家ID
]]
function CShengHuoLingSystem:ViewOtherProcess(nRoleID)
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("Cannot get player by CShengHuoLingSystem:ViewOtherMountList");
		return;
	end
	local cbk = function(_, result, _)
		if result == -1 then
			self:ViewResult(false);
		end
	end
	_G.GSRemoteCall(nRoleID, "CShengHuoLingSystem", "BeViewProcess",
		{oPlayer:GetRoleID()}, cbk);
end

--[[
[ \brief 发送查看结果
[ \param boolean bIsOk 是否查看成功
[\param table tState 所有槽位的状态
]]
function CShengHuoLingSystem:ViewResult(bIsOk, tState)
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("Cannot get player by CShengHuoLingSystem:ViewResult");
		return;
	end
	oPlayer.ShengHuoLingSys_ViewOtherResultMsg{IsOK = bIsOk, setState = tState};
end

--[[
[ \brief 被查看的处理
[ \param number nFromRoleID 查看人的
]]
function CShengHuoLingSystem:BeViewProcess(nFromRoleID)
	-- 检查自己是否有权限
	if self:HasAuthority('ShengHuoLing') then
		_G.GSRemoteCall(nFromRoleID, "CShengHuoLingSystem", "ViewResult",
			{true, self.tState}, nil);
	else
		_G.GSRemoteCall(nFromRoleID, "CShengHuoLingSystem", "ViewResult",
			{false, {}}, nil);
	end
	
end

--[[
[ \brief 查看失败的处理
[ \param boolean bIsOk 是否查看成功
]]
function CShengHuoLingSystem:ViewFailResult(bIsOk)
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("Cannot get player by CShengHuoLingSystem:ViewFailResult");
		return;
	end
	oPlayer.ShengHuoLingSys_ViewOtherResultMsg{IsOK = bIsOk};
end
