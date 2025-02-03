local BasicResInfo = {
[0]={	n_NeedLevel = 0,	n_Money =	0	,	n_Gold = 	0	,	n_Wood = 	0	,	n_Water = 	0	,	n_Fire =	0	,	n_Soil =	0},
[1]={	n_NeedLevel = 100,	n_Money =	4	,	n_Gold = 	5	,	n_Wood = 	5	,	n_Water = 	5	,	n_Fire =	5	,	n_Soil =	5},
[2]={	n_NeedLevel = 3,	n_Money =	6	,	n_Gold = 	7	,	n_Wood = 	7	,	n_Water = 	7	,	n_Fire =	7	,	n_Soil =	7},
[3]={	n_NeedLevel = 4,	n_Money =	11	,	n_Gold = 	10	,	n_Wood = 	10	,	n_Water = 	10	,	n_Fire =	10	,	n_Soil =	10},
[4]={	n_NeedLevel = 5,	n_Money =	19	,	n_Gold = 	14	,	n_Wood = 	14	,	n_Water = 	14	,	n_Fire =	14	,	n_Soil =	14},
[5]={	n_NeedLevel = 6,	n_Money =	32	,	n_Gold = 	19	,	n_Wood = 	19	,	n_Water = 	19	,	n_Fire =	19	,	n_Soil =	19},
[6]={	n_NeedLevel = 7,	n_Money =	51	,	n_Gold = 	25	,	n_Wood = 	25	,	n_Water = 	25	,	n_Fire =	25	,	n_Soil =	25},
[7]={	n_NeedLevel = 8,	n_Money =	77	,	n_Gold = 	32	,	n_Wood = 	32	,	n_Water = 	32	,	n_Fire =	32	,	n_Soil =	32},
[8]={	n_NeedLevel = 9,	n_Money =	112	,	n_Gold = 	40	,	n_Wood = 	40	,	n_Water = 	40	,	n_Fire =	40	,	n_Soil =	40},
[9]={	n_NeedLevel = 10,	n_Money =	156	,	n_Gold = 	49	,	n_Wood = 	49	,	n_Water = 	49	,	n_Fire =	49	,	n_Soil =	49},
[10]={	n_NeedLevel = 11,	n_Money =	211	,	n_Gold = 	59	,	n_Wood = 	60	,	n_Water = 	60	,	n_Fire =	60	,	n_Soil =	60},
[11]={	n_NeedLevel = 12,	n_Money =	278	,	n_Gold = 	70	,	n_Wood = 	71	,	n_Water = 	71	,	n_Fire =	71	,	n_Soil =	71},
[12]={	n_NeedLevel = 13,	n_Money =	359	,	n_Gold = 	82	,	n_Wood = 	83	,	n_Water = 	83	,	n_Fire =	83	,	n_Soil =	83},
[13]={	n_NeedLevel = 14,	n_Money =	455	,	n_Gold = 	95	,	n_Wood = 	96	,	n_Water = 	96	,	n_Fire =	96	,	n_Soil =	96},
[14]={	n_NeedLevel = 15,	n_Money =	567	,	n_Gold = 	109	,	n_Wood = 	110	,	n_Water = 	110	,	n_Fire =	110	,	n_Soil =	110},
[15]={	n_NeedLevel = 16,	n_Money =	697	,	n_Gold = 	124	,	n_Wood = 	125	,	n_Water = 	125	,	n_Fire =	125	,	n_Soil =	125},
[16]={	n_NeedLevel = 17,	n_Money =	847	,	n_Gold = 	140	,	n_Wood = 	141	,	n_Water = 	141	,	n_Fire =	141	,	n_Soil =	141},
[17]={	n_NeedLevel = 18,	n_Money =	1018	,	n_Gold = 	157	,	n_Wood = 	158	,	n_Water = 	158	,	n_Fire =	158	,	n_Soil =	158},
[18]={	n_NeedLevel = 19,	n_Money =	1212	,	n_Gold = 	175	,	n_Wood = 	176	,	n_Water = 	176	,	n_Fire =	176	,	n_Soil =	176},
[19]={	n_NeedLevel = 20,	n_Money =	1430	,	n_Gold = 	194	,	n_Wood = 	195	,	n_Water = 	195	,	n_Fire =	195	,	n_Soil =	195},
[20]={	n_NeedLevel = 21,	n_Money =	1674	,	n_Gold = 	214	,	n_Wood = 	216	,	n_Water = 	216	,	n_Fire =	216	,	n_Soil =	216},
[21]={	n_NeedLevel = 22,	n_Money =	1947	,	n_Gold = 	235	,	n_Wood = 	237	,	n_Water = 	237	,	n_Fire =	237	,	n_Soil =	237},
[22]={	n_NeedLevel = 23,	n_Money =	2250	,	n_Gold = 	257	,	n_Wood = 	259	,	n_Water = 	259	,	n_Fire =	259	,	n_Soil =	259},
[23]={	n_NeedLevel = 24,	n_Money =	2584	,	n_Gold = 	280	,	n_Wood = 	282	,	n_Water = 	282	,	n_Fire =	282	,	n_Soil =	282},
[24]={	n_NeedLevel = 25,	n_Money =	2952	,	n_Gold = 	304	,	n_Wood = 	306	,	n_Water = 	306	,	n_Fire =	306	,	n_Soil =	306},
[25]={	n_NeedLevel = 26,	n_Money =	3356	,	n_Gold = 	329	,	n_Wood = 	331	,	n_Water = 	331	,	n_Fire =	331	,	n_Soil =	331},
[26]={	n_NeedLevel = 27,	n_Money =	3799	,	n_Gold = 	355	,	n_Wood = 	357	,	n_Water = 	357	,	n_Fire =	357	,	n_Soil =	357},
[27]={	n_NeedLevel = 28,	n_Money =	4282	,	n_Gold = 	382	,	n_Wood = 	384	,	n_Water = 	384	,	n_Fire =	384	,	n_Soil =	384},
[28]={	n_NeedLevel = 29,	n_Money =	4808	,	n_Gold = 	410	,	n_Wood = 	412	,	n_Water = 	412	,	n_Fire =	412	,	n_Soil =	412},
[29]={	n_NeedLevel = 30,	n_Money =	5379	,	n_Gold = 	439	,	n_Wood = 	441	,	n_Water = 	441	,	n_Fire =	441	,	n_Soil =	441},
[30]={	n_NeedLevel = 31,	n_Money =	5998	,	n_Gold = 	469	,	n_Wood = 	472	,	n_Water = 	472	,	n_Fire =	472	,	n_Soil =	472},
[31]={	n_NeedLevel = 32,	n_Money =	6667	,	n_Gold = 	500	,	n_Wood = 	503	,	n_Water = 	503	,	n_Fire =	503	,	n_Soil =	503},
[32]={	n_NeedLevel = 33,	n_Money =	7389	,	n_Gold = 	532	,	n_Wood = 	535	,	n_Water = 	535	,	n_Fire =	535	,	n_Soil =	535},
[33]={	n_NeedLevel = 34,	n_Money =	8167	,	n_Gold = 	565	,	n_Wood = 	568	,	n_Water = 	568	,	n_Fire =	568	,	n_Soil =	568},
[34]={	n_NeedLevel = 35,	n_Money =	9004	,	n_Gold = 	599	,	n_Wood = 	602	,	n_Water = 	602	,	n_Fire =	602	,	n_Soil =	602},
[35]={	n_NeedLevel = 36,	n_Money =	9902	,	n_Gold = 	634	,	n_Wood = 	637	,	n_Water = 	637	,	n_Fire =	637	,	n_Soil =	637},
[36]={	n_NeedLevel = 37,	n_Money =	10865	,	n_Gold = 	670	,	n_Wood = 	673	,	n_Water = 	673	,	n_Fire =	673	,	n_Soil =	673},
[37]={	n_NeedLevel = 38,	n_Money =	11896	,	n_Gold = 	707	,	n_Wood = 	710	,	n_Water = 	710	,	n_Fire =	710	,	n_Soil =	710},
[38]={	n_NeedLevel = 39,	n_Money =	12999	,	n_Gold = 	745	,	n_Wood = 	748	,	n_Water = 	748	,	n_Fire =	748	,	n_Soil =	748},
[39]={	n_NeedLevel = 40,	n_Money =	14177	,	n_Gold = 	784	,	n_Wood = 	787	,	n_Water = 	787	,	n_Fire =	787	,	n_Soil =	787},
[40]={	n_NeedLevel = 41,	n_Money =	15434	,	n_Gold = 	824	,	n_Wood = 	828	,	n_Water = 	828	,	n_Fire =	828	,	n_Soil =	828},
[41]={	n_NeedLevel = 42,	n_Money =	16774	,	n_Gold = 	865	,	n_Wood = 	869	,	n_Water = 	869	,	n_Fire =	869	,	n_Soil =	869},
[42]={	n_NeedLevel = 43,	n_Money =	18201	,	n_Gold = 	907	,	n_Wood = 	911	,	n_Water = 	911	,	n_Fire =	911	,	n_Soil =	911},
[43]={	n_NeedLevel = 44,	n_Money =	19719	,	n_Gold = 	950	,	n_Wood = 	954	,	n_Water = 	954	,	n_Fire =	954	,	n_Soil =	954},
[44]={	n_NeedLevel = 45,	n_Money =	21332	,	n_Gold = 	994	,	n_Wood = 	998	,	n_Water = 	998	,	n_Fire =	998	,	n_Soil =	998},
[45]={	n_NeedLevel = 46,	n_Money =	23045	,	n_Gold = 	1039	,	n_Wood = 	1043	,	n_Water = 	1043	,	n_Fire =	1043	,	n_Soil =	1043},
[46]={	n_NeedLevel = 47,	n_Money =	24863	,	n_Gold = 	1085	,	n_Wood = 	1089	,	n_Water = 	1089	,	n_Fire =	1089	,	n_Soil =	1089},
[47]={	n_NeedLevel = 48,	n_Money =	26791	,	n_Gold = 	1132	,	n_Wood = 	1136	,	n_Water = 	1136	,	n_Fire =	1136	,	n_Soil =	1136},
[48]={	n_NeedLevel = 49,	n_Money =	28835	,	n_Gold = 	1180	,	n_Wood = 	1184	,	n_Water = 	1184	,	n_Fire =	1184	,	n_Soil =	1184},
[49]={	n_NeedLevel = 50,	n_Money =	31000	,	n_Gold = 	1229	,	n_Wood = 	1233	,	n_Water = 	1233	,	n_Fire =	1233	,	n_Soil =	1233},
[50]={	n_NeedLevel = 51,	n_Money =	33292	,	n_Gold = 	1279	,	n_Wood = 	1284	,	n_Water = 	1284	,	n_Fire =	1284	,	n_Soil =	1284},
[51]={	n_NeedLevel = 52,	n_Money =	35717	,	n_Gold = 	1330	,	n_Wood = 	1335	,	n_Water = 	1335	,	n_Fire =	1335	,	n_Soil =	1335},
[52]={	n_NeedLevel = 53,	n_Money =	38281	,	n_Gold = 	1382	,	n_Wood = 	1387	,	n_Water = 	1387	,	n_Fire =	1387	,	n_Soil =	1387},
[53]={	n_NeedLevel = 54,	n_Money =	40991	,	n_Gold = 	1435	,	n_Wood = 	1440	,	n_Water = 	1440	,	n_Fire =	1440	,	n_Soil =	1440},
[54]={	n_NeedLevel = 55,	n_Money =	43855	,	n_Gold = 	1489	,	n_Wood = 	1494	,	n_Water = 	1494	,	n_Fire =	1494	,	n_Soil =	1494},
[55]={	n_NeedLevel = 56,	n_Money =	46880	,	n_Gold = 	1544	,	n_Wood = 	1549	,	n_Water = 	1549	,	n_Fire =	1549	,	n_Soil =	1549},
[56]={	n_NeedLevel = 57,	n_Money =	50074	,	n_Gold = 	1600	,	n_Wood = 	1605	,	n_Water = 	1605	,	n_Fire =	1605	,	n_Soil =	1605},
[57]={	n_NeedLevel = 58,	n_Money =	53446	,	n_Gold = 	1657	,	n_Wood = 	1662	,	n_Water = 	1662	,	n_Fire =	1662	,	n_Soil =	1662},
[58]={	n_NeedLevel = 59,	n_Money =	57004	,	n_Gold = 	1715	,	n_Wood = 	1720	,	n_Water = 	1720	,	n_Fire =	1720	,	n_Soil =	1720},
[59]={	n_NeedLevel = 60,	n_Money =	60758	,	n_Gold = 	1774	,	n_Wood = 	1779	,	n_Water = 	1779	,	n_Fire =	1779	,	n_Soil =	1779},
[60]={	n_NeedLevel = 61,	n_Money =	64718	,	n_Gold = 	1834	,	n_Wood = 	1840	,	n_Water = 	1840	,	n_Fire =	1840	,	n_Soil =	1840},
[61]={	n_NeedLevel = 62,	n_Money =	68895	,	n_Gold = 	1895	,	n_Wood = 	1901	,	n_Water = 	1901	,	n_Fire =	1901	,	n_Soil =	1901},
[62]={	n_NeedLevel = 63,	n_Money =	73300	,	n_Gold = 	1957	,	n_Wood = 	1963	,	n_Water = 	1963	,	n_Fire =	1963	,	n_Soil =	1963},
[63]={	n_NeedLevel = 64,	n_Money =	77945	,	n_Gold = 	2020	,	n_Wood = 	2026	,	n_Water = 	2026	,	n_Fire =	2026	,	n_Soil =	2026},
[64]={	n_NeedLevel = 65,	n_Money =	82842	,	n_Gold = 	2084	,	n_Wood = 	2090	,	n_Water = 	2090	,	n_Fire =	2090	,	n_Soil =	2090},
[65]={	n_NeedLevel = 66,	n_Money =	88006	,	n_Gold = 	2149	,	n_Wood = 	2155	,	n_Water = 	2155	,	n_Fire =	2155	,	n_Soil =	2155},
[66]={	n_NeedLevel = 67,	n_Money =	93451	,	n_Gold = 	2215	,	n_Wood = 	2221	,	n_Water = 	2221	,	n_Fire =	2221	,	n_Soil =	2221},
[67]={	n_NeedLevel = 68,	n_Money =	99193	,	n_Gold = 	2282	,	n_Wood = 	2288	,	n_Water = 	2288	,	n_Fire =	2288	,	n_Soil =	2288},
[68]={	n_NeedLevel = 69,	n_Money =	105248	,	n_Gold = 	2350	,	n_Wood = 	2356	,	n_Water = 	2356	,	n_Fire =	2356	,	n_Soil =	2356},
[69]={	n_NeedLevel = 70,	n_Money =	111635	,	n_Gold = 	2419	,	n_Wood = 	2425	,	n_Water = 	2425	,	n_Fire =	2425	,	n_Soil =	2425},
[70]={	n_NeedLevel = 71,	n_Money =	118373	,	n_Gold = 	2489	,	n_Wood = 	2496	,	n_Water = 	2496	,	n_Fire =	2496	,	n_Soil =	2496},
[71]={	n_NeedLevel = 72,	n_Money =	125482	,	n_Gold = 	2560	,	n_Wood = 	2567	,	n_Water = 	2567	,	n_Fire =	2567	,	n_Soil =	2567},
[72]={	n_NeedLevel = 73,	n_Money =	132985	,	n_Gold = 	2632	,	n_Wood = 	2639	,	n_Water = 	2639	,	n_Fire =	2639	,	n_Soil =	2639},
[73]={	n_NeedLevel = 74,	n_Money =	140906	,	n_Gold = 	2705	,	n_Wood = 	2712	,	n_Water = 	2712	,	n_Fire =	2712	,	n_Soil =	2712},
[74]={	n_NeedLevel = 75,	n_Money =	149272	,	n_Gold = 	2779	,	n_Wood = 	2786	,	n_Water = 	2786	,	n_Fire =	2786	,	n_Soil =	2786},
[75]={	n_NeedLevel = 76,	n_Money =	158111	,	n_Gold = 	2854	,	n_Wood = 	2861	,	n_Water = 	2861	,	n_Fire =	2861	,	n_Soil =	2861},
[76]={	n_NeedLevel = 77,	n_Money =	167455	,	n_Gold = 	2930	,	n_Wood = 	2937	,	n_Water = 	2937	,	n_Fire =	2937	,	n_Soil =	2937},
[77]={	n_NeedLevel = 78,	n_Money =	177337	,	n_Gold = 	3007	,	n_Wood = 	3014	,	n_Water = 	3014	,	n_Fire =	3014	,	n_Soil =	3014},
[78]={	n_NeedLevel = 79,	n_Money =	187794	,	n_Gold = 	3085	,	n_Wood = 	3092	,	n_Water = 	3092	,	n_Fire =	3092	,	n_Soil =	3092},
[79]={	n_NeedLevel = 80,	n_Money =	198867	,	n_Gold = 	3164	,	n_Wood = 	3171	,	n_Water = 	3171	,	n_Fire =	3171	,	n_Soil =	3171},
[80]={	n_NeedLevel = 81,	n_Money =	210600	,	n_Gold = 	3244	,	n_Wood = 	3252	,	n_Water = 	3252	,	n_Fire =	3252	,	n_Soil =	3252},
[81]={	n_NeedLevel = 82,	n_Money =	223043	,	n_Gold = 	3325	,	n_Wood = 	3333	,	n_Water = 	3333	,	n_Fire =	3333	,	n_Soil =	3333},
[82]={	n_NeedLevel = 83,	n_Money =	236251	,	n_Gold = 	3407	,	n_Wood = 	3415	,	n_Water = 	3415	,	n_Fire =	3415	,	n_Soil =	3415},
[83]={	n_NeedLevel = 84,	n_Money =	250284	,	n_Gold = 	3490	,	n_Wood = 	3498	,	n_Water = 	3498	,	n_Fire =	3498	,	n_Soil =	3498},
[84]={	n_NeedLevel = 85,	n_Money =	265210	,	n_Gold = 	3574	,	n_Wood = 	3582	,	n_Water = 	3582	,	n_Fire =	3582	,	n_Soil =	3582},
[85]={	n_NeedLevel = 86,	n_Money =	281105	,	n_Gold = 	3659	,	n_Wood = 	3667	,	n_Water = 	3667	,	n_Fire =	3667	,	n_Soil =	3667},
[86]={	n_NeedLevel = 87,	n_Money =	298054	,	n_Gold = 	3745	,	n_Wood = 	3753	,	n_Water = 	3753	,	n_Fire =	3753	,	n_Soil =	3753},
[87]={	n_NeedLevel = 88,	n_Money =	316154	,	n_Gold = 	3832	,	n_Wood = 	3840	,	n_Water = 	3840	,	n_Fire =	3840	,	n_Soil =	3840},
[88]={	n_NeedLevel = 89,	n_Money =	335514	,	n_Gold = 	3920	,	n_Wood = 	3928	,	n_Water = 	3928	,	n_Fire =	3928	,	n_Soil =	3928},
[89]={	n_NeedLevel = 90,	n_Money =	356259	,	n_Gold = 	4009	,	n_Wood = 	4017	,	n_Water = 	4017	,	n_Fire =	4017	,	n_Soil =	4017},
[90]={	n_NeedLevel = 91,	n_Money =	378534	,	n_Gold = 	4099	,	n_Wood = 	4108	,	n_Water = 	4108	,	n_Fire =	4108	,	n_Soil =	4108},
[91]={	n_NeedLevel = 92,	n_Money =	402505	,	n_Gold = 	4190	,	n_Wood = 	4199	,	n_Water = 	4199	,	n_Fire =	4199	,	n_Soil =	4199},
[92]={	n_NeedLevel = 93,	n_Money =	428367	,	n_Gold = 	4282	,	n_Wood = 	4291	,	n_Water = 	4291	,	n_Fire =	4291	,	n_Soil =	4291},
[93]={	n_NeedLevel = 94,	n_Money =	456349	,	n_Gold = 	4375	,	n_Wood = 	4384	,	n_Water = 	4384	,	n_Fire =	4384	,	n_Soil =	4384},
[94]={	n_NeedLevel = 95,	n_Money =	486723	,	n_Gold = 	4469	,	n_Wood = 	4478	,	n_Water = 	4478	,	n_Fire =	4478	,	n_Soil =	4478},
[95]={	n_NeedLevel = 96,	n_Money =	519815	,	n_Gold = 	4564	,	n_Wood = 	4573	,	n_Water = 	4573	,	n_Fire =	4573	,	n_Soil =	4573},
[96]={	n_NeedLevel = 97,	n_Money =	556021	,	n_Gold = 	4660	,	n_Wood = 	4669	,	n_Water = 	4669	,	n_Fire =	4669	,	n_Soil =	4669},
[97]={	n_NeedLevel = 98,	n_Money =	595828	,	n_Gold = 	4757	,	n_Wood = 	4766	,	n_Water = 	4766	,	n_Fire =	4766	,	n_Soil =	4766},
[98]={	n_NeedLevel = 99,	n_Money =	639846	,	n_Gold = 	4855	,	n_Wood = 	4864	,	n_Water = 	4864	,	n_Fire =	4864	,	n_Soil =	4864},
[99]={	n_NeedLevel = 100,	n_Money =	688851	,	n_Gold = 	4954	,	n_Wood = 	4963	,	n_Water = 	4963	,	n_Fire =	4963	,	n_Soil =	4963},
[100]={	n_NeedLevel = 0,	n_Money =	0	,	n_Gold = 	0	,	n_Wood = 	0	,	n_Water = 	0	,	n_Fire =	0	,	n_Soil =	0},
};

local function CopyTable(from, to)
	for n,v in pairs(from)do
		to[n] = v;
	end
end;


local skill = _G.MountSkill[1];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;

local skill = _G.MountSkill[2];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;

local skill = _G.MountSkill[3];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;

local skill = _G.MountSkill[4];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;

local skill = _G.MountSkill[5];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;

local skill = _G.MountSkill[6];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;

local skill = _G.MountSkill[7];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;

local skill = _G.MountSkill[8];
function skill:GetUpLevelCondition(n_SkillLevel)
	local sResInfo = {};
	--资源消耗
	CopyTable(BasicResInfo[n_SkillLevel], sResInfo);
	if n_SkillLevel > 0 and n_SkillLevel < 100 then
		--提升成功率
		sResInfo.n_SuccessRate = math.ceil(10000 - n_SkillLevel * 100);
		--需要资质果个数
		sResInfo.n_NeedZZGNum = math.ceil(n_SkillLevel/5);
	else
		sResInfo.n_SuccessRate = 0;
		sResInfo.n_NeedZZGNum = 0;
	end;
	
	return sResInfo;
end;
