--战场系统相关的附加配置
_G.WarAddition = {};

--龙鼎战
WarAddition.LongDing = {
	--回调间隔
	Gap = 1000*60;
	--基础奖励倍数
	Multiple = 5;
	--应龙奖励
	Low = 2;
	--潜龙
	Centre = 2;
	--亢龙
	Tall = 2;
	
	--占领倒计时
	Count = 1000*60*20;
	
	[30] = {
		--宝箱木 count 刷新数量
		[1] = {{dwMonsterId = 200,fight_id = 1001,dwAIId = 80,dwDropId = 210,dwLook = 11200,count = 25}};
		--银
		[2]  = {{dwMonsterId = 201,fight_id = 1006,dwAIId = 80,dwDropId = 211,dwLook = 11210,count = 10};};
		--金
		[3] = {{dwMonsterId = 202,fight_id = 1011,dwAIId = 80,dwDropId = 212,dwLook = 11220,count = 5};};
	};
	[40] = {
		[1] = {{dwMonsterId = 80202011,fight_id = 3060,dwAIId = 80202011,dwDropId = 20002006,dwLook = 100820050,count = 5};};
	};
};
--盟主战
WarAddition.MengZhu = {
	--回调间隔
	Gap = 1000*60;
	--宝箱刷新间隔
	MineRefresh = 20;
	--怪物刷新间隔
	Refresh = 40;
	--占领倒计时
	Count = 1000*60*20;
	[20] = {
		--宝箱木 count 刷新数量
		[1] = {{dwMonsterId = 200,fight_id = 1001,dwAIId = 80,dwDropId = 210,dwLook = 11200,count = 35}};
		--银
		[2]  = {{dwMonsterId = 201,fight_id = 1006,dwAIId = 80,dwDropId = 211,dwLook = 11210,count = 10};};
		--金
		[3] = {{dwMonsterId = 202,fight_id = 1011,dwAIId = 80,dwDropId = 212,dwLook = 11220,count = 5};};
	};
	[40] = {
		[1] = {{dwMonsterId = 80202011,fight_id = 3060,dwAIId = 80202011,dwDropId = 20002006,dwLook = 100820050,count = 5};};
	};
};
--夜战襄阳
WarAddition.XiangYang = {
	--回调间隔
	Gap = 1000*60;
	
	--每分钟积分奖励
	Award = 20;
	--杀人奖励积分
	Slay = 5;
	--死亡/退出减分数  除法：填写2为除以2
	Die = 2;
	--击杀木宝箱积分
	Wood = 10;
	--击杀银宝箱积分
	Silver = 20;
	--击杀金宝箱积分
	Gold = 50;
	--怪物配置
	[1] = 
	{
		[1] = {
			{dwMonsterId = 210,fight_id = 1001,dwAIId = 80,dwDropId = 210,dwLook = 11200,count = 30};
		};
		--银
		[2]  = {
			{dwMonsterId = 211,fight_id = 1003,dwAIId = 80,dwDropId = 211,dwLook = 11210,count = 12};
		};
		--金
		[3] = {
			{dwMonsterId = 212,fight_id = 1006,dwAIId = 80,dwDropId = 212,dwLook = 11220,count = 3};
		};
	};
	--奖励配置
	--礼金，经验，真气
	Obtain = {
		[1] = {BindGold = 1500,Exp = 2000000,Water = 20000};
		[2] = {BindGold = 1000,Exp = 1200000,Water = 15000};
		[3] = {BindGold = 600,Exp = 700000,Water = 10000};
		[4] = {BindGold = 300,Exp = 400000,Water = 3000};
	};
};

