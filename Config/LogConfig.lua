_G.LogMsgType = 
{
	_MSG_LOG_GAME_BUY = 1,
	_MSG_LOG_GAME_SELL = 2,
	_MSG_LOG_RECHARGE = 3,
	_MSG_LOG_SHOP_BUY = 4,
	_MSG_LOG_ITEM_USE = 5,
	_MSG_LOG_DEAL = 6,
	_MSG_LOG_YB_INCOME = 7,
	_MSG_LOG_ITEM_INCOME = 8,
	_MSG_LOG_LOGIN = 9,
	_MSG_LOG_LOGOUT = 10,
	_MSG_LOG_CREATE_ROLE = 11,
	_MSG_LOG_DEATH = 12,
	_MSG_LOG_ACCEPT_TASK = 13,
	_MSG_LOG_TASK = 14,
	_MSG_LOG_UPGRADE = 15,
	_MSG_LOG_GOLD = 16,
	_MSG_LOG_MAP = 17,
	_MSG_LOG_LONGER = 18,
	_MSG_LOG_TRANSCRIPT = 19,
	_MSG_LOG_ONLINE = 20,
	_MSG_LOG_GAME_ENTER = 21,
	_MSG_LOG_ITEMLOG = 22,
	_MSG_LOG_CLIENTINFO = 23,
	_MSG_LOG_USERINFO = 24,
	_MSG_LOG_GIFTMONEYBUY = 25,
	_MSG_LOG_GIFTMONEYINCOME = 26,
	_MSG_LOG_YB_EXPEND = 27,
	_MSG_LOG_CIFU = 28,
	_MSG_LOG_MAIL = 29,
	_MSG_LOG_SKILL = 30,
	_MSG_LOG_PULSE = 31,
	_MSG_LOG_TOTAL = 32,
	_MSG_LOG_ZHENQI = 33,
	_MSG_LOG_CHAT = 34,
    _MSG_LOG_CHART = 35,
    _MSG_LOG_EQUIP_BUILD = 36,
    _MSG_LOG_STONE_USE = 37,
    _MSG_LOG_CDKEY = 38,
    _MSG_LOG_SOUL = 39,
    _MSG_LOG_WEIWANG = 40,
    _MSG_LOG_MEGAKILL = 41,
    _MSG_LOG_MARRIAGE = 42,
    _MSG_LOG_SIGN = 43,
    _MSG_LOG_LOTTERY = 44,
    _MSG_LOG_WAR = 45,
    _MSG_LOG_BATTLE = 46,
    _MSG_LOG_FRIEND = 47,
    _MSG_LOG_DUPL = 48,
    _MSG_LOG_GIFTMONEYEXPEND = 49,
    _MSG_LOG_GUILD = 50,
    _MSG_LOG_MATRIX_METHOD = 51,
    _MSG_LOG_QIHUN = 52,
    _MSG_LOG_INFO = 53,
    _MSG_LOG_BOSS_KILL = 54,
	_MSG_LOG_CHANGE_LINE = 55,
	_MSG_LOG_GOLD_CHANGE = 56,
};
local Base = "gid=%d&sid=%d&oldsid=%d&user=%s&dept=%d&roleid=%s&sign=%s&time=%s&"
_G.LogMsgText = {
	_MSG_LOG_GAME_BUY = 		{send=0,name="game_buy",txt="balance=%d&itemid=%d&amount=%d&money=%d&level=%d&map_id=%d"},
	_MSG_LOG_GAME_SELL = 		{send=0,name="game_sell",txt="balance=%d&itemid=%d&amount=%d&money=%d&level=%d&map_id=%d"},
	_MSG_LOG_RECHARGE = 		{send=0,name="recharge",txt="amount=%s&money=%s&balance=%s&level=%s&order=%s"},
	_MSG_LOG_SHOP_BUY = 		{send=0,name="shop_buy",txt="balance=%d&itemid=%d&amount=%d&money=%d&level=%d&map_id=%d"},
	_MSG_LOG_ITEM_USE = 		{send=0,name="item_use",txt="itemid=%d&amount=%d&remain=%d&type=%d&level=%d&map_id=%d&mode=%d&reason=%d"},
	_MSG_LOG_DEAL = 			{send=0,name="deal",txt="type=%d&buy_mapid=%d&buy_level=%d&buy_cp=%d&buy_yb=%d&buy_goods=%s&buy_horse=%s&sell_sid=%d&sell_roleid=%s&sell_user=%s&sell_mapid=%d&sell_level=%d&sell_cp=%d&sell_yb=%d&sell_goods=%s&sell_horse=%s"},
	_MSG_LOG_YB_INCOME = 		{send=0,name="yb_income",txt="amount=%d&balance=%d&level=%d&reason=%d"},
	_MSG_LOG_ITEM_INCOME = 		{send=0,name="item_income",txt="itemid=%d&amount=%d&level=%d&reason=%d&mode=%d&remain=%d"},
	_MSG_LOG_LOGIN = 			{send=0,name="login",txt="level=%d&ip=%s&map_id=%d&group=%d"},
	_MSG_LOG_LOGOUT =			{send=0,name="logout",txt="level=%d&ip=%s&map_id=%d&group=%s&onlinetime=%d&channel=%s"},
	_MSG_LOG_CREATE_ROLE = 		{send=0,name="create_role",txt="rolename=%s&channel=%s&poster=%s&site=%s&ip=%s&sex=%d&prof=%d"},
	_MSG_LOG_DEATH = 			{send=0,name="death",txt="event=%d&level=%d&map_id=%d"},
	_MSG_LOG_ACCEPT_TASK = 		{send=0,name="accept_task",txt="taskid=%d&type=%d&map_id=%d"},
	_MSG_LOG_TASK = 			{send=0,name="task",txt="taskid=%d&map_id=%d&result=%d"},
	_MSG_LOG_UPGRADE = 			{send=0,name="upgrade",txt="role_name=%s&level=%d&map_id=%d"},
	_MSG_LOG_GOLD = 			{send=0,name="gold",txt="num=%d&status=%d&map_id=%d&amount=%d"},
	_MSG_LOG_MAP = 				{send=0,name="map",txt="level=%d&nonce_map=%d&to_map=%d"},
	_MSG_LOG_LONGER = 			{send=0,name="longer",txt="type=%d&stop_time=%d&timelong=%d&level=%d&map_id=%d"},
	_MSG_LOG_TRANSCRIPT = 		{send=0,name="transcript",txt="starttime=%d&timelong=%d&num=%d&level=%d&map_id=%d"},
	_MSG_LOG_ONLINE = 			{send=0,name="online",txt="rolecount=%d&usercount=%d"},
	_MSG_LOG_GAME_ENTER = 		{send=0,name="game_enter",txt="channel=%s&poster=%s&site=%s&ip=%s"},
	_MSG_LOG_ITEMLOG = 			{send=0,name="item_log",txt="itemid=%d&opid=%d&amount=%d"},
	_MSG_LOG_CLIENTINFO = 		{send=0,name="client_info",txt="login_type=%s&browser_type=%s&system_type=%s&desk_type=%s"},
	_MSG_LOG_USERINFO = 		{send=0,name="user_info",txt="state=%d&webtype=%s&uf=%s"},
	_MSG_LOG_GIFTMONEYBUY = 	{send=0,name="giftmoney_buy",txt="balance=%d&itemid=%d&amount=%d&money=%d&level=%d&map_id=%d"},
	_MSG_LOG_GIFTMONEYINCOME =  {send=0,name="giftmoney_income",txt="money=%d&balance=%d&level=%d&reason=%d&map_id=%d"},
	_MSG_LOG_YB_EXPEND = 		{send=0,name="yb_expend",txt = "amount=%s&balance=%s&level=%s&reason=%s"},
	_MSG_LOG_CIFU =				{send=0,name="cifu",txt = "type=%d&goal=%d&result=%d&begin=%d&end=%d"},
	_MSG_LOG_MAIL = 			{send=0,name="mail",txt="sender=%d&title=%s&content=%s&accessory=%s&state=%d"},
	_MSG_LOG_SKILL = 			{send=0,name="skill",txt="level=%d&skillid=%d&skilllevel=%d"},
	_MSG_LOG_PULSE =			{send=0,name="pulse",txt="level=%d&pulseid=%d&pulselevel=%d"},
	_MSG_LOG_TOTAL = 			{send=0,name="total",txt="gold=%s&lijin=%s&yinliang=%s"},
	_MSG_LOG_ZHENQI =			{send=0,name="zhenqi",txt="cur1=%d&cha1=%d&cur2=%d&cha2=%d&cur3=%d&cha3=%d&cur4=%d&cha4=%d&cur5=%d&cha5=%d&type=%d"},
    _MSG_LOG_CHAT =             {send=0,name="chat",special=1,txt="gid=%d&sid=%d&qid=%s&name=%s&type=%d&toqid=%s&toname=%s&content=%s&time=%d&ip=%s"},
    _MSG_LOG_CHART =            {send=0,name="chart",txt="number=%d&role_name=%s&value=%s&type=%d"},
    _MSG_LOG_EQUIP_BUILD =      {send=0,name="equip_build",txt="slotpos=%d&level=%d&exp=%s&waste=%d&type=%d"},
    _MSG_LOG_STONE_USE =        {send=0,name="stone_use",txt="item_id=%s&pos=%d&level=%d&use_type=%d"},
    _MSG_LOG_CDKEY =            {send=0,name="cdkey",txt="role_name=%s&create_time=%s&cdkey=%s"},
    _MSG_LOG_SOUL =             {send=0,name="soul",txt="type=%d&id=%s&inst_id=%s&exp=%s&money=%s&chip_num=%d"},
    _MSG_LOG_WEIWANG =          {send=0,name="weiwang",txt="id=%s"},
    _MSG_LOG_MEGAKILL =         {send=0,name="megakill",txt="type=%d&cha_num=%s&cur_num=%s&role_id=%s"},
    _MSG_LOG_MARRIAGE =         {send=0,name="marriage",txt="bridegroom=%s&bride=%s&token=%s&intimate=%s&wedding=%d&weddingtype=%d&acquire=%s&divorce=%d&apply=%s"},
    _MSG_LOG_SIGN =             {send=0,name="sign",txt=""},
    _MSG_LOG_LOTTERY =          {send=0,name="lottery",txt="first=%s&second=%s&third=%s"},
    _MSG_LOG_WAR =              {send=0,name="war",txt="type=%d&result=%s"},
    _MSG_LOG_BATTLE =           {send=0,name="battle",txt="battle=%s"},
    _MSG_LOG_FRIEND =           {send=0,name="friend",txt="friend_role_id=%s&type=%d"},
    _MSG_LOG_DUPL =             {send=0,name="dupl",txt="group_id=%d&type=%d&result=%d"},
    _MSG_LOG_GIFTMONEYEXPEND =  {send=0,name="giftmoney_expend",txt="balance=%s&number=%s&reason=%d"},
    _MSG_LOG_GUILD =            {send=0,name="guild",special=1,txt="gid=%d&sid=%d&dept=%d&roleid=%s&time=%s&guild_id=%s&guild_name=%s&type=%d&data=%s"},
    _MSG_LOG_MATRIX_METHOD =    {send=0,name="matrix_method",txt="id=%d&level=%d&exp=%s&type=%d"},
    _MSG_LOG_QIHUN =            {send=0,name="qihun",txt="consume=%s&gain=%s"},
    _MSG_LOG_INFO =             {send=0,name="info",txt="info=%s"},
    _MSG_LOG_BOSS_KILL =        {send=0,name="boss_kill",txt="boss_id=%s"},
	_MSG_LOG_CHANGE_LINE =		{send=0,name="change_line",txt="type=%s&gold=%s"},
	_MSG_LOG_GOLD_CHANGE = 		{send=0,name="gold_change",txt="change=%s&db=%s&mem=%s"},
};

for Type,Text in pairs(LogMsgText) do
    if Text.special ~= 1 then
        LogMsgText[Type].txt = Base..Text.txt 
    end
end
