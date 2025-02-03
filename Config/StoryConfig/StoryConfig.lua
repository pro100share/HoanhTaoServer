--剧情配置 
--[[
	NpcId:用于显示npc的图片和名字(NPCData)
	StrId:npc说的话(NpcStringConfigInfo)
	Pos：左边or右边, 1 or 2
	Story:
	PAID--玩家动作id
	bPAStop--玩家动作是否停止
	mNpcId--执行动作的npcid
	NAID--npc动作id
	bNAStop--npc动作是否停止
	NpcStory:
	ActId--npc动作id
	pause--npc动作是否停止
	心理独白：
	ActId--玩家动作id
	Stop--玩家动作是否停止
--]]
_G.StoryConfig = {
	[1001] = {
		-- {look={-62,-51,3};eye={-25,-29,30};StrId=1001001;tm=6000;last=999999};		
		-- {look={-57,-67,3};eye={-37,-16,40};StrId=1001002;tm=2000;last=999999};			
		-- {look={-66,-96,3};eye={-29,-25,16};StrId=1001003;tm=6000;last=999999};		
		-- {look={-102,-74,3};eye={-10,-9,20};StrId=1001004;tm=5000;last=999999};		
		-- {look={-102,-74,1};eye={5.7,9.8,6};StrId=1001005;tm=4000;last=999999};	
		{look={-101.45,-73.54,3};eye={-12.1,-15.22,11};StrId=1001001;tm=1000;last=999999};
		{look={-62,-51,3};eye={-25,-29,30};StrId=1001002;tm=4000;last=999999};	
		{look={-58.42,-69.75,3};eye={-31.73,-18.89,28};StrId=1001003;tm=4000;last=999999};
		{look={-66,-96,3};eye={-29,-25,16};StrId=1001004;tm=3000;last=999999};
		{look={-100.6,-79.07,3};eye={-17.59,-22.33,19};StrId=1001005;tm=4000;last=999999};
	};

--镰
 [100101]	=	{
  {NpcId=10011019;StrId=100121;Pos=3;bCam=1;look={-101,-69,1};eye={-5,-6,3};tm=0;};
  {NpcId=1;StrId=100122;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};
  {NpcId=10011019;StrId=100123;Pos=3;bCam=1;look={-101,-69,1};eye={-5,-6,3};tm=0;};
  {NpcId=10011017;StrId=100124;Pos=3;bCam=1;look={-104,-69,1};eye={-6,-8,3};tm=0;};
  {NpcId=1;StrId=100125;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};  
 }; 
--刀
 [100102]	=	{
  {NpcId=10011017;StrId=100126;Pos=3;bCam=1;look={-104,-69,1};eye={-6,-8,3};tm=0;};
  {NpcId=1;StrId=100127;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};
  {NpcId=10011019;StrId=100128;Pos=3;bCam=1;look={-101,-69,1};eye={-5,-6,3};tm=0;};
  {NpcId=10011018;StrId=100129;Pos=3;bCam=1;look={-97,-71,1};eye={-7,-5,3};tm=0;};
  {NpcId=1;StrId=100130;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};  
 };  
--剑
 [100103]	=	{
  {NpcId=10011016;StrId=100151;Pos=3;bCam=1;look={-96,-75,1};eye={-8,-6,3};tm=0;};
  {NpcId=1;StrId=100152;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};
  {NpcId=10011016;StrId=100153;Pos=3;bCam=1;look={-96,-75,1};eye={-8,-6,3};tm=0;};
  {NpcId=10011018;StrId=100154;Pos=3;bCam=1;look={-97,-71,1};eye={-7,-5,3};tm=0;};
  {NpcId=1;StrId=100155;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;}; 
 };
--枪 
 [100104]	=	{
  {NpcId=10011018;StrId=100156;Pos=3;bCam=1;look={-97,-71,1};eye={-7,-5,3};tm=0;};
  {NpcId=1;StrId=100157;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};
  {NpcId=10011017;StrId=100158;Pos=3;bCam=1;look={-104,-69,1};eye={-6,-8,3};tm=0;};
  {NpcId=10011016;StrId=100159;Pos=3;bCam=1;look={-96,-75,1};eye={-8,-6,3};tm=0;};
  {NpcId=1;StrId=100160;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;}; 
 };

 -- [100101]	=	{
  -- {NpcId=10011019;StrId=100121;Pos=3;bCam=1;look={-101,-69,1};eye={-5,-6,3};tm=0;};	
  -- {NpcId=10011017;StrId=100122;Pos=3;bCam=1;look={-104,-69,1};eye={-6,-8,3};tm=0;};
  -- --{NpcId=1;StrId=100123;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};
  -- {NpcId=10011016;StrId=100124;Pos=3;bCam=1;look={-96,-75,1};eye={-8,-6,3};tm=0;};
  -- {NpcId=1;StrId=100125;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};
  -- {NpcId=10011016;StrId=100126;Pos=3;bCam=1;look={-96,-75,1};eye={-8,-6,3};tm=0;};
  -- {NpcId=10011018;StrId=100127;Pos=3;bCam=1;look={-97,-71,1};eye={-7,-5,3};tm=0;};
  -- {NpcId=1;StrId=100128;Pos=3;bCam=1;look={0,0,1};eye={5,6,3};tm=0;};  
 -- };

	[100105] = {
	 {NpcId=10011011;StrId=100141;Pos=1;Delay=1000;};
	}; 
 
	[100106] = {
	 {NpcId=1;StrId=100142;Pos=3;bCam=1;look={0,0,1};eye={-10,-10,6};tm=500;};
	 {NpcId=1;StrId=100143;Pos=3;};	 
	}; 
 
	[100201] = {
	 {NpcId=10011011;StrId=100241;Pos=1;Delay=10;Patrol={{npc=10011011,index=1}}};
	};
	
	[100202] = {
	 {NpcId=10011022;StrId=100245;Pos=3;bCam=1;look={-17,-62,1};eye={-6,-17,8};tm=0;};
	 {NpcId=1;StrId=100246;Pos=3;};
	 {NpcId=10011022;StrId=100247;Pos=3;};
	 {NpcId=10011030;StrId=100248;Pos=3;};
	 {NpcId=10011031;StrId=100249;Pos=3;};	 
	};	
	
	-- [1002]	=	{
		-- {look={-15,-58,3};eye={-23,-23,15};StrId=1001010;tm=1500;last=999999};	
		-- {look={-12,-45,3};eye={-26,-30,24};StrId=1001011;tm=3000;last=999999};		
		-- {look={-15,-39,3};eye={-37,-3,30};StrId=1001012;tm=1000;last=999999};	
		-- {look={-2,-37,3};eye={-29,-23,30};StrId=1001013;tm=3000;last=999999};	
		-- {look={-47,-14,3};eye={-11,-36,25};StrId=1001014;tm=6000;last=999999};	
	-- };

	[100301]	=	{
	 {NpcId=10011022;StrId=100341;Pos=1;Delay=10;Patrol={{npc=10011011,index=3}}};	
	};

--镰
 [100501]	=	{
  {NpcId=1;StrId=100541;Pos=3;bCam=1;look={-4,0,3};eye={-3,-10,7};tm=3000;last=4000};
 }; 
--刀
 [100502]	=	{
  {NpcId=1;StrId=100542;Pos=3;bCam=1;look={-4,1,3};eye={-3,-10,7};tm=3000;last=4000};
 };  
--剑
 [100503]	=	{
  {NpcId=1;StrId=100543;Pos=3;bCam=1;look={-4,0,3};eye={-3,-10,7};tm=3000;last=4000};
 };
--枪 
 [100504]	=	{
  {NpcId=1;StrId=100544;Pos=3;bCam=1;look={-5,1,3};eye={-3,-10,7};tm=3000;last=4000};
 };

	[100801] = {
	 {NpcId=1;StrId=100841;Pos=4;};	
	}; 
	[100802] = {
	 {NpcId=1;StrId=100842;Pos=4;};	
	}; 
	[100803] = {
	 {NpcId=10011011;StrId=100843;Pos=3;bCam=1;look={-83,24,1};eye={-4.6,-20.96,12};tm=2500};
	 {NpcId=10011031;StrId=100844;Pos=3;};	 	 
	 {NpcId=10011011;StrId=100845;Pos=3;};	 
	 {NpcId=10011030;StrId=100846;Pos=3;};
	 {NpcId=10011008;StrId=100847;Pos=3;};	 
	 {NpcId=10011011;StrId=100848;Pos=3;};
	 {NpcId=10011008;StrId=100849;Pos=3;};	
	 {NpcId=10011011;StrId=100850;Pos=3;};
	 {NpcId=10011008;StrId=100851;Pos=3;};		 
	 {NpcId=10011011;StrId=100852;Pos=3;Patrol={{npc=10011008,index=1},{npc=10011030,index=1},{npc=10011031,index=1}}};	 
	};	

	[101001]	=	{
	 {NpcId=10011011;StrId=101041;Pos=3;bCam=1;look={-17.99,18.55,1};eye={-24.83,4.45,10};tm=500};
	 {NpcId=1;StrId=101042;Pos=3;bCam=1;look={0,0,1};eye={9,10,12};tm=500;};	 
	 {NpcId=1;StrId=101043;Pos=3;};	
	 {NpcId=10011030;StrId=101044;Pos=3;bCam=1;look={-25.88,21.15,1};eye={-30.9,14.92,10};tm=0;};
	 {NpcId=10011011;StrId=101045;Pos=3;Patrol={{npc=10011011,index=2},{npc=10011030,index=2},{npc=10011031,index=2}}};	 
	};

	[101101]	=	{
	 {NpcId=1;StrId=101141;Pos=4;};		
	};

	[101201]	=	{
	 {NpcId=1;StrId=101241;Pos=4;};		
	};
	
	[101401]	=	{
	 {NpcId=10011012;StrId=101441;Pos=1;Delay=10;Patrol={{npc=10011012,index=1}}};	
	};
	
	[101402] = {
	 {NpcId=10011021;StrId=101442;Pos=3;bCam=1;look={49,-13,3};eye={-15,-8,10};tm=2000;};
	 {NpcId=10011030;StrId=101443;Pos=3;};
	 {NpcId=10011021;StrId=101444;Pos=3;};
	 {NpcId=10011104;StrId=101445;Pos=3;bCam=1;look={49,-12.53,3};eye={-4.9,-26.3,19};tm=2000;Patrol={{npc=10011104,index=1}}};
	 {NpcId=10011030;StrId=101446;Pos=3;};
	 {NpcId=10011021;StrId=101447;Pos=3;Patrol={{npc=10011030,index=3}}};	 
	};		
	[101403]	=	{
	 {NpcId=1;StrId=101448;Pos=4;};	
	};
--镰	
 [101501]	=	{
  {NpcId=1;StrId=101543;Pos=3;PAID=100000100;bPAStop=1;}; 
  {NpcId=10011020;StrId=101544;Pos=3;mNpcId=10011020;NAID=50012001034;bCam=1;look={9.1,8.5,1};eye={-0.3,-26.7,17};tm=2000;}; 
  {NpcId=10011013;StrId=101545;Pos=3;};  
  {NpcId=10011021;StrId=101546;Pos=3;};
  {NpcId=10011013;StrId=101547;Pos=3;}; 
  {NpcId=10011020;StrId=101548;Pos=3;Patrol={{npc=10011020,index=1}}};
  {NpcId=10011013;StrId=101549;Pos=3;};  
  {NpcId=10011020;StrId=101550;Pos=3;};
  {NpcId=10011021;StrId=101551;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=2}}};
  {NpcId=10011020;StrId=101552;Pos=3;mNpcId=10011020;NAID=50012001010;};
  --{NpcId=10011021;StrId=101553;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=3}}};
  {NpcId=10011021;StrId=101554;Pos=3;mNpcId=10011021;NAID=1001200480;bNAStop=1;}; 
  {NpcId=10011020;StrId=101555;Pos=3;mNpcId=10011020;NAID=5001200180;bNAStop=1;};  
  {NpcId=10011013;StrId=101556;Pos=3;mNpcId=10011013;NAID=1001100580;bNAStop=1;};  
  {NpcId=10011020;StrId=101557;Pos=3;mNpcId=10011020;NAID=5001200183;bNAStop=1;};  
  {NpcId=10011013;StrId=101558;Pos=3;};
  {NpcId=10011020;StrId=101559;Pos=3;};
  {NpcId=10011013;StrId=101560;Pos=3;};   
  {NpcId=1;StrId=101561;Pos=3;};   
 };	
--刀
 [101502]	=	{
  {NpcId=1;StrId=101543;Pos=3;PAID=200100100;bPAStop=1;}; 
  {NpcId=10011020;StrId=101544;Pos=3;mNpcId=10011020;NAID=50012001034;bCam=1;look={9.1,8.5,1};eye={-0.3,-26.7,17};tm=2000;}; 
  {NpcId=10011013;StrId=101545;Pos=3;};  
  {NpcId=10011021;StrId=101546;Pos=3;};
  {NpcId=10011013;StrId=101547;Pos=3;}; 
  {NpcId=10011020;StrId=101548;Pos=3;Patrol={{npc=10011020,index=1}}};
  {NpcId=10011013;StrId=101549;Pos=3;};  
  {NpcId=10011020;StrId=101550;Pos=3;};
  {NpcId=10011021;StrId=101551;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=2}}};
  {NpcId=10011020;StrId=101552;Pos=3;mNpcId=10011020;NAID=50012001010;};
  --{NpcId=10011021;StrId=101553;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=3}}};
  {NpcId=10011021;StrId=101554;Pos=3;mNpcId=10011021;NAID=1001200480;bNAStop=1;}; 
  {NpcId=10011020;StrId=101555;Pos=3;mNpcId=10011020;NAID=5001200180;bNAStop=1;};  
  {NpcId=10011013;StrId=101556;Pos=3;mNpcId=10011013;NAID=1001100580;bNAStop=1;};  
  {NpcId=10011020;StrId=101557;Pos=3;mNpcId=10011020;NAID=5001200183;bNAStop=1;};  
  {NpcId=10011013;StrId=101558;Pos=3;};
  {NpcId=10011020;StrId=101559;Pos=3;};
  {NpcId=10011013;StrId=101560;Pos=3;};   
  {NpcId=1;StrId=101561;Pos=3;}; 
 };	
--剑
 [101503]	=	{
  {NpcId=1;StrId=101543;Pos=3;PAID=300100100;bPAStop=1;}; 
  {NpcId=10011020;StrId=101544;Pos=3;mNpcId=10011020;NAID=50012001034;bCam=1;look={9.1,8.5,1};eye={-0.3,-26.7,17};tm=2000;}; 
  {NpcId=10011013;StrId=101545;Pos=3;};  
  {NpcId=10011021;StrId=101546;Pos=3;};
  {NpcId=10011013;StrId=101547;Pos=3;}; 
  {NpcId=10011020;StrId=101548;Pos=3;Patrol={{npc=10011020,index=1}}};
  {NpcId=10011013;StrId=101549;Pos=3;};  
  {NpcId=10011020;StrId=101550;Pos=3;};
  {NpcId=10011021;StrId=101551;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=2}}};
  {NpcId=10011020;StrId=101552;Pos=3;mNpcId=10011020;NAID=50012001010;};
  --{NpcId=10011021;StrId=101553;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=3}}};
  {NpcId=10011021;StrId=101554;Pos=3;mNpcId=10011021;NAID=1001200480;bNAStop=1;}; 
  {NpcId=10011020;StrId=101555;Pos=3;mNpcId=10011020;NAID=5001200180;bNAStop=1;};  
  {NpcId=10011013;StrId=101556;Pos=3;mNpcId=10011013;NAID=1001100580;bNAStop=1;};  
  {NpcId=10011020;StrId=101557;Pos=3;mNpcId=10011020;NAID=5001200183;bNAStop=1;};  
  {NpcId=10011013;StrId=101558;Pos=3;};
  {NpcId=10011020;StrId=101559;Pos=3;};
  {NpcId=10011013;StrId=101560;Pos=3;};   
  {NpcId=1;StrId=101561;Pos=3;};  
 };	
--枪
 [101504]	=	{
  {NpcId=1;StrId=101543;Pos=3;PAID=400000100;bPAStop=1;}; 
  {NpcId=10011020;StrId=101544;Pos=3;mNpcId=10011020;NAID=50012001034;bCam=1;look={9.1,8.5,1};eye={-0.3,-26.7,17};tm=2000;}; 
  {NpcId=10011013;StrId=101545;Pos=3;};  
  {NpcId=10011021;StrId=101546;Pos=3;};
  {NpcId=10011013;StrId=101547;Pos=3;}; 
  {NpcId=10011020;StrId=101548;Pos=3;Patrol={{npc=10011020,index=1}}};
  {NpcId=10011013;StrId=101549;Pos=3;};  
  {NpcId=10011020;StrId=101550;Pos=3;};
  {NpcId=10011021;StrId=101551;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=2}}};
  {NpcId=10011020;StrId=101552;Pos=3;mNpcId=10011020;NAID=50012001010;};
  --{NpcId=10011021;StrId=101553;Pos=3;mNpcId=10011021;NAID=10012004040;Patrol={{npc=10011020,index=3}}};
  {NpcId=10011021;StrId=101554;Pos=3;mNpcId=10011021;NAID=1001200480;bNAStop=1;}; 
  {NpcId=10011020;StrId=101555;Pos=3;mNpcId=10011020;NAID=5001200180;bNAStop=1;};  
  {NpcId=10011013;StrId=101556;Pos=3;mNpcId=10011013;NAID=1001100580;bNAStop=1;};  
  {NpcId=10011020;StrId=101557;Pos=3;mNpcId=10011020;NAID=5001200183;bNAStop=1;};  
  {NpcId=10011013;StrId=101558;Pos=3;};
  {NpcId=10011020;StrId=101559;Pos=3;};
  {NpcId=10011013;StrId=101560;Pos=3;};   
  {NpcId=1;StrId=101561;Pos=3;}; 
 }; 
 
 [101601]	=	{
  {NpcId=10011015;StrId=101641;Pos=3;bCam=1;look={3,5,1};eye={15,-24,20};tm=2000;};
  {NpcId=10011013;StrId=101642;Pos=3;};
  {NpcId=10011014;StrId=101643;Pos=3;Patrol={{npc=10011014,index=2}}};
  {NpcId=10011014;StrId=101644;Pos=3;};  
  {NpcId=10011015;StrId=101645;Pos=3;};
  {NpcId=10011013;StrId=101646;Pos=3;};  
 }; 	
 
	[101701] = {
	 {NpcId=1;StrId=101741;Pos=3;bCam=1;look={1,1,1};eye={-4.69,-12.26,7};tm=500};
	};	
	
 [101901]	=	{
  {NpcId=10011022;StrId=101941;Pos=3;bCam=1;look={-41.78,-15.76,1};eye={8.78,-17.95,15};tm=2000;Patrol={{npc=10011022,index=2},{npc=10011012,index=2}}};
  {NpcId=10011012;StrId=101942;Pos=3;bCam=1;look={-37.11,-22.41,1};eye={7.94,-19.34,15};tm=1000;Patrol={{npc=10011012,index=3}};};  
  {NpcId=1;StrId=101943;Pos=3;};
  {NpcId=10011012;StrId=101944;Pos=3;Patrol={{npc=10011012,index=4},{npc=10011022,index=3}}};
  {NpcId=1;StrId=101945;Pos=3;};  
  {NpcId=10011022;StrId=101946;Pos=3;};
  {NpcId=10011022;StrId=101947;Pos=3;bCam=1;look={-35.9,-37.7,1};eye={-11.7,-25.4,16};tm=2000;Patrol={{npc=10011022,index=4}}};  
  {NpcId=10011002;StrId=101948;Pos=3;};
  {NpcId=10011022;StrId=101949;Pos=3;};
  {NpcId=10011002;StrId=101950;Pos=3;};
  {NpcId=10011022;StrId=101951;Pos=3;};  
 }; 
 
	[102001] = {
	 {NpcId=1;StrId=102041;Pos=4;};
	};	
	[102002] = {
	 {NpcId=10011002;StrId=102042;Pos=1;Delay=1000;};
	};		
	[102101] = {
	 {NpcId=10011014;StrId=102141;Pos=1;Delay=1000;};
	};	
	
	[102201] = {
	 {NpcId=10011014;StrId=102241;Pos=1;Delay=10;Patrol={{npc=10011014,index=1}}};
	};		
	
 [102202]	=	{
  {NpcId=10011015;StrId=102242;Pos=3;bCam=1;look={50.07,-59.3,1};eye={-12.55,-26.73,13};tm=0;};
  {NpcId=10011014;StrId=102243;Pos=3;};
  {NpcId=1;StrId=102244;Pos=3;};  
  {NpcId=10011015;StrId=102245;Pos=3;};
  {NpcId=10011015;StrId=102246;Pos=3;};
  {NpcId=10011015;StrId=102247;Pos=3;};
  {NpcId=10011015;StrId=102248;Pos=3;}; 
  {NpcId=1;StrId=102249;Pos=3;};  
 }; 	

 [214001] = {
	 {NpcId=10011034;StrId=214041;Pos=1;Delay=1000;}; 
	 {NpcId=10011002;StrId=214042;Pos=1;Delay=3000;}; 
	 {NpcId=10011034;StrId=214043;Pos=1;Delay=3000;}; 	 
 }; 
  
	[200901]={
  {NpcId=1;StrId=200941;Pos=3;bCam=1;look={3,22,1};eye={-14.76,-22,19};tm=6000;};
  {NpcId=10021101;StrId=200942;Pos=3;bCam=1;look={-3.4,59,1};eye={-13.7,-20.55,16};tm=0;};	
  {NpcId=1;StrId=200943;Pos=3;}; 
  {NpcId=10021101;StrId=200944;Pos=3;};	  
	};
	
 [201001]={
  {NpcId=10031005;StrId=201041;Pos=3;bCam=1;look={27.4,77.3,1};eye={-10.4,-10.6,8};tm=0;};	 
  {NpcId=1;StrId=201042;Pos=3;}; 
  {NpcId=10031005;StrId=201043;Pos=3;bCam=1;look={24.2,89.9,1};eye={-16.4,-16.1,26};tm=0;};
  {NpcId=10031005;StrId=201044;Pos=3;bCam=1;look={-3.4,85.5,1};eye={-13.7,-18.1,24};tm=0;};  
  {NpcId=10031005;StrId=201045;Pos=3;bCam=1;look={55.2,94.9,1};eye={-14.7,-19,26};tm=0;};
  {NpcId=10031005;StrId=201046;Pos=3;bCam=1;look={27.7,34.8,1};eye={-14.3,-25.1,17};tm=0;}; 
  {NpcId=1;StrId=201047;Pos=3;bCam=1;};   
 };
 [201201]={
  {NpcId=10031025;StrId=201241;Pos=3;bCam=1;look={-15.96,9.07,1};eye={-17.14,-19.41,20};tm=500;};	 
  {NpcId=10031026;StrId=201242;Pos=3;}; 
  {NpcId=10031025;StrId=201243;Pos=3;};
  {NpcId=1;StrId=201244;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,15};tm=500;};  
  {NpcId=10031025;StrId=201245;Pos=3;bCam=1;look={-15.96,9.07,1};eye={-17.14,-19.41,20};tm=500;};
  {NpcId=10031025;StrId=201246;Pos=3;bCam=1;look={-27.16,13.44,1};eye={-19.03,-18.28,20};tm=1500;Patrol={{npc=10031025,index=1}}};  
 }; 
 [201301]={
  {NpcId=10031101;StrId=201341;Pos=3;bCam=1;look={-91.86,43.55,1};eye={-3.8,-14.47,8.7};tm=500;};	 
  {NpcId=10031102;StrId=201342;Pos=3;}; 
  {NpcId=10031101;StrId=201343;Pos=3;};
  {NpcId=10031102;StrId=201344;Pos=3;};  
  {NpcId=10031101;StrId=201345;Pos=3;};
  {NpcId=10031102;StrId=201346;Pos=3;}; 
  {NpcId=10031101;StrId=201347;Pos=3;};  
 };
 
 [201601]={
  {NpcId=1;StrId=201641;Pos=4;}; 
 };
 
 [201701]={
  {NpcId=1;StrId=201741;Pos=4;}; 
 }; 
 [202101]={
  {NpcId=1;StrId=202141;Pos=4;}; 
 }; 
 [202201]={
  {NpcId=1;StrId=202241;Pos=4;}; 
 };  
 [203901]={
  {NpcId=1;StrId=203941;Pos=4;}; 
 }; 
 [204501]={
  {NpcId=10031115;StrId=204541;Pos=3;bCam=1;look={-41.76,-27.85,1};eye={-12.68,-21.62,17};tm=2000;}; 
  {NpcId=1;StrId=204542;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,15};tm=0;}; 
 };
	[204502] = {
	 {NpcId=10031115;StrId=204543;Pos=1;Delay=10;Patrol={{npc=10031115,index=1}}};
	};		 
 [204601]={
  {NpcId=1;StrId=204641;Pos=4;}; 
 };
 [204602]={
  {NpcId=1;StrId=204642;Pos=4;}; 
 }; 
 [204701]={
  {NpcId=10031114;StrId=204741;Pos=3;bCam=1;look={-23.45,-15.10,1};eye={-26.89,-5.72,21};tm=500;}; 
  {NpcId=10031114;StrId=204742;Pos=3;};
  {NpcId=1;StrId=204743;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,15};tm=0;};  
 };  
 
 [202801]={
  {NpcId=10031015;StrId=202841;Pos=3;bCam=1;look={18.74,-33.00,1};eye={-14.68,-14.53,17};tm=2000;}; 
  {NpcId=10031011;StrId=202842;Pos=3;bCam=1;look={3.93,-55.10,1};eye={-12.88,-16.32,17};tm=0;}; 
  {NpcId=1;StrId=202843;Pos=3;};  
 }; 
 
 [204101]={
  {NpcId=10031021;StrId=202941;Pos=3;bCam=1;look={11.4,-45.33,1};eye={-17.93,-13.5,20};tm=500;Patrol={{npc=10031021,index=1}};}; 
  {NpcId=1;StrId=202942;Pos=3;bCam=1;look={0,-1,1};eye={-7,-8,8};tm=0;};
  {NpcId=10031021;StrId=202943;Pos=3;bCam=1;look={11.4,-45.33,1};eye={-17.93,-13.5,20};tm=0;}; 
  {NpcId=1;StrId=202944;Pos=3;bCam=1;look={0,-1,1};eye={-7,-8,8};tm=0;}; 
		{NpcId=10031018;StrId=202945;Pos=3;bCam=1;look={12.2,-47.49,1};eye={12.7,-0.37,4.5};tm=500;Patrol={{npc=10031018,index=1}};}; 
  {NpcId=1;StrId=202946;Pos=3;bCam=1;look={0,-1,1};eye={-7,-8,8};tm=0;}; 
		{NpcId=10031018;StrId=202947;Pos=3;bCam=1;look={12.2,-47.49,1};eye={12.7,-0.37,4.5};tm=0;};  
 }; 
 
	[203101]=
	{
  {NpcId=1;StrId=203141;Pos=4;};
	}; 
	[203201]={
  {NpcId=10011011;StrId=203241;Pos=3;bCam=1;look={79.81,-46.12,2};eye={-14.14,3.3,6};tm=2000;}; 
  {NpcId=10031024;StrId=203242;Pos=3;}; 
  {NpcId=10011011;StrId=203243;Pos=3;};
  {NpcId=10031024;StrId=203244;Pos=3;}; 
  {NpcId=10011011;StrId=203245;Pos=3;}; 
  {NpcId=10031024;StrId=203246;Pos=3;bCam=1;look={80.11,-44.77,2};eye={-23.64,12.56,18};tm=1000;Patrol={{npc=10011011,index=4}};}; 
  {NpcId=10031014;StrId=203247;Pos=3;bCam=1;look={79.52,-41.79,2};eye={-13.74,-6.5,6};tm=0;}; 
  {NpcId=10031024;StrId=203248;Pos=3;}; 
  {NpcId=10031014;StrId=203249;Pos=3;}; 
  {NpcId=10031024;StrId=203250;Pos=3;}; 	  
	};
	[203202]=
	{
  {NpcId=1;StrId=203251;Pos=4;};
	};
	[203401]=
	{
  {NpcId=10031024;StrId=203441;Pos=3;bCam=1;look={80.17,-44.93,2};eye={-14.7,0,9};tm=0;};
  {NpcId=10031022;StrId=203442;Pos=3;bCam=1;look={57.28,-56.67,1};eye={-9.37,13.32,9};tm=0;};
  {NpcId=1;StrId=203443;Pos=3;};
  {NpcId=10031024;StrId=203444;Pos=3;bCam=1;look={80.17,-44.93,2};eye={-14.7,0,9};tm=0;};  
	};	
	[203402]=
	{
  {NpcId=10031015;StrId=203445;Pos=1;Delay=2000;};
  {NpcId=10031014;StrId=203446;Pos=1;Delay=2000;};
  {NpcId=10031015;StrId=203447;Pos=1;Delay=2000;};
  {NpcId=10031014;StrId=203448;Pos=1;Delay=2000;};  
	};		
	[203501]=
	{
  {NpcId=10031022;StrId=203541;Pos=1;Delay=10;};
	};	
		[203502]=
	{
  {NpcId=1;StrId=203542;Pos=4;};
	};
	
