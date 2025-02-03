﻿--参数表local tabArg = {	['进度']	= 1,	['参数1']	= 1,	['参数2']	= 2,	['参数3']	= 3,	['参数4']	= 4,	['参数5']	= 5,	['参数6']	= 6,}--检查操作表local tabCheckOper = {	['=']	= function( a,b ) return a == b end,	['>']	= function( a,b ) return a > b end,	['>=']	= function( a,b ) return a >= b end,	['<']	= function( a,b ) return a < b end,	['<=']	= function( a,b ) return a <= b end,}--计数操作表local tabCountOper = {	['=']	= function( a,b ) return b end,	['+']	= function( a,b ) return a + b end,}--解析参数local ParseArg = function(Arg,...)	local tabInfo = {...}	local dwPos = tabArg[Arg]	if dwPos then		return tabInfo[dwPos]	else		return Arg	endend_G.AchievementFunction = {}--成就事件检测AchievementFunction.Check = function(szArg,szOper,...)	local fnCheck = function() return true end	if not szArg then return fnCheck end	local Arg = {...}	fnCheck = function(...)		local Res = ParseArg(szArg,...)		for _,v in pairs(Arg) do			local Tar = ParseArg(v,...)			if tabCheckOper[szOper](Res,Tar) then				return true			end		end		return false	end	return fnCheckend--成就内容计数AchievementFunction.Count = function(szRes,szOper,szTar)	local fnCount = function(dwValue) return dwValue + 1 end	if not szRes then return fnCount end	fnCount = function(...)		local Res = ParseArg(szRes,...)		local Tar = ParseArg(szTar,...)		return tabCountOper[szOper](Res,Tar)	end	return fnCountend