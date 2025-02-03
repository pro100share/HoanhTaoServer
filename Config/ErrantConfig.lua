--[[
	--侠客行Config
	--曲莹

]]
--
_G.ErrantMonsterConfig = {
	[1003] = {
		[10032001] = 5,  --怪物id ———> 最大的星数
		[10032005] = 5,
		[10032002] = 5,
		[10032003] = 5,
		[10032004] = 5,
		[20002001] = 5, --boss的ID
	},
	[1004] = {
		[10042001] = 5,  --怪物id ———> 最大的星数
		[10042002] = 5,
		[10042003] = 5,
		[10042004] = 5,
		[10042007] = 5,
		[10042008] = 5,
	    [20002003] = 5,
	},
	[1005] = {
		[10052001] = 5,  --怪物id ———> 最大的星数
		[10052002] = 5,
		[10052003] = 5,
		[10052004] = 5,
		[10052007] = 5,
		[20002004] = 5,
	},
	[1006] = {
		[10062001] = 5,  --怪物id ———> 最大的星数
		[10062002] = 5,
		[10062003] = 5,
		[10062004] = 5,
		[10062007] = 5,
		[10062008] = 5,
		[10062012] = 5,
		[10062016] = 5,
		[20002005] = 5,
	},
	[1007] = {
		[10072001] = 5,  --怪物id ———> 最大的星数
		[10072002] = 5,
		[10072007] = 5,
		[10072008] = 5,
		[10072009] = 5,
		[10072010] = 5,
		[10072017] = 5,
		[20002006] = 5,
	},
	[1008] = {
		[10092001] = 5,  --怪物id ———> 最大的星数
	    [10092002] = 5,
		[10092003] = 5,
		[10092007] = 5,
		[10092008] = 5,
		[10092009] = 5,
		[10092010] = 5,
	    [20002007] = 5,
	},
	[1009] = {
		[10082001] = 5,  --怪物id ———> 最大的星数
		[10082006] = 5,
		[10082007] = 5,
		[10082010] = 5,
		[10082012] = 5,
		[10082014] = 5,
	    [20002008] = 5,
	},
	[1010] = {
	    [10102007] = 5,  --怪物id ———> 最大的星数
	    [10102008] = 5,
	    [10102009] = 5,
	    [10102010] = 5,
	    [10102011] = 5,
		[10102012] = 5,
		[10102013] = 5,
		[20002009] = 5,	
	},
	[1011] = {
	    [10112011] = 5,  --怪物id ———> 最大的星数
	    [10112010] = 5,
		[10112009] = 5,
		[10112014] = 5,
		[10112013] = 5,
		[10112012] = 5,	
		[20002010] = 5,	
	},
	[1012] = {
	    [10122001] = 5,  --怪物id ———> 最大的星数
	    [10122002] = 5,
		[10122004] = 5,
		[10122005] = 5,
		[10122006] = 5,
		[10122007] = 5,	
        [20002011] = 5,	
	},
	[1013] = {
	    [10130001] = 5,  --怪物id ———> 最大的星数
	    [10130002] = 5,
		[10130003] = 5,
		[10130004] = 5,
		[10130005] = 5,
		[10130006] = 5,
		[10130007] = 5,
		[10130008] = 5,
		[20002012] = 5,
	},
	
}
--boss
_G.BossTextConfig = {
	updateTime = "%02d小时%02d分钟后刷新",
	notKill = "<font color='#FF0000'>未击杀</font>",
	ReKill = "<font color='#00FF00'>已击杀</font>",
}

--boss信息
_G.ErrantBoss = {
	[20002001] = {MapId = 1003,icon = "boss-hd.png",MapName = "野郊秘境"},
	[20002003] = {MapId = 1004,icon = "boss-kze.png",MapName = "桃花秘境"},
	[20002004] = {MapId = 1005,icon = "boss-hys.png",MapName = "绝情秘境"},
	[20002005] = {MapId = 1006,icon = "boss-ydds.png",MapName = "大理秘境"},
	[20002006] = {MapId = 1007,icon = "boss-oyf.png",MapName = "白驼秘境"},
	[20002007] = {MapId = 1008,icon = "boss-bzdz.png",MapName = "终南秘境"},
    [20002008] = {MapId = 1009,icon = "boss-gbdz.png",MapName = "竹林秘境"},
	[20002009] = {MapId = 1010,icon = "boss-fengqingyang.png",MapName = "华山秘境"},
	[20002010] = {MapId = 1011,icon = "boss-wusechanshi.png",MapName = "嵩山秘境"},
	[20002011] = {MapId = 1012,icon = "boss_shhzd.png",MapName = "昆仑秘境"},
	[20002012] = {MapId = 1013,icon = "boss_stgm.png",MapName = "黑水遗迹"},
}

