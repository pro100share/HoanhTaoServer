-- 联运平台礼包系统

_G.CUnionPlatGiftSystem = {};

function CUnionPlatGiftSystem:new()
	local obj = CSystem:new("CUnionPlatGiftSystem");
	
	--已经领取的礼包的索引
	obj.setHasGet = {};
	
	for i,v in pairs(CUnionPlatGiftSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CUnionPlatGiftSystem:Create()
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CUnionPlatGiftSystem Create Cannot get player");
		return false;
	end;
	--需要调用player的基础道具系统
	self.ItemSystem = objPlayer:GetSystem("CItemSystem");
	if not self.ItemSystem then
		_err("CUnionPlatGiftSystem Create Cannot get ItemSystem");
		return false;
	end;
	
	
	local objDB = objPlayer:GetDBQuery();
	self.objDBQuery = CUnionPlatGiftDBOper:new(objDB,self);
	if not self.objDBQuery then
		return false;
	end;
	
	local Data	= objPlayer:GetLineData("CUnionPlatGiftSystem")[1];
	if not Data then
		_err("CUnionPlatGiftSystem Create CanNot GetLineData!!!");
		Data = {}
	end;
	
	
	--已经领取的礼包
	if Data[1] then
		--print("========================CUnionPlatGiftSystem setHasGet is",Data[1].setHasGet)
		self.setHasGet = self.objDBQuery:ParseStr(Data[1].setHasGet)
	else
		--插入数据库
		--print("============================CUnionPlatGiftSystem insert DB")
		self.objDBQuery:InsertInfo(self.setHasGet)
	end

	return true;
end;

function CUnionPlatGiftSystem:Destroy()
end;

function CUnionPlatGiftSystem:Update()
	
end;

function CUnionPlatGiftSystem:OnEnterScene()
	--同步已经领取的礼包
	self:SynHasGetGift();
	--同步礼包配置
	--print('CUnionPlatGiftSystem:OnEnterScene')
	self:SynGiftCfg();
end;

--换线开始
function CUnionPlatGiftSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	
	local strHasGet = "";
	for k, v in pairs(self.setHasGet) do
		strHasGet = strHasGet..v..","
	end
	
	local Data = {};
	Data[1] = {};
	Data[1].setHasGet = strHasGet;
	objPlayer:SetLineData("CUnionPlatGiftSystem", Data);
end

---------------------------------------------------------------------------------------------------------------------------------

--同步已经领取的礼包消息
function CUnionPlatGiftSystem:SynHasGetGift()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CUnionPlatGiftSystem SynHasGetGift Cannot get player");
		return false;
	end
	
	objPlayer.SynUnionGetRewardInfoMsg{GetInfoTable = self.setHasGet}
end

--同步礼包配置（会热更新）
function CUnionPlatGiftSystem:SynGiftCfg()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CUnionPlatGiftSystem SynGiftCfg Cannot get player");
		return false;
	end
	
	--print('CUnionPlatGiftSystem:SynGiftCfg =========== SynUnionPlatGiftCfgMsg')
	objPlayer.SynUnionPlatGiftCfgMsg{GiftCfg = _G.UnionPlatformHotUpdateConfig}
end


-- 领取礼包
function CUnionPlatGiftSystem:OnDrawGift(giftIndex)
	--print("CUnionPlatGiftSystem:OnDrawGift giftIndex is ", giftIndex)
	if giftIndex <= 0 then return end;
	
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CUnionPlatGiftSystem Make Cannot get player");
		return false;
	end
	
	local giftCfg = _G.UnionPlatformHotUpdateConfig[giftIndex];
	
	local retCode = 0;
	if giftCfg then
		retCode =  UnionPlatformAwardConfig.CanGetReward(giftIndex, self.setHasGet);
		-- retCode ,0 可以领取,2 没有该礼包,3不满足领取条件,4已经领取,5背包空间不足
		if retCode == 0 then
			while true do
				--检查背包空间是否足够
				if not self.ItemSystem:IsPacketSlotEnoughFor(1) then
					retCode = 5;
					break;
				end
				
				--给礼包
				local setAddList = {};
				local tempTabel = {
					dwItemEnum	= giftCfg.itemId;
					dwItemNumber= 1;
					dwBindType = giftCfg.dwBindType;
				}
				table.insert(setAddList, tempTabel);
				self.ItemSystem:AddEnumItemListToPacket(setAddList, _G.ItemSysOperType.UnionPlatGift);
				
				table.insert(self.setHasGet, giftIndex);
				
				--更新数据库
				self.objDBQuery:SaveInfo(self.setHasGet)
				
				break;
			end
		end
	else
		retCode = 2;
	end
	
	objPlayer.GetUnionRewardResultMsg{ResultType = retCode, ItemIndex  = giftIndex}	
	--print("CUnionPlatGiftSystem:OnDrawGift retCode is ", retCode)
	return
end;



--以下是数据库操作
-----------------------------------------------------------------------------------------------------------------------------------------------------
_G.CUnionPlatGiftDBOper = {};
function CUnionPlatGiftDBOper:new(objDB,objUser)
    local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CUnionPlatGiftDBOper) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;


function CUnionPlatGiftDBOper:CheckDBValid()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CUnionPlatGiftDBOper");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CUnionPlatGiftDBOper");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CUnionPlatGiftDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CUnionPlatGiftDBOper");
		return false;
	end;
	
	return true;
end 

function CUnionPlatGiftDBOper:ParseStr(str)
	local t = {}
	
	if str == 0 or str == '0' or str == nil or str =="" then
		return t;
	end;
	
	local h,e;
	local tempStr = str;
	local paramStr;
	while true do
		h,e = string.find(tempStr,',');
		if not h then
			break;
		end
		paramStr = string.sub(tempStr,1,h-1);
		local enum = tonumber(paramStr)
		t[enum] = enum
		tempStr = string.sub(tempStr,h+1,-1);
	end
	
	return t;
end

function CUnionPlatGiftDBOper:InsertInfo(setHasGet)
	if not self:CheckDBValid() then return end;

	local SqlCmd = self.objDBQuery:CreateInsertCmd('T_Role_UnionPlatGift');	
	
	local strHasGet = "";
	for k, v in pairs(setHasGet) do
		strHasGet = strHasGet..v..","
	end
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CUnionPlatGiftDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CUnionPlatGiftDBOper");
		return false;
	end;
	
	SqlCmd.Fields.dwRoleID	= dwRoleID;	
	SqlCmd.Fields['setHasGet'] = strHasGet
	SqlCmd:execute()
	return true;
end

function CUnionPlatGiftDBOper:SaveInfo(setHasGet)
	if not self:CheckDBValid() then return end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd('T_Role_UnionPlatGift');	
	
	local strHasGet = "";
	for k, v in pairs(setHasGet) do
		strHasGet = strHasGet..v..","
	end
	
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CUnionPlatGiftDBOper");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CUnionPlatGiftDBOper");
		return false;
	end;
	
	SqlCmd.Wheres.dwRoleID = dwRoleID
	SqlCmd.Fields['setHasGet'] = strHasGet
	SqlCmd:execute()
	return true;
end
