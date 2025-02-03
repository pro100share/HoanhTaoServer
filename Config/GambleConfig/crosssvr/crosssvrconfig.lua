--跨服战场配置
_G.CrossSvrConfig = 
{
	[10001] = 
	{
		BattleScore = 100000;
		--[[
			--此部分配置已修改到Data文件夹下 热更新
			
			--开放的时间  CrossSvrLoginConfig配置的文字也要改
			WeeklyOpenDay = {1};
			--创建时间
			CreateTime = -1;
			--提前通知活动开始时间
			NoticeStartTime = "19:50";
			--允许进入的开始时间
			EnterTime = "20:00";
			--允许进入的结束时间 
			StopEnterTime = "20:15";
			--结束时间
			ExitTime = "21:00";
		--]]
		--世家战持续时间，显示倒计时用
		fShowTime = 7440000;
		--战场开启需要距离开服时间的最短时间
		tmServerOpenDistance = 3*24*3600*1000;
		
		--持有道具广播时间 (单位 分钟)
		ItemBroadcastTime = 10;
		
		--需要持有物品的时间 (单位 分钟)
		ItemHoldTime = 20;
		
		--屠龙刀模型id
		ItemModelId = 101;
		--屠龙刀特效
		ItemPfxId = 9000101;
		
		--地图总表8052,
		MapSet = {9999};
		--进入的地图，不止一个入口地图
		--每个地图还有若干个入口点
		EnterMapSet = 
		{
			[9999] = {1,2,3,4,5};
			
		};
		Num = 150;
		--屠龙刀获得者加的buffId
		BuffId = 50700029;
		
		--屠龙刀获得者伤害倍数
		DamageCount = 3;
		
		--屠龙刀获得者伤害倍数几率
		DamageRate = 3000;
		
		--屠龙刀获得者所在服加经验倍数
		ExpParam = 2;
	
		--跨服战基础荣誉值
		BaseHonor = 2000;
		
		--最大荣誉值
		MaxHonor = 30000;
		
		--物品最大荣誉值
		ItemMaxHonor = 10000;
	};
}
---杀人排行榜配置表
_G.CrossKillChartConfig = {
	KillChartShowMaxNum = 10; ----杀人排行榜显示最大数量
	KillChartSelfMaxNum = 30; ----杀人排行榜显示自己排名最大数
}

_G.LeaveCrossPos = {
	dwMapId = 1002,
	dwFxPos = -11,
	dwFyPos = 60,
};
	--local CrossArithmetic = function(Level,Step)
	
	--local Base = ((a1*n)+a1*(a1-1)*n/2)+Basis
	--return Base
--end
	--local Base = CrossArithmetic(Level,50)
	--local tbInfo = {};
--配置离开跨服战场兑换的金钱等
_G.Function = {
	Gold = function(itemList)
		local dwAllGold = 0
		for k, v in pairs(itemList) do	
			dwAllGold = dwAllGold +  (CrossSvrNpcShopConfig.GetItemPrice(v.dwEnumID,3) or 0)*v.dwCount
		end
		return dwAllGold;
	end;
	BindGold = function (itemList)
		local dwAllBindGold = 0
		for k, v in pairs(itemList) do	
			dwAllBindGold = dwAllBindGold +  (CrossSvrNpcShopConfig.GetItemPrice(v.dwEnumID,2) or 0)*v.dwCount
		end
		return dwAllBindGold;
	end;
	Money = function (itemList)
		local dwAllMoney = 0
		for k, v in pairs(itemList) do	
			dwAllMoney = dwAllMoney +  (CrossSvrNpcShopConfig.GetItemPrice(v.dwEnumID,1) or 0)*v.dwCount
		end
		return dwAllMoney;
	end;
	Honor = function (itemList)
		local dwAllHonor = 0
		for k,v in pairs(itemList) do
			for ID,dwHonor in pairs (CrossSvrNpcShopConfig.HonorList) do
				if ID == v then
					dwAllHonor = dwAllHonor + dwHonor
				end
			end
		end
		return dwAllHonor;
	end;
	Exp = function (objPlayer, dwLength)
		local playerlevel = objPlayer:GetInfo().dwLevel;
		--local sysScript = objPlayer:GetSystem("CScriptSystem")
		--local playerlevel = sysScript:GetPlayerLevel()
		local dwmin = math.floor (dwLength/60000);
		return math.floor((5*playerlevel*playerlevel+1000*playerlevel+1500)*dwmin);
	end;

}

--true为随时开启活动
_G.TestVersion = false;
_G.TestTime = 0.06;  --小时
_G.TestStopTime = 5;  --小时

--进场发消息间隔时长
_G.ChangeMapDalay = 5*60*1000;