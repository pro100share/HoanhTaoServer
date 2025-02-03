--[[
	策划函数配置
	周长沙
	2012-3-14
--]]
--
--0-7星--1阶装备
	local Temp1 = {
		[0] = 4000;
		[1] = 1400;
		[2] = 1000;
		[3] = 800;
		[4] = 700;
		[5] = 1000;
		[6] = 700;
		[7] = 400;
		[8] = 300;
		[9] = 200;
		[10] = 50;
		[11] = 30;
		[12] = 15;
		[13] = 10;
		[14] = 5;
		[15] = 1;
	}
	--0-6星--2阶装备
	local Temp2 = {
		[0] = 4500;
		[1] = 1500;
		[2] = 1000;
		[3] = 900;
		[4] = 700;
		[5] = 900;
		[6] = 500;
		[7] = 400;
		[8] = 300;
		[9] = 200;
		[10] = 50;
		[11] = 30;
		[12] = 15;
		[13] = 10;
		[14] = 5;
		[15] = 1;
	}
	
	--0-5星--3至7阶装备
	local Temp3 = {
		[0] = 4500;
		[1] = 1600;
		[2] = 1000;
		[3] = 800;
		[4] = 900;
		[5] = 1200;
		[6] = 300;
		[7] = 200;
		[8] = 100;
		[9] = 50;
		[10] = 40;
		[11] = 30;
		[12] = 15;
		[13] = 10;
		[14] = 5;
		[15] = 1;
	}
--


---------------------------------------
_G.DropFunctionConfig = {
	dwMoneyId = 1;	--金钱的掉落id
	dwExpShareDis = 15; --经验共享距离
	dwBanditItemId=1;--摇奖礼包id
}

---------------------------------------
--dwTeamLevel:队伍内总等级
--dwMyLevel:玩家等级
--dwTeamMemberNum:队伍成员数量(参与分经验/金钱的成员)
--dwMonsterExp:怪物经验
--dwMonsterLevel:怪物等级
--dwPetLevel:宠物等级
--获取组队经验分配(普通模式)
function DropFunctionConfig:GetExpInTeam(dwTeamLevel,dwMyLevel,dwTeamMemberNum,dwMonsterExp,dwMonsterLevel,bIsVip)
	--local dwExpGain = (0.9 + dwTeamMemberNum * 0.1) * dwMonsterExp 
		local dwExpGain = dwMonsterExp
		if (dwMyLevel - dwMonsterLevel) > 5 then
			dwExpGain = dwMonsterExp * 0.85 * (1-(dwMyLevel - 5 - dwMonsterLevel) / 20)
		end
		
		if dwExpGain < dwMonsterExp * 0.2	then
			dwExpGain = dwMonsterExp * 0.2
		end
		
		-- if bIsVip == true then
			-- dwExpGain = dwExpGain * 1.2
		-- end
	return 	math.ceil(dwExpGain)
end

--dwTeamLevel:队伍内总等级
--dwMonsterExp:怪物经验
--获取组队经验分配(经验共享模式)
function DropFunctionConfig:GetExpInTeamShare(objSelf, dwTeamLevel, dwMonsterExp, dwTeamMemberNum, dwMonsterLevel)
	local expTbl = {};
	local ExpSelf = 0;
	local ExpPlayer = 0;
	--打死怪的玩家的等级
	local dwSelfLevel = objSelf:GetInfo().dwLevel;
	local sysMap = objSelf:GetSystem("CMapSystem");
	local dwParam = dwSelfLevel / dwTeamLevel;
	if dwTeamMemberNum >= 2 then
		for _,dwRoleID in pairs(objSelf:GetSystem("CTeamSystem"):GetTeamLeaguer()) do
			if dwRoleID ~= objSelf:GetRoleID() then
				--是否在同一张地图上
				local player = sysMap:GetRoleByID(dwRoleID)
				if player then
					local dwLevel = player:GetInfo().dwLevel;
					if (dwLevel - dwMonsterLevel) > 5 then
						ExpPlayer = dwMonsterExp * dwParam * (1-(dwLevel - 5 - dwMonsterLevel) / 20)
					else
						ExpPlayer = dwMonsterExp * dwParam
					end
					
					if ExpPlayer < dwMonsterExp * 0.2	then
						ExpPlayer = dwMonsterExp * 0.1
					end
					expTbl[player:GetRoleID()] =  math.ceil(ExpPlayer);
				end
			end;
		end
		if (dwSelfLevel - dwMonsterLevel) > 5 then
			ExpSelf = dwMonsterExp * dwParam * (1-(dwSelfLevel - 5 - dwMonsterLevel) / 20)
		else
			ExpSelf = dwMonsterExp * dwParam
		end
		
		if ExpSelf < dwMonsterExp * 0.2	then
			ExpSelf = dwMonsterExp * 0.1
		end
		expTbl[objSelf:GetRoleID()] = math.ceil(ExpSelf);
	else
		if (dwSelfLevel - dwMonsterLevel) > 5 then
			ExpSelf = dwMonsterExp * 0.85 * (1-(dwSelfLevel - 5 - dwMonsterLevel) / 20)
		else
			ExpSelf = dwMonsterExp
		end
		
		if ExpSelf < dwMonsterExp * 0.2	then
			ExpSelf = dwMonsterExp * 0.2
		end
		expTbl[objSelf:GetRoleID()] = math.ceil(ExpSelf);
	end
	return expTbl;