--BOSS模型
_G.ErrantBossModel = {
	[10032001] = {
		sknFile = ResNpcModelConfig.Skns[10032001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10032005] = {
		sknFile = ResNpcModelConfig.Skns[10032005].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032005].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200501].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200513].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10032002] = {
		sknFile = ResNpcModelConfig.Skns[10032002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10032003] = {
		sknFile = ResNpcModelConfig.Skns[10032003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10032004] = {
		sknFile = ResNpcModelConfig.Skns[10032004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002001] = {
		sknFile = ResNpcModelConfig.Skns[10092006].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092006].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200601].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200613].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10042001] = {
		sknFile = ResNpcModelConfig.Skns[10042001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10042001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10042002] = {
		sknFile = ResNpcModelConfig.Skns[10042002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10042002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10042003] = {
		sknFile = ResNpcModelConfig.Skns[10042003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10042003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10042004] = {
		sknFile = ResNpcModelConfig.Skns[10042004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10042004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10042007] = {
		sknFile = ResNpcModelConfig.Skns[10042003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10042003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10042008] = {
		sknFile = ResNpcModelConfig.Skns[10082002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002003] = {
		sknFile = ResNpcModelConfig.Skns[10041003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10041003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004100301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004100313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10052001] = {
		sknFile = ResNpcModelConfig.Skns[10052001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10052001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1005200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1005200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10052002] = {
		sknFile = ResNpcModelConfig.Skns[10052002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10052002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1005200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1005200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10052003] = {
		sknFile = ResNpcModelConfig.Skns[10052003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10052003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1005200301].szFile,
		param_1_x = 0, param_1_y =-12, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1005200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10052004] = {
		sknFile = ResNpcModelConfig.Skns[10052004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10052004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1005200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1005200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10052007] = {
		sknFile = ResNpcModelConfig.Skns[10082002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002004] = {
		sknFile = ResNpcModelConfig.Skns[10051003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10051003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1005100301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1005100313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062001] = {
		sknFile = ResNpcModelConfig.Skns[10062001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10062001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1006200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1006200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062002] = {
		sknFile = ResNpcModelConfig.Skns[10062002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10062002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1006200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1006200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062003] = {
		sknFile = ResNpcModelConfig.Skns[10062003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10062003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1006200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1006200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062004] = {
		sknFile = ResNpcModelConfig.Skns[10062004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10062004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1006200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1006200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062007] = {
		sknFile = ResNpcModelConfig.Skns[10012003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10012003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1001200301].szFile,
		param_1_x = 0, param_1_y =-6, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1001200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062008] = {
		sknFile = ResNpcModelConfig.Skns[10082004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062012] = {
		sknFile = ResNpcModelConfig.Skns[10082004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10062016] = {
		sknFile = ResNpcModelConfig.Skns[10082002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002005] = {
		sknFile = ResNpcModelConfig.Skns[10061001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10061001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1006100101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1006100113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10072001] = {
		sknFile = ResNpcModelConfig.Skns[10072001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10072001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10072002] = {
		sknFile = ResNpcModelConfig.Skns[10072002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10072002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10072007] = {
		sknFile = ResNpcModelConfig.Skns[10071098].szFile, 
		sklFile= ResNpcModelConfig.Skls[10071098].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007109801].szFile,
		param_1_x = 0, param_1_y =-6, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007109813].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10072008] = {
		sknFile = ResNpcModelConfig.Skns[10092004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10072009] = {
		sknFile = ResNpcModelConfig.Skns[10082002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10072010] = {
		sknFile = ResNpcModelConfig.Skns[10112004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10112004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1011200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1011200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10072017] = {
		sknFile = ResNpcModelConfig.Skns[10071008].szFile, 
		sklFile= ResNpcModelConfig.Skls[10071008].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007100801].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007100813].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002006] = {
		sknFile = ResNpcModelConfig.Skns[10071007].szFile, 
		sklFile= ResNpcModelConfig.Skls[10071007].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007100701].szFile,
		param_1_x = 0, param_1_y =-8, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007100713].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10082001] = {
		sknFile = ResNpcModelConfig.Skns[10082001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10082006] = {
		sknFile = ResNpcModelConfig.Skns[10082003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10082007] = {
		sknFile = ResNpcModelConfig.Skns[10082003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10082007] = {
		sknFile = ResNpcModelConfig.Skns[10071010].szFile, 
		sklFile= ResNpcModelConfig.Skls[10071010].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007101001].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007101013].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10082010] = {
		sknFile = ResNpcModelConfig.Skns[10062007].szFile, 
		sklFile= ResNpcModelConfig.Skls[10062007].szFile, 
		sanFile = ResNpcModelConfig.Sans[1006200701].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1006200713].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10082012] = {
		sknFile = ResNpcModelConfig.Skns[10102005].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102005].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010200501].szFile,
		param_1_x = 0, param_1_y =-9, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010200513].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10082014] = {
		sknFile = ResNpcModelConfig.Skns[10071013].szFile, 
		sklFile= ResNpcModelConfig.Skls[10071013].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007101301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007101313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002008] = {
		sknFile = ResNpcModelConfig.Skns[10082007].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082007].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200701].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200713].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10092001] = {
		sknFile = ResNpcModelConfig.Skns[10092001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10092002] = {
		sknFile = ResNpcModelConfig.Skns[10092002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10092003] = {
		sknFile = ResNpcModelConfig.Skns[10092003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10092007] = {
		sknFile = ResNpcModelConfig.Skns[10041017].szFile, 
		sklFile= ResNpcModelConfig.Skls[10041017].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004101701].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004101713].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10092008] = {
		sknFile = ResNpcModelConfig.Skns[10092009].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092009].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200901].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200913].szFile,
		AvatarRect = {x = 360, y = 640},
	},	
	[10092009] = {
		sknFile = ResNpcModelConfig.Skns[10042001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10042001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1004200101].szFile,
		param_1_x = 0, param_1_y =-5, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1004200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},	
	[10092010] = {
		sknFile = ResNpcModelConfig.Skns[10092001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},	
	[20002007] = {
		sknFile = ResNpcModelConfig.Skns[10092011].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092011].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009201101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009201113].szFile,
		AvatarRect = {x = 360, y = 640},
	},	
	[10102007] = {
		sknFile = ResNpcModelConfig.Skns[10102014].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102014].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010201401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010201413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10102008] = {
		sknFile = ResNpcModelConfig.Skns[10102011].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102011].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010201101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010201113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10102009] = {
		sknFile = ResNpcModelConfig.Skns[10092002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200201].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10102010] = {
		sknFile = ResNpcModelConfig.Skns[10012001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10012001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1001200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1001200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10102011] = {
		sknFile = ResNpcModelConfig.Skns[10102016].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102016].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010201601].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010201613].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10102012] = {
		sknFile = ResNpcModelConfig.Skns[10102015].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102015].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010201501].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010201513].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10102013] = {
		sknFile = ResNpcModelConfig.Skns[10102016].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102016].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010201601].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010201613].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002009] = {
		sknFile = ResNpcModelConfig.Skns[10102018].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102018].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010201801].szFile,
		param_1_x = 0, param_1_y =-15, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010201813].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10112009] = {
		sknFile = ResNpcModelConfig.Skns[10112009].szFile, 
		sklFile= ResNpcModelConfig.Skls[10112009].szFile, 
		sanFile = ResNpcModelConfig.Sans[1011200901].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1011200913].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10112010] = {
		sknFile = ResNpcModelConfig.Skns[10092010].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092010].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009201001].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009201013].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10112011] = {
		sknFile = ResNpcModelConfig.Skns[10112008].szFile, 
		sklFile= ResNpcModelConfig.Skls[10112008].szFile, 
		sanFile = ResNpcModelConfig.Sans[1011200801].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1011200813].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10112012] = {
		sknFile = ResNpcModelConfig.Skns[10112013].szFile, 
		sklFile= ResNpcModelConfig.Skls[10112013].szFile, 
		sanFile = ResNpcModelConfig.Sans[1011201301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1011201313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10112013] = {
		sknFile = ResNpcModelConfig.Skns[10112004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10112004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1011200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1011200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10112014] = {
		sknFile = ResNpcModelConfig.Skns[10112015].szFile, 
		sklFile= ResNpcModelConfig.Skls[10112015].szFile, 
		sanFile = ResNpcModelConfig.Sans[1011201501].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1011201513].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002010] = {
		sknFile = ResNpcModelConfig.Skns[10112014].szFile, 
		sklFile= ResNpcModelConfig.Skls[10112014].szFile, 
		sanFile = ResNpcModelConfig.Sans[1011201401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1011201413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10122001] = {
		sknFile = ResNpcModelConfig.Skns[10122001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10122001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1012200101].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1012200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10122002] = {
		sknFile = ResNpcModelConfig.Skns[10102013].szFile, 
		sklFile= ResNpcModelConfig.Skls[10102013].szFile, 
		sanFile = ResNpcModelConfig.Sans[1010201301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1010201313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10122004] = {
		sknFile = ResNpcModelConfig.Skns[10122003].szFile, 
		sklFile= ResNpcModelConfig.Skls[10122003].szFile, 
		sanFile = ResNpcModelConfig.Sans[1012200301].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1012200313].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10122005] = {
		sknFile = ResNpcModelConfig.Skns[10052004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10052004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1005200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1005200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10122006] = {
		sknFile = ResNpcModelConfig.Skns[10062005].szFile, 
		sklFile= ResNpcModelConfig.Skls[10062005].szFile, 
		sanFile = ResNpcModelConfig.Sans[1006200501].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1006200513].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10122007] = {
		sknFile = ResNpcModelConfig.Skns[10122004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10122004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1012200401].szFile,
		param_1_x = 0, param_1_y =-7.4, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1012200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002011] = {
		sknFile = ResNpcModelConfig.Skns[10122007].szFile, 
		sklFile= ResNpcModelConfig.Skls[10122007].szFile, 
		sanFile = ResNpcModelConfig.Sans[1012200701].szFile,
		param_1_x = 0, param_1_y = -14, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1012200713].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130001] = {
		sknFile = ResNpcModelConfig.Skns[10131004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10131004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1013100401].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1013100413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130002] = {
		sknFile = ResNpcModelConfig.Skns[10032002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200201].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130003] = {
		sknFile = ResNpcModelConfig.Skns[10032005].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032005].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200501].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200513].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130004] = {
		sknFile = ResNpcModelConfig.Skns[10032004].szFile, 
		sklFile= ResNpcModelConfig.Skls[10032004].szFile, 
		sanFile = ResNpcModelConfig.Sans[1003200401].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1003200413].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130005] = {
		sknFile = ResNpcModelConfig.Skns[10092002].szFile, 
		sklFile= ResNpcModelConfig.Skls[10092002].szFile, 
		sanFile = ResNpcModelConfig.Sans[1009200201].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1009200213].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130006] = {
		sknFile = ResNpcModelConfig.Skns[10072001].szFile, 
		sklFile= ResNpcModelConfig.Skls[10072001].szFile, 
		sanFile = ResNpcModelConfig.Sans[1007200101].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1007200113].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130007] = {
		sknFile = ResNpcModelConfig.Skns[10021038].szFile, 
		sklFile= ResNpcModelConfig.Skls[10021038].szFile, 
		sanFile = ResNpcModelConfig.Sans[1002103801].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1002103813].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[10130008] = {
		sknFile = ResNpcModelConfig.Skns[10082008].szFile, 
		sklFile= ResNpcModelConfig.Skls[10082008].szFile, 
		sanFile = ResNpcModelConfig.Sans[1008200801].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1008200813].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	[20002012] = {
		sknFile = ResNpcModelConfig.Skns[10131006].szFile, 
		sklFile= ResNpcModelConfig.Skls[10131006].szFile, 
		sanFile = ResNpcModelConfig.Sans[1013100601].szFile,
		param_1_x = 0, param_1_y = -10, param_1_z = 0,param_2_x = 0, param_2_y = 0; param_2_z = 0,
		lieAction = ResNpcModelConfig.Sans[1013100613].szFile,
		AvatarRect = {x = 360, y = 640},
	},
	
}

