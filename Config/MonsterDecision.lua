_G.MonsterDecision = {};

function MonsterDecision:InitDrop()
	--变异怪物使用的掉落包
	for loop = 10,100,5 do
		--银子数据
		local figure = 29000 + loop
		local A = _G.DropConfig[figure][1]
		--五星的掉落
		for circulate = 1000,5000,1000 do
			--星级道具掉落
			local XingJi = 	40000 + (circulate/1000)+1
			local drop = _G.DropConfig[XingJi][1]
			--计算新的ID
			local join = 920000 + circulate + loop
			_G.DropConfig[join] = {};
			--生成新的道具掉落ID
			--大于4星的双倍掉钱
			if (circulate >= 4000) then
				_G.DropConfig[join][1] = A..drop..A;
			else
				_G.DropConfig[join][1] = A..drop
			end
		end
	end
	--藏宝图使用的掉落包

	local Piece = 930000;
	
	for BigLoop = 5600030,5600040,10 do
		Piece = Piece + 1000;
		local LinShi = 0;
		--蓝色装备
		for loop = 19102,19402,100 do
			LinShi = LinShi + 1
			local Save = Piece + LinShi + 100
			_G.DropConfig[Save] = {};
			_G.DropConfig[Save][1] = _G.DropConfig[BigLoop][1].._G.DropConfig[loop][1];
		end
		LinShi = 0;
		--紫色装备
		for loop = 19103,19403,100 do
			LinShi = LinShi + 1
			local Save = Piece + LinShi + 200
			_G.DropConfig[Save] = {};
			_G.DropConfig[Save][1] = _G.DropConfig[BigLoop][1].._G.DropConfig[loop][1];
		end
	end
end
_G.MonsterDecision_variation_data = {
		base = {
		--一星
		[1] = {[1] = 1.2,[2] = 1.3,[3] = 1.2,[4] = 3,[5] = 1.2,[6] = 4.5};
		--二星
		[2] = {[1] = 1.4,[2] = 1.6,[3] = 1.3,[4] = 6,[5] = 1.5,[6] = 9};	   
		--三星
		[3] = {[1] = 1.7,[2] = 2,[3] = 1.41,[4] = 10,[5] = 1.9,[6] = 15};			   
		--四星
		[4] = {[1] = 2,[2] = 2.5,[3] = 1.52,[4] = 20,[5] = 2.4,[6] = 30};
		--五星
		[5] = {[1] = 2.3,[2] = 3,[3] = 1.63,[4] = 40,[5] = 3,[6] = 60};
		};
		--BOSS星级属性
		Boss_base = {
		--一星
		[1] = {[1] = 1.1,[2] = 1.2,[3] = 1.2,[4] = 2,[5] = 1.1,[6] = 6};
		--二星
		[2] = {[1] = 1.19,[2] = 1.4,[3] = 1.3,[4] = 3,[5] = 1.2,[6] = 9};	   
		--三星
		[3] = {[1] = 1.3,[2] = 1.6,[3] = 1.41,[4] = 4.5,[5] = 1.3,[6] = 13.5};			   
		--四星
		[4] = {[1] = 1.43,[2] = 1.8,[3] = 1.52,[4] = 6,[5] = 1.4,[6] = 18};
		--五星
		[5] = {[1] = 1.58,[2] = 2.2,[3] = 1.63,[4] = 8,[5] = 1.5,[6] = 24};
		};
		--星级配置
		rank =
		{
		[1] = {picture = 201,deploy = 1000,sign = 9556};
		[2] = {picture = 202,deploy = 2000,sign = 9557};
		[3] = {picture = 203,deploy = 3000,sign = 9558};
		[4] = {picture = 204,deploy = 4000,sign = 9559};
		[5] = {picture = 205,deploy = 5000,sign = 9560};
		};
	
};

function MonsterDecision:BirthAgo(Monster)
	--拿到怪物的时时属性
	local sysMonsterSkill = Monster:GetSystem("CMonsterSkillSystem")
	local Values = sysMonsterSkill:GetInfo()
	local list = MonsterDecision_variation_data
