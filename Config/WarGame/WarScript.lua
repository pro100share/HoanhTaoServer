--世家战脚本
local war = WarConfig[10001]; 


--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)
	--判断是否有世家
	local objGuildSys = objPlayer:GetSystem("CGuildSystem");
	if not objGuildSys then
		return false;
	end
	
	local dwGuildID = objGuildSys:GetGuildID();
	if not dwGuildID or dwGuildID == 0 then
		return false;
	end
		--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end	
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()
	--判断是否有世家
	local dwGuildID = CGuildSystem:GetGuildID();
	
	if not dwGuildID or dwGuildID == 0 then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[6001010073]);
		return false;
	end
	return true;
end;

function war:EventGameStart(objWar)
	objWar:SetTrophyInfo();

	--申请计数器
	objWar:CreateNumber("num10001");
	
	objWar:CreateNumber("num100011");
	objWar:CreateNumber("num100012");
	objWar:CreateNumber("num100013");
	objWar:CreateNumber("num100014");
	objWar:CreateNumber("num100015");
	objWar:CreateNumber("num100016");
	objWar:CreateNumber("num100017");
	objWar:CreateNumber("num100018");
	objWar:CreateNumber("num100019");
	--设置战场脚本中Update的间隔时间
	objWar:SetUpdateTimeForWar(WarAddition.LongDing.Gap);
	
	--设置map脚本玩家Update的间隔时间
	objWar:SetUpdateTimeForPlayer(WarAddition.LongDing.Gap);
end;

function war:UpdateForWar(objWar)
	if objWar.isDeling then
		return;
	end
	
	objWar:ChangeNumber("num10001",1)
	local t = WarAddition.LongDing;
	local dwNum = objWar:GetNumber("num10001");

	local Place = WarAddition:upset(WarAddition.Placethree)
	
	if (dwNum == 30) then
		WarAddition:Monster(Place,t[dwNum],nil)
		objWar:BroadcastWarNotice(1,7,6001048000)
		for loop =1,9 do
			CScriptManager:Notice(SysStringConfigInfo[6001048000],6,false,(8000+loop))
		end
	end
	
	if (dwNum == 40) then
		WarAddition:Monster(Place,t[dwNum],nil)
		objWar:BroadcastWarNotice(1,7,6001010325)
		for loop =1,9 do
			CScriptManager:Notice(SysStringConfigInfo[6001010325],6,false,(8000+loop))
		end
	end
	
	--归属判定
	
	for loop = 1,9 do
		local Iem = objWar:GetTrophyTime(loop)
		local M = "num10001"..loop;
		local Num = objWar:GetNumber(M);
		if (Num == 0) then
			if (Iem >= WarAddition.LongDing.Count) then
				for n,k in pairs(_G.WarTrophyConfig) do
					if (k == loop) then
						for v = 8001,8009 do
							local Monster = CScriptManager:GetMon(v,n)
							if (Monster[1]) then
								objWar:ChangeNumber(M,1)
								local sysMonsterBuff = Monster[1]:GetSystem("CMonsterBuffSystem")
								sysMonsterBuff:AddBuff(199000,1,Monster[1])
							end
						end
					end
				end
			end
		end
	end
	

	local tbInfo = {};
	local isNeedSend = nil;
	for id,info in pairs(objWar.setTrophyInfo)do
		if info.dwChgValue ~= 0 then
			tbInfo[id] = info.dwHPValue;
			info.dwChgValue = 0;
			isNeedSend = true;
		end
	end
	if isNeedSend then
		objWar:BroadcastMsg("OnTrophyHPChgMsg",
		{
			ChgInfo = tbInfo;
		});
	end
end;

--玩家进入
function war:EventEnterPlayer(objWar,objPlayer)
	objPlayer:GetSystem("CPKSystem"):SetPKMode(enPKMode.ePK_Group);
end;

--玩家退出
function war:EventExitPlayer(objWar,objPlayer)
	objWar:ClearKillNumCon(objPlayer);
end;

--活动结束
function war:EventGameOver(objWar)
	objWar:SendResultToGuild();
	--CGuildSystem:SetCombatFlag(false);
end;

--击杀玩家
function war:EventKillPlayer(objWar,objKiller,objDeader)
	--击杀奖励
	WarAddition:Continuation(objWar,objKiller,objDeader)
