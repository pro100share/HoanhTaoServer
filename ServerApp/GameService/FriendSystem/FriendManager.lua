--[[
功能：好友系统全局管理器
作者：周兴团
时间：2012-3-5
]]

_G.SWantMarryMessage = {};
function SWantMarryMessage:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--角色ID
	obj.strMessage = ""; 	--结婚信息
	obj.dwTime = 0;			--登记的时间
	obj.objSys = nil;		--记录自己的好友系统
	return obj;
end
_G.CFriendManager = CSingle:new();
CSingleManager:AddSingle(CFriendManager);
CFriendManager.dwTime = 40000;--测试代码

CFriendManager.setPlayerNameToID = {};	--记录玩家名字到RoleID的反查表，玩家上线下线维护

CFriendManager.setRemoteCall = {};	--KEy是GSID ,value是FromID
function CFriendManager:Create()
	self.count = 0;
	self.number = 0;
	self.dwTime = 0;
end
--测试代码，向邮件中保存一些物品
function CFriendManager:GetItemSet()
	local itemIDs = { [5500040]=10,[2100010]=50,[2200010]=50,[1600010]=1,[6101001]=1 };
	local Items = {};
	for k,v in pairs(itemIDs) do
		local item = SItemMessage:new();
		item.dwItemEnum = k;
		item.dwItemNumber = v;
		item.dwLifeTime = -1;
		table.insert( Items, item );
	end
	return Items;
end
function CFriendManager:Update(dwInterval)
	--测试代码
	-- self.dwTime = self.dwTime - dwInterval;
	-- local fSys = self.setFriendSys[1];
	-- if self.dwTime < 0 then
		-- if fSys then
			-- self.dwTime = 10*1000;
			-- local mail = CMail:new();
			-- mail:SetSender( -10086, "系统MM" );
			-- mail:SetReceiver( fSys:GetRoleID(), fSys:GetName() );
			-- mail:SetContent( "大侠你好！", "大侠再见！" );
			-- mail:SetLifeTime( 10*24*3600*1000 );
			-- mail:SetAccessory( 10, 100, 1000, self:GetItemSet() );
			-- CMailManager:SendMail( mail );
		-- else
			-- self.dwTime = 10*1000;
			-- print("---------------------------------", self.dwTime)
		-- end
	-- end
	
	-- self.count = self.count + dwInterval;
	-- self.number = self.number + 1;
	-- if self.count > 10000 then
		-- print("----------------------------------------------");
		-- print("------------------------ 10 second count: " .. self.number);
		-- print("------------------------ online player: " .. #CFriendManager.setFriendSys);
		-- print("----------------------------------------------");
		-- self.count = 0;
		-- self.number = 0;
	-- end
	return true;
end;
function CFriendManager:Destroy()
end;
-----------------------------------------------------------------------------------------------------------------------------------------------
function CFriendManager:AddFriendSystem( mySys )
	local player = mySys:GetPlayer();
	local dwRoleID = player:GetRoleID();
	--记录玩家名字对应RoleID的反查表
	self.setPlayerNameToID[player:GetInfo().szRoleName] = dwRoleID;
end
function CFriendManager:DelFriendSystem( dwRoleID, szRoleName )
	self.setPlayerNameToID[ szRoleName ] = nil;
end
function CFriendManager:GetFriendSystem( dwRoleID )
	local player = CPlayerManager:GetPlayerByRoleID( dwRoleID );
	if player then
		return player:GetSystem("CFriendSystem");
	else
		return nil;
	end
end
--根据玩家名字获得玩家ID，不存在则返回nil
function CFriendManager:QueryID( szRoleName )
	return self.setPlayerNameToID[szRoleName];
end
--通知某一个Player的宴席取消了
function CFriendManager:NotifyHeldBanquet( dwRoleWife, dwRoleHusband, bHeld )
	local dwYanHui = 0;
	if bHeld then
		dwYanHui = 1;
	end
	--发送消息到KS服务器，自己更改了婚宴
	CKernelApp.GSRequestBanquetMsg{ Param = { dwRoleWife, dwRoleHusband, dwYanHui }; };
end
-----------------------------------------------------------------------------------------------------------------------------------------------










