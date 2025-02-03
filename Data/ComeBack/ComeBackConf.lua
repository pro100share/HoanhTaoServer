
--[[
Description:	回归补偿活动
Author:			刘科建
Data:			2013-10-23
]]

_G.ComeBackConf = {
	--是否开启回归活动
	bOpen = true;
	--等级限制 >=
	nLevel = 80;
	--时间限制 单位毫秒 >
	nTime = {
			 [1] = 7* 24 * 3600 * 1000;
			 [2] = 15* 24 * 3600 * 1000;
			 [3] = 30* 24 * 3600 * 1000;
			};
	--[[
	function:	回归补偿经验
	input:
		@param afkTime	离开时间，单位为毫秒
		@param level 	角色等级
	return:
		@exp	补偿经验
	]]
	Exp = function(afkTime, level)
		return 0 ;
	end;
	--[[
	补偿道具表
	每个道具是一个{}
		[1]道具ID,
		[2]个数,
		[3]是否绑定,
		[4]道具生命时间,单位为天,
	]]
	Items = {
		[1] = { {[1] = 6300588, [2] = 1, [3] = 1};--回归礼包(7天)
				{[1] = 5809718, [2] = 1, [3] = 1};--老玩家回归(7天)
			};	
		[2] = { {[1] = 6300589, [2] = 1, [3] = 1};--回归礼包(15天)
				{[1] = 5809719, [2] = 1, [3] = 1};--老玩家回归(15天)
			};
		[3] = { {[1] = 6300590, [2] = 1, [3] = 1};--回归礼包(30天)
				{[1] = 5809720, [2] = 1, [3] = 1};--老玩家回归(30天)
			}
	};
	
}

----------------------------------------------------
-------以下为热更新接口，勿动
----------------------------------------------------
function ComeBackConf:Reload()
	local szPath = "../Data/"
	dofile(szPath..'ComeBack/ComeBackConf.lua')
end