--宝箱领取进度配置
--【1】：宝箱下标
--80：领取值
_G.ErrantAwardGetConfig = {
	[1] = 50,
	[2] = 100,
	[3] = 150,
	[4] = 200,
	[5] = 250,
}

--dwHPMax	--生命max
--dwMPMax	--内力max
--dwAttack	--攻击
--dwDefense --防御
--dwFlee	--身法
--dwCrit	--暴击
--dwMoveSpeed   --移动速度
--dwAttackSpeed   --攻击速度

_G.ErrantAwardConfig = {
	--侠客行怪物最高等阶
	MaxMonsterStar = 5;
	--获得侠客行阶段
	ErrantPhase = function(value)
		local phase = 0;--1
		if value >= ErrantAwardGetConfig[1] then
			phase = 1;
		end;
		if	value >= ErrantAwardGetConfig[2] then
			phase = 2;
		end;
		if	value >= ErrantAwardGetConfig[3] then
			phase = 3;
		end;
		if	value >= ErrantAwardGetConfig[4] then
			phase = 4;			    
		end;
		if	value >= ErrantAwardGetConfig[5] then
			phase = 5;
		end;
	return phase;
	end;
	--奖励物品
	EncourageItem = {
		[1] = {
			{dwItemEnum = 5501100,dwItemNumber = 1, dwBindType = 1},
			
		},
		[2] = {
			{dwItemEnum = 5501100,dwItemNumber = 1, dwBindType = 1},
			
		},
		[3] = {
			{dwItemEnum = 5501100,dwItemNumber = 1, dwBindType = 1},
			
		},
		[4] = {
			{dwItemEnum = 5501110,dwItemNumber = 1, dwBindType = 1},
			
		},
		[5] = {
			{dwItemEnum = 5501110,dwItemNumber = 1, dwBindType = 1},
			
		},
	};
}


