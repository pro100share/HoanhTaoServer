--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50601001
----------------------------------------------

-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
		local dwLevelt = sysScript:GetDuplLevel() ---获得创建副本的等级
		local Map = sysMap:GetCurMap()				----获取玩家所在地图
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		sysScript:TeamNotice(9000660183,7)	----下一波金军将在15秒之后出现，请做好万全准备！
		local D1 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
		end
		
		local D2 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
		end
		
		local D3 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
		end
		
		local D4 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
		end
		
		local D5 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
		end
		
		local D6 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
		end
		
		local D7 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-11.67,17.50,dwDelay)
		end
		
		local D8 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-11.67,17.50,dwDelay)
		end
		
		local D9 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-14.08,16.26,dwDelay)
		end
		
		local D10 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-14.08,16.26,dwDelay)
		end
		
		local D11 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-14.08,16.26,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
		end
		
		local D12 = function()
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),21.80,-7.98,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.30,-9.86,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),24.79,-9.99,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),5.97,12.46,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),10.29,10.77,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),8.52,12.43,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-13.19,13.90,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-11.67,17.50,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-14.08,16.26,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),18.80,-10.93,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-10.83,13.40,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),22.20,-12.42,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),11.12,8.62,dwDelay)
			mgrMonster:Add(50600001,(1000+dwLevelt-2),50600001,(5060000+(math.floor((dwLevelt-2)/5)*5)),-9.81,16.19,dwDelay)
		end
		
		local D13 = function()
			mgrMonster:Add(50602001,(4000+dwLevelt),50602001,(102000+(math.floor((dwLevelt-2)/5)*5)),7.25,8.89,dwDelay)
		end
		-------提示信息
		local T1 = function()
			sysScript:TeamNotice(9000660184,7)	----金军将在10秒之后出现，请做好准备！
		end
		local T2 = function()
			sysScript:TeamNotice(9000660185,7)	----金军将在5秒之后出现，请做好准备！
		end
		local T3 = function()
			sysScript:TeamNotice(9000660186,7)	----金军出现！
		end
		local T4 = function()
			sysScript:TeamNotice(9000660187,7)	----金军BOSS将在20秒之后出现，请及时清理小兵！
		end
		local T5 = function()
			sysScript:TeamNotice(9000660188,7)	----金军BOSS将在10秒之后出现，请及时清理小兵！
		end
		local T6 = function()
			sysScript:TeamNotice(9000660189,7)	----金军BOSS将在5秒之后出现，请及时清理小兵！
		end
		-------延迟脚本
		
		Map:AddTimeEvent( 5000, T1)
		Map:AddTimeEvent( 10000, T2)
		Map:AddTimeEvent( 15000, T3)
		Map:AddTimeEvent( 215000, T4)
		Map:AddTimeEvent( 225000, T5)
		Map:AddTimeEvent( 230000, T6)
		
		Map:AddTimeEvent( 15000, D1)
		Map:AddTimeEvent( 20000, D2)
		Map:AddTimeEvent( 30000, D3)
		Map:AddTimeEvent( 40000, D4)
		Map:AddTimeEvent( 55000, D5)
		Map:AddTimeEvent( 70000, D6)
		Map:AddTimeEvent( 85000, D7)
		Map:AddTimeEvent( 105000, D8)
		Map:AddTimeEvent( 125000, D9)
		Map:AddTimeEvent( 150000, D10)
		Map:AddTimeEvent( 175000, D11)
		Map:AddTimeEvent( 205000, D12)
		Map:AddTimeEvent( 235000, D13)	--BOSS
		objNpc.ZKNTemp = objNpc.ZKNTemp or true
		
	else
		sysScript:Notice(9000660182)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
