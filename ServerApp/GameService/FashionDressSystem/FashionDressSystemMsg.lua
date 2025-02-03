--时装的相关消息
------
--时装操作(购买，穿戴，脱下（只脱外形），续时)    DressID--时装的配置ID,  OperType--购买类型  OperCode--操作码
define.FashionDressOperMsg
{
	user = NONE,
	DressID = 0,
	OperType = 0,
	OperCode = 0,
}
when {user = NONE}
FashionDressOperMsg = checkUser;
when{}
function FashionDressOperMsg(user,DressID,OperType,OperCode)
	local fashionDressSystem = user:GetSystem("CFashionDressSystem");
	if fashionDressSystem then
		if OperType == FashionDressConfig.OperMsgType.Buy then
			fashionDressSystem:Buy(DressID,OperCode);
		elseif OperType >= FashionDressConfig.OperMsgType.Wear and OperType <= FashionDressConfig.OperMsgType.Hide then
			fashionDressSystem:EquipOperator(DressID,OperType,OperCode,true);
		end
	end
end;

--存取放入衣柜
define.FashionChangeBoxListMsg
{
	user = NONE,
	nDressID = 0,
	bPut = false,
}
when {user = NONE}
FashionChangeBoxListMsg = checkUser;
when{}
function FashionChangeBoxListMsg(user,nDressID,bPut)
	local fashionDressSystem = user:GetSystem("CFashionDressSystem");
	fashionDressSystem:OnReqChangeBoxList(nDressID,bPut)
end;

--增加衣柜上限
define.FashionDressAddBoxNumMsg
{
	user = NONE,
}
when {user = NONE}
FashionDressAddBoxNumMsg = checkUser;
when{}
function FashionDressAddBoxNumMsg(user)
	local fashionDressSystem = user:GetSystem("CFashionDressSystem");
	fashionDressSystem:AddBoxNum()
end;


--化身丹升级 
define.FashionDressUpLevelMsg
{
	user = NONE,
	Count = 0,
}
when {user = NONE}
FashionDressUpLevelMsg = checkUser;
when{}
function FashionDressUpLevelMsg(user, Count)
	local fashionDressSystem = user:GetSystem("CFashionDressSystem");
	if fashionDressSystem then
		fashionDressSystem:UpLevel(Count);
	end
end


--客户端提出查看指定玩家功法领悟进度
define.FashionDressSys_ViewOtherProcessMsg
{
	user = NONE,
	RoleID = 0,
}
when{user = NONE}
FashionDressSys_ViewOtherProcessMsg = checkUser
when{}
function FashionDressSys_ViewOtherProcessMsg(user, RoleID)
	local fashionDressSystem = user:GetSystem("CFashionDressSystem");
	if not fashionDressSystem then
		_info("can not find user's CKungFuSystem by FashionDressSys_ViewOtherProcessMsg");
		return;
	end;
	fashionDressSystem:ViewOtherProcess(RoleID);
end;



-------广播 购买时装
define.FashionDressBuyBoardcastMsg
{
	RoleId = 0,
    RoleName = "",
    DressId = 0,
}
when{ }
function FashionDressBuyBoardcastMsg(RoleId, RoleName, DressId)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
			table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "FashionDressBuyBoardcastMsg", {RoleId = RoleId, RoleName = RoleName, DressId = DressId});
end

--广播  化身丹消息
define.FashionDressHuaShenDanBoardcastMsg
{
	RoleId = 0,
    RoleName = "",
    Level = 0,
}
when{ }
function FashionDressHuaShenDanBoardcastMsg(RoleId, RoleName, Level)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
			table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "FashionDressHuaShenDanBoardcastMsg", {RoleId = RoleId, RoleName = RoleName, Level = Level});
end


