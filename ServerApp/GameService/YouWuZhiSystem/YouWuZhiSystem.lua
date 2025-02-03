


_G.CYouWuZhiSystem={};
function CYouWuZhiSystem:new()
	local obj = CSystem:new("CYouWuZhiSystem")
	for k,v in pairs(CYouWuZhiSystem) do
		if type(v) == "function" then
			obj[k] = v;
		end;
	end; 
	return obj;
end

function CYouWuZhiSystem:Create(bIsChangeLine)
	local objPlayer=self:GetPlayer();
	self.data=objPlayer:GetLineData("CYouWuZhiSystem")[1];
	--dump_table(self.data);
	self.objDB=CYouWuZhiDB:new(objPlayer:GetDBQuery(),self);
	self:AddValue();
	return true;
end

function CYouWuZhiSystem:OnChangeLineBegin(bIsChangeLine)
	local objPlayer=self:GetPlayer();
	objPlayer:SetLineData("CYouWuZhiSystem",self.data);
	return true;
end

function CYouWuZhiSystem:OnEnterScene()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return false;
	end;
	self:AddValue();
	objPlayer.CollectStunnerMsg{Info=self.data};
end;
---------------------------------------------------------------


function CYouWuZhiSystem:SubmitItem(dwImageID,dwItemID,dwNum)	
	local objPlayer=self:GetPlayer();
	local objDB=objPlayer:GetDBQuery();
	local itemSystem=objPlayer:GetSystem("CItemSystem");
	
	--检测dwImageID是否在配置中存在
	local config=StunnerConfig[dwImageID]
	if(config==nil) then
		-- print("dwImageID 不存在")
		return;
	end
	
	--检测玩家等级
	if objPlayer:GetLevel()<config.dwLevel then
		-- print("等级不够")
		return;
	end
	
	--检测dwItemID是否在配置中存在
	local holeNeedNum=9999999999;
	local holeIndex=0;
	for i,v in pairs(config.Items) do
		if (v.NeedItem[1]==dwItemID) then
			holeNeedNum=v.NeedItem[2];
			holeIndex=i;
		end
	end
	
	---检测当前holeIndex对应的位置，是否之前已经满足，对于已经满足的不能提交
		
	if self.data[dwImageID].ImageData[holeIndex]>=holeNeedNum then
		-- print("已经满足，不用在提交")
		return;
	end
	
	
	----检测数量是否超出所拥有的数量范围
	local num, bindNum, unBindNum = itemSystem:GetEnumItemNumInPacket(dwItemID);
	
	if(  dwNum<1 or dwNum>num ) then
		-- print("数量不在允许的范围，外挂。。。")
		return;
	end
	
	local itemSystem=objPlayer:GetSystem("CItemSystem");
	local noticeSystem=objPlayer:GetSystem("CNoticeSystem");
	local needNum=holeNeedNum-self.data[dwImageID].ImageData[holeIndex];
	local flag=true;
	if needNum <= dwNum then
		itemSystem:DelEnumItemInPacket(dwItemID,needNum,true,ItemSysOperType.Collect)
		self.data[dwImageID].ImageData[holeIndex]=self.data[dwImageID].ImageData[holeIndex]+needNum;
	else
		itemSystem:DelEnumItemInPacket(dwItemID,dwNum,true,ItemSysOperType.Collect)
		self.data[dwImageID].ImageData[holeIndex]=self.data[dwImageID].ImageData[holeIndex]+dwNum;
		flag=false;
	end
	self.objDB:Update(dwImageID,self.data[dwImageID].ImageData);
		
	if flag==true then
		--判断是否完成了一张拼图
		if self:_checkCompleted(dwImageID)==true then
			self:SendNotice(dwImageID);
		end
	end
	objPlayer.CollectStunnerMsg{Info=self.data};
	objPlayer.CollectStunnerSendResMsg{Info={dwItemID}};
	
	self:AddValue();
end

