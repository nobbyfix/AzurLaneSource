ys = ys or {}
ys.Battle.BattleJammingWave = class("BattleJammingWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleJammingWave.__name = "BattleJammingWave"
ys.Battle.BattleJammingWave.JAMMING_ENGAGE = 1
ys.Battle.BattleJammingWave.JAMMING_DODGE = 2

function ys.Battle.BattleJammingWave.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleJammingWave.DoWave(slot0)
	uv0.super.DoWave(slot0)

	if uv1.Battle.BattleDataProxy:GetInstance().GetInitData(slot1).KizunaJamming and table.contains(slot3, uv0.JAMMING_ENGAGE) then
		slot1:KizunaJamming()
	end

	slot0:doFinish()
end
