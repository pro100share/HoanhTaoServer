--初始化隐藏成就列表
define.UpdateBuyEscortIDMsg
{
	LineID = 0,
}
when{}
function UpdateBuyEscortIDMsg(LineID)
	CPlayerDBQuery:GetDBQuery():execute('update "T_Escort_Info" set "dwBuyEscortID" = $1', 0);
end;