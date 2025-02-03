 _G.ActivityConfig = {};
 --祝福值数据表
local Record = {};
local function table_copy(t)
	local o = {}
	for k,v in pairs(t) do
		if type(v)=="table" then
			o[k] = table_copy(v)
		elseif type(v)~= "function" then
			o[k] = v
		end
	end
	return o;
end

ActivityConfig.Exp = {};
ActivityConfig.Monster = {};
--怪物重生数据
ActivityConfig.Revive = {};
--怪物攻城数据
ActivityConfig.GongCheng = {};

--定时加载
function ActivityConfig:Reload()
	--加载常规活动
	DataActExpBase:Reload()
	--加载怪物
	DataActMonsterBorn:Reload()
	--复制常规活动配置
	ActivityConfig.Exp = table_copy(_G.DataActExpBase);
	--复制怪物配置
	ActivityConfig.Monster = table_copy(_G.DataActMonsterBorn)
	--复制怪物活动配置
	ActivityConfig.GongCheng = table_copy(_G.DataActivity)
	
	--掉落热更
	CDropControlEx:ReLoad()
	--王者归来热更
	ComeBackConf:Reload()
	--华山论剑热更
	HSLJConf:Reload()
	--首充配置热更
	FullAwardConfig:Reload()
	--联运礼包热更
	UnionPlatformHotUpdate:Reload()
	--跨服战热更
	CrossSvrHotUpdate:Reload()
end

--活动效果是否生效
function ActivityConfig:Effect(mgrScript,y,m,d,h,mi)

	--拼接后的当前时间
	local str = string.format("%4d%2d%2d%2d%2d",y,m,d,h,mi)
	local JiLu = string.gsub(str," ","0")
	str = tonumber(JiLu)
	
	
	
	for k,n in pairs(self.Exp) do
		if (type(n)== "table") then
			local BaoCun = {};
			for loop = 1,2 do
				local t = n[1]
				local a = string.format("%4d%2d%2d%2d%2d",t.y,t.m,t.d,t.h,t.mi)
				BaoCun[loop] = 214214214213
			end
			--判断区间
			if (str >= BaoCun[1] and str <= BaoCun[2]) then
				local t = n[1]
				self.Exp[k].value = t.Again
			else
				local t = n[2]
				self.Exp[k].value = t.Again
			end
		end
		if (self.Exp[k].notice[JiLu]) then
			mgrScript:Notice(self.Exp[k].notice[JiLu],7,false,dwMapId,10)
		end
	end
	
	local Data = {
	
	
	};
	
	for loop = 4,10 do
		if self.Exp[loop] then
			Data[loop] = self.Exp[loop].value
		else
			Data[loop] = false
		end
	end
	
	local Change = false
	--对比
	for a,b in pairs(Data) do
		if (Data[a] ~= Record[a]) then
			Record[a] = Data[a]
			Change = true;
		end
	end
	
	if (Change) then
		Change = false
		CTianGuanCiFuMgr:SetFlag(Record)
	end
end
--常规怪物刷新
function ActivityConfig:Refurbish(mgrScript,Xian,y,m,d,h,mi)
	--拼接后的当前时间
	for k,n in pairs (self.Monster) do
		if (type(n)== "table") then
			local Sj = self.Monster[k].dtime
			--配置时间串
			local a = string.format("%4d%2d%2d%2d%2d",Sj.y,Sj.m,Sj.d,Sj.h,Sj.mi)
			a = tonumber((string.gsub(a," ","0")))
			--当前时间串
			local str = string.format("%4d%2d%2d%2d%2d",y,m,d,h,mi)
			str = tonumber((string.gsub(str," ","0")))

			--怪物复活区间
			if (self.Monster[k].Stop) then
				if (str <= tonumber(self.Monster[k].Stop)) then
					self.Monster[k].value = true
				else
					self.Monster[k].value = false
				end
			end

			if (a == str) then
				local Mon = self.Monster[k].id
				if not (Mon.fight_id or Mon.drop_id or Mon.mon_id or Mon.Look_id or Mon.ai_id) then 
					return
				end
				--检测该怪物是否有重生配置
				if (self.Monster[k].Amount) then
					ActivityConfig:Resurgence(k)
				end
				--线路
				for l,t in pairs(self.Monster[k].line) do
					--符合配置线路刷新
					if (t == Xian) then
						--坐标
						for z , d in pairs(self.Monster[k].pos) do
							mgrScript:AddMonToMap(d.id,Mon.mon_id,Mon.fight_id,Mon.ai_id,Mon.drop_id,Mon.Look_id,d.x,d.y)
						end
					end
				end
			end
			--独立公告于BOSS刷新无直接关系			
			if (self.Monster[k].notice[str]) then
				mgrScript:Notice(self.Monster[k].notice[str],7,false,dwMapId,10)
			end
		end
	end
end
--处理怪物复活
function ActivityConfig:Resurgence(k)
	local Mon = self.Monster[k].id
	self.Revive[Mon.mon_id] = {};
	--申请一个以怪物ID作为索引的表
	local t = self.Revive[Mon.mon_id]; 
	--存储怪物名称
	t.id = Mon
	--存储怪物位置
	t.pos = self.Monster[k].pos[1]
	--存储重生次数
	t.Amount = self.Monster[k].Amount
	--存储怪物数据
	if (self.Monster[k].Data) then
		for m , v in pairs(self.Monster[k].Data) do
			t.Data = t.Data or {};
			t.Data[m] = v
		end
	end
end
function ActivityConfig:GongChengMonster(mgrScript,Xian,y,m,d,h,mi,Mark)
	--拼接后的当前时间
	for k,n in pairs (self.GongCheng) do
		if (type(n)== "table") then
			--配置时间串
			local a = tonumber(self.GongCheng[k].dtime)
			--当前时间串
			local str = string.format("%4d%2d%2d%2d%2d",y,m,d,h,mi)
			str = tonumber((string.gsub(str," ","0")))
			if (a == str) then
				--符合配置线路刷新
				if (self.GongCheng[k].line == Xian) then
					ActivityConfig:Update(k,Mark)
				end
			end
		end
	end
end

--刷新活动怪物
function ActivityConfig:Update(k,Mark)
	local Sb = self.GongCheng[k][Mark].Mon
	self.GongCheng[k][Sb.mon_id] = self.GongCheng[Sb.mon_id] or {};
	self.GongCheng[k][Sb.mon_id].Max = #self.GongCheng[k][Mark].Pos
	self.GongCheng[k][Sb.mon_id].sign = Mark;
	for s , c in pairs(self.GongCheng[k][Mark].Pos) do
		CScriptManager:AddMonToMap(c.map,Sb.mon_id,Sb.fight_id,Sb.ai_id,Sb.drop_id,Sb.Look_id,c.x,c.y)
	end
end

--删除活动怪物
function ActivityConfig:Delete(y,m,d,h,mi)
	for k,n in pairs (self.GongCheng) do
		if (type(n)== "table") then
			--配置时间串
			local a = tonumber(n.Finish)
			--当前时间串
			local str = string.format("%4d%2d%2d%2d%2d",y,m,d,h,mi)
			str = tonumber((string.gsub(str," ","0")))
			if (a == str) then		
				for z,x in pairs(n) do
					if (type(x)== "table") then
						local mon = x.Mon.mon_id
						for m , v in pairs(x.Pos) do
							CScriptManager:HideMon(v.map,mon)
						end
					end
				end
			end
		end
	end
end


function ActivityConfig:Detection(Data)
	local Judge = false
	for k,n in pairs(Data) do
		if Judge then
			break
		end
		Judge = true
	end
	return Judge;
end




