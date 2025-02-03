local dwMapID = 9999;
local MapLogic = {};
local t = {}
----------------------------------------------------------------------------
function MapLogic:UpdateForPlayer(objCrossSvr,objPlayer)
	local objMapSystem = objPlayer:GetSystem("CMapSystem");
	if not objMapSystem then
		return false;
	end
	local vPos = objMapSystem:GetPlayerPos()
	for k,n in pairs(_G.MapAreaConfig) do
		if (n.dwMapID == dwMapID) then
			--得到抢刀区域
			local t = n.AreaTable[1]
			
			--检查自己是否在抢刀区域
			if ( (vPos.x - t.val1)^2 + (vPos.y - t.val2)^2 > t.val3^2 ) then
				return false;
			else 
				return true;
			end
		end
	end
	return false;
end;

--进入
function MapLogic:EventPlayerEnter(map,objPlayer)
	local objScriptSys = objPlayer:GetSystem("CScriptSystem");
	if not objScriptSys then
		return;
	end
end



--出抢刀区域
function MapLogic:EventAreaChange(map,objPlayer,dwOldArea,dwNewArea)
	--如果离开了抢刀区域
	if dwOldArea == 99 then
		local sysCrossSvr = objPlayer:GetSystem("CCrossSvrSystem");
		if sysCrossSvr then
			local crossSvrObj = sysCrossSvr:GetCrossObj();
			if crossSvrObj then
				--屠龙刀持有中断
				crossSvrObj:ItemHoldBreak(objPlayer);
			else
				_err("MapLogic:EventAreaChange 9999 cant get crossSvrObj!!")
			end		
		else
			_err("MapLogic:EventAreaChange 9999 cant get CCrossSvrSystem!!")
		end
	end
end



----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.MapLogic,dwMapID,MapLogic)
----------------------------------------------------------------------------