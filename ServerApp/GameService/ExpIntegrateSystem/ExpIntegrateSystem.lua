-- 炼丹系统

_G.CExpIntegrateSystem = {};

function CExpIntegrateSystem:new()
	local obj = CSystem:new("CExpIntegrateSystem");
	---
	for i,v in pairs(CExpIntegrateSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function CExpIntegrateSystem:Create()
	--每个系统创建时都会挂接到自己的管理者player身上
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CExpIntegrateSystem Create Cannot get player");
		return false;
	end;

	--重新计算经验加成
	self:CalcExpAddPer();
	
	return true;
end;

function CExpIntegrateSystem:Destroy()
	
end;


function CExpIntegrateSystem:OnEnterScene()
	self:CalcExpAddPer();
	self:SynWorldMaxLevel();
end;

--换线开始
function CExpIntegrateSystem:OnChangeLineBegin()

end

--角色升级事件响应
function CExpIntegrateSystem:EventLevelUp(dwValue,dwLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CExpIntegrateSystem EventLevelUp Cannot get player");
		return false;
	end;
	
	--重新计算经验加成
	self:CalcExpAddPer();
	
	--如果玩家升级后等级大于全服最大等级 则发送到ks 然后发送到全服所有玩家
	if objPlayer:GetLevel() > CExpIntegrateManager:GetMaxLevel() then
		CKernelApp.OnExpInteMaxlLevelMsg
		{
			MaxLevel = objPlayer:GetLevel()
		};
	end
end



--外部接口
---------------------------------------------------------------------------------------------------------------------------------

--计算世界经验加成百分比
function CExpIntegrateSystem:CalcExpAddPer()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CExpIntegrateSystem CalcExpAddPer Cannot get player");
		return false;
	end;
	

	self.worldExpAddPer =  _G.ExpIntegrateConfig:GetExpByLevel(objPlayer:GetLevel(), CExpIntegrateManager:GetMaxLevel());
	
	local tbAttr = {dwExpUp = self.worldExpAddPer / 100}
	local attrInfo = _G.SSingleAttrChange:new();
	attrInfo:Copy(tbAttr);
	objPlayer:GetSystem("CSkillSystem"):NotifyExpIntegrateUpdate(attrInfo,true);
end



--同步世界经验加成消息
function CExpIntegrateSystem:SynWorldMaxLevel()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		_err("CExpIntegrateSystem SynWorldMaxLevel Cannot get player");
		return false;
	end;
	
	objPlayer.SynExpInteMaxLevelMsg{WorldMaxlLevel = CExpIntegrateManager:GetMaxLevel()};
end
