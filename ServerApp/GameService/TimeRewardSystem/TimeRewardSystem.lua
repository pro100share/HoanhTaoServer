--[[
功能：在线奖励 系统（服务器）
作者：周长沙
时间：2013-4-7
]]
-------------------------------------
_G.CTimeRewardSystem = {}
-------------------------------------
local dwBindType = enItemBindType.eYes
-------------------------------------
--本地函数
--字符串切割，参数： 源字符串，切割符
--返回：切割后的表
local function Split(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
	   if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
	   end
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
	   nSplitIndex = nSplitIndex + 1
	end
	return nSplitArray
end
-------------------------------------
function CTimeRewardSystem:new()
	local obj = CSystem:new("CTimeRewardSystem");
	---------------------------------------------
	obj.Data = {}
	---------------------------------------------
	for i,v in pairs(CTimeRewardSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CTimeRewardSystem:Create(IsChangeLine)
	--获取数据库操作对象
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CTimeRewardSystemDB:new(objDB,objPlayer)
	self.Data.dwServerStartTime = CTimeRewardManager:GetServerStartTime()
	
	--读取信息
	if IsChangeLine == 1 then
		self:DisposeGSData()
	elseif IsChangeLine == 0 then
		self:DisposeKSData()
	end
	
	self.bCreate = true
	
	self:TimeCheck()
	return true;
end

function CTimeRewardSystem:Update(dwInterval)
	if self.bCreate then
		if self:TimeCheck() then
			self:SendAllData()
		end
		self:Save()
	else
		-- print("_ERR : NO Create before Update!! <------>")
	end
	return true
end

function CTimeRewardSystem:Destroy()
	--self:Save()
	if not self.bCreate then
		-- print("_ERR : NO Create before Destroy!! <------>")
	end
	self.bCreate = false;
	return true
end

--换线数据
function CTimeRewardSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	objPlayer:SetLineData("CTimeRewardSystem",self.Data)
	self.Destroy = function() end;
end

-- 00:00 点
function CTimeRewardSystem:OnOneDayEnd()
	if self:TimeCheck() then
		self:SendAllData()
	end
end

--准备向Clt发送数据
function CTimeRewardSystem:OnEnterScene()
	self:SendAllData()
end

function CTimeRewardSystem:Save()
	self.Data.dwWeekLoginTime = self.Data.dwWeekLoginTime + GetCurTime() - (self.Data.dwLoginTime or GetCurTime())
	self.Data.dwLoginTime = nil
	self:DBUpdateLoginTime()
	self.Data.dwLoginTime = GetCurTime()
end

-----------------------------------------
--KS的登陆数据
function CTimeRewardSystem:DisposeKSData()
	local objPlayer = self:GetPlayer();
	local Data = objPlayer:GetLineData("CTimeRewardSystem")
	local Info = Data[1][1]
	
	if not Info.isNewRole then
		self.Data.dwLastLoginTime = Info.dwLastLoginTime 	--上次登陆时间
		self.Data.dwWeekLoginTime = Info.dwWeekLoginTime 	--本周在线时间
		self.Data.dwWeekMoneyGet = Info.dwWeekMoneyGet 		--上周工资
		self.Data.dwLastSigninTime = Info.dwLastSigninTime 	--上次签到时间
		self.Data.dwWeekMoneyTime = Info.dwWeekMoneyTime 	--上次领取工资时间
		self.Data.dwWeekStartTime = Info.dwWeekStartTime 	--本周开始时间
		
		--print("=====CTimeRewardSystem player 3721 is not new player dwLastSigninTime is ====="..self.Data.dwLastSigninTime)
		
		self.Data.szLoginReward = Info.szLoginReward 		--登陆奖励
		self.Data.szSignin = Info.szSignin 					--签到记录
		self.Data.szSigninReward = Info.szSigninReward 		--签到奖励记录
		if not Info.dwLastLoginTime then
			self.Data.dwWeekMoneyGet = 1
			self.Update = function() end;
			self.Data.bErr = true
			-- print("ERR: No Data Send At Create!!!!!!!!!!!!!")
		end
	else
		self.Data.dwLastLoginTime = 0	--上次登陆时间
		self.Data.dwWeekLoginTime = 0	--本周在线时间
		self.Data.dwWeekMoneyGet = 0		--上周工资
		self.Data.dwLastSigninTime = 0	--上次签到时间
		self.Data.dwWeekMoneyTime = _now()	--上次领取工资时间
		self.Data.dwWeekStartTime = _now()	--本周开始时间
		
		self.Data.szLoginReward = ""		--登陆奖励
		self.Data.szSignin = ""				--签到记录
		self.Data.szSigninReward = ""	--签到奖励记录
	end
	
	self:UnPack()
	
	self.Data.dwLoginTime = GetCurTime()				--本次登陆的时间
	
	local createRoleTime = Data[1][2].tmCreateRoleTime or _now()	--玩家建号的时间
	
	--建号时间 开服时间 现在时间
	local cy,cm,cd = CTimeFormat:mtodate(createRoleTime, true,true)
	local sy,sm,sd = CTimeFormat:mtodate(self.Data.dwServerStartTime, true,true)
	local ny,nm,nd = CTimeFormat:mtodate(GetCurTime(), true,true)
	
	self.Data.dwCanSigninStartTime = 1;
	--设置可以签到的开始时间
	if ny == sy and nm == sm then
		self.Data.dwCanSigninStartTime = sd;
	end
	
	if ny == cy and nm == cm then
		self.Data.dwCanSigninStartTime = cd;
	end
	
	--self.Data.dwWeekLoginTime = 1000*60*60*24*3 + 1000*60*60*3
	if Info.isNewRole then
		self:DBInsert()
	end
end
--GS 的换线数据
function CTimeRewardSystem:DisposeGSData()
	local objPlayer = self:GetPlayer();
	local Data = objPlayer:GetLineData("CTimeRewardSystem")
	if Data then
		self.Data = Data[1] or {}
	end
end
--解包
function CTimeRewardSystem:UnPack()
	if string.find(self.Data.szLoginReward,";") or
		string.find(self.Data.szSignin,";") or
		string.find(self.Data.szSigninReward,";") then
		self:NewUnPack()
		return
	end


	self.Data.LoginReward = {}
	for i=1,string.len(self.Data.szLoginReward) do
		self.Data.LoginReward[i] = string.byte(self.Data.szLoginReward,i)
	end
	--self.Data.szLoginReward = nil
	
	self.Data.Signin = {}
	for i=1,string.len(self.Data.szSignin) do
		self.Data.Signin[i] = string.byte(self.Data.szSignin,i)
	end
	--self.Data.szSignin = nil
	
	self.Data.SigninReward = {}
	for i=1,string.len(self.Data.szSigninReward) do
		local dwIndex = string.byte(self.Data.szSigninReward,i)
		self.Data.SigninReward[dwIndex] = dwIndex
	end
	--self.Data.szSigninReward = nil
end

function CTimeRewardSystem:NewUnPack()
	local LoginReward = Split(self.Data.szLoginReward, ";") or {}
	self.Data.LoginReward = {}
	for i=1,#LoginReward do
		self.Data.LoginReward[i] = tonumber(LoginReward[i])
	end
	--self.Data.szLoginReward = nil
	local y,m,d = CTimeFormat:mtodate(GetCurTime(), true,true)
	
	local Signin = Split(self.Data.szSignin, ";") or {}
	self.Data.Signin = {}
	for i=1,#Signin do
		if d >= (tonumber(Signin[i]) or 0) then
			self.Data.Signin[i] = tonumber(Signin[i])
		else
			self.Data.szSigninReward = "";
		end
	end
	--self.Data.szSignin = nil
	local SigninReward = Split(self.Data.szSigninReward, ";") or {}
	self.Data.SigninReward = {}
	for i=1,#SigninReward do
		local dwIndex = tonumber(SigninReward[i])
		if dwIndex then
			self.Data.SigninReward[dwIndex] = dwIndex
		end
	end
end


--打包
function CTimeRewardSystem:Pack()
	self.Data.szLoginReward = ""
	for i=1,#self.Data.LoginReward do
		self.Data.szLoginReward = self.Data.szLoginReward..tostring(self.Data.LoginReward[i])..";"
	end
	--self.Data.LoginReward = nil
	
	self.Data.szSignin = ""
	for i=1,#self.Data.Signin do
		self.Data.szSignin = self.Data.szSignin..tostring(self.Data.Signin[i])..";"
	end
	--self.Data.Signin = nil
	
	self.Data.szSigninReward = ""
	for i,v in pairs(self.Data.SigninReward) do
		self.Data.szSigninReward = self.Data.szSigninReward..tostring(i)..";"
	end
	--self.Data.SigninReward = nil
end

--时间检查
local dwTimeAWeek = 7*24*60*60*1000
function CTimeRewardSystem:TimeCheck()
--	print("Time Check")
	local bUpdate = false
	--登陆奖励
	if not CTimeFormat:isToday(self.Data.dwLastLoginTime) then
		self.Data.dwLastLoginTime = GetCurTime()
		local dwIndex = #self.Data.LoginReward + 1
		if dwIndex < 8 then
			self.Data.LoginReward[dwIndex] = 1
			bUpdate = true
		end
	end
	--工资
	if not CTimeFormat:isThisWeek(self.Data.dwWeekStartTime) then
		self.Data.dwWeekStartTime = GetCurTime()
		--if not CTimeFormat:isThisWeek(self.Data.dwWeekStartTime + dwTimeAWeek) then
			--self.Data.dwWeekMoneyGet = 0
		--else
			self.Data.dwWeekMoneyGet = self:GetTimeMoney()
		--end
		self.Data.dwWeekLoginTime = 0
		self.Data.dwLoginTime = GetCurTime()
		bUpdate = true
	end
	--签到
	--print("=====CTimeRewardSystem TimeCheck dwLastSigninTime is ====="..self.Data.dwLastSigninTime)
	--table.print(self.Data.Signin)
	local y,m,d = CTimeFormat:mtodate(GetCurTime(), true,true)
	local y2,m2,d2 = CTimeFormat:mtodate(self.Data.dwLastSigninTime, true,true)
	--print(m,m2,y,y2)
	if (m~=m2) or (y~=y2) then
		self.Data.Signin = {}
		self.Data.SigninReward = {}
		bUpdate = true
	end
	if bUpdate then
		self:DBUpdate()
	end
	return bUpdate
end

--根据在线时间计算工资---
function CTimeRewardSystem:GetTimeMoney()
	local dwHourMoney = 0
	local dwTime = self.Data.dwServerStartTime
	local dis =  GetCurTime() - dwTime
	local dd = math.ceil(dis/(24*60*60*1000))
	for i=1,#WeekMoneyConfig do
		local Info = WeekMoneyConfig[i]
		if Info.dwStart<=dd and Info.dwEnd>=dd then
			dwHourMoney = Info.dwHourMoney
		end
	end
	local y,m,d,h,m,s = CTimeFormat:mtodate(self.Data.dwWeekLoginTime, true,true)
	if d > 0 then
		d = d - 1
		return dwHourMoney*(h+d*24)
	else
		return dwHourMoney*(h)
	end
end
-----------------------------------------
--给工资
function CTimeRewardSystem:GiveWage()
	self.Data.dwWeekMoneyTime = GetCurTime()
	local objPlayer = self:GetPlayer()
	local sysItem = objPlayer:GetSystem("CItemSystem")
	local bindgold = self.Data.dwWeekMoneyGet;
	if bindgold and bindgold ~= 0 then
		sysItem:AddBindGold(bindgold, _G.ItemSysOperType.Wage)
	end;
	self:DBUpdate()
	return true
end
--给签到奖励
function CTimeRewardSystem:GiveSignin(dwIndex)
	local objPlayer = self:GetPlayer()
	local cfg = SigninRewardConfig[dwIndex]
	local item = cfg.Item or {}
	local vitem = cfg.Vip or {}
	local ItemList,FlyList = self:SetItemList(item,vitem)
	local sysItem = objPlayer:GetSystem("CItemSystem")
	if sysItem:AddEnumItemListToPacket(ItemList, ItemSysOperType.Signin) then
		self.Data.SigninReward[dwIndex] = dwIndex
		self:DBUpdate()
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		sysScript:FlyItem(FlyList)
		return true
	end
	return false
end
--签到
function CTimeRewardSystem:Signin(day)
	self.Data.dwLastSigninTime = GetCurTime()
	--local y,m,d = CTimeFormat:mtodate(GetCurTime(), true,true)
	table.insert(self.Data.Signin,tonumber(day))
	self:DBUpdate()
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventDaySign,1)
	
	CLogSystemManager:sign(self:GetPlayer())--签到日志
	return true
end
--给登陆奖励
function CTimeRewardSystem:GiveLogin(dwIndex)
	local objPlayer = self:GetPlayer()
	local cfg = LoginRewardConfig[dwIndex]
	local item = cfg
	local ItemList = self:SetItemList(item,vitem)
	local sysItem = objPlayer:GetSystem("CItemSystem")
	if sysItem:AddEnumItemListToPacket(ItemList, ItemSysOperType.Login) then
		self.Data.LoginReward[dwIndex] = 2
		self:DBUpdate()
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		local Item = {}
		for k,objItem in pairs(ItemList) do
			table.insert(Item,objItem.dwItemEnum)
		end
		sysScript:FlyItem(Item)
		return true
	end
	return false
end
--压物品信息
function CTimeRewardSystem:SetItemList(item,vitem)
	local objPlayer = self:GetPlayer()
	local dwProf = objPlayer:GetInfo().dwProf
	local item = item or {}
	local vitem = vitem or {}
	local ItemList = {}
	local FlyList = {}
	for k,v in pairs(item) do
		local objItem = nil
		local dwItemID = v[1]
		local dwNum = v[2] or 1
		local Info = GiftConfig.PropConfig[dwItemID]
		objItem = {}
		objItem.dwItemEnum = dwItemID
		objItem.dwItemNumber = dwNum
		objItem.dwBindType = dwBindType
		if Info then
			objItem.dwItemEnum = Info.ProfEquipEnum[dwProf]
			objItem.dwStrongLevel = Info.dwStrongEnum
			objItem.setProperty = Info.PropList
			objItem.dwTianSheng = Info.dwTianSheng
		end
		table.insert(ItemList,objItem)
		table.insert(FlyList,dwItemID)
	end
	local objVipSys = objPlayer:GetSystem("CVipSystem");
	if objVipSys:isVip() then
		for k,v in pairs(vitem) do
			local objItem = nil
			local dwItemID = v[1]
			local dwNum = v[2] or 1
			local Info = GiftConfig.PropConfig[dwItemID]
			objItem = {}
			objItem.dwItemEnum = dwItemID
			objItem.dwItemNumber = dwNum
			objItem.dwBindType = dwBindType
			if Info then
				objItem.dwItemEnum = Info.ProfEquipEnum[dwProf]
				objItem.dwStrongLevel = Info.dwStrongEnum
				objItem.setProperty = Info.PropList
				objItem.dwTianSheng = Info.dwTianSheng
			end
			table.insert(ItemList,objItem)
			table.insert(FlyList,dwItemID)
		end
	end
	return ItemList,FlyList
end
-----------------------------------------
--接收

--领取工资
function CTimeRewardSystem:OnRecvGetWage()
	if CTimeFormat:isThisWeek(self.Data.dwWeekMoneyTime) then
		self:SendOperaRes(1,1)--已经领取过了
		return
	end
	--给工资
	if self:GiveWage() then
		self:SendOperaRes(1,0)--领取成功
	end
end
--领取签到奖励
function CTimeRewardSystem:OnRecvGetSignin(dwIndex)
	if self.Data.SigninReward[dwIndex] then
		--已经领过了
		self:SendOperaRes(3,1)
		return
	end
	if SigninRewardConfig[dwIndex].dwSigninTime > #self.Data.Signin then
		--未满足签到天数要求
		self:SendOperaRes(3,2)
		return
	end
	--给签到奖励
	if self:GiveSignin(dwIndex) then
		self:SendOperaRes(3,0)
	else
		self:SendOperaRes(3,3)
	end
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventRewardSign,1)
end
--签到
function CTimeRewardSystem:OnRecvSignin(day)
	local _,_,dwDay = CTimeFormat:mtodate(GetCurTime() + 43200000, true,true)
	--如果传过来的日期不合法
	if day < self.Data.dwCanSigninStartTime or day >dwDay then
		--等于0 认为是今日签到
		if day ~= 0 then
			return;
		end;
	end
	
	--等于0 认为是今日签到
	if day == 0 then
		day = dwDay
	end;
	
	for k,v in pairs(self.Data.Signin) do
		if v==tonumber(day) then
			--已经签到过了
			self:SendOperaRes(2,1)
			return;
		end
	end
	
	--检查是否需要月光宝盒
	if day == dwDay then 
		--可以签到
		if self:Signin(dwDay) then
			self:SendOperaRes(2,0)
		end
	else
		--检查是否有足够的月光宝盒
		local sysItem =	self:GetPlayer():GetSystem("CItemSystem")
		local isEnough, _  = sysItem:CheckDelEnumItemInPacketCond(RepairSignin.itemEnumId, RepairSignin.itemCount)
		if isEnough then
			sysItem:DelEnumItemInPacket(RepairSignin.itemEnumId, RepairSignin.itemCount, false, _G.ItemSysOperType.TimeReward)
			--可以签到
			if self:Signin(day) then
				self:SendOperaRes(2,0)
			end
		else
			return;
		end
	end
