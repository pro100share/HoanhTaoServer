--合成的消息

define.OnProduceRequestMsg
{
	user = NONE;
	ProID = 0;
}
when {user = NONE}
OnProduceRequestMsg = checkUser;
when{}
function OnProduceRequestMsg(user,ProID)
	local objProSys = user:GetSystem("CProduceSystem");
	if objProSys then
		objProSys:TryProduce(ProID);
	end
end;