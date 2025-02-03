
--跨服战脚本
local cross = CrossSvrConfig[10001]; 
cross.tulongdao = nil;
cross.dwStartTime = 0;
local playertime = 0;
local playercz = false;
local nowtime = _now();
local losttime = 0;
cross.isNeedCreateMonster = true;
local shuaboss1=0;
local shuaboss2=0;
local shuaboss3=0;
local shuaboss4=0;
local shuaboss5=0;
local lasttime=0;
local shuabaoxiang1=0;
local shuabaoxiang2=0;
local shuabaoxiang3=0;
local shuabaoxiang4=0;
local shuabaoxiang5=0;
---------------------------刷怪时间

_G.CrossSvrScript= {
	tbTime = {
		[1] = 1000*60*10;		--屠龙刀刷新的时间
		[2] = 1000*60*2;		--第一波刷新的时间
		[3] = 1000*60*17;	 	--第二波刷新的时间  
		[4] = 1000*60*27;		--第三波刷新的时间
		[5]	= 1000*60*37;		--第四波刷新的时间
		[6] = 1000*60*47;		--第五波刷新的时间
		[7] = 1000*60*5;        --第一波宝箱刷新时间
		[8] = 1000*60*20;        --第二波宝箱刷新时间
		[9] = 1000*60*30;        --第三波宝箱刷新时间
		[10] = 1000*60*40;       --第四波宝箱刷新时间
		[11] = 1000*60*50;       --第五波宝箱刷新时间
	};
};
local  tbTime = CrossSvrScript.tbTime
--------------------------要刷的怪物
local MonsterInfo = {
			--（14 89     33 104    48 89    19 66）     （73  -41      60 -31     85  -21    104 -44     ）  （43 -93     31 -115  17 -93     2 -117）
			--（-79  -75        -114 -66    -106 -44   -74 -49） （-103 45   -100 77   -71 46  -83 91）
		--第一波要刷的怪物
	[1] = {9999,12001,12001,12001,51760001,100320020,31,-115};
	[2] = {9999,12002,12002,12002,51760001,100310030,73,-41};
	[3] = {9999,12005,12005,12005,51760002,100920111,31,84};    --王重阳
	[4] = {9999,12004,12004,12004,51760001,101020120,-106,-44};
	[5] = {9999,12003,12003,12003,51760001,100210370,-87,98};
		--第二波要刷的怪物
	[6] = {9999,12006,12006,12006,51760001,101120090,14,89};
	[7]	= {9999,12010,12010,12010,51760002,101020180,71,-24};       --风清扬2
	[8]	= {9999,12008,12008,12008,51760001,100320030,43,-93};
	[9]	= {9999,12009,12009,12009,51760001,100420030,-79,-75};
	[10] = {9999,12007,12007,12007,51760001,100210111,-103,45};   
		--第三波要刷的怪物
	[11] = {9999,12011,12011,12011,51760001,100210031,34,95};   -------
	[12] = {9999,12012,12012,12012,51760001,100210041,60,-31};
	[13] = {9999,12015,12015,12015,51760002,100210051,46,-118};     --养蜂3  
	[14] = {9999,12014,12014,12014,51760001,100210081,-114,-66};
	[15] = {9999,12013,12013,12013,51760001,100210010,-108,92}; 
		--第四波要刷的怪物
	[16] = {9999,12016,12016,12016,51760001,100820050,52,86};
	[17] = {9999,12017,12017,12017,51760001,100320050,85,-21};
	[18] = {9999,12018,12018,12018,51760001,100920040,17,-93};
	[19] = {9999,12020,12020,12020,51760002,100820070,-89,56};     --丘处机
	[20] = {9999,12019,12019,12019,51760001,100820010,-71,46};   --丐帮弟子
		--第五波要刷的怪物
	[21] = {9999,12021,12021,12021,51760001,100920020,19,66};
	[22] = {9999,12022,12022,12022,51760001,100920090,98,-46};     --meishuachulai .
	[23] = {9999,12023,12023,12023,51760001,100920080,2,-117};
	[24] = {9999,12024,12024,12024,51760001,100320060,-74,-49};
	[25] = {9999,12025,12025,12025,51760002,101120140,-95,-58};     --无色禅师  -------------------------------------------
		--屠龙刀
	[26] = {9999,99991101,-4,-21,5.5};
		---------宝箱

		--第一波宝箱
	[27] = {9999,12026,12026,12026,51760003,11220,-39,75};
	[28] = {9999,12026,12026,12026,51760003,11220,-17,68};
	[29] = {9999,12026,12026,12026,51760003,11220,82,-55};
	[30] = {9999,12026,12026,12026,51760003,11220,99,-61};
	[31] = {9999,12026,12026,12026,51760003,11220,39,-119};
	[32] = {9999,12026,12026,12026,51760003,11220,46,-102};
	[33] = {9999,12026,12026,12026,51760003,11220,-72,-76};
	[34] = {9999,12026,12026,12026,51760003,11220,-70,-58};
	[35] = {9999,12026,12026,12026,51760003,11220,-96,45};
	[36] = {9999,12026,12026,12026,51760003,11220,-68,44};
		--第二波宝箱
	[37] = {9999,12026,12026,12026,51760003,11220,20,69};
	[38] = {9999,12026,12026,12026,51760003,11220,53,95};
	[39] = {9999,12026,12026,12026,51760003,11220,94,-38};
	[40] = {9999,12026,12026,12026,51760003,11220,78,-35};
	[41] = {9999,12026,12026,12026,51760003,11220,29,-90};
	[42] = {9999,12026,12026,12026,51760003,11220,14,-94};
	[43] = {9999,12026,12026,12026,51760003,11220,-87,-42};
	[44] = {9999,12026,12026,12026,51760003,11220,-96,-50};
	[45] = {9999,12026,12026,12026,51760003,11220,-76,56};
	[46] = {9999,12026,12026,12026,51760003,11220,-90,69};
		--第三波宝箱
	[47] = {9999,12026,12026,12026,51760003,11220,41,87};
	[48] = {9999,12026,12026,12026,51760003,11220,45,75};
	[49] = {9999,12026,12026,12026,51760003,11220,63,-40};
	[50] = {9999,12026,12026,12026,51760003,11220,60,-33};
	[51] = {9999,12026,12026,12026,51760003,11220,8,-112};
	[52] = {9999,12026,12026,12026,51760003,11220,-13,-124};
	[53] = {9999,12026,12026,12026,51760003,11220,-102,-58};
	[54] = {9999,12026,12026,12026,51760003,11220,-111,-68};
	[55] = {9999,12026,12026,12026,51760003,11220,-104,61};
	[56] = {9999,12026,12026,12026,51760003,11220,-102,89};

		--第四波宝箱
	[57] = {9999,12026,12026,12026,51760003,11220,19,93};
	[58] = {9999,12026,12026,12026,51760003,11220,31,35};
	[59] = {9999,12026,12026,12026,51760003,11220,76,-11};
	[60] = {9999,12026,12026,12026,51760003,11220,76,7};
	[61] = {9999,12026,12026,12026,51760003,11220,-128,-39};
	[62] = {9999,12026,12026,12026,51760003,11220,-2,63};
	[63] = {9999,12026,12026,12026,51760003,11220,-26,52};
	[64] = {9999,12026,12026,12026,51760003,11220,-124,-54};
	[65] = {9999,12026,12026,12026,51760003,11220,-96,109};
	[66] = {9999,12026,12026,12026,51760003,11220,-30,83};
	  --第五波宝箱
	[67] = {9999,12026,12026,12026,51760003,11220,33,12};
	[68] = {9999,12026,12026,12026,51760003,11220,9,69};
	[69] = {9999,12026,12026,12026,51760003,11220,71,-101};
	[70] = {9999,12026,12026,12026,51760003,11220,56,-89};
	[71] = {9999,12026,12026,12026,51760003,11220,27,-109};
	[72] = {9999,12026,12026,12026,51760003,11220,-59,-87};
	[73] = {9999,12026,12026,12026,51760003,11220,-109,31};
	[74] = {9999,12026,12026,12026,51760003,11220,-81,49};
	[75] = {9999,12026,12026,12026,51760003,11220,-45,67};
	[76] = {9999,12026,12026,12026,51760003 ,11220,-114,39};
	
};


