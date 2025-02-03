_G.RenderConfig = {}

_rd.glowFactor = 0.6; 
_rd.lightFactor = 1.5;
_rd.shadowQuality = 0.7;
--_rd.blockColor = 0xffaaaaaa;  --穿透颜色
--_rd.blockQuality = 0.8  --透明质量
RenderConfig.szMissMeshName = "X_ZhuJue_Qiang_Tou_001.skn"; --未下载完成的模型
RenderConfig.szDummyMeshName = "NPC_BaoFu.skn"; --超过一定数量后的模型
RenderConfig.dwDummyMeshCount = 60; --默认的低级模型数量

--------------------------------------------------------------------------------
--灯光配置
--------------------------------------------------------------------------------  
RenderConfig.fRoleShadowLight = 10;	--角色影子长短配置数值越大，影子越短
--------------------------------------------------------------------------------
--角色渲染效果配置
--------------------------------------------------------------------------------
	--武器
RenderConfig.dwItemDifColor = 	0xffffffff;--漫反射
RenderConfig.dwItemSpeColor =	0xffffffff;--镜面
RenderConfig.dwItemSpecular =	3;	--镜面强度
	---角色 

RenderConfig.dwRoleDifColor = 0xff505050;--漫反射r,g,b00--ff
RenderConfig.dwRoleSpeColor = 0xff000000;	--0xff997788;--镜面
RenderConfig.dwRoleSpecular =	20;	--镜面强度
--------------------------------------------------------------------------------
--摄像机相关配置
--------------------------------------------------------------------------------
RenderConfig.dwMaxHeight = 27;			--最高点的时候的高度29
RenderConfig.dwMinHeight = 0.7;			--用于调节最近距离时候的倾斜度

RenderConfig.fParam		=1.166;			--曲线的参数1.75
RenderConfig.fForValue = 22.0;			--广角		
RenderConfig.fWheelSpeed = 0.35;		--速度
RenderConfig.InitCameraPos = 21;		--初始位置

--------------------------------------------------------------------------------
--位移跳跃技能相关
-------------------------------------------------------------------------------- 

