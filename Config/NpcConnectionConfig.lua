--江湖人脉系统配置
--从1递增
_G.GNpcNO = {
				PingYZ = 1,
				LuY = 2,
				LuGY = 3,
				YangF = 4,
				LinZC = 5,--XiaoW
				GuangPCS = 6,
				WangYR = 7,
				ShaG = 8,
				KeZE = 9,
				ZhouBT = 10,
				YaoN = 11,--GongSLE
				DaiQS = 12,
				LuYJ = 13,
				XieX = 14,
				ChiLY = 15,
			}

_G.tAppendProperty =
{
--Npc
[GNpcNO.PingYZ] = 
	--指教次数
	{
		[1] = 
		--指教附加属性，每次指教附加属性=下一次指教-上一次指教
			{
				dwHPMax = 90;
				--dwMPMax = 150;
				dwAttack = 20;
				--dwDefense = 4;
				--dwCrit = 5;
				--dwFlee = 6;
				--dwAttackSpeed = 7;
				--dwMoveSpeed = 8;
			},
		[2] = 
			{
				dwHPMax = 142;
				dwAttack = 33;
			},
		[3] = 
			{
				dwHPMax = 194;
				dwAttack = 45;
			},
		[4] = 
			{
				dwHPMax = 246;
				dwAttack = 57;
			},
		[5] = 
			{
				dwHPMax = 300;
				dwAttack = 70;
			},	
	},
	
	[GNpcNO.LuY] = 
	{
		[1] = 
			{
				dwHPMax = 135;
				dwDefense = 54;
			},
		[2] = 
			{
				dwHPMax = 213;
				dwDefense = 85;
			},
		[3] = 
			{
				dwHPMax = 291;
				dwDefense = 116;
			},
		[4] = 
			{
				dwHPMax = 369;
				dwDefense = 147;
			},
		[5] = 
			{
				dwHPMax = 450;
				dwDefense = 180;
			},
	},
	
	[GNpcNO.LuGY] = 
	{
		[1] = 
			{
				dwHPMax = 180;
				dwFlee = 30;
			},
		[2] = 
			{
				dwHPMax = 240;
				dwFlee = 40;
			},
		[3] = 
			{
				dwHPMax = 300;
				dwFlee = 50;
			},
		[4] = 
			{
				dwHPMax = 360;
				dwFlee = 60;
			},
		[5] = 
			{
				dwHPMax = 420;
				dwFlee = 70;
			},
		[6] = 
			{
				dwHPMax = 480;
				dwFlee = 80;
			},	
		[7] = 
			{
				dwHPMax = 540;
				dwFlee = 90;
			},
		[8] = 
			{
				dwHPMax = 600;
				dwFlee = 100;
			},	
	},
	[GNpcNO.YangF] = 
	{
		[1] = 
			{
				dwDefense = 120;
				dwCrit = 21;
			},
		[2] = 
			{
				dwDefense = 160;
				dwCrit = 28;
			},
		[3] = 
			{
				dwDefense = 200;
				dwCrit = 35;
			},
		[4] = 
			{
				dwDefense = 240;
				dwCrit = 42;
			},
		[5] = 
			{
				dwDefense = 280;
				dwCrit = 49;
			},
		[6] = 
			{
				dwDefense = 320;
				dwCrit = 56;
			},
		[7] = 
			{
				dwDefense = 360;
				dwCrit = 63;
			},
		[8] = 
			{
				dwDefense = 400;
				dwCrit = 70;
			},	
	},
	[GNpcNO.LinZC] = 
	{
		[1] = 
			{
				dwHPMax = 300;
				dwDefense = 159;
			},
		[2] = 
			{
				dwHPMax = 377;
				dwDefense = 200;
			},
		[3] = 
			{
				dwHPMax = 454;
				dwDefense = 241;
			},
		[4] = 
			{
				dwHPMax = 531;
				dwDefense = 282;
			},
		[5] = 
			{
				dwHPMax = 608;
				dwDefense = 323;
			},
		[6] = 
			{
				dwHPMax = 685;
				dwDefense = 364;
			},
		[7] = 
			{
				dwHPMax = 762;
				dwDefense = 405;
			},
		[8] = 
			{
				dwHPMax = 839;
				dwDefense = 446;
			},
		[9] = 
			{
				dwHPMax = 916;
				dwDefense = 487;
			},
		[10] = 
			{
				dwHPMax = 1000;
				dwDefense = 530;
			},	
	},
	[GNpcNO.GuangPCS] = 
	{
		[1] = 
			{
				dwMPMax = 120;
				dwDefense = 183;
			},
		[2] = 
			{
				dwMPMax = 151;
				dwDefense = 230;
			},
		[3] = 
			{
				dwMPMax = 182;
				dwDefense = 277;
			},
		[4] = 
			{
				dwMPMax = 213;
				dwDefense = 324;
			},
		[5] = 
			{
				dwMPMax = 244;
				dwDefense = 371;
			},
		[6] = 
			{
				dwMPMax = 275;
				dwDefense = 418;
			},
		[7] = 
			{
				dwMPMax = 306;
				dwDefense = 465;
			},
		[8] = 
			{
				dwMPMax = 337;
				dwDefense = 512;
			},
		[9] = 
			{
				dwMPMax = 368;
				dwDefense = 559;
			},
		[10] = 
			{
				dwMPMax = 400;
				dwDefense = 610;
			},	
	},
	[GNpcNO.WangYR] = 
	{
		[1] = 
			{
				dwHPMax = 450;
				dwAttack = 81;
				dwCrit = 36;
			},
		[2] = 
			{
				dwHPMax = 530;
				dwAttack = 95;
				dwCrit = 42;
			},
		[3] = 
			{
				dwHPMax = 610;
				dwAttack = 109;
				dwCrit = 48;
			},
		[4] = 
			{
				dwHPMax = 690;
				dwAttack = 123;
				dwCrit = 54;
			},
		[5] = 
			{
				dwHPMax = 770;
				dwAttack = 137;
				dwCrit = 60;
			},
		[6] = 
			{
				dwHPMax = 850;
				dwAttack = 151;
				dwCrit = 66;
			},
		[7] = 
			{
				dwHPMax = 930;
				dwAttack = 165;
				dwCrit = 72;
			},
		[8] = 
			{
				dwHPMax = 1010;
				dwAttack = 179;
				dwCrit = 78;
			},
		[9] = 
			{
				dwHPMax = 1090;
				dwAttack = 193;
				dwCrit = 84;
			},
		[10] = 
			{
				dwHPMax = 1170;
				dwAttack = 207;
				dwCrit = 90;
			},
		[11] = 
			{
				dwHPMax = 1250;
				dwAttack = 221;
				dwCrit = 96;
			},
		[12] = 
			{
				dwHPMax = 1330;
				dwAttack = 235;
				dwCrit = 102;
			},
		[13] = 
			{
				dwHPMax = 1410;
				dwAttack = 249;
				dwCrit = 108;
			},
		[14] = 
			{
				dwHPMax = 1500;
				dwAttack = 270;
				dwCrit = 120;
			},	
	},
	[GNpcNO.ShaG] = 
	{
		[1] = 
			{
				dwMPMax = 165;
				dwAttack = 114;
				dwFlee = 57;
			},
		[2] = 
			{
				dwMPMax = 194;
				dwAttack = 134;
				dwFlee = 67;
			},
		[3] = 
			{
				dwMPMax = 223;
				dwAttack = 154;
				dwFlee = 77;
			},
		[4] = 
			{
				dwMPMax = 252;
				dwAttack = 174;
				dwFlee = 87;
			},
		[5] = 
			{
				dwMPMax = 281;
				dwAttack = 194;
				dwFlee = 97;
			},
		[6] = 
			{
				dwMPMax = 310;
				dwAttack = 214;
				dwFlee = 107;
			},
		[7] = 
			{
				dwMPMax = 339;
				dwAttack = 234;
				dwFlee = 117;
			},
		[8] = 
			{
				dwMPMax = 368;
				dwAttack = 254;
				dwFlee = 127;
			},
		[9] = 
			{
				dwMPMax = 397;
				dwAttack = 274;
				dwFlee = 137;
			},
		[10] = 
			{
				dwMPMax = 426;
				dwAttack = 294;
				dwFlee = 147;
			},
		[11] = 
			{
				dwMPMax = 455;
				dwAttack = 314;
				dwFlee = 157;
			},
		[12] = 
			{
				dwMPMax = 484;
				dwAttack = 334;
				dwFlee = 167;
			},
		[13] = 
			{
				dwMPMax = 513;
				dwAttack = 354;
				dwFlee = 177;
			},
		[14] = 
			{
				dwMPMax = 550;
				dwAttack = 380;
				dwFlee = 190;
			},	
	},
	[GNpcNO.KeZE] = 
	{
		[1] = 
			{
				dwAttack = 147;
				dwDefense = 216;
				dwCrit = 51;
			},
		[2] = 
			{
				dwAttack = 173;
				dwDefense = 254;
				dwCrit = 60;
			},
		[3] = 
			{
				dwAttack = 199;
				dwDefense = 292;
				dwCrit = 69;
			},
		[4] = 
			{
				dwAttack = 225;
				dwDefense = 330;
				dwCrit = 78;
			},
		[5] = 
			{
				dwAttack = 251;
				dwDefense = 368;
				dwCrit = 87;
			},
		[6] = 
			{
				dwAttack = 277;
				dwDefense = 406;
				dwCrit = 96;
			},
		[7] = 
			{
				dwAttack = 303;
				dwDefense = 444;
				dwCrit = 105;
			},
		[8] = 
			{
				dwAttack = 329;
				dwDefense = 482;
				dwCrit = 114;
			},
		[9] = 
			{
				dwAttack = 355;
				dwDefense = 520;
				dwCrit = 123;
			},
		[10] = 
			{
				dwAttack = 381;
				dwDefense = 558;
				dwCrit = 132;
			},
		[11] = 
			{
				dwAttack = 407;
				dwDefense = 596;
				dwCrit = 141;
			},
		[12] = 
			{
				dwAttack = 433;
				dwDefense = 634;
				dwCrit = 150;
			},
		[13] = 
			{
				dwAttack = 459;
				dwDefense = 672;
				dwCrit = 159;
			},
		[14] = 
			{
				dwAttack = 490;
				dwDefense = 720;
				dwCrit = 170;
			},	
	},
	[GNpcNO.ZhouBT] = 
	{
		[1] = 
			{
				dwHPMax = 630;
				dwDefense = 249;
				dwFlee = 84;
			},
		[2] = 
			{
				dwHPMax = 721;
				dwDefense = 285;
				dwFlee = 96;
			},
		[3] = 
			{
				dwHPMax = 812;
				dwDefense = 321;
				dwFlee = 108;
			},
		[4] = 
			{
				dwHPMax = 903;
				dwDefense = 357;
				dwFlee = 120;
			},
		[5] = 
			{
				dwHPMax = 994;
				dwDefense = 393;
				dwFlee = 132;
			},
		[6] = 
			{
				dwHPMax = 1085;
				dwDefense = 429;
				dwFlee = 144;
			},
		[7] = 
			{
				dwHPMax = 1176;
				dwDefense = 465;
				dwFlee = 156;
			},
		[8] = 
			{
				dwHPMax = 1267;
				dwDefense = 501;
				dwFlee = 168;
			},
		[9] = 
			{
				dwHPMax = 1358;
				dwDefense = 537;
				dwFlee = 180;
			},
		[10] = 
			{
				dwHPMax = 1449;
				dwDefense = 573;
				dwFlee = 192;
			},
		[11] = 
			{
				dwHPMax = 1540;
				dwDefense = 609;
				dwFlee = 204;
			},
		[12] = 
			{
				dwHPMax = 1631;
				dwDefense = 645;
				dwFlee = 216;
			},
		[13] = 
			{
				dwHPMax = 1722;
				dwDefense = 681;
				dwFlee = 228;
			},
		[14] = 
			{
				dwHPMax = 1813;
				dwDefense = 717;
				dwFlee = 240;
			},
		[15] = 
			{
				dwHPMax = 1904;
				dwDefense = 753;
				dwFlee = 252;
			},
		[16] = 
			{
				dwHPMax = 1995;
				dwDefense = 789;
				dwFlee = 264;
			},
		[17] = 
			{
				dwHPMax = 2100;
				dwDefense = 830;
				dwFlee = 280;
			},	
	},
	[GNpcNO.YaoN] = 
	{
		[1] = 
			{
				dwHPMax = 900;
				dwMPMax = 225;
				dwCrit = 72;
			},
		[2] = 
			{
				dwHPMax = 1031;
				dwMPMax = 257;
				dwCrit = 82;
			},
		[3] = 
			{
				dwHPMax = 1162;
				dwMPMax = 289;
				dwCrit = 92;
			},
		[4] = 
			{
				dwHPMax = 1293;
				dwMPMax = 321;
				dwCrit = 102;
			},
		[5] = 
			{
				dwHPMax = 1424;
				dwMPMax = 353;
				dwCrit = 112;
			},
		[6] = 
			{
				dwHPMax = 1555;
				dwMPMax = 385;
				dwCrit = 122;
			},
		[7] = 
			{
				dwHPMax = 1686;
				dwMPMax = 417;
				dwCrit = 132;
			},
		[8] = 
			{
				dwHPMax = 1817;
				dwMPMax = 449;
				dwCrit = 142;
			},
		[9] = 
			{
				dwHPMax = 1948;
				dwMPMax = 481;
				dwCrit = 152;
			},
		[10] = 
			{
				dwHPMax = 2079;
				dwMPMax = 513;
				dwCrit = 162;
			},
		[11] = 
			{
				dwHPMax = 2210;
				dwMPMax = 545;
				dwCrit = 172;
			},
		[12] = 
			{
				dwHPMax = 2341;
				dwMPMax = 577;
				dwCrit = 182;
			},
		[13] = 
			{
				dwHPMax = 2472;
				dwMPMax = 609;
				dwCrit = 192;
			},
		[14] = 
			{
				dwHPMax = 2603;
				dwMPMax = 641;
				dwCrit = 202;
			},
		[15] = 
			{
				dwHPMax = 2734;
				dwMPMax = 673;
				dwCrit = 212;
			},
		[16] = 
			{
				dwHPMax = 2865;
				dwMPMax = 705;
				dwCrit = 222;
			},
		[17] = 
			{
				dwHPMax = 3000;
				dwMPMax = 750;
				dwCrit = 240;
			},	
	},
	[GNpcNO.DaiQS] = 
	{
		[1] = 
			{
				dwHPMax = 1230;
				dwMPMax = 270;
				dwAttack = 240;
			},
		[2] = 
			{
				dwHPMax = 1409;
				dwMPMax = 309;
				dwAttack = 275;
			},
		[3] = 
			{
				dwHPMax = 1588;
				dwMPMax = 348;
				dwAttack = 310;
			},
		[4] = 
			{
				dwHPMax = 1767;
				dwMPMax = 387;
				dwAttack = 345;
			},
		[5] = 
			{
				dwHPMax = 1946;
				dwMPMax = 426;
				dwAttack = 380;
			},
		[6] = 
			{
				dwHPMax = 2125;
				dwMPMax = 465;
				dwAttack = 415;
			},
		[7] = 
			{
				dwHPMax = 2304;
				dwMPMax = 504;
				dwAttack = 450;
			},
		[8] = 
			{
				dwHPMax = 2483;
				dwMPMax = 543;
				dwAttack = 485;
			},
		[9] = 
			{
				dwHPMax = 2662;
				dwMPMax = 582;
				dwAttack = 520;
			},
		[10] = 
			{
				dwHPMax = 2841;
				dwMPMax = 621;
				dwAttack = 555;
			},
		[11] = 
			{
				dwHPMax = 3020;
				dwMPMax = 660;
				dwAttack = 590;
			},
		[12] = 
			{
				dwHPMax = 3199;
				dwMPMax = 699;
				dwAttack = 625;
			},
		[13] = 
			{
				dwHPMax = 3378;
				dwMPMax = 738;
				dwAttack = 660;
			},
		[14] = 
			{
				dwHPMax = 3557;
				dwMPMax = 777;
				dwAttack = 695;
			},
		[15] = 
			{
				dwHPMax = 3736;
				dwMPMax = 816;
				dwAttack = 730;
			},
		[16] = 
			{
				dwHPMax = 3915;
				dwMPMax = 855;
				dwAttack = 765;
			},
		[17] = 
			{
				dwHPMax = 4100;
				dwMPMax = 900;
				dwAttack = 800;
			},	
	},
	[GNpcNO.LuYJ] = 
	{
		[1] = 
			{
				dwAttack = 330;
				dwDefense = 300;
				dwFlee = 117;
			},
		[2] = 
			{
				dwAttack = 370;
				dwDefense = 336;
				dwFlee = 131;
			},
		[3] = 
			{
				dwAttack = 410;
				dwDefense = 372;
				dwFlee = 145;
			},
		[4] = 
			{
				dwAttack = 450;
				dwDefense = 408;
				dwFlee = 159;
			},
		[5] = 
			{
				dwAttack = 490;
				dwDefense = 444;
				dwFlee = 173;
			},
		[6] = 
			{
				dwAttack = 530;
				dwDefense = 480;
				dwFlee = 187;
			},
		[7] = 
			{
				dwAttack = 570;
				dwDefense = 516;
				dwFlee = 201;
			},
		[8] = 
			{
				dwAttack = 610;
				dwDefense = 552;
				dwFlee = 215;
			},
		[9] = 
			{
				dwAttack = 650;
				dwDefense = 588;
				dwFlee = 229;
			},
		[10] = 
			{
				dwAttack = 690;
				dwDefense = 624;
				dwFlee = 243;
			},
		[11] = 
			{
				dwAttack = 730;
				dwDefense = 660;
				dwFlee = 257;
			},
		[12] = 
			{
				dwAttack = 770;
				dwDefense = 696;
				dwFlee = 271;
			},
		[13] = 
			{
				dwAttack = 810;
				dwDefense = 732;
				dwFlee = 285;
			},
		[14] = 
			{
				dwAttack = 850;
				dwDefense = 768;
				dwFlee = 299;
			},
		[15] = 
			{
				dwAttack = 890;
				dwDefense = 804;
				dwFlee = 313;
			},
		[16] = 
			{
				dwAttack = 930;
				dwDefense = 840;
				dwFlee = 327;
			},
		[17] = 
			{
				dwAttack = 970;
				dwDefense = 876;
				dwFlee = 341;
			},
		[18] = 
			{
				dwAttack = 1010;
				dwDefense = 912;
				dwFlee = 355;
			},
		[19] = 
			{
				dwAttack = 1050;
				dwDefense = 948;
				dwFlee = 369;
			},
		[20] = 
			{
				dwAttack = 1100;
				dwDefense = 1000;
				dwFlee = 390;
			},
	},
	[GNpcNO.XieX] = 
	{
		[1] = 
			{
				dwHPMax = 1590;
				dwMPMax = 330;
				dwAttack = 480;
			},
		[2] = 
			{
				dwHPMax = 1785;
				dwMPMax = 370;
				dwAttack = 538;
			},
		[3] = 
			{
				dwHPMax = 1980;
				dwMPMax = 410;
				dwAttack = 596;
			},
		[4] = 
			{
				dwHPMax = 2175;
				dwMPMax = 450;
				dwAttack = 654;
			},
		[5] = 
			{
				dwHPMax = 2370;
				dwMPMax = 490;
				dwAttack = 712;
			},
		[6] = 
			{
				dwHPMax = 2565;
				dwMPMax = 530;
				dwAttack = 770;
			},
		[7] = 
			{
				dwHPMax = 2760;
				dwMPMax = 570;
				dwAttack = 828;
			},
		[8] = 
			{
				dwHPMax = 2955;
				dwMPMax = 610;
				dwAttack = 886;
			},
		[9] = 
			{
				dwHPMax = 3150;
				dwMPMax = 650;
				dwAttack = 944;
			},
		[10] = 
			{
				dwHPMax = 3345;
				dwMPMax = 690;
				dwAttack = 1002;
			},
		[11] = 
			{
				dwHPMax = 3540;
				dwMPMax = 730;
				dwAttack = 1060;
			},
		[12] = 
			{
				dwHPMax = 3735;
				dwMPMax = 770;
				dwAttack = 1118;
			},
		[13] = 
			{
				dwHPMax = 3930;
				dwMPMax = 810;
				dwAttack = 1176;
			},
		[14] = 
			{
				dwHPMax = 4125;
				dwMPMax = 850;
				dwAttack = 1234;
			},
		[15] = 
			{
				dwHPMax = 4320;
				dwMPMax = 890;
				dwAttack = 1292;
			},
		[16] = 
			{
				dwHPMax = 4515;
				dwMPMax = 930;
				dwAttack = 1350;
			},
		[17] = 
			{
				dwHPMax = 4710;
				dwMPMax = 970;
				dwAttack = 1408;
			},
		[18] = 
			{
				dwHPMax = 4905;
				dwMPMax = 1010;
				dwAttack = 1466;
			},
		[19] = 
			{
				dwHPMax = 5100;
				dwMPMax = 1050;
				dwAttack = 1524;
			},
		[20] = 
			{
				dwHPMax = 5300;
				dwMPMax = 1100;
				dwAttack = 1600;
			},
	},
	[GNpcNO.ChiLY] = 
	{
		[1] = 
			{
				dwAttack = 630;
				dwCrit = 99;
				dwFlee = 150;
			},
		[2] = 
			{
				dwAttack = 707;
				dwCrit = 111;
				dwFlee = 168;
			},
		[3] = 
			{
				dwAttack = 784;
				dwCrit = 123;
				dwFlee = 186;
			},
		[4] = 
			{
				dwAttack = 861;
				dwCrit = 135;
				dwFlee = 204;
			},
		[5] = 
			{
				dwAttack = 938;
				dwCrit = 147;
				dwFlee = 222;
			},
		[6] = 
			{
				dwAttack = 1015;
				dwCrit = 159;
				dwFlee = 240;
			},
		[7] = 
			{
				dwAttack = 1092;
				dwCrit = 171;
				dwFlee = 258;
			},
		[8] = 
			{
				dwAttack = 1169;
				dwCrit = 183;
				dwFlee = 276;
			},
		[9] = 
			{
				dwAttack = 1246;
				dwCrit = 195;
				dwFlee = 294;
			},
		[10] = 
			{
				dwAttack = 1323;
				dwCrit = 207;
				dwFlee = 312;
			},
		[11] = 
			{
				dwAttack = 1400;
				dwCrit = 219;
				dwFlee = 330;
			},
		[12] = 
			{
				dwAttack = 1477;
				dwCrit = 231;
				dwFlee = 348;
			},
		[13] = 
			{
				dwAttack = 1554;
				dwCrit = 243;
				dwFlee = 366;
			},
		[14] = 
			{
				dwAttack = 1631;
				dwCrit = 255;
				dwFlee = 384;
			},
		[15] = 
			{
				dwAttack = 1708;
				dwCrit = 267;
				dwFlee = 402;
			},
		[16] = 
			{
				dwAttack = 1785;
				dwCrit = 279;
				dwFlee = 420;
			},
		[17] = 
			{
				dwAttack = 1862;
				dwCrit = 291;
				dwFlee = 438;
			},
		[18] = 
			{
				dwAttack = 1939;
				dwCrit = 303;
				dwFlee = 456;
			},
		[19] = 
			{
				dwAttack = 2016;
				dwCrit = 315;
				dwFlee = 474;
			},
		[20] = 
			{
				dwAttack = 2100;
				dwCrit = 330;
				dwFlee = 500;
			},	
	},
	
}
--特殊条件
_G.GLinkType = {SignDay = 3,}
--链接界面
_G.NpcConnectionLinkConfig = 
{
	[GLinkType.SignDay] = {szButtonName = '我要签到',fLink = function() CUIGetReword:Show(); end;},		--签到链接
}