_G.ErrantShowConfig = {
	[1003] = {
		szName = "浴血襄阳",
		szFile = "XiaKeXingXiLie01.png",
		[10032001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},

		},
		[10032005] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10032002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10032003] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10032004] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[20002001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=3,},
		},
	},
	[1004] = {
		szName = "桃林破阵",
		szFile = "XiaKeXingXiLie02.png",
		[10042001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		}, 
		[10042002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10042003] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10042004] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10042007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10042008] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
	    [20002003] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=3,},
		},
	    
	},
	[1005] = {
		szName = "密涧求生",
	    szFile = "XiaKeXingXiLie03.png",
		[10052001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10052002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10052003] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10052004] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10052007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[20002004] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=3,},
		},
	},
	[1006] = {
	    szName = "大理突围",
		szFile = "XiaKeXingXiLie04.png",
		[10062001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10062002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10062003] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10062004] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10062007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10062008] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10062012] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[10062016] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=15,dwAttack=3,},
		[2]={dwHPMax=30,dwAttack=6,dwDefense=3,},
		[3]={dwHPMax=60,dwAttack=12,dwDefense=6,},
		[4]={dwHPMax=90,dwAttack=18,dwDefense=9,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=2,},
		},
		[20002005] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=180,dwAttack=36,dwDefense=18,dwAttackSpeed=3,},
		},
	},
	[1007] = {
	    szName = "怒卷狂沙",
		szFile = "XiaKeXingXiLie05.png",
		[10072001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10072002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10072007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10072008] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10072009] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10072010] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10072017] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[20002006] =  {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=3,},
		},
	},
	[1008] = {
	    szName = "纵横终南", 
		szFile = "XiaKeXingXiLie06.png",
		[10092001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
	    [10092002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10092003] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10092007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10092008] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10092009] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10092010] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
	    [20002007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=3,},
		},
	},
	[1009] = {
	    szName = "逐鹿江北",
		szFile = "XiaKeXingXiLie07.png",
		[10082001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10082006] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10082007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10082010] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		}, 
		[10082012] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10082014] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
	    [20002008] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=3,},
		}, 
	},
	[1010] = {
	    szName = "称雄云巅",
		szFile = "XiaKeXingXiLie08.png",
		[10102007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10102008] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10102009] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10102010] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10102011] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10102012] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[10102013] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=20,dwAttack=4,},
		[2]={dwHPMax=40,dwAttack=8,dwDefense=4,},
		[3]={dwHPMax=80,dwAttack=16,dwDefense=8,},
		[4]={dwHPMax=120,dwAttack=24,dwDefense=12,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=2,},
		},
		[20002009] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=240,dwAttack=48,dwDefense=24,dwAttackSpeed=3,},
		}, 
	},
	[1011] = {
	    szName = "梵音净世",
		szFile = "XiaKeXingXiLie09.png",
		[10112009] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=25,dwAttack=5,},
		[2]={dwHPMax=50,dwAttack=10,dwDefense=5,},
		[3]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[4]={dwHPMax=150,dwAttack=30,dwDefense=15,},
		[5]={dwHPMax=300,dwAttack=60,dwDefense=30,dwAttackSpeed=2,},
		},
		[10112010] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=25,dwAttack=5,},
		[2]={dwHPMax=50,dwAttack=10,dwDefense=5,},
		[3]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[4]={dwHPMax=150,dwAttack=30,dwDefense=15,},
		[5]={dwHPMax=300,dwAttack=60,dwDefense=30,dwAttackSpeed=2,},
		},
		[10112011] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=25,dwAttack=5,},
		[2]={dwHPMax=50,dwAttack=10,dwDefense=5,},
		[3]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[4]={dwHPMax=150,dwAttack=30,dwDefense=15,},
		[5]={dwHPMax=300,dwAttack=60,dwDefense=30,dwAttackSpeed=2,},
		},
		[10112012] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=25,dwAttack=5,},
		[2]={dwHPMax=50,dwAttack=10,dwDefense=5,},
		[3]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[4]={dwHPMax=150,dwAttack=30,dwDefense=15,},
		[5]={dwHPMax=300,dwAttack=60,dwDefense=30,dwAttackSpeed=2,},
		},
		[10112013] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=25,dwAttack=5,},
		[2]={dwHPMax=50,dwAttack=10,dwDefense=5,},
		[3]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[4]={dwHPMax=150,dwAttack=30,dwDefense=15,},
		[5]={dwHPMax=300,dwAttack=60,dwDefense=30,dwAttackSpeed=2,},
		},
		[10112014] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=25,dwAttack=5,},
		[2]={dwHPMax=50,dwAttack=10,dwDefense=5,},
		[3]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[4]={dwHPMax=150,dwAttack=30,dwDefense=15,},
		[5]={dwHPMax=300,dwAttack=60,dwDefense=30,dwAttackSpeed=2,},
		},
		[20002010] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=300,dwAttack=60,dwDefense=30,dwAttackSpeed=3,},
		}, 
	},
	[1012] = {
	    szName = "昆仑魅影",
		szFile = "XiaKeXingXiLie10.png",
		[10122001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=50,dwAttack=10,},
		[2]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[3]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[4]={dwHPMax=300,dwAttack=60,dwDefense=30,},
		[5]={dwHPMax=600,dwAttack=120,dwDefense=60,dwAttackSpeed=2,},
		},
		[10122002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=50,dwAttack=10,},
		[2]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[3]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[4]={dwHPMax=300,dwAttack=60,dwDefense=30,},
		[5]={dwHPMax=600,dwAttack=120,dwDefense=60,dwAttackSpeed=2,},
		},
		[10122004] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=50,dwAttack=10,},
		[2]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[3]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[4]={dwHPMax=300,dwAttack=60,dwDefense=30,},
		[5]={dwHPMax=600,dwAttack=120,dwDefense=60,dwAttackSpeed=2,},
		},
		[10122005] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=50,dwAttack=10,},
		[2]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[3]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[4]={dwHPMax=300,dwAttack=60,dwDefense=30,},
		[5]={dwHPMax=600,dwAttack=120,dwDefense=60,dwAttackSpeed=2,},
		},
		[10122006] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=50,dwAttack=10,},
		[2]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[3]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[4]={dwHPMax=300,dwAttack=60,dwDefense=30,},
		[5]={dwHPMax=600,dwAttack=120,dwDefense=60,dwAttackSpeed=2,},
		},
		[10122007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=50,dwAttack=10,},
		[2]={dwHPMax=100,dwAttack=20,dwDefense=10,},
		[3]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[4]={dwHPMax=300,dwAttack=60,dwDefense=30,},
		[5]={dwHPMax=600,dwAttack=120,dwDefense=60,dwAttackSpeed=2,},
		},
		[20002011] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=600,dwAttack=120,dwDefense=60,dwAttackSpeed=3,},
		}, 
		
	},
	[1013] = {
	    szName = "黑水遗迹",
		szFile = "XiaKeXingXiLie11.png",
		[10130001] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[10130002] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[10130003] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[10130004] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[10130005] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[10130006] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[10130007] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[10130008] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[1]={dwHPMax=100,dwAttack=20,},
		[2]={dwHPMax=200,dwAttack=40,dwDefense=20,},
		[3]={dwHPMax=400,dwAttack=80,dwDefense=40,},
		[4]={dwHPMax=600,dwAttack=120,dwDefense=60,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=2,},
		},
		[20002012] = {
		[0]={dwHPMax=0,dwAttack=0,dwDefense=0,dwAttackSpeed=0,},
		[5]={dwHPMax=1200,dwAttack=240,dwDefense=120,dwAttackSpeed=3,},
		}, 
		
	},
}

