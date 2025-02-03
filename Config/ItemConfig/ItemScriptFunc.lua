--���ļ�����д������صķ�װ����

_G.ArticleSustain = {}

--���ܸ��ӱ�
local SkillAddition = {
	[5809201] = 21001;
	[5809202] = 21004;
	[5809203] = 21003;
	[5809204] = 21005;
	[5809205] = 31001;
	[5809206] = 31004;
	[5809207] = 31003;
	[5809208] = 31005;
	[5809209] = 41001;
	[5809210] = 41004;
	[5809211] = 41003;
	[5809212] = 41005;
	[5809213] = 51001;
	[5809214] = 51004;
	[5809215] = 51003;
	[5809216] = 51005;
	[5809217] = 11013;
	[5809218] = 61001;
	[5809219] = 13023;
	[5809220] = 13028;
	[5809221] = 13025;
	[5809222] = 13021;
	[5809223] = 13027;
	[5809224] = 13026;
	[5809225] = 13022;
	[5809226] = 13018;
	[5809227] = 13024;
	[5809228] = 13020;
	[5809229] = 12006;
	[5809230] = 12008;
	[5809231] = 12009;
	[5809232] = 12017;
	[5809233] = 12011;
	[5809234] = 12016;
	[5809235] = 11003;
	[5809236] = 11007;
	[5809237] = 11008;
	[5809238] = 11009;
	[5809239] = 11017;
	[5809240] = 11016;
	[5809241] = 21006;
	[5809242] = 31006;
	[5809243] = 41006;
	[5809244] = 51006;
	
};



--ʹ�õ������Ӽ���������
function ArticleSustain:SkillSkilled(objItemSys,ArticleId,value)
	local objPlayer = objItemSys:GetPlayer();
	local dwKnowLedge = value or 99999999
	if objPlayer then
		local objSkillSystem = objPlayer:GetSystem("CSkillSystem");
		if objSkillSystem then
			local objRoleSkill = objSkillSystem.setAllSkill[SkillAddition[ArticleId]];
			if objRoleSkill then
				objRoleSkill:AddSkillKnowValue(dwKnowLedge)
			end
		end
	end
end

--���ܼ��
function ArticleSustain:SkillDetection(objItemSys,ArticleId)
	local objPlayer = objItemSys:GetPlayer();
	local objSkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not (objSkillSystem) then
		objItemSys:OnError( 5000240042 );
		return nil;
	end
	local objRoleSkill = objSkillSystem.setAllSkill[SkillAddition[ArticleId]];
	if not(objRoleSkill) then
		objItemSys:OnError( 5000240042 );
		return nil;
	end
	return 0;
end


--���ϵ�������
local SkillAddition_Classify ={
	--����ְҵ
	[5809244] = {
		--����
		[1] = {51001,51003,51004,51005,51006}; 
		--��
		[2] = {31001,31003,31004,31005,31006}; 
		--��
		[3] = {21001,21003,21004,21005,21006};  
		--ǹ
		[4] = {41001,41003,41004,41005,41006}; 
			};
	--������ѧ
	[5809245] = {{11003,11007,11008,11009,11017,11016}};
	--��ѧ�ֿ�
	[5809246] = {{13023,13028,13025,13021,13027}};
	--�ش��ڹ�
	[5809247] = {{12006,12008,12009,12017,12011,12016}};
	--�ڹ��ֿ�
	[5809248] = {{13026,13022,13018,13024,13020}};
};


--ʹ�õ������Ӽ���������
function ArticleSustain:SkillSkilled_Classify(objItemSys,ArticleId,value)
	local objPlayer = objItemSys:GetPlayer();
	
	local ZhiYe =  objPlayer:GetInfo().dwProf
	
	local Control = 1;

	if (5809244 == ArticleId) then
		Control = ZhiYe;
	end

	local dwKnowLedge = value or 99999999
	if objPlayer then
		local objSkillSystem = objPlayer:GetSystem("CSkillSystem");
		if objSkillSystem then
			for k,n in pairs(SkillAddition_Classify[ArticleId][Control]) do
				local objRoleSkill = objSkillSystem.setAllSkill[n];
				if objRoleSkill then
					objRoleSkill:AddSkillKnowValue(dwKnowLedge)
				end
			end
		end
	end
end

