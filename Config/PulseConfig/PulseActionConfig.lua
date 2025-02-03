_G.PulseActionConfig = 
{
	[1] = function (pulseSystem) pulseSystem.dwExpTimes = 2 end, --双倍经验
	[2] = function (pulseSystem) pulseSystem.dwRate = 1 end,	--百分百成功
	[3] = function (pulseSystem) pulseSystem.dwZhenqiReturn = 0.7 end, --返还30%
	[4] = function (pulseSystem) pulseSystem.dwZhenqiReturn = 0.4 end,	--返还60%
	[5] = function (pulseSystem) pulseSystem.dwZhenqiReturn = 0.2 end,	--返还80%
}



_G.PulseProName2Index = 
{
	dwPulse1 = 1;
	dwPulse2 = 2;
	dwPulse3 = 3;
	dwPulse4 = 4;
	dwPulse5 = 5;
	dwPulse6 = 6;
	dwPulse7 = 7;
	dwPulse8 = 8;
	dwPulseFullNum = 9;
	
	dwTotalExp = 10;
	dwLastTimes = 11;
	dwWuValue = 12;
	dwWuType = 13;
	AttributeList = 14;

	dwPulseEx1 = 15;
	dwPulseEx2 = 16;
	dwPulseEx3 = 17;
	dwPulseEx4 = 18;
	dwFightPoint = 19;
	
	dwPulseDragon = 20;
	dwPulseFullNumOld = 21;
}

_G.PulseProIndex2Name = {};
for n,v in pairs(PulseProName2Index)do
	PulseProIndex2Name[v] = n;
end
