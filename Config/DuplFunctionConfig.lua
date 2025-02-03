_G.DuplAddition = {};

DuplAddition[1007] = {};

local Form1007 = DuplAddition[1007]

local cdata = {
	[1] = 0;
	[2] = 1;
	[3] = 2;
	[4] = 3;
	[5] = 5;
	[6] = 7;
	[7] = 8;
	[8] = 9;
	[9] = 10;
	[10] = 12;
	[11] = 15;
	[12] = 17;
	[13] = 20;
	[14] = 22;
	[15] = 24;
	[16] = 7;
	[17] = 15;
	[18] = 24;
	[19] = 24;
	[24] = 15;
	[25] = 15;
};

--十面埋伏怪物信息
Form1007.Monster = {
	News = {
		[1] = {mon=50600001,ai=50600001,drop = 100075,look=100320010};
		[2] = {mon=50600002,ai=50600002,drop = 100075,look=100320050};
		[3] = {mon=50600003,ai=50600003,drop = 100075,look=100320030};
		[4] = {mon=50600004,ai=50600004,drop = 100075,look=100320040};
		[5] = {mon=50600005,ai=50600005,drop = 100075,look=100320010};
	
		[6] = {mon=50600006,ai=50600006,drop = 100080,look=100320020};
		[7] = {mon=50600007,ai=50600007,drop = 100080,look=100520010};
		[8] = {mon=50600008,ai=50600008,drop = 100080,look=100420030};
		[9] = {mon=50600009,ai=50600009,drop = 100080,look=100420020};
		[10] = {mon=50600010,ai=50600010,drop = 100080,look=100520010};
		
		[11] = {mon=50600011,ai=50600011,drop = 100085,look=100720020};
		[12] = {mon=50600012,ai=50600012,drop = 100085,look=100420020};
		[13] = {mon=50600013,ai=50600013,drop = 100085,look=100420020};
		[14] = {mon=50600014,ai=50600014,drop = 100085,look=100320040};
		[15] = {mon=50600015,ai=50600015,drop = 100085,look=100520010};
		--BOSS
		[16] = {mon=50603001,ai=50603001,drop=102070,look=100420031};
		[17] = {mon=50603002,ai=50603002,drop=103080,look=507200080};
		[18] = {mon=50603003,ai=50603003,drop=103085,look=100110114};
		[19] = {mon=50604001,ai=50604001,drop=103085,look=100920060};
		--BUFF箱子
		[20] = {mon=50604002,ai=80,drop=-1,look=11220};
		[21] = {mon=50604003,ai=80,drop=-1,look=11220};
		[22] = {mon=50604004,ai=80,drop=-1,look=11220};
		[23] = {mon=50604005,ai=80,drop=-1,look=11220};
		--护卫怪物
		[24] = {mon=50600016,ai=50600016,drop=100085,look=100420030};
		[25] = {mon=50600017,ai=50600017,drop=100085,look=100320020};
	};
	fight = function(dwLevelt,News)
		if (News <= 15) then
			local a = dwLevelt + cdata[News]
			return (2000+a);
		elseif (News <= 19) then
			local a = dwLevelt + cdata[News]
			return (3000+a);
		elseif (News <= 23) then
			return 1001;
		else
			local a = dwLevelt + cdata[News]
			return (2000+a);
		end;
	end;
	--刷怪数量延迟
	Rests = function(dwLevelt,Degree)
		local data  = {
			{5,5000};
			{10,10000};
			{20,20000};
		}
		return data
	end;
};


function Form1007:Grow(mgrMonster,loop,dwLevelt,News)
	local t = Form1007.Monster.News[News]
	local fight = Form1007.Monster.fight(dwLevelt,News)
	local x = Form1007.Place[loop].x;
	local y = Form1007.Place[loop].y
	if (News >= 20 and News <= 23) then
		x = Form1007.BaoXiang[News].x;
		y = Form1007.BaoXiang[News].y
	elseif (News >= 16 and News <= 19) then
		x = Form1007.BOSS[News].x;
		y = Form1007.BOSS[News].y
	end
	mgrMonster:Add(t.mon,fight,t.ai,t.drop,t.look,x,y,nil);
