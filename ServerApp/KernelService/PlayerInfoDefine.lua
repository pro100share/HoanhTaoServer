--��ɫ��Ϣ
_G.SRoleInfo = {};
function SRoleInfo:new(o)
	local obj;
	if o  ~= nil then
		obj = o;
	else
		obj = {};
		obj.dwRoleID 		= 0;			--��ɫID
	    obj.szName 			= "";			--�������
		obj.dwSex 			= 0;			--����Ա�
		obj.dwFace			= 0;			--�������
		obj.dwHair 			= 0;			--��ҷ���
		obj.dwProf			= 0;			--���ְҵ
		
		obj.dwSuitID 		= 0;			--���Ĭ����װID
		--����ĳ�ItemEnum
		obj.dwDress			= 0;			--�·�
		obj.dwHand			= 0;			--����
		obj.dwShoe			= 0;			--Ь��
		obj.dwArms			= 0;			--����
		
		obj.dwDressLevel	= 0;			--�·�ǿ���ȼ�
		obj.dwHandLevel		= 0;			--����ǿ���ȼ�
		obj.dwShoeLevel		= 0;			--Ь��ǿ���ȼ�
		obj.dwArmsLevel		= 0;			--����ǿ���ȼ�
		
		obj.dwExp			= 0;			--��ɫ����
		
		obj.setActSuitList	= {};			--�������װID
	end;
	return obj;
end;
 


-- --������ɫ��Ϣ
-- _G.SCreateInfo = {}
-- function SCreateInfo:new(o)
	-- local obj;
	-- if o ~= nil then
	   -- obj = o;
	-- else
		-- obj = {}	;
		-- obj.szName 			= "";			--�������
		-- obj.dwSex 			= 0;			--����Ա�
		-- obj.dwFace			= 0;			--�������
		-- obj.dwHair 			= 0;			--��ҷ���
		-- obj.dwProf		= 0;			--���ְҵ
		-- obj.dwSuitID 		= 0;			--���Ĭ����װID
		-- obj.dwIncoID		= 0;			--��Ӧ��ҵ�ͷ��ID
	-- end;
	-- return obj;
-- end;
-- --��ɫ�б���Ϣdfdf
-- _G.SRoleListShowInfo = {};
-- function SRoleListShowInfo:new(o)
	-- local obj;
	-- if o ~= nil then
		-- obj = o;
	-- else
		-- obj = {};	
		-- obj.dwRoleID		= 0;
		-- obj.szRoleName		= "";
		-- obj.dwSex			= 0;
		-- obj.dwFace			= 0;
		-- obj.dwHair			= 0;
		-- obj.dwProf 			= 0;
		-- obj.dwIncoID    	= 0;
		
		-- obj.dwDress			= 0;		--�·�
		-- obj.dwHand			= 0;		--����
		-- obj.dwShoe			= 0;		--Ь��
		-- obj.dwArms			= 0;		--����
		-- obj.dwHorseID 		= 0;		--����ģ��
		
		-- obj.dwDefDress			= 0;		--Ĭ���·�
		-- obj.dwDefHand			= 0;		--Ĭ�ϻ���
		-- obj.dwDefShoe			= 0;		--Ĭ��Ь��
		
		-- obj.dwExp		= 0;			--��ɫ��ǰ�ܾ���  
		-- obj.dwLevel			= 0;			--��ɫ�ȼ�
		-- obj.dwLevelMaxExp = 0;
		-- obj.dwLevelCurExp = 0;
		
		-- obj.dwMoney         = 0;	 --��Ϸ��
		-- obj.dwBindGold      = 0; --�󶨵�Ԫ��
		-- obj.dwGold			= 0; --Ԫ��
		
		-- obj.tmDownlineTime  = 0;--����ʱ��
		-- obj.tmUplineTime =    0;--����ʱ��

		-- obj.setActSuitList	= {};			--�������װID
	-- end;
	-- return obj;
-- end;

