
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end

local function GetAllPlayer()
	return CPlayerManager.setAllPlayerByRoleID 
end
--------------------------------------------------------------
--������Ϣ<-KS
function CFestivalManager:FestivalModi()
	self:SendClear()
	self:Create()
end

--������Ϣ->Clt
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


--������
function CFestivalManager:ModiCheck()
	local Players = CPlayerManager.setAllPlayerByRoleID
	for dwRoleID,objPlayer in pairs(Players) do
		local sysFestival = objPlayer:GetSystem("CFestivalSystem")
		sysFestival:OnEnterScene()
	end
end

--KS����ʱ���»
function CFestivalManager:OnKSReConnect()
	self:SendClear()
	self:Create()
end














