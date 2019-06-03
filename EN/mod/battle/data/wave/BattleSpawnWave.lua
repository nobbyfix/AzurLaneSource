ys = ys or {}
ys.Battle.BattleSpawnWave = class("BattleSpawnWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleSpawnWave.__name = "BattleSpawnWave"

function ys.Battle.BattleSpawnWave.Ctor(slot0)
	uv0.super.Ctor(slot0)

	slot0._spawnUnitList = {}
	slot0._monsterList = {}
	slot0._reinforceKillCount = 0
	slot0._reinforceTotalKillCount = 0
	slot0._airStrikeTimerList = {}
	slot0._spawnTimerList = {}
end

function ys.Battle.BattleSpawnWave.SetWaveData(slot0, slot1)
	uv0.super.SetWaveData(slot0, slot1)

	slot0._sapwnData = slot1.spawn or {}
	slot0._airStrike = slot1.airFighter or {}
	slot0._reinforce = slot1.reinforcement or {}
	slot0._reinforceCount = #slot0._reinforce
	slot0._spawnCount = #slot0._sapwnData
end

function ys.Battle.BattleSpawnWave.DoWave(slot0)
	uv0.super.DoWave(slot0)

	for slot4, slot5 in ipairs(slot0._airStrike) do
		if slot5.delay <= 0 then
			slot0:doAirStrike(slot5)
		else
			slot0:airStrikeTimer(slot5, slot5.delay)
		end
	end

	for slot5, slot6 in ipairs(slot0._sapwnData) do
		if slot6.bossData then
			slot1 = 0 + 1
		end
	end

	for slot6, slot7 in ipairs(slot0._sapwnData) do
		if math.random() <= (slot7.chance or 1) then
			if slot7.bossData and slot1 > 1 then
				slot7.bossData.bossCount = 0 + 1
			end

			if slot7.delay <= 0 then
				slot0:doSpawn(slot7)
			else
				slot0:spawnTimer(slot7, slot7.delay)
			end
		else
			slot0._spawnCount = slot0._spawnCount - 1
		end
	end

	if slot0._reinforce then
		slot0:doReinforce()
	end

	if slot0._spawnCount == 0 then
		slot0:doPass()
	end

	uv1.Battle.BattleState.GenerateVertifyData(1)

	slot3, slot4 = uv1.Battle.BattleState.Vertify()

	if not slot3 then
		uv1.Battle.BattleState.GetInstance():GetCommandByName(uv1.Battle.BattleSingleDungeonCommand.__name):SetVertifyFail(100 + slot4)
	end
end

function ys.Battle.BattleSpawnWave.AddMonster(slot0, slot1)
	if slot1:GetWaveIndex() ~= slot0._index then
		return
	end

	slot0._monsterList[slot1:GetUniqueID()] = slot1
end

function ys.Battle.BattleSpawnWave.RemoveMonster(slot0, slot1)
	slot0:onWaveUnitDie(slot1)
end

function ys.Battle.BattleSpawnWave.doSpawn(slot0, slot1)
	slot2 = uv0.Battle.BattleConst.UnitType.ENEMY_UNIT

	if slot1.bossData then
		slot2 = uv0.Battle.BattleConst.UnitType.BOSS_UNIT
	end

	slot0._spawnFunc(slot1, slot0._index, slot2)
end

function ys.Battle.BattleSpawnWave.spawnTimer(slot0, slot1, slot2)
	slot3 = nil
	slot0._spawnTimerList[pg.TimeMgr.GetInstance():AddBattleTimer("", 1, slot2, function ()
		uv0._spawnTimerList[uv1] = nil

		uv0:doSpawn(uv2)
		pg.TimeMgr.GetInstance():RemoveBattleTimer(uv1)
	end, true)] = true
end

function ys.Battle.BattleSpawnWave.doAirStrike(slot0, slot1)
	slot0._airFunc(slot1)
end

function ys.Battle.BattleSpawnWave.airStrikeTimer(slot0, slot1, slot2)
	slot3 = nil
	slot0._airStrikeTimerList[pg.TimeMgr.GetInstance():AddBattleTimer("", 1, slot2, function ()
		uv0._airStrikeTimerList[uv1] = nil

		uv0:doAirStrike(uv2)
		pg.TimeMgr.GetInstance():RemoveBattleTimer(uv1)
	end, true)] = true
end

function ys.Battle.BattleSpawnWave.doReinforce(slot0)
	slot0._reinforceKillCount = 0

	for slot4, slot5 in ipairs(slot0._reinforce) do
		slot5.reinforce = true

		if slot5.delay <= 0 then
			slot0:doSpawn(slot5)
		else
			slot0:spawnTimer(slot5, slot5.delay)
		end
	end
end

function ys.Battle.BattleSpawnWave.reinforceTimer(slot0, slot1)
	slot0:clearReinforceTimer()

	slot0._reinforceTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", 1, slot1, function ()
		uv0:doReinforce()
		uv0:clearReinforceTimer()
	end, true)
end

function ys.Battle.BattleSpawnWave.clearReinforceTimer(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._reinforceTimer)

	slot0._reinforceTimer = nil
end

function ys.Battle.BattleSpawnWave.onWaveUnitDie(slot0, slot1)
	if slot0._monsterList[slot1] == nil then
		return
	end

	slot3 = nil

	if slot2:IsReinforcement() then
		slot0._reinforceKillCount = slot0._reinforceKillCount + 1
		slot0._reinforceTotalKillCount = slot0._reinforceTotalKillCount + 1

		if slot0._reinforceCount ~= 0 and slot0._reinforceCount == slot0._reinforceKillCount then
			slot3 = true
		end
	end

	slot5 = 0

	for slot9, slot10 in pairs(slot0._monsterList) do
		if slot10:IsAlive() == false then
			if not slot10:IsReinforcement() then
				slot4 = 0 + 1
			end
		else
			slot5 = slot5 + 1

			if slot3 and slot10:GetReinforceCastTime() then
				if slot10.GetReinforceCastTime() == 0 then
					slot0:doReinforce()
				else
					slot0:reinforceTimer(slot11)
				end

				slot3 = false
			end
		end
	end

	if slot5 == 0 and slot0._spawnCount <= slot4 and slot0._reinforceCount <= slot0._reinforceTotalKillCount then
		slot0:doPass()
	end
end

function ys.Battle.BattleSpawnWave.doPass(slot0)
	slot0.clearTimerList(slot0._spawnTimerList)
	slot0:clearReinforceTimer()
	uv0.super.doPass(slot0)
end

function ys.Battle.BattleSpawnWave.clearTimerList(slot0)
	for slot4, slot5 in pairs(slot0) do
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot4)
	end
end

function ys.Battle.BattleSpawnWave.Dispose(slot0)
	slot0.clearTimerList(slot0._airStrikeTimerList)

	slot0._airStrikeTimerList = nil

	slot0.clearTimerList(slot0._spawnTimerList)

	slot0._spawnTimerList = nil

	slot0:clearReinforceTimer()
	uv0.super.Dispose(slot0)
end
