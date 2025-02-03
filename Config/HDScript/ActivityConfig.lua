 _G.ActivityConfig = {};
 --ף��ֵ���ݱ�
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
--������������
ActivityConfig.Revive = {};
--���﹥������
ActivityConfig.GongCheng = {};

--��ʱ����
function ActivityConfig:Reload()
	--���س���
	DataActExpBase:Reload()
	--���ع���
	DataActMonsterBorn:Reload()
	--���Ƴ�������
	ActivityConfig.Exp = table_copy(_G.DataActExpBase);
	--���ƹ�������
	ActivityConfig.Monster = table_copy(_G.DataActMonsterBorn)
	--���ƹ�������
	ActivityConfig.GongCheng = table_copy(_G.DataActivity)
	
	--�����ȸ�
	CDropControlEx:ReLoad()
	--���߹����ȸ�
	ComeBackConf:Reload()
	--��ɽ�۽��ȸ�
	HSLJConf:Reload()
	--�׳������ȸ�
	FullAwardConfig:Reload()
	--��������ȸ�
	UnionPlatformHotUpdate:Reload()
	--���ս�ȸ�
	CrossSvrHotUpdate:Reload()
end

--�Ч���Ƿ���Ч
function ActivityConfig:Effect(mgrScript,y,m,d,h,mi)

	--ƴ�Ӻ�ĵ�ǰʱ��
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
			--�ж�����
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
	--�Ա�
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
--�������ˢ��
function ActivityConfig:Refurbish(mgrScript,Xian,y,m,d,h,mi)
	--ƴ�Ӻ�ĵ�ǰʱ��
	for k,n in pairs (self.Monster) do
		if (type(n)== "table") then
			local Sj = self.Monster[k].dtime
			--����ʱ�䴮
			local a = string.format("%4d%2d%2d%2d%2d",Sj.y,Sj.m,Sj.d,Sj.h,Sj.mi)
			a = tonumber((string.gsub(a," ","0")))
			--��ǰʱ�䴮
			local str = string.format("%4d%2d%2d%2d%2d",y,m,d,h,mi)
			str = tonumber((string.gsub(str," ","0")))

			--���︴������
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
				--���ù����Ƿ�����������
				if (self.Monster[k].Amount) then
					ActivityConfig:Resurgence(k)
				end
				--��·
				for l,t in pairs(self.Monster[k].line) do
					--����������·ˢ��
					if (t == Xian) then
						--����
						for z , d in pairs(self.Monster[k].pos) do
							mgrScript:AddMonToMap(d.id,Mon.mon_id,Mon.fight_id,Mon.ai_id,Mon.drop_id,Mon.Look_id,d.x,d.y)
						end
					end
				end
			end
			--����������BOSSˢ����ֱ�ӹ�ϵ			
			if (self.Monster[k].notice[str]) then
				mgrScript:Notice(self.Monster[k].notice[str],7,false,dwMapId,10)
			end
		end
	end
end
--������︴��
function ActivityConfig:Resurgence(k)
	local Mon = self.Monster[k].id
	self.Revive[Mon.mon_id] = {};
	--����һ���Թ���ID��Ϊ�����ı�
	local t = self.Revive[Mon.mon_id]; 
	--�洢��������
	t.id = Mon
	--�洢����λ��
	t.pos = self.Monster[k].pos[1]
	--�洢��������
	t.Amount = self.Monster[k].Amount
	--�洢��������
	if (self.Monster[k].Data) then
		for m , v in pairs(self.Monster[k].Data) do
			t.Data = t.Data or {};
			t.Data[m] = v
		end
	end
end
function ActivityConfig:GongChengMonster(mgrScript,Xian,y,m,d,h,mi,Mark)
	--ƴ�Ӻ�ĵ�ǰʱ��
	for k,n in pairs (self.GongCheng) do
		if (type(n)== "table") then
			--����ʱ�䴮
			local a = tonumber(self.GongCheng[k].dtime)
			--��ǰʱ�䴮
			local str = string.format("%4d%2d%2d%2d%2d",y,m,d,h,mi)
			str = tonumber((string.gsub(str," ","0")))
			if (a == str) then
				--����������·ˢ��
				if (self.GongCheng[k].line == Xian) then
					ActivityConfig:Update(k,Mark)
				end
			end
		end
	end
end

--ˢ�»����
function ActivityConfig:Update(k,Mark)
	local Sb = self.GongCheng[k][Mark].Mon
	self.GongCheng[k][Sb.mon_id] = self.GongCheng[Sb.mon_id] or {};
	self.GongCheng[k][Sb.mon_id].Max = #self.GongCheng[k][Mark].Pos
	self.GongCheng[k][Sb.mon_id].sign = Mark;
	for s , c in pairs(self.GongCheng[k][Mark].Pos) do
		CScriptManager:AddMonToMap(c.map,Sb.mon_id,Sb.fight_id,Sb.ai_id,Sb.drop_id,Sb.Look_id,c.x,c.y)
	end
end

--ɾ�������
function ActivityConfig:Delete(y,m,d,h,mi)
	for k,n in pairs (self.GongCheng) do
		if (type(n)== "table") then
			--����ʱ�䴮
			local a = tonumber(n.Finish)
			--��ǰʱ�䴮
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




