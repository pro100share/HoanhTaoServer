local dwItemId = 5501130
local ItemScriptObj = {};
setmetatable(ItemScriptObj, {__index = CItemScript});

-------------------------------------------------------
--[[
	只重写需要重写的方法。
	比如：
		这个脚本需要有 CheckForUse 和 OnUseItem 方法，
		则只需重写这两个方法。
		另两个 OnGetItem OnDeleteItem不需要重写。
]]
--使用检测(nil：无法使用；0：直接使用；其他：读条时间(单位：毫秒))
function ItemScriptObj:CheckForUse(objItemSys, objItem)

	return 0;
end

local MapData = {
	[1003] = {
		{dwMonsterId = 100320010,fight_id = 1012,dwAIId = 10032001,dwDropId = 10032001,dwLook = 100320010};
		{dwMonsterId = 100320050,fight_id = 1013,dwAIId = 10032005,dwDropId = 10032005,dwLook = 100320050};
		{dwMonsterId = 100320020,fight_id = 1015,dwAIId = 10032002,dwDropId = 10032002,dwLook = 100320020};
		{dwMonsterId = 100320030,fight_id = 1017,dwAIId = 10032003,dwDropId = 10032003,dwLook = 100320030};
		{dwMonsterId = 100320040,fight_id = 1018,dwAIId = 10032004,dwDropId = 10032004,dwLook = 100320040};
	};
	[1004] = {
		{dwMonsterId = 100420010,fight_id = 1021,dwAIId = 10042001,dwDropId = 10042001,dwLook = 100420010};
		{dwMonsterId = 100420020,fight_id = 1023,dwAIId = 10042002,dwDropId = 10042002,dwLook = 100420020};
		{dwMonsterId = 100420030,fight_id = 1028,dwAIId = 10042003,dwDropId = 10042003,dwLook = 100420030};
		{dwMonsterId = 100420040,fight_id = 1025,dwAIId = 10042004,dwDropId = 10042004,dwLook = 100420040};
		{dwMonsterId = 100420070,fight_id = 1029,dwAIId = 10042007,dwDropId = 10042007,dwLook = 100420030};
		{dwMonsterId = 100420080,fight_id = 1027,dwAIId = 10042008,dwDropId = 10042008,dwLook = 100420020};
	};
	[1005] = {
		{dwMonsterId = 100520010,fight_id = 1032,dwAIId = 10052001,dwDropId = 10052001,dwLook = 100520010};
		{dwMonsterId = 100520020,fight_id = 1035,dwAIId = 10052002,dwDropId = 10052002,dwLook = 100520020};
		{dwMonsterId = 100520030,fight_id = 1034,dwAIId = 10052003,dwDropId = 10052003,dwLook = 100520030};
		{dwMonsterId = 100520040,fight_id = 1038,dwAIId = 10052004,dwDropId = 10052004,dwLook = 100520040};
		{dwMonsterId = 100520070,fight_id = 2036,dwAIId = 10052007,dwDropId = 10052007,dwLook = 100820020};
	};
	[1006] = {
		{dwMonsterId = 100620010,fight_id = 1040,dwAIId = 10062001,dwDropId = 10062001,dwLook = 100620010};
		{dwMonsterId = 100620020,fight_id = 1047,dwAIId = 10062002,dwDropId = 10062002,dwLook = 100620020};
		{dwMonsterId = 100620030,fight_id = 1045,dwAIId = 10062003,dwDropId = 10062003,dwLook = 100620030};
		{dwMonsterId = 100620040,fight_id = 1044,dwAIId = 10062004,dwDropId = 10062004,dwLook = 100620040};
		{dwMonsterId = 100620070,fight_id = 1046,dwAIId = 10062007,dwDropId = 10062007,dwLook = 100620030};
		{dwMonsterId = 100620080,fight_id = 1042,dwAIId = 10062008,dwDropId = 10062008,dwLook = 100820040};
		{dwMonsterId = 100620120,fight_id = 1048,dwAIId = 10062012,dwDropId = 10062012,dwLook = 100820040};
		{dwMonsterId = 100620160,fight_id = 1049,dwAIId = 10062016,dwDropId = 10062016,dwLook = 100820020};
	};
	[1007] = {
		{dwMonsterId = 100720010,fight_id = 1051,dwAIId = 10072001,dwDropId = 10072001,dwLook = 100720010};
		{dwMonsterId = 100720020,fight_id = 1058,dwAIId = 10072002,dwDropId = 10072002,dwLook = 100720020};
		{dwMonsterId = 100720070,fight_id = 1052,dwAIId = 10012004,dwDropId = 10072007,dwLook = 100710980};
		{dwMonsterId = 100720080,fight_id = 1055,dwAIId = 10072008,dwDropId = 10072008,dwLook = 100920040};
		{dwMonsterId = 100720090,fight_id = 1056,dwAIId = 10072009,dwDropId = 10072009,dwLook = 100820020};
		{dwMonsterId = 100720100,fight_id = 1057,dwAIId = 10072010,dwDropId = 10072010,dwLook = 101120040};
		{dwMonsterId = 100720170,fight_id = 1057,dwAIId = 10072017,dwDropId = 10072017,dwLook = 100710080};
	};
	[1008] = {
		{dwMonsterId = 100920010,fight_id = 1063,dwAIId = 10092001,dwDropId = 10092001,dwLook = 100920010};
		{dwMonsterId = 100920020,fight_id = 1061,dwAIId = 10092002,dwDropId = 10092002,dwLook = 100920020};
		{dwMonsterId = 100920030,fight_id = 1069,dwAIId = 10092003,dwDropId = 10092003,dwLook = 100920030};
		{dwMonsterId = 100920070,fight_id = 1065,dwAIId = 10092007,dwDropId = 10092007,dwLook = 100410170};
		{dwMonsterId = 100920080,fight_id = 1066,dwAIId = 10092008,dwDropId = 10092008,dwLook = 100920090};
		{dwMonsterId = 100920090,fight_id = 1068,dwAIId = 10092009,dwDropId = 10092009,dwLook = 100420010};
		{dwMonsterId = 100920100,fight_id = 1064,dwAIId = 10092010,dwDropId = 10092010,dwLook = 100920010};
	};
	[1009] = {
		{dwMonsterId = 100820010,fight_id = 1071,dwAIId = 10082001,dwDropId = 10082001,dwLook = 100820010};
		{dwMonsterId = 100820060,fight_id = 1073,dwAIId = 10082006,dwDropId = 10082006,dwLook = 100820030};
		{dwMonsterId = 100820070,fight_id = 1072,dwAIId = 10082007,dwDropId = 10082007,dwLook = 100710100};
		{dwMonsterId = 100820100,fight_id = 1078,dwAIId = 10082010,dwDropId = 10082010,dwLook = 100620070};
		{dwMonsterId = 100820120,fight_id = 1074,dwAIId = 10082012,dwDropId = 10082012,dwLook = 101020051};
		{dwMonsterId = 100820140,fight_id = 1077,dwAIId = 10082014,dwDropId = 10082014,dwLook = 100710130};
	};
	[1010] = {
		{dwMonsterId = 101020070,fight_id = 1080,dwAIId = 10102007,dwDropId = 10102007,dwLook = 101020140};
		{dwMonsterId = 101020080,fight_id = 1082,dwAIId = 10102008,dwDropId = 10102008,dwLook = 101020110};
		{dwMonsterId = 101020090,fight_id = 1084,dwAIId = 10102009,dwDropId = 10102009,dwLook = 100920020};
		{dwMonsterId = 101020100,fight_id = 1085,dwAIId = 10102010,dwDropId = 10102010,dwLook = 100120010};
		{dwMonsterId = 101020110,fight_id = 1086,dwAIId = 10102011,dwDropId = 10102011,dwLook = 101020160};
		{dwMonsterId = 101020120,fight_id = 1088,dwAIId = 10102012,dwDropId = 10102012,dwLook = 101020150};
		{dwMonsterId = 101020130,fight_id = 1089,dwAIId = 10102013,dwDropId = 10102013,dwLook = 101020160};
	};
	[1011] = {
	    {dwMonsterId = 101120090,fight_id = 1091,dwAIId = 10112009,dwDropId = 10112009,dwLook = 101120090};
	    {dwMonsterId = 101120100,fight_id = 1093,dwAIId = 10112010,dwDropId = 10112010,dwLook = 100920100};
		{dwMonsterId = 101120110,fight_id = 1094,dwAIId = 10112011,dwDropId = 10112011,dwLook = 101120080};
		{dwMonsterId = 101120120,fight_id = 1095,dwAIId = 10112012,dwDropId = 10112012,dwLook = 101120130};
		{dwMonsterId = 101120130,fight_id = 1096,dwAIId = 10112013,dwDropId = 10112013,dwLook = 101120040};
		{dwMonsterId = 101120140,fight_id = 1098,dwAIId = 10112014,dwDropId = 10112014,dwLook = 101120150};
	};
	[1012] = {
	    {dwMonsterId = 101220010,fight_id = 1100,dwAIId = 10122001,dwDropId = 10122001,dwLook =101220010};
		{dwMonsterId = 101220020,fight_id = 1102,dwAIId = 10122002,dwDropId = 10122002,dwLook =101020130};
		{dwMonsterId = 101220040,fight_id = 1104,dwAIId = 10122004,dwDropId = 10122004,dwLook =101220030};
		{dwMonsterId = 101220050,fight_id = 1107,dwAIId = 10122005,dwDropId = 10122005,dwLook =100520040};
		{dwMonsterId = 101220060,fight_id = 1108,dwAIId = 10122006,dwDropId = 10122006,dwLook =100620050};
		{dwMonsterId = 101220070,fight_id = 1109,dwAIId = 10122007,dwDropId = 10122007,dwLook =101220040}; 
	};
	[1013] = {
	    {dwMonsterId = 101300010,fight_id = 1110,dwAIId = 10130001,dwDropId = 10092003,dwLook =101310040};
		{dwMonsterId = 101300020,fight_id = 1112,dwAIId = 10130002,dwDropId = 10092003,dwLook =100320020};
		{dwMonsterId = 101300030,fight_id = 1113,dwAIId = 10130003,dwDropId = 10092003,dwLook =100320050};
		{dwMonsterId = 101300040,fight_id = 1114,dwAIId = 10130004,dwDropId = 10092003,dwLook =100320040};
		{dwMonsterId = 101300050,fight_id = 1115,dwAIId = 10130005,dwDropId = 10092003,dwLook =100920020};
		{dwMonsterId = 101300060,fight_id = 1117,dwAIId = 10130006,dwDropId = 10092003,dwLook =100720010}; 
		{dwMonsterId = 101300070,fight_id = 1118,dwAIId = 10130007,dwDropId = 10092003,dwLook =101020100}; 
		{dwMonsterId = 101300080,fight_id = 1119,dwAIId = 10130008,dwDropId = 10092003,dwLook =100820080}; 
	};
};

--使用物品(nil or false:需要删除;	返回数字:不删除;  0为没有原因，就是不删;  >0为错误提示)
----千万  别  返回true!!!!
function ItemScriptObj:OnUseItem(objItemSys, objItem, sysScript)

	local objPlayer = objItemSys:GetPlayer();
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	local curMapId,posx,posy,mapCfgId = mapSystem:GetPlayerMapPos();
	local curMapData = MapData[curMapId];
	if not (curMapData) then 
		return 4000110012
	end 
  
	local curMapDataLin = math.random(#curMapData)
	local MonsterInfo = MapData[curMapId][curMapDataLin]
	--通知变异
	_G.MonsterDecision.Proving = 1;
	CScriptManager:AddMonToMap(curMapId,MonsterInfo.dwMonsterId,MonsterInfo.fight_id,MonsterInfo.dwAIId,MonsterInfo.dwDropId,MonsterInfo.dwLook,posx,posy)
end


-------------------------------------------------------
CGlobalItemManager:AddScript( dwItemId, ItemScriptObj )







 