------------------------------------
--游戏信息配置
------------------------------

------------------------------
--创建角色配置
------------------------------
_G.enProfType =
{
	eProfType_Sickle 	= 1;		--镰刀
	eProfType_Knife 	= 2;		--刀
	eProfType_Sword 	= 3;		--剑
	eProfType_Spear 	= 4;		--枪
}
_G.CreateRoleConfig = 
{
--场景配置
	SceneConfig = 
	{	
		szSceneFile = "denglujiemian.sen",			--场景名称
		fXPos = -19.90;
		fYPos = -22.00;
		fDirValue = -0.45;
		vecCameraEye = _Vector3.new( -22, -26, 2);	--摄像机位置
		fCameraFov = 40;
		fCameraLookHight = 2.5;
		-----------------------------------------------------
		dwSceneDifColor = 	0xffa8c6d7;			--漫反射
		dwSceneSpeColor =	0xffa8c6d7;			--0xffbb55bb;--镜面
		dwSceneSpecular =	10;					--镜面强度  
		fSkyLightPower = 0.5;					--普通环境光强度
		--------------------------------
		dwAmbientLight= 0xff555555;--普通场景方向光，空代表使用编辑器输出的光 
		dwSkyLight= 0xff555555;
		-----------------------------------------------------
		dwTerrainSkyColor = 0xff999999;			   --场景渲染光颜色，场景的特殊处理，用于增加地表面亮度
		vecTerrainSkyDir = _Vector3.new( 0, 1, -1 ); --场景渲染光方向，场景的特殊处理，用于增加地表面亮度\
		dwTerrainSkyPower = 0.5; --场景渲染光方向，场景的特殊处理，用于增加地表面光强度
	}; 
	--战斗状态待机动作
	dwAttackIdleAnimaID  = 001400;
	--战斗状态跑步（移动）动作
	dwAttackMoveAnimaID =  001500;
	--非战斗状态待机动作
	dwIdleAnimaID  = 001000;
	--非战斗状态跑步（移动）动作
	dwMoveAnimaID =  001100;
	--炫耀行为
	dwFlauntAnimaID  = 009000;
	--选择行为
	dwSelectAnimaID  = 005100;
--2职业配置
	ProfConfig =
	{
		[enProfType.eProfType_Sickle]= --镰刀
		{ 
			HeadMap = --对应的头像配置
			{
				[1] = 1001,
				[2] = 1002,
				[3] = 1003,
			},
			--骨骼ID
			SklID = 1; 
			--选择角色
		    BodyModelID = 103006; 	--身体
			HandModelID = 104006;  	--手
			FeetModelID = 105006;	--脚
			ArmsModelID = 106005;	--炫耀武器
			--初始默认模型 
		    DefBodyModelID = 103000;--初始身体
			DefHandModelID = 104000;--初始手
			DefFeetModelID = 105000;--初始脚
			FlauntPfx    = 10001;
			--拿的武器，0代表不拿武器
			--角色相关摄像机配置
			dwCameraHeight  = 1.0;			--最低点的时候的高度
			dwCameraDistince = 0.9;			--最低点时候的距离
			dwSoundId = 3012;
	
		};		
		[enProfType.eProfType_Knife]= --刀
		{
			HeadMap = --对应的头像配置
			{
				[1] = 2001,
				[2] = 2002,
				[3] = 2003,
			},
			--骨骼ID
			SklID = 2;
			--固定模型配置
			HairModelID = 201000;
			FaceModelID = 201000;
			--选择角色
		    BodyModelID = 203005; 	--身体
			HandModelID = 204005;  	--手
			FeetModelID = 205005;	--脚
			ArmsModelID = 206006;	--炫耀武器
			--初始默认模型 
		    DefBodyModelID = 203000;--初始身体
			DefHandModelID = 204000;--初始手
			DefFeetModelID = 205000;--初始脚
			FlauntPfx    = 10001;
			--拿的武器，0代表不拿武器
				--角色相关摄像机配置
			dwCameraHeight  = 1.3;			--最低点的时候的高度
			dwCameraDistince = 2.1;			--最低点时候的距离
			dwSoundId = 3009;
		};		
		[enProfType.eProfType_Sword]= --剑
		{
		HeadMap = --对应的头像配置
			{
				[1] = 3001,
				[2] = 3002,
				[3] = 3003,
			};
			--骨骼ID
			SklID = 3;
			--模型配置
			HairModelID = 301000;
			FaceModelID = 302000;
		    --选择角色
		    BodyModelID = 303005; 	--身体
			HandModelID = 304005;  	--手
			FeetModelID = 305005;	--脚
			ArmsModelID = 306006;	--炫耀武器
			--初始默认模型 
		    DefBodyModelID = 303000;--初始身体
			DefHandModelID = 304000;--初始手
			DefFeetModelID = 305000;--初始脚
			FlauntPfx    = 10001;
			--拿的武器，0代表不拿武器
				--角色相关摄像机配置
			dwCameraHeight  = 1.4;			--最低点的时候的高度
			dwCameraDistince = 2.1;			--最低点时候的距离
			dwSoundId = 3010;
		};		
		[enProfType.eProfType_Spear]= --枪 
		{
		HeadMap = --对应的头像配置
			{
				[1] = 4001,
				[2] = 4002,
				[3] = 4003,
			};
			--骨骼ID
			SklID = 4;
			--模型配置
			HairModelID = 401000;
			FaceModelID = 402000;
		    --选择角色
		    BodyModelID = 403006; 	--身体
			HandModelID = 404006;  	--手
			FeetModelID = 405006;	--脚
			ArmsModelID = 406006;	--炫耀武器
			--初始默认模型 
		    DefBodyModelID = 403000;--初始身体
			DefHandModelID = 404000;--初始手
			DefFeetModelID = 405000;--初始脚
			FlauntPfx    = 10001;
			--拿的武器，0代表不拿武器
				--角色相关摄像机配置
			dwCameraHeight  = 1.15;			--最低点的时候的高度
			dwCameraDistince = 1.2;			--最低点时候的距离
			dwSoundId = 3011;
			
		};		
	};
--佩服配置
};
--0:从小到大 1:从大到小
_G.SelectLineSort = {
	sortId = function (day, num)
		if day >= 2 then
			if num <= 200 then
				return 1;
			else
				return 0
			end;
		end;
		return 0;
		-- if day >= 2 and num <=2 then
			-- return 1
		-- else
			-- return 0;
		-- end;
	end
}