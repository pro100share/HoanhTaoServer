
_G.CMonsterBuffSystem = {}

--创建buff系统
function CMonsterBuffSystem:new(objMon)
	local obj = {};
	obj.m_EntityID = 0;		        --buffID的序列号，序列号先自增，然后再返回
	obj.objMon = objMon;
	for key, value in pairs(CMonsterBuffSystem) do
		if type(value) == "function" then
			obj[key] = value;
		end;
	end;
	obj:Create()
	return obj;
end;

function CMonsterBuffSystem:Create()
	self.setLookedPlayer = {};	--当前正在看我的Player，同步Buff信息
	self.CopyBuffTbl = {};
	----------------更具顶替规则------------------
	--所有的buff
	self.AllBuffTbl = {};
	
	self.objDriverNode = nil;
	
	return true;
end;
--
function CMonsterBuffSystem:OnEnterScene()
	
end;
--处理死亡时的buff
function CMonsterBuffSystem:OnDead()
	self:ClearDeadBuff();
end;

--获得怪物对象
function CMonsterBuffSystem:GetMon()
	return self.objMon
end

--当数值变化时，更新buff
function CMonsterBuffSystem:SetBuffValue(buff)
	self:BroadcastBuffMsg("SynOneBuffValue",buff);
end;

function CMonsterBuffSystem:Update()

end

--更新一个buff的信息,目前为time.服务端为启动后在执行
function CMonsterBuffSystem:UpdateEX(dwInterval)	
	local nowTime = GetCurTime();
	if not self.lastTime then
		self.lastTime = nowTime;
	end;
	local dev = nowTime - self.lastTime;
	if self.AllBuffTbl then
		for classId, classTbl in pairs(self.AllBuffTbl) do
			if classTbl then
				for buffId, buffIdTbl in pairs(classTbl) do
					if buffIdTbl then
						for entityId, buff in pairs(buffIdTbl) do
							-- if buff.m_value == 0 then
								-- self:DeleteBuff(entityId);
							-- end;
							if buff.m_time then
								buff.m_time = buff.m_time - dev;
								if buff.m_time <= 0 then
									self:DeleteBuff(entityId);
								end;
							end;
							--按照频率更新
							if buff.m_frequency then
								buff.m_frequency = buff.m_frequency - dev;
								if buff.m_frequency <= 0 then
									
									--设置影响次数
									buff:SetEffectNum();
									--执行效果
									buff:Use(self);
									if BuffBasicInfo[buff.m_id].bBackBlood == 1 then
										self:SetBuffValue(buff);
									end;
									--重新设置频率
									buff:GetTimeDelay();
								end;
							end;
						end;
					end;
				end;
			end;
		end;
		self.lastTime = nowTime;
	end;
	return true;
end;

--下线处理
function CMonsterBuffSystem:Destroy()
	if self.objDriverNode then
		CDriverManager:DelDriver(self.objDriverNode);
		self.objDriverNode = nil;
	end
	self:UnRegisterSystem();
	self:DeleteAllBuff();
end;