--系列解锁等级
_G.ErrantVilidConfig = {
	[1003] = 10,
	[1004] = 20,
	[1005] = 28,
	[1006] = 38,
	[1007] = 49,
	[1008] = 59,
	[1009] = 69,
	[1010] = 79,
	[1011] = 89,
	[1012] = 99,
	[1013] = 109,
}

--属性总加成显示配置
  -- @A: 生命上限
  -- @B: 内力上限
  -- @C: 攻击
  -- @D: 防御
  -- @E: 暴击
  -- @F: 身法
  -- @G: 攻击速度
  -- @H: 移动速度
_G.AchievementPropertyText = 
	[[生命上限:<font color='#00FF00'> + <b>@A</b></font><br>内力上限:<font color='#00FF00'> + <b>@B</b></font><br>攻击:<font color='#00FF00'> + <b>@C</b></font><br>防御:<font color='#00FF00'> + <b>@D</b></font><br>暴击:<font color='#00FF00'> + <b>@E</b></font><br>身法:<font color='#00FF00'> + <b>@F</b></font><br>攻击速度:<font color='#00FF00'> + <b>@G</b></font><br>移动速度:<font color='#00FF00'> + <b>@H</b></font><br>]]

_G.AchievementPropertyConfig = {
	"生命上限",
	"内力上限",
	"攻击",
	"防御",
	"暴击",
	"身法",
	"攻击速度",
	"移动速度",
}
--进度条tips
--@A:20%100
_G.processBarText = {
	szText = [[<font color='#FFFFFF' size='14'>当前侠客行进度: </font><b><font color='#FF6100' size='14'>@A</font></b><br><font color='#00FF00' size='14'>每当侠客行达到一定的进度可以领取宝箱</font>]]
}
--宝箱tips
_G.AwardBoxText = {
	szText = "<font color='#FFFFFF' size='14'>侠客行进度达到 </font><b><font color='#FF0000' size='14'>%s</font></b><br /><font color='#FFFFFF' size='14'>可领取宝箱</font><br /><font color='#87CEEB' size='14'>打开宝箱获得:</font><br />"
}

