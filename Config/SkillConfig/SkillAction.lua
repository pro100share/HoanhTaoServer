--位移的行为需要加下面代码

-- 	bIsSkipMoveAction = true; --该类行为必须有这个字段 
--	dwShowType = 2;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
 
_G.TargetPfxConfig =
{
	[1001] =
	{
		dwType = 1;  --飞行
		dwTime = 122, --飞行时间
		dwPfx = 1,  	--对应的特效配置编号
	},
	[1002] =
	{
		dwType = 2; -- 爆炸
		dwTime =0;	--爆炸延迟时间
		dwPfx = 4, --对应的特效配置
	}
} 

_G.SkillShakeConfig =
{
	[1] ={timeLen = 1000,timeTime=2},
	[2] ={timeLen = 2000,timeTime=2},
	[3] ={timeLen = 3000,timeTime=2},
}
 

_G.SkillAction = {
--------------被攻击动作
	[2] = 
	{--行为1002
		{--动作1 --被攻击
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00201;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
--------------死亡
	[3] = 
	{--行为
		{--动作1 --被攻击
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = true;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00100;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
--------------打坐
	[4] = 
	{--行为
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = true;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
--------------吃宴席动作
	[5] = 
	{--行为
		{--动作1 --吃宴
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00400;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	
	--人被击退
	[6] = 
	{
		per = 1000;				--概率
		bLoop = false;	--是否需要一直播放
		bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
		AnimaID = 00201;			--动作ID
		szSelfPoint ="rwh";			--自身相关点，发射或者接收点
		bIsFlyToMe = false;			--是否飞向自己	
		bIsSkipMoveAction = true; --该类行为必须有这个字段 
		dwShowType = 1;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
	};
	
	--怪物被击退
	[7] = 
	{
		per = 1000;				--概率
		bLoop = false;	--是否需要一直播放
		bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
		AnimaID = 5;			--动作ID
		szSelfPoint ="rwh";			--自身相关点，发射或者接收点
		bIsFlyToMe = false;			--是否飞向自己	
		bIsSkipMoveAction = true; --该类行为必须有这个字段 
		dwShowType = 1;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
	};
	
--------演武动作
	[8] = 
	{--行为
		{--动作1 --演武
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = true;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00500;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	
	--怪物远程攻击
	[9] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = true;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 08;			--动作ID
			szSelfPoint ="cs";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	
	--怪物被打死飞出去
	[10] = 
	{
		per = 1000;				--概率
		bLoop = false;	--是否需要一直播放
		bDelay = true;	--是否需要播放完延迟，0不需要，1需要，比如死亡
		AnimaID = "Dead";			--动作ID
		szSelfPoint ="rwh";			--自身相关点，发射或者接收点
		bIsFlyToMe = false;			--是否飞向自己	
		bIsSkipMoveAction = true; --该类行为必须有这个字段 
		dwShowType = 1;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
	};
	--------习武动作
	[11] = 
	{--行为
		{--动作1 --习武动作
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00600;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--------习武动作 ---恭喜成功
	[12] = 
	{--行为
		{--动作1 --习武动作
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00700;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--------习武动作 ---悲剧失败
	[13] = 
	{--行为
		{--动作1 --习武动作
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00800;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--------采集动作
	[14] = 
	{--行为
		{--动作1 --习武动作
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 00900;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
------------------------------------------------------------------------
	[2000] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 031;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 032;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 033;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 034;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
--[[
	[2001] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 001;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	
	[2002] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 001;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	
	[2003] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 001;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[2004] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 001;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[2005] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[2006] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 011;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--]]
	
------------------------怪物通用动作100 单体 110线性 120扇形 130圆形 140自身--------------------------
	--单体
	[110] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[111] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 011;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[112] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 012;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[113] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 013;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--线性
	[120] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 020;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[121] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 021;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[122] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 022;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[123] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 023;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	--扇形
	[130] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 030;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--扇形
	[131] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 031;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[132] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 032;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[133] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 033;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[135] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 035;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[136] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 036;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	--圆形1
	[140] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 040;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--圆形2
	[141] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 041;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[142] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 042;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[143] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 043;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[144] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 037;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	--自身
	[150] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 050;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[151] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 051;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[152] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 052;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[153] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 053;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--弩车
	[200] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="ll";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--黄药师单体
	[201] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="dummy01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 40000;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--天元单体
	[202] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="bip01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 40001;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--宠物技能 ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓
	[20000001] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 930;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[20000002] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 931;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	[20000003] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 932;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000004] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 933;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000005] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 934;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000006] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 935;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000007] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 041;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000008] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 937;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000009] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 938;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000010] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 939;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000011] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 940;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000012] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 941;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000013] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 942;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000014] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 943;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000015] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 944;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000016] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 945;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[20000017] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 946;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[20000018] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 947;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[20000019] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 948;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[20000020] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 949;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[20000021] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 950;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[20000022] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 951;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	[20000023] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 952;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	[20000024] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 953;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	[20000025] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 954;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	[20000026] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 955;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	[20000027] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 956;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	[20000036] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 920;			--动作ID
			szSelfPoint ="feetpoint";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
	--宠物技能 ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ ↑ 
	--柯镇恶单体
	[203] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="bip01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 40002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--一灯大师单体特效 玩家身上播放
	[204] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="bip01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 40003;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--投石车
	[205] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="dummy01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 999;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--黄蓉 技能01  玩家身上播放
	[206] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="bip01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 40004;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--杨过，打飞出去
	[207] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 010;			--动作ID
			szSelfPoint ="bip01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 40005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--新欧阳锋，受攻击，玩家身上播
	[208] = 
	{
		{--动作1
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 040;			--动作ID
			szSelfPoint ="bip01";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 40006;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
-----------------------------------------通用
	[5000] = 
	{----通用掌法
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 03200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[5001] = 
	{----通用拳法
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 03100;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	
----------------------------跳跃行为例子
	[5101] = 
	{----通用拳法
		bIsSkipMoveAction = true; --该类行为必须有这个字段 
		dwShowType = 0;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置）
		AnimaID = 02400;			--动作ID，
	};
----------------------------招式
	[11003] = 
	{----狮子吼
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02100;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11004] = 
	{----蛤蟆功
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11005] = 
	{----七伤拳
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 11005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11006] = 
	{----黯然销魂掌
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02400;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11007] = 
	{----六脉神剑
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 03000;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11008] = 
	{----乾坤大挪移
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02600;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11009] = 
	{----降龙十八掌
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02700;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11010] = 
	{----大力金刚掌
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02800;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11011] = 
	{----化骨绵掌
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02900;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11012] = 
	{----一阳指
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02000;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 11012;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	--------------飞行动作
	[11013] = 
	{--行为
		--{--动作1 --飞行动作
			per = 1000;					--概率
			bLoop = false;				--是否需要一直播放
			bDelay = false;				--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01600;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		--};
		bIsSkipMoveAction = true; --该类行为必须有这个字段 
		dwShowType = 1;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置
		--AnimaID = 01600;			--动作ID，
	};
	
	--------------瞬步动作  前冲
	[11014] = 
	{--行为
		--{--动作1 --瞬步动作	前冲
			per = 1000;					--概率
			bLoop = false;				--是否需要一直播放
			bDelay = false;				--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01800;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		--};
		bIsSkipMoveAction = true; --该类行为必须有这个字段 
		dwShowType = 1;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置
		--AnimaID = 01600;			--动作ID，
	};
	
	--------------瞬步动作	急退
	[11015] = 
	{--行为
		--{--动作1 --瞬步动作	急退
			per = 1000;					--概率
			bLoop = false;				--是否需要一直播放
			bDelay = false;				--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01900;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		--};
		bIsSkipMoveAction = true; --该类行为必须有这个字段 
		dwShowType = 1;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置
		--AnimaID = 01600;			--动作ID，
	};
	[11016] = 
	{----金钟罩
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02800;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 11012;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11017] = 
	{----弹指神功
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 02500;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 11012;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11018] = 
	{----易筋经 法身降魔咒
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 03300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 11012;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
---------------------------------------------------
	
	[11001] = 
	{----春回  通用施法动作
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 05000;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[11002] = 
	{----自杀  施法动作
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 05300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	-----内功
	[12001] = 
	{----  苍寒诀
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12002] = 
	{----  通用施法动作
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04400;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12003] = 
	{----  通用施法动作
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12004] = 
	{----  通用施法动作
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04100;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12005] = 
	{----  狂澜势
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04301;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12006] = 
	{----  朝天阙
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04302;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12007] = 
	{----  盅刃
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04303;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12008] = 
	{----  五毒奇经
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04304;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12009] = 
	{----  七杀心经
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04305;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12010] = 
	{----  画地为牢
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04306;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12011] = 
	{----  紫霞神功
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04307;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12012] = 
	{----  玄冥神掌
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04308;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[12013] = 
	{----  无相神功
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 04309;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	-------------------------剑技能
	------------普通攻击
	[21000] = 
	{--行为20000
		{--动作1 
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		{--动作2
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	
	};
    ------------剑-21001
	[21001] = 
	{----剑技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01201;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 210010;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		--AnimaID = 01600;			--动作ID，
		
	};
    ------------剑-21002
	[21002] = 
	{----剑技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01202;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------剑-21003
	[21003] = 
	{----剑技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01203;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------剑-21004
	[21004] = 
	{----剑技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01204;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		

	};
    ------------剑-21005
	[21005] = 
	{----剑技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01205;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
		--	dwTargetPfx = 21005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		--[[
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01205;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			bIsSkipMoveAction = true; --该类行为必须有这个字段 
			dwShowType = 2;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
	--]]
	};
    ------------剑-21006
	[21006] = 
	{----剑技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01206;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
		--	dwTargetPfx = 21005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	-------------------------------------刀技能
	-------------------------刀技能
	------------普通攻击
	[31000] = 
	{--行为30000
		{--动作1 
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		{--动作2
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------刀-31001
	[31001] = 
	{----刀技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01201;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 310010;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------刀-31002
	[31002] = 
	{----刀技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01202;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------刀-31003
	[31003] = 
	{----刀技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01203;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------刀-31004
	[31004] = 
	{----刀技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01204;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------刀-31005
	[31005] = 
	{----刀技能
		--{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01205;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 31005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
			bIsSkipMoveAction = true; --该类行为必须有这个字段 
			dwShowType = 2;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
		--};
	};
    ------------刀-31006
	[31006] = 
	{----刀技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01206;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
			-- bIsSkipMoveAction = true; --该类行为必须有这个字段 
		};
	};	
	-------------------------------------枪技能
	-------------------------枪技能
	------------普通攻击
	[41000] = 
	{--行为
		{--动作1 
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		{--动作2
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------枪-41001
	[41001] = 
	{----枪技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01201;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------枪-41002
	[41002] = 
	{----枪技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01202;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------枪-41003
	[41003] = 
	{----枪技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01203;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------枪-41004
	[41004] = 
	{----枪技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01204;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------枪-41005
	[41005] = 
	{----枪技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01205;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 41005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
			--bIsSkipMoveAction = true; --该类行为必须有这个字段 
			--dwShowType = 2;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
		};
	};
    ------------枪-41006
	[41006] = 
	{----枪技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01206;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 41005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
			--bIsSkipMoveAction = true; --该类行为必须有这个字段 
			--dwShowType = 2;				--0表示不显示，t时间后直接出现在制定位置，1代表，插值到制定位置（位移到指定位置），2代表带残影到制定位置
		};
	};	
	-------------------------------------镰技能
	-------------------------镰技能
	------------普通攻击
	[51000] = 
	{--行为30000
		{--动作1 
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
		{--动作2
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------镰-51001
	[51001] = 
	{----镰技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01201;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 51001;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------镰-51002
	[51002] = 
	{----镰技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01202;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------镰-51003
	[51003] = 
	{----镰技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01203;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------镰-51004
	[51004] = 
	{----镰技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01204;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 10002;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------镰-51005
	[51005] = 
	{----镰技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01205;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 51005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
    ------------镰-51006
	[51006] = 
	{----镰技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01206;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			-- dwTargetPfx = 51005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	---------结婚技能
	[60000] = 
	{----结婚技能1
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 05100;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
		};
	};
	[60001] = 
	{----结婚技能2
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 05400;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己
		};
	};
	[60004] = 
	{----结婚技能4 海誓山盟
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 05500;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己
		};
	};
	[61000] = 
	{----XP测试技能
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01205;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			dwTargetPfx = 21005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	[61001] = 
	{----无双 技能行为
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01700;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 21005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};
	
	-----------------------------------------小猪快跑
	[52000] = 
	{----人推猪（各职业通用）
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01300;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 21005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};	
	[52001] = 
	{----人拉猪（各职业通用）
		{
			per = 1000;				--概率
			bLoop = false;	--是否需要一直播放
			bDelay = false;	--是否需要播放完延迟，0不需要，1需要，比如死亡
			AnimaID = 01200;			--动作ID
			szSelfPoint ="rwh";			--自身相关点，发射或者接收点
			bIsFlyToMe = false;			--是否飞向自己	
			--dwTargetPfx = 21005;  --索引到respfxconfig.lua文件里的ID，指定特效爆炸/等特效
		};
	};		
};


 