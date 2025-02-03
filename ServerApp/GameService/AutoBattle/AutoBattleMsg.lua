--[[
	曲莹
	2012-08-03
	自动挂机系统
]]
--请求回到指定位置
define.GoBackSpecPosMsg
{
	user = NONE,
}
when{ user = NONE }
GoBackSpecPosMsg = checkUser
when{ }
function GoBackSpecPosMsg(user)
	local autoBattleSystem = user:GetSystem("CAutoBattleSystem");
	if not autoBattleSystem then
		return;
	end;
	autoBattleSystem:ReqChangeBack();
end; 

--发送自动挂机信息
define.SendAutoBattleInfoMsg
{
	user = NONE,
	Info = {};
}
when{ user = NONE }
SendAutoBattleInfoMsg = checkUser
when{ }
function SendAutoBattleInfoMsg(user, Info)
	local autoBattleSystem = user:GetSystem("CAutoBattleSystem");
	if not autoBattleSystem then
		return;
	end;
	local tbl = {};
	tbl.dwSkill6 = Info[1];
	tbl.dwHpRate = Info[2];
	tbl.dwHpOrder = Info[3];
	tbl.dwMpRate = Info[4];
	tbl.dwMpOrder = Info[5];
	tbl.bUseDoubleExp = Info[6];
	tbl.bPickEquip = Info[7];
	tbl.bPickMedicine = Info[8];
	tbl.bPickGold = Info[9];
	tbl.bPickMaterial = Info[10];
	tbl.dwProfType = Info[11];
	tbl.dwEquipLevel = Info[12];
	tbl.dwEquipQuality = Info[13];
	tbl.dwRange = Info[14];
	tbl.dwGoBackTime = Info[15];
	tbl.bMonsterChoose = Info[16];
	tbl.bAutoAlive = Info[17];
	tbl.dwSkill1 = Info[18];
	tbl.dwSkill2 = Info[19];
	tbl.dwSkill3 = Info[20];
	tbl.dwSkill4 = Info[21];
	tbl.dwSkill5 = Info[22];
	tbl.bautoMatic = Info[23];
	autoBattleSystem:SaveSetting(tbl);
end; 

--请求回到指定位置
define.RecoverSettingMsg
{
	user = NONE,
}
when{ user = NONE }
RecoverSettingMsg = checkUser
when{ }
function RecoverSettingMsg(user)
	local autoBattleSystem = user:GetSystem("CAutoBattleSystem");
	if not autoBattleSystem then
		return;
	end;
	autoBattleSystem:RecoverSettingMsg();
end; 




