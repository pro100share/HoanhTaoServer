
--系统设置配置文件

_G.SSettingInfo = {};
function SSettingInfo:new( t )
	local obj = t or {};
	obj.dwRoleID = 0;			--玩家的角色ID
	obj.dwOthersModel = 1;	--隐藏显示周围玩家模型
	obj.dwRoleLight = 1;		--关闭开启角色高清效果（引擎角色打光）
	obj.dwRoleShadow = 0;		--关闭开启角色阴影效果（引擎角色阴影）--开启所有阴影
	obj.dwEnvShadow = 0;		--关闭场景阴影效果，场景高清效果
	obj.dwOthersShadow = 1;		--周围玩家的阴影--角色阴影
	obj.dwMonsterShadow = 0;	--周围怪物的阴影--关闭所有阴影
	obj.dwBGMOpen = 1;		--背景音乐开启关闭
	obj.dwBGMVolume = 35;		--背景音乐音量大小，0~100
	obj.dwSFXOpen = 1;		--游戏音效声音开启关闭
	obj.dwSFXVolume = 25;		--游戏音效声音大小
	obj.dwIncomeTips = 1;		--隐藏/显示玩家收益提示界面
	obj.dwOthersBlood = 1;	--其他玩家的血条
	obj.dwMyBlood = 1;		--自己的血条
	obj.dwOthersName = 1;		--周围玩家头顶的姓名
	obj.dwOthersPopText = 0;	--隐藏其他玩家头顶跳字信息
	obj.dwBeAddedNotice = 1;	--拒绝弹出被加为好友提示图标
	obj.dwAcceptPrivate = 1;	--拒绝接收私聊信息
	obj.dwAcceptTeam = 1;		--发起方无法向接收方发送组队邀请消息
	obj.dwAcceptFaction = 1;	--发起方无法向接收方发送世家邀请消息
	obj.dwAcceptTrade = 1;	--发起方无法向接收方发送交易消息
	obj.dwAcceptProposal = 1;	--发起方无法向接收方发送求婚消息
	obj.dwSkillShake = 1;		--屏蔽技能震屏效果
	obj.dwFloodLight = 1;--开启（1）或关闭（0）全屏泛光
	obj.dwWeather = 0;	--默认关闭天气
	obj.dwOthersPopTextCnd = 0;	--隐藏显示他人的头顶跳字，除了夫妻队友以外的
	obj.dwMonsterName = 0;		--隐藏显示怪物名字
	obj.dwMonsterBlood = 0;		--隐藏显示怪物血条
	obj.dwMyPopText = 1;		--隐藏显示自己头顶的跳字
	obj.dwHurtNotice = 1;	--显示被击提示
	obj.dwAutoMartial = 1;  --自动演武
	return obj;
end






