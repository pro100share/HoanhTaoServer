_G.RecordMsgConfig = 
{
	--平台数据
	myonline = {msgID = 1,param = { lineflag=1, ip=2, user=3, role=4, dwRoleID=5, dwLevel=6 ,dwProf = 7, bIsResend = 8}};
	lost = {msgID = 2,param = { dwRoleID=1, dwLevel=2 }};
	point = {msgID = 3,param = { dwAccountID=1, dwRoleID=2, dwTime=3, dwCost=4, szType=5 }};
	prop = {msgID = 4,param = { dwRoleID=1, dwItemEnum=2, szItemName=3, dwPrice=4, dwNumber=5, dwTime=6 }};
	prop_log = {msgID = 5,param = { dwAccountID=1, szRoleName=2, szItemName=3, szType=4, dwNumber=5, dwTime=6 }};
	task_log = {msgID = 6,param = { dwAccountID=1, szRoleName=2,  dwTaskID=3, szReward=4, szType=5, dwTime=6 }};
	create = {msgID = 7,param = { dwAccountID=1, szChannel=2, dwRoleID=3,dwIP=4, dwTime=5,dwProf = 6 ,szRoleName = 7 }};
	income_other = {msgID = 8,param = { dwAccountID=1, dwGold=2, dwTime=3, szType=4 }};
	equip_log = {msgID = 9,param = { role=1, item=2, itemdesc=3, oper=4, matdesc=5, result=6, time=7 }};
	copy_log = {msgID = 10,param = { role=1, name=2, start_time=3, end_time=4, desc=5 }};
	trade_log =	{msgID = 11,param = { role_1=1, role_2=2, trade_1=3, trade_2=4, time=5 }};
	booth_log = {msgID = 12,param = { role_sell=1, role_buy=2, desc=3, time=4 }};
	
	
	--POST数据，编号从1000开始，自身数据后接user（用户ID）roleid（角色ID）time（发生时间）
	game_buy = {msgID = 1001,param = {balance = 1,itemid = 2,amount = 3,money = 4,level = 5,map_id = 6}};
	game_sell = {msgID = 1002,param = {balance = 1,itemid = 2,amount = 3,money = 4,level = 5,map_id = 6}};
	shop_buy = {msgID = 1003,param = {balance = 1,itemid = 2,amount = 3,money = 4,level = 5,map_id = 6}};
	item_use = {msgID = 1004,param = {itemid = 1,amount = 2,remain = 3,type = 4,level = 5,map_id = 6}};
	deal = {msgID = 1005,param = {type = 1,buy_mapid = 2,buy_level = 3,buy_cp = 4,buy_yb = 5,buy_goods = 6,buy_horse = 7,sell_sid = 8,sell_roleid = 9,sell_user = 10,sell_mapid = 11,sell_level =12,sell_cp = 13,sell_yb = 14,sell_goods = 15,sell_horse = 16}};
	yb_income = {msgID = 1006,param = {amount = 1,balance = 2,level = 3,reason = 4}};
	item_income = {msgID = 1007,param = {itemid = 1,amount = 2,level = 3,reason = 4}};
	login = {msgID = 1008,param = {level = 1,ip = 2,map_id = 3,group = 4}};
	logout = {msgID = 1009,param = {level = 1,map_id = 2,ip = 3}};
	death = {msgID = 1010,param = {event = 1,level = 2,map_id = 3}};
	accept_task = {msgID = 1011,param = {taskid = 1,map_id = 2,type = 3}};
	task = {msgID = 1012,param = {taskid = 1,map_id = 2,result = 3}};
	upgrade = {msgID = 1013,param = {level = 1,map_id = 2}};
	gold = {msgID = 1014,param = {num = 1,status = 2,map_id = 3}};
	map = {msgID = 1015,param = {level = 1,nonce_map = 2,to_map = 3}};
	longer = {msgID = 1016,param = {type = 1,stop_time = 2,timelong = 3,level = 4,map_id = 5}};
	transcript = {msgID = 1017,param = {starttime = 1,timelong = 2,num = 3,level = 4,map_id = 5,}};
	yb_expend = {msgID = 1018,param = {amount = 1,balance = 2,level = 3,reason = 4}};
	recharge = {msgID = 1019,param = {amount = 1,money = 2,level = 3,balance = 4,order = 5}};
	create_role = {msgID = 1020,param = {rolename = 1,channel = 2,poster = 3,site = 4,ip = 5}};
	item_log = {msgID = 1021,param = {itemid = 1, opid=2, amount=3}};
	game_enter = {msgID = 1022,param = {channel = 1, poster=2, site=3, ip=4}};
	online = {msgID = 1023,param = {rolecount = 1, usercount=2, userlist=3}};
};

_G.RecordMsgIDConfig = {}



