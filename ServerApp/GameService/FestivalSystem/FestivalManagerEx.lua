
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end

local function GetAllPlayer()
	return CPlayerManager.setAllPlayerByRoleID 
end
--------------------------------------------------------------
--清除活动信息<-KS
function CFestivalManager:FestivalModi()
	self:SendClear()
	self:Create()
end

--清除活动信息->Clt
function CFestivalManager:SendClear()
	local Players = GetAllPlayer()
	local setNet = {}
	local szMsgName = "FestivalClearMsg"
	local tParam = {
	}
	for k,v in pairs(Players) do
		table.insert(setNet,v.objNet)
	end
	group_msg(setNet,szMsgName,tParam)
end


--额外检查
function CFestivalManager:ModiCheck()
	local Players = CPlayerManager.setAllPlayerByRoleID
	for dwRoleID,objPlayer in pairs(Players) do
		local sysFestival = objPlayer:GetSystem("CFestivalSystem")
		sysFestival:OnEnterScene()
	end
end

--KS重启时更新活动
function CFestivalManager:OnKSReConnect()
	self:SendClear()
	self:Create()
end














