--[[
--功能：坐骑强化相关配置
--版本：
	v 1.0 create by lkj 04/16/2012
	v 2.0 modify by lkj	10/15/2012 删除坐骑升级品质配置
]]

------
--坐骑对象方法
--mountInst:GetGrade()		坐骑阶数
--mountInst:GetLevel()		坐骑等级
--mountInst:GetQuality()	坐骑品质
--mountInst:GetEnumID()		坐骑配置ID
------

--【坐骑升阶相关配置】
_G.UpGradeConfig 	= {
	--是否可以使用礼金购买道具
	bCanBuyItemUseBindGold = true;
	--广播条件，大于这个值，不包含等于
	BroadCastGrade 	= 3	;
	--升阶需要材料
	----神龙果
	------神龙果道具ID
	GetSLGEnumID = function(mountInst)
		local ZZGEnumID;
		if mountInst:GetGrade() < 10 then
			ZZGEnumID = 9405010;
		else
			ZZGEnumID = 9405011;
		end
		return ZZGEnumID;
	end;
	--SLGEnumID 	= 9405010	;
	------需要个数
	NeedSLGNumData={
	[1] 		=1;
	[2] 		=2;
	[3] 		=2;
	[30001] 	=3;
	[4] 		=3;
	[40001] 	=4;
	[5] 		=4;
	[50001] 	=5;
	[6] 		=5;
	[60001] 	=6;
	[7] 	    =6;
	[70001] 	=6;
	[8] 	    =6;
	[80001] 	=6;
	[9] 	    =8;
	[90001] 	=8;
	[10] 	    =5;
	[100001] 	=5;
	[11] 	    =5;
	[110001] 	=5;
	[12] 	    =5;
	[120001] 	=5;
	};
	NeedSLGNum 	= function(mountInst)
	local canshu = mountInst:GetGrade()
	local pinzhi = mountInst:GetQuality()
	local Num=1
	
	if pinzhi~= 1 then
		canshu= canshu*10000+1
	end
	
	if _G.UpGradeConfig.NeedSLGNumData[canshu] then
		Num = _G.UpGradeConfig.NeedSLGNumData[canshu]
	end
	
		return Num
	end	;
	------神龙果描述
	SLGDescribe = "<font color='#DCB857'>获得途径：</font><br/><font color='#D9CCBD'>1.击杀野怪或BOSS有几率掉落 ".."<U><a href = 'asfunction:hrefevent,CUIMissionDailyEx:OpenPanel(3)'><font color='#0dab01'>查看BOSS</font></a></U><br/>" ..
		"2.通关副本有几率获得 ".."<U><a href = 'asfunction:hrefevent,CUIDuplWnd:OpenWnd()'><font color='#0dab01'>立即前往</font></a></U><br/>3.更多获取途径请查看<font color='#278cf1'>神龙果</font>物品描述";
	
	
	----银两
	--等阶对应消耗银两
	
	CostMoney 	= {
		[1]		=2000	;
		[2]		=5000	;
		[3]		=10000	;
		[30001]	=20000	;
		[4]		=25000	;
		[40001]	=30000	;
		[5]		=35000	;
		[50001]	=40000	;
		[6]		=45000	;
		[60001]	=50000	;
		[7]	=60000	;
		[70001]	=60000	;
		[8]	=80000	;
		[80001]	=80000	;
		[9]	=90000	;
		[90001]	=90000	;
		[10]	=100000	;
		[100001]=100000	;
		[11] 	=120000;
	    [110001]=120000;
		[12] 	=120000;
	    [120001]=120000;
	}	;
	NeedMoney 	= function(mountInst)
	local canshu = mountInst:GetGrade()
	local pinzhi = mountInst:GetQuality()
	if pinzhi~= 1 then
		canshu= canshu*10000+1
	end
	
	local money 	= UpGradeConfig.CostMoney[canshu];
	
	if not money then
		money 	= 200000;
	end	;
	
		return money;
	end	;
	
	
	--失败增加经验
	AddExp 	= function(mountInst, nPlayerLevel)
		local nExp 	= nPlayerLevel * (nPlayerLevel*(5+nPlayerLevel/20) *0.2);
	return math.floor(nExp)	;
	end	;
	
	
	--服务器基础成功率(1-10000中随机数)
	S_tWinOdds 	= 
	{
		[1] 	=	6000;
		[2] 	=	6000;
		[3] 	=	6000;
		[30001] =	3500;
		[4] 	=	3500;
		[40001] =	2500;
		[5] 	=	2500;
		[50001] =	1500;
		[6] 	=	1500;
		[60001] =	1000;
		[7]     =	800;
		[70001] =	800;
		[8]	    =	500;		
		[80001]	=	500;
		[9]	    =	200;
		[90001]	=	200;
		[10]	=	200;
		[100001] =	200;
		[11]	=	100;
		[110001] =	100;
		[12]	=	100;
		[120001] =	100;
	},
	
	S_MinLimit 	= {

		[1] 	=4;
		[2] 	=14;
		[3] 	=4;
		[30001] =35;
		[4] 	=18;
		[40001] =125;
		[5] 	=55;
		[50001] =410;
		[6] 	=110;
		[60001] =720;		
		[7]     =2000;		
		[70001] =2000;
		[8]	    =4000;		
		[80001]	=4000;
		[9]	    =8500;
		[90001]	=8500;
		[10]	=7000;
		[100001] =7000;
		[11]	=13000;
		[110001] =13000;
		[12]	=13000;
		[120001] =13000;
	};
	
	S_MaxLimit 	= {
		[1] 	=6;
		[2] 	=20;
		[3] 	=8;
		[30001] =60;
		[4] 	=35;
		[40001] =180;
		[5] 	=100;
		[50001] =520;
		[6] 	=210;
		[60001] =1000;
		[7]     =2480;
		[70001] =2480;
		[8]	    =5000;
	    [80001]	=5000;
		[9]	    =10000;
		[90001]	=10000;
		[10]	=8000;
		[100001]=8000;
		[11]	=14000;
		[110001] =14000;
		[12]	=14000;
		[120001] =14000;
     };
	
	S_SuccessRate 	= function(mountInst, nTGCFValue)
	local canshu = mountInst:GetGrade()
	local pinzhi = mountInst:GetQuality()
		if pinzhi~= 1 then
			canshu= canshu*10000+1
		end
		
	local  dwWinOdds 	= UpGradeConfig.S_tWinOdds[canshu];

	--底限
	local nMinLimit 	= UpGradeConfig.S_MinLimit[canshu];
	
	if nMinLimit then
		if nTGCFValue <= nMinLimit then
			dwWinOdds 	= 0	;
		end
	end	;

	--保底
	local nMaxLimit 	= UpGradeConfig.S_MaxLimit[canshu];
	if nMaxLimit then
		if nTGCFValue >= nMaxLimit then
			dwWinOdds 	= 10000	;
		end
	end	;
	
	return dwWinOdds ;
	end	;
};

