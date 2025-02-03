--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10021006
----------------------------------------------
-----------------采集npc
--npc开启检查
function npc_fun.cb_npc_on_opera_check(objNpc,objPlayer,sysNpc,sysScript)
end
--npc被开启时执行
function npc_fun.cb_npc_on_opera(objNpc,objPlayer,sysNpc,sysScript)
end
--设置npc携带任务
function npc_fun.npc_get_task()
end
--设置读条时间
function npc_fun.npc_get_time()
end
-----------------------------------------------
local tt = {
	1,2,3,4,6,7,8,10,11,12,13;
}

------------------其他npc
--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)

	--if not sysScript:CheckTaskState(20701,TaskStateConfig.Done) then return end;
	
	local link1 = NpcStringConfigInfo[1177443301]
	
	local link2 = NpcStringConfigInfo[1177443302]
	local link3 = NpcStringConfigInfo[1177443302]
	local link4 = NpcStringConfigInfo[1177443302]
	
	local dwType1 = tt[math.random(1,#tt)]
	local dwRange1 = math.random(1,5)
	local Info1 = sysScript:GetChartInfo(dwType1,dwRange1)
	local szName1 = Info1[dwRange1]
	
	local dwType2 = tt[math.random(1,#tt)]
	local dwRange2 = math.random(6,10)
	local Info2 = sysScript:GetChartInfo(dwType2,dwRange2)
	local szName2 = Info2[1]
	if szName2 == szName1 then
		szName2 = Info2[2]
	end
	
	local dwType3 = tt[math.random(1,#tt)]
	local dwRange3 = math.random(11,20)
	local Info3 = sysScript:GetChartInfo(dwType3,dwRange3)
	local szName3 = Info3[1]
	if szName2 == szName1 then
		szName3 = Info3[2]
	end
	
	link1 = {tp=tk.text,text=string.format(link1,PaiHangBang[dwType1],dwRange1),pos=1};
	link2 = {tp=tk.page,id=4,text=string.format(link2,szName1 or ""..PaiHangBang[dwType1]..dwRange1),pos=math.random(2,10)};
	link3 = {tp=tk.page,id=3,text=string.format(link3,szName2 or ""..PaiHangBang[dwType2]..dwRange2),pos=math.random(2,10)}
	link4 = {tp=tk.page,id=3,text=string.format(link4,szName3 or ""..PaiHangBang[dwType3]..dwRange3),pos=math.random(2,10)}
	
	local page = {link1,link2,link3,link4}
	table.sort(page,function(r1,r2) return r1.pos<r2.pos end)
	
	talk_page[2] = page
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------