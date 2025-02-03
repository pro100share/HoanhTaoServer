--[[
	曲莹
	2012-09-20
	宝剑系统
]]
--
define.SetSwordValueMsg
{
	user = NONE,
}
when{ user = NONE }
SetSwordValueMsg = checkUser
when{ }
function SetSwordValueMsg(user)
	local swordSys = user:GetSystem("CSwordSystem");
	if not swordSys then
		return;
	end;
	swordSys:SetSword();
end; 
--请求升阶宝剑
define.RequestUpBaoJianMsg
{
	user = NONE,
	AutoBuy = false,
	UseGold = false,
}
when{ user = NONE }
RequestUpBaoJianMsg = checkUser
when{ }
function RequestUpBaoJianMsg(user, AutoBuy, UseGold)
	local swordSys = user:GetSystem("CSwordSystem");
	if not swordSys then
		return;
	end;
	swordSys:UpBaoJian(AutoBuy,UseGold);
end; 

--查看对方名剑
define.SwordSys_ViewOtherSwordMsg
{
	user = NONE,
	RoleID = 0, 
}
when{ user = NONE }
SwordSys_ViewOtherSwordMsg = checkUser
when{ }
function SwordSys_ViewOtherSwordMsg(user, RoleID)
	local swordSys = user:GetSystem("CSwordSystem");
	if not swordSys then
		return;
	end;
	swordSys:ViewOtherSword(RoleID);
end; 

--请求激活特殊属性卡片
define.RequestActivatePropertyCardMsg
{
	user = NONE,
}
when{ user = NONE }
RequestActivatePropertyCardMsg = checkUser
when{ }
function RequestActivatePropertyCardMsg(user)
	local swordSys = user:GetSystem("CSwordSystem");
	if not swordSys then
		return;
	end;
	swordSys:ActivatePropertyCardSkill();
end; 

-- 开始精练
define.SwordRefineMsg
{
    user = NONE;
	nCount = 1;
}
when{user = NONE}
SwordRefineMsg = checkUser;
when{}
function SwordRefineMsg(user,nCount)
   user:GetSystem("CSwordSystem"):SwordRefine(nCount);
end;




