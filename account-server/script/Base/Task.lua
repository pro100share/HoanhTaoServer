local base = _G;
_G.Task = {};

Task.setType = {
	Interval		= 1;
};

function Task:RegistJob(dwType, strExecutor, ...)
	_RegistJob(dwType, strExecutor, unpack({...}));
end

function Task:UnRegistJob(dwType)
    _UnRegistJob(dwType);
end