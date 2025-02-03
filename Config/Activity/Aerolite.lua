--天外陨石活动脚本

-- Number.Implement = function()

-- end

_G.Activity = {
	[1] = {"Aerolite"};
	[2] = {"MonsterHunter"};
	[3] = {"LiuXingYu"};
	[4] = {"LiuXingYu_01"};
	[5] = {"LiuXingYu_02"};
	[6] = {"LiuXingYu_03"};
	[7] = {"ShengDanHuoDong"};
	[8] = {"NianShouSongXi"};
};

--新逻辑
local Number = Activity[1];
--坐标库
Number.place = {
	[1002] = {
		{x=45.28,y=-121.86};
		{x=-60.6,y=-111.28};
		{x=-109.51,y=-82.66};
		{x=-14.73,y=-67.75};
		{x=59.41,y=-47.36};
		{x=58.7,y=-4.86};
		{x=95.10,y=20.51};
		{x=60.74,y=64.73};
		{x=-58.5,y=20.87};
		{x=-97.43,y=14.79};
		{x=-69.0,y=43.44};
		{x=-70.35,y=76.16};
		{x=-111.18,y=50.82};
		{x=-34.64,y=-41.35};
		{x=-4.87,y=-27.72};
		{x=60.12,y=120.96};
		{x=97.90,y=72.29};
		{x=-30.74,y=-99.55};
		{x=-1.99,y=-124.78};
		{x=-2.40,y=61.1};
	};
	[1005] = {
		{x=-0.77,y=37.49};
		{x=-18.13,y=42.59};
		{x=-31.52,y=36.15};
		{x=-48.9,y=24.96};
		{x=-48.76,y=-5.27};
		{x=-38.7,y=-46.68};
		{x=-13.67,y=-34.3};
		{x=17.81,y=-48.55};
		{x=-4.23,y=-19.78};
		{x=15.69,y=-17.75};
		{x=13.16,y=-17.90};
		{x=31.33,y=-16.35};
		{x=6.57,y=3.1};
		{x=-7.25,y=0.7};
		{x=32.80,y=19.73};
		{x=-19.29,y=-51.8};
		{x=-31.15,y=-5.44};
		{x=-15.35,y=-8.45};
		{x=-36.81,y=-23.24};
		{x=-8.75,y=29.73};
		};
	[1006] = {
		{x=-3.5,y=-93.67};
		{x=-3.75,y=-67.91};
		{x=10.10,y=-41.56};
		{x=34.84,y=-39.52};
		{x=46.7,y=-58.50};
		{x=-10.83,y=-28.75};
		{x=-14.16,y=-4.53};
		{x=-8.32,y=10.52};
		{x=-36.82,y=32.78};
		{x=-36.82,y=32.78};
		{x=-29.41,y=63.52};
		{x=-15.46,y=85.47};
		{x=-63.4,y=89.26};
		{x=-89.58,y=87.64};
		{x=-47.40,y=-95.41};
		{x=-52.24,y=-40.45};
		{x=29.60,y=-33.77};
		{x=42.56,y=5.54};
		{x=78.21,y=9.25};
		{x=17.97,y=85.90};
		};
	[1007] = {
		{x=-80.80,y=29.92};
		{x=-52.85,y=73.69};
		{x=-22.70,y=70.25};
		{x=-17.25,y=28.90};
		{x=-94.52,y=-7.52};
		{x=-67.33,y=-25.95};
		{x=-99.73,y=-64.2};
		{x=-78.42,y=-76.16};
		{x=-64.49,y=-69.63};
		{x=-4.70,y=-43.70};
		{x=17.33,y=-40.82};
		{x=15.55,y=-3.78};
		{x=-44.23,y=-30.45};
		{x=46.32,y=-67.5};
		{x=-24.21,y=-93.95};
		{x=7.33,y=-97.41};
		{x=-48.81,y=-61.56};
		{x=-95.43,y=-43.37};
		{x=-46.86,y=39.97};
		{x=-38.23,y=86.16};	
		};
	[1008] = {
		{x=-70.79,y=6.64};
		{x=-67.66,y=-12.59};
		{x=-64.22,y=-35.96};
		{x=-55.87,y=-70.15};
		{x=-0.42,y=-36.79};
		{x=-24.45,y=-59.9};
		{x=26.98,y=-94.27};
		{x=58.89,y=-63.19};
		{x=71.58,y=-20.47};
		{x=36.36,y=24.57};
		{x=33.78,y=58.73};
		{x=7.90,y=64.0};
		{x=-12.73,y=75.35};
		{x=62.66,y=43.36};
		{x=69.45,y=-38.97};
		{x=19.91,y=-87.81};
		{x=-23.83,y=2.44};
		{x=-80.97,y=53.56};
		{x=-88.8,y=-31.8};
		{x=82.24,y=-65.77};
		};
};
--刷新数量
Number.Scene = {
	[1002] = {10,8000};
	[1005] = {10,7500};
	[1006] = {10,8000};
	[1007] = {10,7000};
	[1008] = {10,8000};
};
--怪物ID
Number.Monster = {

	{dwMonsterId = 20000001,fight_id = 20000001,dwAIId = 80,dwDropId = 20000002,dwLook = 11300};
	
	};

function Number:Implement(mgrScript)
	self:Bale(mgrScript)
end

