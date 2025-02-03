--购买物品
define.ServMallBuyItemMsg
{
	user = NONE, 
	Num = -1,
	ItemEnum = -1,
	UnitPrice = -1,
	Type = -1,
}
when{ user = NONE }
ServMallBuyItemMsg = checkUser
when{ }
function ServMallBuyItemMsg(user, Num, ItemEnum, UnitPrice, Type)
    local mallSystem = user:GetSystem("CMallSystem");
	if not mallSystem then
		return;
	end;
	mallSystem:BuyItem(Num, ItemEnum, Type, UnitPrice);
end


--KS发送更改商城数据的信息
define.KSOnChangeMallRequestMsg
{ 
	user = NONE;
	ParamMsg = {};
} 
when{}
function KSOnChangeMallRequestMsg(user,ParamMsg)
    local tChange = {
        tPrice = {},
        tUp = {},
        tDown = {}
    };
    for k, v in pairs(ParamMsg) do
        if not v.sell then
            table.insert(tChange.tPrice, v);
        elseif v.sell == 0 then
            table.insert(tChange.tDown, v);
        else
            table.insert(tChange.tUp, v);
        end
    end

	local isModify = false;
    if next(tChange.tPrice) then
        CMallManager:UpdateItemPrice(tChange.tPrice);
		isModify = true;
    end
    if next(tChange.tUp) or next(tChange.tDown) then
        CMallManager:UpDownItem(tChange.tUp, tChange.tDown);
		isModify = true;
    end
	if isModify then
		CSV.Write(CMallManager.tGoodsFile);
	end
end

-------------------------------------------------------------------------------
--KS初始化限购列表
define.OnKSInitMallListMsg
{
	List = {};
}
when{}
function OnKSInitMallListMsg(List)
	CMallManager:InitMallLimitList(List)
end;

define.OnKSBuyItemResultMsg
{
	RoleID = 0;
	MallID = 0;
	Code = 0;	-- 0--成功；1--没有这个商品；2--已经卖完了
	Number = 0;	-- 购买之后剩余的数量
}
when{}
function OnKSBuyItemResultMsg(RoleID,MallID,Code,Number)
	local objPlayer = CPlayerManager:GetPlayerByRoleID(RoleID);
	if not objPlayer then
		_err("can not find player",RoleID);
		return;
	end
	
	local objMallSys = objPlayer:GetSystem("CMallSystem");
	if objMallSys then
		objMallSys:BuyItemKSResult(MallID,Code,Number);
	end
end;

define.OnKSMallNumberMsg
{
	MallID = 0;
	Number = 0;
}
when{}
function OnKSMallNumberMsg(MallID,Number)
	CMallManager:ChangeMallNumber(MallID,Number)
end


define.OnRequestMallLimitMsg
{
	user = NONE;
}
when{user = NONE}
OnRequestMallLimitMsg = checkUser
when{}
function OnRequestMallLimitMsg(user)
	local objMallSys = user:GetSystem("CMallSystem");
	if objMallSys then
		objMallSys:RequestLimitList();
	end
end;

define.OnRequestBuyItemMsg
{
	user = NONE;
	MallID = 0;
}
when{user = NONE}
OnRequestBuyItemMsg = checkUser
when{}
function OnRequestBuyItemMsg(user,MallID)
	local objMallSys = user:GetSystem("CMallSystem");
	if objMallSys then
		objMallSys:TryBuyLimitItem(MallID);
	end
end;

-------------------------------------------------------------------------------
--KS返回抽取到的列表
define.OnKSReturnLuckDraweListMsg
{
	RoleID = 0;
	List = {};
}
when{}
function OnKSReturnLuckDraweListMsg(RoleID,List)
	local objRole = CMapManager:GetPlayer(RoleID);
	if not objRole then
		return;
	end
	
	local objMallSys = objRole:GetSystem("CMallSystem");
	if objMallSys then
		objMallSys:GetLuckDrawList(List);
	end
end;

--客户端请求现在的列表
define.InitGetLuckDrawMsg
{
	user = NONE;
}
when{user = NONE}
InitGetLuckDrawMsg = checkUser
when{}
function InitGetLuckDrawMsg(user)
	local objMallSys = user:GetSystem("CMallSystem");
	if objMallSys then
		objMallSys:SendCurLuckDrawInfo();
	end
end;

--客户端请求刷新列表
define.RefreshLuckDrawRequestMsg
{
	user = NONE;
}
when{user = NONE}
RefreshLuckDrawRequestMsg = checkUser
when{}
function RefreshLuckDrawRequestMsg(user)
	local objMallSys = user:GetSystem("CMallSystem");
	if objMallSys then
		objMallSys:RefreshLuckDrawRequest();
	end
end;

--客户端请求购买
define.BuyLuckDrawRequestMsg
{
	user = NONE;
	Index = 0;
}
when{user = NONE}
BuyLuckDrawRequestMsg = checkUser
when{}
function BuyLuckDrawRequestMsg(user,Index)
	-- print("===BuyLuckDrawRequestMsg===",Index)
	local objMallSys = user:GetSystem("CMallSystem");
	if objMallSys then
		objMallSys:BuyLuckDraw(Index)
	end
end;
