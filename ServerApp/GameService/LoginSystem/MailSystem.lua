

local dwLimited = 5000;	--邮件的上限
--邮件
_G.CTempMail = {};
function CTempMail:new()
	local obj = {}
	obj.sInfo = SMailInfo:new();	
	obj.sInfo.bRequestToSend = true;
	for i,v in pairs(CTempMail) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--从数据库行信息获取物品数据
function CTempMail:FillByDBData(Row)
	for k,v in pairs(Row) do
		if self.sInfo[k] then
			self.sInfo[k] = v;
		end;
	end;
end;
--邮件附件道具
function CTempMail:CheckLoadItem()
	for k=1,5 do
		if self.sInfo["dwItemID"..k] ~= "" then
            self.sInfo.setItems[k] = json.decode(self.sInfo["dwItemID"..k])
		end;
	end;
end;
--获取邮件的ID
function CTempMail:GetMailID()
	return self.sInfo.dwMailID;
end

--获取邮件的数据信息
function CTempMail:GetInfo()
	return self.sInfo;
end


--检查邮件，是否有过期的，删除过期邮件
local function CheckMailDate(setMails,objPlayer)
    local nowTime = _now();
    local delMails = {};
    local nMailsNum = 0;
	for dwMailID, objMail in pairs(setMails) do
        if objMail.sInfo.dwReceiveTime + objMail.sInfo.dwLifeTime < nowTime then
            table.insert(delMails, dwMailID);
        else
            nMailsNum = nMailsNum + 1;
		end;
	end;
    local SqlCmd = objPlayer:GetDBQuery():CreateDeleteCmd('T_Role_Mail');
    for _, dwMailID in ipairs(delMails) do
        setMails[dwMailID] = nil;
        SqlCmd.Wheres.dwMailID = dwMailID;
		SqlCmd.Wheres.dwReceiver = objPlayer:GetRoleID();
        SqlCmd:execute();
    end;
    return nMailsNum;
end

--对邮件进行排序，按照邮件的接收时间
local function MailSortFunc(a, b)
	return a.sInfo.dwReceiveTime > b.sInfo.dwReceiveTime;
end
--检查邮件的数量，删除多余的邮件
local function CheckMailLimited(setMails, nMailsNum,objPlayer)
	if nMailsNum <= dwLimited then return end;
    --获取所有邮件到数组中
	local allMail = {};
	for _, objMail in pairs(setMails) do
		table.insert(allMail, objMail);
	end
	--对邮件进行排序
	table.sort(allMail,MailSortFunc );
    local SqlCmd = objPlayer:GetDBQuery():CreateDeleteCmd('T_Role_Mail');
	for k=dwLimited+1, nMailsNum do
		local dwMailID = allMail[k].sInfo.dwMailID;
        setMails[dwMailID] = nil;
		SqlCmd.Wheres.dwMailID = dwMailID;
		SqlCmd.Wheres.dwReceiver = objPlayer:GetRoleID();
        SqlCmd:execute();
	end
end

--检查邮件附件
local function CheckMailItem(setMails)
	for _, objMail in pairs(setMails) do
		objMail:CheckLoadItem();
	end
end

local function CheckMail(setMails,objPlayer)
    local nMailsNum = CheckMailDate(setMails,objPlayer);
	CheckMailLimited(setMails, nMailsNum,objPlayer);
    CheckMailItem(setMails);
end


local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local setMails = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Mail" where "dwReceiver" = $1', dwRoleID );
    if #(dbres) > 0 then
		--创建Mail对象
        for index, Row in pairs(dbres) do
            local objMail = CTempMail:new();
            objMail:FillByDBData(Row);
            setMails[objMail:GetMailID()] = objMail;
        end
    end;
	
	CheckMail(setMails,objPlayer);
    
	--将玩家的邮件数据发送到换线中心
	local data = {};
	for _, objMail in pairs(setMails) do
		table.insert(data, objMail:GetInfo());
	end
	CTransitManager:RecvData(dwAccountID,"CMailSystem",data);
	
    return true;
end;


CLoginCall:AddCall("CMailSystem",func);



