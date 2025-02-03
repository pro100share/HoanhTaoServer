local base = _G;

local SendMail;

SendMail = function(t)
	local sender_id = t.sender_id or 10086	--发送方id
	local sender_name = t.sender_name or _G.MailBackSystemName	--发送方名字
	
	local title	= t.title			--主题
	local content = t.content		--正文
	
	local life_time = tonumber(t.life_time) or 15*24*3600*1000	--生命时长
	
	local gold = tonumber(t.gold)
	local bind_gold = tonumber(t.bind_gold)
	local money = tonumber(t.money)
	local item = {}
	
	for i=1,5 do
		if t["item"..i] then
			local info = SItemMessage:new()
			info.dwItemEnum = tonumber(t["item"..i])
			info.dwItemNumber = tonumber(t["num"..i]) or 1
			info.dwBindType = tonumber(t["bind"..i]) or 0
			info.dwStrongLevel = tonumber(t["strong"..i]) or 0
			info.dwTianSheng = tonumber(t["tiansheng"..i]) or 0
			info.setProperty = {}
			if EquipBaseData[info.dwItemEnum] then
				local dwPropertyID =  EquipBaseData[info.dwItemEnum].dwPropertyID
				local Property = EquipAppendConfig[dwPropertyID]
				for j=1,10 do
					if t["prop"..i.."_"..j] and ((tonumber(t["value"..i.."_"..j]) or 0)>0) then
						local Prop = {}
						Prop.dwPropertyType = tonumber(t["prop"..i.."_"..j]) or 0
						Prop.dwValue = 1000000 * (tonumber(t["value"..i.."_"..j]) or 0) / (Property[PropertyTypeToMinMax[Prop.dwPropertyType][2]] or 1000000)
						if Prop.dwValue > 1000000 then
							Prop.dwValue = 1000000
						end
						table.insert(info.setProperty,Prop)
					end
				end
			end
			table.insert(item,info)
		end
	end
	
	local bAll = (tonumber(t.all)==1)
	local bOnLine = (tonumber(t.all)==2)
	local Player;
	if type(t.role_id) == "table" then
		Player = t.role_id;
	else
		Player = { t.role_id };
	end
	local cfg_id = tonumber(t.cfg_id)
	local res = 0;
	local str = "";
	if bAll then
		Player = CPlayerDBQuery:GetDBQuery():execute([[select "dwRoleID" from "T_Role_Info"]])
	end
	if bOnLine then
		Player = CPlayerManager.setAllPlayerByRoleID
	end
	for dwID,dwRoleID in pairs(Player) do
		if bAll then
			dwRoleID = dwRoleID.dwRoleID
		end
		if bOnLine then
			dwRoleID = dwID
		end
		res = res + 1
		local dwRoleID = tonumber(dwRoleID)
		if cfg_id then
			if not AutoMailSendConfig[cfg_id] then
				res = 0
				str = "not this cfg info:"..cfg_id
				break;
			end
			CMailManager:SendConfigMail( cfg_id, dwRoleID, "", true )
		else
			local objMail = CMail:new()
			objMail:SetSender( sender_id, sender_name )
			objMail:SetReceiver( dwRoleID, "" )
			objMail:SetContent( title, content )
			objMail:SetLifeTime( life_time )
			objMail:SetAccessory( gold, bind_gold, money, item )
			CMailManager:SendMail( objMail )
		end
	end
	local Info = {};
	Info.result = 1;
	Info.info = { num = res };
	Info.http_id = t.http_id;
	BackstageSystem:SendToAS(BackstageSystem.setMessageID.Command, base.json.encode(Info));
end

BackstageSystem:RegistEvent("send_mail", SendMail);






