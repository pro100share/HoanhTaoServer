
--好友系统配置
_G.FriendSysConfig = {
	NoticePercent = 150;--成功率在1~1000之间筛，300以内成功
	ViewPlayerTime = 1000;--玩家查看好友信息的时间间隔
	dwLimited = 100;--最大好友数量
	TipsFace = "宋体";
	TipsSize = 12;
	TipsColor = "#40E0D0";
	HtmlText = "<p align='center'>%s </p><br/><p align='center'>------------------</p><br/><p align='center'><font face='%s' size='%s' color='%s'>%s</font></p>";
	
	NextInterval = 1000 -- 下一批按钮间隔时间
};
--当被其他玩家添加为好友的时候，提示的信息列表
_G.BeAddedFriendNotice = {
	6000170001;
	6000170002;
	6000170003;
    6000170004;
    6000170005;
    6000170006;
    6000170007;
    6000170008;
    6000170009;
    6000170010;
    6000170011;
    6000170012;
    6000170013;
    6000170014;
    6000170015;
    6000170016;
    6000170017;
    6000170018;
    6000170019;
    6000170020;
    6000170021;
    6000170022;
    6000170023;
    6000170024;
    6000170025;
};
--刀剑枪镰的图片配置
_G.ProfIconConfig = {
	[1] = "zhiye_gun.png";
	[2] = "zhiye_dao.png";
	[3] = "zhiye_jian.png";
	[4] = "zhiye_qiang.png";
};
--心情的图片配置
_G.MoodIconConfig = {
	[0] = "lt_bq_05.gif";
	[1] = "lt_bq_05.gif";
	[2] = "lt_bq_07.gif";
	[3] = "lt_bq_04.gif";
	[4] = "lt_bq_29.gif";
};
--显示下拉列表的坐标，x和y是相对于整个SWF的坐标，就是SWF内部的坐标
_G.MoodDropListPos = {
	[1] = { x = 216, y = 197 };
	[2] = { x = 245, y = 197 };
	[3] = { x = 274, y = 197 };
	[4] = { x = 303, y = 197 };
};
--好友的标记
_G.enFriendFlag = 
{
	eNone = 0,			--没有任何关系
	eFriend = 1,		--好友关系
	eEnemy = 2,			--仇人关系
	eBlackList = 3,		--黑名单
	eFriendAndEnemy = 4,--朋友和仇人关系
	eBlackAndEnemy = 5,	--黑名单和仇人关系
};
--好友图标提示的配置
_G.FriendIconNoticeConfig = 
{
	--弹出增加好友的对话框，提示玩家
	--beAdded = NoticeIconConfig[5];  --"gth.png";
	--玩家满足一定等级之后，提示玩家征友信息
	--toAddFriend = NoticeIconConfig[17]; --- "gth.png";
	toAFLevel = 10;
	--玩家满足一定的等级之后，提示玩家征婚信息
	--toAddMarry = NoticeIconConfig[18];  --"gth.png";
	toAMLevel = 34;
	--玩家有新仇人或者玩家的仇人上线了
	--toViewEnemy = NoticeIconConfig[19]; -- "gth.png";
	toVEGapTime = 5 * 60 * 1000;--五分钟之内上线无提示
};
--好友保存的数据结构，客户端和服务端通用
_G.sFriendInfo = {};
function sFriendInfo:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--记录好友的ID
	obj.dwFlag = enFriendFlag.eNone;--我与好友的关系，详见enFriendFlag
	obj.dwMeetTime = 0;		--我第一次添加好友的时间
	obj.dwLastTime = 0;		--我最后一次被仇人击杀的时间
	obj.dwYanHui = 0;		--0没有宴会，1有宴会
	obj.dwTanWei = 0;		--0没有摊位，1有摊位
	obj.dwOnLine = 0;		--0是不在线，1是在线
	obj.dwVip = 0;			--0不是VIP，1是VIP
	obj.dwLevel = 0;		--记录玩家的等级
	obj.dwProf = 0;			--职业
	obj.dwHead = 0;			--头像的ID
	obj.strName = "";		--记录玩家的姓名
	obj.strBangPai = "";	--帮派名称
	obj.dwBangPaiID = 0;	--帮派的ID
	obj.dwEnemy = 0;		--仇恨值
	obj.dwInjectFlag = 0;	--是否灌注过
	return obj;
end
--玩家的心情和签名结构
_G.SPlayerMoodMsg = {};
function SPlayerMoodMsg:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--玩家的ID
	obj.dwMood1 = 0;		--心情1
	obj.dwMood2 = 0;		--心情2
	obj.dwMood3 = 0;		--心情3
	obj.dwMood4 = 0;		--心情4
	obj.szSign = "";		--签名
	return obj;
end