-- ------------------------------------------------------------------
-- --SkillSystem��ʹ�õĽ�ɫս���������
-- _G.SRoleSkillInfo = {}
-- function SRoleSkillInfo:new(o)
	-- local obj = {};
	-- obj.dwHP = 0;--��ɫ��ǰ����ֵ
	-- obj.dwMP = 0;--��ɫ��ǰ����ֵ
	-- obj.dwMuscle = 0;--����
	-- obj.dwPhysique = 0;--����
	-- obj.dwOrgan = 0;--����
	-- obj.dwTechnique = 0;--����
	-- obj.dwAttack = 0;--����
	-- obj.dwDefense = 0;--����
	-- obj.dwFlee = 0;--��
	-- obj.dwHitPercent = 0;--����
	-- obj.dwCrit = 0;--����
	-- obj.dwHPMax= 0;--����max
	-- obj.dwMPMax= 0;--����max
	-- obj.dwMoveSpeed= 0;--�ƶ��ٶ�
	-- obj.dwAttackSpeed= 0;--�����ٶ�
	-- obj.dwIgnoreDefense= 0;--���ӷ���
	-- obj.dwAppendAttack = 0;--׷���˺�
	-- obj.dwRemitAttack = 0;--�˺�����
	-- obj.dwBounceAttack= 0;--�˺�����
	-- obj.dwAbsorbHP= 0;--������ȡ
	-- obj.dwAbsorbMP = 0;--������ȡ
	-- obj.dwDuck = 0;--������
	-- obj.dwAppendCrit = 1.5;--�����˺����ٷֱȣ�
	-- obj.dwAllSkillUpLv = 0; --�书����
	-- obj.dwDander = 0;--ŭ��ֵ
	-- obj.dwPoint = 0;--Ǳ����
	-- obj.dwPKForbid = 0;--��ֹPK��־��0-���ԣ�1-�ȼ�������2-ɱ������
	-- obj.dwCaromCount = 0;--��������

	-- return obj;
-- end;

-- --�������Եĸı�ֵ���������ٷֱȶ������
-- _G.SSingleAttrChange = {};
-- function SSingleAttrChange:new()
	-- local obj = {};
	-- obj.dwAttack = 0;--����
	-- obj.dwDefense = 0;--����
	-- obj.dwFlee = 0;--��
	-- obj.dwCrit = 0;--����
	-- obj.dwHPMax= 0;--����max
	-- obj.dwMPMax= 0;--����max
	-- obj.dwMoveSpeed= 0;--�ƶ��ٶ�
	-- obj.dwAttackSpeed= 0;--�����ٶ�
	-- obj.dwIgnoreDefense= 0;--���ӷ���
	-- obj.dwAppendAttack = 0;--׷���˺�
	-- obj.dwRemitAttack = 0;--�˺�����
	-- obj.dwBounceAttack= 0;--�˺�����
	-- obj.dwAbsorbHP= 0;--������ȡ
	-- obj.dwAbsorbMP = 0;--������ȡ
	-- obj.dwHitPercent = 0;--����
	-- obj.dwDuck = 0;--������
	-- obj.dwAppendCrit = 0;--�����˺����ٷֱȣ�
	-- obj.dwAllSkillUpLv = 0; --�书����
	-- obj.dwPKForbid = 0;--PK����
	
	-- obj.dwSkillForbidFlag = 0;--���ܽ�ֹ��־
	-- obj.dwMoveForbidFlag = 0;--�ƶ���ֹ��־
	-- obj.dwUseItemForbidFlag = 0;--��Ʒʹ�ý�ֹ��־
	
	-- obj.dwDanderUp = 0;--ŭ������
	-- obj.dwExpUp = 0;--��������
	-- obj.dwMountExpUp = 0;--���ﾭ������
	-- obj.dwSitUp = 0;--������������
	-- obj.dwSkillKlgUp = 0;--��������������
	
	
	-- for i,v in pairs(SSingleAttrChange) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;

	-- return obj;
-- end;

-- function SSingleAttrChange:Clone()
	-- local tbClone = {};
	
	-- for i,v in pairs(self) do
		-- tbClone[i] = v;
	-- end;
	
	-- return tbClone;
-- end;

-- function SSingleAttrChange:ValueClone()
	-- local tbClone = {};
	
	-- for i,v in pairs(self) do
		-- if type(v) ~= 'function' then
			-- tbClone[i] = v;
		-- end
	-- end;
	
	-- return tbClone;
-- end;

-- function SSingleAttrChange:Copy(tbValue)
	-- for key,value in pairs(tbValue)do
		-- if self[key] then
			-- self[key] = value;
		-- end
	-- end
-- end;

-- function SSingleAttrChange:CountAttrValue(sOutInfo)
	-- for n,v in pairs(sOutInfo)do
		-- if type(v) ~= 'function' then
			-- sOutInfo[n] = v + self[n];
		-- end
	-- end
-- end;

-- function SSingleAttrChange:AddValue(objSingle)
	-- if not objSingle then
		-- return;
	-- end
	
	-- for n,v in pairs(objSingle)do
		-- if type(v) ~= 'function' then
			-- self[n] = self[n] + v;
		-- end
	-- end
-- end;

-- local arrStrAdvType = 
-- {
	-- "Equip",
	-- "Suit",
	-- "Skill",
	-- "Buff",
	-- "Pulse",
	-- "Five",
	-- "Bourn",
	-- "Mount",
	-- "Level",
	-- "GMCommand",
	-- "Achievement",
-- };
-- --���Բ��֣������Ͱٷֱȶ������
-- _G.SAttrChangeInfo = {};
-- function SAttrChangeInfo:new()
	-- local obj = {};
	
	-- for i,str in pairs(arrStrAdvType)do
		-- obj[str] = {};
	-- end
	
	-- for i,v in pairs(SAttrChangeInfo) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;
	
	-- return obj;
