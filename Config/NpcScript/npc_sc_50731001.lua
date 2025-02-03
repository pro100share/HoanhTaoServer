--保存函数表
local npc_fun = {}
--npcid		天罡北斗npc
local npc_id = 50731001
----------------------------------------------
-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)	
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local Map = sysMap:GetCurMap();
	--local Dupl = Map:GetDuplObj()
	--if not Dupl then return end;
	--Dupl:SetDuplDefState(false);
	if not objNpc.ZKNTemp then					-----判断NPC身上是否有状态
		local sysMap = objPlayer:GetSystem("CMapSystem")	----地图系统
		--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
		local dwLevelt = sysScript:GetDuplLevel() ---获得创建副本的等
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
		local fnFunction = function(sysScript)
			sysScript:Notice(9000660611,7)
			
		end
		CScriptManager:DoFunction(objNpc,fnFunction)
		
		--sysScript:TeamNotice(183)	----下一波金军将在15秒之后出现，请做好万全准备！
		local D1 = function()
			
			
			mgrMonster:Add(50730004,50730001,50730001,-1,100410173,-24.91,-3.88,dwDelay)
		    mgrMonster:Add(50730004,50730001,50730001,-1,100410173,-26.76,-5.02,dwDelay)
		    mgrMonster:Add(50730004,50730001,50730001,-1,100410173,-28.89,-4.32,dwDelay)
		    mgrMonster:Add(50730004,50730001,50730001,-1,100410173,-30.89,-3.29,dwDelay)
		    mgrMonster:Add(50730004,50730001,50730001,-1,100410173,-27.22,-7.58,dwDelay)
		    mgrMonster:Add(50730004,50730001,50730001,-1,100410173,-28.84,-8.83,dwDelay)
		    mgrMonster:Add(50730004,50730001,50730001,-1,100410173,-31.29,-9.07,dwDelay)
		    
			
			
			mgrMonster:Add(50730002,50730001,50730001,-1,100410173,-7.5,-4.00,dwDelay)
		    mgrMonster:Add(50730002,50730001,50730001,-1,100410173,-6.73,-5.85,dwDelay)
		    mgrMonster:Add(50730002,50730001,50730001,-1,100410173,-4.80,-5.94,dwDelay)
		    mgrMonster:Add(50730002,50730001,50730001,-1,100410173,-4.26,-4.14,dwDelay)
		    mgrMonster:Add(50730002,50730001,50730001,-1,100410173,-2.53,-3.50,dwDelay)
		    mgrMonster:Add(50730002,50730001,50730001,-1,100410173,-0.65,-4.19,dwDelay)
		    mgrMonster:Add(50730002,50730001,50730001,-1,100410173,0.26,-6.29,dwDelay)
		    
			
			
			mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-17.03,-11.95,dwDelay)
		    mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-18.67,-13.02,dwDelay)
		    mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-16.39,-14.91,dwDelay)
	 	    mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-13.94,-14.50,dwDelay)
		    mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-12.05,-16.35,dwDelay)
		    mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-16.27,-17.40,dwDelay)
		    mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-17.65,-19.62,dwDelay)
			mgrMonster:Add(50730003,50730001,50730001,-1,100410173,-22.81,-16.74,dwDelay)
		    
			mgrMonster:Add(50730001,50730001,50730001,-1,100410173,-14.27,3.16,dwDelay)
		    mgrMonster:Add(50730001,50730001,50730001,-1,100410173,-12.12,4.73,dwDelay)
		    mgrMonster:Add(50730001,50730001,50730001,-1,100410173,-16.12,5.29,dwDelay)
		    mgrMonster:Add(50730001,50730001,50730001,-1,100410173,-15.63,8.20,dwDelay)
		    mgrMonster:Add(50730001,50730001,50730001,-1,100410173,-18.98,8.13,dwDelay)
		    mgrMonster:Add(50730001,50730001,50730001,-1,100410173,-17.09,9.83,dwDelay)
		    mgrMonster:Add(50730001,50730001,50730001,-1,100410173,-15.05,10.98,dwDelay)
		
		end
		
		local D2 = function()
		 
		    local Dupl = Map:GetDuplObj()
	        if not Dupl then return end;
	        Dupl:SetDuplDefState(false);
			       
				
				
		end
		
		local D3 = function()
		    sysScript:Notice(9000660601,7)
			local fnFunction = function(sysScript)
			sysScript:PlayPfx(5073001,-14.27,3.16,60000,bAll)
			sysScript:PlayPfx(5073001,-12.12,4.73,60000,bAll)
			sysScript:PlayPfx(5073001,-16.12,5.29,60000,bAll)
			sysScript:PlayPfx(5073001,-15.63,8.20,60000,bAll)
			sysScript:PlayPfx(5073001,-18.98,8.13,60000,bAll)
			sysScript:PlayPfx(5073001,-17.09,9.83,60000,bAll)
			sysScript:PlayPfx(5073001,-15.05,10.98,60000,bAll)
			sysScript:AddBuff(50500010)
			local JiFen = Map:GetIntegral(objPlayer)
		
			local D31 = function()
			    
			    local JiFen = Map:GetIntegral(objPlayer) - JiFen   
				if (JiFen  > 9) then
				    sysScript:Notice(9000660605,7)
					mgrMonster:Add(50732001,(3000+dwLevelt),50502006,50502006,12810,-15.80,-4.22,dwDelay)
					--mgrMonster:Add(50732004,(3000+dwLevelt+10),50502009,50502009,100620041,-15.80,-4.22,dwDelay)
				elseif (JiFen  < 10) then 
				
				    sysScript:Notice(9000660608,7)
		        end
				
			end
			Map:AddTimeEvent( 60000,D31)

		    end
			CScriptManager:DoFunction(objNpc,fnFunction)
		  
		    
		end
		
		local D4 = function()
		    sysScript:Notice(9000660600,7)
			local fnFunction = function(sysScript)
			sysScript:PlayPfx(5073001,-7.5,-4.00,60000,bAll)
			sysScript:PlayPfx(5073001,-6.73,-5.85,60000,bAll)
			sysScript:PlayPfx(5073001,-4.80,-5.94,60000,bAll)
			sysScript:PlayPfx(5073001,-4.26,-4.14,60000,bAll)
			sysScript:PlayPfx(5073001,-2.53,-3.50,60000,bAll)
			sysScript:PlayPfx(5073001,-0.65,-4.19,60000,bAll)
			sysScript:PlayPfx(5073001,0.26,-6.29,60000,bAll)
			sysScript:AddBuff(50500011)
			local JiFen = Map:GetIntegral(objPlayer)
			local D41 = function()
			    
			    local JiFen = Map:GetIntegral(objPlayer) - JiFen   
				if (JiFen  > 9) then
				    sysScript:Notice(9000660605,7)
					mgrMonster:Add(50732002,(3000+dwLevelt+2),50502007,50502007,12710,-15.80,-4.22,dwDelay)
				   	--mgrMonster:Add(50732004,(3000+dwLevelt+10),50502009,50502009,100620041,-15.80,-4.22,dwDelay)	
				elseif (JiFen  < 10) then 
				
				    sysScript:Notice(9000660608,7)
		        end
				
			end
			Map:AddTimeEvent( 60000,D41)
			
		    end
			CScriptManager:DoFunction(objNpc,fnFunction)
		 
		    
		end
		
		local D5 = function()
		    sysScript:Notice(9000660602,7)
			local fnFunction = function(sysScript)
			sysScript:PlayPfx(5073001,-17.03,-11.95,60000,bAll)
			sysScript:PlayPfx(5073001,-18.67,-13.02,60000,bAll)
			sysScript:PlayPfx(5073001,-16.39,-14.91,60000,bAll)
			sysScript:PlayPfx(5073001,-13.94,-14.50,60000,bAll)
			sysScript:PlayPfx(5073001,-12.05,-16.35,60000,bAll)
			sysScript:PlayPfx(5073001,-16.27,-17.40,60000,bAll)
			sysScript:PlayPfx(5073001,-17.65,-19.62,60000,bAll)
			sysScript:PlayPfx(5073001,-22.81,-16.74,60000,bAll)
			sysScript:AddBuff(50500012)	
			local JiFen = Map:GetIntegral(objPlayer)
			local D51 = function()
			    
			    local JiFen = Map:GetIntegral(objPlayer) - JiFen   
		      
				if (JiFen  > 9) then
				    sysScript:Notice(9000660606,7)
					mgrMonster:Add(50732003,(3000+dwLevelt+4),50502008,50502008,12910,-15.80,-4.22,dwDelay)
					
				elseif (JiFen  < 10) then 
				
				    sysScript:Notice(9000660608,7)
		        end
				
			end
			Map:AddTimeEvent( 60000,D51)

			
		    end
			CScriptManager:DoFunction(objNpc,fnFunction)
		
		    
		end
		
		local D6 = function()
		    sysScript:Notice(9000660603,7)
		    local fnFunction = function(sysScript)
			sysScript:PlayPfx(5073001,-24.91,-3.88,60000,bAll)
			sysScript:PlayPfx(5073001,-26.76,-5.02,60000,bAll)
			sysScript:PlayPfx(5073001,-28.89,-4.32,60000,bAll)
			sysScript:PlayPfx(5073001,-30.89,-3.29,60000,bAll)
			sysScript:PlayPfx(5073001,-27.22,-7.58,60000,bAll)
			sysScript:PlayPfx(5073001,-28.84,-8.83,60000,bAll)
			sysScript:PlayPfx(5073001,-31.29,-9.07,60000,bAll)
			sysScript:AddBuff(50500013)	
			local JiFen = Map:GetIntegral(objPlayer)
			local D61 = function()
			    
			    local JiFen = Map:GetIntegral(objPlayer) - JiFen   
		        
				if (JiFen  > 9) then
				    sysScript:Notice(9000660607,7)
					mgrMonster:Add(50732004,(3000+dwLevelt+6),50502009,50502009,12610,-15.80,-4.22,dwDelay)
					
				elseif (JiFen  < 10) then 
				
				    sysScript:Notice(9000660608,7)
					local D611 = function()
				        sysScript:Notice(9000660610,7)
						
						local D6111 = function()
						    local Dupl = Map:GetDuplObj()
	                        if not Dupl then return end;
	                        Dupl:SetDuplDefState(false);
					    end
						Map:AddTimeEvent( 60000,D6111)
				    end
				    Map:AddTimeEvent( 10000,D611)
		        end
				
			end
			Map:AddTimeEvent( 60000,D61)

			
		    end
			CScriptManager:DoFunction(objNpc,fnFunction)
		
		    
		end
		
		
		
		
		
		-------延迟脚本
		Map:AddTimeEvent( 6000,D1)
		Map:AddTimeEvent( 1506000,D2)
		Map:AddTimeEvent( 66000,D3)
		Map:AddTimeEvent( 306000,D4)
		Map:AddTimeEvent( 546000,D5)
		Map:AddTimeEvent( 786000,D6)
		
		
	
		
		objNpc.ZKNTemp = objNpc.ZKNTemp or true
		
	else
		sysScript:Notice(9000660372)
	end
end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------



		
		