end

--十面埋伏坐标
Form1007.Place = {
	{x=10.4,y=9.72,};
	{x=-19.49,y=9.79,};
    {x=-9.79,y=-5.5,};
    {x=4.9,y=-20.24,};
    {x=16.52,y=-11.87,};
    
    {x=7.31,y=11.84,};
    {x=-19.73,y=6.71,};
    {x=-10.20,y=-8.33,};
    {x=1.69,y=-19.58,};
    {x=15.36,y=-14.70,};
    
    {x=9.18,y=5.32,};
    {x=-16.55,y=9.6,};
    {x=-7.44,y=-8.53,};
    {x=1.57,y=-16.71,};
    {x=12.73,y=-15.40,};
    
    {x=7.55,y=7.94,};
    {x=-16.81,y=7.8,};
    {x=-8.67,y=-11.7,};
    {x=4.53,y=-17.66,};
    {x=16.16,y=-9.15,};
    
    {x=4.25,y=9.17,};
    {x=-13.44,y=9.45,};
    {x=-5.69,y=-10.92,};
    {x=-0.32,y=-19.84,};
    {x=14.16,y=-11.90,};
    
    {x=2.51,y=10.44,};
    {x=-17.76,y=5.68,};
    {x=-10.99,y=-3.62,};
    {x=-0.36,y=-15.47,};
    {x=14.46,y=-9.49,};
    
    {x=9.43,y=11.10,};
    {x=-18.5,y=3.77,};
	{x=-10.41,y=-10.75,};
	{x=3.10,y=-20.99,};
	{x=12.98,y=-13.23,};
    
    {x=6.98,y=9.73,};
    {x=-15.37,y=7.59,};
    {x=-8.55,y=-6.32,};
    {x=-0.33,y=-17.39,};
    {x=14.67,y=-16.28,};
};	

Form1007.BaoXiang = {
	[20] = {x=6,y=-6};
	[21] = {x=9,y=3};
	[22] = {x=-4,y=5};
	[23] = {x=-7,y=-5};
};

Form1007.BOSS = {
	[16] = {x=11,y=2};
	[17] = {x=11,y=2};
	[18] = {x=11,y=2};
	[19] = {x=2,y=8};
};



--小猪快跑数值配置

DuplAddition[1017] = {};

local Form1017 = DuplAddition[1017]