--最近联系人保存的数据结构，客户端和服务端通用
_G.sContactInfo = {};
function sContactInfo:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--记录最近联系人的ID
	obj.dwLastTime = 0;		--记录最后一次对话的时间
	obj.dwYanHui = 0;		--0没有宴会，1有宴会
	obj.dwTanWei = 0;		--0没有摊位，1有摊位
	obj.dwOnLine = 0;		--0是不在线，1是在线
	obj.dwVip = 0;			--0不是VIP，1是VIP
	obj.dwLevel = 0;		--记录玩家的等级
	obj.dwProf = 0;			--职业
	obj.dwHead = 0;			--头像的ID
	obj.strName = "";		--记录玩家的姓名
	obj.strBangPai = "";	--帮派名称
	obj.dwBangPaiID = 0;	--帮派的ID
	return obj;
end
--搜索结果保存的数据结构
_G.sSearchMessage = {};
function sSearchMessage:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--记录对方的ID
	obj.dwLevel = 0;		--等级
	obj.dwProf = 0;			--职业
	obj.dwHead = 0;			--头像的ID
	obj.strName = "";		--玩家姓名
	obj.strBangPai = "";	--帮派名称
	obj.dwBangPaiID = 0;	--帮派的ID
	return obj;
end
--好友平台的信息内容
_G.SPlatformMessage = {};
function SPlatformMessage:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--记录对方的ID
	obj.dwLevel = 0;		--等级
	obj.dwProf = 0;			--职业
	obj.dwHead = 0;			--头像的ID
	obj.strName = "";		--玩家姓名
	obj.strBangPai = "";	--帮派名称
	obj.dwBangPaiID = 0;	--帮派的ID
	obj.dwVip = 0;			--0不是VIP，1是VIP
	obj.strMessage = "";	--征婚的信息
	obj.dwSameEnemy = 0;	--有几个共同仇人
	obj.szSign = "";		--玩家签名
	return obj;
end
--共同仇人界面信息
_G.SSameEnemyMessage = {};
function SSameEnemyMessage:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;		--记录对方的ID
	obj.dwLastTime = 0;		--我最后一次被仇人击杀的时间
	obj.dwLevel = 0;		--等级
	obj.dwProf = 0;			--职业
	obj.dwHead = 0;			--头像的ID
	obj.strName = "";		--玩家姓名
	obj.strBangPai = "";	--帮派名称
	obj.dwBangPaiID = 0;	--帮派的ID
	obj.dwVip = 0;			--0不是VIP，1是VIP
	obj.dwOnLine = 0;		--0是不在线，1是在线
	return obj;
end
--查看人物属性时，回传的人物数据
_G.SPlayerPropertyViewMsg = {};
function SPlayerPropertyViewMsg:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;
	obj.dwHP = 0;
	obj.dwMP = 0;
	obj.dwHPMax = 0;
	obj.dwMPMax = 0;
	obj.dwAttack = 0;
	obj.dwDefense = 0;
	obj.dwFlee = 0;--身法
	obj.dwCrit = 0;--暴击
	obj.dwHitPercent = 0;--命中率
	obj.dwAppendCrit = 0;--暴击伤害
	obj.dwAttackSpeed = 0;
	obj.dwMoveSpeed = 0;
	obj.dwLevel = 0;
	obj.strName = "";--姓名
	obj.strMate = "";--配偶
	obj.strFaction = "";--帮派
	obj.dwProf = 0;	--职业
	obj.dwPoJiaValue=0;  --破甲
	obj.dwIgnoreDefense =0; --忽视防御
	obj.dwAppendAttack =0 ; --追加伤害
	
	obj.dwPoJiaDiKang =0;   --伤害抵御（破甲抵抗）
	obj.dwDuck =0 ;           --闪避
	obj.dwCritDown =0 ;    ---暴击抵抗
	obj.dwRemitAttack =0;   --伤害减免
	return obj;
end
--查看人物属性时，回传的人物的Avatar信息
_G.SPlayerAvatarViewMsg = {};
function SPlayerAvatarViewMsg:new( t )
	local obj = t or {};
	obj.szRoleName		= "";		--玩家名字
	obj.dwSex			= 0;		--玩家性别
	obj.dwFace			= 0;		--玩家脸型
	obj.dwHair			= 0;		--玩家发型
	obj.dwProf 			= 0;		--玩家职业
	obj.dwIncoID		= 0;		--头像ID
	obj.dwDress			= 0;		--衣服
	obj.dwHand			= 0;		--护手
	obj.dwShoe			= 0;		--鞋子
	obj.dwArms			= 0;		--武器开始的时候没有武器
	obj.dwHorseID       = 0;		--坐骑为空
	obj.dwDefDress		= 0;		--衣服
	obj.dwDefHand		= 0;		--护手
	obj.dwDefShoe		= 0;		--鞋子
	obj.dwDefHair		= 0;		--头部
	obj.dwDefFace		= 0;		--脸型
	
	--lw：增加装备的强化等级
	obj.dwDressLevel	= 0;			--衣服强化等级
	obj.dwHandLevel		= 0;			--护手强化等级
	obj.dwShoeLevel		= 0;			--鞋子强化等级
	obj.dwArmsLevel		= 0;			--武器强化等级
	
	obj.setActSuitList	= {};
	return obj;
end

_G.IssueMarryLevel = 34;























