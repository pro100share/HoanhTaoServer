--[[
功能：宠物被动技能属性配置表
作者：魏云
时间：2013-11-6
--]]
_G.PetPassivitySkillScript = {};

_G.PetPassivitySkillAttriConfig = {
	[20000028] = {
		AddExpPre = 50;			--经验加成50%（角色）
		HurtPre = 0;			--自身减免伤害10%（角色）
		TarAttHurtPoint = 0;	--反弹100点伤害（自身）
		--激活后获得的属性
		PlayerFunProperty = function()			--给人加属性（）
			local objAdv = SSingleAttrChange:new();		
			objAdv.dwAttack= 0 ;
			objAdv.dwDefense= 0;
			objAdv.dwFlee= 0;
			objAdv.dwCrit= 0;
			objAdv.dwHPMax= 0;
			objAdv.dwMPMax= 0;
			objAdv.dwMoveSpeed= 0;
			objAdv.dwAttackSpeed= 0;
			objAdv.dwRemitAttack= 0;
			return objAdv;
		end;
	},
	[20000029] = {
		AddExpPre = 0;			--经验加成50%（怪）
		HurtPre = 0;			--自身减免伤害10%
		TarAttHurtPoint = 0;	--反弹100点伤害
		--激活后获得的属性
		PlayerFunProperty = function()			--给人加属性
			local objAdv = SSingleAttrChange:new();		
			objAdv.dwAttack= 1 ;
			objAdv.dwDefense= 0;
			objAdv.dwFlee= 0;
			objAdv.dwCrit= 0;
			objAdv.dwHPMax= 0;
			objAdv.dwMPMax= 0;
			objAdv.dwMoveSpeed= 0;
			objAdv.dwAttackSpeed= 0;
			objAdv.dwRemitAttack= 0;
			return objAdv;
		end;
	},	
	[20000030] = {
		AddExpPre = 0;			--经验加成50%
		HurtPre = 0;			--自身减免伤害10%
		TarAttHurtPoint = 0;	--反弹100点伤害
		--激活后获得的属性
		PlayerFunProperty = function()			--给人加属性
			local objAdv = SSingleAttrChange:new();		
			objAdv.dwAttack= 0 ;
			objAdv.dwDefense= 1;
			objAdv.dwFlee= 0;
			objAdv.dwCrit= 0;
			objAdv.dwHPMax= 0;
			objAdv.dwMPMax= 0;
			objAdv.dwMoveSpeed= 0;
			objAdv.dwAttackSpeed= 0;
			objAdv.dwRemitAttack= 0;
			return objAdv;
		end;
	},		
	[20000031] = {
		AddExpPre = 0;			--经验加成50%
		HurtPre = 0;			--自身减免伤害10%
		TarAttHurtPoint = 0;	--反弹100点伤害
		--激活后获得的属性
		PlayerFunProperty = function()			--给人加属性
			local objAdv = SSingleAttrChange:new();		
			objAdv.dwAttack= 0 ;
			objAdv.dwDefense= 0;
			objAdv.dwFlee= 0;
			objAdv.dwCrit= 1;
			objAdv.dwHPMax= 0;
			objAdv.dwMPMax= 0;
			objAdv.dwMoveSpeed= 0;
			objAdv.dwAttackSpeed= 0;
			objAdv.dwRemitAttack= 0;
			return objAdv;
		end;
	},		
	[20000032] = {
		AddExpPre = 0;			--经验加成50%
		HurtPre = 0;			--自身减免伤害10%
		TarAttHurtPoint = 0;	--反弹100点伤害
		--激活后获得的属性
		PlayerFunProperty = function()			--给人加属性
			local objAdv = SSingleAttrChange:new();		
			objAdv.dwAttack= 0 ;
			objAdv.dwDefense= 0;
			objAdv.dwFlee= 1;
			objAdv.dwCrit= 0;
			objAdv.dwHPMax= 0;
			objAdv.dwMPMax= 0;
			objAdv.dwMoveSpeed= 0;
			objAdv.dwAttackSpeed= 0;
			objAdv.dwRemitAttack= 0;
			return objAdv;
		end;
	},	
	[20000033] = {
		AddExpPre = 0;			--经验加成50%
		HurtPre = -10;			--自身减免伤害10%
		TarAttHurtPoint = 0;	--反弹100点伤害
		--激活后获得的属性
		PlayerFunProperty = function()			--给人加属性
			local objAdv = SSingleAttrChange:new();		
			objAdv.dwAttack= 0 ;
			objAdv.dwDefense= 0;
			objAdv.dwFlee= 0;
			objAdv.dwCrit= 0;
			objAdv.dwHPMax= 0;
			objAdv.dwMPMax= 0;
			objAdv.dwMoveSpeed= 0;
			objAdv.dwAttackSpeed= 0;
			objAdv.dwRemitAttack= 0;
			return objAdv;
		end;
	},	
	[20000034] = {
		AddExpPre = 0;			--经验加成50%
		HurtPre = 0;			--自身减免伤害10%
		TarAttHurtPoint = 1;	--反弹100点伤害
		--激活后获得的属性
		PlayerFunProperty = function()			--给人加属性
			local objAdv = SSingleAttrChange:new();		
			objAdv.dwAttack= 0 ;
			objAdv.dwDefense= 0;
			objAdv.dwFlee= 0;
			objAdv.dwCrit= 0;
			objAdv.dwHPMax= 0;
			objAdv.dwMPMax= 0;
			objAdv.dwMoveSpeed= 0;
			objAdv.dwAttackSpeed= 0;
			objAdv.dwRemitAttack= 0;
			return objAdv;
		end;
	},		
}

----获取反弹伤害
function PetPassivitySkillScript:GetSkillToTarHurt(skillID,skillLevel)
	return _G.PetPassivitySkillAttriConfig[skillID].TarAttHurtPoint*(math.floor(0.16*skillLevel^2+20*skillLevel+50));
end
---获取给玩家加的属性值
function PetPassivitySkillScript:GetSkillToPlayerProperty(skillID,skillLevel)
	local objAdv = _G.PetPassivitySkillAttriConfig[skillID].PlayerFunProperty()
	objAdv.dwAttack= objAdv.dwAttack*(math.floor(0.4*skillLevel^2+10*skillLevel+50));				
	objAdv.dwDefense= objAdv.dwDefense*(math.floor(0.2*skillLevel^2+5*skillLevel+25));
	objAdv.dwFlee= objAdv.dwFlee*(math.floor(0.08*skillLevel^2+2*skillLevel+10))
	objAdv.dwCrit= objAdv.dwCrit*(math.floor(0.08*skillLevel^2+2*skillLevel+10))
	objAdv.dwHPMax = 0;
	objAdv.dwMPMax = 0;
	objAdv.dwMoveSpeed= 0;
	objAdv.dwAttackSpeed= 0;
	objAdv.dwRemitAttack= 0;
	return objAdv;
end