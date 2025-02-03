--宠物名器（装备）

--名器类型
_G.enPetEquipType =
{
	enPetEquipType_Weapon = 1,  --武器
	enPetEquipType_Clothes = 2, --衣服
	enPetEquipType_Pants = 3, 	--裤子
	enPetEquipType_Ring = 4,    --戒指
}

--名器属性
-- dwAttack = 0;--攻击
-- dwDefense = 0;--防御
-- dwFlee = 0;--身法
-- dwCrit = 0;--暴击
-- dwHPMax = 0;--生命max
-- dwMPMax = 0;--内力max
-- dwMoveSpeed = 0;--移动速度
-- dwAttackSpeed = 0;--攻击速度
-- dwHitPercent = 0;--命中率
_G.enPetEquipAttrType =
{
	[1] = {name = "攻击",key = "dwAttack",};
	[2] = {name = "防御",key = "dwDefense",};
	[3] = {name = "身法",key = "dwFlee",};
	[4] = {name = "暴击",key = "dwCrit",};
}

--升阶消耗的材料
_G.enCostMaterials =
{
	[1] = 4100140;
	[2] = 4100140;
	[3] = 4100140;
	[4] = 4100140;
	[5] = 4100140;
	[6] = 4100140;
	[7] = 4100140;
	[8] = 4100140;
	[9] = 4100140;
	[10] = 4100140;
}