--------------------------------------------------------------------------------------------------------------------
----------------------------------------------------增加buff相关-----------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--根据buff的替换规则,将buff插入到指定的表中
function CMonsterBuffSystem:AppendBuffToTbl(buff)
	local changeType = buff.m_changeRule;
	if self.AllBuffTbl[buff.m_classId] then
		if self.AllBuffTbl[buff.m_classId][buff.m_id] then
			if changeType == 2 then  --共存
				if buff.m_MaxTroopNum <= self:GetBuffTroop(buff.m_classId) then
					return;
				end;
				self.AllBuffTbl[buff.m_classId][buff.m_id][buff.m_EntityID] = buff;
				self:CopyBuffInfo();
				return true, buff;
			elseif changeType == 1 then   --等级替换
				for entityId, buffObj in pairs(self.AllBuffTbl[buff.m_classId][buff.m_id]) do
					if buffObj.m_Level > buff.m_Level then
						return false;
					end;
					self:DeleteBuffByType(buffObj);
				end
				
				self.AllBuffTbl[buff.m_classId][buff.m_id][buff.m_EntityID] = buff;
				self:CopyBuffInfo();
				return true, buff;
			elseif changeType == 3 then   --值叠加
				local value = 0;
				for entityId, buffObj in pairs(self.AllBuffTbl[buff.m_classId][buff.m_id]) do
					value = buffObj.m_value;
					self.AllBuffTbl[buff.m_classId][buff.m_id][entityId] = nil;
					break;
				end;
				buff:SetAppendBuffValue(self, value + buff.m_value);
				self.AllBuffTbl[buff.m_classId][buff.m_id][buff.m_EntityID] = buff;
				self:CopyBuffInfo();
				return true, buff;
			elseif changeType == 4 then   --时间叠加
				local lifetime = 0;
				local effectNum = 0;
				for entityId, buffObj in pairs(self.AllBuffTbl[buff.m_classId][buff.m_id]) do
					lifetime = buffObj.m_time;
					effectNum = buffObj.m_EffectNum;
					self.AllBuffTbl[buff.m_classId][buff.m_id][entityId] = nil;
				end
				if lifetime and buff.m_time then
					buff:SetBuffTime(lifetime + buff.m_time);
				else
					buff.m_time = nil;
				end;
				buff:SetAddEffectNum(effectNum);
				self.AllBuffTbl[buff.m_classId][buff.m_id][buff.m_EntityID] = buff;
				self:CopyBuffInfo();
				return true, buff;
			elseif changeType == 0 then
				return false;
			end;
		else
			if buff.m_MaxTroopNum <= self:GetBuffTroop(buff.m_classId) then
				return;
			end;
			self.AllBuffTbl[buff.m_classId][buff.m_id] = {};
			self.AllBuffTbl[buff.m_classId][buff.m_id][buff.m_EntityID] = buff;
			self:CopyBuffInfo();
			return true, buff;
		end;	
	else
		if self:GetBuffNumBySave(buff) >= 18 then  --buff大组已满
			return;
		end;
		self.AllBuffTbl[buff.m_classId] = {};
		self.AllBuffTbl[buff.m_classId][buff.m_id] = {};
		self.AllBuffTbl[buff.m_classId][buff.m_id][buff.m_EntityID] = buff;
		self:CopyBuffInfo();
		return true, buff;
	end;
end;
--拷贝buff的信息
function CMonsterBuffSystem:CopyBuffInfo()
	self.CopyBuffTbl = {};
	for classId, classTbl in pairs(self.AllBuffTbl) do
		for buffId, buffTbl in pairs(classTbl) do
			for entityId, buff in pairs(buffTbl) do
				
				if not self.CopyBuffTbl[classId] then
					self.CopyBuffTbl[classId] = {};
				end;
				if not self.CopyBuffTbl[classId][buffId] then
					self.CopyBuffTbl[classId][buffId] = {};
				end;				
				self.CopyBuffTbl[classId][buffId][entityId] = {entityId, buff.m_classId, buff.m_time, buff.m_MaxTroopNum, buff.m_value, buff.m_Level};
			end;
		end;
	end;
end;

