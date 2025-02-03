--[[
	[ \brief 离线战斗
	[ \author 沈祺
	[ \date 2014-07-3
	[ 玩家可以与离线角色进行战斗
	[ 战斗已战斗力高低分胜负
	[ 内含类似排行榜功能
	]]

--数据库对象
_G.CTalkSwordDB = {};

--[[
	[ \brief 构造函数
	[ \param object objDB DB对象
	[ \param object objSys 系统对象
	]]
function CTalkSwordDB:new(objDB, objSys)
	local obj={};
	obj.objDB = objDB;
	obj.objSys = objSys;
	for k,v in pairs(self) do
		if(type(v)=="function") then
			obj[k]=v;
		end
	end
	return obj;
end

--[[
	[ \brief 插入一条数据
	]]
function CTalkSwordDB:InsertTalkSwordInfo()
	local oSqlcmd = self.objDB:CreateInsertCmd('T_Role_TalkSword');
	oSqlcmd.Wheres.nRoleID = self.objSys:GetPlayer():GetRoleID();
	oSqlcmd.Fields.nChallengeUse = self.objSys.tBaseInfo.nChallengeUse;
	oSqlcmd.Fields.nChallengeAdd = self.objSys.tBaseInfo.nChallengeAdd;
	oSqlcmd.Fields.nCDTime = self.objSys.tBaseInfo.nCDTime;
	oSqlcmd.Fields.bFullTime = self.objSys.tBaseInfo.bFullTime;
	oSqlcmd.Fields.nAttackAdd = self.objSys.tBaseInfo.nAttackAdd;
	oSqlcmd.Fields.tReport = self:MakeStringByTable(self.objSys.tReport);
	oSqlcmd.Fields.nRewardState = self.objSys.tRankRewardInfo.nRewardState;
	oSqlcmd:execute();
	return true;
end

--[[
	[ \brief 更新DB数据库
	[ 更新盾牌经验及使用次数
	]]
function CTalkSwordDB:UpdateDB()
	local oSqlcmd = self.objDB:CreateUpdateCmd("T_Role_TalkSword");
	oSqlcmd.Wheres.nRoleID = self.objSys:GetPlayer():GetRoleID();
	oSqlcmd.Fields.nChallengeUse = self.objSys.tBaseInfo.nChallengeUse;
	oSqlcmd.Fields.nChallengeAdd = self.objSys.tBaseInfo.nChallengeAdd;
	oSqlcmd.Fields.nCDTime = self.objSys.tBaseInfo.nCDTime;
	oSqlcmd.Fields.bFullTime = self.objSys.tBaseInfo.bFullTime;
	oSqlcmd.Fields.nAttackAdd = self.objSys.tBaseInfo.nAttackAdd;
	oSqlcmd.Fields.tReport = self:MakeStringByTable(self.objSys.tReport);
	oSqlcmd.Fields.nRewardState = self.objSys.tRankRewardInfo.nRewardState;
	oSqlcmd:execute();
end
