_G.InitConfig =
{
   --地图系统
    dwInitMapID = 1001,  	--初始地图
	fInitXPos = -101.79;		--出生位置
	fInitYPos = -73.70;		--出生位置
	fInitDirValue = 3;		--出生方向
	--fInitSpeed   = 5.0;		
	--游戏状态
	
	--战斗系统
	dwHP = 500;				--角色当前生命值
	dwMP = 240;				--角色当前内力值
	dwMuscle = 0;			--臂力
	dwPhysique = 0;			--体魄
	dwOrgan = 0;			--根骨
	dwTechnique = 0;		--技巧
	dwAttack = 0;			--攻击
	dwDefense = 0;			--防御
	dwFlee = 0;				--身法
	dwHitPercent = 0;		--命中
	dwCrit = 0;				--暴击
	dwHPMax= 0;				--生命max
	dwMPMax= 0;				--内力max
	dwMoveSpeed= 5.0;		--移动速度
	dwAttackSpeed= 0;		--攻击速度
	dwIgnoreDefense= 0;		--忽视防御
	dwAppendAttack = 0;		--追加伤害
	dwRemitAttack = 0;		--伤害减免
	dwBounceAttack= 0;		--伤害反弹
	dwAbsorbHP= 0;			--生命吸取
	dwAbsorbMP = 0;			--内力吸取
	dwDuck = 0;				--闪避率
	dwAppendCrit = 1.5;		--暴击伤害（百分比）
	dwAllSkillUpLv = 0; 	--武功层数
	--角色系统
	
	--背包和仓库的初始化信息
	dwInitPacketSlotNum 	= 30;	--背包初始格子数目
	dwMaxPacketSlotNum		= 288;	--背包最大格子数目
	dwPacketExtendOnceNum	= 6;	--背包扩展一次扩展个数
	dwInitStorageSlotNum	= 30;	--仓库初始格子数目
	dwMaxStorageSlotNum		= 288;	--每个仓库最大格子数目
	dwMaxAllStorageSlotNum	= 1152;	--所有仓库加起来最大格子数目(288 * 仓库数)
	dwStorageExtendOnceNum	= 6;	--仓库扩展一次扩展个数
	
	dwPackMoney 		= 0;	--背包中携带的银两数
	dwStorageMoney		= 0;	--仓库中携带的银两数
	dwGold 				= 0;	--元宝数
	dwBindGold 			= 0;	--绑定元宝数
	dwMaxMoney 			= 999999999;	--银两，元宝，礼金，最大上限。
	dwBuffValue         = 999999999;   ---buff最大数值
}

--根据角色的职业，返回角色出生的技能
function InitConfig:InitRoleSkill(dwProf)
	local tSkillList = {};
	table.insert(tSkillList,2);
	table.insert(tSkillList,11002);
	--初始送跳跃
	--table.insert(tSkillList,11013);
	
	--1镰刀
	if dwProf == 1 then
		table.insert(tSkillList,51000);
	--2刀
	elseif dwProf == 2 then
		table.insert(tSkillList,31000);
	--3剑
	elseif dwProf == 3 then
		table.insert(tSkillList,21000);
	--4枪
	elseif dwProf == 4 then
		table.insert(tSkillList,41000);
	end
	
	return tSkillList;
end;