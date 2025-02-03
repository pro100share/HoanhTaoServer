
--宠物从表里随机说一句话，返回说话的索引ID
local function PetRandomTalk(tabTalk, dwPetID)
	if not tabTalk then return  end;
	
	local retTab = {}
	
	if not dwPetID then 
		retTab = tabTalk.all
	else
		retTab = tabTalk[dwPetID]
	end
	
	if not retTab then 
		retTab = tabTalk.all
	end
	
	if #retTab == 0 then return  end;
	
	local randomTalkIndex = math.random(1, #retTab)
	return retTab[randomTalkIndex];
end

--客户端的事件
_G.EventByClient = 
{
	Event_LockPet = 1;
	Event_PetUseSkill = 2;
	Event_RideMount = 3;
	Event_TeamMemberDead = 4;
	Event_BossRefresh = 5;
	Event_YZXYBegin = 6;
	Event_RoleLevelUp = 7;
	Event_AmultUp = 8;
	Event_LockRole = 9;
	
	Event_Team = 10;--加成数
	Event_Mission = 11;--活动ID，开启标志(0,1)
	Event_Vip = 12;--true,false
	Event_Trophy = 13;--加成数
	Event_Guild = 14;--世家等级
	Event_Leader = 15;--自己的职位
	Event_Marriage = 16;--true，false
}

--宠物使用技能说话
local arrPetSkillTalk = 
{
---50710015   杨虎
---10021030   康兴哥
---10021015   许竹青
---10051001   周伯通
---10092007   李莫愁
---10051003   黄药师
---10082007   洪七公
---10071007   欧阳锋
---50302063  小龙女
---10061001  一灯大师
	[50710015] = --宠物ID
	{
		101,102--[技能ID] = 说的话
	};
	[10021030] = --宠物ID
	{
		201,202--[技能ID] = 说的话
	};
	[10021015] = --宠物ID
	{
		302,202--[技能ID] = 说的话
	};
	[10051001] = --宠物ID
	{
		401,402--[技能ID] = 说的话
	};
	[10092007] = --宠物ID
	{
		502,503--[技能ID] = 说的话
	};
	[10051003] = --宠物ID
	{
		601,603--[技能ID] = 说的话
	};
	[10082007] = --宠物ID
	{
		701,703--[技能ID] = 说的话
	};
	[10071007] = --宠物ID
	{
		801,802--[技能ID] = 说的话
	};
	[50302063] = --宠物ID
	{
		901,903--[技能ID] = 说的话
	};
	[10061001] = --宠物ID
	{
		1003,1001--[技能ID] = 说的话
	};
}

local dwUseSkillTalk = 100;

--宠物在事件下说的话
_G.PetEventToTalk = 
{
	[EventByClient.Event_LockPet] = function(dwPetID,dwRoleID)
		if dwRoleID ~= CPlayerSystem:GetRoleID() then
			return;
		end
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_LockPet]);
	end;
	[EventByClient.Event_PetUseSkill] = function(dwPetEnumID,dwSkillID)
		local dwUseRank = math.random(1000);
		
		if dwUseRank <= dwUseSkillTalk then
			local tbList = arrPetSkillTalk[dwPetEnumID];
			if tbList then
				local dwRnd = math.random(1,#tbList);
				
				return tbList[dwRnd];
			end
		end
	end;
	[EventByClient.Event_RideMount] = function(dwPetID)
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_RideMount], dwPetID);
	end;
	[EventByClient.Event_TeamMemberDead] = function(szRoleName)
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_TeamMemberDead]);
	end;
	[EventByClient.Event_BossRefresh] = function(dwPetID)
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_BossRefresh], dwPetID);
	end;
	[EventByClient.Event_YZXYBegin] = function(dwPetID)
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_YZXYBegin]);
	end;
	[EventByClient.Event_RoleLevelUp] = function(dwPetID)
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_RoleLevelUp]);
	end;
	[EventByClient.Event_AmultUp] = function(dwPetID)
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_AmultUp]);
	end;
	[EventByClient.Event_LockRole] = function(dwRoleID)
		if CMarriageSystem:GetMateRoleID() ~= dwRoleID then
			return ;
		end
		
		return PetRandomTalk(_G.PetEvent2Talk[EventByClient.Event_LockRole]);
	end;
}


