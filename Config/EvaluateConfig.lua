
_G.EvaluateConfig = {
	dwFlowerEnum	= 5500110,
	dwEggEnum		= 5500100,
	dwMaxEvaluate	= 15,
}

EvaluateConfig.AddExp = function(dwLevel)
		local nExp 	= dwLevel * (dwLevel*(5+dwLevel/20))*0.1
		return math.floor(nExp);
end
