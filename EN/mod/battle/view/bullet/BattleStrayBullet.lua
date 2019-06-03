ys = ys or {}
slot1 = ys.Battle.BattleResourceManager
ys.Battle.BattleStrayBullet = class("BattleStrayBullet", ys.Battle.BattleBullet)
ys.Battle.BattleStrayBullet.__name = "BattleStrayBullet"

function ys.Battle.BattleStrayBullet.Ctor(slot0, slot1, slot2)
	uv0.super.Ctor(slot0, slot1, slot2)
end

function ys.Battle.BattleStrayBullet.SetSpawn(slot0, slot1)
	uv0.super.SetSpawn(slot0, slot1)

	slot0._targetPos = Clone(slot0._bulletData:GetExplodePostion())
	slot0._spawnDir = slot0._speed.normalized
	slot0._velocity = slot0._bulletData:GetVelocity() * (1 + uv1.Battle.BattleAttr.GetCurrent(slot0._bulletData, "bulletSpeedRatio"))
	slot0._velocity = uv1.Battle.BattleFormulas.ConvertBulletSpeed(slot0._velocity)
	slot0._step = Vector3.Distance(slot0._targetPos, slot0._spawnPos) / slot0._velocity
	slot0._count = math.random(600) - 300
	slot0.updateSpeed = uv0._doStray
end

function ys.Battle.BattleStrayBullet._doStray(slot0)
	if slot0._step > 0 and slot0._targetPos and not slot0._targetPos:EqualZero() then
		slot0._count = slot0._count / 1.06
		slot0._step = slot0._step - 1
		slot0._speed = Vector3(slot0._targetPos.x - slot0._bulletData:GetPosition().x, 0, slot0._targetPos.z - slot0._bulletData.GetPosition().z).normalized
		slot0._speed = slot0._speed + Vector3(slot0._speed.z * slot0._count / 100, 0, -slot0._speed.x * slot0._count / 100)
		slot0._speed = slot0._speed.normalized
		slot0._speed = Vector3(slot0._speed.x * slot0._velocity, 0, slot0._speed.z * slot0._velocity)
	else
		slot0.updateSpeed = uv0._updateSpeed
	end
end