Form1017.Exp = 
{
	[45] = {ratio = 10},
	[46] = {ratio = 10},
	[47] = {ratio = 10},
	[48] = {ratio = 10},
	[49] = {ratio = 10},
	[50] = {ratio = 11},
	
	[51] = {ratio = 12},
	[52] = {ratio = 13},
	[53] = {ratio = 14},
	[54] = {ratio = 16},
	[55] = {ratio = 18},
	
	[56] = {ratio = 20},
	[57] = {ratio = 23},
	[58] = {ratio = 27},
	[59] = {ratio = 32},
	[60] = {ratio = 37},	

	[61] = {ratio = 43},
	[62] = {ratio = 50},
	[63] = {ratio = 58},
	[64] = {ratio = 66},
	[65] = {ratio = 74},	

	[66] = {ratio = 82},
	[67] = {ratio = 90},
	[68] = {ratio = 98},
	[69] = {ratio = 106},
	[70] = {ratio = 114},	

	[71] = {ratio = 122},
	[72] = {ratio = 130},
	[73] = {ratio = 138},
	[74] = {ratio = 146},
	[75] = {ratio = 154},

	[76] = {ratio = 162},
	[77] = {ratio = 170},
	[78] = {ratio = 178},
	[79] = {ratio = 186},
	[80] = {ratio = 194},	

	[81] = {ratio = 200},
	[82] = {ratio = 200},
	[83] = {ratio = 200},
	[84] = {ratio = 200},
	[85] = {ratio = 200},	

	[86] = {ratio = 200},
	[87] = {ratio = 200},
	[88] = {ratio = 200},
	[89] = {ratio = 200},
	[90] = {ratio = 200},

	[91] = {ratio = 200},
	[92] = {ratio = 200},
	[93] = {ratio = 200},
	[94] = {ratio = 200},
	[95] = {ratio = 200},

	[96] = {ratio = 200},
	[97] = {ratio = 200},
	[98] = {ratio = 200},
	[99] = {ratio = 200},
	[100] = {ratio = 200},	

	[101] = {ratio = 200},
	[102] = {ratio = 200},
	[103] = {ratio = 200},
	[104] = {ratio = 200},
	[105] = {ratio = 200},	

	[106] = {ratio = 200},
	[107] = {ratio = 200},
	[108] = {ratio = 200},
	[109] = {ratio = 200},
	[110] = {ratio = 200},	

	[111] = {ratio = 200},
	[112] = {ratio = 200},
	[113] = {ratio = 200},
	[114] = {ratio = 200},
	[115] = {ratio = 200},	

	[116] = {ratio = 200},
	[117] = {ratio = 200},
	[118] = {ratio = 200},
	[119] = {ratio = 200},
	[120] = {ratio = 200},		
};

--小猪战斗ID
Form1017.FightTable = 
{
	[45] = {FightID = 70045},
	[46] = {FightID = 70046},
	[47] = {FightID = 70047},
	[48] = {FightID = 70048},
	[49] = {FightID = 70049},
	[50] = {FightID = 70050},
	
	[51] = {FightID = 70051},
	[52] = {FightID = 70052},
	[53] = {FightID = 70053},
	[54] = {FightID = 70054},
	[55] = {FightID = 70055},
	
	[56] = {FightID = 70056},
	[57] = {FightID = 70057},
	[58] = {FightID = 70058},
	[59] = {FightID = 70059},
	[60] = {FightID = 70060},	
	
	[61] = {FightID = 70061},
	[62] = {FightID = 70062},
	[63] = {FightID = 70063},
	[64] = {FightID = 70064},
	[65] = {FightID = 70065},	
	
	[66] = {FightID = 70066},
	[67] = {FightID = 70067},
	[68] = {FightID = 70068},
	[69] = {FightID = 70069},
	[70] = {FightID = 70070},	
	
	[71] = {FightID = 70071},
	[72] = {FightID = 70072},
	[73] = {FightID = 70073},
	[74] = {FightID = 70074},
	[75] = {FightID = 70075},
	
	[76] = {FightID = 70076},
	[77] = {FightID = 70077},
	[78] = {FightID = 70078},
	[79] = {FightID = 70079},
	[80] = {FightID = 70080},	
	
	[81] = {FightID = 70081},
	[82] = {FightID = 70082},
	[83] = {FightID = 70083},
	[84] = {FightID = 70084},
	[85] = {FightID = 70085},	
	
	[86] = {FightID = 70086},
	[87] = {FightID = 70087},
	[88] = {FightID = 70088},
	[89] = {FightID = 70089},
	[90] = {FightID = 70090},
	
	[91] = {FightID = 70091},
	[92] = {FightID = 70092},
	[93] = {FightID = 70093},
	[94] = {FightID = 70094},
	[95] = {FightID = 70095},

	[96] = {FightID = 70096},
	[97] = {FightID = 70097},
	[98] = {FightID = 70098},
	[99] = {FightID = 70099},
	[100] = {FightID = 70100},	

	[101] = {FightID = 70101},
	[102] = {FightID = 70102},
	[103] = {FightID = 70103},
	[104] = {FightID = 70104},
	[105] = {FightID = 70105},	

	[106] = {FightID = 70106},
	[107] = {FightID = 70107},
	[108] = {FightID = 70108},
	[109] = {FightID = 70109},
	[110] = {FightID = 70110},	

	[111] = {FightID = 70111},
	[112] = {FightID = 70112},
	[113] = {FightID = 70113},
	[114] = {FightID = 70114},
	[115] = {FightID = 70115},	

	[116] = {FightID = 70116},
	[117] = {FightID = 70117},
	[118] = {FightID = 70118},
	[119] = {FightID = 70119},
	[120] = {FightID = 70120},		
}; 

