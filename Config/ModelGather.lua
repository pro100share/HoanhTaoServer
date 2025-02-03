
-- 头部1 HeadPoint
-- 头部2 Bip01 HeadNub
-- 头部3 awt
-- 肩膀1 lwb
-- 肩膀2 rwb
-- 背部   BeatPoint
-- 腿部1 lww
-- 腿部2 rww
-- 胯部   awc
-- 手部1 LeftForearmPoint
-- 手部2 RightForearmPoint
-- 武器   rwh
-- 脚部1 RightFootPoint
-- 脚部2 LeftFootPoint
-- 中心   FeetPoint
_G.Model_Deploy = {
	---葫芦p
    --modelID 不加第一个数值 模型ID   --MainBinding 人物绑定点（你想帮到人那里） --Binding 模型自己的绑点   -- ModelName 模型名字 [1] 对应的职业  -- pfxID特效ID --pfxBinding 特效相对添加模型绑点pfxBinding
	--五阶
	[11] = {
		[1] = {modelID =109005,MainBinding = "rww",Binding ="rww_liandao",ModelName = "Gourd",pfxID =7000105,pfxBinding = "", }; --镰
		[2] = {modelID =209005,MainBinding = "lww",Binding ="lww_dao",ModelName = "Gourd",pfxID =7000106,pfxBinding = "", }; --刀
		[3] = {modelID =309005,MainBinding = "lww",Binding ="lww_jian",ModelName = "Gourd",pfxID =7000107,pfxBinding = "", }; --剑
		[4] = {modelID =409005,MainBinding = "rww",Binding ="rww_qiang",ModelName = "Gourd",pfxID =7000108,pfxBinding = "",}; --枪
	},
	--屠龙刀
	[101] = {
		[1] = {modelID =509001,MainBinding = "lwb",Binding ="lwb01liandao",ModelName = "TuLongDao",pfxID =100070,pfxBinding = "gua01", }; --镰
		[2] = {modelID =509001,MainBinding = "lwb",Binding ="lwb01dao",ModelName = "TuLongDao",pfxID =100070,pfxBinding = "gua01", }; --刀
		[3] = {modelID =509001,MainBinding = "lwb",Binding ="lwb01jian",ModelName = "TuLongDao",pfxID =100070,pfxBinding = "gua01", }; --剑
		[4] = {modelID =509001,MainBinding = "lwb",Binding ="lwb01qiang",ModelName = "TuLongDao",pfxID =100070,pfxBinding = "gua01",}; --枪
	},
	--六阶
	[12] = {
		[1] = {modelID =109006,MainBinding = "rww",Binding ="rww_liandao",ModelName = "Gourd",pfxID =7000105,pfxBinding = "", }; --镰
		[2] = {modelID =209006,MainBinding = "lww",Binding ="lww_dao",ModelName = "Gourd",pfxID =7000106,pfxBinding = "", }; --刀
		[3] = {modelID =309006,MainBinding = "lww",Binding ="lww_jian",ModelName = "Gourd",pfxID =7000107,pfxBinding = "", }; --剑
		[4] = {modelID =409006,MainBinding = "rww",Binding ="rww_qiang",ModelName = "Gourd",pfxID =7000108,pfxBinding = "",}; --枪
	},
	--七阶
	[13] = {
		[1] = {modelID =109007,MainBinding = "rww",Binding ="rww_liandao",ModelName = "Gourd",pfxID =7000105,pfxBinding = "", }; --镰
		[2] = {modelID =209007,MainBinding = "lww",Binding ="lww_dao",ModelName = "Gourd",pfxID =7000106,pfxBinding = "", }; --刀
		[3] = {modelID =309007,MainBinding = "lww",Binding ="lww_jian",ModelName = "Gourd",pfxID =7000107,pfxBinding = "", }; --剑
		[4] = {modelID =409007,MainBinding = "rww",Binding ="rww_qiang",ModelName = "Gourd",pfxID =7000108,pfxBinding = "",}; --枪
	},
	--八阶
	[14] = {
		[1] = {modelID =109008,MainBinding = "rww",Binding ="rww_liandao",ModelName = "Gourd",pfxID =7000105,pfxBinding = "", }; --镰
		[2] = {modelID =209008,MainBinding = "lww",Binding ="lww_dao",ModelName = "Gourd",pfxID =7000106,pfxBinding = "", }; --刀
		[3] = {modelID =309008,MainBinding = "lww",Binding ="lww_jian",ModelName = "Gourd",pfxID =7000107,pfxBinding = "", }; --剑
		[4] = {modelID =409008,MainBinding = "rww",Binding ="rww_qiang",ModelName = "Gourd",pfxID =7000108,pfxBinding = "",}; --枪
	},
	--九阶
	[15] = {
		[1] = {modelID =109009,MainBinding = "rww",Binding ="rww_liandao",ModelName = "Gourd",pfxID =7000105,pfxBinding = "", }; --镰
		[2] = {modelID =209009,MainBinding = "lww",Binding ="lww_dao",ModelName = "Gourd",pfxID =7000106,pfxBinding = "", }; --刀
		[3] = {modelID =309009,MainBinding = "lww",Binding ="lww_jian",ModelName = "Gourd",pfxID =7000107,pfxBinding = "", }; --剑
		[4] = {modelID =409009,MainBinding = "rww",Binding ="rww_qiang",ModelName = "Gourd",pfxID =7000108,pfxBinding = "",}; --枪
	},	
}