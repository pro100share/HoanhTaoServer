
--[[
	--炼制丹药Config

--]]

--炼丹说明config
_G.RefiningMaterialIntrConfig = {
	[1] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>百花露，地脉根，千金骨，风行草</font><font color='#cdc6c4' size='14'>四种材料可炼制</font><font color='#278cf1' size='14'>坐骑资质丹</font><br /><font color='#cdc6c4' size='14'>2.每次炼制失败材料有几率随机返还</font><br />",
	[2] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>紫钧元,千纸鹤</font><font color='#cdc6c4' size='14'>两种材料可炼制</font><font color='#278cf1' size='14'>1品金鳞甲片</font><br />",
	[3] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>1品金鳞甲片,亮银沙</font><font color='#cdc6c4' size='14'>两种材料可炼制</font><font color='#278cf1' size='14'>2品金鳞甲片</font><br />",
	[4] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>2品金鳞甲片,强化石</font><font color='#cdc6c4' size='14'>两种材料可炼制</font><font color='#278cf1' size='14'>3品金鳞甲片</font><br />",
	[5] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>3品金鳞甲片,亮银沙</font><font color='#cdc6c4' size='14'>两种材料可炼制</font><font color='#278cf1' size='14'>4品金鳞甲片</font><br />",
	[6] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>完美属性卷轴</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>无双属性卷轴</font><br />",
	[7] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>无双属性卷轴</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>传说属性卷轴</font><br />",
	[8] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>传说属性卷轴</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>真武属性卷轴</font><br />",
	[9] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>真武属性卷轴</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>神威属性卷轴</font><br />",
	[10] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>剑魂石,元气通神酒·中</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>天外陨铁</font><br />",
    [11] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>索魂丹碎片</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>索魂丹</font><br />",
	[12] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>易筋经注碎片</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>易筋经注</font><br />",
	[13] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>紫微星图碎片</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>紫微星图</font><br />",
	[14] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>神威属性卷轴</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>传世属性卷轴</font><br />",
	[15] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>金筋散碎片</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>金筋散</font><br />",
	[16] = "<font color='#cdc6c4' size='14'>1.聚齐</font><font color='#31cf32' size='14'>红泉丹砂碎片</font><font color='#cdc6c4' size='14'>可炼制</font><font color='#278cf1' size='14'>红泉丹砂</font><br />",
}

--炼制结果文字配置
_G.RefineResTips = {
	szText = "<font color='#cdc6c4'>大侠本次炼制</font><font color='#31cf32'>成功%d次</font>，<font color='#FF0000'>失败%d次</font>",
	szFormat = "<font color='%s'>%s × %d</font>",
	szNotBack = "<font color='#ca9754'>无返回材料</font>",
}

--[[
--炼制成的丹药信息
_G.MedicineInfoConfig = {
	[9405040] = {image = "999_1.png",},
}

--炼制原料的信息
_G.MaterialInfoConfig = {
	[4902003] = {image = "999_0.png",imageCol = "999_1.png",},
	[4902004] = {image = "999_0.png",imageCol = "999_1.png",},
	[4902005] = {image = "999_0.png",imageCol = "999_1.png",},
	[4902006] = {image = "999_0.png",imageCol = "999_1.png",},
}
--]]
--炼制丹药类型配置
--[1]:玩家选择炼制类型
_G.MedicineTypeConfig = {
	[1] = {id = 9405040,num = 1,authority = 'Mount',},
	[2] = {id = 4100421,num = 1,authority = 'Amulet',},
	[3] = {id = 4100422,num = 1,authority = 'Amulet',},
	[4] = {id = 4100423,num = 1,authority = 'Amulet',},
	[5] = {id = 4100424,num = 1,authority = 'Amulet',},
	[6] = {id = 5950031,num = 1,authority = '',},
	[7] = {id = 5950032,num = 1,authority = '',},
	[8] = {id = 5950033,num = 1,authority = '',},
	[9] = {id = 5950034,num = 1,authority = '',},
	[10] = {id = 4100454,num = 1,authority = '',},
	[11] = {id = 2500341,num = 1,authority = 'XueMoGong',},
	[12] = {id = 2500343,num = 1,authority = 'YiJinJing',},
	[13] = {id = 2500345,num = 1,authority = 'MatrixMethod',},
	[14] = {id = 5950035,num = 1,authority = '',},
	[15] = {id = 2500347,num = 1,authority = 'LronCloth',},
	[16] = {id = 2500359,num = 1,authority = 'PractiseSkill',},	
}
--新加分类父节点配置
_G.MedicinePageConfig = {
	--[顺序]  = {sName = 分类名字；tType = {对应MedicineTypeConfig中序号}}
	[1] = {sName = "坐骑资质丹";tType = {1}};
	[2] = {sName = "金鳞甲片";tType = {2,3,4,5}};
	[3] = {sName = "属性卷轴";tType = {6,7,8,9,14}};
	[4] = {sName = "天外陨铁";tType = {10}};
	[5] = {sName = "索魂丹";tType = {11}};
	[6] = {sName = "易筋经注";tType = {12}};
	[7] = {sName = "紫微星图";tType = {13}};
	[8] = {sName = "金筋散";tType = {15}};
	[9] = {sName = "红泉丹砂";tType = {16}};	
}

