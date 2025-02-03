--[[
功能：抽签系统类（服务器）
版本：v1.0
作者：李中昌
时间：2012-09-10 
]]
_G.CLotterySystem = {};

function CLotterySystem:new()
	local obj = CSystem:new("CLotterySystem");
	for index, value in pairs(CLotterySystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;
----------------------------------------------------------------------------------------------------
function CLotterySystem:Create()
	--获得player
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CLotterySystem Create Cannot get player");
		return false;
	end;
	--初始化DB
	--[[local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CLotterySystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CLotterySystemDB:new(objDB, self);
	--初始化数值
	local tabResult = objPlayer:GetLineData("CLotterySystem")[1]
	self.dwAmuletLevel = tabResult.dwAmuletLevel--]]	
	return true;
end;

function CLotterySystem:OnEnterScene()
	--向客户端同步信息
	local objPlayer = self:GetPlayer();
	if not objPlayer then
        return;
	end
	
	CLotterySystemManager:SyncTicketsInfo(objPlayer);
	CLotterySystemManager:SyncLastDrawInfo(objPlayer);
	CLotterySystemManager:SyncCurDrawInfo(objPlayer);
end



----------------------------------------------------------------------------------------------------

function CLotterySystem:TryBuyTicket(dwTicketIndex)
	if not self:HasAuthority('Lottery') then
		return;
	end

	if dwTicketIndex < 1 or dwTicketIndex >LotteryConfig.TicketAllCount then
		return;
	end
	
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
	
	
	local dwRoleID = objSelf:GetRoleID();
	local isAlreadyBuy, buyRoleID = CLotterySystemManager:IsTicketAlreadyBuy(dwTicketIndex);
	if isAlreadyBuy then
		local code = 2;
		
		for k, roleID in pairs(buyRoleID) do
			if roleID == dwRoleID then
				code = 1
				break
			end
		end
		
		objSelf.TicketBuyResultMsg
		{
			TicketIndex = dwTicketIndex;
			Code = code;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够, 4消耗材料不足,5 银币不足
		}
		return ;
	end
		
	local objItemSys = objSelf:GetSystem("CItemSystem");
	if not objItemSys then
		return;
	end
	
	--检查背包是否有足够空格放置购买成功礼包
	if LotteryConfig.BuySuccessGiftEnumId ~= 0 and (not objItemSys:IsPacketSlotEnoughFor(1)) then
		objSelf.TicketBuyResultMsg
		{
			TicketIndex = dwTicketIndex;
			Code = 3;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够, 4消耗材料不足,5 银币不足
		}
		return;
	end
	
	--判断消耗材料是否足够
	local isEnough, _ = objItemSys:CheckDelEnumItemInPacketCond(LotteryConfig.NeedItem.itemEnumId, LotteryConfig.NeedItem.itemCount);
	if not isEnough then
		objSelf.TicketBuyResultMsg
		{
			TicketIndex = dwTicketIndex;
			Code = 4;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够, 4消耗材料不足,5 银币不足
		}
		return;
	end
	
	--判断钱是否足够
	if not objItemSys:IsPacketMoneyEnough(LotteryConfig.NeedItem.silver) then
		objSelf.TicketBuyResultMsg
		{
			TicketIndex = dwTicketIndex;
			Code = 5;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够, 4消耗材料不足,5 银币不足
		}
		return ;
	end		
		
	CKernelApp.OnLotteryTryBuyTicketMsg
	{
		RoleID = objSelf:GetRoleID(),
		TicketIndex = dwTicketIndex,
	};
end


function CLotterySystem:BuyTicketKSResult(dwTicketIndex,dwCode)
	local objSelf = self:GetPlayer();
	if not objSelf then
		return ;
	end;
		
	if dwCode == 0 then
		local objItemSys = objSelf:GetSystem("CItemSystem");
		if not objItemSys then
			return;
		end
		
		--检查背包是否有足够空格放置购买成功礼包
		if LotteryConfig.BuySuccessGiftEnumId ~= 0 and (not objItemSys:IsPacketSlotEnoughFor(1)) then
			objSelf.TicketBuyResultMsg
			{
				TicketIndex = dwTicketIndex;
				Code = 3;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够,  4消耗材料不足, 5 银币不足, 6服务器繁忙
			}
			
			--这下要告诉KS条件不满足购买失败，然后KS给你丫解锁 嚯哈哈哈
			CKernelApp.OnLotteryRealBuyTicketMsg
			{
				RoleID = objSelf:GetRoleID(),
				TicketIndex = dwTicketIndex,
				BuySucess = 0,
			};	
			return;
		end
		
		--判断消耗材料是否足够
		local isEnough, _ = objItemSys:CheckDelEnumItemInPacketCond(LotteryConfig.NeedItem.itemEnumId, LotteryConfig.NeedItem.itemCount);
		if not isEnough then
			objSelf.TicketBuyResultMsg
			{
				TicketIndex = dwTicketIndex;
				Code = 4;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够,  4消耗材料不足, 5 银币不足, 6服务器繁忙
			}
			
			--这下要告诉KS条件不满足购买失败，然后KS给你丫解锁 嚯哈哈哈
			CKernelApp.OnLotteryRealBuyTicketMsg
			{
				RoleID = objSelf:GetRoleID(),
				TicketIndex = dwTicketIndex,
				BuySucess = 0,
			};	
			return;
		end
		
		--判断钱是否足够
		if not objItemSys:IsPacketMoneyEnough(LotteryConfig.NeedItem.silver) then
			objSelf.TicketBuyResultMsg
			{
				TicketIndex = dwTicketIndex;
				Code = 5;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够,  4消耗材料不足, 5 银币不足, 6服务器繁忙
			}
			
			--这下要告诉KS条件不满足购买失败，然后KS给你丫解锁 嚯哈哈哈
			CKernelApp.OnLotteryRealBuyTicketMsg
			{
				RoleID = objSelf:GetRoleID(),
				TicketIndex = dwTicketIndex,
				BuySucess = 0,
			};	
			return ;
		end		
		
		
		--扣消耗材料
		objItemSys:DelEnumItemInPacket(LotteryConfig.NeedItem.itemEnumId, LotteryConfig.NeedItem.itemCount, false, _G.ItemSysOperType.Lottery);
		
		--扣钱
		if LotteryConfig.NeedItem.silver > 0 then
			objItemSys:CostPacketMoney(LotteryConfig.NeedItem.silver, _G.ItemSysOperType.Lottery)
		end
	
		--给购买成功礼包
		
		--这下真的要从KS上买标签了 嚯哈哈哈
		CKernelApp.OnLotteryRealBuyTicketMsg
		{
			RoleID = objSelf:GetRoleID(),
			TicketIndex = dwTicketIndex,
			BuySucess = 1,
		};	
	end
	
	objSelf.TicketBuyResultMsg
	{
		TicketIndex = dwTicketIndex;
		Code = dwCode;	--  Code = 0购买成功, 1被自己买，2被别人买，3背包空格不够,  4消耗材料不足, 5 银币不足, 6服务器繁忙
	}
end
