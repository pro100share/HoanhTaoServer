local base = _G;
_G.ConfigSystem = {};

ConfigSystem.setConfig = nil;

local DealMall;

function ConfigSystem:Init()
end

function ConfigSystem:Destroy()
end

function ConfigSystem:Get()
    if self.setConfig ~= nil then
        return self.setConfig;
    end

	local Info = {}
	local Mall = DealMall()
	local Item = {}
	for k,v in pairs(EquipBaseData) do
		local item_count = 0;
		local item_type = 2;
		table.insert(Item,{id=k,name=v.strName,pid=v.dwPropertyID,item_count=item_count,item_type=item_type})
	end
	for k,v in pairs(OtherBaseData) do
		local item_count = 0;
		local item_type = 2;
		if Mall[k] then
			item_type = 1
			item_count = Mall[k]
		end
		
		table.insert(Item,{id=k,name=v.strName,item_type=item_type,item_count=item_count})
	end
	Info.item = Item

	local Map = {}
	for k,v in pairs(MapInfoConfig) do
		if type(k)=="number" then
			table.insert(Map,{id=k,name=v.szName})
		end
	end
	Info.map = Map

	local Skill = {}
	for k,v in pairs(SkillConfig) do
		if type(k)=="number" then
			table.insert(Skill,{id=k,name=SkillStringConfig[v.dwNameID]})
		end
	end
	Info.skill = Skill

	local Prop = {}
	for k,v in pairs(EquipAppendConfig) do
		local info = {}
		info[1] = v.dwMaxPower			--¹¥»÷
		info[2] = v.dwMaxDefence		--·ÀÓù
		info[3] = v.dwMaxShenFa			--Éí·¨
		info[4] = v.dwMaxBaoJi			--±©»÷
		info[5] = v.dwMaxHPLimited		--ÉúÃü
		info[6]	= v.dwMaxMPLimited		--ÄÚÁ¦
		info[7] = v.dwMaxSubDamage		--ÉËº¦¼õÃâ
		Prop[tostring(k)] = info
	end
	Info.prop = Prop

	local Bourn = {}
	for k,v in pairs(BournConfig.Bourn) do
		local info = {}
		info.id = v.id
		info.exp = v.needactionex
		Bourn[k] = info
	end
	Info.bourn = Bourn

	local Mount = {};
	for k,v in pairs(CMountTable) do
		local info = {};
		info.id = k;
		info.name = v.name;
        table.insert(Mount, info);
	end
	Info.mount = Mount;

    self.setConfig = Info;

	return Info
end

DealMall = function ()
	local Mall = {}
	for k,v in pairs(MallConfig.Goods) do 
		if v.dwPriceType == 1 then
			Mall[v.dwItemEnum] = v.dwPrice
		end
	end
	return Mall
end

function ConfigSystem:GetMountName(dwMountID)
    local strName = "";
    if CMountTable[dwMountID] ~= nil then
        strName = CMountTable[dwMountID].name;
    end
    return strName;
end

function ConfigSystem:GetAmuletName(dwLevel)
    local strName = "";
    if AmuletLevelConfig[dwLevel] ~= nil then
        strName = AmuletLevelConfig[dwLevel].strName;
    end
    return strName;
end

function ConfigSystem:GetSwordName(dwLevel)
    local strName = "";
    if SwordBasicConfig[dwLevel] ~= nil then
        strName = SwordBasicConfig[dwLevel].name;
    end
    return strName;
end