end;

--战场结束的日志
function war:WarLogRecod(objWar)
	local setResult = {};
	
	for id,info in pairs(objWar.setTrophyInfo)do
		setResult[id] = info.dwGuildID;
	end
	
	CLogSystemManager:war(1, setResult);
end;


--------------------------------------
local war = WarConfig[10002];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)
	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 45) then
		return false;
	end

	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end

	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 45) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[9000669008]);
		return false;
	end
	return true;
end;


--------------------------------------
local war = WarConfig[10003];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)
	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 55) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 55) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[9000669009]);
		return false;
	end
	return true;
end;

--------------------------------------
local war = WarConfig[10004];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)

	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 70) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 70) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[9000669013]);
		return false;
	end
	return true;
end;

local war = WarConfig[10005];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)

	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 85) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 85) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[9000669014]);
		return false;
	end
	return true;
end;

--------------------------------------
local war = WarConfig[10006];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)
	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 100) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 100) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[9000669015]);
		return false;
	end
	return true;
end;

--------------------------------------
--------------------------------------
local war = WarConfig[10010];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)
	--判断是否有世家
	local objGuildSys = objPlayer:GetSystem("CGuildSystem");
	if not objGuildSys then
		return false;
	end
	
	local dwGuildID = objGuildSys:GetGuildID();
	if not dwGuildID or dwGuildID == 0 then
		return false;
	end
		--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end	
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()
	--判断是否有世家
	local dwGuildID = CGuildSystem:GetGuildID();
	
	if not dwGuildID or dwGuildID == 0 then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[6001010073]);
		return false;
	end
	return true;
end;

--玩家进入
function war:EventEnterPlayer(objWar,objPlayer)
	objPlayer:GetSystem("CPKSystem"):SetPKMode(enPKMode.ePK_Kill);
end;

--玩家退出
function war:EventExitPlayer(objWar,objPlayer)
	--删除盟主
	_G.Allies_Delete(objPlayer,nil,true)
end;
--击杀玩家
--objKiller 自己 objDeader 死者
function war:EventKillPlayer(objWar,objKiller,objDeader)
	--删除盟主
	local tmLength = objWar:GetSplLength(objDeader:GetRoleID());
	
	if tmLength < LeaderTimeConfig then
		_G.Allies_Delete(objKiller,objDeader);
	end
end
--回调时间控制
function war:EventGameStart(objWar)
	--CGuildSystem:SetCombatFlag(false);
	--申请计数器
	objWar:CreateNumber("num1");
	--设置战场脚本中Update的间隔时间
	objWar:SetUpdateTimeForWar(WarAddition.MengZhu.Gap);
	--设置map脚本玩家Update的间隔时间
	objWar:SetUpdateTimeForPlayer(WarAddition.MengZhu.Gap);
end;

--战场回调函数
function war:UpdateForWar(objWar)
	if objWar.isDeling then
		return;
	end
	
	objWar:ChangeNumber("num1",1)
	
	local t = WarAddition.MengZhu;
	local dwNum = objWar:GetNumber("num1");
	local Place = WarAddition:upset(WarAddition.Place)	
	--事件喊话
	if (dwNum%5 == 0) then
		WarAddition:Yell(objWar,dwNum)
	end
	
	--事件
	if (dwNum == t.MineRefresh or dwNum == t.Refresh) then
		WarAddition:Monster(Place,t[dwNum],8020)
	end
end;

--战场结束的日志
function war:WarLogRecod(objWar)
	local setResult = 0;
	
	for n,v in pairs(objWar.setSplMemberList)do
		setResult = n;
		break;
	end
	
	CLogSystemManager:war(2, setResult);
end;

--------------------------------------
local war = WarConfig[10020];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)

	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 25) then
		return false;
	end
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end	
	return true;
end;

--玩家进入
function war:EventEnterPlayer(objWar,objPlayer)
	objPlayer:GetSystem("CPKSystem"):SetPKMode(enPKMode.ePK_Kill);
	
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys then
		objBuffSys:AddBuff(50500009,1);
	end
end;
--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 25) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[6001048002]);
		return false;
	end
	
	 -- --判断buff
	 -- for _,buffId in pairs(self.BuffForbidList)do
		-- if CBuffSystem:GetBuffClient(buffId) ~= nil then
			-- CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[6001010090]);
			-- --notice
			-- return false;
		-- end
	-- end
	return true;
