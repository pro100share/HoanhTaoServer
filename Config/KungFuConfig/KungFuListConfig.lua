--[[
	--功法列表Config
	--作者：张云华
	--时间：2013-10-14
]]

--功法系统显示子项（button list）
--显示用
_G.UIKungFuList = {
	--血魔功
	[1] = {icon = "gf_xuemogong.png",Panel = "CUIMegaKill",};
	--易筋经
	[2] = {icon = "yijinjing.png",Panel = "UIYiJinJing",};
	--阵法
	[3] = {icon = "beidouqixing.png",Panel = "UIMatrixMethod",};
	--铁布衫
	[4] = {icon = "gf_tiebushan.png",Panel = "UILronCloth",};
	--童姥功
	[5] = {icon = "gf_tonglaogong.png",Panel = "UIPractiseSkill",};
	--独孤九剑
	[6] = {icon = "gf_dugujiujian.png",Panel = "CUIDuGuJiuJian",};
}

--打开功法类型权限Config
--"YiJinJing":权限，62：开放等级
--key值：[1]需与上面键值对应
_G.ArrPanelAuthority = {
	[1] = {"XueMoGong",50}, -->血魔功
	[2] = {"YiJinJing",62}, -->易筋经
	[3] = {"MatrixMethod",65}, -->阵法
	[4] = {"LronCloth",70}, -->铁布衫
	[5] = {"PractiseSkill",75}, -->童姥功
	[6] = {"DuGuJiuJian", 77}, -->独孤九剑
}

--------------------查看界面相关--------------------
--查看功法子项
-->icon:按钮图标，Panel:嵌入页面UI，权限索引（ArrPanelAuthority中的索引）
_G.UILookKungFuList = {
	[1] = {icon = "gf_xuemogong.png",Panel = "UIMegaKillLook",authIndex = 1,}; --血魔功
	[2] = {icon = "yijinjing.png",Panel = "UIYiJinJingLook",authIndex = 2,}; --易筋经
	[3] = {icon = "beidouqixing.png",Panel = "UIMatrixMethodLook",authIndex = 3,};--阵法
	[4] = {icon = "gf_tiebushan.png",Panel = "UILronClothLook",authIndex = 4,};--铁布衫
	[5] = {icon = "gf_tonglaogong.png",Panel = "UIPractiseSkillLook",authIndex = 5,};--童姥功
	[6] = {icon = "gf_dugujiujian.png",Panel = "UIChaDuGuJiuJian",authIndex = 6,};--独孤九剑
}