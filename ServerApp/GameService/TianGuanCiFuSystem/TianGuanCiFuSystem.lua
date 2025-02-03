--[[
功能：天官赐福系统
类型：继承于CSystem类，用来管理玩家天官赐福功能
版本：
	v1.0	2012-05-30 create by lkj
]]

_G.CTianGuanCiFuSystem = {};

------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------外部系统调用接口---------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------装备升阶
--增加装备升阶天官赐福值
function CTianGuanCiFuSystem:Add_EquipUpGrade(itemInst)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.EquipUpGradeAddValue(itemInst);
	local dwBegin = self.n_EquipUpGrade;
	self.n_EquipUpGrade = self.n_EquipUpGrade + dwAddValue;
	if self.n_EquipUpGrade > _G.TianGuanCiFuConfig.MaxEquipUpGradeValue then
		self.n_EquipUpGrade = _G.TianGuanCiFuConfig.MaxEquipUpGradeValue;
	end;
	local dwEnd = self.n_EquipUpGrade;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 5, itemInst:GetEnumID(), 0, dwBegin, dwEnd);
	
	self:Update_EquipUpGrade(false, bBaoJi);
end;
--设置装备升阶天官赐福值
function CTianGuanCiFuSystem:Set_EquipUpGrade(n_Value, b_AlreadyModifyDB)
	self.n_EquipUpGrade = n_Value;
	self:Update_EquipUpGrade(b_AlreadyModifyDB, false);
end;
--获得装备进阶天官赐福是否已满
function CTianGuanCiFuSystem:IsEquipUpGradeMax()
	return self.n_EquipUpGrade >= _G.TianGuanCiFuConfig.MaxEquipUpGradeValue;
end;
--获得装备升阶天官赐福值
function CTianGuanCiFuSystem:Get_EquipUpGrade() 
	return self.n_EquipUpGrade;
end;

------------------------境界升级
--增加境界升级天官赐福值
function CTianGuanCiFuSystem:Add_JingJieUp(level)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.JingJieUpAddValue(level);
	local dwBegin = self.n_JingJieUp;
	self.n_JingJieUp = self.n_JingJieUp + dwAddValue;
	if self.n_JingJieUp > _G.TianGuanCiFuConfig.MaxJingJieUpValue then
		self.n_JingJieUp = _G.TianGuanCiFuConfig.MaxJingJieUpValue;
	end;
	local dwEnd = self.n_JingJieUp;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 2, level, 0, dwBegin, dwEnd);
	
	self:Update_JingJieUp(false, bBaoJi);
end;
--设置境界升级天官赐福值
function CTianGuanCiFuSystem:Set_JingJieUp(n_Value, b_AlreadyModifyDB)
	self.n_JingJieUp = n_Value;
	self:Update_JingJieUp(b_AlreadyModifyDB, false);
end;
--获得境界升级天官赐福是否已满
function CTianGuanCiFuSystem:IsJingJieUpMax()
	return self.n_JingJieUp >= _G.TianGuanCiFuConfig.MaxJingJieUpValue;
end;
--获得境界升级天官赐福值
function CTianGuanCiFuSystem:Get_JingJieUp()
	return self.n_JingJieUp;
end;

------------------------坐骑升阶
--增加坐骑升阶天官赐福值
function CTianGuanCiFuSystem:Add_MountUpGrade(mountInst)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.MountUpGradeAddValue(mountInst);
	local dwBegin = self.n_MountUpGrade;
	self.n_MountUpGrade = self.n_MountUpGrade + dwAddValue;
	if self.n_MountUpGrade > _G.TianGuanCiFuConfig.MaxMountUpGradeValue then
		self.n_MountUpGrade = _G.TianGuanCiFuConfig.MaxMountUpGradeValue;
	end;
	local dwEnd = self.n_MountUpGrade;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 1, mountInst:GetEnumID(), 0, dwBegin, dwEnd);
	
	self:Update_MountUpGrade(false, bBaoJi);
end;
--设置坐骑升阶天官赐福值
function CTianGuanCiFuSystem:Set_MountUpGrade(n_Value, b_AlreadyModifyDB)
	self.n_MountUpGrade = n_Value;
	self:Update_MountUpGrade(b_AlreadyModifyDB, false);
