﻿--跨服战系统相关的附加配置_G.CrossAddition = {};--击杀function CrossAddition:Continuation(objCross, objKiller, objDeader)	if (objKiller ~= objDeader) then		--击杀		objCross:AddCrossKillNumAll(objKiller);		--连斩		objCross:AddCrossKillNumCon(objKiller);	end	objCross:ClearCrossKillNumCon(objDeader);end