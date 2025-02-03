----邮件信息
_G.SMailInfo = {};

SMailInfo.life = 15;--邮件生命周期

function SMailInfo:new( t )
	local obj = t or {};
	obj.dwMailID = 0;		--邮件的ID
	obj.dwSender = 0;		--邮件发送者的ID
	obj.dwReceiver = 0;		--邮件接受者
	obj.strSender = "";		--邮件发送者姓名
	obj.strReceiver = "";	--邮件接收者姓名
	obj.strTopic = "";		--邮件的主题
	obj.strContent = "";	--邮件的内容
	obj.dwReceiveTime = 0;	--邮件接收的时间
	obj.dwLifeTime = 0;		--邮件的生命周期，单位毫秒
	obj.dwGold = 0;			--携带的元宝
	obj.dwBindGold = 0;		--携带的礼金
	obj.dwMoney = 0;		--携带的银两
	obj.dwItemID1 = "";		--记录物品信息，没有则为0
	obj.dwItemID2 = "";		--记录物品信息，没有则为0
	obj.dwItemID3 = "";		--记录物品信息，没有则为0
	obj.dwItemID4 = "";		--记录物品信息，没有则为0
	obj.dwItemID5 = "";		--记录物品信息，没有则为0
	obj.dwItemState = 0;	--记录物品是否已经领取，0是未领取，1是已领取
	obj.dwReadState = 0;	--记录邮件读的状态，0是未读，1是已读
	
	obj.setItems = {};		--记录物品具体的数据， SItemMessage 对象
	return obj;
end
--邮件过期提醒的图标
_G.NotifyMailOutOfDateIcon = "Icon_other_haoyou.png";
_G.MailBackSystemName = "系统";

--[[发送的邮件物品配置表，邮件系统开出新接口，只需要传入邮件配置ID，该邮件直接发送
--ID编号规则   系统大类+系统子类+邮件序号    例如：每日活动邮件ID 900050001
  --系统大类  
  
    登陆 = 100
    战斗 = 200
    人物属性 = 300
    装备道具相关 = 400
    技能相关 = 500
    交互相关 = 600
    坐骑相关 = 700
    异兽相关 = 800
    任务相关 = 900
    地图相关 = 1000
    NPC相关  = 1100
    增值相关 = 1200
    功能类系统 = 1300
  系统子类
  按照AB上的编号设置系统子类]]

