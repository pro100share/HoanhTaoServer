﻿--[[	剧情系统 单体管理器(服务器)	周长沙	2012-4-12--]]_G.CStoryManager = CSingle:new();--插入单体管理器CStoryManager:AddSingle(CStoryManager);--------------------------------------------初始化function CStoryManager:Create()	self.Storys = {}	return trueend--更新function CStoryManager:Update()	return true	end--销毁function CStoryManager:Destroy()	return trueend------------------------------------------