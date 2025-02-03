--���ս������
_G.CrossSvrConfig = 
{
	[10001] = 
	{
		BattleScore = 100000;
		--[[
			--�˲����������޸ĵ�Data�ļ����� �ȸ���
			
			--���ŵ�ʱ��  CrossSvrLoginConfig���õ�����ҲҪ��
			WeeklyOpenDay = {1};
			--����ʱ��
			CreateTime = -1;
			--��ǰ֪ͨ���ʼʱ��
			NoticeStartTime = "19:50";
			--�������Ŀ�ʼʱ��
			EnterTime = "20:00";
			--�������Ľ���ʱ�� 
			StopEnterTime = "20:15";
			--����ʱ��
			ExitTime = "21:00";
		--]]
		--����ս����ʱ�䣬��ʾ����ʱ��
		fShowTime = 7440000;
		--ս��������Ҫ���뿪��ʱ������ʱ��
		tmServerOpenDistance = 3*24*3600*1000;
		
		--���е��߹㲥ʱ�� (��λ ����)
		ItemBroadcastTime = 10;
		
		--��Ҫ������Ʒ��ʱ�� (��λ ����)
		ItemHoldTime = 20;
		
		--������ģ��id
		ItemModelId = 101;
		--��������Ч
		ItemPfxId = 9000101;
		
		--��ͼ�ܱ�8052,
		MapSet = {9999};
		--����ĵ�ͼ����ֹһ����ڵ�ͼ
		--ÿ����ͼ�������ɸ���ڵ�
		EnterMapSet = 
		{
			[9999] = {1,2,3,4,5};
			
		};
		Num = 150;
		--����������߼ӵ�buffId
		BuffId = 50700029;
		
		--������������˺�����
		DamageCount = 3;
		
		--������������˺���������
		DamageRate = 3000;
		
		--��������������ڷ��Ӿ��鱶��
		ExpParam = 2;
	
		--���ս��������ֵ
		BaseHonor = 2000;
		
		--�������ֵ
		MaxHonor = 30000;
		
		--��Ʒ�������ֵ
		ItemMaxHonor = 10000;
	};
}
---ɱ�����а����ñ�
_G.CrossKillChartConfig = {
	KillChartShowMaxNum = 10; ----ɱ�����а���ʾ�������
	KillChartSelfMaxNum = 30; ----ɱ�����а���ʾ�Լ����������
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
--�����뿪���ս���һ��Ľ�Ǯ��
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

--trueΪ��ʱ�����
_G.TestVersion = false;
_G.TestTime = 0.06;  --Сʱ
_G.TestStopTime = 5;  --Сʱ

--��������Ϣ���ʱ��
_G.ChangeMapDalay = 5*60*1000;