--[[
功能：闭关系统
作者：刘炜
时间：2012-2-8
]]

_G.CMuseSystem = {};



---------------------------------------------------------------------------------------------------------------------------------

function CMuseSystem:new()
	local obj = CSystem:new("CMuseSystem");
	obj.dwMuseBegin = 0; --闭关的开始时间
	
	obj.dwBeInjectCount = 0;	--被灌注的总次数
	obj.dwAddMuseCount = 0;	--目前可以领取的灌注次数
	
	obj.dwMyInjectExp = 0;	--灌注别人使自己增加经验的次数
	obj.dwGiftCount = 0;		--已领奖次数
	
	obj.setMyLog = {};		--被灌注的LOG
	
	for i,v in pairs(CMuseSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CMuseSystem:Create()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CMuseSystemDB:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;

	local tbinfo = objPlayer:GetLineData("CMuseSystem")[1];
	
	local Data = tbinfo[1];
	self.dwMuseBegin = Data[1];
	
	self.dwBeInjectCount = Data[2];
	self.dwAddMuseCount = Data[3];
	self.dwMyInjectExp = Data[4];
	self.dwGiftCount = Data[5];
	
	for k,v in pairs(tbinfo[2])do
		table.insert(self.setMyLog,v)
	end
	
	return true;
end;

function CMuseSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	local Data = {};
	Data[1] = self.dwMuseBegin;
	Data[2] = self.dwBeInjectCount;
	Data[3] = self.dwAddMuseCount;
	Data[4] = self.dwMyInjectExp;
	Data[5] = self.dwGiftCount;
	
	local tbInfo = {};
	tbInfo[1] = Data;
	tbInfo[2] = self.setMyLog;
	objPlayer:SetLineData("CMuseSystem",tbInfo);
end;

function CMuseSystem:Destroy()
	if self.objDBQuery then
		self.objDBQuery = nil;
	end;
end;

function CMuseSystem:OnEnterScene()
	self:SendMuseTime();
	self:SendMyInjectInfo();
end;

--发送当前闭关时间
function CMuseSystem:SendMuseTime()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	local dwNowTime = GetCurTime();
	local dwMuseDis = dwNowTime - self.dwMuseBegin;
	dwMuseDis = dwMuseDis/1000;--客户端单位：秒
	dwMuseDis = math.min(dwMuseDis,MuseConfig.dwMaxMuseTime);
	objPlayer.OnReadMuseTimeMsg
	{
		MuseTime = dwMuseDis;
		AddInjectCount = self.dwAddMuseCount;
	};
end;

--领取闭关奖励
function CMuseSystem:GetMuseValue(isDouble)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	
	if isDouble then
		--判断双倍道具
		local dwNum, _, _ = objPlayer:GetSystem("CItemSystem"):GetEnumItemNumInPacket(MuseConfig.dwDoubleItem);
		if dwNum == 0 then
			return false;
		end
	end
	
	local dwNowTime = GetCurTime();
	local dwMuseDis = dwNowTime - self.dwMuseBegin;
	dwMuseDis = dwMuseDis/1000;--客户端单位：秒
	dwMuseDis = dwMuseDis + self.dwAddMuseCount*InjectConfig.dwInjectTime;
	dwMuseDis = math.min(dwMuseDis,MuseConfig.dwMaxMuseTime);
	
	self.dwAddMuseCount = 0;
	
	local isVip = objPlayer:GetSystem("CVipSystem"):isVip();
	
	--添加经验值参数 mod by gzy
	local dwLevel = self:GetPlayer():GetInfo().dwLevel
	local dwMaxExp = RoleUpLevelConfig[dwLevel+1]
	local tInfo = MuseConfig:CountMuseValue(dwMuseDis,isVip,isDouble,dwLevel,dwMaxExp);
	
	local fPer = objPlayer:GetAddicted();
	--添加
	local five = self:GetPlayer():GetSystem("CFiveElemSystem");
	tInfo.dwZhenqi = tInfo.dwZhenqi * fPer;
	--five:ChangeAttrAll(tInfo.dwZhenqi);
	local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = five:GetElemValue()	
	five:ChangeAttr('dwMetalValue', tInfo.dwZhenqi );
	five:ChangeAttr('dwWoodValue', tInfo.dwZhenqi );
	five:ChangeAttr('dwWaterValue', tInfo.dwZhenqi );
	five:ChangeAttr('dwFireValue', tInfo.dwZhenqi );
	five:ChangeAttr('dwEarthValue', tInfo.dwZhenqi );
		
	local setData = {
		[1] = {dwCurrent = uItemGold, dwChange = tInfo.dwZhenqi};
		[2] = {dwCurrent = uItemWood, dwChange = tInfo.dwZhenqi};
		[3] = {dwCurrent = uItemWater, dwChange = tInfo.dwZhenqi};
		[4] = {dwCurrent = uItemFire, dwChange = tInfo.dwZhenqi};
		[5] = {dwCurrent = uItemEarth, dwChange = tInfo.dwZhenqi};
	}
	CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.MuseSystem)	
	
	
	tInfo.dwExp = tInfo.dwExp * fPer;
	objPlayer:AddExp(tInfo.dwExp);
	--提示
	
	--扣除道具
	if isDouble then
		objPlayer:GetSystem("CItemSystem"):DelEnumItemInPacket(MuseConfig.dwDoubleItem, 1, false, _G.ItemSysOperType.Muse);
	end
	
	--刷新界面
	objPlayer.OnReadMuseTimeMsg{MuseTime = 0};
	self.dwMuseBegin = GetCurTime();
	self.objDBQuery:SaveMuseTime(self.dwMuseBegin);
	
	objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(enumPlayerEventType.EventMuse);
	
	return true;
