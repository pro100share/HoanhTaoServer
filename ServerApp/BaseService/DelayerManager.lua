_G.eDelay =  {
	_100ms	= 1,
	_1sec	= 2,
	_10sec	= 3,
	_1min	= 4,
	_10min	= 5,
}

local _delay = {
	[eDelay._100ms]	= 100,
	[eDelay._1sec]	= 1000,
	[eDelay._10sec]	= 10000,
	[eDelay._1min]	= 60000,
	[eDelay._10min]	= 600000,
};

local _time = 0;
local _heads = {};
local _tails = {};

_G.CDelayerManager = {}
function CDelayerManager:Update(elapse)
	local node,update;
	_time = _time + elapse;
	for enum = 1,5 do
		update = _time + _delay[enum];
		while(_heads[enum]) do
			node = _heads[enum];
			if node[2] > _time then break; end
			_heads[enum] = node[1];
			node[3](update - node[2]);
		end
	end
end
function CDelayerManager:Delay(enum,func)
	if not enum then return; end
	local update = _time + _delay[enum];
	local node = { nil,update,func };
	if not _heads[enum] then _heads[enum] = node; end
	if _tails[enum] then _tails[enum][1] = node; end
	_tails[enum] = node;
end
