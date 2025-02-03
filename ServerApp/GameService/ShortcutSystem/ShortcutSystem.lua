--[[
功能：地图系统类
作者：周华杰
时间：2011-12-22
修改者:周华杰
]]
_G.CShortcutSystem = {};
function CShortcutSystem:new()
	local obj = CSystem:new("CShortcutSystem");
	obj.setAllInfo = {};
	for i,v in pairs(CShortcutSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;

function CShortcutSystem:Create()
     -- 创建数据库对象  
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end; 
	if not CConfig.bIsCrossSvr then
		local objDB = objPlayer:GetDBQuery();
		self.objDBQuery = CShortcutSystemDBQuery:new(objDB,self);
		if not self.objDBQuery then
			return false;
		end; 
	end;
	local Data = objPlayer:GetLineData("CShortcutSystem")[1];
	
	self.setAllInfo = Data[1];
	
	return true;
end
 
function CShortcutSystem:Update(dwInterval)
   
end



function CShortcutSystem:Destroy()
	if not self.objDBQuery then
		return;
	end;
end;

function CShortcutSystem:OnEnterScene()
	self:ReadShortuctInfo();
end;

function CShortcutSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer();
	
	local Data = {};
	Data[1] = self.setAllInfo;
	
	objPlayer:SetLineData("CShortcutSystem",Data);
end;

function CShortcutSystem:OnEnterCrossBegin()
	local objPlayer = self:GetPlayer();
	
	local Data = {};
	Data[1] = self.setAllInfo;
	
	objPlayer:SetCrossSvrData("CShortcutSystem",Data);
end;
---------------------------------------------------------------
--------------------------------------------------------------

function CShortcutSystem:ReadShortuctInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.OnShortuctInfoMsg{InfoList = self.setAllInfo};
end;

function CShortcutSystem:SendDelShortuctInfo(dwShortcutID)
	--print("CShortcutSystem:SendDelShortuctInfo(dwShortcutID)",dwShortcutID);
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end; 
	self.setAllInfo[dwShortcutID] = nil;
	if self.objDBQuery then
		self.objDBQuery:DelShortuctIndex(dwShortcutID);
	end;
	objPlayer.OnDelShrtuctInfoMsg{ResCode =0 };
end;

function CShortcutSystem:SendAddShortuctInfo(sInfo)
	--print("CShortcutSystem:SendAddShortuctInfo(dwShortuctID)",sInfo,sInfo.dwShortcutID);
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	local isInsert = nil;
	if self.setAllInfo[sInfo.dwShortcutID] == nil then
		isInsert = true;
	end
	
	self.setAllInfo[sInfo.dwShortcutID] = nil;
	self.setAllInfo[sInfo.dwShortcutID] = sInfo;
	if self.objDBQuery then
		self.objDBQuery:SaveShortuctIndex(sInfo,isInsert);
	end;
	objPlayer.OnAddShrtuctInfoMsg{ResCode =0 };
end;