--���ܼ��
function ArticleSustain:SkillDetection_Classify(objItemSys,ArticleId)
	local objPlayer = objItemSys:GetPlayer();
	local objSkillSystem = objPlayer:GetSystem("CSkillSystem");
	if not (objSkillSystem) then
		objItemSys:OnError( 5000240042 );
		return nil;
	end
	
	local ZhiYe =  objPlayer:GetInfo().dwProf
	local Control = 1;
	if (5809244 == ArticleId) then
		Control = ZhiYe;
	end
	
	local JiShu = 0;
	for k,n in pairs(SkillAddition_Classify[ArticleId][Control]) do
		local objRoleSkill = objSkillSystem.setAllSkill[n];
		if not(objRoleSkill) then
			JiShu = JiShu + 1;
		end
	end

	--��������͵ļ���û��ѧϰ�򲻽�������
	if (JiShu >= #SkillAddition_Classify[ArticleId][Control]) then
		objItemSys:OnError( 5000240042 );
		return nil;
	end

	return 0;
end







--ף��ֵ�����������ӱ�
local BlessingIndex = {
	--��1 ף������  ��2 ף��ֵ ��3 ʹ������
	[5801001] = {3,150,6};
	[5801002] = {3,300,8};
	[5801003] = {3,450,9};
	[5802001] = {5,150,4};
	[5802002] = {5,300,6};
	[5802003] = {5,450,7};
	[5803001] = {2,150,4};
	[5803002] = {2,300,6};
	[5803003] = {2,450,7};
	[5804001] = {4,150,5};
	[5804002] = {4,300,7};
	[5804003] = {4,450,8};
	[5801004] = {3,10,1};
	[5801005] = {3,30,1};
	[5802004] = {5,10,1};
	[5802005] = {5,30,1};
	[5803004] = {2,10,1};
	[5803005] = {2,30,1};
	[5804004] = {4,10,1};
	[5804005] = {4,30,1};
	[5801999] = {3,30,5};
	[5802000] = {3,500,1};	
};
--ף�����ӱ�
local BlessingAddition = {
	--����װ��������ٴ͸�ֵ
	[1] = "Add_EquipUpGradeValue";
	--���ӻ�����������ٴ͸�ֵ
	[2] = "Add_AmuletUpGradeValue";
	--��������������ٴ͸�ֵ
	[3] = "Add_MountUpGradeValue";
	--���Ӿ���������ٴ͸�ֵ
	[4] = "Add_JingJieUpValue";
	--���ӱ���������ٴ͸�ֵ
	[5] = "Add_SwordUpGradeValue";
	--����װ��ǿ����ٴ͸�ֵ
	[6] = "Add_EquipStrongValue";
};

--ף��ֵ����
function ArticleSustain:Blessing(objItemSys,dwItemId)
	local TGCFSys = objItemSys:GetPlayer():GetSystem("CTianGuanCiFuSystem");

	local Voluation = BlessingIndex[dwItemId][1]
	if not (Voluation) then
		return 6000610006
	end

	
	local objPlayer = objItemSys:GetPlayer();
	local JianCe = 6000610006;
	
	if (Voluation == 5) then
		--����
		local SwordSystem = objPlayer:GetSystem("CSwordSystem")
		local Lv = math.floor((SwordSystem:GetSwordLevel()/4))
		local TianGuanCiFuSystem = objPlayer:GetSystem("CTianGuanCiFuSystem")
		--��ǰֵ
		local Floor = TianGuanCiFuSystem.n_SwordUpGrade or 0
		--���ֵ
		local Max = TianGuanCiFuConfig.MaxSwordUpGradeValuedata[Lv] or 0
		--ף��ֵ�����ж�
		if (Floor >= Max) then
			return 13009300020;
		end
		--�����ж�
		if (Lv >= TianGuanCiFuConfig.MAXlv[2]) then
			return 13009300018;
		end
		JianCe = SwordSystem:CheckUpCondition()
		if not JianCe then
			return 4000110034;
		end
	elseif (Voluation == 4) then
		--����
		local BournSystem = objPlayer:GetSystem("CBournSystem")
		--����ȼ�
		local Lv = BournSystem:GetBournLv()
		local TianGuanCiFuSystem = objPlayer:GetSystem("CTianGuanCiFuSystem")
		--��ǰֵ
		local Floor = TianGuanCiFuSystem.n_JingJieUp
		--���ֵ
		local Max = TianGuanCiFuConfig.MaxJingJieUpValuedata[Lv]
		--ף��ֵ�����ж�
		if (Floor >= Max) then
			return 4000110042
		end
		--�����ж�
		if (Lv >= TianGuanCiFuConfig.MAXlv[4]) then
			return 4000110041;
		end
		JianCe = BournSystem:CheckCanUpLevel()
		if not JianCe then
			return 4000110035;
		end
	elseif (Voluation == 2) then	
		--����
		local AmuletSystem = objPlayer:GetSystem("CAmuletSystem")
		local Lv = AmuletSystem:GetLevel()
		local TianGuanCiFuSystem = objPlayer:GetSystem("CTianGuanCiFuSystem")
		--��ǰֵ
		local Floor = TianGuanCiFuSystem.n_AmuletUpGrade or 0
		--���ֵ
		local Max = TianGuanCiFuConfig.MaxAmuletUpGradeValuedata[Lv] or 0
		--ף��ֵ�����ж�
		if (Floor >= Max) then
			return 4000110042
		end
		--�����ж�
		if (Lv >= TianGuanCiFuConfig.MAXlv[3]) then
			return 13009300019;
		end
		JianCe = AmuletSystem:CheckCanUpgrade()
		if not JianCe then
			return 4000110033;
		end
	elseif (Voluation == 3) then
		--����
		local TianGuanCiFuSystem = objPlayer:GetSystem("CTianGuanCiFuSystem")
		local Lv = objPlayer:GetSystem("CMountSystem"):GetMountGrade()
		--��ǰֵ
		local Floor = TianGuanCiFuSystem.n_MountUpGrade
		--���ֵ
		local Max = TianGuanCiFuConfig.MaxMountUpGradeValuedata[Lv]
		--ף��ֵ�����ж�
		if (Floor >= Max) then
			return 4000110042
		end
		--�����ж�
		if (Lv >= TianGuanCiFuConfig.MAXlv[1]) then
			return 4000110053;
		end
	end
	local str = BlessingAddition[Voluation]
	local Implement = TGCFSys[str]
	Implement(TGCFSys,BlessingIndex[dwItemId][2])
	--������ʾ��ɾ������
	return nil;
end
--ף����⸽�ӱ�
local BlessingSubjoin = {
	--����
	[2] = {Indicator = "CheckAmuletLevel",[1] = 4000110040,[4] = 4000110026,[6] = 4000110027,[7] = 4000110028,};
	--����
	[3] = {Indicator = "CheckMountGrade",[1] = 4000110040,[5] = 4000110054,[6] = 4000110020,[8] = 4000110021,[9] = 4000110022,};
	--ʵս
	[4] = {Indicator = "CheckBournLevel",[1] = 4000110040,[5] = 4000110029,[7] = 4000110030,[8] = 4000110031,};
	--����
	[5] = {Indicator = "CheckSwordLevel",[1] = 4000110040,[4] = 4000110023,[6] = 4000110024,[7] = 4000110025,};
};
--ף��ֵʹ���������
function ArticleSustain:BlessingDetection(objItemSys,dwItemId)
	local objPlayer = objItemSys:GetPlayer();
	local ScriptSystem = objPlayer:GetSystem("CScriptSystem")
	

	local jc = BlessingIndex[dwItemId]
	
	local Voluation = BlessingSubjoin[jc[1]].Indicator
	if not (Voluation) then 
		return nil;	
	end
	local Proving = {
		[1] = "EquipUpgrade";
		[2] = "Amulet";
		[3] = "Mount";
		[4] = "Bourn";
		[5] = "Sword";
		[6] = "EquipIntensify";
	};

	local Imp = ScriptSystem:HasAuthority(Proving[jc[1]])
	--���ܿ������
	if not (Imp) then
		objItemSys:OnError(4000110040);
		return nil;	
	end	
	
	local Implement = ScriptSystem[Voluation](ScriptSystem,jc[3])
	local GongGao = BlessingSubjoin[jc[1]][jc[3]]		
	if not (Implement) then
		objItemSys:OnError(GongGao);
		return nil;	
	end
	return 0;
end


--�����������
function ArticleSustain:probability(data)
	local dwMax = 0;
	for dwItemID,dwProp in pairs(data) do
		dwMax = dwMax + dwProp[2]
	end
	local dwRes = math.random(1,dwMax)
	local dwCur = 0;
	for dwItemID,dwProp in pairs(data) do
		dwCur = dwCur + dwProp[2]
		if dwRes <= dwCur then
			return data[dwItemID][1],data[dwItemID][3];
		end
	end
end