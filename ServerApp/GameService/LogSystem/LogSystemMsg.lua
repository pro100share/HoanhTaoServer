define.KSBackStageMsg
{ 
	user = NONE;
	Param = {};
} 
when{}
function KSBackStageMsg(user,Param)
	--print("KSOnSendBackMailIDMsg=========" );
	-- for k,v in pairs (Param) do
		-- print(k,v)
	-- end
	CLogSystemManager:GetData( Param );
end