function Number:Bale(mgrScript)
	--收集作废的坐标
	local waste = {};
	for k,n in pairs(self.Scene) do
		--保护
		if self.place[k] then
			for loop =  1,n[1] do
				local a = math.random(#self.place[k])
				local m = self.place[k][a]
				local t = self.Monster[1]
				local dwRand = math.random(10000);
				if (dwRand <= n[2]) then
					mgrScript:AddMonToMap(k,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
					waste[k] = waste[k] or {}
					--保存坐标
					table.insert(waste[k],m)
					--删除坐标
					table.remove(self.place[k],a)
				end
			end
		end
	end
	--还原坐标库
	for k,n in pairs(waste) do
		for _,m in pairs(n) do
			table.insert(self.place[k],m)
		end
	end
end







--[[
--随机活动用
function Activity:Refresh(mgrScript,Monster,Scene,locale)
	--获取打包后的坐标信息
	local pack =  Activity:Bale(Scene,locale)
	
	--所有坐标循环
	for k,n in pairs(pack) do
		--怪物种类循环
		for loop =1,#Monster do
			local a = 0;
			--获取坐标数量
			while Scene[k] > a do
				a = a + 1;
				local m = n[a];
				local t = Monster[loop]
				local dwRand = math.random(10000);
				if (dwRand <= 7500) then
					mgrScript:AddMonToMap(k,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
				end
			end
		end
	end
end

--打乱坐标
function Activity:upset(Data)
	local site = {};
	site = Data;
	for k,v in pairs(site) do
		for loop = 1 ,500 do
			local dwRand1 = math.random(1,#site);
			local dwRand2 = math.random(1,#site);
			if (dwRand1 ~= dwRand2) then
				local a = site[dwRand1];
				site[dwRand1] = site[dwRand2]
				site[dwRand2] = a ;
			end
		end
	end
	return site;
end

--打包坐标库  场景ID等信息  第2参数坐标库位置
function Activity:Bale(Scene,locale)
	local pack = {};
	for k,_ in pairs(Scene) do
		local t = locale[k]
		local place = Activity:upset(t)	
		--打乱坐标库
		pack[k] = place;
	end
	return pack;
end
--]]
--固定刷怪活动用
function Activity:Settled(mgrScript,coord,Monster)
	
	local Record = 1;
	for loop =1,#Monster do
		for loop1 = 1,Monster[loop].Count do
			
			local t = Monster[loop]
			local m = coord[Record]
			mgrScript:AddMonToMap(m.map,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
			Record = Record + 1;
		end

	end
end


--[[
local Number = Activity[1];

--Activity[1]:Implement(mgrScript);
function Number:Scene()
	local Biao  = {
			[1002] = 10;
			[1005] = 10;
			[1006] = 10;
			[1007] = 10;
			[1008] = 10;
			};
	return Biao
end

function Number:place()
	local place = {
	[1002] = {
		{x=45.28,y=-121.86};
		{x=-60.6,y=-111.28};
		{x=-109.51,y=-82.66};
		{x=-14.73,y=-67.75};
		{x=59.41,y=-47.36};
		{x=58.7,y=-4.86};
		{x=95.10,y=20.51};
		{x=60.74,y=64.73};
		{x=-58.5,y=20.87};
		{x=-97.43,y=14.79};
		{x=-69.0,y=43.44};
		{x=-70.35,y=76.16};
		{x=-111.18,y=50.82};
		{x=-34.64,y=-41.35};
		{x=-4.87,y=-27.72};
		{x=60.12,y=120.96};
		{x=97.90,y=72.29};
		{x=-30.74,y=-99.55};
		{x=-1.99,y=-124.78};
		{x=-2.40,y=61.1};
	};
	[1005] = {
		{x=-0.77,y=37.49};
		{x=-18.13,y=42.59};
		{x=-31.52,y=36.15};
		{x=-48.9,y=24.96};
		{x=-48.76,y=-5.27};
		{x=-38.7,y=-46.68};
		{x=-13.67,y=-34.3};
		{x=17.81,y=-48.55};
		{x=-4.23,y=-19.78};
		{x=15.69,y=-17.75};
		{x=13.16,y=-17.90};
		{x=31.33,y=-16.35};
		{x=6.57,y=3.1};
		{x=-7.25,y=0.7};
		{x=32.80,y=19.73};
		{x=-19.29,y=-51.8};
		{x=-31.15,y=-5.44};
		{x=-15.35,y=-8.45};
		{x=-36.81,y=-23.24};
		{x=-8.75,y=29.73};
		};
	[1006] = {
		{x=-3.5,y=-93.67};
		{x=-3.75,y=-67.91};
		{x=10.10,y=-41.56};
		{x=34.84,y=-39.52};
		{x=46.7,y=-58.50};
		{x=-10.83,y=-28.75};
		{x=-14.16,y=-4.53};
		{x=-8.32,y=10.52};
		{x=-36.82,y=32.78};
		{x=-36.82,y=32.78};
		{x=-29.41,y=63.52};
		{x=-15.46,y=85.47};
		{x=-63.4,y=89.26};
		{x=-89.58,y=87.64};
		{x=-47.40,y=-95.41};
		{x=-52.24,y=-40.45};
		{x=29.60,y=-33.77};
		{x=42.56,y=5.54};
		{x=78.21,y=9.25};
		{x=17.97,y=85.90};
		};
	[1007] = {
		{x=-80.80,y=29.92};
		{x=-52.85,y=73.69};
		{x=-22.70,y=70.25};
		{x=-17.25,y=28.90};
		{x=-94.52,y=-7.52};
		{x=-67.33,y=-25.95};
		{x=-99.73,y=-64.2};
		{x=-78.42,y=-76.16};
		{x=-64.49,y=-69.63};
		{x=-4.70,y=-43.70};
		{x=17.33,y=-40.82};
		{x=15.55,y=-3.78};
		{x=-44.23,y=-30.45};
		{x=46.32,y=-67.5};
		{x=-24.21,y=-93.95};
		{x=7.33,y=-97.41};
		{x=-48.81,y=-61.56};
		{x=-95.43,y=-43.37};
		{x=-46.86,y=39.97};
		{x=-38.23,y=86.16};	
		};
	[1008] = {
		{x=-70.79,y=6.64};
		{x=-67.66,y=-12.59};
		{x=-64.22,y=-35.96};
		{x=-55.87,y=-70.15};
		{x=-0.42,y=-36.79};
		{x=-24.45,y=-59.9};
		{x=26.98,y=-94.27};
		{x=58.89,y=-63.19};
		{x=71.58,y=-20.47};
		{x=36.36,y=24.57};
		{x=33.78,y=58.73};
		{x=7.90,y=64.0};
		{x=-12.73,y=75.35};
		{x=62.66,y=43.36};
		{x=69.45,y=-38.97};
		{x=19.91,y=-87.81};
		{x=-23.83,y=2.44};
		{x=-80.97,y=53.56};
		{x=-88.8,y=-31.8};
		{x=82.24,y=-65.77};
		};
	};
	return place;
end
--怪物信息
function Number:Monster()
	local Biao  = {
		{dwMonsterId = 20000001,fight_id = 20000001,dwAIId = 80,dwDropId = 20000001,dwLook = 11300};
			};
	return Biao
end

function Number:Implement(mgrScript)
	-- local self = Activity[1]
	--self[1] == "aaa"
	--所需场景配置 参数1 地图ID  参数2 刷新数量
	
	--获取坐标信息
	local Scene =  Number:Scene()
	
	local Monster = Number:Monster()
	
	local place = Number:place()
	
	--参数一 mgrScript  参数二 怪物库 ，参数三 场景信息，参数四 坐标库
	Activity:Refresh(mgrScript,Monster,Scene,place)
	-- --刷新怪物
	-- mgrScript:AddMonToMap(t.dwMapId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwMonsterId,t.dwLook,t.X,t.Y)
	--刷新公告
	--mgrScript:ChatNoticeAll(SysStringConfigInfo[86],7,bSystem,{{szFunStr=SysStringConfigInfo[10000130020],dwFunId=35};{szFunStr=SysStringConfigInfo[10000130021],dwFunId=36};{szFunStr=SysStringConfigInfo[10000130022],dwFunId=37};{szFunStr=SysStringConfigInfo[10000130023],dwFunId=38}})	
end



--]]






--BOSS攻城
local Number = Activity[2];


function Number:coord()
	local Biao  = {
				----新增小怪
				{x=59.43,y=48.66,map=1002};
				{x=59.43,y=52.20,map=1002};
				{x=55.73,y=52.11,map=1002};
				{x=55.73,y=48.56,map=1002};
				{x=61.23,y=46.78,map=1002};
				{x=54.00,y=46.73,map=1002};
				{x=54.00,y=54.01,map=1002};
				{x=61.23,y=54.05,map=1002};
				{x=86.07,y=57.26,map=1002};
				{x=83.61,y=58.61,map=1002};
				{x=83.75,y=55.00,map=1002};
				{x=81.31,y=56.55,map=1002};
				{x=88.57,y=73.87,map=1002};
				{x=88.84,y=70.37,map=1002};
				{x=88.70,y=78.59,map=1002};
				{x=92.73,y=74.13,map=1002};
				{x=84.09,y=74.00,map=1002};
				{x=60.32,y=88.12,map=1002};
				{x=56.64,y=88.14,map=1002};
				{x=56.62,y=91.68,map=1002};
				{x=60.29,y=91.74,map=1002};
				{x=60.23,y=95.32,map=1002};
				{x=56.67,y=95.34,map=1002};
				{x=60.33,y=99.06,map=1002};
				{x=56.65,y=99.00,map=1002};
				{x=56.61,y=102.58,map=1002};
				{x=60.30,y=102.61,map=1002};
				{x=86.37,y=21.54,map=1002};
				{x=84.50,y=23.39,map=1002};
				{x=88.28,y=23.42,map=1002};
				{x=88.24,y=19.74,map=1002};
				{x=84.52,y=19.69,map=1002};
				{x=90.06,y=25.17,map=1002};
				{x=90.08,y=17.96,map=1002};
				{x=82.77,y=17.86,map=1002};
				{x=82.75,y=25.12,map=1002};
				{x=61.14,y=-3.60,map=1002};
				{x=57.48,y=-3.63,map=1002};
				{x=61.22,y=-7.26,map=1002};
				{x=57.43,y=-7.30,map=1002};
				{x=61.16,y=-10.82,map=1002};
				{x=57.63,y=-10.82,map=1002};
				{x=61.37,y=-23.33,map=1002};
				{x=57.96,y=-23.15,map=1002};
				{x=58.21,y=-26.26,map=1002};
				{x=61.25,y=-26.09,map=1002};
				{x=61.83,y=-41.39,map=1002};
				{x=59.62,y=-39.43,map=1002};
				{x=59.48,y=-43.19,map=1002};
				{x=57.73,y=-41.42,map=1002};
				{x=37.49,y=-47.61,map=1002};
				{x=37.50,y=-43.99,map=1002};
				{x=33.88,y=-44.02,map=1002};
				{x=33.94,y=-47.43,map=1002};
				{x=-0.99,y=-38.66,map=1002};
				{x=-4.83,y=-38.68,map=1002};
				{x=-4.87,y=-35.41,map=1002};
				{x=-1.07,y=-35.37,map=1002};
				{x=-1.05,y=-41.62,map=1002};
				{x=-4.89,y=-41.62,map=1002};
				{x=-1.22,y=-94.77,map=1002};
				{x=-3.69,y=-94.82,map=1002};
				{x=-1.29,y=-97.20,map=1002};
				{x=-3.70,y=-97.30,map=1002};
				{x=-1.24,y=-99.66,map=1002};
				{x=-3.69,y=-99.71,map=1002};
				{x=-0.76,y=-104.78,map=1002};
				{x=-0.76,y=-107.63,map=1002};
				{x=-4.44,y=-107.70,map=1002};
				{x=-4.57,y=-104.71,map=1002};
				{x=19.97,y=-124.76,map=1002};
				{x=19.71,y=-120.43,map=1002};
				{x=15.46,y=-124.77,map=1002};
				{x=15.55,y=-120.47,map=1002};
				{x=17.65,y=-122.67,map=1002};
				{x=24.57,y=-122.62,map=1002};
				{x=26.49,y=-120.52,map=1002};
				{x=26.80,y=-124.70,map=1002};
				{x=22.51,y=-124.63,map=1002};
				{x=22.52,y=-120.41,map=1002};
				{x=39.22,y=-120.67,map=1002};
				{x=35.62,y=-120.79,map=1002};
				{x=39.23,y=-123.87,map=1002};
				{x=35.66,y=-123.98,map=1002};
				{x=43.47,y=-120.55,map=1002};
				{x=43.63,y=-124.08,map=1002};
				{x=47.31,y=-124.37,map=1002};
				{x=47.32,y=-120.75,map=1002};
				{x=-67.34,y=41.15,map=1002};
				{x=-70.96,y=41.04,map=1002};
				{x=-67.47,y=44.71,map=1002};
				{x=-71.21,y=44.83,map=1002};
				{x=-67.40,y=48.17,map=1002};
				{x=-71.04,y=48.29,map=1002};
				{x=-67.33,y=51.94,map=1002};
				{x=-71.11,y=51.84,map=1002};
				{x=-67.46,y=55.49,map=1002};
				{x=-71.06,y=55.51,map=1002};
				{x=-67.19,y=59.42,map=1002};
				{x=-71.11,y=59.14,map=1002};
				{x=-67.19,y=62.94,map=1002};
				{x=-71.11,y=62.60,map=1002};
				{x=-97.03,y=37.97,map=1002};
				{x=-100.61,y=37.96,map=1002};
				{x=-97.03,y=41.57,map=1002};
				{x=-100.67,y=41.55,map=1002};
				{x=-97.14,y=45.22,map=1002};
				{x=-100.68,y=45.12,map=1002};
				{x=-111.50,y=52.32,map=1002};
				{x=-111.46,y=48.69,map=1002};
				{x=-115.06,y=48.83,map=1002};
				{x=-115.16,y=52.38,map=1002};
				{x=-118.63,y=48.83,map=1002};
				{x=-118.64,y=52.40,map=1002};
				{x=-93.72,y=-11.95,map=1002};
				{x=-96.32,y=-14.65,map=1002};
				{x=-91.35,y=-14.34,map=1002};
				{x=-93.79,y=-16.97,map=1002};
				{x=-96.30,y=-9.35,map=1002};
				{x=-99.05,y=-12.04,map=1002};
				{x=-35.78,y=-40.18,map=1002};
				{x=-32.02,y=-39.94,map=1002};
				{x=-35.65,y=-43.62,map=1002};
				{x=-39.52,y=-40.24,map=1002};
				{x=-35.84,y=-36.64,map=1002};
				{x=-40.08,y=-44.53,map=1002};
				{x=-31.64,y=-36.00,map=1002};
				{x=-31.10,y=-44.51,map=1002};
				{x=-40.61,y=-35.71,map=1002};
				{x=-60.78,y=-1.44,map=1002};
				{x=-62.82,y=-3.44,map=1002};
				{x=-64.05,y=-0.06,map=1002};
				{x=-65.55,y=-1.46,map=1002};
				{x=31.96,y=-60.42,map=1002};
				{x=28.44,y=-62.12,map=1002};
				{x=23.86,y=-63.08,map=1002};
				{x=-65.46,y=-38.20,map=1002};
				{x=-67.14,y=-32.18,map=1002};

				----小怪区域
				{x=64.73,y=18.33,map=1002};
				{x=64.16,y=14.57,map=1002};
				{x=61.04,y=15.08,map=1002};
				{x=64.29,y=23.05,map=1002};
				{x=63.95,y=26.53,map=1002};
				{x=60.69,y=27.06,map=1002};
				{x=56.86,y=15.33,map=1002};
				{x=53.48,y=15.71,map=1002};
				{x=52.71,y=19.12,map=1002};
				{x=52.19,y=23.36,map=1002};
				{x=52.76,y=27.05,map=1002};
				{x=55.97,y=26.77,map=1002};
				{x=2.97,y=-62.86,map=1002};
				{x=2.97,y=-59.37,map=1002};
				{x=-1.05,y=-58.48,map=1002};
				{x=-5.21,y=-58.41,map=1002};
				{x=-7.81,y=-58.47,map=1002};
				{x=-8.85,y=-62.88,map=1002};
				{x=3.36,y=-66.6,map=1002};
				{x=-0.97,y=-66.27,map=1002};
				{x=-4.83,y=-66.31,map=1002};
				{x=-8.82,y=-66.04,map=1002};
				{x=-92.50,y=16.58,map=1002};
				{x=-92.46,y=22.78,map=1002};
				{x=-97.36,y=22.68,map=1002};
				{x=-97.22,y=16.81,map=1002};
				{x=-103.25,y=16.79,map=1002};
				{x=-103.28,y=22.71,map=1002};
				{x=63.04,y=68.38,map=1002};
				{x=59.40,y=64.78,map=1002};
				{x=59.30,y=71.92,map=1002};
				{x=55.74,y=68.33,map=1002};
				{x=-0.70,y=-120.37,map=1002};
				{x=-0.71,y=-124.37,map=1002};
				{x=-4.93,y=-120.38,map=1002};
				{x=-4.88,y=-124.33,map=1002};
				{x=-0.51,y=-19.52,map=1002};
				{x=-5.37,y=-14.99,map=1002};
				{x=-0.51,y=-14.82,map=1002};
				{x=-5.28,y=-19.70,map=1002};
				{x=-57.62,y=19.90,map=1002};
				{x=-64.70,y=19.56,map=1002};
				{x=-61.30,y=16.02,map=1002};
				{x=-61.25,y=22.84,map=1002};
				{x=-103.22,y=-80.48,map=1002};
				{x=-108.54,y=-85.59,map=1002};
				{x=-103.76,y=-85.46,map=1002};
				{x=-108.63,y=-81.01,map=1002};
				----BOSS区域
				{x=58.57,y=22.52,map=1002};
				{x=-2.94,y=-17.24,map=1002};
				{x=-4.87,y=-62.84,map=1002};
				{x=-99.66,y=19.82,map=1002};
				{x=59.28,y=68.28,map=1002};
				{x=-2.80,y=-122.48,map=1002};
				{x=-61.46,y=19.62,map=1002};
				{x=-105.81,y=-83.19,map=1002};
				
				{x=58.46,y=18.57,map=1002};
				{x=-1.16,y=-62.84,map=1002};
				{x=-96.05,y=19.69,map=1002};
				{x=-2.94,y=-17.24,map=1002};
				
			};
	return Biao
end




local MonsterHunter_XinXi = {
	-----波数
	Biao  = {
		--1怪物  2BOSS
		[10] = {
			{dwMonsterId = 21110001,fight_id = 21110001,dwAIId = 21110001,dwDropId = 21110001,dwLook = 11200,Count = 186,LeiXing = 1};
			{dwMonsterId = 21110002,fight_id = 21110002,dwAIId = 21110002,dwDropId = 21110002,dwLook = 11200,Count = 11,LeiXing = 2};
		};
	
		[20] = {
			{dwMonsterId = 21120001,fight_id = 21120001,dwAIId = 21120001,dwDropId = 21110001,dwLook = 11200,Count = 186,LeiXing = 1};
			{dwMonsterId = 21120002,fight_id = 21120002,dwAIId = 21120002,dwDropId = 21110002,dwLook = 11200,Count = 11,LeiXing = 2};
		};
		
		[30] = {
			{dwMonsterId = 21130001,fight_id = 21130001,dwAIId = 21130001,dwDropId = 21110001,dwLook = 11200,Count = 186,LeiXing = 1};
			{dwMonsterId = 21130002,fight_id = 21130002,dwAIId = 21130002,dwDropId = 21110002,dwLook = 11200,Count = 11,LeiXing = 2};
		};
		
		[40] = {
			{dwMonsterId = 21140001,fight_id = 21140001,dwAIId = 21140001,dwDropId = 21110001,dwLook = 11200,Count = 193,LeiXing = 1};
			{dwMonsterId = 21140002,fight_id = 21140002,dwAIId = 21140002,dwDropId = 21110003,dwLook = 11200,Count = 1,LeiXing = 2};
			{dwMonsterId = 21140003,fight_id = 21140003,dwAIId = 21140003,dwDropId = 21110003,dwLook = 11200,Count = 1,LeiXing = 2};
			{dwMonsterId = 21140004,fight_id = 21140004,dwAIId = 21140004,dwDropId = 21110003,dwLook = 11200,Count = 1,LeiXing = 2};
			{dwMonsterId = 21140005,fight_id = 21140005,dwAIId = 21140005,dwDropId = 21110003,dwLook = 11200,Count = 1,LeiXing = 2};
		};
		
	};

	----怪物模型
	Look = {
	
		[1] = { -- 动物
			[10] = {100120010,100520031};
			[20] = {100620040,12411};
			[30] = {100420040,12510};
			--[40] = {100120010,12610,12710,12810,12910};
			[40] = {100120010,12610,12710,12810,12910};
			};
		[2] = { -- 五毒教
			-- [10] = {100620020,100620070};
			-- [20] = {100620010,503020130};
			-- [30] = {100820040,101120050};
			-- [40] = {100520010,100620060,101120060,503020070,503020140};
			[10] = {100120010,100520031};
			[20] = {100620040,12411};
			[30] = {100420040,12510};
			[40] = {100120010,12610,12710,12810,12910};
			};
		[3] = { -- 波斯
			-- [10] = {100710080,100720050};
			-- [20] = {100620010,100710100};
			-- [30] = {100720020,100710110};
			-- [40] = {100710980,100820060,100520060,100710060,101120060};
			[10] = {100120010,100520031};
			[20] = {100620040,12411};
			[30] = {100420040,12510};
			[40] = {100120010,12610,12710,12810,12910};
			};
		[4] = { -- 蒙古
			-- [10] = {100320010,507200080};
			-- [20] = {100320020,100920090};
			-- [30] = {100320030,100120040};
			-- [40] = {100320040,505020110,100320060,100820050,100720030};
			[10] = {100120010,100520031};
			[20] = {100620040,12411};
			[30] = {100420040,12510};
			[40] = {100120010,12610,12710,12810,12910};
			};
			
	};


	--根据开服调整怪物强度
	fight_id = {
		--第一小怪   第2BOSS
		[1] = {---第1周
			[10] = {21110001,4045};
			[20] = {21120001,4055};
			[30] = {21130001,4065};
			[40] = {21140001,4070};
			};
		[2] = {---第2周
			[10] = {21110001,4050};
			[20] = {21120001,4060};
			[30] = {21130001,4070};
			[40] = {21140001,4075};
			};
		[3] = {---第3周
			[10] = {21110001,4055};
			[20] = {21120001,4065};
			[30] = {21130001,4075};
			[40] = {21140001,4080};
			};
		[4] = {---第4周
			[10] = {21110001,4060};
			[20] = {21120001,4070};
			[30] = {21130001,4080};
			[40] = {21140001,4085};
			};
			
	};


};
local MoXing = 1;

function Number:Monster(Cishu,Zhou)
	
	--第一次随机LOOK
	if (Cishu == 10) then
		MoXing = math.random(4);
	end


	local t = MonsterHunter_XinXi
	
	for loop =10,40,10 do
		for loop1 = 1,#t.Biao[loop] do
			t.Biao[loop][loop1].dwLook = t.Look[MoXing][Cishu][loop1]
			t.Biao[loop][loop1].fight_id = t.fight_id[Zhou][loop][t.Biao[loop][loop1].LeiXing]
			-- if (t.Biao[loop][loop1].LeiXing == 0) then
				-- t.Biao[loop][loop1].fight_id = t.fight_id[Zhou][loop][1]
			-- end
			-- if (t.Biao[loop][loop1].LeiXing == 1) then
				-- t.Biao[loop][loop1].fight_id = t.fight_id[Zhou][loop][2]
			-- end
		end
	end
	
	return t.Biao[Cishu]
end

--Activity[2]:Implement(mgrScript);
function Number:Implement(mgrScript,Cishu,dwDay)
	local Zhou = math.ceil(dwDay/7)
	
	if (Zhou <= 0) then
		Zhou = 1;
	elseif (Zhou > 4) then
		Zhou = 4;
	end	
	

	--坐标信息
	local coord = Number:coord()

	local Monster = Number:Monster(Cishu,Zhou)

	Activity:Settled(mgrScript,coord,Monster)
end

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
--流星雨主要
local Number = Activity[3];

Number.place = {
	[1002] = {
		{x=0.94,y=1.41,map=1002};
		{x=-5.72,y=-6.27,map=1002};
		{x=1.15,y=-12.53,map=1002};
		{x=-7.23,y=-17.71,map=1002};
		{x=-1.34,y=-23.96,map=1002};
		{x=-5.66,y=-26.31,map=1002};
		{x=-7.20,y=-33.67,map=1002};
		{x=1.22,y=-36.77,map=1002};
		{x=0.82,y=-44.43,map=1002};
		{x=-8.27,y=-43.3,map=1002};
		{x=-3.36,y=-47.50,map=1002};
		{x=-7.6,y=-51.81,map=1002};
		{x=1.22,y=-55.26,map=1002};
		{x=-3.21,y=-60.38,map=1002};
		{x=-11.10,y=-56.8,map=1002};
		{x=-12.75,y=-63.99,map=1002};
		{x=6.52,y=-60.49,map=1002};
		{x=4.39,y=-68.5,map=1002};
		{x=-6.69,y=-67.81,map=1002};
		{x=-13.81,y=-72.31,map=1002};
		{x=-21.33,y=-67.82,map=1002};
		{x=13.14,y=-66.1,map=1002};
		{x=19.17,y=-61.27,map=1002};
		{x=23.72,y=-66.51,map=1002};
		{x=27.96,y=-61.55,map=1002};
		{x=37.59,y=-69.95,map=1002};
		{x=34.47,y=-66.28,map=1002};
		{x=36.17,y=-58.49,map=1002};
		{x=34.20,y=-52.57,map=1002};
		{x=31.80,y=-46.11,map=1002};
		{x=35.89,y=-41.22,map=1002};
		{x=35.13,y=-34.44,map=1002};
		{x=32.52,y=-28.55,map=1002};
		{x=36.98,y=-23.52,map=1002};
		{x=32.2,y=-19.16,map=1002};
		{x=43.12,y=-43.54,map=1002};
		{x=46.15,y=-49.25,map=1002};
		{x=51.95,y=-43.92,map=1002};
		{x=57.68,y=-48.1,map=1002};
		{x=56.12,y=-55.59,map=1002};
		{x=59.21,y=-62.98,map=1002};
		{x=67.25,y=-59.5,map=1002};
		{x=63.24,y=-56.4,map=1002};
		{x=65.96,y=-43.64,map=1002};
		{x=67.91,y=-35.72,map=1002};
		{x=57.51,y=-39.22,map=1002};
		{x=62.28,y=-28.65,map=1002};
		{x=55.45,y=-29.31,map=1002};
		{x=66.62,y=-28.10,map=1002};
		{x=65.11,y=-19.44,map=1002};
		{x=56.35,y=-20.14,map=1002};
		{x=61.10,y=-16.14,map=1002};
		{x=63.79,y=-10.62,map=1002};
		{x=56.40,y=-9.54,map=1002};
		{x=52.64,y=-4.18,map=1002};
		{x=65.58,y=-0.93,map=1002};
		{x=63.69,y=6.49,map=1002};
		{x=54.90,y=10.63,map=1002};
		{x=50.86,y=17.54,map=1002};
		{x=68.75,y=15.85,map=1002};
		{x=65.37,y=21.3,map=1002};
		{x=59.65,y=17.81,map=1002};
		{x=52.85,y=21.74,map=1002};
		{x=51.36,y=28.54,map=1002};
		{x=57.73,y=28.37,map=1002};
		{x=57.64,y=1.86,map=1002};
		{x=66.12,y=29.30,map=1002};
		{x=52.91,y=36.25,map=1002};
		{x=61.52,y=37.2,map=1002};
		{x=59.61,y=43.60,map=1002};
		{x=51.88,y=49.66,map=1002};
		{x=63.97,y=51.29,map=1002};
		{x=53.54,y=57.22,map=1002};
		{x=59.26,y=61.7,map=1002};
		{x=66.9,y=65.26,map=1002};
		{x=61.93,y=71.98,map=1002};
		{x=52.95,y=72.11,map=1002};
		{x=73.62,y=23.10,map=1002};
		{x=77.41,y=17.23,map=1002};
		{x=78.8,y=28.72,map=1002};
		{x=83.71,y=23.63,map=1002};
		{x=88.79,y=17.47,map=1002};
		{x=90.63,y=30.8,map=1002};
		{x=95.99,y=25.82,map=1002};
		{x=101.12,y=31.84,map=1002};
		{x=106.76,y=26.14,map=1002};
		{x=106.63,y=16.45,map=1002};
		{x=112.96,y=15.34,map=1002};
		{x=116.36,y=21.91,map=1002};
		{x=119.57,y=29.15,map=1002};
		{x=122.62,y=36.92,map=1002};
		{x=98.92,y=19.96,map=1002};
		{x=55.68,y=79.75,map=1002};
		{x=67.74,y=82.13,map=1002};
		{x=63.16,y=88.21,map=1002};
		{x=51.20,y=86.41,map=1002};
		{x=55.25,y=92.88,map=1002};
		{x=51.46,y=97.14,map=1002};
		{x=65.56,y=96.64,map=1002};
		{x=64.7,y=104.17,map=1002};
		{x=57.66,y=107.18,map=1002};
		{x=54.5,y=112.58,map=1002};
		{x=67.32,y=114.97,map=1002};
		{x=61.94,y=120.15,map=1002};
		{x=72.7,y=71.32,map=1002};
		{x=77.71,y=76.10,map=1002};
		{x=80.69,y=69.59,map=1002};
		{x=87.24,y=71.7,map=1002};
		{x=88.29,y=79.7,map=1002};
		{x=96.5,y=75.33,map=1002};
		{x=99.41,y=69.39,map=1002};
		{x=17.76,y=14.48,map=1002};
		{x=24.72,y=19.84,map=1002};
		{x=32.30,y=17.69,map=1002};
		{x=37.30,y=22.65,map=1002};
		{x=43.45,y=21.12,map=1002};
		{x=-27.91,y=25.4,map=1002};
		{x=-38.25,y=18.15,map=1002};
		{x=-44.72,y=23.92,map=1002};
		{x=-49.14,y=18.8,map=1002};
		{x=-54.44,y=22.93,map=1002};
		{x=-59.1,y=17.13,map=1002};
		{x=-67.99,y=10.97,map=1002};
		{x=-55.20,y=33.78,map=1002};
		{x=-62.55,y=34.0,map=1002};
		{x=-69.82,y=30.91,map=1002};
		{x=-73.58,y=20.85,map=1002};
		{x=-72.93,y=39.89,map=1002};
		{x=-65.45,y=44.20,map=1002};
		{x=-73.27,y=48.65,map=1002};
		{x=-65.74,y=53.29,map=1002};
		{x=-60.84,y=60.19,map=1002};
		{x=-66.66,y=62.20,map=1002};
		{x=-71.37,y=65.12,map=1002};
		{x=-67.26,y=68.94,map=1002};
		{x=-63.4,y=75.79,map=1002};
		{x=-71.89,y=76.47,map=1002};
		{x=-71.63,y=83.90,map=1002};
		{x=-65.61,y=85.80,map=1002};
		{x=-67.94,y=91.7,map=1002};
		{x=-64.55,y=97.14,map=1002};
		{x=-72.31,y=97.4,map=1002};
		{x=-68.68,y=102.6,map=1002};
		{x=-71.83,y=107.53,map=1002};
		{x=-66.46,y=112.65,map=1002};
		{x=-80.81,y=18.28,map=1002};
		{x=-85.70,y=22.92,map=1002};
		{x=-89.3,y=16.37,map=1002};
		{x=-95.48,y=12.83,map=1002};
		{x=-95.82,y=20.85,map=1002};
		{x=-96.28,y=29.7,map=1002};
		{x=-90.88,y=36.32,map=1002};
		{x=-95.0,y=42.25,map=1002};
		{x=-101.79,y=37.85,map=1002};
		{x=-102.43,y=46.24,map=1002};
		{x=-96.15,y=48.90,map=1002};
		{x=-94.0,y=55.38,map=1002};
		{x=-96.15,y=59.53,map=1002};
		{x=-103.52,y=54.63,map=1002};
		{x=-109.87,y=58.32,map=1002};
		{x=-108.94,y=50.89,map=1002};
		{x=-114.71,y=48.72,map=1002};
		{x=-117.43,y=54.2,map=1002};
		{x=-118.86,y=58.95,map=1002};
		{x=-124.33,y=59.41,map=1002};
		{x=-127.6,y=51.39,map=1002};
		{x=-103.82,y=25.10,map=1002};
		{x=-103.58,y=13.97,map=1002};
		{x=-111.66,y=16.75,map=1002};
		{x=-115.56,y=22.92,map=1002};
		{x=-124.97,y=25.30,map=1002};
		{x=-121.20,y=16.54,map=1002};
		{x=-126.43,y=17.34,map=1002};
		{x=-130.57,y=22.57,map=1002};
		{x=-134.68,y=15.80,map=1002};
		{x=-99.90,y=7.46,map=1002};
		{x=-99.75,y=-2.16,map=1002};
		{x=-99.68,y=-12.4,map=1002};
		{x=-93.4,y=-13.13,map=1002};
		{x=-91.57,y=-20.40,map=1002};
		{x=-83.92,y=-17.55,map=1002};
		{x=-75.90,y=-23.41,map=1002};
		{x=-67.31,y=-27.1,map=1002};
		{x=-58.57,y=-23.71,map=1002};
		{x=-52.60,y=-19.9,map=1002};
		{x=-48.40,y=-12.77,map=1002};
		{x=-50.60,y=-8.64,map=1002};
		{x=-55.55,y=-2.98,map=1002};
		{x=-60.43,y=0.19,map=1002};
		{x=-66.78,y=-0.79,map=1002};
		{x=-72.24,y=2.78,map=1002};
		{x=-63.77,y=5.29,map=1002};
		{x=-66.67,y=-34.9,map=1002};
		{x=-62.48,y=-41.81,map=1002};
		{x=-58.96,y=-48.72,map=1002};
		{x=-52.67,y=-50.37,map=1002};
		{x=-43.73,y=-48.55,map=1002};
		{x=-35.37,y=-46.26,map=1002};
		{x=-35.94,y=-40.19,map=1002};
		{x=-42.9,y=-38.67,map=1002};
		{x=-38.44,y=-32.82,map=1002};
		{x=-31.79,y=-34.77,map=1002};
		{x=-28.1,y=-40.82,map=1002};
		{x=-31.98,y=-46.97,map=1002};
		{x=0.54,y=-77.0,map=1002};
		{x=-5.85,y=-81.93,map=1002};
		{x=0.57,y=-86.89,map=1002};
		{x=-9.54,y=-87.24,map=1002};
		{x=-7.1,y=-95.24,map=1002};
		{x=-0.15,y=-100.17,map=1002};
		{x=-6.4,y=-105.54,map=1002};
		{x=0.85,y=-110.85,map=1002};
		{x=-4.44,y=-114.96,map=1002};
		{x=0.80,y=-121.72,map=1002};
		{x=-9.3,y=-120.48,map=1002};
		{x=-7.32,y=-126.35,map=1002};
		{x=-1.51,y=-130.73,map=1002};
		{x=9.87,y=-118.63,map=1002};
		{x=12.98,y=-124.96,map=1002};
		{x=19.43,y=-118.43,map=1002};
		{x=21.77,y=-127.5,map=1002};
		{x=26.89,y=-123.85,map=1002};
		{x=33.8,y=-119.10,map=1002};
		{x=36.32,y=-123.1,map=1002};
		{x=41.1,y=-117.53,map=1002};
		{x=40.22,y=-111.2,map=1002};
		{x=39.27,y=-104.23,map=1002};
		{x=48.97,y=-103.72,map=1002};
		{x=51.23,y=-111.61,map=1002};
		{x=58.31,y=-110.16,map=1002};
		{x=62.64,y=-103.68,map=1002};
		{x=49.91,y=-119.40,map=1002};
		{x=42.96,y=-122.13,map=1002};
		{x=41.29,y=-131.3,map=1002};
		{x=37.91,y=-136.76,map=1002};
		{x=43.78,y=-134.85,map=1002};
		{x=49.50,y=-137.29,map=1002};
		{x=54.20,y=-132.83,map=1002};
		{x=60.43,y=-135.34,map=1002};
		{x=57.98,y=-126.5,map=1002};
		{x=55.76,y=-119.82,map=1002};
		{x=63.4,y=-118.82,map=1002};
		{x=67.62,y=-125.13,map=1002};
		{x=71.1,y=-119.29,map=1002};
		{x=-14.67,y=-126.91,map=1002};
		{x=-18.74,y=-122.32,map=1002};
		{x=-23.93,y=-126.75,map=1002};
		{x=-29.20,y=-121.1,map=1002};
		{x=-39.17,y=-125.73,map=1002};
		{x=-44.81,y=-122.72,map=1002};
		{x=-51.1,y=-120.59,map=1002};
		{x=-53.65,y=-113.70,map=1002};
		{x=-61.75,y=-117.78,map=1002};
		{x=-60.67,y=-109.29,map=1002};
		{x=-53.72,y=-106.15,map=1002};
		{x=-59.86,y=-102.56,map=1002};
		{x=-54.70,y=-97.16,map=1002};
		{x=-48.60,y=-99.37,map=1002};
		{x=-71.19,y=-107.49,map=1002};
		{x=-79.64,y=-105.9,map=1002};
		{x=-85.90,y=-100.9,map=1002};
		{x=-93.59,y=-99.92,map=1002};
		{x=-103.59,y=-104.31,map=1002};
		{x=-107.50,y=-99.18,map=1002};
		{x=-114.27,y=-97.80,map=1002};
		{x=-122.8,y=-95.48,map=1002};
		{x=-113.47,y=-88.75,map=1002};
		{x=-110.92,y=-80.87,map=1002};
		{x=-107.90,y=-73.93,map=1002};
		{x=-103.89,y=-69.97,map=1002};
		{x=-100.95,y=-76.84,map=1002};
		{x=-106.64,y=-81.43,map=1002};
		{x=-104.21,y=-87.65,map=1002};
		{x=-97.85,y=-90.59,map=1002};
		{x=-95.58,y=-84.75,map=1002};
		{x=-90.0,y=-78.12,map=1002};
		{x=-85.37,y=-86.5,map=1002};
		{x=-76.10,y=-82.86,map=1002};
		{x=-67.75,y=-82.24,map=1002};
		{x=-60.47,y=-81.60,map=1002};
		{x=-51.78,y=-80.56,map=1002};
		{x=-51.39,y=-72.31,map=1002};
		{x=-44.77,y=-72.94,map=1002};
		{x=-38.7,y=-67.51,map=1002};
		{x=-32.11,y=-70.26,map=1002};
		{x=-26.20,y=-65.45,map=1002};
		{x=16.70,y=30.54,map=1002};
		{x=12.8,y=38.95,map=1002};
		{x=-3.6,y=38.14,map=1002};
		{x=-15.60,y=38.69,map=1002};
		{x=-25.65,y=34.24,map=1002};
		{x=-26.87,y=15.23,map=1002};
		{x=-19.82,y=9.80,map=1002};
		{x=-24.66,y=2.60,map=1002};
		{x=-17.38,y=3.33,map=1002};
		{x=-10.71,y=2.90,map=1002};

	};

};

Number.Scene = {
	[1002] = {296,10000};
};

Number.Count = {}


Number.Monster = {
	{dwMonsterId = 20000010,fight_id = 20000010,dwAIId = 80,dwDropId = 20000002,dwLook = 11300};
};
	
function Number:Implement(mgrScript) 
	self:Bale(mgrScript)
end

function Number:Bale(mgrScript)
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	
	local Info = self.place[1002]
	local dwMonsterId = self.Monster[1].dwMonsterId
	local dwFightId = self.Monster[1].fight_id
	local dwAIId = self.Monster[1].dwAIId
	local dwDropId = self.Monster[1].dwDropId
	local dwLookId = self.Monster[1].dwLook
	
	for i=1,#Info do
		local dwX = Info[i].x
		local dwY = Info[i].y
		local dwObjId = nil
		local dwDelay = i*250
		local objPlayer = nil
		local objID = mgrMon:DelayAdd(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwObjId,dwDelay,objPlayer)
		table.insert(self.Count,objID)
	end
	do return end;
end

function Number:Clear()
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	for i=1,#self.Count do
		mgrMon:Remove(self.Count[i])
	end
end


function Activity:Settled(mgrScript,coord,Monster)
	
	local Record = 1;
	for loop =1,#Monster do
		for loop1 = 1,Monster[loop].Count do
			
			local t = Monster[loop]
			local m = coord[Record]
			mgrScript:AddMonToMap(m.map,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
			Record = Record + 1;
		end

	end
end
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--流星雨 附属01
local Number = Activity[4];

Number.place = {
	[1002] = {
		{x=6.22,y=-63.76,map=1002};
		{x=7.84,y=-67.07,map=1002};
		{x=4.06,y=-65.65,map=1002};
		
		{x=3.23,y=-61.27,map=1002};
		{x=4.35,y=-57.78,map=1002};
		{x=-0.34,y=-57.76,map=1002};
		{x=-4.35,y=-56.29,map=1002};
		
		{x=-6.91,y=-55.83,map=1002};
		{x=-9.29,y=-53.70,map=1002};
		{x=-11.47,y=-59.28,map=1002};
		{x=-10.74,y=-65.93,map=1002};
		
		{x=-9.33,y=-68.76,map=1002};
		{x=-12.94,y=-68.75,map=1002};
		{x=-14.43,y=-57.22,map=1002};
		{x=-7.28,y=-66.96,map=1002};
		
		{x=6.25,y=-68.98,map=1002};
		{x=-2.85,y=-64.63,map=1002};
		{x=-7.02,y=-65.47,map=1002};
		{x=-8.10,y=-61.10,map=1002};
		
		{x=-9.22,y=-70.19,map=1002};
		{x=-12.85,y=-70.05,map=1002};
		{x=5.15,y=-58.73,map=1002};
		{x=3.12,y=-69.11,map=1002};
		
		{x=1.91,y=-65.80,map=1002};
		{x=-0.22,y=-65.20,map=1002};
		{x=1.61,y=-63.99,map=1002};
		{x=0.59,y=-60.24,map=1002};
		
		{x=-2.37,y=-60.20,map=1002};
		{x=-4.09,y=-62.46,map=1002};
		{x=-6.10,y=-59.56,map=1002};
		{x=-7.83,y=-63.16,map=1002};
		
		{x=-10.41,y=-63.69,map=1002};
		{x=-12.44,y=-64.81,map=1002};
		{x=-13.16,y=-61.91,map=1002};
		{x=-14.70,y=-59.74,map=1002};
		
		{x=1.09,y=-67.77,map=1002};
		{x=-1.44,y=-68.33,map=1002};
		{x=-4.30,y=-67.36,map=1002};
		{x=-0.49,y=-62.33,map=1002};
		
		{x=-3.89,y=-69.43,map=1002};
		{x=-5.90,y=-68.95,map=1002};
		{x=-8.54,y=-58.04,map=1002};
		{x=-8.54,y=-58.04,map=1002};
		
		{x=2.78,y=-55.99,map=1002};
		{x=-3.41,y=-57.80,map=1002};
		{x=-10.37,y=-61.22,map=1002};
		{x=-10.79,y=-56.16,map=1002};
		
		{x=-14.17,y=-65.72,map=1002};
		{x=6.02,y=-61.14,map=1002};
		{x=6.16,y=-66.45,map=1002};
		{x=4.68,y=-64.24,map=1002};
	};

};

Number.Scene = {
	[1002] = {51,10000};
};

Number.Count = {}


Number.Monster = {
	{dwMonsterId = 20000011,fight_id = 20000010,dwAIId = 80,dwDropId = 20000002,dwLook = 11300};
};
	
function Number:Implement(mgrScript) 
	self:Bale(mgrScript)
end

function Number:Bale(mgrScript)
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	
	local Info = self.place[1002]
	local dwMonsterId = self.Monster[1].dwMonsterId
	local dwFightId = self.Monster[1].fight_id
	local dwAIId = self.Monster[1].dwAIId
	local dwDropId = self.Monster[1].dwDropId
	local dwLookId = self.Monster[1].dwLook
	
	for i=1,#Info do
		local dwX = Info[i].x
		local dwY = Info[i].y
		local dwObjId = nil
		local dwDelay = i*250
		local objPlayer = nil
		local objID = mgrMon:DelayAdd(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwObjId,dwDelay,objPlayer)
		table.insert(self.Count,objID)
	end
	do return end;
end

function Number:Clear()
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	for i=1,#self.Count do
		mgrMon:Remove(self.Count[i])
	end
end


function Activity:Settled(mgrScript,coord,Monster)
	
	local Record = 1;
	for loop =1,#Monster do
		for loop1 = 1,Monster[loop].Count do
			
			local t = Monster[loop]
			local m = coord[Record]
			mgrScript:AddMonToMap(m.map,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
			Record = Record + 1;
		end

	end
end

--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--流星雨 附属02
local Number = Activity[5];

Number.place = {
	[1002] = {
		{x=67.68,y=14.41,map=1002};		
		{x=67.30,y=16.85,map=1002};	
		{x=64.30,y=14.35,map=1002};	
		{x=64.47,y=12.71,map=1002};	
		{x=64.47,y=10.96,map=1002};	
		{x=62.22,y=12.11,map=1002};	
		{x=60.94,y=13.22,map=1002};	
		{x=59.63,y=11.32,map=1002};	
		{x=57.28,y=13.49,map=1002};	
		{x=55.01,y=12.48,map=1002};	
		{x=52.69,y=11.54,map=1002};	
		{x=52.68,y=13.93,map=1002};	
		{x=51.90,y=16.43,map=1002};	
		{x=50.45,y=17.94,map=1002};	
		{x=51.80,y=20.09,map=1002};
		{x=53.14,y=22.42,map=1002};	
		{x=51.89,y=24.74,map=1002};	
		{x=52.09,y=27.10,map=1002};	
		{x=52.58,y=29.24,map=1002};	
		{x=55.81,y=29.57,map=1002};
		{x=58.08,y=29.82,map=1002};	
		{x=60.77,y=29.92,map=1002};	
		{x=63.60,y=29.23,map=1002};	
		{x=63.77,y=26.63,map=1002};	
		{x=66.21,y=26.17,map=1002};
		{x=62.53,y=18.71,map=1002};	
		{x=59.35,y=19.12,map=1002};	
		{x=56.93,y=17.90,map=1002};	
		{x=55.61,y=20.23,map=1002};	
		{x=55.52,y=26.41,map=1002};
		{x=58.59,y=27.43,map=1002};	
		{x=61.08,y=26.59,map=1002};	
		{x=62.79,y=23.19,map=1002};	
		{x=64.77,y=19.98,map=1002};	
		{x=58.71,y=20.84,map=1002};
		{x=64.88,y=17.16,map=1002};	
		{x=62.30,y=15.79,map=1002};	
		{x=60.21,y=15.49,map=1002};	
		{x=59.06,y=16.74,map=1002};	
		{x=56.13,y=15.29,map=1002};
	    {x=54.87,y=17.00,map=1002};	
		{x=53.76,y=19.50,map=1002};	
		{x=57.34,y=22.84,map=1002};	
		{x=57.02,y=25.46,map=1002};	
		{x=54.25,y=25.20,map=1002};
		{x=67.07,y=24.00,map=1002};	
		{x=68.07,y=21.49,map=1002};	
		{x=60.69,y=17.40,map=1002};	
		{x=64.99,y=22.69,map=1002};	
		{x=61.95,y=21.10,map=1002};
		{x=60.50,y=24.16,map=1002};	
		{x=51.45,y=22.29,map=1002};	
		{x=56.87,y=10.86,map=1002};	
		{x=55.65,y=23.25,map=1002};
	};

};

Number.Scene = {
	[1002] = {54,10000};
};

Number.Count = {}


Number.Monster = {
	{dwMonsterId = 20000011,fight_id = 20000010,dwAIId = 80,dwDropId = 20000002,dwLook = 11300};
};
	
function Number:Implement(mgrScript) 
	self:Bale(mgrScript)
end

function Number:Bale(mgrScript)
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	
	local Info = self.place[1002]
	local dwMonsterId = self.Monster[1].dwMonsterId
	local dwFightId = self.Monster[1].fight_id
	local dwAIId = self.Monster[1].dwAIId
	local dwDropId = self.Monster[1].dwDropId
	local dwLookId = self.Monster[1].dwLook
	
	for i=1,#Info do
		local dwX = Info[i].x
		local dwY = Info[i].y
		local dwObjId = nil
		local dwDelay = i*250
		local objPlayer = nil
		local objID = mgrMon:DelayAdd(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwObjId,dwDelay,objPlayer)
		table.insert(self.Count,objID)
	end
	do return end;
end

function Number:Clear()
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	for i=1,#self.Count do
		mgrMon:Remove(self.Count[i])
	end
end


function Activity:Settled(mgrScript,coord,Monster)
	
	local Record = 1;
	for loop =1,#Monster do
		for loop1 = 1,Monster[loop].Count do
			
			local t = Monster[loop]
			local m = coord[Record]
			mgrScript:AddMonToMap(m.map,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
			Record = Record + 1;
		end

	end
end
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--流星雨 附属03
local Number = Activity[6];

Number.place = {
	[1002] = {
		{x=-67.63,y=13.11,map=1002};	
        {x=-67.73,y=16.48,map=1002};	
		{x=-66.78,y=18.78,map=1002};
		{x=-65.44,y=21.71,map=1002};
		{x=-64.66,y=23.90,map=1002};
		{x=-63.17,y=13.35,map=1002};	
        {x=-65.33,y=12.53,map=1002};	
		{x=-65.79,y=15.15,map=1002};
		{x=-61.86,y=15.30,map=1002};
		{x=-62.18,y=17.80,map=1002};
	    {x=-61.90,y=20.40,map=1002};	
        {x=-62.01,y=22.51,map=1002};	
		{x=-61.67,y=25.71,map=1002};
		{x=-63.79,y=26.83,map=1002};
		{x=-66.13,y=25.01,map=1002};
		{x=-64.53,y=14.63,map=1002};	
        {x=-68.27,y=14.37,map=1002};	
		{x=-64.18,y=18.09,map=1002};
		{x=-63.69,y=20.81,map=1002};
		{x=-59.22,y=18.11,map=1002};
		{x=-57.24,y=21.45,map=1002};	
        {x=-58.65,y=25.30,map=1002};	
		{x=-56.22,y=15.58,map=1002};
		{x=-55.64,y=18.07,map=1002};
		{x=-55.39,y=21.26,map=1002};
		{x=-55.18,y=24.30,map=1002};	
        {x=-57.68,y=23.84,map=1002};	
		{x=-53.21,y=18.27,map=1002};
		{x=-57.42,y=13.68,map=1002};
		{x=-58.16,y=16.71,map=1002};
		{x=-60.40,y=13.84,map=1002};	
        {x=-59.56,y=22.69,map=1002};	
		{x=-53.41,y=15.66,map=1002};
		{x=-53.13,y=23.67,map=1002};
		{x=-53.14,y=20.71,map=1002};
		{x=-56,y=26,map=1002};
		{x=-58,y=28,map=1002};
		{x=-60,y=30,map=1002};
		{x=-65,y=30,map=1002};
		{x=-67,y=28,map=1002};
		{x=-52,y=27,map=1002};
		{x=-54,y=29,map=1002};
		{x=-58,y=30,map=1002};
		{x=-60,y=31,map=1002};
		{x=-64,y=31,map=1002};
	};

};

Number.Scene = {
	[1002] = {45,10000};
};

Number.Count = {}


Number.Monster = {
	{dwMonsterId = 20000011,fight_id = 20000010,dwAIId = 80,dwDropId = 20000002,dwLook = 11300};
};
	
function Number:Implement(mgrScript) 
	self:Bale(mgrScript)
end

function Number:Bale(mgrScript)
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	
	local Info = self.place[1002]
	local dwMonsterId = self.Monster[1].dwMonsterId
	local dwFightId = self.Monster[1].fight_id
	local dwAIId = self.Monster[1].dwAIId
	local dwDropId = self.Monster[1].dwDropId
	local dwLookId = self.Monster[1].dwLook
	
	for i=1,#Info do
		local dwX = Info[i].x
		local dwY = Info[i].y
		local dwObjId = nil
		local dwDelay = i*250
		local objPlayer = nil
		local objID = mgrMon:DelayAdd(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwObjId,dwDelay,objPlayer)
		table.insert(self.Count,objID)
	end
	do return end;
end

function Number:Clear()
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	for i=1,#self.Count do
		mgrMon:Remove(self.Count[i])
	end
end


function Activity:Settled(mgrScript,coord,Monster)
	
	local Record = 1;
	for loop =1,#Monster do
		for loop1 = 1,Monster[loop].Count do
			
			local t = Monster[loop]
			local m = coord[Record]
			mgrScript:AddMonToMap(m.map,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
			Record = Record + 1;
		end

	end
end

--------------------------圣诞活动
local Number = Activity[7];
Number.place = {
	[1002] = {
		{x=58.35,y=20.68,map=1002};
		{x=-61.32,y=19.91,map=1002};
		{x=-35.97,y=-40.29,map=1002};
		{x=-3.15,y=-64.90,map=1002};
		{x=37.28,y=-122.26,map=1002};
		{x=-107.53,y=-83.25,map=1002};
	};
};

--刷新数量
Number.Scene = {
	[1002] = {6,8000};
	--[1005] = {10,7500};
	--[1006] = {10,8000};
	--[1007] = {10,7000};
	--[1008] = {10,8000};
};

Number.Count = {};

Number.Monster = {
	{dwMonsterId = 30000011,fight_id = 30000011,dwAIId = 30000011,dwDropId = 30000011,dwLook = 10150};	--大雪人
	{dwMonsterId = 30000012,fight_id = 30000012,dwAIId = 30000012,dwDropId = 30000012,dwLook = 10140};	--中雪人
	{dwMonsterId = 30000012,fight_id = 30000012,dwAIId = 30000012,dwDropId = 30000012,dwLook = 10140};	--中雪人
	{dwMonsterId = 30000013,fight_id = 30000013,dwAIId = 30000013,dwDropId = 30000013,dwLook = 10130};	--小雪人
	{dwMonsterId = 30000013,fight_id = 30000013,dwAIId = 30000013,dwDropId = 30000013,dwLook = 10130};	--小雪人
	{dwMonsterId = 30000013,fight_id = 30000013,dwAIId = 30000013,dwDropId = 30000013,dwLook = 10130};	--小雪人
};

function Number:Implement(mgrScript) 
	self:Bale(mgrScript)
end

function Number:Bale(mgrScript)
	--收集作废的坐标
	local waste = {};
	for k,n in pairs(self.Scene) do		--循环场景
		--保护
		if self.place[k] then			--如果当前场景坐标库存在
			for loop = 1,n[1] do		--取当前场景的刷怪数量
				local a = math.random(#self.place[k])		--随机place中一个坐标表
				local m = self.place[k][a]			--取到当前坐标所对应的表
				local t = self.Monster[loop]			--顺序取表中的每个怪物
				--local dwRand = math.random(10000);
				--if (dwRand <= n[2]) then
					local objID = mgrScript:AddMonToMap(k,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,m.x,m.y)
					table.insert(self.Count,objID)
					waste[k] = waste[k] or {}
					--保存坐标
					table.insert(waste[k],m)
					--删除坐标
					table.remove(self.place[k],a)
					
					
				--end
			end
		end
	end
	--还原坐标库
	for k,n in pairs(waste) do
		for _,m in pairs(n) do
			table.insert(self.place[k],m)
		end
	end
end


function Number:Clear()
	local Map = CMapManager:GetMap(1002)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	for i=1,#self.Count do
		mgrMon:Remove(self.Count[i])
	end
end


--------------------------年兽送喜

local Number = Activity[8];
--各场景坐标库
Number.place = {
	[1001] = {
		{x=34,y=-30};
		{x=39,y=59};
		{x=42,y=62};
		{x=-93,y=-16};
	};	
	[1002] = {
		{x=58.35,y=20.68};
		{x=-61.32,y=19.91};
		{x=-35.97,y=-40.29};
		{x=-3.15,y=-64.90};
		{x=37.28,y=-122.26};
		{x=-107.53,y=-83.25};
	};
	[1003] = {
		{x=-42,y=-4};
		{x=68,y=-26};
		{x=-66,y=-30};
		{x=-62,y=5};
		{x=-11,y=67};
	};	
	[1004] = {
		{x=75,y=-35};
		{x=76,y=84};
		{x=34,y=38};
		{x=-50,y=11};
		{x=-80,y=74};
		{x=-87,y=-63};
	};	
	-- [1005] = {
		-- {x=-53,y=35};
		-- {x=-97,y=-10};
		-- {x=-101,y=-73};
		-- {x=-43,y=-35};
		-- {x=18,y=-42};
		-- {x=-24,y=-93};
	-- };	
	[1006] = {
		{x=-85,y=80};
		{x=24,y=88};
		{x=37,y=15};
		{x=44,y=-52};
		{x=-3,y=-59};
		{x=-53,y=-41};
	};	
	[1007] = {
		{x=-85,y=80};
		{x=24,y=88};
		{x=37,y=15};
		{x=44,y=-52};
		{x=-3,y=-59};
		{x=-53,y=-41};
	};	
	[1008] = {
		{x=-99,y=-55};
		{x=-57,y=-20};
		{x=20,y=-42};
		{x=-23,y=-88};
		{x=-59,y=37};
	};	
	[1009] = {
		{x=-10,y=-1};
		{x=4,y=-58};
		{x=-13,y=-85};
		{x=-67,y=-46};
		{x=-79,y=15};
		{x=-72,y=64};
	};	
	[1010] = {
		{x=-112,y=-32};
		{x=-74,y=-75};
		{x=-14,y=-95};
		{x=-77,y=82};
		{x=83,y=32};
		{x=61,y=42};
	};
	[1011] = {
		{x=-26,y=-74};
		{x=-29,y=-91};
		{x=-39,y=-118};
		{x=-13,y=-101};
		{x=34,y=-75};
	};		
};

--怪物基本信息
Number.Monster = {
	{dwMonsterId = 50750001,fight_id = 30000011,dwAIId = 50750001,dwDropId = 30000011,dwLook = 5075200010};	--年兽
};

--怪物数量记录
Number.Count = {};
--场景
Number.mapID = 0
Number.mapName = nil
--位置
Number.Pos_x = 0
Number.Pos_y = 0
--公告记录标记
Number.mark_pos = 0
Number.mark_name = 0

--随机场景
function Number:SeleteScene()
	local SceneTable = {
		[1] = {mapID = 1001,mapName = T"丘山村"},
		[2] = {mapID = 1002,mapName = T"襄阳城"},
		[3] = {mapID = 1003,mapName = T"襄阳野郊"},
		[4] = {mapID = 1004,mapName = T"桃花岛"},
		-- [5] = {mapID = 1005,mapName = T"绝情密涧"},
		[6] = {mapID = 1006,mapName = T"大理"},
		[7] = {mapID = 1007,mapName = T"白驼山"},
		[8] = {mapID = 1008,mapName = T"终南山"},
		[9] = {mapID = 1009,mapName = T"丐帮竹林"},
		[10] = {mapID = 1010,mapName = T"华山"},
		[11] = {mapID = 1011,mapName = T"嵩山"},
		-- [12] = {mapID = 1012,mapName = T"昆仑山"},
	}
	local dwRand = math.random( #SceneTable );
	return SceneTable[dwRand].mapID,SceneTable[dwRand].mapName;
end

function Number:GetPos()
	if self.mark_pos == 0 then
		if self.place[Number.mapID] then				
			local a = math.random(#self.place[Number.mapID])		
			local m = self.place[Number.mapID][a]			
			Number.Pos_x = m.x;
			Number.Pos_y = m.y;
		end		
	end	
	self.mark_pos = self.mark_pos +1;	
	if self.mark_pos ==3 then
		self.mark_pos = 0;
	end
	return self.Pos_x,self.Pos_y	
end

function Number:GetMapName()
	if self.mark_name == 0 then
		local mapID,mapName = self:SeleteScene();
		Number.mapID = mapID;
		Number.mapName = mapName;
	end	
	self.mark_name = self.mark_name +1;	
	if self.mark_name ==3 then
		self.mark_name = 0;
	end
	return self.mapName
end

function Number:Implement(mgrScript)
	--收集作废的坐标
	local waste = {};
	if self.place[Number.mapID] then			
		for loop = 1,(#self.Monster) do		
			-- local a = math.random(#self.place[Number.mapID])		
			-- local m = self.place[Number.mapID][a]			
			-- Number.Pos_x = m.x;
			-- print( "Number.Pos_x===============",Number.Pos_x )
			-- Number.Pos_y = m.y;
			-- print( "Number.Pos_y===============",Number.Pos_y )
			local t = self.Monster[loop]			--顺序取表中的每个怪物
			local objID = mgrScript:AddMonToMap(Number.mapID,t.dwMonsterId,t.fight_id,t.dwAIId,t.dwDropId,t.dwLook,Number.Pos_x,Number.Pos_y)
			table.insert(self.Count,objID)
			waste[Number.mapID] = waste[Number.mapID] or {}
			--保存坐标
			table.insert(waste[Number.mapID],m)
			--删除坐标
			table.remove(self.place[Number.mapID],a)
		end
	end
	
	--还原坐标库
	for k,n in pairs(waste) do
		for _,m in pairs(n) do
			table.insert(self.place[k],m)
		end
	end
end


function Number:Clear(mapID)
	local Map = CMapManager:GetMap(mapID)
	if not Map then return end;
	local mgrMon = Map:GetMonsterMgr()
	if not mgrMon then return end;
	for i=1,#self.Count do
		mgrMon:Remove(self.Count[i])
	end
end

