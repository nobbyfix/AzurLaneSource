ys = ys or {}
ys.Battle.BattleDelayWave = class("BattleDelayWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleDelayWave.__name = "BattleDelayWave"

function ys.Battle.BattleDelayWave.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleDelayWave.SetWaveData(slot0, slot1)
	uv0.super.SetWaveData(slot0, slot1)

	slot0._duration = slot0._param.timeout
end

function ys.Battle.BattleDelayWave.DoWave(slot0)
	uv0.super.DoWave(slot0)

	slot1 = nil
	slot1 = pg.TimeMgr.GetInstance():AddBattleTimer("delayWave", 1, slot0._duration, function ()
		uv0:doPass()
		pg.TimeMgr.GetInstance():RemoveBattleTimer(uv1)
	end, true)
end