_G.AutoMailSendConfig = 
{
-----每日活动签到发送邮件
    [900050001] = 
	{
		id = 900050001;
		sender = "系统邮件";--发件人
		sender_id = 10086;---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "签到奖励";
		content = "每日签到成功就送演武收益丹，演武时使用可加快获得收益速度";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = { 
			[2400260]={
				num = 1;
				bind = 1;--1是绑定，0是非绑定
			},
		};--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	
------普通藏宝图掉落邮件
	[5600010] = 
	{
		id = 5600010;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "签到奖励";
		content = "每日签到成功就送演武收益丹，演武时使用可加快获得收益速度";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[2400260]={
				num = 1;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	
------绿色藏宝图掉落邮件
	[5600020] = 
	{
		id = 5600020;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "宝藏奖励";
		content = "测试啦测试啦测试啦";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[2400260]={
				num = 1;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	
	------蓝色藏宝图掉落邮件
	[5600030] = 
	{
		id = 5600030;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "签到奖励";
		content = "每日签到成功就送演武收益丹，演武时使用可加快获得收益速度";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[2400260]={
				num = 1;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	------紫色藏宝图掉落邮件
	[5600040] = 
	{
		id = 5600040;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "签到奖励";
		content = "每日签到成功就送演武收益丹，演武时使用可加快获得收益速度";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[2400260]={
				num = 1;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	
	
	------青云蜀道第一名奖励
	[13009000] = 
	{
		id = 13009000;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "青云蜀道";
		content = "青云蜀道第一名队伍奖励";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[4900107]={
				num = 68;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	
	------青云蜀道第二名奖励
	[13009001] = 
	{
		id = 13009001;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "青云蜀道";
		content = "青云蜀道第二名队伍奖励";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[4900107]={
				num = 48;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};	
	------青云蜀道第三名奖励
	[13009002] = 
	{
		id = 13009002;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "青云蜀道";
		content = "青云蜀道第三名队伍奖励";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[4900107]={
				num = 38;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};	
	
	------青云蜀道参与奖励
	[13009003] = 
	{
		id = 13009003;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "青云蜀道";
		content = "青云蜀道参与奖";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[4900107]={
				num = 18;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};	
	
	
	------戏说天下奖励
	[13009100] = 
	{
		id = 13009100;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "戏说天下";
		content = "戏说天下参与奖";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[4100410]={
				num = 1;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};	
	
	------桃花迷阵第一名奖励
	[13009101] = 
	{
		id = 13009101;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "桃花迷阵";
		content = "桃花迷阵第一名奖励";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[5809328]={
				num = 5;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};	
	------桃花迷阵第2名奖励
	[13009102] = 
	{
		id = 13009102;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "桃花迷阵";
		content = "桃花迷阵第二名奖励";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[5809328]={
				num = 3;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};	
	------桃花迷阵第3名奖励
	[13009103] = 
	{
		id = 13009103;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "桃花迷阵";
		content = "桃花迷阵第三名奖励";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[5809328]={
				num = 2;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};	
	------桃花迷阵参与奖
	[13009104] = 
	{
		id = 13009104;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "桃花迷阵";
		content = "桃花迷阵参与奖";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{[5809328]={
				num = 1;
				bind = 1;--1是绑定，0是非绑定
				},
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
	};
	--------------------世家家主被弹劾后收到邮件提醒
	[6000101] = 
	{
		id = 6000101;
		sender = "系统邮件";--发件人
		sender_id = "10086";---运营用的
		lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		topic = "弹劾家主";
		content = "由于您离线时间过长，已被世家成员弹劾，家主职位已被罢免。";
		gold = 0;
		bindgold = 0;
		money = 0;
		item = 	{
			},
		--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		};
		
	};
	-- --玩家首次进入游戏 元宝邮件
	-- [900050002] = 
	-- {
		-- id = 900050002;
		-- sender = "系统邮件";--发件人
		-- sender_id = "10086";---运营用的
		-- lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		-- topic = "首登奖励";
		-- content = "奖励元宝";
		-- --元宝
		-- gold = 10000;
		-- --礼金
		-- bindgold = 0;
		-- --银子
		-- money = 0;
		-- item = { 
		-- --[[
			-- --物品配置ID 
			-- [2400260]={
				-- --数量
				-- num = 1;
				-- --绑定类型
				-- bind = 1;--1是绑定，0是非绑定
			-- },
			-- --]]
		-- };--ID 和 数量
		-- --装备
		-- equip = 
		-- {--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		-- };
		
	-- };
	-- --玩家首次进入游戏 银两邮件
	-- [900050003] = 
	-- {
		-- id = 900050003;
		-- sender = "系统邮件";--发件人
		-- sender_id = "10086";---运营用的
		-- lifetime = SMailInfo.life*24*3600*1000;--15天，生命周期
		-- topic = "首登奖励";
		-- content = "奖励银子";
		-- --元宝
		-- gold = 0;
		-- --礼金
		-- bindgold = 0;
		-- --银子
		-- money = 10000;
		-- item = { 
		-- --[[
			-- --物品配置ID 
			-- [2400260]={
				-- --数量
				-- num = 1;
				-- --绑定类型
				-- bind = 1;--1是绑定，0是非绑定
			-- },
			-- --]]
		-- };--ID 和 数量
		-- --装备
		-- equip = 
		-- {--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面

		-- };
		
	-- };


};
--[[[1001] = 
	{
		id = 1001;
		sender = "王康兴";
		sender_id = "10086";
		lifetime = 15*24*3600;--15天
		topic = "主题";
		content = "内容";
		gold = 10;
		bindgold = 20;
		money = 0;
		item = { [53140001]=10,  };--ID 和 数量
		equip = 
		{--依次往下，最多能发5个物品，总共只能发5个，装备会排在物品前面
			[53140001] = 
			{
				setProperty = 
				{
					--人物附加属性ID和附加属性数值百分比（0~100W）
					{
						dwPropertyType = 1;
						dwValue = 500000;
					};
					{
						dwPropertyType = 2;
						dwValue = 700000;
					};
				};--
				dwStrong = 0;--强化数据0~15
				dwBingHun = 0;--冰魂数据0~100W
				bind = 1;--1是绑定，0是非绑定
			};
		};
	};--]]






