--[[
功能：收集管理器（服务器）
作者：周长沙
时间：2013-1-25
]]
local Config = CollectConfig
---------------------------------------
_G.CCollectManager = CSingle:new();
--插入单体管理器
CSingleManager:AddSingle(CCollectManager);
----------------------------------------

---------------------------------------------------------------------------------
--初始化
function CCollectManager:Create()
	self.Collect = {}
	self:Init()
end
--更新
function CCollectManager:Update()
	return true	
end
--销毁
function CCollectManager:Destroy()
	return true
end
----------------------------------------------------------------------------------
function CCollectManager:Init()
	for dwPageID=1,#Config do
		if not self.Collect[dwPageID] then
			self.Collect[dwPageID] = {}
		end
		if (not Config[dwPageID].dwSubConfig) or (not CollectSubConfig[Config[dwPageID].dwSubConfig]) then 
			for dwSeriesID=1,(#Config[dwPageID] or {}) do
				local Collect = CCollect:new(dwPageID,dwSeriesID)
				if Collect then
					self.Collect[dwPageID][dwSeriesID] = Collect
				end
			end
		else
			local Collect = CCollect:new(dwPageID,1,true)
			if Collect then
				self.Collect[dwPageID][1] = Collect
			end
		end
	end
end
------------------------------------------------------------------------------------
--
function CCollectManager:GetBaseCollect(dwPageID,dwSeriesID)
	if not self.Collect[dwPageID] then
		return
	end
	return self.Collect[dwPageID][dwSeriesID]
end
--跟据读数据库表数据，创建信息
function CCollectManager:GetCollectByDBInfo(Info)
	local Node = self:GetBaseCollect(Info.dwPageID,Info.dwSeriesID)
	if not Node then return end;
	return Node:InitDB(Info.dwState,Info.szNum,Info.dwRoleID)
end
--新建收集信息
function CCollectManager:CreatForNew(dwPageID,dwSeriesID,dwRoleID)
	local Node = self:GetBaseCollect( dwPageID, dwSeriesID)
	if not Node then return end;
	return Node:InitDB( 0, "", dwRoleID)
end







































