--宠物传功配置文件


--传功标准值
---横列是传功次数和基础值 例如：第一排是第一次
local standard = {
	[50710015] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10021030] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10021015] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10051001] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10092007] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10051003] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10082007] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10071007] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[50302063] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	[10061001] = {40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,100,105,110,115,120,125,130,135,140,145,150,155,160,165,170,175,180,185,190,195,200,205,210,215,220,225,230,235,240,245,255,265,275,285,295,305,315,325,335,345,355,365,375,385,395,405,415,425,435,445,455,465,475,485,495,505,515,525,535,545,555,565,575,585,595,605,615,625,635,645,655,665,675,685,695,},
	};
--传功最大次数 每日最大传功次数
local numberofall={
	[50710015] = {120,3},
	[10021030] = {120,3},
	[10021015] = {120,3},
	[10051001] = {120,3},
	[10092007] = {120,3},
	[10051003] = {120,3},
	[10082007] = {120,3},
	[10071007] = {120,3},
	[50302063] = {120,3},
	[10061001] = {120,3},
};
--宠物品质参数
local cwpz={
	[50710015] = 1,
	[10021030] = 1.1,
	[10021015] = 1.2,
	[10051001] = 1.3,
	[10092007] = 1.4,
	[10051003] = 1.5,
	[10082007] = 1.6,
	[10071007] = 1.7,
	[50302063] = 1.8,
	[10061001] = 1.9,
};
--传功消耗道具数量
local xuqiuwupin ={
	[50710015] = {3,3,3,4,4,4,5,5,5,7,7,7,9,9,9,11,11,11,14,14,14,17,17,17,20,20,20,24,24,24,28,28,28,32,32,32,38,38,38,44,44,44,50,50,50,5,5,5,8,8,8,11,11,11,14,14,14,17,17,17,20,20,20,23,23,23,26,26,26,29,29,29,32,32,32,2,2,2,4,4,4,6,6,6,8,8,8,10,10,10,12,12,12,14,14,14,16,16,16,18,18,18,20,20,20,22,22,22,24,24,24,26,26,26,28,28,28,30,30,30,},
	[10021030] = {5,5,5,6,6,6,7,7,7,9,9,9,11,11,11,13,13,13,16,16,16,19,19,19,22,22,22,26,26,26,30,30,30,34,34,34,40,40,40,46,46,46,52,52,52,5,5,5,8,8,8,12,12,12,15,15,15,18,18,18,22,22,22,25,25,25,28,28,28,31,31,31,35,35,35,2,2,2,4,4,4,6,6,6,8,8,8,11,11,11,13,13,13,15,15,15,17,17,17,19,19,19,22,22,22,24,24,24,26,26,26,28,28,28,30,30,30,33,33,33,},
	[10021015] = {7,7,7,8,8,8,9,9,9,11,11,11,13,13,13,15,15,15,18,18,18,21,21,21,24,24,24,28,28,28,32,32,32,36,36,36,42,42,42,48,48,48,54,54,54,6,6,6,9,9,9,13,13,13,16,16,16,20,20,20,24,24,24,27,27,27,31,31,31,34,34,34,38,38,38,2,2,2,4,4,4,7,7,7,9,9,9,12,12,12,14,14,14,16,16,16,19,19,19,21,21,21,24,24,24,26,26,26,28,28,28,31,31,31,33,33,33,36,36,36,},
	[10051001] = {9,9,9,10,10,10,11,11,11,13,13,13,15,15,15,17,17,17,20,20,20,23,23,23,26,26,26,30,30,30,34,34,34,38,38,38,44,44,44,50,50,50,56,56,56,6,6,6,10,10,10,14,14,14,18,18,18,22,22,22,26,26,26,29,29,29,33,33,33,37,37,37,41,41,41,2,2,2,5,5,5,7,7,7,10,10,10,13,13,13,15,15,15,18,18,18,20,20,20,23,23,23,26,26,26,28,28,28,31,31,31,33,33,33,36,36,36,39,39,39,},
	[10092007] = {11,11,11,12,12,12,13,13,13,15,15,15,17,17,17,19,19,19,22,22,22,25,25,25,28,28,28,32,32,32,36,36,36,40,40,40,46,46,46,52,52,52,58,58,58,7,7,7,11,11,11,15,15,15,19,19,19,23,23,23,28,28,28,32,32,32,36,36,36,40,40,40,44,44,44,2,2,2,5,5,5,8,8,8,11,11,11,14,14,14,16,16,16,19,19,19,22,22,22,25,25,25,28,28,28,30,30,30,33,33,33,36,36,36,39,39,39,42,42,42,},
	[10051003] = {13,13,13,14,14,14,15,15,15,17,17,17,19,19,19,21,21,21,24,24,24,27,27,27,30,30,30,34,34,34,38,38,38,42,42,42,48,48,48,54,54,54,60,60,60,7,7,7,12,12,12,16,16,16,21,21,21,25,25,25,30,30,30,34,34,34,39,39,39,43,43,43,48,48,48,3,3,3,6,6,6,9,9,9,12,12,12,15,15,15,18,18,18,21,21,21,24,24,24,27,27,27,30,30,30,33,33,33,36,36,36,39,39,39,42,42,42,45,45,45,},
	[10082007] = {15,15,15,16,16,16,17,17,17,19,19,19,21,21,21,23,23,23,26,26,26,29,29,29,32,32,32,36,36,36,40,40,40,44,44,44,50,50,50,56,56,56,62,62,62,8,8,8,12,12,12,17,17,17,22,22,22,27,27,27,32,32,32,36,36,36,41,41,41,46,46,46,51,51,51,3,3,3,6,6,6,9,9,9,12,12,12,16,16,16,19,19,19,22,22,22,25,25,25,28,28,28,32,32,32,35,35,35,38,38,38,41,41,41,44,44,44,48,48,48,},
	[10071007] = {17,17,17,18,18,18,19,19,19,21,21,21,23,23,23,25,25,25,28,28,28,31,31,31,34,34,34,38,38,38,42,42,42,46,46,46,52,52,52,58,58,58,64,64,64,8,8,8,13,13,13,18,18,18,23,23,23,28,28,28,34,34,34,39,39,39,44,44,44,49,49,49,54,54,54,3,3,3,6,6,6,10,10,10,13,13,13,17,17,17,20,20,20,23,23,23,27,27,27,30,30,30,34,34,34,37,37,37,40,40,40,44,44,44,47,47,47,51,51,51,},
	[50302063] = {19,19,19,20,20,20,21,21,21,23,23,23,25,25,25,27,27,27,30,30,30,33,33,33,36,36,36,40,40,40,44,44,44,48,48,48,54,54,54,60,60,60,66,66,66,9,9,9,14,14,14,19,19,19,25,25,25,30,30,30,36,36,36,41,41,41,46,46,46,52,52,52,57,57,57,3,3,3,7,7,7,10,10,10,14,14,14,18,18,18,21,21,21,25,25,25,28,28,28,32,32,32,36,36,36,39,39,39,43,43,43,46,46,46,50,50,50,54,54,54,},
	[10061001] = {21,21,21,22,22,22,23,23,23,25,25,25,27,27,27,29,29,29,32,32,32,35,35,35,38,38,38,42,42,42,46,46,46,50,50,50,56,56,56,62,62,62,68,68,68,9,9,9,15,15,15,20,20,20,26,26,26,32,32,32,38,38,38,43,43,43,49,49,49,55,55,55,60,60,60,3,3,3,7,7,7,11,11,11,15,15,15,19,19,19,22,22,22,26,26,26,30,30,30,34,34,34,38,38,38,41,41,41,45,45,45,49,49,49,53,53,53,57,57,57,},
};

