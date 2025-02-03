--[[
功能：防沉迷系统单件管理器
作者：周兴团
时间：2012-5-4
]]

_G.SAddictedTime = {};
function SAddictedTime:new( t )
	local obj = t or {};
	obj.dwAccountID = 0;		--玩家的账号ID，防沉迷是对账号进行计时
	obj.dwOnLineTime = 0;		--玩家累计上线的时间
	obj.dwOffLineTime = 0;		--玩家累计下线的时间
	--obj.bOnLine = true;			--记录玩家是否在线，在线就对在线进行计时；离线就对离线进行计时
	obj.dwTips = -1;			--记录上一个提示信息的下标0~6或者更多，只通知一次
	obj.objAddictedSys = nil;	--记录玩家的防沉迷系统对象；上线记录、下线移除。
	obj.bIsClientReady = false;
	return obj;
end

_G.CAvoidAddictedManager = CSingle:new();
CSingleManager:AddSingle(CAvoidAddictedManager,true);

CAvoidAddictedManager.setIDToPlayer = {};	--记录玩家账号ID到当前计时器的对应
CAvoidAddictedManager.dwCheckTimer = 0;		--防沉迷更新计时器的计时

function CAvoidAddictedManager:Create()
end
--更新防沉迷列表中的数据，根据时间规则进行提示
function CAvoidAddictedManager:Update(dwInterval)
	if(_G.KoreaAvoidAddicted) then
		return true;
	end
	--dwInterval = dwInterval*60*4;
	--更新计时操作，在达到时间间隔之前不会更新列表的时间
	self.dwCheckTimer = self.dwCheckTimer + dwInterval
	if self.dwCheckTimer < AvoidAddictedConfig.ServerCheck then
		return true;
	end
	--对列表的计时器进行更新操作
	for dwAccountID,objTimer in pairs(self.setIDToPlayer) do
		--对玩家在线或者离线时间进行计时
		if objTimer.objAddictedSys then	--玩家在线
			objTimer.dwOnLineTime = objTimer.dwOnLineTime + self.dwCheckTimer;
		else			--玩家离线
			objTimer.dwOffLineTime = objTimer.dwOffLineTime + self.dwCheckTimer;
		end
		--判断是否到达了当前Tips的通知时间，达到的话同时更改玩家的收益比例
		if objTimer.bIsClientReady then
			self:NotifyIncomePercent( objTimer );
		end
		--检查玩家离线时间，准备清零操作
		self:CheckOffLineTime( objTimer );
	end
	--重置计时
	self.dwCheckTimer = 0;
	return true;
end;
function CAvoidAddictedManager:Destroy()
end;
---------------------------------------------------------------------------------------------------------------------------------------
--判断当前状态是否处于疲劳状态或不健康状态
function CAvoidAddictedManager:IsAccountInAddicted( dwAccountID )
	if self.setIDToPlayer[dwAccountID] then
		if self.setIDToPlayer[dwAccountID].dwOnLineTime >= AvoidAddictedConfig.NormalTime then
			return true;
		end
	end
	return false;
end
--获取当前账号的防沉迷时间；没有进入防沉迷则返回nil；进入防沉迷状态则返回当前累计时间和清空防沉迷的离线时间
function CAvoidAddictedManager:GetAccountAddictedTime( dwAccountID )
	local objTimer = self.setIDToPlayer[dwAccountID];
	if not objTimer then
		return nil;
	end
	return objTimer.dwOffLineTime, AvoidAddictedConfig.ClearTime;
end

--获取提示信息，只在客户端初始化之后获取
function CAvoidAddictedManager:GetNotifyIncome( dwAccountID )
	local objTimer = self.setIDToPlayer[dwAccountID];
	--print("Client GetNotifyIncome " .. dwAccountID);
	if not objTimer then return end;
	--print("Client GetNotifyIncome Found " .. dwAccountID);
	objTimer.bIsClientReady = true;
	if objTimer.dwTips < 0 then
		objTimer.dwTips = 0;
		if objTimer.objAddictedSys then
			objTimer.objAddictedSys:NotifyIncome( AvoidAddictedConfig[1].income );
			--提示玩家，已经被列入防沉迷
			objTimer.objAddictedSys:SynchronizeNotify( 0, objTimer.dwOnLineTime );
		end
		return true;
	else
		--同步玩家的在线时间，但是不提示玩家信息--更改成提示文字特效--5-17--周兴团
		if objTimer.objAddictedSys then
			local tips = 0;
			if objTimer.dwOnLineTime > AvoidAddictedConfig.NormalTime then
				tips = objTimer.dwTips;
			end
			objTimer.objAddictedSys:SynchronizeNotify( tips, objTimer.dwOnLineTime );
		end
	end