end

--全部补签
function CTimeRewardSystem:OnRecvAllSignin()
	--print("=====CTimeRewardSystem OnRecvAllSignin ======")
	--table.print(self.Data.Signin)
	--计算当前可以补签的天数
	local _,_,dwDay = CTimeFormat:mtodate(GetCurTime(), true,true)
	local canRepairDaysCount = dwDay - self.Data.dwCanSigninStartTime + 1 - #self.Data.Signin
	--如果可补签天数为0 直接返回
	if canRepairDaysCount == 0 then
		return;
	end
	local isTodaySigned = false;
	
	for k,v in pairs(self.Data.Signin) do
		if v == tonumber(dwDay) then
			--今天已经签到过了 签到今天不需要月光宝盒
			isTodaySigned = true;
		end
	end
	
	if not isTodaySigned then
		canRepairDaysCount = canRepairDaysCount - 1;
	end
	
	if canRepairDaysCount == 0 then
		return;
	end
	
	--检查是否有足够的月光宝盒
	local sysItem =	self:GetPlayer():GetSystem("CItemSystem")
	local isEnough, _  = sysItem:CheckDelEnumItemInPacketCond(RepairSignin.itemEnumId, RepairSignin.itemCount * canRepairDaysCount)
	if isEnough then
		sysItem:DelEnumItemInPacket(RepairSignin.itemEnumId, RepairSignin.itemCount * canRepairDaysCount, false, _G.ItemSysOperType.TimeReward);
	else
		return;
	end
	
	--现在可以把今天之前的所有日期置为已经签到
	self.Data.Signin = {}
	for k = self.Data.dwCanSigninStartTime, dwDay - 1 do
		table.insert(self.Data.Signin,tonumber(k))
	end
	
	if isTodaySigned then
		table.insert(self.Data.Signin,tonumber(dwDay))
	end
	
	self.Data.dwLastSigninTime = GetCurTime()
	self:SendOperaRes(2,0)
	self:DBUpdate()
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventDaySign,1)
end
--领取登陆奖励
function CTimeRewardSystem:OnRecvGetLogin(dwIndex)
	if not (self.Data.LoginReward[dwIndex] == 1) then
		--不能领取
		self:SendOperaRes(4,2)
		return;
	end
	--可以领取
	if self:GiveLogin(dwIndex) then
		self:SendOperaRes(4,0)
	else
		self:SendOperaRes(4,3)
	end
	self:GetPlayer():GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventRewardLogin,1)