--------------------------------------------------------------------------
	local FightId = Monster:GetFightId()
	local cfg  = MonsterFightInfo[FightId]
	local GwId = Monster:GetID();
	local Mdc = MonsterDataConfig[GwId]
--	local dwLook = Mdc.look
	local Name = Mdc.name
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
--------------------------------------------------------------------------
	--怪物图片高度
	local dwLook = Monster.dwLookId
	local Cname = MNLookConfig[dwLook].Height
--------------------------------------------------------------------------
	--万分制 调整怪物产生变异几率
	local variation = 50;
	--随即星等级
	local grade = 1;
	local casual = math.random(117550);
	if (casual <= 100000) then
		grade = 1;
	elseif (casual <= 115000) then
		grade = 2;
	elseif (casual <= 117000) then
		grade = 3;
	elseif (casual <= 117500) then
		grade = 4;
	else
		grade = 5;
	end
	
	--道具召唤变异
	if (_G.MonsterDecision.Proving) then
		--local casual = math.random(5);
		grade = _G.MonsterDecision.Proving;
		variation = 10000;
		_G.MonsterDecision.Proving = false
	end

	--属性基础信息
	local attribute = 
	{
		--防御
		{nature = Values.dwDefense,One = "dwDefense"};
		--攻击
		{nature = Values.dwAttack,One = "dwAttack"};
		--暴击
		{nature = Values.dwCrit,One = "dwCrit"};
		--生命
		{nature = Values.dwHPMax,One = "dwHPMax"};
		--身法
		{nature = Values.dwFlee,One = "dwFlee"};
	};

	
	--怪物等级
	local Lev = Monster:GetLevel();
	--保护
	if (Lev <= 10) then
		Lev = 10;
	elseif (Lev >= 100) then
		Lev = 100;
	end
	--所属等级段
	local category = math.floor((Lev-1)/5)*5;
	--掉落ID
	local fall = 920000 + list.rank[grade].deploy + category;

	--当前经验
	local Exp = Monster:GetExp()
	local Rand = math.random(10000);
	if (Rand <= variation) then
		for circulate = 1,#attribute do
			local t = attribute[circulate];
			--判断怪物类型
			if (Mdc._type == 2) then
				local f = list.Boss_base[grade][circulate];
				local result = t.nature*f;
				--增加属性
				Monster:SetProperty(t.One,result);	
				Monster:SetExp(Exp*list.Boss_base[grade][6])
			else
				local f = list.base[grade][circulate];
				local result = t.nature*f;
				--增加属性
				Monster:SetProperty(t.One,result);	
				--增加经验
				Monster:SetExp(Exp*list.base[grade][6])
			end
		end
		--sysMonsterBuff:AddBuff(list.rank[grade].sign,1,Monster)
		--告知成就系统变异怪物		
		Monster:SetVariation(true,grade)
		--添加图片
		Monster:AddPic(list.rank[grade].picture,{x=(-0.015*2),y=-0.30,z=Cname},0.55,0.13)
		--额外添加掉落
		Monster:SetDropEx(fall)
	end
end

-------------计算年月日-------------------
function MonsterDecision:Time()
	local dwNowTime = math.modf(_now()/1000)
	--Day 天
	--Month 月
	--Year 年
	local dwYear,dwMonth,dwDay,dwHour,dwMin,dwSec = CTimeFormat:todate(dwNowTime, true, quick)
	--这个返回的是星期几
	local dwWeek = CTimeFormat:toweekEx(dwNowTime) + 1
	local list = 
	{
		dwYear = dwYear,
		dwMonth = dwMonth,
		dwDay = dwDay,
		dwWeek = dwWeek,
		dwHour = dwHour,
		dwMin = dwMin,
		dwSec = dwSec,
	};
	return list;
end