end
--通知其它系统当前的防沉迷信息，根据累计在线时间传递参数值
--bNotifyNow  用于玩家重新登录时候的设置值操作
function CAvoidAddictedManager:NotifyIncomePercent( objTimer, bNotifyNow )
	-- if self:GetNotifyIncome( objTimer.dwAccountID ) then
		-- return;
	-- end
	if objTimer.dwTips >= 0 and objTimer.dwTips < AvoidAddictedConfig.TipsCount then
		local index = objTimer.dwTips + 1;
		if objTimer.dwOnLineTime >= AvoidAddictedConfig[index].point or bNotifyNow then
			if objTimer.dwOnLineTime >= AvoidAddictedConfig[index].point then
				objTimer.dwTips = index;
			end
			if objTimer.objAddictedSys then
				objTimer.objAddictedSys:NotifyIncome( AvoidAddictedConfig[index].income );
				--print("NotifyIncomePercent ", AvoidAddictedConfig[index].income);
				--提示玩家，已经被列入防沉迷
				if not bNotifyNow then
					objTimer.objAddictedSys:SynchronizeNotify( index, objTimer.dwOnLineTime );
				end
			end
		end
	elseif objTimer.dwTips >= AvoidAddictedConfig.TipsCount then
		local dwLast = AvoidAddictedConfig[AvoidAddictedConfig.TipsCount].point + 
			AvoidAddictedConfig.TipsGap * (objTimer.dwTips - AvoidAddictedConfig.TipsCount);
		if objTimer.dwOnLineTime > dwLast + AvoidAddictedConfig.TipsGap or bNotifyNow   then
			if objTimer.dwOnLineTime > dwLast + AvoidAddictedConfig.TipsGap then
				objTimer.dwTips = objTimer.dwTips + 1;
			end
			if objTimer.objAddictedSys then
				objTimer.objAddictedSys:NotifyIncome( AvoidAddictedConfig[AvoidAddictedConfig.TipsCount].income );
				--提示玩家，已经被列入防沉迷
				if not bNotifyNow then
					objTimer.objAddictedSys:SynchronizeNotify( objTimer.dwTips, objTimer.dwOnLineTime );
				end
			end
		end
	end
end
--检查玩家离线时间，准备清零操作
function CAvoidAddictedManager:CheckOffLineTime( objTimer )
	if objTimer.dwOffLineTime >= AvoidAddictedConfig.ClearTime then
		--如果玩家并不在线，那么将从列表中移除；在线则重置计时器
		if objTimer.objAddictedSys then
			objTimer.dwOffLineTime = 0;
			objTimer.dwOnLineTime = 0;
			objTimer.dwTips = 0;
		else
			self:DeleteFromList( objTimer.dwAccountID );
		end
	end
end
--记录防沉迷系统，系统在创建的时候会判断是否列入防沉迷列表，才加入到管理器
function CAvoidAddictedManager:AddAddictedSystem( objSys )
	local dwAccountID = objSys:GetPlayer():GetAccountID();
	--已经存在于列表中，通知其它系统当前的防沉迷信息
	local objTimer = self.setIDToPlayer[dwAccountID];
	if objTimer then
		objTimer.objAddictedSys = objSys;--记录系统信息
		self:CheckOffLineTime( objTimer ); 
		objTimer.dwOffLineTime = 0; --清空离线计时
		return self:NotifyIncomePercent( objTimer, true );
	end
	--添加到列表
	objTimer = SAddictedTime:new();
	objTimer.objAddictedSys = objSys;
	objTimer.dwAccountID = dwAccountID;
	objTimer.dwTips = -1;
	--添加到列表
	self.setIDToPlayer[dwAccountID] = objTimer;
	--提示玩家，已经被列入防沉迷
	--objSys:SynchronizeNotify( 0 );--等待客户端自己来取提示信息
end
--删除防沉迷系统
function CAvoidAddictedManager:DelAddictedSystem( dwAccountID )
	local objTimer = self.setIDToPlayer[dwAccountID];
	if objTimer then
		objTimer.objAddictedSys = nil;
		objTimer.bIsClientReady = false;
	end
end
--将防沉迷计时从列表中移除
function CAvoidAddictedManager:DeleteFromList( dwAccountID )
	self.setIDToPlayer[dwAccountID] = nil;
end
--判断玩家的系统是否已经注册进管理器
function CAvoidAddictedManager:IsPlayerIn(dwAccountID)
	local objTimer = self.setIDToPlayer[dwAccountID];
	if objTimer and objTimer.objAddictedSys then
		return true;
	else
		return false;
	end
end

function CAvoidAddictedManager:AddRoleByInfo(objSys,Data)
	local dwAccountID = objSys:GetPlayer():GetAccountID();
	
	--添加到列表
	local objTimer = SAddictedTime:new();
	objTimer.objAddictedSys = objSys;
	objTimer.dwAccountID = dwAccountID;
	objTimer.dwTips = Data.dwTips;
	
	objTimer.dwOnLineTime = Data.dwOnLineTime or 0;
	objTimer.dwOffLineTime = Data.dwOffLineTime or 0;
	
	--添加到列表
	self.setIDToPlayer[dwAccountID] = objTimer;
end;
