-- end;

-- function SAttrChangeInfo:GetInfo()
	-- local sLastInfo = SSingleAttrChange:new();
	
	-- for i,str in pairs(arrStrAdvType)do
		-- for index,attr in pairs(self[str])do
			-- attr:CountAttrValue(sLastInfo);
		-- end
	-- end
	
	-- return sLastInfo;
-- end;


-- --���нṹ����
-- _G.CFiveElemSystem = {}
-- function CFiveElemSystem:new()
	-- local obj = CSystem:new("CFiveElemSystem");
	-- obj.dwMetalLv = 0;   --���еȼ�
	-- obj.dwWoodLv = 0;
	-- obj.dwWaterLv = 0;
	-- obj.dwFireLv = 0;
	-- obj.dwEarthLv = 0;
	-- obj.dwDantianLv = 0;
	
	-- obj.dwMetalValue = 100; --��������ֵ
	-- obj.dwWoodValue = 100;
	-- obj.dwWaterValue = 100;
	-- obj.dwFireValue = 100;
	-- obj.dwEarthValue = 100;

	-- obj.dwCountTime = _now() --�ϴν���ʱ��
	
	-- obj.dwMetalTime = 10000; --������������ʱ��
	-- obj.dwWoodTime = 0;
	-- obj.dwWaterTime = 0;
	-- obj.dwFireTime = 0;
	-- obj.dwEarthTime = 0;
	-- obj.setTime = 
	-- {
		-- 'dwMetalTime',
		-- 'dwWoodTime',
		-- 'dwWaterTime',
		-- 'dwFireTime',
		-- 'dwEarthTime',
	-- }
	-- obj.dwTimeStamp = 0;
	-- obj.AttributeList = 
	-- {
		-- dwAttack 	= 0,--����
		-- dwDefense 	= 0;--����
		-- dwFlee	 	= 0;--��
		-- dwCrit		= 0;--����
		-- dwHPMax 		= 0;--��ɫ��ǰ����ֵ
		-- dwMPMax		= 0;--��ɫ��ǰ����ֵ
	-- }
	-- obj.ComboAttributeList = {};
	
	-- obj.szFillParam = '00000'
	-- ---
	-- for i,v in pairs(CFiveElemSystem) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;
	-- return obj;
-- end;

-- --����ṹ����
-- _G.CBournSystem = {}
-- function CBournSystem:new()
	-- local obj = CSystem:new("CBournSystem");
	
	-- obj.dwBournExp = 0;	--���統ǰʵս����
	-- obj.dwBournPVPExp = 0;	--���統ǰʵսPVP����
	-- obj.dwBournLv = 1;		--����ȼ�
	
	-- obj.AttributeList = 
	-- {
		-- dwHPMax				= 0,		--����
		-- dwMPMax				= 0,		--����
		-- dwAttack 			= 0,		--����
		-- dwDefense 			= 0,		--����
		-- dwMoveSpeed			= 0,		--�ƶ��ٶ�
		-- dwAttackSpeed		= 0,		--�����ٶ�
		-- dwDuck 				= 0,		--������
		-- dwAppendCrit 		= 0,		--�����˺����ٷֱȣ�
		-- dwAllSkillUpLv 		= 0, 		--�书����
	-- }
	
	-- obj.dwUpdataLine = 0;
	-- ---
	-- for i,v in pairs(CBournSystem) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;
	-- return obj;
-- end;
-- --����ϵͳ�ṹ
-- _G.CPulseSystem = {};
-- function CPulseSystem:new(dwPlayerID)
	-- local obj = CSystem:new("CPulseSystem");
	-- obj.objPlayer = dwPlayerID
	
	-- obj.dwPulse1 = 0;	--������������
	-- obj.dwPulse2 = 0;
	-- obj.dwPulse3 = 0;
	-- obj.dwPulse4 = 0;
	-- obj.dwPulse5 = 0;
	-- obj.dwPulse6 = 0;
	-- obj.dwPulse7 = 0;
	-- obj.dwPulse8 = 0;
	-- obj.dwPulseFullNum = 0; --��ͨ�ľ�������
	
	-- obj.dwTotalExp = 0;		--��ǰͨ�����˳�����õľ���
	-- obj.dwLastTimes = 0;
	-- --����ʣ���������������
	
	-- obj.PulseWaitList = {}; -- ��ŵ���״̬�ľ������
	-- obj.AttributeList = 
	-- {
		-- dwAttack = 0,
		-- dwDefense = 0,
		-- dwCrit = 0,
		-- dwFlee = 0,
		-- dwHPMax	= 0;--����max
		-- dwMPMax	= 0;--����max
	-- }
	
	-- obj.dwCountTime = _now()
	-- ---
	-- for i,v in pairs(CPulseSystem) do
		-- if type(v) == "function" then
			-- obj[i] = v;
		-- end;
	-- end;
	-- return obj;
-- end;