end;
--获得坐骑升阶天官赐福是否已满
function CTianGuanCiFuSystem:IsMountUpGradeMax()
	return self.n_MountUpGrade >= _G.TianGuanCiFuConfig.MaxMountUpGradeValue;
end;
--获得坐骑升阶天官赐福值
function CTianGuanCiFuSystem:Get_MountUpGrade()
	return self.n_MountUpGrade;
end;

-----------------------护身宝甲升阶
--增加护身宝甲升阶天官赐福值
function CTianGuanCiFuSystem:Add_AmuletUpGrade(amuletLevel)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.AmuletUpGradeAddValue(amuletLevel);
	local dwBegin = self.n_AmuletUpGrade;
	self.n_AmuletUpGrade = self.n_AmuletUpGrade + dwAddValue;
	if self.n_AmuletUpGrade > _G.TianGuanCiFuConfig.MaxAmuletUpGradeValue then
		self.n_AmuletUpGrade = _G.TianGuanCiFuConfig.MaxAmuletUpGradeValue;
	end;
	local dwEnd = self.n_AmuletUpGrade;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 4, amuletLevel, 0, dwBegin, dwEnd);
	
	self:Update_AmuletUpGrade(false, bBaoJi);
end;
--设置护身宝甲升阶天官赐福值
function CTianGuanCiFuSystem:Set_AmuletUpGrade(n_Value, b_AlreadyModifyDB)
	self.n_AmuletUpGrade = n_Value;
	self:Update_AmuletUpGrade(b_AlreadyModifyDB, false);
end;
--获得护身宝甲升阶天官赐福是否已满
function CTianGuanCiFuSystem:IsAmuletUpGradeMax()
	return self.n_AmuletUpGrade >= _G.TianGuanCiFuConfig.MaxAmuletUpGradeValue;
end;
--获得护身宝甲升阶天官赐福值
function CTianGuanCiFuSystem:Get_AmuletUpGrade()
	return self.n_AmuletUpGrade;
end;

------------------------宝剑升阶
--增加宝剑升阶天官赐福值
function CTianGuanCiFuSystem:Add_SwordUpGrade(nSwordGrade)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.SwordUpGradeAddValue(nSwordGrade);
	local dwBegin = self.n_SwordUpGrade;
	self.n_SwordUpGrade = self.n_SwordUpGrade + dwAddValue;
	if self.n_SwordUpGrade > _G.TianGuanCiFuConfig.MaxSwordUpGradeValue then
		self.n_SwordUpGrade = _G.TianGuanCiFuConfig.MaxSwordUpGradeValue;
	end;
	local dwEnd = self.n_SwordUpGrade;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 3, nSwordGrade, 0, dwBegin, dwEnd);
	
	self:Update_SwordUpGrade(false, bBaoJi);
end;
--设置宝剑升阶天官赐福值
function CTianGuanCiFuSystem:Set_SwordUpGrade(n_Value, b_AlreadyModifyDB)
	self.n_SwordUpGrade = n_Value;
	self:Update_SwordUpGrade(b_AlreadyModifyDB, false);
end;
--获得宝剑进阶天官赐福是否已满
function CTianGuanCiFuSystem:IsSwordUpGradeMax()
	return self.n_SwordUpGrade >= _G.TianGuanCiFuConfig.MaxSwordUpGradeValue;
end;
--获得宝剑升阶天官赐福值
function CTianGuanCiFuSystem:Get_SwordUpGrade() 
	return self.n_SwordUpGrade;
end;

------------------------装备强化
--增加装备强化天官赐福值
function CTianGuanCiFuSystem:Add_EquipStrong(QHStoneNum)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.EquipStrongAddValue(QHStoneNum);
	self.n_EquipStrong = self.n_EquipStrong + dwAddValue;
	if self.n_EquipStrong > _G.TianGuanCiFuConfig.MaxEquipStrongValue then
		self.n_EquipStrong = _G.TianGuanCiFuConfig.MaxEquipStrongValue;
	end;
	self:Update_EquipStrong(false, bBaoJi);
end;
--设置装备强化天官赐福值
function CTianGuanCiFuSystem:Set_EquipStrong(n_Value, b_AlreadyModifyDB)
	self.n_EquipStrong = n_Value;
	self:Update_EquipStrong(b_AlreadyModifyDB, false);
end;
--获得装备强化天官赐福是否已满
function CTianGuanCiFuSystem:IsEquipStrongMax()
	return self.n_EquipStrong >= _G.TianGuanCiFuConfig.MaxEquipStrongValue;