end;
--回调时间控制
function war:EventGameStart(objWar)
	--CGuildSystem:SetCombatFlag(false);
	--申请计数器
	objWar:CreateNumber("num2");
	--设置战场脚本中Update的间隔时间
	objWar:SetUpdateTimeForWar(WarAddition.XiangYang.Gap);
	--设置map脚本玩家Update的间隔时间
	objWar:SetUpdateTimeForPlayer(WarAddition.XiangYang.Gap);
end;
--objKiller 自己 objDeader 死者
function war:EventKillPlayer(objWar,objKiller,objDeader)
	local t = WarAddition.XiangYang
	
	--被杀减益
	local dwScore = objWar:GetRoleScore(objDeader:GetRoleID())
	local Reduce = math.floor(dwScore/t.Die);
	local Cut = dwScore - Reduce
	objWar:ChangeRoleScore(objDeader,-Cut)

	if (objKiller ~= objDeader) then
		--击杀奖励
		--local dwScoreK = objWar:GetRoleScore(objKiller:GetRoleID())
		objWar:ChangeRoleScore(objKiller,Cut)
	end
end

--战场回调函数
function war:UpdateForWar(objWar)
	if objWar.isDeling then
		return;
	end
	
	objWar:ChangeNumber("num2",1)
	local t = WarAddition.XiangYang;
	local dwNum = objWar:GetNumber("num2");
	local Place = WarAddition:upset(WarAddition.PlaceOne)
		
	if ((dwNum-3)%5 == 0) then
		CScriptManager:Notice(SysStringConfigInfo[6001048000],6,false,8060)
		objWar:BroadcastWarNotice(1,7,6001048000)
		WarAddition:Monster(Place,t[1],8060)
	end
end;
--玩家退出
function war:EventExitPlayer(objWar,objPlayer)
	local t = WarAddition.XiangYang
	local dwScore = objWar:GetRoleScore(objPlayer:GetRoleID())
	local Reduce = math.floor(dwScore/t.Die);
	local Cut = dwScore - Reduce
	objWar:ChangeRoleScore(objPlayer,-Cut)
	
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys:GetBuffObj(50500009) ~= nil then
		objBuffSys:DeleteBuffByID(50500009);
	end
end
--活动结束
function war:EventGameOver(objWar)
	local ranking = objWar.setSortByScore
	--记录已奖励玩家
	local Record = {};
	local RecordTop10 = {};
	
	--名次
	--前十
	for k,dwRoleID in pairs(ranking)do
		-- local objPlayer = CMapManager:GetPlayer(dwRoleID)
		-- if (objPlayer) then
			-- local objWarSystem = objPlayer:GetSystem("CWarSystem");
			-- if (objWarSystem) then
				-- --取前三名
				-- if (k <= 3) then
					-- WarAddition:Reward(objWarSystem,k)
					-- Record[k] = dwRoleID
				-- end
			-- end
		-- end
		
		if k <= 3 then
			Record[dwRoleID] = k;
		end
		if k <= 10 then
			RecordTop10[dwRoleID] = k;
		end;
	end

	local tbPlayerList = objWar.setAllPlayer;
	--所有
	for dwRoleID,_ in pairs(tbPlayerList)do
		local objPlayer = CMapManager:GetPlayer(dwRoleID)
		if (objPlayer) then
			local objWarSystem = objPlayer:GetSystem("CWarSystem");
			if (objWarSystem) then
				local dwRank = Record[dwRoleID] or 4;
				local dwRealRank = RecordTop10[dwRoleID];
				WarAddition:Reward(objWarSystem,dwRank, dwRealRank)
			end
		end
	end
end;

--战场结束的日志
function war:WarLogRecod(objWar)
	local setResult = {};
	
	for n,dwRoleID in pairs(objWar.setSortByScore)do
		if n <= 3 then
			setResult[n] = dwRoleID;
		end
	end
	
	CLogSystemManager:war(3, setResult);
end;


local war = WarConfig[10030];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)

	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 30) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 30) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[13006001304]);
		return false;
	end
	return true;
end;

