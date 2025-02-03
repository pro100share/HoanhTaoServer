----------------------------
--[[
花灯公共脚本
--]]
-----------------------------
local npc_fun = {}
local Question = LanternQuestion

local NpcState = {}
local PlayerState = {}
-----------------------------
--真假花灯概率计算
local GetType=function()
	return math.random(1,10000) > LanternConfig.dwFade
end
--真花灯题目随机
local GetIndex = function()
	return math.random(1,#Question)
end
-----------------------------
local Init = function() end;
local Modi = function() end;
local Reset = function() end;
-----------------------------

--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript,dwID)
	local dwNow = GetCurTime(1)
	local Info = NpcState[dwID]
	if (not Info) or (dwNow-Info.dwTime>20) then
		NpcState[dwID] = NpcState[dwID] or {}
		if not NpcState[dwID].bInit then
			Init(dwID)
		end
		Modi(talk_page,dwID)
		return;
	end
	
	local szStr = string.format(LanternConfig.Talk[2],Info.szName,20-(dwNow-Info.dwTime))

	local Link1 = {tp=tk.text,text=szStr,}
	sysScript:NpcModiTalkLink(talk_page,1,1,Link1)

end
-------------------------------------------------------------------------------
Init = function(dwID)
	local Info = NpcState[dwID]
	
	Info.bInit = true;
	Info.dwTime = 0;
	Info.szName = "";
	Info.dwType = GetType();
	
	if Info.dwType then
		Info.dwIndex = GetIndex()
	end
	
end

Modi = function(talk_page,dwID)
	local Info = NpcState[dwID] -- 花灯信息
	local Talk = LanternConfig.Talk --对话配置
	local dwType = Info.dwType --花灯类型
	local dwIndex = Info.dwIndex -- 问题索引
	--page1 开头
	local page1 = {
		[1]={tp=tk.text,text=Talk[1]};
		[2]={tp=tk.lantern_open,use=1,fade=dwType,id=dwID}; 
		[3]={tp=tk.lantern_open,use=2,fade=dwType,id=dwID}; 
		[4]={tp=tk.lantern_open,use=3,fade=dwType,id=dwID}; 
		[5]={tp=tk.lantern_open,use=4,fade=dwType,id=dwID}; 
		[6]={tp=tk.close,text=1,};
	}
	talk_page[1] = page1
	--page2 题目
	if dwType then
		local Quest = Question[dwIndex] or Question[1]
		local page2 = {
			[1] = {tp=tk.text,text=Quest[1]};
			[2] = {tp=tk.lantern_ans,right=1,pos=math.random(1,100),id=dwID,text=Quest[2]};
			[3] = {tp=tk.lantern_ans,right=0,pos=math.random(1,100),id=dwID,text=Quest[3]};
			[4] = {tp=tk.lantern_ans,right=0,pos=math.random(1,100),id=dwID,text=Quest[4]};
			[5] = {tp=tk.lantern_ans,right=0,pos=math.random(1,100),id=dwID,text=Quest[5]};
		}
		talk_page[2] = page2
	end
end

Reset = function(dwID,szName)
	local Info = NpcState[dwID]
	
	Info.dwTime = GetCurTime(1)
	Info.szName = szName
	Info.bInit = false;
	Info.dwIndex = nil;
	
end
-------------------------------------------------------------------------------
--开花灯
function LanternConfig:Open(dwID,dwRoleID,dwType,objPlayer,sysLantern)
	local dwNpcID = dwID
	local dwType = dwType
	local dwItem = LanternConfig.Item[dwType]
	
	local Info = NpcState[dwNpcID]
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	if dwItem then
		if not sysScript:DelItem(dwItem,1) then
			sysScript:Notice("物品数量不足!")
			return;
		end
	end
	PlayerState[dwRoleID] = dwType
	if not Info.dwType then
		self:Fade(dwID,dwRoleID,dwType,objPlayer,sysLantern)
	end
	
end

--答对
function LanternConfig:Right(dwID,dwRoleID,objPlayer,sysLantern)
	local dwType = PlayerState[dwRoleID]
	if dwType==1 then
		sysLantern:AddScoreEx()
	else
		sysLantern:AddScore()
	end
	
	PlayerState[dwRoleID] = nil
	Reset(dwID,objPlayer:GetName())
end
--答错
function LanternConfig:Wrong(dwID,dwRoleID,objPlayer,sysLantern)
	PlayerState[dwRoleID] = nil
	sysLantern:AddNoScore()
end

--假花灯
function LanternConfig:Fade(dwID,dwRoleID,dwType,objPlayer,sysLantern)
	if dwType==2 then
		sysLantern:FullScore()
	elseif dwType==3 then
		sysLantern:HalfScore()
	else
		sysLantern:ClearScore()
	end
	PlayerState[dwRoleID] = nil
	Reset(dwID,objPlayer:GetName())
end

function LanternConfig:GetNpcScript()
	return npc_fun;
end