--镰
	[203801]={
  {NpcId=10021011;StrId=203841;Pos=3;bCam=1;look={-50.10,39.8,2};eye={-4.07,-15.08,8};tm=2000;};
  {NpcId=1;StrId=203845;Pos=3;bCam=1;look={-1,-1,1};eye={-8.63,-24.61,18};tm=1500;Patrol={{npc=107,index=1}}};
	};
--刀
	[203802]={
  {NpcId=10021011;StrId=203842;Pos=3;bCam=1;look={-53.58,40.23,2};eye={-2.6,-14.19,5};tm=2000;};
  {NpcId=1;StrId=203845;Pos=3;bCam=1;look={-1,-1,1};eye={-8.63,-24.61,18};tm=1500;Patrol={{npc=106,index=1}}};    
	};
--剑
	[203803]={
  {NpcId=10021011;StrId=203843;Pos=3;bCam=1;look={-56.54,40.30,2};eye={-7.08,-16.66,9};tm=2000;};
  {NpcId=1;StrId=203845;Pos=3;bCam=1;look={-1,-1,1};eye={-8.63,-24.61,18};tm=1500;Patrol={{npc=105,index=1}}};   
	};
--枪
	[203804]={
  {NpcId=10021011;StrId=203844;Pos=3;bCam=1;look={-59.23,40.36,2};eye={-5.42,-12.54,6};tm=2000;};
  {NpcId=1;StrId=203845;Pos=3;bCam=1;look={-1,-1,1};eye={-8.63,-24.61,18};tm=1500;Patrol={{npc=108,index=1}}};   
	};
	
	[300101]=
	{
  {NpcId=1;StrId=300141;Pos=4;};
	};
	[300201]=
	{
  {NpcId=1;StrId=300241;Pos=4;};	 
	};
	[300202]=
	{
  {NpcId=1;StrId=300242;Pos=4;};	 
	};	
	[300601]=
	{
  {NpcId=10041004;StrId=300641;Pos=3;bCam=1;look={-86.18,-53.32,1};eye={-15.53,-20.1,20};tm=0;};
  {NpcId=1;StrId=300642;Pos=3;};	
  {NpcId=10041004;StrId=300643;Pos=3;};	
  {NpcId=10041004;StrId=300644;Pos=3;};	
  {NpcId=1;StrId=300645;Pos=3;};	  
	};	
	[303801]=
	{
  {NpcId=1;StrId=303841;Pos=4;};	 	 
	};
	[303802]=
	{
  {NpcId=10041010;StrId=303842;Pos=1;Delay=500;};	 	 
	};	
	[301701]=
	{
		{NpcId=10041003;StrId=301741;Pos=3;bCam=1;look={81.36,69.76,1};eye={-15.18,4.37,9};tm=0;};
  {NpcId=1;StrId=301742;Pos=3;};	
  {NpcId=10041003;StrId=301743;Pos=3;};		
  {NpcId=10041003;StrId=301744;Pos=3;};		  
	};	
 [301901]=
 {
  {NpcId=10041011;StrId=301941;Pos=1;Delay=10;};	
  {NpcId=10041010;StrId=301942;Pos=1;Delay=1500;};	   
 };
 [301902]=
 {
  {NpcId=10041095;StrId=301943;Pos=3;bCam=1;look={73.61,-15.68,1};eye={-13.2,-23.85,19};tm=500;};	
  {NpcId=10041013;StrId=301944;Pos=3;mNpcId=10041013;NAID=1004101713;};
  {NpcId=10041095;StrId=301945;Pos=3;mNpcId=10041095;NAID=1001101113;};	
  {NpcId=10041013;StrId=301946;Pos=3;mNpcId=10041013;NAID=1004101715;bNAStop=1;}; 
  {NpcId=10041095;StrId=301947;Pos=3;mNpcId=10041095;NAID=1001101180;bNAStop=1;};  
 };
 [302001]=
 {
  {NpcId=1;StrId=302041;Pos=4;};	 
 };
 [302101]=
 {
  {NpcId=10041018;StrId=302141;Pos=1;Delay=10;};	
  {NpcId=10041016;StrId=302142;Pos=1;Delay=1000;};  
 };
 [302201]=
 {
  {NpcId=1;StrId=302241;Pos=4;};	 
 };
 [302202]=
 {
  {NpcId=10041018;StrId=302242;Pos=1;Delay=500;};	
	};
 [302301]=
 {
  {NpcId=1;StrId=302341;Pos=4;};	 
 };		
	[302501]=
	{
		{NpcId=10041001;StrId=302541;Pos=3;bCam=1;look={-102.84,-64.60,1};eye={-24.74,-13.54,15};tm=0;};
  {NpcId=1;StrId=302542;Pos=3;};	
  {NpcId=10041012;StrId=302543;Pos=3;};		
  {NpcId=1;StrId=302544;Pos=3;}; 
  {NpcId=10041012;StrId=302545;Pos=3;};
	};	 
 [302601]=
	{
  {NpcId=1;StrId=302641;Pos=4;};	 
	};		
	[302801]=
	{
  {NpcId=1;StrId=302841;Pos=3;};	 
	};		 
 [302901]=
 {
  {NpcId=10041005;StrId=302941;Pos=3;bCam=1;look={-82,66.5,3};eye={-13.9,-20.9,20};tm=500;};	
  {NpcId=10041020;StrId=302942;Pos=3;bCam=1;look={-83.23,77.41,3};eye={-16.7,-17.94,20};tm=500;};  
  {NpcId=10041012;StrId=302943;Pos=3;};  
  {NpcId=10041020;StrId=302945;Pos=3;};
  {NpcId=10041013;StrId=302946;Pos=3;};
  {NpcId=10041003;StrId=302947;Pos=3;};
  {NpcId=10041020;StrId=302948;Pos=3;};  
 }; 
 [302902]=
 {
  {NpcId=1;StrId=302949;Pos=4;};	 
 };	 
 [303001]=
 {
  {NpcId=10041012;StrId=303041;Pos=1;Delay=10;};	
  {NpcId=10041013;StrId=303042;Pos=1;Delay=2000;};
  {NpcId=10041012;StrId=303043;Pos=1;Delay=2000;};	  
 };
 [303002]=
 {
  {NpcId=1;StrId=303044;Pos=4;};  
 }; 
 [303003]=
 {
  {NpcId=1;StrId=303045;Pos=4;};  
 }; 
 [303101]=
 {
  {NpcId=10041005;StrId=303141;Pos=1;Delay=500;};	
  {NpcId=10041020;StrId=303142;Pos=1;Delay=2000;};  
 };  
 [303102]=
 {
  {NpcId=1;StrId=303143;Pos=4;};  
 };  
 [303901]=
 {
  {NpcId=10041020;StrId=303941;Pos=1;Delay=10;};	
  {NpcId=10041098;StrId=303942;Pos=1;Delay=2000;Patrol={{npc=10041098,index=3}};};  
 }; 
	[303902]=
	{
  {NpcId=10041098;StrId=303944;Pos=3;bCam=1;look={-58.34,77.81,1};eye={-6.05,-21.17,23};tm=500;Patrol={{npc=10041098,index=1}};};	
  {NpcId=1;StrId=303945;Pos=3;};	   
  {NpcId=10041098;StrId=303946;Pos=3;Patrol={{npc=10041098,index=2}};};	  
  {NpcId=1;StrId=303947;Pos=3;};		  
	};	
	
 [303201]=
 {
  {NpcId=1;StrId=303241;Pos=4;};  
 };	
 [303202]=
 {
  {NpcId=10041020;StrId=303242;Pos=1;Delay=10;};	
  {NpcId=10041097;StrId=303243;Pos=1;Delay=2000;};
  {NpcId=10041020;StrId=303244;Pos=1;Delay=3000;};	
  {NpcId=10041097;StrId=303245;Pos=1;Delay=3000;Patrol={{npc=10041097,index=1}};};  
 }; 
 
	[303301]=
	{
		{NpcId=1;StrId=303341;Pos=3;bCam=1;look={0,-1,1};eye={-7,-8,8};tm=0;};
  {NpcId=10041018;StrId=303342;Pos=3;};	
  {NpcId=1;StrId=303343;Pos=3;};		
  {NpcId=10041018;StrId=303344;Pos=3;};  
	};	
	[303401]=
	{
		{NpcId=10041096;StrId=303441;Pos=1;Delay=10;};
  {NpcId=10041020;StrId=303442;Pos=1;Delay=2000;};	
  {NpcId=10041096;StrId=303443;Pos=1;Delay=2000;};		
  {NpcId=10041020;StrId=303444;Pos=1;Delay=2500;};  
	};		
 [303402]=
 {
  {NpcId=1;StrId=303445;Pos=4;};  
 };	
 [303403]=
 {
		{NpcId=10011011;StrId=303446;Pos=3;bCam=1;look={-81.9,72.66,1};eye={-14.9,5.96,6.6};tm=0;};
  {NpcId=10041020;StrId=303447;Pos=3;};	
  {NpcId=10011011;StrId=303448;Pos=3;};		
  {NpcId=10041020;StrId=303449;Pos=3;};  
 };
 [303501]=
 {
  {NpcId=1;StrId=303541;Pos=4;};  
 };
 [303601]=
 {
  {NpcId=1;StrId=303641;Pos=4;};  
 };
	[303602]=
	{
		{NpcId=10011011;StrId=303642;Pos=3;bCam=1;look={-17.13,-4.89,1};eye={-3.56,-29.4,20};tm=0;};
  {NpcId=10011011;StrId=303643;Pos=3;};	 
  {NpcId=10011011;StrId=303646;Pos=3;};
  {NpcId=10011011;StrId=303647;Pos=3;};  
	};	
 [303603]=
 {
  {NpcId=1;StrId=303648;Pos=4;};  
 };	
 [303604]=
 {
  {NpcId=1;StrId=303649;Pos=4;};  
 };	 
	[303605]=
	{
		{NpcId=10041021;StrId=303650;Pos=3;bCam=1;look={-17.13,-4.89,1};eye={-3.56,-29.4,20};tm=0;};
  {NpcId=1;StrId=303651;Pos=3;};	
  {NpcId=10041021;StrId=303652;Pos=3;};		
  {NpcId=1;StrId=303653;Pos=3;}; 
	};	
 [304101]=
 {
  {NpcId=10041001;StrId=304141;Pos=1;Delay=1000;};  
 };	 	
 [304102]=
 {
  {NpcId=1;StrId=304142;Pos=4;};  
 };	
	[303701]=
	{
		{NpcId=10051098;StrId=303741;Pos=3;bCam=1;look={-48.13,-13.43,1};eye={-24.74,-13.92,20};tm=0;};
  {NpcId=10051097;StrId=303742;Pos=3;};	
  {NpcId=10051098;StrId=303743;Pos=3;};		
  {NpcId=10051096;StrId=303744;Pos=3;}; 
  {NpcId=10051098;StrId=303745;Pos=3;Patrol={{npc=10051098,index=1},{npc=10051097,index=1},{npc=10051096,index=1},{npc=10051090,index=1},{npc=10051091,index=1},{npc=10051092,index=1},{npc=10051093,index=1},{npc=10051094,index=1},{npc=10051095,index=1}};};  
	};	 
 [303702]=
 {
  {NpcId=1;StrId=303746;Pos=4;};  
 };	
 [304201]=
 {
  {NpcId=10051004;StrId=303747;Pos=1;Delay=500;};  
 };	 
 [400501]=
 {
  {NpcId=1;StrId=400541;Pos=4;};  
 };	  
 [400601]=
 {
  {NpcId=1;StrId=400641;Pos=4;};  
 };	
 [401001]=
 {
  {NpcId=1;StrId=401041;Pos=4;};  
 };	 
 [401002]=
 {
  {NpcId=1;StrId=401042;Pos=4;};  
 };	 
 [401101]=
 {
  {NpcId=1;StrId=401141;Pos=4;};  
 };	
	[401301]=
	{
		{NpcId=10051003;StrId=401341;Pos=3;bCam=1;look={37.05,27.29,3};eye={3.6,-18,10};tm=0;};
  {NpcId=10051003;StrId=401342;Pos=3;};	
  {NpcId=10051003;StrId=401343;Pos=3;};		
  {NpcId=1;StrId=401344;Pos=3;};
  {NpcId=10051003;StrId=401345;Pos=3;};  
	};	 
 [401401]=
 {
  {NpcId=1;StrId=401441;Pos=4;};  
 };		
 [401601]=
 {
  {NpcId=1;StrId=401641;Pos=4;};  
 };	
 [401901]=
 {
  {NpcId=1;StrId=401941;Pos=4;};  
 };	
	[402201]=
	{
		{NpcId=10051005;StrId=402241;Pos=3;bCam=1;look={-17.92,-52.66,1};eye={14.6,17.55,17};tm=0;};
  {NpcId=10051010;StrId=402242;Pos=3;};	 
	};	
 [402202]=
 {
  {NpcId=1;StrId=402243;Pos=4;};  
 };	
 [4037]=
 {
 	{look={32.79,-9.03,1};eye={-3.4,-31.35,12};tm=500;last=36000;Force=1;}; 
	}; 
 [403701]=
 {
  {NpcId=10051002;StrId=403741;Pos=1;Delay=10;};	
  {NpcId=10051005;StrId=403742;Pos=1;Delay=1500;};
  {NpcId=10051002;StrId=403743;Pos=1;Delay=2000;};
  {NpcId=10051010;StrId=403744;Pos=1;Delay=3000;};
  {NpcId=10051002;StrId=403745;Pos=1;Delay=2500;};
  {NpcId=10051002;StrId=403746;Pos=1;Delay=2500;};
  {NpcId=10051005;StrId=403747;Pos=1;Delay=3000;};
  {NpcId=10051002;StrId=403748;Pos=1;Delay=2500;};
  {NpcId=10051005;StrId=403749;Pos=1;Delay=2500;};
  {NpcId=10051002;StrId=403750;Pos=1;Delay=2500;};
  {NpcId=10051005;StrId=403751;Pos=1;Delay=2500;};
  {NpcId=10051002;StrId=403752;Pos=1;Delay=2500;};  
 }; 
	[402401]=
	{
		{NpcId=10051005;StrId=402441;Pos=3;bCam=1;look={-36.8,39.14,1};eye={-15.44,-14.42,10};tm=500;};
  {NpcId=10051014;StrId=402442;Pos=3;bCam=1;look={-11.46,41.39,1};eye={-16.56,-21.03,20};tm=500;};	
  {NpcId=10051015;StrId=402443;Pos=3;};		
  {NpcId=10051014;StrId=402444;Pos=3;}; 
	};	 
 [402801]=
 {
  {NpcId=1;StrId=402841;Pos=4;};  
 };	
	[402901]=
	{
		{NpcId=10051007;StrId=402941;Pos=3;bCam=1;look={7.33,1.71,1};eye={-10.56,-6.3,4};tm=0;}; 
	};	
 [4032]=
 {
 	{look={8.7,8.8,1};eye={-24.49,-2.3,10};tm=500;last=30000;Force=1;}; 	
 };  
 [403201]=
 {
  {NpcId=10051013;StrId=403241;Pos=1;Delay=10;};	
  {NpcId=10051012;StrId=403242;Pos=1;Delay=3000;};
  {NpcId=10051013;StrId=403243;Pos=1;Delay=2000;};
  {NpcId=10051012;StrId=403244;Pos=1;Delay=3000;};
  {NpcId=10051013;StrId=403245;Pos=1;Delay=2000;};
  {NpcId=10051009;StrId=403247;Pos=1;Delay=2000;};
  {NpcId=10051012;StrId=403248;Pos=1;Delay=2500;};
  {NpcId=10051009;StrId=403249;Pos=1;Delay=2000;};
  {NpcId=10051012;StrId=403250;Pos=1;Delay=2500;};
  {NpcId=10051009;StrId=403259;Pos=1;Delay=2000;};
  {NpcId=10051012;StrId=403251;Pos=1;Delay=2000;};  
 };
	[403202]=
	{
		{NpcId=10051011;StrId=403252;Pos=3;bCam=1;look={6.41,18.13,1};eye={-7.7,-8.5,4};tm=0;};
  {NpcId=10051009;StrId=403253;Pos=3;bCam=1;look={10.22,12.69,1};eye={-7.8,-8.5,4};tm=0;};	
  {NpcId=10051012;StrId=403254;Pos=3;bCam=1;look={7.33,1.71,1};eye={-10.56,-6.3,4};tm=0;};	
  {NpcId=10051013;StrId=403255;Pos=3;bCam=1;look={11.82,9.03,1};eye={-10.7,-6.2,4};tm=0;};
  {NpcId=10051009;StrId=403256;Pos=3;bCam=1;look={10.22,12.69,1};eye={-7.8,-8.5,4};tm=0;};	
  {NpcId=10051013;StrId=403257;Pos=3;bCam=1;look={11.82,9.03,1};eye={-10.7,-6.2,4};tm=0;};	
  {NpcId=1;StrId=403258;Pos=3;bCam=1;look={0,-1,1};eye={8.5,9.7,4};tm=0;};  
	};	
	[403401]=
	{
	 {NpcId=10051085;StrId=403441;Pos=3;bCam=1;look={-9.68,18.29,1};eye={-13.15,-17.14,15};tm=1000;};
	 {NpcId=10051018;StrId=403442;Pos=3;bCam=1;look={-7.96,12.56,1};eye={-6.64,-28.25,15};tm=500;Patrol={{npc=10051018,index=1},{npc=10051019,index=1},{npc=10051011,index=1}};};
	 {NpcId=10051020;StrId=403443;Pos=3;bCam=1;look={-9.68,18.29,1};eye={-13.15,-17.14,15};tm=500;Patrol={{npc=10051020,index=1},{npc=10051017,index=1}};};
	 {NpcId=10051017;StrId=403444;Pos=3;};
	 {NpcId=10051018;StrId=403445;Pos=3;bCam=1;look={-8.16,13.03,1};eye={-5.75,-33.79,15};tm=0;};
	 {NpcId=10051019;StrId=403446;Pos=3;};
	 {NpcId=10051017;StrId=403447;Pos=3;};
	 {NpcId=10051019;StrId=403448;Pos=3;};
	 {NpcId=10051011;StrId=403449;Pos=3;};	 
	};	
	[403501]=
	{
	 {NpcId=10051088;StrId=403542;Pos=3;};
	 {NpcId=10051088;StrId=403543;Pos=3;bCam=1;look={-8.36,-4.87,1};eye={-12.59,-26.67,20};tm=500;};	 
	};			
	[403601]=
	{
	 {NpcId=10051020;StrId=403641;Pos=3;bCam=1;look={-9.60,13.06,1};eye={-21.31,-20.15,15};tm=500;};
	 {NpcId=10051017;StrId=403642;Pos=3;};
	 {NpcId=1;StrId=403643;Pos=3;};
	};		
	[403801]=
	{
	 {NpcId=10051011;StrId=403841;Pos=3;bCam=1;look={-9.78,3.00,1};eye={-16.12,-20.34,19};tm=500;Patrol={{npc=10051011,index=2},{npc=10051018,index=2},{npc=10051019,index=2}};};
	 {NpcId=10051018;StrId=403842;Pos=3;};
	 {NpcId=10051017;StrId=403843;Pos=3;};
	 {NpcId=10051019;StrId=403844;Pos=3;};
	 {NpcId=10051017;StrId=403845;Pos=3;mNpcId=10051017;NAID=1005200613;};
	};	
	[403901]=
	{
	 {NpcId=10051017;StrId=403941;Pos=3;bCam=1;look={-9.78,3.00,1};eye={-16.12,-20.34,19};tm=500;};
	 {NpcId=1;StrId=403942;Pos=3;};
	 {NpcId=10051017;StrId=403943;Pos=3;};
	 {NpcId=1;StrId=403944;Pos=3;};
	};		
	[404101]=
	{
	 {NpcId=10061024;StrId=404141;Pos=1;Delay=10;};
		{NpcId=10061025;StrId=404142;Pos=1;Delay=2000;};	  
	};
	[500101]=
	{
	 {NpcId=1;StrId=500141;Pos=4;};	 
	};
	[500201]=
	{
	 {NpcId=1;StrId=500241;Pos=4;};	 
	};	
	[500202]=
	{
	 {NpcId=10061016;StrId=500242;Pos=1;Delay=10;};	 
	};		
	[500301]=
	{
	 {NpcId=10061102;StrId=500341;Pos=3;bCam=1;look={-77,70,1};eye={-9.6,-10.7,10};tm=1500;};
	 {NpcId=10061101;StrId=500342;Pos=3;};
	 {NpcId=1;StrId=500343;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,10};tm=0;};
	 {NpcId=10061102;StrId=500344;Pos=3;bCam=1;look={-77,70,1};eye={-9.6,-10.7,10};tm=0;};
	 {NpcId=1;StrId=500345;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,10};tm=0;};
	 {NpcId=10061101;StrId=500346;Pos=3;bCam=1;look={-77,70,1};eye={-19,-14,13};tm=1000;Patrol={{npc=10061102,index=2},{npc=10061101,index=2}}};	
	 {NpcId=10061017;StrId=500347;Pos=3;bCam=1;look={-78,78,1};eye={-7.9,-28.44,13};tm=1000;};	 
	};
	
	[500401]=
	{
	 {NpcId=10061018;StrId=500441;Pos=3;bCam=1;look={-73.74,78.27,1};eye={-12.6,-12.8,10};tm=500;};
	 {NpcId=1;StrId=500442;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,10};tm=0;};
	 {NpcId=10061017;StrId=500443;Pos=3;bCam=1;look={-78.64,79.36,1};eye={-8.81,-16.05,10};tm=1000;};
	 {NpcId=10061018;StrId=500444;Pos=3;};
	 {NpcId=1;StrId=500445;Pos=3;};	 
	};		
	[505201]=
	{
	 {NpcId=10061009;StrId=505241;Pos=1;Delay=10;};
	 {NpcId=10061028;StrId=505242;Pos=1;Delay=3000;};
	 {NpcId=10061010;StrId=505243;Pos=1;Delay=3000;};	 
	};	
	[500501]=
	{
	 {NpcId=1;StrId=500541;Pos=4;};	 
	};	
	[505301]=
	{
	 {NpcId=10061101;StrId=505341;Pos=3;bCam=1;look={-21.66,95.28,1};eye={-8.05,-15.18,12};tm=1000;};
	 {NpcId=10061029;StrId=505342;Pos=3;};	 
	 {NpcId=10061101;StrId=505343;Pos=3;}; 
	 {NpcId=1;StrId=505344;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,10};tm=0;};
	 {NpcId=10061029;StrId=505345;Pos=3;bCam=1;look={-21.66,95.28,1};eye={-8.05,-15.18,10};tm=0;};
	 {NpcId=10061101;StrId=505346;Pos=3;};	
	 {NpcId=10061029;StrId=505347;Pos=3;};		 
	};	
	[505302]=
	{
	 {NpcId=10061118;StrId=505348;Pos=1;Delay=10;Patrol={{npc=10061118,index=1},{npc=10061101,index=2}}};
	 {NpcId=10061101;StrId=505349;Pos=1;Delay=2000;};
	};	
	[501001]=
	{
	 {NpcId=1;StrId=501041;Pos=4;};	 
	};		
	[501101]=
	{
	 {NpcId=10061004;StrId=501141;Pos=3;bCam=1;look={-60.24,62,1};eye={-22.88,-8.57,18};tm=0;};
	 {NpcId=1;StrId=501142;Pos=3;};
	 {NpcId=10061004;StrId=501143;Pos=3;};
	 {NpcId=10061018;StrId=501144;Pos=3;bCam=1;look={-72.94,57.11,6};eye={-23.94,-8.1,18};tm=500;mNpcId=10061012;NAID=1008200280;};
	 {NpcId=10061004;StrId=501145;Pos=3;bCam=1;look={-58.33,63.51,1};eye={-16.97,-3.77,10};tm=500;mNpcId=10061004;NAID=1002101981;bNAStop=1;};	
	 {NpcId=10061017;StrId=501146;Pos=3;bCam=1;look={-60.24,62,1};eye={-22.88,-8.57,18};tm=0;mNpcId=10061004;NAID=1002101980;bNAStop=1;};	
	};
	[501301]=
	{
	 {NpcId=10061115;StrId=501341;Pos=3;bCam=1;look={53.64,104.81,1};eye={-6.28,-17.81,14};tm=0;};
	 {NpcId=10061018;StrId=501342;Pos=3;bCam=1;look={51.77,99.42,1};eye={-8.25,-22.57,21};tm=1000;Patrol={{npc=10061018,index=2}}};
	 {NpcId=10061115;StrId=501343;Pos=3;Patrol={{npc=10061115,index=1}}};
	 {NpcId=10061018;StrId=501344;Pos=3;Patrol={{npc=10061018,index=3}}};	 
	};	
	[501302]=
	{
	 {NpcId=1;StrId=501345;Pos=4;};	 
	};
	[501303]=
	{
	 {NpcId=10061115;StrId=501346;Pos=1;Delay=10;Patrol={{npc=10061115,index=2}}};	 
	};	
	[501401]=
	{
	 {NpcId=10061017;StrId=501441;Pos=3;bCam=1;look={14.55,95.6,1};eye={-16.26,-8.6,11};tm=1000;};
	 {NpcId=10061012;StrId=501442;Pos=3;};
	 {NpcId=10061017;StrId=501443;Pos=3;mNpcId=10061017;NAID=500013;};
	 {NpcId=10061013;StrId=501444;Pos=3;mNpcId=10061013;NAID=1008200280;};
	 {NpcId=10061012;StrId=501445;Pos=3;mNpcId=10061012;NAID=1008200280;};	
	 {NpcId=10061013;StrId=501446;Pos=3;mNpcId=10061017;NAID=500015;bNAStop=1;};	
	 {NpcId=10061030;StrId=501447;Pos=3;bCam=1;look={32.14,93.54,1};eye={-29.57,-8.6,16};tm=3000;};
	 {NpcId=10061031;StrId=501448;Pos=3;};
	};
	[501501]=
	{
	 {NpcId=1;StrId=501541;Pos=4;};	 
	};		
	-- [501502]=
	-- {
	 -- {look={0.88,-6.9,1};eye={-14.99,-15.57,10};tm=500;last=3000;Force=1;};	 
	-- };
	[501502]=
	{
	 {NpcId=10061116;StrId=501346;Pos=1;Delay=10;Patrol={{npc=10061116,index=1}}};	 
	};			
	[501503]=
	{
	 {NpcId=10061116;StrId=501542;Pos=3;bCam=1;look={-2.29,-19.87,1};eye={-13.91,-20.15,22};tm=500;};
	 {NpcId=1;StrId=501543;Pos=3;};	 
	};		
	[501601]=
	{
	 {NpcId=1;StrId=501641;Pos=4;};	 
	};		
	[505401]=
	{
	 {NpcId=10061101;StrId=505441;Pos=3;bCam=1;look={24.83,62.88,1};eye={-16.74,-16.74,24};tm=500;};
	 {NpcId=10061103;StrId=505442;Pos=3;};
	 {NpcId=1;StrId=505443;Pos=3;bCam=1;look={-1,-3,3};eye={-9,-12,15};tm=1000;};
	 {NpcId=10061018;StrId=505444;Pos=3;Patrol={{npc=10061018,index=1}}};
	 {NpcId=1;StrId=505445;Pos=3;};	 
	};		
	[502101]=
	{
	 {NpcId=1;StrId=502141;Pos=4;};	 
	};		
	[502201]=
	{
	 {NpcId=1;StrId=502241;Pos=4;};	 
	};
	[502202]=
	{
	 {NpcId=10061031;StrId=502242;Pos=3;bCam=1;look={85,2.6,2};eye={-12,-12,10};tm=500;};
	 {NpcId=1;StrId=502243;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,10};tm=0;};	
	 {NpcId=10061031;StrId=502244;Pos=3;bCam=1;look={85,2.6,2};eye={-12,-12,10};tm=0;Patrol={{npc=10061031,index=1}}};		 
	};
	[502203]=
	{
	 {NpcId=1;StrId=502245;Pos=4;};	 
	};	
	[502301]=
	{
	 {NpcId=1;StrId=502341;Pos=4;};	 
	};		
	[502401]=
	{
	 {look={53.7,-48,1};eye={-6,-9.4,10};StrId=502441;tm=500;last=5000;};	 
	};			
	[502601] = {
	 {NpcId=10061002;StrId=502641;Pos=1;Delay=10;Patrol={{npc=10061002,index=1}}};
	 {NpcId=10061002;StrId=502642;Pos=1;Delay=4000;};	 	 
	};			
	[502602]=
	{
	 {NpcId=1;StrId=502643;Pos=3;};	
	 {NpcId=10061015;StrId=502644;Pos=3;bCam=1;look={56.62,-37.56,1};eye={-11,-9.7,7};tm=500;}; 
	};	
	[502701] = {
	 {NpcId=10061015;StrId=502741;Pos=1;Delay=10;Patrol={{npc=10061002,index=2}}}; 	 
	 {NpcId=10061023;StrId=502742;Pos=1;Delay=1500;Patrol={{npc=10061023,index=1}}};	
	 {NpcId=10061002;StrId=502744;Pos=1;Delay=3000;};
	 {NpcId=10061023;StrId=502745;Pos=1;Delay=3000;};
	 {NpcId=10061002;StrId=502746;Pos=1;Delay=3000;};
	 {NpcId=10061023;StrId=502747;Pos=1;Delay=3000;};
	 {NpcId=10061002;StrId=502748;Pos=1;Delay=3000;};
	 {NpcId=10061023;StrId=502749;Pos=1;Delay=3000;};	 
	};
	[510101]={
	 {NpcId=10061034;StrId=510141;Pos=3;bCam=1;look={2.44,-21.95,1};eye={-12.9,-12.9,13};tm=500;};
	 {NpcId=1;StrId=510142;Pos=3;};		 
	 {NpcId=10061034;StrId=510143;Pos=3;};	
	};
	[510201]=
	{
	 {NpcId=1;StrId=510241;Pos=4;};	
	};	
	[510301]={
	 {NpcId=10061002;StrId=510341;Pos=3;bCam=1;look={58.1,-50.41,1};eye={-25.67,-7.5,19};tm=500;Patrol={{npc=10061002,index=1}}};
	 {NpcId=10061002;StrId=510342;Pos=3;};		 
	 {NpcId=10061002;StrId=510443;Pos=3;};	
	};	
	[502801] = {
	 {NpcId=10061033;StrId=502840;Pos=1;Delay=10;Patrol={{npc=10061033,index=1}}};	 --{NpcId=10061002;StrId=502846;Pos=1;Delay=3000;Patrol={{npc=10061002,index=3}}}; 
		{NpcId=10061002;StrId=502846;Pos=1;Delay=3000;}	 
	};	
	[502802] = {
	 {NpcId=10061015;StrId=502842;Pos=1;Delay=10;Patrol={{npc=10061015,index=1}}}; 	 
	};	
	[502901] = {
	 {NpcId=10061101;StrId=502941;Pos=1;Delay=10;Patrol={{npc=10061101,index=3},{npc=10061103,index=1}}}; 
		{NpcId=10061103;StrId=502942;Pos=1;Delay=3000;};	 
		{NpcId=10061101;StrId=502943;Pos=1;Delay=3000;}; 
		{NpcId=10061103;StrId=502944;Pos=1;Delay=3000;};	 
		{NpcId=10061101;StrId=502945;Pos=1;Delay=3000;};	
		{NpcId=10061103;StrId=502946;Pos=1;Delay=3000;};	 		
	};		
	[503001]={
	 {NpcId=10061005;StrId=503442;Pos=3;bCam=1;look={-10.36,1.9,1};eye={-21.7,-17,15};tm=500;};
	 {NpcId=10061102;StrId=503443;Pos=3;};
	 {NpcId=10061005;StrId=503444;Pos=3;};
	 {NpcId=10061102;StrId=503445;Pos=3;};		
	};
	
	[503101] = {
	 {NpcId=10061005;StrId=503141;Pos=1;Delay=10;Patrol={{npc=10061005,index=1}}}; 	 
	};	
	
	[503401]=
	{
	 {NpcId=10061103;StrId=503441;Pos=3;bCam=1;look={4.96,22.8,1};eye={-18.46,-9.6,15};tm=500;};
	 {NpcId=10061102;StrId=503442;Pos=3;};
	 {NpcId=10061103;StrId=503443;Pos=3;};
	 {NpcId=10061102;StrId=503444;Pos=3;};
	 {NpcId=10061103;StrId=503445;Pos=3;};	
	 {NpcId=1;StrId=503446;Pos=3;bCam=1;look={0,-1,1};eye={-9,-10,15};tm=500;};
	};	
	[503402]=
	{
	 {NpcId=1;StrId=503448;Pos=4;};	
	};
	[503501]=
	{
	 {NpcId=1;StrId=503541;Pos=4;};	
	};	
	[503601]=
	{
	 {NpcId=1;StrId=503641;Pos=4;};	 
	};	

	[503801] = {
	 {NpcId=10061006;StrId=503841;Pos=1;Delay=10;Patrol={{npc=10061006,index=1}}};
	 {NpcId=10061007;StrId=503842;Pos=1;Delay=3000;}; 	 
	};

	[504001]=
	{
	 {NpcId=10061020;StrId=504041;Pos=3;bCam=1;look={-10.28,-10.36,1};eye={-14,-22,19};tm=500;Patrol={{npc=10061020,index=1}}};
	 {NpcId=10061006;StrId=504042;Pos=3;bCam=1;look={-9.09,-3.8,1};eye={0.56,-27.87,19};tm=0;};
	 {NpcId=10061020;StrId=504043;Pos=3;};
	 {NpcId=10061007;StrId=504044;Pos=3;};
	 {NpcId=10061020;StrId=504045;Pos=3;Patrol={{npc=10061020,index=2},{npc=10061006,index=2}}};
	 {NpcId=10061007;StrId=504047;Pos=3;};
	 {NpcId=10061020;StrId=504048;Pos=3;mNpcId=10061020;NAID=50302014020;};	
	 {NpcId=10061007;StrId=504049;Pos=3;mNpcId=10061006;NAID=1006200615;bNAStop=1;};
	 {NpcId=10061020;StrId=504050;Pos=3;};		 
	};		

	-- [504002]=
	-- {
	 -- {NpcId=1;StrId=504046;Pos=4;};	 
	-- };		

	[504101] = {
	 {NpcId=10061020;StrId=504151;Pos=1;Delay=10;};	 
	};
	
	[504102]=
	{
	 {NpcId=10061021;StrId=504141;Pos=3;bCam=1;look={-4.89,-59.78,1};eye={-15.43,-23.94,21};tm=500;Patrol={{npc=10061021,index=1}}};
	 {NpcId=10061020;StrId=504142;Pos=3;mNpcId=10061020;NAID=5030201414;};
	 {NpcId=10061021;StrId=504143;Pos=3;};
	 {NpcId=10061020;StrId=504144;Pos=3;mNpcId=10061021;NAID=50302007040;Patrol={{npc=10061020,index=3}};bCam=1;look={-4.17,-60.63,1};eye={-12.71,-20.91,17};tm=100;};	 
	 {NpcId=10061020;StrId=504145;Pos=3;mNpcId=10061020;NAID=5030201414;bNAStop=1;};
	 {NpcId=10061021;StrId=504146;Pos=3;};
	 {NpcId=10061020;StrId=504147;Pos=3;};
	 {NpcId=10061021;StrId=504148;Pos=3;};
	 {NpcId=10061020;StrId=504149;Pos=3;mNpcId=10061020;NAID=5030201415;bNAStop=1;};
	 {NpcId=10061021;StrId=504150;Pos=3;};	 
	};	
	
	[504201]=
	{
	 {NpcId=1;StrId=504241;Pos=4;};	 
	};	

	[504202]=
	{
	 {NpcId=10061021;StrId=504242;Pos=1;Delay=10;};	
	};		
	
		[504301]=
	{
	 {NpcId=10061021;StrId=504341;Pos=3;bCam=1;look={-14.7,60.3,1};eye={-15.68,-26,20};tm=500;Patrol={{npc=10061021,index=2}};};
	 {NpcId=10061022;StrId=504342;Pos=3;};
	 {NpcId=10061021;StrId=504343;Pos=3;};
	 {NpcId=10061022;StrId=504344;Pos=3;};
	 {NpcId=10061021;StrId=504345;Pos=3;};
	 {NpcId=10061022;StrId=504346;Pos=3;};
	 {NpcId=1;StrId=504347;Pos=3;};		 
	};		
	
	[504401]=
	{
	 {look={-12,60,1};eye={-13.18,-28.23,17};tm=1000;StrId=504441;last=9999;};
	 {look={-12,60,1};eye={-13.18,-28.23,17};tm=0;StrId=504442;last=9999;};
	 {look={-12,60,1};eye={-13.18,-28.23,17};tm=0;StrId=504443;last=9999;};
	 {look={-12,60,1};eye={-13.18,-28.23,17};tm=0;StrId=504444;last=9999;};	 
	 {look={-22,60,1};eye={-17.67,-25.46,18};tm=4000;StrId=504445;last=9999;};
	};		
	
	[504701]=
	{
	 {NpcId=1;StrId=504741;Pos=4;};	 
	};		
	
	[505101]=
	{
	 {NpcId=1;StrId=505141;Pos=4;};	 
	};		

		[600101]=
	{
	 {NpcId=10071015;StrId=600141;Pos=3;bCam=1;look={-91.79,-13.15,1};eye={-19.63,-18.35,20};tm=500;};
	 {NpcId=10071099;StrId=600142;Pos=3;};
	 {NpcId=10071015;StrId=600143;Pos=3;};
	 {NpcId=10071099;StrId=600144;Pos=3;};	 
	};	

	[600201]=
	{
	 {NpcId=10071015;StrId=600241;Pos=1;Delay=10;};
	 {NpcId=10071095;StrId=600242;Pos=1;Delay=3000;};	 
	};			
	[600601]=
	{
	 {NpcId=10071018;StrId=600641;Pos=3;bCam=1;look={-104.79,-11.3,1};eye={6.38,-23.22,15};tm=1500;};
	 {NpcId=10071019;StrId=600642;Pos=3;};
	 {NpcId=10071018;StrId=600643;Pos=3;};
	 {NpcId=10071019;StrId=600644;Pos=3;};	
	};	
	[600701]=
	{
	 {NpcId=10071015;StrId=600745;Pos=1;Delay=10;Patrol={{npc=10071015,index=1}}};
	};		
	[600702]=
	{
	 {NpcId=10071005;StrId=600741;Pos=1;Delay=10;};
	 {NpcId=10071015;StrId=600742;Pos=1;Delay=3000;};	
	 {NpcId=10071005;StrId=600743;Pos=1;Delay=3000;};	
	 {NpcId=10071015;StrId=600744;Pos=1;Delay=3000;};		 
	};		
	[600901]=
	{
	 {NpcId=10071005;StrId=600941;Pos=1;Delay=10;};
	 {NpcId=10071098;StrId=600942;Pos=1;Delay=3000;};	 
	};		
	[601001]=
	{
	 {NpcId=1;StrId=601041;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=500;};
	 {NpcId=10071029;StrId=601042;Pos=3;bCam=1;look={-38.96,-35.37,1};eye={-19.69,-14.8,18};tm=3000;Patrol={{npc=10071029,index=1}}};
	 {NpcId=1;StrId=601043;Pos=3;};
	};		
	[601002]=
	{
	 {NpcId=1;StrId=601045;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=500;};
	 {NpcId=10071029;StrId=601046;Pos=3;bCam=1;look={-38.96,-35.37,1};eye={-19.69,-14.8,18};tm=0;};
	 {NpcId=1;StrId=601047;Pos=3;};
	 {NpcId=10071029;StrId=601048;Pos=3;Patrol={{npc=10071029,index=2}}};	
	 {NpcId=1;StrId=601049;Pos=3;};		 
	};		
	[601101]=
	{
	 {NpcId=10071015;StrId=601141;Pos=3;bCam=1;look={-28.15,-43.09,1};eye={-16.79,-20.31,15};tm=500;};
	 {NpcId=10071031;StrId=601142;Pos=3;};
	 {NpcId=10071015;StrId=601143;Pos=3;};	 
	};			
	[601201]=
	{
	 {NpcId=1;StrId=601241;Pos=4;};	 
	};	
	[601301]=
	{
	 {NpcId=1;StrId=601341;Pos=4;};	 
	};		
	[601401]=
	{
	 {NpcId=1;StrId=601441;Pos=4;};	 
	};	
	[601501]=
	{
	 {NpcId=1;StrId=601541;Pos=4;};	 
	};
	[601601]=
	{
	 {NpcId=10071007;StrId=601641;Pos=1;Delay=10;}; 
	};	
	[601602]=
	{
	 {NpcId=1;StrId=601642;Pos=4;};	 
	};	
	[601701]=
	{
	 {NpcId=10071018;StrId=601741;Pos=3;bCam=1;look={0.35,-2.10,1};eye={-5.9,-26.49,18};tm=3000;Patrol={{npc=10071018,index=1}}};
	 {NpcId=10071007;StrId=601746;Pos=3;};	 
	 {NpcId=10071018;StrId=601747;Pos=3;};	 
	 {NpcId=1;StrId=601742;Pos=3;};
	 {NpcId=10071018;StrId=601743;Pos=3;};
	 {NpcId=1;StrId=601744;Pos=3;};	 
	};		
	[601702]=
	{
	 {NpcId=1;StrId=601745;Pos=4;};	 
	};	
	[601801]=
	{
	 {NpcId=10071030;StrId=601841;Pos=3;bCam=1;look={0.35,-2.10,1};eye={-5.9,-26.49,18};tm=1500;Patrol={{npc=10071030,index=2}};};
	 {NpcId=10071007;StrId=601842;Pos=3;};	 
	 {NpcId=10071030;StrId=601843;Pos=3;};	 
	 {NpcId=10071007;StrId=601844;Pos=3;};
	 {NpcId=10071030;StrId=601845;Pos=3;};
	 {NpcId=10071007;StrId=601846;Pos=3;};
	 {NpcId=1;StrId=601847;Pos=3;};	 	 
	};		
	-- [601802]=
	-- {
	 -- {NpcId=1;StrId=601847;Pos=4;};	 
	-- };	
	[601901]=
	{
	 {NpcId=10071034;StrId=601941;Pos=3;bCam=1;look={0.35,-2.10,1};eye={-5.9,-26.49,18};tm=0;};
	 {NpcId=1;StrId=601942;Pos=3;};	 
	 {NpcId=10071030;StrId=601943;Pos=3;};	 
	 {NpcId=10071034;StrId=601944;Pos=3;};
	 {NpcId=10071018;StrId=601945;Pos=3;};
	};		
	[602001]=
	{
	 {NpcId=10071016;StrId=602041;Pos=1;Delay=10;}; 
	};		
	[602101]=
	{
	 {NpcId=10071018;StrId=602147;Pos=1;Delay=10;Patrol={{npc=10071018,index=2},{npc=10071030,index=3}};};
	 {NpcId=10071030;StrId=602148;Pos=1;Delay=2500;};
	 {NpcId=10071018;StrId=602149;Pos=1;Delay=3000;};
	 {NpcId=10071030;StrId=602150;Pos=1;Delay=3000;};	 
	};	
	[602102]=
	{
	 {NpcId=1;StrId=602151;Pos=4;};	 
	};	
	[602103]=
	{
	 {NpcId=10071017;StrId=602141;Pos=3;bCam=1;look={91.38,-1.14,1};eye={-18,-9.07,15};tm=1500;};
	 {NpcId=1;StrId=602142;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;};	 
	 {NpcId=10071017;StrId=602143;Pos=3;bCam=1;look={91.38,-1.14,1};eye={-18,-9.07,15};tm=0;};	 
	 {NpcId=1;StrId=602144;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;};
	 {NpcId=10071017;StrId=602145;Pos=3;bCam=1;look={91.38,-1.14,1};eye={-18,-9.07,15};tm=0;};
	 {NpcId=1;StrId=602146;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;};	 
	};	
	[606101]=
	{
	 {NpcId=10071017;StrId=606141;Pos=3;bCam=1;look={87.43,-2.15,1};eye={-29,-9.93,20};tm=1500;};
	 {NpcId=1;StrId=606142;Pos=3;};	 
	 {NpcId=10071017;StrId=606143;Pos=3;};	 
	 {NpcId=1;StrId=606144;Pos=3;};
	 {NpcId=10071017;StrId=606145;Pos=3;};
	 {NpcId=1;StrId=606146;Pos=3;};
	 {NpcId=10071017;StrId=606147;Pos=3;};
	 {NpcId=1;StrId=606148;Pos=3;};	 
	};
	[602201]=
	{
	 {NpcId=10071017;StrId=602241;Pos=1;Delay=10;}; 
	};		
	[602301]=
	{
	 {NpcId=1;StrId=602341;Pos=4;};	 
	};	
	[602302]=
	{
	 {NpcId=10071030;StrId=602342;Pos=3;bCam=1;look={-6.55,3.99,1};eye={-12.85,-16.94,14};tm=0;};
	 {NpcId=1;StrId=602343;Pos=3;};	 
	 {NpcId=10071030;StrId=602344;Pos=3;};	 
	 {NpcId=10071017;StrId=602345;Pos=3;bCam=1;look={-12.48,1.01,1};eye={-15.85,-16.30,14};tm=500;Patrol={{npc=10071017,index=1}}};
	 {NpcId=1;StrId=602346;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,14};tm=500;}; 
	};	
	[602401]=
	{
	 {NpcId=10071030;StrId=602441;Pos=1;Delay=10;Patrol={{npc=10071030,index=1}}}; 
	};	
	[602402]=
	{
	 {NpcId=1;StrId=602442;Pos=4;};	 
	};		
	[602601]=
	{
	 {NpcId=10071018;StrId=602641;Pos=1;Delay=10;}; 
	};	
	[602602]=
	{
	 {NpcId=1;StrId=602642;Pos=4;};	 
	};	
