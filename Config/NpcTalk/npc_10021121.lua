﻿--单个npc对话:npc_10021121.lua
local npc_id=10021121
local talk=
{
	[1] = {
		[2]={tp=tk.close,text=1,}
	};--开始对白（别改）
	
	[2] = {
		[1]={tp=tk.text,text="问题",}, 
		[2]={tp=tk.close,text=1,},
	};--题目(别改)
	
	[21] = --芝麻汤圆 数量不足
	{
		[1]={tp=tk.text,text="您的背包中并无芝麻汤圆，无法食用，灯会小贩——晓薇正在售卖，您可前去购买。",}, 
		[3]={tp=tk.close,text=1,},
	};
	[22] = --枣泥汤圆 数量不足
	{
		[1]={tp=tk.text,text="您的背包中并无枣泥汤圆，无法食用，灯会小贩——晓薇正在售卖，您可前去购买。",}, 
		[3]={tp=tk.close,text=1,},
	};
	[23] = --酒酿丸子 数量不足
	{
		[1]={tp=tk.text,text="您的背包中并无酒酿丸子，无法食用，灯会小贩——晓薇正在售卖，您可前去购买。",}, 
		[3]={tp=tk.close,text=1,},
	};
	
	
	[31] = --假花灯 积分全扣
	{
		[1]={tp=tk.text,text="这盏花灯是假的，因芝麻汤圆无法进行积分保护，当前积分清零！【温馨提示：食用酒酿丸子，采到假花灯时当前积分减半；食用枣泥汤圆，采到假花灯时当前积分不变！】",}, 
		[3]={tp=tk.close,text=1,},
	};
	[32] = --假花灯 积分不变
	{
		[1]={tp=tk.text,text="这盏花灯是假的，幸好您食用了枣泥汤圆进行积分保护，当前积分不变！【温馨提示：食用酒酿丸子，采到假花灯时当前积分减半；食用芝麻汤圆，采到真花灯时当前积分翻倍！】",}, 
		[3]={tp=tk.close,text=1,},
	};
	[33] = --假花灯 积分扣除一半
	{
		[1]={tp=tk.text,text="这盏花灯是假的，幸好您食用了酒酿丸子进行积分保护，当前积分减半！【温馨提示：食用枣泥汤圆，采到假花灯时当前积分不变；食用芝麻汤圆，采到真花灯时当前积分翻倍！】",}, 
		[3]={tp=tk.close,text=1,},
	};
	[34] = --假花灯 积分全扣
	{
		[1]={tp=tk.text,text="这盏花灯是假的，因您未食用元宵进行积分保护，当前积分清零！【温馨提示：食用酒酿丸子，采到假花灯时当前积分减半；食用枣泥汤圆，采到假花灯时当前积分不变；食用芝麻汤圆，采到真花灯时当前积分翻倍！】",}, 
		[3]={tp=tk.close,text=1,},
	};
}
--------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 