--宝箱图片
_G.AwardBoxConfig = {
	[1] = {normal = "Icon_Baoxiang_01_close.png",select = "Icon_Baoxiang_01_open.png"},
	[2] = {normal = "Icon_Baoxiang_02_close.png",select = "Icon_Baoxiang_02_open.png"},
	[3] = {normal = "Icon_Baoxiang_03_close.png",select = "Icon_Baoxiang_03_open.png"},
	[4] = {normal = "Icon_Baoxiang_04_close.png",select = "Icon_Baoxiang_04_open.png"},
	[5] = {normal = "Icon_Baoxiang_05_close.png",select = "Icon_Baoxiang_05_open.png"},
}

--骷髅状态图片
_G.kulouImageConfig = {
	normal = "Mon_Yi_1.png",
	unNormal = "Mon_Yi_0.png",
}

--活动介绍
_G.ActiveConfig = {
	[1003] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图襄阳野郊中的变异怪和BOSS可获得属性加成。",
	[1004] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图桃花岛中的变异怪和BOSS可获得属性加成。",
	[1005] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图绝情密涧中的变异怪和BOSS可获得属性加成。",
	[1006] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图大理中的变异怪和BOSS可获得属性加成。",
	[1007] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图白驼山中的变异怪和BOSS可获得属性加成。",
	[1008] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图终南山中的变异怪和BOSS可获得属性加成。",
	[1009] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图丐帮竹林中的变异怪和BOSS可获得属性加成。",
	[1010] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图华山中的变异怪和BOSS可获得属性加成。",
	[1011] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图嵩山少林中的变异怪和BOSS可获得属性加成。",
	[1012] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图昆仑中的变异怪和BOSS可获得属性加成。",
	[1013] = "<font color='#FFD700' size='15'>十步杀一人，千里不留行。了事拂衣去，深藏功与名。</font><br>斩杀地图黑水遗迹中的变异怪和BOSS可获得属性加成。",
}