--【坐骑资质提升相关配置】
_G.UpAptitudeConfig 	= {
	--品质提升需要材料
	---n_Grade	坐骑当前阶数
	----资质果
	------资质果道具ID
	ZZGEnumID 	= 9405030	;
	------需要个数
	NeedZZGNum 	= function(mountInst)
	return mountInst:GetGrade() + mountInst:GetQuality()	;
	end	;
	----幸运珠
	------幸运珠道具ID
	XYZEnumID 	= 4100070	;
	----银两
	NeedMoney 	= function(mountInst)
	return (200+(mountInst:GetGrade() -1)*(300+(mountInst:GetGrade() -2)*200))*(1+(mountInst:GetQuality()-1)*0.15)	;
	end	;
	
	--提升成功率(1-10000中随机数)
	---n_XYZNum	幸运珠个数
	SuccessRate 	= function(mountInst, n_XYZNum)
	local BasicWinOdds 	= 6000 - mountInst:GetQuality() * 1000
	return math.floor(BasicWinOdds + 300 * n_XYZNum)	;
	end	;

	--提升成功加成数值
	AddAptitudeValueMin 	= function(mountInst)
	return 45	;
	end	;
	AddAptitudeValueMax 	= function(mountInst)
	return 100	;
	end	;
}	;




