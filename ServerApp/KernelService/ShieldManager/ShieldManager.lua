--[[
	[ \brief：护身镜系统
	[ \author：沈祺
	[ \date：2014-06-16
	[ 护身镜系统为暗器系统姊妹篇
	[ 主要是抵抗暗器技能BUFF等
	]]

--创建对象
_G.CShieldManager = CSingle:new();
CSingleManager:AddSingle(CShieldManager);   

--[[
	[ \brief 初始化
	[ \return bool true 是否创建成功
	]]
function CShieldManager:Create()
	CAlarmClock:AddTask({dwTime = _G.CShieldConfig.ResetTime},
						CAlarmTaskCycleType.eDay, 1, 0, 
						function() self:ResetPracticeTimes() end,
						{})
	return true;
end

--[[
	[ \brief 将玩家盾牌系统中物品使用次数清零
	[ \return object 系统对象
	]]
function CShieldManager:ResetPracticeTimes()
	-- 更新数据库
	CPlayerDBQuery:GetDBQuery():execute(
		'UPDATE "T_Role_Shield" SET "nCount1"=$1, "nCount2"=$2, "nCount3"=$3', 
		_G.CShieldConfig.ItemInfo[1].Count,
		_G.CShieldConfig.ItemInfo[2].Count,
		_G.CShieldConfig.ItemInfo[3].Count);
	-- 在线的玩家重置系统中的该属性
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CShieldSystem",
								Func = "ResetPracticeTimes"};
	end
end
