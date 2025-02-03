-- 脚本获取时装 物品脚本调用
function CFashionDressSystem:GetDress(nDressId, nType)
   self:Buy(nDressId, nType); 
end

-- 判断是否已经拥有该时装
function CFashionDressSystem:IsAlreadyHave(nDressId)
    return self.setFashionDress[nDressId]; 
end
