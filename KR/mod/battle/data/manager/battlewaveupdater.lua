ys = ys or {}
slot1 = ys.Battle.BattleConst.WaveTriggerType
slot2 = class("BattleWaveUpdater")
ys.Battle.BattleWaveUpdater = slot2
slot2.__name = "BattleWaveUpdater"
slot2.PREWAVES_CONDITION_AND = 0
slot2.PREWAVES_CONDITION_OR = 1

slot2.Ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._spawnFunc = slot1
	slot0._airFighterFunc = slot2
	slot0._clearFunc = slot3
	slot0._spawnAreaFunc = slot4

	slot0:Init()
end

slot2.Init = function (slot0)
	slot0._monsterList = {}
	slot0._spawnList = {}
	slot0._airFighter = {}
	slot0._waveInfos = {}
	slot0._timerList = {}
	slot0._waveUnitAliveList = {}
	slot0._keyList = {}
	slot0._waveInfoList = {}
end

slot2.SetWavesData = function (slot0, slot1)
	slot0._waveTmpData = slot1

	for slot5, slot6 in ipairs(slot1.waves) do
		slot8 = nil

		if slot6.triggerType == slot0.NORMAL then
			slot1.Battle.BattleSpawnWave.New():SetCallback(slot0._spawnFunc, slot0._airFighterFunc)
		elseif slot7 == slot0.TIMER then
			slot8 = slot1.Battle.BattleDelayWave.New()
		elseif slot7 == slot0.RANGE then
			slot1.Battle.BattleRangeWave.New():SetCallback(slot0._spawnAreaFunc)
		elseif slot7 == slot0.STORY then
			slot8 = slot1.Battle.BattleStoryWave.New()
		elseif slot7 == slot0.AID then
			slot8 = slot1.Battle.BattleAidWave.New()
		elseif slot7 == slot0.BGM then
			slot8 = slot1.Battle.BattleSwitchBGMWave.New()
		elseif slot7 == slot0.GUIDE then
			slot8 = slot1.Battle.BattleGuideWave.New()
		elseif slot7 == slot0.CAMERA then
			slot8 = slot1.Battle.BattleCameraWave.New()
		elseif slot7 == slot0.CLEAR then
			slot8 = slot1.Battle.BattleClearWave.New()
		elseif slot7 == slot0.JAMMING then
			slot8 = slot1.Battle.BattleJammingWave.New()
		end

		slot8:SetWaveData(slot6)
		slot8:RegisterEventListener(slot0, slot1.Battle.BattleEvent.WAVE_FINISH, slot0.onWaveFinish)

		slot0._waveInfoList[slot8:GetIndex()] = slot8

		if slot8:IsKeyWave() then
			slot0._keyList[#slot0._keyList + 1] = slot8
		end
	end

	for slot5, slot6 in pairs(slot0._waveInfoList) do
		for slot10, slot11 in ipairs(slot6:GetPreWaveIDs()) do
			if slot0._waveInfoList[slot11] then
				slot6:AppendPreWave(slot12)
				slot12:AppendPostWave(slot6)
			end
		end

		for slot10, slot11 in pairs(slot6:GetBranchWaveIDs()) do
			if slot0._waveInfoList[slot10] then
				slot6:AppendBranchWave(slot12)
			end
		end
	end
end

slot2.Start = function (slot0)
	slot0._active = true

	for slot4, slot5 in pairs(slot0._waveInfoList) do
		if slot5:IsReady() then
			slot5:DoBranch()
		end
	end
end

slot2.AddMonster = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._waveInfoList) do
		slot6:AddMonster(slot1)
	end
end

slot2.RemoveMonster = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._waveInfoList) do
		slot6:RemoveMonster(slot1)
	end
end

slot2.onWaveFinish = function (slot0, slot1)
	if not slot0._active then
		return
	end

	if slot0:CheckAllKeyWave() then
		slot0._active = false

		slot0._clearFunc()
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot8:IsReady() and slot8:GetState() == slot8.STATE_DEACTIVE then
			slot8:DoBranch()
		end
	end
end

slot2.CheckAllKeyWave = function (slot0)
	for slot4, slot5 in ipairs(slot0._keyList) do
		if not slot5:IsFinish() then
			return false
		end
	end

	return true
end

slot2.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0._timerList) do
		slot0:RemoveTimer(slot4)
	end

	for slot4, slot5 in pairs(slot0._waveInfoList) do
		slot5:UnregisterEventListener(slot0, slot0.Battle.BattleEvent.WAVE_FINISH)
		slot5:Dispose()
	end

	slot0._waveInfoList = nil
	slot0._keyList = nil

	slot0:Init()
	slot0.EventListener.DetachEventListener(slot0)
end

slot2.GetUnfinishedWaveCount = function (slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0._waveInfoList) do
		if not slot6:IsFinish() then
			slot1 = slot1 + 1
		end
	end

	return slot1
end

return