function war:EventGameStart(objWar)
	--申请计数器
	objWar:CreateNumber("num10030");
	
	objWar:CreateNumber("num1003011");
	
	--设置战场脚本中Update的间隔时间
	objWar:SetUpdateTimeForWar(WarAddition.TianXia.Gap);
	
	--设置map脚本玩家Update的间隔时间
	objWar:SetUpdateTimeForPlayer(WarAddition.TianXia.Gap);
end;

--战场回调
function war:UpdateForWar(objWar)
	objWar:ChangeNumber("num10030",1)
	local dwNum = objWar:GetNumber("num10030");
	
	local objCurMap = CMapManager:GetMap(8025);
	
	local mgrNpc = objCurMap.objNpcMgr
	
	local t = WarAddition.TianXia
	
	--刷新常在NPC
	if (dwNum == 1) then
		WarAddition:NpcInvoking(8025,2)
	end
	--茶点
	if (dwNum == 24 or dwNum == 48 or dwNum == 72) then
		WarAddition:NpcInvoking(8025,1)
		CScriptManager:Notice(SysStringConfigInfo[13006001305],6,false,8025,30)
		--objScriptSys:Notice(13006001300,7);
		objWar:BroadcastWarNotice(1,7,13006001300)
	end
	--每5分钟20秒删除
	if (dwNum == 25 or dwNum == 49 or dwNum == 73) then
		WarAddition:NpcOmit(8025)
	end
	
	local save = objWar:GetNumber("num1003011");
	--刘老师喊话
	if (dwNum == (save+1)) then
		local dwRand = math.random(#t.yell);
		objWar:ChangeNumber("num1003011",t.yell[dwRand][2])
		mgrNpc:Story(t.yell[dwRand][1])
	end
	
	--刷新飞贼
	if (dwNum == 9 or dwNum == 39 or dwNum == 54 or dwNum == 84) then
		objWar:BroadcastWarNotice(1,7,13006001301)
		--objScriptSys:Notice(13006001301,7);
		CScriptManager:Notice(SysStringConfigInfo[13006001301],6,false,8025,30)
		WarAddition:Monster(WarAddition.XiShuoTinXia,WarAddition.TianXia[1],8025)
	end
end
--玩家进入
function war:EventEnterPlayer(objWar,objPlayer)
	objWar:SetRoleTime(objPlayer)
end;
--玩家退出
function war:EventExitPlayer(objWar,objPlayer)
		--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");

	if not objBufSys then
		return false;
	end
	objWar:RoleLeaveWar(objPlayer)
	if objBufSys:GetBuffObj(50600000) ~= nil then

		objBufSys:DeleteBuffByID(50600000);
	end	
end;
--押镖低级
local war = WarConfig[10050];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)

	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 45 or dwLevel > 65) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 45 or dwLevel > 65) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[13001310008]);
		return false;
	end
	return true;
end;

function war:EventGameStart(objWar)
end;

--战场回调
function war:UpdateForWar(objWar)

end

--玩家退出
function war:EventExitPlayer(objWar,objPlayer)

end;

function war:EventGameOver(objWar)
	objWar:SendAllEscortFail()
end

--押镖 高级
local war = WarConfig[10051];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)

	local dwLevel = objPlayer:GetLevel();
	if (dwLevel <= 65) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel <= 65) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[13001310008]);
		return false;
	end
	return true;
end;

function war:EventGameStart(objWar)
end;

--战场回调
function war:UpdateForWar(objWar)

end

--玩家退出
function war:EventExitPlayer(objWar,objPlayer)

end;
function war:EventGameOver(objWar)
	objWar:SendAllEscortFail()
end


--青云蜀道
local war = WarConfig[10040];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)

	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 30) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 30) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[13006001304]);
		return false;
	end
	return true;
end;

function war:EventGameStart(objWar)
	--申请计数器
	objWar:CreateNumber("num10040");
	
	objWar:SetUpdateTimeForWar(WarAddition[10040].Base.space);
	
	--设置map脚本玩家Update的间隔时间
	objWar:SetUpdateTimeForPlayer(WarAddition[10040].Base.space);
end;

--objKiller 自己 objDeader 死者
function war:EventKillPlayer(objWar,objKiller,objDeader)
	WarAddition[10040]:Kill(objWar,objKiller,objDeader)
end

