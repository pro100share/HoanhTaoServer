--[[
���ܣ�CFullAwardMgr
���ͣ��̳���CSingle�࣬
�汾��
	v1.0	21:15 2013-11-6 create by qy
]]

--Updateͬ���׳�汾
define.SetKsFullVersionMsg
{
	Line = 0,
	VersionId = 0, 
}
when{}
function SetKsFullVersionMsg(Line, VersionId)
	CFullAwardMgr:SetFullVersion(Line, VersionId);
end;

-- define.SetChargeMsg
-- {
-- }
-- when{}
-- function SetChargeMsg()
	-- CScriptManager:OnGetChargeInfo(_now(),811460001,1000);
-- end;