local JDnum = {45,75,120};	
local function CountInstructProperty(dwPetId, dwDayConsult, dwConsult)
	local tbAddInfo = PetSingleAttr:new();
	local dwMax = #standard[dwPetId];
	if dwConsult > dwMax then
		dwConsult = dwMax;
	end
	tbAddInfo.dwHPMax =	math.floor((standard[dwPetId][dwConsult] * 5) * cwpz[dwPetId]);
	tbAddInfo.dwMPMax = math.floor((standard[dwPetId][dwConsult] * 0.1) * cwpz[dwPetId]);
	tbAddInfo.dwAttack = math.floor((standard[dwPetId][dwConsult] * 1) * cwpz[dwPetId]);
	tbAddInfo.dwDefense = math.floor((standard[dwPetId][dwConsult] * 0.5) * cwpz[dwPetId]);
	tbAddInfo.dwFlee = math.floor((standard[dwPetId][dwConsult] * 0.12) * cwpz[dwPetId]);
	tbAddInfo.dwCrit = math.floor((standard[dwPetId][dwConsult] * 0.11) * cwpz[dwPetId]);
	return tbAddInfo;
end;

_G.PetImage = {
	[50710015] = "img://gn_xiakechuangong_beijing_1.png";
	[10021030] = "img://gn_xiakechuangong_beijing_1.png";
	[10021015] = "img://gn_xiakechuangong_beijing_1.png";
	[10051001] = "img://gn_xiakechuangong_beijing_1.png";
	[10092007] = "img://gn_xiakechuangong_beijing_1.png";
	[10051003] = "img://gn_xiakechuangong_beijing_1.png";
	[10082007] = "img://gn_xiakechuangong_beijing_1.png";
	[10071007] = "img://gn_xiakechuangong_beijing_1.png";
	[50302063] = "img://gn_xiakechuangong_beijing_1.png";
	[10061001] = "img://gn_xiakechuangong_beijing_1.png";
};
	