--战场回调函数
function war:UpdateForWar(objWar)
	if objWar.isDeling then
		return;
	end

	objWar:ChangeNumber("num10040",1)
	local dwNum = objWar:GetNumber("num10040");
	
	if (dwNum%5 == 0 and dwNum <= 25) then
	--刷新小怪
		-- _info("===UpdateForWar 10040 Add Normal Monster===",dwNum)
		WarAddition[10040]:Monster("BaoXiang")
		CScriptManager:Notice(SysStringConfigInfo[13009000009],6,false,8030,15)
	end
	
	--刷BOSS
	if (dwNum == 10 or dwNum == 15 or dwNum == 20 or dwNum == 25) then
		-- _info("===UpdateForWar 10040 Add Boss Monster===",dwNum)
		WarAddition[10040]:Monster("Boss",dwNum)
		CScriptManager:Notice(SysStringConfigInfo[13009000011],6,false,8030,15,48,SysStringConfigInfo[71])
	end
end;

--角色退出队伍
function war:KickPlayerOutWar(objWar,objPlayer)
	if objWar.isDeling then
		return;
	end

	local sysMap = objPlayer:GetSystem("CMapSystem")
	
	local mapId, posx, posy, mapCfgId = sysMap:GetPlayerMapPos();
	
	if (mapId == 8030) then
		sysMap:ExecTransforMapXY(8031,10,14,0)
	end
end

--玩家进入
function war:EventEnterPlayer(objWar,objPlayer)
	objPlayer:GetSystem("CPKSystem"):SetPKMode(enPKMode.ePK_Team);
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys then
		objBuffSys:AddBuff(50500009,1);
	end
end;
--玩家退出
function war:EventExitPlayer(objWar,objPlayer)
	local objBuffSys = objPlayer:GetSystem("CBuffSystem");
	if objBuffSys:GetBuffObj(50500009) ~= nil then
		objBuffSys:DeleteBuffByID(50500009);
	end
end;
--活动结束
function war:EventGameOver(objWar)
	for index, info in pairs(objWar:GetTeamScoreList()) do
		local teamId = info[1];
		--积分
		local score = info[2];
		local team = CTeamManager:GetTeamObj(teamId);
		local captainId = team:GetCaptainId();
		local members = team:GetTeamMembers();
		
		local Placing = index;
		
		if Placing >= 4 then
			Placing = 4
		end
		if (captainId) then
			WarAddition[10040]:Reward(captainId,Placing)
		end
		if members then
			for _, roleId in pairs(members) do
				if (roleId) then
					WarAddition[10040]:Reward(roleId,Placing)
				end
			end;
		end;
	end;
end

--战场结束的日志
function war:WarLogRecod(objWar)
	local setResult = {};
	
	for i = 1, 3 do
		local tabTeam = objWar.setTeamScoreSort[i];
		if tabTeam then
			local dwTeamID = tabTeam[1];
			local objTeam = CTeamManager:GetTeamObj(dwTeamID);
			if objTeam then
				local tbRoleList = objTeam:GetTeamMembers();
				
				setResult[i] = tbRoleList;
			end
		end
	end;
	
	CLogSystemManager:war(4, setResult);
end;


--桃花迷阵
local war = WarConfig[10060];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)
	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 50) then
		return false;
	end
	
	--判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	--携带该BUFF不允许进入战场
	if objBufSys:GetBuffObj(9563) ~= nil then
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		sysScript:Notice(13009100006);
		return false
	end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 50) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[13009100014]);
		return false;
	end	
	return true;
end;

function war:EventGameStart(objWar)
	--申请计数器
	objWar:CreateNumber("num10060");

	--设置战场脚本中Update的间隔时间
	objWar:SetUpdateTimeForWar(1000*5);
	--随机位置
	WarAddition[10060]:Count(objWar)
end;

--战场回调
function war:UpdateForWar(objWar)
	if objWar.isDeling then
		return;
	end
	-- objWar:ChangeNumber("num10060",1)
	-- local dwNum = objWar:GetNumber("num10060");
		
	-- if (dwNum == 1) then
		-- WarAddition[10060]:Count(objWar)
	-- end
end
--玩家进入
function war:EventEnterPlayer(objWar,objPlayer)

end;
--玩家退出
function war:EventExitPlayer(objWar,objPlayer)

end;

--侠客岛
local war = WarConfig[10070];

