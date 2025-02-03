--演武系统管理器

_G.CMartialManager = CSingle:new();

CSingleManager:AddSingle(CMartialManager,true);

CMartialManager.setCurMartailObj = {};	--当前活动对象
CMartialManager.setFreeMartailObj = {};	--空余对象
CMartialManager.dwCurIDMax = 1;			--下一个ID

local m_MaxFreeMartialNumber = 200;		--空余对象的最大数量

---------------------------------------------------------------------------------------------------
function CMartialManager:Create()
	self.dwCurIDMax = 1;
	--self.dwLossstate = 10000;
	return true;
end;

function CMartialManager:Update(e)
	-- self.dwLossstate = self.dwLossstate - e;
	
	-- if self.dwLossstate <= 0 then
		-- local dwUsed = 0;
		-- print("======begin martial info======")
		-- for n,v in pairs(self.setCurMartailObj)do
			-- for ind,role in pairs(v.setPlayerPosTable)do
				-- print("marid--index--roleid",n,ind,role)
			-- end
		-- end
		-- print("======end martial info======")
		-- self.dwLossstate = 10000;
	-- end
	
	for n,obj in pairs(self.setCurMartailObj)do
		obj:Update();
	end
	
	return true;
end;

function CMartialManager:Destroy()
	self.setCurMartailObj = {};
	self.setFreeMartailObj = {};
end;

---------------------------------------------------------------------------------------------------
function CMartialManager:CreateMartial(objPlayer,fDirValue)
	local objMar = nil;
	
	if #self.setFreeMartailObj == 0 then
		objMar = CMartialObject:new();
	else
		objMar = self.setFreeMartailObj[1];
		table.remove(self.setFreeMartailObj,1);
	end
	
	objMar:Init(self.dwCurIDMax,objPlayer,fDirValue);
	
	self.setCurMartailObj[self.dwCurIDMax] = objMar;
	
	self.dwCurIDMax = self.dwCurIDMax + 1;
	
	return objMar;
end;

function CMartialManager:DeleteMartial(objMar)
	if #self.setFreeMartailObj < m_MaxFreeMartialNumber then
		table.insert(self.setFreeMartailObj,objMar);
	end
	
	self.setCurMartailObj[objMar.dwSelfID] = nil;
	
	objMar:Delete();
	
	objMar = nil;
end;

function CMartialManager:FindMartial(dwID)
	return self.setCurMartailObj[dwID];
end;

function CMartialManager:GetCanSeeMartialList(dwMapID)
	local tbCanSee = {};
	
	for n,objMar in pairs(self.setCurMartailObj)do
		if objMar.dwCurMapID == dwMapID then
			tbCanSee[n] = objMar;
		end
	end
	
	return tbCanSee;
end;