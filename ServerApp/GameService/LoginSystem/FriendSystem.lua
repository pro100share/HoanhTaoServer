

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    --自己的心情和签名
	local setMood = SPlayerMoodMsg:new();
	local dbres1 = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Mood" where "dwRoleID" = $1 ', dwRoleID);
    if #(dbres1) > 0 then
		for k,Row in pairs(dbres1) do
            for c,v in pairs(Row) do
                setMood[c] = v;
            end
        end
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Mood');
        SqlCmd.Fields.dwRoleID 	= dwRoleID;
        SqlCmd.Fields.dwMood1 	= setMood.dwMood1;
        SqlCmd.Fields.dwMood2 	= setMood.dwMood2;
        SqlCmd.Fields.dwMood3 	= setMood.dwMood3;
        SqlCmd.Fields.dwMood4 	= setMood.dwMood4;
        SqlCmd.Fields.szSign 	= setMood.szSign;
        SqlCmd:execute();
    end;
    
	local setFriends = {};
	local dbres2 = tbInfoList[2]--objPlayer:GetDBQuery():execute('select * from "T_Role_Friend" where "dwRoleID" = $1 ', dwRoleID);
	if #(dbres2) > 0 then
		for nIndex, Row in pairs(dbres2) do
			local info = sFriendInfo:new();
			info.dwRoleID 	= Row.dwFriendID;
			info.dwFlag 	= Row.dwFlag;
			info.dwMeetTime = Row.dwMeetTime;
			info.dwLastTime = Row.dwLastTime;
			info.dwVip 		= Row.dwVip;
			info.dwLevel 	= Row.dwLevel;
			info.strName 	= Row.strName;
			info.dwHead 	= Row.dwHead;
			info.dwProf 	= Row.dwProf;
			info.dwEnemy 	= Row.dwEnemy;
			info.dwInjectFlag	= Row.dwInjectFlag;
			info.dwDBOper 	= enDBOperation.eUpdate;
			info.bExistInDB = true;
			setFriends[info.dwRoleID] = info;
		end
	end;
    
	--将数据提交到换线中心
	CTransitManager:RecvData(dwAccountID,"CFriendSystem", setMood);--提交背包数据

	CTransitManager:RecvData(dwAccountID,"CFriendSystem",setFriends);
    return true;
end;


CLoginCall:AddCall("CFriendSystem",func);