end;
--获得装备强化天官赐福值
function CTianGuanCiFuSystem:Get_EquipStrong() 
	return self.n_EquipStrong;
end;

------------------------领悟功法
--增加领悟功法天官赐福值
function CTianGuanCiFuSystem:Add_KungFuStudy(kungFuId, zhaoshiId)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.KungFuStudyAddValue(kungFuId, zhaoshiId);
	local dwBegin = self.n_KungFuStudy;
	self.n_KungFuStudy = self.n_KungFuStudy + dwAddValue;
	if self.n_KungFuStudy > _G.TianGuanCiFuConfig.MaxKungFuStudyValue then
		self.n_KungFuStudy = _G.TianGuanCiFuConfig.MaxKungFuStudyValue;
	end;
	local dwEnd = self.n_KungFuStudy;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 6, kungFuId * 100 + zhaoshiId, 0, dwBegin, dwEnd);
	
	self:Update_KungFuStudy(false, bBaoJi);
end;
--设置领悟功法天官赐福值
function CTianGuanCiFuSystem:Set_KungFuStudy(n_Value, b_AlreadyModifyDB)
	self.n_KungFuStudy = n_Value;
	self:Update_KungFuStudy(b_AlreadyModifyDB, false);
end;
--获得领悟功法天官赐福是否已满
function CTianGuanCiFuSystem:IsKungFuStudyMax()
	return self.n_KungFuStudy >= _G.TianGuanCiFuConfig.MaxKungFuStudyValue;
end;
--获得领悟功法天官赐福值
function CTianGuanCiFuSystem:Get_KungFuStudy()
	return self.n_KungFuStudy;
end;

------------------------杀人如麻
--增加杀人如麻天官赐福值
function CTianGuanCiFuSystem:Add_MegaKill(level)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.MegaKillAddValue(level);
	local dwBegin = self.n_MegaKill;
	self.n_MegaKill = self.n_MegaKill + dwAddValue;
	if self.n_MegaKill > _G.TianGuanCiFuConfig.MaxMegaKillValue then
		self.n_MegaKill = _G.TianGuanCiFuConfig.MaxMegaKillValue;
	end;
	local dwEnd = self.n_MegaKill;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 7, level, 0, dwBegin, dwEnd);
		
	self:Update_MegaKill(false, bBaoJi);
end;
--设置杀人如麻天官赐福值
function CTianGuanCiFuSystem:Set_MegaKill(n_Value, b_AlreadyModifyDB)
	self.n_MegaKill = n_Value;
	self:Update_MegaKill(b_AlreadyModifyDB, false);
end;
--获得杀人如麻天官赐福是否已满
function CTianGuanCiFuSystem:IsMegaKillMax()
	return self.n_MegaKill >= _G.TianGuanCiFuConfig.MaxMegaKillValue;
end;
--获得杀人如麻天官赐福值
function CTianGuanCiFuSystem:Get_MegaKill() 
	return self.n_MegaKill;
end;

---------------------------暗器系统

--暗器升阶天官赐福值
function CTianGuanCiFuSystem:Add_HiddenWeapon(classIndex)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.HiddenWeaponAddValue(classIndex);
	local dwBegin = self.n_HiddenWeapon;
	self.n_HiddenWeapon = self.n_HiddenWeapon + dwAddValue;
	if self.n_HiddenWeapon > _G.TianGuanCiFuConfig.HiddenWeaponValueMax then
		self.n_HiddenWeapon = _G.TianGuanCiFuConfig.HiddenWeaponValueMax;
	end;
	local dwEnd = self.n_HiddenWeapon;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 11, classIndex, 0, dwBegin, dwEnd);
	self:Update_HiddenWeapon(false, bBaoJi);
end;
--设置暗器升阶天官赐福值
function CTianGuanCiFuSystem:Set_HiddenWeapon(n_Value, b_AlreadyModifyDB)
	self.n_HiddenWeapon = n_Value;
	self:Update_HiddenWeapon(b_AlreadyModifyDB, false);
end;
--获得暗器升阶天官赐福是否已满
function CTianGuanCiFuSystem:IsHiddenWeaponMax()
	return self.n_HiddenWeapon >= _G.TianGuanCiFuConfig.HiddenWeaponValueMax;
