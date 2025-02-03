--[[
   [ \brief 排行榜奖励配置
   [ \author 路广华、赵旭
   [ \date 2014-05-04
   [ 用于该系统客户端及服务器数据相关配置
   ]]

-- 配置表
_G.ChartAwardConfig = {};

--物品编号  物品ID               物品数量         绑定类型      生存周期 
-- 奖励配置
_G.ChartAwardConfig.Prize = 
{
    [enChartType.eCombo] = {
	-------第1
		[1] = {
			[1] = {ItemEnumID = 2400140; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940006; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300561; ItemNumber = 3; BindType = 1; LifeTime = nil; };
			}; 
	-------第2~5
		[2] = {
			[1] = {ItemEnumID = 2400130; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940005; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 2; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300562; ItemNumber = 2; BindType = 1; LifeTime = nil; };
			}; 
	-------第6~10	
		[3] = {
			[1] = {ItemEnumID = 2400120; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940005; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300563; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
	-------第11~50	
		[4] = {
			[1] = {ItemEnumID = 2400110; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940003; ItemNumber = 8; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910003; ItemNumber = 8; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300564; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
	-------第51~100	
		[5] = {
			[1] = {ItemEnumID = 2400110; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940003; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910003; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300565; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
		}; 
    [enChartType.eKiller] = {
	-------第1
		[1] = {
			[1] = {ItemEnumID = 2400140; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940006; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300561; ItemNumber = 3; BindType = 1; LifeTime = nil; };
			}; 
	-------第2~5
		[2] = {
			[1] = {ItemEnumID = 2400130; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940005; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 2; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300562; ItemNumber = 2; BindType = 1; LifeTime = nil; };
			}; 
	-------第6~10	
		[3] = {
			[1] = {ItemEnumID = 2400120; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940005; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300563; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
	-------第11~50	
		[4] = {
			[1] = {ItemEnumID = 2400110; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940003; ItemNumber = 8; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910003; ItemNumber = 8; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300564; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
	-------第51~100	
		[5] = {
			[1] = {ItemEnumID = 2400110; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940003; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910003; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300565; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
		}; 
    [enChartType.eBoss] = {
	-------第1
		[1] = {
			[1] = {ItemEnumID = 2400140; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940006; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300561; ItemNumber = 3; BindType = 1; LifeTime = nil; };
			}; 
	-------第2~5
		[2] = {
			[1] = {ItemEnumID = 2400130; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940005; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 2; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300562; ItemNumber = 2; BindType = 1; LifeTime = nil; };
			}; 
	-------第6~10	
		[3] = {
			[1] = {ItemEnumID = 2400120; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940005; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910005; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300563; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
	-------第11~50	
		[4] = {
			[1] = {ItemEnumID = 2400110; ItemNumber = 3; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940003; ItemNumber = 8; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910003; ItemNumber = 8; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300564; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
	-------第51~100	
		[5] = {
			[1] = {ItemEnumID = 2400110; ItemNumber = 1; BindType = 1; LifeTime = nil; }; 
			[2] = {ItemEnumID = 5940003; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[3] = {ItemEnumID = 5910003; ItemNumber = 5; BindType = 1; LifeTime = nil; }; 
			[4] = {ItemEnumID = 6300565; ItemNumber = 1; BindType = 1; LifeTime = nil; };
			}; 
		}; 
}; 
-- 文本信息配置项
--变量名 = 字符串
_G.ChartAwardConfig.Text =
{
	GetPrizeBtn = T"领奖";
    Title = T"我的领奖排名:%d";
    NoTitle = T"尚未获得排名";
    PaiMingFirst = T"第 %d 名";
    PaiMingOther = T"第%d-%d名";
    Count = T"%d个";
	Day = T"%d天";
	Hour = T"%d小时";
	Min = T"%d分钟";
	Sec = T"%d秒后刷新";
};

-- 奖品区间
--1; 2-5; 6-10...
_G.ChartAwardConfig.Level = 
    {[1] = 1;  [2] = 5;  [3] = 10;  [4] = 50;  [5] = 100};
-- 拥有奖品的项目
-- [顺序] = 标签
_G.ChartAwardConfig.HaveAward = 
{
	[enChartType.eCombo] = 1;
	[enChartType.eKiller] = 1;
    [enChartType.eBoss] = 1;
};

-- 错误码
_G.ChartAwardConfig.ErrorCode =
{
    -- 发放奖励失败
    [1] = 13009300026;
    -- 非奖励排行榜
    [2] = 13009300027;
    -- 玩家不在奖励范围内
    [3] = 13009300028;
    -- 已领取该奖励
    [4] = 13009300029;
}

-- 邮件补发奖励配置
_G.ChartAwardConfig.MailAward = 
{
    -- 发送者角色编号
    SenderRoleID = -9999;
    -- 发送者角色名称
    SenderRoleName = T"系统邮件";
    -- 邮件标题
    Topic = T"排名奖励";
    -- 邮件内容
    Content = T"您好，您的排名奖励已经通过邮件返还给您，请您及时领取奖励";
    -- 邮件有效时间
    LifeTime = 168 * 60* 60 * 1000;
}

