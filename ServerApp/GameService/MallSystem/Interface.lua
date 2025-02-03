function CMallManager:IsGoldItem(dwItemEnum)
	if MallOtherConfig[dwItemEnum] then
		return true
	else
		return false
	end
end