end;
--获得暗器升阶天官赐福值
function CTianGuanCiFuSystem:Get_HiddenWeapon() 
	return self.n_HiddenWeapon;
end;

------------------------战骑诀系统
--增加战骑诀天官赐福值
function CTianGuanCiFuSystem:Add_ZhanQiJue(nPhase)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.ZhanQiJueAddValue(nPhase);
	local dwBegin = self.n_ZhanQiJue;
	self.n_ZhanQiJue = self.n_ZhanQiJue + dwAddValue;
	if self.n_ZhanQiJue > _G.TianGuanCiFuConfig.MaxZhanQiJueValue then
		self.n_ZhanQiJue = _G.TianGuanCiFuConfig.MaxZhanQiJueValue;
	end
	local dwEnd = self.n_ZhanQiJue;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 12, nPhase, 0, dwBegin, dwEnd);
	self:Update_ZhanQiJue(false, bBaoJi);
	return dwAddValue;
end
--设置战骑诀天官赐福值
function CTianGuanCiFuSystem:Set_ZhanQiJue(n_Value, b_AlreadyModifyDB)
	local dwBegin 	 = self.n_ZhanQiJue;
	local dwEnd 	 = n_Value;
	self.n_ZhanQiJue = n_Value;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 12, nPhase, 0, dwBegin, dwEnd);
	self:Update_ZhanQiJue(b_AlreadyModifyDB, false);
end
--获得战骑诀天官赐福是否已满
function CTianGuanCiFuSystem:IsZhanQiJueMax()
	return self.n_ZhanQiJue >= _G.TianGuanCiFuConfig.MaxZhanQiJueValue;
end
--获得战骑诀天官赐福值
function CTianGuanCiFuSystem:Get_ZhanQiJue()
	return self.n_ZhanQiJue;
end

------------------------修炼金身
--增加修炼金身天官赐福值
function CTianGuanCiFuSystem:Add_GoldenBody(nGrade)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.GoldenBodyAddValue(nGrade);
	local dwBegin = self.n_GoldenBody;
	self.n_GoldenBody = self.n_GoldenBody + dwAddValue;
	if self.n_GoldenBody > _G.TianGuanCiFuConfig.MaxGoldenBodyValue then
		self.n_GoldenBody = _G.TianGuanCiFuConfig.MaxGoldenBodyValue;
	end;
	local dwEnd = self.n_GoldenBody;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 13, nGrade, 0, dwBegin, dwEnd);
	
	self:Update_GoldenBody(false, bBaoJi);
end;
--设置修炼金身天官赐福值
function CTianGuanCiFuSystem:Set_GoldenBody(n_Value, b_AlreadyModifyDB)
	self.n_GoldenBody = n_Value;
	self:Update_GoldenBody(b_AlreadyModifyDB, false);
end;
--获得修炼金身天官赐福是否已满
function CTianGuanCiFuSystem:IsGoldenBodyMax()
	return self.n_GoldenBody >= _G.TianGuanCiFuConfig.MaxGoldenBodyValue;
end;
--获得修炼金身法天官赐福值
function CTianGuanCiFuSystem:Get_GoldenBody()
	return self.n_GoldenBody;
end;

------------------------战旗系统
--增加战旗天官赐福值
function CTianGuanCiFuSystem:Add_Banner(nPhase)
    local dwAddValue, bBaoJi = _G.TianGuanCiFuConfig.BannerAddValue(nPhase);
	local dwBegin = self.n_Banner;
	self.n_Banner = self.n_Banner + dwAddValue;
	if self.n_Banner > _G.TianGuanCiFuConfig.MaxBannerValue then
		self.n_Banner = _G.TianGuanCiFuConfig.MaxBannerValue;
	end
	local dwEnd = self.n_Banner;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 14, nPhase, 0, dwBegin, dwEnd);
	self:Update_Banner(false, bBaoJi);
	return dwAddValue;
end
--设置战旗天官赐福值
function CTianGuanCiFuSystem:Set_Banner(n_Value, b_AlreadyModifyDB)
	local dwBegin = self.n_Banner;
	local dwEnd = n_Value;
	self.n_Banner = n_Value;
	--日志记录
	CLogSystemManager:cifu(self:GetPlayer(), 14, nPhase, 0, dwBegin, dwEnd);
	self:Update_Banner(b_AlreadyModifyDB, false);
