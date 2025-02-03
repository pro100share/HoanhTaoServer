--空白的主机文件
--担心CWarHost被其他调用到，所以做了一个空的CWarHost

_G.CWarHost = {};

function CWarHost:CreateWar()
	-- print("Enter Empty WarHost")
end;

function CWarHost:BeginDeleteWar()
	-- print("Enter Empty WarHost")
end;

function CWarHost:TryEnterWarLocal()

end;

function CWarHost:TryEnterWarChange()

end;

function CWarHost:TryLevelWa()

end;

function CWarHost:CheckBuffForbid()
	return true;
end;

