--Base道具脚本

_G.CItemScript = {};

--使用检测（nil：无法使用；0：直接使用；其他：读条时间（单位：毫秒））
----默认直接使用，因为没有检测条件
function CItemScript:CheckForUse(objItemSys, objItem, sysScript)
	return 0;
end
--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回   true!!!!
----默认不删除，因为没有使用效果
function CItemScript:OnUseItem(objItemSys, objItem, sysScript)
	return 6000610006;
end



 