end
--获得战旗天官赐福是否已满
function CTianGuanCiFuSystem:IsBannerMax()
	return self.n_Banner >= _G.TianGuanCiFuConfig.MaxBannerValue;
end
--获得战旗天官赐福值
function CTianGuanCiFuSystem:Get_Banner()
	return self.n_Banner;
end

------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

--new()
function CTianGuanCiFuSystem:new()
	local obj = CSystem:new("CTianGuanCiFuSystem");
	--方法复制
	for index, value in pairs(CTianGuanCiFuSystem) do
		if type(value) == "function" then
			obj[index] = value;
		end;
	end;
	return obj;
end;
--create()
function CTianGuanCiFuSystem:Create()
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Create Cannot get player");
		return false;
	end;
	--初始化DB模块
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		_err("CTianGuanCiFuSystem Create Cannot get DBQuery");
		return false;
	end;
	self.objDBQuery = CTianGuanCiFuSystemDB:new(objDB, self);
	
	local Data = objPlayer:GetLineData("CTianGuanCiFuSystem")[1];
	if not Data then
		_err("CTianGuanCiFuSystem Create Cannot get lineData");
		return false;
	end;
	if Data[1] then--装备升阶
		self.n_EquipUpGrade = Data[1];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[1]");
		self.n_EquipUpGrade = 0;
	end;
	if Data[2] then--坐骑升阶
		self.n_MountUpGrade = Data[2];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[2]");
		self.n_MountUpGrade = 0;
	end;
	if Data[3] then--护身宝甲进阶
		self.n_AmuletUpGrade = Data[3];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[3]");
		self.n_AmuletUpGrade = 0;
	end;
	if Data[4] then--境界升级
		self.n_JingJieUp = Data[4];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[4]");
		self.n_JingJieUp = 0;
	end;
	if Data[5] then--宝剑升阶
		self.n_SwordUpGrade = Data[5];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[5]");
		self.n_SwordUpGrade = 0;
	end;
    if Data[6] then--装备强化
		self.n_EquipStrong = Data[6];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[6]");
		self.n_EquipStrong = 0;
	end;
	if Data[7] then--领悟功法
		self.n_KungFuStudy = Data[7];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[7]");
		self.n_KungFuStudy = 0;
	end;
	if Data[8] then--杀人如麻
		self.n_MegaKill = Data[8];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[8]");
		self.n_MegaKill = 0;
	end;
	if Data[9] then--暗器升阶
		self.n_HiddenWeapon = Data[9];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[9]");
		self.n_HiddenWeapon = 0;
	end
	if Data[10] then--战骑诀升阶
		self.n_ZhanQiJue = Data[10];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[10]");
		self.n_ZhanQiJue = 0;
	end
	if Data[11] then--领悟功法
		self.n_GoldenBody = Data[11];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[11]");
		self.n_GoldenBody = 0;
	end;
	if Data[12] then--战旗
		self.n_Banner = Data[12];
	else
		_err("CTianGuanCiFuSystem Create Cannot get lineData[12]");
		self.n_Banner = 0;
	end
	
	return true;
