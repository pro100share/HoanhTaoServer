

local function func( objPlayer, tbInfoList, isNewRole )
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]
    if #(dbres) > 0 then
		local Row = dbres[1];
		for k, v in pairs( Row ) do
			tabData[k] = v;
		end
    end
    
	CTransitManager:RecvData( dwAccountID, "CDuGuSystem", tabData );
	return true;
end

CLoginCall:AddCall( "CDuGuSystem", func );



