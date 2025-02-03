
--�ͻ��������ʼ������
define.SoulInitRequestMsg
{
	user = NONE;
}
when{user = NONE}
SoulInitRequestMsg = checkUser
when{}
function SoulInitRequestMsg(user)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:SendSoulInitInfo();
	end
end;


--����ս��
define.SoulHuntMsg
{
	user = NONE;
}
when{user = NONE}
SoulHuntMsg = checkUser
when{}
function SoulHuntMsg(user)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:HuntSoul();
	end
end;

--ֱ���޸���������
define.SoulHuntIndexChangeMsg
{
	user = NONE;
	ChangeToIndex = 0;
}
when{user = NONE}
SoulHuntIndexChangeMsg = checkUser
when{}
function SoulHuntIndexChangeMsg(user,ChangeToIndex)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:ChangeHuntIndex(ChangeToIndex);
	end
end;

--Ⱥ���ƶ�
define.SoulListMoveMsg
{
	user = NONE;
	SoulID = 0;
	MoveToHolder = 0;
	MoveToPos = 0;
}
when{user = NONE}
SoulListMoveMsg = checkUser
when{}
function SoulListMoveMsg(user,SoulID,MoveToHolder,MoveToPos)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:MoveSoul(SoulID,MoveToHolder,MoveToPos);
	end
end;

--һ��ʰȡ
define.SoulPickAllMsg
{
	user = NONE;
}
when{user = NONE}
SoulPickAllMsg = checkUser
when{}
function SoulPickAllMsg(user)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:PickAllSoul();
	end
end;


--����ս��
define.SoulSellMsg
{
	user = NONE;
	SoulID = 0;
}
when{user = NONE}
SoulSellMsg = checkUser
when{}
function SoulSellMsg(user,SoulID)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:SellSoul(SoulID);
	end
end;

--��ս��
define.SoulEatMsg
{
	user = NONE;
	SoulIDA = 0;
	SoulIDB = 0;
}
when{user = NONE}
SoulEatMsg = checkUser
when{}
function SoulEatMsg(user,SoulIDA,SoulIDB)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:EatSoul(SoulIDA,SoulIDB);
	end
end;

--һ����ս��
define.SoulEatAllMsg
{
	user = NONE;
	HolderType = 0;
}
when{user = NONE}
SoulEatAllMsg = checkUser
when{}
function SoulEatAllMsg(user,HolderType)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:EatAllSoul(HolderType);
	end
end;

--�ֽ�ս��
define.SoulBreakDownMsg
{
	user = NONE;
	SoulIDList = {};
}
when{user = NONE}
SoulBreakDownMsg = checkUser
when{}
function SoulBreakDownMsg(user,SoulIDList)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:BreakSoul(SoulIDList);
	end
end;

--����ս��
define.SoulBuyMsg
{
	user = NONE;
	BuyIndex = 0;
}
when{user = NONE}
SoulBuyMsg = checkUser
when{}
function SoulBuyMsg(user,BuyIndex)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:BuySoul(BuyIndex);
	end
end;

--��չ����
define.SoulPacketExtendMsg
{
	user = NONE;
	AddNumber = 0;
}
when{user = NONE}
SoulPacketExtendMsg = checkUser
when{}
function SoulPacketExtendMsg(user,AddNumber)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:ExtendPacket(AddNumber);
	end
end;

--�鿴��ɫս����Ϣ
define.SoulLookRoleListMsg
{
	user = NONE;
	RoleID = 0;
}
when{user = NONE}
SoulLookRoleListMsg = checkUser
when{}
function SoulLookRoleListMsg(user,RoleID)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:GetRoleSoulList(RoleID);
	end
end;

--�Զ�����
define.SoulAutoSortMsg
{
	user = NONE;
	IsPickAll = 0;
	HolderType = 0;
}
when{user = NONE}
SoulAutoSortMsg = checkUser
when{}
function SoulAutoSortMsg(user,IsPickAll,HolderType)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:SoulAutoSort(IsPickAll,HolderType);
	end
end;

--������װ������
define.SoulSuitActiveMsg
{
	user = NONE;
	RankID = 0;
	SuitIDList = {};
}
when{user = NONE}
SoulSuitActiveMsg = checkUser
when{}
function SoulSuitActiveMsg(user,RankID,SuitIDList)
	local objSoulSystem = user:GetSystem("CSoulSystem");
	if objSoulSystem then
		objSoulSystem:ActiveSuitAttr(RankID,SuitIDList);
	end
end;