--Monster信息,nature 属性类型1生命2攻击,quantity数量，
function MonsterDecision:property(Monster,nature,quantity)
		if (quantity == 0) then
			return
		end
		--拿到怪物的时时属性
		local sysMonsterSkill = Monster:GetSystem("CMonsterSkillSystem")
		local Values = sysMonsterSkill:GetInfo()
		--拿到属性的方法
		local FightId = Monster:GetFightId()
		local cfg = MonsterFightInfo[FightId]
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		--属性集合
		local kind =  
		{
			--生命上限
			[1] = {quality = "dwHPMax",boost = Values.dwHPMax,Add = 0.1};
			--攻击
			[2] = {quality = "dwAttack",boost = Values.dwAttack,Add = 0.1};
		};
		local price = kind[nature].boost * (1 + (kind[nature].Add*quantity))
		--增加属性
		Monster:SetProperty(kind[nature].quality,price);
		if (nature == 1) then
			sysMonsterBuff:AddBuff(9555,quantity,Monster)
		else
			sysMonsterBuff:AddBuff(9554,quantity,Monster)
		end
end

--返回怪物当前生命比
function MonsterDecision:life(Monster)
	--定义怪物多少血量触发 用于怪物心法
	local trigger = 0.3
	
	--获取当前血量
	local current = Monster:GetHP()	
	--获取全部血量
	local all = Monster:GetMaxHP()
	local percent = current/all;
	return percent,trigger;
end

--珍珑棋局  根据生命决定释放频率
function MonsterDecision:odds(Monster,decide)
	local dwRand = math.random(10000);
	local Hp =	MonsterDecision:life(Monster)
	if (decide) and (Hp <= 0.4) then
		dwRand = dwRand + 2000
	end
	return dwRand;
end

--5次必出一次技能
function MonsterDecision:factor(parameter)
	if not parameter then
		return
	end
	local dwRand = math.random(10000);
	local probability = 1000 + (parameter * 800)
	if (probability >= dwRand) then
		return true
	end
end

--增加怪物属性
function MonsterDecision:AllPropertyBoost(Monster,parameter)
	--拿到怪物的时时属性
	local sysMonsterSkill = Monster:GetSystem("CMonsterSkillSystem")
	local Values = sysMonsterSkill:GetInfo()

	local FightId = Monster:GetFightId()
	local cfg = MonsterFightInfo[FightId]
	--属性基础信息
	local attribute = 
	{
		--防御
		{nature = Values.dwDefense,One = "dwDefense"};
		--攻击
		{nature = Values.dwAttack,One = "dwAttack"};
		--暴击
		{nature = Values.dwCrit,One = "dwCrit"};
		--生命
		{nature = Values.dwHPMax,One = "dwHPMax"};
		--身法
		{nature = Values.dwFlee,One = "dwFlee"};
	};	
	for loop = 1,#attribute do
		local a = attribute[loop]
		local result = a.nature *(1 + parameter)
		--增加属性
		Monster:SetProperty(a.One,result);	
	end
end


--十面埋伏怪物属性增减
function MonsterDecision:Ambush(Monster,Data)
	local sysMonsterSkill = Monster:GetSystem("CMonsterSkillSystem")
	local Values = sysMonsterSkill:GetInfo()
	for k,n in pairs(Data) do
		local nature = Values[n[1]] * n[2];
		Monster:SetProperty(n[1],nature)
	end
end



-- --倒计时喊话
-- local Calculate = function(param1,Monster)
	-- Monster:Say("删除计时:["..param1.."]")
-- end
-- --怪物回收
-- local Rubbish = function(Monster)
	-- Monster:Remove()
-- end
--第一个参数Monster，第2个生命周期，第3个回收事件
function MonsterDecision:Yell(Monster,Zero,Gap)
	local Result = (1000*Zero) - (1000*Gap);
	if (Result <= 0) then
		return
	end
	local Map = Monster:GetMap()
	--开始倒计时事件
	local Whole = math.floor(Result)
	for loop = 1,Gap do
		local ShiJian = math.floor(Whole + 1000*loop);
		local a = Gap-loop
		Map:AddTimeEvent( ShiJian,  function()Monster:Say("删除计时:["..a.."]")end)
		Map:AddTimeEvent( (1000*Zero),  function()Monster:Remove()end)
	end
end

--怪物狂暴
function MonsterDecision:Fury(Monster)

	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(9501,1,Monster)
end