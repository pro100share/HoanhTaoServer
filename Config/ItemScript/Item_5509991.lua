local dwItemId = 5509991
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

--使用物品
function ItemScriptObj:OnUseItem(objItemSys, objItem)
	local objPlayer = objItemSys:GetPlayer()
	local szRoleName = objPlayer:GetInfo().szRoleName
	local szNotice = "恭喜 <font color='#00FF00'>%s</font> ，在 <font color='#00FF00'>微端登录大礼包</font> 的抽奖中，抽中 <font color='#9900CC'>三星Galaxy Note Ⅱ </font>一台 !!!"
	szNotice = string.format(szNotice,szRoleName)
	CScriptManager:ChatNoticeAll(szNotice,nil,true,nil)
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )












 