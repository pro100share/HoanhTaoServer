_G.StoneComposeConfig = 
{
	--宝石合成的最高等级
	MaxStoneComposeLevel 	= 12;
	--合成成功率, uLevel 为材料的等级
	SuccessRate	= function (uLevel)
		
		local seed = math.random(1, 10000);
		if uLevel == 1 then
			if seed < 8000 then
				-- return 3910020;     --3级极品
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910020;   --2级极品
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910020;   --3级极品
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   --合成成功
			else
				return 0;   --合成失败
			end;
		elseif uLevel == 2 then
			if seed < 8000 then
				-- return 3910030;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910030;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910030;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;
		elseif uLevel == 3 then
			if seed < 8000 then
				-- return 3910040;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910040;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910040;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;
		elseif uLevel == 4 then
			if seed < 7500 then
				-- return 3910050;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910050;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910050;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;
		elseif uLevel == 5 then
			if seed < 7500 then
				-- return 3910060;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910060;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910060;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;
		elseif uLevel == 6 then
			if seed < 7500 then
				-- return 3910070;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910070;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910070;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;
		elseif uLevel == 7 then
			if seed < 7500 then
				-- return 3910070;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910070;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910070;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;	

		elseif uLevel == 8 then
			if seed < 7500 then
				-- return 3910070;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910070;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910070;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;
		elseif uLevel == 9 then
			if seed < 6500 then
				-- return 3910070;   
			-- elseif seed >= 1000 and seed < 3000 then
				-- return 3910070;   
			-- elseif seed >= 3000 and seed < 6000 then
				-- return 3910070;   
			-- elseif seed >= 6000 and seed < 7000 then              
				return 1;   
			else
				return 0;   
			end;			
		end
	end;
	
	--uLevel 为材料的等级
	ShowSuccessRate	= function (position, uLevel)
		local WinPro = 0;	--宝石合成成功率
		if uLevel == 1 then
			WinPro = "高"
		elseif uLevel == 2 then
			WinPro = "高"
		elseif uLevel == 3 then
			WinPro = "高"
		elseif uLevel == 4 then
			WinPro = "中"
		elseif uLevel == 5 then
			WinPro = "中"
		elseif uLevel == 6 then
			WinPro = "中"
		elseif uLevel == 7 then
			WinPro = "中"	
		elseif uLevel == 8 then
			WinPro = "中"	
		elseif uLevel == 9 then
			WinPro = "低"	
		end
		return WinPro;
	end;
	
	--合成消耗元宝
	NeedCredit	= function (packetNum, needNum, perMoney)
		if packetNum >= needNum then
			return 0;
		else
			return (packetNum - needNum) * perMoney;
		end
	end;

	
	--合成宝石消耗的数量
	NeedStoneNum		= 3;
	
	--读条时间
	ProgressTime = 1500;
	
	--消耗的真气值 uLevel 为材料的等级
	NeedGoldValue = function(uLevel)
		local value = 2;
		
		if uLevel >2 then value = value *2 end;	
		if uLevel >3 then value = value *2 end;
		if uLevel >4 then value = value *2 end;
		if uLevel >5 then value = value *2 end;
		if uLevel >6 then value = value *2 end;
		if uLevel >7 then value = value *2 end;	
		if uLevel >8 then value = value *2 end;		
		if uLevel >9 then value = value *2 end;	
		return value;
	end;
	
	NeedWoodValue  = function (uLevel)
		local value = 2;
		
		if uLevel >2 then value = value *2 end;	
		if uLevel >3 then value = value *2 end;
		if uLevel >4 then value = value *2 end;
		if uLevel >5 then value = value *2 end;
		if uLevel >6 then value = value *2 end;
		if uLevel >7 then value = value *2 end;	
		if uLevel >8 then value = value *2 end;	
		if uLevel >9 then value = value *2 end;			
		if uType == 50 then
			uLevel = value * 1.5;
		end
		return value;
	end;
	NeedWaterValue = function (uLevel)
		local value = 2;
		
		if uLevel >2 then value = value *2 end;	
		if uLevel >3 then value = value *2 end;
		if uLevel >4 then value = value *2 end;
		if uLevel >5 then value = value *2 end;
		if uLevel >6 then value = value *2 end;
		if uLevel >7 then value = value *2 end;	
		if uLevel >8 then value = value *2 end;	
		if uLevel >9 then value = value *2 end;			
		return value;
	end;
	NeedFireValue = function (uLevel)
		local value = 2;
		
		if uLevel >2 then value = value *2 end;	
		if uLevel >3 then value = value *2 end;
		if uLevel >4 then value = value *2 end;
		if uLevel >5 then value = value *2 end;
		if uLevel >6 then value = value *2 end;
		if uLevel >7 then value = value *2 end;	
		if uLevel >8 then value = value *2 end;		
		if uLevel >9 then value = value *2 end;			
		if uType == 10 then
			uLevel = value * 1.5;
		end
		return value;	
	end;
	NeedEarthValue = function (uLevel)
		local value = 2;
		
		if uLevel >2 then value = value *2 end;	
		if uLevel >3 then value = value *2 end;
		if uLevel >4 then value = value *2 end;
		if uLevel >5 then value = value *2 end;
		if uLevel >6 then value = value *2 end;
		if uLevel >7 then value = value *2 end;		
		if uLevel >8 then value = value *2 end;	
		if uLevel >9 then value = value *2 end;		
		if uType == 20 then
			uLevel = value * 1.5;
		end		
		return value;
	end;
	
	
};

_G.StoneComposePanelMsgConfig = 
{
	UseBindMeterialMsg = "使用绑定材料时, 若本次操作的装备处于非绑定状态则操作成功后,将该装备设置为绑定状态",
	eNoEmptySlot = "背包没有空位,不能进行宝石合成操作",
	BreakCompose = "合成中断",
}