end
--宠物打怪经验获取
function DropFunctionConfig:GetPetExp(dwPetLevel,dwMonsterExp,dwMonsterLevel)
		local dwExpGain = dwMonsterExp
		if (dwPetLevel - dwMonsterLevel) > 5 then
			dwExpGain = dwMonsterExp * 0.85 * (1-(dwPetLevel - 5 - dwMonsterLevel) / 20)
		end
		
		if dwExpGain < dwMonsterExp * 0.2	then
			dwExpGain = dwMonsterExp * 0.2
		end
		
		-- if bIsVip == true then
			-- dwExpGain = dwExpGain * 1.2
		-- end
	
	return 	math.ceil(dwExpGain)
end

--获取组队游戏币分配
function DropFunctionConfig:GetMoneyInTeam(dwTeamLevel,dwMyLevel,dwTeamMemberNum,dwMonsterMoney,dwMonsterLevel)
	return  math.floor(dwMonsterMoney / dwTeamMemberNum)
end

--获取掉落金钱的配置id
function DropFunctionConfig:GetMoneyId()
	return self.dwMoneyId
end
--获取组队杀怪共享经验距离
function DropFunctionConfig:GetExpShareDis()
	return self.dwExpShareDis
end

--获取摇奖使用的掉落组(传入玩家等级，返回掉落id)
function DropFunctionConfig:GetBanditDropTeam(dwLevel,dwItemId)
	 -- if dwLevel <= 20 then
		-- return 10080010
	 -- elseif dwLevel <= 40 then
		-- return 10080020
	 -- elseif dwLevel <= 60 then
		-- return 10080030
	 -- elseif dwLevel <= 80 then
		-- return 10080040
	 -- else
		-- return 10080050
	-- end
	
	--风云礼包
	if dwItemId == 5500460 then
		return 105500460
	end
	--绣包
	if dwItemId == 5500070 then
		return 105500070
	end
	--珍珑绣包
	if dwItemId == 5500071 then
		return 105500071
	end
	
	return 105500070 
end
--获取摇奖礼包天女散花和鸿运当头权重
function DropFunctionConfig:GetBanditPriority(dwLevel,dwItemId)
	
	if dwItemId == 5500460 then
		return 10,10
	end
	
	
	return 300,300
end

--获得掉落显示的模型id(传入掉落物品的id和数量，返回模型id)
function DropFunctionConfig:GetDropModel(dwId,dwNum)
	local dwSklFile = 1	--骨骼
	local dwSknFile = 1	--皮肤
	local dwDefAnima = 1 --默认动作
	local dwBornAnima = 110 --出生动作
	--掉落的是金钱
	if dwId == self.dwMoneyId then
		if dwNum < 100 then
			dwSklFile = 11
			dwSknFile = 11
			dwDefAnima = 11
			dwBornAnima = nil
		elseif dwNum < 500 then
			dwSklFile = 12
			dwSknFile = 12
			dwDefAnima = 12
			dwBornAnima = nil
		elseif dwNum < 1500 then
			dwSklFile = 13
			dwSknFile = 13
			dwDefAnima = 13
			dwBornAnima = nil
		elseif dwNum < 99999 then
			dwSklFile = 14
			dwSknFile = 14
			dwDefAnima = 14
			dwBornAnima = nil
		end
		
	--掉落的是道具
	elseif OtherBaseData[dwId] then

	
	--掉落的是装备
	elseif EquipBaseData[dwId] then
		local dwChildType = math.floor((dwId - 1000000 )/ 10000)
		local zhiye = math.floor((dwId - 1000000 - dwChildType *10000 )/1000)
		
		if dwChildType == 10 then 
			if zhiye == 1 then
				dwSklFile = 18
				dwSknFile = 18
				dwDefAnima = 18
				dwBornAnima = nil
			elseif zhiye == 2 then
				dwSklFile = 17
				dwSknFile = 17
				dwDefAnima = 17
				dwBornAnima = nil
			elseif zhiye == 3 then
				dwSklFile = 19
				dwSknFile = 19
				dwDefAnima = 19		
				dwBornAnima = nil				
			elseif zhiye == 4 then
				dwSklFile = 16
				dwSknFile = 16
				dwDefAnima = 16	
				dwBornAnima = nil
			end
		end
	else

	end
	return dwSklFile,dwSknFile,dwDefAnima,dwBornAnima
end

--获得怪物掉落的物品的品质
--dwItemId:物品ID
--dwMonsterType：怪物掉落类型
function DropFunctionConfig:GetDropQuality(dwItemId,dwMonsterType,dwdroptype)
	local number = math.random(1,1000000)

	--0普通怪物
	--1精英怪物
	--2boss怪物
	--3世界boss
	
	--数值模型表里面系数有数值模型

	if dwItemId == _G.DropFunctionConfig.dwMoneyId then
		return 0
	end

	if dwdroptype ==0 then

		if number <= 700000 then
			return 0
		elseif number <= 965000 then
			return 1
		elseif number <= 999650 then
			return 2
		else
			return 3
		end
	end


	if dwdroptype ==1 then

		if number <= 700000 then
			return 0
		elseif number <= 965000 then
			return 1
		elseif number <= 999600 then
			return 2
		else
			return 3
		end
	end


	if dwdroptype ==2 then
		
		if number <= 300000 then
			return 0
		elseif number <= 600000 then
			return 1
		elseif number <= 990000 then
			return 2
		else
			return 3
		end

	end


	if dwdroptype ==3 then
		
		if number <= 50000 then
			return 0
		elseif number <= 400000 then
			return 1
		elseif number <= 960000 then
			return 2
		else
			return 3
		end

	end
	
	
	
	
	
	
end

