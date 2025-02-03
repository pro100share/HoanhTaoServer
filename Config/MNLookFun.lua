--怪物外形额外脚本
_G.MNLookFun = {}
--获得开始位置
function MNLookFun:GetStartPos(dwHeight)
	return _Vector3.new(0,0,dwHeight)
end

--获得受击光效点
function MNLookFun:GetHurtPfxPos(dwHeight)

	return _Vector3.new(0,0,-0.2)
end

--获得受击光效缩放
function MNLookFun:GetHurtPfxScal(dwHeight)


	return _Vector3.new(1,1,1)
end

--怪物称号相关数值
function MNLookFun:GetTitileSet(dwHeight)
	local pos = _Vector3.new( 0,0,dwHeight + 0.3)
	local fWidth = fWidth or 0.8
	local fHight = fHight or 0.208
	return pos,fWidth,fHight
end