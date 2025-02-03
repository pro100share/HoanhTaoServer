--登陆界面配置
_G.CrossSvrLoginConfig = {
	Text = {
			Time  = "每周一晚20:00-21:00";--每周1晚"20:00"~"21:00"
			beibaoTishi = "<font color='4fd388	'>战场内获得的荣誉令牌会自动转换为荣誉值，在跨服战场中购买后未使用的道具，将在您离开时自动转换为您所花费的货币返还到包裹中。</font>";--背包提示
			Rule  = "1.战斗力达10W的侠士便可通过【群雄争霸】去冰火岛参加跨服战<br/>2.在冰火岛上，您可击杀其他侠士以获取荣誉值，当击杀数达到100上限后，将无法再通过击杀其他侠士获得荣誉值。您可通过击杀战场BOSS、宝箱获取荣誉令牌，此令牌可自动转换为对应额度的荣誉<br/>3.屠龙宝刀将在【群雄争霸】开启十分钟后出现在冰火岛中心地带，夺得并持有屠龙刀20分钟即可成为当届屠龙宝刀之主；若无人达成该条件，那么屠龙刀将选择最后一位持有它至战场结束的侠士作为它当届之主。<br/>4.活动时间内，屠龙刀只可存在于冰火岛中心地带，若其持有者将它带离该区域，则屠龙刀将自动返回中心地带，重新择主。<br/>5.在跨服战场中购买后未使用的道具，将在您离开战场时自动转换为您所花费的货币返还到包裹中。";--玩法说明
			ShopTips = "<font color='#FFFF00'>点击按钮打开荣誉商城</font>";--荣誉商城tips
			RankTips = "排行榜即将开放，敬请期待！";--排行榜Tips
			RuleTips = "<font color='#FFFF00'>点击查看群雄争霸详细玩法</font>";--玩法说明Tips
			PlayTips = "<font color='#FFFF00'>点击按钮立即参加</font>";--开始战斗Tips
			BatPower = "当前战斗力：%d";--当前战斗力：999999999
			HonorValue = "当前荣誉点数：%d";--当前荣誉点数：999999999
			Line	 = "跨服战线路%d";--跨服战服务器1,2,3,4,5,6
			MallTips = "</p><font color='#cdc6c4'>商店</font><font color='#31cf32'>（O）</font></p>";--战场商店tips
			RoleTips = "</p><font color='#cdc6c4'>人物属性</font><font color='#31cf32'>（C）</font></p>";--人物tips
			SkillTips = "</p><font color='#cdc6c4'>技能</font><font color='#31cf32'>（K）</font></p>"; -- 技能Tips
			PackTips = "</p><font color='#cdc6c4'>包裹</font><font color='#31cf32'>（B）<br/>自动拾取快捷键（Z）</p>";--背包tips
			IsNotInRank = "未上榜";--跨服排行自己不在排行榜
			IsNoCan1   = "您的战斗力不足，无法参加"; --条件没有达到
			IsNoCan2   = "跨服战场尚未开启"; -- 没有跨服战开启
			IsNoCan3   = "战场中无法使用此功能";--战场屏蔽功能
			IsNoCan4   = "该战场线路正在维护，请您选择其他线路";--服务器在维护，请选择其他服务器
			IsNoCan5   = "请大侠稍安勿躁，返回战场倒计时结束后方可进入";--请稍后再进跨服战场
			CrossFail1 = "跨服战场尚未开启"; -- 跨服战场未开启
			CrossFail2 = "战场参战时间已截止，无法进入"; -- 进入活动已结束
			CrossFail3 = "该战场线路人数已达上限，无法进入"; -- 跨服战场人数已满
			CrossFail4 = "请求进入的跨服战场与之前不一致"; --请求进入的跨服战场与之前不一致
			CrossFail5 = "您的战斗力不足，无法参加"; --进场时间结束
			TimeTips1 = "战场结束倒计时"; -- 战场结束倒计时
			TimeTips2 = "Boss刷新倒计时"; -- boss刷新倒计时
			TimeTips3 = "宝箱刷新倒计时"; -- 宝箱刷新倒计时
			TimeTips4 = "屠龙刀刷新倒计时"; --屠龙刀倒计时
			BoText    = "第%d波";--第几波
			linetext1  = "<font color='#4fd388'>流畅</font>";--线路人数字
			linetext2  = "<font color='#FF9912'>拥挤</font>";--线路人数字
			linetext3  = "<font color='#FF0000'>爆满</font>";--线路人数字
			linetext4  = "<font color='#C0C0C0'>维护</font>";--线路人数字
			NoticeTips = "<font color='#FFFF00'>持有屠龙刀20分钟即可成为当届屠龙宝刀之主！</font>";--屠龙刀buff图标Tips
			Limitstr = "<font color='#FF0000'>返回战场倒计时%s</font>";--退出战场后倒计时
			};
	Img = {
		--结算界面图片
		EndInfo = 
		{	
			{"Img://Icon_item_2500230_1.png","参战精英"};
			{"Img://Icon_gf_xuemogong_1.png","杀敌大神"};
			{"Img://TuLongDao.png","屠龙宝刀之主"};
		};
		NoticeIcon = "Img://TuLongDao.png";  --屠龙刀buff图标
	};
	---退出战场后再进跨服时间限制
	LimitTime = 30; -- 秒
	--根据服务器人数返回服务器图片
	--dwNum人数
	GetSevInfoImg = function(dwNum)
		local dwIndex = 0
		if dwNum < 50 then
			dwIndex = 1
		elseif dwNum < 100 then
			dwIndex = 2
		elseif dwNum <= 150 then
			dwIndex = 3
		end
		return CrossSvrLoginConfig.Text["linetext"..dwIndex]
	end;
	--根据获取荣誉值获得图片
	--EndInfo[1] = Exp;              --经验
	-- EndInfo[2] = Honor;		--荣誉值
	-- EndInfo[3] = KillNum;	--杀人数
	-- EndInfo[4] = Rank;		--排名
	-- EndInfo[5] = (HoldId == CPlayerSystem:GetPlayer():GetInfo().dwRoleID); -- 是否拥有屠龙刀
	--
	GetEndInfoImg = function(EndInfo)
		local dwIndex = 0
		if EndInfo[5] then
			dwIndex = 3
		elseif EndInfo[3] < 30 then
			dwIndex = 1
		else 
			dwIndex = 2
		end
		return CrossSvrLoginConfig.Img.EndInfo[dwIndex]
	end;
	-------------界面模型配置-------------------
	AvatarRect	= {x = 650, y = 450};
	--阶数
	model = {	
		sknFile = "A_Equip_TuLongDao.skn"; sklFile="A_Equip_TuLongDao.skl"; sanFile ="A_Equip_TuLongDao_XiuXian.san"; param_1_x = 0; param_1_y = -3.5; param_1_z = 0;param_2_x = 0; param_2_y = 0; param_2_z = 0; lieAction = "A_Equip_TuLongDao_DaiJi.san"; 
	},
	action = {{pfxId = 100069,bindPos ="bone01"},{pfxId = 0,bindPos ="tx1"}},
	
	-------------------------------------------------------------------------
}
_G.DuLongDaoModel = {
		dwLookID = 87; --模型ID
		[1] = {x=-12,y=14,dir=2.0};--屠龙刀坐标
		name_size = 0.095;  --名字大小
		name_textcolor = 0xFF53C353;--名字颜色   0xFFA9CE9E  0xFFBFDF57
		name_edgeColor = 0xFF000000;--名字边框颜色   0xAF928E54   0x00BFDF57
		pfxId = 870001;
		fSclValue = 3;   --模型大小因数
		Name = {
				x = 0; -- 名字与模型的间隔
				y = 3;
				z = 1;
				_x = 0;	-- 名字与名字的间隔	
				_y = -0.15;
				_z = 0.015;
			};
};