--戏说天下
WarAddition.TianXia = {
	--回调间隔
	Gap = 1000*20;
	[1] = 
	{
		[1] = {
			{dwMonsterId = 20002100,fight_id = 20002103,dwAIId = 20002100,dwDropId = 20000003,dwLook = 100220990,count = 4};
		};
	};
	--删减NPC
	NpcData = {
		{npc = 80251101,x = -11,y = -23,f = 0};--碧螺春	
		{npc = 80251102,x = -34,y = 9,f = 0};--铁观音
		{npc = 80251103,x = -25,y = 16,f = 0};--茉莉花茶
		{npc = 80251104,x = -18,y = -4,f = 0};--核桃酥
		{npc = 80251105,x = 0,y = -10,f = 0};--绿豆糕
		{npc = 80251106,x = -26,y = -19,f = 0};--麻团
	};
	--永存NPC
	NpcAdd = {
		[1] = {
			{npc=80251003,x=-17.40,y=9.87,dir=5.5,show = 0};--常莎莎1号
			{npc=80251012,x=-17.40,y=9.87,dir=5.5,show = 0};--常莎莎2号
			{npc=80251013,x=-17.40,y=9.87,dir=5.5,show = 0};--常莎莎3号
			{npc=80251014,x=-17.40,y=9.87,dir=5.5,show = 0};--常莎莎4号	
		};
		[2] = {
			{npc=80251004,x=-28.34,y=-19.56,dir=5.5,show = 0};--涂圆圆1号
			{npc=80251015,x=-28.34,y=-19.56,dir=5.5,show = 0};--涂圆圆2号
			{npc=80251016,x=-28.34,y=-19.56,dir=5.5,show = 0};--涂圆圆3号
			{npc=80251017,x=-28.34,y=-19.56,dir=5.5,show = 0};--涂圆圆4号
		};
	};
	--Npc闲话
	yell = {
		{8025001,5};
		{8025002,8};
		{8025003,8};
		{8025004,4};
		{8025005,7};
		{8025006,15};
		{8025007,4};
		{8025008,5};
		{8025009,3};
		{8025010,4};
		{8025011,5};
		{8025012,4};
		{8025013,5};
		{8025014,5};
		{8025015,7};
		{8025016,5};
	};
};



--击杀
function WarAddition:Continuation(objWar,objKiller,objDeader)

	if (objKiller ~= objDeader) then
		--击杀
		objWar:AddKillNumAll(objKiller);
		--连斩
		objWar:AddKillNumCon(objKiller);
	end
	objWar:ClearKillNumCon(objDeader);
end
--盟主战
--将原始数据打乱
function WarAddition:upset(Data)
	local site = {};
	site = Data;
	local dwNumber = #site;
	-- for k,v in pairs(site) do
		for loop = 1 ,dwNumber do
			local dwRand1 = math.random(1,dwNumber);
			local dwRand2 = math.random(1,dwNumber);
			if (dwRand1 ~= dwRand2) then
				local a = site[dwRand1];
				site[dwRand1] = site[dwRand2]
				site[dwRand2] = a ;
			end
		end
	-- end
	return site;
end
--刷怪
--Place坐标 Data刷新数据 count次数
function WarAddition:Monster(Place,Data,Map)
	local Record = 1;
	--拿到传过来的配置
	for Loop = 1,#Data do
		local obtain = Data[Loop]; 
		for Big = 1,obtain[1].count do
			local b = obtain[1]
			local m = Place[Record]
			local Map = Map
			if (Map == nil) then
				Map = m.map
			end
			CScriptManager:AddMonToMap(Map,b.dwMonsterId,b.fight_id,b.dwAIId,b.dwDropId,b.dwLook,m.x,m.y)
			Record = Record + 1;
		end
	end
end

--喊话
function WarAddition:Yell(objWar,Time)
	--宝箱20    怪物40
	local Text = {
		--宝箱出生前
		[15] = 6001047029;
		--出生时
		[20] = 6001047035;
		--回收
		--[30] = 6001047037;
		--怪物出生前
		[35] = 6001047020;
		--出生时
		[40] = 6001047034;
		--回收
		--[50] = 6001047036;
	};
	if not Text[Time] then
		return
	end
	CScriptManager:Notice(SysStringConfigInfo[Text[Time]],6,false,8020)