--传功阶段数量

_G.PetImpartConfig = {
	--传功需求物品ID
	NeedItemID = {4100450,9701016,9701017};	
	--传功需求物品
	--allCount 传功次数总和, todayCount今日已传功次数,宠物id
	NeedItem = function(allCount, todayCount, petID)
		local itemID = 0;
		if allCount < JDnum[1] then
			itemID = 4100450;
			elseif allCount >= JDnum[1] and allCount < JDnum[2] then
				itemID = 9701016;
				elseif allCount >= JDnum[2] and allCount <= JDnum[3] then
					itemID = 9701017;
					end
		local itemCount = 0;
		itemCount = xuqiuwupin[petID][allCount + 1] or 0;
		--返回的第三个参数如果是0，说明商场不出售这个物品。如果为1，说明商场出售这个物品。
		--策划在改变物品Id时，一定要对应的将这个参数改变，注意注意！！！。。。。。
		return itemID, itemCount,0;
	end;
	
	--给人物的属性加成
	--allCount 传功次数总和, todayCount今日已传功次数,宠物id
	AddProp = function(allCount, todayCount, petID)
		local tbAddInfo = PetSingleAttr:new();
		if allCount > 0 then
			for i = 1,allCount do
				local tbTmp = CountInstructProperty(petID, todayCount, i);
				tbAddInfo:AddValue(tbTmp);
			end
		end
		return tbAddInfo;
	end;
	
	--得到宠物传功次数
	--AllImpart 总传功数
	GetImpartCount = function(petID)
		return numberofall[petID];
	end;
	--根据当前总次数获取当前阶段
	--dwNum当前总次数
	GetLadderByCount = function(dwCount)
		local dwLadder = 1
		local dwNum1 = 0
		local dwNum2 = 0
		local num = 0
		if 0 >= dwCount or dwCount < JDnum[1] then
			dwLadder = 1
			dwNum2 = JDnum[dwLadder]
		elseif JDnum[1] >= dwCount or dwCount < JDnum[2] then
			dwLadder = 2
			dwNum2 = JDnum[dwLadder] - JDnum[dwLadder - 1]
		elseif JDnum[2] >= dwCount or dwCount <= JDnum[3] then
			dwLadder = 3
			dwNum2 = JDnum[dwLadder] - JDnum[dwLadder - 1]
		end
		if dwLadder == 1 then
			num = 0
		else
			num = JDnum[dwLadder - 1]
		end
		dwNum1 = dwCount - num
		return dwLadder ,num,dwNum2
	end;
};

