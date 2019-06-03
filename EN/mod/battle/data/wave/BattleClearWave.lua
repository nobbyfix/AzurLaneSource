ys = ys or {}
ys.Battle.BattleClearWave = class("BattleClearWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleClearWave.__name = "BattleClearWave"

function ys.Battle.BattleClearWave.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleClearWave.DoWave(slot0)
	uv0.super.DoWave(slot0)

	slot1 = uv1.Battle.BattleState.GetInstance()
	slot2 = slot1:GetProxyByName(uv1.Battle.BattleDataProxy.__name)

	slot2:KillAllAircraft()
	slot2:KillSubmarineByIFF(uv1.Battle.BattleConfig.FOE_CODE)
	slot1:GetMediatorByName(uv1.Battle.BattleSceneMediator.__name).AllBulletNeutralize(slot3)
	slot0:doPass()
end
