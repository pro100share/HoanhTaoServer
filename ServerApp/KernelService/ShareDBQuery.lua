_G.CShareDBQuery = 
{
    objShareDBQuery = nil;
};
function CShareDBQuery:Create()
	--连接共享数据库
	self.objShareDBQuery = CSql:Connect(CConfig.ShareDB.ConnParam);
	if not self.objDBQuery then return false end;
	return true;
end;

function CShareDBQuery:Update()
	
end;

function CShareDBQuery:Destroy()
   self.objShareDBQuery = nil;
end;

function CShareDBQuery:GetDBQuery()
    return self.objShareDBQuery;
end;

