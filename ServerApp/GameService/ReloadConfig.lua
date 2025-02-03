--重新加载配置
--lw

_G.CReloadManager = CSingle:new();

CSingleManager:AddSingle(CReloadManager);

function CReloadManager:Create()
	for n,info in pairs(ReloadTimeMark)do
		CAlarmClock:AddTask(info.ReTime, info.ReType, info.ReLength, 0, 
			function() self:ReloadFile(info.dwIndex) end,{});
	end
end;

function CReloadManager:ReloadFile(dwIndex)
	local tbFile = ReloadConfig[dwIndex];
	if not tbFile then
		return;
	end
	
	for n,szPath in pairs(tbFile)do
		dofile(szPath);
	end
end;