end;

-------------------------------------------------------------------------------
--灌注其他人
function CMuseSystem:InjectMuse(dwRoleID)
	local objSelf = self:GetPlayer();
	
	--换线过程中，不能灌注
	if objSelf.dwChangeToLineID then
		objSelf.OnInjectResultMsg
		{
			SuccFlag = 0;
			Value = 1;
		}
		return;
	end
	
	--首先看是不是我的好友
	local objFriendSys = objSelf:GetSystem("CFriendSystem");
	if not objFriendSys then
		objSelf.OnInjectResultMsg
		{
			SuccFlag = 0;
			Value = 1;
		}
		return;
	end
	if not objFriendSys:IsCanInject(dwRoleID) then
		objSelf.OnInjectResultMsg
		{
			SuccFlag = 0;
			Value = 2;
		}
		return;
	end
	
	local args = {objSelf:GetRoleID(),objSelf:GetName()};
	local cbfunc = function(_, result, _)
		if result == -1 then
			--通知客户端，玩家已经下线
			objSelf.OnInjectResultMsg
			{
				SuccFlag = 0;
				Value = 3;
			}
		else
			--执行完成，加经验
			local dwExp = InjectConfig.funcInject(objSelf:GetLevel(),0,self.dwMyInjectExp);
			if dwExp > 0 then
				objSelf:AddExp(dwExp);
				self.dwMyInjectExp = self.dwMyInjectExp + 1;
				
				--存档
				self.objDBQuery:SaveMyInjectInfo();
			end
			
			objFriendSys:SetFriendInject(dwRoleID);
			
			--通知客户端
			objSelf.OnInjectResultMsg
			{
				SuccFlag = 1;
				Value = dwExp;
			}
		end;
	end;
	GSRemoteCall(dwRoleID,"CMuseSystem","BeInject",args,cbfunc);
	
	objSelf:GetSystem("CPlayerEventCenterSystem"):DoEvent(enumPlayerEventType.EventInject);
end;

