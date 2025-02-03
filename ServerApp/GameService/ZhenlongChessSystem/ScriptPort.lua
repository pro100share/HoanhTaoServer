----------------------------------------------------�ű���Ҫ�Ľӿ�-----------------------------------------------------
--���boss�Ǽ�
function CZhenlongChessSystem:GetBossStarLevel(dwBossId)
	if self.setBossCount[dwBossId] then
		return self.setBossCount[dwBossId].starLevel;
	end
	
	return 0;
end

--����boss�Ǽ�
function CZhenlongChessSystem:SetBossStarLevel(dwBossId, dwLevel)
	if self.setBossCount[dwBossId] then
		if dwLevel > self.setBossCount[dwBossId].starLevel then
			self.setBossCount[dwBossId].starLevel = dwLevel;
			self:SynChallengeCount(dwBossId);
			self:UpdateDB();
			
			--�����Ǽ�����
			local tPlayerInfo = CZhenlongChessChartManager:GetStarPlayInfo();
			if not tPlayerInfo then
				_err("CZhenlongChessSystem:SetBossStarLevel tPlayerInfo error");
			end
			if self:GetTotalStarLevel() > tPlayerInfo.nStarLevel then
				local oPlayer = self:GetPlayer();
				CKernelApp.OnZhenlongStarChgMsg
				{
					PlayerInfo = {
						nRoleId = oPlayer:GetRoleID(), nStarLevel = 
						self:GetTotalStarLevel(), sRoleName = oPlayer:GetName(),
						nIconId = oPlayer.sRoleInfo.dwIncoID, nWave = 1
						}
				};
			end			
		end
	else
		_err("CZhenlongChessSystem:SetBossStarLevel cant find boss");
	end
end

--���ý���
function CZhenlongChessSystem:SetProcess(dwProcess)
	if dwProcess - self.curProcess == 1 then
		self.curProcess = dwProcess;
		
		local oPlayer = self:GetPlayer();
		if not oPlayer then
			_err("CZhenlongChessSystem Create Cannot get player");
			return false;
		end;
		
		oPlayer.ZhenlongChessSyncProcessMsg{curProcess = self.curProcess};
		self:UpdateDB();
	end
	-- print("CZhenlongChessSystem:SetProcess===", dwProcess)
end

--�õ������������Ϣ (ս����, ��Ѫ)
function CZhenlongChessSystem:GetZhenlongInfo()
	return self.dwDamageHP, self.dwFightScore;
end

--�õ����Ǽ�
function CZhenlongChessSystem:GetTotalStarLevel()
	local retLevel = 0;
	for k, v in pairs(self.setBossCount) do
		retLevel = retLevel + v.starLevel;
	end
	return retLevel;
end

--֪ͨ�ͻ��˴򿪽���
function CZhenlongChessSystem:ClientOpenUI()
	local oPlayer = self:GetPlayer();
	if not oPlayer then
		_err("Cannot get player CZhenlongChessSystem:ClientOpenUI");
		return;
	end;
	
	oPlayer.ZhenlongChessOpenUIMsg{};
end

--������սboss�Ĵ���
function CZhenlongChessSystem:RecordCount(nBossId)
	if not self.setBossCount[nBossId] then
		_err("CZhenlongChessSystem:RecordCount error!!")
		return;
	end
		
	if self.setBossCount[nBossId].bIsCostGold then
		self.setBossCount[nBossId].curGoldCount = self.setBossCount[nBossId].curGoldCount + 1;
	else
		self.setBossCount[nBossId].curCount = self.setBossCount[nBossId].curCount + 1;
		--self.curTotalCount = self.curTotalCount + 1;
	end
	
	--�������ݿ�
	self:UpdateDB();
	
	--ͬ��������Ϣ
	self:SynChallengeCount(nBossId);
	
	--ͬ���ܴ���
	--self:GetPlayer().ZhenlongChessSyncTotalCountMsg{curTotalCount = self.curTotalCount};
end
