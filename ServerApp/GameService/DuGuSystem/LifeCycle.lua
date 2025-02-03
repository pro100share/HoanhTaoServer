--[[
	[\brief 生命周期函数
	[\author 王凌波
	[\date 2014-5-30
	[在独孤九剑系统特定生命周期下处理相关事务
  ]]

_G.CDuGuSystem = {};

function CDuGuSystem:new()
	local obj = CSystem:new("CDuGuSystem");
	for k, v in pairs(self) do
		if type(v) == "function" then
			obj[k] = v;
		end
	end
	-- 本系统权限字串
	obj.sAuthority 			= "DuGuJiuJian";
	-- 需要从数据库中读
	obj.dwEXP 				= 0;               --Todo下次 数据库命名注意 数据命名与 代码命名规范不同
	obj.nActSwordId 		= 0;
	obj.nPrimaryTimes 		= 0;
	obj.nIntermediateTimes 	= 0;
	obj.nAdvancedTimes 		= 0;
	-- 需要的预备属性
	obj.objDBQuery 			= nil;
	return obj;
end

--[[
	[\brief 创建系统
	[\param boolean bIsChangeLine 是否在换线
  ]]
function CDuGuSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	
	--初始化DB管理器
	if not CConfig.bIsCrossSvr then
		local objDB = objPlayer:GetDBQuery();
		_assert(objDB, "CDuGuSystem Create Cannot get DBQuery");
		self.objDBQuery = CDuGuSystemDB:new(objDB, self);
	end

	--读取数据库数据，存入Data
	local Data = objPlayer:GetLineData("CDuGuSystem")[1];
	_assert(Data, "CDuGuSystem Create CanNot GetLineData");

	-- 用数据库数据初始化系统各属性
	local bIsNewOnLine = true;
	for k, v in pairs(Data) do
		bIsNewOnLine = false;
		self[k] = v;
	end

	-- 如果玩家是第一次登陆，还没有以上字段的数据库记录，则需要往数据库里新增记录
	-- if bIsNewOnLine and not CConfig.bIsCrossSvr then     --Todo 暂不处理 跨服相关 
	if bIsNewOnLine then
		self.objDBQuery:Execute("Insert",
			{ 	dwEXP 				= self.dwEXP,
				nActSwordId 		= self.nActSwordId,
				nPrimaryTimes 		= self.nPrimaryTimes,
				nIntermediateTimes 	= self.nIntermediateTimes,
				nAdvancedTimes 		= self.nAdvancedTimes });
	end
	
	self:SetEXP(self.dwEXP);
	self:SetActSwordId(self.nActSwordId);

	return true;
end

--[[
	[\brief 销毁系统
  ]]
function CDuGuSystem:Destroy()
	self.objDBQuery = nil;
end

--[[
	[\brief 进入场景
  ]]
function CDuGuSystem:OnEnterScene()
	self:Synchronize();
end

--[[
	[\brief 换线开始
  ]]
function CDuGuSystem:OnChangeLineBegin()
	local objPlayer = self:GetPlayer();
	local Data = { 	dwEXP 				= self.dwEXP, 
					nActSwordId 		= self.nActSwordId, 
					nPrimaryTimes 		= self.nPrimaryTimes, 
					nIntermediateTimes 	= self.nIntermediateTimes,
					nAdvancedTimes 		= self.nAdvancedTimes };

	-- TODO，看看换线时候这个函数可以调吗
	objPlayer:SetLineData("CDuGuSystem", Data);
	self:DealBreakPro();
end


