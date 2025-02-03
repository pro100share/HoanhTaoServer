local Img = {
	[11] = [[<img src="img://Xtb_stone.png">]];	
	[18] = [[<img src="img://Xtb_collective.png">]];--副本		
}

_G.LanternConfig = {
	
	dwScore = 10;--答对一题加的分数
	dwMaxScore = 3000000;--积分最大值
	dwFade = 4500;--假花灯概率(1/10000)
	Time = {
		Day={7,8,9,10,11,12,13,14};--开启日期
		StartNotice = "18:50";--开始公告时间
		Start = "19:00";--开始时间
		EndNotice = "21:50";--结束公告时间
		End = "22:00";--结束时间
	};
	
	szPreStartNotice = [[月上柳梢头，人约黄昏后。元宵灯会将于<font color='#00FF00'>十分钟后</font>在<font color='#00FF00'>二线襄阳城(-48，20)附近</font>举办，众位侠士可邀知己，携美眷，共襄盛会！]];--即将开始公告
	szPreEndNotice = [[欢聚有时，灯火将尽，元宵灯会今日作场将于十分钟后结束，还想参与的侠士请速速赶到<font color='#00FF00'>二线襄阳城(-48，20)附近</font>！]];--即将结束公告
	
	szStartNotice = [[元宵灯会已经开始，众位侠士可邀知己、携美眷，前往<font color='#00FF00'>二线襄阳城(-48，20)附近</font>，听凤箫声动，观玉壶光转，逍遥尘俗外，漫步灯会中！]];--开始公告
	szEndNotice = "元宵灯会今日作场已经结束，恭祝各位侠士新春吉祥，诸事如意！";--结束公告
	
	NpcID = {--刷出的npcid
		10021121,
		10021122,
		10021123,
		10021129,		
	};
	
	Pos = {
		[1] = {1002,-48.62,25.75,0};--mapid x y dir
		[2] = {1002,-53.56,25.88,0};
		[3] = {1002,-58.47,25.94,0};
		[4] = {1002,-63.60,25.92,0};
		[5] = {1002,-63.99,31.69,0};	
		[6] = {1002,-64.03,37.67,0};
		[7] = {1002,-64.19,44.00,0};		
		[8] = {1002,-64.19,50.66,0};			
		[9] = {1002,-64.19,56.99,0};
		[10] = {1002,-64.19,62.14,0};
		[11] = {1002,-64.19,67.57,0};	

		[12] = {1002,-73.34,67.57,0};
		[13] = {1002,-73.34,62.14,0};
		[14] = {1002,-73.34,56.99,0};
		[15] = {1002,-73.34,50.66,0};
		[16] = {1002,-73.34,44.00,0};	
		[17] = {1002,-73.34,37.67,0};	
		[18] = {1002,-73.34,31.69,0};

		[19] = {1002,-63.60,10.35,0};
		[20] = {1002,-63.60,5.03,0};
		[21] = {1002,-63.60,-0.44,0};
		[22] = {1002,-57.87,-1.33,0};	
		[23] = {1002,-52.75,-1.33,0};	
		[24] = {1002,-46.74,-1.33,0};	

		[25] = {1002,-46.74,-7.00,0};
		[26] = {1002,-55.52,-7.00,0};	
		[27] = {1002,-57.87,-4.91,0};	
		[28] = {1002,-63.60,-4.91,0};
		[29] = {1002,-71.96,-0.44,0};	
		[30] = {1002,-71.96,5.03,0};	
		[31] = {1002,-71.96,10.35,0};

		[32] = {1002,-58.47,13.64,0};
		[33] = {1002,-53.56,13.64,0};		
	};
	
	Item = {
		[0] = 7400004;--花灯
		[1] = 7400001;--芝麻汤圆
		[2] = 7400002;--枣泥汤圆
		[3] = 7400003;--酒酿丸子
	};
	
	ExChange = {--兑换  物品id，积分
		[1] = {7400005,88};
		[2] = {7400006,998};
		[3] = {7400007,2014518};
	};
	
	Talk = {--固定对话
		[1] = "花灯中分真假，真花灯中含灯谜一道，猜对灯谜后，可获花灯一盏，积分10分。假花灯中空空如也，并将扣除当前所有积分。食用元宵，或可减少积分损失，请侠士选择如何开启花灯。";
		[2] = "此盏花灯已经被%s侠士摘取，请耐心稍等%s秒，将有新的花灯奉上！";
		[3] = Img[11].."食用芝麻汤圆，采到真花灯时可使积分翻倍";
		[4] = Img[11].."食用枣泥汤圆，采到假花灯时可保积分不受损失";
		[5] = Img[11].."食用酒酿丸子，采到假花灯时可令积分损失减半";
		[6] = Img[18].."空手套白狼，就这么开了！";
	};
	
	Notice = {--提示信息
		[1] = "恭喜答对，积分翻倍！当前积分 %d";
		[2] = "恭喜答对，获得10分！当前积分 %d";
		[3] = "很遗憾，答案错误！当前积分 %d";
		[4] = "这盏花灯是假的，积分清零！当前积分 %d";
		[5] = "这盏花灯是假的，积分减半！当前积分 %d";
		[6] = "这盏花灯是假的，积分不变！当前积分 %d";
		[7] = "您的背包已满，无法放入花灯，请整理背包后重新采灯。";
		[8] = "积分不足";
		[9] = "背包空间不足，无法兑换";
		[10] = "兑换成功";
		[11] = "已经兑换过了";
		[12] = "您已达到积分最高值，无法继续获取积分";
	};
	Mail = {--邮件相关
		szSender = "元宵花灯";--发送方
		szTitle = "标题";
		szContent = "正文";
	};
}