-- 炼丹配置
_G.RefineMaterialConfig = 
{
	-- 坐骑资质丹
	[9405040] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 5000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 4902003, num = 1, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
			{item = 4902004, num = 1, quanzhong = 500, isBind = 1};
			{item = 4902005, num = 1, quanzhong = 500, isBind = 1};
			{item = 4902006, num = 1, quanzhong = 500, isBind = 1};
		};
	};
	-- 一品金鳞甲片
	[4100421] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 4100420, num = 3, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
			{item = 4100010, num = 1, quanzhong = 500, isBind = 1};
		};
	};
		
	-- 二品金鳞甲片
	[4100422] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 4100421, num = 3, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
			{item = 4100080, num = 1, quanzhong = 500, isBind = 1};
		};
	};
	-- 三品金鳞甲片
	[4100423] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 4100422, num = 3, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
			{item = 4100140, num = 2, quanzhong = 500, isBind = 1};
		};
	};
	-- 四品金鳞甲片
	[4100424] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 4100423, num = 3, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
			{item = 4100080, num = 3, quanzhong = 500, isBind = 1};
		};
	};	
	-- 无双属性卷轴
	[5950031] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 5950030, num = 2, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
		};
	};
	-- 传说属性卷轴
	[5950032] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 5950031, num = 2, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
		};
	};
	-- 真武属性卷轴
	[5950033] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 5950032, num = 2, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
		};
	};
	-- 神威属性卷轴
	[5950034] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 5950033, num = 2, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
		};
	};
	-- 天外陨铁
	[4100454] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 5000;		-- 炼制成功率 
		backKindCount = 5;			-- 返回材料个数

		material = 
		{
			{item = 4100110, num = 10, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
	        {item = 2500081, num = 2, quanzhong = 0, isBind = 1};		
		};
	};
	-- 索魂丹
	[2500341] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 1;			-- 返回材料个数

		material = 
		{
			{item = 2500342, num = 10, quanzhong = 1000, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)		
		};
	};
	-- 易筋经注
	[2500343] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 1;			-- 返回材料个数

		material = 
		{
			{item = 2500344, num = 10, quanzhong = 1000, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)		
		};
	};
	-- 紫微星图
	[2500345] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 1;			-- 返回材料个数

		material = 
		{
			{item = 2500346, num = 10, quanzhong = 1000, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)		
		};
	};
	-- 神威属性卷轴
	[5950035] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 5950034, num = 2, quanzhong = 500, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
		};
	};
	-- 金筋散
	[2500347] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 2500348, num = 10, quanzhong = 1000, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
		};
	};
	-- 红泉丹砂
	[2500359] = 
	{
		Notice = 0;					-- 炼制成功后 是否需要广播 0 不需要  字符串 (播放字符串内容)
		successRate = 10000;		-- 炼制成功率 
		backKindCount = 2;			-- 返回材料个数

		material = 
		{
			{item = 2500360, num = 10, quanzhong = 1000, isBind = 1};			-- 材料 1     枚举ID   数量  权重(制作失败返回材料的权重)
		};
	};
	
	--丹药炼制失败时 计算返还材料
	BackMaterial = function(itemEnumId)
		if not RefineMaterialConfig[itemEnumId] then return end
		
		local materials = RefineMaterialConfig[itemEnumId].material;
		if not materials then return end
		
		local totalWeight = 0;
		for _,v in pairs(materials) do
			totalWeight = totalWeight + v.quanzhong;
		end 
		
		local weightPro = math.random(1, totalWeight);
		local curWeight = 0;
		
		for _,v in pairs(materials) do
			curWeight = curWeight + v.quanzhong;
			if weightPro <= curWeight then
				return v.item, v.isBind;
			end
		end 
	end;	 
}

--Avartar配置文件
_G.StoveSysAvatarConfig = {
	ActTime		= 1;--动作次数
	NpcLookID	= 1109;
	NpcIdelID	= 110901;
	NpcActID	= 110981;
	NpcSucID	= 110982;
	NpcFailID	= 110983;
	Range		= _Vector2.new(800, 800);
	Eye			= _Vector3.new(0,-9,1.8);
	Look		= _Vector3.new(0,0,0);
}

--合成提示
_G.ComposePanelMsgConfig = 
{
	UseBindMeterialMsg = "<font color='#FF0000'>使用绑定材料炼制,则炼制成功后,该物品会变为绑定状态</font>",
	eNoEmptySlot = "<font color='#FF0000'>您的包裹中没有空位,不能进行炼制丹药操作</font>",
	BreakCompose = "<font color='#FF0000'>炼制中断</font>",
	RefineFail = "<font color='#FF0000'>炼制失败</font>",
	inputErr = "<font color='#FF0000'>输入数量不正确，炼制数量不能为0或空</font>",
	noMaterial = "<font color='#FF0000'>您包裹中的炼制材料不足，无法炼制</font>",
	noMedicine ="<font color='#FF0000'>您包裹中的坐骑资质丹不足，无法给坐骑服用</font>",
	BroadCastInfo = "玩家<font color='#ca9754'>%s</font>本次炼制<font color='#ca9754'>%d</font>颗<font color='#ca9754'>%s</font>",
}

--背包中需要禁止点击调出熔炉界面的材料
_G.NeedForbidMaterials = {
	[1] = 4100080,
	[2] = 5950030,
	[3] = 5950031,
	[4] = 5950032,
	[5] = 5950033,
    [6] = 5950034,
	[7] = 2500081,
	[8] = 5950035,
}