--向buffSystem中添加buff(dwId为buff的配置id, level为buff等级)
function CMonsterBuffSystem:AddBuff(dwId, level, releaseObj, dwTime)
	local objMon = self:GetMon();
	if objMon:IsDead() then
		return;
	end
	
	
	--检查 怪物免疫buff表
	local monsterEnumID = objMon:GetID();
		
	if MonsterImmuneConfig[monsterEnumID] then
		for k, v in pairs(MonsterImmuneConfig[monsterEnumID]) do
			if v == dwId then
				return 
			end;
		end
	end
	
	
	-- local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	-- local tbPos = sysMonsterMove:GetVPos();
	-- _info("==Add Buff Begin==",objMon:GetRoleID(),tbPos.x,tbPos.y,sysMonsterMove.vPos.x,sysMonsterMove.vPos.y)
	
	local releaseType = 0;
	local releaseId = 0;
	if releaseObj then
		releaseType = releaseObj:GetObjType();
		if releaseType == enEntType.eEntType_Player then
			releaseId = releaseObj:GetRoleID();
		elseif releaseType == enEntType.eEntType_Monster then
			releaseId = releaseObj.ObjId;
		end;
	end;
	
	local entityId = self:GetNextBuffID();
	local buffObj = CMonsterBuff:new(entityId, dwId, self.objMon:GetID(), level, self, releaseType, releaseId, dwTime)
	local addFlag = false;
	
	local buffType = buffObj.m_saveId; --buff组(增，减，特)
	local buffConfig = BuffBasicInfo[dwId];
	
	--设置影响次数
	buffObj:SetEffectNum();
	--获得buff执行的周期时间
	if buffConfig.GetTimeDelay then
		buffConfig:GetTimeDelay(buffObj, level, buffObj.m_EffectNum);
	else
		buffObj:SetTimeDelay();
	end
	--获得buff的生命周期
	buffObj:GetLifeTime();
	--获得buff的最大叠加数
	buffObj:GetBuffTroopMax();
	
	--获得value的值(初值)
	buffObj:InitBuffValue(self);
	
	local buff = nil;

	addFlag, buff = self:AppendBuffToTbl(buffObj)
	
	if addFlag then	
		local flag = true;
		if buff.m_time == nil then
			flag = false;
		end;
		self:BroadCastBuffPfx(buff);
		buff:AddBuffEffect(buffObj.m_BuffSystem);
		if BuffBasicInfo[buffObj.m_id].bBackBlood == 1 then
			self:SetBuffValue(buffObj);
		end;
		buff:Use(buffObj.m_BuffSystem); --加buff后效果
		self:BroadcastBuffMsg("SynOneBuff",buffObj);
	end;
	
	if not self.objDriverNode then
		self.objDriverNode = CDriverManager:AddDriver(_G.eInterval._1sec,self,self.UpdateEX)
		self.lastTime = GetCurTime();
	end
	
	-- local tbPos = sysMonsterMove:GetVPos();
	-- _info("==Add Buff End==",objMon:GetRoleID(),tbPos.x,tbPos.y,sysMonsterMove.vPos.x,sysMonsterMove.vPos.y)
end;
--获得class组现有的个数
function CMonsterBuffSystem:GetBuffTroop(classId)
	local num = 0;
	for class_Id, classTbl in pairs(self.AllBuffTbl) do
		if class_Id == classId then
			for buffId, buffTbl in pairs(classTbl) do
				for entityId, buff in pairs(buffTbl) do
					num = num + 1;
				end;
			end;
		end;
	end;
	return num;
end;
--获得一类的buff个数
function CMonsterBuffSystem:GetBuffNumBySave(buffObj)   --根据增减益
	local buffType = buffObj.m_saveId;
	local num = 0;
	local tbl = {};
	for class_Id, classTbl in pairs(self.AllBuffTbl) do	
		for buffId, buffTbl in pairs(classTbl) do
			for entityId, buff in pairs(buffTbl) do
				if buff.m_saveId == buffType then
					tbl[class_Id] = true;
				end;
			end;
		end;
	end;
	for classId, _ in pairs(tbl) do
		num = num + 1;
	end;
	return num;
end;
--
---------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------删除buff相关----------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--删除某个buff --Type：删除类型（1：按照层数，2：按照队列，3所有都删除） Level:删除时的BUFF等级限制。高于该等级的BUFF删除不了。
-- function CMonsterBuffSystem:ExecuDeleteBuff(classId, buffId, deltype, number, level)
	-- if deltype == 1 then
		-- self:DeleteBuffByCeng(deltype, buffId, num)
	-- elseif deltype == 2 then
		-- self:DeleteBuffByClass(deltype, classId)
	-- elseif deltype == 3 then
		-- self:DeleteAllBuff()
	-- end
-- end;
--在表中删除buff所在位置
function CMonsterBuffSystem:DeleteBuffByType(buff, deltype)   --1为层,2为队
	if buff.m_changeRule ~= 0 then
		self.AllBuffTbl[buff.m_classId][buff.m_id][buff.m_EntityID] = nil;
	else
		self.AllBuffTbl[buff.m_classId] = nil;
	end;
	self:BroadCastDelBuffPfx(buff);  --同步视野内玩家
	self:CopyBuffInfo();
	self:BroadcastBuffMsg("SynOnBuffDelete",buff.m_classId, buff.m_id, deltype, buff.m_EntityID);
	buff:DeleteBuffEffect(buff.m_BuffSystem);
	
	self:CheckBuff();
end;
--删除所有的buff
function CMonsterBuffSystem:DeleteAllBuff()
	--所有的buff
	self.AllBuffTbl = {};
	--拷贝表
	--self.CopyBuffInfo = {};
end;
--删除某一队列的buff
function CMonsterBuffSystem:DeleteBuffByClass(classId)
	self.AllBuffTbl[classId] = nil;
	--self:SynBuffDelete(classId, 0);
	self:BroadcastBuffMsg("SynOnBuffDelete",classId, 0);

