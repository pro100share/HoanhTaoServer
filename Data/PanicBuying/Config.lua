--�̳�����������
-- [1] = 
	-- {
		-- {
            -- ������������	6300450
			-- dwID = 1,							--���ID������Ʒ�ı�ţ��������ظ�
			-- dwEnumID = 5500040,					--������������
			-- dwNumber = 100,						--��������
            -- dwPriceType = 1,					    --�۸����ͣ�������òο��̳�
			-- dwPrice = 150,						--�۸�
			-- dwBindType = 1,						--�����ͣ���������òο��̳�1�� 0����
            -- dwLength = 1,                        --ʱ��
            -- dwBeginDay = 20130725                --��ʼʱ��(Ĭ��Ϊ����0��)
		-- };
	-- }
--�޹���ˢ��ʱ���
_G.MallLimitTime = 
{
	--ˢ��ʱ���
	[1] = 
	{
		-- ["2013-09-28"] = {10};	--����
		-- ["2013-09-12"] = {10};	--����
		-- ["2013-09-13"] = {11};	--����
		-- ["2013-09-14"] = {11};	--����
		-- ["2013-09-15"] = {11};	--����
		-- ["2013-09-16"] = {11};	--����
		-- ["2013-12-01"] = {10, 12};	--����
	};
	[2] = 
	{
		-- ["2013-09-28"] = {10};	--����
		-- ["2013-09-12"] = {10};	--����
		-- ["2013-09-13"] = {11};	--����
		-- ["2013-09-14"] = {11};	--����
		-- ["2013-09-15"] = {11};	--����
		-- ["2013-09-16"] = {11};	--����
		-- ["2013-12-01"] = {10, 12};	--����
	};
}
--�޹�����Ʒ�б�
_G.MallLimitItem = 
{
	[10] = 
	{
		{
			dwID = 1;							
			dwEnumID = 6300450,	--������������*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 39,						
			dwBindType = 1,
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�
		};
		{
			dwID = 2;							
			dwEnumID = 5809265,	--���������������*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 38,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�
		};
		{
			dwID = 3;							
			dwEnumID = 6300461,	--�Ż���¶��������*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 38,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�	
		};
		{
			dwID = 4;							
			dwEnumID = 6300464, -- ����������*1
			dwNumber = 1,						
			dwPriceType = 1,					
			dwPrice = 1,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�	
		};
	};
	
	[11] = 
	{
		{
			dwID = 1;							
			dwEnumID = 6300453,	--����ʯ������*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 58,						
			dwBindType = 1,
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�
		};
		{
			dwID = 2;							
			dwEnumID = 6300458,	--����ʯ������*1
			dwNumber = 1,						
			dwPriceType = 1,					
			dwPrice = 88,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�
		};
		{
			dwID = 3;							
			dwEnumID = 6300461,	--�Ż���¶��������*5
			dwNumber = 5,						
			dwPriceType = 1,					
			dwPrice = 28,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�	
		};
		{
			dwID = 4;							
			dwEnumID = 6300464, -- ����������*1
			dwNumber = 1,						
			dwPriceType = 1,					
			dwPrice = 1,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�	
		};
	};
	[12] = 
	{
		{
			dwID = 1;							
			dwEnumID = 6300453,	--����ʯ������*5
			dwPriceType = 1,					
			dwPrice = 58,						
			dwBindType = 1,
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�
            dwLength = -1
		};
		{
			dwID = 2;							
			dwEnumID = 6300458,	--����ʯ������*1
			dwPriceType = 1,					
			dwPrice = 88,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�
            dwLength = -1
		};
		{
			dwID = 3;							
			dwEnumID = 6300461,	--�Ż���¶��������*5
			dwPriceType = 1,					
			dwPrice = 28,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�	
            dwLength = -1
		};
		{
			dwID = 4;							
			dwEnumID = 6300464, -- ����������*1
			dwPriceType = 1,					
			dwPrice = 1,						
			dwBindType = 1,						
			dwHotFlag = 1,--����
			dwDiscount = 1,--�ۿ�	
            dwLength = -1
		};
	};
};
