--[[
功能：敏感词系统
类型：判断敏感词，或者替换敏感词的功能
作者：周兴团
时间：2012-10-31
--]]

_G.CSensitiveWordSystem = {};

local SensitiveWords = _G.SensitiveCharacters;

--创建线程资源
function CSensitiveWordSystem:Create()
	
end
--协程的处理函数
function CSensitiveWordSystem:HandleFunction()
	
end
--------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
--注意，最后一个参数传递进来的是屏蔽字的数组，默认是使用敏感词表；如有需要，自己传进来新的表即可查询
--寻找一个字符串里面是否有敏感词，有就直接返回true，否则返回false；同时返回的还有第一个碰到的敏感词
function CSensitiveWordSystem:Check( strText, wordTable )
	wordTable = wordTable or SensitiveWords;
	local s,e;
	for k,word in ipairs( wordTable ) do
		s,e = string.find(strText, word);
		if s then
			return true, word;
		end
	end
	return false, "";
end
--检查寻找一个字符串里面的敏感词数量，返回敏感词的数量
function CSensitiveWordSystem:Count( strText, wordTable )
	wordTable = wordTable or SensitiveWords;
	local dwCount = 0;
	for k,word in ipairs( wordTable ) do
		for w in string.gfind(strText, word) do
			dwCount = dwCount + 1;
			--print("Find Word: ", w)
		end
	end
	return dwCount;
end
--查找一个字符串中的所有敏感词，返回敏感词列表，没有则返回空表；重复的词汇不会返回
function CSensitiveWordSystem:Find( strText, wordTable )
	wordTable = wordTable or SensitiveWords;
	local tab = {};
	local s,e;
	for k,word in ipairs( wordTable ) do
		if not string.find(" ",word) then
			s,e = string.find(strText, word);
			if s then
				table.insert( tab, word );
			end
		end
	end
	return tab;
end
--替换字符串中的所有敏感词，返回替换后的字符串和字符串中包含的敏感词数量
function CSensitiveWordSystem:Replace( strText, replace, wordTable )
	wordTable = wordTable or SensitiveWords;
	replace = replace or "*";
	local dwCount = 0;
	local dwNum = 0;
	--local dwNow = os.now();
	for k,word in ipairs(wordTable) do
		strText,dwNum = string.gsub(strText, word, replace);
		if dwNum ~= 0 then
			dwCount = dwCount + dwNum;
		end
	end
	--local dwNow2 = os.now();
	return strText, dwCount;
end
--连接字符串，参数：字符串数组，分隔符
function CSensitiveWordSystem:Concat(setStr, mark)
	mark = mark or ",";
	local str = setStr[1] or "";
	for i=2,#setStr do
		str = str .. mark .. tostring(setStr[i]);
	end
	return str;
end
--拆分字符串，返回字符串的数组，参数：字符串，分隔符
function CSensitiveWordSystem:Split(str, mark)
	mark = mark or ",";
	local setStr = {};
	local marklen = string.len(mark);
	local slength = string.len(str);
	local index = 0
	local start = 1
	while true do
	    index = string.find(str, mark, start)   -- find 'next' 返回 i 和 j 
	    if index == nil then break end
		local s = string.sub(str, start, index-1)
	    table.insert(setStr, s)
		start = index + marklen;
	end
	if start <= slength then
		local s = string.sub(str, start, slength)
	    table.insert(setStr, s)
	end
	return setStr;
end