---------------------------
--检测是否允许角色进入，服务器部分
function cross:CheckEnterConditionForServer(objPlayer)

end;
--检测是否允许角色进入，客户端部分
function cross:CheckEnterConditionForClient()
	--判断是否有世家
	local dwGuildID = CGuildSystem:GetGuildID();
	
	if not dwGuildID or dwGuildID == 0 then
		CNoticeManager:Notice(NoticeTypeConfig.ErrorNotice,SysStringConfigInfo[6001010073]);
		return false;
	end
	return true;
end;


function cross:EventGameStart(objCross)
	print("cross:EventGameStart(objCross)")
	
	self.dwStartTime = _now()
	--设置战场脚本中Update的间隔时间
	objCross:SetUpdateTimeForCross(1000*60);
	
	--设置map脚本玩家Update的间隔时间
	objCross:SetUpdateTimeForPlayer(1000*60);
	
	--objCross:CreateNumber("num99990");
	
	--{npc_id=99991101,x=-4,y=-21,dir=5.5,show = 0};--屠龙刀
	
	self.dwStep = 1;
	
	
	
end;

function cross:UpdateForCross(objCross)
	print("cross:UpdateForCross(objCross)")

	nowtime = _now()
	if nowtime - self.dwStartTime >= tbTime[1]  then 
	--if (self.dwStep == 2) and (self.dwFirstPlayerTime) then
		--//刷新屠龙刀
		if  not self.tulongdao then
				--if nowtime - self.dwFirstPlayerTime > tbTime[1] then
					print("cross:UpdateForCross++++++++++++++create npc")
					self.tulongdao = CScriptManager:AddNpcToMap(MonsterInfo[26][1],MonsterInfo[26][2],MonsterInfo[26][3],MonsterInfo[26][4],MonsterInfo[26][5]);
		--end
		end
		
		--//刷怪物
	end
		
	if nowtime - self.dwStartTime > tbTime[2] and self.isNeedCreateMonster then	
		--if nowtime - self.dwFirstPlayerTime > tbTime[2] and self.isNeedCreateMonster and shuaboss1 == 0 then
      
						 						 
			CScriptManager:AddMonToMap(MonsterInfo[1][1],MonsterInfo[1][2],MonsterInfo[1][3],MonsterInfo[1][4],MonsterInfo[1][5],MonsterInfo[1][6],MonsterInfo[1][7],MonsterInfo[1][8]);
			CScriptManager:AddMonToMap(MonsterInfo[2][1],MonsterInfo[2][2],MonsterInfo[2][3],MonsterInfo[2][4],MonsterInfo[2][5],MonsterInfo[2][6],MonsterInfo[2][7],MonsterInfo[2][8]);
			CScriptManager:AddMonToMap(MonsterInfo[3][1],MonsterInfo[3][2],MonsterInfo[3][3],MonsterInfo[3][4],MonsterInfo[3][5],MonsterInfo[3][6],MonsterInfo[3][7],MonsterInfo[3][8]);
			CScriptManager:AddMonToMap(MonsterInfo[4][1],MonsterInfo[4][2],MonsterInfo[4][3],MonsterInfo[4][4],MonsterInfo[4][5],MonsterInfo[4][6],MonsterInfo[4][7],MonsterInfo[4][8]);
			CScriptManager:AddMonToMap(MonsterInfo[5][1],MonsterInfo[5][2],MonsterInfo[5][3],MonsterInfo[5][4],MonsterInfo[5][5],MonsterInfo[5][6],MonsterInfo[5][7],MonsterInfo[5][8]);
		
			print("cross:UpdateForCross++++++++++++++create monster");
	
			self.isNeedCreateMonster = false;
			lasttime = _now();
			shuaboss1 = 1;
	end
		--//刷新第二波怪物
		if (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[3])   and (shuaboss2 == 0) then
				CScriptManager:AddMonToMap(MonsterInfo[6][1],MonsterInfo[6][2],MonsterInfo[6][3],MonsterInfo[6][4],MonsterInfo[6][5],MonsterInfo[6][6],MonsterInfo[6][7],MonsterInfo[6][8]);
				CScriptManager:AddMonToMap(MonsterInfo[7][1],MonsterInfo[7][2],MonsterInfo[7][3],MonsterInfo[7][4],MonsterInfo[7][5],MonsterInfo[7][6],MonsterInfo[7][7],MonsterInfo[7][8]);
				CScriptManager:AddMonToMap(MonsterInfo[8][1],MonsterInfo[8][2],MonsterInfo[8][3],MonsterInfo[8][4],MonsterInfo[8][5],MonsterInfo[8][6],MonsterInfo[8][7],MonsterInfo[8][8]);
				CScriptManager:AddMonToMap(MonsterInfo[9][1],MonsterInfo[9][2],MonsterInfo[9][3],MonsterInfo[9][4],MonsterInfo[9][5],MonsterInfo[9][6],MonsterInfo[9][7],MonsterInfo[9][8]);
				CScriptManager:AddMonToMap(MonsterInfo[10][1],MonsterInfo[10][2],MonsterInfo[10][3],MonsterInfo[10][4],MonsterInfo[10][5],MonsterInfo[10][6],MonsterInfo[10][7],MonsterInfo[10][8]);
				shuaboss2=1;
				
			end
		end
		if  (not self.isNeedCreateMonster) then 
			--//刷新第三波怪物
			if (nowtime - self.dwStartTime > tbTime[4]) and (shuaboss3 == 0) then
				CScriptManager:AddMonToMap(MonsterInfo[11][1],MonsterInfo[11][2],MonsterInfo[11][3],MonsterInfo[11][4],MonsterInfo[11][5],MonsterInfo[11][6],MonsterInfo[11][7],MonsterInfo[11][8]);
				CScriptManager:AddMonToMap(MonsterInfo[12][1],MonsterInfo[12][2],MonsterInfo[12][3],MonsterInfo[12][4],MonsterInfo[12][5],MonsterInfo[12][6],MonsterInfo[12][7],MonsterInfo[12][8]);
				CScriptManager:AddMonToMap(MonsterInfo[13][1],MonsterInfo[13][2],MonsterInfo[13][3],MonsterInfo[13][4],MonsterInfo[13][5],MonsterInfo[13][6],MonsterInfo[13][7],MonsterInfo[13][8]);
				CScriptManager:AddMonToMap(MonsterInfo[14][1],MonsterInfo[14][2],MonsterInfo[14][3],MonsterInfo[14][4],MonsterInfo[14][5],MonsterInfo[14][6],MonsterInfo[14][7],MonsterInfo[14][8]);
				CScriptManager:AddMonToMap(MonsterInfo[15][1],MonsterInfo[15][2],MonsterInfo[15][3],MonsterInfo[15][4],MonsterInfo[15][5],MonsterInfo[15][6],MonsterInfo[15][7],MonsterInfo[15][8]);
				shuaboss3=1;
				
			end	
		end
			--//刷新第四波怪物
		if  (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[5])  and (shuaboss4 == 0) then
				CScriptManager:AddMonToMap(MonsterInfo[16][1],MonsterInfo[16][2],MonsterInfo[16][3],MonsterInfo[16][4],MonsterInfo[16][5],MonsterInfo[16][6],MonsterInfo[16][7],MonsterInfo[16][8]);
				CScriptManager:AddMonToMap(MonsterInfo[17][1],MonsterInfo[17][2],MonsterInfo[17][3],MonsterInfo[17][4],MonsterInfo[17][5],MonsterInfo[17][6],MonsterInfo[17][7],MonsterInfo[17][8]);
				CScriptManager:AddMonToMap(MonsterInfo[18][1],MonsterInfo[18][2],MonsterInfo[18][3],MonsterInfo[18][4],MonsterInfo[18][5],MonsterInfo[18][6],MonsterInfo[18][7],MonsterInfo[18][8]);
				CScriptManager:AddMonToMap(MonsterInfo[19][1],MonsterInfo[19][2],MonsterInfo[19][3],MonsterInfo[19][4],MonsterInfo[19][5],MonsterInfo[19][6],MonsterInfo[19][7],MonsterInfo[19][8]);
				CScriptManager:AddMonToMap(MonsterInfo[20][1],MonsterInfo[20][2],MonsterInfo[20][3],MonsterInfo[20][4],MonsterInfo[20][5],MonsterInfo[20][6],MonsterInfo[20][7],MonsterInfo[20][8]);
				shuaboss4=1;
				
			end	
		end
			--//刷新第五波怪物
		if  (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[6]) and (shuaboss5 == 0) then
				CScriptManager:AddMonToMap(MonsterInfo[21][1],MonsterInfo[21][2],MonsterInfo[21][3],MonsterInfo[21][4],MonsterInfo[21][5],MonsterInfo[21][6],MonsterInfo[21][7],MonsterInfo[21][8]);
				CScriptManager:AddMonToMap(MonsterInfo[22][1],MonsterInfo[22][2],MonsterInfo[22][3],MonsterInfo[22][4],MonsterInfo[22][5],MonsterInfo[22][6],MonsterInfo[22][7],MonsterInfo[22][8]);
				CScriptManager:AddMonToMap(MonsterInfo[23][1],MonsterInfo[23][2],MonsterInfo[23][3],MonsterInfo[23][4],MonsterInfo[23][5],MonsterInfo[23][6],MonsterInfo[23][7],MonsterInfo[23][8]);
				CScriptManager:AddMonToMap(MonsterInfo[24][1],MonsterInfo[24][2],MonsterInfo[24][3],MonsterInfo[24][4],MonsterInfo[24][5],MonsterInfo[24][6],MonsterInfo[24][7],MonsterInfo[24][8]);
				CScriptManager:AddMonToMap(MonsterInfo[25][1],MonsterInfo[25][2],MonsterInfo[25][3],MonsterInfo[25][4],MonsterInfo[25][5],MonsterInfo[25][6],MonsterInfo[25][7],MonsterInfo[25][8]);
				shuaboss5=1;
				
			end	
		end
		--刷新第一波宝箱
		if (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[7]) and shuabaoxiang1 == 0 then 
			CScriptManager:AddMonToMap(MonsterInfo[27][1],MonsterInfo[27][2],MonsterInfo[27][3],MonsterInfo[27][4],MonsterInfo[27][5],MonsterInfo[27][6],MonsterInfo[27][7],MonsterInfo[27][8]);
			CScriptManager:AddMonToMap(MonsterInfo[28][1],MonsterInfo[28][2],MonsterInfo[28][3],MonsterInfo[28][4],MonsterInfo[28][5],MonsterInfo[28][6],MonsterInfo[28][7],MonsterInfo[28][8]);
			CScriptManager:AddMonToMap(MonsterInfo[29][1],MonsterInfo[29][2],MonsterInfo[29][3],MonsterInfo[29][4],MonsterInfo[29][5],MonsterInfo[29][6],MonsterInfo[29][7],MonsterInfo[29][8]);
			CScriptManager:AddMonToMap(MonsterInfo[30][1],MonsterInfo[30][2],MonsterInfo[30][3],MonsterInfo[30][4],MonsterInfo[30][5],MonsterInfo[30][6],MonsterInfo[30][7],MonsterInfo[30][8]);
			CScriptManager:AddMonToMap(MonsterInfo[31][1],MonsterInfo[31][2],MonsterInfo[31][3],MonsterInfo[31][4],MonsterInfo[31][5],MonsterInfo[31][6],MonsterInfo[31][7],MonsterInfo[31][8]);
			CScriptManager:AddMonToMap(MonsterInfo[32][1],MonsterInfo[32][2],MonsterInfo[32][3],MonsterInfo[32][4],MonsterInfo[32][5],MonsterInfo[32][6],MonsterInfo[32][7],MonsterInfo[32][8]);
			CScriptManager:AddMonToMap(MonsterInfo[33][1],MonsterInfo[33][2],MonsterInfo[33][3],MonsterInfo[33][4],MonsterInfo[33][5],MonsterInfo[33][6],MonsterInfo[33][7],MonsterInfo[33][8]);
			CScriptManager:AddMonToMap(MonsterInfo[34][1],MonsterInfo[34][2],MonsterInfo[34][3],MonsterInfo[34][4],MonsterInfo[34][5],MonsterInfo[34][6],MonsterInfo[34][7],MonsterInfo[34][8]);
			CScriptManager:AddMonToMap(MonsterInfo[35][1],MonsterInfo[35][2],MonsterInfo[35][3],MonsterInfo[35][4],MonsterInfo[35][5],MonsterInfo[35][6],MonsterInfo[35][7],MonsterInfo[35][8]);
			CScriptManager:AddMonToMap(MonsterInfo[36][1],MonsterInfo[36][2],MonsterInfo[36][3],MonsterInfo[36][4],MonsterInfo[36][5],MonsterInfo[36][6],MonsterInfo[36][7],MonsterInfo[36][8]);
			shuabaoxiang1=1;
			end
		end
		--刷新第二波宝箱
		if (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[8])  and shuabaoxiang2 == 0 then
			CScriptManager:AddMonToMap(MonsterInfo[37][1],MonsterInfo[37][2],MonsterInfo[37][3],MonsterInfo[37][4],MonsterInfo[37][5],MonsterInfo[37][6],MonsterInfo[37][7],MonsterInfo[37][8]);
			CScriptManager:AddMonToMap(MonsterInfo[38][1],MonsterInfo[38][2],MonsterInfo[38][3],MonsterInfo[38][4],MonsterInfo[38][5],MonsterInfo[38][6],MonsterInfo[38][7],MonsterInfo[38][8]);
			CScriptManager:AddMonToMap(MonsterInfo[39][1],MonsterInfo[39][2],MonsterInfo[39][3],MonsterInfo[39][4],MonsterInfo[39][5],MonsterInfo[39][6],MonsterInfo[39][7],MonsterInfo[39][8]);
			CScriptManager:AddMonToMap(MonsterInfo[40][1],MonsterInfo[40][2],MonsterInfo[40][3],MonsterInfo[40][4],MonsterInfo[40][5],MonsterInfo[40][6],MonsterInfo[40][7],MonsterInfo[40][8]);
			CScriptManager:AddMonToMap(MonsterInfo[41][1],MonsterInfo[41][2],MonsterInfo[41][3],MonsterInfo[41][4],MonsterInfo[41][5],MonsterInfo[41][6],MonsterInfo[41][7],MonsterInfo[41][8]);
			CScriptManager:AddMonToMap(MonsterInfo[42][1],MonsterInfo[42][2],MonsterInfo[42][3],MonsterInfo[42][4],MonsterInfo[42][5],MonsterInfo[42][6],MonsterInfo[42][7],MonsterInfo[42][8]);
			CScriptManager:AddMonToMap(MonsterInfo[43][1],MonsterInfo[43][2],MonsterInfo[43][3],MonsterInfo[43][4],MonsterInfo[43][5],MonsterInfo[43][6],MonsterInfo[43][7],MonsterInfo[43][8]);
			CScriptManager:AddMonToMap(MonsterInfo[44][1],MonsterInfo[44][2],MonsterInfo[44][3],MonsterInfo[44][4],MonsterInfo[44][5],MonsterInfo[44][6],MonsterInfo[44][7],MonsterInfo[44][8]);
			CScriptManager:AddMonToMap(MonsterInfo[45][1],MonsterInfo[45][2],MonsterInfo[45][3],MonsterInfo[45][4],MonsterInfo[45][5],MonsterInfo[45][6],MonsterInfo[45][7],MonsterInfo[45][8]);
			CScriptManager:AddMonToMap(MonsterInfo[46][1],MonsterInfo[46][2],MonsterInfo[46][3],MonsterInfo[46][4],MonsterInfo[46][5],MonsterInfo[46][6],MonsterInfo[46][7],MonsterInfo[46][8]);
			shuabaoxiang2=1;
			end
		end
		--刷新第三波宝箱
		if (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[9])  and shuabaoxiang3 == 0 then
			CScriptManager:AddMonToMap(MonsterInfo[47][1],MonsterInfo[47][2],MonsterInfo[47][3],MonsterInfo[47][4],MonsterInfo[47][5],MonsterInfo[47][6],MonsterInfo[47][7],MonsterInfo[47][8]);
			CScriptManager:AddMonToMap(MonsterInfo[48][1],MonsterInfo[48][2],MonsterInfo[48][3],MonsterInfo[48][4],MonsterInfo[48][5],MonsterInfo[48][6],MonsterInfo[48][7],MonsterInfo[48][8]);
			CScriptManager:AddMonToMap(MonsterInfo[49][1],MonsterInfo[49][2],MonsterInfo[49][3],MonsterInfo[49][4],MonsterInfo[49][5],MonsterInfo[49][6],MonsterInfo[49][7],MonsterInfo[49][8]);
			CScriptManager:AddMonToMap(MonsterInfo[50][1],MonsterInfo[50][2],MonsterInfo[50][3],MonsterInfo[50][4],MonsterInfo[50][5],MonsterInfo[50][6],MonsterInfo[50][7],MonsterInfo[50][8]);
			CScriptManager:AddMonToMap(MonsterInfo[51][1],MonsterInfo[51][2],MonsterInfo[51][3],MonsterInfo[51][4],MonsterInfo[51][5],MonsterInfo[51][6],MonsterInfo[51][7],MonsterInfo[51][8]);
			CScriptManager:AddMonToMap(MonsterInfo[52][1],MonsterInfo[52][2],MonsterInfo[52][3],MonsterInfo[52][4],MonsterInfo[52][5],MonsterInfo[52][6],MonsterInfo[52][7],MonsterInfo[52][8]);
			CScriptManager:AddMonToMap(MonsterInfo[53][1],MonsterInfo[53][2],MonsterInfo[53][3],MonsterInfo[53][4],MonsterInfo[53][5],MonsterInfo[53][6],MonsterInfo[53][7],MonsterInfo[53][8]);
			CScriptManager:AddMonToMap(MonsterInfo[54][1],MonsterInfo[54][2],MonsterInfo[54][3],MonsterInfo[54][4],MonsterInfo[54][5],MonsterInfo[54][6],MonsterInfo[54][7],MonsterInfo[54][8]);
			CScriptManager:AddMonToMap(MonsterInfo[55][1],MonsterInfo[55][2],MonsterInfo[55][3],MonsterInfo[55][4],MonsterInfo[55][5],MonsterInfo[55][6],MonsterInfo[55][7],MonsterInfo[55][8]);
			CScriptManager:AddMonToMap(MonsterInfo[56][1],MonsterInfo[56][2],MonsterInfo[56][3],MonsterInfo[56][4],MonsterInfo[56][5],MonsterInfo[56][6],MonsterInfo[56][7],MonsterInfo[56][8]);
			shuabaoxiang3=1;
			end
		end
		--刷新第四波宝箱
		if (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[10]) and shuabaoxiang4 == 0 then
			CScriptManager:AddMonToMap(MonsterInfo[57][1],MonsterInfo[57][2],MonsterInfo[57][3],MonsterInfo[57][4],MonsterInfo[57][5],MonsterInfo[57][6],MonsterInfo[57][7],MonsterInfo[57][8]);
			CScriptManager:AddMonToMap(MonsterInfo[58][1],MonsterInfo[58][2],MonsterInfo[58][3],MonsterInfo[58][4],MonsterInfo[58][5],MonsterInfo[58][6],MonsterInfo[58][7],MonsterInfo[58][8]);
			CScriptManager:AddMonToMap(MonsterInfo[59][1],MonsterInfo[59][2],MonsterInfo[59][3],MonsterInfo[59][4],MonsterInfo[59][5],MonsterInfo[59][6],MonsterInfo[59][7],MonsterInfo[59][8]);
			CScriptManager:AddMonToMap(MonsterInfo[60][1],MonsterInfo[60][2],MonsterInfo[60][3],MonsterInfo[60][4],MonsterInfo[60][5],MonsterInfo[60][6],MonsterInfo[60][7],MonsterInfo[60][8]);
			CScriptManager:AddMonToMap(MonsterInfo[61][1],MonsterInfo[61][2],MonsterInfo[61][3],MonsterInfo[61][4],MonsterInfo[61][5],MonsterInfo[61][6],MonsterInfo[61][7],MonsterInfo[61][8]);
			CScriptManager:AddMonToMap(MonsterInfo[62][1],MonsterInfo[62][2],MonsterInfo[62][3],MonsterInfo[62][4],MonsterInfo[62][5],MonsterInfo[62][6],MonsterInfo[62][7],MonsterInfo[62][8]);
			CScriptManager:AddMonToMap(MonsterInfo[63][1],MonsterInfo[63][2],MonsterInfo[63][3],MonsterInfo[63][4],MonsterInfo[63][5],MonsterInfo[63][6],MonsterInfo[63][7],MonsterInfo[63][8]);
			CScriptManager:AddMonToMap(MonsterInfo[64][1],MonsterInfo[64][2],MonsterInfo[64][3],MonsterInfo[64][4],MonsterInfo[64][5],MonsterInfo[64][6],MonsterInfo[64][7],MonsterInfo[64][8]);
			CScriptManager:AddMonToMap(MonsterInfo[65][1],MonsterInfo[65][2],MonsterInfo[65][3],MonsterInfo[65][4],MonsterInfo[65][5],MonsterInfo[65][6],MonsterInfo[65][7],MonsterInfo[65][8]);
			CScriptManager:AddMonToMap(MonsterInfo[66][1],MonsterInfo[66][2],MonsterInfo[66][3],MonsterInfo[66][4],MonsterInfo[66][5],MonsterInfo[66][6],MonsterInfo[66][7],MonsterInfo[66][8]);
			shuabaoxiang4=1;
			end
		end
		--刷新第五波宝箱
		if (not self.isNeedCreateMonster) then
			if (nowtime - self.dwStartTime > tbTime[11])  and shuabaoxiang5 == 0 then
			CScriptManager:AddMonToMap(MonsterInfo[67][1],MonsterInfo[67][2],MonsterInfo[67][3],MonsterInfo[67][4],MonsterInfo[67][5],MonsterInfo[67][6],MonsterInfo[67][7],MonsterInfo[67][8]);
			CScriptManager:AddMonToMap(MonsterInfo[68][1],MonsterInfo[68][2],MonsterInfo[68][3],MonsterInfo[68][4],MonsterInfo[68][5],MonsterInfo[68][6],MonsterInfo[68][7],MonsterInfo[68][8]);
			CScriptManager:AddMonToMap(MonsterInfo[69][1],MonsterInfo[69][2],MonsterInfo[69][3],MonsterInfo[69][4],MonsterInfo[69][5],MonsterInfo[69][6],MonsterInfo[69][7],MonsterInfo[69][8]);
			CScriptManager:AddMonToMap(MonsterInfo[70][1],MonsterInfo[70][2],MonsterInfo[70][3],MonsterInfo[70][4],MonsterInfo[70][5],MonsterInfo[70][6],MonsterInfo[70][7],MonsterInfo[70][8]);
			CScriptManager:AddMonToMap(MonsterInfo[71][1],MonsterInfo[71][2],MonsterInfo[71][3],MonsterInfo[71][4],MonsterInfo[71][5],MonsterInfo[71][6],MonsterInfo[71][7],MonsterInfo[71][8]);
			CScriptManager:AddMonToMap(MonsterInfo[72][1],MonsterInfo[72][2],MonsterInfo[72][3],MonsterInfo[72][4],MonsterInfo[72][5],MonsterInfo[72][6],MonsterInfo[72][7],MonsterInfo[72][8]);
			CScriptManager:AddMonToMap(MonsterInfo[73][1],MonsterInfo[73][2],MonsterInfo[73][3],MonsterInfo[73][4],MonsterInfo[73][5],MonsterInfo[73][6],MonsterInfo[73][7],MonsterInfo[73][8]);
			CScriptManager:AddMonToMap(MonsterInfo[74][1],MonsterInfo[74][2],MonsterInfo[74][3],MonsterInfo[74][4],MonsterInfo[74][5],MonsterInfo[74][6],MonsterInfo[74][7],MonsterInfo[74][8]);
			CScriptManager:AddMonToMap(MonsterInfo[75][1],MonsterInfo[75][2],MonsterInfo[75][3],MonsterInfo[75][4],MonsterInfo[75][5],MonsterInfo[75][6],MonsterInfo[75][7],MonsterInfo[75][8]);
			CScriptManager:AddMonToMap(MonsterInfo[76][1],MonsterInfo[76][2],MonsterInfo[76][3],MonsterInfo[76][4],MonsterInfo[76][5],MonsterInfo[76][6],MonsterInfo[76][7],MonsterInfo[76][8]);
			shuabaoxiang5=1;
			end
		end

	
	local mapTbl = objCross.setAllMap;
	for _, objMap in pairs(mapTbl) do
		
	end;
	
