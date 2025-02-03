--GS 和 KS天官赐福管理器通信消息定义文件


----GM增加装备升阶天官赐福值
define.TGCFMgr_Add_EquipUpGrade_GM_Msg
{
	Value = 0;
}
when{}
function TGCFMgr_Add_EquipUpGrade_GM_Msg(Value)
	CTianGuanCiFuMgr:Add_EquipUpGrade_GM(Value);
end;
----GM增加护身宝甲升阶天官赐福值
define.TGCFMgr_Add_AmuletUpGrade_GM_Msg
{
	Value = 0;
}
when{}
function TGCFMgr_Add_AmuletUpGrade_GM_Msg(Value)
	CTianGuanCiFuMgr:Add_AmuletUpGrade_GM(Value);
end;
----GM增加坐骑升阶天官赐福值
define.TGCFMgr_Add_MountUpGrade_GM_Msg
{
	Value = 0;
}
when{}
function TGCFMgr_Add_MountUpGrade_GM_Msg(Value)
	CTianGuanCiFuMgr:Add_MountUpGrade_GM(Value);
end;
----GM增加境界升级天官赐福值
define.TGCFMgr_Add_JingJieUp_GM_Msg
{
	Value = 0;
}
when{}
function TGCFMgr_Add_JingJieUp_GM_Msg(Value)
	CTianGuanCiFuMgr:Add_JingJieUp_GM(Value);
end;
----GM增加宝剑升阶天官赐福值
define.TGCFMgr_Add_SwordUpGrade_GM_Msg
{
	Value = 0;
}
when{}
function TGCFMgr_Add_SwordUpGrade_GM_Msg(Value)
	CTianGuanCiFuMgr:Add_SwordUpGrade_GM(Value);
end;


define.TGCFMgr_SynchFlag_Msg
{
	Flag = {};
}
when{}
function TGCFMgr_SynchFlag_Msg(Flag)
	CTianGuanCiFuMgr:SynchFlag(Flag);
end;