--检测是否允许角色进入，服务器部分
function war:CheckEnterConditionForServer(objPlayer)
	local dwLevel = objPlayer:GetLevel();
	if (dwLevel < 50) then
		return false;
	end
	
	--判断是否有组队状态
	local dwTeamID = 0
	local objTeamSys = objPlayer:GetSystem("CTeamSystem");
	if objTeamSys then
		dwTeamID = objTeamSys:GetTeamId()
	end	
	if dwTeamID then
		objPlayer:GetSystem("CScriptSystem"):Notice(13009200014,1)
		return;
	end	
	
	-- 判断buff
	local objBufSys = objPlayer:GetSystem("CBuffSystem");
	if not objBufSys then
		return false;
	end
	
	-- -- 携带该BUFF不允许进入战场
	-- if objBufSys:GetBuffObj(9563) ~= nil then
		-- local sysScript = objPlayer:GetSystem("CScriptSystem")
		-- sysScript:Notice(13009100006);
		-- return false
	-- end
	
	for _,buffId in pairs(self.BuffForbidList)do
		if objBufSys:GetBuffObj(buffId) ~= nil then
			objBufSys:DeleteBuffByID(buffId);
		end
	end
	return true;
end;

--检测是否允许角色进入，客户端部分
function war:CheckEnterConditionForClient()	
	local dwLevel = CPlayerSystem:GetLevel();
	if (dwLevel < 50) then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[13009100014]);
		return false;
	end		
	
	return true;
end;

function war:EventGameStart(objWar)

	--申请计数器
	objWar:CreateNumber("num10070");

	--设置战场脚本中Update的间隔时间
	objWar:SetUpdateTimeForWar(WarAddition[10070].Base.space);
	
	--设置map脚本玩家Update的间隔时间
	-- objWar:SetUpdateTimeForPlayer(WarAddition[10070].Base.space);
end;

--战场回调
function war:UpdateForWar(objWar)
	if objWar.isDeling then
		return;
	end	
	local obj = WarAddition[10070];
	
	-- print( "==============obj.Base.b_IsGetStartSvrTime=============",obj.Base.b_IsGetStartSvrTime )
	if not obj.Base.b_IsGetStartSvrTime then
		local dwTime = CTimeRewardManager:GetServerStartTime()
		local dwNow = GetCurTime()
		local dwDis = dwNow-dwTime
		obj.Base.StartSvrTime = math.ceil(dwDis/(1000*60*60*24))
		if dwDis <= 0 then
			return;
		else
			obj.Base.b_IsGetStartSvrTime = true;
		end
		
		--------------------刷出小怪
		obj:GrowSmallMon(obj.Base.StartSvrTime);
		obj:GrowSmallThief(obj.Base.StartSvrTime);
		obj:FunStoreThief(obj.Base.StartSvrTime);
		obj:FunStoreWoodBox();
		obj:FunStoreSilveryBox();
		obj:FunStoreGoldBox();
		obj:FunStoreNPC();
	end
	
	objWar:ChangeNumber("num10070",1)
	local dwNum = objWar:GetNumber("num10070");
	-- print( "=======================dwNum=========================",dwNum )
	
	-------------------刷金钱BOSS
	if ( dwNum == obj.Base.RefreshTime.GoldBoss ) then
		obj:GrowGoldBoss(obj.Base.StartSvrTime)
	end		
	
	-------------------刷经验BOSS
	if ( dwNum == obj.Base.RefreshTime.ExpBoss ) then
		obj:GrowExpBoss(obj.Base.StartSvrTime)
	end	

	-------------------刷最终BOSS
	if ( dwNum == obj.Base.RefreshTime.FinalBoss ) then
		obj:GrowFinalBoss(obj.Base.StartSvrTime)
	end			
	
	-------------------刷木质宝箱宝箱	
	local tempWoodBox = dwNum % WarAddition[10070].Base.RefreshTime.WoodBox
	if ( tempWoodBox == 0 ) then
		obj:GrowWoodBox()
	elseif ( tempWoodBox == 3 ) then
		obj:DeleteWoodBox()
	end	

	-------------------刷银质宝箱宝箱	
	local tempSilveryBox = dwNum % WarAddition[10070].Base.RefreshTime.SilveryBox
	if ( tempSilveryBox == 0 ) then
		obj:GrowSilveryBox()
	elseif ( tempSilveryBox == 5 ) then
		obj:DeleteSilveryBox()
	end
	
	-------------------刷金质宝箱宝箱	
	if ( dwNum == obj.Base.RefreshTime.GoldBox ) then
		obj:GrowGoldBox()	
	end

	---------------------刷NPC	
	local tempNpcData = dwNum % WarAddition[10070].Base.RefreshTime.NpcData
	if ( tempNpcData == 0 ) then
		obj:GrowNPC()	
	elseif ( tempNpcData == 7 ) then
		obj:DeleteNPC()
	end	
	
	--------------------刷飞贼
	if ( dwNum == obj.Base.RefreshTime.Thief ) then
		obj:GrowThief()
	end
	
	--------------------刷令牌小怪公告
	local tempTokenTime = dwNum % WarAddition[10070].Base.RefreshTime.TokenTime
	if ( tempTokenTime == 0 ) then
		obj:NoticeAToken()
	end	

	--------------------刷挂机公告
	local tempTokenTime = dwNum % WarAddition[10070].Base.RefreshTime.OnHookTime
	if ( tempTokenTime == 0 ) then
		CScriptManager:Notice(SysStringConfigInfo[13009200018],6,false,8090)
	end	
