
--[[
	根据配置生成合服的开始时间
]]

_G.CMergeServerTime=CSingle:new();

CSingleManager:AddSingle(CMergeServerTime);

function CMergeServerTime:Create()
end

function CMergeServerTime:getMergeServerTime()
	if self.dwMergeServerTime then
		return self.dwMergeServerTime;
	end
	--这一段是为了对合服配置文件出错时的容错
	if dwMergeServerTimes==nil  then
		return 0;
	end
	-----------
	local objDB=CPlayerDBQuery:GetDBQuery();
	local dwServerHostID=CConfig.Network.dwServerHostID;
	local result=objDB:execute([[select * from "T_Server_MergeServer_Info" where "dwServerHostID"=$1 ]],dwServerHostID);
	if not result then
		objDB:execute([[ insert into "T_Server_MergeServer_Info"("dwServerHostID","dwStartTime","dwTimes") values($1,1,0) ]],dwServerHostID);		
		result=objDB:execute([[select * from "T_Server_MergeServer_Info" where "dwServerHostID"=$1 ]],dwServerHostID);	
	end

	self.dwMergeServerTime=result[1].dwStartTime;
	if result[1].dwTimes ~= dwMergeServerTimes then	
		objDB:execute([[update "T_Server_MergeServer_Info" set "dwTimes"=$1 , "dwStartTime"=$2 where "dwServerHostID" =$3 ]],dwMergeServerTimes,CTimeFormat:GetTodayStartMsec()+1,dwServerHostID);		
		self.dwMergeServerTime=CTimeFormat:GetTodayStartMsec()+1;
	end
	return self.dwMergeServerTime;
end


