--[[
功能：公会系统服务器命令处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-10-09
]]
_G.CGuildServerMsg = {};
function CGuildServerMsg:NotifyKernel(szCmd,...)
	local tabInfo = {...}
	CKernelApp.GuildServerMsg{ Cmd = szCmd,Info = tabInfo }
end
----------------------------------------------------------------------------------
--刷新镖车
function CGuildServerMsg:OnEscortBorn(
	dwGuildID,dwGuildName,dwRoleID,dwLevel,dwLineID,tabPlayer
)
	local tabCfg = GuildEscortConfig.Car[dwLevel]
	local tabNode = tabCfg.Line[dwLineID].Node
	local dwMapID = tabNode[1].mapid
	local objMap = CMapManager:GetMap(dwMapID)
	local objMonMgr = objMap:GetMonsterMgr()
	objMonMgr:AddGuildMonster(
		dwGuildID,dwLevel,nil,tabNode,dwRoleID,tabPlayer,nil,dwGuildName
	)
end
----------------------------------------------------------------------------------
--刷新镖车
function CGuildServerMsg:GetEscortReward(dwRoleID,dwContribute)
	for k,user in pairs(CPlayerManager.setAllPlayer) do
		if(user:GetRoleID() == dwRoleID) then
			local objSystem = user:GetSystem('CPlayerEventCenterSystem')
			objSystem:DoEvent(enumPlayerEventType.EventGuildDonate,dwContribute)
			break;
		end
	end
end

-----世家摇奖 清当前摇奖次数
function CGuildServerMsg:ClearCurTimeInfo(Info)
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local guildSystem = user:GetSystem("CGuildSystem");
		if not guildSystem then
			return;
		end;
		guildSystem:ZeroClearCurTime();  ---零点清抽奖次数
	end
end

