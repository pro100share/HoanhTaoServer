if(_G.locale==nil) then
	_G.locale={
		lang={},
		image={},
	};
end

_G.MergeTable=function(tableA,tableB)
	for k,v in pairs(tableB) do
		tableA[k]=v;
	end
end

_G.AddLocaleLang=function (langTable)
	MergeTable(_G.locale.lang,langTable)
end

_G.AddLocaleImage=function (imageTable)
	MergeTable(_G.locale.image,imageTable);
end

