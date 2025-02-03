--�����ս�������������


_G.PetSingleAttr = {};
function PetSingleAttr:new(isAllData)
	local obj = {};
	
	obj.dwHP = 0;
	
	obj.dwAttack = 0;--����
	obj.dwDefense = 0;--����
	obj.dwFlee = 0;--��
	obj.dwCrit = 0;--����
	obj.dwHPMax = 0;--����max
	obj.dwMPMax = 0;--����max
	obj.dwMoveSpeed = 0;--�ƶ��ٶ�
	obj.dwAttackSpeed = 0;--�����ٶ�
	obj.dwHitPercent = 0;--������
	obj.dwDuck = 0;--������
	obj.dwAppendCrit = 0; --�����˺�ϵ��
	obj.dwAppendAttack = 0; --׷���˺�
	obj.dwIgnoreDefense = 0; --���ӷ�������
	obj.dwRemitAttack = 0;	--�˺�����
	obj.deadDelayTime = 0;	--����cdʱ��
	
	obj.dwHurtMax = 0;--��������Ѫֵ
	
	if not isAllData then
		for k,v in pairs(PetSingleAttr)do
			if type(v) == "function" then
				obj[k] = v;
			end
		end
	end
	
	return obj;
end;

function PetSingleAttr:SetCurHP(dwHp)
	self.dwHP = dwHp;
end

function PetSingleAttr:AddValue(tbInfo)
	for k,v in pairs(tbInfo)do
		if self[k] and (type(v) ~= "function") then
			self[k] = self[k] + v;
		end
	end
end;

function PetSingleAttr:SetValue(tbInfo)
	for k,v in pairs(tbInfo)do
		if self[k] and (type(v) ~= "function") then
			self[k] = v;
		end
	end
end;

function PetSingleAttr:MulParam(fPer)
	for k,v in pairs(self)do
		if self[k] and (type(v) ~= "function") then
			self[k] = self[k] * fPer;
		end
	end
end;

function PetSingleAttr:MulParamFloor(fPer)
	for k,v in pairs(self)do
		if self[k] and (type(v) ~= "function") then
			self[k] = math.floor(self[k] * fPer);
		end
	end
end

function PetSingleAttr:SubValue(tbInfo)
	for k,v in pairs(tbInfo)do
		if self[k] and (type(v) ~= "function") then
			self[k] = self[k] - v;
		end
	end
end;

--��ô����ݣ�û�к���
function PetSingleAttr:GetData()
	local tb = {};
	for k,v in pairs(self)do
		if type(v) ~= "function" then
			tb[k] = v;
		end
	end
	return tb;
end;

--�޸ĳ������Ե�ϵͳ
local arrStrAdvType = 
{
	"Sword",
	"PetEquip",
	"PetUpLevel",
	"PetBourn",
	"PetAptitude",
	"PetWash",
}

--�µ��޸ĳ������Ե�ϵͳ
--�µĳ���ҽ�ϵͳ ���Ӱ��������Ե����ϵͳ��д���±�
local sysAffectPetAttr = 
{
	
}


_G.PetAttrChangeInfo = {};
function PetAttrChangeInfo:new()
	local obj = {};
	
	for i,str in pairs(arrStrAdvType)do
		obj[str] = PetSingleAttr:new();
	end
	
	for i,v in pairs(PetAttrChangeInfo) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	
	return obj;
end;

function PetAttrChangeInfo:GetInfo(isAllData)
	local tbOut = PetSingleAttr:new();
	
	for i,str in pairs(arrStrAdvType)do
		if self[str] then
			tbOut:AddValue(self[str]);
		end
	end
	
	if isAllData then
		return tbOut:GetData();
	else
		return tbOut;
	end
end;

