ys = ys or {}
slot1 = class("BattleAntiAirUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleAntiAirUnit = slot1
slot1.__name = "BattleAntiAirUnit"

function slot1.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function slot1.TriggerBuffOnFire(slot0)
	slot0._host:TriggerBuff(uv0.Battle.BattleConst.BuffEffectType.ON_ANTIAIR_FIRE, {})
end

function slot1.FilterTarget(slot0)
	slot2 = {
		slot9
	}

	for slot8, slot9 in pairs(slot1) do
		if slot9:GetIFF() ~= slot0._host:GetIFF() and slot9:IsVisitable() then
			slot4 = 1 + 1
		end
	end

	return slot2
end

function slot1.Spawn(slot0, slot1, slot2)
	slot3 = uv0.super.Spawn(slot0, slot1, slot2)

	slot3:SetDirectHitUnit(slot2)

	return slot3
end

function slot1.TriggerBuffWhenSpawn(slot0, slot1)
	slot0._host:TriggerBuff(uv0.Battle.BattleConst.BuffEffectType.ON_BULLET_CREATE, slot2)
	slot0._host:TriggerBuff(uv0.Battle.BattleConst.BuffEffectType.ON_ANTIAIR_BULLET_CREATE, {
		_bullet = slot1
	})
end