--镰	
	[602901]=
	{
	 {NpcId=1;StrId=602941;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;PAID=100000100;bPAStop=1;};		
	 {NpcId=10071031;StrId=602942;Pos=3;bCam=1;look={-21.11,-76.45,1};eye={-23.61,-12.05,15};tm=500;Patrol={{npc=10071031,index=1}}};
	 {NpcId=10071018;StrId=602943;Pos=3;bCam=1;look={-28.61,-75.80,1};eye={-21.64,-16.33,15};tm=3000;};
	 {NpcId=10071031;StrId=602944;Pos=3;};
	 {NpcId=10071018;StrId=602945;Pos=3;};	
	 {NpcId=10071031;StrId=602946;Pos=3;};	
	 {NpcId=10071018;StrId=602947;Pos=3;};		 
	};		
--刀	
	[602902]=
	{
	 {NpcId=1;StrId=602941;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;PAID=200100100;bPAStop=1;};		
	 {NpcId=10071031;StrId=602942;Pos=3;bCam=1;look={-21.11,-76.45,1};eye={-23.61,-12.05,15};tm=500;Patrol={{npc=10071031,index=1}}};
	 {NpcId=10071018;StrId=602943;Pos=3;bCam=1;look={-28.61,-75.80,1};eye={-21.64,-16.33,15};tm=3000;};
	 {NpcId=10071031;StrId=602944;Pos=3;};
	 {NpcId=10071018;StrId=602945;Pos=3;};	
	 {NpcId=10071031;StrId=602946;Pos=3;};	
	 {NpcId=10071018;StrId=602947;Pos=3;};		 
	};	
--剑	
	[602903]=
	{
	 {NpcId=1;StrId=602941;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;PAID=300100100;bPAStop=1;};		
	 {NpcId=10071031;StrId=602942;Pos=3;bCam=1;look={-21.11,-76.45,1};eye={-23.61,-12.05,15};tm=500;Patrol={{npc=10071031,index=1}}};
	 {NpcId=10071018;StrId=602943;Pos=3;bCam=1;look={-28.61,-75.80,1};eye={-21.64,-16.33,15};tm=3000;};
	 {NpcId=10071031;StrId=602944;Pos=3;};
	 {NpcId=10071018;StrId=602945;Pos=3;};	
	 {NpcId=10071031;StrId=602946;Pos=3;};	
	 {NpcId=10071018;StrId=602947;Pos=3;};		 
	};	