--�����������
_G.PetBaseInfo = 
{
	[50710015] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1200;
		tbInfo.dwHPMax = 1200;
		tbInfo.dwMPMax = 60+(dwLevel-1)*6;
		tbInfo.dwAttack = 200+(dwLevel-1)*20;
		tbInfo.dwDefense = 100+(dwLevel-1)*10;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;			--��������Ѫֵ
		tbInfo.dwFlee = 40+(dwLevel-1)*4;			--��
		tbInfo.dwCrit = 20+(dwLevel-1)*2;			--����
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	
	[10021030] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1280;
		tbInfo.dwHPMax = 1280;
		tbInfo.dwMPMax = 72+(dwLevel-1)*7;
		tbInfo.dwAttack = 240+(dwLevel-1)*24;
		tbInfo.dwDefense = 120+(dwLevel-1)*12;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;		--��������Ѫֵ
		tbInfo.dwFlee = 48+(dwLevel-1)*4;			--��
		tbInfo.dwCrit = 24+(dwLevel-1)*2;			--����
		tbInfo.deadDelayTime = 120 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	[10021015] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1360;
		tbInfo.dwHPMax = 1360;
		tbInfo.dwMPMax = 84+(dwLevel-1)*8;
		tbInfo.dwAttack = 280+(dwLevel-1)*28;
		tbInfo.dwDefense = 140+(dwLevel-1)*14;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;		--��������Ѫֵ
		tbInfo.dwFlee = 56+(dwLevel-1)*5;			--��
		tbInfo.dwCrit = 28+(dwLevel-1)*2;			--����
		tbInfo.deadDelayTime = 60 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	[10051001] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1440;
		tbInfo.dwHPMax = 1440;
		tbInfo.dwMPMax = 96+(dwLevel-1)*9;
		tbInfo.dwAttack = 320+(dwLevel-1)*32;
		tbInfo.dwDefense = 160+(dwLevel-1)*16;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;		--��������Ѫֵ
		tbInfo.dwFlee = 64+(dwLevel-1)*6;			--��
		tbInfo.dwCrit = 32+(dwLevel-1)*3;			--����
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	[10092007] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP =  1520;
		tbInfo.dwHPMax = 1520;
		tbInfo.dwMPMax = 108+(dwLevel-1)*10;
		tbInfo.dwAttack = 360+(dwLevel-1)*36;
		tbInfo.dwDefense = 180+(dwLevel-1)*18;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;		--��������Ѫֵ
		tbInfo.dwFlee = 72+(dwLevel-1)*7;			--��
		tbInfo.dwCrit = 36+(dwLevel-1)*3;			--����
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	[10051003] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1600;
		tbInfo.dwHPMax = 1600;
		tbInfo.dwMPMax = 120+(dwLevel-1)*12;
		tbInfo.dwAttack = 400+(dwLevel-1)*40;
		tbInfo.dwDefense = 200+(dwLevel-1)*20;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;		--��������Ѫֵ
		tbInfo.dwFlee = 80+(dwLevel-1)*8;			--��
		tbInfo.dwCrit = 40+(dwLevel-1)*4;			--����
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	[10082007] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1680;
		tbInfo.dwHPMax = 1680;
		tbInfo.dwMPMax = 132+(dwLevel-1)*13;
		tbInfo.dwAttack = 440+(dwLevel-1)*44;
		tbInfo.dwDefense = 220+(dwLevel-1)*22;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;			--��������Ѫֵ
		tbInfo.dwFlee = 88+(dwLevel-1)*8;			--��
		tbInfo.dwCrit = 44+(dwLevel-1)*4;			--����
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	[10071007] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1760;
		tbInfo.dwHPMax = 1760;
		tbInfo.dwMPMax = 144+(dwLevel-1)*14;
		tbInfo.dwAttack = 480+(dwLevel-1)*48;
		tbInfo.dwDefense = 240+(dwLevel-1)*24;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;			--��������Ѫֵ
		tbInfo.dwFlee = 96+(dwLevel-1)*9;			--��
		tbInfo.dwCrit = 48+(dwLevel-1)*4;			--����	
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��
			
		return tbInfo;
	end;
	[50302063] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP = 1840;
		tbInfo.dwHPMax = 1840;
		tbInfo.dwMPMax = 156+(dwLevel-1)*15;
		tbInfo.dwAttack = 520+(dwLevel-1)*52;
		tbInfo.dwDefense = 260+(dwLevel-1)*26;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;			--��������Ѫֵ
		tbInfo.dwFlee = 104+(dwLevel-1)*10;			--��
		tbInfo.dwCrit = 52+(dwLevel-1)*5;			--����	
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��
		
		return tbInfo;
	end;
	[10061001] = function(dwLevel)
		local tbInfo = PetSingleAttr:new();
		tbInfo.dwMoveSpeed = 500;
		tbInfo.dwHP =  2000;
		tbInfo.dwHPMax = 2000;
		tbInfo.dwMPMax = 180+(dwLevel-1)*18;
		tbInfo.dwAttack = 600+(dwLevel-1)*60;
		tbInfo.dwDefense = 300+(dwLevel-1)*30;
		tbInfo.dwHitPercent = 0;	--������
		tbInfo.dwDuck = 0;		--������
		tbInfo.dwHurtMax = 40;			--��������Ѫֵ
		tbInfo.dwFlee = 120+(dwLevel-1)*12;			--��
		tbInfo.dwCrit = 60+(dwLevel-1)*6;			--����
		tbInfo.deadDelayTime = 180 * ONE_SECOND_MSEC;	--��������cdʱ��	
			
		return tbInfo;
	end;

}


--���＼���ͷ�Ȩ������
_G.PetSkillWeight =
{
	--[����id]  =  Ȩ��ֵ
	[20000036] = 200;
	[20000001] = 7;
	[20000002] = 7;
	[20000003] = 7;
	[20000004] = 7;
	[20000005] = 7;
	[20000006] = 7;
	[20000007] = 7;
	[20000008] = 7;
	[20000009] = 7;
	[20000010] = 7;
	[20000011] = 4;
	[20000012] = 4;
	[20000013] = 4;
	[20000014] = 4;
	[20000015] = 4;
	[20000016] = 1;
	[20000017] = 4;
	[20000018] = 4;
	[20000019] = 4;
	[20000020] = 4;
	[20000021] = 1;
	[20000022] = 1;
	[20000023] = 1;
	[20000024] = 1;
	[20000025] = 1;
	[20000026] = 1;
	
}


--����ս��������
_G.PetBattleScoreFunction = 
{
	FunGetSkillScore = function(dwAllLevel)
		return dwAllLevel;
	end;
}