--获取强化等级
function DropFunctionConfig:GetDropStrong(dwItemId,dwStrongMin,dwStrongMax)
local cfg = EquipBaseData[dwItemId]
	local dwOrder = 0
	if cfg then
		dwOrder = cfg.dwLevel
	end
	

	local Temp = 0
	
	if cfg.dwLevel == 1 then
		Temp = Temp1
	elseif cfg.dwLevel == 2 then
		Temp = Temp2
	else
		Temp = Temp3
	end
	
	
	local dwSum = 0
	local dwStrongMin = dwStrongMin or 0
	local dwStrongMax = dwStrongMax or 0
	for i=dwStrongMin,dwStrongMax do
		dwSum = dwSum + (Temp[i] or 0)
	end
	local rand = math.random(0,dwSum)
	for i=dwStrongMin,dwStrongMax do
		if (Temp[i] or 0) >= rand then
			return i
		else
			rand = rand - (Temp[i] or 0)
		end
	end
	return 0;
end

--GM一键刷新调用
	_G.Field_Monster_BOSS = {
		--都烈
		{dwMapId = 1103,dwMonsterId = 20002001,dwLook = 100920060,X = 16.88,Y = 24.00};
		--柯镇恶
		{dwMapId = 1104,dwMonsterId = 20002003,dwLook = 100410031,X = 2.71,Y = 20.69};
		--黄药师
		{dwMapId = 1105,dwMonsterId = 20002004,dwLook = 100510030,X = 3.14,Y = 21.67};
		--一灯大师
		{dwMapId = 1106,dwMonsterId = 20002005,dwLook = 100610010,X = -0.22,Y = -5.81};
		--欧阳锋
		{dwMapId = 1107,dwMonsterId = 20002006,dwLook = 100710070,X = 3.92,Y = -1.34};
		--王重阳
		{dwMapId = 1108,dwMonsterId = 20002007,dwLook = 100920110,X = -11,Y = -7};
		--洪七公
		{dwMapId = 1109,dwMonsterId = 20002008,dwLook = 100820070 ,X = -36,Y = -41};
		--风清扬
		{dwMapId = 1110,dwMonsterId = 20002009,dwLook = 101020180,X = -10,Y = -13};	
		--无色禅师
		{dwMapId = 1111,dwMonsterId = 20002010,dwLook = 101120140,X = -3,Y = -6};
		--昆仑尸圣
		{dwMapId = 1112,dwMonsterId = 20002011,dwLook = 101220070,X = -1,Y = 6};
		--双头怪蟒
		{dwMapId = 1113,dwMonsterId = 20002012,dwLook = 101310060,X = 9,Y = -19};
	};

--一分钟执行一次
function DropFunctionConfig:DoPerOneMin(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)
	local dwTime = CTimeRewardManager:GetServerStartTime()
	local dwNow = GetCurTime()
	
	local dwDis = dwNow-dwTime
	local Day = math.ceil(dwDis/(1000*60*60*24))
	local XianLu= mgrScript:GetSrvLineID()
	
	
	
	-- --动态活动加载
	if ((dwHour%1) == 0 and dwMin == 0) then
		ActivityConfig:Reload()
	end
	--活动效果是否生效
	if ActivityConfig:Detection(ActivityConfig.Exp) then
		ActivityConfig:Effect(mgrScript,dwYear,dwMonth,dwDay,dwHour,dwMin)
	end
	--是否刷BOSS
	if ActivityConfig:Detection(ActivityConfig.Monster) then
		ActivityConfig:Refurbish(mgrScript,XianLu,dwYear,dwMonth,dwDay,dwHour,dwMin)
	end
	--怪物攻城
	if ActivityConfig:Detection(ActivityConfig.GongCheng) then
		ActivityConfig:GongChengMonster(mgrScript,XianLu,dwYear,dwMonth,dwDay,dwHour,dwMin,1)
	end	
	--删除攻城怪物
	if (dwMin == 0) then
		ActivityConfig:Delete(dwYear,dwMonth,dwDay,dwHour,dwMin)
	end	
	
	--BOSS攻城
----------------------------------------------------------------------------------------
	if((dwWeek == 1 or dwWeek == 3 or dwWeek == 6) and dwHour == 21 and (dwMin == 10 or dwMin == 20 or dwMin == 30 or dwMin ==40)) then
		if (XianLu == 1) then
			Activity[2]:Implement(mgrScript,dwMin,Day);
		end
	end
	
	if  (XianLu == 1) then
		if(dwWeek == 1 or dwWeek == 3 or dwWeek == 6) then
			if((dwHour == 21 and dwMin == 5)) then
				CScriptManager:ChatNoticeAll("<font color='#00FF00'>第一波怪物攻城</font>，将于<font color='#00FF00'>五分钟后</font>在<font color='#00FF00'>一线襄阳城</font>开始，请各位豪侠前往协助防护!",dwChannel,true,Param)
			--	mgrScript:Notice(SysStringConfigInfo[6001049001],7,false,dwMapId,8)
			elseif ((dwHour == 21 and dwMin == 15)) then
				CScriptManager:ChatNoticeAll("<font color='#00FF00'>第二波怪物攻城</font>，将于<font color='#00FF00'>五分钟后</font>在<font color='#00FF00'>一线襄阳城</font>开始，请各位豪侠前往协助防护!",dwChannel,true,Param)
			--	mgrScript:Notice(SysStringConfigInfo[6001049002],7,false,dwMapId,8)
			elseif ((dwHour == 21 and dwMin == 25)) then
				CScriptManager:ChatNoticeAll("<font color='#00FF00'>第三波怪物攻城</font>，将于<font color='#00FF00'>五分钟后</font>在<font color='#00FF00'>一线襄阳城</font>开始，请各位豪侠前往协助防护!",dwChannel,true,Param)
			--	mgrScript:Notice(SysStringConfigInfo[6001049003],7,false,dwMapId,8)
			elseif ((dwHour == 21 and dwMin == 35)) then
				CScriptManager:ChatNoticeAll("<font color='#00FF00'>最后一波怪物攻城</font>，将于<font color='#00FF00'>五分钟后</font>在<font color='#00FF00'>一线襄阳城</font>开始，请各位豪侠前往协助防护!",dwChannel,true,Param)
			--	mgrScript:Notice(SysStringConfigInfo[6001049004],7,false,dwMapId,8)
			end
		end
	end	