_G.PetImpartNumInfo = "<font color='#DCB857'>今日可传功：</font>%d/%d次";
_G.PetAllImpartNumInfo ={
	[1] =  "<font color='#DCB857'>初级传功最多可传功：</font>%d/%d次";
	[2] =  "<font color='#DCB857'>中级传功最多可传功：</font>%d/%d次";
	[3] =  "<font color='#DCB857'>高级传功最多可传功：</font>%d/%d次";
};
_G.PetImpartItemNumInfo = "<font color='#FF0000'>%s%d/%d</font>";
_G.PetImpartItemNumInfo1 = "<font color='#D9CCBD'>%s%d/%d</font>";
_G.PetImpartString = "接受侠客传功，可大幅提升<br/>您自身的战斗属性！";
_G.PetImpartXHNum = "<font color='#D9CCBD'>消耗材料<font color='#31cf32'>%d个</font>提升自身属性</font>";
_G.Attack = "攻击:";
_G.dwFlee = "身法:";
_G.dwHPMax = "生命:";
_G.dwDefense = "防御:";
_G.dwCrit = "暴击:";
_G.dwMPMax = "内力:";
_G.gonggao = "<p><font color='#D9CCBD'>1.接受侠客传功次数越多，自身属性提升越高！<p>2.每位侠客可为您提升的属性数值各不相同；<p>3.不同侠客在传功时，需要消耗的侠客秘传数量亦不相同；<p>4.侠客秘传的消耗数量会随您接受传功的总次数而变。</font></p>";

