--[[
	ks 活动管理（开启 结束）
	周长沙
	2013-5-20
--]]
-----------------------
--SQL 语句
local T_Festival_Info = --节日
{
	szFCmdDel = [[delete from "T_Festival_Info" where "dwFestival" = $1;]];
	szFCmdInsert = [[insert into "T_Festival_Info" values($1,$2);]];
	szFCmdRead = [[select * from "T_Festival_Info"]];
}

local T_Festival_Line = --活动
{
	szFCmdDel = [[delete from "T_Festival_Line" where "dwFestival" = $1;]];
	szFCmdRead = [[select * from "T_Festival_Line" where "dwFestival" = $1;]];
	
	szLCmdDel = [[delete from "T_Festival_Line" where "dwFestival" = $1 and "dwLine" = $2;]];
	szLCmdInsert = [[insert into "T_Festival_Line" values($1,$2,$3,$4);]];
	szLCmdUpdate = [[update "T_Festival_Line" set "dwState"=$3 where "dwFestival" = $1 and "dwLine" = $2;]];
}

local T_Role_Festival = --奖励
{
	szFCmdDel = [[delete from "T_Role_Festival" where "dwFestival" = $1;]];
	
	szLCmdDel = [[delete from "T_Role_Festival" where "dwFestival" = $1 and "dwLine" = $2;]];
	szLCmdRead = [[select * from "T_Role_Festival" where "dwFestival" = $1 and "dwLine" = $2;]];
	szLCmdInsert = [[insert into "T_Role_Festival" values($1,$2,$3,$4,$5,$6);]];
}

-----------------------------------------------------------------------------------------
--------------节日
--读取
function CFestivalManager:ReadFestivalStartInfo()
	local res = self.objDB:execute(T_Festival_Info.szFCmdRead)
	return res or {}
end
--删除
function CFestivalManager:DelFestivalStartInfo(dwFestival)
	if not dwFestival then return end;
	self.objDB:execute(T_Festival_Info.szFCmdDel,dwFestival)
	self.objDB:execute(T_Festival_Line.szFCmdDel,dwFestival)
	self.objDB:execute(T_Role_Festival.szFCmdDel,dwFestival)
end
--插入
function CFestivalManager:InsertFestivalStartInfo(dwFestival,dwTime)
	self.objDB:execute(T_Festival_Info.szFCmdInsert,dwFestival,dwTime)
end
-----------------------------------------------------------------------------------------
-------------活动
--读取
function CFestivalManager:ReadLineStartInfo(dwFestival)
	local res = self.objDB:execute(T_Festival_Line.szFCmdRead,dwFestival)
	return res or {}
end
--删除
function CFestivalManager:DelLineStartInfo(dwFestival,dwLine)
	self.objDB:execute(T_Festival_Line.szLCmdDel,dwFestival,dwLine)
	self.objDB:execute(T_Role_Festival.szLCmdDel,dwFestival,dwLine)
end
--插入
function CFestivalManager:InsertLineStartInfo(dwFestival,dwLine,dwState,dwTime)
	self.objDB:execute(T_Festival_Line.szLCmdInsert,dwFestival,dwLine,dwState,dwTime)
end
--更新 状态
function CFestivalManager:UpdateLineStartInfo(dwFestival,dwLine,dwState)
	self.objDB:execute(T_Festival_Line.szLCmdUpdate,dwFestival,dwLine,dwState)
end
------------------------------------------------------------------------------------------
-----------奖励（用于冲榜类）
--读取
function CFestivalManager:ReadLineRewardInfo(dwFestival,dwLine)
	local res = self.objDB:execute(T_Role_Festival.szLCmdRead,dwFestival,dwLine)
	return res or {}
end
--插入
function CFestivalManager:InsertLineRewardInfo(dwRoleID,dwFestival,dwLine,dwIndex,dwTime)
	self.objDB:execute(T_Role_Festival.szLCmdInsert,dwRoleID,dwFestival,dwLine,dwIndex,0,dwTime)
end