end;
--按照层数删除buff
function CMonsterBuffSystem:DeleteBuffByCeng(deltype, buffId, num)
	local minusNum = num;
	
	local classId = 0;
	for class_id, classTbl in pairs(self.AllBuffTbl) do
		for buff_id, buffTbl in pairs(classTbl) do
			for entityId, buff in pairs(buffTbl) do
				if buff_id == buffId then
					self:DeleteBuffByType(buff, deltype);
					--objPlayer.SynDeleteBuff{ClassId = classId, BuffId = buffId,BuffEntityId = entityId, BuffIsSave = BuffBasicInfo[buffId].dwSaveId}   ---通知客户端同步删除buff;
					num = num - 1;
					if num == 0 then
						return;
					end;
				end;
			end;
		end;
	end;
end;
--删除一个buff(服务端自动)
function CMonsterBuffSystem:DeleteBuff(entityId)
	for classId, tbl in pairs(self.AllBuffTbl) do
		for buffId, buffTbl in pairs(tbl) do
			for buffEntityId, buff in pairs(buffTbl) do
				if buff and buffEntityId == entityId then
					--将buff赋nil，则删除该buff
					self:DeleteBuffByType(buff);
					--objPlayer.SynDeleteBuff{ClassId = classId, BuffId = buffId,BuffEntityId = buffEntityId, BuffIsSave = BuffBasicInfo[buffId].dwSaveId}   ---通知客户端同步删除buff;
					--self:SynBuffDelete(classId, buffId, 4, buffEntityId);
					self:BroadcastBuffMsg("SynOnBuffDelete",classId, buffId, 4, buffEntityId);
				end;
			end;
		end;
		
	end;
end;
--通过配置id删除buff(服务器控制消失)
function CMonsterBuffSystem:DeleteBuffByID(buffId)
	for classId, classTbl in pairs(self.AllBuffTbl) do
		for buff_Id, tbl in pairs(classTbl) do
			for entityId, buff in pairs(tbl) do
				if buff_Id == buffId then
					self:DeleteBuff(entityId);	
					return;
				end;
			end;
		end;
	end;
end;
--记录值变为0删除buff
function CMonsterBuffSystem:DeleteBuffByValue(buffId)
	for classId, buffTbl in pairs(objPlayer.ValueSuperTbl) do
		for buff_id, buff in pairs(buffTbl) do
			if buffId == buff_id and buff.m_value == 0 then
				self:DeleteBuff(buff.m_EntityID);
				return;
			end;
		end;
	end;
end;

function CMonsterBuffSystem:CheckBuff()
	for n,v in pairs(self.AllBuffTbl)do
		return;
	end
	
	if self.objDriverNode then
		CDriverManager:DelDriver(self.objDriverNode);
		self.objDriverNode = nil;
	end
end;


----------------------------------------------------------------------------------------------------------------------
------------------------------------------------查看buff----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
function CMonsterBuffSystem:ExecuFindbuff(objId,buffId,buffLevel)
	-- local cMapSystem = objPlayer:GetSystem("CMapSystem")
	-- local lockedPlayer = objPlayer:GetOtherPlayer(objId, 2);
	-- if not lockedPlayer then
		-- return;
	-- end;
	-- local buffTbl = {}
	-- if buffId == 0 then
		-- buffTbl = lockedPlayer.AllBuffTbl;
		-- --buff信息返回客户端
		-- objPlayer.ReturnBuffInfoMsg{BuffInfo = buffTbl};
	-- else
		-- for classId, ClassTbl in pairs(self.AllBuffTbl) do
			-- for buff_id, buffTbl in pairs(ClassTbl) do
				
				-- if buff_id == buffId then
					-- for entityId, buff in pairs(buffTbl) do
						-- if buff.m_Level == buffLevel then
							-- objPlayer.ReturnOneBuffInfoMsg{Buff = buff}
							-- break;
						-- end;
					-- end;
				-- end;
			-- end;
		-- end;
	-- end;
end;

--获得buff对象
function CMonsterBuffSystem:GetBuffObj(buffId)
	if not buffId  then
		return;
	end;
	if buffId == 0 then
		return;
	end;
	for classId, ClassTbl in pairs(self.AllBuffTbl) do
		for buff_id, buffTbl in pairs(ClassTbl) do	
			if buff_id == buffId then
				for entityId, buff in pairs(buffTbl) do
					return buff;
				end;
			end;
		end;
	end;
