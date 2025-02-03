
--生成消息队列
function _G.pairsByKeys(t,f)
	local a = {};
	local i = 1;
	for k,_ in pairs(t) do a[i] =k; i = i+1; end;
	table.sort(a,f);
	i = 0;
	local iter = function()
		i = i +1;
		if a[i] == nil then 
			return a[i], nil;
		else 
			local key = a[i];
			return key,t[key];
		end;
	end;
	return iter;
end;

_G.setAllMsgList = {};
function _G.initMsgList() 
	for func,v in pairsByKeys(_G) do 
		if type(func) == 'string' and type(v) == 'function' and func:byte(1) >= 65 and func:byte(1) <= 91 and string.find(func,"Msg") then
			local argTable = _defvalues(_G[func],nil,true); 
			local newArgTable;
			if argTable then
				newArgTable = {};
				for i,v in pairsByKeys(argTable) do
					table.insert(newArgTable,i);
				end;
			end;
			table.insert(_G.setAllMsgList,{func,newArgTable});	
		end;	
	end; 
	if _G.PrintMsgToFile then  
		local file = io.open("../Config/" .. _G.PrintMsgToFile .. ".lua", "w");
		if file then
			file:write("_G." .. _G.PrintMsgToFile .. " =\n");
			file:write("{\n");
			local str;
			for k, v in ipairs(_G.setAllMsgList) do
				str = string.format("\t%s = {\n", v[1]); 
				file:write(str);
					-------------
					str = string.format("\t\t[1] = %d;\n", k);
					file:write(str);
					----
					if v[2] then
						str = "\t\t[2] = {\n"
						file:write(str);
						--
						for index, name in ipairs(v[2]) do
							str = string.format('\t\t\t[%d] = "%s";\n', index, name);
							file:write(str);
						end;
						--
						str = "\t\t};\n";
						file:write(str);
					end;
					--------------
				str = "\t};\n";
				file:write(str);
			end;
			file:write("};\n");
			file:close();
		end;
	end;
    
    dofile '../Config/MsgList_Client.lua'
    _setmsglst(MsgList_Client, MsgProto.MSG_CLIENT);
    dofile '../Config/MsgList_LoginServer.lua'
    _setmsglst(MsgList_LoginServer, MsgProto.MSG_LSERVER);
    dofile '../Config/MsgList_KernelServer.lua'
    _setmsglst(MsgList_KernelServer, MsgProto.MSG_KSERVER);
    dofile '../Config/MsgList_GameServer.lua'
    _setmsglst(MsgList_GameServer, MsgProto.MSG_GSERVER);
    dofile '../Config/MsgList_Robot.lua' 
    _setmsglst(MsgList_Robot, MsgProto.MSG_ROBOT);
    
    _setmsglst(_G.setAllMsgList,0,#setAllMsgList);
end;


