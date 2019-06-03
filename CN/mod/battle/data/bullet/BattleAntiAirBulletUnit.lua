ys = ys or {}
ys.Battle.BattleAntiAirBulletUnit = class("BattleAntiAirBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleAntiAirBulletUnit.__name = "BattleAntiAirBulletUnit"

function ys.Battle.BattleAntiAirBulletUnit.Ctor(slot0, slot1, slot2)
	uv0.Battle.BattleAntiAirBulletUnit.super.Ctor(slot0, slot1, slot2)
end

function ys.Battle.BattleAntiAirBulletUnit.Update(slot0, slot1)
end

function ys.Battle.BattleAntiAirBulletUnit.IsOutRange(slot0)
	return false
end

function ys.Battle.BattleAntiAirBulletUnit.SetDirectHitUnit(slot0, slot1)
	slot0._directHitUnit = slot1
end

function ys.Battle.BattleAntiAirBulletUnit.GetDirectHitUnit(slot0)
	return slot0._directHitUnit
end

function ys.Battle.BattleAntiAirBulletUnit.Dispose(slot0)
	slot0._directHitUnit = nil

	uv0.super.Dispose(slot0)
end