_G.PetImpartStateConfig = {StayState = 1,AttackState = 2,DeadState = 3};
_G.PetImpartBasicConfig = {
---铁匠
[50710015] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id				
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[50710015].szFile, 
				sklFile = ResNpcModelConfig.Skls[50710015].szFile, 
				sanFile = ResNpcModelConfig.Sans[5071001501].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,
			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"哟，找我打铁的何事？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 5071001501,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我这门手艺，可是祖传的，不是谁想学都能学的！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 50710015939,								--模型动作
											},	
								},
			[PetImpartStateConfig.DeadState] = { 	
										szTalk = 
										{
											'呼——传功怎么比打铁还累！',
										},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 50710015939,								--模型动作
											},	
								}
		};		
	};
	-----
	[10021030] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id				
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10021030].szFile, 
				sklFile= ResNpcModelConfig.Skls[10021030].szFile, 
				sanFile = ResNpcModelConfig.Sans[1002103001].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,
			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"我给你传功，你帮我跑堂么？",
											"凭咱俩的交情，我岂能眼睁睁地看你这么弱？当然要把眼睛闭上！",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002103001,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'看好咯！一招一式，可都是我康兴哥毕生功力之精华！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10021030930,								--模型动作
											},	
								},
			[PetImpartStateConfig.DeadState] = { 	
										szTalk = 
										{
											'如何？哥的功夫了得吧？',
										},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10021030930,								--模型动作
											},	
								}
		};		
	};
		
	[10021015] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id							
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10021015].szFile, 
				sklFile= ResNpcModelConfig.Skls[10021015].szFile, 
				sanFile = ResNpcModelConfig.Sans[1002101501].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,

			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"传功传功，干脆把我这一身肥膘传给你如何？",
											"江湖上风云变幻无常，没有一身绝技，岂能安身立命！",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1002101501,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我的功夫，没有殷实的身家，可是不好学啊……哈哈哈——',
										'年轻人，你可看仔细了！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10021015931,								--模型动作
											},	
								},
		},	
	};
	[10051001] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id			
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10051001].szFile, 
				sklFile= ResNpcModelConfig.Skls[10051001].szFile, 
				sanFile = ResNpcModelConfig.Sans[1005100101].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,

			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"快来，我们俩先过几招！",
											"我这两天又想到了一套新招，我教你，咱俩练练！",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'嘿——！你可看明白了？',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10051001932,								--模型动作
											},	
								},
		},	
	};
		[10092007] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id					
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10092007].szFile, 
				sklFile= ResNpcModelConfig.Skls[10092007].szFile, 
				sanFile = ResNpcModelConfig.Sans[1009200701].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,

			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"想要我传功于你？呵，凭什么？",
											"你寻不来五毒秘传，有这侠客秘传，倒也还算不错。",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1009200701,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我李莫愁的功夫，你当是好学的么？',
										'你若能帮我弄来《玉女心经》，我还能传你更高深的功夫！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10092007933,								--模型动作
											},	
								},
		},	
	};
		[10051003] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id				
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10051003].szFile, 
				sklFile= ResNpcModelConfig.Skls[10051003].szFile, 
				sanFile = ResNpcModelConfig.Sans[1005100301].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-15,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,

			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"桃花岛的武功精妙深奥，能学多少就看你的悟性了。",
											"琴棋书画，医卜星象，外招内功，你想学哪样？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100301,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'到此为止吧，贪多可是嚼不烂的。',
										'年轻人，好悟性！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10051003002,								--模型动作
											},	
								},
		},	
	};
	[10082007] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id				
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10082007].szFile, 
				sklFile= ResNpcModelConfig.Skls[10082007].szFile, 
				sanFile = ResNpcModelConfig.Sans[1008200701].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,

			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"快来，咱们俩先过几招！",
											"我这两天又想到了一套新招，我教你，咱俩练练！",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1008200701,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'以后有什么有趣的武功，也教教我啊！',
										'等我想出更有意思的招式，再来教你！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10082007935,								--模型动作
											},	
								},
		},	
	};
	[10071007] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id				
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10071007].szFile, 
				sklFile= ResNpcModelConfig.Skls[10071007].szFile, 
				sanFile = ResNpcModelConfig.Sans[1007100701].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,

			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"我乃武功天下第一，你看着有几分顺眼，倒是可以指点指点你！",
											"若是认我为师，我便教你几招，让你打遍天下无敌手！",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1007100701,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'这几招你可记好喽，对敌之时可保你不败！',
										'不错，是块习武的好材料！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 10071007041,								--模型动作
											},	
								},
		},	
	};
	[50302063] = {
		--模型配置
		PetModelConfig = 
		{
				
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[50302063].szFile, 
				sklFile= ResNpcModelConfig.Skls[50302063].szFile, 
				sanFile = ResNpcModelConfig.Sans[5030206301].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,

			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	
	};
	[10061001] = {
		--模型配置
		PetModelConfig = 
		{
			-- 调戏一下按钮模型动作id				
			model = 
			{	
				sknFile = ResNpcModelConfig.Skns[10061001].szFile, 
				sklFile= ResNpcModelConfig.Skls[10061001].szFile, 
				sanFile = ResNpcModelConfig.Sans[1006100101].szFile,
			},--模型
			Camara =
			{
				CamaraPos = _Vector3.new(1,-10,2);
				LookPos = _Vector3.new(0,0,0);
				VPort = _Vector2.new(1024,1024);
			},
						
			--聊天泡泡显示时间(秒)
			dwShowTalkTime = 3,
			
			[PetImpartStateConfig.StayState] = { 	
								szTalk = {															--聊天内容
											"嘿嘿！！大侠，我这有金锄头和银锄头，你打算用哪个来挖宝呢？",
										},
								action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,							--模型动作及特效
										},
								},
			[PetImpartStateConfig.AttackState] = { 	
									szTalk = 
									{
										'我挖呀！挖呀！',
										'嘿哟！嘿哟！我使劲挖啊！',
									},	
									action = {pfxId = 0,bindPos ="dummy001",dwActionID = 1005100101,								--模型动作
											},	
								},
		},	

	};
}
