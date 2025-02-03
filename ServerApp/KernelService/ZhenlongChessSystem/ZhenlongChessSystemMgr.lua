--[[
功能：全局珍珑棋局管理器
类型：继承于CSingle类，用来管理珍珑棋局次数定时清除
版本：
	v1.0	2014-5-16 create by lizc
]]


_G.CZhenlongChessMgr = CSingle:new();
CSingleManager:AddSingle(CZhenlongChessMgr);

CZhenlongChessMgr.tStarPlayerInfo = nil;

--create
function CZhenlongChessMgr:Create()	
	--初始化计时器
	CAlarmClock:AddTask({dwTime = _G.ZhenlongChessConfig.resetTime}, CAlarmTaskCycleType.eDay, 1, 0,
		function() self:ResetValue() end, {}
	)
	
	--读取星级排行信息
	self:ReadStarInfoDB();
	return true;
end;

--重置
function CZhenlongChessMgr:ResetValue()
	CPlayerDBQuery:GetDBQuery():execute('UPDATE "T_Role_ZhenlongChess" SET "setBossCount"=$1, "curTotalCount"=$2', "", 0);
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CZhenlongChessSystem", Func = "Reset"};
	end;	
end;

--从数据库读取累计星级最高的玩家信息
function CZhenlongChessMgr:ReadStarInfoDB()
	local dbres = CPlayerDBQuery:GetDBQuery():execute_sync('select * from "T_Dupl_NewZL_Record"');

	--如果没有信息 插入数据库初始信息
	if not dbres then
		self.tStarPlayerInfo = {nRoleId = 0, nStarLevel = 0, sRoleName = "", nIconId = 0, nWave = 1};
		local szSql = [[insert into "T_Dupl_NewZL_Record" values($1,$2,$3,$4,$5);]];
		CPlayerDBQuery:GetDBQuery():execute(szSql, 0, 0, "", 0, 1);
		
		return;
	end
	
	for k,tb in pairs(dbres) do
		-- 找到第一名
		if tb.nWave == 1 then
			self.tStarPlayerInfo = tb;
		end
	end	
end

-- 给gs发送星级信息
function CZhenlongChessMgr:SendStarInfo(nLineId)
	local oLine = CGameLineManager:GetLine(nLineId);
	if oLine then
		oLine.ZhenlongChessStarInfoChgMsg{StarPlayerInfo = self.tStarPlayerInfo};
	end 
end

--更新星级信息并发送给所有gs
function CZhenlongChessMgr:ChgStarInfo(tInfo)
	self.tStarPlayerInfo = tInfo;
	
	-- 存数据库
	local szSql =
		[[ update "T_Dupl_NewZL_Record" set "nRoleId" = $1,"nStarLevel" = $2,
			"sRoleName" = $3,"nIconId" = $4 where "nWave" = $5;
		]]
			
	CPlayerDBQuery:GetDBQuery():execute(szSql,tInfo.nRoleId, tInfo.nStarLevel,
		tInfo.sRoleName, tInfo.nIconId, tInfo.nWave);

	-- 同步给所有gs
	local tLine = CGameLineManager:GetAllLine();
	for _,oLine in pairs(tLine)do
		oLine.ZhenlongChessStarInfoChgMsg
		{
			StarPlayerInfo = self.tStarPlayerInfo;
		};
	end
end
