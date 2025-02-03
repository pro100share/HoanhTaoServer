_G.enumGuideBookLinkType = 
{
	OpenPannel = 1,--打开界面
	FindPath = 2,--寻路
	Charge = 3,	--充值
}

---星星配置
local base = "<img src = 'img://Help_star.png'>";
_G.GuideBookImgConfig = 
{
	[1]  = string.rep(base, 1) ,
	[2]  = string.rep(base, 2),
	[3]  = string.rep(base, 3),
	[4]  = string.rep(base, 4),
	[5]  = string.rep(base, 5),
}
function _G.InitGuideBookConfig()
_G.GuideBookLevelLimit = 
{
	[1] = {	dwLevelDown = 1,dwLevelUp = 20,},
	[2] = {	dwLevelDown = 21,dwLevelUp = 40,},
	[3] = {	dwLevelDown = 41,dwLevelUp = 60,},
}
_G.GuideBookConfig = 
{
	dwLevel = 200,
}
_G.GuideBookStrConfig = 
{
	---少侠攻略
	[1] = 
	{
---1-20级引导
	[1] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.主线任务升级快</font><br/>"..
	"<font color='#dcb857'>新手阶段完成主线任务轻松升到20级</font>"..
	-- ------小标题2	
	-- --[["<font color='#4daeed' size='14'>2.新系统功能开放</font><br/>"..	
	-- "<font color='#dcb857'>五行系统(5级)<font color='#d9ccbd'><br/>提升五行可加快真气恢复速度和额外属性加成</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."    "..
	-- "<U><font color='#0dab01'>"..'我的五行'.."</font></U></a><br/>"..--2]]
	
	-- "<font color='#dcb857'>奇经八脉(12级)<font color='#d9ccbd'><br/>打通经脉可获得属性加成和高额的经验奖励</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIRole:OpenPanel(3)'.."'>".."      "..
	-- "<U><font color='#0dab01'>"..'我的经脉'.."</font></U></a><br/>"..--2
	
	-- "<font color='#dcb857'>装备强化(12级)<font color='#d9ccbd'><br/>可让您的装备属性提升，为您打造顶级装备</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."      "..
	-- "<U><font color='#0dab01'>"..'我要强化'.."</font></U></a><br/>"..--2
	
	-- "<font color='#dcb857'>坐骑系统(完成获赠坐骑任务)<font color='#d9ccbd'><br/>拥有一匹坐骑，对您的属性大有增益</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMountSystem:DoMountsOper()'.."'>".."            "..
	-- "<U><font color='#0dab01'>"..'我的坐骑'.."</font></U></a><br/>"..--2
	
	--[["<font color='#dcb857'>兵魂强化(18级)<font color='#d9ccbd'><br/>可提升装备基础属性，为您打造满兵魂装备</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIEquipIntensify:Open(3)'.."'>".."      "..
	"<U><font color='#0dab01'>"..'我要强化'.."</font></U></a><br/>"..--2]]

	------小标题2
	"<img src = 'img://Help_line.png'>"..
	"<font color='#4daeed' size='14'>2.新地图开放</font><br/>"..	
	"<font color='#dcb857'>襄阳城(10级)<font color='#d9ccbd'><br/>您可以在这里找到和您一起闯荡武林的兄弟</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(6)..','..(3).."'>".."      "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2
	"<font color='#dcb857'>襄阳野郊(10级)<font color='#d9ccbd'><br/>这里将是您称霸武林之路的起点</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1003)..','..(54)..','..(81).."'>".."                "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--2
	

---20~40级引导
	[2] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.新副本开放</font><br/>"..
	"<font color='#dcb857'>演武节堂(20级)<font color='#d9ccbd'><br/>在这里可以拿到大量经验</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-24).."'>".."                      "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2

	"<font color='#dcb857'>珍珑棋局(25级)<font color='#d9ccbd'><br/>在这里挑战BOSS，可拿到大量神秘奖励</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-24).."'>".."          "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2
	
	"<font color='#dcb857'>大破联营(35级)<font color='#d9ccbd'><br/>您可以在这里挑战BOSS，拿商城道具</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-24).."'>".."            "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2	
	
	"<font color='#dcb857'>烽火辎路(40级)<font color='#d9ccbd'><br/>在这里可以获得大量银两</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-24).."'>".."                      "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2
   

	
	-- ------小标题2	
	-- "<img src = 'img://Help_line.png'><br/><br/>"..
	-- "<font color='#4daeed' size='14'>2.新系统功能开放</font><br/>"..	
	-- "<font color='#dcb857'>结婚系统(20级)<font color='#d9ccbd'><br/>选定您心仪之人，携手闯荡武林</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMarriageSystem:DoMarryOper()'.."'>".."                "..
	-- "<U><font color='#0dab01'>"..'我的伴侣'.."</font></U></a><br/>"..--2
	
				
	-- "<font color='#dcb857'>实战境界(22级)<font color='#d9ccbd'><br/>修炼实战境界，成为一代武尊</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIRole:OpenPanel(2)'.."'>".."                  "..
	-- "<U><font color='#0dab01'>"..'我的实战'.."</font></U></a><br/>"..--2
	
	
	-- "<font color='#dcb857'>世家系统(25级)<font color='#d9ccbd'><br/>组成世家，与兄弟一起争霸武林</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CGuildSystem:ShowGuildMain()'.."'>".."                "..
	-- "<U><font color='#0dab01'>"..'我的世家'.."</font></U></a><br/>"..--2
	
	-- "<font color='#dcb857'>护身宝甲(完成XXX任务)<font color='#d9ccbd'><br/>拥有一件宝甲，可以让您的实力倍增</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CAmuletSystem:Show()'.."'>".."            "..
	-- "<U><font color='#0dab01'>"..'我的宝甲'.."</font></U></a><br/>"..--2
	
	-- "<font color='#dcb857'>装备炼制(26级)<font color='#d9ccbd'><br/>26级以前开放全部装备炼制相关功能</font>"..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."            "..
	-- "<U><font color='#0dab01'>"..'我要炼制'.."</font></U></a><br/>"..--2
	
	------小标题3
	"<img src = 'img://Help_line.png'>"..
	"<font color='#4daeed' size='14'>2.新地图开放</font><br/>"..	
	"<font color='#dcb857'>桃花岛(20级)<font color='#d9ccbd'><br/>20~30级挂机地点</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1004)..','..(13)..','..(-91).."'>".."                             "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2
	"<font color='#dcb857'>绝情密涧(30级)<font color='#d9ccbd'><br/>30~40级挂机地点</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1005)..','..(-18)..','..(48).."'>".."                             "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--2

---40~60级引导
	[3] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.新副本开放</font><br/>"..
	"<font color='#dcb857'>五行道场(50级)<font color='#d9ccbd'><br/>您可以在这里拿到大量真气丹药</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-24).."'>".."                "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2	

	"<font color='#dcb857'>守卫襄阳(55级)<font color='#d9ccbd'><br/>50级在这里可以拿到大量经验</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-24).."'>".."                  "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2	
	
	------小标题3
	"<img src = 'img://Help_line.png'>"..
	"<font color='#4daeed' size='14'>2.新地图开放</font><br/>"..	
	"<font color='#dcb857'>大理(40级)<font color='#d9ccbd'><br/>40~50级挂机地点</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1006)..','..(-2)..','..(-99).."'>".."                             "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>"..--2
	"<font color='#dcb857'>白驼山(50级)<font color='#d9ccbd'><br/>50~60级挂机地点</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1007)..','..(-99)..','..(29).."'>".."                             "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--2

---25级引导		
	[4] = 
	------小标题2
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.我可以玩什么？</font><br/>"..
	
	"<font color='#dcb857'>五行系统：<font color='#d9ccbd'>五行等级越高，真气恢复速度越快</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."  "..
	"<U><font color='#0dab01'>"..'提升五行'.."</font></U></a><br/>"..--1
	
	"<font color='#dcb857'>装备强化：<font color='#d9ccbd'>通过炼制可增强装备属性</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."          "..
	"<U><font color='#0dab01'>"..'装备强化'.."</font></U></a><br/>"..--2
	------小标题3
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.新地图开放</font><br/>"..
	"<font color='#dcb857'>襄阳城<font color='#d9ccbd'>更多伙伴在这里等你来</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1001)..','..(10)..','..(10).."'>".."        "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--3

---30级引导		
	[5] = 
	------小标题2
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.我可以玩什么？</font><br/>"..
	
	"<font color='#dcb857'>五行系统：<font color='#d9ccbd'>五行等级越高，真气恢复速度越快</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."  "..
	"<U><font color='#0dab01'>"..'提升五行'.."</font></U></a><br/>"..--1
	
	"<font color='#dcb857'>装备强化：<font color='#d9ccbd'>通过炼制可增强装备属性</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."          "..
	"<U><font color='#0dab01'>"..'装备强化'.."</font></U></a><br/>"..--2
	------小标题3
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.新地图开放</font><br/>"..
	"<font color='#dcb857'>襄阳城<font color='#d9ccbd'>更多伙伴在这里等你来</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1001)..','..(10)..','..(10).."'>".."        "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--3

---35级引导		
	[6] = 
	------小标题2
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.我可以玩什么？</font><br/>"..
	
	"<font color='#dcb857'>五行系统：<font color='#d9ccbd'>五行等级越高，真气恢复速度越快</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."  "..
	"<U><font color='#0dab01'>"..'提升五行'.."</font></U></a><br/>"..--1
	
	"<font color='#dcb857'>装备强化：<font color='#d9ccbd'>通过炼制可增强装备属性</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."          "..
	"<U><font color='#0dab01'>"..'装备强化'.."</font></U></a><br/>"..--2
	------小标题3
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.新地图开放</font><br/>"..
	"<font color='#dcb857'>襄阳城<font color='#d9ccbd'>更多伙伴在这里等你来</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1001)..','..(10)..','..(10).."'>".."        "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--3

---40级引导		
	[7] = 
	------小标题2
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.我可以玩什么？</font><br/>"..
	
	"<font color='#dcb857'>五行系统：<font color='#d9ccbd'>五行等级越高，真气恢复速度越快</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."  "..
	"<U><font color='#0dab01'>"..'提升五行'.."</font></U></a><br/>"..--1
	
	"<font color='#dcb857'>装备强化：<font color='#d9ccbd'>通过炼制可增强装备属性</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."          "..
	"<U><font color='#0dab01'>"..'装备强化'.."</font></U></a><br/>"..--2
	------小标题3
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.新地图开放</font><br/>"..
	"<font color='#dcb857'>襄阳城<font color='#d9ccbd'>更多伙伴在这里等你来</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1001)..','..(10)..','..(10).."'>".."        "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--3

---45级引导		
	[8] = 
	------小标题2
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.我可以玩什么？</font><br/>"..
	
	"<font color='#dcb857'>五行系统：<font color='#d9ccbd'>五行等级越高，真气恢复速度越快</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."  "..
	"<U><font color='#0dab01'>"..'提升五行'.."</font></U></a><br/>"..--1
	
	"<font color='#dcb857'>装备强化：<font color='#d9ccbd'>通过炼制可增强装备属性</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."          "..
	"<U><font color='#0dab01'>"..'装备强化'.."</font></U></a><br/>"..--2
	------小标题3
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.新地图开放</font><br/>"..
	"<font color='#dcb857'>襄阳城<font color='#d9ccbd'>更多伙伴在这里等你来</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1001)..','..(10)..','..(10).."'>".."        "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--3

---50级引导		
	[9] = 
	------小标题2
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.我可以玩什么？</font><br/>"..
	
	"<font color='#dcb857'>五行系统：<font color='#d9ccbd'>五行等级越高，真气恢复速度越快</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."  "..
	"<U><font color='#0dab01'>"..'提升五行'.."</font></U></a><br/>"..--1
	
	"<font color='#dcb857'>装备强化：<font color='#d9ccbd'>通过炼制可增强装备属性</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMainPageSystem:DoRefineOper()'.."'>".."          "..
	"<U><font color='#0dab01'>"..'装备强化'.."</font></U></a><br/>"..--2
	------小标题3
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.新地图开放</font><br/>"..
	"<font color='#dcb857'>襄阳城<font color='#d9ccbd'>更多伙伴在这里等你来</font>"..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1001)..','..(10)..','..(10).."'>".."        "..
	"<U><font color='#0dab01'>"..'立即前往'.."</font></U></a><br/>",--3
	},
	
	---我要升级
	[2] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.闭关奖励天天领，大量经验和五行真气</font><br/>"..
	"<font color='#dcb857'>闭关奖励：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMuseSystem:DoRetreatOper()'.."'>".."            "..
	"<U><font size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--1
	------小标题2	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.打通经脉，经验属性双手拿</font><br/>"..
	"<font color='#dcb857'>打通经脉：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[3]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIRole:OpenPanel(3)'.."'>".."               "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--2
	------小标题3	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.绿色通道拿经验</font><br/>"..
	"<font color='#dcb857'>成为VIP：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIVip:Open()'.."'>".."           "..
	"<U><font size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--3
	------小标题4	
	-- "<img src = 'img://Help_line.png'><br/>"..
	-- "<font color='#4daeed' size='14'>4.天道酬勤，轻松获得大量经验</font><br/>"..
	-- "<font color='#dcb857'>日环任务：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(12)..','..(-39).."'>".."           "..
	-- "<U><font size='13'  color='#0dab01'>"..'前往'.."</font></U></a><br/>"..--4
	
	"<font color='#dcb857'>风云任务：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(12)..','..(-39).."'>".."              "..
	"<U><font size='13'  color='#0dab01'>"..'前往'.."</font></U></a><br/>"..--5

	
	"<font color='#dcb857'>演武节堂：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-22).."'>".."              "..
	"<U><font  size='13' color='#0dab01'>"..'前往'.."</font></U></a><br/>"..--7

	"<font color='#dcb857'>守卫襄阳：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-22).."'>".."              "..
	"<U><font  size='13' color='#0dab01'>"..'前往'.."</font></U></a><br/>"..--7
	
	------小标题5
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>5.每日活动，大量经验赠送</font><br/>"..
	"<font color='#dcb857'>每日双倍收益：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIMissionDaily:SetMovementSingle(2001)'.."'>".."       "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--8
	
	"<font color='#dcb857'>每周双倍收益：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIMissionDaily:SetMovementSingle(2005)'.."'>".."       "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--8
	
	"<font color='#dcb857'>恶人谷：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-29)..','..(-45).."'>".."             "..
	"<U><font  size='13' color='#0dab01'>"..'前往'.."</font></U></a><br/>",--7	
	
	-- "<font color='#dcb857'>野外BOSS：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIMissionDailyEx:OpenPanel(3)'.."'>".."              "..
	-- "<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>",--9


   	
	---我要变强
	[3] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.自我强化生生不息</font><br/>"..
	"<font color='#dcb857'>打通经脉：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIRole:OpenPanel(3)'.."'>".."        "..
	"<U><font size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--1

	--[["<font color='#dcb857'>提升五行：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[3]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."           "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--2]]

	"<font color='#dcb857'>突破境界：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIRole:OpenPanel(2)'.."'>".."     "..
	"<U><font  size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--3
	------小标题2	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.装备打造神勇无敌</font><br/>"..
	"<font color='#dcb857'>装备炼制：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIEquipIntensify:Open(1)'.."'>".."      "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--4
	
	
	
	------小标题3
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.商城道具、极品装备随手拿</font><br/>"..
	"<font color='#dcb857'>珍珑棋局：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-22).."'>".."      "..
	"<U><font  size='13' color='#0dab01'>"..'前往'.."</font></U></a><br/>"..--7
	
	"<font color='#dcb857'>大破联营：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-22).."'>".."      "..
	"<U><font  size='13' color='#0dab01'>"..'前往'.."</font></U></a><br/>"..--7
	 
	"<font color='#dcb857'>野外BOSS：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIMissionDailyEx:OpenPanel(3)'.."'>".."         "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>",--8
	
	---坐骑强化
	[4] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.打造极品坐骑闯天下</font><br/>"..
	"<font color='#dcb857'>坐骑升阶：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMountSystem:ShowMountUpGrade()'.."'>".."      "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--1

	-- "<font color='#dcb857'>能力强化：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMountSystem:ShowMountUpGrade()'.."'>".."      "..
	-- "<U><font  size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--2

	------小标题2	
	"<font color='#4daeed' size='14'>2.击杀BOSS就掉神龙果</font><br/>"..
	"<font color='#dcb857'>野外BOSS：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIMissionDailyEx:OpenPanel(3)'.."'>".."          "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>",--5
	
	---我要真气
	[5] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.轻松获得五行真气</font><br/>"..
	"<font color='#dcb857'>演武团练：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMartialSystem:DoRequestChange()'.."'>".."       "..
	"<U><font  size='13' color='#0dab01'>"..'演武'.."</font></U></a><br/>"..--1

	"<font color='#dcb857'>闭关奖励：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMuseSystem:DoRetreatOper()'.."'>".."          "..
	"<U><font  size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--2

	------小标题2	
	--[["<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.加快五行真气增长速度</font><br/>"..
	"<font color='#dcb857'>提升五行：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[3]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnVisiable()'.."'>".."              "..
	"<U><font  size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--3]]
	
	"<font color='#dcb857'>成为VIP： </font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIVip:Open()'.."'>".."           "..
	"<U><font  size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--4
	
	------小标题3	
	--[["<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.真气不够可调和</font><br/>"..
	"<font color='#dcb857'>五行调和：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIFiveElem:OnBalanceClick()'.."'>".."           "..
	"<U><font  size='13' color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--5]]

	------小标题4	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.真气丹药天天送</font><br/>"..
	"<font color='#dcb857'>五行道场：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-22).."'>".."        "..
	"<U><font  size='13' color='#0dab01'>"..'前往'.."</font></U></a><br/>",--6

	---我要赚钱
	[6] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.大量银两等你拿</font><br/>"..
	"<font color='#dcb857'>击杀飞贼：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIMissionDaily:SetMovementSingle(2002)'.."'>".."      "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--1

	"<font color='#dcb857'>烽火辎路：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.FindPath..','..(1002)..','..(-12)..','..(-22).."'>".."         "..
	"<U><font size='13'  color='#0dab01'>"..'前往'.."</font></U></a><br/>"..--2

	------小标题2	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.礼金大赠送，天天都能拿</font><br/>"..
	"<font color='#dcb857'>每日签到：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUIRewardCode:OnMainBtnClick()'.."'>".."       "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--3
	
	"<font color='#dcb857'>成就达成：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[4]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CAchievementSystem:Show()'.."'>".."          "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>",--4
	
	-- ------小标题3	
	-- "<img src = 'img://Help_line.png'><br/>"..
	-- "<font color='#4daeed' size='14'>3.快捷充值拿元宝，更多惊喜礼包等你拿</font><br/>"..
	-- "<font color='#dcb857'>我要充值：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	-- "<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.Charge.."'>".."       "..
	-- "<U><font size='13'  color='#0dab01'>"..'充值'.."</font></U></a><br/>",--5

	------小标题4	
	--[["<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>4.充值就有礼包拿，极品装备和丹药</font><br/>"..
	"<font color='#dcb857'>充值送礼：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..' CUIMissionDaily:OpenChargeInfoPannel()'.."'>".."       "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>",--6]]

	---我很无聊
	[7] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.轻松演武得真气</font><br/>"..
	"<font color='#dcb857'>演武团练：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CMartialSystem:DoRequestChange()'.."'>".."      "..
	"<U><font size='13'  color='#0dab01'>"..'演武'.."</font></U></a><br/>"..--1


	------小标题2	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.无聊寂寞，找朋友，结婚登记找老伴</font><br/>"..
	"<font color='#dcb857'>江湖关系：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CFriendPlatform:HandleRecommend(0)'.."'>".."       "..
	"<U><font size='13'  color='#0dab01'>"..'查看'.."</font></U></a><br/>"..--2
	
	
	------小标题3	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>3.成就PK，比比看</font><br/>"..
	"<font color='#dcb857'>成就PK： </font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CAchievementSystem:Show()'.."'>".."        "..
	"<U><font size='13'  color='#0dab01'>"..'成就PK'.."</font></U></a><br/>",--3

	---我要优化
	[8] = 
	------小标题1
	"<font color='#4daeed' size='14'>1.人满为患，轻松应对</font><br/>"..
	"<font color='#dcb857'>游戏显示设置：</font><font color='#d9ccbd'>推荐度  </font>"..GuideBookImgConfig[5]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUISettingSystem:ShowByType(2)'.."'>".."      "..
	"<U><font size='13'  color='#0dab01'>"..'设置'.."</font></U></a><br/>"..--1


	------小标题2	
	"<img src = 'img://Help_line.png'><br/>"..
	"<font color='#4daeed' size='14'>2.效果优化，让游戏更流畅</font><br/>"..
	"<font color='#dcb857'>游戏效果设置：</font><font color='#d9ccbd'>推荐度 </font>"..GuideBookImgConfig[3]..
	"<a href = 'asfunction:hrefevent,"..enumGuideBookLinkType.OpenPannel..','..'CUISettingSystem:ShowByType(3)'.."'>".."             "..
	"<U><font  size='13' color='#0dab01'>"..'设置'.."</font></U></a><br/>",--2]]
	

}
end
----dwGuildType:超链接类型，见上
----tParam:参数，类型为OpenPannel时，参数依次为：类名，函数名，函数参数(最多三个)
-----------------类型为FindPath时，参数依次为：地图ID，X坐标，Y坐标
-----------------类型为Charge时，参数留空
