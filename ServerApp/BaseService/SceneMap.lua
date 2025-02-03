_G.CSceneMap = {};
CSceneMap.setAllPlayer = {};
function CSceneMap:new(obj)
   obj = obj or {};
   --setmetatable(obj,{__index = CSceneMap});
   obj.setAllPlayer = {};
   
   obj.AddPlayer = CSceneMap.AddPlayer;
   obj.DelPlayer = CSceneMap.DelPlayer;
   obj.GetAllPlayer = CSceneMap.GetAllPlayer;
   return obj;
end;

function CSceneMap:AddPlayer(objPlayer)
   self.setAllPlayer[objPlayer:GetID()] = objPlayer; 
end;

function CSceneMap:DelPlayer(objPlayer)
    self.setAllPlayer[objPlayer:GetID()] = nil;
end;

function CSceneMap:GetAllPlayer()
   return self.setAllPlayer();
end;