--当前属性
  -- @A: 生命上限
  -- @B: 内力上限
  -- @C: 攻击
  -- @D: 防御
  -- @E: 暴击
  -- @F: 身法
  -- @G: 攻击速度
  -- @H: 移动速度
 _G.curPropertyText = {
 --szText = [[<font color='#dcd9d9' size='14'>当前属性加成</font><br /><font color='#00FF00' size='14'>生命上限: <b>@A</b></font><br /><font color='#00FF00' size='14'>内力上限: <b>@B</b></font><br><font color='#00FF00' size='14'>攻击: <b>@C</b></font><br /><font color='#00FF00' size='14'>防御: <b>@D</b></font><br /><font color='#00FF00' size='14'>暴击: <b>@E</b></font><br /><font color='#00FF00' size='14'>身法: <b>@F</b></font><br /><font color='#00FF00' size='14'>攻击速度: <b>@G</b></font><br /><font color='#00FF00' size='14'>移动速度: <b>@H</b></font><br />]]
	szText = "<font color='#FF6100' size='16'>当前属性加成:</font><br />"
 }
--boss属性
  -- @A: 生命上限
  -- @B: 内力上限
  -- @C: 攻击
  -- @D: 防御
  -- @E: 暴击
  -- @F: 身法
_G.bossPropertyText = [[搏杀后获得以下属性加成<br>生命上限：<font color='#00FF00'><b>@A</b></font><br>内力上限:<font color='#00FF00'><b>@B</b></font><br>攻击:<font color='#00FF00'><b>@C</b></font><br>防御:<font color='#00FF00'><b>@D</b></font><br>暴击:<font color='#00FF00'><b>@E</b></font><br>身法:<font color='#00FF00'><b>@F</b></font><br>]]

--系列悬浮提示框
  -- @A: 生命上限
  -- @B: 内力上限
  -- @C: 攻击
  -- @D: 防御
  -- @E: 暴击
  -- @F: 身法
  -- @G: 攻击速度
  -- @H: 移动速度
  -- @I: 系列名
  -- @J: 进度
--_G.SeriesDoShowConfigText = [[<font ><b>@I</b></font><font color='#dcd9d9' size='14'>进度：<b>@J</b></font><br />   <font color='#dcd9d9' size='15'>当前激活属性: + <b>@A</b></font><br /><font color='#dcd9d9' size='14'>生命上限: + <b>@A</b></font><br /><font color='#dcd9d9' size='14'>内力上限: + <b>@B</b></font><br><font color='#dcd9d9' size='14'>攻击: + <b>@C</b></font><br><font color='#dcd9d9' size='14'>防御: + <b>@D</b></font><br><font color='#dcd9d9' size='14'>暴击: + <b>@E</b></font><br><font color='#dcd9d9' size='14'>身法: + <b>@F</b></font><br><font color='#dcd9d9' size='14'>攻击速度: + <b>@G</b></font><br><font color='#dcd9d9' size='14'>移动速度: + <b>@H</b></font><br>]]
_G.SeriesDoShowConfigText = {
--szText = [[<font color='#dcd9d9' size='14'><b>@I</b></font> <font color='#dcd9d9' size='14'>进度：<b>@J</b></font><br /><font color='#dcd9d9' size='15'>当前激活属性: </font><br /><font color='#dcd9d9' size='14'>生命上限: <b>@A</b></font><br /><font color='#dcd9d9' size='14'>内力上限: <b>@B</b></font><br><font color='#dcd9d9' size='14'>攻击: <b>@C</b></font><br /><font color='#dcd9d9' size='14'>防御: <b>@D</b></font><br /><font color='#dcd9d9' size='14'>暴击: <b>@E</b></font><br /><font color='#dcd9d9' size='14'>身法: <b>@F</b></font><br /><font color='#dcd9d9' size='14'>攻击速度: <b>@G</b></font><br /><font color='#dcd9d9' size='14'>移动速度: <b>@H</b></font><br />]]
szText = "<font color='#87CEEB' size='14'>%s</font> <font color='#dcd9d9' size='14'>进度：%s</font><br />",
szTextAttr = "<font color='#FF8000' size='15'>当前激活属性: </font><br />",
}

--星级提示
  -- @A: 当前星级
  -- @B: 攻击
  -- @C: 防御
  -- @D: 下级攻击
  -- @E: 下级防御
  -- @F: 下级身法