if not SERVERVERSION then return end;--以下为服务器脚本

function LanternConfig:IsInDay(dwDay)
	return self.Time.Day[dwDay]
end

function LanternConfig:Init()
	local StartNotice = HDScript:Split(self.Time.StartNotice,":")
	local Start = HDScript:Split(self.Time.Start,":")
	local EndNotice = HDScript:Split(self.Time.EndNotice,":")
	local End = HDScript:Split(self.Time.End,":")
	
	self.Time.StartNotice = {
		dwHour = tonumber(StartNotice[1]);
		dwMin = tonumber(StartNotice[2]);
	}
	
	self.Time.Start = {
		dwHour = tonumber(Start[1]);
		dwMin = tonumber(Start[2]);
	}
	
	self.Time.EndNotice = {
		dwHour = tonumber(EndNotice[1]);
		dwMin = tonumber(EndNotice[2]);
	}
	
	self.Time.End = {
		dwHour = tonumber(End[1]);
		dwMin = tonumber(End[2]);
	}
	
	local Day = {}
	
	for k,v in pairs(self.Time.Day) do
		Day[v] = true
	end
	
	self.Time.Day = Day;
	
	self.Npc = {};
end

LanternConfig:Init()

function LanternConfig:DoPerOneMin(mgrScript,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin)

	if not (dwYear==2014) then return end;
	if not (dwMonth==2) then return end;
	if not self:IsInDay(dwDay) then return end;
	
	--开始公告
	if not self.bStartNotice then
		self:CheckStartNotice(dwHour,dwMin)
	end
	
	--开始
	if not self.bStart then
		self:CheckStart(dwHour,dwMin)
	end
	
	--结束公告
	if self.bStart and (not self.bEndNotice) then
		self:CheckEndNotice(dwHour,dwMin)
	end
	
	
	--结束
	if self.bStart and (not self.bEnd) then
		self:CheckEnd(dwHour,dwMin)
	end
	
end

--开始公告检查
function LanternConfig:CheckStartNotice(dwHour,dwMin)
	local StartNotice = self.Time.StartNotice
	local Start = self.Time.Start
	
	local dwNow = dwHour*100 + dwMin
	local dwStartNotice = StartNotice.dwHour*100 + StartNotice.dwMin
	local dwStart = Start.dwHour*100 + Start.dwMin
	
	if dwNow >= dwStartNotice and dwNow < dwStart then
		self.bStartNotice = true;
		CScriptManager:Notice(self.szPreStartNotice,0,true)
	end
end

--开始检查
function LanternConfig:CheckStart(dwHour,dwMin)
	local Start = self.Time.Start
	local End = self.Time.End
	
	local dwNow = dwHour*100 + dwMin
	local dwStart = Start.dwHour*100 + Start.dwMin
	local dwEnd = End.dwHour*100 + End.dwMin
	
	if dwNow >= dwStart and dwNow < dwEnd then
		self.bStart = true;
		self:Start()
	end
	
	
	

end
--结束公告检查
function LanternConfig:CheckEndNotice(dwHour,dwMin)
	local EndNotice = self.Time.EndNotice
	local End = self.Time.End

	local dwNow = dwHour*100 + dwMin
	local dwEndNotice = EndNotice.dwHour*100 + EndNotice.dwMin
	local dwEnd = End.dwHour*100 + End.dwMin
	
	if dwNow >= dwEndNotice and dwNow<dwEnd then
		self.bEndNotice = true
		CScriptManager:Notice(self.szPreEndNotice,0,true)
	end
end
--结束检查
function LanternConfig:CheckEnd(dwHour,dwMin)
	local End = self.Time.End

	local dwNow = dwHour*100 + dwMin
	local dwEnd = End.dwHour*100 + End.dwMin
	
	if dwNow>=dwEnd then
		self.bEnd = true
		self:End()
	end
end

--活动开始
function LanternConfig:Start()
	CScriptManager:Notice(self.szStartNotice,0,true)

	
	
	for k,v in pairs(self.Pos) do
		local dwIndex = math.random(1,#self.NpcID)
		local dwNpcId = self.NpcID[dwIndex]
		local dwMapID = v[1]
		local fPosX = v[2] or 0
		local fPosY = v[3] or 0
		local fDir = v[4] or 0
		local mgrNpc = self:GetNpcMgr(dwMapID)
		if mgrNpc then
			local dwObjID = mgrNpc:Add(dwNpcId,fPosX,fPosY,fDir)
			self:AddNpc({dwMapID,dwObjID})
		end
	end
end

--活动结束
function LanternConfig:End()
	CScriptManager:Notice(self.szEndNotice,0,true)

	for k,v in pairs(self.Npc) do
		local mgrNpc = self:GetNpcMgr(v[1])
		mgrNpc:Remove(v[2])
	end
	
end

--记录活动刷出的npc
function LanternConfig:AddNpc(dwObjID)
	table.insert(self.Npc,dwObjID)
end


--------------------------------------------------------------
--内部方法

--获得某张地图的npc管理器
function LanternConfig:GetNpcMgr(dwMapID)
	local Map = CMapManager:GetMap(dwMapID )
	if not Map then return end;
	return Map.objNpcMgr
end















