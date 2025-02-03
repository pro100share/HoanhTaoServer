--鎬墿鎶€鑳借剼鏈?
--绱㈠紩澶囨敞锛氫互鎬墿鎵€鍦ㄥ湴鍥炬煡鎵?
--
----------------------------------------------------------------------------------------
-----------------------------------浠诲姟鎬墿鎶€鑳介厤缃?------------------------------------
-------------------------------------鎬墿鍩虹鎶€鑳?--------------------------------------
--浜鸿鎬墿鍑婚€€
local function ExecMoveActiveForMonster(sysMonsterSkill,dwBackLength,dwRoleId,dwSkillID,dwActCount)
	local objPlayer = sysMonsterSkill:GetMon():GetMap():GetPlayerByRoleID(dwRoleId);
	if not objPlayer then
		return;
	end
	
	local _,sx,sy = sysMonsterSkill:GetMon():GetPos();
	local _,px,py = objPlayer:GetSystem("CMapSystem"):GetPlayerMapPos();
	
	local vecDis = Vector2.new(px-sx,py-sy);
	vecDis:normalize();
	
	local vecPosLast = 
	{
		x = px + vecDis.x*dwBackLength,
		y = py + vecDis.y*dwBackLength,
	};
	
	local vecList = {};
	table.insert(vecList,vecPosLast);
	
	local objSklSystem = objPlayer:GetSystem("CSkillSystem");
	objSklSystem:BroadcastSkillMsg(true,"OnPlaySkillMoveEffectMsg",
		{
			ActionID = 6,
			StartType = 4,
			StartID = objPlayer:GetRoleID(),
			PosList = vecList,
			Delay = 200,
			Index = 1,
			ShadowID = 0,
			SkillID = dwSkillID,
			ExecTime = _now(),
			ActCount = dwActCount,
		})
end;

--娣诲姞buff
local function AddRoleObjBuff(objRole,dwBuffID,dwLevel,objUser)
	local dwType = objRole:GetObjType();
	
	if dwType == enEntType.eEntType_Player then
		local buffSystem = objRole:GetSystem("CBuffSystem");
		buffSystem:AddBuff(dwBuffID,dwLevel,objUser)
	elseif dwType == enEntType.eEntType_Monster then
		local sysMonsterBuff = objRole:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(dwBuffID,dwLevel,objUser)
	end
end;

--鎬墿鍍忕洰鏍囧啿閿?
local function MonsterAssault(sysMonsterSkill,dwActID,dwDelay,dwRoleID)
	local objMon = sysMonsterSkill:GetMon();
	
	local objPlayer = objMon:GetMap():GetPlayerByRoleID(dwRoleId);
	if not objPlayer then
		return;
	end
	
	local _,px,py = objPlayer:GetSystem("CMapSystem"):GetPlayerMapPos();
	
	local vecPosLast = 
	{
		x = px,
		y = py,
	};
	
	local vecList = {};
	table.insert(vecList,vecPosLast);
	
	objMon:CompelMove(dwActID,dwDelay,dwRoleID,vecList,0,0,0);
end;
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
--------------------------------------妗冭姳宀?-------------------------------------------
--鎶€鑳絒10042012]//////////////鍝戜粏澶撮//////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[10042012]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {550};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 130 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;
--------------------------------------------------------------------------------
--鎶€鑳絒100420050]//////////////鐜夎熅(浠诲姟)鎶€鑳戒竴//////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[100420050]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:AddBuff(dwRoleId,100420050,1);
end

--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 100 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,140,600;
end;




