--保存函数表
local npc_fun = {}
--npcid
local npc_id = 80001002
----------------------------------------------
local biao = {
{x = 6,y = -15};
{x = 38,y = 18};
{x = 17,y = 38};
{x = -46,y = 34};
{x = -64,y = 13};
{x = -64,y = -42};
{x = -41,y = -65};
{x = 17,y = -65};
{x = 38,y = -42};
};

-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.ChuanSong(objNpc,objPlayer,sysNpc,tbParam,sysScript)

	local dwTeamID = 0;
	local objTeamSys = objPlayer:GetSystem("CTeamSystem");
	if objTeamSys then
		dwTeamID = objTeamSys:GetTeamId()
	end

	local dwRand = math.random(#biao);
	
	if (dwTeamID) then
		local sysMap = objPlayer:GetSystem("CMapSystem")
		sysMap:ExecTransforMapXY(8030,biao[dwRand].x,biao[dwRand].y,0)
	else
		local sysScript = objPlayer:GetSystem("CScriptSystem")
		sysScript:Notice(13009000019);	
	end
	
	-- if (dwTeamID ~= nil) then
		-- local sysMap = objPlayer:GetSystem("CMapSystem")
		-- sysMap:ExecTransforMapXY(8030,-17.53,-20.17,0)
	-- end

end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
