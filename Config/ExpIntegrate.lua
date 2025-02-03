--[[
	世界经验加成配置
	赵飞
	2013-11-26
]]

_G.ExpIntegrateConfig = {
	str  = "<p><font size='16' color='#ff9910' >杀怪经验加成总和</font><font size='16' color='#ff0f0f' >【%d%%】</font></p><p><font size='12' color='#ffff01' >(杀怪经验加成 = 基本杀怪经验</font><font size='12' color='#ff0f0f' >【100%%】</font> <font size='12' color='#ffff01' >+ 额外加成）</font></p><p><font size='14' color='#ff9910'>杀怪经验额外加成来源：</font></p>";
	str1 = "<p><img src='img://zb_xfk_shuxing_biaoshi.png' >VIP福利加成            20%</p>";
	str11 = "<p><font size='12' >   一旦你成为武林贵宾（VIP）即可获得该项加成</font></p>";
	-- str2 = "龙鼎战经验加成";  --不支持
	str3 = "<p><img src='img://zb_xfk_shuxing_biaoshi.png' >微端登陆经验加成	 10%</p>";
	str31 = "<p><font size='12' >   玩家使用微端登陆可以获得额外的打怪经验加成</font></p>";
	str4 = "<font color='#00ff00'><p><img src='img://zb_xfk_shuxing_biaoshi.png' >世界等级差加成          %d%%</p></font>";
	str41 = "<p><font size='12' >   玩家同本服最高等级玩家相差大于10级可获得打怪经验加成</font></p>";
	-- str5 = "<p><img src='img://zb_xfk_shuxing_biaoshi.png' >夫妻经验加成         20%</p>";
	-- str51 = "<p><font size='12' >   当夫妻在同一张地图时可以获得<br>   打怪经验加成</font></p>";
	-- str6 = "<p><img src='img://zb_xfk_shuxing_biaoshi.png' >组队经验加成   	      %d%%</p>";
	-- str61 = "<p><font size='12' >   当与队员在同一张地图时获得打<br>   怪经验加成</font></p>";
	str7 = "<p><img src='img://zb_xfk_shuxing_biaoshi.png' >世家福利加成   	        %d%%</p>";
	str71 = "<p><font size='12' >   加入世家即可获得该项加成（世家等级越高，该项加成越高）</font></p>";
	str8 = "<p><img src='img://zb_xfk_shuxing_biaoshi.png' >双倍收益活动加成      100%</p>";
	str81 = "<p><font size='12' >   当前处于双倍收益活动时间即可获得该项加成</font></p>";
	-- str9 = "<p><img src='img://zb_xfk_shuxing_biaoshi.png' >盟主福利加成   	        %d%%</p>";
	-- str91 = "<p><font size='12' >   你与本服武林盟主属于同一世家即可获得该项加成</font></p>";
	Color1 = "<font color='#00ff00' size='14'>%s</font>"; --满足条件颜色控制
	Color2 = "<font color='#787878' size='14'>%s</font>"; --不满足条件颜色控制
	Color3 = "<font color='#ffffff' size='14'>%s</font>"; --描述满足条件颜色控制
	Color4 = "<font color='#787878' size='14'>%s</font>"; --描述不满足条件颜色控制
	FamilyExp = {[1] = 5,[2] = 15,[3] = 25,[4] = 40,[5] = 60}; --世家等级对应的经验加成上
	LeaderExp = {[1] = 20,[2] = 10,[3] =5} ; --盟主战经验加成 [1 ] 盟主，[2] 盟主夫人,[3] 副盟主
	weiduanExp  = 10;                          	--微端经验加成数值
	VipExp  	= 20;  --Vip经验加成
	MarryExp  	= 20;  --夫妻经验加成
	DoubleExp  	= 100;      --双倍活动收益经验加成
	--初始的全服最大等级
	InitAllSMaxLevel = 10;
};
--获取世界经验加成函数
--MyLevel 我的级别，MaxLevel 服务器玩家最大级别
function ExpIntegrateConfig:GetExpByLevel(MyLevel,MaxLevel)
	local retPercent = 0;
	local levelX = MaxLevel - MyLevel;
	if levelX < 10 then
		retPercent = 0;
		elseif levelX >= 10 and levelX <= 68 then
			retPercent = (levelX - 8) * 5
			elseif levelX > 68 then
				retPercent = 300
				end
	return retPercent
end