--小猪标记
Form1017.Mark = 0;	
	
-- --小猪用计数
-- function Form:MarkNum(Map,Monster)
	-- local Players = Map:GetAllPlayer()			--获得地图中的所有玩家
	-- for _,objPlayer in pairs(Players) do
		-- local sysDupl = objPlayer:GetSystem("CDuplSystem")
		-- if sysDupl:IsInFb() then
			-- sysDupl:SetKillNum(Monster:GetMonsterType(), 1,Monster:GetID())
		-- end
		-- break;
	-- end
-- end

function Form1017:GetFightIDToPig(Map)	
	local dwAllLevel = 0						
	local dwPlayerNum = 0
	local Players = Map:GetAllPlayer()	
	for _,objPlayer in pairs(Players) do
		dwAllLevel = dwAllLevel + objPlayer:GetLevel()
		dwPlayerNum = dwPlayerNum + 1
	end
	local EquallyLevel = math.floor(dwAllLevel/dwPlayerNum)
	return Form1017.FightTable[EquallyLevel].FightID
	
	-- local BaseLevel = 45;
	-- local BaseFightID = 7045;
	-- return 	BaseFightID+(EquallyLevel-BaseLevel);
	
end

function Form1017:AddExp(EquallyLevel,Players,Type)	
	local ratio = Form1017.Exp[EquallyLevel].ratio
	local LastExp = 0
	if Type==1 then
		LastExp = math.floor((EquallyLevel^2)*ratio)
	elseif Type==2 then
		LastExp = math.floor((EquallyLevel^2)*ratio*2)
	elseif Type==3 then
		LastExp = math.floor((EquallyLevel^2)*ratio*0.01)
	elseif Type==4 then
		LastExp = math.floor((EquallyLevel^2)*ratio*2*0.01)		
	end
	
	for _,objPlayer in pairs(Players) do
		objPlayer:AddExp(LastExp)
	end 
end
	
-- function Form:AddExpTidy(Map,Type)	
	-- local dwAllLevel = 0						
	-- local dwPlayerNum = 0
	-- local Players = Map:GetAllPlayer()	
	-- for _,objPlayer in pairs(Players) do
		-- dwAllLevel = dwAllLevel + objPlayer:GetLevel()
		-- dwPlayerNum = dwPlayerNum + 1
		
	-- end
	-- local EquallyLevel = math.floor(dwAllLevel/dwPlayerNum)

	-- local ratio = Form.Exp[EquallyLevel].ratio
	-- local LastExp = 0
	-- if Type==1 then
		-- LastExp = math.floor((EquallyLevel^2)*ratio)
	-- elseif Type==2 then
		-- LastExp = math.floor((EquallyLevel^2)*ratio*2)
	-- elseif Type==3 then
		-- LastExp = math.floor((EquallyLevel^2)*ratio*0.01)
	-- elseif Type==4 then
		-- LastExp = math.floor((EquallyLevel^2)*ratio*2*0.01)		
	-- end
	
	-- for _,objPlayer in pairs(Players) do
		-- objPlayer:AddExp(LastExp)
	-- end 
-- end