end;

--处理死亡buff
function CMonsterBuffSystem:ClearDeadBuff()
	
	for classId, classTbl in pairs(self.AllBuffTbl) do
		if classTbl then
			for buffId, buffIdTbl in pairs(classTbl) do
				if buffIdTbl then
					for entityId, buff in pairs(buffIdTbl) do
						self:DeleteBuffByType(buff)   --1为层,2为队
					end;
				end;
			end;
		end;
	end;
end;

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------buff的同步-------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--注册自己的system系统
function CMonsterBuffSystem:RegisterSystem(dwRoleID)
	local objPlayer = CMapManager:GetPlayer(dwRoleID);
	if objPlayer then
		self.setLookedPlayer[dwRoleID] = 0;
		--self.setLookedPlayer[objPlayer:GetRoleID()] = objPlayer;
		
		self:CopyBuffInfo();
		
		objPlayer.ReturnBuffInfoMsg{BuffInfo = self.CopyBuffTbl}
	end
end;

function CMonsterBuffSystem:UnRegisterSystem(dwRoleID)
	--table.remove(self.setLookedPlayer,dwRoleID);
	--self.setLookedPlayer[objPlayer:GetRoleID()] = nil;
	if dwRoleID then
		self.setLookedPlayer[dwRoleID] = nil;
		return;
	end
	self.setLookedPlayer = {}
end;

--广播消息
--SynOneBuff：添加BUFF，buffobj
--SynOnBuffDelete：删除BUFF，classId, buffId, deltype, entityId
--SynOneBuffValue：Value改变，buffobj
function CMonsterBuffSystem:BroadcastBuffMsg(szFuncName,...)
	local args={...};
	local setError = {};
	for dwID,_ in pairs(self.setLookedPlayer)do
		local objPlayer = CMapManager:GetPlayer(dwID);
		if objPlayer then
			local buffSystem = objPlayer:GetSystem("CBuffSystem");
			if buffSystem and buffSystem[szFuncName] then
				buffSystem[szFuncName](buffSystem,unpack(args));
			end
		else
			table.insert(setError,dwID);
		end
	end
	
	for _,id in pairs(setError)do
		self.setLookedPlayer[id] = nil;
	end
end;

--获取Buff的实例Id
function CMonsterBuffSystem:GetNextBuffID()
	self.m_EntityID = self.m_EntityID + 1;	--序列号自增
	return self.m_EntityID;
end;

----------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------同步中buff后的效果------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
function CMonsterBuffSystem:BroadCastBuffPfx(buff)
	-- local RoleID = self.objMon:GetID();
	-- --发给视野内的玩家
	-- local objMap = self.objMon:GetMap();
	-- if not objMap then
		-- return;
	-- end;
	-- local setViewPlayer = objMap:GetCanLookPlayer(self.objMon);
	-- if not setViewPlayer then
		-- return;
	-- end;
	
	local pfxId = buff.m_showId;
	
	self.objMon:AddViewPfx(pfxId)
	-- for k, v in pairs(setViewPlayer) do		
		-- local buffSystem = v:GetSystem("CBuffSystem");
		-- if buffSystem then
			-- buffSystem:BroadcastAddBuffAction(enEntType.eEntType_Monster,RoleID, pfxId);
		-- end
	-- end
end;
--------------------------------------------------------------------------------------------------------------
------------------------------同步清除buff后的效果---------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
function CMonsterBuffSystem:BroadCastDelBuffPfx(buff)
	-- local RoleID = self.objMon:GetID();
	--发给视野内的玩家
	-- local objMap = self.objMon:GetMap();
	-- if not objMap then
		-- return;
	-- end;
	-- local setViewPlayer = objMap:GetCanLookPlayer(self.objMon);
	-- if not setViewPlayer then
		-- return;
	-- end;
	
	local pfxId = buff.m_showId;
	self.objMon:RmvViewPfx(pfxId)
	-- for k, v in pairs(setViewPlayer) do		
		-- local buffSystem = v:GetSystem("CMonsterBuffSystem");
		-- if buffSystem then
			-- buffSystem:BroadcastDelBuffAction(enEntType.eEntType_Monster,RoleID, pfxId);
		-- end
	-- end
end;




