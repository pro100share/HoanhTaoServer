--NPC对话配置


--对话类型
_G.tk =
{
	text 			= 1;--文本信息
	accept_check 	= 2;--任务是否可接判断
	complete_check 	= 3;--任务是否可完成判断
	find_npc 		= 4;--对话任务检测
	page 			= 5;--页面跳转
	close 			= 6;--页面关闭
	accept_task 	= 7;--接受任务
	complete_task 	= 8;--完成任务
	talk_over	  	= 9;--对话任务对话结束
	storage		  	= 10;--仓库.
	shop            = 12;--商店
	strong			= 13;--强化界面
	append_prop		= 14;--附加属性炼制界面
	--equip_lvup		= 15;--装备升级
	equip_stone		= 16;--宝石工艺
	amulet			= 17;--宝甲
	dupl			= 18;--副本
	fun				= 19;--函数(fun="",param={})
	daily			= 20;--日环入口
	weekly			= 21;--周环入口
	accept_daily	= 22;--接受当前日环
	complete_daily	= 23;--完成当前日环
	accept_weekly	= 24;--接受当前周环
	complete_weekly	= 25;--完成当前周环
	enter_dupl		= 26;--进入副本
	war_over		= 27;--进入世家战
	enter_war		= 28;--进入恶人谷
	task_fun		= 29;--任务配置函数
	web_link		= 30;--打开网页
	play_sound		= 31;--播放声音(背景音乐)
	escort			= 32;--个人押镖
	
	lantern_open	= 33;--元宵灯会 开启方式 
	lantern_ans		= 34;--元宵灯会 回答
	
}
---------------------------------------
--[[
完整示例：
-----------------------------------------------------
---文件名为 "npc_" + npc_id + ".lua"
local npc_id = 0000
local talk = {
	[1] = {
		[1]={tp=tk.text,text=100211,},
		[2]={tp=tk.storage,text=2,},
		[3]={tp=tk.trade,text=3,},
		[4]={tp=tk.accept_check,id={1003,1017},},
		[5]={tp=tk.complete_check,id={1002,1016},},
		[6]={tp=tk.find_npc,id={1001,1002},},
		[7]={tp=tk.close,text=1,},
		[8]={tp=tk.shop,id=2000,text=5,},
		[9]={tp=tk.strong,text=123,},
		[10]={tp=tk.reset_prop,text=123,},
		[11]={tp=tk.war_over,id=123,text=100211,},
	},
	[2] = {
		[1]={tp=tk.text,text=1234,},
		[2]={tp=tk.accept_task,id=1001,text=1234,},
		[3]={tp=tk.complete_task,id=1002,text=1234,},
		[4]={tp=tk.talk_over,id=1003,text=1234,},
		[5]={tp=tk.page,id=3,text=1234,},
		[6]={tp=tk.close,text=1,},
	},
	[3] = {
		[1]={tp=tk.text,text=1234,},
		[2]={tp=tk.close,text=1,},
	},
}
table.insert(gbl_npc_talk,npc_id,talk)
--]]
---------------------------------------------------------
----界面点击事件类型
_G.NpcTalkEventType=
{
	Invalid				= 0;
	--接受任务
	AcceptTask			= 1;
	--完成
	CompleteTask		= 2;
	--放弃
	DeleteTask			= 3;
	--页面选择
	ChangePage			= 4;
	--ui界面关闭
	Close				= 5;
	--仓库
	Storage				= 6;
	--商店
	Shop				= 7;
	--装备炼制
	EquipStrong			= 8;
	--附加属性炼制
	EquipPropStrong		= 9;
	--宝石合成与镶嵌
	Stone				= 10;
	--护身宝甲
	Amulet				= 11;
	--进入副本
	Dupl				= 12;
	--执行npc脚本函数
	Fun					= 13;
	--日环
	Daily				= 14;
	--周环
	Weekly				= 15;
	--进入副本
	EnterDupl			= 16;
	--对话完成
	TalkOver			= 17;
	--进入世家战
	WarOver				= 18;
	--进入恶人谷
	EnterWar			= 19;
	--任务配置函数
	TaskFun				= 20;
	--打开网页
	WebLink				= 21;
	--播放声音(背景音乐)
	PlaySound			= 22;
	--个人押镖
	Escort				= 23;
	--元宵灯会 开启方式 
	LanternOpen		= 24;
	--元宵灯会 回答
	LanternAns			= 25;
	
}

--[[
--仓库界面按钮.
	task_ui_type_storage				= 6,
	--寻人对话结束
	task_ui_type_talk_over				= 7,
	--交易界面
	task_ui_type_trade					= 8,
	--商店界面
	task_ui_type_shop					= 9,
	--强化界面
	task_ui_type_strong					= 10,
	--重置附加属性界面
	task_ui_type_reset_prop				= 11,
	--装备升阶
	task_ui_type_equip_lvup				= 12,
	--宝石工艺
	task_ui_type_equip_stone			= 13,
	--宝甲
	task_ui_type_amulet					= 14,
--]]

--Npc对话显示优先级
_G.NpcTalkPriority = 
{
	--默认
	Invalid = 0;
	--可完成任务对话
	CompleteTask = 1;
	--可接收任务对话
	AcceptTask = 2;
	--不可完成任务对话
	UnComplete = 3;	
	--功能性对话
	Func = 4;
	--转换页面对话
	ChangePage = 5;
	--未指定优先级
	UnDefine = 98;
	--关闭页面对话
	Close = 99;
}

