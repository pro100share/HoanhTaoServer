_G.UrlManager = {}
UrlManager.Config = {}
local JsonData = ""
local base = _G
-------------------------------------------------------------------
local szCMDUrl = [[select * from "T_Url"]];
local szCMDItem = [[select * from "T_Item"]];
-------------------------------------------------------------------
--[[ Url
	1:GM			�ͷ�
	2:Bug			�ύBUG
	3:Sug			�ռ�����
	4:Addicted		������
	5:Phone			�ֻ���֤
	6:LunTan		��̳
	7:Mini			΢������
	8:Charge		��ֵ����
--]]
function UrlManager:Init()
	print("UrlManager Init Start");
	base.Log:Info("UrlManager Init Start");
	
	local ShareDB = base.GetShareDB()
	local UrlInfo = ShareDB:Exec(szCMDUrl) or {}
	local ItemInfo = ShareDB:Exec(szCMDItem) or {}
	
	self.Config.Url = {}
	self.Config.Item = {}
	
	for k,v in pairs(UrlInfo) do
		self.Config.Url[tonumber(v.dwIndex)] = v.szUrl
	end
	
	for k,v in pairs(ItemInfo) do
		self.Config.Item[tonumber(v.dwIndex)] = v.dwItem
	end
	
	JsonData = json.encode(self.Config)
	base.Log:Info(JsonData);
	
	base.Log:Info("UrlManager Init End");
end

function UrlManager:Dispose(dwMType, dwID, strData)
	base.Log:Info("UrlManager:Dispose(dwMType, dwID, strData)", dwMType, dwID, JsonData);
	return Net:SendToGS(dwID, dwMType, JsonData)
end