--宠物所有说的话
_G.PetTalkString = 
{

-------杨虎
	[101] = "别怕，我来助你！";
	[102] = "收拾你们，可比锻造名剑容易多了！";
	[103] = "看你悟性这么高，不如跟我学学打铁的功夫吧！";
	[104] = "千锤百炼，精益求精！";
-------康兴哥
	[201] = "不露几手真功夫，你们还真不知道哥的厉害！";
	[202] = "怕了吧？我还没出全力呢！";
	[203] = "你的功夫好像变强了！";
	[204] = "恭喜少侠功力更进一层！";
-------许竹青
	[301] = "习武之人，侠义为先。";
	[302] = "就这么点本事，还想挑战本大爷！！";
	[303] = "几日不见，少侠武功竟精进如斯！";
	[304] = "少侠武艺超群，老夫佩服。";
-------周伯通
	[401] = "好兄弟！看大哥给你露一手！ ";
	[402] = "好玩好玩，我还要打！";
	[403] = "好兄弟，你的功夫进步很快啊！";
	[404] = "好兄弟，在这么下去，大哥可不是你的对手了！";
-------李莫愁
	[501] = "问世间，情是何物，直教人生死相许。";
	[502] = "难道你没听过赤练仙子的名号么？";
	[503] = "哼，我要是练成了玉女心经，功力岂能在你之下？";
	[504] = "你进步如此之快，简直匪夷所思！";
-------黄药师
	[601] = "桃花影落飞神剑，碧海潮生按玉箫。";
	[602] = "你的悟性可比我那笨蛋女婿强多了！";
	[603] = "哼！想跟我打，还要再练练！";
--	[604] = "不露几手真功夫，你们还真不知道哥的厉害！";
-------洪七公
	[701] = "老叫化来会会你！";
	[702] = "小娃娃，你可尝过皇帝老儿的鸳鸯五珍烩？啧啧，真是人间美味啊…";	
	[703] = "让你尝尝什么叫打狗棍法！！";	
-------欧阳锋
	[801] = "气血逆行，冲天柱穴？嗯…不对不对。";
	[802] = "好深的功力...你是老毒物？";
-------小龙女
	[901] = "过儿？过儿是你么？";
	[902] = "少侠进境之快，恐怕连过儿赶不上你。";
	[903] = "接招！";
-------一灯大师
	[1001] = "老衲法号一灯。善哉、善哉！";
	[1002] = "施主好慧根，不如随老衲一起遁入佛门吧！";
	[1003] = "苦海无边，回头是岸！";
	--[1004] = "施主！";

}

--宠物对应事件可能说的话
---50710015   杨虎
---10021030   康兴哥
---10021015   许竹青
---10051001   周伯通
---10092007   李莫愁
---10051003   黄药师
---10082007   洪七公
---10071007   欧阳锋
---50302063  小龙女
---10061001  一灯大师

_G.PetEvent2Talk = 
{
	--[_G.EventByClient.Event_LockPet] = {[50710015] = {101,102,}, all = {201,104}};
	--[_G.EventByClient.Event_RideMount] = {1,2,};
	--[_G.EventByClient.Event_TeamMemberDead] = {1,2,};
	--[_G.EventByClient.Event_BossRefresh] = {1,2,};
	--[_G.EventByClient.Event_YZXYBegin] = {1,2,};
	--[_G.EventByClient.Event_RoleLevelUp] = {all = {201,104}};
	--[_G.EventByClient.Event_LockRole] = {1,2,};
}



