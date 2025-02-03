--[[
功能：防沉迷系统
作者：周兴团
时间：2012-5-4
]]
--[[
define.RequestAddictedNoticeMsg
{
	user = NONE,
}
when{ user = NONE }
RequestAddictedNoticeMsg = checkUser
when{}
function RequestAddictedNoticeMsg(user)
	local objSys = user:GetSystem("CAvoidAddictedSystem");
	if not objSys then
		print("RoleID: ", user:GetRoleID(), "RequestAddictedNotice");
		return; 
	end;
	objSys:RequestAddictedNotice();
end
--]]
_G.CAvoidAddictedSystem = {};
function CAvoidAddictedSystem:new()
	local obj = CSystem:new("CAvoidAddictedSystem");
	obj.strName = "";	--自己的姓名
	obj.dwRoleID = 0;	--自己的角色ID
	for i,v in pairs(CAvoidAddictedSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
function CAvoidAddictedSystem:Create()
	if(_G.KoreaAvoidAddicted) then
		return true;
	end
	local objPlayer = self:GetPlayer();
	--local objDB = objPlayer:GetDBQuery();
	--如果当前玩家需要被列入防沉迷系统，那么添加到列表
	if objPlayer:IsInAddicted() then
		CAvoidAddictedManager:AddAddictedSystem( self );
	else
		CAvoidAddictedManager:DeleteFromList( self:GetPlayer():GetAccountID() );
	end
	--print("CAvoidAddictedSystem:Create============",objPlayer:IsInAddicted(),objPlayer.dwAdultFlag)
	return true;
end
function CAvoidAddictedSystem:Update(dwInterval)
	return true;
end;
function CAvoidAddictedSystem:Destroy()
	if(_G.KoreaAvoidAddicted) then
		return true;
	end
	--移除当前角色的计时
	CAvoidAddictedManager:DelAddictedSystem( self:GetPlayer():GetAccountID() );
	--CKernelApp.GSAddictedSystemChangeMsg{ _aid=self:GetPlayer():GetAccountID(), Type=0 }
end
--客户端进入游戏登入所有场景之后
function CAvoidAddictedSystem:OnEnterScene()

end;

function CAvoidAddictedSystem:OnChangeLineBegin()
	--获取角色当前的时间信息
	if(_G.KoreaAvoidAddicted) then
		return true;
	end
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local Data = {};
	local objTimer = CAvoidAddictedManager.setIDToPlayer[objSelf:GetAccountID()];
	if objTimer then
		Data.dwOnLineTime = objTimer.dwOnLineTime;
		Data.dwOffLineTime = objTimer.dwOffLineTime;
		Data.dwTips = objTimer.dwTips;
	end
	
	objSelf:SetLineData("CAvoidAddictedSystem",Data);
end;

function CAvoidAddictedSystem:OnChangeLineEnd()
	if(_G.KoreaAvoidAddicted) then
		return true;
	end
	--将时间数据放入管理器
	local objSelf = self:GetPlayer();
	if not objSelf then
		return;
	end
	
	local Data = objSelf:GetLineData("CAvoidAddictedSystem")[1];
	
	if objSelf:IsInAddicted() and Data.dwTips then
		CAvoidAddictedManager:AddRoleByInfo(self,Data);
	end
end;
-----------------------------------------------------------------------------------------------------------------------------
--系统对外接口
--客户端获取防沉迷信息
function CAvoidAddictedSystem:RequestAddictedNotice()
	CAvoidAddictedManager:GetNotifyIncome( self:GetPlayer():GetAccountID() );
end
--更改玩家的收益百分比
function CAvoidAddictedSystem:NotifyIncome( dwValue )
	--print("CAvoidAddictedSystem:NotifyIncome", dwValue);
	self:GetPlayer():UpdateAddicted( dwValue );
end;
--发送提示信息到客户端，0是进入游戏时提示的，1~6是其它防沉迷信息
function CAvoidAddictedSystem:SynchronizeNotify( dwTips, dwGameTime, dwAdultFlag )
	--print("----CAvoidAddictedSystem:SynchronizeNotify: " .. dwTips);
	self:GetPlayer().OnReceiveAddictedNoticeMsg{ Tips = dwTips, GameTime = dwGameTime, AdultFlag = dwAdultFlag  };
	--self:GetPlayer():GetSystem("CFiveElemSystem"):FlushValue();--通知五行系统
end
--取消客户端的防沉迷状态
function CAvoidAddictedSystem:SynchronizeCancel()
	self:GetPlayer().OnCancelAddictedStateMsg{};
end
--更改当前的防沉迷状态
function CAvoidAddictedSystem:ChangeAddicted()
	if self:GetPlayer():IsInAddicted() then
		self:GetPlayer().dwAdultFlag = 1;
		self:NotifyIncome( 1 );
		CAvoidAddictedManager:DeleteFromList( self:GetPlayer():GetAccountID() );
		self:SynchronizeCancel();
	else
		self:GetPlayer().dwAdultFlag = 0;
		CAvoidAddictedManager:AddAddictedSystem( self );
		self:RequestAddictedNotice();
	end
end



















