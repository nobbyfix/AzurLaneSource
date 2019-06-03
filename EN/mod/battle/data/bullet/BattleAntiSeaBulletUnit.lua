ys = ys or {}
ys.Battle.BattleAntiSeaBulletUnit = class("BattleAntiSeaBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleAntiSeaBulletUnit.__name = "BattleAntiSeaBulletUnit"

function ys.Battle.BattleAntiSeaBulletUnit.Ctor(slot0, slot1, slot2)
	uv0.super.Ctor(slot0, slot1, slot2)
end

function ys.Battle.BattleAntiSeaBulletUnit.Update(slot0, slot1)
end

function ys.Battle.BattleAntiSeaBulletUnit.IsOutRange(slot0)
	return false
end

function ys.Battle.BattleAntiSeaBulletUnit.SetDirectHitUnit(slot0, slot1)
	slot0._directHitUnit = slot1
end

function ys.Battle.BattleAntiSeaBulletUnit.GetDirectHitUnit(slot0)
	return slot0._directHitUnit
end

function ys.Battle.BattleAntiSeaBulletUnit.Dispose(slot0)
	slot0._directHitUnit = nil

	uv0.super.Dispose(slot0)
end