end;
--系统换线开始
function CTianGuanCiFuSystem:OnChangeLineBegin(dwLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("error");
		return
	end;
	local Data = {};
	Data[1] = self.n_EquipUpGrade;	--装备升阶
	Data[2] = self.n_MountUpGrade;	--坐骑升阶
	Data[3] = self.n_AmuletUpGrade;	--护身宝甲进阶
	Data[4] = self.n_JingJieUp;		--境界升级
	Data[5] = self.n_SwordUpGrade;  --宝剑升阶
    Data[6] = self.n_EquipStrong;   --装备强化
	Data[7] = self.n_KungFuStudy;	--领悟功法
	Data[8] = self.n_MegaKill;		--杀人如麻
	Data[9] = self.n_HiddenWeapon;	--暗器系统
	Data[10] = self.n_ZhanQiJue;	--战骑诀系统
	Data[11] = self.n_GoldenBody;	-- 修炼金身
	Data[12] = self.n_Banner;		--战旗系统
	objPlayer:SetLineData("CTianGuanCiFuSystem", Data);
end;
--重置所有数值
function CTianGuanCiFuSystem:ResetAll(t)
	if not t[10] then
		self:Set_EquipUpGrade(  0, true);
	end;
	if not t[7] then
		self:Set_AmuletUpGrade( 0, true);
	end;
	if not t[4] then
		self:Set_MountUpGrade(  0, true);
	end;
	if not t[5] then
		self:Set_JingJieUp(     0, true);
	end;
	if not t[6] then
		self:Set_SwordUpGrade(  0, true);
    end;
	if not t[8] then
		self:Set_KungFuStudy(   0, true);
	end;
	if not t[9] then
		self:Set_MegaKill(		0, true);
	end;
	if not t[11] then
		self:Set_HiddenWeapon(	0, true);
	end
	if not t[12] then 
		self:Set_ZhanQiJue(0, true);
	end
	if not t[13] then
		self:Set_GoldenBody(0, true);
	end
	if not t[14] then 
		self:Set_Banner(0, true);
	end
	self:Set_EquipStrong(   0, true);
end;

--------------
----增加命令
--------------
--增加装备升阶天官赐福值
function CTianGuanCiFuSystem:Add_EquipUpGradeValue(value, b_AlreadyModifyDB)
	self.n_EquipUpGrade = self.n_EquipUpGrade + value;
	if self.n_EquipUpGrade > _G.TianGuanCiFuConfig.MaxEquipUpGradeValue then
		self.n_EquipUpGrade = _G.TianGuanCiFuConfig.MaxEquipUpGradeValue;
	end;
	self:Update_EquipUpGrade(b_AlreadyModifyDB, false);
end;
--增加护身宝甲升阶天官赐福值
function CTianGuanCiFuSystem:Add_AmuletUpGradeValue(value, b_AlreadyModifyDB)
	self.n_AmuletUpGrade = self.n_AmuletUpGrade + value;
	if self.n_AmuletUpGrade > _G.TianGuanCiFuConfig.MaxAmuletUpGradeValue then
		self.n_AmuletUpGrade = _G.TianGuanCiFuConfig.MaxAmuletUpGradeValue;
	end;
	self:Update_AmuletUpGrade(b_AlreadyModifyDB, false);
end;
--增加坐骑升阶天官赐福值
function CTianGuanCiFuSystem:Add_MountUpGradeValue(value, b_AlreadyModifyDB)
	self.n_MountUpGrade = self.n_MountUpGrade + value;
	if self.n_MountUpGrade > _G.TianGuanCiFuConfig.MaxMountUpGradeValue then
		self.n_MountUpGrade = _G.TianGuanCiFuConfig.MaxMountUpGradeValue;
	end;
	self:Update_MountUpGrade(b_AlreadyModifyDB, false);
end;
--增加境界升级天官赐福值
function CTianGuanCiFuSystem:Add_JingJieUpValue(value, b_AlreadyModifyDB)
	self.n_JingJieUp = self.n_JingJieUp + value;
	if self.n_JingJieUp > _G.TianGuanCiFuConfig.MaxJingJieUpValue then
		self.n_JingJieUp = _G.TianGuanCiFuConfig.MaxJingJieUpValue;
	end;
	self:Update_JingJieUp(b_AlreadyModifyDB, false);
end;
--增加宝剑升阶天官赐福值
function CTianGuanCiFuSystem:Add_SwordUpGradeValue(value, b_AlreadyModifyDB)
	self.n_SwordUpGrade = self.n_SwordUpGrade + value;
	if self.n_SwordUpGrade > _G.TianGuanCiFuConfig.MaxSwordUpGradeValue then
		self.n_SwordUpGrade = _G.TianGuanCiFuConfig.MaxSwordUpGradeValue;
	end;
	self:Update_SwordUpGrade(b_AlreadyModifyDB, false);
end;
--增加装备强化天官赐福值
function CTianGuanCiFuSystem:Add_EquipStrongValue(value, b_AlreadyModifyDB)
	self.n_EquipStrong = self.n_EquipStrong + value;
	if self.n_EquipStrong > _G.TianGuanCiFuConfig.MaxEquipStrongValue then
		self.n_EquipStrong = _G.TianGuanCiFuConfig.MaxEquipStrongValue;
	end;
	self:Update_EquipStrong(b_AlreadyModifyDB, false);
end;
--增加领悟功法天官赐福值
function CTianGuanCiFuSystem:Add_KungFuStudyValue(value, b_AlreadyModifyDB)
	self.n_KungFuStudy = self.n_KungFuStudy + value;
	if self.n_KungFuStudy > _G.TianGuanCiFuConfig.MaxKungFuStudyValue then
		self.n_KungFuStudy = _G.TianGuanCiFuConfig.MaxKungFuStudyValue;
	end;
	self:Update_KungFuStudy(b_AlreadyModifyDB, false);
end;
--增加杀人如麻天官赐福值
function CTianGuanCiFuSystem:Add_MegaKillValue(value, b_AlreadyModifyDB)
	self.n_MegaKill = self.n_MegaKill + value;
	if self.n_MegaKill > _G.TianGuanCiFuConfig.MaxMegaKillValue then
		self.n_MegaKill = _G.TianGuanCiFuConfig.MaxMegaKillValue;
	end;
	self:Update_MegaKill(b_AlreadyModifyDB, false);
end;
--增加暗器升阶天官赐福值
function CTianGuanCiFuSystem:Add_HiddenWeaponValue(value, b_AlreadyModifyDB)
	self.n_HiddenWeapon = self.n_HiddenWeapon + value;
	if self.n_HiddenWeapon > _G.TianGuanCiFuConfig.HiddenWeaponValueMax then
		self.n_HiddenWeapon = _G.TianGuanCiFuConfig.HiddenWeaponValueMax;
	end;
	self:Update_HiddenWeapon(b_AlreadyModifyDB, false);
end;
--增加战骑诀天官赐福值
function CTianGuanCiFuSystem:Add_ZhanQiJueValue(value, b_AlreadyModifyDB)
	self.n_ZhanQiJue = self.n_ZhanQiJue + value;
	if self.n_ZhanQiJue > _G.TianGuanCiFuConfig.MaxZhanQiJueValue then
		self.n_ZhanQiJue = _G.TianGuanCiFuConfig.MaxZhanQiJueValue;
	end
	self:Update_ZhanQiJue(b_AlreadyModifyDB, false);
end

--增加修炼金身天官赐福值
function CTianGuanCiFuSystem:Add_GoldenBodyValue(value, b_AlreadyModifyDB)
	self.n_GoldenBody = self.n_GoldenBody + value;
	if self.n_GoldenBody > _G.TianGuanCiFuConfig.MaxGoldenBodyValue then
		self.n_GoldenBody = _G.TianGuanCiFuConfig.MaxGoldenBodyValue;
	end
	self:Update_GoldenBody(b_AlreadyModifyDB, false);
end

--增加战旗天官赐福值
function CTianGuanCiFuSystem:Add_BannerValue(value, b_AlreadyModifyDB)
	self.n_Banner = self.n_Banner + value;
	if self.n_Banner > _G.TianGuanCiFuConfig.MaxBannerValue then
		self.n_Banner = _G.TianGuanCiFuConfig.MaxBannerValue;
	end
	self:Update_Banner(b_AlreadyModifyDB, false);
end
------------------
----Update到数据库
------------------
--Update装备升阶天官赐福值到数据库
function CTianGuanCiFuSystem:Update_EquipUpGrade(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_EquipUpGrade(self.n_EquipUpGrade);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_EquipUpGrade Cannot get player");
		return;
	end;
	local EISys = objPlayer:GetSystem("CEquipIntensifySystem");
	if EISys then
		EISys:SynTianGuanCiFu(bBaoJi);
	else
		_err("objPlayer:GetSystem(CEquipIntensifySystem) ERROR!!!");
	end;
end;
--Update境界升级天官赐福值到数据库
function CTianGuanCiFuSystem:Update_JingJieUp(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_JingJieUp(self.n_JingJieUp);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_JingJieUp Cannot get player");
		return;
	end;
	local BournSys = objPlayer:GetSystem("CBournSystem");
	if BournSys then
		BournSys:SendCiFuValue(self.n_JingJieUp, bBaoJi)
	else
		_err("objPlayer:GetSystem(CBournSystem) ERROR!!!");
	end;
end;
--Update坐骑升阶天官赐福值到数据库
function CTianGuanCiFuSystem:Update_MountUpGrade(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_MountUpGrade(self.n_MountUpGrade);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_MountUpGrade Cannot get player");
		return;
	end;
	local MountSys = objPlayer:GetSystem("CMountSystem");
	if MountSys then
		MountSys:SynTianGuanCiFu(bBaoJi)
	else
		_err("objPlayer:GetSystem(CMountSystem) ERROR!!!");
	end;
end;
--Update境界升级天官赐福值到数据库
function CTianGuanCiFuSystem:Update_AmuletUpGrade(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_AmuletUpGrade(self.n_AmuletUpGrade);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_AmuletUpGrade Cannot get player");
		return;
	end;
	local objSystem = objPlayer:GetSystem("CAmuletSystem")
	if objSystem then
		objSystem:UpdateAmuletInfo(self.n_AmuletUpGrade, bBaoJi)
	else
		_err("objPlayer:GetSystem(CAmuletSystem) ERROR!!!");
	end
end;
--Update宝剑升阶天官赐福值到数据库
function CTianGuanCiFuSystem:Update_SwordUpGrade(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_SwordUpGrade(self.n_SwordUpGrade);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_SwordUpGrade Cannot get player");
		return;
	end;
	local SwordSys = objPlayer:GetSystem("CSwordSystem");
	if SwordSys then
		SwordSys:SynTianGuanCiFu(self.n_SwordUpGrade, bBaoJi);
	else
		_err("objPlayer:GetSystem(CSwordSystem) ERROR!!!");
	end;
end;
--Update装备强化天官赐福值到数据库
function CTianGuanCiFuSystem:Update_EquipStrong(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_EquipStrong(self.n_EquipStrong);
	end;
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- _err("CTianGuanCiFuSystem Update_EquipStrong Cannot get player");
		-- return;
	-- end;
	-- local EISys = objPlayer:GetSystem("CEquipIntensifySystem");
	-- if EISys then
		-- EISys:SynTianGuanCiFu(bBaoJi);
	-- else
		-- _err("objPlayer:GetSystem(CEquipIntensifySystem) ERROR!!!");
	-- end;
end;
--Update领悟功法天官赐福值到数据库
function CTianGuanCiFuSystem:Update_KungFuStudy(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_KungFuStudy(self.n_KungFuStudy);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_KungFuStudy Cannot get player");
		return;
	end;
	local KungFuSystem = objPlayer:GetSystem("CKungFuSystem");
	if KungFuSystem then
		KungFuSystem:SynTianGuanCiFu(bBaoJi)
	else
		_err("objPlayer:GetSystem(CKungFuSystem) ERROR!!!");
	end;
end;

--Update装备杀人如麻赐福值到数据库
function CTianGuanCiFuSystem:Update_MegaKill(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_MegaKill(self.n_MegaKill);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_MegaKill Cannot get player");
		return;
	end;
	local MKSys = objPlayer:GetSystem("CMegaKillSystem");
	if MKSys then
		MKSys:SynTianGuanCiFu(bBaoJi);
	else
		_err("objPlayer:GetSystem(CEquipIntensifySystem) ERROR!!!");
	end;
end;

--update暗器升阶赐福值到数据库
function CTianGuanCiFuSystem:Update_HiddenWeapon(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_HiddenWeapon(self.n_HiddenWeapon);
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CTianGuanCiFuSystem Update_HiddenWeapon Cannot get player");
		return;
	end;
	local HWSys = objPlayer:GetSystem("CHiddenWeaponSystem");
	if HWSys then
		HWSys:SynTianGuanCiFu(bBaoJi);
	else
		_err("objPlayer:GetSystem(CHiddenWeaponSystem) ERROR!!!");
	end;
end

--Update战骑诀天官赐福值到数据库
function CTianGuanCiFuSystem:Update_ZhanQiJue(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_ZhanQiJue(self.n_ZhanQiJue);
	end
	self:GetPlayer():GetSystem("CZhanQiJueSystem"):Synchronize();
end

--Update修炼金身天官赐福值到数据库
function CTianGuanCiFuSystem:Update_GoldenBody(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_GoldenBody(self.n_GoldenBody);
	end;

	local goldenBodySystem = self:GetPlayer():GetSystem("CGoldenBodySystem");
	if goldenBodySystem then
		goldenBodySystem:SynTianGuanCiFu(self.n_GoldenBody);
	else
		_err("Update_KungFuStudy) ERROR!!!");
	end;
end;

--Update战旗天官赐福值到数据库
function CTianGuanCiFuSystem:Update_Banner(b_AlreadyModifyDB, bBaoJi)
	if not b_AlreadyModifyDB then
		self.objDBQuery:Update_Banner(self.n_Banner);
	end
end