--被人灌注
function CMuseSystem:BeInject(dwRoleID,szRoleName)
	local objSelf = self:GetPlayer();
	
	local isVip = objSelf:GetSystem("CVipSystem"):isVip();
	local dwMyMax = InjectConfig.funcBeInjectMax(isVip);
	
	if self.dwBeInjectCount >= dwMyMax then
		return;
	end
	
	self.dwBeInjectCount = self.dwBeInjectCount + 1;
	self.dwAddMuseCount = self.dwAddMuseCount + 1;
	
	--通知客户端
	objSelf.BeInjectMsg
	{
		RoleID = dwRoleID;
		RoleName = szRoleName;
		Time = GetCurTime();
	}
	
	--保存LOG
	local tbInfo = {};
	tbInfo.dwRoleID = dwRoleID;
	tbInfo.szRoleName = szRoleName;
	tbInfo.dwTime = GetCurTime();
	
	table.insert(self.setMyLog,tbInfo);
	
	--DB
	self.objDBQuery:SaveBeInject(tbInfo);
end;

--领奖
function CMuseSystem:GetMyGift()
	local dwMyCanGet = math.floor(self.dwBeInjectCount/InjectConfig.dwRewardCountNeed);
	-- print("===CMuseSystem:GetMyGift===",self.dwBeInjectCount,dwMyCanGet)
	if self.dwGiftCount >= dwMyCanGet then
		return;
	end
	
	local objItemSys = self:GetPlayer():GetSystem("CItemSystem");
	if objItemSys then
		objItemSys:AddBindGold(InjectConfig.dwRewardLiJin, _G.ItemSysOperType.Muse);
		self.dwGiftCount = self.dwGiftCount + 1;
		self.objDBQuery:SaveGiftInfo();
	end
end;

--自己的灌注信息
function CMuseSystem:SendMyInjectInfo()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	objSelf.OnMyInjectInfoMsg
	{
		BeInjectCount = self.dwBeInjectCount;
		GiftCount = self.dwGiftCount;
		LogList = self.setMyLog;
	}
end;

--清空灌注相关的信息
function CMuseSystem:ClearInjectInfo()
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local objFriendSys = objSelf:GetSystem("CFriendSystem");
	if objFriendSys then
		objFriendSys:ClearAllInject();
	end
	
	self.dwBeInjectCount = 0;
	
	self.dwMyInjectExp = 0;
	self.dwGiftCount = 0;
	
	self.setMyLog = {};
	
	objSelf.OnClearAllInfoMsg{};
end;

--查看角色的闭关信息
function CMuseSystem:GetRoleInjectInfo(dwRoleID)
	local objSelf = self:GetPlayer();
	--首先看是不是我的好友
	local objFriendSys = objSelf:GetSystem("CFriendSystem");
	if not objFriendSys then
		objSelf.OnRoleMuseInfoMsg{};
		return;
	end
	
	if not objFriendSys:IsHaveInFriend(dwRoleID) then
		objSelf.OnRoleMuseInfoMsg{};
		return;
	end
	
	local cbfunc = function(_, result, _)
		if result == -1 then
			--通知客户端，玩家已经下线
			objSelf.OnRoleMuseInfoMsg{};
		end;
	end;
	GSRemoteCall(dwRoleID,"CMuseSystem","GetInjectInfo",{objSelf:GetRoleID()},cbfunc);
end;

function CMuseSystem:GetInjectInfo(dwRoleID)
	local tbInfo = {};
	tbInfo.dwRoleID = self:GetPlayer():GetRoleID();
	tbInfo.dwBeInjectCount = self.dwBeInjectCount;
	tbInfo.dwMuseTime = GetCurTime() - self.dwMuseBegin;
	tbInfo.dwAddCount = self.dwAddMuseCount;
	
	local cbfunc = function(_, result, _)
		
	end;
	GSRemoteCall(dwRoleID,"CMuseSystem","SendInjectInfo",{tbInfo},cbfunc);
end;

function CMuseSystem:SendInjectInfo(tbInfo)
	local objSelf = self:GetPlayer();
	
	objSelf.OnRoleMuseInfoMsg
	{
		RoleID = tbInfo.dwRoleID;
		InjectCount = tbInfo.dwBeInjectCount;
		MuseTime = math.floor(tbInfo.dwMuseTime/1000);
		AddInjectCount = tbInfo.dwAddCount;
	}
end;
