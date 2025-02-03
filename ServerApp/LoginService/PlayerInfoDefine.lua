--角色信息
_G.SRoleInfo = {};
function SRoleInfo:new(o)
	local obj;
	if o  ~= nil then
		obj = o;
	else
		obj = {};
		obj.dwRoleID 		= 0;			--角色ID
	    obj.szName 			= "";			--玩家名字
		obj.dwSex 			= 0;			--玩家性别
		obj.dwFace			= 0;			--玩家脸型
		obj.dwHair 			= 0;			--玩家发型
		obj.dwProf			= 0;			--玩家职业
		--[[
		obj.szLoverText		= ""			--伴侣信息
		obj.tbTitle			= {}			--称号信息
		obj.szTalk			= ""			--说话信息
		--]]
		obj.dwSuitID 		= 0;			--玩家默认套装ID
		--下面改成ItemEnum
		obj.dwDress			= 0;			--衣服
		obj.dwHand			= 0;			--护手
		obj.dwShoe			= 0;			--鞋子
		obj.dwArms			= 0;			--武器
		
		obj.dwDressLevel	= 0;			--衣服强化等级
		obj.dwHandLevel		= 0;			--护手强化等级
		obj.dwShoeLevel		= 0;			--鞋子强化等级
		obj.dwArmsLevel		= 0;			--武器强化等级
		
		obj.dwExp			= 0;			--角色经验
		
		obj.setActSuitList	= {};			--激活的套装ID
	end;
	return obj;
end;
 


--创建角色信息
_G.SCreateInfo = {}
function SCreateInfo:new(o)
	local obj;
	if o ~= nil then
	   obj = o;
	else
		obj = {}	;
		obj.szName 			= "";			--玩家名字
		obj.dwSex 			= 0;			--玩家性别
		obj.dwFace			= 0;			--玩家脸型
		obj.dwHair 			= 0;			--玩家发型
		obj.dwProf		    = 0;			--玩家职业
		obj.dwSuitID 		= 0;			--玩家默认套装ID
		obj.dwIncoID		= 0;			--对应玩家的头像ID
	end;
	return obj;
end;
--角色列表信息dfdf
_G.SRoleListShowInfo = {};
function SRoleListShowInfo:new(o)
	local obj;
	if o ~= nil then
		obj = o;
	else
		obj = {};	
		obj.dwRoleID		= 0;
		obj.szRoleName		= "";
		obj.dwSex			= 0;
		obj.dwFace			= 0;
		obj.dwHair			= 0;
		obj.dwProf 			= 0;
		obj.dwIncoID    	= 0;
		
		obj.dwDress			= 0;		--衣服
		obj.dwHand			= 0;		--护手
		obj.dwShoe			= 0;		--鞋子
		obj.dwArms			= 0;		--武器
		obj.dwHorseID 		= 0;		--坐骑模型
		
		obj.dwDefDress			= 0;		--默认衣服
		obj.dwDefHand			= 0;		--默认护手
		obj.dwDefShoe			= 0;		--默认鞋子
		obj.dwDefIncoID         = 0;        --默认头像
		
		obj.dwExp		= 0;			--角色当前总经验  
		obj.dwLevel			= 0;			--角色等级
		obj.dwLevelMaxExp = 0;
		obj.dwLevelCurExp = 0;
		
		obj.dwMoney         = 0;	 --游戏币
		obj.dwBindGold      = 0; --绑定的元宝
		obj.dwGold			= 0; --元宝
		
		obj.tmDownlineTime  = 0;--下线时间
		obj.tmUplineTime =    0;--上线时间

		obj.setActSuitList	= {};			--激活的套装ID
	end;
	return obj;
end;
