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
		--[[
		obj.szLoverText		= ""			--������Ϣ
		obj.tbTitle			= {}			--�ƺ���Ϣ
		obj.szTalk			= ""			--˵����Ϣ
		--]]
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
 


--������ɫ��Ϣ
_G.SCreateInfo = {}
function SCreateInfo:new(o)
	local obj;
	if o ~= nil then
	   obj = o;
	else
		obj = {}	;
		obj.szName 			= "";			--�������
		obj.dwSex 			= 0;			--����Ա�
		obj.dwFace			= 0;			--�������
		obj.dwHair 			= 0;			--��ҷ���
		obj.dwProf		    = 0;			--���ְҵ
		obj.dwSuitID 		= 0;			--���Ĭ����װID
		obj.dwIncoID		= 0;			--��Ӧ��ҵ�ͷ��ID
	end;
	return obj;
end;
--��ɫ�б���Ϣdfdf
_G.SRoleListShowInfo = {};
function SRoleListShowInfo:new(o)
	local obj;
	if o ~= nil then
		obj = o;
	else
		obj = {};	
		obj.dwRoleID		= 0;
		obj.szRoleName		= "";
		obj.dwSex			= 0;
		obj.dwFace			= 0;
		obj.dwHair			= 0;
		obj.dwProf 			= 0;
		obj.dwIncoID    	= 0;
		
		obj.dwDress			= 0;		--�·�
		obj.dwHand			= 0;		--����
		obj.dwShoe			= 0;		--Ь��
		obj.dwArms			= 0;		--����
		obj.dwHorseID 		= 0;		--����ģ��
		
		obj.dwDefDress			= 0;		--Ĭ���·�
		obj.dwDefHand			= 0;		--Ĭ�ϻ���
		obj.dwDefShoe			= 0;		--Ĭ��Ь��
		obj.dwDefIncoID         = 0;        --Ĭ��ͷ��
		
		obj.dwExp		= 0;			--��ɫ��ǰ�ܾ���  
		obj.dwLevel			= 0;			--��ɫ�ȼ�
		obj.dwLevelMaxExp = 0;
		obj.dwLevelCurExp = 0;
		
		obj.dwMoney         = 0;	 --��Ϸ��
		obj.dwBindGold      = 0; --�󶨵�Ԫ��
		obj.dwGold			= 0; --Ԫ��
		
		obj.tmDownlineTime  = 0;--����ʱ��
		obj.tmUplineTime =    0;--����ʱ��

		obj.setActSuitList	= {};			--�������װID
	end;
	return obj;
end;