----------------------------------------------------------------------------------------
--流星雨   清楚流星雨增加容错
	if(dwHour == 16 and dwMin == 30) then
		if (XianLu == 2) then
			Activity[3]:Implement(mgrScript);
		end
	end
	
	if(dwHour == 16 and dwMin == 38) then
		if (XianLu == 2) then
			Activity[4]:Implement(mgrScript);
		end
	end
	
	if(dwHour == 16 and dwMin == 48) then
		if (XianLu == 2) then
			Activity[5]:Implement(mgrScript);
		end
	end
	
	if(dwHour == 16 and dwMin == 58) then
		if (XianLu == 2) then
			Activity[6]:Implement(mgrScript);
		end
	end
	
	if(dwHour == 17 and dwMin == 0) then
		if (XianLu == 2) then
			Activity[3]:Clear(mgrScript);
		end
	end
	
	if(dwHour == 17 and dwMin == 05) then
		if (XianLu == 2) then
			Activity[3]:Clear(mgrScript);
			Activity[4]:Clear(mgrScript);
			Activity[5]:Clear(mgrScript);
			Activity[6]:Clear(mgrScript);
		end
	end
	
	if(dwHour == 17 and dwMin == 10) then
		if (XianLu == 2) then
			Activity[3]:Clear(mgrScript);
			Activity[4]:Clear(mgrScript);
			Activity[5]:Clear(mgrScript);
			Activity[6]:Clear(mgrScript);
		end
	end
	
	if  (XianLu == 2) then
		if((dwHour == 16 and dwMin == 0)) then
			CScriptManager:ChatNoticeAll("近来天象异动，陨星纷然，风云客栈发布预测：<font color='#00FF00'>三十分钟后</font>将有<font color='#00FF00'>流星雨</font>在<font color='#00FF00'>二线襄阳城</font>落地！",dwChannel,true,Param)
		--	mgrScript:Notice(SysStringConfigInfo[6001049101],7,false,dwMapId,8)
		elseif ((dwHour == 16 and dwMin == 15)) then
			CScriptManager:ChatNoticeAll("近来天象异动，陨星纷然，风云客栈发布预测：<font color='#00FF00'>十五分钟后</font>将有<font color='#00FF00'>流星雨</font>在<font color='#00FF00'>二线襄阳城</font>落地！",dwChannel,true,Param)
		--	mgrScript:Notice(SysStringConfigInfo[6001049102],7,false,dwMapId,8)
		elseif ((dwHour == 16 and dwMin == 25)) then
			CScriptManager:ChatNoticeAll("近来天象异动，陨星纷然，风云客栈发布预测：<font color='#00FF00'>五分钟后</font>将有<font color='#00FF00'>流星雨</font>在<font color='#00FF00'>二线襄阳城</font>落地！",dwChannel,true,Param)
		--	mgrScript:Notice(SysStringConfigInfo[6001049103],7,false,dwMapId,8)
		elseif ((dwHour == 16 and dwMin == 29)) then
			CScriptManager:ChatNoticeAll("近来天象异动，陨星纷然，风云客栈发布预测：<font color='#00FF00'>一分钟后</font>将有<font color='#00FF00'>流星雨</font>在<font color='#00FF00'>二线襄阳城</font>落地！",dwChannel,true,Param)
		--	mgrScript:Notice(SysStringConfigInfo[6001049104],7,false,dwMapId,8)
		elseif ((dwHour == 16 and dwMin == 37)) then
			CScriptManager:ChatNoticeAll("各位侠士，一波<font color='#00FF00'>密集陨星</font>，将于<font color='#00FF00'>一分钟后</font>在<font color='#00FF00'>二线襄阳城 坐标X：-4 Y：-65 附近</font>落地！",dwChannel,true,Param)
		--	mgrScript:Notice(SysStringConfigInfo[6001049105],7,false,dwMapId,8)
		elseif ((dwHour == 16 and dwMin == 47)) then
			CScriptManager:ChatNoticeAll("各位侠士，一波<font color='#00FF00'>密集陨星</font>，将于<font color='#00FF00'>一分钟后</font>在<font color='#00FF00'>二线襄阳城 坐标X：60 Y：20 附近</font>落地！",dwChannel,true,Param)
		--	mgrScript:Notice(SysStringConfigInfo[6001049106],7,false,dwMapId,8)
		elseif ((dwHour == 16 and dwMin == 57)) then
			CScriptManager:ChatNoticeAll("各位侠士，一波<font color='#00FF00'>密集陨星</font>，将于<font color='#00FF00'>一分钟后</font>在<font color='#00FF00'>二线襄阳城 坐标X：-61 Y：20 附近</font>落地！",dwChannel,true,Param)	
		--	mgrScript:Notice(SysStringConfigInfo[6001049107],7,false,dwMapId,8)
		end
	end	
