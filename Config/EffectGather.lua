--配置规则，根据字段分配进行有序排列，
--零散小功能起始1
--Buff系统起始10000
--技能系统起始20000

_G.Effect_Deploy = 
{	
		--宝剑
		--减移动速度
		[30] = {{Effect_Id = 11000,Binding = "feetpoint"}};		
		--减生命
		[31] = {{Effect_Id = 50010 ,Binding = "feetpoint"};};
		--减身法
		[32] = {{Effect_Id = 50011 ,Binding = "feetpoint"};};
		--减暴击
		[33] = {{Effect_Id = 50012 ,Binding = "feetpoint"};};
		--宝甲
		[51] = {{Effect_Id = 12000,Binding = "feetpoint"}};
		--盟主战
		[52] = {{Effect_Id = 999,Binding = "feetpoint"}};
		--宠物升级特效
		[53] = {{Effect_Id = 90004,Binding = "feetpoint"}};
		--学习技能特效
		[100] = {
		{Effect_Id = 90015,Binding = "bip01 l hand"};
		{Effect_Id = 90016,Binding = "bip01 r hand"}
		};
		--BUFF特效
		[10000] = {{Effect_Id = 5,Binding = "headpoint"}};
		[10001] = {{Effect_Id = 50,Binding = "headpoint"}};
		[10002] = {{Effect_Id = 901,Binding = "feetpoint"}};
		[10003] = {{Effect_Id = 902,Binding = "feetpoint"}};
		[10004] = {{Effect_Id = 903,Binding = "feetpoint"}};
		[10005] = {{Effect_Id = 904,Binding = "feetpoint"}};
		[10006] = {{Effect_Id = 905,Binding = "feetpoint"}};
		[10007] = {{Effect_Id = 7019,Binding = "headpoint"}};
		[10008] = {{Effect_Id = 7020,Binding = "headpoint"}};
		[10009] = {{Effect_Id = 7021,Binding = "headpoint"}};
		[10010] = {{Effect_Id = 7022,Binding = "headpoint"}};
		[10011] = {{Effect_Id = 7023,Binding = "headpoint"}};
		[10012] = {{Effect_Id = 9550,Binding = "headpoint"}};
		[10013] = {{Effect_Id = 9551,Binding = "headpoint"}};
		[10014] = {{Effect_Id = 9552,Binding = "headpoint"}};
		[10015] = {{Effect_Id = 9553,Binding = "headpoint"}};
		[10016] = {{Effect_Id = 9554,Binding = "headpoint"}};
		[10017] = {{Effect_Id = 9555,Binding = "headpoint"}};
		[10018] = {{Effect_Id = 50001,Binding = "headpoint"}};
		[10019] = {{Effect_Id = 50002,Binding = "headpoint"}};
		[10020] = {{Effect_Id = 50003,Binding = "headpoint"}};
		[10021] = {{Effect_Id = 50004,Binding = "headpoint"}};
		[10022] = {{Effect_Id = 50005,Binding = "headpoint"}};
		[10023] = {{Effect_Id = 50006,Binding = "headpoint"}};
		[10024] = {{Effect_Id = 50007,Binding = "headpoint"}};
		[10025] = {{Effect_Id = 50008,Binding = "headpoint"}};
		[10026] = {{Effect_Id = 50009,Binding = "headpoint"}};
		[10027] = {{Effect_Id = 51005,Binding = "headpoint"}};
		[10028] = {{Effect_Id = 71001,Binding = "headpoint"}};
		[10029] = {{Effect_Id = 71002,Binding = "headpoint"}};
		[10030] = {{Effect_Id = 71003,Binding = "headpoint"}};
		[10031] = {{Effect_Id = 90009,Binding = "headpoint"}};
		[10032] = {{Effect_Id = 90010,Binding = "headpoint"}};
		
		[10033] = {
		{Effect_Id = 61001 ,Binding = "leftforearmpoint"};
		{Effect_Id = 61001 ,Binding = "rightforearmpoint"};
		{Effect_Id = 61002 ,Binding = "leftfootpoint"};
		{Effect_Id = 61002 ,Binding = "rightfootpoint"};
		{Effect_Id = 61003 ,Binding = "awc"};
		};
		
		[10034] = {
		{Effect_Id = 61001 ,Binding = "leftforearmpoint"};
		{Effect_Id = 61001 ,Binding = "rightforearmpoint"};
		{Effect_Id = 61002 ,Binding = "leftfootpoint"};
		{Effect_Id = 61002 ,Binding = "rightfootpoint"};
		{Effect_Id = 61004 ,Binding = "awc"};
		};

		[10035] = {{Effect_Id = 120,Binding = "headpoint"}};
		[10036] = {{Effect_Id = 61010,Binding = "headpoint"}};
		[10037] = {{Effect_Id = 59000,Binding = "feetpoint"}};
		[10038] = {{Effect_Id = 59001,Binding = "feetpoint"}};
		[10039] = {{Effect_Id = 59002,Binding = "feetpoint"}};
		[10040] = {{Effect_Id = 59004,Binding = "feetpoint"}};
		[10041] = {{Effect_Id = 59005,Binding = "feetpoint"}};
		[10042] = {{Effect_Id = 166,Binding = "feetpoint"}};
		[10043] = {{Effect_Id = 61011,Binding = "feetpoint"}};
		[10044] = {{Effect_Id = 61012,Binding = "bone01"}};
		[10045] = {{Effect_Id = 59006,Binding = "feetpoint"}};
		[10046] = {{Effect_Id = 59007,Binding = "feetpoint"}};
		[10047] = {{Effect_Id = 59008,Binding = "feetpoint"}};

		--大批称号
		[10048] = {{Effect_Id = 59025,Binding = "feetpoint"}};
		[10049] = {{Effect_Id = 59039,Binding = "feetpoint"}};
		[10050] = {{Effect_Id = 59020,Binding = "feetpoint"}};
		[10051] = {{Effect_Id = 59033,Binding = "feetpoint"}};
		[10052] = {{Effect_Id = 59031,Binding = "feetpoint"}};
		[10053] = {{Effect_Id = 59027,Binding = "feetpoint"}};
		[10054] = {{Effect_Id = 59026,Binding = "feetpoint"}};
		[10055] = {{Effect_Id = 59028,Binding = "feetpoint"}};
		[10056] = {{Effect_Id = 59011,Binding = "feetpoint"}};
		[10057] = {{Effect_Id = 59009,Binding = "feetpoint"}};
		[10058] = {{Effect_Id = 59012,Binding = "feetpoint"}};
		[10059] = {{Effect_Id = 59021,Binding = "feetpoint"}};
		[10060] = {{Effect_Id = 59038,Binding = "feetpoint"}};
		[10061] = {{Effect_Id = 59015,Binding = "feetpoint"}};
		[10062] = {{Effect_Id = 59024,Binding = "feetpoint"}};
		[10063] = {{Effect_Id = 59022,Binding = "feetpoint"}};
		[10064] = {{Effect_Id = 59023,Binding = "feetpoint"}};
		[10065] = {{Effect_Id = 59030,Binding = "feetpoint"}};
		[10066] = {{Effect_Id = 59014,Binding = "feetpoint"}};
		[10067] = {{Effect_Id = 59013,Binding = "feetpoint"}};
		[10068] = {{Effect_Id = 59017,Binding = "feetpoint"}};
		[10069] = {{Effect_Id = 59036,Binding = "feetpoint"}};
		[10070] = {{Effect_Id = 59032,Binding = "feetpoint"}};
		[10071] = {{Effect_Id = 59037,Binding = "feetpoint"}};
		[10072] = {{Effect_Id = 59018,Binding = "feetpoint"}};
		[10073] = {{Effect_Id = 59040,Binding = "feetpoint"}};
		[10074] = {{Effect_Id = 59034,Binding = "feetpoint"}};
		[10075] = {{Effect_Id = 59016,Binding = "feetpoint"}};
		[10076] = {{Effect_Id = 59010,Binding = "feetpoint"}};
		[10077] = {{Effect_Id = 59029,Binding = "feetpoint"}};
		[10078] = {{Effect_Id = 59019,Binding = "feetpoint"}};
		[10079] = {{Effect_Id = 59035,Binding = "feetpoint"}};
		--------------------buff特效
		[10080] = {{Effect_Id = 61013,Binding = "feetpoint"}};  --武尊全章 无双buff 金色
		[10081] = {{Effect_Id = 61014,Binding = "feetpoint"}};  --武尊全章 无双buff 红色		
		[10082] = {{Effect_Id = 61015,Binding = "feetpoint"}};  --广平禅师
		[10083] = {{Effect_Id = 61016,Binding = "feetpoint"}};	--催命
		[10084] = {{Effect_Id = 50013,Binding = "feetpoint"}};	--宫北烨范围
		[10085] = {{Effect_Id = 59041,Binding = "feetpoint"}};	--
		[10086] = {{Effect_Id = 59041,Binding = "feetpoint"}};	--
		[10087] = {{Effect_Id = 59041,Binding = "feetpoint"}};	--
		[10088] = {{Effect_Id = 59041,Binding = "feetpoint"}};	--
		[10089] = {{Effect_Id = 59042,Binding = "feetpoint"}};	--	
		
		--活动
		[20000] = {{Effect_Id = 90016,Binding = "bip01 r hand"}};	--被需求击中（通用）
		[20001] = {{Effect_Id = 40000,Binding = "feetpoint"}};
		[20002] = {{Effect_Id = 50005,Binding = "rwh"}};			--眩晕
		[20003] = {{Effect_Id = 50008,Binding = "rwh"}};			--减速
		[20004] = {{Effect_Id = 50003,Binding = "rwh"}};			--定身
		[20005] = {{Effect_Id = 50001,Binding = "rwh"}};			--持续掉血
		[20006] = {{Effect_Id = 50009,Binding = "rwh"}};			--持续掉蓝
		[20007] = {{Effect_Id = 61010,Binding = "rwh"}};			--加防
		[20008] = {{Effect_Id = 50004,Binding = "rwh"}};			--加攻击
		[20009] = {{Effect_Id = 40000,Binding = "rwh"}};			--加速
		[20010] = {{Effect_Id = 50007,Binding = "rwh"}};			--沉默
		
		----副本里定制
		[5073001] = {{Effect_Id = 5073001,Binding = "feetpoint"}};----八卦 随机事件
		[5073002] = {{Effect_Id = 5073002,Binding = "feetpoint"}};----破绽
		[5073003] = {{Effect_Id = 5073003,Binding = "feetpoint"}};----阵眼
        ----阵法-北斗七星 套装特效
		[6000101] = {{Effect_Id = 6000101,Binding = "feetpoint"}}; --套装1级特效 以下依次
		[6000102] = {{Effect_Id = 6000102,Binding = "feetpoint"}};
		[6000103] = {{Effect_Id = 6000103,Binding = "feetpoint"}};
		[6000104] = {{Effect_Id = 6000104,Binding = "feetpoint"}};
		[6000105] = {{Effect_Id = 6000105,Binding = "feetpoint"}};
		[6000106] = {{Effect_Id = 6000106,Binding = "feetpoint"}};
		[6000107] = {{Effect_Id = 6000107,Binding = "feetpoint"}};
		[6000108] = {{Effect_Id = 6000108,Binding = "feetpoint"}};
		[6000109] = {{Effect_Id = 6000109,Binding = "feetpoint"}};
		[6000110] = {{Effect_Id = 6000110,Binding = "feetpoint"}};
		-----功法-童姥功 人物套装特效
		[7000101] = {{Effect_Id = 7000101,Binding = "headpoint"}};
		[7000102] = {{Effect_Id = 7000102,Binding = "headpoint"}};
		[7000103] = {{Effect_Id = 7000103,Binding = "headpoint"}};
		[7000104] = {{Effect_Id = 7000104,Binding = "headpoint"}};
		----坐骑转生坐骑特效  Effect_Id 为字符串 时 播组合特效
		[8000101] = {{ Effect_Id = "pfx3",Binding = "1"}};
		[8000102] = {{ Effect_Id = "pfx3",Binding = "2"}};
		[8000103] = {{ Effect_Id = "pfx3",Binding = "3"}};
		----跨服战标记绑点
		[9000101] = {{Effect_Id = 100071,Binding = "feetpoint"}};
		
		
		
};