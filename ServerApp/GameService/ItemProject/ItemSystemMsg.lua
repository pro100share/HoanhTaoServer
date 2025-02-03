------------------------------------
------------------------------------
--道具系统和客户端通信消息定义
--author lkj


--客户端使用了某个物品
define.RequestUseItemMsg
{
	user = NONE,
	ItemID = 0,
	SkipCheck = false;
}
when{ user = NONE }
RequestUseItemMsg = checkUser
when{}
function RequestUseItemMsg(user, ItemID, SkipCheck)
	--死人不允许使用道具
	if user:IsDead() then
		user.OnItemUseResultMsg
		{
			ItemID = ItemID;
			Code = 1;
		};
		return;
	end
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	local res = objItemSys:UseItem(ItemID, SkipCheck);
	
	local dwCode = 1;
	if res then
		dwCode = 0;
	end
	
	user.OnItemUseResultMsg
	{
		ItemID = ItemID;
		Code = dwCode;
	};
end

--客户端批量使用了某个物品
define.RequestMassUseItemMsg
{
	user = NONE,
	Itemid = 0,            -----物品实例id
	Num = 0,             -----批量使用物品数量
}
when{ user = NONE }
RequestMassUseItemMsg = checkUser
when{}
function RequestMassUseItemMsg(user, Itemid, Num)
	if user:IsDead() then
		return;
	end
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:MassUseItem(Itemid,Num);
end

--客户端请求扩展容器，背包或者仓库
define.RequestExtendHolderMsg
{
	user = NONE,
	Position = 0,		--申请扩展的地方，enItemPosition.ePacket或者enItemPosition.eStorage
}
when{ user = NONE }
RequestExtendHolderMsg = checkUser
when{}
function RequestExtendHolderMsg(user, Position)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:TryExtendHolder(Position);
end



--客户端请求存款
define.RequestSavingMsg
{
	user = NONE,
	Money = 0,		--保存的金钱数目，从背包中扣除相应的数目，保存到仓库中
}
when{ user = NONE }
RequestSavingMsg = checkUser
when{}
function RequestSavingMsg(user, Money)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:SaveMoney(Money);
end


--客户端请求取款
define.RequestTakingMsg
{
	user = NONE,
	Money = 0,		--保存的金钱数目，从仓库中扣除相应的数目，保存到背包中
}
when{ user = NONE }
RequestTakingMsg = checkUser
when{}
function RequestTakingMsg(user, Money)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:TakeMoney(Money);
end



--客户端删除了某个物品
define.RequestDeleteItemMsg
{
	user = NONE,
	ItemID = 0,
}
when{ user = NONE }
RequestDeleteItemMsg = checkUser
when{}
function RequestDeleteItemMsg(user, ItemID)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:DelObjItem(ItemID, _G.ItemSysOperType.Destroy);
end


--客户端拆分了某个物品
define.RequestSplitItemMsg
{
	user = NONE,
	ItemID = 0,
	SplitNum = 0,
}
when{ user = NONE }
RequestSplitItemMsg = checkUser
when{}
function RequestSplitItemMsg(user, ItemID, SplitNum)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:SplitItem(ItemID, SplitNum);
end



--客户端移动了某个物品
define.IS_MoveItemMsg
{
	user = NONE,
	ItemID = 0,
	ToHolder = 0,
	ToSlot = 0,
}
when{ user = NONE }
IS_MoveItemMsg = checkUser
when{}
function IS_MoveItemMsg(user, ItemID, ToHolder, ToSlot)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	if ToSlot == 0 then ToSlot = nil end;
	objItemSys:TryMoveItemToHolderSlot(ItemID, ToHolder, ToSlot);
end



--客户端整理背包
define.IS_PackUpRequestMsg
{
	user = NONE,
	HolderClass = _G.enItemPosition.ePacket,
}
when{ user = NONE }
IS_PackUpRequestMsg = checkUser
when{}
function IS_PackUpRequestMsg(user, HolderClass)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:TryPackUpHolder(HolderClass);
end




-----------------------------------藏宝图--------------------------------------
--（藏宝图）更新ItemDoodle
define.UpdataItemDoodleMsg
{
	user = NONE,
	dwInstID = 0,
	szDoodle = '',
}
when{ user = NONE }
UpdataItemDoodleMsg = checkUser
when{}
function UpdataItemDoodleMsg(user,dwInstID,szDoodle)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:UpdataItemDooble(dwInstID,szDoodle);
end

--（藏宝图）完成
define.CompleteTreasrueMapMsg
{
	user = NONE,
	dwInstID = 0,
	tPos = {},
}
when{ user = NONE }
CompleteTreasrueMapMsg = checkUser
when{}
function CompleteTreasrueMapMsg(user,dwInstID,tPos)
	local objItemSys = user:GetSystem("CItemSystem");
	if not objItemSys then return end
	objItemSys:CompleteTreasrueMap(dwInstID,tPos);
end

--（藏宝图）剩余次数请求
define.TreasrueMapOnDayUseNumMsg
{
	user = NONE,
}
when{ user = NONE }
TreasrueMapOnDayUseNumMsg = checkUser
when{}
function TreasrueMapOnDayUseNumMsg(user)
	local objSysVip = user:GetSystem('CVipSystem');
	local objSysRefresh = user:GetSystem('CRefreshSystem');
	if objSysVip and objSysRefresh then
		local dwNumber = nil;
		if objSysVip:isVip() then
			dwNumber = objSysRefresh:GetData(1002);
		else
			dwNumber = objSysRefresh:GetData(1001);
		end
		user.OnTreasrueMapOnDayUseNumMsg{dwOnDayUseNum = dwNumber};
	end
end