function CYouWuZhiSystem:SubmitAll(dwImageID)
	
	if (self.data[dwImageID]==nil) then
		-- print("dwImageID 不存在")
		return;
	end
	
	local config = StunnerConfig[dwImageID];
	
	local objPlayer=self:GetPlayer();
	local noticeSystem=objPlayer:GetSystem("CNoticeSystem");
	--校验等级
	if ( objPlayer:GetLevel()<config.dwLevel ) then
		-- print("dwImageID 等级不够")
		return;
	end
	
	local itemSystem=objPlayer:GetSystem("CItemSystem");
	local changed=false;
	local changedItemIDs={};
	for i,v in ipairs(config.Items) do
		if(self.data[dwImageID].ImageData[i]<v.NeedItem[2]) then
			local num,bindNum,unBindNum=itemSystem:GetEnumItemNumInPacket(v.NeedItem[1]);
			if num>0 then
				local needNum=v.NeedItem[2]-self.data[dwImageID].ImageData[i];
				if(needNum<=num) then
					itemSystem:DelEnumItemInPacket(v.NeedItem[1],needNum,true,ItemSysOperType.Collect)
					self.data[dwImageID].ImageData[i]=self.data[dwImageID].ImageData[i]+needNum;
				else
					itemSystem:DelEnumItemInPacket(v.NeedItem[1],num,true,ItemSysOperType.Collect)
					self.data[dwImageID].ImageData[i]=self.data[dwImageID].ImageData[i]+num;
				end
				self.objDB:Update(dwImageID,self.data[dwImageID].ImageData);
				changed=true;
				table.insert(changedItemIDs,v.NeedItem[1]);
			end
		end
	end
	objPlayer.CollectStunnerMsg{Info=self.data};
	objPlayer.CollectStunnerSendResMsg{Info=changedItemIDs};
	if changed==true then
		if self:_checkCompleted(dwImageID) then
			self:SendNotice(dwImageID);
		end
	end
	self:AddValue();
end

function CYouWuZhiSystem:AddValue()
	local objPlayer=self:GetPlayer();
	local collectSystem=objPlayer:GetSystem("CCollectSystem")
	collectSystem:AddValue();
end


--计算角色属性
function CYouWuZhiSystem:GetAttr()
	local objPlayer=self:GetPlayer();
	local objDB=objPlayer:GetDBQuery();
	local attr={}
	if (self.data==nil) then
		return attr;
	end	
	for i,v in ipairs(StunnerConfig) do
		
		local n=0;
		for j,v2 in ipairs(v.Items) do
			if(self.data[i].ImageData[j]>=v2.NeedItem[2]) then
				n=n+1;
				--加小图属性
				for k,v3 in pairs(v.RewardSmall) do
					attr[k]=(attr[k] or 0)+v3
				end
			end
		end
		
		--加大图属性
		if (n==#v.Items) then
			for k,v3 in pairs(v.RewardBig) do
				attr[k]=(attr[k] or 0)+v.RewardBig[k]
			end
		end
	end
	return attr;
end

function CYouWuZhiSystem:_checkCompleted(dwImageID)
	local flag=true;
	for i,v in pairs(StunnerConfig[dwImageID].Items) do
		if(self.data[dwImageID].ImageData[i]<v.NeedItem[2]) then
			flag=false;
			break;
		end
	end
	return flag
end


function CYouWuZhiSystem:SendNotice(dwImageID)
	local dwPage=3;
	local objPlayer = self:GetPlayer();
	local config=StunnerConfig[dwImageID];
	local szStr = string.format(CollectTextConfig.Noitce,"%s",CollectConfig[dwPage].szName,config.szName,"%s");
	local Param = {
		[1] = {
			szFunStr = objPlayer:GetName();
			dwFunId = 27;
			param = {objPlayer:GetRoleID(),objPlayer:GetName()};
		};
		[2] = {
			szFunStr = CollectTextConfig.MeToo;
			dwFunId = 33;
			param = {dwPage,dwImageID};
		};
	}
	local szStr2 = string.format(CollectTextConfig.Noitce,objPlayer:GetName(),CollectConfig[dwPage].szName,config.szName,"")
	CScriptManager:ChatNoticeAll(szStr,7,bSystem,Param,szStr2,true)
end

--直接完成一张图
function CYouWuZhiSystem:CompletePicture(dwImageID)
	if (self.data[dwImageID]==nil) then
		-- print("dwImageID 不存在")
		return;
	end
	
	if self:_checkCompleted(dwImageID) then
		return;
	end
	
	local tbConfig = StunnerConfig[dwImageID];
	
	local objSelf = self:GetPlayer();
	
	--校验等级
	if objSelf:GetLevel() < tbConfig.dwLevel then
		-- print("dwImageID 等级不够")
		return;
	end
	
	for k,tb in pairs(tbConfig.Items)do
		self.data[dwImageID].ImageData[k] = tb.NeedItem[2];
	end
	
	self.objDB:Update(dwImageID,self.data[dwImageID].ImageData);
	
	objSelf.CollectStunnerMsg{Info=self.data};
	
	self:SendNotice(dwImageID);
	
	self:AddValue();
	
	return true;
end;



