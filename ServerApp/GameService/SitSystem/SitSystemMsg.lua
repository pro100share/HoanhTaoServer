--打坐的相关消息
------
--改变打坐状态，0--站起；1--坐下
define.RequestChangeSitFlagMsg
{
	user = NONE,
	Code = 0,
}
when {user = NONE}
RequestChangeSitFlagMsg = checkUser;
when{}
function RequestChangeSitFlagMsg(user,Code)
	local sitSystem = user:GetSystem("CSitSystem");
	if sitSystem then
		sitSystem:OnChangeSit(Code);
	end
end;

--设置心法
define.SetSitSkillMsg
{
	user = NONE,
	SkillID = 0,
}
when {user = NONE}
SetSitSkillMsg = checkUser;
when{}
function SetSitSkillMsg(user,SkillID)
	local sitSystem = user:GetSystem("CSitSystem");
	if sitSystem then
		sitSystem:OnSetXinfa(SkillID);
	end
end;

--双修的申请
define.RequestDoubleSitMsg
{
	user = NONE,
	RoleID = 0,
}
when {user = NONE}
RequestDoubleSitMsg = checkUser;
when{}
function RequestDoubleSitMsg(user,RoleID)
	local sitSystem = user:GetSystem("CSitSystem");
	if sitSystem then
		sitSystem:OnRequestDouble(RoleID);
	end
end;

--申请双修的回应，Code：0--拒绝；1--同意
define.ResultDoubleSitMsg
{
	user = NONE,
	RoleID = 0,
	Code = 0,
}
when {user = NONE}
ResultDoubleSitMsg = checkUser;
when{}
function ResultDoubleSitMsg(user,RoleID,Code)
	local sitSystem = user:GetSystem("CSitSystem");
	if sitSystem then
		sitSystem:OnResultDouble(RoleID,Code);
	end
end;

define.RequestDoubleReadyMsg
{
	user = NONE,
	RoleID = 0,
}
when {user = NONE}
RequestDoubleReadyMsg = checkUser;
when{}
function RequestDoubleReadyMsg(user,RoleID)
	local sitSystem = user:GetSystem("CSitSystem");
	if sitSystem then
		sitSystem:OnDoubleReady(RoleID);
	end
end;

--查找身边打坐的人
define.RequestSearchSitPlayerMsg
{
	user = NONE,
}
when {user = NONE}
RequestSearchSitPlayerMsg = checkUser;
when{}
function RequestSearchSitPlayerMsg(user)
	local sitSystem = user:GetSystem("CSitSystem");
	if sitSystem then
		sitSystem:OnSearchPlayer();
	end
end;

