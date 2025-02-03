_G.SitConfig =
{
	dwNorTick = 20000;			--获取正常收益的间隔
	dwDoubleTick = 16000;		--双修的收益间隔

	dwSplLength = 10000;		--顿悟的长度
	dwSplPer = 100;			--进入顿悟的初始概率(10000=100%)
	dwSplTick = 1250;			--顿悟收益的获取间隔
	
	dwFreeTime = 200000;			--自动打坐的时间
	
	szSitSingle = "sit2.png";			--单人图标
	szSitDouble = "sit1.png";			--双修图标
};

--一般打坐收益，——是否是双修；是否是VIP；是否是夫妻双修
function SitConfig:CountNormalGet(objSelf,dwCurSkill,isDouble,isVip,isWife)
	
	--获取较色等级
	local sRoleSkill = objSelf:GetSystem("CSkillSystem").setAllSkill[dwCurSkill]; 
	local SkillLvel = 0
	
	if sRoleSkill then
		SkillLvel = sRoleSkill:GetLevel()					--技能等级
	end
	local PalyerLevel = objSelf:GetLevel()					--角色等级
	
	local ZhenQiValue	=	1												--真气奖励
	local JingYanValue	=	math.floor(3+PalyerLevel*(1+PalyerLevel*(0.005+PalyerLevel/500)))			--经验奖励
	local XinFaValue	=	1 		--心法熟练度奖励
	local ZhenQiPro		= 	1		--真气奖励加成系数
	local JingYanPro	= 	1		--经验奖励加成系数
	local XinFaPro		= 	1		--心法熟练度奖励加成系数

	
	if isDouble == true then
		ZhenQiPro		=	ZhenQiPro + 0.2
		JingYanPro		=	ZhenQiPro + 0.2
		XinFaPro		=	ZhenQiPro + 0.2
	end
	
	if isVip == true then
		ZhenQiPro		=	ZhenQiPro + 1
		JingYanPro		=	JingYanPro + 1
		XinFaPro		=	XinFaPro + 1
	end
		
	if isWife == true then
	
		ZhenQiPro		=	ZhenQiPro + 0.5
		JingYanPro		=	JingYanPro + 0.5
		XinFaPro		=	XinFaPro + 0.5
	
	end
	
	local tInfo = 
	{
		zhenqi_G 	= 	math.floor(ZhenQiValue * ZhenQiPro),
		zhenqi_M 	= 	math.floor(ZhenQiValue * ZhenQiPro),
		zhenqi_S 	= 	math.floor(ZhenQiValue * ZhenQiPro),
		zhenqi_H 	= 	math.floor(ZhenQiValue * ZhenQiPro),
		zhenqi_T 	= 	math.floor(ZhenQiValue * ZhenQiPro),
		jingyan 	= 	math.floor(JingYanValue * JingYanPro),
		xinfa 		= 	math.floor(XinFaValue * XinFaPro),
	};
	
	return tInfo;
end;



--顿悟收益，——是否是双修；是否是VIP；是否是夫妻双修
function SitConfig:CountSpecialGet(objSelf,dwCurSkill,isDouble,isVip,isWife)
		--获取较色等级
	local sRoleSkill = objSelf:GetSystem("CSkillSystem").setAllSkill[dwCurSkill]; 
	local SkillLvel = 0
	
	if sRoleSkill then
		SkillLvel = sRoleSkill:GetLevel()					--技能等级
	end
	local PalyerLevel = objSelf:GetLevel()					--角色等级
	
	
	local tInfo = 
	{
		zhenqi_G = math.floor(1),
		zhenqi_M = math.floor(1),
		zhenqi_S = math.floor(1),
		zhenqi_H = math.floor(1),
		zhenqi_T = math.floor(1),
		jingyan = math.floor(2+(PalyerLevel-1)*(0.2+(PalyerLevel-2)*0.03)),
		xinfa = math.floor(1 + SkillLvel / 15),
	};
	
	return tInfo;
end;
