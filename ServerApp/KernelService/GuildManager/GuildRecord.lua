_G.CGuildRecord = CSingle:new();
CSingleManager:AddSingle(CGuildRecord);
--------------------------------------------------------------
function CGuildRecord:Create()
	self.dwRecordID = 0
	self.tabRecordList = {}
end
function CGuildRecord:Update(dwInterval)
	return true;
end;
function CGuildRecord:Destroy()
end;
--------------------------------------------------------------
function CGuildRecord:Insert(fnConfirm,fnCancel)
	self.dwRecordID = self.dwRecordID + 1
	local tabRecord = {}
	tabRecord.fnConfirm = fnConfirm
	tabRecord.fnCancel = fnCancel
	self.tabRecordList[self.dwRecordID] = tabRecord
	return self.dwRecordID
end
function CGuildRecord:Confirm(dwRecordID)
	local tabRecord = self.tabRecordList[dwRecordID]
	if not tabRecord then return end
	tabRecord.fnConfirm()
	self.tabRecordList[dwRecordID] = nil
end
function CGuildRecord:Cancel(dwRecordID)
	local tabRecord = self.tabRecordList[dwRecordID]
	if not tabRecord then return end
	tabRecord.fnCancel()
	self.tabRecordList[dwRecordID] = nil
end
