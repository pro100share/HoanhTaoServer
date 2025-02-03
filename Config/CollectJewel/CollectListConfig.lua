--[[
	--聚灵
	--作者：张云华
	--时间：2013-11-23
]]

--聚灵系统显示子项（button list）
--显示用
_G.UIEffectiveList = {
	--聚灵珠
	[1] = {icon = "gf_xuemogong.png",Panel = "CCollectJewelLevelUI",};
	[2] = {icon = "gf_xuemogong.png",Panel = "CCollectJewelUI",};
};

--打开聚灵类型权限Config
--"YiJinJing":权限，62：开放等级
--key值：[1]需与上面键值对应
_G.EffectivePanelAuthority = {
	[1] = {"JuLingZhuDengJi",60}, -->聚灵珠聚灵系统
	[2] = {"JuLingZhuJuLing",60} -->聚灵珠等级系统
}

--------------------查看界面相关--------------------
--查看功法子项
-->icon:按钮图标，Panel:嵌入页面UI，权限索引（ArrPanelAuthority中的索引）
_G.UILookEffectiveList = {
	--[1] = {icon = "gf_xuemogong.png",Panel = "UIMegaKillLook",authIndex = 1,}; --聚灵珠
}