----------------------------------------------------------------------------------------
--星火坠地
	if(dwHour >= 10 and dwMin == 0) then
		if (dwHour%1 == 0) then
			Activity[1]:Implement(mgrScript);
			if (XianLu == 1) then
				mgrScript:ChatNoticeAll(SysStringConfigInfo[86],7,bSystem,{{szFunStr=SysStringConfigInfo[10000130024],dwFunId=40};{szFunStr=SysStringConfigInfo[10000130020],dwFunId=35};{szFunStr=SysStringConfigInfo[10000130021],dwFunId=36};{szFunStr=SysStringConfigInfo[10000130022],dwFunId=37};{szFunStr=SysStringConfigInfo[10000130023],dwFunId=38};{szFunStr=SysStringConfigInfo[4000400013],dwFunId=43}})	
			end
		end
	end
	
---------------------------------******************-----------------------------------	
-- --圣诞活动
	-- --刷出雪人
	-- if (dwWeek == 1 or dwWeek == 2 or dwWeek == 3 or dwWeek == 4 or dwWeek == 5 or dwWeek == 6  or dwWeek == 7) then
		-- if (dwHour == 10 and dwMin == 30) or (dwHour == 15 and dwMin == 30) or (dwHour == 22 and dwMin == 00) then
			-- if (XianLu == 1) then
				-- Activity[7]:Implement(mgrScript);
			-- end
		-- end
	-- end
	
	-- --圣诞活动提示
	-- if  (XianLu == 1) then
		-- if (dwWeek == 1 or dwWeek == 2 or dwWeek == 3 or dwWeek == 4 or dwWeek == 5 or dwWeek == 6  or dwWeek == 7) then
			-- if((dwHour == 10 and dwMin == 30) or (dwHour == 15 and dwMin == 30) or (dwHour == 22 and dwMin == 00)) then
				-- CScriptManager:ChatNoticeAll("<font color='#00FF00'>圣诞雪人</font>，已经带着丰厚的礼品降临<font color='#00FF00'>一线襄阳城</font>，小伙伴们快来一起愉快的打雪人吧!",dwChannel,true,Param)
			-- --	mgrScript:Notice(SysStringConfigInfo[6001049001],7,false,dwMapId,8)
			-- elseif ((dwHour == 10 and dwMin == 25) or (dwHour == 15 and dwMin == 25) or (dwHour == 21 and dwMin == 55) ) then
				-- CScriptManager:ChatNoticeAll("<font color='#00FF00'>圣诞雪人</font>，将于<font color='#00FF00'>五分钟后</font>带着丰厚的礼品降临<font color='#00FF00'>一线襄阳城</font>，赶快呼朋唤友一起愉快的打雪人吧!",dwChannel,true,Param)
			-- --	mgrScript:Notice(SysStringConfigInfo[6001049002],7,false,dwMapId,8)
			-- elseif ((dwHour == 10 and dwMin == 27) or (dwHour == 15 and dwMin == 27) or (dwHour == 21 and dwMin == 57) ) then
				-- CScriptManager:ChatNoticeAll("<font color='#00FF00'>圣诞雪人</font>，将于<font color='#00FF00'>三分钟后</font>带着丰厚的礼品降临<font color='#00FF00'>一线襄阳城</font>，赶快呼朋唤友一起愉快的打雪人吧!",dwChannel,true,Param)
			-- --	mgrScript:Notice(SysStringConfigInfo[6001049003],7,false,dwMapId,8)
			-- end
		-- end
	-- end		

	-- --删除雪人
	-- if (dwWeek == 1 or dwWeek == 2 or dwWeek == 3 or dwWeek == 4 or dwWeek == 5 or dwWeek == 6  or dwWeek == 7) then
		-- if (dwHour == 11 and dwMin == 30) or (dwHour == 16 and dwMin == 30) or (dwHour == 23 and dwMin == 00) then
			-- --CScriptManager:ChatNoticeAll("<font color='#00FF00'>圣诞雪人</font>，将于<font color='#00FF00'>五分钟后</font>带着丰厚的礼品降临<font color='#00FF00'>一线襄阳城</font>，赶快呼朋唤友一起愉快的打雪人吧!",dwChannel,true,Param)
			-- if (XianLu == 1) then
				-- Activity[7]:Clear();
			-- end
		-- end	
	-- end
	

---------------------------------******************-----------------------------------
--年兽送喜
	-- --刷出BOSS
	-- if (dwWeek == 1 or dwWeek == 2 or dwWeek == 3 or dwWeek == 4 or dwWeek == 5 or dwWeek == 6  or dwWeek == 7) then
		-- if (dwHour == 15 and dwMin == 30) or (dwHour == 22 and dwMin == 30) then
			-- if (XianLu == 1 or XianLu == 2) then
				-- Activity[8]:Implement(mgrScript);
			-- end
		-- end
	-- end
	-- --活动提示
	-- if  (XianLu == 1 or XianLu == 2) then
		-- if (dwWeek == 1 or dwWeek == 2 or dwWeek == 3 or dwWeek == 4 or dwWeek == 5 or dwWeek == 6  or dwWeek == 7) then
			-- if((dwHour == 15 and dwMin == 30) or (dwHour == 22 and dwMin == 30) ) then
				-- CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[4000120049],XianLu,Activity[8]:GetMapName(),Activity[8]:GetPos()),1,true)
			-- elseif ((dwHour == 15 and dwMin == 25) or (dwHour == 22 and dwMin == 25) ) then
				-- CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[4000120047],XianLu,Activity[8]:GetMapName(),Activity[8]:GetPos()),1,true)
			-- elseif ((dwHour == 15 and dwMin == 27) or (dwHour == 22 and dwMin == 27) ) then
				-- CScriptManager:ChatNoticeAll(string.format(SysStringConfigInfo[4000120048],XianLu,Activity[8]:GetMapName(),Activity[8]:GetPos()),1,true)
			-- end
		-- end
	-- end		

	-- --删除年兽
	-- if (dwWeek == 1 or dwWeek == 2 or dwWeek == 3 or dwWeek == 4 or dwWeek == 5 or dwWeek == 6  or dwWeek == 7) then
		-- if (dwHour == 15 and dwMin == 40) or (dwHour == 23 and dwMin == 30) then
			-- if (XianLu == 1 or XianLu == 2) then
				-- Activity[8]:Clear(Activity[8].mapID);
			-- end
		-- end	
	-- end

