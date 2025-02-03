
--[[
���ܣ����ĳ�ͷ��Ϣ�ࣨ��������
���ߣ�κ��
ʱ�䣺2013-8-22
--]]



--��ҿ�ʼ�ڱ�
define.FrenzyHoe_StartDigTreasureMsg
{
	user = NONE, 
	HoeItemId = 0, ----�ڱ��صĳ�ͷid
}
when{ user = NONE }
FrenzyHoe_StartDigTreasureMsg = checkUser
when{ }
function FrenzyHoe_StartDigTreasureMsg(user,HoeItemId)
    if user:IsDead() then
		return;
	end
	local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
	if not frenzyHoeSystem then
		return;
	end;
	frenzyHoeSystem:StartDigTreasure(HoeItemId);  ---��ʼ�ڱ�
end

----�����ȡ�ڱ�����
define.FrenzyHoe_GetFrenzyHoeRewardMsg
{
	user = NONE, 
}
when{ user = NONE }
FrenzyHoe_GetFrenzyHoeRewardMsg = checkUser
when{ }
function FrenzyHoe_GetFrenzyHoeRewardMsg(user)
    if user:IsDead() then
		return;
	end
	local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
	if not frenzyHoeSystem then
		return;
	end;
	frenzyHoeSystem:GetFrenzyHoeReward();  ---��ȡ�ڱ�����
end

----�ó�ͷ���Ѷ� �һ�������ͷ

define.FrenzyHoe_ExchangeHoeByFriendNumMsg
{
	user = NONE,
	Index = 0;
}
when{ user = NONE }
FrenzyHoe_ExchangeHoeByFriendNumMsg = checkUser
when{ }
function FrenzyHoe_ExchangeHoeByFriendNumMsg(user,Index)
    if user:IsDead() then
		return;
	end
	local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
	if not frenzyHoeSystem then
		return;
	end;
	frenzyHoeSystem:ExchangeHoeByFriendNum(Index);  ---��ȡ������ͷ���ݺ��Ѷ�
end

---ks���� ������������ڱ��¼���Ϣ
define.FrenzyHoe_KSUpdateFrenzyHoeItemInfoMsg
{
	ParamInfo = {},
}
when{ }
function FrenzyHoe_KSUpdateFrenzyHoeItemInfoMsg(ParamInfo)
	----�����ڴ���ֵ
	CFrenzyHoeSystemManager:UpdateDigEvent(ParamInfo)
	CFrenzyHoeSystemManager:UpdateBroadCastInfo(ParamInfo) 
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
		if not frenzyHoeSystem then
			return;
		end;
		frenzyHoeSystem:LoadFrenzyHoeEventInfo(ParamInfo);  ---������������ڱ��¼���Ϣ
	end
end

----�������Ѷ�
define.FrenzyHoe_KSZeroClearFriendNumMsg
{

}
when{ }
function FrenzyHoe_KSZeroClearFriendNumMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
		if not frenzyHoeSystem then
			return;
		end;
		frenzyHoeSystem:ZeroClearFriendNum();  ---�������Ѷ�
	end
end



-----ks����  -----������ݿ����Ƿ��иý�����Ʒ 
define.FrenzyHoe_KSCheckAwardItemIdIsInSqlMsg
{
	RoleID = 0,
	Param = false,
}
when{ }
function FrenzyHoe_KSCheckAwardItemIdIsInSqlMsg(RoleID,Param)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	if(not objPlayer) then
		return;
	end
	local frenzyHoeSys = objPlayer:GetSystem('CFrenzyHoeSystem')
	if(not frenzyHoeSys) then
		return;
	end
	frenzyHoeSys:UpdateFrenzyHoeItemInfo(Param)
end


define.FrenzyHoe_KSGetFrenzyHoeItemInfoMsg
{
	RoleID = 0,
	DigEventInfo = {},
	BroadCastInfo = {},
}
when{ }
function FrenzyHoe_KSGetFrenzyHoeItemInfoMsg(RoleID,DigEventInfo,BroadCastInfo)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID)
	if(not objPlayer) then
		return;
	end
	local frenzyHoeSys = objPlayer:GetSystem('CFrenzyHoeSystem')
	if(not frenzyHoeSys) then
		return;
	end
	frenzyHoeSys:GetFrenzyHoeItemInfo(DigEventInfo,BroadCastInfo)
end
----���һ����ͷ��ȡ����Ʒ ��δ��ȡ���ر�ʱ���ʼ�
define.FrenzyHoe_SendFrenzyHoeAwardToMailMsg
{
	user = NONE, 
}
when{ user = NONE }
FrenzyHoe_SendFrenzyHoeAwardToMailMsg = checkUser
when{ }
function FrenzyHoe_SendFrenzyHoeAwardToMailMsg(user)
	if user:IsDead() then
		return;
	end
	local frenzyHoeSys = user:GetSystem('CFrenzyHoeSystem')
	if(not frenzyHoeSys) then
		return;
	end
	frenzyHoeSys:SendFrenzyHoeAwardToMail()
end


----�һ���ͷ��ȡ��Ʒ�ȸ���
define.KSFrenzyHoeHotUpdateMsg
{
}
when{ }
function KSFrenzyHoeHotUpdateMsg()
	FrenzyHoeConfig:Reload();
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("CFrenzyHoeSystem");
		if not sys then
			return;
		end;
		sys:FrenzyHoeHotUpdate();  ---ͬ���ȸ���
	end
end


----���ȸ���
define.KSClearFrenzyHoeHotUpdateMsg
{
	
}
when{ }
function KSClearFrenzyHoeHotUpdateMsg()
	if(_G.FrenzyHoeConfig) then
		_G.FrenzyHoeConfig.bOpen = false;
	end
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local frenzyHoeSystem = user:GetSystem("CFrenzyHoeSystem");
		if not frenzyHoeSystem then
			return;
		end;
		user.OnSynFrenzyHoeDataMsg{Infos = frenzyHoeSystem:GetFinalExChangeItemConfig()};
	end
end