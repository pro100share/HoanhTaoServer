--[[
功能：地图格子
作者：段磊磊
时间：2012-5-22
]]
_G.CMapChecker = { }
--构造方法
function CMapChecker:new()
	local obj = {};
	setmetatable(obj, {__index = CMapChecker});
	obj.setAllPlayer = {}; --玩家列表
	obj.setAllMonster = {};--怪物列表
	obj.setAllNpc = {};--Npc列表
	obj.setAllDroper = {};--掉落列表
	obj.setAllMartial = {};--演武对象列表
	return obj;
end

function CMapChecker:Create() 
	return true;
end;

function CMapChecker:Update(dwDelayTime)

end;

function CMapChecker:Destroy()

end;
--有一个人进入格子
function CMapChecker:AddPlayer(objPlayer)
	if self.setAllPlayer[objPlayer:GetRoleID()] then
		--已经存在
		return false;
	end;
	self.setAllPlayer[objPlayer:GetRoleID()] = objPlayer;
	return true;
end;
--走出格子
function CMapChecker:DelPlayer(objPlayer)
	if not self.setAllPlayer[objPlayer:GetRoleID()] then
		--已经存在
		return false;
	end;
	self.setAllPlayer[objPlayer:GetRoleID()] = nil;
end;

--得到所有的玩家
function CMapChecker:GetAllPlayer(dwRoleID)
	if dwRoleID and dwRoleID >0 then
		return self.setAllPlayer[dwRoleID];
	end;
	return self.setAllPlayer;
end;

--有一只怪物进入格子
function CMapChecker:AddMonster(objMonster)
	if self.setAllMonster[objMonster.ObjId] then
		--已经存在
		return false;
	end;
	self.setAllMonster[objMonster.ObjId] = objMonster;
	return true;
end;
--走出格子
function CMapChecker:DelMonster(objMonster)
	if not self.setAllMonster[objMonster.ObjId] then
		--已经存在
		return false;
	end;
	self.setAllMonster[objMonster.ObjId] = nil;
end;
--得到所有的怪物
function CMapChecker:GetAllMonster(dwObjID)
	if dwObjID and dwObjID >0 then
		return self.setAllMonster[dwObjID];
	end;
	return self.setAllMonster;
end;

--加入一个NPC
function CMapChecker:AddNpc(objNpc)
	if self.setAllNpc[objNpc.ObjId] then
		--已经存在
		return false;
	end;
	self.setAllNpc[objNpc.ObjId] = objNpc;
	return true;
end;
--得到所有的NPC
function CMapChecker:GetAllNpc(objNpc)
	if objNpc and objNpc >0 then
		return self.setAllNpc[objNpc];
	end;
	return self.setAllNpc;
end;

--有一个掉落物品进入格子
function CMapChecker:AddDroper(objDroper)
	if self.setAllDroper[objDroper.ObjId] then
		--已经存在
		return false;
	end;
	self.setAllDroper[objDroper.ObjId] = objDroper;
	return true;
end;
--物品被捡起
function CMapChecker:DelDroper(ObjId)
	if not self.setAllDroper[ObjId] then
		--已经存在
		return false;
	end;
	self.setAllDroper[ObjId] = nil;
end;
--得到所有的物品
function CMapChecker:GetAllDroper(dwObjID)
	if dwObjID and dwObjID >0 then
		return self.setAllDroper[dwObjID];
	end;
	return self.setAllDroper;
end;

--添加演武
function CMapChecker:AddMartial(objMartial)
	if self.setAllMartial[objMartial.dwSelfID] then
		return false;
	end;
	self.setAllMartial[objMartial.dwSelfID] = objMartial;
	return true;
end;
--删除演武
function CMapChecker:DelMartial(ObjId)
	if not self.setAllMartial[ObjId] then
		return false;
	end;
	self.setAllMartial[ObjId] = nil;
end;
--所有的演武对象
function CMapChecker:GetAllMartial(dwObjID)
	if dwObjID and dwObjID >0 then
		return self.setAllMartial[dwObjID];
	end;
	return self.setAllMartial;
end;