---------------------------------******************-----------------------------------






	
	--[[
		dwYear--年
		dwMonth--月
		dwDay--日
		dwWeek--周
		dwHour--时
		dwMin--分
	--]]
	--在指定地图刷怪 dwMapId=地图ID；dwMonsterId=怪物ID；dwFightId=战斗ID；AIID=AI
	--mgrScript:AddMonToMap(dwMapId,dwMonsterId,dwFightId,dwAIId,dwDropId,dwX,dwY)
	
	--怪物Monster信息
	--Mons返回的是一个表结构 MapId=地图ID dwMonsterId=怪物ID
	-- [1] = Monster1;
	-- [2] = Monster2;
	--local Mons = mgrScript:GetMon(dwMapId,dwMonsterId)
	
	--删除指定地图上的怪物
	--local num = mgrScript:HideMon(dwMapId,dwMonsterId)
	--发布公告
	--mgrScript:Notice(szStr,dwChannel,bSystem,dwMapId)
	
	--获取刷新提示
	--[[
		eNearby = 1,			--附近
		ePrivate = 2,			--私聊
		eTeam = 3,				--队伍
		eFaction = 4,			--帮派
		eLine = 5,				--同一条线，世界频道
		eNotice = 7,			--系统通知
	--]]
	
	
----------------------------------------------------------------------------------	
	--野外BOSS信息
	local YeWaiBoss_XinXi = {
		--都烈
		{dwMapId = 1103,dwMonsterId = 20002001,dwLook = 100920060,X = 23.88,Y = 15.55};
		--柯镇恶
		{dwMapId = 1104,dwMonsterId = 20002003,dwLook = 100410031,X = 20.18,Y = 23.56};
		--黄药师
		{dwMapId = 1105,dwMonsterId = 20002004,dwLook = 100510030,X = -7,Y = 24};
		--一灯大师
		{dwMapId = 1106,dwMonsterId = 20002005,dwLook = 100610010,X = -0.3,Y = 1.68};
		--欧阳锋
		{dwMapId = 1107,dwMonsterId = 20002006,dwLook = 100710070,X = -5,Y = 4};
		--王重阳
		{dwMapId = 1108,dwMonsterId = 20002007,dwLook = 100920110,X = -11,Y = -7};
		--洪七公
		{dwMapId = 1109,dwMonsterId = 20002008,dwLook = 100820070,X = -36,Y = -41};
		--风清扬
		{dwMapId = 1110,dwMonsterId = 20002009,dwLook = 101020180,X = -10,Y = -13};	
		--无色禅师
		{dwMapId = 1111,dwMonsterId = 20002010,dwLook = 101120140,X = -3,Y = -6};
		--昆仑尸圣
		{dwMapId = 1112,dwMonsterId = 20002011,dwLook = 101220070,X = -1,Y = 6};
		--双头怪蟒
		{dwMapId = 1113,dwMonsterId = 20002012,dwLook = 101310060,X = 9,Y = -19};
	};
	
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-----------------------------------公告-------------------------------------------
	--参数1、公告ID，
	--参数2、在那个频道发送消息
	--参数3、是否在屏幕中间显示公告
