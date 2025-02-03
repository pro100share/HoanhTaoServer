_G.SkipFontConfig =
{
	[1001] =
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		textColor = 0x55FF00FF;--字体颜色
		edgeColor = 0x55FF00FF;--边框颜色
		glowColor = 0x55FF00FF;--发光颜色
		StartPos = _Vector3.new(0,0,2.0);--启动的位置
		FontHeight = 1;--字体的高度
	};
	[1002] =
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		textColor = 0x55FF00FF;--字体颜色
		edgeColor = 0x55FF00FF;--边框颜色
		glowColor = 0x55FF00FF;--发光颜色
		StartPos = _Vector3.new(0,0,2.0);--启动的位置
		FontHeight = 20;--字体的高度
	};
	[1003] =			--这个是自己掉血的跳字配置
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0,0,0);--启动的位置，怪物用这个
		BindPos = 'rww';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["miss"] = _Image.new("ShanBi1.png");
			self.Num["-"] = _Image.new("Hong-.png");
			self.Num["0"] =	_Image.new( 'Hong0.png' );
			self.Num["1"] =	_Image.new( 'Hong1.png' );
			self.Num["2"] =	_Image.new( 'Hong2.png' );
			self.Num["3"] =	_Image.new( 'Hong3.png' );
			self.Num["4"] =	_Image.new( 'Hong4.png' );
			self.Num["5"] =	_Image.new( 'Hong5.png' );
			self.Num["6"] =	_Image.new( 'Hong6.png' );
			self.Num["7"] =	_Image.new( 'Hong7.png' );
			self.Num["8"] =	_Image.new( 'Hong8.png' );
			self.Num["9"] =	_Image.new( 'Hong9.png' );
		end
	};
	[1004] =				--这个是自己和敌人加血的跳字配置
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0,0,0);--启动的位置
		BindPos = 'rww';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["+"] = _Image.new("Lv+.png");
			self.Num["0"] =	_Image.new( 'Lv0.png' );
			self.Num["1"] =	_Image.new( 'Lv1.png' );
			self.Num["2"] =	_Image.new( 'Lv2.png' );
			self.Num["3"] =	_Image.new( 'Lv3.png' );
			self.Num["4"] =	_Image.new( 'Lv4.png' );
			self.Num["5"] =	_Image.new( 'Lv5.png' );
			self.Num["6"] =	_Image.new( 'Lv6.png' );
			self.Num["7"] =	_Image.new( 'Lv7.png' );
			self.Num["8"] =	_Image.new( 'Lv8.png' );
			self.Num["9"] =	_Image.new( 'Lv9.png' );
		end
	};
	[1005] =					--这个是敌人掉血的跳字配置
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0.6,0.6,-1.2);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 

			self.Num["miss"] = _Image.new("ShanBi1.png");			
			self.Num["-"] = _Image.new("Huang-.png");
			self.Num["0"] =	_Image.new( 'Huang0.png' );
			self.Num["1"] =	_Image.new( 'Huang1.png' );
			self.Num["2"] =	_Image.new( 'Huang2.png' );
			self.Num["3"] =	_Image.new( 'Huang3.png' );
			self.Num["4"] =	_Image.new( 'Huang4.png' );
			self.Num["5"] =	_Image.new( 'Huang5.png' );
			self.Num["6"] =	_Image.new( 'Huang6.png' );
			self.Num["7"] =	_Image.new( 'Huang7.png' );
			self.Num["8"] =	_Image.new( 'Huang8.png' );
			self.Num["9"] =	_Image.new( 'Huang9.png' );
		end
	};
	[1006] =				--自己属性变化时的跳字配置（增加）
	{
		PfxName ="ceshi01.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0,0,0);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["dwAttack"] =_Image.new("GongJi.png");
			self.Num["dwAttackSpeed"] = _Image.new("GongJiSuDu.png");
			self.Num["dwDefense"] = _Image.new("FangYu.png");
			self.Num["dwFlee"] = _Image.new("ShenFa.png");
			self.Num["dwMoveSpeed"] = _Image.new("YiDongSuDu.png");
			self.Num["dwMPMax"] = _Image.new("NeiLi.png");
			self.Num["dwHPMax"] = _Image.new("ShengMing.png");
			self.Num["dwCrit"] = _Image.new("BaoJi.png");
			self.Num["dwCritDown"] = _Image.new("BaoJiDiKang.png");
			self.Num["dwDefenseValue"] = _Image.new("ShangHaiDiYu.png");
			
			
			self.Num["+"] = _Image.new("Lv+.png");
			self.Num["0"] =	_Image.new( 'Lv0.png' );
			self.Num["1"] =	_Image.new( 'Lv1.png' );
			self.Num["2"] =	_Image.new( 'Lv2.png' );
			self.Num["3"] =	_Image.new( 'Lv3.png' );
			self.Num["4"] =	_Image.new( 'Lv4.png' );
			self.Num["5"] =	_Image.new( 'Lv5.png' );
			self.Num["6"] =	_Image.new( 'Lv6.png' );
			self.Num["7"] =	_Image.new( 'Lv7.png' );
			self.Num["8"] =	_Image.new( 'Lv8.png' );
			self.Num["9"] =	_Image.new( 'Lv9.png' );
		end
	};
	[1008] =					--这个是敌人被暴击
	{
		PfxName ="BaoJi.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0.6,0.6,-1.2);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["miss"] = _Image.new("ShanBi.png");
			self.Num["crit"] = _Image.new("BaoJi1.png");
			self.Num["-"] = _Image.new("Huang-.png");
			self.Num["0"] =	_Image.new( 'Huang0.png' );
			self.Num["1"] =	_Image.new( 'Huang1.png' );
			self.Num["2"] =	_Image.new( 'Huang2.png' );
			self.Num["3"] =	_Image.new( 'Huang3.png' );
			self.Num["4"] =	_Image.new( 'Huang4.png' );
			self.Num["5"] =	_Image.new( 'Huang5.png' );
			self.Num["6"] =	_Image.new( 'Huang6.png' );
			self.Num["7"] =	_Image.new( 'Huang7.png' );
			self.Num["8"] =	_Image.new( 'Huang8.png' );
			self.Num["9"] =	_Image.new( 'Huang9.png' );
		end
	};
	[1009] =				--自己属性变化时的跳字配置（减少）
	{
		PfxName ="ceshi01.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0,0,0);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["dwAttack"] =_Image.new("GongJi.png");
			self.Num["dwAttackSpeed"] = _Image.new("GongJiSuDu.png");
			self.Num["dwDefense"] = _Image.new("FangYu.png");
			self.Num["dwFlee"] = _Image.new("ShenFa.png");
			self.Num["dwMoveSpeed"] = _Image.new("YiDongSuDu.png");
			self.Num["dwMPMax"] = _Image.new("NeiLi.png");
			self.Num["dwHPMax"] = _Image.new("ShengMing.png");
			self.Num["dwCrit"] = _Image.new("BaoJi.png");
			
			self.Num["-"] = _Image.new("Hong-.png");
			self.Num["0"] =	_Image.new( 'Hong0.png' );
			self.Num["1"] =	_Image.new( 'Hong1.png' );
			self.Num["2"] =	_Image.new( 'Hong2.png' );
			self.Num["3"] =	_Image.new( 'Hong3.png' );
			self.Num["4"] =	_Image.new( 'Hong4.png' );
			self.Num["5"] =	_Image.new( 'Hong5.png' );
			self.Num["6"] =	_Image.new( 'Hong6.png' );
			self.Num["7"] =	_Image.new( 'Hong7.png' );
			self.Num["8"] =	_Image.new( 'Hong8.png' );
			self.Num["9"] =	_Image.new( 'Hong9.png' );
		end
	};
	[1010] =				--经验获取
	{
		PfxName ="ceshi01.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0,0,0);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["exp"] =_Image.new("JingYan.png");			
			self.Num["+"] = _Image.new( 'Lan+.png' );
			self.Num["0"] =	_Image.new( 'Lan0.png' );
			self.Num["1"] =	_Image.new( 'Lan1.png' );
			self.Num["2"] =	_Image.new( 'Lan2.png' );
			self.Num["3"] =	_Image.new( 'Lan3.png' );
			self.Num["4"] =	_Image.new( 'Lan4.png' );
			self.Num["5"] =	_Image.new( 'Lan5.png' );
			self.Num["6"] =	_Image.new( 'Lan6.png' );
			self.Num["7"] =	_Image.new( 'Lan7.png' );
			self.Num["8"] =	_Image.new( 'Lan8.png' );
			self.Num["9"] =	_Image.new( 'Lan9.png' );
		end
	};
	[1011] =				--杀意获取
	{
		PfxName ="ceshi01.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0,0,0);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["nuqi"] =_Image.new("ShaYi.png");			
			self.Num["+"] = _Image.new('DanHuang+.png');
			self.Num["0"] =	_Image.new( 'DanHuang0.png' );
			self.Num["1"] =	_Image.new( 'DanHuang1.png' );
			self.Num["2"] =	_Image.new( 'DanHuang2.png' );
			self.Num["3"] =	_Image.new( 'DanHuang3.png' );
			self.Num["4"] =	_Image.new( 'DanHuang4.png' );
			self.Num["5"] =	_Image.new( 'DanHuang5.png' );
			self.Num["6"] =	_Image.new( 'DanHuang6.png' );
			self.Num["7"] =	_Image.new( 'DanHuang7.png' );
			self.Num["8"] =	_Image.new( 'DanHuang8.png' );
			self.Num["9"] =	_Image.new( 'DanHuang9.png' );
		end
	};
	[1012] =				--真气获取
	{
		PfxName ="ceshi01.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0,0,0);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["jin"] =_Image.new("JinZhenQi.png");		
			self.Num["mu"] =_Image.new("MuZhenQi.png");		
			self.Num["shui"] =_Image.new("ShuiZhenQi.png");		
			self.Num["huo"] =_Image.new("HuoZhenQi.png");		
			self.Num["tu"] =_Image.new("TuZhenQi.png");		
			self.Num["+"] = _Image.new("Lv+.png");
			self.Num["0"] =	_Image.new( 'Lv0.png' );
			self.Num["1"] =	_Image.new( 'Lv1.png' );
			self.Num["2"] =	_Image.new( 'Lv2.png' );
			self.Num["3"] =	_Image.new( 'Lv3.png' );
			self.Num["4"] =	_Image.new( 'Lv4.png' );
			self.Num["5"] =	_Image.new( 'Lv5.png' );
			self.Num["6"] =	_Image.new( 'Lv6.png' );
			self.Num["7"] =	_Image.new( 'Lv7.png' );
			self.Num["8"] =	_Image.new( 'Lv8.png' );
			self.Num["9"] =	_Image.new( 'Lv9.png' );
		end
	};
	[1013] =					--这个是自己掉蓝的跳字配置
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0.6,0.6,-1.2);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 
			self.Num["miss"] = _Image.new("ShanBi1.png");			
			self.Num["-"] = _Image.new("Lan-.png");
			self.Num["0"] =	_Image.new( 'Lan0.png' );
			self.Num["1"] =	_Image.new( 'Lan1.png' );
			self.Num["2"] =	_Image.new( 'Lan2.png' );
			self.Num["3"] =	_Image.new( 'Lan3.png' );
			self.Num["4"] =	_Image.new( 'Lan4.png' );
			self.Num["5"] =	_Image.new( 'Lan5.png' );
			self.Num["6"] =	_Image.new( 'Lan6.png' );
			self.Num["7"] =	_Image.new( 'Lan7.png' );
			self.Num["8"] =	_Image.new( 'Lan8.png' );
			self.Num["9"] =	_Image.new( 'Lan9.png' );
		end
	};
	[1017] =					--这个是敌人掉血的跳字配置
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0.6,0.6,-1.2);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 

			self.Num["sword"] = _Image.new("Baojian_Jianqi.png");			
			self.Num["-"] = _Image.new("Lan-.png");
			self.Num["0"] =	_Image.new( 'Lan0.png' );
			self.Num["1"] =	_Image.new( 'Lan1.png' );
			self.Num["2"] =	_Image.new( 'Lan2.png' );
			self.Num["3"] =	_Image.new( 'Lan3.png' );
			self.Num["4"] =	_Image.new( 'Lan4.png' );
			self.Num["5"] =	_Image.new( 'Lan5.png' );
			self.Num["6"] =	_Image.new( 'Lan6.png' );
			self.Num["7"] =	_Image.new( 'Lan7.png' );
			self.Num["8"] =	_Image.new( 'Lan8.png' );
			self.Num["9"] =	_Image.new( 'Lan9.png' );
		end
	};
	[1018] =					--这个是敌人掉血的跳字配置
	{
		PfxName ="ceshi02.pfx";--对应的轨迹特效名
		Font = _Font.new( "ARIAL", 32, 1,0, false, false, false,false ); --渲染的字体
		StartPos = _Vector3.new(0.6,0.6,-1.2);--启动的位置
		BindPos = 'awc';--启动的绑点，人用这个
		FontHeight = 20;--字体的高度
		Num={};
		NetNumFunc = function(self) 

			self.Num["sword"] = _Image.new("XueMo_XueTu.png");			
			self.Num["-"] = _Image.new("Hong-.png");
			self.Num["0"] =	_Image.new( 'Hong0.png' );
			self.Num["1"] =	_Image.new( 'Hong1.png' );
			self.Num["2"] =	_Image.new( 'Hong2.png' );
			self.Num["3"] =	_Image.new( 'Hong3.png' );
			self.Num["4"] =	_Image.new( 'Hong4.png' );
			self.Num["5"] =	_Image.new( 'Hong5.png' );
			self.Num["6"] =	_Image.new( 'Hong6.png' );
			self.Num["7"] =	_Image.new( 'Hong7.png' );
			self.Num["8"] =	_Image.new( 'Hong8.png' );
			self.Num["9"] =	_Image.new( 'Hong9.png' );
		end
	};
} 
for i,sInfo in pairs(SkipFontConfig) do
	 
	sInfo.Font.textColor = sInfo.textColor;
		sInfo.Font.edgeColor = sInfo.edgeColor;
		sInfo.Font.glowColor = sInfo.glowColor;
end; 

function SkipFontConfig:CreateConfigNum()
	for i,sInfo in pairs(self) do
		if type(sInfo) == "table" and sInfo.Num then 
			sInfo:NetNumFunc(); 
		end;
	end; 
end;