_G.NpcConnectionConfig = 
{
	--指教属性加成公式
	fPropertyAppend = function(dwNpcNum,dwCurTearchCount) 
		if type(dwNpcNum) ~= "number" then return nil end
		if type(dwCurTearchCount) ~= "number" then return nil end
		local tProperty = {}
		if dwCurTearchCount > 0 and dwCurTearchCount <= #tAppendProperty[dwNpcNum] then
			tProperty.dwHPMax = tAppendProperty[dwNpcNum][dwCurTearchCount].dwHPMax or 0;
			tProperty.dwMPMax = tAppendProperty[dwNpcNum][dwCurTearchCount].dwMPMax or 0;
			tProperty.dwAttack = tAppendProperty[dwNpcNum][dwCurTearchCount].dwAttack or 0;
			tProperty.dwDefense = tAppendProperty[dwNpcNum][dwCurTearchCount].dwDefense or 0;
			tProperty.dwCrit = tAppendProperty[dwNpcNum][dwCurTearchCount].dwCrit or 0;
			tProperty.dwFlee = tAppendProperty[dwNpcNum][dwCurTearchCount].dwFlee or 0;
			tProperty.dwAttackSpeed = tAppendProperty[dwNpcNum][dwCurTearchCount].dwAttackSpeed or 0;
			tProperty.dwMoveSpeed = tAppendProperty[dwNpcNum][dwCurTearchCount].dwMoveSpeed or 0;
		else
			tProperty.dwHPMax = 0;
			tProperty.dwMPMax = 0;
			tProperty.dwAttack = 0;
			tProperty.dwDefense = 0;
			tProperty.dwCrit = 0;
			tProperty.dwFlee = 0;
			tProperty.dwAttackSpeed = 0;
			tProperty.dwMoveSpeed = 0;
		end
		return tProperty;
	end;
	
	--聊天泡泡显示时间
	dwShowTalkTime = 3000;
	
	--头像大小
	tHeadSize = {w = 140,h = 140},
	
	szUIType = 'UINpc',		--模型配置
	
	--指教按钮Tip格式
	szTeachingButtonTip = '指教可给角色增加额外属性\n当前指教次数：%s\n指教上限次数：%s\n今日可指教次数：%s\n指教消耗\n银两：%s\n道具：%s',
	--%级
	szRoleLevel = SysStringConfigInfo[7000160002],
	--无
	szWU = SysStringConfigInfo[6000250014],
	--结交错误提示
	tForgatherNotice = {
						szLackLevel = '等级不够',
						szLackWeiWang = '威望不够',
						szLackFriend = '伙伴不够',
						szLackMoney = '银两不够',
						szLackItem = '道具不够',
					},
	--指教错误提示
	tTeachingNotice = {
						szTeachsLimit = '次数上限',
						szTeachsDayLimit = '今天上限',
						szLackMoney = '银两不够',
						szLackItem = '道具不够',
					},
	--收益提示
	tIncomeNotice = { 	szForgather = '成功与%s结交',
						 szTeaching = '成功被%s指教',
					},
	--属性排序
	tSortProperty = {'dwHPMax','dwMPMax','dwAttack','dwDefense','dwCrit','dwFlee','dwAttackSpeed','dwMoveSpeed'};
	--属性名					
	szNameProperty = {	dwHPMax = '生    命：';
						dwMPMax = '内    力：';																
						dwAttack = '攻    击：';
						dwDefense = '防    御：';
						dwCrit = '暴    击：';
						dwFlee = '身    法：';
						dwAttackSpeed = '攻击速度：';
						dwMoveSpeed = '移动速度：';
					},	
	--指教加成属性最大数量
	dwMaxTeachProperty = 3;
	--结交条件名					
	szNameForgather = {	[1] = '威望：';
						[2] = '等级：';																
						[3] = '伙伴：';
						[4] = '银两：';
						[5] = '道具：';
					},
					
	--结交条件道具换行（不能为0）
	dwForgatherItemsHuanHang = 2,

	--Npc配置
	[GNpcNO.PingYZ] = 
	{
		--名字
		szName = '平一指', 	
		--头像
		szIconHead = ResNpcModelConfig.Icons[10011001].szFile,
		--结交描述
		szForgatherDescribe = '111111111111111',
		--指教描述
		szTeachingDescribe = '2222222222222222',
		--结交成功聊天泡泡显示
		szForgatherFinishTalk = {
									'1',
									'2',
									'3',
								},
		--指教成功聊天泡泡显示
		szTeachingFinishTalk = {'11','22',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10011001].szFile, 
					sklFile=ResNpcModelConfig.Skls[10011001].szFile, 
					sanFile =ResNpcModelConfig.Sans[1001100101].szFile,
					param_1_x = -0.1, param_1_y =-12, param_1_z = 2,param_2_x = 0, param_2_y = 0, param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1001100102].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																				--模型
		action = {{pfxId = 310,bindPos ="dummy01"}},											--模型动作
			
		--结交条件
		tForgatherQualification = { 
									dwRoleLevel = 10,											--等级
									dwWeiwangLevel = 1,											--威望
									--dwNeedMoney = 1000,										--银两
									--tFriendID = {GNpcNO.ZBT,GNpcNO.KZE},						--伙伴
									--[[tItem = {--道具
												{dwItemID = 4100010,dwNumber = 4},
											},]]
									--tSpecial = {dwSignDay = 1}							--特殊条件
								}, 
		--指教条件
		tTeachingQualification = {  
									dwLimitNum = 5,												--上限
									dwNeedMoney = {--银两
													[1] = 100000,
													[2] = 100000,
													[3] = 100000,
													[4] = 100000,
													[5] = 100000,
												},																	
	
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;																
							dwAttack = 0;
						},	
	},
	[GNpcNO.LuY] = 
	{
		szName = '卢鹭', 	
		szIconHead = ResNpcModelConfig.Icons[10011010].szFile,
		szForgatherDescribe = '卢鹭：猪肉100块一斤',
		szTeachingDescribe = '卢鹭，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10011010].szFile,
					sklFile=ResNpcModelConfig.Skls[10011010].szFile,
					sanFile =ResNpcModelConfig.Sans[1001101001].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1001101002].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 20,																	
									dwWeiwangLevel = 1,																	
									dwNeedMoney = 500000,																	
									tFriendID = {GNpcNO.PingYZ},
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 5,																	
									dwNeedMoney = {
													[1] = 300000,
													[2] = 300000,
													[3] = 300000,
													[4] = 300000,
													[5] = 300000,
												},																	
									--tItem = {
												--[1] = {{dwItemID = 4100010,dwNumber = 4},{dwItemID = 5600010,dwNumber = 4}},
												--[2] = {{dwItemID = 4100010,dwNumber = 4},{dwItemID = 5600010,dwNumber = 4}},
										--	},	
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;																
							dwDefense = 0;
						},	
	},	
	[GNpcNO.LuGY] = 
	{
		szName = '陆冠英', 	
		szIconHead = ResNpcModelConfig.Icons[10021001].szFile,
		szForgatherDescribe = '陆冠英：猪肉100块一斤',
		szTeachingDescribe = '陆冠英，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10021001].szFile,
					sklFile=ResNpcModelConfig.Skls[10021001].szFile,
					sanFile =ResNpcModelConfig.Sans[1002100101].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1002100102].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 30,																	
									dwWeiwangLevel = 1,																	
									dwNeedMoney = 1000000,																	
									tFriendID = {GNpcNO.LuY},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 5},
												{dwItemID = 8200001,dwNumber = 3},
												{dwItemID = 8100040,dwNumber = 1},
											},	
									--tSpecial = {dwSignDay = 20},
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 8,																	
									dwNeedMoney = {
													[1] = 500000,
													[2] = 500000,
													[3] = 500000,
													[4] = 500000,
													[5] = 500000,
													[6] = 500000,
													[7] = 500000,
													[8] = 500000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;
							dwFlee = 0;
						},	
	},
	[GNpcNO.YangF] = 
	{
		szName = '杨锋', 	
		szIconHead = ResNpcModelConfig.Icons[10021005].szFile,
		szForgatherDescribe = '杨锋：猪肉100块一斤',
		szTeachingDescribe = '杨锋，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10021005].szFile,
					sklFile=ResNpcModelConfig.Skls[10021005].szFile,
					sanFile =ResNpcModelConfig.Sans[1002100501].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1002100502].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 40,																	
									dwWeiwangLevel = 1,																	
									dwNeedMoney = 5000000,																	
									tFriendID = {GNpcNO.LuGY},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 10},
												{dwItemID = 8200001,dwNumber = 9},
												{dwItemID = 8100090,dwNumber = 3},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 8,																	
									dwNeedMoney = {
													[1] = 1000000,
													[2] = 1000000,
													[3] = 1000000,
													[4] = 1000000,
													[5] = 1000000,
													[6] = 1000000,
													[7] = 1000000,
													[8] = 1000000,
												},																	
								
								},
		--初始属性加成						
		tFirstProperty = {	dwDefense = 0;
							dwCrit = 0;
						},	
	},
	[GNpcNO.LinZC] = 
	{
		szName = '林中才', 	
		szIconHead = ResNpcModelConfig.Icons[10011007].szFile,
		szForgatherDescribe = '林中才：猪肉100块一斤',
		szTeachingDescribe = '林中才，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10011007].szFile,
					sklFile=ResNpcModelConfig.Skls[10011007].szFile,
					sanFile =ResNpcModelConfig.Sans[1001100701].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1001100702].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 40,																	
									dwWeiwangLevel = 1,																	
									dwNeedMoney = 10000000,																	
									tFriendID = {GNpcNO.YangF},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 20},
												{dwItemID = 8200001,dwNumber = 15},
												{dwItemID = 8100090,dwNumber = 5},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 10,																	
									dwNeedMoney = {
													[1] = 2000000,
													[2] = 2000000,
													[3] = 2000000,
													[4] = 2000000,
													[5] = 2000000,
													[6] = 2000000,
													[7] = 2000000,
													[8] = 2000000,
													[9] = 2000000,
													[10] = 2000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;																
							dwDefense = 0;
						},	
	},
	[GNpcNO.GuangPCS] = 
	{
		szName = '广平禅师', 	
		szIconHead = ResNpcModelConfig.Icons[10021013].szFile,
		szForgatherDescribe = '广平禅师：猪肉100块一斤',
		szTeachingDescribe = '广平禅师，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10021013].szFile,
					sklFile=ResNpcModelConfig.Skls[10021013].szFile,
					sanFile =ResNpcModelConfig.Sans[1002101301].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1002101302].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 40,																	
									dwWeiwangLevel = 2,																	
									dwNeedMoney = 50000000,																	
									tFriendID = {GNpcNO.LinZC},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 20},
												{dwItemID = 8200001,dwNumber = 30},
												{dwItemID = 8100090,dwNumber = 10},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 10,																	
									dwNeedMoney = {
													[1] = 5000000,
													[2] = 5000000,
													[3] = 5000000,
													[4] = 5000000,
													[5] = 5000000,
													[6] = 5000000,
													[7] = 5000000,
													[8] = 5000000,
													[9] = 5000000,
													[10] = 5000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwMPMax = 0;																
							dwDefense = 0;
						},	
	},
	[GNpcNO.WangYR] = 
	{
		szName = '王嫣然', 	
		szIconHead = ResNpcModelConfig.Icons[10021098].szFile,
		szForgatherDescribe = '王嫣然：猪肉100块一斤',
		szTeachingDescribe = '王嫣然，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10021098].szFile,
					sklFile=ResNpcModelConfig.Skls[10021098].szFile,
					sanFile =ResNpcModelConfig.Sans[1002109801].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1002109802].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 50,																	
									dwWeiwangLevel = 2,																	
									dwNeedMoney = 100000000,																	
									tFriendID = {GNpcNO.GuangPCS},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 30},
												{dwItemID = 8200002,dwNumber = 30},
												{dwItemID = 8100140,dwNumber = 10},
												{dwItemID = 8100150,dwNumber = 10},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 14,																	
									dwNeedMoney = {
													[1] = 10000000,
													[2] = 10000000,
													[3] = 10000000,
													[4] = 10000000,
													[5] = 10000000,
													[6] = 10000000,
													[7] = 10000000,
													[8] = 10000000,
													[9] = 10000000,
													[10] = 10000000,
													[11] = 10000000,
													[12] = 10000000,
													[13] = 10000000,
													[14] = 10000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;																
							dwAttack = 0;
							dwCrit = 0;
						},	
	},
	[GNpcNO.ShaG] = 
	{
		szName = '傻姑', 	
		szIconHead = ResNpcModelConfig.Icons[10041002].szFile,
		szForgatherDescribe = '傻姑：猪肉100块一斤',
		szTeachingDescribe = '傻姑，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10041002].szFile,
					sklFile=ResNpcModelConfig.Skls[10041002].szFile,
					sanFile =ResNpcModelConfig.Sans[1004100201].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1004100202].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 50,																	
									dwWeiwangLevel = 3,																	
									dwNeedMoney = 200000000,																	
									tFriendID = {GNpcNO.WangYR},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 30},
												{dwItemID = 8200002,dwNumber = 30},
												{dwItemID = 8100140,dwNumber = 10},
												{dwItemID = 8100150,dwNumber = 10},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 14,																	
									dwNeedMoney = {
													[1] = 10000000,
													[2] = 10000000,
													[3] = 10000000,
													[4] = 10000000,
													[5] = 10000000,
													[6] = 10000000,
													[7] = 10000000,
													[8] = 10000000,
													[9] = 10000000,
													[10] = 10000000,
													[11] = 10000000,
													[12] = 10000000,
													[13] = 10000000,
													[14] = 10000000,
												},																	
										
								},
		--初始属性加成						
		tFirstProperty = {	dwMPMax = 0;																
							dwAttack = 0;
							dwFlee = 0;
						},	
	},
	[GNpcNO.KeZE] = 
	{
		szName = '柯镇恶', 	
		szIconHead = ResNpcModelConfig.Icons[10041003].szFile,
		szForgatherDescribe = '柯镇恶：猪肉100块一斤',
		szTeachingDescribe = '柯镇恶，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10041003].szFile,
					sklFile=ResNpcModelConfig.Skls[10041003].szFile,
					sanFile =ResNpcModelConfig.Sans[1004100301].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1004100313].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 50,																	
									dwWeiwangLevel = 3,																	
									dwNeedMoney = 500000000,																	
									tFriendID = {GNpcNO.ShaG},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 30},
												{dwItemID = 8200002,dwNumber = 30},
												{dwItemID = 8100140,dwNumber = 10},
												{dwItemID = 8100150,dwNumber = 10},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 14,																	
									dwNeedMoney = {
													[1] = 10000000,
													[2] = 10000000,
													[3] = 10000000,
													[4] = 10000000,
													[5] = 10000000,
													[6] = 10000000,
													[7] = 10000000,
													[8] = 10000000,
													[9] = 10000000,
													[10] = 10000000,
													[11] = 10000000,
													[12] = 10000000,
													[13] = 10000000,
													[14] = 10000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwAttack = 0;																
							dwDefense = 0;
							dwCrit = 0;
						},	
	},
	[GNpcNO.ZhouBT] = 
	{
		szName = '周伯通', 	
		szIconHead = ResNpcModelConfig.Icons[10051001].szFile,
		szForgatherDescribe = '周伯通：猪肉100块一斤',
		szTeachingDescribe = '周伯通，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10051001].szFile,
					sklFile=ResNpcModelConfig.Skls[10051001].szFile,
					sanFile =ResNpcModelConfig.Sans[1005100101].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1005100102].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 60,																	
									dwWeiwangLevel = 4,																	
									dwNeedMoney = 1000000000,																	
									tFriendID = {GNpcNO.KeZE},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 50},
												{dwItemID = 8200002,dwNumber = 45},
												{dwItemID = 8100160,dwNumber = 15},
												{dwItemID = 8100210,dwNumber = 15},
												{dwItemID = 8100200,dwNumber = 15},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 17,																	
									dwNeedMoney = {
													[1] = 15000000,
													[2] = 15000000,
													[3] = 15000000,
													[4] = 15000000,
													[5] = 15000000,
													[6] = 15000000,
													[7] = 15000000,
													[8] = 15000000,
													[9] = 15000000,
													[10] = 15000000,
													[11] = 15000000,
													[12] = 15000000,
													[13] = 15000000,
													[14] = 15000000,
													[15] = 15000000,
													[16] = 15000000,
													[17] = 15000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;																
							dwDefense = 0;
							dwFlee = 0;
						},	
	},
	[GNpcNO.YaoN] = 
	{
		szName = '窅娘', 	
		szIconHead = ResNpcModelConfig.Icons[10021025].szFile,
		szForgatherDescribe = '窅娘：猪肉100块一斤',
		szTeachingDescribe = '窅娘，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10021025].szFile,
					sklFile=ResNpcModelConfig.Skls[10021025].szFile,
					sanFile =ResNpcModelConfig.Sans[1002102501].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1002102502].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 60,																	
									dwWeiwangLevel = 4,																	
									dwNeedMoney = 2000000000,																	
									tFriendID = {GNpcNO.ZhouBT},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 50},
												{dwItemID = 8200002,dwNumber = 45},
												{dwItemID = 8100160,dwNumber = 15},
												{dwItemID = 8100210,dwNumber = 15},
												{dwItemID = 8100200,dwNumber = 15},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 17,																	
									dwNeedMoney = {
													[1] = 15000000,
													[2] = 15000000,
													[3] = 15000000,
													[4] = 15000000,
													[5] = 15000000,
													[6] = 15000000,
													[7] = 15000000,
													[8] = 15000000,
													[9] = 15000000,
													[10] = 15000000,
													[11] = 15000000,
													[12] = 15000000,
													[13] = 15000000,
													[14] = 15000000,
													[15] = 15000000,
													[16] = 15000000,
													[17] = 15000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;																
							dwMPMax = 0;
							dwCrit = 0;
						},	
	},
	[GNpcNO.DaiQS] = 
	{
		szName = '黛绮丝', 	
		szIconHead = ResNpcModelConfig.Icons[10071006].szFile,
		szForgatherDescribe = '黛绮丝：猪肉100块一斤',
		szTeachingDescribe = '黛绮丝，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10071006].szFile,
					sklFile=ResNpcModelConfig.Skls[10071006].szFile,
					sanFile =ResNpcModelConfig.Sans[1007100601].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1007100602].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 60,																	
									dwWeiwangLevel = 5,																	
									dwNeedMoney = 4000000000,																	
									tFriendID = {GNpcNO.YaoN},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 50},
												{dwItemID = 8200002,dwNumber = 45},
												{dwItemID = 8100160,dwNumber = 15},
												{dwItemID = 8100210,dwNumber = 15},
												{dwItemID = 8100200,dwNumber = 15},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 17,																	
									dwNeedMoney = {
													[1] = 15000000,
													[2] = 15000000,
													[3] = 15000000,
													[4] = 15000000,
													[5] = 15000000,
													[6] = 15000000,
													[7] = 15000000,
													[8] = 15000000,
													[9] = 15000000,
													[10] = 15000000,
													[11] = 15000000,
													[12] = 15000000,
													[13] = 15000000,
													[14] = 15000000,
													[15] = 15000000,
													[16] = 15000000,
													[17] = 15000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;
							dwMPMax = 0;
							dwAttack = 0;
						},	
	},
	[GNpcNO.LuYJ] = 
	{
		szName = '鲁有脚', 	
		szIconHead = ResNpcModelConfig.Icons[10081003].szFile,
		szForgatherDescribe = '鲁有脚：猪肉100块一斤',
		szTeachingDescribe = '鲁有脚，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10081003].szFile,
					sklFile=ResNpcModelConfig.Skls[10081003].szFile,
					sanFile =ResNpcModelConfig.Sans[1008100301].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1008100302].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 70,																	
									dwWeiwangLevel = 5,																	
									dwNeedMoney = 6000000000,																	
									tFriendID = {GNpcNO.DaiQS},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 100},
												{dwItemID = 8200002,dwNumber = 60},
												{dwItemID = 8100220,dwNumber = 20},
												{dwItemID = 8100230,dwNumber = 20},
												{dwItemID = 8100250,dwNumber = 20},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 20,																	
									dwNeedMoney = {
													[1] = 20000000,
													[2] = 20000000,
													[3] = 20000000,
													[4] = 20000000,
													[5] = 20000000,
													[6] = 20000000,
													[7] = 20000000,
													[8] = 20000000,
													[9] = 20000000,
													[10] = 20000000,
													[11] = 20000000,
													[12] = 20000000,
													[13] = 20000000,
													[14] = 20000000,
													[15] = 20000000,
													[16] = 20000000,
													[17] = 20000000,
													[18] = 20000000,
													[19] = 20000000,
													[20] = 20000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwAttack = 0;															
							dwDefense = 0;
							dwFlee = 0;
						},	
	},
	[GNpcNO.XieX] = 
	{
		szName = '谢逊', 	
		szIconHead = ResNpcModelConfig.Icons[10082006].szFile,
		szForgatherDescribe = '谢逊：猪肉100块一斤',
		szTeachingDescribe = '谢逊，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[10082006].szFile,
					sklFile=ResNpcModelConfig.Skls[10082006].szFile,
					sanFile =ResNpcModelConfig.Sans[1008200601].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[1008200611].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 70,																	
									dwWeiwangLevel = 6,																	
									dwNeedMoney = 8000000000,																	
									tFriendID = {GNpcNO.LuYJ},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 100},
												{dwItemID = 8200002,dwNumber = 60},
												{dwItemID = 8100220,dwNumber = 20},
												{dwItemID = 8100230,dwNumber = 20},
												{dwItemID = 8100250,dwNumber = 20},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 20,																	
									dwNeedMoney = {
													[1] = 20000000,
													[2] = 20000000,
													[3] = 20000000,
													[4] = 20000000,
													[5] = 20000000,
													[6] = 20000000,
													[7] = 20000000,
													[8] = 20000000,
													[9] = 20000000,
													[10] = 20000000,
													[11] = 20000000,
													[12] = 20000000,
													[13] = 20000000,
													[14] = 20000000,
													[15] = 20000000,
													[16] = 20000000,
													[17] = 20000000,
													[18] = 20000000,
													[19] = 20000000,
													[20] = 20000000,
												},																	
									
								},
		--初始属性加成						
		tFirstProperty = {	dwHPMax = 0;																
							dwMPMax = 0;
							dwAttack = 0;
						},	
	},
	[GNpcNO.ChiLY] = 
	{
		szName = '蚩萝伊', 	
		szIconHead = ResNpcModelConfig.Icons[50302007].szFile,
		szForgatherDescribe = '蚩萝伊：猪肉100块一斤',
		szTeachingDescribe = '蚩萝伊，一个杀猪的',
		szForgatherFinishTalk = {
									'哈哈',
									'呵呵',
									'嘻嘻',
								},
		szTeachingFinishTalk = {'猪头肉要不','猪腰子来一份吧',},
		model = {	
					sknFile = ResNpcModelConfig.Skns[50302007].szFile,
					sklFile=ResNpcModelConfig.Skls[50302007].szFile,
					sanFile =ResNpcModelConfig.Sans[5030200701].szFile,
					param_1_x = -0.1,param_1_y =-12,param_1_z = 2,param_2_x = 0,param_2_y = 0,param_2_z = 0,
					lieAction = ResNpcModelConfig.Sans[5030200713].szFile,
					AvatarRect = {x = 1024, y = 1024},
				},																										
		action = {{pfxId = 310,bindPos ="dummy01"}},																	
			
		--结交条件
		tForgatherQualification = { dwRoleLevel = 70,																	
									dwWeiwangLevel = 6,																	
									dwNeedMoney = 10000000000,																	
									tFriendID = {GNpcNO.XieX},															
									tItem = {
												{dwItemID = 4100010,dwNumber = 100},
												{dwItemID = 8200002,dwNumber = 60},
												{dwItemID = 8100220,dwNumber = 20},
												{dwItemID = 8100230,dwNumber = 20},
												{dwItemID = 8100250,dwNumber = 20},
											},	
									
								}, 
		--指教条件
		tTeachingQualification = {  dwLimitNum = 20,																	
									dwNeedMoney = {
													[1] = 20000000,
													[2] = 20000000,
													[3] = 20000000,
													[4] = 20000000,
													[5] = 20000000,
													[6] = 20000000,
													[7] = 20000000,
													[8] = 20000000,
													[9] = 20000000,
													[10] = 20000000,
													[11] = 20000000,
													[12] = 20000000,
													[13] = 20000000,
													[14] = 20000000,
													[15] = 20000000,
													[16] = 20000000,
													[17] = 20000000,
													[18] = 20000000,
													[19] = 20000000,
													[20] = 20000000,
												},																	
										
								},
		--初始属性加成						
		tFirstProperty = {	dwAttack = 0;															
							dwCrit = 0;
							dwFlee = 0;
						},	
	},
	

}