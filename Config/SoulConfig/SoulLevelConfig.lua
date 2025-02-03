--战魂升级配置

--绿色经验系数
local SoulLevelByWhite = 
{
	[ 1 ] = 258,
	[ 2 ] = 516,
	[ 3 ] = 1032,
	[ 4 ] = 2064,
	[ 5 ] = 4128,
	[ 6 ] = 8256,
	[ 7 ] = 16512,
	[ 8 ] = 33024,
	[ 9 ] = 66048,
	[ 10 ] = 66048,
}
--蓝色经验系数
local SoulLevelByGreen = 
{
	[ 1 ] = 516,
	[ 2 ] = 1032,
	[ 3 ] = 2064,
	[ 4 ] = 4128,
	[ 5 ] = 8256,
	[ 6 ] = 16512,
	[ 7 ] = 33024,
	[ 8 ] = 66048,
	[ 9 ] = 132096,
	[ 10 ] = 132096,
}
--紫色经验系数
local SoulLevelByBlue = 
{
	[ 1 ] = 1290,
	[ 2 ] = 2580,
	[ 3 ] = 5160,
	[ 4 ] = 10320,
	[ 5 ] = 20640,
	[ 6 ] = 41280,
	[ 7 ] = 82560,
	[ 8 ] = 165120,
	[ 9 ] = 330240,
	[ 10 ] = 330240,
}
--金色经验系数
local SoulLevelByPurple = 
{
	[ 1 ] = 3354,
	[ 2 ] = 6708,
	[ 3 ] = 13416,
	[ 4 ] = 26832,
	[ 5 ] = 53664,
	[ 6 ] = 107328,
	[ 7 ] = 214656,
	[ 8 ] = 429312,
	[ 9 ] = 858624,
	[ 10 ] = 858624,
}
--红色经验系数
local SoulLevelByGold = 
{
	[ 1 ] = 10062,
	[ 2 ] = 20124,
	[ 3 ] = 40248,
	[ 4 ] = 80496,
	[ 5 ] = 160992,
	[ 6 ] = 321984,
	[ 7 ] = 643968,
	[ 8 ] = 1287936,
	[ 9 ] = 2575872,
	[ 10 ] = 2575872,
}

_G.SoulUpLevelConfig = 
{
	[SoulQuality.White] = SoulLevelByWhite;
	[SoulQuality.Green] = SoulLevelByGreen;
	[SoulQuality.Blue] = SoulLevelByBlue;
	[SoulQuality.Purple] = SoulLevelByPurple;
	[SoulQuality.Gold] = SoulLevelByGold;
	
	dwMaxLevel = 10,
}

--计算战魂的等级
--参数 dwEnumID--战魂类型;dwExp--经验总值
--返回 战魂等级，剩余经验
function SoulUpLevelConfig:CountSoulLevel(dwEnumID,dwExp)
	local cfg = SoulObject[dwEnumID];
	if not cfg then
		return 1,dwExp;
	end
	
	local dwLevel = 1;
	local dwLastExp = dwExp;
	
	local tbExp = self[cfg.dwQuality];
	if not tbExp then
		return dwLevel,dwLastExp;
	end
	
	for i = 1,self.dwMaxLevel do
		local dwCur = self.dwMaxLevel + 1 - i;
		if dwExp >= tbExp[dwCur] then
			dwLevel = dwCur + 1;
			dwLastExp = dwExp - tbExp[dwCur];
			break;
		end
	end
	
	if dwLevel > self.dwMaxLevel then
		dwLevel = self.dwMaxLevel
	end
	
	return dwLevel,dwLastExp;
end;

function SoulUpLevelConfig:GetMaxExp(dwEnumID)
	local cfg = SoulObject[dwEnumID];
	local tbExp = self[cfg.dwQuality];
	if not tbExp then
		return 1;
	end
	
	return tbExp[self.dwMaxLevel];
end;