--枪	
	[602904]=
	{
	 {NpcId=1;StrId=602941;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;PAID=400000100;bPAStop=1;};		
	 {NpcId=10071031;StrId=602942;Pos=3;bCam=1;look={-21.11,-76.45,1};eye={-23.61,-12.05,15};tm=500;Patrol={{npc=10071031,index=1}}};
	 {NpcId=10071018;StrId=602943;Pos=3;bCam=1;look={-28.61,-75.80,1};eye={-21.64,-16.33,15};tm=3000;};
	 {NpcId=10071031;StrId=602944;Pos=3;};
	 {NpcId=10071018;StrId=602945;Pos=3;};	
	 {NpcId=10071031;StrId=602946;Pos=3;};	
	 {NpcId=10071018;StrId=602947;Pos=3;};		 
	};		
	[603001]=
	{
	 {NpcId=10071018;StrId=603041;Pos=1;Delay=10;}; 
	};
	[603002]=
	{
	 {NpcId=10071018;StrId=603042;Pos=1;Delay=10;}; 
	};	
	[603002]=
	{
	 {NpcId=10071018;StrId=603042;Pos=1;Delay=10;}; 
	};		
	[603201]=
	{
	 {NpcId=10071033;StrId=603245;Pos=1;Delay=10;}; 
	 {NpcId=10071018;StrId=603246;Pos=1;Delay=3000;};	 
	};	
	[603202]=
	{
	 {NpcId=10071018;StrId=603241;Pos=3;bCam=1;look={-13.02,2.98,1};eye={-23.55,-8.21,17};tm=500;};
	 {NpcId=1;StrId=603242;Pos=3;};
	 {NpcId=10071019;StrId=603243;Pos=3;};
	 {NpcId=1;StrId=603244;Pos=3;};			 
	};		
	[603301]=
	{
	 {NpcId=10071031;StrId=603341;Pos=3;bCam=1;look={9,11,1};eye={-10,-20,17};tm=500;Patrol={{npc=10071031,index=2}}};
	 {NpcId=10071032;StrId=603342;Pos=3;};
	 {NpcId=10071031;StrId=603343;Pos=3;};		 
	};		
	[603401]=
	{
	 {NpcId=10071031;StrId=603442;Pos=3;bCam=1;look={10.56,9.96,1};eye={-11.30,-27.18,19};tm=2000;mNpcId=10071031;NAID=1002100415;bNAStop=1;};
	 {NpcId=10071032;StrId=603443;Pos=3;};
	 {NpcId=10071031;StrId=603444;Pos=3;};
	 {NpcId=10071032;StrId=603445;Pos=3;};
	 {NpcId=1;StrId=603446;Pos=3;};	 
	};		
	[603402]=
	{
	 {NpcId=10071031;StrId=603441;Pos=1;Delay=10;}; 
	};
	[603601]=
	{
	 {NpcId=10071021;StrId=603641;Pos=3;bCam=1;look={-41.12,87.07,1};eye={-30.58,-2.06,19};tm=2000;};
	 {NpcId=10071020;StrId=603642;Pos=3;};
	 {NpcId=10071021;StrId=603643;Pos=3;};
	 {NpcId=10071023;StrId=603644;Pos=3;};	
	 {NpcId=1;StrId=603645;Pos=3;};		 
	};		
	[603602]=
	{
	 {NpcId=1;StrId=603646;Pos=4;};	 
	};			
	[603801]=
	{
	 {NpcId=1;StrId=603841;Pos=4;};	 
	};	
	[603802]=
	{
	 {NpcId=10071020;StrId=603842;Pos=1;Delay=10;}; 
	};		
	[603901]=
	{
	 {NpcId=10071094;StrId=603941;Pos=1;Delay=10;};
	 {NpcId=10071014;StrId=603942;Pos=1;Delay=2000;}; 
	 {NpcId=10071094;StrId=603943;Pos=1;Delay=3000;}; 
	 {NpcId=10071014;StrId=603944;Pos=1;Delay=2000;}; 	 
	};	
	[604101]=
	{
	 {NpcId=10071014;StrId=604041;Pos=3;bCam=1;look={-43.02,84.22,1};eye={-20.82,-22.57,16};tm=2000;Patrol={{npc=10071014,index=1}};};
	 {NpcId=1;StrId=604042;Pos=3;};	 
	 {NpcId=10071014;StrId=604043;Pos=3;};	
	 {NpcId=10071020;StrId=604141;Pos=3;};
	 {NpcId=1;StrId=604142;Pos=3;};
	 {NpcId=10071020;StrId=604143;Pos=3;}; 
	};		
	[604102]=
	{
	 {NpcId=10071024;StrId=604144;Pos=1;Delay=1000;};
	 {NpcId=10071023;StrId=604145;Pos=1;Delay=3000;}; 
	 {NpcId=10071020;StrId=604146;Pos=1;Delay=3000;};  
	};
	[604401]=
	{
	 {NpcId=10071022;StrId=604441;Pos=1;Delay=10;}; 
	};	
	[604801]=
	{
	 {NpcId=1;StrId=604841;Pos=4;};	 
	};	
	[604901]=
	{
	 {NpcId=1;StrId=604941;Pos=4;};	 
	};		
	[605301]=
	{
	 {NpcId=10071003;StrId=605341;Pos=1;Delay=10;}; 
	};	
	[605302]=
	{
	 {NpcId=10071003;StrId=605342;Pos=1;Delay=10;}; 
	};	
	[605303]=
	{
	 {NpcId=10071003;StrId=605343;Pos=1;Delay=10;}; 
	};	
	[605304]=
	{
	 {NpcId=10071003;StrId=605344;Pos=1;Delay=10;}; 
	};	
	[605305]=
	{
	 {NpcId=10071003;StrId=605345;Pos=1;Delay=10;}; 
	};
	[605306]=
	{
	 {NpcId=10071003;StrId=605346;Pos=1;Delay=10;}; 
	};	
	[605307]=
	{
	 {NpcId=10071003;StrId=605346;Pos=1;Delay=10;};	
	 {NpcId=10071022;StrId=605347;Pos=1;Delay=1500;};
	 {NpcId=10071096;StrId=605348;Pos=1;Delay=2000;};	
	 {NpcId=10071091;StrId=605349;Pos=1;Delay=1500;};
	 {NpcId=10071092;StrId=605350;Pos=1;Delay=1500;};	 
	};		
	[605701]=
	{
	 {NpcId=10021015;StrId=605741;Pos=3;bCam=1;look={70.97,-46.76,1};eye={-17.65,-10.24,18};tm=1000;};
	 {NpcId=10021015;StrId=605742;Pos=3;};
	 {NpcId=10021015;StrId=605743;Pos=3;};
	 {NpcId=10021015;StrId=605744;Pos=3;}; 	 
	};	
	[605901]=
	{
	 {NpcId=1;StrId=605941;Pos=4;};	 
	};	
	[700101]=
	{
	 {NpcId=10091015;StrId=700141;Pos=3;bCam=1;look={-81.43,11.03,1};eye={-14.35,-15.79,15};tm=1000;};
	 {NpcId=1;StrId=700142;Pos=3;bCam=1;look={0,1,1};eye={-9,-10,15};tm=0;};
	};	
	[700102]=
	{
	 {NpcId=1;StrId=700143;Pos=4;};	 	 
	};
	[700201]=
	{
	 {NpcId=10091015;StrId=700241;Pos=1;Delay=10;};	 
	};		
	[700401]=
	{
	 {NpcId=1;StrId=700441;Pos=4;};	 	 
	};
	[700501]=
	{
	 {NpcId=1;StrId=700541;Pos=4;};	 	 
	};	
	[700601]=
	{
	 {NpcId=1;StrId=700641;Pos=4;};	 	 
	};	
	[700701]=
	{
	 {NpcId=10091006;StrId=700741;Pos=1;Delay=10;Patrol={{npc=10091006,index=1}}};	 
	};	
	[700702]=
	{
	 {NpcId=10091014;StrId=700742;Pos=3;bCam=1;look={-14.25,-15.94,1};eye={-10.58,-16.81,15};tm=500;};
	 {NpcId=1;StrId=700743;Pos=3;};
	 {NpcId=10091014;StrId=700744;Pos=3;};
	 {NpcId=1;StrId=700745;Pos=3;};
	 {NpcId=10091014;StrId=700746;Pos=3;};
	 {NpcId=1;StrId=700747;Pos=3;};	 
	};	
	[700801]=
	{
	 {NpcId=10091014;StrId=700841;Pos=3;bCam=1;look={-8.77,-21.49,1};eye={-2.65,-28.43,15};tm=500;};
	 {NpcId=1;StrId=700842;Pos=3;bCam=1;Patrol={{npc=10091014,index=1}}};	 
	};
	[700802]=
	{
	 {NpcId=1;StrId=700843;Pos=4;};	 	 
	};	
	[700901]=
	{
	 {NpcId=10091002;StrId=700941;Pos=1;Delay=10;};	 
	};		
	[701001]=
	{ --{NpcId=10091002;StrId=701041;Pos=3;bCam=1;look={65.78,-67.76,1};eye={-24.63,-11.30,15};tm=500;};
	 {NpcId=10091002;StrId=701041;Pos=3;bCam=1;look={24.68,-73.65,1};eye={-15.12,-21.02,20};tm=500;};	 
	 {NpcId=1;StrId=701042;Pos=3;};		 
	 {NpcId=10091002;StrId=701043;Pos=3;};	 
	 {NpcId=10091003;StrId=701044;Pos=3;};
	 {NpcId=10091002;StrId=701045;Pos=3;Patrol={{npc=10091002,index=1}}};
	 {NpcId=10091005;StrId=701046;Pos=3;bCam=1;look={31.05,-66.35,1};eye={-6.68,-28.27,20};tm=500;mNpcId=10091005;NAID=10082005040;};
	 {NpcId=10091003;StrId=701047;Pos=3;mNpcId=10091003;NAID=5099000284;bNAStop=1;};
	 {NpcId=10091002;StrId=701048;Pos=3;Patrol={{npc=10091002,index=2}}};	 
	};	
	[701101]=
	{
	 {NpcId=10091002;StrId=701146;Pos=1;Delay=10;ActId=5099000181;pause=1;};	
	 {NpcId=10091003;StrId=701141;Pos=1;Delay=2000;ActId=5099000284;pause=1;};
	 {NpcId=10091003;StrId=701142;Pos=1;Delay=2000;};	
	 {NpcId=10091002;StrId=701143;Pos=1;Delay=2000;};	
	 {NpcId=10091003;StrId=701144;Pos=1;Delay=2000;};	
	 {NpcId=10091002;StrId=701145;Pos=1;Delay=2000;};		 
	};	
	[701201]=
	{
	 {NpcId=10091005;StrId=701241;Pos=1;Delay=10;};
	 {NpcId=10091004;StrId=701242;Pos=1;Delay=2000;};	 
	};	
	[701301]=
	{
	 {NpcId=10091008;StrId=701341;Pos=1;Delay=10;};	 
	};		
	[701501]=
	{
	 {NpcId=10091005;StrId=701541;Pos=1;Delay=10;};
	 {NpcId=10091008;StrId=701542;Pos=1;Delay=3000;};	 
	};		
	[701601]=
	{
	 {NpcId=10091005;StrId=701641;Pos=1;Delay=10;};
	 {NpcId=10091002;StrId=701642;Pos=1;Delay=2000;};
	 {NpcId=10091023;StrId=701643;Pos=1;Delay=2000;};
	 {NpcId=10091023;StrId=701644;Pos=1;Delay=2000;Patrol={{npc=10091023,index=1}}};	 
	};		
	[701701]=
	{
	 {NpcId=10091004;StrId=701741;Pos=1;Delay=10;};	 
	};		
	[701702]=
	{
	 {NpcId=1;StrId=701742;Pos=4;};	 	 
	};		
	[701801]=
	{
	 {NpcId=1;StrId=701841;Pos=4;};	 	 
	};	
	[701802]=
	{
	 {NpcId=1;StrId=701842;Pos=4;};	 	 
	};	
	[701901] = {
		{NpcId=10091003;StrId=701941;Pos=3;bCam=1;look={69.58,-30.20,1};eye={-8.12,-16.64,15};tm=500;};
		{NpcId=10091010;StrId=701942;Pos=3;bCam=1;look={60.77,-45.15,1};eye={-13.72,-14.69,15};tm=500;};
		{NpcId=10091003;StrId=701943;Pos=3;bCam=1;look={69.58,-30.20,1};eye={-8.12,-16.64,15};tm=0;};
		{NpcId=10091002;StrId=701944;Pos=3;};
		{NpcId=10091010;StrId=701945;Pos=3;bCam=1;look={60.77,-45.15,1};eye={-13.72,-14.69,15};tm=0;};	
	};	
	[702001]=
	{
	 {NpcId=1;StrId=702041;Pos=4;};	 	 
	};	
	[702002]=
	{
	 {NpcId=10091107;StrId=702042;Pos=1;Delay=10;};	 
	};	
	[702101]=
	{
	 {NpcId=1;StrId=702141;Pos=4;};	 	 
	};		
	[702201] = {
		{NpcId=10091002;StrId=702241;Pos=3;bCam=1;look={65.71,-10.90,1};eye={-12.69,-12.23,10};tm=0;};
		{NpcId=10091003;StrId=702242;Pos=3;};
		{NpcId=10091002;StrId=702243;Pos=3;};		
};
	[702202]=
	{
	 {NpcId=10091004;StrId=702244;Pos=1;Delay=10;};	 
	};	
	[702301]=
	{
	 {NpcId=10091101;StrId=702341;Pos=1;Delay=10;Patrol={{npc=10091101,index=1}};};	 
	};		
	[702401] = {
		{NpcId=10091002;StrId=702441;Pos=3;bCam=1;look={-0.04,-0.62,1};eye={-25.04,-5.03,8.6};tm=0;};
		{NpcId=10091003;StrId=702442;Pos=3;};
		{NpcId=1;StrId=702443;Pos=3;Patrol={{npc=10091002,index=3},{npc=10091003,index=1}}};	
		{NpcId=1;StrId=702444;Pos=3;Patrol={{npc=10091002,index=4},{npc=10091003,index=2}}};
		{NpcId=1;StrId=702445;Pos=3;Patrol={{npc=10091002,index=5},{npc=10091003,index=3}}};	
		{NpcId=1;StrId=702446;Pos=3;};
		{NpcId=1;StrId=702447;Pos=3;};			
};	
	[702501] = {
		{NpcId=10091017;StrId=702541;Pos=3;bCam=1;look={-14.97,-2.02,1};eye={-13.86,-13.27,12};tm=500;};
		{NpcId=10091002;StrId=702542;Pos=3;bCam=1;look={-0.04,-0.62,1};eye={-25.04,-5.03,8.6};tm=500;};
		{NpcId=1;StrId=702543;Pos=3;};	
		{NpcId=10091002;StrId=702544;Pos=3;};
	};
	[702701] = {
		{NpcId=10091012;StrId=702741;Pos=3;bCam=1;look={-14.97,-2.02,1};eye={-13.86,-13.27,12};tm=500;};
		{NpcId=10091002;StrId=702742;Pos=3;bCam=1;look={-0.04,-0.62,1};eye={-25.04,-5.03,8.6};tm=500;};
		{NpcId=1;StrId=702743;Pos=3;};	
		{NpcId=10091002;StrId=702744;Pos=3;};
	};	
	[702801]=
	{
	 {NpcId=10091108;StrId=702841;Pos=1;Delay=10;};	
	 {NpcId=10091108;StrId=702842;Pos=1;Delay=2000;};		 
	};	
	[702901]=
	{
	 {NpcId=10091012;StrId=702941;Pos=1;Delay=10;};	 
	};	
	[702902]=
	{
	 {NpcId=1;StrId=702942;Pos=4;};	 	 
	};		
	[703001]=
	{
	 {NpcId=10091012;StrId=703041;Pos=1;Delay=10;};	
	 {NpcId=10091012;StrId=703042;Pos=1;Delay=2000;Patrol={{npc=10091012,index=1}}};		 
	};		
	[703201]=
	{
	 {NpcId=1;StrId=703241;Pos=4;};	 	 
	};	
	[703202]=
	{
	 {NpcId=10091012;StrId=703242;Pos=1;Delay=10;Patrol={{npc=10091012,index=2}}};	 
	};		
	[703203]=
	{
	 {NpcId=1;StrId=703243;Pos=4;};	 	 
	};		
	[703301]=
	{
	 {NpcId=10091008;StrId=703341;Pos=1;Delay=10;};	 
	};		
	[703302]=
	{
	 {NpcId=1;StrId=703342;Pos=4;};	 	 
	};		
	[704001]=
	{
	 {NpcId=1;StrId=704041;Pos=4;};	 	 
	};		
	[704301]=
	{
	 {NpcId=1;StrId=704341;Pos=4;};	 	 
	};	
--镰	
	[704501] = {
		{NpcId=10091009;StrId=704541;Pos=3;bCam=1;look={-16.97,-2.86,1};eye={-12.73,-3.17,7.6};tm=500;mNpcId=10091009;NAID=10092007030;};
		{NpcId=1;StrId=704542;Pos=3;PAID=100000100;bPAStop=1;Patrol={{npc=10091009,index=1}};};
		{NpcId=10091011;StrId=704543;Pos=3;bCam=1;look={-15.90,-3.84,1};eye={-18.85,0.75,12.8};tm=500;};	
		{NpcId=10091011;StrId=704544;Pos=3;Patrol={{npc=10091011,index=2},{npc=10091019,index=2},{npc=10091020,index=2}};};
	};	
--刀
	[704502] = {
		{NpcId=10091009;StrId=704541;Pos=3;bCam=1;look={-16.97,-2.86,1};eye={-12.73,-3.17,7.6};tm=500;mNpcId=10091009;NAID=10092007030;};
		{NpcId=1;StrId=704542;Pos=3;PAID=200100100;bPAStop=1;Patrol={{npc=10091009,index=1}};};
		{NpcId=10091011;StrId=704543;Pos=3;bCam=1;look={-15.90,-3.84,1};eye={-18.85,0.75,12.8};tm=500;};	
		{NpcId=10091011;StrId=704544;Pos=3;Patrol={{npc=10091011,index=2},{npc=10091019,index=2},{npc=10091020,index=2}};};
	};	
--剑
	[704503] = {
		{NpcId=10091009;StrId=704541;Pos=3;bCam=1;look={-16.97,-2.86,1};eye={-12.73,-3.17,7.6};tm=500;mNpcId=10091009;NAID=10092007030;};
		{NpcId=1;StrId=704542;Pos=3;PAID=300100100;bPAStop=1;Patrol={{npc=10091009,index=1}};};
		{NpcId=10091011;StrId=704543;Pos=3;bCam=1;look={-15.90,-3.84,1};eye={-18.85,0.75,12.8};tm=500;};	
		{NpcId=10091011;StrId=704544;Pos=3;Patrol={{npc=10091011,index=2},{npc=10091019,index=2},{npc=10091020,index=2}};};
	};	