--鎶€鑳絒100120040]//////////////寮備埂澶撮鎶€鑳戒竴//////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[100120040]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {1200};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	--[[
		dwRoleId:琚敾鍑荤殑鐜╁id
		dwValue:閫犳垚鐨勪激瀹筹紝涓簄il鍒欑敱绯荤粺璁＄畻
		dwSkillId:浣跨敤鐨勬妧鑳絠d(dwValue 涓嶄负nil鍒欐棤鏁?
		dwSkillLevel:鎶€鑳界殑绛夌骇(dwValue 涓嶄负nil鍒欐棤鏁?
		bHit:鏄惁寮哄埗鍛戒腑
		bCrit:鏄惁寮哄埗鏆村嚮(dwValue 涓嶄负nil鍒欒〃鐜颁负鏆村嚮锛屼激瀹充负dwValue)
	--]]
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	ExecMoveActiveForMonster(sysMonsterSkill,4,dwRoleId,100120040,dwActCount);
	
	if (dwSkillLevel == 2) then
		sysMonsterSkill:SelfBuff(9505,1);
	end
	
	--sysMonsterSkill:AddBuff(dwRoleId,610002,1);
end

--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2000;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 180 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;






--------------------------------------------------------------------------------
--鎶€鑳絒10012005]//////////////閲戝啗楂樻墜鎶€鑳戒竴//////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[100120050]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {199};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	--[[
		dwRoleId:琚敾鍑荤殑鐜╁id
		dwValue:閫犳垚鐨勪激瀹筹紝涓簄il鍒欑敱绯荤粺璁＄畻
		dwSkillId:浣跨敤鐨勬妧鑳絠d(dwValue 涓嶄负nil鍒欐棤鏁?
		dwSkillLevel:鎶€鑳界殑绛夌骇(dwValue 涓嶄负nil鍒欐棤鏁?
		bHit:鏄惁寮哄埗鍛戒腑
		bCrit:鏄惁寮哄埗鏆村嚮(dwValue 涓嶄负nil鍒欒〃鐜颁负鏆村嚮锛屼激瀹充负dwValue)
	--]]
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:AddBuff(dwRoleId,96000,1,2);
end

--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 135 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,120,600;
end;



--------------------------------------------------------------------------------
--鎶€鑳絒100320060]//////////////閲戝啗灏嗛鎶€鑳戒竴//////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[100320060]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	--ExecMoveActiveForMonster(sysMonsterSkill,3,dwRoleId,10012004,dwActCount);
end

--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1700;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 160 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,140,600;
end;


---------------------------------缁濇儏瀵嗘锭-------------------------------------
--鎶€鑳絒10052005]//////////////宸ㄩ硠(浠诲姟)鎶€鑳戒竴//////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[100520050]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {200};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	sysMonsterSkill:AddBuff(dwRoleId,100520050,1);
end

--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 130 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,110,600;
end;


--鎶€鑳絒100320081]//////////////閲戝啗澶寸洰鎶€鑳戒竴//////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[100320081]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {800};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end

--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 140 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end
function Skill:SkillMonsterAction()
	return 1,110,600;
end;




--鎶€鑳絒200020041]//////////////榛勮嵂甯?/////////////////////////////////////
--鎶€鑳戒娇鐢ㄦ晥鏋?
local Skill = SkillConfig[200020041]; 
--鑾峰彇鎶€鑳界殑鎵ц鏃堕棿鐐?
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--鎶€鑳戒富鍔ㄦ晥鏋?
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--鑾峰彇纭洿鏃堕棿锛堟绉掞級
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--鎶€鑳芥晥鏋滄槸鍚﹁窡闅忕洰鏍?
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--鑾峰緱鎶€鑳界殑鐩爣鏁伴噺
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--鑾峰彇鎶€鑳介檮鍔犵殑灞炴€э紙琛級
-- dwTargetType: 1 鎬墿锛?	鐜╁
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--涓诲姩浣跨敤鏃堕檮鍔犲睘鎬?
		Active={
			dwAttack = 0,			--鏀诲嚮鍔?
			dwAttack_mul = 140 ,				--鏀诲嚮鍔涚郴鏁?
			dwExtraAttack = 0,				--鐗规畩棰濆鏀诲嚮鍔?
		},
		--琚姩闄勫姞灞炴€?
		Passive={
		},
		szInfo = "璇存槑"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 3,201,90;