end

--夜战襄阳
--夜战襄阳奖励
function WarAddition:Reward(objWarSystem,Placing, realPlace)
		local t = WarAddition.XiangYang.Obtain[Placing]
		local tbInfo = {};
		tbInfo.jingyan = math.floor(t.Exp);
		tbInfo.zhenqi_G = math.floor(t.Water);
		tbInfo.zhenqi_M = math.floor(t.Water);
		tbInfo.zhenqi_S = math.floor(t.Water);
		tbInfo.zhenqi_H = math.floor(t.Water);
		tbInfo.zhenqi_T = math.floor(t.Water);
		objWarSystem:AddHarvest(tbInfo);
		objWarSystem:AddMoneyHarvest(0,0,t.BindGold)
		
		if realPlace then
			local objPlayer = objWarSystem:GetPlayer();
			if objPlayer then
				local itemSystem = objPlayer:GetSystem("CItemSystem");
				if itemSystem then
					itemSystem:AwardHSLJReward(realPlace);
				end;
			end;
		end;
end


--添加NPC
function WarAddition:NpcInvoking(Map,Sort)
	local objCurMap = CMapManager:GetMap(Map);
	
	local t = self.TianXia
	
	if objCurMap then
		if (Sort == 1) then
				for k,n in pairs(t.NpcData) do
					local mgrNpc = objCurMap:GetNpcMgr()
					local Data = mgrNpc:Add(t.NpcData[k].npc,t.NpcData[k].x,t.NpcData[k].y,t.NpcData[k].f)
					--保存NPC数据
					t.NpcData[k].Data = Data;
				end
		elseif (Sort == 2) then
			local dwRand = math.random(#t.NpcAdd[1]);
			local mgrNpc = objCurMap:GetNpcMgr()
			for k,n in pairs(t.NpcAdd) do
				local Data = mgrNpc:Add(t.NpcAdd[k][dwRand].npc,t.NpcAdd[k][dwRand].x,t.NpcAdd[k][dwRand].y,t.NpcAdd[k][dwRand].f)
			end
		end
	end
end
--删除NPC
function WarAddition:NpcOmit(Map)
	local objCurMap = CMapManager:GetMap(Map);
	local t = self.TianXia
	
	if objCurMap then
		for k,n in pairs(t.NpcData) do
			local mgrNpc = objCurMap:GetNpcMgr()
			if (t.NpcData[k].Data) then
				mgrNpc:Remove(t.NpcData[k].Data)
				t.NpcData[k].Data = nil
			end
		end
	end
end

--奖励接口
function WarAddition:Award(objWar,objPlayer,objWarSystem,Exp,ZhenQi)
	--每分钟收益
	local tbInfo = {};
	tbInfo.jingyan = math.floor(Exp);
	tbInfo.zhenqi_G = math.floor(ZhenQi);
	tbInfo.zhenqi_M = math.floor(ZhenQi);
	tbInfo.zhenqi_S = math.floor(ZhenQi);
	tbInfo.zhenqi_H = math.floor(ZhenQi);
	tbInfo.zhenqi_T = math.floor(ZhenQi);
	objWarSystem:AddHarvest(tbInfo);
end
--盟主战
--坐标库
WarAddition.Place = 
	{
		{x=-34.27,y=64.1};
		{x=-36.39,y=48.57};
		{x=-38.72,y=32.84};
		{x=-54.92,y=38.58};
		{x=-48.42,y=24.47};
		{x=-79.30,y=33.65};
		{x=-49.92,y=13.83};
		{x=-21.90,y=26.63};
		{x=-9.98,y=16.35};
		{x=2.31,y=26.96};
		{x=15.43,y=17.93};
		{x=26.34,y=18.66};
		{x=26.25,y=27.91};
		{x=36.7,y=16.39};
		{x=46.5,y=31.56};
		{x=61.25,y=36.65};
		{x=78.28,y=33.72};
		{x=34.43,y=55.40};
		{x=44.27,y=63.13};
		{x=31.43,y=66.22};
		{x=58.44,y=71.14};
		{x=79.99,y=3.41};
		{x=79.3,y=14.36};
		{x=87.47,y=21.83};
		{x=90.57,y=35.63};
		{x=95.57,y=40.14};
		{x=99.50,y=58.68};
		{x=112.65,y=58.41};
		{x=119.83,y=71.63};
		{x=105.62,y=73.79};
		{x=94.38,y=69.72};
		{x=87.55,y=67.36};
		{x=76.58,y=69.95};
		{x=76.50,y=53.70};
		{x=73.60,y=38.14};
		{x=74.25,y=8.94};
		{x=77.9,y=0.14};
		{x=73.6,y=-14.76};
		{x=74.98,y=-31.32};
		{x=76.76,y=-25.54};
		{x=67.70,y=-39.38};
		{x=61.35,y=-41.35};
		{x=55.33,y=-48.40};
		{x=58.33,y=-63.59};
		{x=43.70,y=-45.61};
		{x=32.23,y=-36.88};
		{x=22.80,y=-44.28};
		{x=12.33,y=-47.35};
		{x=10.21,y=-45.23};
		{x=5.14,y=-36.63};
		{x=-2.90,y=-32.27};
		{x=-10.11,y=-46.61};
		{x=-26.42,y=-48.84};
		{x=-38.24,y=-41.63};
		{x=-39.38,y=-26.67};
		{x=-43.24,y=-15.39};
		{x=-60.6,y=-8.41};
		{x=-65.56,y=-23.50};
		{x=-67.77,y=-37.74};
		{x=-74.91,y=-49.46};
		{x=-77.28,y=-35.57};
		{x=-80.48,y=-25.61};
		{x=-96.56,y=-20.15};
		{x=-91.86,y=-6.44};
		{x=-88.57,y=-1.13};
		{x=-102.15,y=11.66};
		{x=-103.36,y=12.88};
		{x=-100.81,y=33.91};
		{x=-100.81,y=43.91};
		{x=-98.20,y=53.5};
		{x=-104.66,y=69.78};
		{x=-99.84,y=83.94};
		{x=-93.84,y=77.99};
		{x=-81.47,y=69.50};
		{x=-75.72,y=61.88};		

		{x=96.67,y=58.38};
		{x=76.87,y=52.15};
		{x=93.53,y=18.58};
		{x=70.28,y=-6.66};
		{x=80.73,y=-14.47};
		{x=75.91,y=-30.75};
		{x=27.34,y=-2.73};
		{x=42.90,y=-24.56};
		{x=44.99,y=-48.87};
		{x=12.60,y=-26.24};
		{x=20.32,y=-45.44};
		{x=-9.56,y=-49.31};
		{x=-33.17,y=-51.84};
		{x=-67.12,y=-50.13};
		{x=-57.90,y=-24.28};
		{x=-14.62,y=-3.52};
		{x=-82.27,y=-29.30};
		{x=-93.32,y=-5.21};
		{x=-87.68,y=82.29};
		{x=-103.30,y=79.98};
		{x=-108.17,y=62.71};
		{x=-74.39,y=64.45};
		{x=-57.61,y=38.66};
		{x=-54.83,y=29.75};
		{x=-53.41,y=11.17};
		{x=-48.81,y=9.31};
		{x=-33.62,y=20.84};
		{x=-23.23,y=28.36};
		{x=-9.45,y=13.84};
		{x=12.4,y=14.94};
		{x=20.39,y=17.21};
		{x=33.22,y=15.54};
		{x=38.46,y=35.12};
		{x=45.40,y=47.37};
		{x=41.73,y=64.13};
		{x=33.42,y=79.71};
		{x=44.15,y=71.40};
		{x=59.48,y=67.63};
		{x=-28.63,y=34.40};
		{x=-43.50,y=39.34};
		{x=-33.25,y=55.5};
		{x=-36.11,y=74.59};
		{x=-31.88,y=78.91};
		{x=-50.41,y=68.56};
		{x=-34.37,y=60.83};

	};
--夜战襄阳
--坐标库
WarAddition.PlaceOne = 
	{
			{x=98.85,y=72.91};
			{x=59.14,y=118.23};
			{x=62.61,y=98.64};
			{x=118.93,y=20.35};
			{x=65.02,y=60.58};
			{x=90.69,y=2.21};
			{x=58.56,y=20.85};
			{x=-2.83,y=62};
			{x=21.08,y=13.44};
			{x=70.92,y=-34.87};
			{x=57.76,y=-70.28};
			{x=38.05,y=-21.36};
			{x=0.52,y=-17.41};
			{x=-2.60,y=17.60};
			{x=-29.40,y=17.39};
			{x=-68.57,y=106.90};
			{x=-63.06,y=77.90};
			{x=36.26,y=-62.32};
			{x=62.58,y=104.68};
			{x=-8.46,y=-44.60};
			{x=-52.60,y=22.66};
			{x=-92.96,y=62.01};
			{x=-2.66,y=-83.47};
			{x=-40.02,y=-35.61};
			{x=-66.90,y=3.39};
			{x=-81.58,y=19.73};
			{x=-91.07,y=35.76};
			{x=-121.38,y=49.01};
			{x=-54.92,y=-25.06};
			{x=39.28,y=-122.77};
			{x=63.63,y=-133.55};
			{x=18.53,y=-126.30};
			{x=1.21,y=-108.27};
			{x=-92.22,y=-68.67};
			{x=-57.40,y=-48.59};
			{x=-94.89,y=-15.08};
			{x=-113.47,y=23.46};
			{x=-130.68,y=17.91};
			{x=-20.31,y=-98.24};
			{x=-29.98,y=-119.66};
			{x=-57.36,y=-97.74};
			{x=-71.49,y=-82.84};
			{x=-79.09,y=-105.68};
			{x=-99.95,y=-102.97};
			{x=-112.91,y=-79.76};
			{x=-144.93,y=-92.67};
	};

--龙鼎战
--坐标库
WarAddition.Placethree = {
	--8001
		{x=0.25,y=-17.90,map=8001};
		{x=20.56,y=-3.40,map=8001};
		{x=4.20,y=16.21,map=8001};
		{x=-14.36,y=10.36,map=8001};
		{x=9.40,y=-4.6,map=8001};
		{x=-3.3,y=22.96,map=8001};
		{x=-14.6,y=-22.92,map=8001};
		{x=-18.19,y=-7.0,map=8001};
		{x=10.91,y=-17.33,map=8001};
		{x=-0.36,y=-0.4,map=8001};
	--8002
		{x=17.17,y=3.74,map=8002};
		{x=7.10,y=-7.55,map=8002};
		{x=-2.24,y=-24.68,map=8002};
		{x=-18.74,y=-21.90,map=8002};
		{x=-19.43,y=-5.96,map=8002};
		{x=-20.97,y=12.68,map=8002};
		{x=-17.17,y=21.26,map=8002};
		{x=-0.41,y=19.87,map=8002};
		{x=3.30,y=7.73,map=8002};
		{x=-4.70,y=-10.95,map=8002};
		
	--8003
		{x=23.58,y=-9.42,map=8003};
		{x=22.95,y=5.43,map=8003};
		{x=14.82,y=25.5,map=8003};
		{x=2.44,y=22.65,map=8003};
		{x=-14.68,y=12.53,map=8003};
		{x=-20.11,y=3.6,map=8003};
		{x=-24.3,y=-10.45,map=8003};
		{x=-0.12,y=-16.15,map=8003};
		{x=-1.20,y=-23.91,map=8003};
		{x=8.83,y=2.34,map=8003};

	--8004
		{x=20.91,y=-19.51,map=8004};
		{x=23.83,y=1.71,map=8004};
		{x=14.94,y=11.29,map=8004};
		{x=1.87,y=10.59,map=8004};
		{x=-29.28,y=6.80,map=8004};
		{x=1.57,y=-21.43,map=8004};
		{x=0.57,y=-11.29,map=8004};
		{x=-10.74,y=9.45,map=8004};
		{x=-16.48,y=-16.92,map=8004};
		{x=0.13,y=1.17,map=8004};

	--8005
		{x=23.67,y=12.90,map=8005};
		{x=23.64,y=-19.69,map=8005};
		{x=0.53,y=-13.46,map=8005};
		{x=7.81,y=6.82,map=8005};
		{x=-37.56,y=13.35,map=8005};
		{x=-29.24,y=-11.15,map=8005};
		{x=-15.0,y=-24.57,map=8005};
		{x=-24.71,y=24.58,map=8005};
		{x=-4.94,y=22.0,map=8005};
		{x=16.51,y=29.50,map=8005};

	--8006
		{x=26.18,y=29.14,map=8006};
		{x=6.13,y=34.24,map=8006};
		{x=-7.66,y=30.86,map=8006};
		{x=-15.85,y=7.46,map=8006};
		{x=-8.8,y=-18.70,map=8006};
		{x=-5.67,y=-34.25,map=8006};
		{x=30.16,y=11.11,map=8006};
		{x=16.64,y=-17.6,map=8006};
		{x=-3.57,y=17.75,map=8006};
		{x=12.15,y=2.43,map=8006};

	--8007
		{x=-5.88,y=-20.79,map=8007};
		{x=20.17,y=-15.29,map=8007};
		{x=27.27,y=1.19,map=8007};
		{x=12.37,y=24.91,map=8007};
		{x=-0.90,y=26.4,map=8007};
		{x=1.34,y=15.45,map=8007};
		{x=-22.15,y=14.81,map=8007};
		{x=-20.32,y=1.48,map=8007};
		{x=-23.71,y=-15.30,map=8007};
		{x=10.48,y=-6.80,map=8007};

	--8008
		{x=-20.93,y=0.44,map=8008};
		{x=-7.88,y=6.65,map=8008};
		{x=1.4,y=7.32,map=8008};
		{x=1.24,y=20.62,map=8008};
		{x=31.19,y=-4.24,map=8008};
		{x=19.15,y=0.46,map=8008};
		{x=25.42,y=-12.37,map=8008};
		{x=-2.83,y=-13.76,map=8008};
		{x=-23.94,y=-13.10,map=8008};
		{x=-8.45,y=22.24,map=8008};
	--8009
		{x=24.58,y=3.43,map=8009};
		{x=23.44,y=-7.59,map=8009};
		{x=3.53,y=-21.40,map=8009};
		{x=-3.34,y=-31.77,map=8009};
		{x=-18.35,y=-2.34,map=8009};
		{x=-29.80,y=-1.61,map=8009};
		{x=-20.38,y=12.36,map=8009};
		{x=-10.78,y=22.85,map=8009};
		{x=7.71,y=26.6,map=8009};
		{x=14.63,y=4.19,map=8009};
};
--戏说天下飞贼坐标
WarAddition.XiShuoTinXia = 
	{
		{x=-25,y=-5};
		{x=-26,y=-19};
		{x=-3,y=-22};
		{x=0,y=-9};
		{x=1,y=2};
		{x=-7,y=14};
		{x=-22,y=9};
		{x=-16,y=-5};
	};

---------------------废弃的代码 以后可以会用到
		--[[
		--奖励逻辑
		local objWarSys = objKiller:GetSystem("CWarSystem");
		if not objWarSys then
			return;
		end
		
		--判断双方是否是同一个世家
		local objKillGuildSys = objKiller:GetSystem("CGuildSystem");
		local objDeadGuildSys = objDeader:GetSystem("CGuildSystem");
		if objKillGuildSys and objDeadGuildSys then
			--双方是同一个世家则不给奖励
			if objKillGuildSys:GetGuildID() == objDeadGuildSys:GetGuildID() then
				return;
			end
		end
		
		--是否是killer的仇人
		local isMyEnmity = objWar:CheckKillEnmity(objKiller,objDeader);
		--死者的连杀数
		local dwDeadNumCon = objWar:GetKillNumCon(objDeader:GetRoleID());
		--死者的总杀人数
		local dwDeadNumAll = objWar:GetKillNumAll(objDeader:GetRoleID());
		--死者等级
		local dwDeadLevel = objDeader:GetLevel();
		--自己的等级
		local dwKillLevel = objKiller:GetLevel();
		--死者的战斗力
		local dwDeadScore = 0;
		local objDeadSklSys = objDeader:GetSystem("CSkillSystem");
		if objDeadSklSys then
			dwDeadScore = objDeadSklSys:CountPlayerScore();
		end
		--杀手的战斗力
		local dwKillScore = 0;
		local objKillSklSys = objKiller:GetSystem("CSkillSystem");
		if objKillSklSys then
			dwKillScore = objKillSklSys:CountPlayerScore();
		end
		
		local tbInfo = {};
		
		tbInfo.jingyan = WarAddition.Exp[dwDeadLevel][1]; --按照被杀者的等级读取一个基础奖励经验
		
		local isMyEnmityxishu=1 --定义仇敌系数初始为1
		--如果被击杀者是击杀者的仇人则此次经验增加50%
		if isMyEnmity then 
		isMyEnmityxishu=1.5
		end 
		
		local lianshanumxishu=1+dwDeadNumCon/10 --定义连杀系数 被击杀者的连杀数比10再加上1
		if lianshanumxishu>=3 then lianshanumxishu=3 end --限制连杀系数 最大为3倍
		
		--定义等级差影响系数
		local dlv=(dwKillLevel-dwDeadLevel)
		local jianglifudong=0.9^(dwKillLevel-dwDeadLevel)
		--限制等级差影响系数的最大值
		if jianglifudong>=10 then
		jianglifudong=10
		end
		if dlv>=15 then
		jianglifudong=0
		end
		
		--基础奖励*(1+对方连斩/10) (最大为3)*等级影响系数(最大为10)*复仇系数(1 or 1.5)
		tbInfo.jingyan=math.floor(tbInfo.jingyan*lianshanumxishu*jianglifudong*isMyEnmityxishu)
		
		--击杀奖励真气直接为被击杀玩家奖励标准真气*等级衰减系数
		tbInfo.zhenqi_G = math.floor(WarAddition.Exp[dwDeadLevel][2]*jianglifudong);
		tbInfo.zhenqi_M = math.floor(WarAddition.Exp[dwDeadLevel][2]*jianglifudong);
		tbInfo.zhenqi_S = math.floor(WarAddition.Exp[dwDeadLevel][2]*jianglifudong);
		tbInfo.zhenqi_H = math.floor(WarAddition.Exp[dwDeadLevel][2]*jianglifudong);
		tbInfo.zhenqi_T = math.floor(WarAddition.Exp[dwDeadLevel][2]*jianglifudong);
		
		objWarSys:AddHarvest(tbInfo,true);
		
		--奖励完成后，仇人逻辑
		objDeader:GetSystem("CWarSystem"):SetMyEnmity(objKiller:GetRoleID());
		if isMyEnmity then
			objWarSys:ClearMyEnmity();
			objWarSys:SendEnmitySucc(objDeader:GetName());
		end
		--]]