-- --删除小猪
-- function Form:DelMonToWinDulp(Map,mgrMonster)

	-- if self.Mark == 10 then		--如果标记为10
		-- local tempPlayer = nil;
		-- local Players = Map:GetAllPlayer()			--获得地图中的所有玩家
		-- for _,objPlayer in pairs(Players) do
			-- tempPlayer = objPlayer;
			-- break;
		-- end	

		-- local Monster = mgrMonster:GetMonsterById(50740001)
		-- local Monster1 = mgrMonster:GetMonsterById(50740002)
		-- local Monster2 = mgrMonster:GetMonsterById(50740003)
		-- local Monster3 = mgrMonster:GetMonsterById(50740004)
		-- local Monster4 = mgrMonster:GetMonsterById(50740006)
		-- local Monster5 = mgrMonster:GetMonsterById(50740007)
		-- local Monster6 = mgrMonster:GetMonsterById(50740008)
		-- local Monster7 = mgrMonster:GetMonsterById(50740009)
		-- if (#Monster==0) and (#Monster1==0) and (#Monster2==0) and (#Monster3==0) and 
			-- (#Monster4==0) and (#Monster5==0) and (#Monster6==0) and (#Monster7==0) then
			
			-- local TeamSystem = tempPlayer:GetSystem("CTeamSystem")
			-- local memberTbl = TeamSystem:GetTeamLeaguer()
			-- if memberTbl then
				-- for i,memberId in ipairs(memberTbl) do
					-- local objPlayer1 = CMapManager:GetPlayer(memberId)			
					-- local sysKill = objPlayer1:GetSystem("CSkillSystem");
					-- if sysKill then
						-- --添加小猪技能
						-- sysKill:DoDelSkill(52000);
						-- sysKill:DoDelSkill(52001);	
					-- end
				-- end;
			-- end
			-- local duplSystem = tempPlayer:GetSystem("CDuplSystem");
			-- duplSystem.objCurDupl:ShowCountDown();			
			-- self.Mark = 0;
		-- end 
	 -- end
-- end

----------------------------------------------------------------------------
----------------------------------------------------------------------------
----------------------------------------------------------------------------
DuplAddition[6001] = {};	--群侠
local Form6001 = DuplAddition[6001]

Form6001.DateInfo = {
	--怪物信息
	Monster = {			--刷出哪个群侠BOSS取决于副本ID，将想刷的BOSS跟相应的副本ID匹配
		--怪物ID    怪物AI   掉落ID   LookID    怪物的等阶（boss 1：世界boss，2）
		[6001] = {MonID = 60011001, MonAI = 60011001,DropID = 940009,LookID = 100110240,Monstage = 1};		
		[6002] = {MonID = 60011002, MonAI = 60011002,DropID = 940009,LookID = 100210080,Monstage = 1};
		[6003] = {MonID = 60011003, MonAI = 60011003,DropID = 940009,LookID = 100210110,Monstage = 1};
		[6004] = {MonID = 60011004, MonAI = 60011004,DropID = 940009,LookID = 100210040,Monstage = 1};
		[6005] = {MonID = 60011005, MonAI = 60011005,DropID = 940009,LookID = 100210030,Monstage = 1};
		[6006] = {MonID = 60011006, MonAI = 60011006,DropID = 940009,LookID = 100210050,Monstage = 1};
		[6007] = {MonID = 60011007, MonAI = 60011007,DropID = 940009,LookID = 100210400,Monstage = 1};
		[6008] = {MonID = 60011008, MonAI = 60011008,DropID = 940009,LookID = 100210090,Monstage = 1};
		[6009] = {MonID = 60011009, MonAI = 60011009,DropID = 940009,LookID = 100210410,Monstage = 1};
		[6010] = {MonID = 60011010, MonAI = 60011010,DropID = 9400010,LookID = 100210130,Monstage = 2};
		[6011] = {MonID = 60011011, MonAI = 60011011,DropID = 9400010,LookID = 100620020,Monstage = 2};
		[6012] = {MonID = 60011012, MonAI = 60011012,DropID = 940009,LookID = 100120042,Monstage = 2};
		[6013] = {MonID = 60011013, MonAI = 60011013,DropID = 940009,LookID = 100210240,Monstage = 2};
		[6014] = {MonID = 60011014, MonAI = 60011014,DropID = 940009,LookID = 503020640,Monstage = 2};
		[6015] = {MonID = 60011015, MonAI = 60011015,DropID = 940009,LookID = 100410060,Monstage = 2};
		[6016] = {MonID = 60011016, MonAI = 60011016,DropID = 940009,LookID = 100210980,Monstage = 2};
		[6017] = {MonID = 60011017, MonAI = 60011017,DropID = 940009,LookID = 100210250,Monstage = 2};
		[6018] = {MonID = 60011018, MonAI = 60011018,DropID = 940009,LookID = 100820080,Monstage = 2};
		[6019] = {MonID = 60011019, MonAI = 60011019,DropID = 940009,LookID = 100710090,Monstage = 3};
		[6020] = {MonID = 60011020, MonAI = 60011020,DropID = 940009,LookID = 101120070,Monstage = 3};
		[6021] = {MonID = 60011021, MonAI = 60011021,DropID = 940009,LookID = 100210010,Monstage = 3};
		[6022] = {MonID = 60011022, MonAI = 60011022,DropID = 940009,LookID = 100920080,Monstage = 3};
		[6023] = {MonID = 60011023, MonAI = 60011023,DropID = 940009,LookID = 101120110,Monstage = 3};
		[6024] = {MonID = 60011024, MonAI = 60011024,DropID = 940009,LookID = 100920070,Monstage = 3};
		[6025] = {MonID = 60011025, MonAI = 60011025,DropID = 940009,LookID = 100210280,Monstage = 3};
		[6026] = {MonID = 60011026, MonAI = 60011026,DropID = 940009,LookID = 100820060,Monstage = 3};
		[6027] = {MonID = 60011027, MonAI = 60011027,DropID = 940009,LookID = 100920090,Monstage = 3};
		[6028] = {MonID = 60011028, MonAI = 60011028,DropID = 940009,LookID = 100920050,Monstage = 4};
		[6029] = {MonID = 60011029, MonAI = 60011029,DropID = 940009,LookID = 100710060,Monstage = 4};
	};
	--刷出怪物的时间
	AddMonTime = 2000;	
	--刷怪点位置	
	MapPos = {
		[6001] = {x=6,y=3},
		[6002] = {x=-9,y=-3},
		[6003] = {x=6,y=4},
		[6004] = {x=2,y=-2},
		[6005] = {x=-9,y=-3},
		[6006] = {x=2,y=4},
		[6007] = {x=9,y=15},
		[6008] = {x=19,y=22},
		[6009] = {x=-1,y=20},
		[6010] = {x=-1,y=5},
	};
	--怪物狂暴Buff
	MonBuff = {
		[6001] = 50600011,	
		[6002] = 50600011,
		[6003] = 50600011,
		[6004] = 50600011,
		[6005] = 50600011,
		
	};
	--角色Buff
	RoleBuff = {
		50600005,	--增加暴击
		50600006,	--增加防御
		50600007,	--增加攻击
		50600008,	--增加血量
		50600009,	--增加身法
		50600010,	--增加闪避
		50600012,	--减攻击
		50600013,	--减防御
		50600014,	--减攻击和防御
		50600015,	--减暴击
		50600016,	--增加攻击和防御
	};	
	--群侠开放等级判断（关联下面的怪物基础难度系数，具体数值在具体怪物身上具体调整）
	RoleLevel = 60;
	--各副本的基本战斗ID
	BasicFightID = {
		[1] = {6001,60001000},
		[2] = {6002,60002000},
		[3] = {6003,60003000},
		[4] = {6004,60004000},
		[5] = {6005,60005000},
		[6] = {6006,60006000},
		[7] = {6007,60007000},
		[8] = {6008,60008000},
		[9] = {6009,60009000},
		[10] = {6010,60010000},
		[11] = {6011,60011000},
		[12] = {6012,60012000},
		[13] = {6013,60013000},
		[14] = {6014,60014000},
		[15] = {6015,60015000},
		[16] = {6016,60016000},
		[17] = {6017,60017000},
		[18] = {6018,60018000},
		[19] = {6019,60019000},
		[20] = {6020,60020000},
		[21] = {6021,60021000},
		[22] = {6022,60022000},
		[23] = {6023,60023000},
		[24] = {6024,60024000},
		[25] = {6025,60025000},
		[26] = {6026,60026000},
		[27] = {6027,60027000},
		[28] = {6028,60028000},
		[29] = {6029,60029000},
	};
	
}

function Form6001:GetMonPos( MapID )
	return Form6001.DateInfo.MapPos[MapID].x,Form6001.DateInfo.MapPos[MapID].y;
end

function Form6001:AddPlayerBuff( objPlayer )
	local buffSystem = objPlayer:GetSystem("CBuffSystem");
	if not buffSystem then
		return 
	end;
	local BuffTable = Form6001.DateInfo.RoleBuff;
	local BuffNum = math.random(#BuffTable)
	local BuffLv = math.random( 20,30 );
	buffSystem:AddBuff(BuffTable[BuffNum],BuffLv);			
end
	
function Form6001:Fight( dwLevel,dupID )
	local fightID = 0
	local temp = Form6001.DateInfo
	local k = 0
	local level=temp.RoleLevel;		--60
	local BaseLevel = 0
	
	for i=1,#temp.BasicFightID do
		if dupID==temp.BasicFightID[i][1] then
			BaseLevel = temp.BasicFightID[i][2];				
			break;
		end
	end
		
	for i=1, 1000 do
		if dwLevel <= (level+(k*10+9)) then
			fightID = BaseLevel+level+(k*10)					
			return fightID;
		end
		k = k+1;
	end
	
	return 4000+level ;		
end;
	
function Form6001:GrowMonster(mgrMonster,dwLevelt,dupID,MapID)
	local t = Form6001.DateInfo.Monster;
	local fight = Form6001:Fight(dwLevelt,dupID);
	local x,y = Form6001:GetMonPos(MapID);
	mgrMonster:Add(t[dupID].MonID,fight,t[dupID].MonAI,t[dupID].DropID,t[dupID].LookID,x,y,nil);
end;



--卧虎藏龙——车轮战点击继续刷新下一个boss
DuplAddition[1013] = {};
local Form1013 = DuplAddition[1013]
function Form1013:RefreshMonster(dwRefreshId, objPlayer, captain)
	local sysMap = objPlayer:GetSystem("CMapSystem");	--获得副本系统
	local Map = sysMap:GetCurMap()				----获取所在地图
	local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
	local duplSystem = captain:GetSystem("CDuplSystem");	--获得副本系统
	local dwLevelt = duplSystem:GetDuplLevel(); ---获得创建副本的等级
	local dwdelay = 10*1000
	local mon = {
			[2] = {50770002,100210110},	--刘记马行•刘雨
			[3] = {50770003,100210040},	--南记布庄•南筱芸
			[4] = {50770004,100210030},	--戈记兵甲•戈楠
			[5] = {50770005,100210050},	--玲珑坊•杨锋
			[6] = {50770006,100210400},	--有间书铺•章博
			[7] = {50770007,100210090},	--凝香银楼•周静恒
			[8] = {50770008,100210410},	--宝济堂•欧雅琪
			[9] = {50770009,100210370},	--驿馆主事•秦江
			[10] = {50770010,100210150},	--风云当家•许竹青
			};
	for i = 2,10 do
		if dwRefreshId == i then
			mgrMonster:DelayAdd(mon[i][1],(50770000+dwLevelt+i-1),50770001,50770001,mon[i][2],-14,-18,dwObjId,dwdelay);
			duplSystem:SetTollWin(false);	--设置副本状态为失败
		end
	end
	-- print("+++++++++++dwRefreshId++++++++++++",dwRefreshId)
end;