end;


--技能[10042010]//////////////粱梦儿//////////////////////////////////////
--技能使用效果
local Skill = SkillConfig[10042010]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 130 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[10042009]//////////////大飞//////////////////////////////////////
local Skill = SkillConfig[10042009]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300,500,800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 70 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;


--技能[50942001]//////////////李莫愁//////////////////////////////////////
local Skill = SkillConfig[50942001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,700,800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 80 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[80602005]//////////////南筱芸//////////////////////////////////////
local Skill = SkillConfig[80602005]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,700,800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 80 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[806020051]//////////////南筱芸//////////////////////////////////////
local Skill = SkillConfig[806020051]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {700};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[80602004]//////////////晓薇//////////////////////////////////////
local Skill = SkillConfig[80602004]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 140 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[806020041]//////////////晓薇//////////////////////////////////////
local Skill = SkillConfig[806020041]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,1000};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 90 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end


--技能[80602003]//////////////康兴哥//////////////////////////////////////
local Skill = SkillConfig[80602003]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {400,600,700,1100};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 70 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性aa
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;

--技能[806020031]//////////////康兴哥//////////////////////////////////////
local Skill = SkillConfig[806020031]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1000;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

--技能[80602002]//////////////许竹青//////////////////////////////////////
local Skill = SkillConfig[80602002]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {500,600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 90 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;


--技能[80602002]//////////////陆冠英//////////////////////////////////////
local Skill = SkillConfig[80602001]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600,700,800};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1900;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 90 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[80602002]//////////////卫天望//////////////////////////////////////
local Skill = SkillConfig[10072013]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {700};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 100 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;


--技能[80602002]//////////////巴特尔//////////////////////////////////////
local Skill = SkillConfig[10072011]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {600};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1500;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 140 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;



--技能[80602006]//////////////镖局牛冲天//////////////////////////////////////
local Skill = SkillConfig[80602006]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {300,600,900,1200};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 2200;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 10
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 75 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,140,600;
end;

--技能[80602006]//////////////公孙止//////////////////////////////////////
local Skill = SkillConfig[50202100]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {900};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
	ExecMoveActiveForMonster(sysMonsterSkill,3,dwRoleId,100120040,dwActCount);
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 140 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,110,600;
end;

--技能[80602006]//////////////李莫愁//////////////////////////////////////
local Skill = SkillConfig[50202101]; 
--获取技能的执行时间点
function Skill:GetMonsterExecTimeArray(dwSkillLevel)
	local sInfo = {800,900};
	return sInfo;
end;
--技能主动效果
function Skill:SkillMonsterActiveEffect(sysMonsterSkill,dwRoleId,dwSkillLevel,dwActCount)
	sysMonsterSkill:DoHurt(dwRoleId,dwValue,nil,dwSkillLevel,bHit,bCrit)
end
--------------------------------------------------------------------------------
--获取硬直时间（毫秒）
function Skill:GetMonsterSkillHold(dwAttackSpeed,dwSkillLevel)
	return 1800;
end
--技能效果是否跟随目标
function Skill:IsMonsterSkillFollow(dwSkillLevel)
	return false
end

--获得技能的目标数量
function Skill:GetSkillTargetMax(dwRoleID,dwLevel)
	return 1
end

--获取技能附加的属性（表）
-- dwTargetType: 1 怪物，2	玩家
function Skill:GetPropertiesAdd(dwLevel,objSelf,objEnemy)
	local Properties = {
		
		--主动使用时附加属性
		Active={
			dwAttack = 0,			--攻击力
			dwAttack_mul = 140 ,				--攻击力系数
			dwExtraAttack = 0,				--特殊额外攻击力
		},
		--被动附加属性
		Passive={
		},
		szInfo = "说明"
	}
	return Properties;
end

function Skill:SkillMonsterAction()
	return 1,130,600;
end;