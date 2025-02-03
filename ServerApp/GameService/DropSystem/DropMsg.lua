--------------------------------
--[[
服务器 掉落
消息处理
周长沙
2012-3-9
--]]
--------------------------------
_define()
--收到客户端请求所有item的消息
define.DropGetMapItemMsg
{
	user  = NONE ,
}
when{ user = NONE }
DropGetMapItemMsg = checkUser
when{}
function DropGetMapItemMsg(user)
	local sysDrop = user:GetSystem("CDropSystem");
	if not sysDrop then
		return 
	end
	sysDrop:Clear()
	sysDrop:SendMapItemInfo()
end

--收到玩家拾取某个物品的消息
define.DropOnPickItemMsg
{
	user  = NONE ,
	DwObjId = 0,
}
when{ user = NONE }
DropOnPickItemMsg = checkUser
when{}
function DropOnPickItemMsg(user,DwObjId)
	local sysDrop = user:GetSystem("CDropSystem");
	if not sysDrop then
		return 
	end
	local res = sysDrop:OnRecvPickItem(DwObjId)
	if res==-1 then
		--print("Pick Up Item Fail(no this item):",DwObjId)
		user.DropGetAllItemInfoMsg{Add={};Del={DwObjId}}
	end;
	-- elseif res==-2 then
		-- print("Pick Up Item Fail(no right):",DwObjId)
	-- elseif not res then
		-- print("Pick Up Item Fail:",DwObjId)
	-- elseif res==true then
		-- print("Pick Up Item Suc:",DwObjId)
	-- end
end













