--[[
兑换功能配置
曲莹
2013-04-16
--]]
--bShow = 1:显示查看活动
_G.Deploy = {
	--分页
	[1] = {
		bShow = 1;
		--上列
		[1] = {
			title = "DuiHuan_ZhuiDi.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
				CUIMissionDailyEx:SetMovementID(8)
				CUIMissionDailyEx:OpenPanel()
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 4900010,
				--兑换消耗数量
				amount = 10,
				--兑换获得道具id
				gain = 4100140,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 4900010,
				--兑换消耗数量
				amount = 20,
				--兑换获得道具id
				gain = 4100080,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[3] = {
				--兑换消耗道具id
				convert = 4900010,
				--兑换消耗数量
				amount = 30,
				--兑换获得道具id
				gain = 3900030,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[4] = {
				--兑换消耗道具id
				convert = 4900010,
				--兑换消耗数量
				amount = 50,
				--兑换获得道具id
				gain = 4100120,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
		},
		--下列
		[2] = {
			title = "DuiHuan_BaoTu.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
				CUIMissionDailyEx:SetMovementID(5)
				CUIMissionDailyEx:OpenPanel()
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 5600020,
				--兑换消耗数量
				amount = 5,
				--兑换获得道具id
				gain = 5600030,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 5600030,
				--兑换消耗数量
				amount = 5,
				--兑换获得道具id
				gain = 5600040,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 100000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
		},
	},
	--页签2
	[2] = {
		bShow = 1;
	--上列
		--下列
		[1] = {
			title = "DuiHuan_QiJu.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
				CZLEnterUI:CheckOpenDuplUI()
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 4901000,
				--兑换消耗数量
				amount = 2,
				--兑换获得道具id
				gain = 4100140,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 4901000,
				--兑换消耗数量
				amount = 5,
				--兑换获得道具id
				gain = 5930005,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[3] = {
				--兑换消耗道具id
				convert = 4901000,
				--兑换消耗数量
				amount = 6,
				--兑换获得道具id
				gain = 9405010,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},

			[4] = {
				--兑换消耗道具id
				convert = 4901000,
				--兑换消耗数量
				amount = 18,
				--兑换获得道具id
				gain = 5500660,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[5] = {
				--兑换消耗道具id
				convert = 4901000,
				--兑换消耗数量
				amount = 38,
				--兑换获得道具id
				gain = 5500670,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},

		},
	};
	
	--页签3
	[3] = {
	--上列
		bShow = 1;
		--下列
		[1] = {
			title = "TaiXuanJing.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
				--CUIFestival:DoOpen(2,1,dwIndex)
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 4900050,
				--兑换消耗数量
				amount = 1,
				--兑换获得道具id
				gain = 2500104,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 4900050,
				--兑换消耗数量
				amount = 4,
				--兑换获得道具id
				gain = 2500105,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[3] = {
				--兑换消耗道具id
				convert = 4900050,
				--兑换消耗数量
				amount = 8,
				--兑换获得道具id
				gain = 2500106,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[4] = {
				--兑换消耗道具id
				convert = 4900050,
				--兑换消耗数量
				amount = 15,
				--兑换获得道具id
				gain = 2500107,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[5] = {
				--兑换消耗道具id
				convert = 4900050,
				--兑换消耗数量
				amount = 30,
				--兑换获得道具id
				gain = 2500108,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
		},

		--下列
		[2] = {
			title = "DuiHuan_QYSP.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 4900107,
				--兑换消耗数量
				amount = 20,
				--兑换获得道具id
				gain = 4900147,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 4900107,
				--兑换消耗数量
				amount = 30,
				--兑换获得道具id
				gain = 4100410,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
		};
	};
	
	--页签4
	[4] = {
	--上列
		bShow = 0;
		--下列
		[1] = {
			title = "DuiHuan_ShengDanShu.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
				--CUIFestival:DoOpen(2,1,dwIndex)
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 5809556,
				--兑换消耗数量
				amount = 9,
				--兑换获得道具id
				gain = 4900176,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 5809556,
				--兑换消耗数量
				amount = 99,
				--兑换获得道具id
				gain = 4900177,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[3] = {
				--兑换消耗道具id
				convert = 5809556,
				--兑换消耗数量
				amount = 999,
				--兑换获得道具id
				gain = 4900178,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},

		},
		
		

	};	
	
	--页签5
	[5] = {
	--上列
		bShow = 0;
		--下列
		[1] = {
			title = "DuiHuan_HuaDeng.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
				--CUIFestival:DoOpen(2,1,dwIndex)
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 9,
				--兑换获得道具id
				gain = 7400008,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 9,
				--兑换获得道具id
				gain = 7400009,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[3] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 9,
				--兑换获得道具id
				gain = 7400010,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[4] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 29,
				--兑换获得道具id
				gain = 7400011,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[5] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 29,
				--兑换获得道具id
				gain = 7400012,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},			

		},
		--下列
		[2] = {
			title = "DuiHuan_HuaDeng.png",
			--容错图片
			mistakenPic = "999_1.png",
			--未开放图片
			unOpenPic = "WeiKaiFang.png",
			--未开放描述
			character = 3000150001,  --对应_G.SysStringConfigInfo
			clickFunc =  function()
			end	;
			[1] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 29,
				--兑换获得道具id
				gain = 7400013,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},	
			[2] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 999,
				--兑换获得道具id
				gain = 7400014,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},
			[3] = {
				--兑换消耗道具id
				convert = 7400004,
				--兑换消耗数量
				amount = 999,
				--兑换获得道具id
				gain = 7400015,
				--兑换获得数量
				gamount = 1,
				--兑换消耗
				--银子
				silver = 20000,
				--元宝
				valuable = 0,
				--礼金
				gift = 0,
				--真气
				water = 0,
			},			
		};		
		

	};	
}