--宠物名器
--[1]:名器类型 = {[1]:名器类型中不同种类={name:名称={不同阶名称}，pic:突破{不同阶图片}，addAttrType:{增加属性类型},costMaterialId:{升阶消耗的材料类型} }}
_G.PetEquipBasicConfig = {
	[1] = {
		[1] = {
			name = {"<font color='#FFFFFF'>方铁锤</font>","<font color='#00FF00'>震山锤</font>","<font color='#4169E1'>博浪锤</font>","<font color='#A020F0'>雳火锤</font>","<font color='#FFFF00'>堕天锤</font>",},
			pic = {"Icon_chongwu_yanghuwuqi.png","Icon_chongwu_yanghuwuqi.png","Icon_chongwu_yanghuwuqi.png","Icon_chongwu_yanghuwuqi.png","Icon_chongwu_yanghuwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,}, -->增加额外属性等级([名器等阶] = 当前阶星级)
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[2] = {
			name = {"<font color='#FFFFFF'>金算盘</font>","<font color='#00FF00'>琉璃珠筹</font>","<font color='#4169E1'>紫檀算盘</font>","<font color='#A020F0'>牙珠玉筹</font>","<font color='#FFFF00'>玄铁算盘</font>",},
			pic = {"Icon_chongwu_xuzhuqingwuqi.png","Icon_chongwu_xuzhuqingwuqi.png","Icon_chongwu_xuzhuqingwuqi.png","Icon_chongwu_xuzhuqingwuqi.png","Icon_chongwu_xuzhuqingwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[3] = {
			name = {"<font color='#FFFFFF'>大环刀</font>","<font color='#00FF00'>宿铁刀</font>","<font color='#4169E1'>宝钿刀</font>","<font color='#A020F0'>鸣鸿刀</font>","<font color='#FFFF00'>七圣刀</font>",},
			pic = {"Icon_chongwu_kangxinggewuqi.png","Icon_chongwu_kangxinggewuqi.png","Icon_chongwu_kangxinggewuqi.png","Icon_chongwu_kangxinggewuqi.png","Icon_chongwu_kangxinggewuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[4] = {
			name = {"<font color='#FFFFFF'>灵影拳套</font>","<font color='#00FF00'>破月拳套</font>","<font color='#4169E1'>风雷拳套</font>","<font color='#A020F0'>盘龙拳套</font>","<font color='#FFFF00'>麒麟拳套</font>",},
			pic = {"icon_chongwu_zhoubotongwuqi.png","icon_chongwu_zhoubotongwuqi.png","icon_chongwu_zhoubotongwuqi.png","icon_chongwu_zhoubotongwuqi.png","icon_chongwu_zhoubotongwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[5] = {
			name = {"<font color='#FFFFFF'>铁拂尘</font>","<font color='#00FF00'>天师拂尘</font>","<font color='#4169E1'>濯光白拂</font>","<font color='#A020F0'>太乙云展</font>","<font color='#FFFF00'>梵天白拂</font>",},
			pic = {"icon_chongwu_limochouwuqi.png","icon_chongwu_limochouwuqi.png","icon_chongwu_limochouwuqi.png","icon_chongwu_limochouwuqi.png","icon_chongwu_limochouwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[6] = {
			name = {"<font color='#FFFFFF'>绿绮琴</font>","<font color='#00FF00'>冰弦琴</font>","<font color='#4169E1'>号钟琴</font>","<font color='#A020F0'>九霄环佩</font>","<font color='#FFFF00'>大圣遗音</font>",},
			pic = {"icon_chongwu_huangyaoshiwuqi.png","icon_chongwu_huangyaoshiwuqi.png","icon_chongwu_huangyaoshiwuqi.png","icon_chongwu_huangyaoshiwuqi.png","icon_chongwu_huangyaoshiwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[7] = {
			name = {"<font color='#FFFFFF'>青竹棒</font>","<font color='#00FF00'>白玉棒</font>","<font color='#4169E1'>诛邪棒</font>","<font color='#A020F0'>混天棒</font>","<font color='#FFFF00'>打狗棒</font>",},
			pic = {"icon_chongwu_hongqigongwuqi.png","icon_chongwu_hongqigongwuqi.png","icon_chongwu_hongqigongwuqi.png","icon_chongwu_hongqigongwuqi.png","icon_chongwu_hongqigongwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[8] = {
			name = {"<font color='#FFFFFF'>精铁臂铠</font>","<font color='#00FF00'>裂石臂铠</font>","<font color='#4169E1'>玉蟾臂铠</font>","<font color='#A020F0'>疯魔臂铠</font>","<font color='#FFFF00'>掷象臂铠</font>",},
			pic = {"Icon_chongwu_oyangfengwuqi.png","Icon_chongwu_oyangfengwuqi.png","Icon_chongwu_oyangfengwuqi.png","Icon_chongwu_oyangfengwuqi.png","Icon_chongwu_oyangfengwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[9] = {
			name = {"<font color='#FFFFFF'>玄素双剑</font>","<font color='#00FF00'>清风双剑</font>","<font color='#4169E1'>无尘双剑</font>","<font color='#A020F0'>凝霜对剑</font>","<font color='#FFFF00'>影月对剑</font>",},
			pic = {"Icon_chongwu_xiaolongnvwuqi.png","Icon_chongwu_xiaolongnvwuqi.png","Icon_chongwu_xiaolongnvwuqi.png","Icon_chongwu_xiaolongnvwuqi.png","Icon_chongwu_xiaolongnvwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		[10] = {
			name = {"<font color='#FFFFFF'>宝华禅杖</font>","<font color='#00FF00'>退魔禅杖</font>","<font color='#4169E1'>无量禅杖</font>","<font color='#A020F0'>金刚禅杖</font>","<font color='#FFFF00'>菩提禅杖</font>",},
			pic = {"Icon_chongwu_yidengdashiwuqi.png","Icon_chongwu_yidengdashiwuqi.png","Icon_chongwu_yidengdashiwuqi.png","Icon_chongwu_yidengdashiwuqi.png","Icon_chongwu_yidengdashiwuqi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {1,},
			costMaterialId = {1,},
		};
		
	};
	[2] = {
		[1] = {
			name = {"<font color='#FFFFFF'>锁麟甲</font>","<font color='#00FF00'>曲璜甲</font>","<font color='#4169E1'>临戎甲</font>","<font color='#A020F0'>吞炭甲</font>","<font color='#FFFF00'>玉垒甲</font>",},
			pic = {"Icon_chongwu_yanghuyifu.png","Icon_chongwu_yanghuyifu.png","Icon_chongwu_yanghuyifu.png","Icon_chongwu_yanghuyifu.png","Icon_chongwu_yanghuyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[2] = {
			name = {"<font color='#FFFFFF'>粗麻短打</font>","<font color='#00FF00'>细麻短打</font>","<font color='#4169E1'>棉布短打</font>","<font color='#A020F0'>精织短打</font>","<font color='#FFFF00'>金乌短打</font>",},
			pic = {"Icon_chongwu_kangxinggeyifu.png","Icon_chongwu_kangxinggeyifu.png","Icon_chongwu_kangxinggeyifu.png","Icon_chongwu_kangxinggeyifu.png","Icon_chongwu_kangxinggeyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[3] = {
			name = {"<font color='#FFFFFF'>绵绸衣</font>","<font color='#00FF00'>文锦衣</font>","<font color='#4169E1'>五福衣</font>","<font color='#A020F0'>七宝衣</font>","<font color='#FFFF00'>九华衣</font>",},
			pic = {"Icon_chongwu_xuzhuqingyifu.png","Icon_chongwu_xuzhuqingyifu.png","Icon_chongwu_xuzhuqingyifu.png","Icon_chongwu_xuzhuqingyifu.png","Icon_chongwu_xuzhuqingyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[4] = {
			name = {"<font color='#FFFFFF'>细柳褐衣</font>","<font color='#00FF00'>临池褐衣</font>","<font color='#4169E1'>披云褐衣</font>","<font color='#A020F0'>贯虹褐衣</font>","<font color='#FFFF00'>斥仙褐衣</font>",},
			pic = {"Icon_chongwu_zhoubotongyifu.png","Icon_chongwu_zhoubotongyifu.png","Icon_chongwu_zhoubotongyifu.png","Icon_chongwu_zhoubotongyifu.png","Icon_chongwu_zhoubotongyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[5] = {
			name = {"<font color='#FFFFFF'>素葛道袍</font>","<font color='#00FF00'>星纹道袍</font>","<font color='#4169E1'>碧绉道袍</font>","<font color='#A020F0'>紫罗道袍</font>","<font color='#FFFF00'>玄锦道袍</font>",},
			pic = {"Icon_chongwu_limochouyifu.png","Icon_chongwu_limochouyifu.png","Icon_chongwu_limochouyifu.png","Icon_chongwu_limochouyifu.png","Icon_chongwu_limochouyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[6] = {
			name = {"<font color='#FFFFFF'>折桂袍</font>","<font color='#00FF00'>佩芷袍</font>","<font color='#4169E1'>妆梅袍</font>","<font color='#A020F0'>猗兰袍</font>","<font color='#FFFF00'>惜莲袍</font>",},
			pic = {"Icon_chongwu_huangyaoshiyifu.png","Icon_chongwu_huangyaoshiyifu.png","Icon_chongwu_huangyaoshiyifu.png","Icon_chongwu_huangyaoshiyifu.png","Icon_chongwu_huangyaoshiyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[7] = {
			name = {"<font color='#FFFFFF'>叫花衣</font>","<font color='#00FF00'>虎皮衣</font>","<font color='#4169E1'>神丐衣</font>","<font color='#A020F0'>逍遥衣</font>","<font color='#FFFF00'>降龙衣</font>",},
			pic = {"Icon_chongwu_hongqigongyifu.png","Icon_chongwu_hongqigongyifu.png","Icon_chongwu_hongqigongyifu.png","Icon_chongwu_hongqigongyifu.png","Icon_chongwu_hongqigongyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[8] = {
			name = {"<font color='#FFFFFF'>青铜护甲</font>","<font color='#00FF00'>龙象护甲</font>","<font color='#4169E1'>白驼护甲</font>","<font color='#A020F0'>混沌护甲</font>","<font color='#FFFF00'>逆鳞护甲</font>",},
			pic = {"Icon_chongwu_oyangfengyifu.png","Icon_chongwu_oyangfengyifu.png","Icon_chongwu_oyangfengyifu.png","Icon_chongwu_oyangfengyifu.png","Icon_chongwu_oyangfengyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[9] = {
			name = {"<font color='#FFFFFF'>芙蓉霓衣</font>","<font color='#00FF00'>流云霓衣</font>","<font color='#4169E1'>紫霞霓衣</font>","<font color='#A020F0'>寒霜霓衣</font>","<font color='#FFFF00'>明玉霓衣</font>",},
			pic = {"Icon_chongwu_xiaolongnvyifu.png","Icon_chongwu_xiaolongnvyifu.png","Icon_chongwu_xiaolongnvyifu.png","Icon_chongwu_xiaolongnvyifu.png","Icon_chongwu_xiaolongnvyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
		[10] = {
			name = {"<font color='#FFFFFF'>慈悲袈裟</font>","<font color='#00FF00'>枯荣袈裟</font>","<font color='#4169E1'>无妄袈裟</font>","<font color='#A020F0'>渡难袈裟</font>","<font color='#FFFF00'>浮屠袈裟</font>",},
			pic = {"Icon_chongwu_yidengdashiyifu.png","Icon_chongwu_yidengdashiyifu.png","Icon_chongwu_yidengdashiyifu.png","Icon_chongwu_yidengdashiyifu.png","Icon_chongwu_yidengdashiyifu.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {2,},
			costMaterialId = {2,},
		};
	};
	[3] = {
		[1] = {
			name = {"<font color='#FFFFFF'>锁麟护腿</font>","<font color='#00FF00'>曲璜护腿</font>","<font color='#4169E1'>临戎护腿</font>","<font color='#A020F0'>吞炭护腿</font>","<font color='#FFFF00'>玉垒护腿</font>",},
			pic = {"Icon_chongwu_yanghukuzi.png","Icon_chongwu_yanghukuzi.png","Icon_chongwu_yanghukuzi.png","Icon_chongwu_yanghukuzi.png","Icon_chongwu_yanghukuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[2] = {
			name = {"<font color='#FFFFFF'>粗麻护腿</font>","<font color='#00FF00'>细麻护腿</font>","<font color='#4169E1'>棉布护腿</font>","<font color='#A020F0'>精织护腿</font>","<font color='#FFFF00'>金乌护腿</font>",},
			pic = {"Icon_chongwu_kangxinggekuzi.png","Icon_chongwu_kangxinggekuzi.png","Icon_chongwu_kangxinggekuzi.png","Icon_chongwu_kangxinggekuzi.png","Icon_chongwu_kangxinggekuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[3] = {
			name = {"<font color='#FFFFFF'>绵绸裤</font>","<font color='#00FF00'>文锦裤</font>","<font color='#4169E1'>五福裤</font>","<font color='#A020F0'>七宝裤</font>","<font color='#FFFF00'>九华裤</font>",},
			pic = {"Icon_chongwu_xuzhuqingkuzi.png","Icon_chongwu_xuzhuqingkuzi.png","Icon_chongwu_xuzhuqingkuzi.png","Icon_chongwu_xuzhuqingkuzi.png","Icon_chongwu_xuzhuqingkuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[4] = {
			name = {"<font color='#FFFFFF'>细柳缠腿</font>","<font color='#00FF00'>临池缠腿</font>","<font color='#4169E1'>披云缠腿</font>","<font color='#A020F0'>贯虹缠腿</font>","<font color='#FFFF00'>斥仙缠腿</font>",},
			pic = {"Icon_chongwu_zhoubotongkuzi.png","Icon_chongwu_zhoubotongkuzi.png","Icon_chongwu_zhoubotongkuzi.png","Icon_chongwu_zhoubotongkuzi.png","Icon_chongwu_zhoubotongkuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[5] = {
			name = {"<font color='#FFFFFF'>素葛裤</font>","<font color='#00FF00'>星纹裤</font>","<font color='#4169E1'>碧绉裤</font>","<font color='#A020F0'>紫罗裤</font>","<font color='#FFFF00'>玄锦裤</font>",},
			pic = {"Icon_chongwu_limochoukuzi.png","Icon_chongwu_limochoukuzi.png","Icon_chongwu_limochoukuzi.png","Icon_chongwu_limochoukuzi.png","Icon_chongwu_limochoukuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[6] = {
			name = {"<font color='#FFFFFF'>折桂裤</font>","<font color='#00FF00'>佩芷裤</font>","<font color='#4169E1'>妆梅裤</font>","<font color='#A020F0'>猗兰裤</font>","<font color='#FFFF00'>惜莲裤</font>",},
			pic = {"Icon_chongwu_huangyaoshikuzi.png","Icon_chongwu_huangyaoshikuzi.png","Icon_chongwu_huangyaoshikuzi.png","Icon_chongwu_huangyaoshikuzi.png","Icon_chongwu_huangyaoshikuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[7] = {
			name = {"<font color='#FFFFFF'>叫花长裤</font>","<font color='#00FF00'>虎皮长裤</font>","<font color='#4169E1'>神丐长裤</font>","<font color='#A020F0'>逍遥长裤</font>","<font color='#FFFF00'>降龙长裤</font>",},
			pic = {"Icon_chongwu_hongqigongkuzi.png","Icon_chongwu_hongqigongkuzi.png","Icon_chongwu_hongqigongkuzi.png","Icon_chongwu_hongqigongkuzi.png","Icon_chongwu_hongqigongkuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[8] = {
			name = {"<font color='#FFFFFF'>青铜护腿</font>","<font color='#00FF00'>龙象护腿</font>","<font color='#4169E1'>白驼护腿</font>","<font color='#A020F0'>混沌护腿</font>","<font color='#FFFF00'>逆鳞护腿</font>",},
			pic = {"Icon_chongwu_oyangfengkuzi.png","Icon_chongwu_oyangfengkuzi.png","Icon_chongwu_oyangfengkuzi.png","Icon_chongwu_oyangfengkuzi.png","Icon_chongwu_oyangfengkuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[9] = {
			name = {"<font color='#FFFFFF'>芙蓉裙</font>","<font color='#00FF00'>流云裙</font>","<font color='#4169E1'>紫霞裙</font>","<font color='#A020F0'>寒霜裙</font>","<font color='#FFFF00'>明玉裙</font>",},
			pic = {"Icon_chongwu_xiaolongnvkuzi.png","Icon_chongwu_xiaolongnvkuzi.png","Icon_chongwu_xiaolongnvkuzi.png","Icon_chongwu_xiaolongnvkuzi.png","Icon_chongwu_xiaolongnvkuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
		[10] = {
			name = {"<font color='#FFFFFF'>慈悲绑腿</font>","<font color='#00FF00'>枯荣绑腿</font>","<font color='#4169E1'>无妄绑腿</font>","<font color='#A020F0'>渡难绑腿</font>","<font color='#FFFF00'>浮屠绑腿</font>",},
			pic = {"Icon_chongwu_yidengdashikuzi.png","Icon_chongwu_yidengdashikuzi.png","Icon_chongwu_yidengdashikuzi.png","Icon_chongwu_yidengdashikuzi.png","Icon_chongwu_yidengdashikuzi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {3,},
			costMaterialId = {3,},
		};
	};
	[4] = {
		[1] = {
			name = {"<font color='#FFFFFF'>黄铜护指</font>","<font color='#00FF00'>飞锡护指</font>","<font color='#4169E1'>苍梧护指</font>","<font color='#A020F0'>电光护指</font>","<font color='#FFFF00'>连城护指</font>",},
			pic = {"Icon_chongwu_yanghujiezhi.png","Icon_chongwu_yanghujiezhi.png","Icon_chongwu_yanghujiezhi.png","Icon_chongwu_yanghujiezhi.png","Icon_chongwu_yanghujiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[2] = {
			name = {"<font color='#FFFFFF'>桐木指环</font>","<font color='#00FF00'>牛骨指环</font>","<font color='#4169E1'>犀角指环</font>","<font color='#A020F0'>象牙指环</font>","<font color='#FFFF00'>水晶指环</font>",},
			pic = {"Icon_chongwu_kangxinggejiezhi.png","Icon_chongwu_kangxinggejiezhi.png","Icon_chongwu_kangxinggejiezhi.png","Icon_chongwu_kangxinggejiezhi.png","Icon_chongwu_kangxinggejiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[3] = {
			name = {"<font color='#FFFFFF'>紫牙扳指</font>","<font color='#00FF00'>白玉扳指</font>","<font color='#4169E1'>赤珊扳指</font>","<font color='#A020F0'>玛瑙扳指</font>","<font color='#FFFF00'>翡翠扳指</font>",},
			pic = {"Icon_chongwu_xuzhuqingjiezhi.png","Icon_chongwu_xuzhuqingjiezhi.png","Icon_chongwu_xuzhuqingjiezhi.png","Icon_chongwu_xuzhuqingjiezhi.png","Icon_chongwu_xuzhuqingjiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[4] = {
			name = {"<font color='#FFFFFF'>采薇戒指</font>","<font color='#00FF00'>观鱼戒指</font>","<font color='#4169E1'>雪唱戒指</font>","<font color='#A020F0'>酌霞戒指</font>","<font color='#FFFF00'>啸游戒指</font>",},
			pic = {"Icon_chongwu_zhoubotongjiezhi.png","Icon_chongwu_zhoubotongjiezhi.png","Icon_chongwu_zhoubotongjiezhi.png","Icon_chongwu_zhoubotongjiezhi.png","Icon_chongwu_zhoubotongjiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[5] = {
			name = {"<font color='#FFFFFF'>秋水戒</font>","<font color='#00FF00'>红尘戒</font>","<font color='#4169E1'>忘机戒</font>","<font color='#A020F0'>天权戒</font>","<font color='#FFFF00'>凤仪戒</font>",},
			pic = {"Icon_chongwu_limochoujiezhi.png","Icon_chongwu_limochoujiezhi.png","Icon_chongwu_limochoujiezhi.png","Icon_chongwu_limochoujiezhi.png","Icon_chongwu_limochoujiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[6] = {
			name = {"<font color='#FFFFFF'>樵风指环</font>","<font color='#00FF00'>修月指环</font>","<font color='#4169E1'>洞仙指环</font>","<font color='#A020F0'>华胥指环</font>","<font color='#FFFF00'>伏羲指环</font>",},
			pic = {"Icon_chongwu_huangyaoshijiezhi.png","Icon_chongwu_huangyaoshijiezhi.png","Icon_chongwu_huangyaoshijiezhi.png","Icon_chongwu_huangyaoshijiezhi.png","Icon_chongwu_huangyaoshijiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[7] = {
			name = {"<font color='#FFFFFF'>草环戒</font>","<font color='#00FF00'>金丝戒</font>","<font color='#4169E1'>青玉戒</font>","<font color='#A020F0'>碧玺戒</font>","<font color='#FFFF00'>紫晶戒</font>",},
			pic = {"Icon_chongwu_hongqigongjiezhi.png","Icon_chongwu_hongqigongjiezhi.png","Icon_chongwu_hongqigongjiezhi.png","Icon_chongwu_hongqigongjiezhi.png","Icon_chongwu_hongqigongjiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[8] = {
			name = {"<font color='#FFFFFF'>琥珀戒</font>","<font color='#00FF00'>昆玉戒</font>","<font color='#4169E1'>巨灵戒</font>","<font color='#A020F0'>玄冥戒</font>","<font color='#FFFF00'>灭神戒</font>",},
			pic = {"Icon_chongwu_oyangfengjiezhi.png","Icon_chongwu_oyangfengjiezhi.png","Icon_chongwu_oyangfengjiezhi.png","Icon_chongwu_oyangfengjiezhi.png","Icon_chongwu_oyangfengjiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[9] = {
			name = {"<font color='#FFFFFF'>拂柳玉戒</font>","<font color='#00FF00'>无影玉戒</font>","<font color='#4169E1'>灵犀玉戒</font>","<font color='#A020F0'>黯晶玉戒</font>","<font color='#FFFF00'>无暇玉戒</font>",},
			pic = {"Icon_chongwu_xiaolongnvjiezhi.png","Icon_chongwu_xiaolongnvjiezhi.png","Icon_chongwu_xiaolongnvjiezhi.png","Icon_chongwu_xiaolongnvjiezhi.png","Icon_chongwu_xiaolongnvjiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
		[10] = {
			name = {"<font color='#FFFFFF'>无相宝戒</font>","<font color='#00FF00'>佛光宝戒</font>","<font color='#4169E1'>九转宝戒</font>","<font color='#A020F0'>般若宝戒</font>","<font color='#FFFF00'>轮回宝戒</font>",},
			pic = {"Icon_chongwu_yidengdashijiezhi.png","Icon_chongwu_yidengdashijiezhi.png","Icon_chongwu_yidengdashijiezhi.png","Icon_chongwu_yidengdashijiezhi.png","Icon_chongwu_yidengdashijiezhi.png",},
			quality= {0,1,2,3,4,},
			addAxtraLv = {10,10,10,10,10,},
			addAttrType = {4,},
			costMaterialId = {4,},
		};
	};
};

--不同宠物对应的名器类型
--[10021030]:宠物ID,{EquipType:名器类型表 {key:名器类型，value:名器类型的子类型}}
--宠物品质参数
   local character = {
	[50710015] = 1,
	[10021030] = 1.2,
	[10021015] = 1.4,
	[10051001] = 1.6,
	[10092007] = 1.8,
	[10051003] = 2,
	[10082007] = 2.2,
	[10071007] = 2.4,
	[50302063] = 2.6,
	[10061001] = 3
	};   
--宠物基础属性	
	local basevalue={
	[1] = {
		[1]={60,30,12,6};
		[2]={90,45,18,9};
		[3]={120,60,24,12};
		[4]={150,75,30,15};
		[5]={180,90,36,18};
		[6]={210,105,42,21};
		[7]={240,120,48,24};
		[8]={270,135,54,27};
		[9]={300,150,60,30};
		[10]={330,165,66,33};
		};
	[2] = {
		[1]={400,200,80,40};
		[2]={470,235,94,47};
		[3]={540,270,108,54};
		[4]={610,305,122,61};
		[5]={680,340,136,68};
		[6]={750,375,150,75};
		[7]={820,410,164,82};
		[8]={890,445,178,89};
		[9]={960,480,192,96};
		[10]={1030,515,206,103};	
		};
	[3] = {
		[1]={1180,590,236,118};
		[2]={1330,665,266,133};
		[3]={1480,740,296,148};
		[4]={1630,815,326,163};
		[5]={1780,890,356,178};
		[6]={1930,965,386,193};
		[7]={2080,1040,416,208};
		[8]={2230,1115,446,223};
		[9]={2380,1190,476,238};
		[10]={2530,1265,506,253};
		};
	[4] = {
		[1]={2840,1420,568,284};
		[2]={3150,1575,630,315};
		[3]={3460,1730,692,346};
		[4]={3770,1885,754,377};
		[5]={4080,2040,816,408};
		[6]={4390,2195,878,439};
		[7]={4700,2350,940,470};
		[8]={5010,2505,1002,501};
		[9]={5320,2660,1064,532};
		[10]={5630,2815,1126,563};
		};
	[5] = {
		[1]={6260,3130,1252,626};
		[2]={6890,3445,1378,689};
		[3]={7520,3760,1504,752};
		[4]={8150,4075,1630,815};
		[5]={8780,4390,1756,878};
		[6]={9410,4705,1882,941};
		[7]={10040,5020,2008,1004};
		[8]={10670,5335,2134,1067};
		[9]={11300,5650,2260,1130};
		[10]={11930,5965,2386,1193};		
		};
	};  
--宠物套装属性
local suitnature={
	[1]={300,150,60,30};
	[2]={400,200,80,40};
	[3]={600,300,120,60};
	[4]={1000,500,200,100};
	[5]={1500,750,300,150};
	};	
--名器锻造成功率
local successrate={
    [1]=10000;
	[2]=7500;
	[3]=6000;
	[4]=5000;
	[5]=5000;
	};
--名器锻造消耗材料数量
local materialnumber={
    [1]=5;
    [2]=5;
    [3]=10;
    [4]=12;
    [5]=15;
};
--名器锻造消耗银两数量
local moneynumber={
	[1]={	
		[1]=50000;
		[2]=75000;
		[3]=100000;
		[4]=125000;
		[5]=150000;
		[6]=175000;
		[7]=200000;
		[8]=225000;
		[9]=250000;
		[10]=275000;
	};
	[2]={
		[1]=325000;
		[2]=375000;
		[3]=425000;
		[4]=475000;
		[5]=525000;
		[6]=575000;
		[7]=625000;
		[8]=675000;
		[9]=725000;
		[10]=775000;
	};
	[3]={
		[1]=825000;
		[2]=875000;
		[3]=925000;
		[4]=975000;
		[5]=1025000;
		[6]=1075000;
		[7]=1125000;
		[8]=1175000;
		[9]=1225000;
		[10]=1275000;
	};	
	[4]={
		[1]=1325000;
		[2]=1375000;
		[3]=1425000;
		[4]=1475000;
		[5]=1525000;
		[6]=1575000;
		[7]=1625000;
		[8]=1675000;
		[9]=1725000;
		[10]=1775000;
	};
	[5]={
		[1]=1850000;
		[2]=1925000;
		[3]=2000000;
		[4]=2075000;
		[5]=2150000;
		[6]=2225000;
		[7]=2300000;
		[8]=2375000;
		[9]=2450000;
		[10]=2525000;
	};	
}; 

_G.PetEquipConfig = {
	[50710015] = {	--杨铁匠
		EquipType = {1,1,1,1,};
	};
	[10021030] = {	-- 康兴哥
		EquipType = {3,2,2,2,};
	};
	[10021015] = {	-- 许竹青
		EquipType = {2,3,3,3,};
	};
	[10051001] = {	-- 周伯通
		EquipType = {4,4,4,4,};
	};
	[10092007] = {	-- 李莫愁
		EquipType = {5,5,5,5,};
	};
	[10051003] = {	-- 黄药师
		EquipType = {6,6,6,6,};
	};
	[10082007] = {	-- 洪七公
		EquipType = {7,7,7,7,};
	};
	[10071007] = {	-- 欧阳锋
		EquipType = {8,8,8,8,};
	};
	[50302063] = {	-- 小龙女
		EquipType = {9,9,9,9,};
	};
	[10061001] = {	-- 一灯大师
		EquipType = {10,10,10,10,};
	};
	--最大装备等级
	MaxEquipLevel = 50;
	
	--获取升阶成功的概率(概率基数为10000)
	--dwPetId:宠物ID，dwType：装备类型，dwLevel：当前等级
	Probability = function(dwPetId,dwType,dwLevel)
		local level,star = _G.PetEquipConfig.GetEeuipLvAndStar(dwLevel); -->装备等级和当前星级
		local probability = successrate[level];
		
		return probability;
	end;
	
	--获取成功率字符串
	--dwPetId:宠物ID，dwType：装备类型，dwLevel：当前等级
	GetProbabilityStr = function(dwPetId,dwType,dwLevel)
		local str = "";
		local probability = _G.PetEquipConfig.Probability(dwPetId,dwType,dwLevel);
		if probability >= 10000 then	
			return "必成";
		elseif probability >= 8000 then
			return "容易";
		elseif probability >= 4000 then
			return "一般";
		elseif probability >= 2000 then
			return "较难";
		else
			return "很难";
		end;
	end;
	
	--获取名器品阶对应增加属性
	--dwPetId:宠物ID，dwType:属性类型，dwLevel:名器等阶,dwStar:等阶对应的星级
	AddAttr = function(dwPetId,dwType,dwLevel,dwStar)
		if not dwStar then dwStar = 0; end
		
		return math.floor(character[dwPetId]*basevalue[dwLevel][dwStar][dwType]);
	end;
	
	--获取名器品阶对应额外增加属性
	--dwPetId:宠物ID，dwType:属性类型，dwLevel:套装等级,dwStar:等阶对应的星级,isActive:当前星级是否激活
	AddExtraAttr = function(dwPetId,dwType,dwLevel,dwStar,isActive)
		if not dwStar then dwStar = 0; end
		local dwSuitLevel = dwLevel - 1;
		
		if isActive then dwSuitLevel = dwSuitLevel + 1; end
		local value = 0;
		if dwSuitLevel ~= 0 then
			value = math.floor(character[dwPetId]*suitnature[dwSuitLevel][dwType]);
		end
		
		return value;
	end;
	
	--获取升阶消耗的材料数量和银两
	--dwPetId:宠物ID,dwType:材料类型，dwLevel:名器等阶,dwStar:等阶对应的星级
	GetCostMaterialAndSilver = function(dwPetId,dwType,dwLevel,dwStar)
		if not dwStar then dwStar = 0; end
		local materialNum =materialnumber[dwLevel];
		local SilverNum =moneynumber[dwLevel][dwStar];
		
		return materialNum,SilverNum;
	end;
	
	--获取宠物对应的名器等阶和星级(dwSum:1~50)
	GetEeuipLvAndStar = function(dwSum)
		local dwLevel = 0;
		local dwStar = 0;
		if dwSum then
			local Sum = dwSum - 1;
			dwLevel = math.floor(Sum/10);
			dwStar = Sum%10;
		end
		return dwLevel+1,dwStar+1;
	end;
	
	--获取品阶对应的信息
	--dwPetId:宠物ID
	--return:{key名器类型，equipInfo名器信息}
	GetPetEquipInfo = function(dwPetId)
		local petInfo = _G.PetEquipConfig[dwPetId];
		if not petInfo or not petInfo.EquipType then return; end
		local petEquipInfo = {};
		for key,value in ipairs(petInfo.EquipType) do
			if key then
				local equipInfo = _G.PetEquipBasicConfig[key][value];
				petEquipInfo[key] = equipInfo;
			end
		end
		
		return petEquipInfo;
	end;
	
	--获取名器品质
	--dwPetId:宠物ID,dwEquipType:品阶类型，dwLevel:名器等阶
	GetQualityType = function(dwPetId,dwEquipType,dwLevel)
		local petEquipInfo = _G.PetEquipConfig.GetPetEquipInfo(dwPetId);
		if not petEquipInfo then return; end
		local equipInfo = petEquipInfo[dwEquipType];
		local allQuality = equipInfo.quality;
		return allQuality[dwLevel];
	end;
	
	--获取品阶对应的名称和图片
	--dwPetId:宠物ID,dwEquipType:品阶类型，dwLevel:名器等阶,dwStar:等阶对应的星级(备用)
	--return:{品阶对应的名称,}
	GetNameAndPic = function(dwPetId,dwEquipType,dwLevel,dwStar)
		local petEquipInfo = _G.PetEquipConfig.GetPetEquipInfo(dwPetId);
		if not petEquipInfo then return; end
		local equipInfo = petEquipInfo[dwEquipType];
		if not equipInfo then return "","empty.png"; end
		local allName = equipInfo.name;
		local allPic = equipInfo.pic;
		return allName[dwLevel],allPic[dwLevel];
	end;
	
	--获取品阶对应增加的属性
	--dwPetId:宠物ID,dwEquipType:品阶类型，dwLevel:名器等阶,dwStar:等阶对应的星级
	--return：{属性类型:增加值,}
	GetAddAttr = function(dwPetId,dwEquipType,dwLevel,dwStar)
		local petEquipInfo = _G.PetEquipConfig.GetPetEquipInfo(dwPetId);
		if not petEquipInfo then return; end
		local addAttrList = {};
		local equipInfo = petEquipInfo[dwEquipType];
		if equipInfo then
			local allAttr = equipInfo.addAttrType;
			for key,value in ipairs(allAttr) do
				if key then
					local addValue = _G.PetEquipConfig.AddAttr(dwPetId,value,dwLevel,dwStar);
					addAttrList[value] = addValue;
				end
			end
		end
		return addAttrList;
	end;
	
	--获取品阶对应增加的额外属性
	--dwPetId:宠物ID,setLevel:宠物对应的名器信息，dwSuitLv:套装等级(为空时，获得当前套装等级)
	--return：{属性类型:增加值,}
	GetAddExtraAttr = function(dwPetId,setLevel,dwSuitLv)
		local petEquipInfo = _G.PetEquipConfig.GetPetEquipInfo(dwPetId);
		if not petEquipInfo then return; end
		
		local suitlv = 1;
		local suitStar = 1;
		local IsShow = false;
		if not dwSuitLv then
			local sortEquipInfo = {};
			for key,value in ipairs(setLevel) do
				sortEquipInfo[key] = value;
			end
			table.sort(sortEquipInfo);
			suitlv,suitStar = _G.PetEquipConfig.GetEeuipLvAndStar(sortEquipInfo[1]);
		else
			suitlv = dwSuitLv;
			IsShow = true;
		end
		
		local isActive = true;
		for key,dwEquipType in pairs(_G.enPetEquipType) do
			local equipInfo = petEquipInfo[dwEquipType];
			local AxtraLv = equipInfo.addAxtraLv;
			local lv,dwStar = _G.PetEquipConfig.GetEeuipLvAndStar(setLevel[dwEquipType]);
			if suitlv >= lv then
				if suitlv > lv or dwStar < AxtraLv[lv] then
					isActive = false;
				end
			end
		end
		
		local addExtraList = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,};
		local allAttr = {1,2,3,4,}; -->增加额外属性类型
		for key,value in ipairs(allAttr) do
			if key then
				if IsShow then isActive = true; end
				local addValue = _G.PetEquipConfig.AddExtraAttr(dwPetId,value,suitlv,suitStar,isActive);
				addExtraList[value] = addValue;
			end
		end
		return addExtraList;
	end;
	
	--获取名器升阶消耗信息
	--dwPetId:宠物ID,dwEquipType:品阶类型，dwLevel:名器等阶,dwStar:等阶对应的星级
	--return:table类型(key:材料枚举id,value:{[1] = 材料个数，[2] = 消耗银两数})
	GetUpgradeCost = function(dwPetId,dwEquipType,dwLevel,dwStar)
		local petEquipInfo = _G.PetEquipConfig.GetPetEquipInfo(dwPetId);
		if not petEquipInfo then return; end
		local UpgradeCost = {};
		local sumSliver = 0;
		local equipInfo = petEquipInfo[dwEquipType];
		local costMaterials = equipInfo.costMaterialId;
		for key,value in ipairs(costMaterials) do
			if key then
				local mNum,sNum = _G.PetEquipConfig.GetCostMaterialAndSilver(dwPetId,value,dwLevel,dwStar);
				local enumId = _G.enCostMaterials[value];
				sumSliver = sumSliver + sNum;
				UpgradeCost[enumId] = {[1] = mNum,[2] = sNum};
			end
		end
		UpgradeCost.AllSliver = sumSliver; --总共消耗银两数
		
		return UpgradeCost;
	end;
	
	--获取宠物属性加成
	--dwPetId:宠物ID,setLevel:当前宠物的名器等级列表
	GetAddAttrToPet= function(dwPetId, setLevel)
		if not dwPetId or not setLevel then return; end
		local objData = _G.PetSingleAttr:new(false);
		local addExtraAttrList = _G.PetEquipConfig.GetAddExtraAttr(dwPetId,setLevel);
		for key,value in ipairs(setLevel) do
			local dwlevel,dwStar = _G.PetEquipConfig.GetEeuipLvAndStar(value);
			local addAttrList = _G.PetEquipConfig.GetAddAttr(dwPetId,key,dwlevel,dwStar);
			if addAttrList then
				for attrType,addValue in pairs(addAttrList) do
					local attrKey = _G.enPetEquipAttrType[attrType].key;
					if attrKey then
						objData[attrKey] = addValue;
					end
				end
			end
		end
		for attrType,value in ipairs(_G.enPetEquipAttrType) do
			local attrKey = value.key;
			if addExtraAttrList then 
				objData[attrKey] = objData[attrKey] + addExtraAttrList[attrType];
			end
		end
		
		return objData;
	end;
	
	--是否接收广播消息
	--dwPlayerLevel:玩家等级
	IsGetBroadcastMsg = function(dwPlayerLevel)
		local isGet = true; -->默认显示广播消息
		if dwPlayerLevel and dwPlayerLevel < 15 then
			isGet = false;
		end
		return isGet;
	end;
};

--提示框配置
_G.EquipTipsConfig = {
	[1] = [[<font color="#00CC33">%s</font><br/>]];--名称
	[2] = [[<font color="#FF0000">  满星</font>]];
	[3] = [[<font color="#FFCC66">当前属性:</font><font color="#00CC33">%s</font><br/>]];
	[4] = [[<font color="#FFCC66">下级属性:</font><font color="#00CC33">%s</font><br/>]];
	[5] = [[<font color="#00FF00">点击图标升级</font>]];
	--套装提示
	[9] = [[<font color="#FDF445">【神兵套装】</font>]];--套装标题
	[10] = [[<img src = 'img://Xtb_equip.png'><font color="#dd02dc">神兵(%s级)</font><br/>]];--套装等级
	[11] = [[<font color=%s>激活条件:所有装备达到以下星级</font><br/>]];
	[12] = [[<font color=%s>%s(%s星)</font><br/>]];--
	[13] = [[<font color=%s>加成属性</font><br/>]];
	[14] = [[<font color=%s>%s+%s</font><br/>]]; -->属性
};

--名器套装颜色
_G.SuitEquipColor = {
	[1] = "'#9d8e7c'", -->未激活
	[2] = "'#00FF00'", -->激活
	[3] = "'#278cf1'", -->激活条件(未激活)
	[4] = "'#4ae833'", -->激活条件(激活)
	[5] = "'#9d8e7c'", -->加成属性(未激活)
	[6] = "'#039846'",-->加成属性(激活)
};

--名器锻造配置
_G.RefineEquipConfig = {
	szEquipName = "<font color=%s>%s（%s星）</font>", -->标题格式
	szCostMaterial = "<font color=%s>%s × %s </font>", -->消耗材料
	szCostSliver = "<font color=%s>%s</font>", -->消耗银两
	szCurAttr = "当前%s", -->当前属性
	szNextAttr = "下级%s", -->升级后属性
	szFillLv = "<font color='#FFFFFF'>名器已达最高阶满星，不需要进行锻造</font>", -->满级
	szNotMaterial = "<font color='#FFFFFF'>请检查包裹中是否具有足够的%s</font>", -->材料不足
	szNotSliver = "<font color='#FFFFFF'>银两不足，无法进行名器锻造</font>",
	szBroadCastStr = "恭喜%s将侠客%s的%s锻造成%s！", -->广播消息
	szBroadCastStr1 = "恭喜%s将侠客%s的%s锻造成%s(满星)！", -->满星广播消息
	szupgradeFail = "<font color='#FFFFFF'>名器锻造未成功，请再接再厉！</font>", -->升级失败
};

