--[[
功能：格子管理器
作者：段磊磊，
时间：2012-5-24
]]

_G.CCheckerManager = {};
function CCheckerManager:new()
	local obj = {};	
	for i ,v in pairs(CMapManager) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CCheckerManager:Create()
	
end
function CCheckerManager:Update()
end;
function CCheckerManager:Destroy()
end;
--初始化可视格子列表
function CCheckerManager:InitCanSeeEntity(map,setCanSeeEntity,dwCheckerX,dwCheckerY)
--	setCanSeeEntity = {}
	for k,v in pairs (setCanSeeEntity) do
		setCanSeeEntity[k] = nil
	end
	for i = dwCheckerX - 1,dwCheckerX + 1 do
		for j = dwCheckerY - 1,dwCheckerY + 1 do
			if map.setChecker[i] then
				if map.setChecker[i][j] then
					local t = {x = i,y = j}
					setCanSeeEntity[i*10+j] = t
				end
			end
		end
	end
end
--二分查找，找到介于t两个元素之间的值value,返回下标 a (t[a] < value and t[a+1] > value)
local function BinSearch(t,low,heigh,value)
	if low > heigh then
		return 1;
	else
		local mid = math.ceil((low+heigh)/2);
		if not t[mid+1] then
			return heigh
		end
		if value == nil then _info('value =',value) end
		if t[mid] <= value and t[mid+1] >= value then
			return mid
		else
			if t[mid] < value then
				low = mid + 1;
				return BinSearch(t,low,heigh,value);
			else
				heigh = mid - 1;
				return BinSearch(t,low,heigh,value);
			end
		end
		return 1;
	end
end
--得到当前地图格子 
function CCheckerManager:GetCurChecker2(map,PosX,PosY)
	local Y = BinSearch(map.setCoordinateX,1,MapInfoConfig[map.MapID].dwCheckerBaseValue,PosX)
	local X = #map.setCoordinateY - BinSearch(map.setCoordinateY,1,MapInfoConfig[map.MapID].dwCheckerBaseValue,PosY)
