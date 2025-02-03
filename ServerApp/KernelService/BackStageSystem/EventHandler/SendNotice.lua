local base = _G;

local SendNotice

SendNotice = function(t)
	local Info = {}
	Info.http_id = t.http_id;
	Info.result = 1;
	if t.notice then
        if tonumber(t.type) == 1 then
            CScriptManager:ScriptTipNotice(t.notice, t.link or "");
        else
            local cfg = ChatTextConfig[enChatChannel.eGongGao]
            local strNotice = [[<font color="]]..cfg.Color..[[">]]..t.notice..[[</font>]]
            local strLink = t.link or ""
            local str2 = string.format(strNotice,strLink)
            local Param = {
                {
                    szFunStr = strLink;
                    dwFunId = 42;
                    param = {strLink};
                }
            }
            local str1 = [[<font face="]]..cfg.Face..[[" size="]]..cfg.Size..[[" color="]]..cfg.Color..[[">%s</font>]]
            str1 = string.format(str1,strNotice)
            
            CScriptManager:ScriptChatNoticeAll(str1,7,bSystem,Param,str2,true)
        end
	else
		Info.result = 0;
	end
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(Info));
end

BackstageSystem:RegistEvent("send_notice", SendNotice);
