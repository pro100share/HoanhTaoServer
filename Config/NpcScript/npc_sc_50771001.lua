--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50771001

--//车轮战模式
function npc_fun.zcs1(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	--获取组队系统
	local teamSys= objPlayer:GetSystem("CTeamSystem");
	--不是队长无法开启
	if objPlayer:GetRoleID() ~= teamSys:GetCaptainId() then
		sysScript:Notice(9000661103);
		return;
	end
	

	if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		local sysMap = objPlayer:GetSystem("CMapSystem");	----地图系统
		local Map = sysMap:GetCurMap();				----获取玩家所在地图
		local mgrMonster = Map:GetMonsterMgr();		----获得怪物管理器
		local dwLevelt = sysScript:GetDuplLevel(); ---获得创建副本的等级
		local fnFunction = function(sysScript)
			sysScript:Story(5077001);
		end
		CScriptManager:DoFunction(objNpc,fnFunction)
		mgrMonster:Add(50770001,(50770000+dwLevelt),50770001,50770001,100210080,-14,-18);	--杂货铺•晓薇
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		duplSystem:SetDuplLifeTime(1);	--开启倒计时
		sysScript:Notice("开启卧虎藏龙副本-车轮战模式！");
		objNpc.ZKNTemp = objNpc.ZKNTemp or true
	else
		sysScript:Notice(9000661101);
	end
end

--//大乱斗模式
function npc_fun.zcs2(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	--获取组队系统
	local teamSys= objPlayer:GetSystem("CTeamSystem");
	--不是队长无法开启
	if objPlayer:GetRoleID() ~= teamSys:GetCaptainId() then
		sysScript:Notice(9000661103);
		return;
	end

	if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		local sysMap = objPlayer:GetSystem("CMapSystem");	----地图系统
		local Map = sysMap:GetCurMap();		----获取玩家所在地图
		local mgrMonster = Map:GetMonsterMgr();		----获得怪物管理器
		local dwLevelt = sysScript:GetDuplLevel(); ---获得创建副本的等级
		local DelayTime = 45*1000;
		local pos = { 
			[1] = {x = -11 , y = -15 },--杂货铺•晓薇
			[2] = {x = -10 , y = -18 },--刘记马行•刘雨
			[3] = {x = -11 , y = -21 },--南记布庄•南筱芸
			[4] = {x = -14 , y = -22 },--戈记兵甲•戈楠
			[5] = {x = -16 , y = -21 },--玲珑坊•杨锋
			[6] = {x = -17 , y = -18 },--阿熊
			[7] = {x = -16 , y = -16 },--有间书铺•章博
			[8] = {x = -14 , y = -15 },--凝香银楼•周静恒
			[9] = {x = -9 , y = -14 },--宝济堂•欧雅琪
			[10] = {x = -18 , y = -23 },--驿馆主事•秦江
			[11] = {x = -20 , y = -25 },--衙役
			[12] = {x = -9 , y = -23 },--风云当家•许竹青
			[13] = {x = -18 , y = -14 },--风云当家•康兴哥
			};
		
		local fnFunction = function(sysScript)
			sysScript:Story(5077002);
		end
		CScriptManager:DoFunction(objNpc,fnFunction)
		
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		duplSystem:SetDuplLifeTime(2);	--开启倒计时
		duplSystem.objCurDupl.forbiddenReliveNow = true;
		duplSystem.objCurDupl.bIsDaLuanDou = true;
		--(monsterid,fightid,aiid,dropid,lookid)
		mgrMonster:Add(50770011,(50771000+dwLevelt),50770011,50770001,100210080,pos[1].x,pos[1].y);	--杂货铺•晓薇
		mgrMonster:DelayAdd(50770012,(50771000+dwLevelt+1),50770011,50770001,100210110,pos[2].x,pos[2].y,dwObjId,DelayTime); --刘记马行•刘雨
		mgrMonster:DelayAdd(50770017,(50771000+dwLevelt+2),50770011,50770001,100210040,pos[3].x,pos[3].y,dwObjId,DelayTime*2); --南记布庄•南筱芸
		mgrMonster:DelayAdd(50770018,(50771000+dwLevelt+2),50770011,50770001,100210030,pos[4].x,pos[4].y,dwObjId,DelayTime*2); --戈记兵甲•戈楠
		mgrMonster:DelayAdd(50770019,(50771000+dwLevelt+3),50770011,50770001,100210050,pos[5].x,pos[5].y,dwObjId,DelayTime*3); --玲珑坊•杨锋
		mgrMonster:DelayAdd(50770020,(50772000+dwLevelt+4),50770020,50770001,100710100,pos[6].x,pos[6].y,dwObjId,DelayTime*4); --阿熊
		mgrMonster:DelayAdd(50770021,(50771000+dwLevelt+5),50770011,50770001,100210400,pos[7].x,pos[7].y,dwObjId,DelayTime*5); --有间书铺•章博
		mgrMonster:DelayAdd(50770022,(50771000+dwLevelt+6),50770011,50770001,100210090,pos[8].x,pos[8].y,dwObjId,DelayTime*6); --凝香银楼•周静恒
		mgrMonster:DelayAdd(50770023,(50771000+dwLevelt+7),50770011,50770001,100210410,pos[9].x,pos[9].y,dwObjId,DelayTime*7); --宝济堂•欧雅琪
		mgrMonster:DelayAdd(50770024,(50771000+dwLevelt+8),50770011,50770001,100210370,pos[10].x,pos[10].y,dwObjId,DelayTime*8); --驿馆主事•秦江
		mgrMonster:DelayAddEx(50770025,(50771000+dwLevelt+7),50770011,50770001,100210380,pos[11].x,pos[11].y,3,5,DelayTime*8); --衙役
		mgrMonster:DelayAdd(50770026,(50771000+dwLevelt+9),50770011,50770001,100210150,pos[12].x,pos[12].y,dwObjId,DelayTime*9); --风云当家•许竹青
		mgrMonster:DelayAdd(50770027,(50771000+dwLevelt+9),50770011,50770001,100210300,pos[13].x,pos[13].y,dwObjId,DelayTime*9); --风云当家•康兴哥
		sysScript:Notice("开启卧虎藏龙副本-大乱斗模式！");
		objNpc.ZKNTemp = objNpc.ZKNTemp or true
	else
		sysScript:Notice(9000661101);
	end
end

--//离开副本
function npc_fun.zcs3(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	local CDuplSystem = objPlayer:GetSystem("CDuplSystem");	----副本系统
	CDuplSystem:ExecExitDupl(1002,99)
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