--	print('#map.setCoordinateY =',#map.setCoordinateY,'BinSearch =',BinSearch(map.setCoordinateY,1,MapInfoConfig[map.MapID].dwCheckerBaseValue,PosY))
	return math.max(X,1),math.max(Y,1)
end;
--得到当前地图格子--2012,08,31优化 
function CCheckerManager:GetCurChecker(map,PosX,PosY)
	--格子单位长度
	-- print(debug.traceback())
	local dwUniLen = map.dwLength/map.dwCheckerDim
	local x = PosX / dwUniLen + map.dwCheckerDim / 2
	x = (x - x % 1) + 1
	local y = PosY / dwUniLen + map.dwCheckerDim / 2
	y = (y - y % 1) + 1
	
	if x > map.dwCheckerDim then x = map.dwCheckerDim end
	if x < 1 then x = 1 end

	if y > map.dwCheckerDim then y = map.dwCheckerDim end
	if y < 1 then y = 1 end

	return x,y
end
--左边轴
local function Left(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX - 1] then
		if map.setChecker[dwValueX - 1][dwValueY - 1] then
			local t = {x = dwValueX - 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
	end
	if map.setChecker[dwValueX] then
		if map.setChecker[dwValueX][dwValueY - 1] then
			local t = {x = dwValueX,y = dwValueY - 1}
			table.insert(setChecker,t)
		end
	end
	if map.setChecker[dwValueX + 1] then
		if map.setChecker[dwValueX + 1][dwValueY - 1] then
			local t = {x = dwValueX + 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
	end
end
--右边轴
local function Right(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX - 1] then
		if map.setChecker[dwValueX - 1][dwValueY + 1] then
			local t = {x = dwValueX - 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
	end

	if map.setChecker[dwValueX][dwValueY + 1] then
		local t = {x = dwValueX,y = dwValueY + 1}
		table.insert(setChecker,t)
	end

	if map.setChecker[dwValueX + 1] then
		if map.setChecker[dwValueX + 1][dwValueY + 1] then
			local t = {x = dwValueX + 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
	end
end
--上边轴
local function Top(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX - 1] then
		if map.setChecker[dwValueX - 1][dwValueY - 1] then
			local t = {x = dwValueX - 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX - 1][dwValueY] then
			local t = {x = dwValueX - 1,y = dwValueY}
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX - 1][dwValueY + 1] then
			local t = {x = dwValueX - 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
	end
end
--下边轴
local function Bottom(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX + 1] then
		if map.setChecker[dwValueX + 1][dwValueY - 1] then
			local t = {x = dwValueX + 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX + 1][dwValueY] then
			local t = {x = dwValueX + 1,y = dwValueY}
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX + 1][dwValueY + 1] then
			local t = {x = dwValueX + 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
	end
end
--左上边轴
local function TopLeft(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX - 1] then
		if map.setChecker[dwValueX - 1][dwValueY + 1] then
			local t = {x = dwValueX - 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX - 1][dwValueY] then
			local t = {x = dwValueX - 1,y = dwValueY}
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX - 1][dwValueY - 1] then
			local t = {x = dwValueX - 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
	end
	if map.setChecker[dwValueX ][dwValueY - 1] then
		local t = {x = dwValueX ,y = dwValueY - 1 }
		table.insert(setChecker,t)
	end
	if map.setChecker[dwValueX + 1] then
		if map.setChecker[dwValueX + 1][dwValueY - 1] then
			local t = {x = dwValueX + 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
	end
end
--右上边轴
local function TopRight(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX - 1] then
		if map.setChecker[dwValueX - 1][dwValueY - 1] then
			local t = {x = dwValueX - 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX - 1][dwValueY + 1] then
			local t = {x = dwValueX - 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX - 1][dwValueY] then
			local t = {x = dwValueX - 1,y = dwValueY}
			table.insert(setChecker,t)
		end
	end
	if map.setChecker[dwValueX ][dwValueY + 1] then
		local t = {x = dwValueX ,y = dwValueY + 1 }
		table.insert(setChecker,t)
	end
	if map.setChecker[dwValueX + 1] then
		if map.setChecker[dwValueX + 1][dwValueY + 1] then
			local t = {x = dwValueX + 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
	end
end
--右下边轴
local function BottomRight(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX - 1] then
		if map.setChecker[dwValueX - 1][dwValueY + 1] then
			local t = {x = dwValueX - 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
	end
	if map.setChecker[dwValueX][dwValueY + 1] then
		local t = {x = dwValueX,y = dwValueY + 1 }
		table.insert(setChecker,t)
	end
	if map.setChecker[dwValueX + 1] then
		if map.setChecker[dwValueX + 1][dwValueY + 1] then
			local t = {x = dwValueX + 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX + 1][dwValueY] then
			local t = {x = dwValueX + 1,y = dwValueY }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX + 1][dwValueY - 1] then
			local t = {x = dwValueX + 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
	end
end
--左下边轴
local function BottomLeft(map,setChecker,dwValueX,dwValueY)
	if map.setChecker[dwValueX - 1] then
		if map.setChecker[dwValueX - 1][dwValueY - 1] then
			local t = {x = dwValueX - 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
	end
	if map.setChecker[dwValueX][dwValueY - 1] then
		local t = {x = dwValueX,y = dwValueY - 1 }
		table.insert(setChecker,t)
	end
	if map.setChecker[dwValueX + 1] then
		if map.setChecker[dwValueX + 1][dwValueY - 1] then
			local t = {x = dwValueX + 1,y = dwValueY - 1 }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX + 1][dwValueY] then
			local t = {x = dwValueX + 1,y = dwValueY }
			table.insert(setChecker,t)
		end
		if map.setChecker[dwValueX + 1][dwValueY + 1] then
			local t = {x = dwValueX + 1,y = dwValueY + 1 }
			table.insert(setChecker,t)
		end
	end
end
--更新可视列表(玩家，怪物等等),返回脱离九格的格子和新加入九格的格子
function CCheckerManager:UpdateCanSee(map,setEntity,dwValueOldX,dwValueOldY,dwValueX,dwValueY)
	local setOldChecker = {}
	local setNewChecker = {}
	--上移动
	if dwValueX < dwValueOldX then
		--上移动
		if dwValueY == dwValueOldY then
			Bottom(map,setOldChecker,dwValueOldX,dwValueOldY)
			Top(map,setNewChecker,dwValueX,dwValueY)
		--右上移动
		elseif dwValueY > dwValueOldY then
			BottomLeft(map,setOldChecker,dwValueOldX,dwValueOldY)
			TopRight(map,setNewChecker,dwValueX,dwValueY)
		--左上移动
		elseif dwValueY < dwValueOldY then
			BottomRight(map,setOldChecker,dwValueOldX,dwValueOldY)
			TopLeft(map,setNewChecker,dwValueX,dwValueY)
		end
	--下移动
	elseif dwValueX > dwValueOldX then
		--下移动
		if dwValueY == dwValueOldY then
			Top(map,setOldChecker,dwValueOldX,dwValueOldY)
			Bottom(map,setNewChecker,dwValueX,dwValueY)
		--右下移动
		elseif dwValueY > dwValueOldY then
			TopLeft(map,setOldChecker,dwValueOldX,dwValueOldY)
			BottomRight(map,setNewChecker,dwValueX,dwValueY)
		--左下移动
		elseif dwValueY < dwValueOldY then
			TopRight(map,setOldChecker,dwValueOldX,dwValueOldY)
			BottomLeft(map,setNewChecker,dwValueX,dwValueY)
		end
	--平移
	elseif dwValueX == dwValueOldX then
		--左移动
		if dwValueY < dwValueOldY then
			Right(map,setOldChecker,dwValueOldX,dwValueOldY)
			Left(map,setNewChecker,dwValueX,dwValueY)
		--右移动
		elseif dwValueY > dwValueOldY then
			Left(map,setOldChecker,dwValueOldX,dwValueOldY)
			Right(map,setNewChecker,dwValueX,dwValueY)
		end
	end
	--删掉不是可视范围里的格子
	for k,v in pairs (setOldChecker) do
		setEntity[v.x*10+v.y] = nil
	end
	--添加新进入视野的格子
	for k,v in pairs (setNewChecker) do
		local t = {x = v.x,y = v.y}
		setEntity[v.x*10+v.y] = t
	end
	return setOldChecker,setNewChecker
end