end
--玩家进入
function war:EventEnterPlayer(objWar,objPlayer)

end;
--玩家退出
function war:EventExitPlayer(objWar,objPlayer)
	
	--删除所有玩家的岛主令
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if not sysScript then
		return 0;
	end	
	sysScript:MoveItemToPacket(5501171);	
	sysScript:MoveItemToPacket(5501170);
	local a = sysScript:GetItemNum(5501171);
	local b = sysScript:GetItemNum(5501170);
	if a > 0 then 
		sysScript:DelItem(5501171,a);
	end
	if b > 0 then 
		sysScript:DelItem(5501170,b);
	end	

	--清空玩家身上所携带的酒徒buff
	local buffSys = objPlayer:GetSystem('CBuffSystem')
	if not buffSys then
		return ;
	end	
	local buffSmallOne = buffSys:GetBuffObj(50700027); 
	if buffSmallOne then
		sysScript:DelBuff(50700027);
	end	

	--删除任务
	for i=809001,809016 do
		if sysScript:CheckTaskState(i,2) or sysScript:CheckTaskState(i,4) then
			sysScript:DoffTask(i)	
		end	
	end
	
end;

--活动结束
function war:EventGameOver(objWar)
	
	--重置战场开启后刷怪的开关
	WarAddition[10070].Base.b_IsGetStartSvrTime = false;
	
	--清空标记岛主令的使用次数
	WarAddition[10070].Base.MarkTimes = 0
	
	--清空开服时间
	WarAddition[10070].Base.StartSvrTime = 0
	
	--获得战场玩家权限
	local tbPlayerList = objWar.setAllPlayer;
	for dwRoleID,_ in pairs(tbPlayerList)do
		local objPlayer = CMapManager:GetPlayer(dwRoleID)
		if (objPlayer) then
			local sysScript = objPlayer:GetSystem("CScriptSystem")
			local buffSys = objPlayer:GetSystem('CBuffSystem')
			if not sysScript then
				return 0;
			end
			if not buffSys then
				return ;
			end	
			--删除所有玩家的岛主令
			sysScript:MoveItemToPacket(5501171);
			sysScript:MoveItemToPacket(5501170);
			local a = sysScript:GetItemNum(5501171);
			local b = sysScript:GetItemNum(5501170);
			if a > 0 then 
				sysScript:DelItem(5501171,a);
			end
			if b > 0 then 
				sysScript:DelItem(5501170,b);
			end
			
			--清空玩家身上所携带的buff
			local buffSmallOne = buffSys:GetBuffObj(50700027); 
			if buffSmallOne then
				sysScript:DelBuff(50700027);
			end	
			local buffSmallTwo = buffSys:GetBuffObj(50700028); 
			if buffSmallTwo then
				sysScript:DelBuff(50700028);
			end	
			
			--清空玩家身上所携带的任务
			for i=809001,809016 do
				if sysScript:CheckTaskState(i,2) or sysScript:CheckTaskState(i,4) then
					sysScript:DoffTask(i)	
				end
			end
		end
	end
	
	--清空所有的表
	WarAddition[10070]:ClearTable();
	
end;