_G.kulouConfig = {
--szText0 = [[<font color='#dcd9d9' size='14'>当前星级 <b>@A</b></font><br /><font color='#00FF00' size='14'>下级激活属性: </font><br /><font color='#00FF00' size='14'>攻击: <b>@F</b></font><br /><font color='#00FF00' size='14'>防御: <b>@G</b></font><br /><font color='#00FF00' size='14'>暴击: <b>@I</b></font><br />]],
--szText = [[<font color='#dcd9d9' size='14'>当前星级 <b>@A</b></font><br /><font color='#00FF00' size='14'>激活属性:</font><br /><font color='#00FF00' size='14'>攻击: <b>@B</b></font><br /><font color='#00FF00' size='14'>防御: <b>@C</b></font><br /><font color='#00FF00' size='14'>下级激活属性: </font><br /><font color='#00FF00' size='14'>攻击: <b>@D</b></font><br /><font color='#00FF00' size='14'>防御: <b>@E</b></font><br /><font color='#00FF00' size='14'>身法: <b>@F</b></font><br />]],
--szText5 = [[<font color='#dcd9d9' size='14'>当前星级 <b>@A</b></font><br /><font color='#00FF00' size='14'>激活属性:</font><br /><font color='#00FF00' size='14'>攻击: <b>@B</b></font><br /><font color='#00FF00' size='14'>防御: <b>@C</b></font><br /><font color='#00FF00' size='14'>暴击: <b>@D</b></font><br /><font color='#00FF00' size='14'>身法: <b>@E</b></font><br />]],
szText0 = "<font color='#FF6100' size='14'>当前星级 %s</font><br /><font color='#FFFFFF' size='14'>下级激活属性: </font><br />",
szText = "<font color='#FF6100' size='14'>当前星级 %s</font><br /><font color='#FFFFFF' size='14'>激活属性:</font><br />",
szText_1 = "<font color='#FFFFFF' size='14'>下级激活属性: </font><br />",
szText5 = "<font color='#FF6100' size='14'>当前星级 %s</font><br /><font color='#FFFFFF' size='14'>激活属性:</font><br />",
}

_G.kulouAtrrConfig = {
	dwHPMax = "<font color='#00FF00' size='14'>生命上限: %s</font><br />",
	dwMPMax = "<font color='#00FF00' size='14'>内力攻击: %s</font><br />",
	dwAttack = "<font color='#00FF00' size='14'>攻    击: %s</font><br />",
	dwDefense = "<font color='#00FF00' size='14'>防    御: %s</font><br />",
	dwCrit = "<font color='#00FF00' size='14'>暴    击: %s</font><br />",
	dwFlee = "<font color='#00FF00' size='14'>身    法: %s</font><br />",
	dwAttackSpeed = "<font color='#00FF00' size='14'>攻击速度: %s</font><br />",
	dwMoveSpeed = "<font color='#00FF00' size='14'>移动速度: %s</font><br />",
}

--怪兽提示
 -- @A: 当前星级
  -- @B: 攻击
  -- @C: 防御
  -- @D: 下级攻击
  -- @E: 下级防御
  -- @F: 下级身法
_G.monsterTipsConfig = {
--szText = [[<font color='#dcd9d9' size='14'>击杀后获得以下属性加成</font><br /><font color='#00FF00' size='14'>生命上限: <b>@B</b></font><br /><font color='#00FF00' size='14'>内力攻击: <b>@B</b></font><br /><font color='#00FF00' size='14'>攻击: <b>@C</b></font><br /><font color='#00FF00' size='14'>防御: <b>@D</b></font><br /><font color='#00FF00' size='14'>暴击: <b>@E</b></font><br /><font color='#00FF00' size='14'>身法: <b>@F</b></font><br />]]
szText = "<font color='#FFFFFF' size='14'>击杀后获得以下属性加成</font><br />"
} 

--显示属性
  -- @A: 生命上限
  -- @B: 内力上限
  -- @C: 攻击
  -- @D: 防御
  -- @E: 暴击
  -- @F: 身法
  -- @G: 攻击速度
  -- @H: 移动速度
_G.ShowTipsConfig = {
	dwHPMax = "<font color='#00FF00' size='14'>生命上限: <b>@A</b></font><br />",
	dwMPMax = "<font color='#00FF00' size='14'>内力攻击: <b>@B</b></font><br />",
	dwAttack = "<font color='#00FF00' size='14'>攻    击: <b>@C</b></font><br />",
	dwDefense = "<font color='#00FF00' size='14'>防    御: <b>@D</b></font><br />",
	dwCrit = "<font color='#00FF00' size='14'>暴    击: <b>@E</b></font><br />",
	dwFlee = "<font color='#00FF00' size='14'>身    法: <b>@F</b></font><br />",
	dwAttackSpeed = "<font color='#00FF00' size='14'>攻击速度: <b>@G</b></font><br />",
	dwMoveSpeed = "<font color='#00FF00' size='14'>移动速度: <b>@H</b></font><br />",
}

_G.MonsterTbl = {
	Monster = function(MonsterID)
		local vi = MonsterID/10;
		return vi; 
	end
	-- --道具召唤的怪物   ----- 正常的怪物
	-- [100320010] = 10032001,
};

--特殊怪物实际地图与索引
_G.MonsterMapInfo = {
	[20002001] = 1003,
	[20002003] = 1004,
	[20002004] = 1005,
	[20002005] = 1006,
	[20002006] = 1007,
	[20002007] = 1008,
	[20002008] = 1009,
	[20002009] = 1010,
	[20002010] = 1011,
	[20002011] = 1012,
	[20002012] = 1013,
}