end;

--玩家死亡，刷新屠龙刀
function cross:ReflushItem(objPlayer)
	self.tulongdao = CScriptManager:AddNpcToMap(MonsterInfo[26][1],MonsterInfo[26][2],MonsterInfo[26][3],MonsterInfo[26][4],MonsterInfo[26][5])
end
--删除NPC怪物
function cross:DeleteAll()
	if self.tulongdao then 
	CScriptManager:DelNpcObj(9999, self.tulongdao)
	end
	CScriptManager:HideMon(9999,99990001)
	CScriptManager:HideMon(9999,99990002)
	CScriptManager:HideMon(9999,99990003)
	CScriptManager:HideMon(9999,99990004)
	CScriptManager:HideMon(9999,99990005)
end

--玩家进入
function cross:EventEnterPlayer(objCross,objPlayer)
	print("cross:EventEnterPlayer(objCross)",self.dwStep)
	--self.dwFirstPlayerTime = self.dwFirstPlayerTime or _now()
	if self.dwStep == 1 then
		self.dwStep = 2
		self.dwFirstPlayerTime = _now()
	end
	
	
	objPlayer:GetSystem("CPKSystem"):SetPKMode(enPKMode.ePK_Kill);
	objCross:SetRoleTime(objPlayer);
end;

--玩家退出
function cross:EventExitPlayer(objCross,objPlayer)
	--objCross:ClearKillNumCon(objPlayer);
	objCross:RoleLeaveCross(objPlayer);
	
	--如果退出玩家正在持有屠龙刀 
	objCross:ItemHoldBreak(objPlayer);