--枪	
	[704504] = {
		{NpcId=10091009;StrId=704541;Pos=3;bCam=1;look={-16.97,-2.86,1};eye={-12.73,-3.17,7.6};tm=500;mNpcId=10091009;NAID=10092007030;};
		{NpcId=1;StrId=704542;Pos=3;PAID=400000100;bPAStop=1;Patrol={{npc=10091009,index=1}};};
		{NpcId=10091011;StrId=704543;Pos=3;bCam=1;look={-15.90,-3.84,1};eye={-18.85,0.75,12.8};tm=500;};	
		{NpcId=10091011;StrId=704544;Pos=3;Patrol={{npc=10091011,index=2},{npc=10091019,index=2},{npc=10091020,index=2}};};
	};	
	
	
	[704601] = {
		{NpcId=10091020;StrId=704641;Pos=3;bCam=1;look={-15.68,-5.59,1};eye={-11.82,4.40,6.11};tm=500;};
		{NpcId=10091011;StrId=704642;Pos=3;};
		{NpcId=1;StrId=704643;Pos=3;};	
		{NpcId=10091019;StrId=704644;Pos=3;};
		{NpcId=1;StrId=704645;Pos=3;};		
	};		
	[704602]=
	{
	 {NpcId=1;StrId=704646;Pos=4;};	 	 
	};		
	[704701]=
	{
	 {NpcId=1;StrId=704741;Pos=4;};	 	 
	};	
	[704702]=
	{
	 {NpcId=10091011;StrId=704742;Pos=1;Delay=10;Patrol={{npc=10091011,index=1},{npc=10091019,index=1},{npc=10091020,index=1}};};	
	 {NpcId=10091019;StrId=704743;Pos=1;Delay=2000;};		 
	};	
	[704801]=
	{
	 {NpcId=10091011;StrId=704841;Pos=1;Delay=10;};	
	 {NpcId=10091019;StrId=704842;Pos=1;Delay=2500;};		 
	};	
	[704802]=
	{
	 {NpcId=1;StrId=704843;Pos=4;};	 	 
	};	
	[704901]=
	{
	 {NpcId=10091011;StrId=704941;Pos=1;Delay=10;};	
	 {NpcId=10091020;StrId=704942;Pos=1;Delay=2500;};		 
	};	
	[705001]=
	{
	 {NpcId=10091011;StrId=705041;Pos=1;Delay=10;};	
	 {NpcId=10091019;StrId=705042;Pos=1;Delay=2500;};		 
	};		
	[705002]=
	{
	 {NpcId=1;StrId=705043;Pos=4;};	 	 
	};	
	[705101]=
	{
	 {NpcId=1;StrId=705141;Pos=4;};	 	 
	};		
	[705201] = {
		{NpcId=1;StrId=705241;Pos=3;bCam=1;look={-4,17,1};eye={-14.76,-22,19};tm=1500;};
	};	
	[705202]=
	{
	 {NpcId=1;StrId=705243;Pos=4;};	 	 
	};
	[705301]=
	{
	 {NpcId=10091022;StrId=705341;Pos=3;bCam=1;look={1.3,10.3,1};eye={-14.55,-12.9,15};tm=500;mNpcId=10091022;NAID=6702;bNAStop=1;};
	 {NpcId=1;StrId=705342;Pos=3;};		 
	};
	[705701] = {
		{NpcId=1;StrId=705746;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;mNpcId=10091002;NAID=5099000183;bNAStop=1;};
		{NpcId=1;StrId=705741;Pos=3;mNpcId=10091114;NAID=5099000281;bNAStop=1;};			
		{NpcId=10091002;StrId=705742;Pos=3;bCam=1;look={-6.40,-2.56,1};eye={-3.9,-16.11,10};tm=500;};
		{NpcId=1;StrId=705743;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};	
		{NpcId=10091002;StrId=705744;Pos=3;bCam=1;look={-6.40,-2.56,1};eye={-3.9,-16.11,10};tm=0;};
		{NpcId=1;StrId=705745;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};		
	};
	[705702]=
	{
	 {NpcId=10091114;StrId=705747;Pos=1;Delay=10;};	 	 
	};	
	[705901]=
	{
	 {NpcId=1;StrId=705941;Pos=4;};	 	 
	};	
	[800101]=
	{
	 {NpcId=10081001;StrId=800141;Pos=1;Delay=10;};	 
	};
	[800102]=
	{
	 {NpcId=1;StrId=800142;Pos=4;};	 	 
	};		
	[800201]=
	{
	 {NpcId=10081001;StrId=800243;Pos=1;Delay=10;Patrol={{npc=10081001,index=1}}};	 
	};			
	[800202] = {
		{NpcId=10081001;StrId=800241;Pos=3;bCam=1;look={26.04,-1.2,1};eye={-8.3,-19.46,15};tm=500;};
		{NpcId=10081001;StrId=800242;Pos=3;};
	};	
	[800301]=
	{
	 {NpcId=10081101;StrId=800341;Pos=1;Delay=500;};
	};	
	[800302]=
	{
	 {NpcId=1;StrId=800342;Pos=4;};
	};	
	[800401]=
	{
	 {NpcId=1;StrId=800441;Pos=4;};
	};	
	[800501] = {
		{NpcId=1;StrId=800541;Pos=3;bCam=1;};
		{NpcId=10081089;StrId=800542;Pos=3;bCam=1;look={23.51,-5.14,1};eye={9.78,-21.39,22};tm=500;Patrol={{npc=10081089,index=1},{npc=10081090,index=1}};};
		{NpcId=10081090;StrId=800543;Pos=3;};
		{NpcId=1;StrId=800544;Pos=3;bCam=1;};
		{NpcId=1;StrId=800545;Pos=3;bCam=1;look={7,27,1};eye={-14.76,-22,20};tm=5000;};		
	};	
	[800601] = {
		{NpcId=10081012;StrId=800641;Pos=3;bCam=1;look={45.92,31.16,1};eye={-4.52,-26.63,19};tm=500;};
		{NpcId=10081099;StrId=800642;Pos=3;};
	};		
	[800801]=
	{
	 {NpcId=1;StrId=800841;Pos=4;};
	};	
	[800901] = {
		{NpcId=10081012;StrId=800941;Pos=3;bCam=1;look={71.20,56.51,1};eye={-15.84,-15.70,20};tm=500;Patrol={{npc=10081012,index=1}}};
		{NpcId=10081009;StrId=800942;Pos=3;};
		{NpcId=10081009;StrId=800943;Pos=3;};
		{NpcId=1;StrId=800944;Pos=3;};		
	};	
	[801001] = {
		{NpcId=10081009;StrId=801041;Pos=3;bCam=1;look={71.73,41.82,1};eye={-14.11,-12.23,12};tm=500;};
		{NpcId=10081008;StrId=801042;Pos=3;bCam=1;look={68,42.00,1};eye={-19.08,-16.79,12};tm=1500;};
		{NpcId=1;StrId=801043;Pos=3;};
		{NpcId=10081008;StrId=801044;Pos=3;};
		{NpcId=1;StrId=801045;Pos=3;};
		{NpcId=10081008;StrId=801046;Pos=3;};
		{NpcId=10081009;StrId=801047;Pos=3;};
		{NpcId=10081008;StrId=801048;Pos=3;};
		{NpcId=10081009;StrId=801049;Pos=3;};		
	};	
	[801101] = {
		{NpcId=10081008;StrId=801141;Pos=3;bCam=1;look={69.07,37.90,1};eye={-7.46,-19.02,13};tm=500;};
		{NpcId=1;StrId=801142;Pos=3;};
		{NpcId=10081008;StrId=801143;Pos=3;};
		{NpcId=1;StrId=801144;Pos=3;};
	};		
	[801201]=
	{
	 {NpcId=1;StrId=801241;Pos=4;};
	};	
	[801202] = {
		{NpcId=10081003;StrId=801242;Pos=3;bCam=1;look={-2.21,-72.57,1};eye={-23.79,-1.80,18};tm=2000;};
		{NpcId=10081093;StrId=801243;Pos=3;bCam=1;look={-9.85,-73.10,1};eye={-24.34,-1.46,18};tm=0;};
		{NpcId=10081003;StrId=801244;Pos=3;bCam=1;look={-2.21,-72.57,1};eye={-23.79,-1.80,18};tm=0;};
		{NpcId=1;StrId=801245;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081004;StrId=801246;Pos=3;bCam=1;look={-13.97,-65.78,1};eye={8.52,-25.20,18};tm=500;Patrol={{npc=10081004,index=1},{npc=10081092,index=1}};};
		{NpcId=10081003;StrId=801247;Pos=3;bCam=1;look={-2.21,-72.57,1};eye={-23.79,-1.80,18};tm=0;};
		{NpcId=10081004;StrId=801248;Pos=3;bCam=1;look={-13.97,-65.78,1};eye={8.52,-25.20,18};tm=0;};
		{NpcId=1;StrId=801249;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
	};		
	[801301]=
	{
	 {NpcId=10081004;StrId=801341;Pos=1;Delay=10;};	 
	};		
	[801401] = {
		{NpcId=10081001;StrId=801441;Pos=3;bCam=1;look={-8.15,-59.84,1};eye={-12.29,-23.89,15};tm=500;};
		{NpcId=1;StrId=801442;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081089;StrId=801443;Pos=3;bCam=1;look={-8.15,-59.84,1};eye={-12.29,-23.89,15};tm=0;};
		{NpcId=10081003;StrId=801445;Pos=3;bCam=1;look={-2.21,-72.57,1};eye={-23.79,-1.80,15};tm=0;};
		{NpcId=10081001;StrId=801446;Pos=3;bCam=1;look={-8.15,-59.84,1};eye={-12.29,-23.89,15};tm=0;};
	};	
	[801601]=
	{
	 {NpcId=1;StrId=801641;Pos=4;};
	};	
	[801602]=
	{
	 {NpcId=10081004;StrId=801642;Pos=1;Delay=10;};	 
	};		
	[801701]=
	{
	 {NpcId=10081004;StrId=801741;Pos=1;Delay=10;};	 
	};	
	[801901] = {
		{NpcId=10081086;StrId=801941;Pos=3;bCam=1;look={34.82,-69.36,1};eye={14.83,-20.07,18};tm=500;};
		{NpcId=10081015;StrId=801942;Pos=3;bCam=1;look={37.80,-70.89,1};eye={-22.26,-17.55,18};tm=1500;};
		{NpcId=10081086;StrId=801943;Pos=3;};
		{NpcId=10081015;StrId=801944;Pos=3;};
		{NpcId=10081086;StrId=801945;Pos=3;};
		{NpcId=10081015;StrId=801946;Pos=3;Patrol={{npc=10081015,index=1}}};
	};	
	[801902]=
	{
	 {NpcId=10081076;StrId=801947;Pos=1;Delay=10;};
	 {NpcId=10081002;StrId=801948;Pos=1;Delay=3000;};
	 {NpcId=10081076;StrId=801949;Pos=1;Delay=2000;};
	 {NpcId=10081002;StrId=801950;Pos=1;Delay=2500;};
	 {NpcId=10081076;StrId=801951;Pos=1;Delay=2500;ActId=1008100381;pause=1;};
	 {NpcId=10081002;StrId=801952;Pos=1;Delay=2000;};	 
	};	
	[802101]=
	{
	 {NpcId=1;StrId=802141;Pos=4;};
	};	
	[802201]=
	{
	 {NpcId=1;StrId=802241;Pos=4;};
	};
	
--镰	
	[802301] = {
		{NpcId=1;StrId=802341;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081016;StrId=802342;Pos=3;bCam=1;look={-64.46,-60.49,1};eye={-8.9,-25.33,16};tm=2000;};
		{NpcId=10081016;StrId=802343;Pos=3;};
		{NpcId=10081017;StrId=802344;Pos=3;};
		{NpcId=1;StrId=802345;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;PAID=100000100;bPAStop=1;};
	};		
--刀	
	[802302] = {
		{NpcId=1;StrId=802341;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081016;StrId=802342;Pos=3;bCam=1;look={-64.46,-60.49,1};eye={-8.9,-25.33,16};tm=2000;};
		{NpcId=10081016;StrId=802343;Pos=3;};
		{NpcId=10081017;StrId=802344;Pos=3;};
		{NpcId=1;StrId=802345;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;PAID=200100100;bPAStop=1;};
	};		
--剑	
	[802303] = {
		{NpcId=1;StrId=802341;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081016;StrId=802342;Pos=3;bCam=1;look={-64.46,-60.49,1};eye={-8.9,-25.33,16};tm=2000;};
		{NpcId=10081016;StrId=802343;Pos=3;};
		{NpcId=10081017;StrId=802344;Pos=3;};
		{NpcId=1;StrId=802345;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;PAID=300100100;bPAStop=1;};
	};	
--枪	
	[802304] = {
		{NpcId=1;StrId=802341;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081016;StrId=802342;Pos=3;bCam=1;look={-64.46,-60.49,1};eye={-8.9,-25.33,16};tm=2000;};
		{NpcId=10081016;StrId=802343;Pos=3;};
		{NpcId=10081017;StrId=802344;Pos=3;};
		{NpcId=1;StrId=802345;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;PAID=400000100;bPAStop=1;};
	};		
	[802305]=
	{
	 {NpcId=1;StrId=802346;Pos=4;};
	};
	[802401]=
	{
	 {NpcId=10081005;StrId=802441;Pos=1;Delay=10;};
	 {NpcId=10081005;StrId=802442;Pos=1;Delay=3000;};
	 {NpcId=10081005;StrId=802443;Pos=1;Delay=3000;};
	 {NpcId=10081005;StrId=802444;Pos=1;Delay=3000;};
	 {NpcId=10081005;StrId=802445;Pos=1;Delay=3000;};
	};	
	[802501]=
	{
	 {NpcId=1;StrId=802541;Pos=4;};
	};	
	[802502]=
	{
	 {NpcId=1;StrId=802542;Pos=4;};
	};
	[802601]=
	{
	 {NpcId=10081005;StrId=802641;Pos=1;Delay=10;};
	};		
	[802602]=
	{
	 {NpcId=10081005;StrId=802642;Pos=1;Delay=10;};
	};
	[802603]=
	{
	 {NpcId=10081005;StrId=802643;Pos=1;Delay=10;};
	};	
	[802801] = {
		{NpcId=10081011;StrId=802841;Pos=3;bCam=1;look={-10.57,-4,1};eye={-19.01,-20.46,19};tm=500;};
		{NpcId=10081080;StrId=802842;Pos=3;bCam=1;look={-8.69,-12.39,1};eye={-24.90,-11.95,19};tm=0;};
		{NpcId=10081011;StrId=802843;Pos=3;bCam=1;look={-10.57,-4,1};eye={-19.01,-20.46,19};tm=0;};
		{NpcId=10081002;StrId=802844;Pos=3;};
		{NpcId=10081011;StrId=802845;Pos=3;};
		{NpcId=10081011;StrId=802846;Pos=3;};
		{NpcId=1;StrId=802847;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081082;StrId=802848;Pos=3;bCam=1;look={-8.69,-12.39,1};eye={-24.90,-11.95,19};tm=0;};
	};		
	[802901]=
	{
	 {NpcId=10081075;StrId=802941;Pos=1;Delay=500;};
	 {NpcId=10081075;StrId=802942;Pos=1;Delay=3000;};	 
	};		
	[803101] = {
		{NpcId=1;StrId=803141;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};	
		{NpcId=10081002;StrId=803142;Pos=3;bCam=1;look={-10.57,-4,1};eye={-19.01,-20.46,19};tm=500;};
		{NpcId=1;StrId=803143;Pos=3;};
		{NpcId=10081002;StrId=803144;Pos=3;};
		{NpcId=1;StrId=803145;Pos=3;};
		{NpcId=1;StrId=803241;Pos=3;};		
	};	
	[803201]=
	{
	 {NpcId=1;StrId=803242;Pos=4;};
	};		
	[803301] = {
		{NpcId=10081098;StrId=803341;Pos=3;bCam=1;look={-13.59,1.19,1};eye={-18.04,-19.47,19};tm=500;};	
		{NpcId=1;StrId=803342;Pos=3;};
		{NpcId=10081002;StrId=803343;Pos=3;};
	};	
	[803501]=
	{
	 {NpcId=10081006;StrId=803541;Pos=1;Delay=500;};
	};
	[803502]=
	{
	 {NpcId=1;StrId=803542;Pos=4;};
	};	
	[803601] = {
		{NpcId=10081002;StrId=803641;Pos=3;bCam=1;look={-4.87,-49.53,1};eye={-26.19,-4.33,18};tm=500;};	
		{NpcId=1;StrId=803642;Pos=3;};
		{NpcId=10081002;StrId=803643;Pos=3;};
		{NpcId=10081009;StrId=803644;Pos=3;};		
	};
	[803701]=
	{
	 {NpcId=1;StrId=803741;Pos=4;};
	};		
	[803801]=
	{
	 {NpcId=1;StrId=803841;Pos=4;};
	};	
	[803901]=
	{
	 {NpcId=1;StrId=803941;Pos=4;};
	};	
	[803902]=
	{
	 {NpcId=10081009;StrId=803942;Pos=3;bCam=1;look={-73.57,67.75,1};eye={-6.70,-16.64,12};tm=500;};
	};	
	[804101] = {
		{NpcId=10081009;StrId=804141;Pos=3;bCam=1;look={-74.75,63.91,1};eye={-17.04,-6.65,13};tm=500;};	
		{NpcId=10081002;StrId=804142;Pos=3;};
		{NpcId=10081002;StrId=804143;Pos=3;};
		{NpcId=10081009;StrId=804144;Pos=3;};	
		{NpcId=10081002;StrId=804145;Pos=3;};
		{NpcId=10081009;StrId=804146;Pos=3;};			
	};		
	[804301]=
	{
	 {NpcId=1;StrId=804341;Pos=4;};
	};	
	[804302]=
	{
	 {NpcId=10081002;StrId=804342;Pos=1;Delay=10;};
	 {NpcId=10081009;StrId=804343;Pos=1;Delay=3000;};
	 {NpcId=10081002;StrId=804344;Pos=1;Delay=4000;};	 
	};		
	[804401]=
	{
	 {NpcId=1;StrId=804441;Pos=4;};
	};	
	[804501] = {
		{NpcId=10081013;StrId=804541;Pos=3;bCam=1;look={-3.83,44.03,1};eye={-28.87,1.80,19};tm=500;Patrol={{npc=10081013,index=1}}};	
		{NpcId=10081009;StrId=804542;Pos=3;};
		{NpcId=10081013;StrId=804543;Pos=3;};
		{NpcId=1;StrId=804544;Pos=3;};	
		{NpcId=10081013;StrId=804545;Pos=3;};
		{NpcId=1;StrId=804546;Pos=3;};
		{NpcId=10081013;StrId=804547;Pos=3;};	
		{NpcId=1;StrId=804548;Pos=3;};
		{NpcId=10081013;StrId=804549;Pos=3;};			
	};		
	[805001]=
	{
	 {NpcId=10081013;StrId=805041;Pos=1;Delay=10;Patrol={{npc=10081013,index=2},{npc=10081072,index=1},{npc=10081073,index=1}}};
	};	
	[805002]=
	{
	 {NpcId=10081013;StrId=805042;Pos=1;Delay=10;Patrol={{npc=10081013,index=3}}};
	};		
	[805201] = {
		{NpcId=10081014;StrId=805241;Pos=3;bCam=1;look={-2.65,18.32,1};eye={-18.11,-19.19,20};tm=500;};	
		{NpcId=10081013;StrId=805242;Pos=3;};
		{NpcId=10081014;StrId=805243;Pos=3;};
		{NpcId=1;StrId=805244;Pos=3;};
		{NpcId=10081013;StrId=805245;Pos=3;};		
	};	
	[805202]=
	{
	 {NpcId=10081013;StrId=805246;Pos=1;Delay=10;Patrol={{npc=10081069,index=1},{npc=10081070,index=1},{npc=10081071,index=1},{npc=10081072,index=2},{npc=10081073,index=2}}};
	};		
	[805301]=
	{
	 {NpcId=10081014;StrId=805341;Pos=3;};
	 {NpcId=10081009;StrId=805342;Pos=3;bCam=1;look={-2.65,18.32,1};eye={-18.11,-19.19,20};tm=500;};
	 {NpcId=10081008;StrId=805343;Pos=3;};
	 {NpcId=10081013;StrId=805344;Pos=3;};	 
	};	
	[805501]=
	{
	 {NpcId=10081014;StrId=805541;Pos=3;bCam=1;look={-5.25,24.96,1};eye={-25.38,-5.93,19};tm=500;mNpcId=10081014;NAID=1011200517;};
	 {NpcId=10081013;StrId=805542;Pos=3;Patrol={{npc=10081013,index=4}};mNpcId=10081014;NAID=1011200517;};
	 {NpcId=10081009;StrId=805543;Pos=3;Patrol={{npc=10081009,index=1}}};
	 {NpcId=10081008;StrId=805544;Pos=3;Patrol={{npc=10081008,index=1}}};
	 {NpcId=10081005;StrId=805545;Pos=3;bCam=1;look={-0.85,15.96,1};eye={-24.46,6.01,17};tm=500;Patrol={{npc=10081005,index=1}}};
	 {NpcId=10081008;StrId=805546;Pos=3;bCam=1;look={-5.25,24.96,1};eye={-25.38,-5.93,19};tm=500;Patrol={{npc=10081008,index=3}}};
	 {NpcId=10081014;StrId=805547;Pos=3;Patrol={{npc=10081014,index=2}}};
	 {NpcId=10081005;StrId=805548;Pos=3;Patrol={{npc=10081005,index=2}}};	 
	 {NpcId=10081008;StrId=805549;Pos=3;Patrol={{npc=10081008,index=2}};mNpcId=10081005;NAID=1002102582;bNAStop=1;};		 
	 {NpcId=10081013;StrId=805550;Pos=3;Patrol={{npc=10081013,index=5}}};	
	 {NpcId=10081014;StrId=805553;Pos=3;Patrol={{npc=10081014,index=1}}};		 
	};		
	[805601]=
	{
	 {NpcId=10081013;StrId=805641;Pos=1;Delay=10;Patrol={{npc=10081013,index=6}}};	
	 {NpcId=10081008;StrId=805642;Pos=1;Delay=1500;ActId=1008200980;pause=1;};
	 {NpcId=10081009;StrId=805643;Pos=1;Delay=2500;};	 
	};		
	[805701]=
	{
	 {NpcId=10081021;StrId=805741;Pos=1;Delay=1000;ActId=1002102582;pause=1;};
	};	
	[805901] = {
		{NpcId=10081007;StrId=805941;Pos=3;bCam=1;look={13.13,31.92,1};eye={-25.51,8.57,20};tm=500;};	
		{NpcId=1;StrId=805942;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
 };		
	[806301]=
	{
	 {NpcId=1;StrId=806341;Pos=4;};
	};	
	[806401] = {
		{NpcId=10081067;StrId=806441;Pos=3;bCam=1;look={-32.84,-36.96,1};eye={3.12,-24.32,25};tm=500;};	
		{NpcId=1;StrId=806442;Pos=3;};
 };	
	[806501]=
	{
	 {NpcId=1;StrId=806541;Pos=4;};
	};	
	[806701] = {
		{NpcId=10081004;StrId=806741;Pos=3;bCam=1;look={-1.06,-8.35,1};eye={-7.57,-32.28,21};tm=500;};	
		{NpcId=10081065;StrId=806742;Pos=3;};
		{NpcId=10081066;StrId=806743;Pos=3;};
		{NpcId=10081004;StrId=806744;Pos=3;};	
 };		
	[806801] = {
		{NpcId=10081004;StrId=806841;Pos=3;bCam=1;look={-1.06,-8.35,1};eye={-7.57,-32.28,21};tm=500;};	
		{NpcId=10081065;StrId=806842;Pos=3;};
		{NpcId=10081066;StrId=806843;Pos=3;};
		{NpcId=10081007;StrId=806844;Pos=3;bCam=1;look={-1.91,-16.78,1};eye={-27.02,-14.47,25};tm=1500;Patrol={{npc=10081007,index=1}}};
		{NpcId=10081066;StrId=806845;Pos=3;};
		{NpcId=10081004;StrId=806846;Pos=3;bCam=1;look={-1.06,-8.35,1};eye={-7.57,-32.28,21};tm=1500;};
		{NpcId=1;StrId=806847;Pos=3;};		
 };	
	[806802] = {
		{NpcId=10081004;StrId=806848;Pos=3;bCam=1;look={-1.06,-8.35,1};eye={-7.57,-32.28,21};tm=500;};	
		{NpcId=1;StrId=806849;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10081004;StrId=806850;Pos=3;bCam=1;look={-1.06,-8.35,1};eye={-7.57,-32.28,21};tm=0;};
		{NpcId=1;StrId=806851;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};	
 };		
	[806803] = {
		{NpcId=10081004;StrId=806852;Pos=1;Delay=10;Patrol={{npc=10081004,index=2},{npc=10081065,index=1},{npc=10081066,index=1}}};
		{NpcId=10081065;StrId=806853;Pos=1;Delay=3000;};
		{NpcId=10081004;StrId=806854;Pos=1;Delay=3000;};
	};	
	[807101] = {
		{NpcId=10081007;StrId=807141;Pos=3;bCam=1;look={-43.75,11.43,1};eye={-24.37,-4.06,15};tm=500;};	
		{NpcId=10081009;StrId=807142;Pos=3;};
		{NpcId=10081007;StrId=807143;Pos=3;};
		{NpcId=10081009;StrId=807144;Pos=3;};
		{NpcId=10081009;StrId=807145;Pos=3;};
		{NpcId=1;StrId=807146;Pos=3;};			
 };		
	[807201] = {
		{NpcId=10101004;StrId=807241;Pos=1;Delay=1000;};
		{NpcId=10101004;StrId=807242;Pos=1;Delay=3000;};
		{NpcId=10101004;StrId=807243;Pos=1;Delay=3000;};		
	}; 
	[900201] = {
		{NpcId=10101004;StrId=900241;Pos=1;Delay=1000;Patrol={{npc=10101004,index=1}}};
		{NpcId=10101004;StrId=900242;Pos=1;Delay=3000;};
	};
	[900301] = {
		{NpcId=10101098;StrId=900341;Pos=3;bCam=1;look={-92.30,-30.54,1};eye={-24.59,2.14,18};tm=500;Patrol={{npc=101010098,index=1}}};
		{NpcId=1;StrId=900342;Pos=3;};
		{NpcId=10101004;StrId=900343;Pos=3;};
		{NpcId=10101098;StrId=900344;Pos=3;};
		{NpcId=1;StrId=900345;Pos=3;};		
	};
	[900601] = {
		{NpcId=10101005;StrId=900641;Pos=1;Delay=1000;Patrol={{npc=10101005,index=1}}};	
	};
	[900701] = {
		{NpcId=10101005;StrId=900741;Pos=1;Delay=1000;Patrol={{npc=10101004,index=3},{npc=10101005,index=2}}};	
	};	
	[900801] = {
		{NpcId=10101097;StrId=900841;Pos=3;bCam=1;look={-76.88,-85.12,1};eye={-14.44,-24.86,20};tm=500;};
		{NpcId=1;StrId=900842;Pos=3;};
		{NpcId=10101005;StrId=900843;Pos=3;bCam=1;look={-84.48,-97.81,1};eye={-13.07,-22.21,20};tm=1500;};
		{NpcId=1;StrId=900844;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10101004;StrId=900845;Pos=3;};		
	};	
	[900901] = {
		{NpcId=10101097;StrId=900941;Pos=1;Delay=1000;};	
	};	
	[900902] = {
	 {NpcId=1;StrId=900942;Pos=4;};	
	};	
	[901001] = {
		{NpcId=10101101;StrId=901041;Pos=3;bCam=1;look={-61.49,-121.32,1};eye={-22.26,-18.24,20};tm=500;Patrol={{npc=10101101,index=1}};mNpcId=10101099;NAID=1002102315;bNAStop=1;};
		{NpcId=1;StrId=901042;Pos=3;};
		{NpcId=10101005;StrId=901043;Pos=3;};
		{NpcId=1;StrId=901044;Pos=3;};			
	};	
	[901101] = {
		{NpcId=10101005;StrId=901141;Pos=1;Delay=1000;};	
	};
	[901102] = {
	 {NpcId=1;StrId=901142;Pos=4;};		
	};
	[901201] = {
	 {NpcId=1;StrId=901241;Pos=4;};	
	};	
	[901301] = {
	 {NpcId=1;StrId=901341;Pos=4;};	
	};		
	[901501] = {
	 {NpcId=1;StrId=901541;Pos=4;};	
	};
	[901601] = {
		{NpcId=1;StrId=901641;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10101006;StrId=901642;Pos=3;bCam=1;look={13.35,-106.21,1};eye={-16.11,-16.18,24};tm=1500;Patrol={{npc=10101007,index=1},{npc=10101006,index=1}}};
		{NpcId=1;StrId=901643;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};	
	};	
	[901701] = {
		{NpcId=10101007;StrId=901741;Pos=3;bCam=1;look={35.52,-109.31,1};eye={-26.57,-26.44,29};tm=1500;Patrol={{npc=10101007,index=3},{npc=10101006,index=3}}};
		{NpcId=10101006;StrId=901742;Pos=3;};
		{NpcId=10101007;StrId=901743;Pos=3;};	
		{NpcId=10101006;StrId=901744;Pos=3;};	
		{NpcId=1;StrId=901745;Pos=3;};	
		{NpcId=10101008;StrId=901746;Pos=3;bCam=1;look={9.48,-104.78,1};eye={-17.73,-16.35,24};tm=500;};	
		{NpcId=10101006;StrId=901747;Pos=3;bCam=1;look={46.28,-110.83,1};eye={-25.51,-24.71,28};tm=500;};	
		{NpcId=10101007;StrId=901748;Pos=3;Patrol={{npc=10101007,index=4},{npc=10101006,index=4}}};	
		{NpcId=1;StrId=901749;Pos=3;};	
		{NpcId=10101007;StrId=901750;Pos=3;};					
	};	
	[901801] = {
		{NpcId=10101009;StrId=901841;Pos=3;bCam=1;look={19.22,-107.04,1};eye={-20.85,-17.30,28};tm=500;Patrol={{npc=10101008,index=1},{npc=10101009,index=1}}};
		{NpcId=1;StrId=901842;Pos=3;};
		{NpcId=10101008;StrId=901843;Pos=3;bCam=1;look={39.28,-109.53,1};eye={-25.11,-24.05,30};tm=500;Patrol={{npc=10101008,index=2},{npc=10101009,index=2}}};	
		{NpcId=1;StrId=901844;Pos=3;};	
		{NpcId=10101008;StrId=901845;Pos=3;};						
	};		
	[901901] = {
		{NpcId=10101104;StrId=901941;Pos=1;Delay=1000;};	
	};	
	[901902] = {
		{NpcId=10101006;StrId=901942;Pos=1;Delay=1000;};	
	};	
	[901903] = {
	 {NpcId=1;StrId=901943;Pos=4;};	
	};	
	[902001] = {
		{NpcId=10101096;StrId=902041;Pos=1;Delay=1000;};	
	};	
	[902101] = {
		{NpcId=10101009;StrId=902141;Pos=3;bCam=1;look={35.34,-110.46,1};eye={-24.12,-24.70,28};tm=500;};
		{NpcId=10101006;StrId=902142;Pos=3;};
		{NpcId=10101009;StrId=902143;Pos=3;mNpcId=10101009;NAID=1010200790;};	
		{NpcId=10101006;StrId=902144;Pos=3;mNpcId=10101006;NAID=1002102315;bNAStop=1;};	
		{NpcId=10101009;StrId=902145;Pos=3;};	
		{NpcId=10101006;StrId=902146;Pos=3;};			
	};		
	[902201] = {
		{NpcId=10101084;StrId=902246;Pos=1;Delay=1000;Patrol={{npc=10101084,index=1}}};	
		{NpcId=10101009;StrId=902241;Pos=1;Delay=3000;};	
		{NpcId=10101008;StrId=902242;Pos=1;Delay=3000;};		
	};	
	[902202] = {
		{NpcId=10101015;StrId=902243;Pos=3;bCam=1;look={33.95,-107.90,1};eye={-20.43,-26.26,25};tm=500;};
		{NpcId=10101007;StrId=902244;Pos=3;};
		{NpcId=10101006;StrId=902245;Pos=3;};	
		};
	[902301] = {
		{NpcId=10101008;StrId=902341;Pos=1;Delay=1000;};	
		{NpcId=10101009;StrId=902342;Pos=1;Delay=3000;};		
	};	
	[902302] = {
	 {NpcId=1;StrId=902343;Pos=4;};	
	};	
	[902401] = {
	 {NpcId=1;StrId=902441;Pos=4;};	
	};		
	[902501] = {
	 {NpcId=1;StrId=902541;Pos=4;};	
	};	
	[902502] = {
		{NpcId=1;StrId=902542;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10101002;StrId=902543;Pos=3;bCam=1;look={-38.60,15.78,1};eye={-17.00,-17.37,22};tm=2000;Patrol={{npc=10101002,index=1}}};
		{NpcId=1;StrId=902544;Pos=3;};	
	};	
	[902801] = {
		{NpcId=10101092;StrId=902841;Pos=1;Delay=1000;};	
		{NpcId=10101018;StrId=902842;Pos=1;Delay=4000;};
		{NpcId=10101092;StrId=902843;Pos=1;Delay=4000;};	
		{NpcId=10101018;StrId=902844;Pos=1;Delay=4000;};				
	};		
	[902901] = {
		{NpcId=10101001;StrId=902941;Pos=3;bCam=1;look={-76.13,85.88,1};eye={-15.30,-18.23,19};tm=500;};
		{NpcId=1;StrId=902942;Pos=3;};
		{NpcId=10101001;StrId=902943;Pos=3;};	
		{NpcId=1;StrId=902944;Pos=3;};	
		{NpcId=10101001;StrId=902945;Pos=3;};		
	};	
	[903001] = {
		{NpcId=10101018;StrId=903041;Pos=1;Delay=1000;};	
		{NpcId=10101001;StrId=903042;Pos=1;Delay=3000;};
		{NpcId=10101018;StrId=903043;Pos=1;Delay=3000;};	
		{NpcId=10101001;StrId=903044;Pos=1;Delay=3000;};
		{NpcId=10101018;StrId=903045;Pos=1;Delay=3000;};	
		{NpcId=10101001;StrId=903046;Pos=1;Delay=3000;};			
	};	
	[903201] = {
		{NpcId=10101001;StrId=903241;Pos=3;mNpcId=10101001;NAID=1002100490;bCam=1;look={-47.47,78.24,1};eye={-18.20,-13.39,22};tm=500;};
		{NpcId=1;StrId=903242;Pos=3;};
		{NpcId=10101007;StrId=903243;Pos=3;bCam=1;bCam=1;look={-41.46,87.94,1};eye={-18.68,-13.89,22};tm=1500;};	
		{NpcId=10101001;StrId=903244;Pos=3;};	
		{NpcId=10101006;StrId=903245;Pos=3;Patrol={{npc=10101007,index=2},{npc=10101006,index=2}}};	
		{NpcId=1;StrId=903246;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};			
	};	
	[903301] = {
		{NpcId=10101001;StrId=903341;Pos=3;bCam=1;look={-41.50,88.01,1};eye={-8.86,-10.95,12};tm=500;};
		{NpcId=1;StrId=903342;Pos=3;};
		{NpcId=10101001;StrId=903343;Pos=3;};	
		{NpcId=1;StrId=903344;Pos=3;};	
		{NpcId=10101001;StrId=903345;Pos=3;};		
	};	
	[903401] = {
		{NpcId=10101001;StrId=903441;Pos=3;bCam=1;look={-76.13,85.88,1};eye={-15.30,-18.23,19};tm=500;};
		{NpcId=10101003;StrId=903442;Pos=3;};
		{NpcId=10101001;StrId=903443;Pos=3;};	
		{NpcId=10101003;StrId=903444;Pos=3;};	
		{NpcId=10101001;StrId=903445;Pos=3;};	
		{NpcId=1;StrId=903446;Pos=3;};			
	};
	[903501] = {
		{NpcId=10101093;StrId=903541;Pos=3;bCam=1;look={-8.30,78.01,1};eye={-19.81,-16.82,24};tm=500;};
		{NpcId=10101002;StrId=903542;Pos=3;};
		{NpcId=10101093;StrId=903543;Pos=3;};	
		{NpcId=1;StrId=903544;Pos=3;};	
		{NpcId=10101093;StrId=903545;Pos=3;};	
		{NpcId=1;StrId=903546;Pos=3;};			
	};
	[903701] = {
		{NpcId=10101011;StrId=903741;Pos=3;bCam=1;bCam=1;look={14.47,103.07,1};eye={-18.68,-14.91,24};tm=500;};
		{NpcId=1;StrId=903742;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10101011;StrId=903743;Pos=3;bCam=1;bCam=1;look={14.47,103.07,1};eye={-18.68,-14.91,24};tm=0;};	
		{NpcId=1;StrId=903744;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};	
	};	
	[903801] = {
	 {NpcId=1;StrId=903841;Pos=4;};	
	};	
	[904001] = {
	 {NpcId=1;StrId=904041;Pos=4;};	
	};	
	[904002] = {
		{NpcId=10101094;StrId=904042;Pos=1;Delay=1000;Patrol={{npc=10101094,index=1},{npc=10101095,index=1}}};	
		{NpcId=10101095;StrId=904043;Pos=1;Delay=3000;};		
	};	
	[904301] = {
		{NpcId=10101013;StrId=904341;Pos=1;Delay=1000;ActId=1010201213;};		
	};	
	[904302] = {
	 {NpcId=1;StrId=904342;Pos=4;};	
	};	
	[904401] = {
		{NpcId=10101014;StrId=904441;Pos=1;Delay=1000;Patrol={{npc=10101014,index=1}}};		
	};	
	[904501] = {
		{NpcId=10101013;StrId=904541;Pos=1;Delay=1000;};	
		{NpcId=10101014;StrId=904542;Pos=1;Delay=3000;};		
	};	
	[904701] = {
		{NpcId=10101014;StrId=904741;Pos=3;bCam=1;};
		{NpcId=1;StrId=904742;Pos=3;};
		{NpcId=10101014;StrId=904743;Pos=3;};	
		{NpcId=1;StrId=904744;Pos=3;};	
		{NpcId=10101014;StrId=904745;Pos=3;};	
		{NpcId=1;StrId=904746;Pos=3;};			
	};	
	[904702] = {
		{NpcId=10101014;StrId=904747;Pos=1;Delay=1000;Patrol={{npc=10101014,index=2}}};		
	};	
	[904801] = {
	 {NpcId=1;StrId=904841;Pos=4;};	
	};
	[905001] = {
		{NpcId=10101014;StrId=905041;Pos=1;Delay=1000;};	
		{NpcId=10101112;StrId=905042;Pos=1;Delay=3000;};		
	};		
	[905201] = {
		{NpcId=10101015;StrId=905241;Pos=3;bCam=1;look={-8.44,13.25,1};eye={-4.96,-22.00,24};tm=500;};
		{NpcId=10101014;StrId=905242;Pos=3;bCam=1;look={4.50,2.16,1};eye={-15.52,-17.23,24};tm=500;};
		{NpcId=1;StrId=905243;Pos=3;};	
	};
	[905301] = {
		{NpcId=10101015;StrId=905341;Pos=3;bCam=1;look={-11.23,13.11,1};eye={-15.26,-18.69,22};tm=500;};
		{NpcId=10101015;StrId=905342;Pos=3;bCam=1;look={-11.31,-20.49,1};eye={-4.71,-25.04,20};tm=1500;Patrol={{npc=10101015,index=1}}};			
	};	
	[905401] = {
	 {NpcId=1;StrId=905441;Pos=4;};	
	};	
	[905501] = {
		{NpcId=10101081;StrId=905541;Pos=1;Delay=1000;};	
		{NpcId=10101014;StrId=905542;Pos=1;Delay=3000;};	
		{NpcId=10101081;StrId=905543;Pos=1;Delay=3000;};	
		{NpcId=10101014;StrId=905544;Pos=1;Delay=3000;};			
	};	
	[905701] = {
	 {NpcId=1;StrId=905741;Pos=4;};	
	};	
	[905801] = {
		{NpcId=10101004;StrId=905841;Pos=3;bCam=1;mNpcId=10101004;NAID=1010201513;look={49.95,7.95,1};eye={-26.16,-0.23,21};tm=500;};
		{NpcId=1;StrId=905842;Pos=3;};
		{NpcId=10101004;StrId=905843;Pos=3;};	
		{NpcId=1;StrId=905844;Pos=3;};
		{NpcId=10101004;StrId=905845;Pos=3;mNpcId=10101004;NAID=1010201513;};			
	};	
	[905901] = {
	 {NpcId=10101016;StrId=905941;Pos=1;Delay=1000;};	
	};	
	[906101] = {
	 {NpcId=10101016;StrId=906141;Pos=1;Delay=1000;Patrol={{npc=10101004,index=2},{npc=10101005,index=3},{npc=10101011,index=1}}};	
	 {NpcId=10101011;StrId=906143;Pos=1;Delay=3000;};		 
	};	
	[906201] = {
		{NpcId=10101011;StrId=906241;Pos=3;bCam=1;look={61.35,-4.84,1};eye={-20.38,-15.79,25};tm=500;};
		{NpcId=1;StrId=906242;Pos=3;};
		{NpcId=10101011;StrId=906243;Pos=3;};	
		{NpcId=10101016;StrId=906244;Pos=3;};
		{NpcId=10101011;StrId=906245;Pos=3;};		
		{NpcId=10101016;StrId=906246;Pos=3;};
		{NpcId=10101011;StrId=906247;Pos=3;mNpcId=10101011;NAID=1010201690;};	
		{NpcId=10101011;StrId=906248;Pos=3;Patrol={{npc=10101011,index=2}}};
		{NpcId=10101016;StrId=906249;Pos=3;};				
	};	
	[906301] = {
		{NpcId=10101091;StrId=906341;Pos=1;Delay=1000;};	
		{NpcId=10101011;StrId=906342;Pos=1;Delay=3000;};		
	};	
	[906302] = {
	 {NpcId=1;StrId=906343;Pos=4;};	
	};	
	[906501] = {
		{NpcId=10101011;StrId=906541;Pos=1;Delay=1000;Patrol={{npc=10101011,index=3}}};	
		{NpcId=10101016;StrId=906542;Pos=1;Delay=3000;};		
	};	
	[906601] = {
		{NpcId=10101016;StrId=906641;Pos=1;Delay=1000;};	
		{NpcId=10101011;StrId=906642;Pos=1;Delay=3000;};		
	};	
	[906701] = {
		{NpcId=10101011;StrId=906741;Pos=1;Delay=1000;Patrol={{npc=10101011,index=4}}};	
	};		
	[906702] = {
		{NpcId=10101011;StrId=906742;Pos=3;bCam=1;look={62.41,31.90,1};eye={-9.38,-16.40,15};tm=500;};
		{NpcId=10101002;StrId=906743;Pos=3;};
		{NpcId=10101011;StrId=906744;Pos=3;mNpcId=10101002;NAID=500090;mNpcId=10101011;NAID=1010201691;bNAStop=1;};	
		{NpcId=10101016;StrId=906745;Pos=3;};
		{NpcId=10101002;StrId=906746;Pos=3;bCam=1;look={64.42,25.07,1};eye={-15.22,-22.49,19};tm=1500;Patrol={{npc=10101002,index=3}}};		
		{NpcId=10101016;StrId=906747;Pos=3;};
		{NpcId=1;StrId=906748;Pos=3;};	
		{NpcId=10101016;StrId=906749;Pos=3;};
		{NpcId=1;StrId=906750;Pos=3;};				
	};	
	[907001] = {
		{NpcId=10111001;StrId=907041;Pos=3;bCam=1;look={-104.87,-50.97,1};eye={-20.05,-21.67,24};tm=1500;Patrol={{npc=10111001,index=1}}};
		{NpcId=10111002;StrId=907042;Pos=3;Patrol={{npc=10111002,index=1}}};
	};	
	[1000201] = {
		{NpcId=10111002;StrId=1000241;Pos=3;bCam=1;look={-79.70,-42.39,1};eye={-15.77,-16.98,23};tm=1500;Patrol={{npc=10111002,index=2},{npc=10111001,index=2}}};
		{NpcId=10111002;StrId=1000242;Pos=3;};
		{NpcId=10111002;StrId=1000243;Pos=3;Patrol={{npc=10111002,index=3}}};
		{NpcId=10111001;StrId=1000244;Pos=3;mNpcId=10111001;NAID=1011201681;};
		{NpcId=10111002;StrId=1000245;Pos=3;};		
	};		
	[1000301] = {
		{NpcId=10111003;StrId=1000341;Pos=1;Delay=1000;};	
	};
	[1000401] = {
	 {NpcId=1;StrId=1000441;Pos=4;};	
	};	
	[1000402] = {
		{NpcId=10111001;StrId=1000442;Pos=1;Delay=1000;};
		{NpcId=10111090;StrId=1000443;Pos=1;Delay=2000;Patrol={{npc=10111090,index=1},{npc=10111003,index=1}}};		
	};		
	[1000501] = {
		{NpcId=10111108;StrId=1000541;Pos=1;Delay=1000;Patrol={{npc=10111108,index=1}}};
		{NpcId=10111002;StrId=1000542;Pos=1;Delay=3000;Patrol={{npc=10111002,index=4}}};		
	};	
	[1000502] = {
	 {NpcId=1;StrId=1000543;Pos=4;};	
	};
	[1000601] = {
		{NpcId=10111094;StrId=1000641;Pos=3;bCam=1;look={-60.92,-42.04,1};eye={-27.82,-13.84,19};tm=500;Patrol={{npc=10111002,index=5}}};
		{NpcId=10111002;StrId=1000642;Pos=3;};
	};
	[1000602] = {
		{NpcId=1;StrId=1000645;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10111005;StrId=1000646;Pos=3;bCam=1;look={-50.26,-39.81,1};eye={-14.45,-12.99,19};tm=1000;};
	};
	[1000901] = {
		{NpcId=10111089;StrId=1000941;Pos=3;bCam=1;look={-50.10,-39.76,1};eye={-12.26,-18.23,20};tm=1000;Patrol={{npc=10111089,index=1}}};
		{NpcId=10111005;StrId=1000942;Pos=3;};
		{NpcId=1;StrId=1000943;Pos=3;Patrol={{npc=10111002,index=6}}};
		{NpcId=10111002;StrId=1000944;Pos=3;};
		{NpcId=10111005;StrId=1000945;Pos=3;};
		{NpcId=10111002;StrId=1000946;Pos=3;};		
	};	
	[1001001] = {
	 {NpcId=10111002;StrId=1001041;Pos=1;Delay=1000;Patrol={{npc=10111002,index=7}}};	
	};		
	[1001002] = {
		{NpcId=10111004;StrId=1001042;Pos=1;Delay=1000;};	
		{NpcId=10111002;StrId=1001043;Pos=1;Delay=3000;};		
	};
	[1001201] = {
	 {NpcId=1;StrId=1001241;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};	
	};	
	[1001401] = {
		{NpcId=10111006;StrId=1001441;Pos=1;Delay=500;};		
	};	
	[1001402] = {
		{NpcId=10111101;StrId=1001442;Pos=1;Delay=500;};		
	};	
	[1001403] = {
		{NpcId=10111102;StrId=1001443;Pos=1;Delay=500;};		
	};	
	[1001404] = {
	 {NpcId=1;StrId=1001444;Pos=4;};	
	};
	[1001501] = {
	 {NpcId=1;StrId=1001541;Pos=4;};	
	};	
	[1001701] = {
		{NpcId=10111008;StrId=1001741;Pos=1;Delay=1000;};		
	};	
	[1001801] = {
		{NpcId=10111008;StrId=1001841;Pos=1;Delay=1000;Patrol={{npc=10111008,index=1}}};	
		--{NpcId=10111008;StrId=1001842;Pos=1;Delay=3000;};			
	};	
	[1001901] = {
		{NpcId=10111008;StrId=1001941;Pos=1;Delay=1000;};		
	};		
	[1002101] = {
		{NpcId=1;StrId=1002141;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};
		{NpcId=10111009;StrId=1002142;Pos=3;};
		{NpcId=1;StrId=1002143;Pos=3;};
		{NpcId=10111009;StrId=1002144;Pos=3;bCam=1;look={-5.51,-2.22,1};eye={-25.60,-8.32,15};tm=1500;};
		{NpcId=1;StrId=1002145;Pos=3;};
		{NpcId=10111009;StrId=1002146;Pos=3;};		
	};	
	[1002301] = {
		{NpcId=10111096;StrId=1002341;Pos=1;Delay=1200;};	
	};	
	[1002501] = {
		{NpcId=10111010;StrId=1002541;Pos=1;Delay=500;};	
	};	
	[1002601] = {
		{NpcId=10111097;StrId=1002641;Pos=1;Delay=1000;};	
	};	
	[1002602] = {
		{NpcId=10111011;StrId=1002642;Pos=1;Delay=1000;};	
	};	
	[1002701] = {
		{NpcId=10111011;StrId=1002741;Pos=1;Delay=500;};	
	};	
	[1002801] = {
		{NpcId=10111012;StrId=1002841;Pos=3;bCam=1;look={-6.48,-9.02,1};eye={-15.09,-28.78,20};tm=1000;};
		{NpcId=1;StrId=1002842;Pos=3;};
		{NpcId=10111012;StrId=1002843;Pos=3;};
		{NpcId=10111010;StrId=1002844;Pos=3;};
		{NpcId=10111012;StrId=1002845;Pos=3;};
	};	
	[1003001] = {
		{NpcId=10111011;StrId=1003041;Pos=3;bCam=1;look={-5.99,-10.59,1};eye={-11.95,-14.67,15};tm=500;};
		{NpcId=10111009;StrId=1003042;Pos=3;};
		{NpcId=10111010;StrId=1003043;Pos=3;};
		{NpcId=1;StrId=1003045;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=0;};	
		{NpcId=10111012;StrId=1003046;Pos=3;};	
		{NpcId=1;StrId=1003047;Pos=3;};	
		{NpcId=10111011;StrId=1003048;Pos=3;bCam=1;look={-5.99,-10.59,1};eye={-11.95,-14.67,15};tm=500;};		
	};	
	
--镰	
	[1003002] = {
		{NpcId=10111012;StrId=1003049;Pos=3;bCam=1;look={-6.11,-4.53,1};eye={-18.46,-27.17,26};tm=500;Patrol={{npc=10111009,index=1},{npc=10111010,index=1},{npc=10111011,index=1}}};	
		{NpcId=10111012;StrId=1003050;Pos=3;mNpcId=10111012;NAID=10061001080;Patrol={{npc=10111009,index=3},{npc=10111010,index=3},{npc=10111011,index=3}}};
		{NpcId=1;StrId=1003051;Pos=3;PAID=102001700;};		
	};	
--刀
	[1003003] = {
		{NpcId=10111012;StrId=1003049;Pos=3;bCam=1;look={-6.11,-4.53,1};eye={-18.46,-27.17,26};tm=500;Patrol={{npc=10111009,index=1},{npc=10111010,index=1},{npc=10111011,index=1}}};	
		{NpcId=10111012;StrId=1003050;Pos=3;mNpcId=10111012;NAID=1006100113;Patrol={{npc=10111009,index=3},{npc=10111010,index=3},{npc=10111011,index=3}}};
		{NpcId=1;StrId=1003051;Pos=3;PAID=202101700;};		
	};	
--剑
	[1003004] = {
		{NpcId=10111012;StrId=1003049;Pos=3;bCam=1;look={-6.11,-4.53,1};eye={-18.46,-27.17,26};tm=500;Patrol={{npc=10111009,index=1},{npc=10111010,index=1},{npc=10111011,index=1}}};	
		{NpcId=10111012;StrId=1003050;Pos=3;mNpcId=10111012;NAID=1006100113;Patrol={{npc=10111009,index=3},{npc=10111010,index=3},{npc=10111011,index=3}}};
		{NpcId=1;StrId=1003051;Pos=3;PAID=302101700;};		
	};	
--枪
	[1003005] = {
		{NpcId=10111012;StrId=1003049;Pos=3;bCam=1;look={-6.11,-4.53,1};eye={-18.46,-27.17,26};tm=500;Patrol={{npc=10111009,index=1},{npc=10111010,index=1},{npc=10111011,index=1}}};	
		{NpcId=10111012;StrId=1003050;Pos=3;mNpcId=10111012;NAID=1006100113;Patrol={{npc=10111009,index=3},{npc=10111010,index=3},{npc=10111011,index=3}}};
		{NpcId=1;StrId=1003051;Pos=3;PAID=402001700;};		
	};		
	
	
	[1003101] = {
		{NpcId=10111012;StrId=1003141;Pos=1;Delay=1000;Patrol={{npc=10111009,index=2},{npc=10111010,index=2},{npc=10111011,index=2}}};
	};		
	[1003201] = {
	 {NpcId=1;StrId=1003241;Pos=4;};	
	};	
	[1003202] = {
		{NpcId=10111002;StrId=1003242;Pos=1;Delay=1000;};	
		{NpcId=10111013;StrId=1003243;Pos=1;Delay=3000;};		
	};	
	[1003301] = {
		{NpcId=10111013;StrId=1003341;Pos=3;bCam=1;look={3.57,-20.34,1};eye={-19.18,-14.54,22};tm=500;};
		{NpcId=10111006;StrId=1003342;Pos=3;bCam=1;look={13.03,-19.57,1};eye={-19.56,-23.23,19};tm=1000;};
		{NpcId=10111013;StrId=1003343;Pos=3;bCam=1;look={10.14,-18.41,1};eye={-17.01,-37.91,24};tm=1500;};
		{NpcId=10111006;StrId=1003344;Pos=3;};
		{NpcId=10111013;StrId=1003345;Pos=3;};	
		{NpcId=10111002;StrId=1003346;Pos=3;};	
		{NpcId=10111013;StrId=1003347;Pos=3;};	
		{NpcId=10111006;StrId=1003348;Pos=3;};	
		{NpcId=1;StrId=1003349;Pos=3;};
		{NpcId=10111006;StrId=1003350;Pos=3;};		
	};	
	[1003501] = {
		{NpcId=10111013;StrId=1003541;Pos=1;Delay=1000;};	
		{NpcId=10111086;StrId=1003542;Pos=1;Delay=3000;};		
	};
	[1003601] = {
		{NpcId=10111013;StrId=1003641;Pos=1;Delay=1000;Patrol={{npc=10111013,index=1}}};	
		{NpcId=10111001;StrId=1003642;Pos=1;Delay=3000;Patrol={{npc=10111001,index=3}}};	
		{NpcId=10111019;StrId=1003643;Pos=1;Delay=3000;};	
		{NpcId=10111001;StrId=1003644;Pos=1;Delay=3000;Patrol={{npc=10111001,index=4}}};
		{NpcId=10111013;StrId=1003645;Pos=1;Delay=3000;};			
	};	
	[1003602] = {
	 {NpcId=1;StrId=1003646;Pos=4;};	
	};
	[1003701] = {
		{NpcId=10111013;StrId=1003741;Pos=3;bCam=1;mNpcId=10111001;NAID=1011201613;look={2.57,-19.98,1};eye={-18.51,-17.55,23};tm=500;Patrol={{npc=10111001,index=6}}};
		{NpcId=10111001;StrId=1003742;Pos=3;};
		{NpcId=10111013;StrId=1003743;Pos=3;};
		{NpcId=10111001;StrId=1003744;Pos=3;};
		{NpcId=10111013;StrId=1003745;Pos=3;mNpcId=10111091;NAID=1011201213;Patrol={{npc=10111001,index=7}}};
		{NpcId=1;StrId=1003746;Pos=3;};
	};		
	[1003801] = {
		{NpcId=10111001;StrId=1003841;Pos=3;bCam=1;look={7.04,-19.76,1};eye={-19.20,-19.35,21};tm=500;Patrol={{npc=10111001,index=5},{npc=10111013,index=2}}};
		{NpcId=10111025;StrId=1003842;Pos=3;Patrol={{npc=10111025,index=1}}};
		{NpcId=10111013;StrId=1003843;Pos=3;mNpcId=10111013;NAID=1011201214;};
		{NpcId=10111005;StrId=1003844;Pos=3;};
		{NpcId=10111013;StrId=1003845;Pos=3;mNpcId=10111013;NAID=10112012080;};	
		{NpcId=10111025;StrId=1003846;Pos=3;mNpcId=10111025;NAID=1010200790;};	
		{NpcId=10111013;StrId=1003847;Pos=3;mNpcId=10111013;NAID=1011201214;};	
		{NpcId=10111013;StrId=1003848;Pos=3;Patrol={{npc=10111013,index=3}}};	
	};	
	[1003901] = {
		{NpcId=10111014;StrId=1003941;Pos=3;bCam=1;look={11.28,-19.36,1};eye={-35.28,-0.33,16};tm=500;Patrol={{npc=10111014,index=1}}};
		{NpcId=10111019;StrId=1003942;Pos=3;};
		{NpcId=10111014;StrId=1003943;Pos=3;};
		{NpcId=10111025;StrId=1003944;Pos=3;Patrol={{npc=10111025,index=2}}};
		{NpcId=10111008;StrId=1003945;Pos=3;Patrol={{npc=10111080,index=1},{npc=10111081,index=1}}};
		{NpcId=10111001;StrId=1003946;Pos=3;Patrol={{npc=10111001,index=7}}};
		{NpcId=10111014;StrId=1003947;Pos=3;};
		{NpcId=1;StrId=1003948;Pos=3;Patrol={{npc=10111019,index=1},{npc=10111005,index=3},{npc=10111008,index=2},{npc=10111014,index=2},{npc=10111025,index=3},{npc=10111080,index=2},{npc=10111081,index=2}}};		
	};	
	[1004201] = {
		{NpcId=10111014;StrId=1004241;Pos=1;Delay=1000;};			
	};	
	[1004202] = {
	 {NpcId=1;StrId=1004242;Pos=4;};	
	};	
	[1004301] = {
		{NpcId=1;StrId=1004341;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};
		{NpcId=10111001;StrId=1004342;Pos=3;bCam=1;look={35.98,-82.11,1};eye={-17.72,-18.48,25};tm=500;};
		{NpcId=1;StrId=1004343;Pos=3;};
		{NpcId=10111001;StrId=1004344;Pos=3;Patrol={{npc=10111001,index=8}}};
		{NpcId=1;StrId=1004345;Pos=3;Patrol={{npc=10111001,index=9},{npc=10111004,index=10}}};	
	};
	[1007201] = {
		{NpcId=10111104;StrId=1004441;Pos=1;Delay=1000;Patrol={{npc=10111104,index=1}}};				
		{NpcId=10111080;StrId=1007241;Pos=1;Delay=1000;};
		{NpcId=10111089;StrId=1007242;Pos=1;Delay=3000;};
		{NpcId=10111090;StrId=1007243;Pos=1;Delay=3000;};
	};		
	[1004501] = {
	 {NpcId=1;StrId=1004541;Pos=4;};	
	};
	[1004601] = {
	 {NpcId=1;StrId=1004641;Pos=4;};	
	};	
	[1004602] = {
		{NpcId=10111002;StrId=1004642;Pos=1;Delay=1000;};			
	};		
	[1004901] = {
	 {NpcId=1;StrId=1004941;Pos=4;};	
	};	
	[1005001] = {
		{NpcId=10111002;StrId=1005041;Pos=3;bCam=1;look={-38.27,-85.56,1};eye={-23.48,-16.89,21};tm=500;};
		{NpcId=10111001;StrId=1005042;Pos=3;};
		{NpcId=1;StrId=1005043;Pos=3;};
		{NpcId=10111002;StrId=1005044;Pos=3;Patrol={{npc=10111005,index=1}}};
		{NpcId=10111005;StrId=1005045;Pos=3;};
		{NpcId=10111004;StrId=1005046;Pos=3;mNpcId=10111004;NAID=1010201981;bNAStop=1;};
		{NpcId=10111005;StrId=1005047;Pos=3;Patrol={{npc=10111005,index=2}};mNpcId=10111004;NAID=1010201980;};			
	};	
	[1005201] = {
	 {NpcId=1;StrId=1005241;Pos=4;};	
	};		
	[1005301] = {
		{NpcId=10111004;StrId=1005341;Pos=1;Delay=1000;};
		{NpcId=10111002;StrId=1005342;Pos=1;Delay=3500;};
		{NpcId=10111002;StrId=1005343;Pos=1;Delay=3500;};
		{NpcId=10111004;StrId=1005344;Pos=1;Delay=3500;Patrol={{npc=10111004,index=5}}};
	};	
	[1007301] = {
		{NpcId=10111004;StrId=1005341;Pos=1;Delay=1000;Patrol={{npc=10111004,index=6},{npc=10111002,index=8}}};			
	};		
	[1005401] = {
		{NpcId=10111002;StrId=1005441;Pos=1;Delay=1000;Patrol={{npc=10111002,index=9}}};			
	};		
	[1005501] = {
		{NpcId=10111004;StrId=1005541;Pos=1;Delay=1000;Patrol={{npc=10111004,index=7}}};			
	};	
	[1005502] = {
	 {NpcId=1;StrId=1005542;Pos=4;};	
	};	
	[1005601] = {
		{NpcId=10111015;StrId=1005641;Pos=3;bCam=1;mNpcId=10111015;NAID=1011201513;look={-52,-83.99,1};eye={-16.19,-16.80,23};tm=500;Patrol={{npc=10111015,index=1},{npc=10111083,index=1},{npc=10111084,index=1},{npc=10111085,index=1}}};
		{NpcId=1;StrId=1005642;Pos=3;};
		{NpcId=10111015;StrId=1005643;Pos=3;};
		{NpcId=1;StrId=1005644;Pos=3;};
		{NpcId=10111015;StrId=1005645;Pos=3;};	
	};	
	[1005801] = {
		{NpcId=10111015;StrId=1005841;Pos=1;Delay=1000;};			
	};	
	[1005901] = {
		{NpcId=10111018;StrId=1005941;Pos=3;bCam=1;look={-51.15,-108.34,1};eye={-20.35,-17.01,25};tm=1500;};
		{NpcId=10111015;StrId=1005942;Pos=3;};
		{NpcId=10111018;StrId=1005943;Pos=3;};
	};	
	[1006101] = {
		{NpcId=10111016;StrId=1006141;Pos=3;bCam=1;look={-30.52,-85.65,1};eye={-16.94,-23.67,19};tm=500;};
		{NpcId=1;StrId=1006142;Pos=3;};
		{NpcId=10111016;StrId=1006143;Pos=3;};
		{NpcId=1;StrId=1006144;Pos=3;};
		{NpcId=10111016;StrId=1006145;Pos=3;};
		{NpcId=10111015;StrId=1006146;Pos=3;Patrol={{npc=10111015,index=2}}};
		{NpcId=10111016;StrId=1006147;Pos=3;};
		{NpcId=10111015;StrId=1006148;Pos=3;};
		{NpcId=10111016;StrId=1006149;Pos=3;};		
	};	
 [1006201] = {
		{NpcId=10111016;StrId=1006241;Pos=1;Delay=1000;};
		{NpcId=10111015;StrId=1006242;Pos=1;Delay=1000;};		
 };
	[1006301] = {
	 {NpcId=1;StrId=1006341;Pos=4;};	
	}; 
	[1006501] = {
		{NpcId=1;StrId=1006541;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;Patrol={{npc=10111078,index=1},{npc=10111079,index=1}}};
		{NpcId=10111018;StrId=1006542;Pos=3;};
		{NpcId=10111015;StrId=1006543;Pos=3;bCam=1;look={-4.1,7.9,1};eye={-17.03,-27.91,21};tm=500;};
		{NpcId=10111018;StrId=1006544;Pos=3;};
		{NpcId=10111015;StrId=1006545;Pos=3;};
		{NpcId=10111018;StrId=1006546;Pos=3;Patrol={{npc=10111078,index=2},{npc=10111079,index=2}}};
		{NpcId=10111015;StrId=1006547;Pos=3;Patrol={{npc=10111015,index=3},{npc=10111018,index=1}}};	
	};
 [1006502] = {
		{NpcId=10111078;StrId=1006548;Pos=1;Delay=1000;};
		{NpcId=10111079;StrId=1006549;Pos=1;Delay=3500;};
		{NpcId=10111078;StrId=1006550;Pos=1;Delay=3500;};
		{NpcId=10111079;StrId=1006551;Pos=1;Delay=3500;};			
 };	
 [1006601] = {
		{NpcId=10111077;StrId=1006641;Pos=1;Delay=1000;};
		{NpcId=10111018;StrId=1006642;Pos=1;Delay=3500;};
		{NpcId=10111015;StrId=1006643;Pos=1;Delay=3500;};
		{NpcId=10111077;StrId=1006644;Pos=1;Delay=3500;};			
 };	
 [1006701] = {
		{NpcId=10111079;StrId=1006741;Pos=1;Delay=1000;};
		{NpcId=10111015;StrId=1006742;Pos=1;Delay=2000;ActId=1011201513;Patrol={{npc=10111079,index=3}}};
		{NpcId=10111079;StrId=1006743;Pos=1;Delay=1500;ActId=1011201015;pause=1;};		
 }; 
	[1006702] = {
	 {NpcId=1;StrId=1006744;Pos=4;};	
	}; 
 [1006801] = {
		{NpcId=10111016;StrId=1006841;Pos=1;Delay=1000;};
		{NpcId=10111018;StrId=1006842;Pos=1;Delay=3500;};
		{NpcId=10111016;StrId=1006843;Pos=1;Delay=3500;};		
 };	
 [1006901] = {
		{NpcId=10111083;StrId=1006941;Pos=1;Delay=1000;};
		{NpcId=10111016;StrId=1006942;Pos=1;Delay=3000;};
 };	 
 [1007401] = {
		{NpcId=10111016;StrId=1007441;Pos=1;Delay=1000;};
 };	 
	[1007601] = {
		{NpcId=10111016;StrId=1007641;Pos=3;bCam=1;look={8.33,13.21,1};eye={-22.52,3.73,20};tm=500;Patrol={{npc=10111016,index=1}}};
		{NpcId=1;StrId=1007642;Pos=3;};
		{NpcId=10111016;StrId=1007643;Pos=3;};
		{NpcId=1;StrId=1007644;Pos=3;};
		{NpcId=10111016;StrId=1007645;Pos=3;};
		{NpcId=1;StrId=1007646;Pos=3;};
	};
	[1007701] = {
		{NpcId=10111076;StrId=1007741;Pos=3;bCam=1;mNpcId=10111076;NAID=10112010080;look={3.40,18.32,1};eye={-17.71,-18.98,20};tm=500;};
		{NpcId=10111076;StrId=1007742;Pos=3;Patrol={{npc=10111076,index=1}};mNpcId=10111083;NAID=1011201515;bNAStop=1;};
		{NpcId=10111076;StrId=1007743;Pos=3;Patrol={{npc=10111076,index=2},{npc=10111016,index=3}};bCam=1;look={8.33,13.21,1};eye={-22.52,3.73,20};tm=500;mNpcId=10111018;NAID=1011201515;bNAStop=1;};
		{NpcId=10111076;StrId=1007744;Pos=3;Patrol={{npc=10111076,index=3}}};
		{NpcId=1;StrId=1007745;Pos=3;};
	};	
	[1007801] = {
	 {NpcId=1;StrId=1007841;Pos=4;};	
	};
	[1007802] = {
	 {NpcId=1;StrId=1007842;Pos=4;};	
	};
	[1007901] = {
		{NpcId=10121001;StrId=1007941;Pos=1;Delay=1000;};
	};
	
	[1100101] = {
	 {NpcId=1;StrId=1100141;Pos=4;};	
	}; 
	[1100201] = {
		{NpcId=10121001;StrId=1100241;Pos=1;Delay=100;};
	};
	[1100202] = {
	 {NpcId=1;StrId=1100242;Pos=4;};	
	}; 
	[1100301] = {
		{NpcId=10121003;StrId=1100341;Pos=1;Delay=1000;};
		{NpcId=10121001;StrId=1100342;Pos=1;Delay=3000;};	
		{NpcId=10121003;StrId=1100343;Pos=1;Delay=3000;};			
	};
	[1100401] = {
	 {NpcId=1;StrId=1100441;Pos=4;};	
	};
	[1100402] = {
		{NpcId=10121001;StrId=1100442;Pos=3;bCam=1;look={-72.57,6.75,1};eye={-13.05,-23.46,18};tm=1000;Patrol={{npc=10121001,index=1},{npc=10121003,index=1}}};
		{NpcId=10121003;StrId=1100443;Pos=3;};
		{NpcId=10121003;StrId=1100444;Pos=3;};
		{NpcId=10121001;StrId=1100445;Pos=3;};	
		{NpcId=10121003;StrId=1100446;Pos=3;Patrol={{npc=10121001,index=2},{npc=10121003,index=2}}};			
	};	
	[1100501] = {
	 {NpcId=1;StrId=1100541;Pos=4;};	
	};
	[1100502] = {
	 {NpcId=1;StrId=1100542;Pos=4;};	
	}; 	
	[1100503] = {
		{NpcId=10121005;StrId=1100543;Pos=3;bCam=1;look={-65.38,55.60,1};eye={-18.82,-14.31,17};tm=1000;};
		{NpcId=10121008;StrId=1100544;Pos=3;};
		{NpcId=10121005;StrId=1100545;Pos=3;};
		{NpcId=10121009;StrId=1100546;Pos=3;};
		{NpcId=10121008;StrId=1100547;Pos=3;};
		{NpcId=10121005;StrId=1100548;Pos=3;};
		{NpcId=10121008;StrId=1100549;Pos=3;};
		{NpcId=10121009;StrId=1100550;Pos=3;};	
		{NpcId=1;StrId=1100551;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=1000;};				
	};	
	[1100601] = {
		{NpcId=10121008;StrId=1100641;Pos=1;Delay=1000;Patrol={{npc=10121008,index=1},{npc=10121009,index=1}}};
		{NpcId=10121009;StrId=1100642;Pos=1;Delay=3000;};			
	};	
	[1100801] = {
		{NpcId=1;StrId=1100841;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=1000;};
		{NpcId=1;StrId=1100842;Pos=3;};
		{NpcId=10121005;StrId=1100843;Pos=3;bCam=1;look={38.24,87.95,1};eye={-20.61,-16.52,20};tm=500;Patrol={{npc=10121005,index=1}}};
		{NpcId=1;StrId=1100844;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=1000;};
		{NpcId=10121002;StrId=1100845;Pos=3;};
		{NpcId=1;StrId=1100846;Pos=3;};
		{NpcId=10121002;StrId=1100847;Pos=3;};
		{NpcId=1;StrId=1100848;Pos=3;Patrol={{npc=10121004,index=1}}};			
	};	
	[1100802] = {
		{NpcId=10121004;StrId=1100849;Pos=1;Delay=1000;};
	};
	[1100901] = {
		{NpcId=10121101;StrId=1100941;Pos=1;Delay=1000;};
	};
	[1100902] = {
		{NpcId=10121004;StrId=1100942;Pos=1;Delay=1000;mNpcId=10121004;NAID=1011201015;bNAStop=1;};
	};	
	[1100903] = {
	 {NpcId=1;StrId=1100943;Pos=4;};	
	}; 	
	[1101001] = {
		{NpcId=10121005;StrId=1101041;Pos=1;Delay=1000;};
	};	
	[1101101] = {
		{NpcId=10121005;StrId=1101141;Pos=1;Delay=1000;};
	};	
	[1101102] = {
	 {NpcId=1;StrId=1101142;Pos=4;};	
	}; 
	[1101201] = {
		{NpcId=10121006;StrId=1101241;Pos=3;bCam=1;};
		{NpcId=10121096;StrId=1101242;Pos=3;Patrol={{npc=10121099,index=1}}};
		{NpcId=1;StrId=1101244;Pos=3;};		
	};	
	[1101401] = {
		{NpcId=10121097;StrId=1101441;Pos=3;bCam=1;look={-19.98,76.65,1};eye={-20.95,-21.10,24};tm=500;};
		{NpcId=10121006;StrId=1101442;Pos=3;};
		{NpcId=10121097;StrId=1101443;Pos=3;};
		{NpcId=1;StrId=1101444;Pos=3;};
		{NpcId=10121097;StrId=1101445;Pos=3;};
		{NpcId=1;StrId=1101446;Pos=3;bCam=1;look={-5,3,1};eye={-19.26,-20.15,20};tm=1500;};
		{NpcId=10121097;StrId=1101447;Pos=3;bCam=1;look={-19.98,76.65,1};eye={-20.95,-21.10,24};tm=500;};
		{NpcId=1;StrId=1101448;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};			
	};	
	[1101501] = {
	 {NpcId=1;StrId=1101541;Pos=4;};	
	}; 
	[1101601] = {
	 {NpcId=1;StrId=1101641;Pos=4;};	
	}; 
	[1101602] = {
		{NpcId=10121007;StrId=1101642;Pos=1;Delay=1000;};
	};	
	[1101603] = {
	 {NpcId=1;StrId=1101643;Pos=4;};	
	};	
	[1101801] = {
		{NpcId=10121117;StrId=1101841;Pos=1;Delay=1000;Patrol={{npc=10121117,index=1}}};
		{NpcId=10121117;StrId=1101842;Pos=1;Delay=1000;};		
	};		
	[1101901] = {
	 {NpcId=1;StrId=1101941;Pos=4;};	
	};	
	[1108001] = {
		{NpcId=10121008;StrId=1108041;Pos=3;bCam=1;bCam=1;look={1.89,-6.15,1};eye={-16.60,-15.47,19};tm=500;};
		{NpcId=1;StrId=1108042;Pos=3;};
	};	
	[1102001] = {	
		{NpcId=10121007;StrId=1102041;Pos=3;bCam=1;look={-1.88,1.77,1};eye={-16.85,-18.17,21};tm=500;};
		{NpcId=10121008;StrId=1102042;Pos=3;};
		{NpcId=10121007;StrId=1102043;Pos=3;};
		{NpcId=10121009;StrId=1102044;Pos=3;};
		{NpcId=10121007;StrId=1102045;Pos=3;};
		{NpcId=1;StrId=1102046;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};			
	};
	[1102002] = {
		{NpcId=10121116;StrId=1102047;Pos=1;Delay=1000;Patrol={{npc=10121116,index=1}}};
	};	
	[1102101] = {
	 {NpcId=1;StrId=1102141;Pos=4;};	
	};
	[1102201] = {
		{NpcId=10121009;StrId=1102241;Pos=1;Delay=1000;};
		{NpcId=10121008;StrId=1102242;Pos=1;Delay=3000;};		
	};	
	[1102202] = {
		{NpcId=10121009;StrId=1102243;Pos=3;bCam=1;look={-6.06,5.33,1};eye={-20.22,-16.53,18};tm=500;};
		{NpcId=1;StrId=1102244;Pos=3;};
		{NpcId=10121010;StrId=1102245;Pos=3;};		
	};	
	[1102401] = {
		{NpcId=10121010;StrId=1102441;Pos=3;bCam=1;look={-5.61,-6.30,1};eye={-13.30,-21.22,21};tm=500;};
		{NpcId=1;StrId=1102442;Pos=3;};
		{NpcId=10121010;StrId=1102443;Pos=3;bCam=1;look={-5.46,-3.36,1};eye={-21.51,-22.27,25};tm=2000;};	
		{NpcId=1;StrId=1102444;Pos=3;};			
	};	
	[1102501] = {
		{NpcId=10121010;StrId=1102541;Pos=3;bCam=1;look={-4.95,0.04,1};eye={-13.48,-19.46,23};tm=1500;};
		{NpcId=1;StrId=1102542;Pos=3;};
		{NpcId=10121010;StrId=1102543;Pos=3;};	
		{NpcId=1;StrId=1102544;Pos=3;};	
		{NpcId=10121011;StrId=1102545;Pos=3;bCam=1;look={-10.49,-5.49,1};eye={-14.59,-23.91,21};tm=500;};	
		{NpcId=1;StrId=1102546;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};			
	};	
	[1102601] = {
		{NpcId=10121011;StrId=1102641;Pos=3;bCam=1;look={-10.08,-3.14,1};eye={13.14,-25.17,22};tm=1500;};
		{NpcId=1;StrId=1102642;Pos=3;};
		{NpcId=10121011;StrId=1102643;Pos=3;};	
		{NpcId=1;StrId=1102644;Pos=3;};	
		{NpcId=10121011;StrId=1102645;Pos=3;mNpcId=10121011;NAID=50302014020;};	
		{NpcId=10121010;StrId=1102646;Pos=3;bCam=1;look={-8.02,-1.45,1};eye={14.84,-23.35,22};tm=500;};
		{NpcId=1;StrId=1102647;Pos=3;};			
	};		
	[1102701] = {
	 {NpcId=1;StrId=1102741;Pos=4;};	
	};
	[1102702]	=	{
	 {NpcId=1;StrId=1102742;Pos=4;};		
	};
	[1102901] = {
		{NpcId=10121011;StrId=1102941;Pos=3;bCam=1;look={49.91,57.73,1};eye={-18.28,-24.53,21};tm=1500;};
		{NpcId=10121095;StrId=1102942;Pos=3;};
		{NpcId=10121097;StrId=1102943;Pos=3;bCam=1;look={29.80,55.92,1};eye={-15.23,-20.42,21};tm=500;};	
		{NpcId=1;StrId=1102944;Pos=3;};	
		{NpcId=10121096;StrId=1102945;Pos=3;mNpcId=10121096;NAID=1011201013;};	
		{NpcId=10121011;StrId=1102946;Pos=3;bCam=1;look={49.91,57.73,1};eye={-18.28,-24.53,21};tm=500;mNpcId=10121011;NAID=50302014020;};
		{NpcId=10121099;StrId=1102947;Pos=3;bCam=1;look={29.80,55.92,1};eye={-15.23,-20.42,21};tm=500;mNpcId=10121099;NAID=1012200113;};
		{NpcId=10121097;StrId=1102948;Pos=3;};
		{NpcId=1;StrId=1102949;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};		
	};	
	[1103001] = {
		{NpcId=10121092;StrId=1103041;Pos=1;Delay=1000;ActId=5030201415;pause=1;};
		{NpcId=10121095;StrId=1103042;Pos=1;Delay=3000;ActId=1010201313;};
		{NpcId=10121096;StrId=1103043;Pos=1;Delay=3000;ActId=1011201013;};
		{NpcId=10121097;StrId=1103044;Pos=1;Delay=3000;};		
	};		
	[1103101] = {
		{NpcId=10121013;StrId=1103141;Pos=3;bCam=1;look={-9.71,-31.85,1};eye={-21.12,-18.39,18};tm=1000;};
		{NpcId=1;StrId=1103142;Pos=3;};
		{NpcId=10121013;StrId=1103143;Pos=3;};			
	};	
	[1103301] = {
		{NpcId=1;StrId=1103341;Pos=3;bCam=1;};
		{NpcId=10121008;StrId=1103342;Pos=3;};
	};	
	[1103401] = {
		{NpcId=10121013;StrId=1103441;Pos=1;Delay=1000;};
	};	
	[1103501] = {
		{NpcId=10121014;StrId=1103541;Pos=1;Delay=1000;Patrol={{npc=10121014,index=1}}};
		{NpcId=10121013;StrId=1103542;Pos=1;Delay=3000;};
		{NpcId=10121014;StrId=1103543;Pos=1;Delay=3000;};
		{NpcId=10121013;StrId=1103544;Pos=1;Delay=3000;Patrol={{npc=10121014,index=2},{npc=10121013,index=1}};};		
	};	
	[1103601] = {
		{NpcId=10121015;StrId=1103641;Pos=3;bCam=1;look={34.84,-1.13,1};eye={-16.22,-17.67,18};tm=1000;};
		{NpcId=10121014;StrId=1103642;Pos=3;};
		{NpcId=10121008;StrId=1103643;Pos=3;bCam=1;look={33.45,1.27,1};eye={-16.96,-21.98,21};tm=500;Patrol={{npc=10121008,index=2}}};	
		{NpcId=10121015;StrId=1103644;Pos=3;};	
		{NpcId=10121009;StrId=1103645;Pos=3;Patrol={{npc=10121009,index=2}}};	
		{NpcId=10121015;StrId=1103646;Pos=3;};
		{NpcId=10121009;StrId=1103647;Pos=3;};
		{NpcId=10121015;StrId=1103648;Pos=3;};	
	};	
	[1103901] = {
		{NpcId=1;StrId=1103941;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};
		{NpcId=10121016;StrId=1103942;Pos=3;bCam=1;look={66.74,-40.81,1};eye={-14.67,-17.21,18};tm=1000;};
		{NpcId=1;StrId=1103943;Pos=3;};	
		{NpcId=10121016;StrId=1103944;Pos=3;};	
		{NpcId=1;StrId=1103945;Pos=3;};	
		{NpcId=1;StrId=1103946;Pos=3;};
		{NpcId=10121016;StrId=1103947;Pos=3;};
		{NpcId=1;StrId=1103948;Pos=3;};	
	};		
	[1103902]	=	{
	 {NpcId=1;StrId=1103949;Pos=4;};		
	};	
	[1104101] = {
		{NpcId=10121008;StrId=1104141;Pos=3;bCam=1;look={72.15,-24.41,1};eye={-11.06,-12.25,12};tm=1000;Patrol={{npc=10121008,index=3}}};
		{NpcId=10121017;StrId=1104142;Pos=3;};
		{NpcId=10121008;StrId=1104143;Pos=3;};	
		{NpcId=10121017;StrId=1104144;Pos=3;};	
		{NpcId=1;StrId=1104145;Pos=3;};	
		{NpcId=10121008;StrId=1104146;Pos=3;};
		{NpcId=1;StrId=1104147;Pos=3;};
	};	
	[1104201] = {
		{NpcId=10121014;StrId=1104241;Pos=3;bCam=1;look={25.08,-53.42,1};eye={-21.56,-19.01,16};tm=1000;};
		{NpcId=10121013;StrId=1104242;Pos=3;};
		{NpcId=1;StrId=1104243;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};	
		{NpcId=10121008;StrId=1104244;Pos=3;};
		{NpcId=10121013;StrId=1104245;Pos=3;bCam=1;look={25.08,-53.42,1};eye={-21.56,-19.01,16};tm=500;};	
		{NpcId=1;StrId=1104246;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=1500;};		
	};		
	[1104401] = {
		{NpcId=10121014;StrId=1104441;Pos=3;bCam=1;{25.08,-53.42,1};eye={-21.56,-19.01,16};tm=1000;};
		{NpcId=1;StrId=1104442;Pos=3;Patrol={{npc=10121014,index=3}}};
		{NpcId=10121008;StrId=1104443;Pos=3;Patrol={{npc=10121014,index=4},{npc=10121008,index=4}}};	
		{NpcId=1;StrId=1104444;Pos=3;};	
	};	
	[1104501]	=	{
		{NpcId=1;StrId=1104541;Pos=4;};
	};	
	[1104601]	=	{
		{NpcId=1;StrId=1104641;Pos=4;};
	};	
	[1104701]	=	{
		{NpcId=1;StrId=1104741;Pos=4;};
	};	
	[1104801]	=	{
		{NpcId=1;StrId=1104841;Pos=4;};
	};		
	[1104901]	=	{
		{NpcId=1;StrId=1104941;Pos=4;};
	};		
	[1104902] = {
		{NpcId=1;StrId=1104942;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=1000;};
		{NpcId=10121019;StrId=1104943;Pos=3;Patrol={{npc=10121019,index=1}}};
		{NpcId=1;StrId=1104944;Pos=3;};	
		{NpcId=10121019;StrId=1104945;Pos=3;mNpcId=10121019;NAID=1004200113;};	
	};		
	[1105101] = {
		{NpcId=10121019;StrId=1105141;Pos=1;Delay=1000;Patrol={{npc=10121019,index=2}}};
	};	
	[1105201] = {
		{NpcId=10121026;StrId=1105241;Pos=3;bCam=1;look={-2.06,-0.14,1};eye={-18.73,-17.23,20};tm=500;};
		{NpcId=1;StrId=1105242;Pos=3;};
		{NpcId=10121026;StrId=1105243;Pos=3;};	
		{NpcId=1;StrId=1105244;Pos=3;};	
	};	
	[1105202] = {
		{NpcId=10121020;StrId=1105247;Pos=1;Delay=1000;};
	};	
	[1105301]	=	{
		{NpcId=1;StrId=1105341;Pos=4;};
	};	
	[1105401]	=	{
		{NpcId=1;StrId=1105441;Pos=4;};
	};	
	[1105402]	=	{
		{NpcId=1;StrId=1105442;Pos=4;};
	};	
	[1105501]	=	{
		{NpcId=1;StrId=1105541;Pos=4;};
	};		
	[1105502] = {
		{NpcId=10121020;StrId=1105542;Pos=1;Delay=1000;};
	};	
	[1105601]	=	{
		{NpcId=1;StrId=1105641;Pos=4;};
	};	
	[1105602]	=	{
		{NpcId=1;StrId=1105642;Pos=4;};
	};	
	[1105603]	=	{
		{NpcId=1;StrId=1105643;Pos=4;};
	};			
	[1105701] = {
		{NpcId=1;StrId=1105741;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=1000;};
		{NpcId=10121014;StrId=1105742;Pos=3;bCam=1;look={-3.32,-1.07,1};eye={-28.45,-2.63,22};tm=1000;};
		{NpcId=1;StrId=1105743;Pos=3;};	
		{NpcId=10121014;StrId=1105744;Pos=3;};
		{NpcId=1;StrId=1105745;Pos=3;};	
		{NpcId=10121014;StrId=1105746;Pos=3;};
		{NpcId=1;StrId=1105747;Pos=3;};		
	};	
	[1105801]	=	{
		{NpcId=1;StrId=1105841;Pos=4;};
	};	
	[1105901]	=	{
		{NpcId=1;StrId=1105941;Pos=4;};
	};
	[1107801]	=	{
		{NpcId=10121021;StrId=1105942;Pos=1;Delay=1000;};
		{NpcId=10121087;StrId=1105943;Pos=1;Delay=3000;};
		{NpcId=10121021;StrId=1105944;Pos=1;Delay=3000;};	
	};	
	[1106001]	=	{
		{NpcId=1;StrId=1106041;Pos=4;};
	};
	[1106101] = {
		{NpcId=10121021;StrId=1106141;Pos=1;Delay=1000;};
	};	
	[1106301] = {
		{NpcId=10121022;StrId=1106341;Pos=1;Delay=1000;};
	};	
	[1106701] = {
		{NpcId=10121030;StrId=1106741;Pos=1;Delay=1000;};
	};	
	[1106901] = {
		{NpcId=10121029;StrId=1106945;Pos=3;bCam=1;look={-3.48,-7.53,1};eye={-17.42,-13.85,21};tm=1000;Patrol={{npc=10121029,index=1},{npc=10121031,index=1}}};	
		{NpcId=10121029;StrId=1106941;Pos=3;bCam=1;look={-12.29,-9.41,1};eye={-10.21,-21.93,22};tm=1500;};
		{NpcId=10121031;StrId=1106942;Pos=3;Patrol={{npc=10121030,index=1},{npc=10121031,index=2},{npc=10121083,index=1},{npc=10121077,index=1},{npc=10121078,index=1},{npc=10121079,index=1},{npc=10121080,index=1}}};
		{NpcId=10121029;StrId=1106944;Pos=3;};	
	};		
	[1107001] = {
		{NpcId=10121076;StrId=1107041;Pos=3;bCam=1;look={-21.56,-7.64,1};eye={-14.69,-18.12,23};tm=1000;Patrol={{npc=10121076,index=1}}};
		{NpcId=10121031;StrId=1107042;Pos=3;bCam=1;look={-12.29,-9.41,1};eye={-10.21,-21.93,22};tm=500;};
		{NpcId=10121029;StrId=1107043;Pos=3;};	
		{NpcId=10121029;StrId=1107044;Pos=3;};
		{NpcId=1;StrId=1107045;Pos=3;};	
		{NpcId=10121086;StrId=1107046;Pos=3;bCam=1;look={-21.56,-7.64,1};eye={-14.69,-18.12,23};tm=500;};
		{NpcId=1;StrId=1107047;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};		
	};		
	[1107101]	=	{
		{NpcId=1;StrId=1107141;Pos=4;};
	};
	[1107102] = {
		{NpcId=10121032;StrId=1107142;Pos=3;bCam=1;look={-25.75,-7.13,1};eye={-2.60,-23.29,23};tm=1000;Patrol={{npc=10121032,index=1}}};
		{NpcId=10121029;StrId=1107143;Pos=3;};
		{NpcId=1;StrId=1107144;Pos=3;};	
	};
 [1107201] = {
		{NpcId=10121081;StrId=1107241;Pos=1;Delay=1000;};
		{NpcId=10121086;StrId=1107242;Pos=1;Delay=3000;}; 
 }; 
 [1107301] = {
		{NpcId=1;StrId=1107341;Pos=4;};  
 };
	[1107302] = {
		{NpcId=10121029;StrId=1107342;Pos=3;bCam=1;look={-25.75,-7.13,1};eye={-2.60,-23.29,23};tm=1000;};
		{NpcId=10121083;StrId=1107343;Pos=3;Patrol={{npc=10121031,index=3},{npc=10121083,index=2},{npc=10121080,index=2},{npc=10121073,index=1},{npc=10121074,index=1},{npc=10121086,index=1}}};
		{NpcId=1;StrId=1107344;Pos=3;};
		{NpcId=10121029;StrId=1107345;Pos=3;};		
	}; 
	[1107501] = {
		{NpcId=10121030;StrId=1107541;Pos=3;bCam=1;look={-20.80,-7.63,1};eye={-18.18,-14.07,20};tm=1000;};
		{NpcId=10121029;StrId=1107542;Pos=3;};
		{NpcId=1;StrId=1107543;Pos=3;Patrol={{npc=10121029,index=2}}};
		{NpcId=10121033;StrId=1107544;Pos=3;};	
		{NpcId=10121029;StrId=1107545;Pos=3;};
		{NpcId=10121033;StrId=1107546;Pos=3;};
		{NpcId=10121029;StrId=1107547;Pos=3;bCam=1;look={-16.25,-9.77,1};eye={-18.16,-7.5,20};tm=1500;Patrol={{npc=10121029,index=3},{npc=10121033,index=1}}};
		{NpcId=10121030;StrId=1107548;Pos=3;};				
	};
	[1107502] = {
		{NpcId=10121033;StrId=1107549;Pos=1;Delay=1000;};
	};		
	[1107601] = {
		{NpcId=10121033;StrId=1107641;Pos=1;Delay=1000;};
	};	
	[1107602] = {
		{NpcId=1;StrId=1107642;Pos=4;}; 
	};	
	[1200101] = {
		{NpcId=10131001;StrId=1200141;Pos=1;Delay=1000;Patrol={{npc=10131001,index=1}}};
	};	
	[1200102] = {
		{NpcId=10131098;StrId=1200142;Pos=1;Delay=1000;Patrol={{npc=10131098,index=1}}};
		{NpcId=10131001;StrId=1200143;Pos=1;Delay=3000;};	
		{NpcId=10131098;StrId=1200144;Pos=1;Delay=3000;Patrol={{npc=10131098,index=2}}};		
	};	
	[1200201] = {
		{NpcId=1;StrId=1200241;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};	
		{NpcId=10131001;StrId=1200242;Pos=3;};
		{NpcId=1;StrId=1200243;Pos=3;};
		{NpcId=10131001;StrId=1200244;Pos=3;};
		{NpcId=1;StrId=1200245;Pos=3;};		
	};
	[1200301] = {
		{NpcId=10131098;StrId=1200341;Pos=3;bCam=1;look={12.73,51.45,1};eye={-26.64,7.98,21};tm=1000;};
		{NpcId=1;StrId=1200342;Pos=3;};
		{NpcId=10131098;StrId=1200343;Pos=3;};
		{NpcId=10131001;StrId=1200344;Pos=3;};		
	}; 
	[1200401] = {
		{NpcId=10131098;StrId=1200441;Pos=1;Delay=1000;};
		{NpcId=10131001;StrId=1200442;Pos=1;Delay=3000;};	
	}; 
	[1200402] = {
		{NpcId=1;StrId=1200443;Pos=4;}; 
	};	
	[1200403] = {
		{NpcId=10131001;StrId=1200444;Pos=3;bCam=1;look={36.77,33.38,1};eye={-21.42,-14.68,20};tm=1000;};
		{NpcId=10131002;StrId=1200445;Pos=3;};
		{NpcId=10131001;StrId=1200446;Pos=3;};
		{NpcId=10131002;StrId=1200447;Pos=3;};
		{NpcId=10131001;StrId=1200448;Pos=3;};
		{NpcId=10131002;StrId=1200449;Pos=3;};
		{NpcId=1;StrId=1200450;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=1000;};					
	}; 
	[1200501] = {
		{NpcId=10131002;StrId=1200541;Pos=1;Delay=1000;};
		{NpcId=10131001;StrId=1200542;Pos=1;Delay=3000;};		
	};		
	[1200601] = {
		{NpcId=10131001;StrId=1200641;Pos=1;Delay=1000;};
	};	
	[1200602] = {
		{NpcId=1;StrId=1200642;Pos=4;}; 
	};
	[1200801] = {
		{NpcId=10131094;StrId=1200841;Pos=1;Delay=1000;};
	};	
	[1200802] = {
		{NpcId=10131095;StrId=1200842;Pos=1;Delay=1000;};
	};	
	[1200803] = {
		{NpcId=10131096;StrId=1200843;Pos=1;Delay=1000;};
	};	
	[1201101] = {
		{NpcId=10131001;StrId=1201141;Pos=1;Delay=1000;};
		{NpcId=10131002;StrId=1201142;Pos=1;Delay=3000;};
		{NpcId=10131001;StrId=1201143;Pos=1;Delay=3000;};	
		{NpcId=10131002;StrId=1201144;Pos=1;Delay=3000;};			
	};
	[1201201] = {
		{NpcId=1;StrId=1201241;Pos=4;}; 
	};	
	[1201301] = {
		{NpcId=10131002;StrId=1201341;Pos=3;bCam=1;look={-7.11,-21.85,1};eye={-15.42,-22.27,19};tm=500;};
		{NpcId=1;StrId=1201342;Pos=3;};
		{NpcId=10131001;StrId=1201343;Pos=3;};
	};	
	[1201401] = {
		{NpcId=1;StrId=1201441;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};
		{NpcId=10131002;StrId=1201442;Pos=3;bCam=1;look={-10.24,2.99,1};eye={-21.15,-12.31,21};tm=1000;};
		{NpcId=10131094;StrId=1201443;Pos=3;};
		{NpcId=10131001;StrId=1201444;Pos=3;};		
	};	
	[1201402] = {
		{NpcId=1;StrId=1201445;Pos=4;}; 
	};	
	[1201501] = {
		{NpcId=10131001;StrId=1201541;Pos=3;bCam=1;look={9.93,8.58,1};eye={-16.12,-22.37,20};tm=500;};
		{NpcId=1;StrId=1201542;Pos=3;};
		{NpcId=10131094;StrId=1201543;Pos=3;};
		{NpcId=1;StrId=1201544;Pos=3;};
		{NpcId=10131001;StrId=1201545;Pos=3;};			
		{NpcId=10131092;StrId=1201546;Pos=3;};	
		{NpcId=10131093;StrId=1201547;Pos=3;};	
		{NpcId=10131001;StrId=1201548;Pos=3;};			
	};	
	[1201601] = {
		{NpcId=1;StrId=1201641;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};
		{NpcId=10131092;StrId=1201642;Pos=3;bCam=1;look={11.40,10.10,1};eye={-13.50,-23.55,19};tm=1000;};
		{NpcId=10131001;StrId=1201643;Pos=3;};
		{NpcId=10131092;StrId=1201644;Pos=3;Patrol={{npc=10131091,index=1}}};
		{NpcId=10131093;StrId=1201645;Pos=3;};			
		{NpcId=10131092;StrId=1201646;Pos=3;bCam=1;look={17.52,10.32,1};eye={-13.21,-23.55,19};tm=1500;};	
		{NpcId=1;StrId=1201647;Pos=3;};	
		{NpcId=10131001;StrId=1201648;Pos=3;Patrol={{npc=10131001,index=2},{npc=10131003,index=1},{npc=10131098,index=1},{npc=10131093,index=1}}};			
	};		
	[1201701] = {
		{NpcId=10131091;StrId=1201741;Pos=3;bCam=1;look={72.42,32.05,1};eye={-18.78,-16.02,19};tm=1000;};
		{NpcId=10131001;StrId=1201742;Pos=3;};		
	};		
	[1201702] = {
		{NpcId=10131004;StrId=1201743;Pos=1;Delay=1000;};
		{NpcId=10131001;StrId=1201744;Pos=1;Delay=3000;};		
		{NpcId=10131003;StrId=1201745;Pos=1;Delay=3000;};	
		{NpcId=10131001;StrId=1201746;Pos=1;Delay=3000;};			
	};	
 [1201801] = {
		{NpcId=10131004;StrId=1201841;Pos=1;Delay=1000;};
 }; 
 [1201901] = {
		{NpcId=1;StrId=1201941;Pos=4;};  
 };
 [1202101] = {
		{NpcId=1;StrId=1202141;Pos=4;};  
 }; 
	[1202201] = {
		{NpcId=10131005;StrId=1202241;Pos=1;Delay=100;};		
	};	
	[1202202] = {
		{NpcId=10131005;StrId=1202242;Pos=1;Delay=100;};		
	};	
	[1202203] = {
		{NpcId=10131005;StrId=1202243;Pos=1;Delay=100;};		
	};	
	[1202204] = {
		{NpcId=10131005;StrId=1202244;Pos=1;Delay=100;};		
	};	
 [1202205] = {
		{NpcId=1;StrId=1202245;Pos=4;};  
 }; 	
	[1202301] = {
		{NpcId=10131001;StrId=1202341;Pos=3;bCam=1;look={-11.63,4.22,1};eye={-14.95,-14.98,18};tm=1000;};
		{NpcId=1;StrId=1202342;Pos=3;};
		{NpcId=10131001;StrId=1202343;Pos=3;};
		{NpcId=1;StrId=1202344;Pos=3;};	
	};	
	[1202501] = {
		{NpcId=10131001;StrId=1202541;Pos=1;Delay=1000;};			
	};
 [1202502] = {
		{look={-18.66,32.89,3};eye={-15.32,-19.75,21};StrId=1202542;tm=2000;last=999999};
 };
	[1202601] = {
		{NpcId=10131001;StrId=1202641;Pos=1;Delay=1000;};			
	};
 [1202701] = {
		{NpcId=1;StrId=1202741;Pos=4;};  
 }; 
	[1202901] = {
		{NpcId=10131006;StrId=1202941;Pos=1;Delay=1000;};	
		{NpcId=10131001;StrId=1202942;Pos=1;Delay=3000;};			
	}; 
	[1203001] = {
		{NpcId=10131006;StrId=1203041;Pos=3;bCam=1;look={-23.99,77.10,1};eye={-9.28,-20.01,22};tm=500;};
		{NpcId=1;StrId=1203042;Pos=3;};
		{NpcId=10131006;StrId=1203043;Pos=3;};
		{NpcId=1;StrId=1203044;Pos=3;};
		{NpcId=10131001;StrId=1203045;Pos=3;};
		{NpcId=1;StrId=1203046;Pos=3;};		
	};			
 [1203101] = {
		{NpcId=1;StrId=1203141;Pos=4;};  
 }; 	
	[1203201] = {
		{NpcId=10131003;StrId=1203241;Pos=1;Delay=1000;};	
		{NpcId=10131001;StrId=1203242;Pos=1;Delay=3000;};			
	};	
	[1203301] = {
		{NpcId=1;StrId=1203341;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};
		{NpcId=10131001;StrId=1203342;Pos=3;bCam=1;look={-58.54,34.14,1};eye={-14.85,-20.34,23};tm=1000;};
		{NpcId=10131003;StrId=1203343;Pos=3;Patrol={{npc=10131003,index=1},{npc=10131098,index=3}}};
		{NpcId=10131001;StrId=1203344;Pos=3;};
		{NpcId=1;StrId=1203345;Pos=3;};
		{NpcId=10131001;StrId=1203346;Pos=3;};		
	};	
 [1203401] = {
		{look={-58.96,20.71,3};eye={-17.09,-17.20,23};StrId=1203441;tm=2000;last=999999};
 };	
 [1203501] = {
		{NpcId=1;StrId=1203541;Pos=4;};  
 }; 
 [1203601] = {
		{NpcId=1;StrId=1203641;Pos=4;};  
 };
 [1203901] = {
		{NpcId=1;StrId=1203941;Pos=4;};  
 }; 
 [1204001] = {
		{NpcId=1;StrId=1204041;Pos=4;};  
 }; 	
	[1204002] = {
		{NpcId=10131001;StrId=1204042;Pos=3;bCam=1;look={-88.19,31.46,1};eye={-15.86,-14.19,20};tm=500;};
		{NpcId=1;StrId=1204043;Pos=3;};
		{NpcId=10131007;StrId=1204044;Pos=3;bCam=1;look={-90.18,35.14,1};eye={-17.19,-16.35,20};tm=1500;};
		{NpcId=1;StrId=1204045;Pos=3;};
		{NpcId=10131001;StrId=1204046;Pos=3;};	
	};		
	[1204101] = {
		{NpcId=10131001;StrId=1204141;Pos=1;Delay=1000;};		
	};	
	[1204201] = {
		{NpcId=10131007;StrId=1204241;Pos=1;Delay=1000;};		
	};	
 [1204301] = {
		{NpcId=1;StrId=1204341;Pos=4;};  
 };
	[1204401] = {
		{NpcId=10131003;StrId=1204441;Pos=1;Delay=1000;Patrol={{npc=10131003,index=2}}};	
		{NpcId=10131001;StrId=1204442;Pos=1;Delay=3000;};	
		{NpcId=10131008;StrId=1204443;Pos=1;Delay=3000;Patrol={{npc=10131001,index=3},{npc=10131003,index=3}}};			
	};	
	[1204501] = {
		{NpcId=10131003;StrId=1204541;Pos=1;Delay=1000;};	
		{NpcId=10131001;StrId=1204542;Pos=1;Delay=3000;};	
	};	
	[1204502] = {
		{NpcId=10131008;StrId=1204543;Pos=3;bCam=1;look={-105.49,23.53,1};eye={-16.03,-18.79,21};tm=500;};
		{NpcId=10131001;StrId=1204544;Pos=3;};
		{NpcId=10131008;StrId=1204545;Pos=3;};
		{NpcId=1;StrId=1204546;Pos=3;};
	};		
 [1204801] = {
		{NpcId=1;StrId=1204841;Pos=4;};  
 };	
	[1205101] = {
		{NpcId=10131008;StrId=1205141;Pos=3;bCam=1;look={-59.31,-60.76,1};eye={-23.30,-8.93,15};tm=500;};
		{NpcId=10131009;StrId=1205142;Pos=3;};
		{NpcId=10131008;StrId=1205143;Pos=3;};
	};		
	[1205201] = {
		{NpcId=10131008;StrId=1205253;Pos=1;Delay=1000;};	
		{NpcId=10131009;StrId=1205254;Pos=1;Delay=3000;};	
	};	
	[1205401] = {
		{NpcId=10131008;StrId=1205441;Pos=3;bCam=1;look={-58.99,-70.33,1};eye={-16.68,-8.29,15};tm=500;};
		{NpcId=1;StrId=1205442;Pos=3;};
		{NpcId=10131008;StrId=1205443;Pos=3;};
		{NpcId=10131008;StrId=1205444;Pos=3;};
		{NpcId=1;StrId=1205445;Pos=3;};
		{NpcId=10131008;StrId=1205446;Pos=3;};
		{NpcId=1;StrId=1205447;Pos=3;};
		{NpcId=10131008;StrId=1205448;Pos=3;};		
	};	
	[1205601] = {
		{NpcId=10131008;StrId=1205641;Pos=3;bCam=1;look={-13.51,-66.43,1};eye={-19.71,-13.88,20};tm=500;};
		{NpcId=1;StrId=1205642;Pos=3;};
		{NpcId=10131009;StrId=1205643;Pos=3;};
	};		
	[1205801] = {
		{NpcId=10131008;StrId=1205841;Pos=3;bCam=1;look={34.90,-61.45,1};eye={-18.92,-15.01,20};tm=500;};
		{NpcId=1;StrId=1205842;Pos=3;};
		{NpcId=10131009;StrId=1205843;Pos=3;};
		{NpcId=10131008;StrId=1205844;Pos=3;};
		{NpcId=1;StrId=1205845;Pos=3;};		
	};		
 [1206001] = {
		{NpcId=1;StrId=1206041;Pos=4;};  
 };	
 [1206002] = {
		{NpcId=1;StrId=1206042;Pos=4;};  
 };	
	[1206401] = {
		{NpcId=1;StrId=1206441;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};
		{NpcId=10131009;StrId=1206442;Pos=3;bCam=1;look={-0.99,-11.99,1};eye={-18.56,-17.80,21};tm=1000;};
		{NpcId=1;StrId=1206443;Pos=3;};
		{NpcId=10131009;StrId=1206444;Pos=3;};
		{NpcId=1;StrId=1206445;Pos=3;};
		{NpcId=10131008;StrId=1206446;Pos=3;};	
		{NpcId=10131009;StrId=1206447;Pos=3;};	
		{NpcId=10131003;StrId=1206448;Pos=3;Patrol={{npc=10131003,index=4}}};	
		{NpcId=10131009;StrId=1206449;Pos=3;};			
	};	
	[1206601] = {
		{NpcId=10131008;StrId=1206641;Pos=3;bCam=1;look={-0.31,1.67,1};eye={-12.32,-14.09,16};tm=1000;};
		{NpcId=1;StrId=1206642;Pos=3;};	
	};	
 [1206602] = {
		{NpcId=1;StrId=1206643;Pos=4;};  
 };		
	[1206701] = {
		{NpcId=10131108;StrId=1206741;Pos=3;bCam=1;look={3.70,-2.10,1};eye={-10.54,-12.16,11};tm=1000;};	
		{NpcId=1;StrId=1206742;Pos=3;bCam=1;look={0,-1,1};eye={-13,-15,15};tm=500;};
		{NpcId=10131003;StrId=1206743;Pos=3;};		
	};
	[1206801] = {
		{NpcId=10131009;StrId=1206841;Pos=3;bCam=1;look={-0.31,1.67,1};eye={-12.32,-14.09,16};tm=1000;};	
		{NpcId=1;StrId=1206842;Pos=3;};
		{NpcId=10131009;StrId=1206843;Pos=3;};
		{NpcId=10131008;StrId=1206844;Pos=3;};
		{NpcId=1;StrId=1206845;Pos=3;};			
	};
	[1206901] = {	
			{NpcId=10131009;StrId=1206941;Pos=1;Delay=1000;};
	};	
	[1207001] = {
		{NpcId=10131003;StrId=1207041;Pos=3;bCam=1;look={-1.41,-6.21,1};eye={-18.30,-6.92,13};tm=500;};	
		{NpcId=10131009;StrId=1207042;Pos=3;};
		{NpcId=10131008;StrId=1207043;Pos=3;};
		{NpcId=10131003;StrId=1207044;Pos=3;};
		{NpcId=10131009;StrId=1207045;Pos=3;};
		{NpcId=10131003;StrId=1207046;Pos=3;};		
		{NpcId=1;StrId=1207047;Pos=3;};		
		{NpcId=10131008;StrId=1207048;Pos=3;};		
		{NpcId=10131009;StrId=1207049;Pos=3;};				
	};	
	[1207101] = {	
			{NpcId=10131009;StrId=1207141;Pos=1;Delay=100;};
			{NpcId=10131008;StrId=1207142;Pos=1;Delay=3000;};			
	};		
	[1207201] = {	
			{NpcId=10131009;StrId=1207241;Pos=1;Delay=1000;};
	};	
	[1207202] = {	
			{NpcId=10131010;StrId=1207242;Pos=1;Delay=1000;};
	};	
	[1207301] = {	
			{NpcId=10131011;StrId=1207341;Pos=1;Delay=1000;};
	};			
	[1207501] = {
		{NpcId=10131011;StrId=1207541;Pos=3;bCam=1;look={98.68,-80.23,1};eye={-13.75,-9.00,10};tm=500;};	
		{NpcId=10131009;StrId=1207542;Pos=3;};
		{NpcId=10131011;StrId=1207543;Pos=3;};
		{NpcId=1;StrId=1207544;Pos=3;};
		{NpcId=10131011;StrId=1207545;Pos=3;};
		{NpcId=10131009;StrId=1207546;Pos=3;};	
		{NpcId=10131011;StrId=1207547;Pos=3;};			
	};
	[1207601] = {
		{NpcId=10131009;StrId=1207641;Pos=3;bCam=1;look={-13.29,-6.72,1};eye={-10.46,-14.41,13};tm=500;};	
		{NpcId=1;StrId=1207642;Pos=3;};
		{NpcId=10131009;StrId=1207643;Pos=3;};
		{NpcId=10131011;StrId=1207644;Pos=3;Patrol={{npc=10131011,index=1}}};
		{NpcId=10131011;StrId=1207645;Pos=3;mNpcId=10131083;NAID=1008200813;bCam=1;look={-1.76,1.01,1};eye={-22.25,-17.07,20};tm=500;};
		{NpcId=10131081;StrId=1207646;Pos=3;Patrol={{npc=10131081,index=1}}};		
		{NpcId=10131009;StrId=1207647;Pos=3;};		
		{NpcId=10131081;StrId=1207648;Pos=3;mNpcId=10131081;NAID=1013100614;};		
		{NpcId=10131011;StrId=1207649;Pos=3;};				
	};
	[1207701] = {
		{NpcId=10131091;StrId=1207741;Pos=3;bCam=1;look={-1.48,0.05,1};eye={-11.62,-20.92,20};tm=500;Patrol={{npc=10131091,index=2}}};
		{NpcId=10131009;StrId=1207742;Pos=3;};
		{NpcId=10131011;StrId=1207743;Pos=3;};
		{NpcId=1;StrId=1207744;Pos=3;};
		{NpcId=10131009;StrId=1207745;Pos=3;};
		{NpcId=10131011;StrId=1207746;Pos=3;};
		{NpcId=10131009;StrId=1207747;Pos=3;};			
	};	
---未整理的	
	[1] = {
		{NpcId=10021002;StrId=1;Pos=1;Delay=3;bCam=1;};
		{NpcId=10021002;StrId=2;Pos=2;};
		{NpcId=10021002;StrId=3;Pos=1;};
	};
	[36]	=	{
		{NpcId=10031004;StrId=210221;Pos=3;bCam=1;};
		{NpcId=1;StrId=210222;Pos=3;};	
		{NpcId=10031004;StrId=210223;Pos=3;};	
		{NpcId=1;StrId=210224;Pos=3;};	
		{NpcId=10031004;StrId=210225;Pos=3;};	
		{NpcId=1;StrId=210226;Pos=3;};			
		{NpcId=10031004;StrId=210227;Pos=3;};	
		{NpcId=1;StrId=210228;Pos=3;};			
	};	
	[203]	=		{
		{NpcId=10031001;StrId=3034341;Pos=3;};				
	};	
	[204] = {
		{NpcId=10021016;StrId=213341;Pos=1;Delay=10;};
		{NpcId=10021016;StrId=213342;Pos=1;Delay=3500;};
		{NpcId=10021016;StrId=213343;Pos=1;Delay=3500;};
		{NpcId=10021016;StrId=213344;Pos=1;Delay=3500;};
	};	
----------------------------------------------------珍珑棋局------------------------------------------
	[100] = {{NpcId=50051001;StrId=117;Pos=1;Delay=100;}};
	[101] = {{NpcId=50051001;StrId=118;Pos=1;Delay=100;}};
	[102] = {{NpcId=50051001;StrId=119;Pos=1;Delay=100;}};
	[103] = {{NpcId=50051001;StrId=120;Pos=1;Delay=100;}};
	[104] = {{NpcId=50051001;StrId=121;Pos=1;Delay=100;}};
	[105] = {{NpcId=50051001;StrId=122;Pos=1;Delay=100;}};
	[106] = {{NpcId=50051001;StrId=123;Pos=1;Delay=100;}};
	[107] = {{NpcId=50051001;StrId=124;Pos=1;Delay=100;}};
	[108] = {{NpcId=50051001;StrId=125;Pos=1;Delay=100;}};
	[109] = {{NpcId=50051001;StrId=126;Pos=1;Delay=100;}};
	[110] = {{NpcId=50051001;StrId=127;Pos=1;Delay=100;}};
	[111] = {{NpcId=50051001;StrId=128;Pos=1;Delay=100;}};
	[112] = {{NpcId=50051001;StrId=129;Pos=1;Delay=100;}};
	[113] = {{NpcId=50051001;StrId=130;Pos=1;Delay=100;}};
	[114] = {{NpcId=50051001;StrId=131;Pos=1;Delay=100;}};
	[115] = {{NpcId=50051001;StrId=132;Pos=1;Delay=100;}};
	[116] = {{NpcId=50051001;StrId=133;Pos=1;Delay=100;}};
	[117] = {{NpcId=50051001;StrId=134;Pos=1;Delay=100;}};
	[118] = {{NpcId=50051001;StrId=135;Pos=1;Delay=100;}};
	[119] = {{NpcId=50051001;StrId=136;Pos=1;Delay=100;}};
	[120] = {{NpcId=50051001;StrId=137;Pos=1;Delay=100;}};
	[121] = {{NpcId=50051001;StrId=138;Pos=1;Delay=100;}};
	[122] = {{NpcId=50051001;StrId=139;Pos=1;Delay=100;}};
	[123] = {{NpcId=50051001;StrId=140;Pos=1;Delay=100;}};
	[124] = {{NpcId=50051001;StrId=141;Pos=1;Delay=100;}};
	[125] = {{NpcId=50051001;StrId=142;Pos=1;Delay=100;}};
	[126] = {{NpcId=50051001;StrId=143;Pos=1;Delay=100;}};
	[127] = {{NpcId=50051001;StrId=144;Pos=1;Delay=100;}};
	[128] = {{NpcId=50051001;StrId=145;Pos=1;Delay=100;}};
	[129] = {{NpcId=50051001;StrId=146;Pos=1;Delay=100;}};
	[130] = {{NpcId=50051001;StrId=147;Pos=1;Delay=100;}};
	[131] = {{NpcId=50051001;StrId=148;Pos=1;Delay=100;}};
	[132] = {{NpcId=50051001;StrId=149;Pos=1;Delay=100;}};
	[133] = {{NpcId=50051001;StrId=150;Pos=1;Delay=100;}};
	[134] = {{NpcId=50051001;StrId=152;Pos=1;Delay=100;}};
	[135] = {{NpcId=50051001;StrId=153;Pos=1;Delay=100;}};
	----------------------------------------------------end------------------------------------------
	[140] = {{NpcId=10041006;StrId=111;Pos=1;Delay=100;}};
	[141] = {{NpcId=10011013;StrId=101541;Pos=1;Delay=1100;}};
	[142] = {{NpcId=10041020;StrId=303446;Pos=1;Delay=100;}};
	
	[150] = {{NpcId=50721001;StrId=563;Pos=1;Delay=100;}};
	-----------★副本----50XX打头的ID我征用了！--------------
	----大破联营
	[5001001] = {--偷懒哨兵喊BOSS
		{NpcId=10011104;StrId=420;Pos=3;bCam=1;look={-6.88,10.44,1};eye={-18.31,-19.39,28};tm=500;};
	};
	[5001002] = {--刀斧手埋伏
		{NpcId=10011021;StrId=422;Pos=3;bCam=1;look={5.1,2.53,1};eye={-20.47,-20.39,29};tm=0;};
		{NpcId=10011021;StrId=423;Pos=3;bCam=1;look={-0.8,-3.13,1};eye={-20.41,-20.58,29};tm=1000;};
		{NpcId=10011021;StrId=424;Pos=3;bCam=1;look={-4.29,-6.69,1};eye={-21.51,-22.24,28};tm=1000;};
	};
	[5001003] = {--弩车埋伏
		{NpcId=10031024;StrId=425;Pos=3;bCam=1;look={18.83,16.89,1};eye={-20.26,-19.75,29};tm=0;};
	};
	[5001004] = {--看方阵
		{NpcId=10071003;StrId=426;Pos=3;bCam=1;look={10.33,-1.89,1};eye={-18.95,-18.71,26};tm=500;};
	};
	[5001005] = {--倒数2关看BOSS
		{NpcId=10061006;StrId=427;Pos=3;bCam=1;look={-11.08,18.79,1};eye={-23.02,-23.22,30};tm=500;};
		{NpcId=10081004;StrId=428;Pos=3;bCam=1;look={8.98,-31.13,1};eye={-23.17,-23.07,30};tm=500;};
		{NpcId=10111006;StrId=429;Pos=3;bCam=1;look={21.65,-5.53,1};eye={-23.22,-23.02,30};tm=500;};
	};
	----珍珑棋局
	[5005001] = {
		{NpcId=50051001;StrId=170;Pos=3;bCam=1;look={-22.89,-24.45,45.68};eye={-21.73,-21.15,46};tm=1000;mNpcId=50051001;NAID=1004100190;};
	};
	[5005002] = {
		{NpcId=50051001;StrId=170;Pos=3;bCam=1;look={-22.89,-24.45,45.68};eye={-21.73,-21.15,46};tm=1000;mNpcId=50051001;NAID=1004100191;};
	};
	[5005003] = {
		{NpcId=50051001;StrId=170;Pos=3;bCam=1;look={-22.89,-24.45,45.68};eye={-21.73,-21.15,46};tm=1000;mNpcId=50051001;NAID=1004100192;};
	};
	----绮梦幽境
	[5020001] = {--开场01
		{NpcId=50201001;StrId=630;Pos=3;bCam=1;look={7.13,-18.09,1};eye={-20.65,-20.74,30};tm=1000;};
		{NpcId=50201002;StrId=631;Pos=3;bCam=1;look={9.16,22.38,1};eye={-20.56,-20.84,30};tm=1000;};
		{NpcId=50201001;StrId=632;Pos=3;bCam=1;look={-20.8,12.89,1};eye={-20.5,-20.96,30};tm=1000;};
	};
	[5020002] = {---出 01 BOSS
		{NpcId=10051017;StrId=633;Pos=3;bCam=1;look={-5,-4,4.35};eye={-21.36,-20.33,30};tm=0;};
	};
	[5020003] = {---出 02 BOSS
		{NpcId=10091009;StrId=634;Pos=3;bCam=1;look={-5,-4,4.35};eye={-21.36,-20.33,30};tm=0;};
	};
	----五行道场
	[5050001] = {--开场
		{NpcId=50501001;StrId=251;Pos=3;bCam=1;look={13.75,10.05,1};eye={-19.42,-19.42,28.67};tm=2000;};
		{NpcId=50501001;StrId=252;Pos=3;bCam=1;look={-37.25,15.91,1};eye={-19.41,-19.49,28.63};tm=0;};
		{NpcId=50501001;StrId=253;Pos=3;bCam=1;look={-58.99,-27.36,1};eye={-21.29,-20.48,30.75};tm=0;};
		{NpcId=50501001;StrId=254;Pos=3;bCam=1;look={-24.20,-62.84,1};eye={-18.49,-25.58,28.93};tm=0;};
		{NpcId=50501001;StrId=255;Pos=3;bCam=1;look={19.55,-42.22,1};eye={-17.31,-27.62,28.50};tm=0;};
	};
	[5050002] = {--圣兽出现
		{NpcId=50501001;StrId=256;Pos=3;bCam=1;look={-16.73,-19.29,0};eye={-22.53,-23.11,35.69};tm=0;};
	};	
	----烽火辎路
	[5070001] = {--开场
		{NpcId=50701001;StrId=341;Pos=3;bCam=1;look={-35.97,26.08,3.35};eye={-27.97,-5.25,24.66};tm=2000;};
		{NpcId=50701001;StrId=342;Pos=3;bCam=1;look={28.97,-14.73,1.5};eye={-28.55,-5.58,32};tm=0;};
		{NpcId=50701001;StrId=343;Pos=3;bCam=1;look={3,1.57,1.5};eye={-32.72,0.41,32};tm=1000;};
		{NpcId=50701001;StrId=344;Pos=3;bCam=1;look={-29.15,13.42,1.5};eye={-31.94,2.47,32};tm=1500;};
	};
	[5070002] = {-- 意外 - 山贼
		{NpcId=50701001;StrId=287;Pos=3;bCam=1;look={0.18,1.56,9.61};eye={-16.87,-17.02,24.14};tm=0;};
		{NpcId=50701001;StrId=287;Pos=3;bCam=1;look={-35.85,11.68,3};eye={-16.84,-17.05,32};tm=1000;};
	};
	[5070003] = {-- 意外 - 金兵
		{NpcId=50701001;StrId=289;Pos=3;bCam=1;look={-13.53,33.66,3};eye={-20.39,-20.57,32};tm=0;};
	};
	[5070004] = {-- 意外 - 接应
		{NpcId=50701001;StrId=291;Pos=3;bCam=1;look={28.18,-17.54,3};eye={-18.06,-17.68,32};tm=0;};
	};
	----演武节堂
	[5071001] = {
		{NpcId=50711001;StrId=375;Pos=3;bCam=1;look={-26.01,-25.79,3};eye={-21.25,-17.74,20};tm=2000;};
		{NpcId=10011005;StrId=376;Pos=3;bCam=1;look={20,20,3};eye={-23,-23,20};tm=0;mNpcId=50711002;NAID=33102;};
		--{NpcId=10011005;StrId=376;Pos=3;bCam=1;look={-27,-27,3};eye={-27,-27,20};tm=2000;mNpcId=50711002;NAID=33101;};
	};
	----守卫襄阳
	[5072001] = {--开场01
		{NpcId=10021101;StrId=560;Pos=3;bCam=1;look={-4.78,-17.95,1};eye={-16.31,-15.33,30};tm=0;};
		{NpcId=10021101;StrId=561;Pos=3;bCam=1;look={-5.15,-5.77,1};eye={-18.44,-18.04,30};tm=500;};
		{NpcId=10021002;StrId=563;Pos=3;bCam=1;look={-61.5,-61.89,1};eye={-18.97,-16.74,30};tm=2000;};
	};
	----守卫襄阳
	[5072002] = {--开场02
		{NpcId=10021101;StrId=560;Pos=3;bCam=1;look={-10.29,6.39,1};eye={-15.50,-15.16,30};tm=0;};
		{NpcId=10021101;StrId=562;Pos=3;bCam=1;look={-5.15,-5.77,1};eye={-18.44,-18.04,30};tm=500;};
		{NpcId=10021002;StrId=563;Pos=3;bCam=1;look={65.74,51.52,1};eye={-23.90,-16.87,30};tm=2000;};
	};
	----卧虎藏龙
	[5077001] = {--车轮战开场
		{NpcId=50771001;StrId=750;Pos=3;bCam=1;look={-14,-18,1};eye={-14,-18,30};tm=0;};
	};
	[5077002] = {--大乱斗开场
		{NpcId=50771001;StrId=750;Pos=3;bCam=1;look={-14,-18,1};eye={-14,-18,30};tm=0;};
	};
	--通天塔
	[5040000] = {
		{NpcId=10031025;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040001] = {
		{NpcId=10031024;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040002] = {
		{NpcId=10061029;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040003] = {
		{NpcId=10021001;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040004] = {
		{NpcId=10061020;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040005] = {
		{NpcId=10111019;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040006] = {
		{NpcId=10131081;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040007] = {
		{NpcId=10121111;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
	[5040008] = {
		{NpcId=10101014;StrId=800;Pos=3;bCam=1;look={0,0,1};eye={0,-39,14};tm=0;};
	};
 ----戏说天下
 [8025999] = {
		{NpcId=80251008;StrId=8025100812;Pos=3;bCam=1;look={-8.5,-2.5,1};eye={-15.66,-10.61,12};tm=500;mNpcId=80251008;NAID=1001100093;}; 
 };
 [8025998] = {--免费茶点
		{NpcId=80251002;StrId=8025100213;Pos=1;Delay=1000;}; 
 };
 [8025997] = {--飞贼
		{NpcId=80251002;StrId=8025100214;Pos=1;Delay=1000;}; 
 };  
 [8025001]= {
		{NpcId=80251001;StrId=802500101;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500102;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500103;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500104;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500105;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500106;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500107;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500108;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500109;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500110;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500111;Pos=1;Delay=8000;};			
 };
 [8025002]={
		{NpcId=80251001;StrId=802500201;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500202;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500203;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500204;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500205;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500206;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500207;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500208;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500209;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500210;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500211;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500212;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500213;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500214;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500215;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500216;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500217;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500218;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500219;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500220;Pos=1;Delay=8000;};		
	}; 
 [8025003]={
		{NpcId=80251001;StrId=802500301;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500302;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500303;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500304;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500305;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500306;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500307;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500308;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500309;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500310;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500311;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500312;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500313;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500314;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500315;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500316;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500317;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500318;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500319;Pos=1;Delay=8000;};	
	}; 
	[8025004]={
		{NpcId=80251001;StrId=802500401;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500402;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500403;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500404;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500405;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500406;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500407;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500408;Pos=1;Delay=8000;};	
	};
	[8025005]={
		{NpcId=80251001;StrId=802500501;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500502;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500503;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500504;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500505;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500506;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500507;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500508;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500509;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500510;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500511;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500512;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500513;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500514;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500515;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500516;Pos=1;Delay=8000;};		
	};	
	[8025006]={
		{NpcId=80251001;StrId=802500601;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500602;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500603;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500604;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500605;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500606;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500607;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500608;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500609;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500610;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500611;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500612;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500613;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500614;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500615;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500616;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500617;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500618;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500619;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500620;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500621;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500622;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500623;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500624;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500625;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500626;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500627;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500628;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500629;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500630;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500631;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500632;Pos=1;Delay=8000;};	
		{NpcId=80251001;StrId=802500633;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500634;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500635;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500636;Pos=1;Delay=8000;};			
	};
	[8025007]={
		{NpcId=80251001;StrId=802500701;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500702;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500703;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500704;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500705;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500706;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500707;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500708;Pos=1;Delay=8000;};		
	},
	[8025008]={
		{NpcId=80251001;StrId=802500801;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500802;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500803;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500804;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500805;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500806;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500807;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500808;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500809;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500810;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500811;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500812;Pos=1;Delay=8000;};	
	},
	[8025009]={
		{NpcId=80251001;StrId=802500901;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802500902;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500903;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500904;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500905;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500906;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802500907;Pos=1;Delay=8000;};
	},	
	[8025010]={
		{NpcId=80251001;StrId=802501001;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802501002;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501003;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501004;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501005;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501006;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501007;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501008;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501009;Pos=1;Delay=8000;};		
	},		
	[8025011]={
		{NpcId=80251001;StrId=802501101;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802501102;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501103;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501104;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501105;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501106;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501107;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501108;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501109;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501110;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501111;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501112;Pos=1;Delay=8000;};	
		{NpcId=80251001;StrId=802501113;Pos=1;Delay=8000;};			
	},	
	[8025012]={
		{NpcId=80251001;StrId=802501201;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802501202;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501203;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501204;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501205;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501206;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501207;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501208;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501209;Pos=1;Delay=8000;};		
	},			
	[8025013]={
		{NpcId=80251001;StrId=802501301;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802501302;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501303;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501304;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501305;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501306;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501307;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501308;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501309;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501310;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501311;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501312;Pos=1;Delay=8000;};	
	},	
	[8025014]={
		{NpcId=80251001;StrId=802501401;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802501402;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501403;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501404;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501405;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501406;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501407;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501408;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501409;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501410;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501411;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501412;Pos=1;Delay=8000;};	
	},		
	[8025015]={
		{NpcId=80251001;StrId=802501501;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802501502;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501503;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501504;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501505;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501506;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501507;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501508;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501509;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501510;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501511;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501512;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501513;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501514;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501515;Pos=1;Delay=8000;};	
	};		
	[8025016]={
		{NpcId=80251001;StrId=802501601;Pos=1;Delay=5000;};
		{NpcId=80251001;StrId=802501602;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501603;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501604;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501605;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501606;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501607;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501608;Pos=1;Delay=8000;};
		{NpcId=80251001;StrId=802501609;Pos=1;Delay=8000;};	
		{NpcId=80251001;StrId=802501610;Pos=1;Delay=8000;};		
	},			
} 