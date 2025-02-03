--[[
功能：闭关系统的配置
作者：刘炜
时间：2012-2-8
]]

_G.MuseConfig = {};

MuseConfig.dwDoubleItem = 2500030; --双倍领取的道具ID
MuseConfig.dwMaxMuseTime = 12*3600;--闭关最长时间12h，单位：秒

local ZhenQiModulus = 
	{
		2.5,
		5,
		7.5,
		10,
		12.5,
		15,
	};

function MuseConfig:CountMuseValue(dwMuseTime,isVip,isDouble,dwLevel,dwMaxExp)
	local dwHour = math.floor(dwMuseTime/3600);							--取小时数
	local dwMinute	= math.floor(dwMuseTime%3600)/60;					--取分钟数
	local ZhenQiAward = 2.5
	
	if math.floor(dwLevel/20)+1 >6 then
		ZhenQiAward = ZhenQiModulus[6]
	else
		ZhenQiAward = ZhenQiModulus[math.floor(dwLevel/20)+1]
	end
	
	if dwLevel <= 20 then
		dwLevel	= 20
	end
	
	local ExpAward	=	RoleUpLevelConfig[dwLevel].dwPulseParam / 720	--获取每分钟经验收益
		
	dwHour = math.floor(dwHour);
	dwMinute = math.floor(dwMinute);
	
	local tInfo = {};
	
	tInfo.dwExp = 0;--经验
	tInfo.dwZhenqi = 0;--金真气
	--vip的改变
	tInfo.dwVipUpExp = 0;
	tInfo.dwVipUpZhenqi = 0;
	
	if isVip then
		--计算基本值
		tInfo.dwExp = math.floor((dwHour*60+dwMinute) * ExpAward);
		tInfo.dwZhenqi = math.floor((dwHour*60+dwMinute) * ZhenQiAward);
		--显示用
		tInfo.dwVipUpExp = tInfo.dwExp;
		tInfo.dwVipUpZhenqi = tInfo.dwZhenqi;
	else
		tInfo.dwExp = math.floor((dwHour*60+dwMinute) * ExpAward);
		tInfo.dwZhenqi = math.floor((dwHour*60+dwMinute) * ZhenQiAward);
	end
	
	if isDouble then
		tInfo.dwExp = tInfo.dwExp*2;
		tInfo.dwZhenqi = tInfo.dwZhenqi*2;
		tInfo.dwVipUpExp = tInfo.dwVipUpExp*2;
		tInfo.dwVipUpZhenqi = tInfo.dwVipUpZhenqi*2;
	end

	return tInfo;
end;

local arrMuseEffect = 
{
	"ui_bg_bg_01",
	"ui_bg_bg_02",
	"ui_bg_bg_03",
}

--返回当前时间显示的特效名字
function _G.GetNowShowEffect(dwTimeLength)
	if dwTimeLength < 3600 then
		return arrMuseEffect[1];
	elseif dwTimeLength < 3600*5 then
		return arrMuseEffect[2];
	else
		return arrMuseEffect[3];
	end
end;

--灌注成功的特效
MuseConfig.szGuanZhuSucceedEffect="biguan_guanzhu_01"  
--增加时间的特效
MuseConfig.szAddTimeEffect="biguan_jindu_01";

--灌注的配置
_G.InjectConfig = 
{
	--每次灌注增加的时间，单位：秒
	dwInjectTime = 10*60;
	--灌注角色的等级差
	dwLevelDistance = 20;
	
	szHour='小时';
	szMinute='分';
	szFriendNotOnlineError="角色不在线";
	
	--领取奖励时给的礼金
	dwRewardLiJin=50;
	--被灌注多少次可以领取一次奖励
	dwRewardCountNeed = 12;
	
	--每天重置的时间
	szResetTime = "00:05";
	
	--每个好友可以灌注的次数
	dwFriendInjectMax = 1;
	
	szHoverJuQiVIP="已灌注次数:%d/%d次\n每被灌注%d次,可领取一次奖励。\n玩家每天可给同一个好友灌注一次真气。";
	szHoverJuQi="已灌注次数:%d/%d次(开通VIP可增加12次聚气次数)\n每被灌注%d次,可领取一次奖励。\n玩家每天可给同一个好友灌注一次真气。";
	
	--领奖提示
	szHoverCanObtainGift="<font color='#31cf32'>可领取<br/><font color='#ca9754'>领取礼包后可获得50礼金</font>";
	szHoverCanntObtainGift="<font color='#f15d27'>未达成<br/><font color='#ca9754'>领取礼包后可获得50礼金</font>";
	
	szHoverReward="领取礼包后可获得%d礼金";
	szDiaryRecord="%s 玩家%s为你灌注真气，您的闭关时间增加%d分钟，您获得聚气值+%d\n";
	
	--在聊天框中显示的灌注提示
	szNotYourFriend="只有好友才可以灌注，请先加该玩家为好友.";
	
	szGuanZhuFailed="灌注失败。";
	szNotHaveEnoughJuQi="您的聚气次数不足，无法领取奖励";
	szYouAlreadyGetTheGift="您已领取过奖励，无法重复领取";
	szJuQiFullInfo="好友聚气值已满，无法灌注。";
	szYouAlreadyInject="您已经为Ta灌注过了。";
	szCanNotOpenGuanZhu="等级相差20级以内才可以灌注";
	
	--灌注超链接
	szGuanZhuFeedback="玩家为您灌注了真气.您的闭关时间增加10分钟,聚气值+1,%s";
	szGuanZhuFeedbackHttp="为Ta灌注";
	
	szAddExpTips = "经验+%d";
	
	--最大被灌注次数
	funcBeInjectMax = function(isVip)
		if isVip == nil or isVip == 0 or isVip == false then
			return 12;
		else
			return 24;
		end
	end;
	
	--每次灌注获得的经验
	--dwMyLevel：我的等级；dwOtherLevel--目标等级；dwNowCount--我当前已经灌注的次数
	funcInject = function(dwMyLevel,dwOtherLevel,dwNowCount)
		local cishu = 10 + dwMyLevel / 5  
		if dwNowCount > cishu then
			return 0;
		end
		local nExp 	= dwMyLevel * (dwMyLevel*(5+dwMyLevel/20))*0.1
		return math.floor(nExp);
	end;
}

