--[[
文件：BaseService/SingleManager.lua
类名：CSingleManager
功能说明：实例管理器，实例是游戏中的单体类，如，玩家管理器，物品模板管理器等。
备注：
作者：周华杰
版本：v1.0
修改者：
]]

_G.CSingle = {}
function CSingle:new()
	local obj = {}; 
	
	obj.Create = CSingle.Create;
	obj.Update = CSingle.Update;
	obj.Destroy = CSingle.Destroy;
	return obj;	
end;
function CSingle:Create()
	return true;
end;

function CSingle:Update(dwInterval)
	return true;
end;

function CSingle:Destroy()
	
end;

_G.CSingleManager = {}
CSingleManager.setAllSingle ={};   --用来存放所有实例的链表
CSingleManager.setAllUpdate ={};   --用来存放所有更新的链表
CSingleManager.setAllCSSingle ={}; --用来存放跨服战实例
CSingleManager.setAllCSUpdate ={}; --用来存放跨服战更新

_G.single_update_record = {};
function CSingleManager:Create()
	for i,objSingle in ipairs(self:GetAllSingle()) do
	    objSingle:Create();
	end;
	for i,tabUpdate in ipairs(self:GetAllUpdate()) do
		tabUpdate[2] = tabUpdate[1].Update;
	end;
	return true;
end;

function CSingleManager:Update(dwInterval)
	for i, tabUpdate in ipairs(self:GetAllUpdate()) do
		local b, s = pcall(
			function()
				local dwTime = _now();
				tabUpdate[2](tabUpdate[1],dwInterval);
				local dwCost = single_update_record[i] or 0;
				single_update_record[i] = dwCost + _now() - dwTime;
			end
		);
		if not b then 
			_err(s) 
		end
	end
	return true;
end

function CSingleManager:Destroy()
	for i,objSingle in ipairs(self:GetAllSingle()) do
	    objSingle:Destroy();
	end;
	self.setAllSingle = {};
	self.setAllUpdate = {};
    self.setAllCSSingle = {};
    self.setAllCSUpdate = {};
end;

--[[
功能：用来注册实例，添加一个实例
备注：
]]
function CSingleManager:AddSingle(objSingle,bUpdate)
	table.insert(self.setAllSingle,objSingle);
	if bUpdate then
		table.insert(self.setAllUpdate,{objSingle,function()end})
	end;
end;

--[[
功能：注册实例用于跨服战服务器
备注：
]]
function CSingleManager:RegistCSSingle(objSingle, bUpdate)
    table.insert(self.setAllCSSingle, objSingle);
    if bUpdate then
        table.insert(self.setAllCSUpdate,{objSingle,function()end});
    end
end

--[[
功能：获取系统实例
备注：
]]
function CSingleManager:GetAllSingle()
    local setAllSingle = self.setAllSingle;
    if CConfig.bIsCrossSvr then
        setAllSingle = self.setAllCSSingle;
    end
    return setAllSingle;
end

--[[
功能：获取系统更新
备注：
]]
function CSingleManager:GetAllUpdate()
    local setAllUpdate = self.setAllUpdate;
    if CConfig.bIsCrossSvr then
        setAllUpdate = self.setAllCSUpdate;
    end
    return setAllUpdate;
end