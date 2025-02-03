

---宝石铸造等级属性加成配置表
_G.ItemFoundryConfig = {
		dwID = 4100400; ----消耗材料id
		Value ={
				 --- Num 消耗材料 数量 dwflag  为 2 时 AddShX成功后加成的属性加数值  dwflag  为 1 AddShX成功后加成的属性加百分比 SuccessRate 成功万分之几
				[1] 	= {Num=2,dwflag = 1,AddShX=0.5,	SuccessRate =10000 };
				[2] 	= {Num=2,dwflag = 1,AddShX=0.5,	SuccessRate =10000 };
				[3] 	= {Num=2,dwflag = 1,AddShX=0.5,	SuccessRate =10000 };
				[4] 	= {Num=2,dwflag = 1,AddShX=0.5,	SuccessRate =10000 };
				[5] 	= {Num=2,dwflag = 1,AddShX=0.5,	SuccessRate =10000 };
				[6] 	= {Num=5,dwflag = 1,AddShX=1,	SuccessRate =10000 };				--Num消耗物品数量，AddShX成功后加成的属性百分比
				[7] 	= {Num=5,dwflag = 1,AddShX=1,	SuccessRate =10000 };
				[8] 	= {Num=5,dwflag = 1,AddShX=1,	SuccessRate =10000 };
				[9] 	= {Num=5,dwflag = 1,AddShX=1,	SuccessRate =10000 };
				[10]	= {Num=5,dwflag = 1,AddShX=1,	SuccessRate =10000 };
				[11] 	= {Num=15,dwflag = 1,AddShX=1.5,	SuccessRate =10000 };				--Num消耗物品数量，AddShX成功后加成的属性百分比
				[12] 	= {Num=15,dwflag = 1,AddShX=1.5,	SuccessRate =10000 };
				[13] 	= {Num=15,dwflag = 1,AddShX=1.5,	SuccessRate =10000 };
				[14] 	= {Num=15,dwflag = 1,AddShX=1.5,	SuccessRate =10000 };
				[15]	= {Num=15,dwflag = 1,AddShX=1.5,	SuccessRate =10000 };
				[16] 	= {Num=50,dwflag = 1,AddShX=2,	SuccessRate =10000 };				--Num消耗物品数量，AddShX成功后加成的属性百分比
				[17] 	= {Num=50,dwflag = 1,AddShX=2,	SuccessRate =10000 };
				[18] 	= {Num=50,dwflag = 1,AddShX=2,	SuccessRate =10000 };
				[19] 	= {Num=50,dwflag = 1,AddShX=2,	SuccessRate =10000 };
				[20]	= {Num=50,dwflag = 1,AddShX=2,	SuccessRate =10000 };
				[21] 	= {Num=80,dwflag = 1,AddShX=3.5,	SuccessRate =10000 };				--Num消耗物品数量，AddShX成功后加成的属性百分比
				[22] 	= {Num=80,dwflag = 1,AddShX=3.5,	SuccessRate =10000 };
				[23] 	= {Num=80,dwflag = 1,AddShX=3.5,	SuccessRate =10000 };
				[24] 	= {Num=80,dwflag = 1,AddShX=3.5,	SuccessRate =10000 };
				[25]	= {Num=80,dwflag = 1,AddShX=3.5,	SuccessRate =10000 };
				[26] 	= {Num=120,dwflag = 1,AddShX=5,	SuccessRate =10000 };				--Num消耗物品数量，AddShX成功后加成的属性百分比
				[27] 	= {Num=120,dwflag = 1,AddShX=5,	SuccessRate =10000 };
				[28] 	= {Num=120,dwflag = 1,AddShX=5,	SuccessRate =10000 };
				[29] 	= {Num=120,dwflag = 1,AddShX=5,	SuccessRate =10000 };
				[30]	= {Num=120,dwflag = 1,AddShX=5,	SuccessRate =10000 };
			};
	szPic1 = "<img src = 'img://Icon_stone_chuizi01_1.png'>";		--szPic1为一级铸造图标，szPic2为二级铸造图标szPic3灰色锤子
	szPic2 = "<img src = 'img://Icon_stone_chuizi02_1.png'>";
	szPic3 = "<img src = 'img://Icon_stone_chuizi04_1.png'>";
	szPic4 = "<img src = 'img://Icon_stone_chuizi05_1.png'>";
	szPic5 = "<img src = 'img://Icon_stone_chuizi06_1.png'>";
	szPic6 = "<img src = 'img://Icon_stone_chuizi07_1.png'>";
	szPicG = "<img src = 'img://Icon_stone_chuizi03_1.png'>";			
	sztext = "%s	%s+%d%s";   									--第一个%S是精魄 第二%S是属性加成类型 第三个%S是是否激活 %D为属性加成数值
	szFonundry = T"<font color='#4daeed'>1.宝石铸造需要消耗材料</font><font color='#fed904'>云英之玉。</font><br><font color='#4daeed'>2.宝石铸造</font><font color='#fed904'>1级</font><font color='#4daeed'>可额外增加部位宝石插槽镶嵌宝石属性加成</font><font color='#fed904'>50%。</font><br><font color='#4daeed'>3.宝石铸造<font color='#fed904'>2级</font></font><font color='#4daeed'>可额外增加部位宝石插槽镶嵌宝石属性加成</font><font color='#fed904'>100%。</font><br><font color='#4daeed'>3.宝石铸造</font><font color='#fed904'>3级</font><font color='#4daeed'>可额外增加部位宝石插槽镶嵌宝石属性加成</font><font color='#fed904'>150%。</font><br><font color='#4daeed'>4.宝石铸造</font><font color='#fed904'>4级</font><font color='#4daeed'>可额外增加部位宝石插槽镶嵌宝石属性加成</font><font color='#fed904'>200%。</font><br><font color='#4daeed'>5.宝石铸造</font><font color='#fed904'>5级</font><font color='#4daeed'>可额外增加部位宝石插槽镶嵌宝石属性加成</font><font color='#fed904'>350%。</font><br><font color='#4daeed'>6.宝石铸造</font><font color='#fed904'>6级</font><font color='#4daeed'>可额外增加部位宝石插槽镶嵌宝石属性加成</font><font color='#fed904'>500%。</font><br></font><font color='#4daeed'>5.部位的宝石铸造等级<img src = 'img://Icon_stone_chuizi01_1.png'><img src = 'img://Icon_stone_chuizi02_1.png'><img src = 'img://Icon_stone_chuizi04_1.png'><img src = 'img://Icon_stone_chuizi05_1.png'><img src = 'img://Icon_stone_chuizi06_1.png'><img src = 'img://Icon_stone_chuizi07_1.png'>次数分别达到</font></font><font color='#fed904'>5次,</font><font color='#4daeed'>可激活该部位铸造</font></font><font color='#fed904'>专属等级特效。</font>"; 
	zhuzaobtnTips = T"<font color='#278cf1'>可通过铸造装备部位，增加该部位宝石镶嵌额外属性加成</font><br><img src = 'img://Icon_stone_chuizi01_1.png'><font color='#cdc6c4'>宝石铸造1级可额外增加部位镶嵌宝石属性50%</font><br><font color='#fed904'><img src = 'img://Icon_stone_chuizi02_1.png'>宝石铸造2级可额外增加部位镶嵌宝石属性100%</font><br><font color='#87CEEB'><img src = 'img://Icon_stone_chuizi04_1.png'>宝石铸造3级可额外增加部位镶嵌宝石属性150%</font><br><font color='#cdc6c4'><img src = 'img://Icon_stone_chuizi05_1.png'>宝石铸造4级可额外增加部位镶嵌宝石属性200%</font><br><font color='#fed904'><img src = 'img://Icon_stone_chuizi06_1.png'>宝石铸造5级可额外增加部位镶嵌宝石属性350%</font><br><font color='#87CEEB'><img src = 'img://Icon_stone_chuizi07_1.png'>宝石铸造6级可额外增加部位镶嵌宝石属性500%</font>";
}