--参数4、地图ID 可以不传、传了会在指定地图发送公告
	--在8.20发布公告
	if(dwHour == 8 and dwMin == 20) then		
		mgrScript:Notice(SysStringConfigInfo[50],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	--在8.27发布公告
	if(dwHour == 8 and dwMin == 27) then		
		mgrScript:Notice(SysStringConfigInfo[51],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	--在12.20发布公告
	if(dwHour == 12 and dwMin == 20) then		
		mgrScript:Notice(SysStringConfigInfo[50],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	--在12.27发布公告
	if(dwHour == 12 and dwMin == 27) then		
		mgrScript:Notice(SysStringConfigInfo[51],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	--在17.20发布公告
	if(dwHour == 17 and dwMin == 20) then		
		mgrScript:Notice(SysStringConfigInfo[50],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	--在17.27发布公告
	if(dwHour == 17 and dwMin == 27) then		
		mgrScript:Notice(SysStringConfigInfo[51],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	--在23.20发布公告
	if(dwHour == 23 and dwMin == 20) then		
		mgrScript:Notice(SysStringConfigInfo[50],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	--在23.27发布公告
	if(dwHour == 23 and dwMin == 27) then		
		mgrScript:Notice(SysStringConfigInfo[51],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
---------------------------------BOSS刷新-----------------------------------------
	--在8.30刷新BOSS
	if (dwHour == 8 and dwMin == 30) then
		for i = 1,#YeWaiBoss_XinXi do
			local t = YeWaiBoss_XinXi[i]
			local Mons = mgrScript:GetMon(t.dwMapId,t.dwMonsterId)		
			if (#Mons == 0) then
				mgrScript:AddMonToMap(t.dwMapId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwLook,t.X,t.Y)
			end
			CBossInfoManager:BossFlush(t.dwMonsterId)
		end
		mgrScript:Notice(SysStringConfigInfo[56],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
----------------------------------------------------------------------------------
	--在8.30刷新BOSS
	if (dwHour == 12 and dwMin == 30) then
		for i = 1,#YeWaiBoss_XinXi do
			local t = YeWaiBoss_XinXi[i]
			local Mons = mgrScript:GetMon(t.dwMapId,t.dwMonsterId)		
			if (#Mons == 0) then
				mgrScript:AddMonToMap(t.dwMapId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwLook,t.X,t.Y)
			end
			CBossInfoManager:BossFlush(t.dwMonsterId)
		end
		mgrScript:Notice(SysStringConfigInfo[56],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
----------------------------------------------------------------------------------
	--在17.30刷新BOSS
	if (dwHour == 17 and dwMin == 30) then
		for i = 1,#YeWaiBoss_XinXi do
			local t = YeWaiBoss_XinXi[i]
			local Mons = mgrScript:GetMon(t.dwMapId,t.dwMonsterId)		
			if (#Mons == 0) then
				mgrScript:AddMonToMap(t.dwMapId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwLook,t.X,t.Y)
			end
			CBossInfoManager:BossFlush(t.dwMonsterId)
		end
		mgrScript:Notice(SysStringConfigInfo[56],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
	----------------------------------------------------------------------------------
	--在23.30刷新BOSS
	if (dwHour == 23 and dwMin == 30) then
		for i = 1,#YeWaiBoss_XinXi do
			local t = YeWaiBoss_XinXi[i]
			local Mons = mgrScript:GetMon(t.dwMapId,t.dwMonsterId)		
			if (#Mons == 0) then
				mgrScript:AddMonToMap(t.dwMapId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwLook,t.X,t.Y)
			end
			CBossInfoManager:BossFlush(t.dwMonsterId)
		end
		mgrScript:Notice(SysStringConfigInfo[56],7,false,dwMapId,35,17,SysStringConfigInfo[52])
	end
------------------------------------世家战公告------------------------------------
----------------------------------------------------------------------------------

	if (dwDis - (1000*60*60*24*3)) > 0  then
		--世家战即将开启公告
		if((dwWeek == 5 or dwWeek == 2)  and dwHour == 19 and dwMin == 50) then		
			mgrScript:Notice(SysStringConfigInfo[6001010091],7,false,dwMapId,25)
		end
		--世家战开启
		if((dwWeek == 5 or dwWeek == 2)  and dwHour == 20 and dwMin == 0) then		
			mgrScript:Notice(SysStringConfigInfo[6001010092],7,false,dwMapId,25,18,SysStringConfigInfo[6001010095])
		end
		--世家战即将关闭
		if((dwWeek == 5 or dwWeek == 2)  and dwHour == 20 and dwMin == 50) then		
			mgrScript:Notice(SysStringConfigInfo[6001010093],7,false,dwMapId,25)
		end
		--世家战关闭
		if((dwWeek == 5 or dwWeek == 2)  and dwHour == 21 and dwMin == 0) then		
			mgrScript:Notice(SysStringConfigInfo[6001010094],7,false,dwMapId,25)
		end

		--龙鼎战消息推送
		if((dwWeek == 5 or dwWeek == 2) and dwHour == 20 and (dwMin == 15 or dwMin == 30 or dwMin == 45)) then		
			mgrScript:Notice(SysStringConfigInfo[6001010092],7,false,dwMapId,25,18,SysStringConfigInfo[6001010095])
		end
	end
------------------------------------盟主战------------------------------------
----------------------------------------------------------------------------------
	if (dwDis - (1000*60*60*24*3)) > 0  then
		--即将开启
		if(dwWeek == 6 and dwHour == 19 and dwMin == 50) then		
			mgrScript:Notice(SysStringConfigInfo[6001047000],7,false,dwMapId,25)
		end
		--参数18  是这个里面的TaskStateConfig.lua
		--开启
		if(dwWeek == 6 and dwHour == 20 and dwMin == 0) then		
			mgrScript:Notice(SysStringConfigInfo[6001047001],7,false,dwMapId,25,18,SysStringConfigInfo[71])
		end
		--即将关闭
		if(dwWeek == 6 and dwHour == 20 and dwMin == 50) then		
			mgrScript:Notice(SysStringConfigInfo[6001047021],7,false,dwMapId,25)
		end
		--关闭
		if(dwWeek == 6 and dwHour == 21 and dwMin == 0) then		
			mgrScript:Notice(SysStringConfigInfo[6001047022],7,false,dwMapId,25)
		end
		
		--盟主战消息推送
		if(dwWeek == 6 and dwHour == 20 and (dwMin == 15 or dwMin == 30 or dwMin == 45)) then		
			mgrScript:Notice(SysStringConfigInfo[6001047001],7,false,dwMapId,25,18,SysStringConfigInfo[71])
		end
	end
----------------------------------------------------------------------------------
----------------------------------恶人谷------------------------------------------	
	--恶人谷BOSS信息
	local Bully_Boss_News = {
		--不动佛陀 50级世界boss
		{dwMapId = 8050,FightId=4055,dwMonsterId = 50312101,drop_id = 50312101,dwLook = 100820030,X = 22.2,Y = 26.21};
		--活死人
		{dwMapId = 8051,FightId=4070,dwMonsterId = 50312102,drop_id = 50312102,dwLook = 503020130,X = 4.78,Y = -10.18};
		--鬼面药王
		{dwMapId = 8052,FightId=4090,dwMonsterId = 50312104,drop_id = 50312104,dwLook = 100710090,X = -9.88,Y = 44.86};
		--活阎罗
		{dwMapId = 8053,FightId=4100,dwMonsterId = 50312105,drop_id = 50312104,dwLook = 100120041,X = -13.88,Y = 49.86};	
		--母夜叉
		{dwMapId = 8054,FightId=4120,dwMonsterId = 50312106,drop_id = 50312106,dwLook = 100510060,X = -60,Y = -7};	
	};
	
	if ((dwHour-2)%3 == 0 and dwMin == 0) then
		for i = 1,#Bully_Boss_News do
			local t = Bully_Boss_News[i]
			local Mons = mgrScript:GetMon(t.dwMapId,t.dwMonsterId)		
			if (#Mons == 0) then
				mgrScript:AddMonToMap(t.dwMapId,t.dwMonsterId,t.FightId,t.dwMonsterId,t.drop_id,t.dwLook,t.X,t.Y)
			end
			CBossInfoManager:BossFlush(t.dwMonsterId)
		end
		mgrScript:Notice(SysStringConfigInfo[70],7,false,dwMapId,45,18,SysStringConfigInfo[71])
	end
---恶人谷消息推送
	if ((dwHour == 8 or dwHour == 14 or dwHour == 17 or dwHour == 24) and dwMin == 0) then
		mgrScript:Notice(SysStringConfigInfo[72],7,false,dwMapId,42,18,SysStringConfigInfo[71])
	end
	
----------------------------------------------------------------------------------
----------------------------------夜战襄阳----------------------------------------
	--预热公告
	if (dwHour == 07 and dwMin == 20) then
		mgrScript:Notice(SysStringConfigInfo[6001048101],7,false,dwMapId,25,18,SysStringConfigInfo[6001010095])
	end
	--开启公告
	if (dwHour == 07 and dwMin == 30) then
		mgrScript:Notice(SysStringConfigInfo[6001048102],7,false,dwMapId,25,18,SysStringConfigInfo[6001010095])
	end
	--夜战襄阳消息推送
	if (dwHour == 07 and dwMin == 40) then
		mgrScript:Notice(SysStringConfigInfo[6001048102],7,false,dwMapId,25,18,SysStringConfigInfo[6001010095])
	end
	
----------------------------------------------------------------------------------
----------------------------------戏说天下----------------------------------------	
	--预热公告
	if (dwHour == 23 and dwMin == 50) then
		mgrScript:Notice(SysStringConfigInfo[13006001306],7,false,dwMapId,30,46,SysStringConfigInfo[6001010095])
	end
	--开启公告
	if (dwHour == 00 and dwMin == 00) then
		mgrScript:Notice(SysStringConfigInfo[13006001307],7,false,dwMapId,30,46,SysStringConfigInfo[6001010095])
	end
	--戏说天下
	if (dwHour == 00 and dwMin == 30) then
		mgrScript:Notice(SysStringConfigInfo[13006001308],7,false,dwMapId,30)
	end
----------------------------------青云蜀道----------------------------------------	
	--预热公告
	if ((dwWeek == 1 or dwWeek == 4) and dwHour == 07 and dwMin == 50) then
		mgrScript:Notice(SysStringConfigInfo[13009000027],7,false,dwMapId,30,46,SysStringConfigInfo[6001010095])
	end
	--开启公告
	if ((dwWeek == 1 or dwWeek == 4) and dwHour == 08 and dwMin == 00) then
		mgrScript:Notice(SysStringConfigInfo[13009000028],7,false,dwMapId,30,46,SysStringConfigInfo[6001010095])
	end
	--青云蜀道
	if ((dwWeek == 1 or dwWeek == 4) and dwHour == 08 and dwMin == 30) then
		mgrScript:Notice(SysStringConfigInfo[13009000029],7,false,dwMapId,30)
	end
----------------------------------桃花迷阵----------------------------------------	
	--预热公告
	if (dwHour == 05 and dwMin == 20) then
		mgrScript:Notice(SysStringConfigInfo[13009100011],7,false,dwMapId,50,46,SysStringConfigInfo[6001010095])
	end
	--开启公告
	if (dwHour == 05 and dwMin == 30) then
		mgrScript:Notice(SysStringConfigInfo[13009100012],7,false,dwMapId,50,46,SysStringConfigInfo[6001010095])
	end
	--青云蜀道
	if (dwHour == 06 and dwMin == 00) then
		mgrScript:Notice(SysStringConfigInfo[13009100013],7,false,dwMapId,50)
	end	
-- ----------------------------------侠客岛----------------------------------------	
	--预热公告
	if (dwHour == 00 and dwMin == 50) then
		mgrScript:Notice(SysStringConfigInfo[13009200020],7,false,dwMapId,50,46,SysStringConfigInfo[6001010095])
	end
	--开启公告
	if (dwHour == 00 and dwMin == 00) then
		mgrScript:Notice(SysStringConfigInfo[13009200021],7,false,dwMapId,50,46,SysStringConfigInfo[6001010095])
	end
	--侠客岛
	if (dwHour == 00 and dwMin == 40) then
		mgrScript:Notice(SysStringConfigInfo[13009200022],7,false,dwMapId,50)
	end		
	
end
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------