end
-----------------------------------------
--发送

--所有数据
function CTimeRewardSystem:SendAllData()
	local objPlayer = self:GetPlayer();
	objPlayer.GSAllTimeRewardDataMsg{Data = self.Data}
	--print("=====CTimeRewardSystem SendAllData ======")
	--table.print(self.Data.Signin)
end

--操作结果
function CTimeRewardSystem:SendOperaRes(dwType,dwRes)
	local objPlayer = self:GetPlayer();
	local Info = {}
	if dwRes == 0 then
		if dwType == 1 then
			Info[1] = self.Data.dwWeekMoneyTime
		elseif dwType == 2 then
			Info = self.Data.Signin
		elseif dwType == 3 then
			Info = self.Data.SigninReward
		elseif dwType == 4 then
			Info = self.Data.LoginReward
		end
	end
	objPlayer.GSTimeRewardOperaResMsg{
		Type = dwType;
		Res = dwRes;
		Data = Info;
	}
end
---------------------------------------------
function CTimeRewardSystem:DBInsert()
	self.objDBQuery:Insert()
end
function CTimeRewardSystem:DBUpdate()
	if self.Data.bErr then 
		--print("===CTimeRewardSystem DBUpdate err return====")
		return 
	end;
	self:Pack()
	self.objDBQuery:Update(self.Data)
end

function CTimeRewardSystem:DBUpdateLoginTime()
	if self.Data.bErr then 
		--print("===CTimeRewardSystem DBUpdate err return====")
		return 
	end;
	local Info = {}
	Info.dwWeekLoginTime = self.Data.dwWeekLoginTime
	self.objDBQuery:Update(Info)
end