end;

--活动结束
function cross:EventGameOver(objCross)
	self:DeleteAll();
end;

--击杀玩家
function cross:EventKillPlayer(objCross,objKiller,objDeader)
	--击杀奖励
	local killScript = objKiller:GetSystem("CScriptSystem")
	--获取杀人者的战力
	local dwKillValue = killScript:GetFightValue()
	local dwRoleID = objKiller:GetRoleID()
	
	
	local deadScript = objDeader:GetSystem("CScriptSystem")
	--获取被杀者的战力
	local dwDeadValue = deadScript:GetFightValue()
	
	local Value = dwKillValue - dwDeadValue
	local killsl = 1 + objCross:GetPlayerKillNum(dwRoleID)
	--根据战力，杀人总数量，计算获取的荣誉值
	if killsl <= 100 then  
	
	Value = 1/(dwKillValue / dwDeadValue) * 20
	
	if Value > 40 then
		Value = 40
	end
	
	if Value < 10 then
		Value = 10
	end	
	
	Value = Value + 20
	
	Value = math.floor(Value)
	
	return Value;
	
	
	
	
	-- if Value < 0 then
		-- Value = -Value
		-- if Value >=1000000 then
		-- return 20;
		-- elseif Value <1000000 and Value>=500000 then
		-- return 15;
		-- elseif Value <500000 and Value >= 200000 then
		-- return 10;
		-- elseif Value <200000 and Value >= 0 then
		-- return 5;
		-- end
	
	-- else
		-- if Value >= 1000000 then
		-- return 5;
		-- elseif Value <1000000 and Value>=500000 then
		-- return 10;
		-- elseif Value <500000 and Value >= 200000 then
		-- return 15;
		-- elseif Value <200000 and Value >= 0 then
		-- return 20;
		-- end
	end

	CrossAddition:Continuation(objCross, objKiller, objDeader)
	return 0;
end;

--战场结束的日志
-- function war:WarLogRecod(objWar)
	-- local setResult = {};
	
	-- for id,info in pairs(objWar.setTrophyInfo)do
		-- setResult[id] = info.dwGuildID;
	-- end
	
	-- CLogSystemManager:war(1, setResult);
-- end;
